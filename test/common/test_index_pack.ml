module Value (H : Git.HASH) = struct
  module Hash = H

  let hashes =
    [ "3ae8d4d9cdf28d0cd6b453da991fb661ce05de08"
    ; "b3a2882ea6c64c17763b7e0682cca16ed5370621"
    ; "ede00ee87b7764783e4449cb2404b32bb4af6bd4"
    ; "28a5a1bbbe95e02bdaa4542993d5a93d73ff8da5"
    ; "4ee53344e6faafd2e5e3b86ec762f180db4a2c3b"
    ; "fe88134bf478438e4eb6e2c62c2743eab78ee4e2"
    ; "affbda45501199cd1c2e1e90eefec2aa43960e6f"
    ; "f2ee0efb9af4410a1b5677c221a5e49bd1343151"
    ; "c95c95dab75e98353b63ccdd6478fdaa03569b3d"
    ; "cb8f833acefac0794c2611031a1830558d47266b"
    ; "8b947b1a6315ee4d3980f1b61842f1538390247b"
    ; "b36565f300e1884c36f8f90eeec1bada139f5e70"
    ; "88d4fe1cdb2c9a494eff34632f2186003942bfbe"
    ; "4b01e27cd1fd4b9390c9a8dccb8fa415c72770f5"
    ; "62b998f9c580177ba3797d4bcf6ddcd0de46a220"
    ; "076aa1656f3f2aa70826ac57ff3a0148f0aa21e8"
    ; "91e2190e18bfc576e7e42ff0c840538534b1204c"
    ; "19a4f38e2e5818718c4ab06c4ba54977ac586b84"
    ; "eb2ae6e5303faf27609bdd39268dc5dfa596c7e3"
    ; "0dc1ed55d36f6c7f230bb6d76fe6dbc26f2d444a"
    ; "4b1a31e8b570e441e92fd8638fd122a4a06bbf65"
    ; "0862c2d2be95ccdbd7301f7b020e90981182ecf4"
    ; "d1c96b47070ddcace7f894192a29887dc878c16d"
    ; "bd851c483fdccbe6e06768f5770e78db9e6a88de"
    ; "a138a5eaa43cd85740d1781e8bfefcf544c978b7"
    ; "726e053b15133c5721795ecacf6be9ad616d1ec5"
    ; "1eec55f79746bc271db9f7b0525dc9de568a6f9f"
    ; "8ab1f28ad71c60d878764f3bd43a61e7b3b9aec6"
    ; "381efb0df07110ad3a1b81a33d698c98d9fa18f3"
    ; "6e06781434b594e02ccf4f8c120a502966bf636a"
    ; "1db791b860dc4bf95cc263978f5f79f170928fd2"
    ; "f58cacf6df6c987a01b43b587f19d2c8eb8394a8"
    ; "94cea9c1d873422e9b0807a1c9a29f98a4b4459c"
    ; "e9a1cfe6328bb2d789e8b8df6b5248a652b37c6e"
    ; "76738b611e51f05866529bd52168c773d0bfadbb"
    ; "0fc4de68e9ac244bb38c3d43b09fcc4f769ed0b3"
    ; "a9c4ccffa9e08a8e410d5270ef46a5fbea47be4b"
    ; "9349b933298f6b80d5abc002c989ac8f87f43801"
    ; "685c36108358768668a9918c7124c29653578eac"
    ; "a7871fb865d9c41f26011d6fd06c531538c2379e"
    ; "103eb5d989349c8e7e0147920b2e218caba9daf9"
    ; "f1a51edf47f94f45ce916f7800924e6f135800e2"
    ; "e0db48c90e89c466935336d35324679efb4f1309"
    ; "e71743fcc3868ad4be9abf37278e9f609ede6903"
    ; "380e862a9768c76a2c91a325e218ff93ea055074"
    ; "d19efae2451a06f3db488a4104ad158081fcd3d2"
    ; "bdfbf3a5e15d32c693553a607a6c134c878d9b28"
    ; "94c30ca0c6c371b6681ebe578bd039fca93352ff"
    ; "a230a13f380d217622a1ac0849ee7017fb42fda8"
    ; "af3f4412f36d4cbcfd4d62ea6996b0ddde0c5cc5"
    ; "a23df1d2e8ee745938e0d99b5db8c36472dbcd72"
    ; "56b331efed81e2fdede5bc24498f827e7470fa57"
    ; "95a03243a0ce90c70a4a0b1168231862e4fccc86"
    ; "05d9b1a0ab7e66a873392f15c9c9f31ef6cf83c1"
    ; "8b7c8c246b2da9de0aee7d338c316e23cd661fc2"
    ; "9698a5d7724fd1169b73f179700ffc432913cd3f"
    ; "4f11200c8f139455f54d1a61a6f8270e2a054fe6"
    ; "79023127eb3e206fb80a0106d4b322dafadce25a"
    ; "7fa661bbc082f78382256d1db881968d39f97c65"
    ; "46217bebf1570a4ada4675e8a1f787f43a66bb65"
    ; "59a11f0f47df8e91d65433bdec34b7081f20ba1e"
    ; "94e66fa881dd0e3862e5e8804189f41791d5d804"
    ; "77ed8331339af9ed63623cfb72b4c38d29a3a08f"
    ; "19f489e18f84cca13f449654954c8aca8e8cdea4"
    ; "25dfbc5a389d3c986a36e717cd5e919875c5e67d"
    ; "9ecd120c0101aaa76800fbce0bc1b3b0d3187532"
    ; "c878259d021668b34f76bd9e70ed158f7c204761"
    ; "8dbb5052bed33393d1749b7b275907f261eb39cf"
    ; "061b8216a06f68bea3037c9540d269f6e7ea2227"
    ; "5d1daf606df50035fc3e69a3b9eb934f6421de8b"
    ; "56bc6afa4133f742ed80d6a0ba7f5560d998d5a4"
    ; "9f0e9078705019a37b849d9e1b29b6dddf393aa5"
    ; "f8b164edaf73da22275a79c4374c18e89fc9e887"
    ; "768075146742d85b5ba8e085c999a3973ca1f961"
    ; "24467baa32565106596354e8780bc4ef3cc07720"
    ; "d9d29222b2b46f818af24242b892a1c3a3f58e5e"
    ; "5e94f57af09851b6833dd9a54dcfd99146c18bb2"
    ; "73dda9822bb4d393d2cb8860d4544c6286ba8fed"
    ; "692143795c60ff65dfe2cb82ba4ee67bc33e2b02"
    ; "10045edf1f344d08654da3655543f63e6addec57"
    ; "001abbbe2c837611841c7ce5dbc7ea47132214d6"
    ; "96c90b0ee70a521cb5b8685314e5e84b7c5e9556"
    ; "faedbd1f4c4421f28f1fa9154d95faae98129013"
    ; "09528caa5357678d371a450e2727202528eb39eb"
    ; "9ef25d183e5ee07b55a378cc9a0d4d1bf5ea9d20"
    ; "32151f521b843b177861f702200666c7e49ed3d8"
    ; "e4ba251fe012f24cd49ba811bb6124bbc4236707"
    ; "fddfadb4b713fe23288f7c22a3b2ac896ef227c9"
    ; "c79eea7a81050e4fbde8cad51de1ece63c8b7801"
    ; "238a536611be775a9f429d9c36b64f844cdf2510"
    ; "45ad7bd81a89428965b6a7e68b69418a66e28c8c"
    ; "284ceeba949fbe5b6f7dbd9363aeb92e98efaa53"
    ; "be8ff47677d6204cba98380cf6696bdcf20a121c"
    ; "83be98d58009631624fab7dca6232c480a798d6d"
    ; "39ed499b05e77f2e349db5923cc23eeac09b547d"
    ; "f8873e7ede65b33b9223258d6356c4eced50d1a1"
    ; "d340980c4b6b1473a5567b785af6fce82361fd1d"
    ; "8b1524d02c3e23db4b4679b7c2e1021af3012b8e"
    ; "71b145d4b9dc8f3c606fcb3e77e885093c4e8e4d"
    ; "52ad49df92d3e50ddef80af68587ba0f7a0f82af"
    ; "a69554c2afd5eb89de9b5cfafbe6b363b97acaae"
    ; "de143c57357577c951c40712a37e1bba474710f1"
    ; "16ee03498fa3d10f4e70e1a2c41868aa9bae263a"
    ; "ebf860f113705d4561b290e0a237495b9039c1b0"
    ; "69318e7c840ec842aba55f609d5658004fe2895b"
    ; "2049df7c45b828a87f42dd067a96ad195eab00cf"
    ; "483a634d3adb5c4e12c3f72a22acf10a8e7ded93"
    ; "968d7cef8d4aa44a6bae3000816c7a53a6814f64"
    ; "8319c5c167fb845dc1065cfc8c84a6b1da9986af"
    ; "8604374923d36811d0addfb7cb820b132bbc967a"
    ; "38ca4a7a77ad92e867aa979a63d99d80b19f41e9"
    ; "9f70e7a9d62b64a7d222993581010e05a7de93c8"
    ; "ddbcb78dbcadf938fbb170cc34765c29309a0c62"
    ; "64621d64af3c6504e44efe04b6f2c09747b23aa4"
    ; "3b9577762b5e80d3b59ebc2a4ccf1664e1cbded7"
    ; "da3d22846f6af47ef12f8962ded8d8f01b7e67ec"
    ; "5b46b08f5799677a956a54245890a84fb6378e39"
    ; "72cfaca0dc72e84b675a55e7b969a18fbb7b0f3f"
    ; "66b9f4e718edec5df15eea1692a019c5e0999540"
    ; "a91b084853759eba48f0f30df39faabac7057d6c"
    ; "8eb89ddedbad0bbb4325fdf7c3ae02b95baae85d"
    ; "0f98116ad13dc70c28fab5628e45c8729fd6ecfb"
    ; "a8fe5726184116a788fc835cfc892a3a8436a36b"
    ; "7b494ab2eff01f21e73b9452c57def3acf72769c"
    ; "fb4044e8edc210debd8961c92d27e128fc653d91"
    ; "ff98a729abdbec32af47fcbf926a0b6e5378bd32"
    ; "2c10aa63aa25d3a315c6c049a646d62a14d88349"
    ; "35624ff9e31790b2aaabd83acd673fb81ff62244"
    ; "1f894f1407c8876e73937e617a6034af4b0ccd3f"
    ; "da6e1064d927b4254c563acde5fab80496a7313d"
    ; "9f1dbac05650d6cc7c8fe181f27912a94bd945ff"
    ; "4fda4db01a1d342a7373307afe09b4dfee169ece"
    ; "b1821dcc737a542be8e7c502ba1f8fb613a73b6c"
    ; "a6074d8d193f8e25003caa44a1e9c2d0377c8f02"
    ; "1ade56b31fdbd18c27dba3e0667636b3d921542e"
    ; "86615514c436c54eae8b42e0ecab3c9d3e4ddfe1"
    ; "73cb994fabcd935af44454b4de4288bcb698c15d"
    ; "6140c3902991da2e0ee798a888c8ca5942be7202"
    ; "1d764f68aae7241144d36a6a7123ec46cd1f8d6f"
    ; "05942a43527c54b0ea0ddbf02d0238721511cc46"
    ; "7822d47fa72c2cf0552ee4b6f746b03b50d28738"
    ; "6e01a75df8389039349134387fe2f124a4c30f45"
    ; "cdad026030253074f15720454fcf3843ea8e6acb"
    ; "95cf63c989921db6098dcde74e477015d69194a6"
    ; "78e1ac1758441a1485e78ec44b4cec764dd2b0a6"
    ; "f67f9ba95c0de32b42009d86938be97557e318be"
    ; "3f2969e6513d2662e9256721b3dff9b5f058bcb8"
    ; "1094617dd31284d167a2217db4dd8bc01f29666b"
    ; "b0e3b3f2ac5ce6fb9702f7297c835675f11e663c"
    ; "ca5568856bec8c82304e61501cce54b84280be4c"
    ; "2b18d812ce9fe467e35de7b736736d1da8e31c34"
    ; "2d511cc4cf3776fe0a19f495ad75c98154a19ffd"
    ; "2a7d3823ce1588a9d693a68e7c4f5bb6ddbc3a5e"
    ; "4920510e75f066da7ebb36ada85abda8e261325a"
    ; "20c2ad34fe1057baafabce0331dc6763a0857151"
    ; "4881b6fc24764d1b342f806fffe4708e5d2285a6"
    ; "29a07a16d6b01458caf7f15b52844ae0e6ae533d"
    ; "db5a9d3da3ae5abbf641f20e0a98b41fddf41e2d"
    ; "4e924da513807eebcfa98ec8767f8f8bcd0d75b2"
    ; "56c6cedd17313d9a9a632dad80c2e27dbecc6010"
    ; "397b540246ef70457bcf241a4747be0a1fe48931"
    ; "291d828de1dec686f9046794dc3ec69520a38112"
    ; "67ca9955f36f662912f63c5c737025d7d11f3f58"
    ; "01b936e5a3598fbff37914d6a96a0a013a9864df"
    ; "c6fa73aeca9d8c390ae45b1feec0db28a2dd6252"
    ; "5b210d538cd03b9e31ec929b845aac561725d72a"
    ; "55c804e5c9c59cf82890ad3830d098939a4a5a4c"
    ; "03c3fd2b338987b1a22de513fd7dd0bac3066546"
    ; "80f063082a5c16db504b9ea3d7bb8360e01f860b"
    ; "8e91b565eabd1e5db4935afdaf790d970fac6540"
    ; "e37c451dba74ffadad0a0cd53338654bd274249e"
    ; "ca2747776997af069465e7f8194987135bdbf7e5"
    ; "071ab0bdae290f0c8a20684844ae41b31af50a61"
    ; "4053ebc97734f8826c7538e18e7fd99f5f49d9d4"
    ; "e7e7b892dc1a1dd109acc1f58ac5be0073ca8cf9"
    ; "7a611f7b2f3382981d0fcba01a1c1845e06dc6d6"
    ; "6d36cf25fd248ba9ecc5e8057673c64b83f21174"
    ; "e0fe8af3c55411ed73982e6badd659c3442ace2f"
    ; "aa20590e9ae350ead4e48483d4b1c2980973821d"
    ; "d6f0ce2d9e0dd78ffe47abf118259342bf28d6f4"
    ; "44dba4e8f2b8b191d6cce0c22a6f71d3e11a7f34"
    ; "169846c33de720f1e7f228a020e8312318560c40"
    ; "ff9db792a8b9f494cba8e104ee1a99e4c1e1cff0"
    ; "e1f1759122f3f2aa37ac135ad08e64e708d4b7ea"
    ; "8b3db580a46060cf0bc3d4fbffdf6cd818c4d909"
    ; "78684c2162c04419652d9617aefcb06f6eeeafdd"
    ; "f8dfc5268845a904e5aa50dd58414e874cb7c270"
    ; "ac41710195f4a2b23b30ee63dcdb47684956d578"
    ; "ed7e1913c5d50a66c93bca4a81d8240215dabe2e"
    ; "087d67ce9072252b9131bd19e2651a7761b0378b"
    ; "4833e41cb791b97012f77e889991e067cea40096"
    ; "6dfb08d201d2bbf1013568362e85ecba3e544968"
    ; "7668bc2f328e6c9cd1b19ba87116c6c69c3abd81"
    ; "090d22a52197b9ca5511c0aa3a3936c79ffee478"
    ; "be21c80a9fcd74bcc36e943ffec46d9a643ed365"
    ; "681fee3e2d27e01c87b586323b1e7f4592d5bcca"
    ; "becc746f3b55ee82f8973daf10820d2c89fc0ecf"
    ; "cefd5b58b7bb64b7f6cd3174f85d62da15f8771d"
    ; "d1119966c2ffb68b069b0aec06fba396ae1829db"
    ; "5f3e0bcdb5d5b7a3a689ffcb374d20b66d7bb23c"
    ; "178e873afa85b0e716f8b7b5c02d5b74b9e02887"
    ; "9ae73ed49c71c735e07561db73a71e0d6ec94a43"
    ; "3b2a2e98ce20d502c7c3ebd59bee1f1d700203c8"
    ; "63280a2534d066f8728569a390ea4971a608a440"
    ; "a20f86f171adcf5a00e8f0c972c5a235466046f7"
    ; "5322407c4d711c8a5ea5af5426dc9b158fd719bf"
    ; "2f68d2f4d77932b09abf3104048e108c59305cb0"
    ; "99b52d6f1658aea4f5a55814a9ec5298249e7bf2"
    ; "8ae9f85fdf84a7d7ca1a1d6bdb686d3e19d97212"
    ; "b893d2ad32fcd2ee5e3720fc446b9b9e0b416ddc"
    ; "326051c3846bb8540470594adbf3944539577af9"
    ; "828ca26971a1c443e36a1ef9bd5e5abed11d04c0"
    ; "5689a00bff7b00ff11242ea7d9cf46bee12693c6"
    ; "2f4fe6aa3194ee116080922560c0507012baa618"
    ; "076a1ff554603fd91e686f616162cbaee865684e"
    ; "cb17b67646cd477ba88f38d5cdaefc017dc7d2ca"
    ; "158dafb77b62f0462b4ce6f475b46fa78114d33f"
    ; "d73c78f8834932f4920c484ec24ceba5327e6b66"
    ; "5c12f8735f57c1f69773bc3b6460dfab708f45d1"
    ; "05f48baa80223deb90015c5c06aa201e5658c718"
    ; "ff6b544f42b03c103c0661082db1511e9aba9075"
    ; "aee5b9f847f0b7ed4c1ac623fccd5726da7fd165"
    ; "d50366a8dc019ea038a39b92ed08db9a68e4aca4"
    ; "62f27882ca56d40eb067934d9fa04bc39b496ac2"
    ; "5b5b83da5ffb8f083b6a468efee78ce229d1a6ee"
    ; "b43fe5fb62f8debad71595e71d15290bc7987cc3"
    ; "ba2f0c9241b38707371b93775c3f4353e71e7918"
    ; "c1096a97c5cd7f314aa7d4c2fe8077eb1a9cc8f7"
    ; "e1ce98d25fbf5f32497dd595578a25001216a304"
    ; "dc30e980a5e58f13e5bc323f1f4f6fb94771dacc"
    ; "d90650afbfc045958a61007c8c07545ac0b6b8a9"
    ; "c16783c5d1c392473a71b98fd9895ee65daee4d1"
    ; "e0c412729e889d260d18c01e6ba91c8cd07cd5ed"
    ; "e3ef950bc8c05127f19c8b5b9563438f374ea10f"
    ; "0dfcf123adf7d849a241c5ee81012650f8df9be9"
    ; "bd00feeded17621b4793deab813a2f2799417159"
    ; "b0e1c5fe988f905b3987f7fd9a9f721977c0b059"
    ; "7ebdc5155641f3eb19cde3536f8e4736d2a0f816"
    ; "8be4a600de7e4dbcd9de9928822d33944e46e19a"
    ; "a34640edeac4a013e19c22bf203842d04c4d895c"
    ; "f89a3eb0528fed3d153746409d01af2da6c1ad5d"
    ; "b523a5fa65ca78b456def8cf84af9ffe499c1d13"
    ; "7cf60b55ecb2c38ab16f34891ce4bdf9d6ce8a2e"
    ; "3b5a4f38cbc7cb70a828f2acec559bbd75513834"
    ; "9bd832ad64ea7d76d33b86c04aa19e9b7f2a030f"
    ; "e434a8ad35f18620e272ce69d84ca41f02ea0eeb"
    ; "98619776c052859f7c49ffdbae4fea797ad23dc6"
    ; "f8f341ac14c46b0926777a03e8b8492df8d9d41f"
    ; "7f7d87276d24bb1d44490baeb6c3b7666cf3c672"
    ; "066e21575507ed0cd1d7ef94db1e92f3abce0e7e"
    ; "1343458933f2affaa77a63e3fbbbf7fffe973696"
    ; "649c8f729c5f74c89d1618b933f0037c23278273"
    ; "1173b0ddfbaabee1d3c36355196fe69a6323fad6"
    ; "7ddfe4eb2983cc00d5c39aaa5d0b0fe1b7c806df"
    ; "d1561299c1f47bae7b828acf038299049502ee64"
    ; "f45aa3f5b0777b1237193439b6a30b9e01cf16fe"
    ; "e58f19f3dff63612c97386ad6ec3f7feaf71afcc"
    ; "85a7e9576340fef02fbb6f9626b29b33bf8dc18f" ]
    |> List.map Hash.of_hex

  let offsets =
    [ 12L
    ; 200L
    ; 460L
    ; 642L
    ; 814L
    ; 990L
    ; 1656L
    ; 1825L
    ; 1998L
    ; 2171L
    ; 2388L
    ; 2563L
    ; 2751L
    ; 2955L
    ; 3118L
    ; 3393L
    ; 3571L
    ; 3735L
    ; 3942L
    ; 4196L
    ; 4379L
    ; 4553L
    ; 4742L
    ; 4901L
    ; 5161L
    ; 5323L
    ; 5496L
    ; 5667L
    ; 5828L
    ; 5958L
    ; 6227L
    ; 6296L
    ; 6313L
    ; 6628L
    ; 6744L
    ; 6954L
    ; 7024L
    ; 7296L
    ; 7332L
    ; 7480L
    ; 9367L
    ; 16712L
    ; 24160L
    ; 30133L
    ; 30188L
    ; 30325L
    ; 30365L
    ; 32665L
    ; 32759L
    ; 33861L
    ; 33942L
    ; 34299L
    ; 40298L
    ; 41117L
    ; 42237L
    ; 42607L
    ; 43532L
    ; 43769L
    ; 44965L
    ; 45068L
    ; 46949L
    ; 47127L
    ; 51857L
    ; 52175L
    ; 54098L
    ; 54176L
    ; 54299L
    ; 57118L
    ; 57329L
    ; 58354L
    ; 58410L
    ; 59767L
    ; 59862L
    ; 59961L
    ; 60042L
    ; 60333L
    ; 60388L
    ; 63055L
    ; 63276L
    ; 64866L
    ; 64914L
    ; 68338L
    ; 68583L
    ; 68606L
    ; 68845L
    ; 68863L
    ; 70030L
    ; 70078L
    ; 70922L
    ; 70999L
    ; 72293L
    ; 72446L
    ; 72789L
    ; 74090L
    ; 75208L
    ; 75254L
    ; 75392L
    ; 75436L
    ; 75480L
    ; 75616L
    ; 75655L
    ; 75952L
    ; 75997L
    ; 76015L
    ; 76085L
    ; 76127L
    ; 76264L
    ; 76383L
    ; 76455L
    ; 76491L
    ; 76598L
    ; 76839L
    ; 76884L
    ; 76908L
    ; 76934L
    ; 78262L
    ; 78673L
    ; 78772L
    ; 78803L
    ; 79039L
    ; 79095L
    ; 79193L
    ; 79805L
    ; 79977L
    ; 80049L
    ; 80156L
    ; 80375L
    ; 80447L
    ; 80553L
    ; 80612L
    ; 80659L
    ; 80731L
    ; 80837L
    ; 81078L
    ; 81164L
    ; 81198L
    ; 81274L
    ; 81346L
    ; 81452L
    ; 81692L
    ; 81777L
    ; 81967L
    ; 82059L
    ; 82128L
    ; 82223L
    ; 82305L
    ; 82377L
    ; 82483L
    ; 82713L
    ; 82736L
    ; 82774L
    ; 82846L
    ; 82953L
    ; 83012L
    ; 83185L
    ; 83257L
    ; 83364L
    ; 83449L
    ; 83911L
    ; 83954L
    ; 83984L
    ; 84219L
    ; 84290L
    ; 84335L
    ; 84386L
    ; 84454L
    ; 84694L
    ; 84801L
    ; 85385L
    ; 85420L
    ; 85498L
    ; 85690L
    ; 85724L
    ; 86034L
    ; 86074L
    ; 86560L
    ; 86584L
    ; 87001L
    ; 88029L
    ; 88209L
    ; 88382L
    ; 88434L
    ; 88679L
    ; 88759L
    ; 88801L
    ; 90200L
    ; 90669L
    ; 94519L
    ; 95119L
    ; 95989L
    ; 96196L
    ; 96219L
    ; 96265L
    ; 96405L
    ; 96473L
    ; 96543L
    ; 96611L
    ; 96827L
    ; 96920L
    ; 96961L
    ; 96993L
    ; 97064L
    ; 97131L
    ; 97346L
    ; 97565L
    ; 97635L
    ; 97700L
    ; 97720L
    ; 97836L
    ; 98000L
    ; 98277L
    ; 98383L
    ; 98429L
    ; 98637L
    ; 98708L
    ; 98779L
    ; 98846L
    ; 99029L
    ; 99072L
    ; 99109L
    ; 99420L
    ; 99588L
    ; 99633L
    ; 99677L
    ; 99870L
    ; 99894L
    ; 99917L
    ; 99963L
    ; 100033L
    ; 100100L
    ; 100170L
    ; 100238L
    ; 100256L
    ; 100353L
    ; 100374L
    ; 100442L
    ; 100571L
    ; 100764L
    ; 100794L
    ; 100817L
    ; 100863L
    ; 100900L
    ; 100998L
    ; 101028L
    ; 101073L
    ; 102356L
    ; 102402L
    ; 102666L
    ; 102756L
    ; 102828L
    ; 102958L
    ; 103003L
    ; 103021L
    ; 103195L
    ; 103246L
    ; 103291L
    ; 103333L
    ; 103526L ]

  let crc32s =
    [ 0x77655204l
    ; 0xaa73f897l
    ; 0x3e8e3ec9l
    ; 0x10e217f1l
    ; 0xe014d063l
    ; 0xd708e868l
    ; 0x465f8f1el
    ; 0x2bd09bcbl
    ; 0x41ed28c2l
    ; 0xd8abbc2bl
    ; 0x4e81d45cl
    ; 0xfdf83c6el
    ; 0x8eccf04dl
    ; 0x7d338832l
    ; 0x7807ffa9l
    ; 0x539a587bl
    ; 0x4220c0d7l
    ; 0xa074f69l
    ; 0xd61ed1c4l
    ; 0x1bdc2bedl
    ; 0x71ccffacl
    ; 0xc2b959cbl
    ; 0x87aa4ea2l
    ; 0x741d43c3l
    ; 0xbed747d2l
    ; 0xecbcec59l
    ; 0x406cedbel
    ; 0x898aa823l
    ; 0xa94a6f01l
    ; 0x64219ee9l
    ; 0x61ca32a3l
    ; 0xd09cb51cl
    ; 0x9f91b454l
    ; 0xd55ed43cl
    ; 0x883abcdfl
    ; 0x7aa781fdl
    ; 0x35b93a09l
    ; 0x46556f54l
    ; 0xfa96e9a6l
    ; 0xe20326b5l
    ; 0x1fb0932cl
    ; 0x5e43c06cl
    ; 0x5dd547d4l
    ; 0x79ea25a6l
    ; 0xc8cbe9cfl
    ; 0x4a0d9c3cl
    ; 0xe8b61bd6l
    ; 0xce999affl
    ; 0xb5c1446cl
    ; 0x6cea2d1dl
    ; 0x5cdcc005l
    ; 0x99a39a9fl
    ; 0x752a397fl
    ; 0xe6b0dee5l
    ; 0xec386a3al
    ; 0xbee20d9el
    ; 0xdbce7cfl
    ; 0x52170cc8l
    ; 0xacf57115l
    ; 0xff049e26l
    ; 0xb5bb55c9l
    ; 0x77b123a8l
    ; 0x22cfb96dl
    ; 0xba4c638dl
    ; 0x1cf4747el
    ; 0x1f8ec88dl
    ; 0xa9ddd783l
    ; 0xc1846d5cl
    ; 0xb7c0a6e0l
    ; 0xd04673b7l
    ; 0x218706d3l
    ; 0xdf63ba89l
    ; 0x18e033ecl
    ; 0xbc9a7a18l
    ; 0x38c2df5fl
    ; 0xbce159el
    ; 0x69d75f02l
    ; 0xce4f65d8l
    ; 0x8e93bf15l
    ; 0x82b0b52bl
    ; 0x9c30ef2l
    ; 0x423f2d70l
    ; 0x5b0ebb80l
    ; 0xd453f16bl
    ; 0x1d7c3200l
    ; 0x17a8f5ecl
    ; 0x1cfc65e6l
    ; 0x677890e7l
    ; 0x31f6b85cl
    ; 0xe0364c86l
    ; 0xe5474cfcl
    ; 0x8ccb79abl
    ; 0xec815bacl
    ; 0x3bd2b5abl
    ; 0xe34a45a0l
    ; 0x64bf00dcl
    ; 0x90bdfb3fl
    ; 0xd9d2e78dl
    ; 0x20c1c549l
    ; 0xc94b99e3l
    ; 0xffe77c7al
    ; 0xb842eccbl
    ; 0x4eac4511l
    ; 0x244a62eel
    ; 0x3e7d72a4l
    ; 0xe39a19ffl
    ; 0x811e8d32l
    ; 0xbc6d52d0l
    ; 0xc3f5b35dl
    ; 0x3da7697dl
    ; 0x45b2fc9l
    ; 0xd47e3eb9l
    ; 0x77193920l
    ; 0x36fc55c7l
    ; 0xd54e9896l
    ; 0xcfc9767el
    ; 0x3ff259d3l
    ; 0x745461f5l
    ; 0xdc3b60b7l
    ; 0x6cf43164l
    ; 0xac1a4ed4l
    ; 0xadfc8edbl
    ; 0xad88ce15l
    ; 0x9627bdd1l
    ; 0x23e10a38l
    ; 0x277b5100l
    ; 0x77698faal
    ; 0xa5f60a08l
    ; 0xc602baa2l
    ; 0x503d0a3fl
    ; 0xbcd98b51l
    ; 0xaa6e17f0l
    ; 0x2bc09a5fl
    ; 0x78fa7549l
    ; 0x2847087fl
    ; 0x2a12c7aal
    ; 0x936ca849l
    ; 0xbbf2543cl
    ; 0x948b1e24l
    ; 0x29ddbfcal
    ; 0xea846435l
    ; 0x172aa451l
    ; 0x97c2e4b4l
    ; 0x8950842el
    ; 0x36865c49l
    ; 0x35cc8654l
    ; 0xfa6e6839l
    ; 0x3cbf72a6l
    ; 0x2bd4a78el
    ; 0xfb8b27c9l
    ; 0xca705cbal
    ; 0x55b8b4dcl
    ; 0x3e259584l
    ; 0x6f39f6ael
    ; 0x926f42al
    ; 0x48d23f10l
    ; 0xffee797al
    ; 0xbbbc6252l
    ; 0x86b02846l
    ; 0x42db5282l
    ; 0x78672f67l
    ; 0xb9dbbf1dl
    ; 0xb05a5824l
    ; 0x11f47867l
    ; 0x7fb3d239l
    ; 0x64d460dal
    ; 0x1e1b8d7cl
    ; 0xb34d6c9dl
    ; 0xa1832b7fl
    ; 0x486ac7bdl
    ; 0x6c716addl
    ; 0x6e828efcl
    ; 0x6a35945al
    ; 0x2fb15d8el
    ; 0xc74a08d0l
    ; 0x7bab002el
    ; 0x270a5562l
    ; 0x9fe41d61l
    ; 0x42122979l
    ; 0xb6e34ca4l
    ; 0xc6d0bb3al
    ; 0xc9781c3cl
    ; 0x8e82d290l
    ; 0x7a87390l
    ; 0xd4450a5el
    ; 0x711aae91l
    ; 0x47ef5adbl
    ; 0x45fa18ccl
    ; 0xedda03cal
    ; 0x33fab343l
    ; 0x4c7cef9el
    ; 0xb77a65a8l
    ; 0xe88e194dl
    ; 0xe98f3443l
    ; 0x4b8e33ccl
    ; 0xc4597f57l
    ; 0x7c831122l
    ; 0xe030b9f3l
    ; 0x11d989f8l
    ; 0x1f8728bdl
    ; 0xf50647ddl
    ; 0x2180f45dl
    ; 0xab86f511l
    ; 0x65463b70l
    ; 0xa268709bl
    ; 0xadec5f39l
    ; 0x2418f42al
    ; 0xfed21bf8l
    ; 0x15b2fef1l
    ; 0x73e0b41cl
    ; 0x7b64534fl
    ; 0x3ca991ffl
    ; 0xbe73400bl
    ; 0xe6dbb014l
    ; 0x974d2ca3l
    ; 0x76cf5b0dl
    ; 0x7e331300l
    ; 0x17e04efdl
    ; 0x4f823acbl
    ; 0x633f750el
    ; 0x8044b80al
    ; 0xed3da5b3l
    ; 0x8f65d65l
    ; 0xd28a82e2l
    ; 0xe9f58582l
    ; 0x94f27725l
    ; 0x883a0615l
    ; 0x719bac71l
    ; 0xc488ba9dl
    ; 0x31d663ecl
    ; 0xda507abel
    ; 0x2f46d767l
    ; 0x3f2e668el
    ; 0x50d5d076l
    ; 0x23c479el
    ; 0xa51d5987l
    ; 0x3c5f3a52l
    ; 0xd8daadfl
    ; 0xd84a92el
    ; 0x88d1a95cl
    ; 0xc659afd6l
    ; 0xb0dd416dl
    ; 0x894b7cd8l
    ; 0x531f37e7l
    ; 0xbddc4409l
    ; 0xffec30e3l
    ; 0xc7447a39l
    ; 0x75c61f7l
    ; 0xe95e9415l
    ; 0x54dc8fd1l
    ; 0x27fde866l
    ; 0xdd663991l
    ; 0xe8b07cbcl
    ; 0x9df60ca6l
    ; 0xa5d60ae2l
    ; 0xfb007ce1l
    ; 0x82fb6c76l
    ; 0x3000df18l ]
    |> List.map Git.Crc32.of_int32

  let values =
    List.combine hashes (List.combine crc32s offsets)
    |> List.sort (fun (a, _) (b, _) -> Hash.compare a b)

  let hash = Hash.of_hex "ee69272624218d9c985533394f9f3ec4823d2f16"
end
