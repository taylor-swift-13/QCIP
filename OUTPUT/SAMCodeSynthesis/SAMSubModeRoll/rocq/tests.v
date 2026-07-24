(* 由 FloatTest/tools/emit_tests.py 自动生成，请勿手改。
 * 每条约 1000 条向量一条 vm_compute 定理；coqc 编译通过即差分测试通过。 *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.
Require Import OUTPUT.SAMCodeSynthesis.SAMSubModeRoll.rocq.spec.

Import ListNotations.
Local Open Scope Z_scope.


Example t_0000 :
  samSubModeRoll_fun (f32 (1074995798)) 70 0 507 2 (f32 (1052279022)) (f32 (1054250762)) (f32 (1068717298))
  = (70, 508, 0, [1052279022; 1054250762; 1068717298]).
Proof. vm_compute. reflexivity. Qed.


Example t_0001 :
  samSubModeRoll_fun (f32 (1065353216)) 21 1 4280 7 (f32 (3219374199)) (f32 (1063552616)) (f32 (1066069153))
  = (21, 4281, 7, [3219374199; 1063552616; 1066069153]).
Proof. vm_compute. reflexivity. Qed.


Example t_0002 :
  samSubModeRoll_fun (f32 (1073741824)) 31 1 6827 11 (f32 (1064496750)) (f32 (3219245918)) (f32 (1009656097))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0003 :
  samSubModeRoll_fun (f32 (1073741824)) 3 1 5017 12 (f32 (3205608903)) (f32 (3197924495)) (f32 (1067020512))
  = (51, 0, 0, [3205608903; 3197924495; 1067020512]).
Proof. vm_compute. reflexivity. Qed.


Example t_0004 :
  samSubModeRoll_fun (f32 (1066242878)) 13 0 6250 13 (f32 (1046715266)) (f32 (3206112657)) (f32 (1065299968))
  = (17, 0, 0, [1046715266; 3206112657; 1065299968]).
Proof. vm_compute. reflexivity. Qed.


Example t_0005 :
  samSubModeRoll_fun (f32 (3213834186)) 41 0 6249 9 (f32 (1064364397)) (f32 (3196552799)) (f32 (1070478571))
  = (41, 6250, 0, [1064364397; 3196552799; 1070478571]).
Proof. vm_compute. reflexivity. Qed.


Example t_0006 :
  samSubModeRoll_fun (f32 (1073741824)) 31 2 3072 5 (f32 (3215166306)) (f32 (1063266142)) (f32 (3211229700))
  = (31, 3073, 0, [3215166306; 1063266142; 3211229700]).
Proof. vm_compute. reflexivity. Qed.


Example t_0007 :
  samSubModeRoll_fun (f32 (1073741824)) 31 1 6250 12 (f32 (3205517161)) (f32 (1048731159)) (f32 (3211367525))
  = (51, 0, 0, [3205517161; 1048731159; 3211367525]).
Proof. vm_compute. reflexivity. Qed.


Example t_0008 :
  samSubModeRoll_fun (f32 (2143289344)) 14 1 1431 5 (f32 (3201521560)) (f32 (3206804131)) (f32 (1072371413))
  = (14, 1432, 5, [3201521560; 3206804131; 1072371413]).
Proof. vm_compute. reflexivity. Qed.


Example t_0009 :
  samSubModeRoll_fun (f32 (2139095040)) 32 1 2693 5 (f32 (1066854804)) (f32 (3216841045)) (f32 (3215899708))
  = (32, 2694, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0010 :
  samSubModeRoll_fun (f32 (3220029828)) 17 0 4294967295 4 (f32 (3198472237)) (f32 (1061380323)) (f32 (1071714379))
  = (17, 0, 0, [3198472237; 1061380323; 1071714379]).
Proof. vm_compute. reflexivity. Qed.


Example t_0011 :
  samSubModeRoll_fun (f32 (1073741824)) 34 1 3616 4294967295 (f32 (3213399020)) (f32 (1069772184)) (f32 (1052401450))
  = (34, 3617, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0012 :
  samSubModeRoll_fun (f32 (1052065325)) 55 1 5049 3 (f32 (1059034696)) (f32 (3212074497)) (f32 (3176270808))
  = (55, 5050, 3, [1059034696; 3212074497; 3176270808]).
Proof. vm_compute. reflexivity. Qed.


Example t_0013 :
  samSubModeRoll_fun (f32 (1065353216)) 29 1 7179 8 (f32 (3212763066)) (f32 (1073225895)) (f32 (3215543486))
  = (17, 0, 0, [3212763066; 1073225895; 3215543486]).
Proof. vm_compute. reflexivity. Qed.


Example t_0014 :
  samSubModeRoll_fun (f32 (1073741824)) 4 1 7448 11 (f32 (3216898226)) (f32 (1063872367)) (f32 (3210789129))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0015 :
  samSubModeRoll_fun (f32 (1073741824)) 1 1 2998 12 (f32 (1057437044)) (f32 (1051222796)) (f32 (3212936059))
  = (51, 0, 0, [1057437044; 1051222796; 3212936059]).
Proof. vm_compute. reflexivity. Qed.


Example t_0016 :
  samSubModeRoll_fun (f32 (1070482677)) 10 0 6250 4 (f32 (1028561135)) (f32 (1053386162)) (f32 (1066496636))
  = (17, 0, 0, [1028561135; 1053386162; 1066496636]).
Proof. vm_compute. reflexivity. Qed.


Example t_0017 :
  samSubModeRoll_fun (f32 (3173179824)) 21 0 6249 17 (f32 (1070861641)) (f32 (3207800768)) (f32 (1068291305))
  = (21, 6250, 0, [1070861641; 3207800768; 1068291305]).
Proof. vm_compute. reflexivity. Qed.


Example t_0018 :
  samSubModeRoll_fun (f32 (1073741824)) 20 2 3499 5 (f32 (3178273775)) (f32 (1053230211)) (f32 (1063526482))
  = (20, 3500, 0, [3178273775; 1053230211; 1063526482]).
Proof. vm_compute. reflexivity. Qed.


Example t_0019 :
  samSubModeRoll_fun (f32 (1073741824)) 59 1 6250 12 (f32 (1072813668)) (f32 (3209816950)) (f32 (3212571537))
  = (51, 0, 0, [1072813668; 3209816950; 3212571537]).
Proof. vm_compute. reflexivity. Qed.


Example t_0020 :
  samSubModeRoll_fun (f32 (2143289344)) 7 1 1492 5 (f32 (3221178029)) (f32 (1066361775)) (f32 (3199342605))
  = (7, 1493, 5, [3221178029; 1066361775; 3199342605]).
Proof. vm_compute. reflexivity. Qed.


Example t_0021 :
  samSubModeRoll_fun (f32 (2139095040)) 73 1 5961 5 (f32 (1071864122)) (f32 (3213142127)) (f32 (3207123608))
  = (73, 5962, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0022 :
  samSubModeRoll_fun (f32 (1047849358)) 34 0 4294967295 8 (f32 (1064991078)) (f32 (1068447208)) (f32 (3196390717))
  = (34, 0, 0, [1064991078; 1068447208; 3196390717]).
Proof. vm_compute. reflexivity. Qed.


Example t_0023 :
  samSubModeRoll_fun (f32 (1073741824)) 11 1 6495 4294967295 (f32 (1062769258)) (f32 (1062196665)) (f32 (1059188603))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0024 :
  samSubModeRoll_fun (f32 (1075660030)) 5 1 5790 0 (f32 (1057161936)) (f32 (3210331878)) (f32 (3217512269))
  = (5, 5791, 1, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0025 :
  samSubModeRoll_fun (f32 (1065353216)) 33 1 2570 15 (f32 (1070134512)) (f32 (1065477008)) (f32 (3220974439))
  = (33, 2571, 15, [1070134512; 1065477008; 3220974439]).
Proof. vm_compute. reflexivity. Qed.


Example t_0026 :
  samSubModeRoll_fun (f32 (1073741824)) 63 1 2884 11 (f32 (3197887541)) (f32 (1061956234)) (f32 (1040995334))
  = (63, 2885, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0027 :
  samSubModeRoll_fun (f32 (1073741824)) 1 1 3973 12 (f32 (3216389036)) (f32 (1069939435)) (f32 (1065626148))
  = (51, 0, 0, [3216389036; 1069939435; 1065626148]).
Proof. vm_compute. reflexivity. Qed.


Example t_0028 :
  samSubModeRoll_fun (f32 (1036229249)) 35 0 6250 13 (f32 (3217949972)) (f32 (3217457875)) (f32 (3217658163))
  = (17, 0, 0, [3217949972; 3217457875; 3217658163]).
Proof. vm_compute. reflexivity. Qed.


Example t_0029 :
  samSubModeRoll_fun (f32 (1058991038)) 22 0 6249 16 (f32 (3196229991)) (f32 (1061809718)) (f32 (1056852913))
  = (22, 6250, 0, [3196229991; 1061809718; 1056852913]).
Proof. vm_compute. reflexivity. Qed.


Example t_0030 :
  samSubModeRoll_fun (f32 (1073741824)) 75 2 2758 5 (f32 (1065368303)) (f32 (3218719858)) (f32 (1047260439))
  = (75, 2759, 0, [1065368303; 3218719858; 1047260439]).
Proof. vm_compute. reflexivity. Qed.


Example t_0031 :
  samSubModeRoll_fun (f32 (1073741824)) 16 1 6250 12 (f32 (3188818885)) (f32 (1065074083)) (f32 (1055841893))
  = (51, 0, 0, [3188818885; 1065074083; 1055841893]).
Proof. vm_compute. reflexivity. Qed.


Example t_0032 :
  samSubModeRoll_fun (f32 (2143289344)) 70 1 15 5 (f32 (3212477275)) (f32 (1072175081)) (f32 (1023478701))
  = (70, 16, 5, [3212477275; 1072175081; 1023478701]).
Proof. vm_compute. reflexivity. Qed.


Example t_0033 :
  samSubModeRoll_fun (f32 (2139095040)) 34 1 1240 5 (f32 (1059526133)) (f32 (3217560728)) (f32 (3207258472))
  = (34, 1241, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0034 :
  samSubModeRoll_fun (f32 (1062627586)) 16 0 4294967295 0 (f32 (1062602473)) (f32 (1073179651)) (f32 (1054266651))
  = (16, 0, 0, [1062602473; 1073179651; 1054266651]).
Proof. vm_compute. reflexivity. Qed.


Example t_0035 :
  samSubModeRoll_fun (f32 (1073741824)) 15 1 6945 4294967295 (f32 (1066044585)) (f32 (1063296374)) (f32 (1064913438))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0036 :
  samSubModeRoll_fun (f32 (1052670515)) 39 1 5146 2 (f32 (3218669712)) (f32 (3212711714)) (f32 (1062865385))
  = (39, 5147, 2, [3218669712; 3212711714; 1062865385]).
Proof. vm_compute. reflexivity. Qed.


Example t_0037 :
  samSubModeRoll_fun (f32 (1065353216)) 55 1 2409 14 (f32 (1046691446)) (f32 (3219625895)) (f32 (3218540640))
  = (55, 2410, 14, [1046691446; 3219625895; 3218540640]).
Proof. vm_compute. reflexivity. Qed.


Example t_0038 :
  samSubModeRoll_fun (f32 (1073741824)) 77 1 7983 11 (f32 (3207263029)) (f32 (3193645265)) (f32 (1073332472))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0039 :
  samSubModeRoll_fun (f32 (1073741824)) 37 1 6932 12 (f32 (1040419934)) (f32 (1064559897)) (f32 (1019798720))
  = (51, 0, 0, [1040419934; 1064559897; 1019798720]).
Proof. vm_compute. reflexivity. Qed.


Example t_0040 :
  samSubModeRoll_fun (f32 (1068673061)) 49 0 6250 13 (f32 (3214595911)) (f32 (3204672129)) (f32 (3217265733))
  = (17, 0, 0, [3214595911; 3204672129; 3217265733]).
Proof. vm_compute. reflexivity. Qed.


Example t_0041 :
  samSubModeRoll_fun (f32 (1074895641)) 32 0 6249 13 (f32 (3158974943)) (f32 (1072383477)) (f32 (1072186938))
  = (32, 6250, 0, [3158974943; 1072383477; 1072186938]).
Proof. vm_compute. reflexivity. Qed.


Example t_0042 :
  samSubModeRoll_fun (f32 (1073741824)) 72 2 4672 5 (f32 (1062277772)) (f32 (3217226311)) (f32 (3219608063))
  = (72, 4673, 0, [1062277772; 3217226311; 3219608063]).
Proof. vm_compute. reflexivity. Qed.


Example t_0043 :
  samSubModeRoll_fun (f32 (1073741824)) 68 1 6250 12 (f32 (3213705094)) (f32 (3197869720)) (f32 (3209758038))
  = (51, 0, 0, [3213705094; 3197869720; 3209758038]).
Proof. vm_compute. reflexivity. Qed.


Example t_0044 :
  samSubModeRoll_fun (f32 (2143289344)) 29 1 4896 5 (f32 (1064679558)) (f32 (3193549960)) (f32 (1068240710))
  = (29, 4897, 5, [1064679558; 3193549960; 1068240710]).
Proof. vm_compute. reflexivity. Qed.


Example t_0045 :
  samSubModeRoll_fun (f32 (2139095040)) 52 1 6667 5 (f32 (1067724626)) (f32 (1035846124)) (f32 (3217701016))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0046 :
  samSubModeRoll_fun (f32 (1037544097)) 23 0 4294967295 15 (f32 (1034288431)) (f32 (1068101142)) (f32 (3192952626))
  = (23, 0, 0, [1034288431; 1068101142; 3192952626]).
Proof. vm_compute. reflexivity. Qed.


Example t_0047 :
  samSubModeRoll_fun (f32 (1073741824)) 41 1 578 4294967295 (f32 (1067214755)) (f32 (1058118270)) (f32 (1047675084))
  = (41, 579, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0048 :
  samSubModeRoll_fun (f32 (3213099503)) 60 0 2178 0 (f32 (3219475181)) (f32 (1071458581)) (f32 (1069841201))
  = (60, 2179, 0, [3219475181; 1071458581; 1069841201]).
Proof. vm_compute. reflexivity. Qed.


Example t_0049 :
  samSubModeRoll_fun (f32 (1065353216)) 5 1 3483 12 (f32 (1072528841)) (f32 (3206037066)) (f32 (3211133370))
  = (5, 3484, 12, [1072528841; 3206037066; 3211133370]).
Proof. vm_compute. reflexivity. Qed.


Example t_0050 :
  samSubModeRoll_fun (f32 (1073741824)) 68 1 4869 11 (f32 (3221089112)) (f32 (1070346883)) (f32 (1071036320))
  = (68, 4870, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0051 :
  samSubModeRoll_fun (f32 (1073741824)) 3 1 6434 12 (f32 (1065485787)) (f32 (1072269779)) (f32 (1073173801))
  = (51, 0, 0, [1065485787; 1072269779; 1073173801]).
Proof. vm_compute. reflexivity. Qed.


Example t_0052 :
  samSubModeRoll_fun (f32 (3202704931)) 26 0 6250 10 (f32 (1072835199)) (f32 (1068038290)) (f32 (3201819331))
  = (17, 0, 0, [1072835199; 1068038290; 3201819331]).
Proof. vm_compute. reflexivity. Qed.


Example t_0053 :
  samSubModeRoll_fun (f32 (1065568258)) 57 0 6249 3 (f32 (3186226679)) (f32 (1038705547)) (f32 (1060107862))
  = (57, 6250, 0, [3186226679; 1038705547; 1060107862]).
Proof. vm_compute. reflexivity. Qed.


Example t_0054 :
  samSubModeRoll_fun (f32 (1073741824)) 39 2 7341 5 (f32 (3204798765)) (f32 (1045899468)) (f32 (1067549488))
  = (17, 0, 0, [3204798765; 1045899468; 1067549488]).
Proof. vm_compute. reflexivity. Qed.


Example t_0055 :
  samSubModeRoll_fun (f32 (1073741824)) 11 1 6250 12 (f32 (1041371425)) (f32 (1067106368)) (f32 (3184624838))
  = (51, 0, 0, [1041371425; 1067106368; 3184624838]).
Proof. vm_compute. reflexivity. Qed.


Example t_0056 :
  samSubModeRoll_fun (f32 (2143289344)) 26 1 7159 5 (f32 (1069957769)) (f32 (1067916466)) (f32 (1069685843))
  = (17, 0, 0, [1069957769; 1067916466; 1069685843]).
Proof. vm_compute. reflexivity. Qed.


Example t_0057 :
  samSubModeRoll_fun (f32 (2139095040)) 32 1 869 5 (f32 (3220144305)) (f32 (3213838904)) (f32 (1028987905))
  = (32, 870, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0058 :
  samSubModeRoll_fun (f32 (1073012528)) 70 0 4294967295 17 (f32 (3213985868)) (f32 (3213485683)) (f32 (3214413002))
  = (70, 0, 0, [3213985868; 3213485683; 3214413002]).
Proof. vm_compute. reflexivity. Qed.


Example t_0059 :
  samSubModeRoll_fun (f32 (1073741824)) 76 1 6079 4294967295 (f32 (1054430270)) (f32 (1055780969)) (f32 (3212852570))
  = (76, 6080, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0060 :
  samSubModeRoll_fun (f32 (1070258119)) 26 1 2315 3 (f32 (1062641235)) (f32 (1060354883)) (f32 (1038361534))
  = (26, 2316, 4, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0061 :
  samSubModeRoll_fun (f32 (1065353216)) 70 1 4538 3 (f32 (1062239267)) (f32 (1029446271)) (f32 (3219161116))
  = (70, 4539, 3, [1062239267; 1029446271; 3219161116]).
Proof. vm_compute. reflexivity. Qed.


Example t_0062 :
  samSubModeRoll_fun (f32 (1073741824)) 41 1 5903 11 (f32 (1044303575)) (f32 (1071956277)) (f32 (1065103384))
  = (41, 5904, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0063 :
  samSubModeRoll_fun (f32 (1073741824)) 56 1 4769 12 (f32 (1066874255)) (f32 (3218886286)) (f32 (3196689907))
  = (51, 0, 0, [1066874255; 3218886286; 3196689907]).
Proof. vm_compute. reflexivity. Qed.


Example t_0064 :
  samSubModeRoll_fun (f32 (3213433398)) 53 0 6250 12 (f32 (1042385206)) (f32 (1046215325)) (f32 (1070113883))
  = (17, 0, 0, [1042385206; 1046215325; 1070113883]).
Proof. vm_compute. reflexivity. Qed.


Example t_0065 :
  samSubModeRoll_fun (f32 (3212582990)) 73 0 6249 0 (f32 (1073002376)) (f32 (1069933055)) (f32 (3212002923))
  = (73, 6250, 0, [1073002376; 1069933055; 3212002923]).
Proof. vm_compute. reflexivity. Qed.


Example t_0066 :
  samSubModeRoll_fun (f32 (1073741824)) 39 2 2574 5 (f32 (3215515657)) (f32 (1069129404)) (f32 (1068145199))
  = (39, 2575, 0, [3215515657; 1069129404; 1068145199]).
Proof. vm_compute. reflexivity. Qed.


Example t_0067 :
  samSubModeRoll_fun (f32 (1073741824)) 13 1 6250 12 (f32 (3189059869)) (f32 (1058351922)) (f32 (1073203778))
  = (51, 0, 0, [3189059869; 1058351922; 1073203778]).
Proof. vm_compute. reflexivity. Qed.


Example t_0068 :
  samSubModeRoll_fun (f32 (2143289344)) 71 1 7113 5 (f32 (1065867231)) (f32 (1067385425)) (f32 (1065723490))
  = (17, 0, 0, [1065867231; 1067385425; 1065723490]).
Proof. vm_compute. reflexivity. Qed.


Example t_0069 :
  samSubModeRoll_fun (f32 (2139095040)) 0 1 4643 5 (f32 (3211125250)) (f32 (3191118895)) (f32 (3181059525))
  = (0, 4644, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0070 :
  samSubModeRoll_fun (f32 (3210571536)) 14 0 4294967295 14 (f32 (3210853728)) (f32 (1037501391)) (f32 (1065853256))
  = (14, 0, 0, [3210853728; 1037501391; 1065853256]).
Proof. vm_compute. reflexivity. Qed.


Example t_0071 :
  samSubModeRoll_fun (f32 (1073741824)) 36 1 132 4294967295 (f32 (3216220026)) (f32 (1054313511)) (f32 (3219695502))
  = (36, 133, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0072 :
  samSubModeRoll_fun (f32 (3192010065)) 59 0 1235 7 (f32 (3203204065)) (f32 (3205937856)) (f32 (1066748883))
  = (59, 1236, 0, [3203204065; 3205937856; 1066748883]).
Proof. vm_compute. reflexivity. Qed.


Example t_0073 :
  samSubModeRoll_fun (f32 (1065353216)) 5 1 94 20 (f32 (3198585618)) (f32 (3221220259)) (f32 (3209623420))
  = (5, 95, 20, [3198585618; 3221220259; 3209623420]).
Proof. vm_compute. reflexivity. Qed.


Example t_0074 :
  samSubModeRoll_fun (f32 (1073741824)) 15 1 7011 11 (f32 (3131062825)) (f32 (1062627223)) (f32 (3213637461))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0075 :
  samSubModeRoll_fun (f32 (1073741824)) 34 1 1580 12 (f32 (1050381852)) (f32 (1073089196)) (f32 (1062874184))
  = (51, 0, 0, [1050381852; 1073089196; 1062874184]).
Proof. vm_compute. reflexivity. Qed.


Example t_0076 :
  samSubModeRoll_fun (f32 (3216830303)) 40 0 6250 13 (f32 (1046881370)) (f32 (3213750872)) (f32 (3188298025))
  = (17, 0, 0, [1046881370; 3213750872; 3188298025]).
Proof. vm_compute. reflexivity. Qed.


Example t_0077 :
  samSubModeRoll_fun (f32 (1075254840)) 29 0 6249 3 (f32 (1042749792)) (f32 (1072180383)) (f32 (3197664163))
  = (29, 6250, 0, [1042749792; 1072180383; 3197664163]).
Proof. vm_compute. reflexivity. Qed.


Example t_0078 :
  samSubModeRoll_fun (f32 (1073741824)) 44 2 5255 5 (f32 (1068050794)) (f32 (3204365847)) (f32 (3206499875))
  = (44, 5256, 0, [1068050794; 3204365847; 3206499875]).
Proof. vm_compute. reflexivity. Qed.


Example t_0079 :
  samSubModeRoll_fun (f32 (1073741824)) 66 1 6250 12 (f32 (1032453033)) (f32 (3216364110)) (f32 (1071168138))
  = (51, 0, 0, [1032453033; 3216364110; 1071168138]).
Proof. vm_compute. reflexivity. Qed.


Example t_0080 :
  samSubModeRoll_fun (f32 (2143289344)) 61 1 1140 5 (f32 (3211791795)) (f32 (1066210158)) (f32 (3217691443))
  = (61, 1141, 5, [3211791795; 1066210158; 3217691443]).
Proof. vm_compute. reflexivity. Qed.


Example t_0081 :
  samSubModeRoll_fun (f32 (2139095040)) 62 1 5237 5 (f32 (3209323735)) (f32 (3171186377)) (f32 (3197131771))
  = (62, 5238, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0082 :
  samSubModeRoll_fun (f32 (1077682852)) 16 0 4294967295 20 (f32 (1066550201)) (f32 (3190093345)) (f32 (1062804575))
  = (16, 0, 0, [1066550201; 3190093345; 1062804575]).
Proof. vm_compute. reflexivity. Qed.


Example t_0083 :
  samSubModeRoll_fun (f32 (1073741824)) 38 1 4853 4294967295 (f32 (1065947527)) (f32 (3209586877)) (f32 (3180898084))
  = (38, 4854, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0084 :
  samSubModeRoll_fun (f32 (3211921377)) 19 0 6610 8 (f32 (1062159453)) (f32 (1064868970)) (f32 (3221080600))
  = (17, 0, 0, [1062159453; 1064868970; 3221080600]).
Proof. vm_compute. reflexivity. Qed.


Example t_0085 :
  samSubModeRoll_fun (f32 (1065353216)) 15 1 7304 20 (f32 (1070360320)) (f32 (3220568718)) (f32 (1064796518))
  = (17, 0, 0, [1070360320; 3220568718; 1064796518]).
Proof. vm_compute. reflexivity. Qed.


Example t_0086 :
  samSubModeRoll_fun (f32 (1073741824)) 79 1 5374 11 (f32 (3209159911)) (f32 (1072016057)) (f32 (1065207498))
  = (79, 5375, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0087 :
  samSubModeRoll_fun (f32 (1073741824)) 60 1 1522 12 (f32 (1054803530)) (f32 (1067936143)) (f32 (3218650585))
  = (51, 0, 0, [1054803530; 1067936143; 3218650585]).
Proof. vm_compute. reflexivity. Qed.


Example t_0088 :
  samSubModeRoll_fun (f32 (3219513700)) 66 0 6250 11 (f32 (3196988575)) (f32 (3219957496)) (f32 (1073227090))
  = (17, 0, 0, [3196988575; 3219957496; 1073227090]).
Proof. vm_compute. reflexivity. Qed.


Example t_0089 :
  samSubModeRoll_fun (f32 (3176946769)) 9 0 6249 12 (f32 (3217854304)) (f32 (1062779512)) (f32 (1065845995))
  = (9, 6250, 0, [3217854304; 1062779512; 1065845995]).
Proof. vm_compute. reflexivity. Qed.


Example t_0090 :
  samSubModeRoll_fun (f32 (1073741824)) 51 2 1871 5 (f32 (3200218228)) (f32 (1067422099)) (f32 (1069580101))
  = (51, 1872, 0, [3200218228; 1067422099; 1069580101]).
Proof. vm_compute. reflexivity. Qed.


Example t_0091 :
  samSubModeRoll_fun (f32 (1073741824)) 45 1 6250 12 (f32 (1044445133)) (f32 (3215086259)) (f32 (1060321237))
  = (51, 0, 0, [1044445133; 3215086259; 1060321237]).
Proof. vm_compute. reflexivity. Qed.


Example t_0092 :
  samSubModeRoll_fun (f32 (2143289344)) 67 1 1322 5 (f32 (1068053398)) (f32 (1063749764)) (f32 (1053607182))
  = (67, 1323, 5, [1068053398; 1063749764; 1053607182]).
Proof. vm_compute. reflexivity. Qed.


Example t_0093 :
  samSubModeRoll_fun (f32 (2139095040)) 24 1 7381 5 (f32 (1059814714)) (f32 (1069721464)) (f32 (3218274710))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0094 :
  samSubModeRoll_fun (f32 (3214136192)) 49 0 4294967295 10 (f32 (3218641214)) (f32 (1023843600)) (f32 (3217344006))
  = (49, 0, 0, [3218641214; 1023843600; 3217344006]).
Proof. vm_compute. reflexivity. Qed.


Example t_0095 :
  samSubModeRoll_fun (f32 (1073741824)) 65 1 1440 4294967295 (f32 (1065571667)) (f32 (3207988370)) (f32 (3207340233))
  = (65, 1441, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0096 :
  samSubModeRoll_fun (f32 (1056679580)) 74 1 1027 13 (f32 (3211872564)) (f32 (3177179069)) (f32 (1046639389))
  = (74, 1028, 13, [3211872564; 3177179069; 1046639389]).
Proof. vm_compute. reflexivity. Qed.


Example t_0097 :
  samSubModeRoll_fun (f32 (1065353216)) 12 1 6560 13 (f32 (1066521155)) (f32 (1060975583)) (f32 (3201742535))
  = (17, 0, 0, [1066521155; 1060975583; 3201742535]).
Proof. vm_compute. reflexivity. Qed.


Example t_0098 :
  samSubModeRoll_fun (f32 (1073741824)) 21 1 5278 11 (f32 (3209356536)) (f32 (3208401224)) (f32 (3181934359))
  = (21, 5279, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0099 :
  samSubModeRoll_fun (f32 (1073741824)) 62 1 4408 12 (f32 (3212992866)) (f32 (3203296651)) (f32 (1072575945))
  = (51, 0, 0, [3212992866; 3203296651; 1072575945]).
Proof. vm_compute. reflexivity. Qed.


Example t_0100 :
  samSubModeRoll_fun (f32 (1071649489)) 79 0 6250 20 (f32 (1058705026)) (f32 (3207238431)) (f32 (1052758461))
  = (17, 0, 0, [1058705026; 3207238431; 1052758461]).
Proof. vm_compute. reflexivity. Qed.


Example t_0101 :
  samSubModeRoll_fun (f32 (3191561560)) 48 0 6249 0 (f32 (3218974844)) (f32 (1068828381)) (f32 (3208383894))
  = (48, 6250, 0, [3218974844; 1068828381; 3208383894]).
Proof. vm_compute. reflexivity. Qed.


Example t_0102 :
  samSubModeRoll_fun (f32 (1073741824)) 49 2 4982 5 (f32 (3215901658)) (f32 (3218578358)) (f32 (1058100393))
  = (49, 4983, 0, [3215901658; 3218578358; 1058100393]).
Proof. vm_compute. reflexivity. Qed.


Example t_0103 :
  samSubModeRoll_fun (f32 (1073741824)) 64 1 6250 12 (f32 (1037792319)) (f32 (3213945440)) (f32 (3218437228))
  = (51, 0, 0, [1037792319; 3213945440; 3218437228]).
Proof. vm_compute. reflexivity. Qed.


Example t_0104 :
  samSubModeRoll_fun (f32 (2143289344)) 12 1 4787 5 (f32 (3212230077)) (f32 (1066076838)) (f32 (1072626934))
  = (12, 4788, 5, [3212230077; 1066076838; 1072626934]).
Proof. vm_compute. reflexivity. Qed.


Example t_0105 :
  samSubModeRoll_fun (f32 (2139095040)) 14 1 141 5 (f32 (1068569045)) (f32 (3217765626)) (f32 (3217567618))
  = (14, 142, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0106 :
  samSubModeRoll_fun (f32 (1075465359)) 65 0 4294967295 14 (f32 (3211265555)) (f32 (3213568318)) (f32 (3176227566))
  = (65, 0, 0, [3211265555; 3213568318; 3176227566]).
Proof. vm_compute. reflexivity. Qed.


Example t_0107 :
  samSubModeRoll_fun (f32 (1073741824)) 50 1 6214 4294967295 (f32 (1049250881)) (f32 (1057744738)) (f32 (1070755405))
  = (50, 6215, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0108 :
  samSubModeRoll_fun (f32 (1076968697)) 51 0 7496 13 (f32 (3212659164)) (f32 (1064966087)) (f32 (3204957489))
  = (17, 0, 0, [3212659164; 1064966087; 3204957489]).
Proof. vm_compute. reflexivity. Qed.


Example t_0109 :
  samSubModeRoll_fun (f32 (1065353216)) 43 1 1468 14 (f32 (3204454376)) (f32 (3216988730)) (f32 (3215692088))
  = (43, 1469, 14, [3204454376; 3216988730; 3215692088]).
Proof. vm_compute. reflexivity. Qed.


Example t_0110 :
  samSubModeRoll_fun (f32 (1073741824)) 42 1 155 11 (f32 (1066357235)) (f32 (3205369012)) (f32 (3202522308))
  = (42, 156, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0111 :
  samSubModeRoll_fun (f32 (1073741824)) 2 1 4924 12 (f32 (3208154971)) (f32 (3217948260)) (f32 (1059924996))
  = (51, 0, 0, [3208154971; 3217948260; 1059924996]).
Proof. vm_compute. reflexivity. Qed.


Example t_0112 :
  samSubModeRoll_fun (f32 (1061999562)) 52 0 6250 3 (f32 (1071905541)) (f32 (1056906900)) (f32 (3197945026))
  = (17, 0, 0, [1071905541; 1056906900; 3197945026]).
Proof. vm_compute. reflexivity. Qed.


Example t_0113 :
  samSubModeRoll_fun (f32 (1065394974)) 79 0 6249 5 (f32 (1050710852)) (f32 (1052228292)) (f32 (1067058129))
  = (79, 6250, 0, [1050710852; 1052228292; 1067058129]).
Proof. vm_compute. reflexivity. Qed.


Example t_0114 :
  samSubModeRoll_fun (f32 (1073741824)) 15 2 561 5 (f32 (3203871017)) (f32 (1067528000)) (f32 (1073501152))
  = (15, 562, 0, [3203871017; 1067528000; 1073501152]).
Proof. vm_compute. reflexivity. Qed.


Example t_0115 :
  samSubModeRoll_fun (f32 (1073741824)) 6 1 6250 12 (f32 (3207968899)) (f32 (1066016681)) (f32 (1062615734))
  = (51, 0, 0, [3207968899; 1066016681; 1062615734]).
Proof. vm_compute. reflexivity. Qed.


Example t_0116 :
  samSubModeRoll_fun (f32 (2143289344)) 25 1 3482 5 (f32 (1039689624)) (f32 (1063118336)) (f32 (1060451497))
  = (25, 3483, 5, [1039689624; 1063118336; 1060451497]).
Proof. vm_compute. reflexivity. Qed.


Example t_0117 :
  samSubModeRoll_fun (f32 (2139095040)) 35 1 910 5 (f32 (1069593900)) (f32 (3205386931)) (f32 (1071600886))
  = (35, 911, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0118 :
  samSubModeRoll_fun (f32 (3206182548)) 73 0 4294967295 9 (f32 (3220075846)) (f32 (1072391561)) (f32 (1072462848))
  = (73, 0, 0, [3220075846; 1072391561; 1072462848]).
Proof. vm_compute. reflexivity. Qed.


Example t_0119 :
  samSubModeRoll_fun (f32 (1073741824)) 8 1 4944 4294967295 (f32 (1056064897)) (f32 (3218370688)) (f32 (1061410817))
  = (8, 4945, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0120 :
  samSubModeRoll_fun (f32 (3217599304)) 71 1 6004 5 (f32 (3188748267)) (f32 (3201311504)) (f32 (3213777529))
  = (71, 6005, 5, [3188748267; 3201311504; 3213777529]).
Proof. vm_compute. reflexivity. Qed.


Example t_0121 :
  samSubModeRoll_fun (f32 (1065353216)) 33 1 218 15 (f32 (3217489448)) (f32 (3209277513)) (f32 (1065545457))
  = (33, 219, 15, [3217489448; 3209277513; 1065545457]).
Proof. vm_compute. reflexivity. Qed.


Example t_0122 :
  samSubModeRoll_fun (f32 (1073741824)) 28 1 379 11 (f32 (1013592604)) (f32 (1073649567)) (f32 (1073091721))
  = (28, 380, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0123 :
  samSubModeRoll_fun (f32 (1073741824)) 34 1 7446 12 (f32 (3186925553)) (f32 (3206171677)) (f32 (3213665079))
  = (51, 0, 0, [3186925553; 3206171677; 3213665079]).
Proof. vm_compute. reflexivity. Qed.


Example t_0124 :
  samSubModeRoll_fun (f32 (3214367590)) 44 0 6250 15 (f32 (3192685881)) (f32 (3216564078)) (f32 (3206882931))
  = (17, 0, 0, [3192685881; 3216564078; 3206882931]).
Proof. vm_compute. reflexivity. Qed.


Example t_0125 :
  samSubModeRoll_fun (f32 (1048599707)) 71 0 6249 12 (f32 (1066387323)) (f32 (1016530537)) (f32 (3219518831))
  = (71, 6250, 0, [1066387323; 1016530537; 3219518831]).
Proof. vm_compute. reflexivity. Qed.


Example t_0126 :
  samSubModeRoll_fun (f32 (1073741824)) 24 2 6094 5 (f32 (1072372826)) (f32 (3219225781)) (f32 (3190920990))
  = (24, 6095, 0, [1072372826; 3219225781; 3190920990]).
Proof. vm_compute. reflexivity. Qed.


Example t_0127 :
  samSubModeRoll_fun (f32 (1073741824)) 31 1 6250 12 (f32 (3201001371)) (f32 (3220247372)) (f32 (1061849114))
  = (51, 0, 0, [3201001371; 3220247372; 1061849114]).
Proof. vm_compute. reflexivity. Qed.


Example t_0128 :
  samSubModeRoll_fun (f32 (2143289344)) 47 1 3048 5 (f32 (1073299619)) (f32 (3219619582)) (f32 (3215531253))
  = (47, 3049, 5, [1073299619; 3219619582; 3215531253]).
Proof. vm_compute. reflexivity. Qed.


Example t_0129 :
  samSubModeRoll_fun (f32 (2139095040)) 78 1 7608 5 (f32 (3204216250)) (f32 (1067996903)) (f32 (1067370740))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0130 :
  samSubModeRoll_fun (f32 (3218074100)) 40 0 4294967295 8 (f32 (3204381820)) (f32 (1041818433)) (f32 (1067071656))
  = (40, 0, 0, [3204381820; 1041818433; 1067071656]).
Proof. vm_compute. reflexivity. Qed.


Example t_0131 :
  samSubModeRoll_fun (f32 (1073741824)) 4 1 1152 4294967295 (f32 (1041930909)) (f32 (1067535904)) (f32 (1027246500))
  = (4, 1153, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0132 :
  samSubModeRoll_fun (f32 (1076277985)) 39 1 6656 1 (f32 (3209256212)) (f32 (3214787602)) (f32 (3204628489))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0133 :
  samSubModeRoll_fun (f32 (1065353216)) 2 1 6700 2 (f32 (3217124306)) (f32 (1058625748)) (f32 (1069926332))
  = (17, 0, 0, [3217124306; 1058625748; 1069926332]).
Proof. vm_compute. reflexivity. Qed.


Example t_0134 :
  samSubModeRoll_fun (f32 (1073741824)) 73 1 6962 11 (f32 (3219231043)) (f32 (3173166574)) (f32 (3162695287))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0135 :
  samSubModeRoll_fun (f32 (1073741824)) 26 1 2432 12 (f32 (1056214778)) (f32 (3184733705)) (f32 (3190554310))
  = (51, 0, 0, [1056214778; 3184733705; 3190554310]).
Proof. vm_compute. reflexivity. Qed.


Example t_0136 :
  samSubModeRoll_fun (f32 (1074698531)) 46 0 6250 1 (f32 (1072929247)) (f32 (3184369913)) (f32 (1070231066))
  = (17, 0, 0, [1072929247; 3184369913; 1070231066]).
Proof. vm_compute. reflexivity. Qed.


Example t_0137 :
  samSubModeRoll_fun (f32 (1075610568)) 41 0 6249 4 (f32 (1069990011)) (f32 (1066004500)) (f32 (1070824152))
  = (41, 6250, 0, [1069990011; 1066004500; 1070824152]).
Proof. vm_compute. reflexivity. Qed.


Example t_0138 :
  samSubModeRoll_fun (f32 (1073741824)) 39 2 4930 5 (f32 (3197314620)) (f32 (3214068513)) (f32 (3209428192))
  = (39, 4931, 0, [3197314620; 3214068513; 3209428192]).
Proof. vm_compute. reflexivity. Qed.


Example t_0139 :
  samSubModeRoll_fun (f32 (1073741824)) 2 1 6250 12 (f32 (3207876259)) (f32 (3207407288)) (f32 (3220650625))
  = (51, 0, 0, [3207876259; 3207407288; 3220650625]).
Proof. vm_compute. reflexivity. Qed.


Example t_0140 :
  samSubModeRoll_fun (f32 (2143289344)) 17 1 2101 5 (f32 (1071319007)) (f32 (3188078195)) (f32 (1073162539))
  = (17, 2102, 5, [1071319007; 3188078195; 1073162539]).
Proof. vm_compute. reflexivity. Qed.


Example t_0141 :
  samSubModeRoll_fun (f32 (2139095040)) 63 1 6243 5 (f32 (1073390070)) (f32 (1069492472)) (f32 (3218043929))
  = (63, 6244, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0142 :
  samSubModeRoll_fun (f32 (3219898026)) 48 0 4294967295 14 (f32 (3211805555)) (f32 (1068914933)) (f32 (3201875339))
  = (48, 0, 0, [3211805555; 1068914933; 3201875339]).
Proof. vm_compute. reflexivity. Qed.


Example t_0143 :
  samSubModeRoll_fun (f32 (1073741824)) 2 1 4076 4294967295 (f32 (3214718417)) (f32 (1061340673)) (f32 (3221019379))
  = (2, 4077, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0144 :
  samSubModeRoll_fun (f32 (1072307663)) 63 1 4975 1 (f32 (3220119202)) (f32 (1021601715)) (f32 (1065866122))
  = (63, 4976, 2, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0145 :
  samSubModeRoll_fun (f32 (1065353216)) 60 1 1324 0 (f32 (1061296484)) (f32 (1050804497)) (f32 (1060814307))
  = (60, 1325, 0, [1061296484; 1050804497; 1060814307]).
Proof. vm_compute. reflexivity. Qed.


Example t_0146 :
  samSubModeRoll_fun (f32 (1073741824)) 18 1 146 11 (f32 (1067394215)) (f32 (1073004794)) (f32 (3214080413))
  = (18, 147, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0147 :
  samSubModeRoll_fun (f32 (1073741824)) 22 1 5356 12 (f32 (1039392370)) (f32 (1070910827)) (f32 (1050129658))
  = (51, 0, 0, [1039392370; 1070910827; 1050129658]).
Proof. vm_compute. reflexivity. Qed.


Example t_0148 :
  samSubModeRoll_fun (f32 (3213326643)) 16 0 6250 18 (f32 (1064548644)) (f32 (3216295091)) (f32 (1072722473))
  = (17, 0, 0, [1064548644; 3216295091; 1072722473]).
Proof. vm_compute. reflexivity. Qed.


Example t_0149 :
  samSubModeRoll_fun (f32 (3217514018)) 35 0 6249 15 (f32 (3219622384)) (f32 (1069197906)) (f32 (1072712973))
  = (35, 6250, 0, [3219622384; 1069197906; 1072712973]).
Proof. vm_compute. reflexivity. Qed.


Example t_0150 :
  samSubModeRoll_fun (f32 (1073741824)) 25 2 177 5 (f32 (1057887869)) (f32 (3213509238)) (f32 (3188208790))
  = (25, 178, 0, [1057887869; 3213509238; 3188208790]).
Proof. vm_compute. reflexivity. Qed.


Example t_0151 :
  samSubModeRoll_fun (f32 (1073741824)) 46 1 6250 12 (f32 (3215248879)) (f32 (1029839517)) (f32 (3220866660))
  = (51, 0, 0, [3215248879; 1029839517; 3220866660]).
Proof. vm_compute. reflexivity. Qed.


Example t_0152 :
  samSubModeRoll_fun (f32 (2143289344)) 5 1 7647 5 (f32 (3215393604)) (f32 (3208290204)) (f32 (1071376573))
  = (17, 0, 0, [3215393604; 3208290204; 1071376573]).
Proof. vm_compute. reflexivity. Qed.


Example t_0153 :
  samSubModeRoll_fun (f32 (2139095040)) 65 1 3506 5 (f32 (3205986198)) (f32 (3214687254)) (f32 (3218195409))
  = (65, 3507, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0154 :
  samSubModeRoll_fun (f32 (1064698679)) 31 0 4294967295 3 (f32 (3215819371)) (f32 (3205566511)) (f32 (3192451869))
  = (31, 0, 0, [3215819371; 3205566511; 3192451869]).
Proof. vm_compute. reflexivity. Qed.


Example t_0155 :
  samSubModeRoll_fun (f32 (1073741824)) 27 1 296 4294967295 (f32 (1061189295)) (f32 (3214236790)) (f32 (1047766541))
  = (27, 297, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0156 :
  samSubModeRoll_fun (f32 (1072074294)) 30 1 2096 10 (f32 (1066853618)) (f32 (1050399944)) (f32 (1073467974))
  = (30, 2097, 11, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0157 :
  samSubModeRoll_fun (f32 (1065353216)) 47 1 5552 13 (f32 (1051363130)) (f32 (3207365283)) (f32 (3218887258))
  = (47, 5553, 13, [1051363130; 3207365283; 3218887258]).
Proof. vm_compute. reflexivity. Qed.


Example t_0158 :
  samSubModeRoll_fun (f32 (1073741824)) 63 1 4012 11 (f32 (3219678484)) (f32 (3181529942)) (f32 (1067682898))
  = (63, 4013, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0159 :
  samSubModeRoll_fun (f32 (1073741824)) 11 1 5898 12 (f32 (1067559937)) (f32 (1072300322)) (f32 (3215812630))
  = (51, 0, 0, [1067559937; 1072300322; 3215812630]).
Proof. vm_compute. reflexivity. Qed.


Example t_0160 :
  samSubModeRoll_fun (f32 (1065865596)) 12 0 6250 17 (f32 (3217867001)) (f32 (1061360328)) (f32 (1067023198))
  = (17, 0, 0, [3217867001; 1061360328; 1067023198]).
Proof. vm_compute. reflexivity. Qed.


Example t_0161 :
  samSubModeRoll_fun (f32 (1068992476)) 13 0 6249 19 (f32 (1058028230)) (f32 (1069981075)) (f32 (3216964771))
  = (13, 6250, 0, [1058028230; 1069981075; 3216964771]).
Proof. vm_compute. reflexivity. Qed.


Example t_0162 :
  samSubModeRoll_fun (f32 (1073741824)) 24 2 2837 5 (f32 (1069990820)) (f32 (1071674999)) (f32 (3189809594))
  = (24, 2838, 0, [1069990820; 1071674999; 3189809594]).
Proof. vm_compute. reflexivity. Qed.


Example t_0163 :
  samSubModeRoll_fun (f32 (1073741824)) 19 1 6250 12 (f32 (3217030487)) (f32 (3216517191)) (f32 (3183322544))
  = (51, 0, 0, [3217030487; 3216517191; 3183322544]).
Proof. vm_compute. reflexivity. Qed.


Example t_0164 :
  samSubModeRoll_fun (f32 (2143289344)) 48 1 1680 5 (f32 (3214909387)) (f32 (1061008074)) (f32 (3213136000))
  = (48, 1681, 5, [3214909387; 1061008074; 3213136000]).
Proof. vm_compute. reflexivity. Qed.


Example t_0165 :
  samSubModeRoll_fun (f32 (2139095040)) 55 1 3505 5 (f32 (1068370673)) (f32 (3205071144)) (f32 (3217539208))
  = (55, 3506, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0166 :
  samSubModeRoll_fun (f32 (1040214015)) 56 0 4294967295 10 (f32 (1066529624)) (f32 (3220617810)) (f32 (3215123270))
  = (56, 0, 0, [1066529624; 3220617810; 3215123270]).
Proof. vm_compute. reflexivity. Qed.


Example t_0167 :
  samSubModeRoll_fun (f32 (1073741824)) 71 1 3571 4294967295 (f32 (1069861894)) (f32 (3213454274)) (f32 (3204644551))
  = (71, 3572, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0168 :
  samSubModeRoll_fun (f32 (1030170750)) 16 1 3207 20 (f32 (1062786470)) (f32 (1072855426)) (f32 (3202907856))
  = (16, 3208, 20, [1062786470; 1072855426; 3202907856]).
Proof. vm_compute. reflexivity. Qed.


Example t_0169 :
  samSubModeRoll_fun (f32 (1065353216)) 37 1 2620 16 (f32 (1055577288)) (f32 (3214875630)) (f32 (1062387432))
  = (37, 2621, 16, [1055577288; 3214875630; 1062387432]).
Proof. vm_compute. reflexivity. Qed.


Example t_0170 :
  samSubModeRoll_fun (f32 (1073741824)) 9 1 7420 11 (f32 (3177699647)) (f32 (3215259531)) (f32 (1066903912))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0171 :
  samSubModeRoll_fun (f32 (1073741824)) 60 1 7822 12 (f32 (3202086126)) (f32 (1066091037)) (f32 (3204910414))
  = (51, 0, 0, [3202086126; 1066091037; 3204910414]).
Proof. vm_compute. reflexivity. Qed.


Example t_0172 :
  samSubModeRoll_fun (f32 (3216393621)) 20 0 6250 3 (f32 (3214336489)) (f32 (1072566852)) (f32 (1071088326))
  = (17, 0, 0, [3214336489; 1072566852; 1071088326]).
Proof. vm_compute. reflexivity. Qed.


Example t_0173 :
  samSubModeRoll_fun (f32 (1076797165)) 57 0 6249 2 (f32 (1073065285)) (f32 (3207535654)) (f32 (1068963938))
  = (57, 6250, 0, [1073065285; 3207535654; 1068963938]).
Proof. vm_compute. reflexivity. Qed.


Example t_0174 :
  samSubModeRoll_fun (f32 (1073741824)) 20 2 6411 5 (f32 (1045029074)) (f32 (1059827593)) (f32 (1045173575))
  = (17, 0, 0, [1045029074; 1059827593; 1045173575]).
Proof. vm_compute. reflexivity. Qed.


Example t_0175 :
  samSubModeRoll_fun (f32 (1073741824)) 64 1 6250 12 (f32 (1071755286)) (f32 (3220979980)) (f32 (3188512631))
  = (51, 0, 0, [1071755286; 3220979980; 3188512631]).
Proof. vm_compute. reflexivity. Qed.


Example t_0176 :
  samSubModeRoll_fun (f32 (2143289344)) 53 1 1307 5 (f32 (3217441882)) (f32 (1073198686)) (f32 (1069705843))
  = (53, 1308, 5, [3217441882; 1073198686; 1069705843]).
Proof. vm_compute. reflexivity. Qed.


Example t_0177 :
  samSubModeRoll_fun (f32 (2139095040)) 66 1 6624 5 (f32 (1071125331)) (f32 (1065432536)) (f32 (1059270416))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0178 :
  samSubModeRoll_fun (f32 (1067872735)) 27 0 4294967295 7 (f32 (3202504519)) (f32 (1071608375)) (f32 (3191111210))
  = (27, 0, 0, [3202504519; 1071608375; 3191111210]).
Proof. vm_compute. reflexivity. Qed.


Example t_0179 :
  samSubModeRoll_fun (f32 (1073741824)) 68 1 2888 4294967295 (f32 (3216999733)) (f32 (3219769523)) (f32 (1073559860))
  = (68, 2889, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0180 :
  samSubModeRoll_fun (f32 (3215865512)) 67 1 5897 12 (f32 (1058435925)) (f32 (1009596324)) (f32 (1068019528))
  = (67, 5898, 12, [1058435925; 1009596324; 1068019528]).
Proof. vm_compute. reflexivity. Qed.


Example t_0181 :
  samSubModeRoll_fun (f32 (1065353216)) 38 1 449 18 (f32 (1051250602)) (f32 (1069388912)) (f32 (3197019634))
  = (38, 450, 18, [1051250602; 1069388912; 3197019634]).
Proof. vm_compute. reflexivity. Qed.


Example t_0182 :
  samSubModeRoll_fun (f32 (1073741824)) 38 1 4699 11 (f32 (3214906510)) (f32 (1060689588)) (f32 (1057810125))
  = (38, 4700, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0183 :
  samSubModeRoll_fun (f32 (1073741824)) 68 1 894 12 (f32 (1065385268)) (f32 (1062978039)) (f32 (3180109935))
  = (51, 0, 0, [1065385268; 1062978039; 3180109935]).
Proof. vm_compute. reflexivity. Qed.


Example t_0184 :
  samSubModeRoll_fun (f32 (1061640131)) 17 0 6250 14 (f32 (3202158483)) (f32 (3209586983)) (f32 (3211956045))
  = (17, 0, 0, [3202158483; 3209586983; 3211956045]).
Proof. vm_compute. reflexivity. Qed.


Example t_0185 :
  samSubModeRoll_fun (f32 (1071079016)) 54 0 6249 9 (f32 (1050622838)) (f32 (1065852258)) (f32 (3220730224))
  = (54, 6250, 0, [1050622838; 1065852258; 3220730224]).
Proof. vm_compute. reflexivity. Qed.


Example t_0186 :
  samSubModeRoll_fun (f32 (1073741824)) 30 2 5958 5 (f32 (3219307601)) (f32 (1069139593)) (f32 (3211150241))
  = (30, 5959, 0, [3219307601; 1069139593; 3211150241]).
Proof. vm_compute. reflexivity. Qed.


Example t_0187 :
  samSubModeRoll_fun (f32 (1073741824)) 32 1 6250 12 (f32 (1071839725)) (f32 (1054554175)) (f32 (1033004836))
  = (51, 0, 0, [1071839725; 1054554175; 1033004836]).
Proof. vm_compute. reflexivity. Qed.


Example t_0188 :
  samSubModeRoll_fun (f32 (2143289344)) 30 1 3259 5 (f32 (3207662529)) (f32 (1073175826)) (f32 (3205365675))
  = (30, 3260, 5, [3207662529; 1073175826; 3205365675]).
Proof. vm_compute. reflexivity. Qed.


Example t_0189 :
  samSubModeRoll_fun (f32 (2139095040)) 0 1 4353 5 (f32 (3199420749)) (f32 (1069078403)) (f32 (1049952230))
  = (0, 4354, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0190 :
  samSubModeRoll_fun (f32 (1077319128)) 44 0 4294967295 11 (f32 (3213900299)) (f32 (1070487286)) (f32 (3198568807))
  = (44, 0, 0, [3213900299; 1070487286; 3198568807]).
Proof. vm_compute. reflexivity. Qed.


Example t_0191 :
  samSubModeRoll_fun (f32 (1073741824)) 48 1 995 4294967295 (f32 (3208363496)) (f32 (3219747526)) (f32 (1037839496))
  = (48, 996, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0192 :
  samSubModeRoll_fun (f32 (3213450140)) 50 1 3093 18 (f32 (1057414246)) (f32 (1070788173)) (f32 (3218580197))
  = (50, 3094, 18, [1057414246; 1070788173; 3218580197]).
Proof. vm_compute. reflexivity. Qed.


Example t_0193 :
  samSubModeRoll_fun (f32 (1065353216)) 1 1 3104 12 (f32 (3214108655)) (f32 (1056263634)) (f32 (3217705392))
  = (1, 3105, 12, [3214108655; 1056263634; 3217705392]).
Proof. vm_compute. reflexivity. Qed.


Example t_0194 :
  samSubModeRoll_fun (f32 (1073741824)) 77 1 6594 11 (f32 (1071019022)) (f32 (1072446114)) (f32 (1070409107))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0195 :
  samSubModeRoll_fun (f32 (1073741824)) 26 1 6733 12 (f32 (1060021614)) (f32 (3179416666)) (f32 (1064156444))
  = (51, 0, 0, [1060021614; 3179416666; 1064156444]).
Proof. vm_compute. reflexivity. Qed.


Example t_0196 :
  samSubModeRoll_fun (f32 (3217471422)) 55 0 6250 5 (f32 (3219312214)) (f32 (3219151822)) (f32 (1058734915))
  = (17, 0, 0, [3219312214; 3219151822; 1058734915]).
Proof. vm_compute. reflexivity. Qed.


Example t_0197 :
  samSubModeRoll_fun (f32 (3213410478)) 46 0 6249 11 (f32 (1046135526)) (f32 (3212229771)) (f32 (3214717853))
  = (46, 6250, 0, [1046135526; 3212229771; 3214717853]).
Proof. vm_compute. reflexivity. Qed.


Example t_0198 :
  samSubModeRoll_fun (f32 (1073741824)) 19 2 4638 5 (f32 (3217723617)) (f32 (3215736127)) (f32 (1071546418))
  = (19, 4639, 0, [3217723617; 3215736127; 1071546418]).
Proof. vm_compute. reflexivity. Qed.


Example t_0199 :
  samSubModeRoll_fun (f32 (1073741824)) 3 1 6250 12 (f32 (1057012512)) (f32 (3199722327)) (f32 (3219891410))
  = (51, 0, 0, [1057012512; 3199722327; 3219891410]).
Proof. vm_compute. reflexivity. Qed.


Example t_0200 :
  samSubModeRoll_fun (f32 (2143289344)) 40 1 7510 5 (f32 (1072484378)) (f32 (3219702858)) (f32 (3220915212))
  = (17, 0, 0, [1072484378; 3219702858; 3220915212]).
Proof. vm_compute. reflexivity. Qed.


Example t_0201 :
  samSubModeRoll_fun (f32 (2139095040)) 68 1 7474 5 (f32 (1072246390)) (f32 (1065109493)) (f32 (3216633137))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0202 :
  samSubModeRoll_fun (f32 (1070272234)) 14 0 4294967295 9 (f32 (3198380200)) (f32 (3215825640)) (f32 (3211709269))
  = (14, 0, 0, [3198380200; 3215825640; 3211709269]).
Proof. vm_compute. reflexivity. Qed.


Example t_0203 :
  samSubModeRoll_fun (f32 (1073741824)) 45 1 2129 4294967295 (f32 (3199052553)) (f32 (1051145413)) (f32 (1072835814))
  = (45, 2130, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0204 :
  samSubModeRoll_fun (f32 (1077362129)) 35 0 5846 18 (f32 (3193014561)) (f32 (1057154212)) (f32 (1068435638))
  = (35, 5847, 0, [3193014561; 1057154212; 1068435638]).
Proof. vm_compute. reflexivity. Qed.


Example t_0205 :
  samSubModeRoll_fun (f32 (1065353216)) 6 1 296 15 (f32 (1062649149)) (f32 (3214829133)) (f32 (1071144301))
  = (6, 297, 15, [1062649149; 3214829133; 1071144301]).
Proof. vm_compute. reflexivity. Qed.


Example t_0206 :
  samSubModeRoll_fun (f32 (1073741824)) 34 1 3166 11 (f32 (3218055011)) (f32 (3217708530)) (f32 (3215420575))
  = (34, 3167, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0207 :
  samSubModeRoll_fun (f32 (1073741824)) 52 1 6336 12 (f32 (994152310)) (f32 (3220947712)) (f32 (1067118246))
  = (51, 0, 0, [994152310; 3220947712; 1067118246]).
Proof. vm_compute. reflexivity. Qed.


Example t_0208 :
  samSubModeRoll_fun (f32 (3220087235)) 38 0 6250 11 (f32 (1037498576)) (f32 (3220412966)) (f32 (1068345768))
  = (17, 0, 0, [1037498576; 3220412966; 1068345768]).
Proof. vm_compute. reflexivity. Qed.


Example t_0209 :
  samSubModeRoll_fun (f32 (1053359271)) 17 0 6249 8 (f32 (3203121870)) (f32 (3213621148)) (f32 (1064003434))
  = (17, 6250, 0, [3203121870; 3213621148; 1064003434]).
Proof. vm_compute. reflexivity. Qed.


Example t_0210 :
  samSubModeRoll_fun (f32 (1073741824)) 49 2 2269 5 (f32 (3203071083)) (f32 (3216471339)) (f32 (3204829639))
  = (49, 2270, 0, [3203071083; 3216471339; 3204829639]).
Proof. vm_compute. reflexivity. Qed.


Example t_0211 :
  samSubModeRoll_fun (f32 (1073741824)) 12 1 6250 12 (f32 (3220596486)) (f32 (3207363433)) (f32 (3183802012))
  = (51, 0, 0, [3220596486; 3207363433; 3183802012]).
Proof. vm_compute. reflexivity. Qed.


Example t_0212 :
  samSubModeRoll_fun (f32 (2143289344)) 23 1 2490 5 (f32 (3213501197)) (f32 (3213965454)) (f32 (1068991019))
  = (23, 2491, 5, [3213501197; 3213965454; 1068991019]).
Proof. vm_compute. reflexivity. Qed.


Example t_0213 :
  samSubModeRoll_fun (f32 (2139095040)) 36 1 6695 5 (f32 (1061853862)) (f32 (3211391033)) (f32 (1061868800))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0214 :
  samSubModeRoll_fun (f32 (3184628584)) 17 0 4294967295 9 (f32 (1067219871)) (f32 (1063568816)) (f32 (3189522036))
  = (17, 0, 0, [1067219871; 1063568816; 3189522036]).
Proof. vm_compute. reflexivity. Qed.


Example t_0215 :
  samSubModeRoll_fun (f32 (1073741824)) 46 1 3374 4294967295 (f32 (1065868769)) (f32 (3218769945)) (f32 (3218239170))
  = (46, 3375, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0216 :
  samSubModeRoll_fun (f32 (3214697917)) 67 0 404 18 (f32 (1044414181)) (f32 (3217077559)) (f32 (3217836704))
  = (67, 405, 0, [1044414181; 3217077559; 3217836704]).
Proof. vm_compute. reflexivity. Qed.


Example t_0217 :
  samSubModeRoll_fun (f32 (1065353216)) 18 1 6532 18 (f32 (1070875680)) (f32 (1059259848)) (f32 (1063225800))
  = (17, 0, 0, [1070875680; 1059259848; 1063225800]).
Proof. vm_compute. reflexivity. Qed.


Example t_0218 :
  samSubModeRoll_fun (f32 (1073741824)) 69 1 1305 11 (f32 (3216003881)) (f32 (3211757286)) (f32 (3208078136))
  = (69, 1306, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0219 :
  samSubModeRoll_fun (f32 (1073741824)) 0 1 5260 12 (f32 (1066339586)) (f32 (1061218161)) (f32 (3219902512))
  = (51, 0, 0, [1066339586; 1061218161; 3219902512]).
Proof. vm_compute. reflexivity. Qed.


Example t_0220 :
  samSubModeRoll_fun (f32 (3201837034)) 31 0 6250 17 (f32 (3215451119)) (f32 (3206433549)) (f32 (3213839646))
  = (17, 0, 0, [3215451119; 3206433549; 3213839646]).
Proof. vm_compute. reflexivity. Qed.


Example t_0221 :
  samSubModeRoll_fun (f32 (3199727080)) 31 0 6249 17 (f32 (3207887474)) (f32 (3215891734)) (f32 (1073280661))
  = (31, 6250, 0, [3207887474; 3215891734; 1073280661]).
Proof. vm_compute. reflexivity. Qed.


Example t_0222 :
  samSubModeRoll_fun (f32 (1073741824)) 70 2 6154 5 (f32 (1050459869)) (f32 (3211218673)) (f32 (3165477411))
  = (70, 6155, 0, [1050459869; 3211218673; 3165477411]).
Proof. vm_compute. reflexivity. Qed.


Example t_0223 :
  samSubModeRoll_fun (f32 (1073741824)) 71 1 6250 12 (f32 (1071235403)) (f32 (1060417715)) (f32 (1065854011))
  = (51, 0, 0, [1071235403; 1060417715; 1065854011]).
Proof. vm_compute. reflexivity. Qed.


Example t_0224 :
  samSubModeRoll_fun (f32 (2143289344)) 77 1 7874 5 (f32 (1055606612)) (f32 (1030936458)) (f32 (3217137838))
  = (17, 0, 0, [1055606612; 1030936458; 3217137838]).
Proof. vm_compute. reflexivity. Qed.


Example t_0225 :
  samSubModeRoll_fun (f32 (2139095040)) 65 1 1695 5 (f32 (1073039074)) (f32 (1063212277)) (f32 (1069734341))
  = (65, 1696, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0226 :
  samSubModeRoll_fun (f32 (1050349792)) 70 0 4294967295 18 (f32 (1072733363)) (f32 (1068886434)) (f32 (3215901731))
  = (70, 0, 0, [1072733363; 1068886434; 3215901731]).
Proof. vm_compute. reflexivity. Qed.


Example t_0227 :
  samSubModeRoll_fun (f32 (1073741824)) 71 1 2986 4294967295 (f32 (1035983207)) (f32 (3214689368)) (f32 (1063068210))
  = (71, 2987, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0228 :
  samSubModeRoll_fun (f32 (1074878392)) 31 1 7296 13 (f32 (3221054563)) (f32 (1040845530)) (f32 (3217477818))
  = (51, 0, 0, [3221054563; 1040845530; 3217477818]).
Proof. vm_compute. reflexivity. Qed.


Example t_0229 :
  samSubModeRoll_fun (f32 (1065353216)) 23 1 1635 17 (f32 (1071782005)) (f32 (1073110594)) (f32 (3214891303))
  = (23, 1636, 17, [1071782005; 1073110594; 3214891303]).
Proof. vm_compute. reflexivity. Qed.


Example t_0230 :
  samSubModeRoll_fun (f32 (1073741824)) 55 1 1234 11 (f32 (3216976665)) (f32 (1043921137)) (f32 (3194209554))
  = (55, 1235, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0231 :
  samSubModeRoll_fun (f32 (1073741824)) 58 1 7430 12 (f32 (1067499223)) (f32 (1061845775)) (f32 (1051420191))
  = (51, 0, 0, [1067499223; 1061845775; 1051420191]).
Proof. vm_compute. reflexivity. Qed.


Example t_0232 :
  samSubModeRoll_fun (f32 (1063522374)) 27 0 6250 1 (f32 (3213784985)) (f32 (3218135232)) (f32 (1066791702))
  = (17, 0, 0, [3213784985; 3218135232; 1066791702]).
Proof. vm_compute. reflexivity. Qed.


Example t_0233 :
  samSubModeRoll_fun (f32 (1077438238)) 41 0 6249 5 (f32 (3215381552)) (f32 (1056370658)) (f32 (3208833741))
  = (41, 6250, 0, [3215381552; 1056370658; 3208833741]).
Proof. vm_compute. reflexivity. Qed.


Example t_0234 :
  samSubModeRoll_fun (f32 (1073741824)) 79 2 4023 5 (f32 (1046361639)) (f32 (1062992784)) (f32 (1050798486))
  = (79, 4024, 0, [1046361639; 1062992784; 1050798486]).
Proof. vm_compute. reflexivity. Qed.


Example t_0235 :
  samSubModeRoll_fun (f32 (1073741824)) 44 1 6250 12 (f32 (3213731095)) (f32 (1057574516)) (f32 (1058650140))
  = (51, 0, 0, [3213731095; 1057574516; 1058650140]).
Proof. vm_compute. reflexivity. Qed.


Example t_0236 :
  samSubModeRoll_fun (f32 (2143289344)) 36 1 4941 5 (f32 (3183201947)) (f32 (3206579968)) (f32 (3218321297))
  = (36, 4942, 5, [3183201947; 3206579968; 3218321297]).
Proof. vm_compute. reflexivity. Qed.


Example t_0237 :
  samSubModeRoll_fun (f32 (2139095040)) 45 1 1469 5 (f32 (3210680430)) (f32 (3217351226)) (f32 (3211157193))
  = (45, 1470, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0238 :
  samSubModeRoll_fun (f32 (1073159230)) 45 0 4294967295 5 (f32 (3216729052)) (f32 (1070232338)) (f32 (3208791621))
  = (45, 0, 0, [3216729052; 1070232338; 3208791621]).
Proof. vm_compute. reflexivity. Qed.


Example t_0239 :
  samSubModeRoll_fun (f32 (1073741824)) 4 1 176 4294967295 (f32 (1063207948)) (f32 (1069573002)) (f32 (3219276792))
  = (4, 177, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0240 :
  samSubModeRoll_fun (f32 (1069400497)) 50 1 875 4 (f32 (3218499161)) (f32 (3217767893)) (f32 (3218992759))
  = (50, 876, 5, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0241 :
  samSubModeRoll_fun (f32 (1065353216)) 6 1 3396 13 (f32 (1049527444)) (f32 (1069740374)) (f32 (1070105662))
  = (6, 3397, 13, [1049527444; 1069740374; 1070105662]).
Proof. vm_compute. reflexivity. Qed.


Example t_0242 :
  samSubModeRoll_fun (f32 (1073741824)) 38 1 1323 11 (f32 (3211376603)) (f32 (1072861761)) (f32 (1072208230))
  = (38, 1324, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0243 :
  samSubModeRoll_fun (f32 (1073741824)) 8 1 7300 12 (f32 (3214774370)) (f32 (3216466770)) (f32 (3216312796))
  = (51, 0, 0, [3214774370; 3216466770; 3216312796]).
Proof. vm_compute. reflexivity. Qed.


Example t_0244 :
  samSubModeRoll_fun (f32 (3216020229)) 54 0 6250 19 (f32 (3218535368)) (f32 (1065828723)) (f32 (3213209556))
  = (17, 0, 0, [3218535368; 1065828723; 3213209556]).
Proof. vm_compute. reflexivity. Qed.


Example t_0245 :
  samSubModeRoll_fun (f32 (3194185792)) 8 0 6249 9 (f32 (3208477718)) (f32 (3213352548)) (f32 (1064691862))
  = (8, 6250, 0, [3208477718; 3213352548; 1064691862]).
Proof. vm_compute. reflexivity. Qed.


Example t_0246 :
  samSubModeRoll_fun (f32 (1073741824)) 40 2 2122 5 (f32 (1009305363)) (f32 (1069847791)) (f32 (1069624541))
  = (40, 2123, 0, [1009305363; 1069847791; 1069624541]).
Proof. vm_compute. reflexivity. Qed.


Example t_0247 :
  samSubModeRoll_fun (f32 (1073741824)) 29 1 6250 12 (f32 (1071777174)) (f32 (3214103355)) (f32 (1066637475))
  = (51, 0, 0, [1071777174; 3214103355; 1066637475]).
Proof. vm_compute. reflexivity. Qed.


Example t_0248 :
  samSubModeRoll_fun (f32 (2143289344)) 16 1 3553 5 (f32 (3210186953)) (f32 (3196465098)) (f32 (3162489209))
  = (16, 3554, 5, [3210186953; 3196465098; 3162489209]).
Proof. vm_compute. reflexivity. Qed.


Example t_0249 :
  samSubModeRoll_fun (f32 (2139095040)) 67 1 820 5 (f32 (3219944829)) (f32 (1060025786)) (f32 (1066403000))
  = (67, 821, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0250 :
  samSubModeRoll_fun (f32 (1070280464)) 12 0 4294967295 0 (f32 (1070393912)) (f32 (3171290536)) (f32 (1066184262))
  = (12, 0, 0, [1070393912; 3171290536; 1066184262]).
Proof. vm_compute. reflexivity. Qed.


Example t_0251 :
  samSubModeRoll_fun (f32 (1073741824)) 76 1 6914 4294967295 (f32 (3210085608)) (f32 (1070376942)) (f32 (1066651182))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0252 :
  samSubModeRoll_fun (f32 (1076642218)) 66 0 1744 9 (f32 (1058442862)) (f32 (1070629944)) (f32 (1064594252))
  = (66, 1745, 0, [1058442862; 1070629944; 1064594252]).
Proof. vm_compute. reflexivity. Qed.


Example t_0253 :
  samSubModeRoll_fun (f32 (1065353216)) 64 1 1105 16 (f32 (3216734413)) (f32 (1038229250)) (f32 (3218740639))
  = (64, 1106, 16, [3216734413; 1038229250; 3218740639]).
Proof. vm_compute. reflexivity. Qed.


Example t_0254 :
  samSubModeRoll_fun (f32 (1073741824)) 57 1 5575 11 (f32 (1072383161)) (f32 (3218739501)) (f32 (3212907416))
  = (57, 5576, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0255 :
  samSubModeRoll_fun (f32 (1073741824)) 51 1 4661 12 (f32 (3175204549)) (f32 (3213128898)) (f32 (3209187540))
  = (51, 0, 0, [3175204549; 3213128898; 3209187540]).
Proof. vm_compute. reflexivity. Qed.


Example t_0256 :
  samSubModeRoll_fun (f32 (3220942548)) 16 0 6250 5 (f32 (3205941945)) (f32 (3162900794)) (f32 (3220010140))
  = (17, 0, 0, [3205941945; 3162900794; 3220010140]).
Proof. vm_compute. reflexivity. Qed.


Example t_0257 :
  samSubModeRoll_fun (f32 (3220562751)) 61 0 6249 19 (f32 (3208695538)) (f32 (1073701047)) (f32 (3177757264))
  = (61, 6250, 0, [3208695538; 1073701047; 3177757264]).
Proof. vm_compute. reflexivity. Qed.


Example t_0258 :
  samSubModeRoll_fun (f32 (1073741824)) 16 2 546 5 (f32 (1064590026)) (f32 (3204904043)) (f32 (3204503275))
  = (16, 547, 0, [1064590026; 3204904043; 3204503275]).
Proof. vm_compute. reflexivity. Qed.


Example t_0259 :
  samSubModeRoll_fun (f32 (1073741824)) 78 1 6250 12 (f32 (1051325827)) (f32 (1069375551)) (f32 (1058054783))
  = (51, 0, 0, [1051325827; 1069375551; 1058054783]).
Proof. vm_compute. reflexivity. Qed.


Example t_0260 :
  samSubModeRoll_fun (f32 (2143289344)) 78 1 2953 5 (f32 (1066274549)) (f32 (1066173987)) (f32 (1067192975))
  = (78, 2954, 5, [1066274549; 1066173987; 1067192975]).
Proof. vm_compute. reflexivity. Qed.


Example t_0261 :
  samSubModeRoll_fun (f32 (2139095040)) 67 1 958 5 (f32 (1067492713)) (f32 (3198444982)) (f32 (1072435595))
  = (67, 959, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0262 :
  samSubModeRoll_fun (f32 (1075058631)) 56 0 4294967295 1 (f32 (3213436060)) (f32 (1042885038)) (f32 (3216004572))
  = (56, 0, 0, [3213436060; 1042885038; 3216004572]).
Proof. vm_compute. reflexivity. Qed.


Example t_0263 :
  samSubModeRoll_fun (f32 (1073741824)) 68 1 3305 4294967295 (f32 (1072356120)) (f32 (3169007531)) (f32 (3203741266))
  = (68, 3306, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0264 :
  samSubModeRoll_fun (f32 (3214305959)) 1 0 7960 9 (f32 (3210752347)) (f32 (3216922863)) (f32 (1058423920))
  = (17, 0, 0, [3210752347; 3216922863; 1058423920]).
Proof. vm_compute. reflexivity. Qed.


Example t_0265 :
  samSubModeRoll_fun (f32 (1065353216)) 32 1 7734 2 (f32 (3214422725)) (f32 (3215636202)) (f32 (3217464146))
  = (17, 0, 0, [3214422725; 3215636202; 3217464146]).
Proof. vm_compute. reflexivity. Qed.


Example t_0266 :
  samSubModeRoll_fun (f32 (1073741824)) 60 1 5802 11 (f32 (3185311287)) (f32 (3219600544)) (f32 (1069913245))
  = (60, 5803, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0267 :
  samSubModeRoll_fun (f32 (1073741824)) 18 1 4370 12 (f32 (1045743336)) (f32 (1070102598)) (f32 (3213815258))
  = (51, 0, 0, [1045743336; 1070102598; 3213815258]).
Proof. vm_compute. reflexivity. Qed.


Example t_0268 :
  samSubModeRoll_fun (f32 (1069883789)) 11 0 6250 11 (f32 (3182718748)) (f32 (1069198466)) (f32 (3210025125))
  = (17, 0, 0, [3182718748; 1069198466; 3210025125]).
Proof. vm_compute. reflexivity. Qed.


Example t_0269 :
  samSubModeRoll_fun (f32 (1076431059)) 75 0 6249 13 (f32 (1071638075)) (f32 (1050180333)) (f32 (3211112753))
  = (75, 6250, 0, [1071638075; 1050180333; 3211112753]).
Proof. vm_compute. reflexivity. Qed.


Example t_0270 :
  samSubModeRoll_fun (f32 (1073741824)) 3 2 6734 5 (f32 (1069509802)) (f32 (3214608282)) (f32 (1069846246))
  = (17, 0, 0, [1069509802; 3214608282; 1069846246]).
Proof. vm_compute. reflexivity. Qed.


Example t_0271 :
  samSubModeRoll_fun (f32 (1073741824)) 22 1 6250 12 (f32 (1073556610)) (f32 (3208156969)) (f32 (3206506644))
  = (51, 0, 0, [1073556610; 3208156969; 3206506644]).
Proof. vm_compute. reflexivity. Qed.


Example t_0272 :
  samSubModeRoll_fun (f32 (2143289344)) 3 1 2794 5 (f32 (1070359778)) (f32 (1067192297)) (f32 (3204730887))
  = (3, 2795, 5, [1070359778; 1067192297; 3204730887]).
Proof. vm_compute. reflexivity. Qed.


Example t_0273 :
  samSubModeRoll_fun (f32 (2139095040)) 49 1 775 5 (f32 (3207320596)) (f32 (1068932959)) (f32 (1066381402))
  = (49, 776, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0274 :
  samSubModeRoll_fun (f32 (1045972629)) 63 0 4294967295 4 (f32 (1060358866)) (f32 (1069846670)) (f32 (1072707717))
  = (63, 0, 0, [1060358866; 1069846670; 1072707717]).
Proof. vm_compute. reflexivity. Qed.


Example t_0275 :
  samSubModeRoll_fun (f32 (1073741824)) 58 1 4363 4294967295 (f32 (1061965577)) (f32 (1011251357)) (f32 (1061305960))
  = (58, 4364, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0276 :
  samSubModeRoll_fun (f32 (1034317315)) 79 1 434 19 (f32 (3184144269)) (f32 (3220707139)) (f32 (3209401260))
  = (79, 435, 19, [3184144269; 3220707139; 3209401260]).
Proof. vm_compute. reflexivity. Qed.


Example t_0277 :
  samSubModeRoll_fun (f32 (1065353216)) 9 1 2323 8 (f32 (1071428763)) (f32 (3192674566)) (f32 (1053915015))
  = (9, 2324, 8, [1071428763; 3192674566; 1053915015]).
Proof. vm_compute. reflexivity. Qed.


Example t_0278 :
  samSubModeRoll_fun (f32 (1073741824)) 24 1 7117 11 (f32 (3213736711)) (f32 (1050115135)) (f32 (1068525162))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0279 :
  samSubModeRoll_fun (f32 (1073741824)) 10 1 2707 12 (f32 (1071043860)) (f32 (3214743108)) (f32 (1073601529))
  = (51, 0, 0, [1071043860; 3214743108; 1073601529]).
Proof. vm_compute. reflexivity. Qed.


Example t_0280 :
  samSubModeRoll_fun (f32 (1062241507)) 56 0 6250 9 (f32 (1066882982)) (f32 (3215140653)) (f32 (3207107083))
  = (17, 0, 0, [1066882982; 3215140653; 3207107083]).
Proof. vm_compute. reflexivity. Qed.


Example t_0281 :
  samSubModeRoll_fun (f32 (3207686159)) 19 0 6249 13 (f32 (3205860506)) (f32 (3209669195)) (f32 (1067735074))
  = (19, 6250, 0, [3205860506; 3209669195; 1067735074]).
Proof. vm_compute. reflexivity. Qed.


Example t_0282 :
  samSubModeRoll_fun (f32 (1073741824)) 26 2 618 5 (f32 (3191855193)) (f32 (3179530839)) (f32 (3220688106))
  = (26, 619, 0, [3191855193; 3179530839; 3220688106]).
Proof. vm_compute. reflexivity. Qed.


Example t_0283 :
  samSubModeRoll_fun (f32 (1073741824)) 31 1 6250 12 (f32 (3217620972)) (f32 (3216099581)) (f32 (1070566724))
  = (51, 0, 0, [3217620972; 3216099581; 1070566724]).
Proof. vm_compute. reflexivity. Qed.


Example t_0284 :
  samSubModeRoll_fun (f32 (2143289344)) 0 1 5962 5 (f32 (3217784371)) (f32 (1045600631)) (f32 (1068524841))
  = (0, 5963, 5, [3217784371; 1045600631; 1068524841]).
Proof. vm_compute. reflexivity. Qed.


Example t_0285 :
  samSubModeRoll_fun (f32 (2139095040)) 55 1 4702 5 (f32 (3205520241)) (f32 (3218995770)) (f32 (3211297015))
  = (55, 4703, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0286 :
  samSubModeRoll_fun (f32 (1058732453)) 18 0 4294967295 15 (f32 (1036638413)) (f32 (1061841375)) (f32 (3206816154))
  = (18, 0, 0, [1036638413; 1061841375; 3206816154]).
Proof. vm_compute. reflexivity. Qed.


Example t_0287 :
  samSubModeRoll_fun (f32 (1073741824)) 29 1 1866 4294967295 (f32 (3190804145)) (f32 (3208403292)) (f32 (3216924377))
  = (29, 1867, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0288 :
  samSubModeRoll_fun (f32 (1075017950)) 17 1 233 1 (f32 (3197885915)) (f32 (3201417000)) (f32 (3207674982))
  = (17, 234, 2, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0289 :
  samSubModeRoll_fun (f32 (1065353216)) 17 1 6320 12 (f32 (3193241302)) (f32 (3214050119)) (f32 (1072278070))
  = (17, 0, 0, [3193241302; 3214050119; 1072278070]).
Proof. vm_compute. reflexivity. Qed.


Example t_0290 :
  samSubModeRoll_fun (f32 (1073741824)) 3 1 2228 11 (f32 (3196346554)) (f32 (3216976798)) (f32 (1066125449))
  = (3, 2229, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0291 :
  samSubModeRoll_fun (f32 (1073741824)) 70 1 7152 12 (f32 (1060623280)) (f32 (3214068152)) (f32 (1068159256))
  = (51, 0, 0, [1060623280; 3214068152; 1068159256]).
Proof. vm_compute. reflexivity. Qed.


Example t_0292 :
  samSubModeRoll_fun (f32 (1074482015)) 21 0 6250 12 (f32 (3179616164)) (f32 (1073106184)) (f32 (3214385968))
  = (17, 0, 0, [3179616164; 1073106184; 3214385968]).
Proof. vm_compute. reflexivity. Qed.


Example t_0293 :
  samSubModeRoll_fun (f32 (1047614475)) 74 0 6249 9 (f32 (1056210706)) (f32 (1062305525)) (f32 (1045732938))
  = (74, 6250, 0, [1056210706; 1062305525; 1045732938]).
Proof. vm_compute. reflexivity. Qed.


Example t_0294 :
  samSubModeRoll_fun (f32 (1073741824)) 51 2 576 5 (f32 (3195768595)) (f32 (1060046473)) (f32 (1072024892))
  = (51, 577, 0, [3195768595; 1060046473; 1072024892]).
Proof. vm_compute. reflexivity. Qed.


Example t_0295 :
  samSubModeRoll_fun (f32 (1073741824)) 55 1 6250 12 (f32 (1069599737)) (f32 (1047253837)) (f32 (3198568789))
  = (51, 0, 0, [1069599737; 1047253837; 3198568789]).
Proof. vm_compute. reflexivity. Qed.


Example t_0296 :
  samSubModeRoll_fun (f32 (2143289344)) 4 1 6070 5 (f32 (3197400978)) (f32 (3212297796)) (f32 (1058814436))
  = (4, 6071, 5, [3197400978; 3212297796; 1058814436]).
Proof. vm_compute. reflexivity. Qed.


Example t_0297 :
  samSubModeRoll_fun (f32 (2139095040)) 9 1 5729 5 (f32 (1073595965)) (f32 (3210179616)) (f32 (3192535555))
  = (9, 5730, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0298 :
  samSubModeRoll_fun (f32 (3209098682)) 33 0 4294967295 7 (f32 (3189809880)) (f32 (1073705885)) (f32 (1072646938))
  = (33, 0, 0, [3189809880; 1073705885; 1072646938]).
Proof. vm_compute. reflexivity. Qed.


Example t_0299 :
  samSubModeRoll_fun (f32 (1073741824)) 20 1 115 4294967295 (f32 (3220546219)) (f32 (3215089409)) (f32 (1058882863))
  = (20, 116, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0300 :
  samSubModeRoll_fun (f32 (1070901034)) 57 1 5592 6 (f32 (1071093346)) (f32 (3217637715)) (f32 (1056890993))
  = (57, 5593, 7, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0301 :
  samSubModeRoll_fun (f32 (1065353216)) 18 1 2919 3 (f32 (3213183589)) (f32 (1066865871)) (f32 (3218779402))
  = (18, 2920, 3, [3213183589; 1066865871; 3218779402]).
Proof. vm_compute. reflexivity. Qed.


Example t_0302 :
  samSubModeRoll_fun (f32 (1073741824)) 21 1 7909 11 (f32 (1045061394)) (f32 (3192022705)) (f32 (1049796964))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0303 :
  samSubModeRoll_fun (f32 (1073741824)) 22 1 2050 12 (f32 (3206364049)) (f32 (3201352763)) (f32 (3219890057))
  = (51, 0, 0, [3206364049; 3201352763; 3219890057]).
Proof. vm_compute. reflexivity. Qed.


Example t_0304 :
  samSubModeRoll_fun (f32 (1074172511)) 8 0 6250 19 (f32 (1066590819)) (f32 (3172913830)) (f32 (1071290327))
  = (17, 0, 0, [1066590819; 3172913830; 1071290327]).
Proof. vm_compute. reflexivity. Qed.


Example t_0305 :
  samSubModeRoll_fun (f32 (1057642781)) 64 0 6249 17 (f32 (1070721476)) (f32 (1054992142)) (f32 (3212921882))
  = (64, 6250, 0, [1070721476; 1054992142; 3212921882]).
Proof. vm_compute. reflexivity. Qed.


Example t_0306 :
  samSubModeRoll_fun (f32 (1073741824)) 17 2 389 5 (f32 (3202328744)) (f32 (3194859001)) (f32 (1056007013))
  = (17, 390, 0, [3202328744; 3194859001; 1056007013]).
Proof. vm_compute. reflexivity. Qed.


Example t_0307 :
  samSubModeRoll_fun (f32 (1073741824)) 15 1 6250 12 (f32 (1032592747)) (f32 (3217503830)) (f32 (3204892331))
  = (51, 0, 0, [1032592747; 3217503830; 3204892331]).
Proof. vm_compute. reflexivity. Qed.


Example t_0308 :
  samSubModeRoll_fun (f32 (2143289344)) 26 1 5878 5 (f32 (3218737657)) (f32 (1069937414)) (f32 (3204704469))
  = (26, 5879, 5, [3218737657; 1069937414; 3204704469]).
Proof. vm_compute. reflexivity. Qed.


Example t_0309 :
  samSubModeRoll_fun (f32 (2139095040)) 18 1 6229 5 (f32 (1071340696)) (f32 (3216564948)) (f32 (3215474987))
  = (18, 6230, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0310 :
  samSubModeRoll_fun (f32 (3208691299)) 6 0 4294967295 16 (f32 (3220885517)) (f32 (1066802423)) (f32 (3193976906))
  = (6, 0, 0, [3220885517; 1066802423; 3193976906]).
Proof. vm_compute. reflexivity. Qed.


Example t_0311 :
  samSubModeRoll_fun (f32 (1073741824)) 61 1 5079 4294967295 (f32 (3193786547)) (f32 (3194525969)) (f32 (1059366877))
  = (61, 5080, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0312 :
  samSubModeRoll_fun (f32 (3218860820)) 77 0 4298 19 (f32 (1040874968)) (f32 (3198416905)) (f32 (3204181342))
  = (77, 4299, 0, [1040874968; 3198416905; 3204181342]).
Proof. vm_compute. reflexivity. Qed.


Example t_0313 :
  samSubModeRoll_fun (f32 (1065353216)) 66 1 7990 4 (f32 (1057346623)) (f32 (3203104701)) (f32 (3205266924))
  = (17, 0, 0, [1057346623; 3203104701; 3205266924]).
Proof. vm_compute. reflexivity. Qed.


Example t_0314 :
  samSubModeRoll_fun (f32 (1073741824)) 54 1 713 11 (f32 (1065561432)) (f32 (1036874685)) (f32 (1073387536))
  = (54, 714, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0315 :
  samSubModeRoll_fun (f32 (1073741824)) 58 1 1794 12 (f32 (1067485422)) (f32 (3221065400)) (f32 (1065659660))
  = (51, 0, 0, [1067485422; 3221065400; 1065659660]).
Proof. vm_compute. reflexivity. Qed.


Example t_0316 :
  samSubModeRoll_fun (f32 (1071785694)) 27 0 6250 4 (f32 (3207746824)) (f32 (3220640934)) (f32 (3210914067))
  = (17, 0, 0, [3207746824; 3220640934; 3210914067]).
Proof. vm_compute. reflexivity. Qed.


Example t_0317 :
  samSubModeRoll_fun (f32 (1072621434)) 77 0 6249 7 (f32 (3204614702)) (f32 (3219981958)) (f32 (3205830908))
  = (77, 6250, 0, [3204614702; 3219981958; 3205830908]).
Proof. vm_compute. reflexivity. Qed.


Example t_0318 :
  samSubModeRoll_fun (f32 (1073741824)) 52 2 3443 5 (f32 (1066472235)) (f32 (1061815637)) (f32 (1048826044))
  = (52, 3444, 0, [1066472235; 1061815637; 1048826044]).
Proof. vm_compute. reflexivity. Qed.


Example t_0319 :
  samSubModeRoll_fun (f32 (1073741824)) 12 1 6250 12 (f32 (3189978239)) (f32 (1044803005)) (f32 (3219935563))
  = (51, 0, 0, [3189978239; 1044803005; 3219935563]).
Proof. vm_compute. reflexivity. Qed.


Example t_0320 :
  samSubModeRoll_fun (f32 (2143289344)) 70 1 1940 5 (f32 (3205787432)) (f32 (3212980651)) (f32 (1066356416))
  = (70, 1941, 5, [3205787432; 3212980651; 1066356416]).
Proof. vm_compute. reflexivity. Qed.


Example t_0321 :
  samSubModeRoll_fun (f32 (2139095040)) 60 1 6841 5 (f32 (3206704394)) (f32 (3217035728)) (f32 (3216942202))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0322 :
  samSubModeRoll_fun (f32 (1036823247)) 34 0 4294967295 4 (f32 (3212852454)) (f32 (1053513502)) (f32 (1063201964))
  = (34, 0, 0, [3212852454; 1053513502; 1063201964]).
Proof. vm_compute. reflexivity. Qed.


Example t_0323 :
  samSubModeRoll_fun (f32 (1073741824)) 35 1 2104 4294967295 (f32 (1059841747)) (f32 (1057075788)) (f32 (3216238251))
  = (35, 2105, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0324 :
  samSubModeRoll_fun (f32 (3200540130)) 44 1 5074 3 (f32 (3218048018)) (f32 (1030890995)) (f32 (3220962698))
  = (44, 5075, 3, [3218048018; 1030890995; 3220962698]).
Proof. vm_compute. reflexivity. Qed.


Example t_0325 :
  samSubModeRoll_fun (f32 (1065353216)) 47 1 2173 14 (f32 (3181719698)) (f32 (3188052327)) (f32 (1059324803))
  = (47, 2174, 14, [3181719698; 3188052327; 1059324803]).
Proof. vm_compute. reflexivity. Qed.


Example t_0326 :
  samSubModeRoll_fun (f32 (1073741824)) 64 1 7643 11 (f32 (1067727076)) (f32 (1071184026)) (f32 (1063837403))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0327 :
  samSubModeRoll_fun (f32 (1073741824)) 10 1 3300 12 (f32 (1032319955)) (f32 (1073730680)) (f32 (1058866363))
  = (51, 0, 0, [1032319955; 1073730680; 1058866363]).
Proof. vm_compute. reflexivity. Qed.


Example t_0328 :
  samSubModeRoll_fun (f32 (1053862364)) 68 0 6250 18 (f32 (1049493646)) (f32 (3210925600)) (f32 (3200573999))
  = (17, 0, 0, [1049493646; 3210925600; 3200573999]).
Proof. vm_compute. reflexivity. Qed.


Example t_0329 :
  samSubModeRoll_fun (f32 (1063836722)) 73 0 6249 10 (f32 (1073631879)) (f32 (3199295324)) (f32 (3201638192))
  = (73, 6250, 0, [1073631879; 3199295324; 3201638192]).
Proof. vm_compute. reflexivity. Qed.


Example t_0330 :
  samSubModeRoll_fun (f32 (1073741824)) 38 2 2404 5 (f32 (1064511247)) (f32 (3215128268)) (f32 (1045282320))
  = (38, 2405, 0, [1064511247; 3215128268; 1045282320]).
Proof. vm_compute. reflexivity. Qed.


Example t_0331 :
  samSubModeRoll_fun (f32 (1073741824)) 39 1 6250 12 (f32 (3211128242)) (f32 (1069857941)) (f32 (3213426198))
  = (51, 0, 0, [3211128242; 1069857941; 3213426198]).
Proof. vm_compute. reflexivity. Qed.


Example t_0332 :
  samSubModeRoll_fun (f32 (2143289344)) 12 1 7622 5 (f32 (1071727885)) (f32 (1065806948)) (f32 (1068244368))
  = (17, 0, 0, [1071727885; 1065806948; 1068244368]).
Proof. vm_compute. reflexivity. Qed.


Example t_0333 :
  samSubModeRoll_fun (f32 (2139095040)) 13 1 4799 5 (f32 (3204726026)) (f32 (3221171565)) (f32 (1071612115))
  = (13, 4800, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0334 :
  samSubModeRoll_fun (f32 (3219827092)) 50 0 4294967295 16 (f32 (1044009227)) (f32 (3200967966)) (f32 (3207871751))
  = (50, 0, 0, [1044009227; 3200967966; 3207871751]).
Proof. vm_compute. reflexivity. Qed.


Example t_0335 :
  samSubModeRoll_fun (f32 (1073741824)) 16 1 5833 4294967295 (f32 (1061715624)) (f32 (1047663147)) (f32 (3213695441))
  = (16, 5834, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0336 :
  samSubModeRoll_fun (f32 (1074074085)) 20 1 2905 7 (f32 (1066483041)) (f32 (1067755776)) (f32 (1063522164))
  = (20, 2906, 8, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0337 :
  samSubModeRoll_fun (f32 (1065353216)) 16 1 7648 2 (f32 (1048544695)) (f32 (1066597207)) (f32 (1042314001))
  = (17, 0, 0, [1048544695; 1066597207; 1042314001]).
Proof. vm_compute. reflexivity. Qed.


Example t_0338 :
  samSubModeRoll_fun (f32 (1073741824)) 65 1 5288 11 (f32 (3205815464)) (f32 (1057793439)) (f32 (3206222199))
  = (65, 5289, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0339 :
  samSubModeRoll_fun (f32 (1073741824)) 14 1 477 12 (f32 (1066714239)) (f32 (1058875512)) (f32 (3210998845))
  = (51, 0, 0, [1066714239; 1058875512; 3210998845]).
Proof. vm_compute. reflexivity. Qed.


Example t_0340 :
  samSubModeRoll_fun (f32 (3220336568)) 5 0 6250 9 (f32 (1069759615)) (f32 (3216851982)) (f32 (1060821730))
  = (17, 0, 0, [1069759615; 3216851982; 1060821730]).
Proof. vm_compute. reflexivity. Qed.


Example t_0341 :
  samSubModeRoll_fun (f32 (1040033328)) 62 0 6249 13 (f32 (3197731523)) (f32 (3220338589)) (f32 (1018260376))
  = (62, 6250, 0, [3197731523; 3220338589; 1018260376]).
Proof. vm_compute. reflexivity. Qed.


Example t_0342 :
  samSubModeRoll_fun (f32 (1073741824)) 52 2 259 5 (f32 (3209887971)) (f32 (1069311548)) (f32 (1068822058))
  = (52, 260, 0, [3209887971; 1069311548; 1068822058]).
Proof. vm_compute. reflexivity. Qed.


Example t_0343 :
  samSubModeRoll_fun (f32 (1073741824)) 29 1 6250 12 (f32 (1068470086)) (f32 (3216745368)) (f32 (1059223871))
  = (51, 0, 0, [1068470086; 3216745368; 1059223871]).
Proof. vm_compute. reflexivity. Qed.


Example t_0344 :
  samSubModeRoll_fun (f32 (2143289344)) 57 1 1352 5 (f32 (3220266869)) (f32 (3196080541)) (f32 (1067355647))
  = (57, 1353, 5, [3220266869; 3196080541; 1067355647]).
Proof. vm_compute. reflexivity. Qed.


Example t_0345 :
  samSubModeRoll_fun (f32 (2139095040)) 73 1 4875 5 (f32 (3213420088)) (f32 (1052845231)) (f32 (1068248877))
  = (73, 4876, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0346 :
  samSubModeRoll_fun (f32 (1073059762)) 61 0 4294967295 7 (f32 (3216510962)) (f32 (1066054064)) (f32 (1062264036))
  = (61, 0, 0, [3216510962; 1066054064; 1062264036]).
Proof. vm_compute. reflexivity. Qed.


Example t_0347 :
  samSubModeRoll_fun (f32 (1073741824)) 53 1 1578 4294967295 (f32 (1066815986)) (f32 (1065377473)) (f32 (3218302384))
  = (53, 1579, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0348 :
  samSubModeRoll_fun (f32 (3220192681)) 29 1 3945 14 (f32 (3220821324)) (f32 (1067659839)) (f32 (1071860135))
  = (29, 3946, 14, [3220821324; 1067659839; 1071860135]).
Proof. vm_compute. reflexivity. Qed.


Example t_0349 :
  samSubModeRoll_fun (f32 (1065353216)) 7 1 1208 11 (f32 (1060003939)) (f32 (1072062939)) (f32 (3196441823))
  = (7, 1209, 11, [1060003939; 1072062939; 3196441823]).
Proof. vm_compute. reflexivity. Qed.


Example t_0350 :
  samSubModeRoll_fun (f32 (1073741824)) 33 1 4696 11 (f32 (1069632223)) (f32 (3216890419)) (f32 (1058674523))
  = (33, 4697, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0351 :
  samSubModeRoll_fun (f32 (1073741824)) 78 1 7003 12 (f32 (3219360355)) (f32 (3213947762)) (f32 (3212364750))
  = (51, 0, 0, [3219360355; 3213947762; 3212364750]).
Proof. vm_compute. reflexivity. Qed.


Example t_0352 :
  samSubModeRoll_fun (f32 (3217930640)) 51 0 6250 20 (f32 (1062497026)) (f32 (1047143364)) (f32 (3219231708))
  = (17, 0, 0, [1062497026; 1047143364; 3219231708]).
Proof. vm_compute. reflexivity. Qed.


Example t_0353 :
  samSubModeRoll_fun (f32 (1074064855)) 47 0 6249 4 (f32 (3201120676)) (f32 (1067850472)) (f32 (1065384515))
  = (47, 6250, 0, [3201120676; 1067850472; 1065384515]).
Proof. vm_compute. reflexivity. Qed.


Example t_0354 :
  samSubModeRoll_fun (f32 (1073741824)) 23 2 1634 5 (f32 (1056336381)) (f32 (1071312391)) (f32 (3219301467))
  = (23, 1635, 0, [1056336381; 1071312391; 3219301467]).
Proof. vm_compute. reflexivity. Qed.


Example t_0355 :
  samSubModeRoll_fun (f32 (1073741824)) 46 1 6250 12 (f32 (3194218088)) (f32 (3216389114)) (f32 (3208404244))
  = (51, 0, 0, [3194218088; 3216389114; 3208404244]).
Proof. vm_compute. reflexivity. Qed.


Example t_0356 :
  samSubModeRoll_fun (f32 (2143289344)) 20 1 7231 5 (f32 (1073078708)) (f32 (3203736271)) (f32 (3198373879))
  = (17, 0, 0, [1073078708; 3203736271; 3198373879]).
Proof. vm_compute. reflexivity. Qed.


Example t_0357 :
  samSubModeRoll_fun (f32 (2139095040)) 17 1 1332 5 (f32 (1073333624)) (f32 (3201672488)) (f32 (1071241367))
  = (17, 1333, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0358 :
  samSubModeRoll_fun (f32 (3218005020)) 14 0 4294967295 3 (f32 (1051865853)) (f32 (1062457795)) (f32 (1066426380))
  = (14, 0, 0, [1051865853; 1062457795; 1066426380]).
Proof. vm_compute. reflexivity. Qed.


Example t_0359 :
  samSubModeRoll_fun (f32 (1073741824)) 8 1 6447 4294967295 (f32 (1071525712)) (f32 (3212998733)) (f32 (1055643494))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0360 :
  samSubModeRoll_fun (f32 (1047484239)) 12 1 2579 5 (f32 (1069470770)) (f32 (1069273625)) (f32 (1070713361))
  = (12, 2580, 5, [1069470770; 1069273625; 1070713361]).
Proof. vm_compute. reflexivity. Qed.


Example t_0361 :
  samSubModeRoll_fun (f32 (1065353216)) 29 1 757 14 (f32 (1039215401)) (f32 (3210936587)) (f32 (1027647403))
  = (29, 758, 14, [1039215401; 3210936587; 1027647403]).
Proof. vm_compute. reflexivity. Qed.


Example t_0362 :
  samSubModeRoll_fun (f32 (1073741824)) 39 1 3563 11 (f32 (1058137565)) (f32 (3214220884)) (f32 (3212829649))
  = (39, 3564, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0363 :
  samSubModeRoll_fun (f32 (1073741824)) 24 1 6753 12 (f32 (1069022337)) (f32 (3219249590)) (f32 (3207197799))
  = (51, 0, 0, [1069022337; 3219249590; 3207197799]).
Proof. vm_compute. reflexivity. Qed.


Example t_0364 :
  samSubModeRoll_fun (f32 (1075739075)) 24 0 6250 8 (f32 (3220412117)) (f32 (1073456627)) (f32 (3219460818))
  = (17, 0, 0, [3220412117; 1073456627; 3219460818]).
Proof. vm_compute. reflexivity. Qed.


Example t_0365 :
  samSubModeRoll_fun (f32 (1076342345)) 53 0 6249 19 (f32 (3193172466)) (f32 (3214675201)) (f32 (1054106518))
  = (53, 6250, 0, [3193172466; 3214675201; 1054106518]).
Proof. vm_compute. reflexivity. Qed.


Example t_0366 :
  samSubModeRoll_fun (f32 (1073741824)) 7 2 6922 5 (f32 (3200971484)) (f32 (1043168845)) (f32 (1070284330))
  = (17, 0, 0, [3200971484; 1043168845; 1070284330]).
Proof. vm_compute. reflexivity. Qed.


Example t_0367 :
  samSubModeRoll_fun (f32 (1073741824)) 79 1 6250 12 (f32 (1063449374)) (f32 (1070135097)) (f32 (1063337697))
  = (51, 0, 0, [1063449374; 1070135097; 1063337697]).
Proof. vm_compute. reflexivity. Qed.


Example t_0368 :
  samSubModeRoll_fun (f32 (2143289344)) 66 1 2535 5 (f32 (1073401181)) (f32 (1070809504)) (f32 (3213871833))
  = (66, 2536, 5, [1073401181; 1070809504; 3213871833]).
Proof. vm_compute. reflexivity. Qed.


Example t_0369 :
  samSubModeRoll_fun (f32 (2139095040)) 37 1 6378 5 (f32 (1058168635)) (f32 (1060479614)) (f32 (1034605484))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0370 :
  samSubModeRoll_fun (f32 (1068292141)) 50 0 4294967295 6 (f32 (1069677026)) (f32 (3199019451)) (f32 (1050151989))
  = (50, 0, 0, [1069677026; 3199019451; 1050151989]).
Proof. vm_compute. reflexivity. Qed.


Example t_0371 :
  samSubModeRoll_fun (f32 (1073741824)) 58 1 2280 4294967295 (f32 (1072412396)) (f32 (3194199201)) (f32 (3216120164))
  = (58, 2281, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0372 :
  samSubModeRoll_fun (f32 (1074560610)) 53 0 7984 11 (f32 (1061998949)) (f32 (1031244906)) (f32 (1057571173))
  = (17, 0, 0, [1061998949; 1031244906; 1057571173]).
Proof. vm_compute. reflexivity. Qed.


Example t_0373 :
  samSubModeRoll_fun (f32 (1065353216)) 76 1 291 9 (f32 (1058732886)) (f32 (3219181028)) (f32 (3220868600))
  = (76, 292, 9, [1058732886; 3219181028; 3220868600]).
Proof. vm_compute. reflexivity. Qed.


Example t_0374 :
  samSubModeRoll_fun (f32 (1073741824)) 79 1 4936 11 (f32 (1053605248)) (f32 (3209805422)) (f32 (1066244937))
  = (79, 4937, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0375 :
  samSubModeRoll_fun (f32 (1073741824)) 21 1 898 12 (f32 (1072762666)) (f32 (3213935942)) (f32 (3207525447))
  = (51, 0, 0, [1072762666; 3213935942; 3207525447]).
Proof. vm_compute. reflexivity. Qed.


Example t_0376 :
  samSubModeRoll_fun (f32 (3164326814)) 52 0 6250 9 (f32 (1073099160)) (f32 (1064976325)) (f32 (3196984763))
  = (17, 0, 0, [1073099160; 1064976325; 3196984763]).
Proof. vm_compute. reflexivity. Qed.


Example t_0377 :
  samSubModeRoll_fun (f32 (1068229777)) 52 0 6249 1 (f32 (3213312507)) (f32 (3204507190)) (f32 (1060232750))
  = (52, 6250, 0, [3213312507; 3204507190; 1060232750]).
Proof. vm_compute. reflexivity. Qed.


Example t_0378 :
  samSubModeRoll_fun (f32 (1073741824)) 69 2 6944 5 (f32 (1005158544)) (f32 (3198939117)) (f32 (1069701061))
  = (17, 0, 0, [1005158544; 3198939117; 1069701061]).
Proof. vm_compute. reflexivity. Qed.


Example t_0379 :
  samSubModeRoll_fun (f32 (1073741824)) 60 1 6250 12 (f32 (1058302737)) (f32 (1071838404)) (f32 (3156134335))
  = (51, 0, 0, [1058302737; 1071838404; 3156134335]).
Proof. vm_compute. reflexivity. Qed.


Example t_0380 :
  samSubModeRoll_fun (f32 (2143289344)) 79 1 781 5 (f32 (1042037367)) (f32 (3171454016)) (f32 (1072258471))
  = (79, 782, 5, [1042037367; 3171454016; 1072258471]).
Proof. vm_compute. reflexivity. Qed.


Example t_0381 :
  samSubModeRoll_fun (f32 (2139095040)) 30 1 2819 5 (f32 (3208059295)) (f32 (1070524235)) (f32 (3207012968))
  = (30, 2820, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0382 :
  samSubModeRoll_fun (f32 (3184177746)) 34 0 4294967295 0 (f32 (3218916060)) (f32 (3209381768)) (f32 (1043486969))
  = (34, 0, 0, [3218916060; 3209381768; 1043486969]).
Proof. vm_compute. reflexivity. Qed.


Example t_0383 :
  samSubModeRoll_fun (f32 (1073741824)) 9 1 6437 4294967295 (f32 (1063983062)) (f32 (1056189970)) (f32 (3208543101))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0384 :
  samSubModeRoll_fun (f32 (3216530199)) 73 1 5290 11 (f32 (3213096347)) (f32 (3208189283)) (f32 (3214246371))
  = (73, 5291, 11, [3213096347; 3208189283; 3214246371]).
Proof. vm_compute. reflexivity. Qed.


Example t_0385 :
  samSubModeRoll_fun (f32 (1065353216)) 38 1 2919 1 (f32 (1031931699)) (f32 (3220569252)) (f32 (1068100950))
  = (38, 2920, 1, [1031931699; 3220569252; 1068100950]).
Proof. vm_compute. reflexivity. Qed.


Example t_0386 :
  samSubModeRoll_fun (f32 (1073741824)) 38 1 5373 11 (f32 (3215556132)) (f32 (3211880356)) (f32 (1050812155))
  = (38, 5374, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0387 :
  samSubModeRoll_fun (f32 (1073741824)) 2 1 6263 12 (f32 (1065736880)) (f32 (1064273347)) (f32 (1040842023))
  = (51, 0, 0, [1065736880; 1064273347; 1040842023]).
Proof. vm_compute. reflexivity. Qed.


Example t_0388 :
  samSubModeRoll_fun (f32 (1077128759)) 18 0 6250 16 (f32 (3207578234)) (f32 (1053579417)) (f32 (3189308594))
  = (17, 0, 0, [3207578234; 1053579417; 3189308594]).
Proof. vm_compute. reflexivity. Qed.


Example t_0389 :
  samSubModeRoll_fun (f32 (1055187455)) 16 0 6249 15 (f32 (3214326842)) (f32 (1073712431)) (f32 (3216219534))
  = (16, 6250, 0, [3214326842; 1073712431; 3216219534]).
Proof. vm_compute. reflexivity. Qed.


Example t_0390 :
  samSubModeRoll_fun (f32 (1073741824)) 33 2 4917 5 (f32 (1069922569)) (f32 (3198602144)) (f32 (3215500256))
  = (33, 4918, 0, [1069922569; 3198602144; 3215500256]).
Proof. vm_compute. reflexivity. Qed.


Example t_0391 :
  samSubModeRoll_fun (f32 (1073741824)) 44 1 6250 12 (f32 (3200590199)) (f32 (3208379060)) (f32 (3204611250))
  = (51, 0, 0, [3200590199; 3208379060; 3204611250]).
Proof. vm_compute. reflexivity. Qed.


Example t_0392 :
  samSubModeRoll_fun (f32 (2143289344)) 50 1 2026 5 (f32 (1068618181)) (f32 (3220573135)) (f32 (3221004113))
  = (50, 2027, 5, [1068618181; 3220573135; 3221004113]).
Proof. vm_compute. reflexivity. Qed.


Example t_0393 :
  samSubModeRoll_fun (f32 (2139095040)) 54 1 3483 5 (f32 (1067162247)) (f32 (3203196268)) (f32 (1059228170))
  = (54, 3484, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0394 :
  samSubModeRoll_fun (f32 (1076490162)) 78 0 4294967295 14 (f32 (1042463529)) (f32 (1071568988)) (f32 (1064095513))
  = (78, 0, 0, [1042463529; 1071568988; 1064095513]).
Proof. vm_compute. reflexivity. Qed.


Example t_0395 :
  samSubModeRoll_fun (f32 (1073741824)) 72 1 6428 4294967295 (f32 (3177155310)) (f32 (1036352689)) (f32 (3208185519))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0396 :
  samSubModeRoll_fun (f32 (1062874038)) 41 1 683 0 (f32 (1036734064)) (f32 (3218023037)) (f32 (1067180906))
  = (41, 684, 0, [1036734064; 3218023037; 1067180906]).
Proof. vm_compute. reflexivity. Qed.


Example t_0397 :
  samSubModeRoll_fun (f32 (1065353216)) 77 1 3085 1 (f32 (3218005034)) (f32 (1068844566)) (f32 (3218033052))
  = (77, 3086, 1, [3218005034; 1068844566; 3218033052]).
Proof. vm_compute. reflexivity. Qed.


Example t_0398 :
  samSubModeRoll_fun (f32 (1073741824)) 79 1 1071 11 (f32 (3214186916)) (f32 (3204304831)) (f32 (3221169228))
  = (79, 1072, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0399 :
  samSubModeRoll_fun (f32 (1073741824)) 35 1 398 12 (f32 (3209429233)) (f32 (1072749911)) (f32 (3185492041))
  = (51, 0, 0, [3209429233; 1072749911; 3185492041]).
Proof. vm_compute. reflexivity. Qed.


Example t_0400 :
  samSubModeRoll_fun (f32 (1076054850)) 34 0 6250 0 (f32 (3214824400)) (f32 (1070365107)) (f32 (3219926066))
  = (17, 0, 0, [3214824400; 1070365107; 3219926066]).
Proof. vm_compute. reflexivity. Qed.


Example t_0401 :
  samSubModeRoll_fun (f32 (1069960836)) 36 0 6249 3 (f32 (1055753805)) (f32 (1069766696)) (f32 (3216859899))
  = (36, 6250, 0, [1055753805; 1069766696; 3216859899]).
Proof. vm_compute. reflexivity. Qed.


Example t_0402 :
  samSubModeRoll_fun (f32 (1073741824)) 71 2 2320 5 (f32 (3210966776)) (f32 (3216142227)) (f32 (3197078629))
  = (71, 2321, 0, [3210966776; 3216142227; 3197078629]).
Proof. vm_compute. reflexivity. Qed.


Example t_0403 :
  samSubModeRoll_fun (f32 (1073741824)) 46 1 6250 12 (f32 (3220030495)) (f32 (1070150196)) (f32 (1050984556))
  = (51, 0, 0, [3220030495; 1070150196; 1050984556]).
Proof. vm_compute. reflexivity. Qed.


Example t_0404 :
  samSubModeRoll_fun (f32 (2143289344)) 15 1 3788 5 (f32 (1059756042)) (f32 (3216131847)) (f32 (3215396728))
  = (15, 3789, 5, [1059756042; 3216131847; 3215396728]).
Proof. vm_compute. reflexivity. Qed.


Example t_0405 :
  samSubModeRoll_fun (f32 (2139095040)) 66 1 1063 5 (f32 (3213724124)) (f32 (3195216786)) (f32 (1066064872))
  = (66, 1064, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0406 :
  samSubModeRoll_fun (f32 (3217927408)) 41 0 4294967295 10 (f32 (3208882173)) (f32 (1072231401)) (f32 (3214251122))
  = (41, 0, 0, [3208882173; 1072231401; 3214251122]).
Proof. vm_compute. reflexivity. Qed.


Example t_0407 :
  samSubModeRoll_fun (f32 (1073741824)) 6 1 5293 4294967295 (f32 (3215676850)) (f32 (3213617109)) (f32 (1070284055))
  = (6, 5294, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0408 :
  samSubModeRoll_fun (f32 (1073972887)) 0 1 5494 15 (f32 (1053577183)) (f32 (1049757672)) (f32 (3205693684))
  = (51, 0, 0, [1053577183; 1049757672; 3205693684]).
Proof. vm_compute. reflexivity. Qed.


Example t_0409 :
  samSubModeRoll_fun (f32 (1065353216)) 72 1 3178 5 (f32 (3214813802)) (f32 (1049748815)) (f32 (3214357999))
  = (72, 3179, 5, [3214813802; 1049748815; 3214357999]).
Proof. vm_compute. reflexivity. Qed.


Example t_0410 :
  samSubModeRoll_fun (f32 (1073741824)) 33 1 1838 11 (f32 (1071316809)) (f32 (1071324254)) (f32 (3211136823))
  = (33, 1839, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0411 :
  samSubModeRoll_fun (f32 (1073741824)) 18 1 55 12 (f32 (3215380381)) (f32 (3220494260)) (f32 (3213658090))
  = (51, 0, 0, [3215380381; 3220494260; 3213658090]).
Proof. vm_compute. reflexivity. Qed.


Example t_0412 :
  samSubModeRoll_fun (f32 (1069816032)) 65 0 6250 2 (f32 (3217300000)) (f32 (1070753113)) (f32 (1070320746))
  = (17, 0, 0, [3217300000; 1070753113; 1070320746]).
Proof. vm_compute. reflexivity. Qed.


Example t_0413 :
  samSubModeRoll_fun (f32 (1057315331)) 54 0 6249 10 (f32 (1069485472)) (f32 (3215180924)) (f32 (1066776962))
  = (54, 6250, 0, [1069485472; 3215180924; 1066776962]).
Proof. vm_compute. reflexivity. Qed.


Example t_0414 :
  samSubModeRoll_fun (f32 (1073741824)) 37 2 4514 5 (f32 (3218529470)) (f32 (1072331859)) (f32 (3200578439))
  = (37, 4515, 0, [3218529470; 1072331859; 3200578439]).
Proof. vm_compute. reflexivity. Qed.


Example t_0415 :
  samSubModeRoll_fun (f32 (1073741824)) 54 1 6250 12 (f32 (3202918999)) (f32 (3221205830)) (f32 (1057928628))
  = (51, 0, 0, [3202918999; 3221205830; 1057928628]).
Proof. vm_compute. reflexivity. Qed.


Example t_0416 :
  samSubModeRoll_fun (f32 (2143289344)) 56 1 7643 5 (f32 (1040961418)) (f32 (1071009234)) (f32 (3215474326))
  = (17, 0, 0, [1040961418; 1071009234; 3215474326]).
Proof. vm_compute. reflexivity. Qed.


Example t_0417 :
  samSubModeRoll_fun (f32 (2139095040)) 77 1 7834 5 (f32 (3203764489)) (f32 (1069106462)) (f32 (1058405740))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0418 :
  samSubModeRoll_fun (f32 (1075940202)) 40 0 4294967295 6 (f32 (1071210880)) (f32 (3215353053)) (f32 (1071918222))
  = (40, 0, 0, [1071210880; 3215353053; 1071918222]).
Proof. vm_compute. reflexivity. Qed.


Example t_0419 :
  samSubModeRoll_fun (f32 (1073741824)) 61 1 2557 4294967295 (f32 (1053487388)) (f32 (3219459126)) (f32 (3195403380))
  = (61, 2558, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0420 :
  samSubModeRoll_fun (f32 (1066592082)) 17 0 175 10 (f32 (1069698177)) (f32 (1066008725)) (f32 (1066854123))
  = (17, 176, 0, [1069698177; 1066008725; 1066854123]).
Proof. vm_compute. reflexivity. Qed.


Example t_0421 :
  samSubModeRoll_fun (f32 (1065353216)) 11 1 298 13 (f32 (1070048850)) (f32 (3204569777)) (f32 (1033317646))
  = (11, 299, 13, [1070048850; 3204569777; 1033317646]).
Proof. vm_compute. reflexivity. Qed.


Example t_0422 :
  samSubModeRoll_fun (f32 (1073741824)) 7 1 5143 11 (f32 (1068616895)) (f32 (1034424111)) (f32 (1057789410))
  = (7, 5144, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0423 :
  samSubModeRoll_fun (f32 (1073741824)) 15 1 6072 12 (f32 (3213251020)) (f32 (3220691038)) (f32 (3213461525))
  = (51, 0, 0, [3213251020; 3220691038; 3213461525]).
Proof. vm_compute. reflexivity. Qed.


Example t_0424 :
  samSubModeRoll_fun (f32 (1076165400)) 10 0 6250 14 (f32 (1056995349)) (f32 (3214372928)) (f32 (1066276119))
  = (17, 0, 0, [1056995349; 3214372928; 1066276119]).
Proof. vm_compute. reflexivity. Qed.


Example t_0425 :
  samSubModeRoll_fun (f32 (1073283459)) 2 0 6249 19 (f32 (1063514143)) (f32 (1037925412)) (f32 (3192339196))
  = (2, 6250, 0, [1063514143; 1037925412; 3192339196]).
Proof. vm_compute. reflexivity. Qed.


Example t_0426 :
  samSubModeRoll_fun (f32 (1073741824)) 4 2 1401 5 (f32 (3214305186)) (f32 (3214508847)) (f32 (1057535308))
  = (4, 1402, 0, [3214305186; 3214508847; 1057535308]).
Proof. vm_compute. reflexivity. Qed.


Example t_0427 :
  samSubModeRoll_fun (f32 (1073741824)) 44 1 6250 12 (f32 (1071870897)) (f32 (1067241501)) (f32 (1062067349))
  = (51, 0, 0, [1071870897; 1067241501; 1062067349]).
Proof. vm_compute. reflexivity. Qed.


Example t_0428 :
  samSubModeRoll_fun (f32 (2143289344)) 37 1 7916 5 (f32 (1054496197)) (f32 (3204897447)) (f32 (3205722533))
  = (17, 0, 0, [1054496197; 3204897447; 3205722533]).
Proof. vm_compute. reflexivity. Qed.


Example t_0429 :
  samSubModeRoll_fun (f32 (2139095040)) 31 1 1228 5 (f32 (1066322025)) (f32 (1054788490)) (f32 (3189647307))
  = (31, 1229, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0430 :
  samSubModeRoll_fun (f32 (1071227189)) 73 0 4294967295 6 (f32 (1060487252)) (f32 (3201650561)) (f32 (1069405140))
  = (73, 0, 0, [1060487252; 3201650561; 1069405140]).
Proof. vm_compute. reflexivity. Qed.


Example t_0431 :
  samSubModeRoll_fun (f32 (1073741824)) 25 1 7977 4294967295 (f32 (3218521902)) (f32 (3176494147)) (f32 (3199429551))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0432 :
  samSubModeRoll_fun (f32 (1067057587)) 71 0 2715 7 (f32 (3206991801)) (f32 (1058233121)) (f32 (3188776161))
  = (71, 2716, 0, [3206991801; 1058233121; 3188776161]).
Proof. vm_compute. reflexivity. Qed.


Example t_0433 :
  samSubModeRoll_fun (f32 (1065353216)) 69 1 7584 8 (f32 (1069472275)) (f32 (3195617603)) (f32 (1057236507))
  = (17, 0, 0, [1069472275; 3195617603; 1057236507]).
Proof. vm_compute. reflexivity. Qed.


Example t_0434 :
  samSubModeRoll_fun (f32 (1073741824)) 9 1 3252 11 (f32 (3220129441)) (f32 (3213522342)) (f32 (3218657245))
  = (9, 3253, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0435 :
  samSubModeRoll_fun (f32 (1073741824)) 76 1 6220 12 (f32 (3202862590)) (f32 (3213226777)) (f32 (1064296334))
  = (51, 0, 0, [3202862590; 3213226777; 1064296334]).
Proof. vm_compute. reflexivity. Qed.


Example t_0436 :
  samSubModeRoll_fun (f32 (3218203332)) 43 0 6250 8 (f32 (3193880591)) (f32 (1069545549)) (f32 (1072271167))
  = (17, 0, 0, [3193880591; 1069545549; 1072271167]).
Proof. vm_compute. reflexivity. Qed.


Example t_0437 :
  samSubModeRoll_fun (f32 (3220834856)) 30 0 6249 3 (f32 (3214773536)) (f32 (3197503027)) (f32 (3217015121))
  = (30, 6250, 0, [3214773536; 3197503027; 3217015121]).
Proof. vm_compute. reflexivity. Qed.


Example t_0438 :
  samSubModeRoll_fun (f32 (1073741824)) 27 2 2567 5 (f32 (3189531729)) (f32 (3220683354)) (f32 (1050917058))
  = (27, 2568, 0, [3189531729; 3220683354; 1050917058]).
Proof. vm_compute. reflexivity. Qed.


Example t_0439 :
  samSubModeRoll_fun (f32 (1073741824)) 78 1 6250 12 (f32 (3216649614)) (f32 (1050654236)) (f32 (1072670147))
  = (51, 0, 0, [3216649614; 1050654236; 1072670147]).
Proof. vm_compute. reflexivity. Qed.


Example t_0440 :
  samSubModeRoll_fun (f32 (2143289344)) 78 1 798 5 (f32 (3198670237)) (f32 (3207815258)) (f32 (3209596274))
  = (78, 799, 5, [3198670237; 3207815258; 3209596274]).
Proof. vm_compute. reflexivity. Qed.


Example t_0441 :
  samSubModeRoll_fun (f32 (2139095040)) 72 1 6567 5 (f32 (1067660438)) (f32 (1050976358)) (f32 (1072302167))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0442 :
  samSubModeRoll_fun (f32 (3215440353)) 77 0 4294967295 9 (f32 (1072420401)) (f32 (3172898417)) (f32 (1062048865))
  = (77, 0, 0, [1072420401; 3172898417; 1062048865]).
Proof. vm_compute. reflexivity. Qed.


Example t_0443 :
  samSubModeRoll_fun (f32 (1073741824)) 43 1 985 4294967295 (f32 (1063965765)) (f32 (1063633211)) (f32 (1066595293))
  = (43, 986, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0444 :
  samSubModeRoll_fun (f32 (1027713944)) 13 0 1650 4 (f32 (3209926882)) (f32 (3200101835)) (f32 (1064856325))
  = (13, 1651, 0, [3209926882; 3200101835; 1064856325]).
Proof. vm_compute. reflexivity. Qed.


Example t_0445 :
  samSubModeRoll_fun (f32 (1065353216)) 64 1 377 20 (f32 (3176356150)) (f32 (1057993781)) (f32 (3210018921))
  = (64, 378, 20, [3176356150; 1057993781; 3210018921]).
Proof. vm_compute. reflexivity. Qed.


Example t_0446 :
  samSubModeRoll_fun (f32 (1073741824)) 30 1 4552 11 (f32 (3208828562)) (f32 (3217639154)) (f32 (1072760937))
  = (30, 4553, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0447 :
  samSubModeRoll_fun (f32 (1073741824)) 41 1 1612 12 (f32 (1067207307)) (f32 (1059205119)) (f32 (3207410012))
  = (51, 0, 0, [1067207307; 1059205119; 3207410012]).
Proof. vm_compute. reflexivity. Qed.


Example t_0448 :
  samSubModeRoll_fun (f32 (1067043215)) 13 0 6250 14 (f32 (3211683394)) (f32 (1055247521)) (f32 (1069224640))
  = (17, 0, 0, [3211683394; 1055247521; 1069224640]).
Proof. vm_compute. reflexivity. Qed.


Example t_0449 :
  samSubModeRoll_fun (f32 (1076395707)) 59 0 6249 19 (f32 (1061260133)) (f32 (3172153212)) (f32 (1061405000))
  = (59, 6250, 0, [1061260133; 3172153212; 1061405000]).
Proof. vm_compute. reflexivity. Qed.


Example t_0450 :
  samSubModeRoll_fun (f32 (1073741824)) 24 2 5656 5 (f32 (1053920595)) (f32 (3220656194)) (f32 (3193679058))
  = (24, 5657, 0, [1053920595; 3220656194; 3193679058]).
Proof. vm_compute. reflexivity. Qed.


Example t_0451 :
  samSubModeRoll_fun (f32 (1073741824)) 0 1 6250 12 (f32 (1067390282)) (f32 (3219799450)) (f32 (3216643570))
  = (51, 0, 0, [1067390282; 3219799450; 3216643570]).
Proof. vm_compute. reflexivity. Qed.


Example t_0452 :
  samSubModeRoll_fun (f32 (2143289344)) 77 1 4090 5 (f32 (1063010362)) (f32 (3192755412)) (f32 (1063667530))
  = (77, 4091, 5, [1063010362; 3192755412; 1063667530]).
Proof. vm_compute. reflexivity. Qed.


Example t_0453 :
  samSubModeRoll_fun (f32 (2139095040)) 55 1 1462 5 (f32 (1051953819)) (f32 (1064911004)) (f32 (1072932425))
  = (55, 1463, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0454 :
  samSubModeRoll_fun (f32 (3206186222)) 1 0 4294967295 3 (f32 (1058697510)) (f32 (3216997300)) (f32 (1060481764))
  = (1, 0, 0, [1058697510; 3216997300; 1060481764]).
Proof. vm_compute. reflexivity. Qed.


Example t_0455 :
  samSubModeRoll_fun (f32 (1073741824)) 1 1 7005 4294967295 (f32 (3208328685)) (f32 (3215278457)) (f32 (1060541817))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0456 :
  samSubModeRoll_fun (f32 (3213943886)) 64 1 887 12 (f32 (1053020712)) (f32 (1058380983)) (f32 (3211347143))
  = (64, 888, 12, [1053020712; 1058380983; 3211347143]).
Proof. vm_compute. reflexivity. Qed.


Example t_0457 :
  samSubModeRoll_fun (f32 (1065353216)) 61 1 120 12 (f32 (3209115520)) (f32 (1032865507)) (f32 (3220137059))
  = (61, 121, 12, [3209115520; 1032865507; 3220137059]).
Proof. vm_compute. reflexivity. Qed.


Example t_0458 :
  samSubModeRoll_fun (f32 (1073741824)) 27 1 4093 11 (f32 (1065836994)) (f32 (1066361713)) (f32 (3186721451))
  = (27, 4094, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0459 :
  samSubModeRoll_fun (f32 (1073741824)) 18 1 5024 12 (f32 (1058437373)) (f32 (1067679063)) (f32 (1073159338))
  = (51, 0, 0, [1058437373; 1067679063; 1073159338]).
Proof. vm_compute. reflexivity. Qed.


Example t_0460 :
  samSubModeRoll_fun (f32 (3214704966)) 58 0 6250 7 (f32 (1065084210)) (f32 (1073448723)) (f32 (3216910584))
  = (17, 0, 0, [1065084210; 1073448723; 3216910584]).
Proof. vm_compute. reflexivity. Qed.


Example t_0461 :
  samSubModeRoll_fun (f32 (1076852483)) 9 0 6249 19 (f32 (3206795734)) (f32 (3212947566)) (f32 (1044972945))
  = (9, 6250, 0, [3206795734; 3212947566; 1044972945]).
Proof. vm_compute. reflexivity. Qed.


Example t_0462 :
  samSubModeRoll_fun (f32 (1073741824)) 37 2 7965 5 (f32 (3206244569)) (f32 (3218602083)) (f32 (1069858937))
  = (17, 0, 0, [3206244569; 3218602083; 1069858937]).
Proof. vm_compute. reflexivity. Qed.


Example t_0463 :
  samSubModeRoll_fun (f32 (1073741824)) 74 1 6250 12 (f32 (1055300410)) (f32 (3208861206)) (f32 (3214749559))
  = (51, 0, 0, [1055300410; 3208861206; 3214749559]).
Proof. vm_compute. reflexivity. Qed.


Example t_0464 :
  samSubModeRoll_fun (f32 (2143289344)) 55 1 557 5 (f32 (1059365269)) (f32 (1073097244)) (f32 (1064158654))
  = (55, 558, 5, [1059365269; 1073097244; 1064158654]).
Proof. vm_compute. reflexivity. Qed.


Example t_0465 :
  samSubModeRoll_fun (f32 (2139095040)) 1 1 2490 5 (f32 (1066915775)) (f32 (1045771903)) (f32 (1064694519))
  = (1, 2491, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0466 :
  samSubModeRoll_fun (f32 (3220652315)) 61 0 4294967295 2 (f32 (3217067614)) (f32 (3213231477)) (f32 (1072244006))
  = (61, 0, 0, [3217067614; 3213231477; 1072244006]).
Proof. vm_compute. reflexivity. Qed.


Example t_0467 :
  samSubModeRoll_fun (f32 (1073741824)) 20 1 6340 4294967295 (f32 (1072343813)) (f32 (1065092064)) (f32 (1051154394))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0468 :
  samSubModeRoll_fun (f32 (3220334323)) 17 1 7873 9 (f32 (3217933837)) (f32 (1054762965)) (f32 (1067811346))
  = (17, 0, 0, [3217933837; 1054762965; 1067811346]).
Proof. vm_compute. reflexivity. Qed.


Example t_0469 :
  samSubModeRoll_fun (f32 (1065353216)) 37 1 3839 0 (f32 (1065406456)) (f32 (3217121732)) (f32 (3210083900))
  = (37, 3840, 0, [1065406456; 3217121732; 3210083900]).
Proof. vm_compute. reflexivity. Qed.


Example t_0470 :
  samSubModeRoll_fun (f32 (1073741824)) 64 1 234 11 (f32 (3220710236)) (f32 (1064166737)) (f32 (1059942152))
  = (64, 235, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0471 :
  samSubModeRoll_fun (f32 (1073741824)) 25 1 6012 12 (f32 (3195949385)) (f32 (3220828721)) (f32 (3208828994))
  = (51, 0, 0, [3195949385; 3220828721; 3208828994]).
Proof. vm_compute. reflexivity. Qed.


Example t_0472 :
  samSubModeRoll_fun (f32 (1074581748)) 7 0 6250 11 (f32 (3220090653)) (f32 (3213646727)) (f32 (3196314701))
  = (17, 0, 0, [3220090653; 3213646727; 3196314701]).
Proof. vm_compute. reflexivity. Qed.


Example t_0473 :
  samSubModeRoll_fun (f32 (3170391696)) 67 0 6249 10 (f32 (3219453550)) (f32 (1069965148)) (f32 (1049292004))
  = (67, 6250, 0, [3219453550; 1069965148; 1049292004]).
Proof. vm_compute. reflexivity. Qed.


Example t_0474 :
  samSubModeRoll_fun (f32 (1073741824)) 33 2 927 5 (f32 (1053940276)) (f32 (3199010191)) (f32 (3213351256))
  = (33, 928, 0, [1053940276; 3199010191; 3213351256]).
Proof. vm_compute. reflexivity. Qed.


Example t_0475 :
  samSubModeRoll_fun (f32 (1073741824)) 43 1 6250 12 (f32 (3215427994)) (f32 (3212873808)) (f32 (1073371777))
  = (51, 0, 0, [3215427994; 3212873808; 1073371777]).
Proof. vm_compute. reflexivity. Qed.


Example t_0476 :
  samSubModeRoll_fun (f32 (2143289344)) 46 1 2932 5 (f32 (3219465322)) (f32 (1068565021)) (f32 (1067168695))
  = (46, 2933, 5, [3219465322; 1068565021; 1067168695]).
Proof. vm_compute. reflexivity. Qed.


Example t_0477 :
  samSubModeRoll_fun (f32 (2139095040)) 53 1 261 5 (f32 (1028471293)) (f32 (3219034080)) (f32 (1039921104))
  = (53, 262, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0478 :
  samSubModeRoll_fun (f32 (1070482156)) 9 0 4294967295 7 (f32 (3198186963)) (f32 (3217924022)) (f32 (3212078937))
  = (9, 0, 0, [3198186963; 3217924022; 3212078937]).
Proof. vm_compute. reflexivity. Qed.


Example t_0479 :
  samSubModeRoll_fun (f32 (1073741824)) 49 1 7885 4294967295 (f32 (3220561352)) (f32 (1072026147)) (f32 (3221054959))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0480 :
  samSubModeRoll_fun (f32 (1052551991)) 63 1 6699 20 (f32 (1060916939)) (f32 (3215684179)) (f32 (3218205123))
  = (17, 0, 0, [1060916939; 3215684179; 3218205123]).
Proof. vm_compute. reflexivity. Qed.


Example t_0481 :
  samSubModeRoll_fun (f32 (1065353216)) 4 1 6402 13 (f32 (1060485089)) (f32 (1066010292)) (f32 (1068459969))
  = (17, 0, 0, [1060485089; 1066010292; 1068459969]).
Proof. vm_compute. reflexivity. Qed.


Example t_0482 :
  samSubModeRoll_fun (f32 (1073741824)) 24 1 6637 11 (f32 (3188731802)) (f32 (1058123820)) (f32 (3219361992))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0483 :
  samSubModeRoll_fun (f32 (1073741824)) 13 1 2474 12 (f32 (3188497025)) (f32 (3189284327)) (f32 (3198569710))
  = (51, 0, 0, [3188497025; 3189284327; 3198569710]).
Proof. vm_compute. reflexivity. Qed.


Example t_0484 :
  samSubModeRoll_fun (f32 (1031649427)) 70 0 6250 8 (f32 (3188401066)) (f32 (1069321933)) (f32 (1072622300))
  = (17, 0, 0, [3188401066; 1069321933; 1072622300]).
Proof. vm_compute. reflexivity. Qed.


Example t_0485 :
  samSubModeRoll_fun (f32 (3204653214)) 67 0 6249 9 (f32 (1048913162)) (f32 (3208434490)) (f32 (1059932865))
  = (67, 6250, 0, [1048913162; 3208434490; 1059932865]).
Proof. vm_compute. reflexivity. Qed.


Example t_0486 :
  samSubModeRoll_fun (f32 (1073741824)) 40 2 6334 5 (f32 (3220287379)) (f32 (3217630533)) (f32 (1070390799))
  = (17, 0, 0, [3220287379; 3217630533; 1070390799]).
Proof. vm_compute. reflexivity. Qed.


Example t_0487 :
  samSubModeRoll_fun (f32 (1073741824)) 52 1 6250 12 (f32 (3220225438)) (f32 (1049566033)) (f32 (3179079207))
  = (51, 0, 0, [3220225438; 1049566033; 3179079207]).
Proof. vm_compute. reflexivity. Qed.


Example t_0488 :
  samSubModeRoll_fun (f32 (2143289344)) 58 1 6872 5 (f32 (1073533225)) (f32 (3216169719)) (f32 (3217413634))
  = (17, 0, 0, [1073533225; 3216169719; 3217413634]).
Proof. vm_compute. reflexivity. Qed.


Example t_0489 :
  samSubModeRoll_fun (f32 (2139095040)) 23 1 7257 5 (f32 (1057086881)) (f32 (1070796229)) (f32 (1049774441))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0490 :
  samSubModeRoll_fun (f32 (3202938419)) 4 0 4294967295 15 (f32 (3214151113)) (f32 (3214938681)) (f32 (1069859504))
  = (4, 0, 0, [3214151113; 3214938681; 1069859504]).
Proof. vm_compute. reflexivity. Qed.


Example t_0491 :
  samSubModeRoll_fun (f32 (1073741824)) 13 1 3968 4294967295 (f32 (3214957295)) (f32 (3209680319)) (f32 (3207954303))
  = (13, 3969, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0492 :
  samSubModeRoll_fun (f32 (3214442918)) 12 0 3877 20 (f32 (3215976398)) (f32 (1059267909)) (f32 (3204033832))
  = (12, 3878, 0, [3215976398; 1059267909; 3204033832]).
Proof. vm_compute. reflexivity. Qed.


Example t_0493 :
  samSubModeRoll_fun (f32 (1065353216)) 63 1 2167 12 (f32 (3211854046)) (f32 (3208388047)) (f32 (1067654906))
  = (63, 2168, 12, [3211854046; 3208388047; 1067654906]).
Proof. vm_compute. reflexivity. Qed.


Example t_0494 :
  samSubModeRoll_fun (f32 (1073741824)) 40 1 359 11 (f32 (3205180450)) (f32 (1053801508)) (f32 (3216171519))
  = (40, 360, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0495 :
  samSubModeRoll_fun (f32 (1073741824)) 45 1 1449 12 (f32 (1045647627)) (f32 (3200862690)) (f32 (1072023855))
  = (51, 0, 0, [1045647627; 3200862690; 1072023855]).
Proof. vm_compute. reflexivity. Qed.


Example t_0496 :
  samSubModeRoll_fun (f32 (1073053223)) 61 0 6250 13 (f32 (1067231484)) (f32 (1045775421)) (f32 (1066113975))
  = (17, 0, 0, [1067231484; 1045775421; 1066113975]).
Proof. vm_compute. reflexivity. Qed.


Example t_0497 :
  samSubModeRoll_fun (f32 (1070794501)) 23 0 6249 15 (f32 (3210392046)) (f32 (3214304584)) (f32 (1055547044))
  = (23, 6250, 0, [3210392046; 3214304584; 1055547044]).
Proof. vm_compute. reflexivity. Qed.


Example t_0498 :
  samSubModeRoll_fun (f32 (1073741824)) 21 2 3844 5 (f32 (1061193599)) (f32 (3208537974)) (f32 (1066770303))
  = (21, 3845, 0, [1061193599; 3208537974; 1066770303]).
Proof. vm_compute. reflexivity. Qed.


Example t_0499 :
  samSubModeRoll_fun (f32 (1073741824)) 20 1 6250 12 (f32 (1070200922)) (f32 (1067179068)) (f32 (1068350013))
  = (51, 0, 0, [1070200922; 1067179068; 1068350013]).
Proof. vm_compute. reflexivity. Qed.


Example t_0500 :
  samSubModeRoll_fun (f32 (2143289344)) 3 1 5892 5 (f32 (1021360024)) (f32 (3218238503)) (f32 (1061227210))
  = (3, 5893, 5, [1021360024; 3218238503; 1061227210]).
Proof. vm_compute. reflexivity. Qed.


Example t_0501 :
  samSubModeRoll_fun (f32 (2139095040)) 15 1 1615 5 (f32 (3194994085)) (f32 (1061805560)) (f32 (3216277472))
  = (15, 1616, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0502 :
  samSubModeRoll_fun (f32 (1075903574)) 41 0 4294967295 3 (f32 (1071457378)) (f32 (3202606521)) (f32 (1071148113))
  = (41, 0, 0, [1071457378; 3202606521; 1071148113]).
Proof. vm_compute. reflexivity. Qed.


Example t_0503 :
  samSubModeRoll_fun (f32 (1073741824)) 74 1 4769 4294967295 (f32 (3215473450)) (f32 (3202561548)) (f32 (1069081338))
  = (74, 4770, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0504 :
  samSubModeRoll_fun (f32 (1071576789)) 24 1 4797 19 (f32 (3214609226)) (f32 (3205284739)) (f32 (3210511752))
  = (51, 0, 0, [3214609226; 3205284739; 3210511752]).
Proof. vm_compute. reflexivity. Qed.


Example t_0505 :
  samSubModeRoll_fun (f32 (1065353216)) 9 1 2062 20 (f32 (3210002687)) (f32 (1068086129)) (f32 (1068598181))
  = (9, 2063, 20, [3210002687; 1068086129; 1068598181]).
Proof. vm_compute. reflexivity. Qed.


Example t_0506 :
  samSubModeRoll_fun (f32 (1073741824)) 34 1 6382 11 (f32 (3211829624)) (f32 (1066694753)) (f32 (3209512721))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0507 :
  samSubModeRoll_fun (f32 (1073741824)) 49 1 3428 12 (f32 (1072595931)) (f32 (1050004494)) (f32 (3215544155))
  = (51, 0, 0, [1072595931; 1050004494; 3215544155]).
Proof. vm_compute. reflexivity. Qed.


Example t_0508 :
  samSubModeRoll_fun (f32 (3207826689)) 43 0 6250 5 (f32 (3215820514)) (f32 (3213440810)) (f32 (3210319048))
  = (17, 0, 0, [3215820514; 3213440810; 3210319048]).
Proof. vm_compute. reflexivity. Qed.


Example t_0509 :
  samSubModeRoll_fun (f32 (1068167947)) 36 0 6249 2 (f32 (3216493834)) (f32 (3210802546)) (f32 (1072235268))
  = (36, 6250, 0, [3216493834; 3210802546; 1072235268]).
Proof. vm_compute. reflexivity. Qed.


Example t_0510 :
  samSubModeRoll_fun (f32 (1073741824)) 3 2 6476 5 (f32 (1073391358)) (f32 (3205699997)) (f32 (3172950261))
  = (17, 0, 0, [1073391358; 3205699997; 3172950261]).
Proof. vm_compute. reflexivity. Qed.


Example t_0511 :
  samSubModeRoll_fun (f32 (1073741824)) 47 1 6250 12 (f32 (3216922177)) (f32 (3219149912)) (f32 (1053988436))
  = (51, 0, 0, [3216922177; 3219149912; 1053988436]).
Proof. vm_compute. reflexivity. Qed.


Example t_0512 :
  samSubModeRoll_fun (f32 (2143289344)) 19 1 4836 5 (f32 (1071456824)) (f32 (3212769523)) (f32 (3214873794))
  = (19, 4837, 5, [1071456824; 3212769523; 3214873794]).
Proof. vm_compute. reflexivity. Qed.


Example t_0513 :
  samSubModeRoll_fun (f32 (2139095040)) 20 1 7308 5 (f32 (1072697931)) (f32 (3216283334)) (f32 (3204749594))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0514 :
  samSubModeRoll_fun (f32 (1051795270)) 73 0 4294967295 1 (f32 (3198742777)) (f32 (3210728203)) (f32 (1071164777))
  = (73, 0, 0, [3198742777; 3210728203; 1071164777]).
Proof. vm_compute. reflexivity. Qed.


Example t_0515 :
  samSubModeRoll_fun (f32 (1073741824)) 36 1 1588 4294967295 (f32 (1051159248)) (f32 (3216688848)) (f32 (3215692218))
  = (36, 1589, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0516 :
  samSubModeRoll_fun (f32 (3205524334)) 52 0 4798 5 (f32 (3215767169)) (f32 (3187459366)) (f32 (1065950525))
  = (52, 4799, 0, [3215767169; 3187459366; 1065950525]).
Proof. vm_compute. reflexivity. Qed.


Example t_0517 :
  samSubModeRoll_fun (f32 (1065353216)) 58 1 6529 7 (f32 (3204472643)) (f32 (1070395475)) (f32 (3214799672))
  = (17, 0, 0, [3204472643; 1070395475; 3214799672]).
Proof. vm_compute. reflexivity. Qed.


Example t_0518 :
  samSubModeRoll_fun (f32 (1073741824)) 13 1 4519 11 (f32 (1056098016)) (f32 (1051657694)) (f32 (3218107054))
  = (13, 4520, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0519 :
  samSubModeRoll_fun (f32 (1073741824)) 39 1 132 12 (f32 (1066655503)) (f32 (3217106602)) (f32 (1071538191))
  = (51, 0, 0, [1066655503; 3217106602; 1071538191]).
Proof. vm_compute. reflexivity. Qed.


Example t_0520 :
  samSubModeRoll_fun (f32 (1076074952)) 18 0 6250 4 (f32 (1072237166)) (f32 (3220780533)) (f32 (3197604497))
  = (17, 0, 0, [1072237166; 3220780533; 3197604497]).
Proof. vm_compute. reflexivity. Qed.


Example t_0521 :
  samSubModeRoll_fun (f32 (1069202152)) 73 0 6249 11 (f32 (3201532490)) (f32 (3218830549)) (f32 (3214700500))
  = (73, 6250, 0, [3201532490; 3218830549; 3214700500]).
Proof. vm_compute. reflexivity. Qed.


Example t_0522 :
  samSubModeRoll_fun (f32 (1073741824)) 24 2 5764 5 (f32 (1072297842)) (f32 (3216266269)) (f32 (3160006767))
  = (24, 5765, 0, [1072297842; 3216266269; 3160006767]).
Proof. vm_compute. reflexivity. Qed.


Example t_0523 :
  samSubModeRoll_fun (f32 (1073741824)) 71 1 6250 12 (f32 (1064192094)) (f32 (1066263128)) (f32 (1070042943))
  = (51, 0, 0, [1064192094; 1066263128; 1070042943]).
Proof. vm_compute. reflexivity. Qed.


Example t_0524 :
  samSubModeRoll_fun (f32 (2143289344)) 4 1 2231 5 (f32 (3219909319)) (f32 (3209593932)) (f32 (3216167540))
  = (4, 2232, 5, [3219909319; 3209593932; 3216167540]).
Proof. vm_compute. reflexivity. Qed.


Example t_0525 :
  samSubModeRoll_fun (f32 (2139095040)) 76 1 7098 5 (f32 (1035328986)) (f32 (1043968155)) (f32 (3208722087))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0526 :
  samSubModeRoll_fun (f32 (3189562454)) 24 0 4294967295 9 (f32 (1065417086)) (f32 (3213036723)) (f32 (3217000278))
  = (24, 0, 0, [1065417086; 3213036723; 3217000278]).
Proof. vm_compute. reflexivity. Qed.


Example t_0527 :
  samSubModeRoll_fun (f32 (1073741824)) 38 1 3948 4294967295 (f32 (1068711639)) (f32 (1049355545)) (f32 (3218873727))
  = (38, 3949, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0528 :
  samSubModeRoll_fun (f32 (1077211573)) 36 0 6747 19 (f32 (3212409207)) (f32 (1068393289)) (f32 (1059933687))
  = (17, 0, 0, [3212409207; 1068393289; 1059933687]).
Proof. vm_compute. reflexivity. Qed.


Example t_0529 :
  samSubModeRoll_fun (f32 (1065353216)) 2 1 1248 1 (f32 (1068385317)) (f32 (3194607486)) (f32 (1072362078))
  = (2, 1249, 1, [1068385317; 3194607486; 1072362078]).
Proof. vm_compute. reflexivity. Qed.


Example t_0530 :
  samSubModeRoll_fun (f32 (1073741824)) 70 1 4671 11 (f32 (1070983226)) (f32 (1066211210)) (f32 (3217981919))
  = (70, 4672, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0531 :
  samSubModeRoll_fun (f32 (1073741824)) 1 1 4390 12 (f32 (3203203489)) (f32 (3220486006)) (f32 (1067190784))
  = (51, 0, 0, [3203203489; 3220486006; 1067190784]).
Proof. vm_compute. reflexivity. Qed.


Example t_0532 :
  samSubModeRoll_fun (f32 (1066421758)) 45 0 6250 3 (f32 (1073510357)) (f32 (1066623830)) (f32 (1047147372))
  = (17, 0, 0, [1073510357; 1066623830; 1047147372]).
Proof. vm_compute. reflexivity. Qed.


Example t_0533 :
  samSubModeRoll_fun (f32 (1046354037)) 71 0 6249 0 (f32 (3215439905)) (f32 (3200626771)) (f32 (3191661777))
  = (71, 6250, 0, [3215439905; 3200626771; 3191661777]).
Proof. vm_compute. reflexivity. Qed.


Example t_0534 :
  samSubModeRoll_fun (f32 (1073741824)) 63 2 6474 5 (f32 (3213223184)) (f32 (3217317445)) (f32 (3214369821))
  = (17, 0, 0, [3213223184; 3217317445; 3214369821]).
Proof. vm_compute. reflexivity. Qed.


Example t_0535 :
  samSubModeRoll_fun (f32 (1073741824)) 25 1 6250 12 (f32 (1069904771)) (f32 (1071389199)) (f32 (1071664479))
  = (51, 0, 0, [1069904771; 1071389199; 1071664479]).
Proof. vm_compute. reflexivity. Qed.


Example t_0536 :
  samSubModeRoll_fun (f32 (2143289344)) 36 1 3131 5 (f32 (3217197073)) (f32 (1063647972)) (f32 (1057017874))
  = (36, 3132, 5, [3217197073; 1063647972; 1057017874]).
Proof. vm_compute. reflexivity. Qed.


Example t_0537 :
  samSubModeRoll_fun (f32 (2139095040)) 62 1 5997 5 (f32 (3216846801)) (f32 (3210376592)) (f32 (3172017000))
  = (62, 5998, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0538 :
  samSubModeRoll_fun (f32 (3190765611)) 72 0 4294967295 16 (f32 (1071175070)) (f32 (3139631341)) (f32 (1054160844))
  = (72, 0, 0, [1071175070; 3139631341; 1054160844]).
Proof. vm_compute. reflexivity. Qed.


Example t_0539 :
  samSubModeRoll_fun (f32 (1073741824)) 35 1 336 4294967295 (f32 (1068368638)) (f32 (3215229915)) (f32 (1073059390))
  = (35, 337, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0540 :
  samSubModeRoll_fun (f32 (3195728709)) 19 1 4063 9 (f32 (3215492151)) (f32 (3217151788)) (f32 (1065767185))
  = (19, 4064, 9, [3215492151; 3217151788; 1065767185]).
Proof. vm_compute. reflexivity. Qed.


Example t_0541 :
  samSubModeRoll_fun (f32 (1065353216)) 11 1 6424 18 (f32 (1068898050)) (f32 (1058551197)) (f32 (1071547618))
  = (17, 0, 0, [1068898050; 1058551197; 1071547618]).
Proof. vm_compute. reflexivity. Qed.


Example t_0542 :
  samSubModeRoll_fun (f32 (1073741824)) 78 1 1192 11 (f32 (1059500388)) (f32 (3215209875)) (f32 (1061321227))
  = (78, 1193, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0543 :
  samSubModeRoll_fun (f32 (1073741824)) 23 1 3107 12 (f32 (3219693968)) (f32 (3200909871)) (f32 (3210808363))
  = (51, 0, 0, [3219693968; 3200909871; 3210808363]).
Proof. vm_compute. reflexivity. Qed.


Example t_0544 :
  samSubModeRoll_fun (f32 (3215786500)) 5 0 6250 11 (f32 (1068388984)) (f32 (1067280963)) (f32 (3216607317))
  = (17, 0, 0, [1068388984; 1067280963; 3216607317]).
Proof. vm_compute. reflexivity. Qed.


Example t_0545 :
  samSubModeRoll_fun (f32 (1075292453)) 32 0 6249 19 (f32 (1063553703)) (f32 (3211915067)) (f32 (1060782015))
  = (32, 6250, 0, [1063553703; 3211915067; 1060782015]).
Proof. vm_compute. reflexivity. Qed.


Example t_0546 :
  samSubModeRoll_fun (f32 (1073741824)) 13 2 7871 5 (f32 (3216043023)) (f32 (3213837559)) (f32 (1070326481))
  = (17, 0, 0, [3216043023; 3213837559; 1070326481]).
Proof. vm_compute. reflexivity. Qed.


Example t_0547 :
  samSubModeRoll_fun (f32 (1073741824)) 26 1 6250 12 (f32 (1060596316)) (f32 (3213762404)) (f32 (1070702472))
  = (51, 0, 0, [1060596316; 3213762404; 1070702472]).
Proof. vm_compute. reflexivity. Qed.


Example t_0548 :
  samSubModeRoll_fun (f32 (2143289344)) 79 1 3979 5 (f32 (3218412729)) (f32 (1072058385)) (f32 (3212915280))
  = (79, 3980, 5, [3218412729; 1072058385; 3212915280]).
Proof. vm_compute. reflexivity. Qed.


Example t_0549 :
  samSubModeRoll_fun (f32 (2139095040)) 75 1 3212 5 (f32 (1069415737)) (f32 (3205702416)) (f32 (1055414552))
  = (75, 3213, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0550 :
  samSubModeRoll_fun (f32 (3215142599)) 61 0 4294967295 12 (f32 (1062137419)) (f32 (3220856191)) (f32 (1066685440))
  = (61, 0, 0, [1062137419; 3220856191; 1066685440]).
Proof. vm_compute. reflexivity. Qed.


Example t_0551 :
  samSubModeRoll_fun (f32 (1073741824)) 22 1 6107 4294967295 (f32 (3205700411)) (f32 (3205814415)) (f32 (3202115492))
  = (22, 6108, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0552 :
  samSubModeRoll_fun (f32 (1068252880)) 36 1 745 4 (f32 (3202019628)) (f32 (1042798522)) (f32 (3214172948))
  = (36, 746, 5, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0553 :
  samSubModeRoll_fun (f32 (1065353216)) 72 1 6681 6 (f32 (1066614880)) (f32 (3207573205)) (f32 (1070897561))
  = (17, 0, 0, [1066614880; 3207573205; 1070897561]).
Proof. vm_compute. reflexivity. Qed.


Example t_0554 :
  samSubModeRoll_fun (f32 (1073741824)) 15 1 4553 11 (f32 (3186086320)) (f32 (1070420786)) (f32 (1073179224))
  = (15, 4554, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0555 :
  samSubModeRoll_fun (f32 (1073741824)) 15 1 6176 12 (f32 (3219937020)) (f32 (3220065372)) (f32 (1070485937))
  = (51, 0, 0, [3219937020; 3220065372; 1070485937]).
Proof. vm_compute. reflexivity. Qed.


Example t_0556 :
  samSubModeRoll_fun (f32 (3207878575)) 48 0 6250 20 (f32 (1054404884)) (f32 (3216470518)) (f32 (3188553359))
  = (17, 0, 0, [1054404884; 3216470518; 3188553359]).
Proof. vm_compute. reflexivity. Qed.


Example t_0557 :
  samSubModeRoll_fun (f32 (3221026656)) 23 0 6249 4 (f32 (3217019606)) (f32 (3199082299)) (f32 (3213949780))
  = (23, 6250, 0, [3217019606; 3199082299; 3213949780]).
Proof. vm_compute. reflexivity. Qed.


Example t_0558 :
  samSubModeRoll_fun (f32 (1073741824)) 0 2 5790 5 (f32 (1053196400)) (f32 (3187910915)) (f32 (1066106731))
  = (0, 5791, 0, [1053196400; 3187910915; 1066106731]).
Proof. vm_compute. reflexivity. Qed.


Example t_0559 :
  samSubModeRoll_fun (f32 (1073741824)) 57 1 6250 12 (f32 (1072205162)) (f32 (3217723529)) (f32 (1061022852))
  = (51, 0, 0, [1072205162; 3217723529; 1061022852]).
Proof. vm_compute. reflexivity. Qed.


Example t_0560 :
  samSubModeRoll_fun (f32 (2143289344)) 45 1 6926 5 (f32 (3206784343)) (f32 (1067849805)) (f32 (3217267307))
  = (17, 0, 0, [3206784343; 1067849805; 3217267307]).
Proof. vm_compute. reflexivity. Qed.


Example t_0561 :
  samSubModeRoll_fun (f32 (2139095040)) 67 1 7656 5 (f32 (3216540391)) (f32 (1063931473)) (f32 (1058379447))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0562 :
  samSubModeRoll_fun (f32 (1075718455)) 71 0 4294967295 9 (f32 (3204758800)) (f32 (1067262397)) (f32 (1061852977))
  = (71, 0, 0, [3204758800; 1067262397; 1061852977]).
Proof. vm_compute. reflexivity. Qed.


Example t_0563 :
  samSubModeRoll_fun (f32 (1073741824)) 33 1 62 4294967295 (f32 (3219851293)) (f32 (1064345961)) (f32 (3219577305))
  = (33, 63, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0564 :
  samSubModeRoll_fun (f32 (1073343581)) 50 0 6367 16 (f32 (3187679484)) (f32 (1068686183)) (f32 (1063968260))
  = (17, 0, 0, [3187679484; 1068686183; 1063968260]).
Proof. vm_compute. reflexivity. Qed.


Example t_0565 :
  samSubModeRoll_fun (f32 (1065353216)) 15 1 3689 10 (f32 (3217620307)) (f32 (3203808029)) (f32 (1066171585))
  = (15, 3690, 10, [3217620307; 3203808029; 1066171585]).
Proof. vm_compute. reflexivity. Qed.


Example t_0566 :
  samSubModeRoll_fun (f32 (1073741824)) 35 1 1570 11 (f32 (1071088972)) (f32 (3186136063)) (f32 (3216551879))
  = (35, 1571, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0567 :
  samSubModeRoll_fun (f32 (1073741824)) 24 1 115 12 (f32 (1068802923)) (f32 (3192754950)) (f32 (1058394524))
  = (51, 0, 0, [1068802923; 3192754950; 1058394524]).
Proof. vm_compute. reflexivity. Qed.


Example t_0568 :
  samSubModeRoll_fun (f32 (3201873727)) 76 0 6250 19 (f32 (3205525461)) (f32 (3198007655)) (f32 (3201842565))
  = (17, 0, 0, [3205525461; 3198007655; 3201842565]).
Proof. vm_compute. reflexivity. Qed.


Example t_0569 :
  samSubModeRoll_fun (f32 (1070134224)) 79 0 6249 18 (f32 (1073606373)) (f32 (1070937999)) (f32 (1057467209))
  = (79, 6250, 0, [1073606373; 1070937999; 1057467209]).
Proof. vm_compute. reflexivity. Qed.


Example t_0570 :
  samSubModeRoll_fun (f32 (1073741824)) 6 2 1216 5 (f32 (3197079339)) (f32 (3189212696)) (f32 (3220146543))
  = (6, 1217, 0, [3197079339; 3189212696; 3220146543]).
Proof. vm_compute. reflexivity. Qed.


Example t_0571 :
  samSubModeRoll_fun (f32 (1073741824)) 79 1 6250 12 (f32 (3215997032)) (f32 (1070365011)) (f32 (3218887713))
  = (51, 0, 0, [3215997032; 1070365011; 3218887713]).
Proof. vm_compute. reflexivity. Qed.


Example t_0572 :
  samSubModeRoll_fun (f32 (2143289344)) 7 1 7579 5 (f32 (1067953262)) (f32 (3199535251)) (f32 (3185897148))
  = (17, 0, 0, [1067953262; 3199535251; 3185897148]).
Proof. vm_compute. reflexivity. Qed.


Example t_0573 :
  samSubModeRoll_fun (f32 (2139095040)) 59 1 2718 5 (f32 (3193735382)) (f32 (1065715643)) (f32 (1014337768))
  = (59, 2719, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0574 :
  samSubModeRoll_fun (f32 (3207967366)) 65 0 4294967295 9 (f32 (1067717201)) (f32 (3203165916)) (f32 (1069982473))
  = (65, 0, 0, [1067717201; 3203165916; 1069982473]).
Proof. vm_compute. reflexivity. Qed.


Example t_0575 :
  samSubModeRoll_fun (f32 (1073741824)) 36 1 2460 4294967295 (f32 (1044585350)) (f32 (3207896655)) (f32 (3216682862))
  = (36, 2461, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0576 :
  samSubModeRoll_fun (f32 (1066613480)) 6 0 990 2 (f32 (3215916460)) (f32 (3211421025)) (f32 (1058411569))
  = (6, 991, 0, [3215916460; 3211421025; 1058411569]).
Proof. vm_compute. reflexivity. Qed.


Example t_0577 :
  samSubModeRoll_fun (f32 (1065353216)) 73 1 839 16 (f32 (1063586521)) (f32 (1066085582)) (f32 (1049295536))
  = (73, 840, 16, [1063586521; 1066085582; 1049295536]).
Proof. vm_compute. reflexivity. Qed.


Example t_0578 :
  samSubModeRoll_fun (f32 (1073741824)) 49 1 6680 11 (f32 (1067152155)) (f32 (1064191106)) (f32 (3200355550))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0579 :
  samSubModeRoll_fun (f32 (1073741824)) 10 1 1183 12 (f32 (3205122073)) (f32 (3215184150)) (f32 (3207929363))
  = (51, 0, 0, [3205122073; 3215184150; 3207929363]).
Proof. vm_compute. reflexivity. Qed.


Example t_0580 :
  samSubModeRoll_fun (f32 (3209375551)) 51 0 6250 1 (f32 (3213589468)) (f32 (3212904313)) (f32 (1063164663))
  = (17, 0, 0, [3213589468; 3212904313; 1063164663]).
Proof. vm_compute. reflexivity. Qed.


Example t_0581 :
  samSubModeRoll_fun (f32 (1063100479)) 6 0 6249 9 (f32 (1071018444)) (f32 (1044861982)) (f32 (1073694220))
  = (6, 6250, 0, [1071018444; 1044861982; 1073694220]).
Proof. vm_compute. reflexivity. Qed.


Example t_0582 :
  samSubModeRoll_fun (f32 (1073741824)) 37 2 1312 5 (f32 (3219323611)) (f32 (3218702037)) (f32 (1067583693))
  = (37, 1313, 0, [3219323611; 3218702037; 1067583693]).
Proof. vm_compute. reflexivity. Qed.


Example t_0583 :
  samSubModeRoll_fun (f32 (1073741824)) 18 1 6250 12 (f32 (1042655210)) (f32 (3221174050)) (f32 (3220272343))
  = (51, 0, 0, [1042655210; 3221174050; 3220272343]).
Proof. vm_compute. reflexivity. Qed.


Example t_0584 :
  samSubModeRoll_fun (f32 (2143289344)) 18 1 549 5 (f32 (1054654392)) (f32 (1072100631)) (f32 (3187814527))
  = (18, 550, 5, [1054654392; 1072100631; 3187814527]).
Proof. vm_compute. reflexivity. Qed.


Example t_0585 :
  samSubModeRoll_fun (f32 (2139095040)) 24 1 7259 5 (f32 (3209164362)) (f32 (3214203234)) (f32 (3209609409))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0586 :
  samSubModeRoll_fun (f32 (1072736412)) 20 0 4294967295 4 (f32 (3214105426)) (f32 (1064905185)) (f32 (1051888916))
  = (20, 0, 0, [3214105426; 1064905185; 1051888916]).
Proof. vm_compute. reflexivity. Qed.


Example t_0587 :
  samSubModeRoll_fun (f32 (1073741824)) 51 1 4819 4294967295 (f32 (3216540230)) (f32 (3200177599)) (f32 (3217948572))
  = (51, 4820, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0588 :
  samSubModeRoll_fun (f32 (1069462022)) 9 0 7114 15 (f32 (1069992763)) (f32 (1034242052)) (f32 (3206431755))
  = (17, 0, 0, [1069992763; 1034242052; 3206431755]).
Proof. vm_compute. reflexivity. Qed.


Example t_0589 :
  samSubModeRoll_fun (f32 (1065353216)) 2 1 3535 11 (f32 (3219368881)) (f32 (1073157151)) (f32 (3217022206))
  = (2, 3536, 11, [3219368881; 1073157151; 3217022206]).
Proof. vm_compute. reflexivity. Qed.


Example t_0590 :
  samSubModeRoll_fun (f32 (1073741824)) 65 1 5891 11 (f32 (3219942861)) (f32 (3219165858)) (f32 (1068534376))
  = (65, 5892, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0591 :
  samSubModeRoll_fun (f32 (1073741824)) 31 1 2650 12 (f32 (1040316197)) (f32 (3215401012)) (f32 (1045309302))
  = (51, 0, 0, [1040316197; 3215401012; 1045309302]).
Proof. vm_compute. reflexivity. Qed.


Example t_0592 :
  samSubModeRoll_fun (f32 (1047478876)) 41 0 6250 7 (f32 (3214031152)) (f32 (3204493193)) (f32 (3216258849))
  = (17, 0, 0, [3214031152; 3204493193; 3216258849]).
Proof. vm_compute. reflexivity. Qed.


Example t_0593 :
  samSubModeRoll_fun (f32 (1056687442)) 0 0 6249 1 (f32 (3213771706)) (f32 (3219036917)) (f32 (3158476349))
  = (0, 6250, 0, [3213771706; 3219036917; 3158476349]).
Proof. vm_compute. reflexivity. Qed.


Example t_0594 :
  samSubModeRoll_fun (f32 (1073741824)) 58 2 4695 5 (f32 (1072066989)) (f32 (3208466478)) (f32 (3192289904))
  = (58, 4696, 0, [1072066989; 3208466478; 3192289904]).
Proof. vm_compute. reflexivity. Qed.


Example t_0595 :
  samSubModeRoll_fun (f32 (1073741824)) 20 1 6250 12 (f32 (3180428438)) (f32 (3209904548)) (f32 (1061078561))
  = (51, 0, 0, [3180428438; 3209904548; 1061078561]).
Proof. vm_compute. reflexivity. Qed.


Example t_0596 :
  samSubModeRoll_fun (f32 (2143289344)) 7 1 6800 5 (f32 (3210576114)) (f32 (3208945069)) (f32 (1072587953))
  = (17, 0, 0, [3210576114; 3208945069; 1072587953]).
Proof. vm_compute. reflexivity. Qed.


Example t_0597 :
  samSubModeRoll_fun (f32 (2139095040)) 10 1 761 5 (f32 (1056582683)) (f32 (1069525026)) (f32 (1057083627))
  = (10, 762, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0598 :
  samSubModeRoll_fun (f32 (3195161073)) 47 0 4294967295 10 (f32 (3208936359)) (f32 (3216358914)) (f32 (3216528434))
  = (47, 0, 0, [3208936359; 3216358914; 3216528434]).
Proof. vm_compute. reflexivity. Qed.


Example t_0599 :
  samSubModeRoll_fun (f32 (1073741824)) 32 1 3701 4294967295 (f32 (3216660456)) (f32 (3220701002)) (f32 (1071294449))
  = (32, 3702, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0600 :
  samSubModeRoll_fun (f32 (1070925786)) 25 1 532 11 (f32 (3206058509)) (f32 (1063288735)) (f32 (3215570696))
  = (25, 533, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0601 :
  samSubModeRoll_fun (f32 (1065353216)) 61 1 3185 1 (f32 (3200540591)) (f32 (3207805256)) (f32 (1063185724))
  = (61, 3186, 1, [3200540591; 3207805256; 1063185724]).
Proof. vm_compute. reflexivity. Qed.


Example t_0602 :
  samSubModeRoll_fun (f32 (1073741824)) 49 1 4799 11 (f32 (1069669848)) (f32 (1066645653)) (f32 (3188354194))
  = (49, 4800, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0603 :
  samSubModeRoll_fun (f32 (1073741824)) 52 1 1229 12 (f32 (1063513619)) (f32 (3219649936)) (f32 (3200837536))
  = (51, 0, 0, [1063513619; 3219649936; 3200837536]).
Proof. vm_compute. reflexivity. Qed.


Example t_0604 :
  samSubModeRoll_fun (f32 (3219181759)) 55 0 6250 17 (f32 (3171361799)) (f32 (3218159175)) (f32 (1070400276))
  = (17, 0, 0, [3171361799; 3218159175; 1070400276]).
Proof. vm_compute. reflexivity. Qed.


Example t_0605 :
  samSubModeRoll_fun (f32 (1042903812)) 52 0 6249 7 (f32 (1056778062)) (f32 (3204364407)) (f32 (1060172747))
  = (52, 6250, 0, [1056778062; 3204364407; 1060172747]).
Proof. vm_compute. reflexivity. Qed.


Example t_0606 :
  samSubModeRoll_fun (f32 (1073741824)) 45 2 7824 5 (f32 (1072336043)) (f32 (3210602394)) (f32 (3191297222))
  = (17, 0, 0, [1072336043; 3210602394; 3191297222]).
Proof. vm_compute. reflexivity. Qed.


Example t_0607 :
  samSubModeRoll_fun (f32 (1073741824)) 41 1 6250 12 (f32 (1066133925)) (f32 (1065379299)) (f32 (3215566647))
  = (51, 0, 0, [1066133925; 1065379299; 3215566647]).
Proof. vm_compute. reflexivity. Qed.


Example t_0608 :
  samSubModeRoll_fun (f32 (2143289344)) 6 1 4496 5 (f32 (1070049773)) (f32 (3188783746)) (f32 (1043998556))
  = (6, 4497, 5, [1070049773; 3188783746; 1043998556]).
Proof. vm_compute. reflexivity. Qed.


Example t_0609 :
  samSubModeRoll_fun (f32 (2139095040)) 25 1 7471 5 (f32 (3214453112)) (f32 (3191070535)) (f32 (1058405280))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0610 :
  samSubModeRoll_fun (f32 (1065577635)) 43 0 4294967295 17 (f32 (3218869325)) (f32 (1062147427)) (f32 (3180352285))
  = (43, 0, 0, [3218869325; 1062147427; 3180352285]).
Proof. vm_compute. reflexivity. Qed.


Example t_0611 :
  samSubModeRoll_fun (f32 (1073741824)) 10 1 6334 4294967295 (f32 (3218966215)) (f32 (3207028359)) (f32 (1060919651))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0612 :
  samSubModeRoll_fun (f32 (1075766711)) 42 0 4005 5 (f32 (1053106701)) (f32 (1059154387)) (f32 (1062441707))
  = (42, 4006, 0, [1053106701; 1059154387; 1062441707]).
Proof. vm_compute. reflexivity. Qed.


Example t_0613 :
  samSubModeRoll_fun (f32 (1065353216)) 33 1 4756 10 (f32 (3204651467)) (f32 (1070914956)) (f32 (1072252366))
  = (33, 4757, 10, [3204651467; 1070914956; 1072252366]).
Proof. vm_compute. reflexivity. Qed.


Example t_0614 :
  samSubModeRoll_fun (f32 (1073741824)) 51 1 648 11 (f32 (1057080478)) (f32 (1054777336)) (f32 (1066877383))
  = (51, 649, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0615 :
  samSubModeRoll_fun (f32 (1073741824)) 53 1 7057 12 (f32 (1049748204)) (f32 (3216596136)) (f32 (1061772453))
  = (51, 0, 0, [1049748204; 3216596136; 1061772453]).
Proof. vm_compute. reflexivity. Qed.


Example t_0616 :
  samSubModeRoll_fun (f32 (1060634468)) 33 0 6250 18 (f32 (1073224625)) (f32 (3202176113)) (f32 (3205264698))
  = (17, 0, 0, [1073224625; 3202176113; 3205264698]).
Proof. vm_compute. reflexivity. Qed.


Example t_0617 :
  samSubModeRoll_fun (f32 (1033339249)) 7 0 6249 19 (f32 (3213274364)) (f32 (3216919412)) (f32 (3218819576))
  = (7, 6250, 0, [3213274364; 3216919412; 3218819576]).
Proof. vm_compute. reflexivity. Qed.


Example t_0618 :
  samSubModeRoll_fun (f32 (1073741824)) 22 2 4832 5 (f32 (1069323618)) (f32 (1066195052)) (f32 (3196699464))
  = (22, 4833, 0, [1069323618; 1066195052; 3196699464]).
Proof. vm_compute. reflexivity. Qed.


Example t_0619 :
  samSubModeRoll_fun (f32 (1073741824)) 72 1 6250 12 (f32 (3209630430)) (f32 (1054575973)) (f32 (1072934044))
  = (51, 0, 0, [3209630430; 1054575973; 1072934044]).
Proof. vm_compute. reflexivity. Qed.


Example t_0620 :
  samSubModeRoll_fun (f32 (2143289344)) 74 1 2242 5 (f32 (1057536181)) (f32 (1062199452)) (f32 (1066034925))
  = (74, 2243, 5, [1057536181; 1062199452; 1066034925]).
Proof. vm_compute. reflexivity. Qed.


Example t_0621 :
  samSubModeRoll_fun (f32 (2139095040)) 68 1 3483 5 (f32 (1067286751)) (f32 (3197475571)) (f32 (3203551461))
  = (68, 3484, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0622 :
  samSubModeRoll_fun (f32 (1065019441)) 13 0 4294967295 4 (f32 (1071576799)) (f32 (1065704832)) (f32 (1068491209))
  = (13, 0, 0, [1071576799; 1065704832; 1068491209]).
Proof. vm_compute. reflexivity. Qed.


Example t_0623 :
  samSubModeRoll_fun (f32 (1073741824)) 76 1 5230 4294967295 (f32 (3210671949)) (f32 (1063513069)) (f32 (3216399436))
  = (76, 5231, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0624 :
  samSubModeRoll_fun (f32 (1072711135)) 33 1 355 13 (f32 (3208799908)) (f32 (3158466820)) (f32 (3152891861))
  = (51, 0, 0, [3208799908; 3158466820; 3152891861]).
Proof. vm_compute. reflexivity. Qed.


Example t_0625 :
  samSubModeRoll_fun (f32 (1065353216)) 11 1 5773 14 (f32 (1066279091)) (f32 (1056921478)) (f32 (3221149434))
  = (11, 5774, 14, [1066279091; 1056921478; 3221149434]).
Proof. vm_compute. reflexivity. Qed.


Example t_0626 :
  samSubModeRoll_fun (f32 (1073741824)) 28 1 6789 11 (f32 (3214326731)) (f32 (3207270420)) (f32 (1039748222))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0627 :
  samSubModeRoll_fun (f32 (1073741824)) 54 1 218 12 (f32 (1049776157)) (f32 (3188584104)) (f32 (1068789892))
  = (51, 0, 0, [1049776157; 3188584104; 1068789892]).
Proof. vm_compute. reflexivity. Qed.


Example t_0628 :
  samSubModeRoll_fun (f32 (3215901762)) 45 0 6250 4 (f32 (3210122999)) (f32 (1060198357)) (f32 (1058797871))
  = (17, 0, 0, [3210122999; 1060198357; 1058797871]).
Proof. vm_compute. reflexivity. Qed.


Example t_0629 :
  samSubModeRoll_fun (f32 (1075465548)) 77 0 6249 12 (f32 (3204603235)) (f32 (3178563400)) (f32 (3192973410))
  = (77, 6250, 0, [3204603235; 3178563400; 3192973410]).
Proof. vm_compute. reflexivity. Qed.


Example t_0630 :
  samSubModeRoll_fun (f32 (1073741824)) 27 2 7878 5 (f32 (3218613891)) (f32 (1068206708)) (f32 (1057073637))
  = (17, 0, 0, [3218613891; 1068206708; 1057073637]).
Proof. vm_compute. reflexivity. Qed.


Example t_0631 :
  samSubModeRoll_fun (f32 (1073741824)) 47 1 6250 12 (f32 (1062231148)) (f32 (3216151164)) (f32 (3220317125))
  = (51, 0, 0, [1062231148; 3216151164; 3220317125]).
Proof. vm_compute. reflexivity. Qed.


Example t_0632 :
  samSubModeRoll_fun (f32 (2143289344)) 48 1 4156 5 (f32 (1071188160)) (f32 (3207503287)) (f32 (1051722276))
  = (48, 4157, 5, [1071188160; 3207503287; 1051722276]).
Proof. vm_compute. reflexivity. Qed.


Example t_0633 :
  samSubModeRoll_fun (f32 (2139095040)) 13 1 6906 5 (f32 (3214544001)) (f32 (3209746393)) (f32 (3190731291))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0634 :
  samSubModeRoll_fun (f32 (1076420487)) 3 0 4294967295 2 (f32 (1069279291)) (f32 (1065953743)) (f32 (1050018453))
  = (3, 0, 0, [1069279291; 1065953743; 1050018453]).
Proof. vm_compute. reflexivity. Qed.


Example t_0635 :
  samSubModeRoll_fun (f32 (1073741824)) 11 1 2812 4294967295 (f32 (3208220361)) (f32 (3218923554)) (f32 (1071832595))
  = (11, 2813, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0636 :
  samSubModeRoll_fun (f32 (1075242309)) 25 1 6015 8 (f32 (3173515171)) (f32 (3198436821)) (f32 (1067980860))
  = (25, 6016, 9, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0637 :
  samSubModeRoll_fun (f32 (1065353216)) 69 1 5928 5 (f32 (3217637118)) (f32 (1061996080)) (f32 (3215550234))
  = (69, 5929, 5, [3217637118; 1061996080; 3215550234]).
Proof. vm_compute. reflexivity. Qed.


Example t_0638 :
  samSubModeRoll_fun (f32 (1073741824)) 31 1 1400 11 (f32 (1052434695)) (f32 (3204787225)) (f32 (3193525686))
  = (31, 1401, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0639 :
  samSubModeRoll_fun (f32 (1073741824)) 11 1 7447 12 (f32 (3214634387)) (f32 (3193894857)) (f32 (1059560467))
  = (51, 0, 0, [3214634387; 3193894857; 1059560467]).
Proof. vm_compute. reflexivity. Qed.


Example t_0640 :
  samSubModeRoll_fun (f32 (3176543602)) 2 0 6250 5 (f32 (1063603849)) (f32 (1062639085)) (f32 (3190500888))
  = (17, 0, 0, [1063603849; 1062639085; 3190500888]).
Proof. vm_compute. reflexivity. Qed.


Example t_0641 :
  samSubModeRoll_fun (f32 (3220029086)) 42 0 6249 12 (f32 (3213853402)) (f32 (3215593768)) (f32 (1064402079))
  = (42, 6250, 0, [3213853402; 3215593768; 1064402079]).
Proof. vm_compute. reflexivity. Qed.


Example t_0642 :
  samSubModeRoll_fun (f32 (1073741824)) 20 2 1908 5 (f32 (1059666127)) (f32 (3196145201)) (f32 (1064634172))
  = (20, 1909, 0, [1059666127; 3196145201; 1064634172]).
Proof. vm_compute. reflexivity. Qed.


Example t_0643 :
  samSubModeRoll_fun (f32 (1073741824)) 74 1 6250 12 (f32 (3198358271)) (f32 (1040097527)) (f32 (1050007310))
  = (51, 0, 0, [3198358271; 1040097527; 1050007310]).
Proof. vm_compute. reflexivity. Qed.


Example t_0644 :
  samSubModeRoll_fun (f32 (2143289344)) 57 1 3949 5 (f32 (3209093647)) (f32 (1070857341)) (f32 (3218961713))
  = (57, 3950, 5, [3209093647; 1070857341; 3218961713]).
Proof. vm_compute. reflexivity. Qed.


Example t_0645 :
  samSubModeRoll_fun (f32 (2139095040)) 5 1 2296 5 (f32 (3220310977)) (f32 (3196436041)) (f32 (3198324215))
  = (5, 2297, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0646 :
  samSubModeRoll_fun (f32 (1076505760)) 52 0 4294967295 19 (f32 (3215645387)) (f32 (1065541095)) (f32 (3215655039))
  = (52, 0, 0, [3215645387; 1065541095; 3215655039]).
Proof. vm_compute. reflexivity. Qed.


Example t_0647 :
  samSubModeRoll_fun (f32 (1073741824)) 30 1 6172 4294967295 (f32 (1052905215)) (f32 (1061649329)) (f32 (1060307603))
  = (30, 6173, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0648 :
  samSubModeRoll_fun (f32 (1069670699)) 75 0 6573 15 (f32 (3212229088)) (f32 (3219098243)) (f32 (3184203642))
  = (17, 0, 0, [3212229088; 3219098243; 3184203642]).
Proof. vm_compute. reflexivity. Qed.


Example t_0649 :
  samSubModeRoll_fun (f32 (1065353216)) 14 1 4068 0 (f32 (1061288073)) (f32 (1069629386)) (f32 (3204263820))
  = (14, 4069, 0, [1061288073; 1069629386; 3204263820]).
Proof. vm_compute. reflexivity. Qed.


Example t_0650 :
  samSubModeRoll_fun (f32 (1073741824)) 28 1 7674 11 (f32 (1058663045)) (f32 (1057621995)) (f32 (3219637863))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0651 :
  samSubModeRoll_fun (f32 (1073741824)) 73 1 5870 12 (f32 (1071942009)) (f32 (3197784044)) (f32 (1069685226))
  = (51, 0, 0, [1071942009; 3197784044; 1069685226]).
Proof. vm_compute. reflexivity. Qed.


Example t_0652 :
  samSubModeRoll_fun (f32 (1058676081)) 46 0 6250 4 (f32 (3211243347)) (f32 (1045185473)) (f32 (3216279614))
  = (17, 0, 0, [3211243347; 1045185473; 3216279614]).
Proof. vm_compute. reflexivity. Qed.


Example t_0653 :
  samSubModeRoll_fun (f32 (1067458030)) 77 0 6249 12 (f32 (3220836054)) (f32 (1068159525)) (f32 (1066987351))
  = (77, 6250, 0, [3220836054; 1068159525; 1066987351]).
Proof. vm_compute. reflexivity. Qed.


Example t_0654 :
  samSubModeRoll_fun (f32 (1073741824)) 4 2 1617 5 (f32 (1071291039)) (f32 (3187838728)) (f32 (1057832503))
  = (4, 1618, 0, [1071291039; 3187838728; 1057832503]).
Proof. vm_compute. reflexivity. Qed.


Example t_0655 :
  samSubModeRoll_fun (f32 (1073741824)) 9 1 6250 12 (f32 (3217600611)) (f32 (1050835486)) (f32 (3211420622))
  = (51, 0, 0, [3217600611; 1050835486; 3211420622]).
Proof. vm_compute. reflexivity. Qed.


Example t_0656 :
  samSubModeRoll_fun (f32 (2143289344)) 20 1 6996 5 (f32 (1067251378)) (f32 (3221077849)) (f32 (1063335267))
  = (17, 0, 0, [1067251378; 3221077849; 1063335267]).
Proof. vm_compute. reflexivity. Qed.


Example t_0657 :
  samSubModeRoll_fun (f32 (2139095040)) 0 1 6867 5 (f32 (1068547952)) (f32 (3219609094)) (f32 (1072326410))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0658 :
  samSubModeRoll_fun (f32 (1077727546)) 75 0 4294967295 17 (f32 (1070114538)) (f32 (3213551524)) (f32 (3220950364))
  = (75, 0, 0, [1070114538; 3213551524; 3220950364]).
Proof. vm_compute. reflexivity. Qed.


Example t_0659 :
  samSubModeRoll_fun (f32 (1073741824)) 51 1 4073 4294967295 (f32 (3220493211)) (f32 (1072833018)) (f32 (1072530036))
  = (51, 4074, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0660 :
  samSubModeRoll_fun (f32 (3181358745)) 79 1 4173 0 (f32 (1035550653)) (f32 (3220725733)) (f32 (3218940198))
  = (79, 4174, 0, [1035550653; 3220725733; 3218940198]).
Proof. vm_compute. reflexivity. Qed.


Example t_0661 :
  samSubModeRoll_fun (f32 (1065353216)) 37 1 6669 5 (f32 (1062224682)) (f32 (3183578917)) (f32 (1067603797))
  = (17, 0, 0, [1062224682; 3183578917; 1067603797]).
Proof. vm_compute. reflexivity. Qed.


Example t_0662 :
  samSubModeRoll_fun (f32 (1073741824)) 38 1 7958 11 (f32 (1070527382)) (f32 (1057778739)) (f32 (3219553176))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0663 :
  samSubModeRoll_fun (f32 (1073741824)) 46 1 7146 12 (f32 (1062898095)) (f32 (1066687004)) (f32 (3220702944))
  = (51, 0, 0, [1062898095; 1066687004; 3220702944]).
Proof. vm_compute. reflexivity. Qed.


Example t_0664 :
  samSubModeRoll_fun (f32 (1060093313)) 20 0 6250 0 (f32 (1065133383)) (f32 (1061422872)) (f32 (3213820091))
  = (17, 0, 0, [1065133383; 1061422872; 3213820091]).
Proof. vm_compute. reflexivity. Qed.


Example t_0665 :
  samSubModeRoll_fun (f32 (1066434698)) 50 0 6249 4 (f32 (1066186077)) (f32 (1050749507)) (f32 (1062046404))
  = (50, 6250, 0, [1066186077; 1050749507; 1062046404]).
Proof. vm_compute. reflexivity. Qed.


Example t_0666 :
  samSubModeRoll_fun (f32 (1073741824)) 22 2 2224 5 (f32 (3216861929)) (f32 (1072716952)) (f32 (1070154704))
  = (22, 2225, 0, [3216861929; 1072716952; 1070154704]).
Proof. vm_compute. reflexivity. Qed.


Example t_0667 :
  samSubModeRoll_fun (f32 (1073741824)) 15 1 6250 12 (f32 (3216374306)) (f32 (3207769960)) (f32 (1061879977))
  = (51, 0, 0, [3216374306; 3207769960; 1061879977]).
Proof. vm_compute. reflexivity. Qed.


Example t_0668 :
  samSubModeRoll_fun (f32 (2143289344)) 12 1 212 5 (f32 (3189005770)) (f32 (1070388154)) (f32 (3216102810))
  = (12, 213, 5, [3189005770; 1070388154; 3216102810]).
Proof. vm_compute. reflexivity. Qed.


Example t_0669 :
  samSubModeRoll_fun (f32 (2139095040)) 37 1 3216 5 (f32 (3207190024)) (f32 (3213533884)) (f32 (3209740931))
  = (37, 3217, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0670 :
  samSubModeRoll_fun (f32 (1069856804)) 33 0 4294967295 12 (f32 (1002055427)) (f32 (1071635564)) (f32 (3219364660))
  = (33, 0, 0, [1002055427; 1071635564; 3219364660]).
Proof. vm_compute. reflexivity. Qed.


Example t_0671 :
  samSubModeRoll_fun (f32 (1073741824)) 17 1 789 4294967295 (f32 (3219155887)) (f32 (3214083116)) (f32 (1073676326))
  = (17, 790, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0672 :
  samSubModeRoll_fun (f32 (1077421938)) 43 0 3350 16 (f32 (3220291476)) (f32 (1067712147)) (f32 (1046268425))
  = (43, 3351, 0, [3220291476; 1067712147; 1046268425]).
Proof. vm_compute. reflexivity. Qed.


Example t_0673 :
  samSubModeRoll_fun (f32 (1065353216)) 73 1 1836 11 (f32 (1065617380)) (f32 (3214045219)) (f32 (1066216395))
  = (73, 1837, 11, [1065617380; 3214045219; 1066216395]).
Proof. vm_compute. reflexivity. Qed.


Example t_0674 :
  samSubModeRoll_fun (f32 (1073741824)) 23 1 886 11 (f32 (1066719261)) (f32 (1055315772)) (f32 (1073039626))
  = (23, 887, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0675 :
  samSubModeRoll_fun (f32 (1073741824)) 11 1 3543 12 (f32 (1066958368)) (f32 (1071027033)) (f32 (1068107092))
  = (51, 0, 0, [1066958368; 1071027033; 1068107092]).
Proof. vm_compute. reflexivity. Qed.


Example t_0676 :
  samSubModeRoll_fun (f32 (1073065637)) 59 0 6250 3 (f32 (3215661670)) (f32 (3220129654)) (f32 (3198001108))
  = (17, 0, 0, [3215661670; 3220129654; 3198001108]).
Proof. vm_compute. reflexivity. Qed.


Example t_0677 :
  samSubModeRoll_fun (f32 (3218751347)) 75 0 6249 2 (f32 (3199090270)) (f32 (1066669505)) (f32 (3213813293))
  = (75, 6250, 0, [3199090270; 1066669505; 3213813293]).
Proof. vm_compute. reflexivity. Qed.


Example t_0678 :
  samSubModeRoll_fun (f32 (1073741824)) 20 2 5781 5 (f32 (3207120414)) (f32 (3215334418)) (f32 (1063870473))
  = (20, 5782, 0, [3207120414; 3215334418; 1063870473]).
Proof. vm_compute. reflexivity. Qed.


Example t_0679 :
  samSubModeRoll_fun (f32 (1073741824)) 50 1 6250 12 (f32 (3209930145)) (f32 (3212067635)) (f32 (1072795640))
  = (51, 0, 0, [3209930145; 3212067635; 1072795640]).
Proof. vm_compute. reflexivity. Qed.


Example t_0680 :
  samSubModeRoll_fun (f32 (2143289344)) 59 1 421 5 (f32 (1065346290)) (f32 (3217806739)) (f32 (3212145874))
  = (59, 422, 5, [1065346290; 3217806739; 3212145874]).
Proof. vm_compute. reflexivity. Qed.


Example t_0681 :
  samSubModeRoll_fun (f32 (2139095040)) 19 1 2896 5 (f32 (1071202400)) (f32 (1066342017)) (f32 (3216634971))
  = (19, 2897, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0682 :
  samSubModeRoll_fun (f32 (3216189931)) 26 0 4294967295 4 (f32 (3213807298)) (f32 (3207089684)) (f32 (3200252063))
  = (26, 0, 0, [3213807298; 3207089684; 3200252063]).
Proof. vm_compute. reflexivity. Qed.


Example t_0683 :
  samSubModeRoll_fun (f32 (1073741824)) 20 1 1986 4294967295 (f32 (1041915916)) (f32 (1069845084)) (f32 (1072002829))
  = (20, 1987, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0684 :
  samSubModeRoll_fun (f32 (1055021856)) 21 1 6335 2 (f32 (3221152724)) (f32 (1050582755)) (f32 (1060074065))
  = (17, 0, 0, [3221152724; 1050582755; 1060074065]).
Proof. vm_compute. reflexivity. Qed.


Example t_0685 :
  samSubModeRoll_fun (f32 (1065353216)) 23 1 2240 0 (f32 (3217966795)) (f32 (1065787418)) (f32 (3184697556))
  = (23, 2241, 0, [3217966795; 1065787418; 3184697556]).
Proof. vm_compute. reflexivity. Qed.


Example t_0686 :
  samSubModeRoll_fun (f32 (1073741824)) 67 1 773 11 (f32 (1069510614)) (f32 (1069190945)) (f32 (3219238449))
  = (67, 774, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0687 :
  samSubModeRoll_fun (f32 (1073741824)) 25 1 1730 12 (f32 (1046796952)) (f32 (3211786057)) (f32 (1072084491))
  = (51, 0, 0, [1046796952; 3211786057; 1072084491]).
Proof. vm_compute. reflexivity. Qed.


Example t_0688 :
  samSubModeRoll_fun (f32 (1074794456)) 61 0 6250 12 (f32 (1068862124)) (f32 (3188749892)) (f32 (3220167127))
  = (17, 0, 0, [1068862124; 3188749892; 3220167127]).
Proof. vm_compute. reflexivity. Qed.


Example t_0689 :
  samSubModeRoll_fun (f32 (3194939218)) 14 0 6249 17 (f32 (3206987868)) (f32 (1068839711)) (f32 (3202676842))
  = (14, 6250, 0, [3206987868; 1068839711; 3202676842]).
Proof. vm_compute. reflexivity. Qed.


Example t_0690 :
  samSubModeRoll_fun (f32 (1073741824)) 44 2 397 5 (f32 (1068701552)) (f32 (1070128837)) (f32 (3221178033))
  = (44, 398, 0, [1068701552; 1070128837; 3221178033]).
Proof. vm_compute. reflexivity. Qed.


Example t_0691 :
  samSubModeRoll_fun (f32 (1073741824)) 62 1 6250 12 (f32 (3213362229)) (f32 (1069774997)) (f32 (1070421840))
  = (51, 0, 0, [3213362229; 1069774997; 1070421840]).
Proof. vm_compute. reflexivity. Qed.


Example t_0692 :
  samSubModeRoll_fun (f32 (2143289344)) 76 1 5282 5 (f32 (3198642473)) (f32 (1058060852)) (f32 (1071601657))
  = (76, 5283, 5, [3198642473; 1058060852; 1071601657]).
Proof. vm_compute. reflexivity. Qed.


Example t_0693 :
  samSubModeRoll_fun (f32 (2139095040)) 12 1 622 5 (f32 (1073184087)) (f32 (1050127902)) (f32 (3213868245))
  = (12, 623, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0694 :
  samSubModeRoll_fun (f32 (1077726393)) 22 0 4294967295 7 (f32 (3219496694)) (f32 (1062822199)) (f32 (1072077392))
  = (22, 0, 0, [3219496694; 1062822199; 1072077392]).
Proof. vm_compute. reflexivity. Qed.


Example t_0695 :
  samSubModeRoll_fun (f32 (1073741824)) 0 1 2439 4294967295 (f32 (3206544077)) (f32 (3217825503)) (f32 (3217645238))
  = (0, 2440, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0696 :
  samSubModeRoll_fun (f32 (1077546790)) 10 1 5415 8 (f32 (1058602131)) (f32 (3215422870)) (f32 (3215639849))
  = (10, 5416, 9, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0697 :
  samSubModeRoll_fun (f32 (1065353216)) 29 1 3038 0 (f32 (3205160723)) (f32 (1066101504)) (f32 (1072930748))
  = (29, 3039, 0, [3205160723; 1066101504; 1072930748]).
Proof. vm_compute. reflexivity. Qed.


Example t_0698 :
  samSubModeRoll_fun (f32 (1073741824)) 58 1 705 11 (f32 (1039036932)) (f32 (3217536414)) (f32 (3213120167))
  = (58, 706, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0699 :
  samSubModeRoll_fun (f32 (1073741824)) 34 1 7293 12 (f32 (1055147982)) (f32 (1068881739)) (f32 (1037934680))
  = (51, 0, 0, [1055147982; 1068881739; 1037934680]).
Proof. vm_compute. reflexivity. Qed.


Example t_0700 :
  samSubModeRoll_fun (f32 (1067514218)) 36 0 6250 2 (f32 (1072196894)) (f32 (1067607420)) (f32 (3219320926))
  = (17, 0, 0, [1072196894; 1067607420; 3219320926]).
Proof. vm_compute. reflexivity. Qed.


Example t_0701 :
  samSubModeRoll_fun (f32 (3206121101)) 41 0 6249 6 (f32 (1065482090)) (f32 (3199028035)) (f32 (1024699974))
  = (41, 6250, 0, [1065482090; 3199028035; 1024699974]).
Proof. vm_compute. reflexivity. Qed.


Example t_0702 :
  samSubModeRoll_fun (f32 (1073741824)) 59 2 300 5 (f32 (3215373330)) (f32 (3216528505)) (f32 (3205845391))
  = (59, 301, 0, [3215373330; 3216528505; 3205845391]).
Proof. vm_compute. reflexivity. Qed.


Example t_0703 :
  samSubModeRoll_fun (f32 (1073741824)) 76 1 6250 12 (f32 (1070083347)) (f32 (3214760589)) (f32 (1067044125))
  = (51, 0, 0, [1070083347; 3214760589; 1067044125]).
Proof. vm_compute. reflexivity. Qed.


Example t_0704 :
  samSubModeRoll_fun (f32 (2143289344)) 16 1 5772 5 (f32 (3197895907)) (f32 (3198200584)) (f32 (3220979895))
  = (16, 5773, 5, [3197895907; 3198200584; 3220979895]).
Proof. vm_compute. reflexivity. Qed.


Example t_0705 :
  samSubModeRoll_fun (f32 (2139095040)) 73 1 2372 5 (f32 (1043750714)) (f32 (1066815317)) (f32 (1069536977))
  = (73, 2373, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0706 :
  samSubModeRoll_fun (f32 (1074848191)) 74 0 4294967295 6 (f32 (3214654238)) (f32 (1055451717)) (f32 (3219011320))
  = (74, 0, 0, [3214654238; 1055451717; 3219011320]).
Proof. vm_compute. reflexivity. Qed.


Example t_0707 :
  samSubModeRoll_fun (f32 (1073741824)) 40 1 6728 4294967295 (f32 (1057206661)) (f32 (1065425308)) (f32 (1035126627))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0708 :
  samSubModeRoll_fun (f32 (1073532155)) 11 1 7780 17 (f32 (1070134072)) (f32 (1070508631)) (f32 (1070882805))
  = (51, 0, 0, [1070134072; 1070508631; 1070882805]).
Proof. vm_compute. reflexivity. Qed.


Example t_0709 :
  samSubModeRoll_fun (f32 (1065353216)) 15 1 7185 5 (f32 (1064456551)) (f32 (1069866541)) (f32 (1063297803))
  = (17, 0, 0, [1064456551; 1069866541; 1063297803]).
Proof. vm_compute. reflexivity. Qed.


Example t_0710 :
  samSubModeRoll_fun (f32 (1073741824)) 53 1 2601 11 (f32 (1070758000)) (f32 (1059908681)) (f32 (3206799112))
  = (53, 2602, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0711 :
  samSubModeRoll_fun (f32 (1073741824)) 3 1 3650 12 (f32 (1070820318)) (f32 (3210862452)) (f32 (1057285413))
  = (51, 0, 0, [1070820318; 3210862452; 1057285413]).
Proof. vm_compute. reflexivity. Qed.


Example t_0712 :
  samSubModeRoll_fun (f32 (3199891590)) 36 0 6250 17 (f32 (1069865171)) (f32 (1060745337)) (f32 (1045113506))
  = (17, 0, 0, [1069865171; 1060745337; 1045113506]).
Proof. vm_compute. reflexivity. Qed.


Example t_0713 :
  samSubModeRoll_fun (f32 (3210374594)) 16 0 6249 16 (f32 (1073632067)) (f32 (3218434694)) (f32 (3188688483))
  = (16, 6250, 0, [1073632067; 3218434694; 3188688483]).
Proof. vm_compute. reflexivity. Qed.


Example t_0714 :
  samSubModeRoll_fun (f32 (1073741824)) 11 2 893 5 (f32 (1063142892)) (f32 (1067966183)) (f32 (3208599503))
  = (11, 894, 0, [1063142892; 1067966183; 3208599503]).
Proof. vm_compute. reflexivity. Qed.


Example t_0715 :
  samSubModeRoll_fun (f32 (1073741824)) 41 1 6250 12 (f32 (1061115404)) (f32 (1072593658)) (f32 (3214268857))
  = (51, 0, 0, [1061115404; 1072593658; 3214268857]).
Proof. vm_compute. reflexivity. Qed.


Example t_0716 :
  samSubModeRoll_fun (f32 (2143289344)) 24 1 2559 5 (f32 (3214330499)) (f32 (3219927822)) (f32 (1066368000))
  = (24, 2560, 5, [3214330499; 3219927822; 1066368000]).
Proof. vm_compute. reflexivity. Qed.


Example t_0717 :
  samSubModeRoll_fun (f32 (2139095040)) 32 1 4731 5 (f32 (1069096952)) (f32 (3201618196)) (f32 (1072501547))
  = (32, 4732, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0718 :
  samSubModeRoll_fun (f32 (1024594845)) 69 0 4294967295 0 (f32 (3206579726)) (f32 (1059118840)) (f32 (1062144883))
  = (69, 0, 0, [3206579726; 1059118840; 1062144883]).
Proof. vm_compute. reflexivity. Qed.


Example t_0719 :
  samSubModeRoll_fun (f32 (1073741824)) 57 1 5649 4294967295 (f32 (1061097313)) (f32 (3213017169)) (f32 (1069022943))
  = (57, 5650, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0720 :
  samSubModeRoll_fun (f32 (1055983983)) 18 0 3522 3 (f32 (3215440225)) (f32 (1064119833)) (f32 (3208167593))
  = (18, 3523, 0, [3215440225; 1064119833; 3208167593]).
Proof. vm_compute. reflexivity. Qed.


Example t_0721 :
  samSubModeRoll_fun (f32 (1065353216)) 74 1 3432 17 (f32 (1023167784)) (f32 (3180663041)) (f32 (3205180085))
  = (74, 3433, 17, [1023167784; 3180663041; 3205180085]).
Proof. vm_compute. reflexivity. Qed.


Example t_0722 :
  samSubModeRoll_fun (f32 (1073741824)) 37 1 762 11 (f32 (1063195737)) (f32 (1069327743)) (f32 (1057810246))
  = (37, 763, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0723 :
  samSubModeRoll_fun (f32 (1073741824)) 25 1 6604 12 (f32 (3213611811)) (f32 (1048023915)) (f32 (1073113891))
  = (51, 0, 0, [3213611811; 1048023915; 1073113891]).
Proof. vm_compute. reflexivity. Qed.


Example t_0724 :
  samSubModeRoll_fun (f32 (3178455375)) 7 0 6250 1 (f32 (1050124778)) (f32 (3185768884)) (f32 (3216765050))
  = (17, 0, 0, [1050124778; 3185768884; 3216765050]).
Proof. vm_compute. reflexivity. Qed.


Example t_0725 :
  samSubModeRoll_fun (f32 (1065907558)) 17 0 6249 1 (f32 (1068202175)) (f32 (3213554520)) (f32 (1071781616))
  = (17, 6250, 0, [1068202175; 3213554520; 1071781616]).
Proof. vm_compute. reflexivity. Qed.


Example t_0726 :
  samSubModeRoll_fun (f32 (1073741824)) 31 2 1380 5 (f32 (1066813899)) (f32 (3204723229)) (f32 (1068591157))
  = (31, 1381, 0, [1066813899; 3204723229; 1068591157]).
Proof. vm_compute. reflexivity. Qed.


Example t_0727 :
  samSubModeRoll_fun (f32 (1073741824)) 23 1 6250 12 (f32 (1051632906)) (f32 (3212945178)) (f32 (1064974504))
  = (51, 0, 0, [1051632906; 3212945178; 1064974504]).
Proof. vm_compute. reflexivity. Qed.


Example t_0728 :
  samSubModeRoll_fun (f32 (2143289344)) 19 1 3434 5 (f32 (3180149249)) (f32 (1063716251)) (f32 (1059462207))
  = (19, 3435, 5, [3180149249; 1063716251; 1059462207]).
Proof. vm_compute. reflexivity. Qed.


Example t_0729 :
  samSubModeRoll_fun (f32 (2139095040)) 26 1 4639 5 (f32 (3163425068)) (f32 (3193351609)) (f32 (3204401742))
  = (26, 4640, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0730 :
  samSubModeRoll_fun (f32 (1068013080)) 35 0 4294967295 7 (f32 (3163129668)) (f32 (3212957225)) (f32 (1062996016))
  = (35, 0, 0, [3163129668; 3212957225; 1062996016]).
Proof. vm_compute. reflexivity. Qed.


Example t_0731 :
  samSubModeRoll_fun (f32 (1073741824)) 67 1 3386 4294967295 (f32 (3221126327)) (f32 (3179913814)) (f32 (3217018332))
  = (67, 3387, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0732 :
  samSubModeRoll_fun (f32 (1070591798)) 69 1 3654 8 (f32 (1065458645)) (f32 (3220368431)) (f32 (1071546060))
  = (69, 3655, 9, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0733 :
  samSubModeRoll_fun (f32 (1065353216)) 73 1 6449 6 (f32 (3218287046)) (f32 (3216053073)) (f32 (3215618099))
  = (17, 0, 0, [3218287046; 3216053073; 3215618099]).
Proof. vm_compute. reflexivity. Qed.


Example t_0734 :
  samSubModeRoll_fun (f32 (1073741824)) 24 1 6957 11 (f32 (1032243263)) (f32 (3199254159)) (f32 (1003365757))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0735 :
  samSubModeRoll_fun (f32 (1073741824)) 49 1 432 12 (f32 (3216611945)) (f32 (3219455737)) (f32 (1033268593))
  = (51, 0, 0, [3216611945; 3219455737; 1033268593]).
Proof. vm_compute. reflexivity. Qed.


Example t_0736 :
  samSubModeRoll_fun (f32 (1019844250)) 47 0 6250 1 (f32 (1059003647)) (f32 (3213161926)) (f32 (3218417816))
  = (17, 0, 0, [1059003647; 3213161926; 3218417816]).
Proof. vm_compute. reflexivity. Qed.


Example t_0737 :
  samSubModeRoll_fun (f32 (3210734729)) 33 0 6249 11 (f32 (1068902849)) (f32 (1070711442)) (f32 (1039350331))
  = (33, 6250, 0, [1068902849; 1070711442; 1039350331]).
Proof. vm_compute. reflexivity. Qed.


Example t_0738 :
  samSubModeRoll_fun (f32 (1073741824)) 76 2 3270 5 (f32 (3219596489)) (f32 (1061015001)) (f32 (1070236119))
  = (76, 3271, 0, [3219596489; 1061015001; 1070236119]).
Proof. vm_compute. reflexivity. Qed.


Example t_0739 :
  samSubModeRoll_fun (f32 (1073741824)) 52 1 6250 12 (f32 (3219968650)) (f32 (3214566231)) (f32 (3208398344))
  = (51, 0, 0, [3219968650; 3214566231; 3208398344]).
Proof. vm_compute. reflexivity. Qed.


Example t_0740 :
  samSubModeRoll_fun (f32 (2143289344)) 62 1 6922 5 (f32 (1070203859)) (f32 (1065594150)) (f32 (1073200355))
  = (17, 0, 0, [1070203859; 1065594150; 1073200355]).
Proof. vm_compute. reflexivity. Qed.


Example t_0741 :
  samSubModeRoll_fun (f32 (2139095040)) 1 1 4872 5 (f32 (3209685249)) (f32 (3205393175)) (f32 (1068164197))
  = (1, 4873, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0742 :
  samSubModeRoll_fun (f32 (3211116471)) 26 0 4294967295 17 (f32 (1071081901)) (f32 (1055289354)) (f32 (1061736225))
  = (26, 0, 0, [1071081901; 1055289354; 1061736225]).
Proof. vm_compute. reflexivity. Qed.


Example t_0743 :
  samSubModeRoll_fun (f32 (1073741824)) 67 1 380 4294967295 (f32 (3208111825)) (f32 (3193828511)) (f32 (1071753838))
  = (67, 381, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0744 :
  samSubModeRoll_fun (f32 (1074400464)) 15 1 3126 4 (f32 (3220334750)) (f32 (1064141431)) (f32 (3214886438))
  = (15, 3127, 5, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0745 :
  samSubModeRoll_fun (f32 (1065353216)) 35 1 4354 0 (f32 (3211209559)) (f32 (1029334997)) (f32 (1071169249))
  = (35, 4355, 0, [3211209559; 1029334997; 1071169249]).
Proof. vm_compute. reflexivity. Qed.


Example t_0746 :
  samSubModeRoll_fun (f32 (1073741824)) 46 1 1172 11 (f32 (1068363672)) (f32 (3218462460)) (f32 (3199683163))
  = (46, 1173, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0747 :
  samSubModeRoll_fun (f32 (1073741824)) 39 1 1615 12 (f32 (3214059657)) (f32 (3201453379)) (f32 (1071040702))
  = (51, 0, 0, [3214059657; 3201453379; 1071040702]).
Proof. vm_compute. reflexivity. Qed.


Example t_0748 :
  samSubModeRoll_fun (f32 (3207609418)) 57 0 6250 9 (f32 (3214743880)) (f32 (1065891948)) (f32 (1022467845))
  = (17, 0, 0, [3214743880; 1065891948; 1022467845]).
Proof. vm_compute. reflexivity. Qed.


Example t_0749 :
  samSubModeRoll_fun (f32 (1069543423)) 22 0 6249 20 (f32 (1066961400)) (f32 (1065312051)) (f32 (3211577441))
  = (22, 6250, 0, [1066961400; 1065312051; 3211577441]).
Proof. vm_compute. reflexivity. Qed.


Example t_0750 :
  samSubModeRoll_fun (f32 (1073741824)) 51 2 3699 5 (f32 (3213921707)) (f32 (1066987246)) (f32 (3218461261))
  = (51, 3700, 0, [3213921707; 1066987246; 3218461261]).
Proof. vm_compute. reflexivity. Qed.


Example t_0751 :
  samSubModeRoll_fun (f32 (1073741824)) 38 1 6250 12 (f32 (1067663954)) (f32 (3200472478)) (f32 (3199141767))
  = (51, 0, 0, [1067663954; 3200472478; 3199141767]).
Proof. vm_compute. reflexivity. Qed.


Example t_0752 :
  samSubModeRoll_fun (f32 (2143289344)) 41 1 2523 5 (f32 (1054778575)) (f32 (3204908287)) (f32 (3211295163))
  = (41, 2524, 5, [1054778575; 3204908287; 3211295163]).
Proof. vm_compute. reflexivity. Qed.


Example t_0753 :
  samSubModeRoll_fun (f32 (2139095040)) 12 1 6165 5 (f32 (1063919498)) (f32 (3198499101)) (f32 (3206874452))
  = (12, 6166, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0754 :
  samSubModeRoll_fun (f32 (1075281131)) 31 0 4294967295 16 (f32 (1056929583)) (f32 (1043751841)) (f32 (3217801364))
  = (31, 0, 0, [1056929583; 1043751841; 3217801364]).
Proof. vm_compute. reflexivity. Qed.


Example t_0755 :
  samSubModeRoll_fun (f32 (1073741824)) 21 1 6466 4294967295 (f32 (1061127856)) (f32 (3203117256)) (f32 (1068621916))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0756 :
  samSubModeRoll_fun (f32 (1054191915)) 57 0 977 19 (f32 (3210136966)) (f32 (3210952148)) (f32 (1061293931))
  = (57, 978, 0, [3210136966; 3210952148; 1061293931]).
Proof. vm_compute. reflexivity. Qed.


Example t_0757 :
  samSubModeRoll_fun (f32 (1065353216)) 61 1 4655 3 (f32 (1068663706)) (f32 (3203905192)) (f32 (3213820505))
  = (61, 4656, 3, [1068663706; 3203905192; 3213820505]).
Proof. vm_compute. reflexivity. Qed.


Example t_0758 :
  samSubModeRoll_fun (f32 (1073741824)) 69 1 2912 11 (f32 (1067832610)) (f32 (1069337249)) (f32 (1047169886))
  = (69, 2913, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0759 :
  samSubModeRoll_fun (f32 (1073741824)) 28 1 5846 12 (f32 (1058734514)) (f32 (3212997357)) (f32 (1036410968))
  = (51, 0, 0, [1058734514; 3212997357; 1036410968]).
Proof. vm_compute. reflexivity. Qed.


Example t_0760 :
  samSubModeRoll_fun (f32 (1075299598)) 53 0 6250 0 (f32 (1067350118)) (f32 (3201317158)) (f32 (1070002582))
  = (17, 0, 0, [1067350118; 3201317158; 1070002582]).
Proof. vm_compute. reflexivity. Qed.


Example t_0761 :
  samSubModeRoll_fun (f32 (3219360125)) 32 0 6249 14 (f32 (3211478529)) (f32 (1062629356)) (f32 (1063306407))
  = (32, 6250, 0, [3211478529; 1062629356; 1063306407]).
Proof. vm_compute. reflexivity. Qed.


Example t_0762 :
  samSubModeRoll_fun (f32 (1073741824)) 7 2 4097 5 (f32 (3206147009)) (f32 (3218203243)) (f32 (3213611325))
  = (7, 4098, 0, [3206147009; 3218203243; 3213611325]).
Proof. vm_compute. reflexivity. Qed.


Example t_0763 :
  samSubModeRoll_fun (f32 (1073741824)) 21 1 6250 12 (f32 (3215119660)) (f32 (3198395257)) (f32 (1061787007))
  = (51, 0, 0, [3215119660; 3198395257; 1061787007]).
Proof. vm_compute. reflexivity. Qed.


Example t_0764 :
  samSubModeRoll_fun (f32 (2143289344)) 65 1 4955 5 (f32 (1061063010)) (f32 (1066259311)) (f32 (3219801845))
  = (65, 4956, 5, [1061063010; 1066259311; 3219801845]).
Proof. vm_compute. reflexivity. Qed.


Example t_0765 :
  samSubModeRoll_fun (f32 (2139095040)) 79 1 7932 5 (f32 (3212191150)) (f32 (1068207930)) (f32 (3217245959))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0766 :
  samSubModeRoll_fun (f32 (3205511754)) 9 0 4294967295 17 (f32 (1072395766)) (f32 (1073398470)) (f32 (3196395593))
  = (9, 0, 0, [1072395766; 1073398470; 3196395593]).
Proof. vm_compute. reflexivity. Qed.


Example t_0767 :
  samSubModeRoll_fun (f32 (1073741824)) 46 1 6271 4294967295 (f32 (3206691274)) (f32 (1061222238)) (f32 (1056206677))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0768 :
  samSubModeRoll_fun (f32 (1073405492)) 13 1 3037 8 (f32 (1057373371)) (f32 (1063979291)) (f32 (3217740401))
  = (13, 3038, 9, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0769 :
  samSubModeRoll_fun (f32 (1065353216)) 63 1 6436 5 (f32 (1067938701)) (f32 (3216222392)) (f32 (1049663200))
  = (17, 0, 0, [1067938701; 3216222392; 1049663200]).
Proof. vm_compute. reflexivity. Qed.


Example t_0770 :
  samSubModeRoll_fun (f32 (1073741824)) 9 1 1969 11 (f32 (3190421839)) (f32 (1056579279)) (f32 (1058428738))
  = (9, 1970, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0771 :
  samSubModeRoll_fun (f32 (1073741824)) 75 1 3896 12 (f32 (1063257172)) (f32 (1069882948)) (f32 (1072774109))
  = (51, 0, 0, [1063257172; 1069882948; 1072774109]).
Proof. vm_compute. reflexivity. Qed.


Example t_0772 :
  samSubModeRoll_fun (f32 (1076322537)) 77 0 6250 5 (f32 (3213727001)) (f32 (1071666803)) (f32 (3218389646))
  = (17, 0, 0, [3213727001; 1071666803; 3218389646]).
Proof. vm_compute. reflexivity. Qed.


Example t_0773 :
  samSubModeRoll_fun (f32 (1067582486)) 47 0 6249 4 (f32 (1070705532)) (f32 (1045115399)) (f32 (1070223003))
  = (47, 6250, 0, [1070705532; 1045115399; 1070223003]).
Proof. vm_compute. reflexivity. Qed.


Example t_0774 :
  samSubModeRoll_fun (f32 (1073741824)) 62 2 7701 5 (f32 (3216913772)) (f32 (1060361994)) (f32 (3220101667))
  = (17, 0, 0, [3216913772; 1060361994; 3220101667]).
Proof. vm_compute. reflexivity. Qed.


Example t_0775 :
  samSubModeRoll_fun (f32 (1073741824)) 69 1 6250 12 (f32 (3176361418)) (f32 (3210125074)) (f32 (3177608426))
  = (51, 0, 0, [3176361418; 3210125074; 3177608426]).
Proof. vm_compute. reflexivity. Qed.


Example t_0776 :
  samSubModeRoll_fun (f32 (2143289344)) 77 1 5813 5 (f32 (3213705136)) (f32 (1070337994)) (f32 (1062993976))
  = (77, 5814, 5, [3213705136; 1070337994; 1062993976]).
Proof. vm_compute. reflexivity. Qed.


Example t_0777 :
  samSubModeRoll_fun (f32 (2139095040)) 39 1 1106 5 (f32 (1073355340)) (f32 (1065478068)) (f32 (3209294961))
  = (39, 1107, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0778 :
  samSubModeRoll_fun (f32 (1072767411)) 11 0 4294967295 6 (f32 (1069403967)) (f32 (3200524171)) (f32 (3220723787))
  = (11, 0, 0, [1069403967; 3200524171; 3220723787]).
Proof. vm_compute. reflexivity. Qed.


Example t_0779 :
  samSubModeRoll_fun (f32 (1073741824)) 15 1 7253 4294967295 (f32 (3214260352)) (f32 (3214617805)) (f32 (1069679509))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0780 :
  samSubModeRoll_fun (f32 (1056863328)) 31 1 2685 6 (f32 (3216787375)) (f32 (3197645793)) (f32 (3216975776))
  = (31, 2686, 6, [3216787375; 3197645793; 3216975776]).
Proof. vm_compute. reflexivity. Qed.


Example t_0781 :
  samSubModeRoll_fun (f32 (1065353216)) 19 1 1204 9 (f32 (3210672174)) (f32 (3167575695)) (f32 (1069131032))
  = (19, 1205, 9, [3210672174; 3167575695; 1069131032]).
Proof. vm_compute. reflexivity. Qed.


Example t_0782 :
  samSubModeRoll_fun (f32 (1073741824)) 34 1 922 11 (f32 (1073069355)) (f32 (3215005050)) (f32 (3212925181))
  = (34, 923, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0783 :
  samSubModeRoll_fun (f32 (1073741824)) 20 1 1707 12 (f32 (3219502081)) (f32 (1054635283)) (f32 (1066828538))
  = (51, 0, 0, [3219502081; 1054635283; 1066828538]).
Proof. vm_compute. reflexivity. Qed.


Example t_0784 :
  samSubModeRoll_fun (f32 (1075339785)) 76 0 6250 3 (f32 (3206379887)) (f32 (3213243443)) (f32 (3194746335))
  = (17, 0, 0, [3206379887; 3213243443; 3194746335]).
Proof. vm_compute. reflexivity. Qed.


Example t_0785 :
  samSubModeRoll_fun (f32 (1077422702)) 61 0 6249 10 (f32 (1062156737)) (f32 (1054420385)) (f32 (3197698334))
  = (61, 6250, 0, [1062156737; 1054420385; 3197698334]).
Proof. vm_compute. reflexivity. Qed.


Example t_0786 :
  samSubModeRoll_fun (f32 (1073741824)) 35 2 3841 5 (f32 (1065531014)) (f32 (1037756276)) (f32 (3211211157))
  = (35, 3842, 0, [1065531014; 1037756276; 3211211157]).
Proof. vm_compute. reflexivity. Qed.


Example t_0787 :
  samSubModeRoll_fun (f32 (1073741824)) 64 1 6250 12 (f32 (1071501456)) (f32 (1070753319)) (f32 (1061538428))
  = (51, 0, 0, [1071501456; 1070753319; 1061538428]).
Proof. vm_compute. reflexivity. Qed.


Example t_0788 :
  samSubModeRoll_fun (f32 (2143289344)) 48 1 3842 5 (f32 (1066454655)) (f32 (1066059101)) (f32 (3196902268))
  = (48, 3843, 5, [1066454655; 1066059101; 3196902268]).
Proof. vm_compute. reflexivity. Qed.


Example t_0789 :
  samSubModeRoll_fun (f32 (2139095040)) 15 1 5762 5 (f32 (1066130548)) (f32 (3198429593)) (f32 (3207038281))
  = (15, 5763, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0790 :
  samSubModeRoll_fun (f32 (3216904471)) 34 0 4294967295 14 (f32 (1066375185)) (f32 (3208913433)) (f32 (3213605575))
  = (34, 0, 0, [1066375185; 3208913433; 3213605575]).
Proof. vm_compute. reflexivity. Qed.


Example t_0791 :
  samSubModeRoll_fun (f32 (1073741824)) 35 1 5435 4294967295 (f32 (1072678248)) (f32 (1057608333)) (f32 (1003609821))
  = (35, 5436, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0792 :
  samSubModeRoll_fun (f32 (1077114606)) 44 1 4196 17 (f32 (3195818793)) (f32 (1059165464)) (f32 (3221194671))
  = (51, 0, 0, [3195818793; 1059165464; 3221194671]).
Proof. vm_compute. reflexivity. Qed.


Example t_0793 :
  samSubModeRoll_fun (f32 (1065353216)) 33 1 1016 16 (f32 (3200503601)) (f32 (1062140648)) (f32 (3197375040))
  = (33, 1017, 16, [3200503601; 1062140648; 3197375040]).
Proof. vm_compute. reflexivity. Qed.


Example t_0794 :
  samSubModeRoll_fun (f32 (1073741824)) 78 1 2304 11 (f32 (3218351140)) (f32 (3219916836)) (f32 (3218229574))
  = (78, 2305, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0795 :
  samSubModeRoll_fun (f32 (1073741824)) 6 1 1038 12 (f32 (3214594494)) (f32 (3214221332)) (f32 (3215890335))
  = (51, 0, 0, [3214594494; 3214221332; 3215890335]).
Proof. vm_compute. reflexivity. Qed.


Example t_0796 :
  samSubModeRoll_fun (f32 (1071093601)) 58 0 6250 20 (f32 (3218920003)) (f32 (1062780013)) (f32 (1069230222))
  = (17, 0, 0, [3218920003; 1062780013; 1069230222]).
Proof. vm_compute. reflexivity. Qed.


Example t_0797 :
  samSubModeRoll_fun (f32 (1076452858)) 54 0 6249 19 (f32 (1031499843)) (f32 (3199758834)) (f32 (1056163310))
  = (54, 6250, 0, [1031499843; 3199758834; 1056163310]).
Proof. vm_compute. reflexivity. Qed.


Example t_0798 :
  samSubModeRoll_fun (f32 (1073741824)) 40 2 6860 5 (f32 (1036548372)) (f32 (1033540107)) (f32 (1072030677))
  = (17, 0, 0, [1036548372; 1033540107; 1072030677]).
Proof. vm_compute. reflexivity. Qed.


Example t_0799 :
  samSubModeRoll_fun (f32 (1073741824)) 67 1 6250 12 (f32 (1068127902)) (f32 (3212849094)) (f32 (1058793919))
  = (51, 0, 0, [1068127902; 3212849094; 1058793919]).
Proof. vm_compute. reflexivity. Qed.


Example t_0800 :
  samSubModeRoll_fun (f32 (2143289344)) 53 1 7378 5 (f32 (3219087679)) (f32 (1058321231)) (f32 (1073361806))
  = (17, 0, 0, [3219087679; 1058321231; 1073361806]).
Proof. vm_compute. reflexivity. Qed.


Example t_0801 :
  samSubModeRoll_fun (f32 (2139095040)) 32 1 6864 5 (f32 (1072371401)) (f32 (3200958623)) (f32 (3215031006))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0802 :
  samSubModeRoll_fun (f32 (3188060410)) 35 0 4294967295 3 (f32 (3186310668)) (f32 (1057656826)) (f32 (3171161384))
  = (35, 0, 0, [3186310668; 1057656826; 3171161384]).
Proof. vm_compute. reflexivity. Qed.


Example t_0803 :
  samSubModeRoll_fun (f32 (1073741824)) 57 1 4091 4294967295 (f32 (3174849078)) (f32 (3205733568)) (f32 (3213914011))
  = (57, 4092, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0804 :
  samSubModeRoll_fun (f32 (1049833792)) 32 1 3108 6 (f32 (3210865146)) (f32 (3208671299)) (f32 (1068176347))
  = (32, 3109, 6, [3210865146; 3208671299; 1068176347]).
Proof. vm_compute. reflexivity. Qed.


Example t_0805 :
  samSubModeRoll_fun (f32 (1065353216)) 28 1 6757 6 (f32 (1063733731)) (f32 (1045802037)) (f32 (1056648214))
  = (17, 0, 0, [1063733731; 1045802037; 1056648214]).
Proof. vm_compute. reflexivity. Qed.


Example t_0806 :
  samSubModeRoll_fun (f32 (1073741824)) 73 1 3065 11 (f32 (1059273389)) (f32 (1072725809)) (f32 (1072380022))
  = (73, 3066, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0807 :
  samSubModeRoll_fun (f32 (1073741824)) 34 1 6580 12 (f32 (3212431843)) (f32 (3211210407)) (f32 (3191940587))
  = (51, 0, 0, [3212431843; 3211210407; 3191940587]).
Proof. vm_compute. reflexivity. Qed.


Example t_0808 :
  samSubModeRoll_fun (f32 (998672228)) 10 0 6250 17 (f32 (1065834825)) (f32 (1065818999)) (f32 (1071440309))
  = (17, 0, 0, [1065834825; 1065818999; 1071440309]).
Proof. vm_compute. reflexivity. Qed.


Example t_0809 :
  samSubModeRoll_fun (f32 (1062034916)) 31 0 6249 12 (f32 (3214610853)) (f32 (3200640698)) (f32 (1063195561))
  = (31, 6250, 0, [3214610853; 3200640698; 1063195561]).
Proof. vm_compute. reflexivity. Qed.


Example t_0810 :
  samSubModeRoll_fun (f32 (1073741824)) 15 2 2384 5 (f32 (3211279812)) (f32 (1059820804)) (f32 (3217767928))
  = (15, 2385, 0, [3211279812; 1059820804; 3217767928]).
Proof. vm_compute. reflexivity. Qed.


Example t_0811 :
  samSubModeRoll_fun (f32 (1073741824)) 14 1 6250 12 (f32 (1068755822)) (f32 (3218188021)) (f32 (3220127759))
  = (51, 0, 0, [1068755822; 3218188021; 3220127759]).
Proof. vm_compute. reflexivity. Qed.


Example t_0812 :
  samSubModeRoll_fun (f32 (2143289344)) 26 1 1051 5 (f32 (1053709148)) (f32 (1066119616)) (f32 (3215660084))
  = (26, 1052, 5, [1053709148; 1066119616; 3215660084]).
Proof. vm_compute. reflexivity. Qed.


Example t_0813 :
  samSubModeRoll_fun (f32 (2139095040)) 49 1 4471 5 (f32 (3216417175)) (f32 (3220817463)) (f32 (3174727989))
  = (49, 4472, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0814 :
  samSubModeRoll_fun (f32 (1074448061)) 19 0 4294967295 4 (f32 (3213553275)) (f32 (3217060515)) (f32 (1068488838))
  = (19, 0, 0, [3213553275; 3217060515; 1068488838]).
Proof. vm_compute. reflexivity. Qed.


Example t_0815 :
  samSubModeRoll_fun (f32 (1073741824)) 69 1 2924 4294967295 (f32 (3217124904)) (f32 (3219150122)) (f32 (1052909319))
  = (69, 2925, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0816 :
  samSubModeRoll_fun (f32 (1074511403)) 46 1 4510 9 (f32 (3182039438)) (f32 (3171663638)) (f32 (1071829201))
  = (46, 4511, 10, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0817 :
  samSubModeRoll_fun (f32 (1065353216)) 14 1 7423 5 (f32 (1069843038)) (f32 (3220016613)) (f32 (3207287859))
  = (17, 0, 0, [1069843038; 3220016613; 3207287859]).
Proof. vm_compute. reflexivity. Qed.


Example t_0818 :
  samSubModeRoll_fun (f32 (1073741824)) 7 1 5866 11 (f32 (1061990665)) (f32 (3214794335)) (f32 (3215233581))
  = (7, 5867, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0819 :
  samSubModeRoll_fun (f32 (1073741824)) 46 1 431 12 (f32 (3213211138)) (f32 (1072715529)) (f32 (1065450995))
  = (51, 0, 0, [3213211138; 1072715529; 1065450995]).
Proof. vm_compute. reflexivity. Qed.


Example t_0820 :
  samSubModeRoll_fun (f32 (1057763714)) 23 0 6250 12 (f32 (3215966386)) (f32 (1059367871)) (f32 (1066845850))
  = (17, 0, 0, [3215966386; 1059367871; 1066845850]).
Proof. vm_compute. reflexivity. Qed.


Example t_0821 :
  samSubModeRoll_fun (f32 (1073759877)) 55 0 6249 19 (f32 (1069294893)) (f32 (3214985520)) (f32 (3214837213))
  = (55, 6250, 0, [1069294893; 3214985520; 3214837213]).
Proof. vm_compute. reflexivity. Qed.


Example t_0822 :
  samSubModeRoll_fun (f32 (1073741824)) 15 2 2089 5 (f32 (3211398715)) (f32 (3210159539)) (f32 (1072579512))
  = (15, 2090, 0, [3211398715; 3210159539; 1072579512]).
Proof. vm_compute. reflexivity. Qed.


Example t_0823 :
  samSubModeRoll_fun (f32 (1073741824)) 9 1 6250 12 (f32 (1064731689)) (f32 (3201171235)) (f32 (3207053420))
  = (51, 0, 0, [1064731689; 3201171235; 3207053420]).
Proof. vm_compute. reflexivity. Qed.


Example t_0824 :
  samSubModeRoll_fun (f32 (2143289344)) 39 1 1316 5 (f32 (1066284786)) (f32 (3214600476)) (f32 (3212623010))
  = (39, 1317, 5, [1066284786; 3214600476; 3212623010]).
Proof. vm_compute. reflexivity. Qed.


Example t_0825 :
  samSubModeRoll_fun (f32 (2139095040)) 4 1 4960 5 (f32 (1062417659)) (f32 (3216872489)) (f32 (3215070681))
  = (4, 4961, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0826 :
  samSubModeRoll_fun (f32 (3193934665)) 1 0 4294967295 9 (f32 (1061955944)) (f32 (1066898693)) (f32 (3184647827))
  = (1, 0, 0, [1061955944; 1066898693; 3184647827]).
Proof. vm_compute. reflexivity. Qed.


Example t_0827 :
  samSubModeRoll_fun (f32 (1073741824)) 1 1 6940 4294967295 (f32 (1070546904)) (f32 (1052164978)) (f32 (1066667959))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0828 :
  samSubModeRoll_fun (f32 (1076289741)) 17 1 6735 17 (f32 (1068858124)) (f32 (3172007226)) (f32 (3197879507))
  = (51, 0, 0, [1068858124; 3172007226; 3197879507]).
Proof. vm_compute. reflexivity. Qed.


Example t_0829 :
  samSubModeRoll_fun (f32 (1065353216)) 26 1 4653 20 (f32 (1047414705)) (f32 (3206350862)) (f32 (3218206056))
  = (26, 4654, 20, [1047414705; 3206350862; 3218206056]).
Proof. vm_compute. reflexivity. Qed.


Example t_0830 :
  samSubModeRoll_fun (f32 (1073741824)) 16 1 7339 11 (f32 (3217159578)) (f32 (3218277928)) (f32 (3221046986))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0831 :
  samSubModeRoll_fun (f32 (1073741824)) 32 1 51 12 (f32 (1058712222)) (f32 (3207706841)) (f32 (1061769584))
  = (51, 0, 0, [1058712222; 3207706841; 1061769584]).
Proof. vm_compute. reflexivity. Qed.


Example t_0832 :
  samSubModeRoll_fun (f32 (3210087777)) 53 0 6250 16 (f32 (3209100147)) (f32 (3213986997)) (f32 (3194537491))
  = (17, 0, 0, [3209100147; 3213986997; 3194537491]).
Proof. vm_compute. reflexivity. Qed.


Example t_0833 :
  samSubModeRoll_fun (f32 (3209851734)) 18 0 6249 20 (f32 (3219940704)) (f32 (3218570853)) (f32 (3213946329))
  = (18, 6250, 0, [3219940704; 3218570853; 3213946329]).
Proof. vm_compute. reflexivity. Qed.


Example t_0834 :
  samSubModeRoll_fun (f32 (1073741824)) 60 2 82 5 (f32 (3219350184)) (f32 (1065924003)) (f32 (3220627089))
  = (60, 83, 0, [3219350184; 1065924003; 3220627089]).
Proof. vm_compute. reflexivity. Qed.


Example t_0835 :
  samSubModeRoll_fun (f32 (1073741824)) 59 1 6250 12 (f32 (1056089611)) (f32 (1071889052)) (f32 (3201422779))
  = (51, 0, 0, [1056089611; 1071889052; 3201422779]).
Proof. vm_compute. reflexivity. Qed.


Example t_0836 :
  samSubModeRoll_fun (f32 (2143289344)) 58 1 1768 5 (f32 (1072864195)) (f32 (3213154300)) (f32 (3217847780))
  = (58, 1769, 5, [1072864195; 3213154300; 3217847780]).
Proof. vm_compute. reflexivity. Qed.


Example t_0837 :
  samSubModeRoll_fun (f32 (2139095040)) 55 1 3299 5 (f32 (1068545924)) (f32 (1059396521)) (f32 (1067298291))
  = (55, 3300, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0838 :
  samSubModeRoll_fun (f32 (3196159676)) 71 0 4294967295 5 (f32 (3213966812)) (f32 (1057585737)) (f32 (3204698035))
  = (71, 0, 0, [3213966812; 1057585737; 3204698035]).
Proof. vm_compute. reflexivity. Qed.


Example t_0839 :
  samSubModeRoll_fun (f32 (1073741824)) 57 1 6760 4294967295 (f32 (1065866399)) (f32 (1051908599)) (f32 (3197723444))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0840 :
  samSubModeRoll_fun (f32 (1071877046)) 71 1 3857 9 (f32 (1071967816)) (f32 (3198139978)) (f32 (1069980564))
  = (71, 3858, 10, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0841 :
  samSubModeRoll_fun (f32 (1065353216)) 22 1 7490 15 (f32 (1067141480)) (f32 (1067402731)) (f32 (1065779291))
  = (17, 0, 0, [1067141480; 1067402731; 1065779291]).
Proof. vm_compute. reflexivity. Qed.


Example t_0842 :
  samSubModeRoll_fun (f32 (1073741824)) 36 1 1479 11 (f32 (1067340864)) (f32 (3211192734)) (f32 (1066948250))
  = (36, 1480, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0843 :
  samSubModeRoll_fun (f32 (1073741824)) 65 1 2004 12 (f32 (1071463948)) (f32 (3218153607)) (f32 (1069395616))
  = (51, 0, 0, [1071463948; 3218153607; 1069395616]).
Proof. vm_compute. reflexivity. Qed.


Example t_0844 :
  samSubModeRoll_fun (f32 (3219610770)) 56 0 6250 0 (f32 (3189808971)) (f32 (3198756487)) (f32 (1062935678))
  = (17, 0, 0, [3189808971; 3198756487; 1062935678]).
Proof. vm_compute. reflexivity. Qed.


Example t_0845 :
  samSubModeRoll_fun (f32 (1033947969)) 64 0 6249 3 (f32 (3173911534)) (f32 (3205503835)) (f32 (3220448933))
  = (64, 6250, 0, [3173911534; 3205503835; 3220448933]).
Proof. vm_compute. reflexivity. Qed.


Example t_0846 :
  samSubModeRoll_fun (f32 (1073741824)) 17 2 6411 5 (f32 (3216523427)) (f32 (1071392933)) (f32 (3216828784))
  = (17, 0, 0, [3216523427; 1071392933; 3216828784]).
Proof. vm_compute. reflexivity. Qed.


Example t_0847 :
  samSubModeRoll_fun (f32 (1073741824)) 24 1 6250 12 (f32 (1065530272)) (f32 (3210817355)) (f32 (1065443139))
  = (51, 0, 0, [1065530272; 3210817355; 1065443139]).
Proof. vm_compute. reflexivity. Qed.


Example t_0848 :
  samSubModeRoll_fun (f32 (2143289344)) 64 1 3970 5 (f32 (1057056169)) (f32 (3215985950)) (f32 (1072680011))
  = (64, 3971, 5, [1057056169; 3215985950; 1072680011]).
Proof. vm_compute. reflexivity. Qed.


Example t_0849 :
  samSubModeRoll_fun (f32 (2139095040)) 17 1 6789 5 (f32 (1052258320)) (f32 (1063626888)) (f32 (3176274652))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0850 :
  samSubModeRoll_fun (f32 (1077671924)) 9 0 4294967295 1 (f32 (1058930711)) (f32 (1035804469)) (f32 (1060466086))
  = (9, 0, 0, [1058930711; 1035804469; 1060466086]).
Proof. vm_compute. reflexivity. Qed.


Example t_0851 :
  samSubModeRoll_fun (f32 (1073741824)) 62 1 2377 4294967295 (f32 (3220768694)) (f32 (1065876307)) (f32 (3219303142))
  = (62, 2378, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0852 :
  samSubModeRoll_fun (f32 (3200081695)) 44 0 1859 5 (f32 (3216024996)) (f32 (1066386584)) (f32 (3214814620))
  = (44, 1860, 0, [3216024996; 1066386584; 3214814620]).
Proof. vm_compute. reflexivity. Qed.


Example t_0853 :
  samSubModeRoll_fun (f32 (1065353216)) 35 1 5197 13 (f32 (3213529130)) (f32 (3205767021)) (f32 (3203512916))
  = (35, 5198, 13, [3213529130; 3205767021; 3203512916]).
Proof. vm_compute. reflexivity. Qed.


Example t_0854 :
  samSubModeRoll_fun (f32 (1073741824)) 71 1 5064 11 (f32 (1059389602)) (f32 (3210989229)) (f32 (3206920568))
  = (71, 5065, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0855 :
  samSubModeRoll_fun (f32 (1073741824)) 60 1 7722 12 (f32 (3212145863)) (f32 (1062662696)) (f32 (3218759252))
  = (51, 0, 0, [3212145863; 1062662696; 3218759252]).
Proof. vm_compute. reflexivity. Qed.


Example t_0856 :
  samSubModeRoll_fun (f32 (3198616664)) 25 0 6250 5 (f32 (3193541493)) (f32 (3211847440)) (f32 (1062644893))
  = (17, 0, 0, [3193541493; 3211847440; 1062644893]).
Proof. vm_compute. reflexivity. Qed.


Example t_0857 :
  samSubModeRoll_fun (f32 (3209874809)) 49 0 6249 16 (f32 (1051287335)) (f32 (1065748278)) (f32 (3218629172))
  = (49, 6250, 0, [1051287335; 1065748278; 3218629172]).
Proof. vm_compute. reflexivity. Qed.


Example t_0858 :
  samSubModeRoll_fun (f32 (1073741824)) 70 2 12 5 (f32 (1070833235)) (f32 (3215530977)) (f32 (1066584763))
  = (70, 13, 0, [1070833235; 3215530977; 1066584763]).
Proof. vm_compute. reflexivity. Qed.


Example t_0859 :
  samSubModeRoll_fun (f32 (1073741824)) 42 1 6250 12 (f32 (1070033387)) (f32 (3219928767)) (f32 (1039393779))
  = (51, 0, 0, [1070033387; 3219928767; 1039393779]).
Proof. vm_compute. reflexivity. Qed.


Example t_0860 :
  samSubModeRoll_fun (f32 (2143289344)) 21 1 4239 5 (f32 (1070365847)) (f32 (1062289895)) (f32 (1063067446))
  = (21, 4240, 5, [1070365847; 1062289895; 1063067446]).
Proof. vm_compute. reflexivity. Qed.


Example t_0861 :
  samSubModeRoll_fun (f32 (2139095040)) 29 1 1252 5 (f32 (1055506057)) (f32 (3221175969)) (f32 (1071035465))
  = (29, 1253, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0862 :
  samSubModeRoll_fun (f32 (3218668864)) 50 0 4294967295 5 (f32 (1069674127)) (f32 (3214016418)) (f32 (3206530677))
  = (50, 0, 0, [1069674127; 3214016418; 3206530677]).
Proof. vm_compute. reflexivity. Qed.


Example t_0863 :
  samSubModeRoll_fun (f32 (1073741824)) 75 1 7629 4294967295 (f32 (3211246044)) (f32 (1059697310)) (f32 (1068435460))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0864 :
  samSubModeRoll_fun (f32 (1076116682)) 61 1 4641 1 (f32 (3219844010)) (f32 (1072161703)) (f32 (1049948826))
  = (61, 4642, 2, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0865 :
  samSubModeRoll_fun (f32 (1065353216)) 1 1 4499 11 (f32 (3218846189)) (f32 (1069509773)) (f32 (1059031346))
  = (1, 4500, 11, [3218846189; 1069509773; 1059031346]).
Proof. vm_compute. reflexivity. Qed.


Example t_0866 :
  samSubModeRoll_fun (f32 (1073741824)) 20 1 343 11 (f32 (1073057543)) (f32 (3188257579)) (f32 (1059372098))
  = (20, 344, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0867 :
  samSubModeRoll_fun (f32 (1073741824)) 25 1 3390 12 (f32 (1062002741)) (f32 (3219712182)) (f32 (3157630766))
  = (51, 0, 0, [1062002741; 3219712182; 3157630766]).
Proof. vm_compute. reflexivity. Qed.


Example t_0868 :
  samSubModeRoll_fun (f32 (1075228354)) 48 0 6250 5 (f32 (1069619156)) (f32 (1066749296)) (f32 (3221037848))
  = (17, 0, 0, [1069619156; 1066749296; 3221037848]).
Proof. vm_compute. reflexivity. Qed.


Example t_0869 :
  samSubModeRoll_fun (f32 (1077828751)) 7 0 6249 17 (f32 (1070163148)) (f32 (1047674500)) (f32 (1066477325))
  = (7, 6250, 0, [1070163148; 1047674500; 1066477325]).
Proof. vm_compute. reflexivity. Qed.


Example t_0870 :
  samSubModeRoll_fun (f32 (1073741824)) 70 2 7001 5 (f32 (1045569192)) (f32 (3197417177)) (f32 (3193522419))
  = (17, 0, 0, [1045569192; 3197417177; 3193522419]).
Proof. vm_compute. reflexivity. Qed.


Example t_0871 :
  samSubModeRoll_fun (f32 (1073741824)) 43 1 6250 12 (f32 (3219354736)) (f32 (1062553121)) (f32 (3196965671))
  = (51, 0, 0, [3219354736; 1062553121; 3196965671]).
Proof. vm_compute. reflexivity. Qed.


Example t_0872 :
  samSubModeRoll_fun (f32 (2143289344)) 43 1 1897 5 (f32 (3213587956)) (f32 (1052634727)) (f32 (3207986103))
  = (43, 1898, 5, [3213587956; 1052634727; 3207986103]).
Proof. vm_compute. reflexivity. Qed.


Example t_0873 :
  samSubModeRoll_fun (f32 (2139095040)) 51 1 1495 5 (f32 (1038124443)) (f32 (3215112688)) (f32 (3207932792))
  = (51, 1496, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0874 :
  samSubModeRoll_fun (f32 (3219675077)) 51 0 4294967295 6 (f32 (1069850637)) (f32 (3215945200)) (f32 (1068120382))
  = (51, 0, 0, [1069850637; 3215945200; 1068120382]).
Proof. vm_compute. reflexivity. Qed.


Example t_0875 :
  samSubModeRoll_fun (f32 (1073741824)) 47 1 1257 4294967295 (f32 (3221081823)) (f32 (3217842613)) (f32 (1073333487))
  = (47, 1258, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0876 :
  samSubModeRoll_fun (f32 (1071767753)) 54 1 7845 11 (f32 (3209051404)) (f32 (1070689879)) (f32 (3192529476))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0877 :
  samSubModeRoll_fun (f32 (1065353216)) 41 1 7536 11 (f32 (3201456710)) (f32 (3218613537)) (f32 (3210356290))
  = (17, 0, 0, [3201456710; 3218613537; 3210356290]).
Proof. vm_compute. reflexivity. Qed.


Example t_0878 :
  samSubModeRoll_fun (f32 (1073741824)) 4 1 2057 11 (f32 (1066972932)) (f32 (1066312011)) (f32 (1059127814))
  = (4, 2058, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0879 :
  samSubModeRoll_fun (f32 (1073741824)) 38 1 4767 12 (f32 (1071277547)) (f32 (1071458475)) (f32 (3217608659))
  = (51, 0, 0, [1071277547; 1071458475; 3217608659]).
Proof. vm_compute. reflexivity. Qed.


Example t_0880 :
  samSubModeRoll_fun (f32 (3218641877)) 11 0 6250 19 (f32 (1068180707)) (f32 (3191472311)) (f32 (3219787963))
  = (17, 0, 0, [1068180707; 3191472311; 3219787963]).
Proof. vm_compute. reflexivity. Qed.


Example t_0881 :
  samSubModeRoll_fun (f32 (1049028491)) 63 0 6249 2 (f32 (1062461593)) (f32 (3213713676)) (f32 (3187835433))
  = (63, 6250, 0, [1062461593; 3213713676; 3187835433]).
Proof. vm_compute. reflexivity. Qed.


Example t_0882 :
  samSubModeRoll_fun (f32 (1073741824)) 43 2 4762 5 (f32 (3205379454)) (f32 (1072737272)) (f32 (3217983880))
  = (43, 4763, 0, [3205379454; 1072737272; 3217983880]).
Proof. vm_compute. reflexivity. Qed.


Example t_0883 :
  samSubModeRoll_fun (f32 (1073741824)) 52 1 6250 12 (f32 (1068609569)) (f32 (1060528202)) (f32 (3213280006))
  = (51, 0, 0, [1068609569; 1060528202; 3213280006]).
Proof. vm_compute. reflexivity. Qed.


Example t_0884 :
  samSubModeRoll_fun (f32 (2143289344)) 5 1 6202 5 (f32 (1056280995)) (f32 (1053288911)) (f32 (3205877467))
  = (5, 6203, 5, [1056280995; 1053288911; 3205877467]).
Proof. vm_compute. reflexivity. Qed.


Example t_0885 :
  samSubModeRoll_fun (f32 (2139095040)) 20 1 5693 5 (f32 (1061417045)) (f32 (1067982657)) (f32 (1073100373))
  = (20, 5694, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0886 :
  samSubModeRoll_fun (f32 (1046751427)) 70 0 4294967295 5 (f32 (3217435971)) (f32 (1059073177)) (f32 (3200824382))
  = (70, 0, 0, [3217435971; 1059073177; 3200824382]).
Proof. vm_compute. reflexivity. Qed.


Example t_0887 :
  samSubModeRoll_fun (f32 (1073741824)) 31 1 7422 4294967295 (f32 (3220200284)) (f32 (3216624113)) (f32 (3203580944))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0888 :
  samSubModeRoll_fun (f32 (1062251807)) 6 0 3923 9 (f32 (3217579946)) (f32 (3196366368)) (f32 (3213754927))
  = (6, 3924, 0, [3217579946; 3196366368; 3213754927]).
Proof. vm_compute. reflexivity. Qed.


Example t_0889 :
  samSubModeRoll_fun (f32 (1065353216)) 35 1 4795 13 (f32 (3204571672)) (f32 (1066854829)) (f32 (1056113406))
  = (35, 4796, 13, [3204571672; 1066854829; 1056113406]).
Proof. vm_compute. reflexivity. Qed.


Example t_0890 :
  samSubModeRoll_fun (f32 (1073741824)) 60 1 6871 11 (f32 (1054257708)) (f32 (3213425288)) (f32 (3217485191))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0891 :
  samSubModeRoll_fun (f32 (1073741824)) 39 1 3496 12 (f32 (1058082045)) (f32 (1064152773)) (f32 (3215263611))
  = (51, 0, 0, [1058082045; 1064152773; 3215263611]).
Proof. vm_compute. reflexivity. Qed.


Example t_0892 :
  samSubModeRoll_fun (f32 (1075207075)) 57 0 6250 0 (f32 (3220199949)) (f32 (3204389382)) (f32 (1072092616))
  = (17, 0, 0, [3220199949; 3204389382; 1072092616]).
Proof. vm_compute. reflexivity. Qed.


Example t_0893 :
  samSubModeRoll_fun (f32 (3219532579)) 67 0 6249 1 (f32 (3158948721)) (f32 (3187777040)) (f32 (1059623042))
  = (67, 6250, 0, [3158948721; 3187777040; 1059623042]).
Proof. vm_compute. reflexivity. Qed.


Example t_0894 :
  samSubModeRoll_fun (f32 (1073741824)) 62 2 1780 5 (f32 (1067424901)) (f32 (1065091878)) (f32 (3204949947))
  = (62, 1781, 0, [1067424901; 1065091878; 3204949947]).
Proof. vm_compute. reflexivity. Qed.


Example t_0895 :
  samSubModeRoll_fun (f32 (1073741824)) 62 1 6250 12 (f32 (3212312621)) (f32 (3217404451)) (f32 (3217106007))
  = (51, 0, 0, [3212312621; 3217404451; 3217106007]).
Proof. vm_compute. reflexivity. Qed.


Example t_0896 :
  samSubModeRoll_fun (f32 (2143289344)) 38 1 4440 5 (f32 (1067663808)) (f32 (1058733099)) (f32 (1071739757))
  = (38, 4441, 5, [1067663808; 1058733099; 1071739757]).
Proof. vm_compute. reflexivity. Qed.


Example t_0897 :
  samSubModeRoll_fun (f32 (2139095040)) 71 1 4325 5 (f32 (1048941442)) (f32 (1069725403)) (f32 (3219726459))
  = (71, 4326, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0898 :
  samSubModeRoll_fun (f32 (1074724432)) 74 0 4294967295 20 (f32 (1063897955)) (f32 (3198210965)) (f32 (3213780995))
  = (74, 0, 0, [1063897955; 3198210965; 3213780995]).
Proof. vm_compute. reflexivity. Qed.


Example t_0899 :
  samSubModeRoll_fun (f32 (1073741824)) 52 1 5199 4294967295 (f32 (1072594143)) (f32 (1062727194)) (f32 (3196919409))
  = (52, 5200, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0900 :
  samSubModeRoll_fun (f32 (3205890634)) 44 0 6953 19 (f32 (3211670875)) (f32 (3207359471)) (f32 (3214797882))
  = (17, 0, 0, [3211670875; 3207359471; 3214797882]).
Proof. vm_compute. reflexivity. Qed.


Example t_0901 :
  samSubModeRoll_fun (f32 (1065353216)) 51 1 1018 1 (f32 (3210302861)) (f32 (1067822644)) (f32 (1061256503))
  = (51, 1019, 1, [3210302861; 1067822644; 1061256503]).
Proof. vm_compute. reflexivity. Qed.


Example t_0902 :
  samSubModeRoll_fun (f32 (1073741824)) 68 1 6416 11 (f32 (3190097418)) (f32 (3220234515)) (f32 (1072416792))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0903 :
  samSubModeRoll_fun (f32 (1073741824)) 71 1 6223 12 (f32 (1069710880)) (f32 (3194844173)) (f32 (3213254912))
  = (51, 0, 0, [1069710880; 3194844173; 3213254912]).
Proof. vm_compute. reflexivity. Qed.


Example t_0904 :
  samSubModeRoll_fun (f32 (1061959811)) 37 0 6250 8 (f32 (3208419031)) (f32 (1071219611)) (f32 (3220407687))
  = (17, 0, 0, [3208419031; 1071219611; 3220407687]).
Proof. vm_compute. reflexivity. Qed.


Example t_0905 :
  samSubModeRoll_fun (f32 (3219619463)) 8 0 6249 10 (f32 (1069620984)) (f32 (1069377339)) (f32 (3218742981))
  = (8, 6250, 0, [1069620984; 1069377339; 3218742981]).
Proof. vm_compute. reflexivity. Qed.


Example t_0906 :
  samSubModeRoll_fun (f32 (1073741824)) 10 2 1407 5 (f32 (1073098562)) (f32 (1068349853)) (f32 (1043301354))
  = (10, 1408, 0, [1073098562; 1068349853; 1043301354]).
Proof. vm_compute. reflexivity. Qed.


Example t_0907 :
  samSubModeRoll_fun (f32 (1073741824)) 54 1 6250 12 (f32 (1066176954)) (f32 (1068579282)) (f32 (1073428896))
  = (51, 0, 0, [1066176954; 1068579282; 1073428896]).
Proof. vm_compute. reflexivity. Qed.


Example t_0908 :
  samSubModeRoll_fun (f32 (2143289344)) 16 1 6185 5 (f32 (1060109895)) (f32 (3217990903)) (f32 (1073365528))
  = (16, 6186, 5, [1060109895; 3217990903; 1073365528]).
Proof. vm_compute. reflexivity. Qed.


Example t_0909 :
  samSubModeRoll_fun (f32 (2139095040)) 18 1 3910 5 (f32 (1068393250)) (f32 (1054262015)) (f32 (1040449311))
  = (18, 3911, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0910 :
  samSubModeRoll_fun (f32 (3220241890)) 65 0 4294967295 4 (f32 (3214146866)) (f32 (1066419614)) (f32 (1073518589))
  = (65, 0, 0, [3214146866; 1066419614; 1073518589]).
Proof. vm_compute. reflexivity. Qed.


Example t_0911 :
  samSubModeRoll_fun (f32 (1073741824)) 60 1 825 4294967295 (f32 (3219051598)) (f32 (1072931066)) (f32 (3214236314))
  = (60, 826, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0912 :
  samSubModeRoll_fun (f32 (1066757086)) 59 0 800 16 (f32 (3197892463)) (f32 (1073339795)) (f32 (1071894565))
  = (59, 801, 0, [3197892463; 1073339795; 1071894565]).
Proof. vm_compute. reflexivity. Qed.


Example t_0913 :
  samSubModeRoll_fun (f32 (1065353216)) 73 1 312 3 (f32 (3187647972)) (f32 (1039941185)) (f32 (3191965888))
  = (73, 313, 3, [3187647972; 1039941185; 3191965888]).
Proof. vm_compute. reflexivity. Qed.


Example t_0914 :
  samSubModeRoll_fun (f32 (1073741824)) 58 1 2975 11 (f32 (1060861931)) (f32 (3214433923)) (f32 (1070456750))
  = (58, 2976, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0915 :
  samSubModeRoll_fun (f32 (1073741824)) 53 1 5483 12 (f32 (1065314440)) (f32 (1071261344)) (f32 (1044118987))
  = (51, 0, 0, [1065314440; 1071261344; 1044118987]).
Proof. vm_compute. reflexivity. Qed.


Example t_0916 :
  samSubModeRoll_fun (f32 (1065498520)) 65 0 6250 1 (f32 (3205223143)) (f32 (1063366957)) (f32 (3214640163))
  = (17, 0, 0, [3205223143; 1063366957; 3214640163]).
Proof. vm_compute. reflexivity. Qed.


Example t_0917 :
  samSubModeRoll_fun (f32 (1073934006)) 54 0 6249 20 (f32 (1073368923)) (f32 (3204799111)) (f32 (3184186538))
  = (54, 6250, 0, [1073368923; 3204799111; 3184186538]).
Proof. vm_compute. reflexivity. Qed.


Example t_0918 :
  samSubModeRoll_fun (f32 (1073741824)) 53 2 7391 5 (f32 (3216226551)) (f32 (3218147082)) (f32 (1070144658))
  = (17, 0, 0, [3216226551; 3218147082; 1070144658]).
Proof. vm_compute. reflexivity. Qed.


Example t_0919 :
  samSubModeRoll_fun (f32 (1073741824)) 52 1 6250 12 (f32 (3207269736)) (f32 (1057675524)) (f32 (3201948243))
  = (51, 0, 0, [3207269736; 1057675524; 3201948243]).
Proof. vm_compute. reflexivity. Qed.


Example t_0920 :
  samSubModeRoll_fun (f32 (2143289344)) 51 1 2950 5 (f32 (3182580114)) (f32 (1073227983)) (f32 (1067888263))
  = (51, 2951, 5, [3182580114; 1073227983; 1067888263]).
Proof. vm_compute. reflexivity. Qed.


Example t_0921 :
  samSubModeRoll_fun (f32 (2139095040)) 63 1 3896 5 (f32 (1065761563)) (f32 (1057156190)) (f32 (1051976570))
  = (63, 3897, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0922 :
  samSubModeRoll_fun (f32 (1065172694)) 26 0 4294967295 8 (f32 (1059121822)) (f32 (3186106708)) (f32 (3207293703))
  = (26, 0, 0, [1059121822; 3186106708; 3207293703]).
Proof. vm_compute. reflexivity. Qed.


Example t_0923 :
  samSubModeRoll_fun (f32 (1073741824)) 71 1 4735 4294967295 (f32 (3214727027)) (f32 (1061424861)) (f32 (3217757121))
  = (71, 4736, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0924 :
  samSubModeRoll_fun (f32 (1077125590)) 62 0 1555 12 (f32 (1066047627)) (f32 (3219790166)) (f32 (3214303201))
  = (62, 1556, 0, [1066047627; 3219790166; 3214303201]).
Proof. vm_compute. reflexivity. Qed.


Example t_0925 :
  samSubModeRoll_fun (f32 (1065353216)) 11 1 4525 3 (f32 (1053676826)) (f32 (3185561097)) (f32 (1072229210))
  = (11, 4526, 3, [1053676826; 3185561097; 1072229210]).
Proof. vm_compute. reflexivity. Qed.


Example t_0926 :
  samSubModeRoll_fun (f32 (1073741824)) 54 1 4262 11 (f32 (3213463550)) (f32 (1073506818)) (f32 (3171043966))
  = (54, 4263, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0927 :
  samSubModeRoll_fun (f32 (1073741824)) 64 1 3480 12 (f32 (3214887590)) (f32 (1067918149)) (f32 (1068893719))
  = (51, 0, 0, [3214887590; 1067918149; 1068893719]).
Proof. vm_compute. reflexivity. Qed.


Example t_0928 :
  samSubModeRoll_fun (f32 (3214128316)) 64 0 6250 12 (f32 (1059676793)) (f32 (1068194740)) (f32 (3220415140))
  = (17, 0, 0, [1059676793; 1068194740; 3220415140]).
Proof. vm_compute. reflexivity. Qed.


Example t_0929 :
  samSubModeRoll_fun (f32 (1069574008)) 75 0 6249 14 (f32 (3210319195)) (f32 (3220832273)) (f32 (3211645797))
  = (75, 6250, 0, [3210319195; 3220832273; 3211645797]).
Proof. vm_compute. reflexivity. Qed.


Example t_0930 :
  samSubModeRoll_fun (f32 (1073741824)) 71 2 7156 5 (f32 (1058439812)) (f32 (1060813846)) (f32 (1071401732))
  = (17, 0, 0, [1058439812; 1060813846; 1071401732]).
Proof. vm_compute. reflexivity. Qed.


Example t_0931 :
  samSubModeRoll_fun (f32 (1073741824)) 10 1 6250 12 (f32 (3219190131)) (f32 (1055739608)) (f32 (1071623209))
  = (51, 0, 0, [3219190131; 1055739608; 1071623209]).
Proof. vm_compute. reflexivity. Qed.


Example t_0932 :
  samSubModeRoll_fun (f32 (2143289344)) 26 1 4174 5 (f32 (3171845300)) (f32 (1069542586)) (f32 (3215724230))
  = (26, 4175, 5, [3171845300; 1069542586; 3215724230]).
Proof. vm_compute. reflexivity. Qed.


Example t_0933 :
  samSubModeRoll_fun (f32 (2139095040)) 76 1 7853 5 (f32 (1030267883)) (f32 (1069111547)) (f32 (1058341854))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0934 :
  samSubModeRoll_fun (f32 (1077364962)) 5 0 4294967295 7 (f32 (1068794644)) (f32 (3213812948)) (f32 (3197931189))
  = (5, 0, 0, [1068794644; 3213812948; 3197931189]).
Proof. vm_compute. reflexivity. Qed.


Example t_0935 :
  samSubModeRoll_fun (f32 (1073741824)) 73 1 1280 4294967295 (f32 (3219122632)) (f32 (1073465018)) (f32 (3208665728))
  = (73, 1281, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0936 :
  samSubModeRoll_fun (f32 (1076956851)) 70 1 2839 18 (f32 (3204037516)) (f32 (1062883683)) (f32 (3218068578))
  = (51, 0, 0, [3204037516; 1062883683; 3218068578]).
Proof. vm_compute. reflexivity. Qed.


Example t_0937 :
  samSubModeRoll_fun (f32 (1065353216)) 77 1 5753 15 (f32 (1071888076)) (f32 (1067578939)) (f32 (1066695629))
  = (77, 5754, 15, [1071888076; 1067578939; 1066695629]).
Proof. vm_compute. reflexivity. Qed.


Example t_0938 :
  samSubModeRoll_fun (f32 (1073741824)) 11 1 6403 11 (f32 (1069149573)) (f32 (1048948043)) (f32 (1068097643))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0939 :
  samSubModeRoll_fun (f32 (1073741824)) 2 1 3224 12 (f32 (3214030244)) (f32 (1051574737)) (f32 (3200219752))
  = (51, 0, 0, [3214030244; 1051574737; 3200219752]).
Proof. vm_compute. reflexivity. Qed.


Example t_0940 :
  samSubModeRoll_fun (f32 (3213789588)) 29 0 6250 19 (f32 (1057829149)) (f32 (3214069472)) (f32 (3212928652))
  = (17, 0, 0, [1057829149; 3214069472; 3212928652]).
Proof. vm_compute. reflexivity. Qed.


Example t_0941 :
  samSubModeRoll_fun (f32 (1063204309)) 31 0 6249 8 (f32 (1069462754)) (f32 (1044286696)) (f32 (3220450889))
  = (31, 6250, 0, [1069462754; 1044286696; 3220450889]).
Proof. vm_compute. reflexivity. Qed.


Example t_0942 :
  samSubModeRoll_fun (f32 (1073741824)) 68 2 6672 5 (f32 (3214887387)) (f32 (3220171744)) (f32 (1065399619))
  = (17, 0, 0, [3214887387; 3220171744; 1065399619]).
Proof. vm_compute. reflexivity. Qed.


Example t_0943 :
  samSubModeRoll_fun (f32 (1073741824)) 13 1 6250 12 (f32 (3219202195)) (f32 (1054671589)) (f32 (1062266357))
  = (51, 0, 0, [3219202195; 1054671589; 1062266357]).
Proof. vm_compute. reflexivity. Qed.


Example t_0944 :
  samSubModeRoll_fun (f32 (2143289344)) 12 1 5612 5 (f32 (3183043579)) (f32 (3154188569)) (f32 (3210764566))
  = (12, 5613, 5, [3183043579; 3154188569; 3210764566]).
Proof. vm_compute. reflexivity. Qed.


Example t_0945 :
  samSubModeRoll_fun (f32 (2139095040)) 75 1 5982 5 (f32 (1064346082)) (f32 (3216040736)) (f32 (1068602693))
  = (75, 5983, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0946 :
  samSubModeRoll_fun (f32 (1074176217)) 14 0 4294967295 15 (f32 (1059372055)) (f32 (1066618400)) (f32 (3215385882))
  = (14, 0, 0, [1059372055; 1066618400; 3215385882]).
Proof. vm_compute. reflexivity. Qed.


Example t_0947 :
  samSubModeRoll_fun (f32 (1073741824)) 76 1 6303 4294967295 (f32 (1071059797)) (f32 (1069553792)) (f32 (3216290106))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0948 :
  samSubModeRoll_fun (f32 (1067633410)) 7 0 7156 6 (f32 (1061922840)) (f32 (3206414697)) (f32 (3214202179))
  = (17, 0, 0, [1061922840; 3206414697; 3214202179]).
Proof. vm_compute. reflexivity. Qed.


Example t_0949 :
  samSubModeRoll_fun (f32 (1065353216)) 52 1 7896 7 (f32 (3217888883)) (f32 (3192318944)) (f32 (3211439778))
  = (17, 0, 0, [3217888883; 3192318944; 3211439778]).
Proof. vm_compute. reflexivity. Qed.


Example t_0950 :
  samSubModeRoll_fun (f32 (1073741824)) 59 1 7311 11 (f32 (1062200610)) (f32 (1065351522)) (f32 (1050944950))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0951 :
  samSubModeRoll_fun (f32 (1073741824)) 13 1 4605 12 (f32 (1019745129)) (f32 (1053849679)) (f32 (1055296118))
  = (51, 0, 0, [1019745129; 1053849679; 1055296118]).
Proof. vm_compute. reflexivity. Qed.


Example t_0952 :
  samSubModeRoll_fun (f32 (3212036084)) 42 0 6250 11 (f32 (1062909949)) (f32 (3218826805)) (f32 (1058041985))
  = (17, 0, 0, [1062909949; 3218826805; 1058041985]).
Proof. vm_compute. reflexivity. Qed.


Example t_0953 :
  samSubModeRoll_fun (f32 (3209170600)) 66 0 6249 0 (f32 (3198664075)) (f32 (1070486150)) (f32 (1055047991))
  = (66, 6250, 0, [3198664075; 1070486150; 1055047991]).
Proof. vm_compute. reflexivity. Qed.


Example t_0954 :
  samSubModeRoll_fun (f32 (1073741824)) 28 2 5426 5 (f32 (1070475376)) (f32 (3212966456)) (f32 (1065326115))
  = (28, 5427, 0, [1070475376; 3212966456; 1065326115]).
Proof. vm_compute. reflexivity. Qed.


Example t_0955 :
  samSubModeRoll_fun (f32 (1073741824)) 17 1 6250 12 (f32 (3219268970)) (f32 (3201397494)) (f32 (3221111753))
  = (51, 0, 0, [3219268970; 3201397494; 3221111753]).
Proof. vm_compute. reflexivity. Qed.


Example t_0956 :
  samSubModeRoll_fun (f32 (2143289344)) 76 1 1751 5 (f32 (1069422170)) (f32 (1067520127)) (f32 (3210108215))
  = (76, 1752, 5, [1069422170; 1067520127; 3210108215]).
Proof. vm_compute. reflexivity. Qed.


Example t_0957 :
  samSubModeRoll_fun (f32 (2139095040)) 27 1 6770 5 (f32 (3215433358)) (f32 (3213652635)) (f32 (3208853630))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0958 :
  samSubModeRoll_fun (f32 (3206502754)) 63 0 4294967295 3 (f32 (1058928285)) (f32 (3218447940)) (f32 (3214982551))
  = (63, 0, 0, [1058928285; 3218447940; 3214982551]).
Proof. vm_compute. reflexivity. Qed.


Example t_0959 :
  samSubModeRoll_fun (f32 (1073741824)) 35 1 27 4294967295 (f32 (3206656366)) (f32 (3218329298)) (f32 (3213779076))
  = (35, 28, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0960 :
  samSubModeRoll_fun (f32 (1065432991)) 28 0 5744 0 (f32 (3214156282)) (f32 (1060525404)) (f32 (3208125729))
  = (28, 5745, 0, [3214156282; 1060525404; 3208125729]).
Proof. vm_compute. reflexivity. Qed.


Example t_0961 :
  samSubModeRoll_fun (f32 (1065353216)) 28 1 3505 8 (f32 (1069932058)) (f32 (3203352288)) (f32 (3220623184))
  = (28, 3506, 8, [1069932058; 3203352288; 3220623184]).
Proof. vm_compute. reflexivity. Qed.


Example t_0962 :
  samSubModeRoll_fun (f32 (1073741824)) 78 1 1178 11 (f32 (1049626868)) (f32 (1073402196)) (f32 (3218708250))
  = (78, 1179, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0963 :
  samSubModeRoll_fun (f32 (1073741824)) 17 1 1491 12 (f32 (3219910483)) (f32 (3207670323)) (f32 (1055352774))
  = (51, 0, 0, [3219910483; 3207670323; 1055352774]).
Proof. vm_compute. reflexivity. Qed.


Example t_0964 :
  samSubModeRoll_fun (f32 (1076348577)) 43 0 6250 11 (f32 (1062915436)) (f32 (1029993341)) (f32 (3198151074))
  = (17, 0, 0, [1062915436; 1029993341; 3198151074]).
Proof. vm_compute. reflexivity. Qed.


Example t_0965 :
  samSubModeRoll_fun (f32 (1074112549)) 12 0 6249 20 (f32 (3206854172)) (f32 (1012905197)) (f32 (3214411478))
  = (12, 6250, 0, [3206854172; 1012905197; 3214411478]).
Proof. vm_compute. reflexivity. Qed.


Example t_0966 :
  samSubModeRoll_fun (f32 (1073741824)) 50 2 4775 5 (f32 (1064206657)) (f32 (3216575847)) (f32 (3219821881))
  = (50, 4776, 0, [1064206657; 3216575847; 3219821881]).
Proof. vm_compute. reflexivity. Qed.


Example t_0967 :
  samSubModeRoll_fun (f32 (1073741824)) 40 1 6250 12 (f32 (1064114415)) (f32 (1067154241)) (f32 (1057715765))
  = (51, 0, 0, [1064114415; 1067154241; 1057715765]).
Proof. vm_compute. reflexivity. Qed.


Example t_0968 :
  samSubModeRoll_fun (f32 (2143289344)) 1 1 6269 5 (f32 (1028180197)) (f32 (1070783626)) (f32 (1060630623))
  = (17, 0, 0, [1028180197; 1070783626; 1060630623]).
Proof. vm_compute. reflexivity. Qed.


Example t_0969 :
  samSubModeRoll_fun (f32 (2139095040)) 34 1 4574 5 (f32 (3189670660)) (f32 (1064901384)) (f32 (1056102792))
  = (34, 4575, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0970 :
  samSubModeRoll_fun (f32 (1076996516)) 9 0 4294967295 20 (f32 (1067283572)) (f32 (1022238600)) (f32 (3190858649))
  = (9, 0, 0, [1067283572; 1022238600; 3190858649]).
Proof. vm_compute. reflexivity. Qed.


Example t_0971 :
  samSubModeRoll_fun (f32 (1073741824)) 29 1 5570 4294967295 (f32 (3211373400)) (f32 (1068490781)) (f32 (1059050676))
  = (29, 5571, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0972 :
  samSubModeRoll_fun (f32 (1066834331)) 79 1 1381 15 (f32 (3206158564)) (f32 (3185696915)) (f32 (1062945315))
  = (51, 0, 0, [3206158564; 3185696915; 1062945315]).
Proof. vm_compute. reflexivity. Qed.


Example t_0973 :
  samSubModeRoll_fun (f32 (1065353216)) 47 1 5984 10 (f32 (1064469604)) (f32 (3199651596)) (f32 (3186577440))
  = (47, 5985, 10, [1064469604; 3199651596; 3186577440]).
Proof. vm_compute. reflexivity. Qed.


Example t_0974 :
  samSubModeRoll_fun (f32 (1073741824)) 48 1 5982 11 (f32 (1058465564)) (f32 (1066631346)) (f32 (3217000436))
  = (48, 5983, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0975 :
  samSubModeRoll_fun (f32 (1073741824)) 9 1 6523 12 (f32 (1052199827)) (f32 (1065913477)) (f32 (1050505985))
  = (51, 0, 0, [1052199827; 1065913477; 1050505985]).
Proof. vm_compute. reflexivity. Qed.


Example t_0976 :
  samSubModeRoll_fun (f32 (1057243996)) 46 0 6250 10 (f32 (3217209720)) (f32 (3220166683)) (f32 (1045435369))
  = (17, 0, 0, [3217209720; 3220166683; 1045435369]).
Proof. vm_compute. reflexivity. Qed.


Example t_0977 :
  samSubModeRoll_fun (f32 (3205102987)) 9 0 6249 5 (f32 (3209135525)) (f32 (1057703404)) (f32 (3164175485))
  = (9, 6250, 0, [3209135525; 1057703404; 3164175485]).
Proof. vm_compute. reflexivity. Qed.


Example t_0978 :
  samSubModeRoll_fun (f32 (1073741824)) 56 2 5810 5 (f32 (1060202210)) (f32 (3191446861)) (f32 (1062938670))
  = (56, 5811, 0, [1060202210; 3191446861; 1062938670]).
Proof. vm_compute. reflexivity. Qed.


Example t_0979 :
  samSubModeRoll_fun (f32 (1073741824)) 55 1 6250 12 (f32 (1034585726)) (f32 (3207709073)) (f32 (3215440858))
  = (51, 0, 0, [1034585726; 3207709073; 3215440858]).
Proof. vm_compute. reflexivity. Qed.


Example t_0980 :
  samSubModeRoll_fun (f32 (2143289344)) 54 1 2992 5 (f32 (1071443391)) (f32 (3213729250)) (f32 (3221041939))
  = (54, 2993, 5, [1071443391; 3213729250; 3221041939]).
Proof. vm_compute. reflexivity. Qed.


Example t_0981 :
  samSubModeRoll_fun (f32 (2139095040)) 78 1 1184 5 (f32 (1066677060)) (f32 (3206505005)) (f32 (3213483241))
  = (78, 1185, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0982 :
  samSubModeRoll_fun (f32 (1048315142)) 77 0 4294967295 12 (f32 (1072366173)) (f32 (3209361762)) (f32 (3183310831))
  = (77, 0, 0, [1072366173; 3209361762; 3183310831]).
Proof. vm_compute. reflexivity. Qed.


Example t_0983 :
  samSubModeRoll_fun (f32 (1073741824)) 75 1 4192 4294967295 (f32 (3213481621)) (f32 (3197430389)) (f32 (3214020071))
  = (75, 4193, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0984 :
  samSubModeRoll_fun (f32 (1077652154)) 63 1 7697 0 (f32 (3196090606)) (f32 (3205831585)) (f32 (1054002305))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0985 :
  samSubModeRoll_fun (f32 (1065353216)) 37 1 1754 16 (f32 (1064964362)) (f32 (1065929655)) (f32 (3198606921))
  = (37, 1755, 16, [1064964362; 1065929655; 3198606921]).
Proof. vm_compute. reflexivity. Qed.


Example t_0986 :
  samSubModeRoll_fun (f32 (1073741824)) 9 1 805 11 (f32 (1063965108)) (f32 (3216022531)) (f32 (1054009159))
  = (9, 806, 12, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0987 :
  samSubModeRoll_fun (f32 (1073741824)) 23 1 2908 12 (f32 (1054393011)) (f32 (1071704873)) (f32 (1061103936))
  = (51, 0, 0, [1054393011; 1071704873; 1061103936]).
Proof. vm_compute. reflexivity. Qed.


Example t_0988 :
  samSubModeRoll_fun (f32 (1066015569)) 69 0 6250 12 (f32 (1060224786)) (f32 (3217408342)) (f32 (3210406522))
  = (17, 0, 0, [1060224786; 3217408342; 3210406522]).
Proof. vm_compute. reflexivity. Qed.


Example t_0989 :
  samSubModeRoll_fun (f32 (3219426992)) 51 0 6249 1 (f32 (3218091391)) (f32 (3204122641)) (f32 (1059450654))
  = (51, 6250, 0, [3218091391; 3204122641; 1059450654]).
Proof. vm_compute. reflexivity. Qed.


Example t_0990 :
  samSubModeRoll_fun (f32 (1073741824)) 79 2 3908 5 (f32 (3219573459)) (f32 (3218956917)) (f32 (3203880259))
  = (79, 3909, 0, [3219573459; 3218956917; 3203880259]).
Proof. vm_compute. reflexivity. Qed.


Example t_0991 :
  samSubModeRoll_fun (f32 (1073741824)) 6 1 6250 12 (f32 (1065036247)) (f32 (3199107477)) (f32 (3208259035))
  = (51, 0, 0, [1065036247; 3199107477; 3208259035]).
Proof. vm_compute. reflexivity. Qed.


Example t_0992 :
  samSubModeRoll_fun (f32 (2143289344)) 33 1 6666 5 (f32 (1059794214)) (f32 (3197311821)) (f32 (1045425113))
  = (17, 0, 0, [1059794214; 3197311821; 1045425113]).
Proof. vm_compute. reflexivity. Qed.


Example t_0993 :
  samSubModeRoll_fun (f32 (2139095040)) 33 1 5041 5 (f32 (1061749254)) (f32 (3212675227)) (f32 (1049249012))
  = (33, 5042, 6, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0994 :
  samSubModeRoll_fun (f32 (1056537448)) 78 0 4294967295 17 (f32 (3208852578)) (f32 (3209836776)) (f32 (1071901515))
  = (78, 0, 0, [3208852578; 3209836776; 1071901515]).
Proof. vm_compute. reflexivity. Qed.


Example t_0995 :
  samSubModeRoll_fun (f32 (1073741824)) 40 1 4083 4294967295 (f32 (3203588229)) (f32 (3211942460)) (f32 (3135474759))
  = (40, 4084, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0996 :
  samSubModeRoll_fun (f32 (3185166778)) 33 1 3585 4 (f32 (1058594409)) (f32 (3218744946)) (f32 (1066160196))
  = (33, 3586, 4, [1058594409; 3218744946; 1066160196]).
Proof. vm_compute. reflexivity. Qed.


Example t_0997 :
  samSubModeRoll_fun (f32 (1065353216)) 57 1 5671 17 (f32 (1060464472)) (f32 (3209171461)) (f32 (3168497155))
  = (57, 5672, 17, [1060464472; 3209171461; 3168497155]).
Proof. vm_compute. reflexivity. Qed.


Example t_0998 :
  samSubModeRoll_fun (f32 (1073741824)) 57 1 7738 11 (f32 (1015855655)) (f32 (3206783859)) (f32 (3215572808))
  = (17, 0, 0, [0; 0; 0]).
Proof. vm_compute. reflexivity. Qed.


Example t_0999 :
  samSubModeRoll_fun (f32 (1073741824)) 34 1 4603 12 (f32 (3220235410)) (f32 (1061668291)) (f32 (3212499433))
  = (51, 0, 0, [3220235410; 1061668291; 3212499433]).
Proof. vm_compute. reflexivity. Qed.
