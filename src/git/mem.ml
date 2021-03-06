(*
 * Copyright (c) 2013-2017 Thomas Gazagnaire <thomas@gazagnaire.org>
 * and Romain Calascibetta <romain.calascibetta@gmail.com>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *)

open Lwt.Infix

module Log =
struct
  let src = Logs.Src.create "git.mem" ~doc:"logs git's memory back-end"
  include (val Logs.src_log src : Logs.LOG)
end

let err_not_found n k =
  let str = Printf.sprintf "Git.Mem.%s: %s not found" n k in
  Log.err (fun l -> l "Raising an invalid argument from %s" n);
  Lwt.fail (Invalid_argument str)

module Make
    (H : S.HASH)
    (L : S.LOCK)
    (I : S.INFLATE)
    (D : S.DEFLATE)
  : Minimal.S
    with module Hash = H
       and module Lock = L
       and module Inflate = I
       and module Deflate = D
= struct
  module Hash = H
  module Lock = L
  module Inflate = I
  module Deflate = D
  module Buffer = Cstruct_buffer

  module Value = Value.Raw(Hash)(Inflate)(Deflate)
  module Reference = Reference.Make(Hash)

  type kind = [ `Commit | `Tree | `Blob | `Tag ]

  type t =
    { root         : Fpath.t
    ; dotgit       : Fpath.t
    ; compression  : int
    ; values       : (Hash.t, Value.t Lazy.t) Hashtbl.t
    ; inflated     : (Hash.t, (kind * Cstruct.t)) Hashtbl.t
    ; refs         : (Reference.t, [ `H of Hash.t | `R of Reference.t ]) Hashtbl.t
    ; mutable head : Reference.head_contents option }

  type error = [ `Not_found ]

  let pp_error ppf = function
    | `Not_found -> Fmt.pf ppf "`Not_found"

  let root t = t.root
  let dotgit t = t.dotgit
  let compression t = t.compression

  let default_root = Fpath.v "root"

  let[@warning "-44"] create ?(root = default_root) ?(dotgit = Fpath.(default_root / ".git")) ?(compression = 6) () =
    if compression < 0 || compression > 9
    then failwith "level should be between 0 and 9";

    let t =
      { root
      ; compression
      ; dotgit
      ; values   = Hashtbl.create 1024
      ; inflated = Hashtbl.create 1024
      ; refs     = Hashtbl.create 8
      ; head     = None }
    in
    Lwt.return (Ok t : (t, error) result)

  let reset ?locks t =
    let lock = match locks with
      | Some locks -> Some (Lock.make locks Fpath.(t.root / "global"))
      | None -> None
    in

    Lock.with_lock lock @@ fun () ->
    Hashtbl.clear t.values;
    Hashtbl.clear t.inflated;
    Hashtbl.clear t.refs;
    Lwt.return (Ok ())

  let clear_caches ?locks:_ _ = Lwt.return ()

  let write t value =
    let hash = Value.digest value in
    let kind = match value with
      | Value.Commit _ -> `Commit
      | Value.Blob _ -> `Blob
      | Value.Tree _ -> `Tree
      | Value.Tag _ -> `Tag
    in

    if Hashtbl.mem t.values hash
    then Lwt.return (Ok (hash, 0))
    else match Value.to_raw value with
      | Error `Never -> assert false
      | Ok inflated ->
        Hashtbl.add t.values hash (lazy value);
        Hashtbl.add t.inflated hash (kind, (Cstruct.of_string inflated));
        Lwt.return (Ok (hash, String.length inflated) : ((Hash.t * int, error) result))

  let digest kind raw =
    let len = Cstruct.len raw in
    let ctx = Hash.Digest.init () in
    let hdr = Fmt.strf "%s %d\000%!"
        (match kind with
         | `Commit -> "commit"
         | `Blob -> "blob"
         | `Tree -> "tree"
         | `Tag -> "tag")
        len
    in
    Hash.Digest.feed ctx (Cstruct.of_string hdr);
    Hash.Digest.feed ctx raw;
    Hash.Digest.get ctx

  let write_inflated t ~kind inflated =
    let hash = digest kind inflated in

    if Hashtbl.mem t.values hash
    then Lwt.return hash
    else
      let value = lazy (match Value.of_raw ~kind inflated with Error (`Decoder err) -> raise (Failure err) | Ok value -> value) in
      Hashtbl.add t.inflated hash (kind, inflated);
      Hashtbl.add t.values hash value;
      Lwt.return hash

  let read_inflated t h =
    try
      let value = Lazy.force (Hashtbl.find t.values h) in
      let kind = match value with
        | Value.Commit _ -> `Commit
        | Value.Blob _ -> `Blob
        | Value.Tree _ -> `Tree
        | Value.Tag _ -> `Tag
      in

      match Value.to_raw_without_header value with
      | Ok raw -> Lwt.return (Some (kind, Cstruct.of_string raw))
      | Error `Never -> assert false
    with Not_found -> Lwt.return None

  let read t h =
    try Lwt.return (Ok (Lazy.force (Hashtbl.find t.values h)))
    with Not_found -> Lwt.return (Error `Not_found)

  let keys t =
    Hashtbl.fold (fun k _ l -> k :: l) t []

  let list t =
    Lwt.return (keys t.values)

  let mem t h = Lwt.return (Hashtbl.mem t.values h)

  let size t h =
    read t h >|= function
    | Ok (Value.Blob v) -> Ok (Value.Blob.F.length v)
    | Ok (Value.Commit _ | Value.Tag _ | Value.Tree _) | Error _ -> Error `Not_found

  let read_exn t h =
    read t h >>= function
    | Error _ -> err_not_found "read_exn" (Hash.to_hex h)
    | Ok v -> Lwt.return v

  let contents t =
    list t >>= fun hashes ->
    Lwt_list.map_s (fun h -> read_exn t h >|= fun value -> h, value) hashes >|= fun values ->
    (Ok values : ((Hash.t * Value.t) list, error) result)

  module T =
    Traverse_bfs.Make(struct
      module Hash = Hash
      module Value = Value

      type nonrec t = t
      type nonrec error = error

      let pp_error = pp_error
      let read = read
    end)

  let fold = T.fold

  module Pack =
  struct
    type stream = unit -> Cstruct.t option Lwt.t

    module PACKDecoder = Unpack.MakePACKDecoder(Hash)(Inflate)
    module PACKEncoder = Pack.MakePACKEncoder(Hash)(Deflate)
    module Revidx = Map.Make(Int64)

    type error =
      [ `Unresolved_object
      | `DecoderFlow of string
      | `Delta of PACKEncoder.Delta.error
      | `PackDecoder of PACKDecoder.error ]

    let pp_error ppf = function
      | `Unresolved_object -> Fmt.pf ppf "`Unresolved_object"
      | `DecoderFlow s -> Fmt.pf ppf "(`PackFlow %s)" s
      | `Delta e -> Fmt.pf ppf "(`Delta %a)" PACKEncoder.Delta.pp_error e
      | `PackDecoder e -> Fmt.pf ppf "(`PackDecoder %a)" PACKDecoder.pp_error e

    module GC =
      Gc.Make(struct
        module Hash = Hash
        module Value = Value
        module Deflate = Deflate
        module PACKEncoder = PACKEncoder

        type nonrec t = t
        type nonrec error = error
        type nonrec kind = kind

        let pp_error = pp_error
        let read_inflated = read_inflated
        let contents _ = assert false
      end)

    module Graph = GC.Graph

    let make = GC.make_stream

    let option_map f v = match v with Some v -> Some (f v) | None -> None
    let option_map_default f d v = match v with Some v -> f v | None -> d
    let option_default v = function Some v -> v | None -> v

    type optimized_hunk =
      | Insert of (int * int)
      | Copy of (int * int)

    let pp_optimized_hunk ppf = function
      | Insert (off, len) ->
        Fmt.pf ppf "(Insert { @[<hov>length = %d;@ \
                    offset = %d;@] })"
          len off
      | Copy (off, len) ->
        Fmt.pf ppf "(Copy { @[<hov>length = %d;@ \
                    offset = %d;@] })"
          len off

    let from git stream =
      let cstruct_copy cs =
        let ln = Cstruct.len cs in
        let rs = Cstruct.create ln in

        Cstruct.blit cs 0 rs 0 ln;
        rs
      in

      let apply hunks_descr hunks buffer_hunks source target =
        if Cstruct.len target < hunks_descr.PACKDecoder.H.target_length
        then raise (Invalid_argument "apply");

        let target_length =
          List.fold_left
            (fun acc -> function
               | Insert (off, len) ->
                 Cstruct.blit buffer_hunks off target acc len; acc + len
               | Copy (off, len) ->
                 Cstruct.blit source off target acc len; acc + len)
            0 hunks
        in

        if target_length = hunks_descr.PACKDecoder.H.target_length
        then Ok (Cstruct.sub target 0 target_length)
        else Error (Fmt.strf "Bad undelta-ification (result: %d, expect: %d)" target_length hunks_descr.PACKDecoder.H.target_length)
      in

      let k2k = function
        | PACKDecoder.Commit -> `Commit
        | PACKDecoder.Tag -> `Tag
        | PACKDecoder.Tree -> `Tree
        | PACKDecoder.Blob -> `Blob
        | PACKDecoder.Hunk _ -> raise (Invalid_argument "k2k")
      in

      let empty        = Cstruct.create 0 in
      let buffer       = Buffer.create 0x800 in
      let buffer_hunks = Buffer.create 0x800 in
      let queue        = Queue.create () in

      let rec go ~revidx ?(src = empty) ?hunks state =
        match PACKDecoder.eval src state with
        | `Await state ->
          (stream () >>= function
            | Some raw ->
              go ~revidx ~src:raw ?hunks (PACKDecoder.refill 0 (Cstruct.len raw) state)
            | None ->
              Lwt.return (Error (`DecoderFlow "Unexpected end of stream")))
        | `End (state, hash_pack) ->
          Lwt.return (Ok (hash_pack, PACKDecoder.many state))
        | `Error (_, err) ->
          Log.err (fun l -> l ~header:"populate" "The PACK decoder returns an error: %a." PACKDecoder.pp_error err);
          Lwt.return (Error (`PackDecoder err))
        | `Flush state ->
          let o, n = PACKDecoder.output state in

          Buffer.add buffer (Cstruct.sub o 0 n);
          go ~revidx ~src (PACKDecoder.flush 0 (Cstruct.len o) state)
        | `Hunk (state, hunk) ->
          let hunks = match hunks, hunk with
            | Some hunks, PACKDecoder.H.Insert raw ->
              let off = Buffer.has buffer_hunks in
              Buffer.add buffer_hunks raw;

              (Insert (off, Cstruct.len raw) :: hunks)
            | Some hunks, PACKDecoder.H.Copy (off, len) ->
              (Copy (off, len) :: hunks)
            | None, PACKDecoder.H.Insert raw ->
              let off = Buffer.has buffer_hunks in
              Buffer.add buffer_hunks raw;

              [ Insert (off, Cstruct.len raw) ]
            | None, PACKDecoder.H.Copy (off, len) ->
              [ Copy (off, len) ]
          in

          go ~revidx ~src ~hunks (PACKDecoder.continue state)
        | `Object state ->
          (match PACKDecoder.kind state with
           | (PACKDecoder.Commit
             | PACKDecoder.Tag
             | PACKDecoder.Tree
             | PACKDecoder.Blob) as kind ->

             let raw = Buffer.contents buffer |> Cstruct.of_string in
             Buffer.clear buffer;

             Log.debug (fun l -> l ~header:"populate" "Retrieve a new Git object (length: %d)." (Cstruct.len raw));

             write_inflated git ~kind:(k2k kind) raw >|= fun hash ->
             Log.debug (fun l -> l ~header:"populate" "Add the object %a to the Git repository from the PACK file."
                           Hash.pp hash);
             Some hash
           | PACKDecoder.Hunk hunks_descr ->
             let hunks = option_map List.rev hunks |> option_default [] in
             let inflated = Cstruct.create (hunks_descr.PACKDecoder.H.target_length) in
             let hash_source = match hunks_descr.PACKDecoder.H.reference with
               | PACKDecoder.H.Hash hash -> hash
               | PACKDecoder.H.Offset off ->
                 let off = Int64.sub (PACKDecoder.offset state) off in
                 Revidx.find off revidx

             (* XXX(dinosaure): This is come from an assumption about
                the PACK file. Any hunk object has source as an external
                Git object of the PACK file or a previous Git object.

                So [Revidx.find] should never fail. *)
             in

             Log.debug (fun l -> l ~header:"populate" "Catch a Hunk object which has as source the Git object: %a."
                           Hash.pp hash_source);

             read_inflated git hash_source >>= function
             | None ->
               Log.warn (fun l -> l ~header:"populate" "The source Git object %a does not exist yet." Hash.pp hash_source);
               Queue.push (hunks_descr, hunks, cstruct_copy (Buffer.unsafe_contents buffer_hunks), inflated, hash_source) queue;
               Buffer.clear buffer_hunks;

               Lwt.return None
             | Some (kind, raw) ->
               Log.debug (fun l -> l ~header:"populate" "Retrieving the source Git object %a." Hash.pp hash_source);

               match apply hunks_descr hunks (Buffer.unsafe_contents buffer_hunks) raw inflated with
               | Ok result ->
                 Buffer.clear buffer_hunks;
                 write_inflated git ~kind result >|= fun hash ->
                 Log.debug (fun l -> l ~header:"populate" "Add the object %a to the Git repository from the PACK file."
                               Hash.pp hash);
                 Some hash
               | Error err ->
                 Log.err (fun l -> l ~header:"populate" "Error when we apply the source Git object %a with the Hunk object: %a."
                             Hash.pp hash_source
                             (Fmt.hvbox (Fmt.list ~sep:(Fmt.const Fmt.string ";@ ") pp_optimized_hunk)) hunks);
                 Lwt.fail (Failure err))
          >>= fun hash ->
          let revidx = option_map_default (fun hash -> Revidx.add (PACKDecoder.offset state) hash revidx) revidx hash in
          go ~revidx ~src (PACKDecoder.next_object state)
      in

      let rec gogo () = match Queue.pop queue with
        | exception Queue.Empty -> Lwt.return (Ok ())
        | (hunks_descr, hunks, buffer_hunks, inflated, hash_source) ->
          read_inflated git hash_source >>= function
          | None ->
            Queue.push (hunks_descr, hunks, buffer_hunks, inflated, hash_source) queue;
            gogo ()
          | Some (kind, raw) ->
            match apply hunks_descr hunks buffer_hunks raw inflated with
            | Ok result -> write_inflated git ~kind result >>= fun _ -> gogo ()
            | Error err -> Lwt.fail (Failure err)
      in

      let ztmp = Cstruct.create 0x800 in
      let window = PACKDecoder.Inflate.window () in

      go ~revidx:Revidx.empty (PACKDecoder.default ztmp window)
      >>= function
      | Error _ as err -> Lwt.return err
      | Ok (hash_pack, n) ->
        let n = Int32.to_int n in

        Queue.fold (fun acc x -> x :: acc) [] queue
        |> Lwt_list.fold_left_s (fun acc (_, _, _, _, hash) ->
            mem git hash >|= function
          | true -> acc + 1
          | false -> acc) 0
        >>= function
        | 0 ->
          if Queue.is_empty queue
          then Lwt.return (Ok (hash_pack, n))
          else Lwt.return (Error `Unresolved_object)
        | _ ->
          let open Lwt_result in

          Log.debug (fun l -> l ~header:"populate" "Resolving the rest of the PACK file.");
          gogo () >>= fun () -> Lwt.return (Ok (hash_pack, n))
  end

  module Ref =
  struct
    type error = [ `Not_found ]

    let pp_error ppf = function
      | `Not_found -> Fmt.pf ppf "`Not_found"

    module Graph = Reference.Map

    let list ?locks t =
      let lock = match locks with
        | Some locks -> Some (Lock.make locks Fpath.(t.root / "global"))
        | None -> None
      in

      Lock.with_lock lock @@ fun () ->
      let graph, rest =
        Hashtbl.fold
          (fun k -> function
             | `R ptr -> fun (a, r) -> a, (k, ptr) :: r
             | `H hash -> fun (a, r) -> Graph.add k hash a, r)
          t.refs (Graph.empty, [])
      in

      let graph =
        List.fold_left (fun a (k, ptr) ->
            try let v = Graph.find ptr a in
              Graph.add k v a
            with Not_found -> a)
          graph rest
      in

      Graph.fold (fun k v a -> (k, v) :: a) graph []
      |> Lwt.return

    let mem t r =
      try let _ = Hashtbl.find t.refs r in Lwt.return true
      with Not_found -> Lwt.return false

    let rec read ?locks:_ t r =
      try match Hashtbl.find t.refs r with
        | `H s -> Lwt.return (Ok (r, Reference.Hash s))
        | `R r -> read t r
      with Not_found -> Lwt.return (Error `Not_found)

    let remove t ?locks:_ r =
      Hashtbl.remove t.refs r;
      Lwt.return (Ok ())

    let write t ?locks r value =
      let head_contents = match value with
        | Reference.Hash hash -> `H hash
        | Reference.Ref refname -> `R refname
      in

      let lock = match locks with
        | Some locks -> Some (Lock.make locks Fpath.(t.root / "global"))
        | None -> None
      in

      Lock.with_lock lock
      @@ (fun () ->
          Hashtbl.replace t.refs r head_contents; Lwt.return (Ok ()))

    let test_and_set t ?locks:_ r ~test ~set =
      (* XXX(dinosaure): not sure about the semantic. *)
      let v =
        try Some (Hashtbl.find t.refs r)
            |> function Some (`R refname) -> Some (Reference.Ref refname)
                      | Some (`H hash) -> Some (Reference.Hash hash)
                      | None -> None
        with Not_found -> None in
      let replace () = match set with
        | None   -> Hashtbl.remove t.refs r
        | Some (Reference.Hash hash) -> Hashtbl.replace t.refs r (`H hash)
        | Some (Reference.Ref refname) -> Hashtbl.replace t.refs r (`R refname)
      in
      match v, test with
      | None, None -> replace (); Lwt.return (Ok true)
      | Some (Reference.Hash x), Some (Reference.Hash y) when Hash.equal x y -> replace (); Lwt.return (Ok true)
      | Some (Reference.Ref _ | Reference.Hash _),
        Some (Reference.Ref _ | Reference.Hash _)
      | Some (Reference.Ref _ | Reference.Hash _), None
      | None, Some (Reference.Ref _ | Reference.Hash _) -> Lwt.return (Ok false)
  end

end
