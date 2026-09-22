(* 由 FloatTest/tools/emit_tests.py 自动生成，请勿手改。
 * 每条约 1000 条向量一条 vm_compute 定理；coqc 编译通过即差分测试通过。 *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.
Require Import OUTPUT.orbiter_new.CruDataFillTr32.rocq.spec.

Import ListNotations.
Local Open Scope Z_scope.


Example t_0000 :
  cruDataFillTr32_fun [0; 0]
  = [128; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0001 :
  cruDataFillTr32_fun [255; 0]
  = [128; 1; 4294967295; 4294967295; 549755813760].
Proof. vm_compute. reflexivity. Qed.


Example t_0002 :
  cruDataFillTr32_fun [0; 1]
  = [128; 1; 66051; 4244504319; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0003 :
  cruDataFillTr32_fun [255; 255]
  = [128; 1; 4294901244; 50462976; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0004 :
  cruDataFillTr32_fun [122; 103]
  = [128; 1; 2061584559; 3729107987; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0005 :
  cruDataFillTr32_fun [120; 121]
  = [128; 1; 2029087459; 2483914495; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0006 :
  cruDataFillTr32_fun [133; 110]
  = [128; 1; 2247320015; 3443239191; 278094856576].
Proof. vm_compute. reflexivity. Qed.


Example t_0007 :
  cruDataFillTr32_fun [157; 40]
  = [128; 1; 2646994197; 4247080309; 303780774528].
Proof. vm_compute. reflexivity. Qed.


Example t_0008 :
  cruDataFillTr32_fun [172; 157]
  = [128; 1; 2890524291; 953512463; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0009 :
  cruDataFillTr32_fun [178; 209]
  = [128; 1; 2994951205; 1849626849; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0010 :
  cruDataFillTr32_fun [168; 253]
  = [128; 1; 2829427359; 3031543467; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0011 :
  cruDataFillTr32_fun [161; 141]
  = [128; 1; 2704194376; 1845135124; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0012 :
  cruDataFillTr32_fun [66; 95]
  = [128; 1; 1117847647; 3324347619; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0013 :
  cruDataFillTr32_fun [61; 230]
  = [128; 1; 1025706479; 2777379159; 278094856576].
Proof. vm_compute. reflexivity. Qed.


Example t_0014 :
  cruDataFillTr32_fun [108; 198]
  = [128; 1; 1815279806; 1411047590; 275938951424].
Proof. vm_compute. reflexivity. Qed.


Example t_0015 :
  cruDataFillTr32_fun [57; 108]
  = [128; 1; 967119229; 2314559949; 278077948544].
Proof. vm_compute. reflexivity. Qed.


Example t_0016 :
  cruDataFillTr32_fun [9; 164]
  = [128; 1; 162353653; 2031993189; 278145056384].
Proof. vm_compute. reflexivity. Qed.


Example t_0017 :
  cruDataFillTr32_fun [217; 24]
  = [128; 1; 3656452385; 2039589313; 295291369600].
Proof. vm_compute. reflexivity. Qed.


Example t_0018 :
  cruDataFillTr32_fun [172; 253]
  = [128; 1; 2896799395; 3098915503; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0019 :
  cruDataFillTr32_fun [219; 84]
  = [128; 1; 3677324247; 2346660743; 282456866688].
Proof. vm_compute. reflexivity. Qed.


Example t_0020 :
  cruDataFillTr32_fun [205; 2]
  = [128; 1; 3452948947; 3318204875; 278128410496].
Proof. vm_compute. reflexivity. Qed.


Example t_0021 :
  cruDataFillTr32_fun [207; 251]
  = [128; 1; 3486172608; 3823032788; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0022 :
  cruDataFillTr32_fun [199; 90]
  = [128; 1; 3340860373; 1605964653; 282373111936].
Proof. vm_compute. reflexivity. Qed.


Example t_0023 :
  cruDataFillTr32_fun [197; 247]
  = [128; 1; 3317478314; 3923826638; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0024 :
  cruDataFillTr32_fun [226; 208]
  = [128; 1; 3803349586; 2725397010; 280400836864].
Proof. vm_compute. reflexivity. Qed.


Example t_0025 :
  cruDataFillTr32_fun [104; 154]
  = [128; 1; 1745001526; 10106062; 267349147904].
Proof. vm_compute. reflexivity. Qed.


Example t_0026 :
  cruDataFillTr32_fun [155; 70]
  = [128; 1; 2615224173; 2210991957; 273783308416].
Proof. vm_compute. reflexivity. Qed.


Example t_0027 :
  cruDataFillTr32_fun [243; 128]
  = [128; 1; 4084462451; 4084462451; 522811193728].
Proof. vm_compute. reflexivity. Qed.


Example t_0028 :
  cruDataFillTr32_fun [18; 114]
  = [128; 1; 310703720; 1253846688; 271660957184].
Proof. vm_compute. reflexivity. Qed.


Example t_0029 :
  cruDataFillTr32_fun [119; 237]
  = [128; 1; 2003063102; 3283131786; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0030 :
  cruDataFillTr32_fun [227; 180]
  = [128; 1; 3818343423; 331840303; 265210151808].
Proof. vm_compute. reflexivity. Qed.


Example t_0031 :
  cruDataFillTr32_fun [2; 188]
  = [128; 1; 46037558; 315525702; 263121354496].
Proof. vm_compute. reflexivity. Qed.


Example t_0032 :
  cruDataFillTr32_fun [245; 105]
  = [128; 1; 4116629296; 1371153292; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0033 :
  cruDataFillTr32_fun [30; 77]
  = [128; 1; 510375941; 3929507025; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0034 :
  cruDataFillTr32_fun [50; 158]
  = [128; 1; 852520460; 3126392468; 271627403264].
Proof. vm_compute. reflexivity. Qed.


Example t_0035 :
  cruDataFillTr32_fun [124; 45]
  = [128; 1; 2091505155; 3371508303; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0036 :
  cruDataFillTr32_fun [15; 69]
  = [128; 1; 257202654; 4215309770; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0037 :
  cruDataFillTr32_fun [88; 10]
  = [128; 1; 1482845302; 809124942; 267349147904].
Proof. vm_compute. reflexivity. Qed.


Example t_0038 :
  cruDataFillTr32_fun [40; 174]
  = [128; 1; 685147186; 1881066618; 267382701824].
Proof. vm_compute. reflexivity. Qed.


Example t_0039 :
  cruDataFillTr32_fun [4; 199]
  = [128; 1; 80450137; 3903813181; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0040 :
  cruDataFillTr32_fun [12; 88]
  = [128; 1; 207928340; 2885967028; 267265655296].
Proof. vm_compute. reflexivity. Qed.


Example t_0041 :
  cruDataFillTr32_fun [213; 6]
  = [128; 1; 3587957223; 3183725007; 278094856576].
Proof. vm_compute. reflexivity. Qed.


Example t_0042 :
  cruDataFillTr32_fun [158; 24]
  = [128; 1; 2662780646; 1045851782; 306070895360].
Proof. vm_compute. reflexivity. Qed.


Example t_0043 :
  cruDataFillTr32_fun [70; 75]
  = [128; 1; 1183964199; 442872059; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0044 :
  cruDataFillTr32_fun [55; 100]
  = [128; 1; 932970339; 2802544595; 273833770368].
Proof. vm_compute. reflexivity. Qed.


Example t_0045 :
  cruDataFillTr32_fun [32; 214]
  = [128; 1; 553045154; 3365827658; 267382701824].
Proof. vm_compute. reflexivity. Qed.


Example t_0046 :
  cruDataFillTr32_fun [69; 230]
  = [128; 1; 1160450551; 2912123231; 278094856576].
Proof. vm_compute. reflexivity. Qed.


Example t_0047 :
  cruDataFillTr32_fun [162; 47]
  = [128; 1; 2731606063; 3860153459; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0048 :
  cruDataFillTr32_fun [146; 249]
  = [128; 1; 2458616957; 2930221209; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0049 :
  cruDataFillTr32_fun [252; 151]
  = [128; 1; 4237503169; 2688011877; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0050 :
  cruDataFillTr32_fun [27; 172]
  = [128; 1; 466055967; 1796719471; 282389758848].
Proof. vm_compute. reflexivity. Qed.


Example t_0051 :
  cruDataFillTr32_fun [81; 173]
  = [128; 1; 1375644504; 2638935972; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0052 :
  cruDataFillTr32_fun [125; 80]
  = [128; 1; 2110594413; 1032707373; 338073405056].
Proof. vm_compute. reflexivity. Qed.


Example t_0053 :
  cruDataFillTr32_fun [175; 178]
  = [128; 1; 2942374853; 3885583357; 282373111936].
Proof. vm_compute. reflexivity. Qed.


Example t_0054 :
  cruDataFillTr32_fun [160; 109]
  = [128; 1; 2685237991; 3965306419; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0055 :
  cruDataFillTr32_fun [239; 15]
  = [128; 1; 4026404124; 3015889376; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0056 :
  cruDataFillTr32_fun [252; 14]
  = [128; 1; 4228519974; 3302154478; 275938951424].
Proof. vm_compute. reflexivity. Qed.


Example t_0057 :
  cruDataFillTr32_fun [94; 122]
  = [128; 1; 1591235276; 1995467492; 280217206784].
Proof. vm_compute. reflexivity. Qed.


Example t_0058 :
  cruDataFillTr32_fun [77; 85]
  = [128; 1; 1302525772; 4182680568; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0059 :
  cruDataFillTr32_fun [94; 112]
  = [128; 1; 1590574766; 2651750126; 271510882048].
Proof. vm_compute. reflexivity. Qed.


Example t_0060 :
  cruDataFillTr32_fun [188; 49]
  = [128; 1; 3169656399; 4163459723; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0061 :
  cruDataFillTr32_fun [91; 158]
  = [128; 1; 1543083829; 3816890301; 273783308416].
Proof. vm_compute. reflexivity. Qed.


Example t_0062 :
  cruDataFillTr32_fun [71; 197]
  = [128; 1; 1192022422; 871939458; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0063 :
  cruDataFillTr32_fun [205; 206]
  = [128; 1; 3449514295; 2506306047; 278094856576].
Proof. vm_compute. reflexivity. Qed.


Example t_0064 :
  cruDataFillTr32_fun [120; 150]
  = [128; 1; 2014225466; 548818146; 267382701824].
Proof. vm_compute. reflexivity. Qed.


Example t_0065 :
  cruDataFillTr32_fun [239; 209]
  = [128; 1; 4022374754; 2877050142; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0066 :
  cruDataFillTr32_fun [165; 4]
  = [128; 1; 2779360689; 2509872545; 269521960064].
Proof. vm_compute. reflexivity. Qed.


Example t_0067 :
  cruDataFillTr32_fun [27; 208]
  = [128; 1; 468433803; 3685448523; 265311597952].
Proof. vm_compute. reflexivity. Qed.


Example t_0068 :
  cruDataFillTr32_fun [149; 134]
  = [128; 1; 2501615911; 2097383695; 278094856576].
Proof. vm_compute. reflexivity. Qed.


Example t_0069 :
  cruDataFillTr32_fun [50; 5]
  = [128; 1; 842480705; 505620525; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0070 :
  cruDataFillTr32_fun [36; 40]
  = [128; 1; 608990364; 2225919228; 250152633856].
Proof. vm_compute. reflexivity. Qed.


Example t_0071 :
  cruDataFillTr32_fun [162; 114]
  = [128; 1; 2719254264; 3662462512; 271660957184].
Proof. vm_compute. reflexivity. Qed.


Example t_0072 :
  cruDataFillTr32_fun [198; 71]
  = [128; 1; 3322762395; 2867935359; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0073 :
  cruDataFillTr32_fun [171; 90]
  = [128; 1; 2869256121; 1134425937; 273816862336].
Proof. vm_compute. reflexivity. Qed.


Example t_0074 :
  cruDataFillTr32_fun [70; 171]
  = [128; 1; 1190239303; 2588274843; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0075 :
  cruDataFillTr32_fun [251; 52]
  = [128; 1; 4214186903; 727684039; 282456866688].
Proof. vm_compute. reflexivity. Qed.


Example t_0076 :
  cruDataFillTr32_fun [28; 3]
  = [128; 1; 471802405; 269686297; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0077 :
  cruDataFillTr32_fun [154; 161]
  = [128; 1; 2587614333; 381114617; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0078 :
  cruDataFillTr32_fun [199; 213]
  = [128; 1; 3348918598; 1934106098; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0079 :
  cruDataFillTr32_fun [252; 27]
  = [128; 1; 4229378637; 2427176673; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0080 :
  cruDataFillTr32_fun [254; 200]
  = [128; 1; 4274425430; 3735449142; 305936679680].
Proof. vm_compute. reflexivity. Qed.


Example t_0081 :
  cruDataFillTr32_fun [217; 179]
  = [128; 1; 3649847282; 230716198; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0082 :
  cruDataFillTr32_fun [220; 90]
  = [128; 1; 3694563562; 1959667842; 275972505344].
Proof. vm_compute. reflexivity. Qed.


Example t_0083 :
  cruDataFillTr32_fun [220; 198]
  = [128; 1; 3701631022; 3297398806; 275938951424].
Proof. vm_compute. reflexivity. Qed.


Example t_0084 :
  cruDataFillTr32_fun [235; 172]
  = [128; 1; 3952559087; 1005032255; 282389758848].
Proof. vm_compute. reflexivity. Qed.


Example t_0085 :
  cruDataFillTr32_fun [19; 211]
  = [128; 1; 333887884; 3348786496; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0086 :
  cruDataFillTr32_fun [236; 169]
  = [128; 1; 3969203943; 1223793219; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0087 :
  cruDataFillTr32_fun [115; 88]
  = [128; 1; 1942692731; 325829403; 282355942784].
Proof. vm_compute. reflexivity. Qed.


Example t_0088 :
  cruDataFillTr32_fun [133; 181]
  = [128; 1; 2235232164; 2976259024; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0089 :
  cruDataFillTr32_fun [208; 181]
  = [128; 1; 3498392303; 4239484443; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0090 :
  cruDataFillTr32_fun [215; 245]
  = [128; 1; 3620520374; 66645474; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0091 :
  cruDataFillTr32_fun [16; 233]
  = [128; 1; 284811979; 1817525799; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0092 :
  cruDataFillTr32_fun [91; 24]
  = [128; 1; 1534299043; 4212337475; 299603179904].
Proof. vm_compute. reflexivity. Qed.


Example t_0093 :
  cruDataFillTr32_fun [115; 162]
  = [128; 1; 1930803033; 3951898577; 273816862336].
Proof. vm_compute. reflexivity. Qed.


Example t_0094 :
  cruDataFillTr32_fun [49; 20]
  = [128; 1; 826628461; 3790932253; 260898341504].
Proof. vm_compute. reflexivity. Qed.


Example t_0095 :
  cruDataFillTr32_fun [158; 194]
  = [128; 1; 2657100516; 2522356444; 280217206784].
Proof. vm_compute. reflexivity. Qed.


Example t_0096 :
  cruDataFillTr32_fun [17; 83]
  = [128; 1; 291813130; 3306711998; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0097 :
  cruDataFillTr32_fun [10; 226]
  = [128; 1; 183291568; 2187609640; 271660957184].
Proof. vm_compute. reflexivity. Qed.


Example t_0098 :
  cruDataFillTr32_fun [125; 106]
  = [128; 1; 2112311739; 3577719059; 278128410496].
Proof. vm_compute. reflexivity. Qed.


Example t_0099 :
  cruDataFillTr32_fun [45; 214]
  = [128; 1; 755227055; 3584786775; 278094856576].
Proof. vm_compute. reflexivity. Qed.


Example t_0100 :
  cruDataFillTr32_fun [247; 179]
  = [128; 1; 4155137296; 736006468; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0101 :
  cruDataFillTr32_fun [246; 74]
  = [128; 1; 4131424980; 3457704620; 280217206784].
Proof. vm_compute. reflexivity. Qed.


Example t_0102 :
  cruDataFillTr32_fun [75; 188]
  = [128; 1; 1258799999; 1528288143; 282389758848].
Proof. vm_compute. reflexivity. Qed.


Example t_0103 :
  cruDataFillTr32_fun [227; 99]
  = [128; 1; 3813058828; 1471815040; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0104 :
  cruDataFillTr32_fun [101; 177]
  = [128; 1; 1695991672; 2706506676; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0105 :
  cruDataFillTr32_fun [171; 195]
  = [128; 1; 2876125684; 2674009576; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0106 :
  cruDataFillTr32_fun [78; 151]
  = [128; 1; 1323662355; 4069073079; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0107 :
  cruDataFillTr32_fun [213; 99]
  = [128; 1; 3577256958; 1236012914; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0108 :
  cruDataFillTr32_fun [149; 0]
  = [128; 1; 2509608341; 2509608341; 321229867648].
Proof. vm_compute. reflexivity. Qed.


Example t_0109 :
  cruDataFillTr32_fun [229; 52]
  = [128; 1; 3843640705; 357137841; 269521960064].
Proof. vm_compute. reflexivity. Qed.


Example t_0110 :
  cruDataFillTr32_fun [176; 14]
  = [128; 1; 2965294298; 2022085794; 267382701824].
Proof. vm_compute. reflexivity. Qed.


Example t_0111 :
  cruDataFillTr32_fun [39; 153]
  = [128; 1; 666917362; 3277649294; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0112 :
  cruDataFillTr32_fun [251; 157]
  = [128; 1; 4221056466; 2267332958; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0113 :
  cruDataFillTr32_fun [160; 19]
  = [128; 1; 2696136409; 1416067725; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0114 :
  cruDataFillTr32_fun [210; 135]
  = [128; 1; 3529105511; 3057501259; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0115 :
  cruDataFillTr32_fun [134; 191]
  = [128; 1; 2252670147; 2320042183; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0116 :
  cruDataFillTr32_fun [208; 113]
  = [128; 1; 3493966371; 209579615; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0117 :
  cruDataFillTr32_fun [133; 189]
  = [128; 1; 2235760572; 2437811144; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0118 :
  cruDataFillTr32_fun [149; 80]
  = [128; 1; 2514826629; 1436939589; 252376167040].
Proof. vm_compute. reflexivity. Qed.


Example t_0119 :
  cruDataFillTr32_fun [91; 67]
  = [128; 1; 1537138980; 1335022872; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0120 :
  cruDataFillTr32_fun [166; 192]
  = [128; 1; 2791712486; 2791712486; 357339198208].
Proof. vm_compute. reflexivity. Qed.


Example t_0121 :
  cruDataFillTr32_fun [21; 175]
  = [128; 1; 365196066; 1493743462; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0122 :
  cruDataFillTr32_fun [8; 155]
  = [128; 1; 144916185; 2620904045; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0123 :
  cruDataFillTr32_fun [242; 170]
  = [128; 1; 4070328048; 1257545288; 271660957184].
Proof. vm_compute. reflexivity. Qed.


Example t_0124 :
  cruDataFillTr32_fun [210; 241]
  = [128; 1; 3536041125; 251654369; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0125 :
  cruDataFillTr32_fun [178; 86]
  = [128; 1; 2986892980; 1521485404; 271627403264].
Proof. vm_compute. reflexivity. Qed.


Example t_0126 :
  cruDataFillTr32_fun [118; 160]
  = [128; 1; 1981199958; 4137039574; 391567330048].
Proof. vm_compute. reflexivity. Qed.


Example t_0127 :
  cruDataFillTr32_fun [214; 205]
  = [128; 1; 3601035325; 2725198857; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0128 :
  cruDataFillTr32_fun [82; 127]
  = [128; 1; 1389449423; 1456821459; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0129 :
  cruDataFillTr32_fun [164; 159]
  = [128; 1; 2755912321; 684156421; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0130 :
  cruDataFillTr32_fun [67; 108]
  = [128; 1; 1135549319; 2482990039; 265277259648].
Proof. vm_compute. reflexivity. Qed.


Example t_0131 :
  cruDataFillTr32_fun [223; 198]
  = [128; 1; 3752160049; 3347927833; 282406665856].
Proof. vm_compute. reflexivity. Qed.


Example t_0132 :
  cruDataFillTr32_fun [107; 3]
  = [128; 1; 1802400116; 1600284008; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0133 :
  cruDataFillTr32_fun [22; 242]
  = [128; 1; 369687276; 1312829988; 280217206784].
Proof. vm_compute. reflexivity. Qed.


Example t_0134 :
  cruDataFillTr32_fun [203; 68]
  = [128; 1; 3406779287; 3154068359; 282456866688].
Proof. vm_compute. reflexivity. Qed.


Example t_0135 :
  cruDataFillTr32_fun [139; 133]
  = [128; 1; 2333119770; 2013036806; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0136 :
  cruDataFillTr32_fun [126; 120]
  = [128; 1; 2130079462; 2652278278; 306070895360].
Proof. vm_compute. reflexivity. Qed.


Example t_0137 :
  cruDataFillTr32_fun [246; 57]
  = [128; 1; 4130302113; 306939069; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0138 :
  cruDataFillTr32_fun [36; 17]
  = [128; 1; 607471191; 3773891091; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0139 :
  cruDataFillTr32_fun [146; 97]
  = [128; 1; 2465420469; 242208817; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0140 :
  cruDataFillTr32_fun [30; 126]
  = [128; 1; 513546904; 648290976; 280250760704].
Proof. vm_compute. reflexivity. Qed.


Example t_0141 :
  cruDataFillTr32_fun [17; 126]
  = [128; 1; 294587787; 429331859; 269538606976].
Proof. vm_compute. reflexivity. Qed.


Example t_0142 :
  cruDataFillTr32_fun [244; 162]
  = [128; 1; 4103485658; 1812901970; 275972505344].
Proof. vm_compute. reflexivity. Qed.


Example t_0143 :
  cruDataFillTr32_fun [39; 71]
  = [128; 1; 661566972; 189962720; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0144 :
  cruDataFillTr32_fun [82; 93]
  = [128; 1; 1387203689; 3728447733; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0145 :
  cruDataFillTr32_fun [138; 70]
  = [128; 1; 2328893020; 1924726340; 271627403264].
Proof. vm_compute. reflexivity. Qed.


Example t_0146 :
  cruDataFillTr32_fun [203; 158]
  = [128; 1; 3412658085; 1408339757; 273783308416].
Proof. vm_compute. reflexivity. Qed.


Example t_0147 :
  cruDataFillTr32_fun [234; 172]
  = [128; 1; 3935716078; 988189246; 280233853696].
Proof. vm_compute. reflexivity. Qed.


Example t_0148 :
  cruDataFillTr32_fun [105; 164]
  = [128; 1; 1762505045; 3648856517; 278145056384].
Proof. vm_compute. reflexivity. Qed.


Example t_0149 :
  cruDataFillTr32_fun [76; 36]
  = [128; 1; 1282446520; 3168797736; 284478554112].
Proof. vm_compute. reflexivity. Qed.


Example t_0150 :
  cruDataFillTr32_fun [57; 80]
  = [128; 1; 965335337; 4182350313; 329449784448].
Proof. vm_compute. reflexivity. Qed.


Example t_0151 :
  cruDataFillTr32_fun [209; 102]
  = [128; 1; 3510082819; 966722923; 269538606976].
Proof. vm_compute. reflexivity. Qed.


Example t_0152 :
  cruDataFillTr32_fun [45; 141]
  = [128; 1; 767182804; 4186313632; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0153 :
  cruDataFillTr32_fun [254; 194]
  = [128; 1; 4274029124; 4139285052; 280217206784].
Proof. vm_compute. reflexivity. Qed.


Example t_0154 :
  cruDataFillTr32_fun [34; 226]
  = [128; 1; 570746568; 2591841856; 271660957184].
Proof. vm_compute. reflexivity. Qed.


Example t_0155 :
  cruDataFillTr32_fun [67; 252]
  = [128; 1; 1128217399; 1397705543; 265277259648].
Proof. vm_compute. reflexivity. Qed.


Example t_0156 :
  cruDataFillTr32_fun [120; 17]
  = [128; 1; 2022283947; 876959335; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0157 :
  cruDataFillTr32_fun [181; 236]
  = [128; 1; 3047263609; 99737033; 269454852224].
Proof. vm_compute. reflexivity. Qed.


Example t_0158 :
  cruDataFillTr32_fun [198; 158]
  = [128; 1; 3328443040; 1324124712; 280250760704].
Proof. vm_compute. reflexivity. Qed.


Example t_0159 :
  cruDataFillTr32_fun [190; 204]
  = [128; 1; 3196737058; 2388272882; 288857472256].
Proof. vm_compute. reflexivity. Qed.


Example t_0160 :
  cruDataFillTr32_fun [222; 5]
  = [128; 1; 3739478253; 3402618073; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0161 :
  cruDataFillTr32_fun [77; 15]
  = [128; 1; 1297902458; 287321918; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0162 :
  cruDataFillTr32_fun [135; 220]
  = [128; 1; 2271428379; 401854379; 273766662528].
Proof. vm_compute. reflexivity. Qed.


Example t_0163 :
  cruDataFillTr32_fun [149; 114]
  = [128; 1; 2500295147; 3443503395; 278128410496].
Proof. vm_compute. reflexivity. Qed.


Example t_0164 :
  cruDataFillTr32_fun [180; 189]
  = [128; 1; 3027316459; 3229432567; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0165 :
  cruDataFillTr32_fun [193; 0]
  = [128; 1; 3250700737; 3250700737; 416089694336].
Proof. vm_compute. reflexivity. Qed.


Example t_0166 :
  cruDataFillTr32_fun [190; 114]
  = [128; 1; 3190858260; 4134066764; 280217206784].
Proof. vm_compute. reflexivity. Qed.


Example t_0167 :
  cruDataFillTr32_fun [40; 132]
  = [128; 1; 682373300; 412885156; 275989151232].
Proof. vm_compute. reflexivity. Qed.


Example t_0168 :
  cruDataFillTr32_fun [110; 177]
  = [128; 1; 1847578753; 2858093757; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0169 :
  cruDataFillTr32_fun [208; 251]
  = [128; 1; 3503015617; 3839875797; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0170 :
  cruDataFillTr32_fun [74; 119]
  = [128; 1; 1254176943; 1860525267; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0171 :
  cruDataFillTr32_fun [228; 200]
  = [128; 1; 3836507196; 3297530908; 250152633856].
Proof. vm_compute. reflexivity. Qed.


Example t_0172 :
  cruDataFillTr32_fun [50; 110]
  = [128; 1; 849350268; 2062046916; 271627403264].
Proof. vm_compute. reflexivity. Qed.


Example t_0173 :
  cruDataFillTr32_fun [104; 233]
  = [128; 1; 1750153763; 3299710591; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0174 :
  cruDataFillTr32_fun [28; 192]
  = [128; 1; 484219996; 484219996; 61980159488].
Proof. vm_compute. reflexivity. Qed.


Example t_0175 :
  cruDataFillTr32_fun [25; 74]
  = [128; 1; 425962999; 4047209935; 269505053056].
Proof. vm_compute. reflexivity. Qed.


Example t_0176 :
  cruDataFillTr32_fun [222; 147]
  = [128; 1; 3731948695; 2451945547; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0177 :
  cruDataFillTr32_fun [11; 151]
  = [128; 1; 195181008; 2940657012; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0178 :
  cruDataFillTr32_fun [221; 133]
  = [128; 1; 3714246508; 3377386328; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0179 :
  cruDataFillTr32_fun [221; 56]
  = [128; 1; 3709160837; 4248137125; 303914990208].
Proof. vm_compute. reflexivity. Qed.


Example t_0180 :
  cruDataFillTr32_fun [72; 212]
  = [128; 1; 1209856196; 4174159988; 275989151232].
Proof. vm_compute. reflexivity. Qed.


Example t_0181 :
  cruDataFillTr32_fun [255; 218]
  = [128; 1; 4292457357; 2540784421; 282373111936].
Proof. vm_compute. reflexivity. Qed.


Example t_0182 :
  cruDataFillTr32_fun [245; 146]
  = [128; 1; 4119271851; 2906640739; 278128410496].
Proof. vm_compute. reflexivity. Qed.


Example t_0183 :
  cruDataFillTr32_fun [242; 96]
  = [128; 1; 4065505810; 1926378130; 383480572160].
Proof. vm_compute. reflexivity. Qed.


Example t_0184 :
  cruDataFillTr32_fun [109; 231]
  = [128; 1; 1834236706; 3518537606; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0185 :
  cruDataFillTr32_fun [80; 206]
  = [128; 1; 1344203962; 417772674; 267382701824].
Proof. vm_compute. reflexivity. Qed.


Example t_0186 :
  cruDataFillTr32_fun [63; 112]
  = [128; 1; 1068441487; 2146394063; 342653646720].
Proof. vm_compute. reflexivity. Qed.


Example t_0187 :
  cruDataFillTr32_fun [249; 132]
  = [128; 1; 4185719173; 3916296565; 278145056384].
Proof. vm_compute. reflexivity. Qed.


Example t_0188 :
  cruDataFillTr32_fun [152; 167]
  = [128; 1; 2554324621; 4238559985; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0189 :
  cruDataFillTr32_fun [97; 169]
  = [128; 1; 1628091228; 3177582520; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0190 :
  cruDataFillTr32_fun [69; 40]
  = [128; 1; 1164809661; 2781738269; 252308539008].
Proof. vm_compute. reflexivity. Qed.


Example t_0191 :
  cruDataFillTr32_fun [199; 44]
  = [128; 1; 3354599243; 390295451; 273766662528].
Proof. vm_compute. reflexivity. Qed.


Example t_0192 :
  cruDataFillTr32_fun [171; 118]
  = [128; 1; 2871105293; 3544825653; 273783308416].
Proof. vm_compute. reflexivity. Qed.


Example t_0193 :
  cruDataFillTr32_fun [34; 150]
  = [128; 1; 582504164; 3395352204; 271627403264].
Proof. vm_compute. reflexivity. Qed.


Example t_0194 :
  cruDataFillTr32_fun [26; 20]
  = [128; 1; 439239254; 3403608582; 280300961536].
Proof. vm_compute. reflexivity. Qed.


Example t_0195 :
  cruDataFillTr32_fun [9; 153]
  = [128; 1; 161627092; 2772359024; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0196 :
  cruDataFillTr32_fun [107; 9]
  = [128; 1; 1802796422; 1196448098; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0197 :
  cruDataFillTr32_fun [79; 106]
  = [128; 1; 1337533325; 2802940901; 282373111936].
Proof. vm_compute. reflexivity. Qed.


Example t_0198 :
  cruDataFillTr32_fun [124; 12]
  = [128; 1; 2089325728; 1280861296; 284545661952].
Proof. vm_compute. reflexivity. Qed.


Example t_0199 :
  cruDataFillTr32_fun [59; 35]
  = [128; 1; 996049316; 2949838104; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0200 :
  cruDataFillTr32_fun [105; 201]
  = [128; 1; 1764948932; 1158600608; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0201 :
  cruDataFillTr32_fun [16; 50]
  = [128; 1; 272790694; 1215999198; 267349147904].
Proof. vm_compute. reflexivity. Qed.


Example t_0202 :
  cruDataFillTr32_fun [221; 233]
  = [128; 1; 3720785816; 958532596; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0203 :
  cruDataFillTr32_fun [160; 139]
  = [128; 1; 2687219265; 1962904085; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0204 :
  cruDataFillTr32_fun [244; 40]
  = [128; 1; 4095493228; 1417454796; 284646063616].
Proof. vm_compute. reflexivity. Qed.


Example t_0205 :
  cruDataFillTr32_fun [104; 241]
  = [128; 1; 1750682171; 2761262711; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0206 :
  cruDataFillTr32_fun [16; 45]
  = [128; 1; 272460439; 1552529123; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0207 :
  cruDataFillTr32_fun [48; 4]
  = [128; 1; 808728636; 539240492; 258742436352].
Proof. vm_compute. reflexivity. Qed.


Example t_0208 :
  cruDataFillTr32_fun [134; 23]
  = [128; 1; 2258482379; 708925551; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0209 :
  cruDataFillTr32_fun [88; 182]
  = [128; 1; 1477362810; 2151083170; 267382701824].
Proof. vm_compute. reflexivity. Qed.


Example t_0210 :
  cruDataFillTr32_fun [172; 42]
  = [128; 1; 2899705898; 70146178; 275972505344].
Proof. vm_compute. reflexivity. Qed.


Example t_0211 :
  cruDataFillTr32_fun [63; 243]
  = [128; 1; 1060250904; 1936087372; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0212 :
  cruDataFillTr32_fun [46; 168]
  = [128; 1; 785808934; 2385960582; 271711681280].
Proof. vm_compute. reflexivity. Qed.


Example t_0213 :
  cruDataFillTr32_fun [241; 114]
  = [128; 1; 4049851719; 698027391; 269505053056].
Proof. vm_compute. reflexivity. Qed.


Example t_0214 :
  cruDataFillTr32_fun [154; 116]
  = [128; 1; 2584642294; 3393106470; 280300961536].
Proof. vm_compute. reflexivity. Qed.


Example t_0215 :
  cruDataFillTr32_fun [66; 65]
  = [128; 1; 1115931653; 1048559617; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0216 :
  cruDataFillTr32_fun [2; 50]
  = [128; 1; 36988568; 980197072; 271660957184].
Proof. vm_compute. reflexivity. Qed.


Example t_0217 :
  cruDataFillTr32_fun [228; 200]
  = [128; 1; 3836507196; 3297530908; 250152633856].
Proof. vm_compute. reflexivity. Qed.


Example t_0218 :
  cruDataFillTr32_fun [177; 74]
  = [128; 1; 2986034575; 2312314215; 269505053056].
Proof. vm_compute. reflexivity. Qed.


Example t_0219 :
  cruDataFillTr32_fun [226; 147]
  = [128; 1; 3799320731; 2519317583; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0220 :
  cruDataFillTr32_fun [21; 159]
  = [128; 1; 364139506; 2570639222; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0221 :
  cruDataFillTr32_fun [205; 146]
  = [128; 1; 3445617027; 2232920379; 278128410496].
Proof. vm_compute. reflexivity. Qed.


Example t_0222 :
  cruDataFillTr32_fun [237; 194]
  = [128; 1; 3987697971; 3852953899; 278128410496].
Proof. vm_compute. reflexivity. Qed.


Example t_0223 :
  cruDataFillTr32_fun [186; 0]
  = [128; 1; 3132799674; 3132799674; 400998358272].
Proof. vm_compute. reflexivity. Qed.


Example t_0224 :
  cruDataFillTr32_fun [169; 111]
  = [128; 1; 2836957174; 3982281530; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0225 :
  cruDataFillTr32_fun [96; 156]
  = [128; 1; 1627166772; 4035717316; 258809544192].
Proof. vm_compute. reflexivity. Qed.


Example t_0226 :
  cruDataFillTr32_fun [156; 67]
  = [128; 1; 2631869029; 2429752921; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0227 :
  cruDataFillTr32_fun [42; 2]
  = [128; 1; 707538480; 572794408; 271660957184].
Proof. vm_compute. reflexivity. Qed.


Example t_0228 :
  cruDataFillTr32_fun [214; 214]
  = [128; 1; 3601629784; 2119444992; 280250760704].
Proof. vm_compute. reflexivity. Qed.


Example t_0229 :
  cruDataFillTr32_fun [102; 153]
  = [128; 1; 1728026673; 43726029; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0230 :
  cruDataFillTr32_fun [98; 155]
  = [128; 1; 1660786739; 4136709319; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0231 :
  cruDataFillTr32_fun [176; 203]
  = [128; 1; 2960868881; 2219776741; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0232 :
  cruDataFillTr32_fun [53; 207]
  = [128; 1; 889508770; 4190672742; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0233 :
  cruDataFillTr32_fun [35; 231]
  = [128; 1; 587919832; 2272154940; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0234 :
  cruDataFillTr32_fun [137; 161]
  = [128; 1; 2301283180; 94783464; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0235 :
  cruDataFillTr32_fun [52; 181]
  = [128; 1; 887725651; 1612040831; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0236 :
  cruDataFillTr32_fun [198; 41]
  = [128; 1; 3337558081; 575370397; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0237 :
  cruDataFillTr32_fun [9; 132]
  = [128; 1; 160240021; 4185719173; 278145056384].
Proof. vm_compute. reflexivity. Qed.


Example t_0238 :
  cruDataFillTr32_fun [21; 179]
  = [128; 1; 365460270; 1241296738; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0239 :
  cruDataFillTr32_fun [233; 140]
  = [128; 1; 3916759437; 3108360541; 278077948544].
Proof. vm_compute. reflexivity. Qed.


Example t_0240 :
  cruDataFillTr32_fun [78; 242]
  = [128; 1; 1312829988; 2256038492; 280217206784].
Proof. vm_compute. reflexivity. Qed.


Example t_0241 :
  cruDataFillTr32_fun [242; 36]
  = [128; 1; 4061543006; 1652992718; 263054246656].
Proof. vm_compute. reflexivity. Qed.


Example t_0242 :
  cruDataFillTr32_fun [8; 173]
  = [128; 1; 146104847; 1409396315; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0243 :
  cruDataFillTr32_fun [208; 189]
  = [128; 1; 3498920455; 3701036563; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0244 :
  cruDataFillTr32_fun [73; 167]
  = [128; 1; 1240504126; 2908027810; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0245 :
  cruDataFillTr32_fun [232; 70]
  = [128; 1; 3895358650; 3491126434; 267382701824].
Proof. vm_compute. reflexivity. Qed.


Example t_0246 :
  cruDataFillTr32_fun [58; 91]
  = [128; 1; 982904907; 3458827487; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0247 :
  cruDataFillTr32_fun [34; 67]
  = [128; 1; 577087723; 374971615; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0248 :
  cruDataFillTr32_fun [172; 255]
  = [128; 1; 2896931497; 2964303533; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0249 :
  cruDataFillTr32_fun [27; 242]
  = [128; 1; 453902321; 1397045033; 273816862336].
Proof. vm_compute. reflexivity. Qed.


Example t_0250 :
  cruDataFillTr32_fun [10; 119]
  = [128; 1; 176289903; 782572691; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0251 :
  cruDataFillTr32_fun [57; 74]
  = [128; 1; 964939031; 291218927; 269505053056].
Proof. vm_compute. reflexivity. Qed.


Example t_0252 :
  cruDataFillTr32_fun [116; 50]
  = [128; 1; 1957091338; 2900234306; 275972505344].
Proof. vm_compute. reflexivity. Qed.


Example t_0253 :
  cruDataFillTr32_fun [200; 231]
  = [128; 1; 3366950525; 739506913; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0254 :
  cruDataFillTr32_fun [46; 7]
  = [128; 1; 775240771; 303636519; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0255 :
  cruDataFillTr32_fun [254; 171]
  = [128; 1; 4272510207; 1392355411; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0256 :
  cruDataFillTr32_fun [103; 104]
  = [128; 1; 1741633439; 3341785087; 256620349312].
Proof. vm_compute. reflexivity. Qed.


Example t_0257 :
  cruDataFillTr32_fun [132; 154]
  = [128; 1; 2216605778; 481710314; 275972505344].
Proof. vm_compute. reflexivity. Qed.


Example t_0258 :
  cruDataFillTr32_fun [37; 40]
  = [128; 1; 625833373; 2242762237; 252308539008].
Proof. vm_compute. reflexivity. Qed.


Example t_0259 :
  cruDataFillTr32_fun [191; 117]
  = [128; 1; 3207899422; 3948991818; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0260 :
  cruDataFillTr32_fun [142; 172]
  = [128; 1; 2386224786; 3733599970; 288857472256].
Proof. vm_compute. reflexivity. Qed.


Example t_0261 :
  cruDataFillTr32_fun [185; 55]
  = [128; 1; 3119523678; 3709094786; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0262 :
  cruDataFillTr32_fun [233; 102]
  = [128; 1; 3914315035; 1370955139; 269538606976].
Proof. vm_compute. reflexivity. Qed.


Example t_0263 :
  cruDataFillTr32_fun [145; 135]
  = [128; 1; 2434309926; 1979482890; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0264 :
  cruDataFillTr32_fun [213; 25]
  = [128; 1; 3589146400; 1904911292; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0265 :
  cruDataFillTr32_fun [159; 152]
  = [128; 1; 2671234919; 1071083271; 308226800512].
Proof. vm_compute. reflexivity. Qed.


Example t_0266 :
  cruDataFillTr32_fun [184; 30]
  = [128; 1; 3101094930; 1079934106; 267382701824].
Proof. vm_compute. reflexivity. Qed.


Example t_0267 :
  cruDataFillTr32_fun [109; 177]
  = [128; 1; 1830735744; 2841250748; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0268 :
  cruDataFillTr32_fun [71; 4]
  = [128; 1; 1196117843; 926629699; 273833770368].
Proof. vm_compute. reflexivity. Qed.


Example t_0269 :
  cruDataFillTr32_fun [200; 164]
  = [128; 1; 3362525364; 953974820; 275989151232].
Proof. vm_compute. reflexivity. Qed.


Example t_0270 :
  cruDataFillTr32_fun [35; 196]
  = [128; 1; 602385263; 332897119; 265210151808].
Proof. vm_compute. reflexivity. Qed.


Example t_0271 :
  cruDataFillTr32_fun [160; 120]
  = [128; 1; 2685964296; 3224940584; 241663228928].
Proof. vm_compute. reflexivity. Qed.


Example t_0272 :
  cruDataFillTr32_fun [38; 106]
  = [128; 1; 647035492; 2129154748; 280217206784].
Proof. vm_compute. reflexivity. Qed.


Example t_0273 :
  cruDataFillTr32_fun [44; 80]
  = [128; 1; 746376220; 3963391196; 301959888384].
Proof. vm_compute. reflexivity. Qed.


Example t_0274 :
  cruDataFillTr32_fun [152; 105]
  = [128; 1; 2550229715; 4099786287; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0275 :
  cruDataFillTr32_fun [80; 131]
  = [128; 1; 1356027609; 1153911501; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0276 :
  cruDataFillTr32_fun [88; 32]
  = [128; 1; 1484298424; 3640137784; 327963917312].
Proof. vm_compute. reflexivity. Qed.


Example t_0277 :
  cruDataFillTr32_fun [88; 242]
  = [128; 1; 1481260078; 2424468582; 267349147904].
Proof. vm_compute. reflexivity. Qed.


Example t_0278 :
  cruDataFillTr32_fun [91; 177]
  = [128; 1; 1527561582; 2538142122; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0279 :
  cruDataFillTr32_fun [164; 236]
  = [128; 1; 2760932456; 4108373176; 267298947072].
Proof. vm_compute. reflexivity. Qed.


Example t_0280 :
  cruDataFillTr32_fun [233; 2]
  = [128; 1; 3924553199; 3789809127; 269505053056].
Proof. vm_compute. reflexivity. Qed.


Example t_0281 :
  cruDataFillTr32_fun [106; 39]
  = [128; 1; 1787934943; 3472170051; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0282 :
  cruDataFillTr32_fun [92; 199]
  = [128; 1; 1545857713; 1074253461; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0283 :
  cruDataFillTr32_fun [51; 11]
  = [128; 1; 859720020; 118627624; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0284 :
  cruDataFillTr32_fun [222; 45]
  = [128; 1; 3725277285; 710378673; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0285 :
  cruDataFillTr32_fun [236; 48]
  = [128; 1; 3961277564; 744262844; 301691457024].
Proof. vm_compute. reflexivity. Qed.


Example t_0286 :
  cruDataFillTr32_fun [152; 124]
  = [128; 1; 2551484428; 2820972572; 275922043392].
Proof. vm_compute. reflexivity. Qed.


Example t_0287 :
  cruDataFillTr32_fun [203; 149]
  = [128; 1; 3412129162; 1997316406; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0288 :
  cruDataFillTr32_fun [204; 221]
  = [128; 1; 3433662051; 1479873263; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0289 :
  cruDataFillTr32_fun [77; 56]
  = [128; 1; 1300610549; 1839586581; 269421560448].
Proof. vm_compute. reflexivity. Qed.


Example t_0290 :
  cruDataFillTr32_fun [235; 254]
  = [128; 1; 3957975013; 4092719085; 273783308416].
Proof. vm_compute. reflexivity. Qed.


Example t_0291 :
  cruDataFillTr32_fun [22; 99]
  = [128; 1; 377084991; 2330808499; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0292 :
  cruDataFillTr32_fun [178; 3]
  = [128; 1; 2998253755; 2796137647; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0293 :
  cruDataFillTr32_fun [110; 226]
  = [128; 1; 1850749460; 3871910540; 280217206784].
Proof. vm_compute. reflexivity. Qed.


Example t_0294 :
  cruDataFillTr32_fun [85; 86]
  = [128; 1; 1437270359; 4250118655; 278094856576].
Proof. vm_compute. reflexivity. Qed.


Example t_0295 :
  cruDataFillTr32_fun [66; 134]
  = [128; 1; 1120423636; 716191420; 271627403264].
Proof. vm_compute. reflexivity. Qed.


Example t_0296 :
  cruDataFillTr32_fun [203; 111]
  = [128; 1; 3409619224; 259976540; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0297 :
  cruDataFillTr32_fun [39; 36]
  = [128; 1; 659255187; 2545671939; 273833770368].
Proof. vm_compute. reflexivity. Qed.


Example t_0298 :
  cruDataFillTr32_fun [216; 103]
  = [128; 1; 3628049933; 1017318001; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0299 :
  cruDataFillTr32_fun [88; 242]
  = [128; 1; 1481260078; 2424468582; 267349147904].
Proof. vm_compute. reflexivity. Qed.


Example t_0300 :
  cruDataFillTr32_fun [108; 11]
  = [128; 1; 1819771533; 1078679137; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0301 :
  cruDataFillTr32_fun [91; 4]
  = [128; 1; 1532978023; 1263489879; 282456866688].
Proof. vm_compute. reflexivity. Qed.


Example t_0302 :
  cruDataFillTr32_fun [54; 181]
  = [128; 1; 921411669; 1645726849; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0303 :
  cruDataFillTr32_fun [44; 109]
  = [128; 1; 748226163; 2028294847; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0304 :
  cruDataFillTr32_fun [159; 66]
  = [128; 1; 2682332005; 2547587933; 282373111936].
Proof. vm_compute. reflexivity. Qed.


Example t_0305 :
  cruDataFillTr32_fun [104; 93]
  = [128; 1; 1757749887; 4098993675; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0306 :
  cruDataFillTr32_fun [37; 100]
  = [128; 1; 629796177; 2516147649; 269521960064].
Proof. vm_compute. reflexivity. Qed.


Example t_0307 :
  cruDataFillTr32_fun [218; 165]
  = [128; 1; 3665765577; 1189842997; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0308 :
  cruDataFillTr32_fun [64; 194]
  = [128; 1; 1073923206; 955956350; 267349147904].
Proof. vm_compute. reflexivity. Qed.


Example t_0309 :
  cruDataFillTr32_fun [101; 105]
  = [128; 1; 1708013472; 3240793084; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0310 :
  cruDataFillTr32_fun [47; 84]
  = [128; 1; 797169451; 3744696283; 290946269568].
Proof. vm_compute. reflexivity. Qed.


Example t_0311 :
  cruDataFillTr32_fun [155; 105]
  = [128; 1; 2600758742; 4150315314; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0312 :
  cruDataFillTr32_fun [254; 11]
  = [128; 1; 4262007839; 3537758451; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0313 :
  cruDataFillTr32_fun [187; 160]
  = [128; 1; 3143367579; 1004239643; 265446862208].
Proof. vm_compute. reflexivity. Qed.


Example t_0314 :
  cruDataFillTr32_fun [189; 149]
  = [128; 1; 3176327036; 1778291496; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0315 :
  cruDataFillTr32_fun [87; 61]
  = [128; 1; 1469370638; 1671486746; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0316 :
  cruDataFillTr32_fun [213; 44]
  = [128; 1; 3573624153; 626097577; 269454852224].
Proof. vm_compute. reflexivity. Qed.


Example t_0317 :
  cruDataFillTr32_fun [159; 210]
  = [128; 1; 2675000085; 1462369229; 282373111936].
Proof. vm_compute. reflexivity. Qed.


Example t_0318 :
  cruDataFillTr32_fun [7; 198]
  = [128; 1; 130913113; 4021648193; 282406665856].
Proof. vm_compute. reflexivity. Qed.


Example t_0319 :
  cruDataFillTr32_fun [10; 249]
  = [128; 1; 168033525; 639571985; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0320 :
  cruDataFillTr32_fun [108; 122]
  = [128; 1; 1827037402; 2231269618; 275972505344].
Proof. vm_compute. reflexivity. Qed.


Example t_0321 :
  cruDataFillTr32_fun [133; 103]
  = [128; 1; 2246857658; 3914381086; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0322 :
  cruDataFillTr32_fun [69; 251]
  = [128; 1; 1161837366; 1498697546; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0323 :
  cruDataFillTr32_fun [245; 82]
  = [128; 1; 4115110379; 2919190947; 278128410496].
Proof. vm_compute. reflexivity. Qed.


Example t_0324 :
  cruDataFillTr32_fun [37; 20]
  = [128; 1; 624512353; 3588881681; 269521960064].
Proof. vm_compute. reflexivity. Qed.


Example t_0325 :
  cruDataFillTr32_fun [12; 80]
  = [128; 1; 207400188; 3424414908; 232973028864].
Proof. vm_compute. reflexivity. Qed.


Example t_0326 :
  cruDataFillTr32_fun [134; 183]
  = [128; 1; 2252207275; 2858490063; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0327 :
  cruDataFillTr32_fun [58; 142]
  = [128; 1; 986207972; 42999468; 271627403264].
Proof. vm_compute. reflexivity. Qed.


Example t_0328 :
  cruDataFillTr32_fun [219; 155]
  = [128; 1; 3681948076; 1862968640; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0329 :
  cruDataFillTr32_fun [101; 130]
  = [128; 1; 1709664747; 1574920675; 278128410496].
Proof. vm_compute. reflexivity. Qed.


Example t_0330 :
  cruDataFillTr32_fun [68; 54]
  = [128; 1; 1148891366; 1822611470; 275938951424].
Proof. vm_compute. reflexivity. Qed.


Example t_0331 :
  cruDataFillTr32_fun [212; 173]
  = [128; 1; 3565235931; 550337063; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0332 :
  cruDataFillTr32_fun [253; 41]
  = [128; 1; 4247146360; 1501735892; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0333 :
  cruDataFillTr32_fun [115; 13]
  = [128; 1; 1937804698; 1061968230; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0334 :
  cruDataFillTr32_fun [168; 87]
  = [128; 1; 2835306157; 1285814865; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0335 :
  cruDataFillTr32_fun [168; 3]
  = [128; 1; 2829823665; 2627707557; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0336 :
  cruDataFillTr32_fun [30; 83]
  = [128; 1; 510772247; 3525671115; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0337 :
  cruDataFillTr32_fun [99; 225]
  = [128; 1; 1665410310; 3753943426; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0338 :
  cruDataFillTr32_fun [46; 224]
  = [128; 1; 772730574; 2928569934; 236883232512].
Proof. vm_compute. reflexivity. Qed.


Example t_0339 :
  cruDataFillTr32_fun [35; 1]
  = [128; 1; 589571366; 522199330; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0340 :
  cruDataFillTr32_fun [163; 106]
  = [128; 1; 2735568865; 4217753401; 273816862336].
Proof. vm_compute. reflexivity. Qed.


Example t_0341 :
  cruDataFillTr32_fun [149; 135]
  = [128; 1; 2501681962; 2030077710; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0342 :
  cruDataFillTr32_fun [150; 94]
  = [128; 1; 2532594352; 511498808; 280250760704].
Proof. vm_compute. reflexivity. Qed.


Example t_0343 :
  cruDataFillTr32_fun [88; 110]
  = [128; 1; 1489384610; 2685304042; 267382701824].
Proof. vm_compute. reflexivity. Qed.


Example t_0344 :
  cruDataFillTr32_fun [74; 125]
  = [128; 1; 1254573249; 1456689357; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0345 :
  cruDataFillTr32_fun [151; 184]
  = [128; 1; 2538538943; 3077515231; 290979563392].
Proof. vm_compute. reflexivity. Qed.


Example t_0346 :
  cruDataFillTr32_fun [223; 208]
  = [128; 1; 3752820559; 2674867983; 273935218560].
Proof. vm_compute. reflexivity. Qed.


Example t_0347 :
  cruDataFillTr32_fun [123; 236]
  = [128; 1; 2070369087; 3417809807; 282389758848].
Proof. vm_compute. reflexivity. Qed.


Example t_0348 :
  cruDataFillTr32_fun [101; 134]
  = [128; 1; 1709928951; 1305696735; 278094856576].
Proof. vm_compute. reflexivity. Qed.


Example t_0349 :
  cruDataFillTr32_fun [29; 178]
  = [128; 1; 500138291; 1426569579; 278128410496].
Proof. vm_compute. reflexivity. Qed.


Example t_0350 :
  cruDataFillTr32_fun [114; 114]
  = [128; 1; 1927567048; 2853998080; 271660957184].
Proof. vm_compute. reflexivity. Qed.


Example t_0351 :
  cruDataFillTr32_fun [164; 56]
  = [128; 1; 2765886540; 3304862828; 250286849536].
Proof. vm_compute. reflexivity. Qed.


Example t_0352 :
  cruDataFillTr32_fun [90; 214]
  = [128; 1; 1513096924; 47754884; 271627403264].
Proof. vm_compute. reflexivity. Qed.


Example t_0353 :
  cruDataFillTr32_fun [82; 232]
  = [128; 1; 1379541514; 2996470378; 280334253312].
Proof. vm_compute. reflexivity. Qed.


Example t_0354 :
  cruDataFillTr32_fun [34; 39]
  = [128; 1; 575238295; 2259539195; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0355 :
  cruDataFillTr32_fun [37; 62]
  = [128; 1; 627286495; 762030567; 278094856576].
Proof. vm_compute. reflexivity. Qed.


Example t_0356 :
  cruDataFillTr32_fun [153; 6]
  = [128; 1; 2577376683; 2173144467; 269538606976].
Proof. vm_compute. reflexivity. Qed.


Example t_0357 :
  cruDataFillTr32_fun [106; 241]
  = [128; 1; 1784368189; 2794948729; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0358 :
  cruDataFillTr32_fun [13; 132]
  = [128; 1; 227612057; 4253091209; 286634459264].
Proof. vm_compute. reflexivity. Qed.


Example t_0359 :
  cruDataFillTr32_fun [225; 102]
  = [128; 1; 3779570963; 1236211067; 269538606976].
Proof. vm_compute. reflexivity. Qed.


Example t_0360 :
  cruDataFillTr32_fun [245; 91]
  = [128; 1; 4115704582; 2313437082; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0361 :
  cruDataFillTr32_fun [193; 196]
  = [128; 1; 3246737677; 2977249789; 260898341504].
Proof. vm_compute. reflexivity. Qed.


Example t_0362 :
  cruDataFillTr32_fun [21; 68]
  = [128; 1; 358194657; 88706513; 269521960064].
Proof. vm_compute. reflexivity. Qed.


Example t_0363 :
  cruDataFillTr32_fun [198; 111]
  = [128; 1; 3325404179; 175761495; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0364 :
  cruDataFillTr32_fun [108; 62]
  = [128; 1; 1823139878; 1957883950; 275938951424].
Proof. vm_compute. reflexivity. Qed.


Example t_0365 :
  cruDataFillTr32_fun [84; 27]
  = [128; 1; 1416596133; 3892518457; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0366 :
  cruDataFillTr32_fun [199; 192]
  = [128; 1; 3347531527; 3347531527; 428484035456].
Proof. vm_compute. reflexivity. Qed.


Example t_0367 :
  cruDataFillTr32_fun [246; 159]
  = [128; 1; 4136973523; 2048505943; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0368 :
  cruDataFillTr32_fun [1; 107]
  = [128; 1; 23910210; 1438657430; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0369 :
  cruDataFillTr32_fun [192; 152]
  = [128; 1; 3227054216; 1626902568; 241663228928].
Proof. vm_compute. reflexivity. Qed.


Example t_0370 :
  cruDataFillTr32_fun [195; 111]
  = [128; 1; 3274875152; 125232468; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0371 :
  cruDataFillTr32_fun [67; 47]
  = [128; 1; 1131586000; 2276910356; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0372 :
  cruDataFillTr32_fun [176; 245]
  = [128; 1; 2963643023; 3704735419; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0373 :
  cruDataFillTr32_fun [164; 155]
  = [128; 1; 2755648117; 953380361; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0374 :
  cruDataFillTr32_fun [191; 169]
  = [128; 1; 3211268538; 465857814; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0375 :
  cruDataFillTr32_fun [65; 138]
  = [128; 1; 1103844831; 430124471; 269505053056].
Proof. vm_compute. reflexivity. Qed.


Example t_0376 :
  cruDataFillTr32_fun [72; 43]
  = [128; 1; 1215536841; 2630349341; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0377 :
  cruDataFillTr32_fun [108; 253]
  = [128; 1; 1818846819; 2020962927; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0378 :
  cruDataFillTr32_fun [57; 145]
  = [128; 1; 969563116; 4119205800; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0379 :
  cruDataFillTr32_fun [149; 23]
  = [128; 1; 2511127514; 961570686; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0380 :
  cruDataFillTr32_fun [54; 31]
  = [128; 1; 911570067; 3134846999; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0381 :
  cruDataFillTr32_fun [139; 20]
  = [128; 1; 2342499271; 995058551; 282456866688].
Proof. vm_compute. reflexivity. Qed.


Example t_0382 :
  cruDataFillTr32_fun [193; 24]
  = [128; 1; 3252285705; 1635357097; 243819134080].
Proof. vm_compute. reflexivity. Qed.


Example t_0383 :
  cruDataFillTr32_fun [87; 224]
  = [128; 1; 1463228407; 3619133303; 325271149440].
Proof. vm_compute. reflexivity. Qed.


Example t_0384 :
  cruDataFillTr32_fun [212; 147]
  = [128; 1; 3563584141; 2283515457; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0385 :
  cruDataFillTr32_fun [13; 216]
  = [128; 1; 233160085; 2911198517; 269421560448].
Proof. vm_compute. reflexivity. Qed.


Example t_0386 :
  cruDataFillTr32_fun [0; 166]
  = [128; 1; 10898674; 1745794138; 267382701824].
Proof. vm_compute. reflexivity. Qed.


Example t_0387 :
  cruDataFillTr32_fun [58; 184]
  = [128; 1; 988981858; 1511180930; 297447274752].
Proof. vm_compute. reflexivity. Qed.


Example t_0388 :
  cruDataFillTr32_fun [240; 98]
  = [128; 1; 4031951894; 1758080142; 267349147904].
Proof. vm_compute. reflexivity. Qed.


Example t_0389 :
  cruDataFillTr32_fun [246; 28]
  = [128; 1; 4128386634; 2258812634; 271610757376].
Proof. vm_compute. reflexivity. Qed.


Example t_0390 :
  cruDataFillTr32_fun [95; 151]
  = [128; 1; 1609993508; 60436936; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0391 :
  cruDataFillTr32_fun [223; 123]
  = [128; 1; 3747272016; 4084132196; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0392 :
  cruDataFillTr32_fun [248; 73]
  = [128; 1; 4165044947; 3558696623; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0393 :
  cruDataFillTr32_fun [102; 139]
  = [128; 1; 1727101959; 986009819; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0394 :
  cruDataFillTr32_fun [222; 2]
  = [128; 1; 3739280100; 3604536028; 280217206784].
Proof. vm_compute. reflexivity. Qed.


Example t_0395 :
  cruDataFillTr32_fun [28; 189]
  = [128; 1; 484021843; 686137951; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0396 :
  cruDataFillTr32_fun [203; 64]
  = [128; 1; 3406515083; 3406515083; 436033930624].
Proof. vm_compute. reflexivity. Qed.


Example t_0397 :
  cruDataFillTr32_fun [38; 20]
  = [128; 1; 641355362; 3605724690; 271677865216].
Proof. vm_compute. reflexivity. Qed.


Example t_0398 :
  cruDataFillTr32_fun [127; 193]
  = [128; 1; 2134901186; 2067594686; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0399 :
  cruDataFillTr32_fun [204; 43]
  = [128; 1; 3438748237; 541816481; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0400 :
  cruDataFillTr32_fun [75; 60]
  = [128; 1; 1267188735; 1536676623; 282389758848].
Proof. vm_compute. reflexivity. Qed.


Example t_0401 :
  cruDataFillTr32_fun [166; 7]
  = [128; 1; 2796401851; 2324797599; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0402 :
  cruDataFillTr32_fun [164; 238]
  = [128; 1; 2761064558; 3973761206; 275938951424].
Proof. vm_compute. reflexivity. Qed.


Example t_0403 :
  cruDataFillTr32_fun [230; 222]
  = [128; 1; 3871646336; 1850485256; 280250760704].
Proof. vm_compute. reflexivity. Qed.


Example t_0404 :
  cruDataFillTr32_fun [232; 133]
  = [128; 1; 3899519607; 3562659427; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0405 :
  cruDataFillTr32_fun [228; 13]
  = [128; 1; 3841064459; 2965228247; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0406 :
  cruDataFillTr32_fun [127; 163]
  = [128; 1; 2132985192; 4086708700; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0407 :
  cruDataFillTr32_fun [195; 245]
  = [128; 1; 3283660194; 4024752590; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0408 :
  cruDataFillTr32_fun [35; 134]
  = [128; 1; 598290357; 194058141; 273783308416].
Proof. vm_compute. reflexivity. Qed.


Example t_0409 :
  cruDataFillTr32_fun [110; 182]
  = [128; 1; 1847909008; 2521563832; 280250760704].
Proof. vm_compute. reflexivity. Qed.


Example t_0410 :
  cruDataFillTr32_fun [187; 53]
  = [128; 1; 3153077594; 3877392774; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0411 :
  cruDataFillTr32_fun [46; 75]
  = [128; 1; 779731983; 38639843; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0412 :
  cruDataFillTr32_fun [100; 134]
  = [128; 1; 1693085942; 1288853726; 275938951424].
Proof. vm_compute. reflexivity. Qed.


Example t_0413 :
  cruDataFillTr32_fun [118; 80]
  = [128; 1; 1992693350; 914806310; 322982068992].
Proof. vm_compute. reflexivity. Qed.


Example t_0414 :
  cruDataFillTr32_fun [107; 243]
  = [128; 1; 1801343300; 2677179768; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0415 :
  cruDataFillTr32_fun [109; 123]
  = [128; 1; 1843946462; 2180806642; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0416 :
  cruDataFillTr32_fun [61; 110]
  = [128; 1; 1034623367; 2247320015; 278094856576].
Proof. vm_compute. reflexivity. Qed.


Example t_0417 :
  cruDataFillTr32_fun [213; 196]
  = [128; 1; 3583597857; 3314109713; 269521960064].
Proof. vm_compute. reflexivity. Qed.


Example t_0418 :
  cruDataFillTr32_fun [184; 27]
  = [128; 1; 3100896777; 1281852061; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0419 :
  cruDataFillTr32_fun [156; 8]
  = [128; 1; 2628037812; 2089061524; 301624869376].
Proof. vm_compute. reflexivity. Qed.


Example t_0420 :
  cruDataFillTr32_fun [251; 227]
  = [128; 1; 4225679780; 1867658520; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0421 :
  cruDataFillTr32_fun [176; 199]
  = [128; 1; 2960604677; 2489000681; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0422 :
  cruDataFillTr32_fun [51; 159]
  = [128; 1; 869429520; 3075929492; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0423 :
  cruDataFillTr32_fun [29; 215]
  = [128; 1; 502582178; 3247992646; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0424 :
  cruDataFillTr32_fun [56; 254]
  = [128; 1; 943076402; 1077820474; 267382701824].
Proof. vm_compute. reflexivity. Qed.


Example t_0425 :
  cruDataFillTr32_fun [49; 151]
  = [128; 1; 835215350; 3580625818; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0426 :
  cruDataFillTr32_fun [129; 182]
  = [128; 1; 2167926179; 2841581003; 269538606976].
Proof. vm_compute. reflexivity. Qed.


Example t_0427 :
  cruDataFillTr32_fun [204; 250]
  = [128; 1; 3435577530; 3839809746; 275972505344].
Proof. vm_compute. reflexivity. Qed.


Example t_0428 :
  cruDataFillTr32_fun [14; 130]
  = [128; 1; 244322964; 109578892; 280217206784].
Proof. vm_compute. reflexivity. Qed.


Example t_0429 :
  cruDataFillTr32_fun [112; 75]
  = [128; 1; 1891305041; 1150278181; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0430 :
  cruDataFillTr32_fun [91; 242]
  = [128; 1; 1531789105; 2474997609; 273816862336].
Proof. vm_compute. reflexivity. Qed.


Example t_0431 :
  cruDataFillTr32_fun [102; 205]
  = [128; 1; 1714618573; 855624857; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0432 :
  cruDataFillTr32_fun [72; 253]
  = [128; 1; 1212498495; 1414614603; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0433 :
  cruDataFillTr32_fun [84; 153]
  = [128; 1; 1424852511; 4035519163; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0434 :
  cruDataFillTr32_fun [106; 43]
  = [128; 1; 1788199147; 3202946111; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0435 :
  cruDataFillTr32_fun [121; 50]
  = [128; 1; 2041306383; 2984449351; 269505053056].
Proof. vm_compute. reflexivity. Qed.


Example t_0436 :
  cruDataFillTr32_fun [19; 3]
  = [128; 1; 320215324; 118099216; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0437 :
  cruDataFillTr32_fun [208; 4]
  = [128; 1; 3503610076; 3234121932; 258742436352].
Proof. vm_compute. reflexivity. Qed.


Example t_0438 :
  cruDataFillTr32_fun [62; 39]
  = [128; 1; 1046842547; 2731143191; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0439 :
  cruDataFillTr32_fun [198; 25]
  = [128; 1; 3336566801; 1652266157; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0440 :
  cruDataFillTr32_fun [161; 179]
  = [128; 1; 2706638778; 3582475246; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0441 :
  cruDataFillTr32_fun [108; 56]
  = [128; 1; 1822743572; 2361719860; 267265655296].
Proof. vm_compute. reflexivity. Qed.


Example t_0442 :
  cruDataFillTr32_fun [28; 48]
  = [128; 1; 474774700; 1552727276; 267199071744].
Proof. vm_compute. reflexivity. Qed.


Example t_0443 :
  cruDataFillTr32_fun [231; 125]
  = [128; 1; 3882148190; 4084264298; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0444 :
  cruDataFillTr32_fun [104; 158]
  = [128; 1; 1745265730; 4035849418; 267382701824].
Proof. vm_compute. reflexivity. Qed.


Example t_0445 :
  cruDataFillTr32_fun [169; 173]
  = [128; 1; 2840986544; 4121055228; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0446 :
  cruDataFillTr32_fun [170; 122]
  = [128; 1; 2854526488; 3258758704; 271660957184].
Proof. vm_compute. reflexivity. Qed.


Example t_0447 :
  cruDataFillTr32_fun [77; 254]
  = [128; 1; 1296779591; 1431523663; 278094856576].
Proof. vm_compute. reflexivity. Qed.


Example t_0448 :
  cruDataFillTr32_fun [3; 44]
  = [128; 1; 53435271; 1400875991; 265277259648].
Proof. vm_compute. reflexivity. Qed.


Example t_0449 :
  cruDataFillTr32_fun [90; 188]
  = [128; 1; 1511445134; 1780933278; 280233853696].
Proof. vm_compute. reflexivity. Qed.


Example t_0450 :
  cruDataFillTr32_fun [219; 125]
  = [128; 1; 3680032082; 3882148190; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0451 :
  cruDataFillTr32_fun [159; 238]
  = [128; 1; 2676849513; 3889546161; 282406665856].
Proof. vm_compute. reflexivity. Qed.


Example t_0452 :
  cruDataFillTr32_fun [254; 224]
  = [128; 1; 4276010654; 2120105502; 409351433984].
Proof. vm_compute. reflexivity. Qed.


Example t_0453 :
  cruDataFillTr32_fun [241; 139]
  = [128; 1; 4051437458; 3310410598; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0454 :
  cruDataFillTr32_fun [244; 218]
  = [128; 1; 4107184258; 2355511322; 275972505344].
Proof. vm_compute. reflexivity. Qed.


Example t_0455 :
  cruDataFillTr32_fun [215; 113]
  = [128; 1; 3611867434; 327480678; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0456 :
  cruDataFillTr32_fun [171; 80]
  = [128; 1; 2885372827; 1807420251; 299803983232].
Proof. vm_compute. reflexivity. Qed.


Example t_0457 :
  cruDataFillTr32_fun [51; 210]
  = [128; 1; 856020905; 3955068769; 273816862336].
Proof. vm_compute. reflexivity. Qed.


Example t_0458 :
  cruDataFillTr32_fun [166; 93]
  = [128; 1; 2785239229; 848292937; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0459 :
  cruDataFillTr32_fun [247; 54]
  = [128; 1; 4146946969; 525700033; 282406665856].
Proof. vm_compute. reflexivity. Qed.


Example t_0460 :
  cruDataFillTr32_fun [204; 230]
  = [128; 1; 3434256510; 874119398; 275938951424].
Proof. vm_compute. reflexivity. Qed.


Example t_0461 :
  cruDataFillTr32_fun [98; 127]
  = [128; 1; 1658937567; 1726309603; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0462 :
  cruDataFillTr32_fun [72; 129]
  = [128; 1; 1221151435; 1153779399; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0463 :
  cruDataFillTr32_fun [93; 165]
  = [128; 1; 1560454988; 3379434424; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0464 :
  cruDataFillTr32_fun [140; 55]
  = [128; 1; 2361653809; 2967936597; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0465 :
  cruDataFillTr32_fun [70; 7]
  = [128; 1; 1179472987; 707868735; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0466 :
  cruDataFillTr32_fun [199; 122]
  = [128; 1; 3342973749; 3747205965; 282373111936].
Proof. vm_compute. reflexivity. Qed.


Example t_0467 :
  cruDataFillTr32_fun [141; 173]
  = [128; 1; 2369447828; 3649450976; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0468 :
  cruDataFillTr32_fun [73; 207]
  = [128; 1; 1226368950; 232565626; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0469 :
  cruDataFillTr32_fun [52; 156]
  = [128; 1; 886074376; 3294690456; 267298947072].
Proof. vm_compute. reflexivity. Qed.


Example t_0470 :
  cruDataFillTr32_fun [59; 12]
  = [128; 1; 994530143; 186065711; 282389758848].
Proof. vm_compute. reflexivity. Qed.


Example t_0471 :
  cruDataFillTr32_fun [134; 109]
  = [128; 1; 2264096973; 3527388185; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0472 :
  cruDataFillTr32_fun [147; 77]
  = [128; 1; 2480942458; 1605171526; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0473 :
  cruDataFillTr32_fun [173; 161]
  = [128; 1; 2907631504; 701131532; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0474 :
  cruDataFillTr32_fun [223; 65]
  = [128; 1; 3743441314; 3676069278; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0475 :
  cruDataFillTr32_fun [2; 105]
  = [128; 1; 40621117; 1590112409; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0476 :
  cruDataFillTr32_fun [126; 223]
  = [128; 1; 2120039451; 48349343; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0477 :
  cruDataFillTr32_fun [146; 23]
  = [128; 1; 2460598487; 911041659; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0478 :
  cruDataFillTr32_fun [99; 68]
  = [128; 1; 1671949103; 1402460959; 265210151808].
Proof. vm_compute. reflexivity. Qed.


Example t_0479 :
  cruDataFillTr32_fun [95; 205]
  = [128; 1; 1596783046; 737723794; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0480 :
  cruDataFillTr32_fun [21; 230]
  = [128; 1; 368828871; 2103658799; 278094856576].
Proof. vm_compute. reflexivity. Qed.


Example t_0481 :
  cruDataFillTr32_fun [175; 113]
  = [128; 1; 2938147074; 3948727614; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0482 :
  cruDataFillTr32_fun [50; 236]
  = [128; 1; 840829686; 2188270150; 263121354496].
Proof. vm_compute. reflexivity. Qed.


Example t_0483 :
  cruDataFillTr32_fun [249; 107]
  = [128; 1; 4184133434; 1303913358; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0484 :
  cruDataFillTr32_fun [85; 162]
  = [128; 1; 1442289979; 3446608307; 278128410496].
Proof. vm_compute. reflexivity. Qed.


Example t_0485 :
  cruDataFillTr32_fun [200; 199]
  = [128; 1; 3364836893; 2893232641; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0486 :
  cruDataFillTr32_fun [85; 45]
  = [128; 1; 1434628060; 2714696488; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0487 :
  cruDataFillTr32_fun [34; 95]
  = [128; 1; 578936895; 2785371331; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0488 :
  cruDataFillTr32_fun [37; 48]
  = [128; 1; 626361781; 1704314357; 286600120960].
Proof. vm_compute. reflexivity. Qed.


Example t_0489 :
  cruDataFillTr32_fun [20; 89]
  = [128; 1; 342738463; 2953405115; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0490 :
  cruDataFillTr32_fun [137; 91]
  = [128; 1; 2313437082; 494457646; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0491 :
  cruDataFillTr32_fun [172; 249]
  = [128; 1; 2896535191; 3368139443; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0492 :
  cruDataFillTr32_fun [210; 244]
  = [128; 1; 3536239278; 49736414; 263054246656].
Proof. vm_compute. reflexivity. Qed.


Example t_0493 :
  cruDataFillTr32_fun [241; 228]
  = [128; 1; 4057315741; 1631922445; 260898341504].
Proof. vm_compute. reflexivity. Qed.


Example t_0494 :
  cruDataFillTr32_fun [116; 233]
  = [128; 1; 1952269871; 3501826699; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0495 :
  cruDataFillTr32_fun [94; 146]
  = [128; 1; 1592820244; 380123852; 280217206784].
Proof. vm_compute. reflexivity. Qed.


Example t_0496 :
  cruDataFillTr32_fun [164; 254]
  = [128; 1; 2762121374; 2896865446; 275938951424].
Proof. vm_compute. reflexivity. Qed.


Example t_0497 :
  cruDataFillTr32_fun [53; 128]
  = [128; 1; 901068213; 901068213; 115336731264].
Proof. vm_compute. reflexivity. Qed.


Example t_0498 :
  cruDataFillTr32_fun [25; 211]
  = [128; 1; 434945938; 3449844550; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0499 :
  cruDataFillTr32_fun [85; 9]
  = [128; 1; 1432250224; 825901900; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0500 :
  cruDataFillTr32_fun [66; 47]
  = [128; 1; 1114742991; 2260067347; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0501 :
  cruDataFillTr32_fun [88; 48]
  = [128; 1; 1485355240; 2563307560; 258575451136].
Proof. vm_compute. reflexivity. Qed.


Example t_0502 :
  cruDataFillTr32_fun [197; 234]
  = [128; 1; 3316619651; 487059931; 278128410496].
Proof. vm_compute. reflexivity. Qed.


Example t_0503 :
  cruDataFillTr32_fun [165; 221]
  = [128; 1; 2776784700; 823061448; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0504 :
  cruDataFillTr32_fun [12; 149]
  = [128; 1; 211891915; 3092111991; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0505 :
  cruDataFillTr32_fun [190; 145]
  = [128; 1; 3192905841; 2047581229; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0506 :
  cruDataFillTr32_fun [178; 105]
  = [128; 1; 2988147949; 242737225; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0507 :
  cruDataFillTr32_fun [39; 147]
  = [128; 1; 666521056; 3681419668; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0508 :
  cruDataFillTr32_fun [32; 226]
  = [128; 1; 537060550; 2558155838; 267349147904].
Proof. vm_compute. reflexivity. Qed.


Example t_0509 :
  cruDataFillTr32_fun [145; 142]
  = [128; 1; 2434772283; 1508340995; 269538606976].
Proof. vm_compute. reflexivity. Qed.


Example t_0510 :
  cruDataFillTr32_fun [212; 135]
  = [128; 1; 3562791529; 3091187277; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0511 :
  cruDataFillTr32_fun [5; 28]
  = [128; 1; 86064473; 2511457769; 269454852224].
Proof. vm_compute. reflexivity. Qed.


Example t_0512 :
  cruDataFillTr32_fun [44; 66]
  = [128; 1; 745451762; 610707690; 275972505344].
Proof. vm_compute. reflexivity. Qed.


Example t_0513 :
  cruDataFillTr32_fun [0; 127]
  = [128; 1; 8388221; 75694721; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0514 :
  cruDataFillTr32_fun [157; 49]
  = [128; 1; 2647588656; 3641326444; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0515 :
  cruDataFillTr32_fun [206; 153]
  = [128; 1; 3462856857; 1778621493; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0516 :
  cruDataFillTr32_fun [122; 209]
  = [128; 1; 2051742957; 906483881; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0517 :
  cruDataFillTr32_fun [160; 157]
  = [128; 1; 2688408183; 751396355; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0518 :
  cruDataFillTr32_fun [94; 206]
  = [128; 1; 1580006088; 653574800; 280250760704].
Proof. vm_compute. reflexivity. Qed.


Example t_0519 :
  cruDataFillTr32_fun [234; 21]
  = [128; 1; 3942585385; 2527838421; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0520 :
  cruDataFillTr32_fun [165; 211]
  = [128; 1; 2776124190; 1496121298; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0521 :
  cruDataFillTr32_fun [142; 183]
  = [128; 1; 2386951347; 2993234135; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0522 :
  cruDataFillTr32_fun [11; 216]
  = [128; 1; 199474067; 2877512499; 265109750144].
Proof. vm_compute. reflexivity. Qed.


Example t_0523 :
  cruDataFillTr32_fun [219; 127]
  = [128; 1; 3680164184; 3747536220; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0524 :
  cruDataFillTr32_fun [33; 212]
  = [128; 1; 569756061; 3517282637; 260898341504].
Proof. vm_compute. reflexivity. Qed.


Example t_0525 :
  cruDataFillTr32_fun [143; 56]
  = [128; 1; 2412248887; 2951159639; 273733370752].
Proof. vm_compute. reflexivity. Qed.


Example t_0526 :
  cruDataFillTr32_fun [244; 210]
  = [128; 1; 4106655850; 2893959202; 275972505344].
Proof. vm_compute. reflexivity. Qed.


Example t_0527 :
  cruDataFillTr32_fun [158; 15]
  = [128; 1; 2662186187; 1651605647; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0528 :
  cruDataFillTr32_fun [30; 205]
  = [128; 1; 518764677; 3937895505; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0529 :
  cruDataFillTr32_fun [200; 132]
  = [128; 1; 3360477268; 3090989124; 275989151232].
Proof. vm_compute. reflexivity. Qed.


Example t_0530 :
  cruDataFillTr32_fun [141; 13]
  = [128; 1; 2375722932; 1499886464; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0531 :
  cruDataFillTr32_fun [157; 245]
  = [128; 1; 2643625852; 3384718248; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0532 :
  cruDataFillTr32_fun [101; 74]
  = [128; 1; 1706031427; 1032311067; 278128410496].
Proof. vm_compute. reflexivity. Qed.


Example t_0533 :
  cruDataFillTr32_fun [154; 83]
  = [128; 1; 2599239827; 1319236679; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0534 :
  cruDataFillTr32_fun [101; 112]
  = [128; 1; 1708475829; 2769651189; 286600120960].
Proof. vm_compute. reflexivity. Qed.


Example t_0535 :
  cruDataFillTr32_fun [238; 46]
  = [128; 1; 3994831480; 912560832; 280250760704].
Proof. vm_compute. reflexivity. Qed.


Example t_0536 :
  cruDataFillTr32_fun [25; 97]
  = [128; 1; 427481916; 2515949496; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0537 :
  cruDataFillTr32_fun [155; 194]
  = [128; 1; 2606571489; 2471827417; 273816862336].
Proof. vm_compute. reflexivity. Qed.


Example t_0538 :
  cruDataFillTr32_fun [100; 4]
  = [128; 1; 1684565104; 1415076960; 267366054912].
Proof. vm_compute. reflexivity. Qed.


Example t_0539 :
  cruDataFillTr32_fun [50; 210]
  = [128; 1; 839177896; 3938225760; 271660957184].
Proof. vm_compute. reflexivity. Qed.


Example t_0540 :
  cruDataFillTr32_fun [148; 29]
  = [128; 1; 2494680811; 540891767; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0541 :
  cruDataFillTr32_fun [228; 63]
  = [128; 1; 3827524257; 3894896293; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0542 :
  cruDataFillTr32_fun [82; 198]
  = [128; 1; 1377361572; 973129356; 271627403264].
Proof. vm_compute. reflexivity. Qed.


Example t_0543 :
  cruDataFillTr32_fun [189; 193]
  = [128; 1; 3179167488; 3111795708; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0544 :
  cruDataFillTr32_fun [120; 104]
  = [128; 1; 2027964592; 3628115984; 293001248768].
Proof. vm_compute. reflexivity. Qed.


Example t_0545 :
  cruDataFillTr32_fun [10; 181]
  = [128; 1; 180319273; 921411669; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0546 :
  cruDataFillTr32_fun [123; 183]
  = [128; 1; 2066934176; 2673216964; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0547 :
  cruDataFillTr32_fun [249; 133]
  = [128; 1; 4185785224; 3848990580; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0548 :
  cruDataFillTr32_fun [224; 180]
  = [128; 1; 3767814396; 281311276; 258742436352].
Proof. vm_compute. reflexivity. Qed.


Example t_0549 :
  cruDataFillTr32_fun [79; 203]
  = [128; 1; 1327162800; 602847620; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0550 :
  cruDataFillTr32_fun [129; 102]
  = [128; 1; 2179419571; 3914315035; 269538606976].
Proof. vm_compute. reflexivity. Qed.


Example t_0551 :
  cruDataFillTr32_fun [173; 194]
  = [128; 1; 2909745651; 2775001579; 278128410496].
Proof. vm_compute. reflexivity. Qed.


Example t_0552 :
  cruDataFillTr32_fun [89; 169]
  = [128; 1; 1493347156; 3042838448; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0553 :
  cruDataFillTr32_fun [100; 232]
  = [128; 1; 1682715676; 3299644540; 250152633856].
Proof. vm_compute. reflexivity. Qed.


Example t_0554 :
  cruDataFillTr32_fun [173; 232]
  = [128; 1; 2912255333; 234216901; 269555776128].
Proof. vm_compute. reflexivity. Qed.


Example t_0555 :
  cruDataFillTr32_fun [239; 112]
  = [128; 1; 4016033599; 798953343; 308159172480].
Proof. vm_compute. reflexivity. Qed.


Example t_0556 :
  cruDataFillTr32_fun [229; 211]
  = [128; 1; 3854076766; 2574008082; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0557 :
  cruDataFillTr32_fun [227; 75]
  = [128; 1; 3811473860; 3070381464; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0558 :
  cruDataFillTr32_fun [163; 212]
  = [128; 1; 2742504223; 1395129295; 265210151808].
Proof. vm_compute. reflexivity. Qed.


Example t_0559 :
  cruDataFillTr32_fun [103; 194]
  = [128; 1; 1730800557; 1596056485; 282373111936].
Proof. vm_compute. reflexivity. Qed.


Example t_0560 :
  cruDataFillTr32_fun [5; 103]
  = [128; 1; 91018042; 1775253406; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0561 :
  cruDataFillTr32_fun [200; 6]
  = [128; 1; 3368998106; 2964765890; 267382701824].
Proof. vm_compute. reflexivity. Qed.


Example t_0562 :
  cruDataFillTr32_fun [150; 169]
  = [128; 1; 2520770705; 4070261997; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0563 :
  cruDataFillTr32_fun [171; 67]
  = [128; 1; 2884514164; 2682398056; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0564 :
  cruDataFillTr32_fun [36; 27]
  = [128; 1; 608131701; 3100896777; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0565 :
  cruDataFillTr32_fun [212; 177]
  = [128; 1; 3565500135; 281113123; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0566 :
  cruDataFillTr32_fun [106; 96]
  = [128; 1; 1791634058; 3930761738; 366233330944].
Proof. vm_compute. reflexivity. Qed.


Example t_0567 :
  cruDataFillTr32_fun [7; 82]
  = [128; 1; 123317245; 3205587893; 282373111936].
Proof. vm_compute. reflexivity. Qed.


Example t_0568 :
  cruDataFillTr32_fun [110; 139]
  = [128; 1; 1861846031; 1120753891; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0569 :
  cruDataFillTr32_fun [69; 242]
  = [128; 1; 1161242907; 2104451411; 278128410496].
Proof. vm_compute. reflexivity. Qed.


Example t_0570 :
  cruDataFillTr32_fun [143; 192]
  = [128; 1; 2404323279; 2404323279; 307753379712].
Proof. vm_compute. reflexivity. Qed.


Example t_0571 :
  cruDataFillTr32_fun [84; 158]
  = [128; 1; 1425182766; 3698989238; 275938951424].
Proof. vm_compute. reflexivity. Qed.


Example t_0572 :
  cruDataFillTr32_fun [91; 217]
  = [128; 1; 1530138086; 4157647234; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0573 :
  cruDataFillTr32_fun [214; 82]
  = [128; 1; 3592977100; 2397057668; 280217206784].
Proof. vm_compute. reflexivity. Qed.


Example t_0574 :
  cruDataFillTr32_fun [65; 207]
  = [128; 1; 1091624878; 97821554; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0575 :
  cruDataFillTr32_fun [140; 238]
  = [128; 1; 2356832342; 3569528990; 275938951424].
Proof. vm_compute. reflexivity. Qed.


Example t_0576 :
  cruDataFillTr32_fun [249; 3]
  = [128; 1; 4194107138; 3991991286; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0577 :
  cruDataFillTr32_fun [143; 113]
  = [128; 1; 2399171042; 3409751326; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0578 :
  cruDataFillTr32_fun [224; 197]
  = [128; 1; 3768937007; 3432076827; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0579 :
  cruDataFillTr32_fun [46; 30]
  = [128; 1; 776759944; 3067408912; 280250760704].
Proof. vm_compute. reflexivity. Qed.


Example t_0580 :
  cruDataFillTr32_fun [152; 85]
  = [128; 1; 2565685911; 1150938691; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0581 :
  cruDataFillTr32_fun [32; 200]
  = [128; 1; 552120440; 13144152; 241529013248].
Proof. vm_compute. reflexivity. Qed.


Example t_0582 :
  cruDataFillTr32_fun [112; 24]
  = [128; 1; 1888002232; 271073368; 275888227328].
Proof. vm_compute. reflexivity. Qed.


Example t_0583 :
  cruDataFillTr32_fun [55; 114]
  = [128; 1; 933829517; 1877038021; 282373111936].
Proof. vm_compute. reflexivity. Qed.


Example t_0584 :
  cruDataFillTr32_fun [251; 200]
  = [128; 1; 4223896403; 3684920115; 299468964224].
Proof. vm_compute. reflexivity. Qed.


Example t_0585 :
  cruDataFillTr32_fun [59; 252]
  = [128; 1; 993473327; 1262961471; 282389758848].
Proof. vm_compute. reflexivity. Qed.


Example t_0586 :
  cruDataFillTr32_fun [28; 51]
  = [128; 1; 474972853; 1350809321; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0587 :
  cruDataFillTr32_fun [13; 39]
  = [128; 1; 221535106; 1905836006; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0588 :
  cruDataFillTr32_fun [33; 64]
  = [128; 1; 560046561; 560046561; 71685959808].
Proof. vm_compute. reflexivity. Qed.


Example t_0589 :
  cruDataFillTr32_fun [183; 139]
  = [128; 1; 3074608472; 2333516076; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0590 :
  cruDataFillTr32_fun [110; 84]
  = [128; 1; 1858213482; 510838298; 288790364416].
Proof. vm_compute. reflexivity. Qed.


Example t_0591 :
  cruDataFillTr32_fun [38; 129]
  = [128; 1; 648489129; 581117093; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0592 :
  cruDataFillTr32_fun [15; 71]
  = [128; 1; 257334756; 4080697800; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0593 :
  cruDataFillTr32_fun [215; 160]
  = [128; 1; 3614906295; 1475843895; 325808012160].
Proof. vm_compute. reflexivity. Qed.


Example t_0594 :
  cruDataFillTr32_fun [199; 254]
  = [128; 1; 3351626689; 3486370761; 282406665856].
Proof. vm_compute. reflexivity. Qed.


Example t_0595 :
  cruDataFillTr32_fun [122; 177]
  = [128; 1; 2049694861; 3060209865; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0596 :
  cruDataFillTr32_fun [143; 126]
  = [128; 1; 2400029449; 2534773521; 282406665856].
Proof. vm_compute. reflexivity. Qed.


Example t_0597 :
  cruDataFillTr32_fun [178; 31]
  = [128; 1; 3000102927; 911570067; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0598 :
  cruDataFillTr32_fun [39; 167]
  = [128; 1; 667841820; 2335365504; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0599 :
  cruDataFillTr32_fun [44; 75]
  = [128; 1; 746045965; 4953825; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0600 :
  cruDataFillTr32_fun [10; 70]
  = [128; 1; 173053660; 4063788740; 271627403264].
Proof. vm_compute. reflexivity. Qed.


Example t_0601 :
  cruDataFillTr32_fun [217; 146]
  = [128; 1; 3647733135; 2435036487; 269505053056].
Proof. vm_compute. reflexivity. Qed.


Example t_0602 :
  cruDataFillTr32_fun [47; 142]
  = [128; 1; 800934873; 4152693665; 282406665856].
Proof. vm_compute. reflexivity. Qed.


Example t_0603 :
  cruDataFillTr32_fun [8; 93]
  = [128; 1; 140886559; 2498842283; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0604 :
  cruDataFillTr32_fun [91; 175]
  = [128; 1; 1527429480; 2672754092; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0605 :
  cruDataFillTr32_fun [148; 2]
  = [128; 1; 2492897434; 2358153362; 275972505344].
Proof. vm_compute. reflexivity. Qed.


Example t_0606 :
  cruDataFillTr32_fun [5; 254]
  = [128; 1; 84083199; 218827015; 278094856576].
Proof. vm_compute. reflexivity. Qed.


Example t_0607 :
  cruDataFillTr32_fun [7; 128]
  = [128; 1; 126289799; 126289799; 16165094272].
Proof. vm_compute. reflexivity. Qed.


Example t_0608 :
  cruDataFillTr32_fun [152; 212]
  = [128; 1; 2557231124; 1209856196; 275989151232].
Proof. vm_compute. reflexivity. Qed.


Example t_0609 :
  cruDataFillTr32_fun [186; 205]
  = [128; 1; 3129431073; 2253594861; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0610 :
  cruDataFillTr32_fun [247; 77]
  = [128; 1; 4148466142; 3272629674; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0611 :
  cruDataFillTr32_fun [87; 237]
  = [128; 1; 1464086814; 2744155498; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0612 :
  cruDataFillTr32_fun [31; 166]
  = [128; 1; 533031697; 2267927417; 282406665856].
Proof. vm_compute. reflexivity. Qed.


Example t_0613 :
  cruDataFillTr32_fun [178; 6]
  = [128; 1; 2998451908; 2594219692; 271627403264].
Proof. vm_compute. reflexivity. Qed.


Example t_0614 :
  cruDataFillTr32_fun [111; 111]
  = [128; 1; 1876839868; 3005387008; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0615 :
  cruDataFillTr32_fun [94; 146]
  = [128; 1; 1592820244; 380123852; 280217206784].
Proof. vm_compute. reflexivity. Qed.


Example t_0616 :
  cruDataFillTr32_fun [163; 53]
  = [128; 1; 2748845378; 3473160558; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0617 :
  cruDataFillTr32_fun [133; 219]
  = [128; 1; 2237676310; 435474346; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0618 :
  cruDataFillTr32_fun [8; 107]
  = [128; 1; 141811273; 1556558493; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0619 :
  cruDataFillTr32_fun [227; 175]
  = [128; 1; 3818013168; 668370228; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0620 :
  cruDataFillTr32_fun [217; 76]
  = [128; 1; 3643109821; 2851422605; 278077948544].
Proof. vm_compute. reflexivity. Qed.


Example t_0621 :
  cruDataFillTr32_fun [126; 13]
  = [128; 1; 2123077797; 1247241329; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0622 :
  cruDataFillTr32_fun [32; 163]
  = [128; 1; 549676553; 2486688381; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0623 :
  cruDataFillTr32_fun [116; 168]
  = [128; 1; 1948042348; 3564905676; 284646063616].
Proof. vm_compute. reflexivity. Qed.


Example t_0624 :
  cruDataFillTr32_fun [215; 189]
  = [128; 1; 3616821518; 3818937626; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0625 :
  cruDataFillTr32_fun [57; 164]
  = [128; 1; 970817829; 2840457621; 278145056384].
Proof. vm_compute. reflexivity. Qed.


Example t_0626 :
  cruDataFillTr32_fun [205; 162]
  = [128; 1; 3446608307; 1172801835; 278128410496].
Proof. vm_compute. reflexivity. Qed.


Example t_0627 :
  cruDataFillTr32_fun [169; 185]
  = [128; 1; 2841779156; 3313383408; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0628 :
  cruDataFillTr32_fun [26; 250]
  = [128; 1; 437521928; 841754144; 271660957184].
Proof. vm_compute. reflexivity. Qed.


Example t_0629 :
  cruDataFillTr32_fun [173; 29]
  = [128; 1; 2915755780; 961966992; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0630 :
  cruDataFillTr32_fun [166; 191]
  = [128; 1; 2791646435; 2859018471; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0631 :
  cruDataFillTr32_fun [90; 53]
  = [128; 1; 1519371513; 2260463653; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0632 :
  cruDataFillTr32_fun [167; 135]
  = [128; 1; 2804856124; 2333251872; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0633 :
  cruDataFillTr32_fun [150; 154]
  = [128; 1; 2519779940; 784884476; 280217206784].
Proof. vm_compute. reflexivity. Qed.


Example t_0634 :
  cruDataFillTr32_fun [212; 126]
  = [128; 1; 3562197070; 3696941142; 275938951424].
Proof. vm_compute. reflexivity. Qed.


Example t_0635 :
  cruDataFillTr32_fun [234; 158]
  = [128; 1; 3934791364; 1913695820; 271627403264].
Proof. vm_compute. reflexivity. Qed.


Example t_0636 :
  cruDataFillTr32_fun [63; 189]
  = [128; 1; 1073527158; 1258866050; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0637 :
  cruDataFillTr32_fun [126; 123]
  = [128; 1; 2130277615; 2450360323; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0638 :
  cruDataFillTr32_fun [94; 246]
  = [128; 1; 1582582336; 2256302696; 280250760704].
Proof. vm_compute. reflexivity. Qed.


Example t_0639 :
  cruDataFillTr32_fun [244; 114]
  = [128; 1; 4100380746; 748556418; 275972505344].
Proof. vm_compute. reflexivity. Qed.


Example t_0640 :
  cruDataFillTr32_fun [204; 184]
  = [128; 1; 3431218420; 3970194452; 267265655296].
Proof. vm_compute. reflexivity. Qed.


Example t_0641 :
  cruDataFillTr32_fun [91; 208]
  = [128; 1; 1529609163; 468433803; 265311597952].
Proof. vm_compute. reflexivity. Qed.


Example t_0642 :
  cruDataFillTr32_fun [172; 243]
  = [128; 1; 2896138885; 3771975353; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0643 :
  cruDataFillTr32_fun [218; 44]
  = [128; 1; 3657839198; 710312622; 280233853696].
Proof. vm_compute. reflexivity. Qed.


Example t_0644 :
  cruDataFillTr32_fun [253; 200]
  = [128; 1; 4257582421; 3718606133; 303780774528].
Proof. vm_compute. reflexivity. Qed.


Example t_0645 :
  cruDataFillTr32_fun [163; 187]
  = [128; 1; 2740853204; 3077713384; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0646 :
  cruDataFillTr32_fun [17; 193]
  = [128; 1; 299012948; 231640912; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0647 :
  cruDataFillTr32_fun [245; 248]
  = [128; 1; 4126008797; 353175037; 286667753088].
Proof. vm_compute. reflexivity. Qed.


Example t_0648 :
  cruDataFillTr32_fun [172; 246]
  = [128; 1; 2896337038; 3570057398; 275938951424].
Proof. vm_compute. reflexivity. Qed.


Example t_0649 :
  cruDataFillTr32_fun [150; 191]
  = [128; 1; 2522158291; 2589530327; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0650 :
  cruDataFillTr32_fun [254; 82]
  = [128; 1; 4266697460; 3054000812; 280217206784].
Proof. vm_compute. reflexivity. Qed.


Example t_0651 :
  cruDataFillTr32_fun [80; 223]
  = [128; 1; 1345261293; 3568538225; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0652 :
  cruDataFillTr32_fun [213; 64]
  = [128; 1; 3574945173; 3574945173; 457592982144].
Proof. vm_compute. reflexivity. Qed.


Example t_0653 :
  cruDataFillTr32_fun [117; 74]
  = [128; 1; 1975454035; 1301799211; 278128410496].
Proof. vm_compute. reflexivity. Qed.


Example t_0654 :
  cruDataFillTr32_fun [32; 62]
  = [128; 1; 543071450; 677815522; 267382701824].
Proof. vm_compute. reflexivity. Qed.


Example t_0655 :
  cruDataFillTr32_fun [235; 237]
  = [128; 1; 3956852146; 925110782; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0656 :
  cruDataFillTr32_fun [47; 251]
  = [128; 1; 791291168; 1128151348; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0657 :
  cruDataFillTr32_fun [173; 141]
  = [128; 1; 2906310484; 2030474016; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0658 :
  cruDataFillTr32_fun [100; 201]
  = [128; 1; 1680733887; 1074385563; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0659 :
  cruDataFillTr32_fun [63; 208]
  = [128; 1; 1058004911; 4291796847; 342385215360].
Proof. vm_compute. reflexivity. Qed.


Example t_0660 :
  cruDataFillTr32_fun [12; 1]
  = [128; 1; 202182159; 134810123; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0661 :
  cruDataFillTr32_fun [213; 190]
  = [128; 1; 3583201551; 3717945623; 278094856576].
Proof. vm_compute. reflexivity. Qed.


Example t_0662 :
  cruDataFillTr32_fun [41; 236]
  = [128; 1; 689242605; 2036683069; 278077948544].
Proof. vm_compute. reflexivity. Qed.


Example t_0663 :
  cruDataFillTr32_fun [219; 234]
  = [128; 1; 3687165849; 857540593; 273816862336].
Proof. vm_compute. reflexivity. Qed.


Example t_0664 :
  cruDataFillTr32_fun [255; 204]
  = [128; 1; 4291532643; 3483068211; 291013377408].
Proof. vm_compute. reflexivity. Qed.


Example t_0665 :
  cruDataFillTr32_fun [241; 165]
  = [128; 1; 4053154784; 1560454988; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0666 :
  cruDataFillTr32_fun [20; 92]
  = [128; 1; 342936616; 2751487160; 267298947072].
Proof. vm_compute. reflexivity. Qed.


Example t_0667 :
  cruDataFillTr32_fun [202; 183]
  = [128; 1; 3397466351; 4003814419; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0668 :
  cruDataFillTr32_fun [92; 92]
  = [128; 1; 1555567728; 3964183552; 284545661952].
Proof. vm_compute. reflexivity. Qed.


Example t_0669 :
  cruDataFillTr32_fun [243; 98]
  = [128; 1; 4082480921; 1808609169; 273816862336].
Proof. vm_compute. reflexivity. Qed.


Example t_0670 :
  cruDataFillTr32_fun [213; 255]
  = [128; 1; 3587494866; 3654866902; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0671 :
  cruDataFillTr32_fun [144; 60]
  = [128; 1; 2429290564; 2698778708; 258809544192].
Proof. vm_compute. reflexivity. Qed.


Example t_0672 :
  cruDataFillTr32_fun [190; 95]
  = [128; 1; 3189603547; 1117847647; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0673 :
  cruDataFillTr32_fun [152; 28]
  = [128; 1; 2561986796; 675569788; 275922043392].
Proof. vm_compute. reflexivity. Qed.


Example t_0674 :
  cruDataFillTr32_fun [173; 73]
  = [128; 1; 2918596488; 2312248164; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0675 :
  cruDataFillTr32_fun [9; 77]
  = [128; 1; 156673008; 3575803836; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0676 :
  cruDataFillTr32_fun [229; 86]
  = [128; 1; 3845886439; 2380478863; 278094856576].
Proof. vm_compute. reflexivity. Qed.


Example t_0677 :
  cruDataFillTr32_fun [11; 206]
  = [128; 1; 198813557; 3550572349; 273783308416].
Proof. vm_compute. reflexivity. Qed.


Example t_0678 :
  cruDataFillTr32_fun [141; 131]
  = [128; 1; 2366673686; 2164557578; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0679 :
  cruDataFillTr32_fun [196; 65]
  = [128; 1; 3288680071; 3221308035; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0680 :
  cruDataFillTr32_fun [150; 215]
  = [128; 1; 2523743259; 974252223; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0681 :
  cruDataFillTr32_fun [186; 96]
  = [128; 1; 3122297562; 983235162; 262754094336].
Proof. vm_compute. reflexivity. Qed.


Example t_0682 :
  cruDataFillTr32_fun [72; 200]
  = [128; 1; 1209063584; 686864512; 258776250368].
Proof. vm_compute. reflexivity. Qed.


Example t_0683 :
  cruDataFillTr32_fun [161; 146]
  = [128; 1; 2704524631; 1508605199; 269505053056].
Proof. vm_compute. reflexivity. Qed.


Example t_0684 :
  cruDataFillTr32_fun [233; 146]
  = [128; 1; 3917155743; 2704524631; 269505053056].
Proof. vm_compute. reflexivity. Qed.


Example t_0685 :
  cruDataFillTr32_fun [155; 161]
  = [128; 1; 2604457342; 397957626; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0686 :
  cruDataFillTr32_fun [98; 217]
  = [128; 1; 1648039149; 4275548297; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0687 :
  cruDataFillTr32_fun [42; 132]
  = [128; 1; 716059318; 446571174; 280300961536].
Proof. vm_compute. reflexivity. Qed.


Example t_0688 :
  cruDataFillTr32_fun [244; 213]
  = [128; 1; 4106854003; 2692041247; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0689 :
  cruDataFillTr32_fun [115; 218]
  = [128; 1; 1934436097; 199606169; 273816862336].
Proof. vm_compute. reflexivity. Qed.


Example t_0690 :
  cruDataFillTr32_fun [131; 48]
  = [128; 1; 2209604371; 3287491411; 213838313856].
Proof. vm_compute. reflexivity. Qed.


Example t_0691 :
  cruDataFillTr32_fun [30; 207]
  = [128; 1; 518896779; 3803283535; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0692 :
  cruDataFillTr32_fun [211; 40]
  = [128; 1; 3556451147; 861635499; 282490158464].
Proof. vm_compute. reflexivity. Qed.


Example t_0693 :
  cruDataFillTr32_fun [180; 150]
  = [128; 1; 3024806006; 1559398430; 275938951424].
Proof. vm_compute. reflexivity. Qed.


Example t_0694 :
  cruDataFillTr32_fun [247; 217]
  = [128; 1; 4157647234; 2473346334; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0695 :
  cruDataFillTr32_fun [36; 16]
  = [128; 1; 607405140; 3841197076; 284712647168].
Proof. vm_compute. reflexivity. Qed.


Example t_0696 :
  cruDataFillTr32_fun [189; 217]
  = [128; 1; 3180752712; 1496452068; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0697 :
  cruDataFillTr32_fun [222; 66]
  = [128; 1; 3726664356; 3591920284; 280217206784].
Proof. vm_compute. reflexivity. Qed.


Example t_0698 :
  cruDataFillTr32_fun [144; 197]
  = [128; 1; 2421496543; 2084636363; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0699 :
  cruDataFillTr32_fun [55; 202]
  = [128; 1; 922864533; 265921389; 282373111936].
Proof. vm_compute. reflexivity. Qed.


Example t_0700 :
  cruDataFillTr32_fun [221; 117]
  = [128; 1; 3713189692; 159314792; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0701 :
  cruDataFillTr32_fun [206; 172]
  = [128; 1; 3464111826; 516584994; 288857472256].
Proof. vm_compute. reflexivity. Qed.


Example t_0702 :
  cruDataFillTr32_fun [170; 129]
  = [128; 1; 2854988845; 2787616809; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0703 :
  cruDataFillTr32_fun [158; 59]
  = [128; 1; 2665026639; 3001886819; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0704 :
  cruDataFillTr32_fun [1; 139]
  = [128; 1; 25958306; 3579898742; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0705 :
  cruDataFillTr32_fun [247; 60]
  = [128; 1; 4147343275; 121864123; 273766662528].
Proof. vm_compute. reflexivity. Qed.


Example t_0706 :
  cruDataFillTr32_fun [244; 176]
  = [128; 1; 4104410116; 887395396; 318938690048].
Proof. vm_compute. reflexivity. Qed.


Example t_0707 :
  cruDataFillTr32_fun [151; 38]
  = [128; 1; 2545804041; 4280634225; 282406665856].
Proof. vm_compute. reflexivity. Qed.


Example t_0708 :
  cruDataFillTr32_fun [142; 249]
  = [128; 1; 2391244921; 2862849173; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0709 :
  cruDataFillTr32_fun [190; 160]
  = [128; 1; 3193896606; 1054768670; 271914577664].
Proof. vm_compute. reflexivity. Qed.


Example t_0710 :
  cruDataFillTr32_fun [97; 176]
  = [128; 1; 1628553585; 2706440625; 277976500352].
Proof. vm_compute. reflexivity. Qed.


Example t_0711 :
  cruDataFillTr32_fun [56; 69]
  = [128; 1; 947765767; 610905843; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0712 :
  cruDataFillTr32_fun [173; 149]
  = [128; 1; 2906838892; 1508803352; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0713 :
  cruDataFillTr32_fun [235; 141]
  = [128; 1; 3950511506; 3074740574; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0714 :
  cruDataFillTr32_fun [87; 53]
  = [128; 1; 1468842486; 2209934626; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0715 :
  cruDataFillTr32_fun [103; 8]
  = [128; 1; 1735358335; 1196382047; 256620349312].
Proof. vm_compute. reflexivity. Qed.


Example t_0716 :
  cruDataFillTr32_fun [48; 139]
  = [128; 1; 817579729; 76487333; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0717 :
  cruDataFillTr32_fun [72; 99]
  = [128; 1; 1219169905; 3156181733; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0718 :
  cruDataFillTr32_fun [134; 240]
  = [128; 1; 2255906390; 3333858966; 220306029312].
Proof. vm_compute. reflexivity. Qed.


Example t_0719 :
  cruDataFillTr32_fun [140; 204]
  = [128; 1; 2354586864; 1546187968; 284545661952].
Proof. vm_compute. reflexivity. Qed.


Example t_0720 :
  cruDataFillTr32_fun [34; 90]
  = [128; 1; 578606640; 3121901256; 271660957184].
Proof. vm_compute. reflexivity. Qed.


Example t_0721 :
  cruDataFillTr32_fun [130; 107]
  = [128; 1; 2196592835; 3594628119; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0722 :
  cruDataFillTr32_fun [253; 156]
  = [128; 1; 4254676433; 2368324961; 286701567104].
Proof. vm_compute. reflexivity. Qed.


Example t_0723 :
  cruDataFillTr32_fun [15; 181]
  = [128; 1; 264534318; 1005626714; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0724 :
  cruDataFillTr32_fun [93; 135]
  = [128; 1; 1575250930; 1103646678; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0725 :
  cruDataFillTr32_fun [203; 102]
  = [128; 1; 3409025021; 865730405; 273783308416].
Proof. vm_compute. reflexivity. Qed.


Example t_0726 :
  cruDataFillTr32_fun [105; 36]
  = [128; 1; 1770893781; 3657244997; 278145056384].
Proof. vm_compute. reflexivity. Qed.


Example t_0727 :
  cruDataFillTr32_fun [124; 88]
  = [128; 1; 2094279812; 477416484; 301759085056].
Proof. vm_compute. reflexivity. Qed.


Example t_0728 :
  cruDataFillTr32_fun [33; 147]
  = [128; 1; 565463002; 3580427150; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0729 :
  cruDataFillTr32_fun [47; 80]
  = [128; 1; 796905247; 4013920223; 308427603840].
Proof. vm_compute. reflexivity. Qed.


Example t_0730 :
  cruDataFillTr32_fun [18; 16]
  = [128; 1; 304230978; 3538088450; 245908451584].
Proof. vm_compute. reflexivity. Qed.


Example t_0731 :
  cruDataFillTr32_fun [99; 188]
  = [128; 1; 1663032215; 1932520359; 265277259648].
Proof. vm_compute. reflexivity. Qed.


Example t_0732 :
  cruDataFillTr32_fun [118; 80]
  = [128; 1; 1992693350; 914806310; 322982068992].
Proof. vm_compute. reflexivity. Qed.


Example t_0733 :
  cruDataFillTr32_fun [230; 130]
  = [128; 1; 3865635436; 3730891364; 280217206784].
Proof. vm_compute. reflexivity. Qed.


Example t_0734 :
  cruDataFillTr32_fun [162; 89]
  = [128; 1; 2734380205; 1050144841; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0735 :
  cruDataFillTr32_fun [100; 245]
  = [128; 1; 1683574339; 2424666735; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0736 :
  cruDataFillTr32_fun [217; 248]
  = [128; 1; 3654404545; 4193380833; 295291369600].
Proof. vm_compute. reflexivity. Qed.


Example t_0737 :
  cruDataFillTr32_fun [172; 166]
  = [128; 1; 2891118750; 347758598; 275938951424].
Proof. vm_compute. reflexivity. Qed.


Example t_0738 :
  cruDataFillTr32_fun [148; 4]
  = [128; 1; 2493029536; 2223541392; 267366054912].
Proof. vm_compute. reflexivity. Qed.


Example t_0739 :
  cruDataFillTr32_fun [69; 121]
  = [128; 1; 1170094000; 1641698252; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0740 :
  cruDataFillTr32_fun [2; 242]
  = [128; 1; 49604312; 975969808; 271660957184].
Proof. vm_compute. reflexivity. Qed.


Example t_0741 :
  cruDataFillTr32_fun [56; 3]
  = [128; 1; 943406657; 741290549; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0742 :
  cruDataFillTr32_fun [138; 235]
  = [128; 1; 2322948171; 3737760927; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0743 :
  cruDataFillTr32_fun [53; 228]
  = [128; 1; 890895841; 2777247057; 269521960064].
Proof. vm_compute. reflexivity. Qed.


Example t_0744 :
  cruDataFillTr32_fun [1; 167]
  = [128; 1; 27807734; 1695331162; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0745 :
  cruDataFillTr32_fun [236; 85]
  = [128; 1; 3963721451; 2565685911; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0746 :
  cruDataFillTr32_fun [163; 117]
  = [128; 1; 2736295170; 3477387566; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0747 :
  cruDataFillTr32_fun [88; 210]
  = [128; 1; 1479212238; 283292806; 267349147904].
Proof. vm_compute. reflexivity. Qed.


Example t_0748 :
  cruDataFillTr32_fun [253; 73]
  = [128; 1; 4249259992; 3642911668; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0749 :
  cruDataFillTr32_fun [117; 88]
  = [128; 1; 1976378749; 359515421; 286667753088].
Proof. vm_compute. reflexivity. Qed.


Example t_0750 :
  cruDataFillTr32_fun [237; 252]
  = [128; 1; 3991528929; 4261017073; 286701567104].
Proof. vm_compute. reflexivity. Qed.


Example t_0751 :
  cruDataFillTr32_fun [210; 223]
  = [128; 1; 3534852207; 1446319347; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0752 :
  cruDataFillTr32_fun [32; 20]
  = [128; 1; 540297308; 3504666636; 258742436352].
Proof. vm_compute. reflexivity. Qed.


Example t_0753 :
  cruDataFillTr32_fun [200; 186]
  = [128; 1; 3363978486; 3768210446; 267349147904].
Proof. vm_compute. reflexivity. Qed.


Example t_0754 :
  cruDataFillTr32_fun [167; 215]
  = [128; 1; 2810074412; 1260583376; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0755 :
  cruDataFillTr32_fun [60; 103]
  = [128; 1; 1017318001; 2684841685; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0756 :
  cruDataFillTr32_fun [86; 237]
  = [128; 1; 1447243805; 2727312489; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0757 :
  cruDataFillTr32_fun [251; 12]
  = [128; 1; 4211544863; 3419923439; 282389758848].
Proof. vm_compute. reflexivity. Qed.


Example t_0758 :
  cruDataFillTr32_fun [5; 126]
  = [128; 1; 92471679; 227215751; 278094856576].
Proof. vm_compute. reflexivity. Qed.


Example t_0759 :
  cruDataFillTr32_fun [134; 35]
  = [128; 1; 2259274991; 4196221027; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0760 :
  cruDataFillTr32_fun [132; 12]
  = [128; 1; 2224069800; 1415605368; 267298947072].
Proof. vm_compute. reflexivity. Qed.


Example t_0761 :
  cruDataFillTr32_fun [101; 2]
  = [128; 1; 1701276011; 1566531939; 278128410496].
Proof. vm_compute. reflexivity. Qed.


Example t_0762 :
  cruDataFillTr32_fun [45; 131]
  = [128; 1; 766522294; 564406186; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0763 :
  cruDataFillTr32_fun [85; 67]
  = [128; 1; 1436080926; 1233964818; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0764 :
  cruDataFillTr32_fun [214; 247]
  = [128; 1; 3603809467; 4210157791; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0765 :
  cruDataFillTr32_fun [51; 179]
  = [128; 1; 870750540; 1729809792; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0766 :
  cruDataFillTr32_fun [179; 237]
  = [128; 1; 3013643642; 4293712326; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0767 :
  cruDataFillTr32_fun [216; 112]
  = [128; 1; 3628644392; 411629672; 258575451136].
Proof. vm_compute. reflexivity. Qed.


Example t_0768 :
  cruDataFillTr32_fun [137; 249]
  = [128; 1; 2307029876; 2778634128; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0769 :
  cruDataFillTr32_fun [50; 10]
  = [128; 1; 842810960; 169090600; 271660957184].
Proof. vm_compute. reflexivity. Qed.


Example t_0770 :
  cruDataFillTr32_fun [6; 64]
  = [128; 1; 105285318; 105285318; 13476520704].
Proof. vm_compute. reflexivity. Qed.


Example t_0771 :
  cruDataFillTr32_fun [82; 128]
  = [128; 1; 1389515474; 1389515474; 177857980672].
Proof. vm_compute. reflexivity. Qed.


Example t_0772 :
  cruDataFillTr32_fun [10; 229]
  = [128; 1; 183489721; 1985691685; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0773 :
  cruDataFillTr32_fun [214; 51]
  = [128; 1; 3590929519; 171798691; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0774 :
  cruDataFillTr32_fun [6; 80]
  = [128; 1; 106342134; 3323356854; 220037597952].
Proof. vm_compute. reflexivity. Qed.


Example t_0775 :
  cruDataFillTr32_fun [168; 155]
  = [128; 1; 2823020153; 1020752397; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0776 :
  cruDataFillTr32_fun [85; 18]
  = [128; 1; 1432844683; 220148035; 278128410496].
Proof. vm_compute. reflexivity. Qed.


Example t_0777 :
  cruDataFillTr32_fun [157; 137]
  = [128; 1; 2636558136; 2030209812; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0778 :
  cruDataFillTr32_fun [254; 231]
  = [128; 1; 4276473011; 1648963607; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0779 :
  cruDataFillTr32_fun [16; 33]
  = [128; 1; 271667827; 2360200943; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0780 :
  cruDataFillTr32_fun [44; 54]
  = [128; 1; 744659150; 1418379510; 275938951424].
Proof. vm_compute. reflexivity. Qed.


Example t_0781 :
  cruDataFillTr32_fun [118; 247]
  = [128; 1; 1986880603; 2593228927; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0782 :
  cruDataFillTr32_fun [82; 224]
  = [128; 1; 1379013362; 3534918258; 314491623680].
Proof. vm_compute. reflexivity. Qed.


Example t_0783 :
  cruDataFillTr32_fun [127; 234]
  = [128; 1; 2137609021; 3619793813; 282373111936].
Proof. vm_compute. reflexivity. Qed.


Example t_0784 :
  cruDataFillTr32_fun [101; 223]
  = [128; 1; 1698964226; 3922241414; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0785 :
  cruDataFillTr32_fun [14; 202]
  = [128; 1; 249078380; 3870325316; 280217206784].
Proof. vm_compute. reflexivity. Qed.


Example t_0786 :
  cruDataFillTr32_fun [112; 47]
  = [128; 1; 1889521405; 3034780225; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0787 :
  cruDataFillTr32_fun [112; 147]
  = [128; 1; 1879283241; 615992029; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0788 :
  cruDataFillTr32_fun [122; 184]
  = [128; 1; 2050157218; 2589067970; 297447274752].
Proof. vm_compute. reflexivity. Qed.


Example t_0789 :
  cruDataFillTr32_fun [195; 165]
  = [128; 1; 3278376370; 802453790; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0790 :
  cruDataFillTr32_fun [157; 122]
  = [128; 1; 2635567371; 3039799587; 278128410496].
Proof. vm_compute. reflexivity. Qed.


Example t_0791 :
  cruDataFillTr32_fun [238; 64]
  = [128; 1; 3996020398; 3996020398; 511490610944].
Proof. vm_compute. reflexivity. Qed.


Example t_0792 :
  cruDataFillTr32_fun [66; 199]
  = [128; 1; 1107939479; 653112443; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0793 :
  cruDataFillTr32_fun [59; 146]
  = [128; 1; 1003315185; 4085585833; 273816862336].
Proof. vm_compute. reflexivity. Qed.


Example t_0794 :
  cruDataFillTr32_fun [112; 234]
  = [128; 1; 1884963886; 3367148678; 267349147904].
Proof. vm_compute. reflexivity. Qed.


Example t_0795 :
  cruDataFillTr32_fun [18; 247]
  = [128; 1; 302579959; 908928027; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0796 :
  cruDataFillTr32_fun [173; 134]
  = [128; 1; 2905848127; 2501615911; 278094856576].
Proof. vm_compute. reflexivity. Qed.


Example t_0797 :
  cruDataFillTr32_fun [192; 53]
  = [128; 1; 3237292639; 3961607819; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0798 :
  cruDataFillTr32_fun [179; 152]
  = [128; 1; 3008095099; 1407943451; 282355942784].
Proof. vm_compute. reflexivity. Qed.


Example t_0799 :
  cruDataFillTr32_fun [227; 10]
  = [128; 1; 3824023297; 3150303193; 273816862336].
Proof. vm_compute. reflexivity. Qed.


Example t_0800 :
  cruDataFillTr32_fun [217; 47]
  = [128; 1; 3641194342; 491551658; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0801 :
  cruDataFillTr32_fun [100; 48]
  = [128; 1; 1687471348; 2765358132; 284444215808].
Proof. vm_compute. reflexivity. Qed.


Example t_0802 :
  cruDataFillTr32_fun [28; 240]
  = [128; 1; 470613228; 1548500012; 267199071744].
Proof. vm_compute. reflexivity. Qed.


Example t_0803 :
  cruDataFillTr32_fun [51; 201]
  = [128; 1; 872203662; 265855338; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0804 :
  cruDataFillTr32_fun [174; 125]
  = [128; 1; 2922096677; 3124212785; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0805 :
  cruDataFillTr32_fun [90; 71]
  = [128; 1; 1520560175; 1048955923; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0806 :
  cruDataFillTr32_fun [134; 178]
  = [128; 1; 2251877020; 3195019988; 280217206784].
Proof. vm_compute. reflexivity. Qed.


Example t_0807 :
  cruDataFillTr32_fun [224; 154]
  = [128; 1; 3766097070; 2014489670; 267349147904].
Proof. vm_compute. reflexivity. Qed.


Example t_0808 :
  cruDataFillTr32_fun [52; 28]
  = [128; 1; 877685896; 3303078936; 267298947072].
Proof. vm_compute. reflexivity. Qed.


Example t_0809 :
  cruDataFillTr32_fun [22; 8]
  = [128; 1; 371074606; 4143842830; 288957873920].
Proof. vm_compute. reflexivity. Qed.


Example t_0810 :
  cruDataFillTr32_fun [59; 63]
  = [128; 1; 997898744; 1065270780; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0811 :
  cruDataFillTr32_fun [110; 154]
  = [128; 1; 1846059580; 111164116; 280217206784].
Proof. vm_compute. reflexivity. Qed.


Example t_0812 :
  cruDataFillTr32_fun [199; 22]
  = [128; 1; 3353211657; 1871027121; 282406665856].
Proof. vm_compute. reflexivity. Qed.


Example t_0813 :
  cruDataFillTr32_fun [214; 160]
  = [128; 1; 3598063286; 1459000886; 323652107008].
Proof. vm_compute. reflexivity. Qed.


Example t_0814 :
  cruDataFillTr32_fun [248; 61]
  = [128; 1; 4164252335; 71401147; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0815 :
  cruDataFillTr32_fun [123; 10]
  = [128; 1; 2072350617; 1398630257; 273816862336].
Proof. vm_compute. reflexivity. Qed.


Example t_0816 :
  cruDataFillTr32_fun [178; 181]
  = [128; 1; 2993102033; 3734194429; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0817 :
  cruDataFillTr32_fun [94; 172]
  = [128; 1; 1577760354; 2925135538; 288857472256].
Proof. vm_compute. reflexivity. Qed.


Example t_0818 :
  cruDataFillTr32_fun [82; 255]
  = [128; 1; 1381060687; 1448432723; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0819 :
  cruDataFillTr32_fun [165; 74]
  = [128; 1; 2783918467; 2110198107; 278128410496].
Proof. vm_compute. reflexivity. Qed.


Example t_0820 :
  cruDataFillTr32_fun [210; 227]
  = [128; 1; 3535116411; 1177095407; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0821 :
  cruDataFillTr32_fun [207; 225]
  = [128; 1; 3484455282; 1261178350; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0822 :
  cruDataFillTr32_fun [77; 79]
  = [128; 1; 1302129466; 291549182; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0823 :
  cruDataFillTr32_fun [60; 251]
  = [128; 1; 1010250285; 1347110465; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0824 :
  cruDataFillTr32_fun [4; 142]
  = [128; 1; 76685486; 3428509814; 275938951424].
Proof. vm_compute. reflexivity. Qed.


Example t_0825 :
  cruDataFillTr32_fun [83; 116]
  = [128; 1; 1405565871; 2214030303; 265210151808].
Proof. vm_compute. reflexivity. Qed.


Example t_0826 :
  cruDataFillTr32_fun [69; 102]
  = [128; 1; 1168839031; 2903734751; 278094856576].
Proof. vm_compute. reflexivity. Qed.


Example t_0827 :
  cruDataFillTr32_fun [0; 86]
  = [128; 1; 5680130; 2835240106; 267382701824].
Proof. vm_compute. reflexivity. Qed.


Example t_0828 :
  cruDataFillTr32_fun [91; 63]
  = [128; 1; 1536874776; 1604246812; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0829 :
  cruDataFillTr32_fun [92; 58]
  = [128; 1; 1553387530; 1957619746; 275972505344].
Proof. vm_compute. reflexivity. Qed.


Example t_0830 :
  cruDataFillTr32_fun [234; 68]
  = [128; 1; 3928912566; 3659424422; 280300961536].
Proof. vm_compute. reflexivity. Qed.


Example t_0831 :
  cruDataFillTr32_fun [186; 129]
  = [128; 1; 3124476989; 3057104953; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0832 :
  cruDataFillTr32_fun [86; 138]
  = [128; 1; 1457548020; 783827660; 280217206784].
Proof. vm_compute. reflexivity. Qed.


Example t_0833 :
  cruDataFillTr32_fun [31; 193]
  = [128; 1; 534815074; 467443038; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0834 :
  cruDataFillTr32_fun [59; 243]
  = [128; 1; 992878868; 1868715336; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0835 :
  cruDataFillTr32_fun [149; 175]
  = [128; 1; 2504324002; 3649583078; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0836 :
  cruDataFillTr32_fun [244; 239]
  = [128; 1; 4108571329; 942085637; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0837 :
  cruDataFillTr32_fun [58; 158]
  = [128; 1; 987264532; 3261136540; 271627403264].
Proof. vm_compute. reflexivity. Qed.


Example t_0838 :
  cruDataFillTr32_fun [212; 20]
  = [128; 1; 3572038672; 2224598208; 267366054912].
Proof. vm_compute. reflexivity. Qed.


Example t_0839 :
  cruDataFillTr32_fun [165; 173]
  = [128; 1; 2773680044; 4053683192; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0840 :
  cruDataFillTr32_fun [70; 242]
  = [128; 1; 1178085916; 2121294420; 280217206784].
Proof. vm_compute. reflexivity. Qed.


Example t_0841 :
  cruDataFillTr32_fun [21; 248]
  = [128; 1; 353175037; 892151069; 286667753088].
Proof. vm_compute. reflexivity. Qed.


Example t_0842 :
  cruDataFillTr32_fun [174; 156]
  = [128; 1; 2924144258; 1054504466; 288857472256].
Proof. vm_compute. reflexivity. Qed.


Example t_0843 :
  cruDataFillTr32_fun [13; 250]
  = [128; 1; 218563067; 622795027; 278128410496].
Proof. vm_compute. reflexivity. Qed.


Example t_0844 :
  cruDataFillTr32_fun [111; 241]
  = [128; 1; 1868583234; 2879163774; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0845 :
  cruDataFillTr32_fun [177; 154]
  = [128; 1; 2974541183; 1239645463; 269505053056].
Proof. vm_compute. reflexivity. Qed.


Example t_0846 :
  cruDataFillTr32_fun [161; 17]
  = [128; 1; 2712847316; 1567522704; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0847 :
  cruDataFillTr32_fun [17; 149]
  = [128; 1; 296106960; 3176327036; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0848 :
  cruDataFillTr32_fun [217; 42]
  = [128; 1; 3640864087; 828081583; 269505053056].
Proof. vm_compute. reflexivity. Qed.


Example t_0849 :
  cruDataFillTr32_fun [211; 125]
  = [128; 1; 3545288010; 3747404118; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0850 :
  cruDataFillTr32_fun [121; 87]
  = [128; 1; 2043684734; 494193442; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0851 :
  cruDataFillTr32_fun [236; 146]
  = [128; 1; 3967684770; 2755053658; 275972505344].
Proof. vm_compute. reflexivity. Qed.


Example t_0852 :
  cruDataFillTr32_fun [24; 162]
  = [128; 1; 414866686; 2419250294; 267349147904].
Proof. vm_compute. reflexivity. Qed.


Example t_0853 :
  cruDataFillTr32_fun [186; 191]
  = [128; 1; 3128506615; 3195878651; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0854 :
  cruDataFillTr32_fun [11; 1]
  = [128; 1; 185339150; 117967114; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0855 :
  cruDataFillTr32_fun [230; 22]
  = [128; 1; 3875279400; 2393160400; 280250760704].
Proof. vm_compute. reflexivity. Qed.


Example t_0856 :
  cruDataFillTr32_fun [216; 131]
  = [128; 1; 3629899361; 3427783253; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0857 :
  cruDataFillTr32_fun [84; 209]
  = [128; 1; 1411774151; 283226755; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0858 :
  cruDataFillTr32_fun [1; 117]
  = [128; 1; 24570720; 765597580; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0859 :
  cruDataFillTr32_fun [52; 158]
  = [128; 1; 886206478; 3160078486; 275938951424].
Proof. vm_compute. reflexivity. Qed.


Example t_0860 :
  cruDataFillTr32_fun [158; 120]
  = [128; 1; 2652278278; 3191254566; 306070895360].
Proof. vm_compute. reflexivity. Qed.


Example t_0861 :
  cruDataFillTr32_fun [105; 80]
  = [128; 1; 1773734233; 695847193; 295492172928].
Proof. vm_compute. reflexivity. Qed.


Example t_0862 :
  cruDataFillTr32_fun [83; 231]
  = [128; 1; 1396318472; 3080619372; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0863 :
  cruDataFillTr32_fun [165; 233]
  = [128; 1; 2777577312; 32166844; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0864 :
  cruDataFillTr32_fun [235; 100]
  = [128; 1; 3947868951; 1539253127; 282456866688].
Proof. vm_compute. reflexivity. Qed.


Example t_0865 :
  cruDataFillTr32_fun [175; 81]
  = [128; 1; 2936033698; 1807486302; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0866 :
  cruDataFillTr32_fun [162; 199]
  = [128; 1; 2724802807; 2253198555; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0867 :
  cruDataFillTr32_fun [51; 151]
  = [128; 1; 868901368; 3614311836; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0868 :
  cruDataFillTr32_fun [106; 101]
  = [128; 1; 1791964313; 3594231813; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0869 :
  cruDataFillTr32_fun [63; 92]
  = [128; 1; 1067186003; 3475736547; 291013377408].
Proof. vm_compute. reflexivity. Qed.


Example t_0870 :
  cruDataFillTr32_fun [117; 6]
  = [128; 1; 1971028359; 1566796143; 278094856576].
Proof. vm_compute. reflexivity. Qed.


Example t_0871 :
  cruDataFillTr32_fun [60; 123]
  = [128; 1; 1018639021; 1355499201; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0872 :
  cruDataFillTr32_fun [73; 118]
  = [128; 1; 1237267883; 1910988243; 269538606976].
Proof. vm_compute. reflexivity. Qed.


Example t_0873 :
  cruDataFillTr32_fun [27; 250]
  = [128; 1; 454364937; 858597153; 273816862336].
Proof. vm_compute. reflexivity. Qed.


Example t_0874 :
  cruDataFillTr32_fun [42; 232]
  = [128; 1; 705886946; 2322750018; 263088060672].
Proof. vm_compute. reflexivity. Qed.


Example t_0875 :
  cruDataFillTr32_fun [130; 176]
  = [128; 1; 2184372882; 3262259922; 211682408704].
Proof. vm_compute. reflexivity. Qed.


Example t_0876 :
  cruDataFillTr32_fun [189; 34]
  = [128; 1; 3185508643; 894925211; 278128410496].
Proof. vm_compute. reflexivity. Qed.


Example t_0877 :
  cruDataFillTr32_fun [164; 35]
  = [128; 1; 2764565005; 406544001; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0878 :
  cruDataFillTr32_fun [241; 50]
  = [128; 1; 4045624711; 693865919; 269505053056].
Proof. vm_compute. reflexivity. Qed.


Example t_0879 :
  cruDataFillTr32_fun [216; 76]
  = [128; 1; 3626266812; 2834579596; 275922043392].
Proof. vm_compute. reflexivity. Qed.


Example t_0880 :
  cruDataFillTr32_fun [245; 104]
  = [128; 1; 4116563245; 1438459277; 286801968768].
Proof. vm_compute. reflexivity. Qed.


Example t_0881 :
  cruDataFillTr32_fun [94; 61]
  = [128; 1; 1587271701; 1789387809; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0882 :
  cruDataFillTr32_fun [43; 66]
  = [128; 1; 728608753; 593864681; 273816862336].
Proof. vm_compute. reflexivity. Qed.


Example t_0883 :
  cruDataFillTr32_fun [131; 233]
  = [128; 1; 2204915006; 3754471834; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0884 :
  cruDataFillTr32_fun [58; 79]
  = [128; 1; 982112295; 4266499307; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0885 :
  cruDataFillTr32_fun [119; 63]
  = [128; 1; 2008479028; 2075851064; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0886 :
  cruDataFillTr32_fun [50; 3]
  = [128; 1; 842348603; 640232495; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0887 :
  cruDataFillTr32_fun [176; 101]
  = [128; 1; 2954197727; 478275147; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0888 :
  cruDataFillTr32_fun [239; 15]
  = [128; 1; 4026404124; 3015889376; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0889 :
  cruDataFillTr32_fun [29; 34]
  = [128; 1; 490692995; 2511854075; 278128410496].
Proof. vm_compute. reflexivity. Qed.


Example t_0890 :
  cruDataFillTr32_fun [42; 0]
  = [128; 1; 707406378; 707406378; 90548016384].
Proof. vm_compute. reflexivity. Qed.


Example t_0891 :
  cruDataFillTr32_fun [59; 182]
  = [128; 1; 1005692765; 1662635909; 273783308416].
Proof. vm_compute. reflexivity. Qed.


Example t_0892 :
  cruDataFillTr32_fun [208; 66]
  = [128; 1; 3490862230; 3356118158; 267349147904].
Proof. vm_compute. reflexivity. Qed.


Example t_0893 :
  cruDataFillTr32_fun [191; 157]
  = [128; 1; 3210541462; 1273529634; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0894 :
  cruDataFillTr32_fun [89; 223]
  = [128; 1; 1496848374; 3720125306; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0895 :
  cruDataFillTr32_fun [100; 93]
  = [128; 1; 1690377851; 4031621639; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0896 :
  cruDataFillTr32_fun [228; 119]
  = [128; 1; 3831222857; 142603885; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0897 :
  cruDataFillTr32_fun [207; 36]
  = [128; 1; 3488814907; 1063487403; 290946269568].
Proof. vm_compute. reflexivity. Qed.


Example t_0898 :
  cruDataFillTr32_fun [241; 111]
  = [128; 1; 4049653566; 899945346; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0899 :
  cruDataFillTr32_fun [99; 232]
  = [128; 1; 1665872667; 3282801531; 247996728704].
Proof. vm_compute. reflexivity. Qed.


Example t_0900 :
  cruDataFillTr32_fun [77; 132]
  = [128; 1; 1305564633; 1036076489; 286634459264].
Proof. vm_compute. reflexivity. Qed.


Example t_0901 :
  cruDataFillTr32_fun [176; 75]
  = [128; 1; 2969257617; 2228165221; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0902 :
  cruDataFillTr32_fun [145; 40]
  = [128; 1; 2444878089; 4044964201; 278178348160].
Proof. vm_compute. reflexivity. Qed.


Example t_0903 :
  cruDataFillTr32_fun [132; 5]
  = [128; 1; 2223607443; 1886747263; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0904 :
  cruDataFillTr32_fun [41; 68]
  = [128; 1; 695054837; 425566693; 278145056384].
Proof. vm_compute. reflexivity. Qed.


Example t_0905 :
  cruDataFillTr32_fun [163; 217]
  = [128; 1; 2742834478; 1058599370; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0906 :
  cruDataFillTr32_fun [148; 110]
  = [128; 1; 2483187934; 3695884326; 275938951424].
Proof. vm_compute. reflexivity. Qed.


Example t_0907 :
  cruDataFillTr32_fun [195; 230]
  = [128; 1; 3282669429; 722597853; 273783308416].
Proof. vm_compute. reflexivity. Qed.


Example t_0908 :
  cruDataFillTr32_fun [107; 108]
  = [128; 1; 1809269679; 3139933183; 282389758848].
Proof. vm_compute. reflexivity. Qed.


Example t_0909 :
  cruDataFillTr32_fun [122; 13]
  = [128; 1; 2055705761; 1179869293; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0910 :
  cruDataFillTr32_fun [25; 178]
  = [128; 1; 432766255; 1359197543; 269505053056].
Proof. vm_compute. reflexivity. Qed.


Example t_0911 :
  cruDataFillTr32_fun [183; 0]
  = [128; 1; 3082270647; 3082270647; 394530642816].
Proof. vm_compute. reflexivity. Qed.


Example t_0912 :
  cruDataFillTr32_fun [202; 210]
  = [128; 1; 3399249472; 2186553080; 271660957184].
Proof. vm_compute. reflexivity. Qed.


Example t_0913 :
  cruDataFillTr32_fun [137; 109]
  = [128; 1; 2314626000; 3577917212; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0914 :
  cruDataFillTr32_fun [244; 73]
  = [128; 1; 4097672911; 3491324587; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0915 :
  cruDataFillTr32_fun [9; 165]
  = [128; 1; 162419704; 1964687204; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0916 :
  cruDataFillTr32_fun [37; 56]
  = [128; 1; 626890189; 1165866477; 252442754688].
Proof. vm_compute. reflexivity. Qed.


Example t_0917 :
  cruDataFillTr32_fun [144; 254]
  = [128; 1; 2425261194; 2560005266; 267382701824].
Proof. vm_compute. reflexivity. Qed.


Example t_0918 :
  cruDataFillTr32_fun [103; 60]
  = [128; 1; 1738792731; 2008280875; 273766662528].
Proof. vm_compute. reflexivity. Qed.


Example t_0919 :
  cruDataFillTr32_fun [233; 220]
  = [128; 1; 3922043261; 2035626253; 278077948544].
Proof. vm_compute. reflexivity. Qed.


Example t_0920 :
  cruDataFillTr32_fun [241; 60]
  = [128; 1; 4046285221; 20806069; 260965449344].
Proof. vm_compute. reflexivity. Qed.


Example t_0921 :
  cruDataFillTr32_fun [75; 63]
  = [128; 1; 1267386632; 1334758668; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0922 :
  cruDataFillTr32_fun [194; 193]
  = [128; 1; 3263382533; 3196010497; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0923 :
  cruDataFillTr32_fun [108; 240]
  = [128; 1; 1817988156; 2895940732; 301691457024].
Proof. vm_compute. reflexivity. Qed.


Example t_0924 :
  cruDataFillTr32_fun [74; 201]
  = [128; 1; 1242815653; 653244545; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0925 :
  cruDataFillTr32_fun [120; 229]
  = [128; 1; 2019377703; 3838422675; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0926 :
  cruDataFillTr32_fun [142; 175]
  = [128; 1; 2386422939; 3531682015; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0927 :
  cruDataFillTr32_fun [69; 230]
  = [128; 1; 1160450551; 2912123231; 278094856576].
Proof. vm_compute. reflexivity. Qed.


Example t_0928 :
  cruDataFillTr32_fun [34; 53]
  = [128; 1; 576163009; 1317255405; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0929 :
  cruDataFillTr32_fun [174; 17]
  = [128; 1; 2931806433; 1786481821; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0930 :
  cruDataFillTr32_fun [214; 119]
  = [128; 1; 3595420731; 4201769055; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0931 :
  cruDataFillTr32_fun [39; 184]
  = [128; 1; 668964687; 1207940975; 256754564992].
Proof. vm_compute. reflexivity. Qed.


Example t_0932 :
  cruDataFillTr32_fun [120; 187]
  = [128; 1; 2016669353; 2353463997; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0933 :
  cruDataFillTr32_fun [51; 12]
  = [128; 1; 859786071; 51321639; 265277259648].
Proof. vm_compute. reflexivity. Qed.


Example t_0934 :
  cruDataFillTr32_fun [116; 254]
  = [128; 1; 1953656942; 2088401014; 275938951424].
Proof. vm_compute. reflexivity. Qed.


Example t_0935 :
  cruDataFillTr32_fun [254; 11]
  = [128; 1; 4262007839; 3537758451; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0936 :
  cruDataFillTr32_fun [117; 174]
  = [128; 1; 1965281663; 3177912775; 278094856576].
Proof. vm_compute. reflexivity. Qed.


Example t_0937 :
  cruDataFillTr32_fun [19; 16]
  = [128; 1; 321073987; 3554931459; 248064356736].
Proof. vm_compute. reflexivity. Qed.


Example t_0938 :
  cruDataFillTr32_fun [62; 112]
  = [128; 1; 1051598478; 2129551054; 340497741568].
Proof. vm_compute. reflexivity. Qed.


Example t_0939 :
  cruDataFillTr32_fun [177; 42]
  = [128; 1; 2983920943; 154361223; 269505053056].
Proof. vm_compute. reflexivity. Qed.


Example t_0940 :
  cruDataFillTr32_fun [226; 12]
  = [128; 1; 3807312390; 2998848214; 263121354496].
Proof. vm_compute. reflexivity. Qed.


Example t_0941 :
  cruDataFillTr32_fun [54; 157]
  = [128; 1; 919826445; 3261070489; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0942 :
  cruDataFillTr32_fun [120; 30]
  = [128; 1; 2023142610; 1981530; 267382701824].
Proof. vm_compute. reflexivity. Qed.


Example t_0943 :
  cruDataFillTr32_fun [210; 0]
  = [128; 1; 3537031890; 3537031890; 452740081920].
Proof. vm_compute. reflexivity. Qed.


Example t_0944 :
  cruDataFillTr32_fun [102; 86]
  = [128; 1; 1723601512; 241482256; 280250760704].
Proof. vm_compute. reflexivity. Qed.


Example t_0945 :
  cruDataFillTr32_fun [151; 79]
  = [128; 1; 2548446596; 1537931592; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0946 :
  cruDataFillTr32_fun [226; 209]
  = [128; 1; 3803415637; 2658091025; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0947 :
  cruDataFillTr32_fun [171; 241]
  = [128; 1; 2879163774; 3889744314; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0948 :
  cruDataFillTr32_fun [131; 162]
  = [128; 1; 2200291177; 4221386721; 273816862336].
Proof. vm_compute. reflexivity. Qed.


Example t_0949 :
  cruDataFillTr32_fun [17; 122]
  = [128; 1; 294323583; 698555799; 269505053056].
Proof. vm_compute. reflexivity. Qed.


Example t_0950 :
  cruDataFillTr32_fun [188; 255]
  = [128; 1; 3166419641; 3233791677; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0951 :
  cruDataFillTr32_fun [213; 75]
  = [128; 1; 3575671734; 2851356554; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0952 :
  cruDataFillTr32_fun [62; 49]
  = [128; 1; 1047503057; 2058083341; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0953 :
  cruDataFillTr32_fun [61; 61]
  = [128; 1; 1031452660; 1233568512; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0954 :
  cruDataFillTr32_fun [34; 7]
  = [128; 1; 573124663; 101520411; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0955 :
  cruDataFillTr32_fun [218; 19]
  = [128; 1; 3672965139; 2392962247; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0956 :
  cruDataFillTr32_fun [74; 73]
  = [128; 1; 1251204133; 644855809; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0957 :
  cruDataFillTr32_fun [214; 181]
  = [128; 1; 3599450357; 45575201; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0958 :
  cruDataFillTr32_fun [114; 249]
  = [128; 1; 1919640669; 2391244921; 275964182400].
Proof. vm_compute. reflexivity. Qed.


Example t_0959 :
  cruDataFillTr32_fun [45; 186]
  = [128; 1; 770154843; 1174387059; 278128410496].
Proof. vm_compute. reflexivity. Qed.


Example t_0960 :
  cruDataFillTr32_fun [119; 208]
  = [128; 1; 2001147879; 923260839; 325137974144].
Proof. vm_compute. reflexivity. Qed.


Example t_0961 :
  cruDataFillTr32_fun [196; 214]
  = [128; 1; 3298455622; 1816271086; 275938951424].
Proof. vm_compute. reflexivity. Qed.


Example t_0962 :
  cruDataFillTr32_fun [243; 5]
  = [128; 1; 4093181186; 3756321262; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0963 :
  cruDataFillTr32_fun [150; 179]
  = [128; 1; 2521431215; 3397202147; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0964 :
  cruDataFillTr32_fun [53; 190]
  = [128; 1; 905163119; 1039907191; 278094856576].
Proof. vm_compute. reflexivity. Qed.


Example t_0965 :
  cruDataFillTr32_fun [119; 200]
  = [128; 1; 2000619471; 1461708719; 291113779072].
Proof. vm_compute. reflexivity. Qed.


Example t_0966 :
  cruDataFillTr32_fun [210; 210]
  = [128; 1; 3533993544; 2321296896; 271660957184].
Proof. vm_compute. reflexivity. Qed.


Example t_0967 :
  cruDataFillTr32_fun [52; 26]
  = [128; 1; 877553794; 3437625370; 275972505344].
Proof. vm_compute. reflexivity. Qed.


Example t_0968 :
  cruDataFillTr32_fun [175; 215]
  = [128; 1; 2944818484; 1395261912; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0969 :
  cruDataFillTr32_fun [82; 180]
  = [128; 1; 1376172654; 2184637086; 263054246656].
Proof. vm_compute. reflexivity. Qed.


Example t_0970 :
  cruDataFillTr32_fun [244; 174]
  = [128; 1; 4104278270; 1022007366; 275938951424].
Proof. vm_compute. reflexivity. Qed.


Example t_0971 :
  cruDataFillTr32_fun [207; 59]
  = [128; 1; 3473556864; 3810417044; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0972 :
  cruDataFillTr32_fun [26; 47]
  = [128; 1; 441022631; 1586347243; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0973 :
  cruDataFillTr32_fun [249; 180]
  = [128; 1; 4188889365; 702386501; 278145056384].
Proof. vm_compute. reflexivity. Qed.


Example t_0974 :
  cruDataFillTr32_fun [187; 26]
  = [128; 1; 3151359753; 1399687073; 273816862336].
Proof. vm_compute. reflexivity. Qed.


Example t_0975 :
  cruDataFillTr32_fun [123; 240]
  = [128; 1; 2070633291; 3148585867; 334030026112].
Proof. vm_compute. reflexivity. Qed.


Example t_0976 :
  cruDataFillTr32_fun [35; 99]
  = [128; 1; 596044108; 2549767616; 278103310080].
Proof. vm_compute. reflexivity. Qed.


Example t_0977 :
  cruDataFillTr32_fun [72; 205]
  = [128; 1; 1209393839; 350334587; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0978 :
  cruDataFillTr32_fun [223; 58]
  = [128; 1; 3742978957; 4147211173; 282373111936].
Proof. vm_compute. reflexivity. Qed.


Example t_0979 :
  cruDataFillTr32_fun [255; 156]
  = [128; 1; 4288362451; 2402010979; 291013377408].
Proof. vm_compute. reflexivity. Qed.


Example t_0980 :
  cruDataFillTr32_fun [229; 163]
  = [128; 1; 3850906574; 1509728066; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0981 :
  cruDataFillTr32_fun [49; 194]
  = [128; 1; 838055287; 703311215; 269505053056].
Proof. vm_compute. reflexivity. Qed.


Example t_0982 :
  cruDataFillTr32_fun [27; 30]
  = [128; 1; 456742773; 2747391997; 273783308416].
Proof. vm_compute. reflexivity. Qed.


Example t_0983 :
  cruDataFillTr32_fun [106; 159]
  = [128; 1; 1779017799; 4002229451; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0984 :
  cruDataFillTr32_fun [122; 175]
  = [128; 1; 2049562759; 3194821835; 275947405440].
Proof. vm_compute. reflexivity. Qed.


Example t_0985 :
  cruDataFillTr32_fun [9; 17]
  = [128; 1; 152709948; 3319195640; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0986 :
  cruDataFillTr32_fun [212; 99]
  = [128; 1; 3560413949; 1219169905; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0987 :
  cruDataFillTr32_fun [73; 168]
  = [128; 1; 1240570177; 2840721825; 260932155520].
Proof. vm_compute. reflexivity. Qed.


Example t_0988 :
  cruDataFillTr32_fun [217; 99]
  = [128; 1; 3644628738; 1303384950; 273791631360].
Proof. vm_compute. reflexivity. Qed.


Example t_0989 :
  cruDataFillTr32_fun [68; 63]
  = [128; 1; 1149485569; 1216857605; 271669280640].
Proof. vm_compute. reflexivity. Qed.


Example t_0990 :
  cruDataFillTr32_fun [198; 106]
  = [128; 1; 3325073924; 512291420; 280217206784].
Proof. vm_compute. reflexivity. Qed.


Example t_0991 :
  cruDataFillTr32_fun [163; 53]
  = [128; 1; 2748845378; 3473160558; 278086533120].
Proof. vm_compute. reflexivity. Qed.


Example t_0992 :
  cruDataFillTr32_fun [131; 38]
  = [128; 1; 2208944117; 3943774045; 273783308416].
Proof. vm_compute. reflexivity. Qed.


Example t_0993 :
  cruDataFillTr32_fun [108; 154]
  = [128; 1; 1812373562; 77478098; 275972505344].
Proof. vm_compute. reflexivity. Qed.


Example t_0994 :
  cruDataFillTr32_fun [81; 45]
  = [128; 1; 1367256024; 2647324452; 273808408320].
Proof. vm_compute. reflexivity. Qed.


Example t_0995 :
  cruDataFillTr32_fun [34; 200]
  = [128; 1; 585806458; 46830170; 245840823552].
Proof. vm_compute. reflexivity. Qed.


Example t_0996 :
  cruDataFillTr32_fun [124; 105]
  = [128; 1; 2095402679; 3628182035; 271652503680].
Proof. vm_compute. reflexivity. Qed.


Example t_0997 :
  cruDataFillTr32_fun [60; 160]
  = [128; 1; 1021082652; 3160210588; 267602767360].
Proof. vm_compute. reflexivity. Qed.


Example t_0998 :
  cruDataFillTr32_fun [67; 134]
  = [128; 1; 1137266645; 733034429; 273783308416].
Proof. vm_compute. reflexivity. Qed.


Example t_0999 :
  cruDataFillTr32_fun [58; 134]
  = [128; 1; 985679564; 581447348; 271627403264].
Proof. vm_compute. reflexivity. Qed.


Example negative_control_wrong_expected :
  cruDataFillTr32_fun [0; 0]
  <> [129; 1; 0; 0; 0].
Proof. vm_compute. discriminate. Qed.
