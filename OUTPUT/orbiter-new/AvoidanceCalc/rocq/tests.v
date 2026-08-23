(* 由 FloatTest/tools/emit_tests.py 自动生成，请勿手改。
 * 每条约 1000 条向量一条 vm_compute 定理；coqc 编译通过即差分测试通过。 *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.
Require Import OUTPUT.orbiter_new.AvoidanceCalc.rocq.spec.

Import ListNotations.
Local Open Scope Z_scope.


Example t_0000 :
  avoidanceCalc_fun [2; 3; 0; 0; 2; 2; 1834637422; 1084402589; 160188456]
  = [2; 2; 1834637422; 1084402589; 160188456; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0001 :
  avoidanceCalc_fun [4; 1; 0; 1; 1; 0; 2141877501; 3848658849; 1481159309]
  = [1; 1; 255; 0; 1481159309; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0002 :
  avoidanceCalc_fun [2; 3; 1; 2; 3; 3; 2689063878; 867344185; 1036791916]
  = [3; 3; 2689063878; 867344185; 1036791916; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0003 :
  avoidanceCalc_fun [1; 0; 1; 0; 4; 4; 2030682621; 1610427099; 2175854420]
  = [1; 1; 255; 0; 2175854420; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0004 :
  avoidanceCalc_fun [5; 2; 1; 1; 1; 3; 309148250; 468172741; 3295867895]
  = [1; 1; 255; 0; 3295867895; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0005 :
  avoidanceCalc_fun [2; 0; 0; 2; 0; 0; 1461585734; 1488081395; 491460992]
  = [0; 0; 1461585734; 1488081395; 491460992; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0006 :
  avoidanceCalc_fun [2; 2; 1; 0; 3; 4; 2021610932; 3901575170; 1013579452]
  = [3; 3; 255; 0; 1013579452; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0007 :
  avoidanceCalc_fun [5; 1; 0; 1; 2; 0; 1181920670; 4255053180; 110684461]
  = [2; 2; 255; 0; 110684461; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0008 :
  avoidanceCalc_fun [7; 1; 0; 2; 3; 2; 3405359790; 2501251076; 2799583687]
  = [3; 3; 255; 0; 2799583687; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0009 :
  avoidanceCalc_fun [4; 0; 1; 0; 3; 4; 2730927896; 3245085510; 1050618699]
  = [3; 3; 255; 0; 1050618699; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0010 :
  avoidanceCalc_fun [7; 0; 0; 1; 2; 4; 1277173222; 4284837282; 1697597231]
  = [2; 2; 255; 0; 1697597231; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0011 :
  avoidanceCalc_fun [2; 1; 0; 2; 0; 3; 2962018220; 2746698577; 815430317]
  = [0; 0; 2962018220; 2746698577; 815430317; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0012 :
  avoidanceCalc_fun [5; 0; 1; 0; 2; 2; 1580560749; 616452591; 3811539727]
  = [1; 1; 255; 0; 3811539727; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0013 :
  avoidanceCalc_fun [4; 2; 0; 1; 3; 4; 4282808917; 531599710; 4009469808]
  = [3; 3; 255; 0; 4009469808; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0014 :
  avoidanceCalc_fun [4; 1; 1; 2; 2; 0; 3945171397; 268515021; 2257863886]
  = [2; 2; 255; 0; 2257863886; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0015 :
  avoidanceCalc_fun [0; 2; 1; 0; 2; 3; 56371716; 4048986395; 2253103312]
  = [2; 2; 255; 0; 2253103312; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0016 :
  avoidanceCalc_fun [5; 2; 0; 1; 3; 4; 3739037224; 2112552610; 1958326642]
  = [3; 3; 255; 0; 1958326642; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0017 :
  avoidanceCalc_fun [6; 3; 1; 2; 4; 0; 4241546411; 2888717819; 1551378740]
  = [4; 4; 255; 0; 1551378740; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0018 :
  avoidanceCalc_fun [4; 3; 0; 0; 1; 1; 2621168085; 841903100; 1579728667]
  = [2; 2; 255; 0; 1579728667; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0019 :
  avoidanceCalc_fun [6; 0; 1; 1; 3; 1; 3685396826; 1731509212; 266915014]
  = [3; 3; 255; 0; 266915014; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0020 :
  avoidanceCalc_fun [3; 0; 1; 2; 0; 1; 2366047913; 1642271603; 2977406040]
  = [0; 0; 2366047913; 1642271603; 2977406040; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0021 :
  avoidanceCalc_fun [5; 1; 0; 0; 4; 3; 3819395573; 3612684048; 4089855209]
  = [4; 4; 255; 0; 4089855209; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0022 :
  avoidanceCalc_fun [3; 0; 1; 1; 3; 1; 2902068500; 1911644318; 281803970]
  = [3; 3; 255; 0; 281803970; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0023 :
  avoidanceCalc_fun [1; 3; 0; 2; 1; 3; 4006799978; 757970221; 1996629974]
  = [1; 1; 255; 0; 1996629974; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0024 :
  avoidanceCalc_fun [7; 3; 0; 0; 0; 0; 2453364412; 3548659683; 1084647523]
  = [2; 2; 255; 0; 1084647523; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0025 :
  avoidanceCalc_fun [5; 1; 1; 1; 4; 2; 2929729431; 2723593429; 2002953571]
  = [4; 4; 255; 0; 2002953571; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0026 :
  avoidanceCalc_fun [5; 0; 1; 2; 1; 3; 892302350; 44991783; 2953758873]
  = [1; 1; 255; 0; 2953758873; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0027 :
  avoidanceCalc_fun [3; 1; 0; 0; 3; 0; 4010083463; 1925219462; 3325016255]
  = [3; 3; 255; 0; 3325016255; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0028 :
  avoidanceCalc_fun [0; 1; 1; 1; 2; 4; 2832666704; 465160795; 3580721219]
  = [2; 2; 255; 0; 3580721219; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0029 :
  avoidanceCalc_fun [6; 0; 1; 2; 4; 0; 4037430171; 1684060658; 3097047978]
  = [4; 4; 255; 0; 3097047978; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0030 :
  avoidanceCalc_fun [2; 1; 0; 0; 4; 3; 2983533728; 1055643606; 3500312781]
  = [4; 4; 255; 0; 3500312781; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0031 :
  avoidanceCalc_fun [2; 3; 0; 1; 4; 4; 3726312812; 3739990495; 2023019206]
  = [1; 1; 255; 0; 2023019206; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0032 :
  avoidanceCalc_fun [3; 3; 0; 2; 4; 3; 260799044; 77792907; 1561485189]
  = [4; 4; 255; 0; 1561485189; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0033 :
  avoidanceCalc_fun [6; 0; 0; 0; 2; 0; 2799348753; 159519890; 3421530721]
  = [2; 2; 255; 0; 3421530721; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0034 :
  avoidanceCalc_fun [6; 2; 1; 1; 2; 2; 3835750818; 3389704999; 841437767]
  = [2; 2; 3835750818; 3389704999; 841437767; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0035 :
  avoidanceCalc_fun [2; 1; 0; 2; 4; 4; 3802090910; 1368202474; 4036684460]
  = [4; 4; 3802090910; 1368202474; 4036684460; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0036 :
  avoidanceCalc_fun [1; 0; 0; 0; 0; 3; 2012170832; 1543191761; 3889933414]
  = [0; 0; 2012170832; 1543191761; 3889933414; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0037 :
  avoidanceCalc_fun [5; 1; 0; 1; 0; 3; 4169434850; 976588099; 1499015932]
  = [0; 0; 4169434850; 976588099; 1499015932; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0038 :
  avoidanceCalc_fun [0; 1; 1; 2; 0; 3; 3645060510; 2198996670; 306652108]
  = [0; 0; 3645060510; 2198996670; 306652108; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0039 :
  avoidanceCalc_fun [6; 1; 1; 0; 3; 3; 3220928476; 2105524885; 2659333746]
  = [3; 3; 3220928476; 2105524885; 2659333746; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0040 :
  avoidanceCalc_fun [4; 1; 1; 1; 3; 2; 2343933810; 1351181608; 2735864196]
  = [3; 3; 255; 0; 2735864196; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0041 :
  avoidanceCalc_fun [6; 1; 0; 2; 1; 3; 2211145847; 353349604; 2711470024]
  = [1; 1; 255; 0; 2711470024; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0042 :
  avoidanceCalc_fun [2; 2; 0; 0; 2; 3; 51584192; 946212633; 430395210]
  = [2; 2; 255; 0; 430395210; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0043 :
  avoidanceCalc_fun [6; 3; 1; 1; 1; 0; 121349509; 1894916061; 4041258808]
  = [1; 1; 255; 0; 4041258808; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0044 :
  avoidanceCalc_fun [0; 0; 1; 2; 0; 0; 1674006162; 3524080882; 2794146912]
  = [0; 0; 1674006162; 3524080882; 2794146912; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0045 :
  avoidanceCalc_fun [5; 3; 0; 0; 2; 4; 3145397872; 2463367161; 3855184260]
  = [2; 2; 255; 0; 3855184260; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0046 :
  avoidanceCalc_fun [0; 3; 1; 1; 0; 2; 1070485288; 2538289095; 1684285740]
  = [0; 0; 1070485288; 2538289095; 1684285740; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0047 :
  avoidanceCalc_fun [3; 2; 0; 2; 1; 4; 2591027220; 2326221833; 4215645337]
  = [1; 1; 255; 0; 4215645337; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0048 :
  avoidanceCalc_fun [3; 1; 1; 0; 1; 0; 266326540; 1097710907; 962707747]
  = [1; 1; 255; 0; 962707747; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0049 :
  avoidanceCalc_fun [1; 1; 0; 1; 4; 1; 3568698089; 1112838304; 2847329163]
  = [4; 4; 255; 0; 2847329163; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0050 :
  avoidanceCalc_fun [4; 0; 0; 2; 2; 0; 2614968621; 304784432; 19498244]
  = [2; 2; 255; 0; 19498244; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0051 :
  avoidanceCalc_fun [6; 3; 0; 0; 3; 2; 272791850; 3651357247; 2577478131]
  = [2; 2; 272791850; 3651357247; 2577478131; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0052 :
  avoidanceCalc_fun [6; 0; 1; 1; 4; 3; 3767204980; 1438540354; 2610067777]
  = [4; 4; 255; 0; 2610067777; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0053 :
  avoidanceCalc_fun [2; 2; 0; 2; 0; 1; 3681324618; 501722850; 710306195]
  = [0; 0; 3681324618; 501722850; 710306195; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0054 :
  avoidanceCalc_fun [5; 3; 1; 0; 4; 2; 1670877122; 181090746; 579274496]
  = [1; 1; 255; 0; 579274496; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0055 :
  avoidanceCalc_fun [1; 3; 0; 1; 2; 1; 299877699; 1178417962; 2114591490]
  = [2; 2; 255; 0; 2114591490; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0056 :
  avoidanceCalc_fun [6; 2; 0; 2; 1; 3; 2926210971; 2031397296; 1598120395]
  = [1; 1; 255; 0; 1598120395; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0057 :
  avoidanceCalc_fun [5; 3; 1; 0; 0; 3; 2980964513; 2064736820; 1790300597]
  = [1; 1; 255; 0; 1790300597; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0058 :
  avoidanceCalc_fun [6; 1; 1; 1; 0; 4; 719391411; 3130190825; 1001824652]
  = [0; 0; 719391411; 3130190825; 1001824652; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0059 :
  avoidanceCalc_fun [6; 2; 0; 2; 4; 3; 1936830637; 2247584208; 23576253]
  = [4; 4; 255; 0; 23576253; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0060 :
  avoidanceCalc_fun [1; 3; 0; 0; 2; 3; 70705755; 2462037794; 1629361731]
  = [2; 2; 255; 0; 1629361731; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0061 :
  avoidanceCalc_fun [4; 3; 1; 1; 1; 0; 1423373431; 2791707705; 2952665418]
  = [1; 1; 255; 0; 2952665418; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0062 :
  avoidanceCalc_fun [4; 2; 0; 2; 4; 4; 3631785735; 4226943486; 2572740523]
  = [4; 4; 3631785735; 4226943486; 2572740523; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0063 :
  avoidanceCalc_fun [7; 0; 0; 0; 1; 3; 455960872; 2407934399; 575900021]
  = [1; 1; 255; 0; 575900021; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0064 :
  avoidanceCalc_fun [6; 0; 1; 1; 4; 3; 3968007526; 284981649; 807047303]
  = [4; 4; 255; 0; 807047303; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0065 :
  avoidanceCalc_fun [5; 1; 1; 2; 0; 2; 1592524830; 3113799277; 1104123313]
  = [0; 0; 1592524830; 3113799277; 1104123313; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0066 :
  avoidanceCalc_fun [7; 0; 0; 0; 0; 2; 2050292164; 741187232; 2030517368]
  = [0; 0; 2050292164; 741187232; 2030517368; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0067 :
  avoidanceCalc_fun [6; 2; 0; 1; 0; 4; 2192643177; 3579616848; 2922234755]
  = [0; 0; 2192643177; 3579616848; 2922234755; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0068 :
  avoidanceCalc_fun [0; 0; 0; 2; 2; 0; 29589937; 3177528484; 2549922540]
  = [2; 2; 255; 0; 2549922540; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0069 :
  avoidanceCalc_fun [1; 2; 0; 0; 3; 4; 3601970119; 2741599795; 1879913995]
  = [3; 3; 255; 0; 1879913995; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0070 :
  avoidanceCalc_fun [6; 1; 0; 1; 3; 4; 2614558332; 1396441035; 1750901397]
  = [1; 1; 255; 0; 1750901397; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0071 :
  avoidanceCalc_fun [4; 1; 1; 2; 4; 2; 1772066558; 2928270102; 3557257571]
  = [4; 4; 255; 0; 3557257571; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0072 :
  avoidanceCalc_fun [2; 3; 0; 0; 2; 2; 4042696278; 2592371266; 706684806]
  = [2; 2; 4042696278; 2592371266; 706684806; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0073 :
  avoidanceCalc_fun [3; 3; 1; 1; 4; 4; 1365156711; 762212952; 1998635762]
  = [4; 4; 1365156711; 762212952; 1998635762; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0074 :
  avoidanceCalc_fun [4; 3; 1; 2; 4; 2; 4122288309; 3916783660; 2588019053]
  = [4; 4; 255; 0; 2588019053; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0075 :
  avoidanceCalc_fun [7; 2; 0; 0; 1; 2; 1914768740; 1971724250; 3721848229]
  = [2; 2; 1914768740; 1971724250; 3721848229; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0076 :
  avoidanceCalc_fun [0; 2; 1; 1; 2; 4; 2498084948; 964306075; 2067196265]
  = [2; 2; 255; 0; 2067196265; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0077 :
  avoidanceCalc_fun [6; 3; 1; 2; 4; 3; 448398741; 490240599; 2715454269]
  = [4; 4; 255; 0; 2715454269; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0078 :
  avoidanceCalc_fun [5; 0; 1; 0; 2; 2; 90757062; 2744504330; 844716025]
  = [1; 1; 255; 0; 844716025; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0079 :
  avoidanceCalc_fun [4; 2; 1; 1; 0; 2; 2157119483; 123581941; 1467285842]
  = [0; 0; 2157119483; 123581941; 1467285842; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0080 :
  avoidanceCalc_fun [5; 0; 0; 2; 1; 2; 1331944375; 876257082; 2351803278]
  = [1; 1; 255; 0; 2351803278; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0081 :
  avoidanceCalc_fun [3; 3; 1; 0; 4; 1; 2761400630; 1706673364; 303365037]
  = [1; 1; 2761400630; 1706673364; 303365037; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0082 :
  avoidanceCalc_fun [5; 1; 1; 1; 1; 1; 4247174999; 335393448; 1287643139]
  = [1; 1; 4247174999; 335393448; 1287643139; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0083 :
  avoidanceCalc_fun [6; 3; 1; 2; 4; 0; 3862794976; 2336570403; 4230466817]
  = [4; 4; 255; 0; 4230466817; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0084 :
  avoidanceCalc_fun [3; 2; 1; 0; 4; 3; 1531496542; 2199922264; 254610542]
  = [1; 1; 255; 0; 254610542; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0085 :
  avoidanceCalc_fun [2; 1; 1; 1; 4; 1; 3873884368; 224080507; 2703447532]
  = [4; 4; 255; 0; 2703447532; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0086 :
  avoidanceCalc_fun [5; 2; 1; 2; 0; 4; 3818500466; 2926441124; 288355384]
  = [0; 0; 3818500466; 2926441124; 288355384; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0087 :
  avoidanceCalc_fun [2; 2; 0; 0; 0; 1; 1085379879; 2141047589; 3002614078]
  = [0; 0; 1085379879; 2141047589; 3002614078; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0088 :
  avoidanceCalc_fun [1; 2; 0; 1; 2; 0; 1868274820; 3356377313; 2217059942]
  = [2; 2; 255; 0; 2217059942; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0089 :
  avoidanceCalc_fun [5; 3; 1; 2; 0; 3; 3504108100; 2606030790; 504228207]
  = [0; 0; 3504108100; 2606030790; 504228207; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0090 :
  avoidanceCalc_fun [4; 2; 0; 0; 4; 2; 3760859840; 3163517430; 1262658207]
  = [2; 2; 3760859840; 3163517430; 1262658207; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0091 :
  avoidanceCalc_fun [1; 3; 0; 1; 4; 0; 3795304047; 3686411843; 772378671]
  = [4; 4; 255; 0; 772378671; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0092 :
  avoidanceCalc_fun [0; 1; 0; 2; 1; 2; 3951689897; 2868475969; 2595287178]
  = [1; 1; 255; 0; 2595287178; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0093 :
  avoidanceCalc_fun [0; 3; 0; 0; 2; 3; 2317267089; 422600085; 3851147287]
  = [2; 2; 255; 0; 3851147287; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0094 :
  avoidanceCalc_fun [6; 3; 1; 1; 1; 1; 4153362968; 2348460887; 560357088]
  = [1; 1; 4153362968; 2348460887; 560357088; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0095 :
  avoidanceCalc_fun [4; 3; 1; 2; 4; 3; 676233382; 2535731002; 1919157944]
  = [4; 4; 255; 0; 1919157944; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0096 :
  avoidanceCalc_fun [0; 2; 0; 0; 2; 2; 243028887; 2514285791; 3709187451]
  = [2; 2; 243028887; 2514285791; 3709187451; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0097 :
  avoidanceCalc_fun [0; 1; 0; 1; 1; 1; 590912514; 4058597404; 1411138749]
  = [1; 1; 590912514; 4058597404; 1411138749; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0098 :
  avoidanceCalc_fun [3; 0; 0; 2; 0; 3; 229846209; 2639793356; 988943403]
  = [0; 0; 229846209; 2639793356; 988943403; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0099 :
  avoidanceCalc_fun [3; 0; 0; 0; 1; 1; 1019444718; 3744288486; 4162764510]
  = [1; 1; 1019444718; 3744288486; 4162764510; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0100 :
  avoidanceCalc_fun [0; 1; 0; 1; 1; 2; 2902674083; 2980743107; 3637498869]
  = [1; 1; 255; 0; 3637498869; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0101 :
  avoidanceCalc_fun [3; 2; 0; 2; 0; 2; 1427431477; 4009701422; 2032502347]
  = [0; 0; 1427431477; 4009701422; 2032502347; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0102 :
  avoidanceCalc_fun [4; 2; 0; 0; 1; 3; 995679475; 1216068717; 4025113211]
  = [2; 2; 255; 0; 4025113211; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0103 :
  avoidanceCalc_fun [5; 2; 1; 1; 0; 3; 2823658779; 396313244; 2407231240]
  = [0; 0; 2823658779; 396313244; 2407231240; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0104 :
  avoidanceCalc_fun [3; 3; 0; 2; 4; 4; 214295711; 1232749597; 1535664599]
  = [4; 4; 214295711; 1232749597; 1535664599; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0105 :
  avoidanceCalc_fun [0; 2; 1; 0; 1; 3; 450511542; 3008468684; 3821407226]
  = [1; 1; 255; 0; 3821407226; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0106 :
  avoidanceCalc_fun [6; 2; 0; 1; 0; 4; 175028722; 3355400038; 1410379469]
  = [0; 0; 175028722; 3355400038; 1410379469; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0107 :
  avoidanceCalc_fun [0; 1; 0; 2; 2; 0; 3823599403; 2663082105; 2822554930]
  = [2; 2; 255; 0; 2822554930; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0108 :
  avoidanceCalc_fun [3; 3; 0; 0; 0; 1; 148490023; 16037062; 3879051033]
  = [0; 0; 148490023; 16037062; 3879051033; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0109 :
  avoidanceCalc_fun [1; 3; 0; 1; 4; 4; 1063370800; 1465104359; 4192879485]
  = [4; 4; 1063370800; 1465104359; 4192879485; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0110 :
  avoidanceCalc_fun [0; 2; 1; 2; 1; 4; 4216829050; 514803021; 1550062590]
  = [1; 1; 255; 0; 1550062590; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0111 :
  avoidanceCalc_fun [3; 0; 0; 0; 4; 3; 4010442877; 2005479071; 132670702]
  = [4; 4; 255; 0; 132670702; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0112 :
  avoidanceCalc_fun [6; 0; 1; 1; 3; 1; 69099226; 4211494615; 2284410737]
  = [3; 3; 255; 0; 2284410737; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0113 :
  avoidanceCalc_fun [3; 0; 1; 2; 3; 2; 2506163293; 3042915319; 307771190]
  = [3; 3; 255; 0; 307771190; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0114 :
  avoidanceCalc_fun [4; 2; 0; 0; 2; 4; 2003367041; 2593257309; 2536192677]
  = [2; 2; 255; 0; 2536192677; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0115 :
  avoidanceCalc_fun [4; 3; 0; 1; 1; 3; 4170355578; 1855558285; 2515127213]
  = [1; 1; 255; 0; 2515127213; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0116 :
  avoidanceCalc_fun [1; 3; 0; 2; 4; 1; 890874380; 262130822; 2594836333]
  = [4; 4; 255; 0; 2594836333; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0117 :
  avoidanceCalc_fun [3; 1; 1; 0; 3; 2; 781316161; 2948948482; 3410723433]
  = [1; 1; 255; 0; 3410723433; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0118 :
  avoidanceCalc_fun [6; 3; 0; 1; 0; 2; 4057869124; 2290897759; 588027853]
  = [1; 1; 255; 0; 588027853; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0119 :
  avoidanceCalc_fun [5; 2; 1; 2; 0; 3; 538799852; 317187577; 867746923]
  = [0; 0; 538799852; 317187577; 867746923; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0120 :
  avoidanceCalc_fun [5; 2; 0; 0; 4; 1; 1904656941; 3356516386; 1178421599]
  = [2; 2; 255; 0; 1178421599; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0121 :
  avoidanceCalc_fun [5; 0; 0; 1; 3; 0; 2133775195; 2704402604; 2478744569]
  = [3; 3; 255; 0; 2478744569; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0122 :
  avoidanceCalc_fun [2; 0; 1; 2; 4; 3; 3432236521; 1410503774; 498953874]
  = [4; 4; 255; 0; 498953874; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0123 :
  avoidanceCalc_fun [4; 2; 1; 0; 4; 4; 1153280723; 605754965; 720713481]
  = [4; 4; 1153280723; 605754965; 720713481; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0124 :
  avoidanceCalc_fun [2; 3; 0; 1; 3; 2; 3182842346; 3630157221; 1717859293]
  = [1; 1; 255; 0; 1717859293; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0125 :
  avoidanceCalc_fun [4; 1; 0; 2; 4; 4; 2233809001; 1970324519; 2272453523]
  = [4; 4; 2233809001; 1970324519; 2272453523; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0126 :
  avoidanceCalc_fun [0; 2; 1; 0; 0; 2; 3971239047; 3747964677; 139446812]
  = [0; 0; 3971239047; 3747964677; 139446812; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0127 :
  avoidanceCalc_fun [4; 2; 0; 1; 0; 0; 4253566769; 399501518; 2991886233]
  = [0; 0; 4253566769; 399501518; 2991886233; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0128 :
  avoidanceCalc_fun [2; 1; 0; 2; 3; 2; 2370716110; 3761215978; 4270330645]
  = [3; 3; 255; 0; 4270330645; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0129 :
  avoidanceCalc_fun [5; 3; 0; 0; 4; 0; 3292727256; 3945914075; 1579720319]
  = [2; 2; 255; 0; 1579720319; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0130 :
  avoidanceCalc_fun [1; 0; 1; 1; 1; 1; 1268113618; 4264327326; 585867279]
  = [1; 1; 1268113618; 4264327326; 585867279; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0131 :
  avoidanceCalc_fun [6; 1; 0; 2; 4; 3; 4215451149; 2294819485; 555019253]
  = [4; 4; 255; 0; 555019253; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0132 :
  avoidanceCalc_fun [5; 2; 0; 0; 1; 0; 977941872; 716864238; 1943020334]
  = [2; 2; 255; 0; 1943020334; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0133 :
  avoidanceCalc_fun [1; 1; 1; 1; 3; 1; 326532868; 4286377522; 3164316114]
  = [3; 3; 255; 0; 3164316114; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0134 :
  avoidanceCalc_fun [4; 1; 0; 2; 3; 2; 3808860102; 4275356605; 2869140417]
  = [3; 3; 255; 0; 2869140417; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0135 :
  avoidanceCalc_fun [0; 0; 0; 0; 2; 1; 3738680503; 3566430969; 1959498885]
  = [2; 2; 255; 0; 1959498885; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0136 :
  avoidanceCalc_fun [0; 0; 1; 1; 1; 0; 2615680614; 768882093; 641148354]
  = [1; 1; 255; 0; 641148354; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0137 :
  avoidanceCalc_fun [1; 1; 0; 2; 1; 3; 2362107880; 1110244591; 327340144]
  = [1; 1; 255; 0; 327340144; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0138 :
  avoidanceCalc_fun [5; 3; 1; 0; 4; 3; 3668654804; 2721176935; 1979659458]
  = [1; 1; 255; 0; 1979659458; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0139 :
  avoidanceCalc_fun [5; 3; 0; 1; 3; 0; 2826534569; 1005421483; 2479898179]
  = [3; 3; 255; 0; 2479898179; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0140 :
  avoidanceCalc_fun [4; 3; 0; 2; 2; 3; 1392963168; 520487943; 1180521554]
  = [2; 2; 255; 0; 1180521554; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0141 :
  avoidanceCalc_fun [6; 3; 1; 0; 3; 0; 2637455552; 1590613076; 3303210142]
  = [3; 3; 255; 0; 3303210142; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0142 :
  avoidanceCalc_fun [3; 1; 0; 1; 1; 2; 303179727; 2211699340; 2682416622]
  = [1; 1; 255; 0; 2682416622; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0143 :
  avoidanceCalc_fun [1; 3; 1; 2; 3; 0; 3224594629; 999585582; 3587633950]
  = [3; 3; 255; 0; 3587633950; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0144 :
  avoidanceCalc_fun [0; 1; 0; 0; 2; 3; 3714962456; 979141175; 1383300722]
  = [2; 2; 255; 0; 1383300722; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0145 :
  avoidanceCalc_fun [3; 0; 1; 1; 4; 4; 2220452403; 386797069; 2000530215]
  = [4; 4; 2220452403; 386797069; 2000530215; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0146 :
  avoidanceCalc_fun [1; 0; 1; 2; 0; 3; 1488235092; 4265083174; 2255720833]
  = [0; 0; 1488235092; 4265083174; 2255720833; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0147 :
  avoidanceCalc_fun [7; 3; 1; 0; 3; 2; 3343028222; 983411578; 444950193]
  = [1; 1; 255; 0; 444950193; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0148 :
  avoidanceCalc_fun [7; 2; 0; 1; 3; 1; 301831591; 3361087276; 2633854027]
  = [3; 3; 255; 0; 2633854027; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0149 :
  avoidanceCalc_fun [2; 2; 1; 2; 0; 4; 4135007886; 2389823240; 3444865373]
  = [0; 0; 4135007886; 2389823240; 3444865373; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0150 :
  avoidanceCalc_fun [3; 3; 0; 0; 4; 3; 4181628926; 2103385351; 2063627648]
  = [4; 4; 255; 0; 2063627648; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0151 :
  avoidanceCalc_fun [0; 0; 0; 1; 3; 3; 2548030029; 3323934039; 229145325]
  = [3; 3; 2548030029; 3323934039; 229145325; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0152 :
  avoidanceCalc_fun [7; 2; 0; 2; 4; 1; 955226991; 1439062622; 1456710034]
  = [4; 4; 255; 0; 1456710034; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0153 :
  avoidanceCalc_fun [3; 1; 1; 0; 3; 4; 3502927979; 2828184035; 527947695]
  = [1; 1; 255; 0; 527947695; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0154 :
  avoidanceCalc_fun [1; 0; 0; 1; 3; 0; 3386203043; 458923892; 3880415912]
  = [3; 3; 255; 0; 3880415912; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0155 :
  avoidanceCalc_fun [7; 1; 1; 2; 0; 3; 4045464226; 1570859945; 2993255097]
  = [0; 0; 4045464226; 1570859945; 2993255097; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0156 :
  avoidanceCalc_fun [2; 2; 1; 0; 0; 2; 2849173183; 1853211226; 1039810869]
  = [0; 0; 2849173183; 1853211226; 1039810869; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0157 :
  avoidanceCalc_fun [7; 3; 0; 1; 3; 1; 837458302; 3918157546; 2409726110]
  = [1; 1; 837458302; 3918157546; 2409726110; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0158 :
  avoidanceCalc_fun [7; 1; 0; 2; 0; 0; 2890711542; 2962792948; 32849266]
  = [0; 0; 2890711542; 2962792948; 32849266; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0159 :
  avoidanceCalc_fun [4; 0; 1; 0; 2; 2; 3671690483; 3947815642; 3977797164]
  = [2; 2; 3671690483; 3947815642; 3977797164; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0160 :
  avoidanceCalc_fun [5; 0; 1; 1; 4; 2; 3463690177; 2204901109; 101949688]
  = [4; 4; 255; 0; 101949688; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0161 :
  avoidanceCalc_fun [4; 2; 0; 2; 0; 0; 3671069778; 3378603856; 1411603423]
  = [0; 0; 3671069778; 3378603856; 1411603423; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0162 :
  avoidanceCalc_fun [5; 0; 1; 0; 3; 0; 3389297214; 43149035; 917330413]
  = [1; 1; 255; 0; 917330413; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0163 :
  avoidanceCalc_fun [7; 3; 1; 1; 4; 3; 2326721993; 851810879; 168502736]
  = [4; 4; 255; 0; 168502736; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0164 :
  avoidanceCalc_fun [4; 1; 1; 2; 4; 1; 1705536748; 336022235; 4244254954]
  = [4; 4; 255; 0; 4244254954; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0165 :
  avoidanceCalc_fun [7; 0; 1; 0; 1; 3; 2054977628; 1618274506; 1639534775]
  = [1; 1; 255; 0; 1639534775; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0166 :
  avoidanceCalc_fun [4; 0; 1; 1; 1; 1; 1820348159; 2330239376; 3654107708]
  = [1; 1; 1820348159; 2330239376; 3654107708; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0167 :
  avoidanceCalc_fun [6; 3; 0; 2; 3; 2; 922515017; 469220361; 3224271437]
  = [3; 3; 255; 0; 3224271437; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0168 :
  avoidanceCalc_fun [5; 2; 1; 0; 4; 4; 2699619971; 3378146244; 1354591809]
  = [1; 1; 255; 0; 1354591809; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0169 :
  avoidanceCalc_fun [6; 3; 0; 1; 4; 4; 1414035400; 1520794785; 1575210386]
  = [1; 1; 255; 0; 1575210386; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0170 :
  avoidanceCalc_fun [1; 2; 1; 2; 4; 4; 2361802201; 2257589802; 3038650500]
  = [4; 4; 2361802201; 2257589802; 3038650500; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0171 :
  avoidanceCalc_fun [4; 1; 1; 0; 1; 4; 2019645488; 1692524318; 3800944079]
  = [1; 1; 255; 0; 3800944079; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0172 :
  avoidanceCalc_fun [3; 0; 0; 1; 0; 2; 3390089433; 3865461284; 2670945040]
  = [0; 0; 3390089433; 3865461284; 2670945040; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0173 :
  avoidanceCalc_fun [5; 1; 0; 2; 1; 0; 1729135813; 4166273591; 82075082]
  = [1; 1; 255; 0; 82075082; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0174 :
  avoidanceCalc_fun [5; 1; 0; 0; 2; 2; 2445829505; 2321767070; 2076874043]
  = [2; 2; 2445829505; 2321767070; 2076874043; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0175 :
  avoidanceCalc_fun [1; 3; 1; 1; 0; 4; 1637484464; 547312023; 195525158]
  = [0; 0; 1637484464; 547312023; 195525158; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0176 :
  avoidanceCalc_fun [6; 1; 0; 2; 1; 1; 147315632; 4257849144; 1411405637]
  = [1; 1; 147315632; 4257849144; 1411405637; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0177 :
  avoidanceCalc_fun [5; 1; 1; 0; 2; 0; 1185675061; 2106326887; 4253281544]
  = [1; 1; 255; 0; 4253281544; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0178 :
  avoidanceCalc_fun [0; 3; 0; 1; 2; 3; 2280710640; 502280332; 4125508812]
  = [2; 2; 255; 0; 4125508812; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0179 :
  avoidanceCalc_fun [2; 2; 0; 2; 4; 2; 3444655772; 3186123023; 2058350517]
  = [4; 4; 255; 0; 2058350517; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0180 :
  avoidanceCalc_fun [5; 3; 1; 0; 3; 0; 2409055012; 3054966396; 739616600]
  = [1; 1; 255; 0; 739616600; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0181 :
  avoidanceCalc_fun [1; 3; 1; 1; 3; 3; 2434846992; 2663789155; 857942972]
  = [3; 3; 2434846992; 2663789155; 857942972; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0182 :
  avoidanceCalc_fun [6; 0; 0; 2; 0; 1; 2769433945; 3795255652; 1300089589]
  = [0; 0; 2769433945; 3795255652; 1300089589; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0183 :
  avoidanceCalc_fun [1; 0; 0; 0; 4; 0; 1188918788; 1954477637; 3003511417]
  = [4; 4; 255; 0; 3003511417; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0184 :
  avoidanceCalc_fun [2; 2; 0; 1; 2; 1; 4230905067; 1858404405; 4084554212]
  = [2; 2; 255; 0; 4084554212; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0185 :
  avoidanceCalc_fun [1; 3; 0; 2; 4; 0; 1735848565; 1487646808; 32008402]
  = [4; 4; 255; 0; 32008402; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0186 :
  avoidanceCalc_fun [5; 1; 1; 0; 3; 1; 2374901244; 4074556370; 2678010847]
  = [1; 1; 2374901244; 4074556370; 2678010847; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0187 :
  avoidanceCalc_fun [0; 0; 0; 1; 1; 2; 607944919; 2161023292; 3409663847]
  = [1; 1; 255; 0; 3409663847; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0188 :
  avoidanceCalc_fun [6; 1; 1; 2; 3; 3; 2516921470; 666011526; 4263191587]
  = [3; 3; 2516921470; 666011526; 4263191587; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0189 :
  avoidanceCalc_fun [4; 0; 1; 0; 0; 2; 4055410563; 86664533; 285346115]
  = [0; 0; 4055410563; 86664533; 285346115; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0190 :
  avoidanceCalc_fun [6; 3; 1; 1; 4; 2; 2477142765; 540468696; 480509040]
  = [4; 4; 255; 0; 480509040; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0191 :
  avoidanceCalc_fun [1; 1; 0; 2; 1; 1; 1233761344; 1059260754; 2502306688]
  = [1; 1; 1233761344; 1059260754; 2502306688; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0192 :
  avoidanceCalc_fun [2; 1; 0; 0; 1; 4; 211298384; 770423976; 372119707]
  = [1; 1; 255; 0; 372119707; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0193 :
  avoidanceCalc_fun [5; 2; 1; 1; 0; 2; 989212391; 3233600784; 2285272097]
  = [0; 0; 989212391; 3233600784; 2285272097; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0194 :
  avoidanceCalc_fun [4; 2; 0; 2; 4; 3; 2874566880; 650165887; 3756340458]
  = [4; 4; 255; 0; 3756340458; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0195 :
  avoidanceCalc_fun [5; 3; 0; 0; 2; 1; 1306826287; 3252367984; 3323741587]
  = [2; 2; 255; 0; 3323741587; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0196 :
  avoidanceCalc_fun [2; 0; 1; 1; 4; 2; 2856667002; 2266710254; 1625704512]
  = [4; 4; 255; 0; 1625704512; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0197 :
  avoidanceCalc_fun [2; 3; 1; 2; 4; 1; 2194995690; 2040187922; 868827127]
  = [4; 4; 255; 0; 868827127; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0198 :
  avoidanceCalc_fun [5; 2; 0; 0; 3; 2; 2241453464; 194072291; 3251106314]
  = [2; 2; 2241453464; 194072291; 3251106314; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0199 :
  avoidanceCalc_fun [1; 3; 0; 1; 0; 3; 2492637168; 4180697651; 1660473545]
  = [0; 0; 2492637168; 4180697651; 1660473545; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0200 :
  avoidanceCalc_fun [6; 1; 0; 2; 4; 2; 667676850; 39843808; 1733849754]
  = [4; 4; 255; 0; 1733849754; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0201 :
  avoidanceCalc_fun [4; 0; 0; 0; 0; 1; 3804257087; 3604531566; 4215175322]
  = [0; 0; 3804257087; 3604531566; 4215175322; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0202 :
  avoidanceCalc_fun [7; 2; 0; 1; 0; 4; 4063894077; 954548091; 2599502602]
  = [0; 0; 4063894077; 954548091; 2599502602; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0203 :
  avoidanceCalc_fun [2; 1; 0; 2; 2; 1; 2577433087; 862602661; 485441354]
  = [2; 2; 255; 0; 485441354; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0204 :
  avoidanceCalc_fun [2; 3; 1; 0; 1; 3; 4162859855; 1070697276; 3137362427]
  = [1; 1; 255; 0; 3137362427; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0205 :
  avoidanceCalc_fun [4; 2; 1; 1; 4; 0; 2807799654; 821173248; 995908950]
  = [4; 4; 255; 0; 995908950; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0206 :
  avoidanceCalc_fun [3; 3; 0; 2; 4; 4; 1953248836; 632301242; 1504210561]
  = [4; 4; 1953248836; 632301242; 1504210561; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0207 :
  avoidanceCalc_fun [6; 2; 1; 0; 2; 4; 2600994035; 3360156565; 3261977519]
  = [2; 2; 255; 0; 3261977519; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0208 :
  avoidanceCalc_fun [4; 3; 0; 1; 2; 4; 3319047188; 2012492453; 1190796205]
  = [2; 2; 255; 0; 1190796205; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0209 :
  avoidanceCalc_fun [6; 2; 1; 2; 1; 3; 1459185052; 747801869; 1065475322]
  = [1; 1; 255; 0; 1065475322; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0210 :
  avoidanceCalc_fun [7; 1; 1; 0; 3; 2; 563491857; 1761224209; 493221269]
  = [1; 1; 255; 0; 493221269; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0211 :
  avoidanceCalc_fun [1; 2; 1; 1; 0; 2; 2122720343; 288994796; 2869845906]
  = [0; 0; 2122720343; 288994796; 2869845906; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0212 :
  avoidanceCalc_fun [0; 2; 0; 2; 1; 2; 3036910081; 477850086; 1181409814]
  = [1; 1; 255; 0; 1181409814; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0213 :
  avoidanceCalc_fun [0; 3; 0; 0; 2; 3; 3815619189; 3852593204; 3516309150]
  = [2; 2; 255; 0; 3516309150; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0214 :
  avoidanceCalc_fun [6; 0; 1; 1; 0; 0; 1352128487; 933202597; 2210327017]
  = [0; 0; 1352128487; 933202597; 2210327017; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0215 :
  avoidanceCalc_fun [3; 0; 1; 2; 4; 3; 2289331911; 929263411; 531124119]
  = [4; 4; 255; 0; 531124119; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0216 :
  avoidanceCalc_fun [2; 1; 1; 0; 1; 0; 3447839238; 1160845372; 1061738875]
  = [1; 1; 255; 0; 1061738875; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0217 :
  avoidanceCalc_fun [1; 2; 1; 1; 2; 1; 55839208; 2900458882; 1948916144]
  = [2; 2; 255; 0; 1948916144; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0218 :
  avoidanceCalc_fun [5; 2; 0; 2; 2; 0; 4172903218; 75095512; 725916492]
  = [2; 2; 255; 0; 725916492; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0219 :
  avoidanceCalc_fun [5; 0; 0; 0; 2; 2; 3417606978; 596239491; 2117919977]
  = [2; 2; 3417606978; 596239491; 2117919977; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0220 :
  avoidanceCalc_fun [2; 3; 1; 1; 1; 2; 2004758019; 1292182192; 1645912933]
  = [1; 1; 255; 0; 1645912933; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0221 :
  avoidanceCalc_fun [7; 3; 1; 2; 0; 1; 1843740160; 892106043; 2807886262]
  = [0; 0; 1843740160; 892106043; 2807886262; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0222 :
  avoidanceCalc_fun [0; 2; 1; 0; 2; 4; 4260498655; 3285564260; 2802821469]
  = [2; 2; 255; 0; 2802821469; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0223 :
  avoidanceCalc_fun [4; 3; 1; 1; 1; 0; 2083718511; 3500587363; 2563468776]
  = [1; 1; 255; 0; 2563468776; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0224 :
  avoidanceCalc_fun [5; 0; 0; 2; 1; 4; 3933621032; 3346737028; 2338831877]
  = [1; 1; 255; 0; 2338831877; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0225 :
  avoidanceCalc_fun [1; 0; 1; 0; 3; 2; 3501268590; 1465272771; 548118502]
  = [1; 1; 255; 0; 548118502; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0226 :
  avoidanceCalc_fun [3; 0; 0; 1; 3; 4; 2548938418; 2353661111; 1950053632]
  = [3; 3; 255; 0; 1950053632; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0227 :
  avoidanceCalc_fun [2; 2; 1; 2; 1; 2; 3302955081; 3399182857; 169130661]
  = [1; 1; 255; 0; 169130661; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0228 :
  avoidanceCalc_fun [5; 0; 0; 0; 4; 3; 521982524; 276266217; 785999580]
  = [4; 4; 255; 0; 785999580; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0229 :
  avoidanceCalc_fun [1; 0; 1; 1; 1; 0; 2422595521; 3983992172; 3194104048]
  = [1; 1; 255; 0; 3194104048; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0230 :
  avoidanceCalc_fun [2; 1; 0; 2; 1; 4; 272881071; 875555653; 286748390]
  = [1; 1; 255; 0; 286748390; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0231 :
  avoidanceCalc_fun [2; 1; 0; 0; 4; 4; 1158807415; 3882520103; 793439160]
  = [4; 4; 1158807415; 3882520103; 793439160; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0232 :
  avoidanceCalc_fun [0; 3; 1; 1; 2; 1; 1035845886; 2008990206; 4272918795]
  = [2; 2; 255; 0; 4272918795; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0233 :
  avoidanceCalc_fun [5; 2; 1; 2; 1; 2; 2920576368; 1014552241; 148147498]
  = [1; 1; 255; 0; 148147498; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0234 :
  avoidanceCalc_fun [2; 0; 0; 0; 0; 1; 1824253214; 3533286354; 3167275520]
  = [0; 0; 1824253214; 3533286354; 3167275520; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0235 :
  avoidanceCalc_fun [6; 2; 1; 1; 1; 1; 263288017; 849489579; 110069233]
  = [1; 1; 263288017; 849489579; 110069233; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0236 :
  avoidanceCalc_fun [3; 2; 1; 2; 2; 3; 3323136767; 3407736277; 4017238603]
  = [2; 2; 255; 0; 4017238603; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0237 :
  avoidanceCalc_fun [6; 1; 1; 0; 4; 4; 102754055; 3699088090; 4123559699]
  = [4; 4; 102754055; 3699088090; 4123559699; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0238 :
  avoidanceCalc_fun [2; 1; 0; 1; 0; 1; 421655801; 3777225005; 3476640954]
  = [1; 1; 421655801; 3777225005; 3476640954; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0239 :
  avoidanceCalc_fun [7; 0; 0; 2; 3; 0; 3194929669; 1796533398; 346853299]
  = [3; 3; 255; 0; 346853299; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0240 :
  avoidanceCalc_fun [5; 2; 1; 0; 1; 0; 1926364626; 1255851316; 854298394]
  = [1; 1; 255; 0; 854298394; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0241 :
  avoidanceCalc_fun [7; 3; 0; 1; 2; 0; 1758488494; 4028623311; 3687481147]
  = [1; 1; 255; 0; 3687481147; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0242 :
  avoidanceCalc_fun [2; 3; 1; 2; 2; 0; 894237466; 2983682427; 1492546800]
  = [2; 2; 255; 0; 1492546800; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0243 :
  avoidanceCalc_fun [3; 3; 0; 0; 3; 1; 1691004474; 3403423487; 2264011164]
  = [3; 3; 255; 0; 2264011164; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0244 :
  avoidanceCalc_fun [5; 3; 1; 1; 0; 4; 3691828254; 2099082602; 3893152671]
  = [0; 0; 3691828254; 2099082602; 3893152671; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0245 :
  avoidanceCalc_fun [2; 3; 1; 2; 4; 2; 3456268387; 47084361; 870210728]
  = [4; 4; 255; 0; 870210728; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0246 :
  avoidanceCalc_fun [1; 3; 0; 0; 0; 4; 3088260458; 3625269923; 268033077]
  = [0; 0; 3088260458; 3625269923; 268033077; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0247 :
  avoidanceCalc_fun [3; 2; 0; 1; 0; 2; 1993573933; 2722862626; 4175908296]
  = [0; 0; 1993573933; 2722862626; 4175908296; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0248 :
  avoidanceCalc_fun [4; 1; 0; 2; 3; 0; 688312966; 1512741946; 2437599878]
  = [3; 3; 255; 0; 2437599878; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0249 :
  avoidanceCalc_fun [5; 3; 1; 0; 0; 4; 1179504297; 2757512438; 1832042255]
  = [1; 1; 255; 0; 1832042255; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0250 :
  avoidanceCalc_fun [1; 3; 0; 1; 0; 1; 1634497377; 2022914218; 4275978448]
  = [0; 0; 1634497377; 2022914218; 4275978448; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0251 :
  avoidanceCalc_fun [2; 3; 1; 2; 3; 3; 3052707148; 3303815112; 602210900]
  = [3; 3; 3052707148; 3303815112; 602210900; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0252 :
  avoidanceCalc_fun [1; 1; 1; 0; 1; 0; 2428002711; 3430504014; 1703912226]
  = [1; 1; 255; 0; 1703912226; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0253 :
  avoidanceCalc_fun [6; 0; 1; 1; 2; 3; 3138725953; 325627342; 3672958858]
  = [2; 2; 255; 0; 3672958858; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0254 :
  avoidanceCalc_fun [2; 0; 1; 2; 2; 1; 3996770084; 1392594737; 4253052646]
  = [2; 2; 255; 0; 4253052646; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0255 :
  avoidanceCalc_fun [0; 2; 0; 0; 3; 0; 2337023656; 65314241; 4040095339]
  = [3; 3; 255; 0; 4040095339; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0256 :
  avoidanceCalc_fun [1; 3; 0; 1; 0; 1; 831423664; 2978071590; 3652767854]
  = [0; 0; 831423664; 2978071590; 3652767854; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0257 :
  avoidanceCalc_fun [4; 0; 0; 2; 1; 4; 926630308; 1866016069; 1915070621]
  = [1; 1; 255; 0; 1915070621; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0258 :
  avoidanceCalc_fun [3; 2; 0; 0; 0; 4; 3016321869; 2003135956; 3687507885]
  = [0; 0; 3016321869; 2003135956; 3687507885; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0259 :
  avoidanceCalc_fun [4; 2; 1; 1; 1; 2; 3228774094; 2613495419; 3059489752]
  = [1; 1; 255; 0; 3059489752; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0260 :
  avoidanceCalc_fun [6; 0; 0; 2; 4; 4; 124285156; 624293465; 3194976761]
  = [4; 4; 124285156; 624293465; 3194976761; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0261 :
  avoidanceCalc_fun [2; 3; 1; 0; 0; 3; 3811049947; 4221643147; 205504252]
  = [0; 0; 3811049947; 4221643147; 205504252; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0262 :
  avoidanceCalc_fun [6; 2; 0; 1; 3; 3; 3973647562; 8086180; 4060249216]
  = [3; 3; 3973647562; 8086180; 4060249216; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0263 :
  avoidanceCalc_fun [5; 3; 1; 2; 4; 1; 930283411; 3421924916; 1137570165]
  = [4; 4; 255; 0; 1137570165; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0264 :
  avoidanceCalc_fun [2; 1; 1; 0; 0; 2; 2163897648; 873692354; 3995535034]
  = [0; 0; 2163897648; 873692354; 3995535034; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0265 :
  avoidanceCalc_fun [1; 1; 0; 1; 0; 3; 3798839011; 214984618; 4274479599]
  = [0; 0; 3798839011; 214984618; 4274479599; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0266 :
  avoidanceCalc_fun [7; 0; 1; 2; 4; 0; 654900872; 3633985590; 3827187884]
  = [4; 4; 255; 0; 3827187884; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0267 :
  avoidanceCalc_fun [5; 0; 0; 0; 4; 2; 1669897087; 3473263003; 2069173211]
  = [4; 4; 255; 0; 2069173211; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0268 :
  avoidanceCalc_fun [4; 2; 1; 1; 3; 0; 2475328619; 4129867892; 3964228670]
  = [3; 3; 255; 0; 3964228670; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0269 :
  avoidanceCalc_fun [7; 0; 1; 2; 4; 0; 1697969329; 1561044541; 2876056619]
  = [4; 4; 255; 0; 2876056619; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0270 :
  avoidanceCalc_fun [6; 0; 0; 0; 4; 1; 2606971501; 1653226370; 719893301]
  = [4; 4; 255; 0; 719893301; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0271 :
  avoidanceCalc_fun [4; 1; 0; 1; 4; 3; 3255806961; 176078418; 1706429540]
  = [4; 4; 255; 0; 1706429540; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0272 :
  avoidanceCalc_fun [3; 3; 1; 2; 0; 1; 3351099613; 173234135; 403739082]
  = [0; 0; 3351099613; 173234135; 403739082; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0273 :
  avoidanceCalc_fun [7; 1; 1; 0; 0; 4; 89084259; 4127977606; 4126917727]
  = [1; 1; 255; 0; 4126917727; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0274 :
  avoidanceCalc_fun [3; 2; 1; 1; 1; 2; 3794519867; 3990511674; 3055441052]
  = [1; 1; 255; 0; 3055441052; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0275 :
  avoidanceCalc_fun [6; 3; 1; 2; 0; 2; 3964417373; 3655148529; 570371949]
  = [0; 0; 3964417373; 3655148529; 570371949; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0276 :
  avoidanceCalc_fun [4; 3; 1; 0; 4; 4; 2598781344; 2426914828; 2970713875]
  = [4; 4; 2598781344; 2426914828; 2970713875; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0277 :
  avoidanceCalc_fun [3; 2; 0; 1; 0; 4; 1437679767; 3244539184; 53777828]
  = [0; 0; 1437679767; 3244539184; 53777828; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0278 :
  avoidanceCalc_fun [7; 3; 0; 2; 3; 4; 3756150446; 1026784968; 1972479334]
  = [3; 3; 255; 0; 1972479334; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0279 :
  avoidanceCalc_fun [6; 2; 1; 0; 2; 0; 3424081583; 550193392; 3640196462]
  = [2; 2; 255; 0; 3640196462; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0280 :
  avoidanceCalc_fun [0; 2; 1; 1; 3; 3; 915704583; 1564328778; 942999142]
  = [3; 3; 915704583; 1564328778; 942999142; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0281 :
  avoidanceCalc_fun [2; 0; 1; 2; 4; 1; 2395972739; 2565179130; 3691065552]
  = [4; 4; 255; 0; 3691065552; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0282 :
  avoidanceCalc_fun [2; 3; 1; 0; 3; 3; 308678577; 3146352406; 3737283243]
  = [3; 3; 308678577; 3146352406; 3737283243; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0283 :
  avoidanceCalc_fun [0; 2; 0; 1; 1; 2; 2247718791; 2858098641; 3562056572]
  = [1; 1; 255; 0; 3562056572; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0284 :
  avoidanceCalc_fun [0; 3; 0; 2; 0; 4; 2714463748; 222750714; 1729858619]
  = [0; 0; 2714463748; 222750714; 1729858619; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0285 :
  avoidanceCalc_fun [5; 3; 0; 0; 0; 2; 864665058; 307244378; 1623254997]
  = [2; 2; 864665058; 307244378; 1623254997; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0286 :
  avoidanceCalc_fun [1; 0; 0; 1; 1; 4; 146346260; 3580314472; 994697171]
  = [1; 1; 255; 0; 994697171; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0287 :
  avoidanceCalc_fun [5; 2; 0; 2; 2; 3; 2794331008; 2585900375; 143642873]
  = [2; 2; 255; 0; 143642873; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0288 :
  avoidanceCalc_fun [4; 0; 0; 0; 0; 3; 415361671; 1173553987; 3282096888]
  = [0; 0; 415361671; 1173553987; 3282096888; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0289 :
  avoidanceCalc_fun [4; 0; 1; 1; 4; 2; 3609638070; 620081514; 1633089245]
  = [4; 4; 255; 0; 1633089245; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0290 :
  avoidanceCalc_fun [6; 0; 0; 2; 1; 2; 1019251025; 1254806474; 2692073772]
  = [1; 1; 255; 0; 2692073772; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0291 :
  avoidanceCalc_fun [3; 0; 0; 0; 3; 1; 2665961344; 507013373; 388443592]
  = [3; 3; 255; 0; 388443592; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0292 :
  avoidanceCalc_fun [7; 2; 0; 1; 1; 4; 21198668; 2576563844; 1064181446]
  = [1; 1; 255; 0; 1064181446; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0293 :
  avoidanceCalc_fun [3; 2; 0; 2; 3; 2; 1791703814; 3156229216; 33402154]
  = [3; 3; 255; 0; 33402154; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0294 :
  avoidanceCalc_fun [5; 0; 1; 0; 1; 1; 2395617481; 3935452510; 4209870368]
  = [1; 1; 2395617481; 3935452510; 4209870368; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0295 :
  avoidanceCalc_fun [5; 0; 0; 1; 0; 0; 1709946074; 2548209320; 3931579254]
  = [0; 0; 1709946074; 2548209320; 3931579254; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0296 :
  avoidanceCalc_fun [1; 0; 0; 2; 4; 1; 35997146; 669088310; 2970382747]
  = [4; 4; 255; 0; 2970382747; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0297 :
  avoidanceCalc_fun [4; 2; 0; 0; 4; 0; 1062136424; 1689591810; 676056283]
  = [2; 2; 255; 0; 676056283; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0298 :
  avoidanceCalc_fun [4; 1; 0; 1; 3; 0; 1780608085; 3411856727; 1839599437]
  = [3; 3; 255; 0; 1839599437; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0299 :
  avoidanceCalc_fun [4; 0; 0; 2; 3; 0; 3462685002; 1120634446; 4252239276]
  = [3; 3; 255; 0; 4252239276; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0300 :
  avoidanceCalc_fun [6; 1; 1; 0; 1; 1; 3314739646; 4110033593; 564263006]
  = [1; 1; 3314739646; 4110033593; 564263006; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0301 :
  avoidanceCalc_fun [1; 1; 1; 1; 1; 3; 2974597434; 2184685315; 1532515176]
  = [1; 1; 255; 0; 1532515176; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0302 :
  avoidanceCalc_fun [6; 3; 1; 2; 3; 3; 1334840228; 3724599741; 220432751]
  = [3; 3; 1334840228; 3724599741; 220432751; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0303 :
  avoidanceCalc_fun [0; 2; 1; 0; 1; 4; 1629484064; 1339653185; 3025484907]
  = [1; 1; 255; 0; 3025484907; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0304 :
  avoidanceCalc_fun [0; 1; 1; 1; 1; 3; 2133621654; 1666475914; 1419754099]
  = [1; 1; 255; 0; 1419754099; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0305 :
  avoidanceCalc_fun [1; 3; 1; 2; 4; 2; 217235597; 1031522245; 2861789542]
  = [4; 4; 255; 0; 2861789542; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0306 :
  avoidanceCalc_fun [5; 0; 0; 0; 2; 2; 3495489553; 2427168496; 2859215836]
  = [2; 2; 3495489553; 2427168496; 2859215836; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0307 :
  avoidanceCalc_fun [0; 2; 0; 1; 4; 2; 222758865; 1755500936; 959133240]
  = [4; 4; 255; 0; 959133240; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0308 :
  avoidanceCalc_fun [6; 3; 1; 2; 0; 2; 472020264; 116407139; 3152933570]
  = [0; 0; 472020264; 116407139; 3152933570; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0309 :
  avoidanceCalc_fun [1; 0; 1; 0; 0; 1; 1810839815; 1791847417; 3415199785]
  = [1; 1; 1810839815; 1791847417; 3415199785; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0310 :
  avoidanceCalc_fun [0; 0; 0; 1; 0; 2; 2226871511; 4109393889; 3575918971]
  = [0; 0; 2226871511; 4109393889; 3575918971; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0311 :
  avoidanceCalc_fun [4; 0; 1; 2; 3; 3; 1892721926; 2414444149; 2305915556]
  = [3; 3; 1892721926; 2414444149; 2305915556; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0312 :
  avoidanceCalc_fun [3; 0; 1; 0; 2; 3; 1742848153; 4177622971; 218539929]
  = [1; 1; 255; 0; 218539929; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0313 :
  avoidanceCalc_fun [4; 1; 0; 1; 0; 3; 1714435643; 1674268749; 4054382290]
  = [0; 0; 1714435643; 1674268749; 4054382290; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0314 :
  avoidanceCalc_fun [2; 3; 1; 2; 4; 3; 108424323; 1036655878; 2719206306]
  = [4; 4; 255; 0; 2719206306; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0315 :
  avoidanceCalc_fun [6; 0; 1; 0; 3; 2; 2032496327; 1502266758; 2374568695]
  = [3; 3; 255; 0; 2374568695; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0316 :
  avoidanceCalc_fun [4; 1; 0; 1; 1; 4; 4187548036; 745592341; 812770073]
  = [1; 1; 255; 0; 812770073; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0317 :
  avoidanceCalc_fun [0; 0; 1; 2; 0; 2; 3306403108; 1396260253; 3806663906]
  = [0; 0; 3306403108; 1396260253; 3806663906; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0318 :
  avoidanceCalc_fun [6; 0; 0; 0; 1; 0; 1283953461; 2401163407; 3658139572]
  = [1; 1; 255; 0; 3658139572; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0319 :
  avoidanceCalc_fun [1; 0; 0; 1; 1; 3; 1534415256; 3400483817; 548484903]
  = [1; 1; 255; 0; 548484903; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0320 :
  avoidanceCalc_fun [2; 1; 0; 2; 4; 4; 1901388901; 3861602045; 879083452]
  = [4; 4; 1901388901; 3861602045; 879083452; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0321 :
  avoidanceCalc_fun [1; 0; 0; 0; 1; 2; 1345743531; 1285982624; 3499996463]
  = [1; 1; 255; 0; 3499996463; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0322 :
  avoidanceCalc_fun [0; 0; 0; 1; 1; 3; 1053600518; 3956153204; 1630545630]
  = [1; 1; 255; 0; 1630545630; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0323 :
  avoidanceCalc_fun [5; 1; 1; 2; 1; 4; 4215947020; 2040762825; 3706195997]
  = [1; 1; 255; 0; 3706195997; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0324 :
  avoidanceCalc_fun [4; 0; 0; 0; 1; 1; 1160959268; 3561061576; 198091948]
  = [1; 1; 1160959268; 3561061576; 198091948; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0325 :
  avoidanceCalc_fun [0; 3; 1; 1; 2; 2; 1398582859; 3263251870; 2789858196]
  = [2; 2; 1398582859; 3263251870; 2789858196; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0326 :
  avoidanceCalc_fun [7; 1; 1; 2; 3; 0; 2521502666; 1472291295; 4156094665]
  = [3; 3; 255; 0; 4156094665; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0327 :
  avoidanceCalc_fun [1; 3; 1; 0; 1; 0; 527522680; 1616485824; 697028907]
  = [1; 1; 255; 0; 697028907; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0328 :
  avoidanceCalc_fun [3; 0; 0; 1; 4; 3; 1094486379; 3268239779; 473745862]
  = [4; 4; 255; 0; 473745862; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0329 :
  avoidanceCalc_fun [4; 1; 0; 2; 0; 4; 906498071; 3179232065; 985127901]
  = [0; 0; 906498071; 3179232065; 985127901; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0330 :
  avoidanceCalc_fun [5; 2; 0; 0; 3; 1; 2651143618; 1307722193; 1895819581]
  = [2; 2; 255; 0; 1895819581; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0331 :
  avoidanceCalc_fun [5; 0; 0; 1; 3; 4; 2496269634; 4147887938; 2402933996]
  = [3; 3; 255; 0; 2402933996; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0332 :
  avoidanceCalc_fun [7; 3; 0; 2; 2; 1; 2417338355; 3990244100; 4288783880]
  = [2; 2; 255; 0; 4288783880; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0333 :
  avoidanceCalc_fun [1; 1; 0; 0; 1; 2; 4254435802; 2948011515; 1201166984]
  = [1; 1; 255; 0; 1201166984; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0334 :
  avoidanceCalc_fun [5; 2; 0; 1; 0; 3; 3684971384; 1852213465; 78083880]
  = [0; 0; 3684971384; 1852213465; 78083880; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0335 :
  avoidanceCalc_fun [5; 1; 1; 2; 0; 0; 2372673405; 4260421055; 1586643357]
  = [0; 0; 2372673405; 4260421055; 1586643357; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0336 :
  avoidanceCalc_fun [6; 0; 0; 0; 0; 2; 1975654374; 256662792; 3417031190]
  = [0; 0; 1975654374; 256662792; 3417031190; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0337 :
  avoidanceCalc_fun [4; 1; 0; 1; 4; 3; 3258553626; 1340551237; 1433680250]
  = [4; 4; 255; 0; 1433680250; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0338 :
  avoidanceCalc_fun [2; 2; 0; 2; 0; 2; 3813603903; 2067790116; 4254796883]
  = [0; 0; 3813603903; 2067790116; 4254796883; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0339 :
  avoidanceCalc_fun [6; 1; 1; 0; 4; 1; 2989751197; 2995361751; 1925390002]
  = [4; 4; 255; 0; 1925390002; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0340 :
  avoidanceCalc_fun [7; 0; 1; 1; 2; 1; 3199309803; 1976141844; 3829272139]
  = [2; 2; 255; 0; 3829272139; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0341 :
  avoidanceCalc_fun [2; 3; 1; 2; 2; 1; 1325570080; 4109147539; 4020376174]
  = [2; 2; 255; 0; 4020376174; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0342 :
  avoidanceCalc_fun [0; 3; 1; 0; 4; 4; 2699148334; 3602288883; 3945920552]
  = [4; 4; 2699148334; 3602288883; 3945920552; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0343 :
  avoidanceCalc_fun [5; 1; 1; 1; 1; 3; 3678167483; 3491423564; 32188383]
  = [1; 1; 255; 0; 32188383; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0344 :
  avoidanceCalc_fun [0; 0; 0; 2; 4; 1; 2233961048; 109748446; 2398522707]
  = [4; 4; 255; 0; 2398522707; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0345 :
  avoidanceCalc_fun [7; 1; 0; 0; 0; 3; 1443911111; 544163103; 2568645769]
  = [0; 0; 1443911111; 544163103; 2568645769; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0346 :
  avoidanceCalc_fun [6; 2; 1; 1; 0; 0; 1864390529; 311148867; 3803114601]
  = [0; 0; 1864390529; 311148867; 3803114601; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0347 :
  avoidanceCalc_fun [7; 0; 1; 2; 1; 3; 2960347121; 2237118174; 1170961774]
  = [1; 1; 255; 0; 1170961774; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0348 :
  avoidanceCalc_fun [4; 1; 0; 0; 4; 0; 1440977486; 1698624526; 4215179865]
  = [4; 4; 255; 0; 4215179865; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0349 :
  avoidanceCalc_fun [3; 3; 0; 1; 3; 2; 546002030; 3027774556; 2856260708]
  = [1; 1; 255; 0; 2856260708; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0350 :
  avoidanceCalc_fun [2; 2; 1; 2; 3; 4; 657133397; 86196931; 753948075]
  = [3; 3; 255; 0; 753948075; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0351 :
  avoidanceCalc_fun [2; 3; 0; 0; 2; 1; 139548564; 1231050622; 4245149498]
  = [2; 2; 255; 0; 4245149498; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0352 :
  avoidanceCalc_fun [7; 2; 0; 1; 1; 0; 3540599666; 3754912900; 760990722]
  = [1; 1; 255; 0; 760990722; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0353 :
  avoidanceCalc_fun [5; 3; 0; 2; 3; 4; 1215922262; 3507312081; 3201090130]
  = [3; 3; 255; 0; 3201090130; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0354 :
  avoidanceCalc_fun [3; 3; 0; 0; 1; 2; 2459001773; 3459243204; 1995988622]
  = [1; 1; 255; 0; 1995988622; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0355 :
  avoidanceCalc_fun [3; 1; 0; 1; 1; 0; 2064861938; 3959825643; 1407553603]
  = [1; 1; 255; 0; 1407553603; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0356 :
  avoidanceCalc_fun [3; 3; 1; 2; 4; 1; 2801713411; 1287605038; 3291011716]
  = [4; 4; 255; 0; 3291011716; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0357 :
  avoidanceCalc_fun [3; 1; 0; 0; 4; 1; 3793539649; 403883470; 279947442]
  = [4; 4; 255; 0; 279947442; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0358 :
  avoidanceCalc_fun [7; 1; 1; 1; 4; 3; 1635018434; 2260409892; 49631205]
  = [4; 4; 255; 0; 49631205; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0359 :
  avoidanceCalc_fun [1; 2; 1; 2; 3; 2; 1640358261; 325314855; 2855612516]
  = [3; 3; 255; 0; 2855612516; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0360 :
  avoidanceCalc_fun [6; 1; 1; 0; 4; 4; 2953151900; 3887180295; 3097632078]
  = [4; 4; 2953151900; 3887180295; 3097632078; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0361 :
  avoidanceCalc_fun [1; 0; 1; 1; 2; 4; 1773495143; 4080938554; 3273287719]
  = [2; 2; 255; 0; 3273287719; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0362 :
  avoidanceCalc_fun [5; 2; 1; 2; 1; 4; 2221948462; 2877054306; 3343760277]
  = [1; 1; 255; 0; 3343760277; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0363 :
  avoidanceCalc_fun [4; 2; 0; 0; 3; 1; 4220969609; 1896428468; 2317391340]
  = [2; 2; 255; 0; 2317391340; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0364 :
  avoidanceCalc_fun [2; 3; 0; 1; 3; 0; 4113598346; 985219293; 1302551222]
  = [1; 1; 255; 0; 1302551222; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0365 :
  avoidanceCalc_fun [4; 3; 0; 2; 4; 4; 418285278; 631754303; 181312516]
  = [4; 4; 418285278; 631754303; 181312516; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0366 :
  avoidanceCalc_fun [5; 1; 0; 0; 1; 3; 4289401884; 1419232350; 3691086434]
  = [1; 1; 255; 0; 3691086434; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0367 :
  avoidanceCalc_fun [6; 3; 1; 1; 2; 1; 1969027901; 2647261694; 1768101312]
  = [2; 2; 255; 0; 1768101312; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0368 :
  avoidanceCalc_fun [5; 1; 0; 2; 3; 0; 2330590425; 1101822942; 2697813909]
  = [3; 3; 255; 0; 2697813909; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0369 :
  avoidanceCalc_fun [7; 2; 0; 0; 1; 1; 827513282; 1549627430; 1498996938]
  = [2; 2; 255; 0; 1498996938; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0370 :
  avoidanceCalc_fun [1; 1; 1; 1; 2; 4; 4287358202; 56683882; 1714550786]
  = [2; 2; 255; 0; 1714550786; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0371 :
  avoidanceCalc_fun [5; 2; 1; 2; 3; 3; 1328766080; 3574893966; 3133843643]
  = [3; 3; 1328766080; 3574893966; 3133843643; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0372 :
  avoidanceCalc_fun [5; 0; 1; 0; 2; 4; 309733818; 2220639431; 3558882129]
  = [1; 1; 255; 0; 3558882129; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0373 :
  avoidanceCalc_fun [4; 3; 1; 1; 3; 3; 4124765942; 2671463165; 3755425620]
  = [3; 3; 4124765942; 2671463165; 3755425620; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0374 :
  avoidanceCalc_fun [6; 3; 0; 2; 1; 1; 4093731911; 2415043577; 3658302266]
  = [1; 1; 4093731911; 2415043577; 3658302266; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0375 :
  avoidanceCalc_fun [1; 1; 1; 0; 4; 1; 3301598149; 292654307; 100334367]
  = [1; 1; 3301598149; 292654307; 100334367; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0376 :
  avoidanceCalc_fun [4; 2; 0; 1; 3; 0; 967462636; 217279295; 517148273]
  = [3; 3; 255; 0; 517148273; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0377 :
  avoidanceCalc_fun [6; 3; 1; 2; 1; 2; 3514384105; 3488908166; 3248520648]
  = [1; 1; 255; 0; 3248520648; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0378 :
  avoidanceCalc_fun [5; 2; 1; 0; 2; 0; 4243731295; 1536526864; 207276780]
  = [1; 1; 255; 0; 207276780; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0379 :
  avoidanceCalc_fun [0; 2; 0; 1; 4; 3; 137500018; 2201930341; 3227688027]
  = [4; 4; 255; 0; 3227688027; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0380 :
  avoidanceCalc_fun [1; 2; 1; 2; 0; 1; 2961162150; 1938929249; 360622838]
  = [0; 0; 2961162150; 1938929249; 360622838; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0381 :
  avoidanceCalc_fun [6; 3; 0; 0; 2; 4; 742328214; 1194908064; 3461741534]
  = [2; 2; 255; 0; 3461741534; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0382 :
  avoidanceCalc_fun [3; 2; 1; 1; 0; 1; 148558548; 2659892182; 4138622249]
  = [0; 0; 148558548; 2659892182; 4138622249; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0383 :
  avoidanceCalc_fun [2; 2; 1; 2; 2; 0; 1599958401; 3584450074; 2366473889]
  = [2; 2; 255; 0; 2366473889; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0384 :
  avoidanceCalc_fun [4; 0; 0; 0; 1; 4; 3999252307; 2626577611; 159538359]
  = [1; 1; 255; 0; 159538359; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0385 :
  avoidanceCalc_fun [0; 3; 1; 1; 2; 2; 387844111; 3219315579; 292058600]
  = [2; 2; 387844111; 3219315579; 292058600; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0386 :
  avoidanceCalc_fun [6; 3; 1; 2; 4; 3; 1919426788; 1286631433; 2041057641]
  = [4; 4; 255; 0; 2041057641; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0387 :
  avoidanceCalc_fun [0; 3; 0; 0; 1; 4; 1502543652; 1639567091; 2100744753]
  = [1; 1; 255; 0; 2100744753; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0388 :
  avoidanceCalc_fun [6; 2; 0; 1; 4; 1; 1715736220; 4265188575; 615848569]
  = [4; 4; 255; 0; 615848569; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0389 :
  avoidanceCalc_fun [3; 1; 0; 2; 3; 1; 2957948451; 3451404336; 1782645764]
  = [3; 3; 255; 0; 1782645764; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0390 :
  avoidanceCalc_fun [7; 3; 1; 0; 0; 3; 526050129; 3145418889; 1152610939]
  = [1; 1; 255; 0; 1152610939; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0391 :
  avoidanceCalc_fun [3; 1; 0; 1; 3; 3; 1228575527; 1467635319; 1715057672]
  = [1; 1; 255; 0; 1715057672; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0392 :
  avoidanceCalc_fun [5; 1; 1; 2; 3; 0; 2909764513; 3254492140; 2345583641]
  = [3; 3; 255; 0; 2345583641; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0393 :
  avoidanceCalc_fun [0; 3; 1; 0; 1; 3; 3681637451; 1840086181; 322900461]
  = [1; 1; 255; 0; 322900461; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0394 :
  avoidanceCalc_fun [2; 3; 0; 1; 4; 3; 3950188231; 1429211898; 2383998951]
  = [1; 1; 255; 0; 2383998951; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0395 :
  avoidanceCalc_fun [6; 0; 0; 2; 3; 0; 1128541510; 1553149228; 1654107034]
  = [3; 3; 255; 0; 1654107034; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0396 :
  avoidanceCalc_fun [1; 2; 1; 0; 3; 2; 3665530775; 699824121; 393140156]
  = [1; 1; 255; 0; 393140156; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0397 :
  avoidanceCalc_fun [4; 1; 0; 1; 0; 2; 3028125221; 3626615731; 2168188706]
  = [0; 0; 3028125221; 3626615731; 2168188706; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0398 :
  avoidanceCalc_fun [0; 2; 0; 2; 4; 3; 2359734029; 1766020229; 718034719]
  = [4; 4; 255; 0; 718034719; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0399 :
  avoidanceCalc_fun [0; 3; 0; 0; 2; 4; 2426450956; 1677194; 1483040455]
  = [2; 2; 255; 0; 1483040455; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0400 :
  avoidanceCalc_fun [4; 3; 1; 1; 0; 2; 3108115428; 452810549; 2725090800]
  = [0; 0; 3108115428; 452810549; 2725090800; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0401 :
  avoidanceCalc_fun [4; 2; 1; 2; 1; 4; 3414657869; 2627295650; 2337787079]
  = [1; 1; 255; 0; 2337787079; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0402 :
  avoidanceCalc_fun [0; 1; 1; 0; 2; 3; 3163734051; 791265211; 1896124691]
  = [2; 2; 255; 0; 1896124691; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0403 :
  avoidanceCalc_fun [7; 2; 0; 1; 2; 2; 2158107576; 1938632403; 1564078817]
  = [2; 2; 2158107576; 1938632403; 1564078817; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0404 :
  avoidanceCalc_fun [0; 3; 1; 2; 1; 4; 3128814903; 3185878596; 2901486667]
  = [1; 1; 255; 0; 2901486667; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0405 :
  avoidanceCalc_fun [5; 2; 0; 0; 2; 3; 260704189; 86507806; 2394057875]
  = [2; 2; 255; 0; 2394057875; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0406 :
  avoidanceCalc_fun [6; 0; 0; 1; 1; 0; 2526742138; 3918523094; 1741401571]
  = [1; 1; 255; 0; 1741401571; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0407 :
  avoidanceCalc_fun [6; 2; 0; 2; 1; 0; 1005291483; 53088250; 3525230324]
  = [1; 1; 255; 0; 3525230324; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0408 :
  avoidanceCalc_fun [0; 3; 1; 0; 3; 1; 3663481883; 2806649532; 2792836909]
  = [3; 3; 255; 0; 2792836909; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0409 :
  avoidanceCalc_fun [3; 1; 0; 1; 2; 3; 1794607524; 1107104216; 6344530]
  = [1; 1; 255; 0; 6344530; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0410 :
  avoidanceCalc_fun [1; 0; 0; 2; 1; 1; 869821178; 1222003848; 899805290]
  = [1; 1; 869821178; 1222003848; 899805290; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0411 :
  avoidanceCalc_fun [3; 1; 0; 0; 3; 1; 1878675687; 2162781043; 1888680721]
  = [3; 3; 255; 0; 1888680721; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0412 :
  avoidanceCalc_fun [5; 0; 1; 1; 0; 2; 4102336927; 2535739289; 2381473887]
  = [0; 0; 4102336927; 2535739289; 2381473887; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0413 :
  avoidanceCalc_fun [6; 3; 0; 2; 3; 1; 1870903325; 3847211991; 1524189102]
  = [3; 3; 255; 0; 1524189102; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0414 :
  avoidanceCalc_fun [0; 3; 0; 0; 3; 3; 591549431; 1072542649; 767637862]
  = [3; 3; 591549431; 1072542649; 767637862; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0415 :
  avoidanceCalc_fun [5; 3; 1; 1; 0; 0; 255686392; 345532144; 2512517368]
  = [0; 0; 255686392; 345532144; 2512517368; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0416 :
  avoidanceCalc_fun [7; 2; 0; 2; 4; 4; 2028844906; 73094508; 840494544]
  = [4; 4; 2028844906; 73094508; 840494544; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0417 :
  avoidanceCalc_fun [3; 0; 1; 0; 0; 1; 2368052538; 187429366; 3199965059]
  = [1; 1; 2368052538; 187429366; 3199965059; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0418 :
  avoidanceCalc_fun [4; 0; 0; 1; 2; 0; 2591273297; 305007720; 3374973096]
  = [2; 2; 255; 0; 3374973096; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0419 :
  avoidanceCalc_fun [5; 0; 1; 2; 2; 0; 1809891427; 160099181; 3109958199]
  = [2; 2; 255; 0; 3109958199; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0420 :
  avoidanceCalc_fun [6; 0; 1; 0; 3; 1; 1398870062; 866406606; 654104104]
  = [3; 3; 255; 0; 654104104; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0421 :
  avoidanceCalc_fun [5; 1; 1; 1; 1; 3; 1123403858; 550269929; 2475587555]
  = [1; 1; 255; 0; 2475587555; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0422 :
  avoidanceCalc_fun [5; 1; 0; 2; 3; 3; 2320864684; 1486510114; 889317742]
  = [3; 3; 2320864684; 1486510114; 889317742; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0423 :
  avoidanceCalc_fun [0; 0; 1; 0; 0; 0; 1480880983; 3988048396; 2829846721]
  = [0; 0; 1480880983; 3988048396; 2829846721; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0424 :
  avoidanceCalc_fun [6; 2; 0; 1; 2; 2; 1872226272; 4077751899; 1598083358]
  = [2; 2; 1872226272; 4077751899; 1598083358; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0425 :
  avoidanceCalc_fun [2; 1; 0; 2; 3; 4; 3070085553; 3214279808; 2937353139]
  = [3; 3; 255; 0; 2937353139; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0426 :
  avoidanceCalc_fun [3; 0; 0; 0; 3; 3; 431743697; 2388403978; 569623626]
  = [3; 3; 431743697; 2388403978; 569623626; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0427 :
  avoidanceCalc_fun [6; 1; 0; 1; 2; 3; 2813374497; 667880626; 3725499300]
  = [1; 1; 255; 0; 3725499300; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0428 :
  avoidanceCalc_fun [3; 0; 0; 2; 0; 2; 710346400; 3741906556; 3525019245]
  = [0; 0; 710346400; 3741906556; 3525019245; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0429 :
  avoidanceCalc_fun [4; 1; 1; 0; 2; 4; 4237616481; 2229265921; 1732985215]
  = [2; 2; 255; 0; 1732985215; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0430 :
  avoidanceCalc_fun [4; 1; 1; 1; 1; 2; 3944540730; 920556513; 2010693355]
  = [1; 1; 255; 0; 2010693355; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0431 :
  avoidanceCalc_fun [5; 3; 1; 2; 3; 1; 3830498582; 1491689789; 1983593802]
  = [3; 3; 255; 0; 1983593802; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0432 :
  avoidanceCalc_fun [3; 0; 0; 0; 0; 3; 1460995165; 150719614; 2011564695]
  = [0; 0; 1460995165; 150719614; 2011564695; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0433 :
  avoidanceCalc_fun [4; 0; 0; 1; 2; 3; 1107959504; 4058508032; 1132791132]
  = [2; 2; 255; 0; 1132791132; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0434 :
  avoidanceCalc_fun [0; 1; 1; 2; 0; 0; 505260019; 2410012929; 2374489247]
  = [0; 0; 505260019; 2410012929; 2374489247; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0435 :
  avoidanceCalc_fun [2; 2; 1; 0; 4; 4; 3852293680; 1010306416; 2069736397]
  = [4; 4; 3852293680; 1010306416; 2069736397; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0436 :
  avoidanceCalc_fun [1; 1; 1; 1; 0; 2; 1904481683; 1141607644; 175590830]
  = [0; 0; 1904481683; 1141607644; 175590830; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0437 :
  avoidanceCalc_fun [7; 2; 1; 2; 0; 3; 3560957238; 4044959661; 4003318159]
  = [0; 0; 3560957238; 4044959661; 4003318159; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0438 :
  avoidanceCalc_fun [0; 3; 1; 0; 0; 3; 4186130118; 2781982893; 325556080]
  = [0; 0; 4186130118; 2781982893; 325556080; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0439 :
  avoidanceCalc_fun [4; 2; 1; 1; 2; 2; 3013861560; 4164143510; 3348147147]
  = [2; 2; 3013861560; 4164143510; 3348147147; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0440 :
  avoidanceCalc_fun [3; 1; 1; 2; 4; 4; 3737956357; 3711460288; 2648462011]
  = [4; 4; 3737956357; 3711460288; 2648462011; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0441 :
  avoidanceCalc_fun [0; 1; 0; 0; 3; 0; 1727401673; 1936372432; 2459359337]
  = [3; 3; 255; 0; 2459359337; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0442 :
  avoidanceCalc_fun [5; 0; 1; 1; 1; 2; 2347907384; 792860714; 799092505]
  = [1; 1; 255; 0; 799092505; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0443 :
  avoidanceCalc_fun [0; 0; 1; 2; 3; 4; 620564484; 3128969906; 158856759]
  = [3; 3; 255; 0; 158856759; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0444 :
  avoidanceCalc_fun [7; 1; 1; 0; 4; 4; 1005865174; 437859242; 3975990256]
  = [1; 1; 255; 0; 3975990256; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0445 :
  avoidanceCalc_fun [7; 3; 0; 1; 4; 4; 179796074; 3033204895; 1031223491]
  = [1; 1; 255; 0; 1031223491; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0446 :
  avoidanceCalc_fun [0; 1; 0; 2; 1; 1; 2488773261; 3612011910; 1182745638]
  = [1; 1; 2488773261; 3612011910; 1182745638; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0447 :
  avoidanceCalc_fun [5; 3; 0; 0; 2; 1; 2812459221; 4025852183; 1483795339]
  = [2; 2; 255; 0; 1483795339; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0448 :
  avoidanceCalc_fun [1; 3; 1; 1; 0; 2; 2856616305; 1904751237; 3879217249]
  = [0; 0; 2856616305; 1904751237; 3879217249; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0449 :
  avoidanceCalc_fun [3; 2; 1; 2; 3; 2; 3482386384; 3165109352; 1195524685]
  = [3; 3; 255; 0; 1195524685; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0450 :
  avoidanceCalc_fun [5; 1; 0; 0; 1; 0; 2458938148; 403800401; 3613749766]
  = [1; 1; 255; 0; 3613749766; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0451 :
  avoidanceCalc_fun [5; 1; 0; 1; 2; 2; 2967623974; 820130656; 1022798166]
  = [2; 2; 2967623974; 820130656; 1022798166; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0452 :
  avoidanceCalc_fun [0; 2; 0; 2; 0; 1; 2689481004; 3571534915; 1684685805]
  = [0; 0; 2689481004; 3571534915; 1684685805; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0453 :
  avoidanceCalc_fun [3; 2; 0; 0; 4; 2; 767625055; 2222292745; 3920407882]
  = [4; 4; 255; 0; 3920407882; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0454 :
  avoidanceCalc_fun [4; 2; 0; 1; 3; 0; 2992872023; 2337100805; 421797342]
  = [3; 3; 255; 0; 421797342; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0455 :
  avoidanceCalc_fun [7; 0; 0; 2; 2; 1; 3292199222; 2910057037; 2005443166]
  = [2; 2; 255; 0; 2005443166; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0456 :
  avoidanceCalc_fun [2; 0; 0; 0; 2; 0; 4121688725; 2044026923; 2573982481]
  = [2; 2; 255; 0; 2573982481; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0457 :
  avoidanceCalc_fun [2; 0; 1; 1; 3; 1; 2735018494; 24626120; 860624598]
  = [3; 3; 255; 0; 860624598; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0458 :
  avoidanceCalc_fun [0; 3; 1; 2; 2; 0; 3215890982; 645782547; 2163717817]
  = [2; 2; 255; 0; 2163717817; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0459 :
  avoidanceCalc_fun [0; 0; 1; 0; 3; 4; 2972230561; 753678507; 3531662901]
  = [3; 3; 255; 0; 3531662901; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0460 :
  avoidanceCalc_fun [0; 1; 0; 1; 4; 3; 2393534256; 2809933983; 3142755459]
  = [4; 4; 255; 0; 3142755459; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0461 :
  avoidanceCalc_fun [3; 3; 0; 2; 4; 3; 1711073305; 1807992591; 4191209988]
  = [4; 4; 255; 0; 4191209988; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0462 :
  avoidanceCalc_fun [5; 2; 0; 0; 4; 3; 2112075952; 513540072; 3548136431]
  = [2; 2; 255; 0; 3548136431; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0463 :
  avoidanceCalc_fun [2; 1; 1; 1; 2; 1; 2958949625; 2340950658; 1374756293]
  = [2; 2; 255; 0; 1374756293; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0464 :
  avoidanceCalc_fun [3; 1; 1; 2; 3; 4; 873546775; 1098128715; 1859718944]
  = [3; 3; 255; 0; 1859718944; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0465 :
  avoidanceCalc_fun [4; 0; 1; 0; 3; 3; 2185054779; 1087809138; 1667267745]
  = [3; 3; 2185054779; 1087809138; 1667267745; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0466 :
  avoidanceCalc_fun [5; 1; 0; 1; 2; 0; 1596381965; 2233055084; 91993321]
  = [2; 2; 255; 0; 91993321; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0467 :
  avoidanceCalc_fun [2; 3; 1; 2; 1; 1; 1010445491; 2952824412; 2074367462]
  = [1; 1; 1010445491; 2952824412; 2074367462; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0468 :
  avoidanceCalc_fun [1; 2; 1; 0; 4; 2; 856483262; 3640815182; 1817084743]
  = [1; 1; 255; 0; 1817084743; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0469 :
  avoidanceCalc_fun [5; 3; 1; 1; 1; 4; 3770728480; 696106486; 4095583580]
  = [1; 1; 255; 0; 4095583580; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0470 :
  avoidanceCalc_fun [6; 3; 1; 2; 3; 1; 377085840; 205623882; 2110356575]
  = [3; 3; 255; 0; 2110356575; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0471 :
  avoidanceCalc_fun [5; 0; 0; 0; 2; 0; 4138257502; 3214746778; 2468327892]
  = [2; 2; 255; 0; 2468327892; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0472 :
  avoidanceCalc_fun [7; 1; 0; 1; 0; 0; 1338252040; 1201765926; 3245346784]
  = [1; 1; 255; 0; 3245346784; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0473 :
  avoidanceCalc_fun [4; 1; 0; 2; 3; 4; 3246526180; 1140909498; 328653126]
  = [3; 3; 255; 0; 328653126; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0474 :
  avoidanceCalc_fun [2; 3; 0; 0; 3; 2; 580258441; 233125154; 1945320787]
  = [3; 3; 255; 0; 1945320787; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0475 :
  avoidanceCalc_fun [6; 1; 1; 1; 3; 4; 1450037014; 969309919; 1435288696]
  = [3; 3; 255; 0; 1435288696; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0476 :
  avoidanceCalc_fun [5; 3; 1; 2; 1; 3; 1668555731; 3731884953; 1122214682]
  = [1; 1; 255; 0; 1122214682; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0477 :
  avoidanceCalc_fun [5; 0; 1; 0; 1; 0; 4263426582; 1224479015; 1193799295]
  = [1; 1; 255; 0; 1193799295; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0478 :
  avoidanceCalc_fun [3; 0; 0; 1; 0; 2; 4133295823; 503086618; 874564649]
  = [0; 0; 4133295823; 503086618; 874564649; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0479 :
  avoidanceCalc_fun [3; 2; 0; 2; 1; 0; 67330739; 3937875562; 731955838]
  = [1; 1; 255; 0; 731955838; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0480 :
  avoidanceCalc_fun [0; 3; 1; 0; 1; 2; 664130183; 3331163435; 1291122184]
  = [1; 1; 255; 0; 1291122184; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0481 :
  avoidanceCalc_fun [7; 2; 1; 1; 3; 2; 1568809913; 1714334971; 2075059109]
  = [3; 3; 255; 0; 2075059109; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0482 :
  avoidanceCalc_fun [2; 1; 0; 2; 0; 1; 276290946; 295720611; 3627009783]
  = [0; 0; 276290946; 295720611; 3627009783; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0483 :
  avoidanceCalc_fun [6; 1; 1; 0; 0; 3; 1496917746; 1701252062; 2018387521]
  = [0; 0; 1496917746; 1701252062; 2018387521; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0484 :
  avoidanceCalc_fun [0; 3; 0; 1; 3; 2; 1675839979; 1034139847; 3685299366]
  = [3; 3; 255; 0; 3685299366; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0485 :
  avoidanceCalc_fun [0; 2; 1; 2; 2; 3; 3407270061; 2292933573; 277956034]
  = [2; 2; 255; 0; 277956034; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0486 :
  avoidanceCalc_fun [5; 3; 0; 0; 4; 3; 767527983; 771673804; 3937681241]
  = [2; 2; 255; 0; 3937681241; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0487 :
  avoidanceCalc_fun [2; 0; 0; 1; 3; 1; 368314901; 2585471457; 3542718526]
  = [3; 3; 255; 0; 3542718526; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0488 :
  avoidanceCalc_fun [7; 2; 1; 2; 1; 1; 2323662991; 2182627920; 1024512360]
  = [1; 1; 2323662991; 2182627920; 1024512360; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0489 :
  avoidanceCalc_fun [1; 3; 0; 0; 0; 2; 140721334; 2988776389; 3389765250]
  = [0; 0; 140721334; 2988776389; 3389765250; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0490 :
  avoidanceCalc_fun [0; 2; 0; 1; 3; 4; 2884563611; 1248366593; 1515879594]
  = [3; 3; 255; 0; 1515879594; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0491 :
  avoidanceCalc_fun [1; 2; 1; 2; 1; 0; 3518423930; 2340910938; 3739548983]
  = [1; 1; 255; 0; 3739548983; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0492 :
  avoidanceCalc_fun [7; 0; 0; 0; 2; 2; 2887274983; 792386582; 3238480196]
  = [2; 2; 2887274983; 792386582; 3238480196; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0493 :
  avoidanceCalc_fun [5; 1; 0; 1; 2; 1; 3639906009; 3817406356; 1175445591]
  = [2; 2; 255; 0; 1175445591; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0494 :
  avoidanceCalc_fun [3; 0; 1; 2; 3; 1; 3334144809; 3619122982; 701479554]
  = [3; 3; 255; 0; 701479554; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0495 :
  avoidanceCalc_fun [7; 3; 0; 0; 1; 2; 529791617; 2189329322; 3938535163]
  = [2; 2; 529791617; 2189329322; 3938535163; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0496 :
  avoidanceCalc_fun [0; 3; 0; 1; 0; 0; 521742871; 1834449788; 2778342242]
  = [0; 0; 521742871; 1834449788; 2778342242; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0497 :
  avoidanceCalc_fun [6; 2; 1; 2; 4; 2; 1312380963; 1167415367; 275132665]
  = [4; 4; 255; 0; 275132665; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0498 :
  avoidanceCalc_fun [4; 1; 1; 0; 2; 0; 3190413952; 1321480121; 2253564907]
  = [2; 2; 255; 0; 2253564907; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0499 :
  avoidanceCalc_fun [7; 2; 1; 1; 4; 1; 4194964087; 1845852515; 2465240575]
  = [4; 4; 255; 0; 2465240575; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0500 :
  avoidanceCalc_fun [1; 2; 0; 2; 1; 2; 2608772408; 532565180; 921669601]
  = [1; 1; 255; 0; 921669601; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0501 :
  avoidanceCalc_fun [3; 3; 0; 0; 3; 4; 408705494; 2676152806; 498008921]
  = [3; 3; 255; 0; 498008921; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0502 :
  avoidanceCalc_fun [2; 0; 0; 1; 1; 4; 2339955998; 1118211332; 3119535552]
  = [1; 1; 255; 0; 3119535552; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0503 :
  avoidanceCalc_fun [2; 3; 1; 2; 0; 4; 301152949; 637777498; 3017710426]
  = [0; 0; 301152949; 637777498; 3017710426; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0504 :
  avoidanceCalc_fun [5; 3; 1; 0; 3; 2; 3456554885; 3378170980; 616347233]
  = [1; 1; 255; 0; 616347233; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0505 :
  avoidanceCalc_fun [4; 2; 1; 1; 1; 1; 868891066; 2294189750; 3707409068]
  = [1; 1; 868891066; 2294189750; 3707409068; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0506 :
  avoidanceCalc_fun [0; 2; 1; 2; 2; 1; 427765705; 577993660; 3760753035]
  = [2; 2; 255; 0; 3760753035; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0507 :
  avoidanceCalc_fun [7; 1; 0; 0; 3; 3; 2633896171; 2769976291; 1579152066]
  = [3; 3; 2633896171; 2769976291; 1579152066; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0508 :
  avoidanceCalc_fun [2; 0; 0; 1; 3; 3; 1082391646; 3531805630; 1210939189]
  = [3; 3; 1082391646; 3531805630; 1210939189; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0509 :
  avoidanceCalc_fun [1; 0; 1; 2; 2; 2; 2687634174; 2349387624; 2908851645]
  = [2; 2; 2687634174; 2349387624; 2908851645; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0510 :
  avoidanceCalc_fun [0; 1; 1; 0; 3; 3; 1945012659; 1005114639; 1139442252]
  = [3; 3; 1945012659; 1005114639; 1139442252; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0511 :
  avoidanceCalc_fun [7; 1; 1; 1; 1; 0; 2716833319; 1930660633; 1149360885]
  = [1; 1; 255; 0; 1149360885; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0512 :
  avoidanceCalc_fun [3; 2; 0; 2; 2; 2; 3786647177; 3566690208; 1338243898]
  = [2; 2; 3786647177; 3566690208; 1338243898; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0513 :
  avoidanceCalc_fun [0; 1; 1; 0; 2; 3; 696316077; 308580598; 3379673172]
  = [2; 2; 255; 0; 3379673172; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0514 :
  avoidanceCalc_fun [0; 3; 1; 1; 3; 2; 3043548257; 3210389612; 1424017050]
  = [3; 3; 255; 0; 1424017050; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0515 :
  avoidanceCalc_fun [1; 3; 1; 2; 3; 4; 615728026; 3556047082; 2038557435]
  = [3; 3; 255; 0; 2038557435; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0516 :
  avoidanceCalc_fun [6; 0; 0; 0; 4; 2; 1803053880; 650890993; 3773549591]
  = [4; 4; 255; 0; 3773549591; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0517 :
  avoidanceCalc_fun [7; 2; 1; 1; 0; 0; 749879693; 1743086832; 1223813691]
  = [0; 0; 749879693; 1743086832; 1223813691; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0518 :
  avoidanceCalc_fun [0; 3; 0; 2; 1; 4; 2608243621; 584743315; 2735711552]
  = [1; 1; 255; 0; 2735711552; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0519 :
  avoidanceCalc_fun [6; 1; 1; 0; 2; 3; 3783858724; 3457841113; 760851144]
  = [2; 2; 255; 0; 760851144; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0520 :
  avoidanceCalc_fun [3; 1; 0; 1; 2; 4; 1666000020; 2179369370; 2144225100]
  = [1; 1; 255; 0; 2144225100; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0521 :
  avoidanceCalc_fun [6; 3; 1; 2; 3; 1; 409409867; 2190151968; 12738803]
  = [3; 3; 255; 0; 12738803; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0522 :
  avoidanceCalc_fun [3; 1; 1; 0; 4; 1; 2323879321; 4160887335; 3974189990]
  = [1; 1; 2323879321; 4160887335; 3974189990; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0523 :
  avoidanceCalc_fun [3; 3; 1; 1; 2; 2; 4197798464; 4148075267; 207323170]
  = [2; 2; 4197798464; 4148075267; 207323170; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0524 :
  avoidanceCalc_fun [5; 0; 0; 2; 1; 1; 2686606064; 1455277166; 2315035042]
  = [1; 1; 2686606064; 1455277166; 2315035042; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0525 :
  avoidanceCalc_fun [7; 1; 1; 0; 0; 4; 3396867428; 1990306981; 477196146]
  = [1; 1; 255; 0; 477196146; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0526 :
  avoidanceCalc_fun [1; 2; 0; 1; 0; 1; 543816128; 2303274872; 1232632135]
  = [0; 0; 543816128; 2303274872; 1232632135; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0527 :
  avoidanceCalc_fun [4; 3; 1; 2; 0; 4; 908413462; 1896427086; 2880835671]
  = [0; 0; 908413462; 1896427086; 2880835671; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0528 :
  avoidanceCalc_fun [4; 1; 0; 0; 4; 4; 2816561922; 2214780247; 344630402]
  = [4; 4; 2816561922; 2214780247; 344630402; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0529 :
  avoidanceCalc_fun [0; 2; 0; 1; 4; 4; 2723029137; 268147781; 2422672153]
  = [4; 4; 2723029137; 268147781; 2422672153; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0530 :
  avoidanceCalc_fun [4; 3; 1; 2; 4; 3; 2422555904; 3183171823; 3453550433]
  = [4; 4; 255; 0; 3453550433; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0531 :
  avoidanceCalc_fun [4; 2; 0; 0; 4; 3; 864467717; 1284777195; 1173882957]
  = [2; 2; 255; 0; 1173882957; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0532 :
  avoidanceCalc_fun [7; 0; 1; 1; 3; 3; 917477793; 4074228463; 402599614]
  = [3; 3; 917477793; 4074228463; 402599614; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0533 :
  avoidanceCalc_fun [5; 0; 0; 2; 4; 1; 347175280; 2912531390; 3403171649]
  = [4; 4; 255; 0; 3403171649; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0534 :
  avoidanceCalc_fun [0; 0; 0; 0; 3; 3; 4142954291; 2236840053; 1887811454]
  = [3; 3; 4142954291; 2236840053; 1887811454; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0535 :
  avoidanceCalc_fun [7; 0; 0; 1; 0; 0; 1445461428; 3001987226; 2094332562]
  = [0; 0; 1445461428; 3001987226; 2094332562; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0536 :
  avoidanceCalc_fun [3; 1; 1; 2; 1; 4; 5423315; 2384676447; 2870280329]
  = [1; 1; 255; 0; 2870280329; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0537 :
  avoidanceCalc_fun [4; 0; 1; 0; 2; 2; 3534210524; 2141131647; 4130739395]
  = [2; 2; 3534210524; 2141131647; 4130739395; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0538 :
  avoidanceCalc_fun [2; 3; 0; 1; 0; 0; 4263025568; 1519508126; 1985846014]
  = [1; 1; 255; 0; 1985846014; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0539 :
  avoidanceCalc_fun [2; 2; 1; 2; 0; 3; 2272181342; 2562079540; 177911016]
  = [0; 0; 2272181342; 2562079540; 177911016; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0540 :
  avoidanceCalc_fun [2; 0; 1; 0; 1; 2; 3066997529; 1191514947; 154341884]
  = [1; 1; 255; 0; 154341884; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0541 :
  avoidanceCalc_fun [4; 0; 1; 1; 4; 4; 2162785179; 369563268; 1455062396]
  = [4; 4; 2162785179; 369563268; 1455062396; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0542 :
  avoidanceCalc_fun [3; 0; 0; 2; 4; 2; 3256649595; 451575007; 1862999180]
  = [4; 4; 255; 0; 1862999180; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0543 :
  avoidanceCalc_fun [0; 2; 1; 0; 3; 4; 2188169685; 552697986; 2837758679]
  = [3; 3; 255; 0; 2837758679; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0544 :
  avoidanceCalc_fun [5; 0; 0; 1; 3; 2; 3086328458; 4036474508; 4121894081]
  = [3; 3; 255; 0; 4121894081; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0545 :
  avoidanceCalc_fun [5; 3; 1; 2; 0; 4; 3223853571; 3031747311; 744157342]
  = [0; 0; 3223853571; 3031747311; 744157342; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0546 :
  avoidanceCalc_fun [7; 2; 1; 0; 3; 0; 1641405769; 175020500; 3674687393]
  = [1; 1; 255; 0; 3674687393; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0547 :
  avoidanceCalc_fun [7; 3; 0; 1; 3; 1; 274636857; 2581309322; 4040008513]
  = [1; 1; 274636857; 2581309322; 4040008513; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0548 :
  avoidanceCalc_fun [2; 2; 1; 2; 0; 3; 2723885128; 223309844; 1612097605]
  = [0; 0; 2723885128; 223309844; 1612097605; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0549 :
  avoidanceCalc_fun [3; 1; 0; 0; 4; 4; 1909815870; 159290638; 498796128]
  = [4; 4; 1909815870; 159290638; 498796128; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0550 :
  avoidanceCalc_fun [4; 0; 0; 1; 4; 1; 473942474; 436766826; 3393500897]
  = [4; 4; 255; 0; 3393500897; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0551 :
  avoidanceCalc_fun [5; 0; 0; 2; 2; 1; 3359370247; 637760534; 629908256]
  = [2; 2; 255; 0; 629908256; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0552 :
  avoidanceCalc_fun [4; 2; 1; 0; 3; 3; 2410904162; 417283041; 2524386443]
  = [3; 3; 2410904162; 417283041; 2524386443; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0553 :
  avoidanceCalc_fun [6; 1; 0; 1; 2; 2; 24194256; 2520617654; 3962910316]
  = [1; 1; 255; 0; 3962910316; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0554 :
  avoidanceCalc_fun [7; 3; 1; 2; 4; 3; 3194780580; 643993601; 1895798638]
  = [4; 4; 255; 0; 1895798638; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0555 :
  avoidanceCalc_fun [0; 1; 0; 0; 1; 4; 3027592224; 3737707974; 3138877478]
  = [1; 1; 255; 0; 3138877478; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0556 :
  avoidanceCalc_fun [0; 1; 0; 1; 1; 1; 584439479; 2481780853; 2368011819]
  = [1; 1; 584439479; 2481780853; 2368011819; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0557 :
  avoidanceCalc_fun [1; 1; 0; 2; 2; 4; 1111485669; 1891214595; 3018350833]
  = [2; 2; 255; 0; 3018350833; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0558 :
  avoidanceCalc_fun [1; 3; 1; 0; 0; 1; 295562105; 804964287; 3533972219]
  = [1; 1; 295562105; 804964287; 3533972219; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0559 :
  avoidanceCalc_fun [2; 2; 1; 1; 2; 2; 2954711655; 2187234121; 281539429]
  = [2; 2; 2954711655; 2187234121; 281539429; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0560 :
  avoidanceCalc_fun [1; 1; 1; 2; 2; 0; 694262840; 370419988; 1311015196]
  = [2; 2; 255; 0; 1311015196; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0561 :
  avoidanceCalc_fun [1; 0; 0; 0; 1; 4; 1482768418; 1190433027; 659237788]
  = [1; 1; 255; 0; 659237788; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0562 :
  avoidanceCalc_fun [7; 2; 0; 1; 2; 1; 1494097476; 2543845714; 911831009]
  = [2; 2; 255; 0; 911831009; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0563 :
  avoidanceCalc_fun [1; 2; 0; 2; 4; 3; 3020799427; 1942646850; 4168236278]
  = [4; 4; 255; 0; 4168236278; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0564 :
  avoidanceCalc_fun [1; 1; 0; 0; 2; 1; 128722837; 1202888190; 1984939260]
  = [2; 2; 255; 0; 1984939260; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0565 :
  avoidanceCalc_fun [6; 0; 1; 1; 2; 0; 3790316685; 1002702304; 147769269]
  = [2; 2; 255; 0; 147769269; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0566 :
  avoidanceCalc_fun [7; 3; 0; 2; 1; 0; 4130584229; 2469886309; 689814878]
  = [1; 1; 255; 0; 689814878; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0567 :
  avoidanceCalc_fun [0; 1; 1; 0; 4; 1; 2853559048; 3347468811; 3024637100]
  = [4; 4; 255; 0; 3024637100; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0568 :
  avoidanceCalc_fun [0; 0; 1; 1; 4; 0; 29441722; 3987164710; 3563414295]
  = [4; 4; 255; 0; 3563414295; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0569 :
  avoidanceCalc_fun [5; 2; 0; 2; 2; 0; 716801923; 1613612362; 1975762477]
  = [2; 2; 255; 0; 1975762477; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0570 :
  avoidanceCalc_fun [6; 1; 1; 0; 2; 0; 4010649893; 1520241489; 526454036]
  = [2; 2; 255; 0; 526454036; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0571 :
  avoidanceCalc_fun [3; 3; 0; 1; 1; 0; 917973101; 3389360308; 554301906]
  = [1; 1; 255; 0; 554301906; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0572 :
  avoidanceCalc_fun [7; 0; 1; 2; 2; 4; 1970087619; 413861305; 2163207725]
  = [2; 2; 255; 0; 2163207725; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0573 :
  avoidanceCalc_fun [1; 3; 1; 0; 4; 3; 752671024; 2768377425; 140785549]
  = [1; 1; 255; 0; 140785549; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0574 :
  avoidanceCalc_fun [7; 3; 0; 1; 3; 3; 1902085290; 786017968; 1816778671]
  = [1; 1; 255; 0; 1816778671; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0575 :
  avoidanceCalc_fun [4; 3; 0; 2; 4; 1; 3086755988; 2056745385; 885549960]
  = [4; 4; 255; 0; 885549960; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0576 :
  avoidanceCalc_fun [6; 2; 0; 0; 2; 0; 122054346; 1154736642; 1098180191]
  = [2; 2; 255; 0; 1098180191; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0577 :
  avoidanceCalc_fun [2; 1; 0; 1; 3; 0; 2078903952; 2676280883; 333620742]
  = [1; 1; 255; 0; 333620742; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0578 :
  avoidanceCalc_fun [0; 1; 0; 2; 1; 2; 1839632034; 4003610327; 396989626]
  = [1; 1; 255; 0; 396989626; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0579 :
  avoidanceCalc_fun [5; 0; 0; 0; 4; 3; 3137307004; 867375564; 2663188446]
  = [4; 4; 255; 0; 2663188446; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0580 :
  avoidanceCalc_fun [3; 0; 1; 1; 2; 2; 3411992986; 778055539; 1147893796]
  = [2; 2; 3411992986; 778055539; 1147893796; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0581 :
  avoidanceCalc_fun [3; 3; 0; 2; 1; 3; 1834204248; 4002614189; 918365596]
  = [1; 1; 255; 0; 918365596; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0582 :
  avoidanceCalc_fun [7; 0; 1; 0; 4; 0; 598124316; 2724732215; 3699211427]
  = [1; 1; 255; 0; 3699211427; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0583 :
  avoidanceCalc_fun [3; 0; 1; 1; 4; 1; 3477045263; 3941254733; 830594267]
  = [4; 4; 255; 0; 830594267; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0584 :
  avoidanceCalc_fun [1; 0; 0; 2; 4; 1; 11281416; 3399702398; 2164123409]
  = [4; 4; 255; 0; 2164123409; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0585 :
  avoidanceCalc_fun [6; 3; 0; 0; 0; 3; 2615919914; 2499541884; 1811706185]
  = [2; 2; 255; 0; 1811706185; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0586 :
  avoidanceCalc_fun [5; 1; 1; 1; 2; 4; 821236014; 1236685776; 2381817413]
  = [2; 2; 255; 0; 2381817413; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0587 :
  avoidanceCalc_fun [4; 0; 0; 2; 0; 1; 2135920902; 159533444; 2671798095]
  = [0; 0; 2135920902; 159533444; 2671798095; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0588 :
  avoidanceCalc_fun [6; 3; 1; 0; 1; 2; 2107566398; 4185758773; 3678601869]
  = [1; 1; 255; 0; 3678601869; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0589 :
  avoidanceCalc_fun [5; 1; 0; 1; 4; 2; 1885471643; 1163492477; 2761719264]
  = [4; 4; 255; 0; 2761719264; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0590 :
  avoidanceCalc_fun [2; 3; 0; 2; 4; 3; 3211419206; 4109523394; 1483391987]
  = [4; 4; 255; 0; 1483391987; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0591 :
  avoidanceCalc_fun [3; 2; 0; 0; 4; 3; 1521226204; 2630060099; 1236870200]
  = [4; 4; 255; 0; 1236870200; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0592 :
  avoidanceCalc_fun [6; 2; 0; 1; 3; 2; 3843808424; 1333027036; 3006823553]
  = [3; 3; 255; 0; 3006823553; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0593 :
  avoidanceCalc_fun [5; 2; 0; 2; 1; 0; 3156660659; 2060771110; 2320458012]
  = [1; 1; 255; 0; 2320458012; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0594 :
  avoidanceCalc_fun [2; 1; 0; 0; 3; 4; 494060329; 2932388540; 1230409592]
  = [3; 3; 255; 0; 1230409592; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0595 :
  avoidanceCalc_fun [4; 3; 0; 1; 2; 2; 1610753139; 1243729158; 1036572751]
  = [2; 2; 1610753139; 1243729158; 1036572751; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0596 :
  avoidanceCalc_fun [1; 0; 0; 2; 3; 0; 242692741; 152824672; 1501820878]
  = [3; 3; 255; 0; 1501820878; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0597 :
  avoidanceCalc_fun [1; 1; 0; 0; 2; 1; 4140210206; 2604437391; 2081342784]
  = [2; 2; 255; 0; 2081342784; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0598 :
  avoidanceCalc_fun [6; 1; 1; 1; 0; 3; 2386162139; 442895560; 3814535831]
  = [0; 0; 2386162139; 442895560; 3814535831; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0599 :
  avoidanceCalc_fun [5; 3; 1; 2; 1; 3; 3701195845; 2419673531; 1089924804]
  = [1; 1; 255; 0; 1089924804; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0600 :
  avoidanceCalc_fun [6; 2; 0; 0; 2; 1; 3708760060; 627099137; 2704139309]
  = [2; 2; 255; 0; 2704139309; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0601 :
  avoidanceCalc_fun [1; 2; 1; 1; 1; 1; 1911012870; 2981374269; 910966265]
  = [1; 1; 1911012870; 2981374269; 910966265; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0602 :
  avoidanceCalc_fun [4; 3; 0; 2; 0; 1; 449229554; 428901376; 1163450931]
  = [0; 0; 449229554; 428901376; 1163450931; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0603 :
  avoidanceCalc_fun [6; 2; 1; 0; 1; 3; 3408444838; 353553794; 2845287023]
  = [1; 1; 255; 0; 2845287023; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0604 :
  avoidanceCalc_fun [6; 0; 1; 1; 1; 0; 3626085984; 3833463365; 2173265242]
  = [1; 1; 255; 0; 2173265242; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0605 :
  avoidanceCalc_fun [5; 1; 0; 2; 4; 4; 3671732710; 2980967126; 819158734]
  = [4; 4; 3671732710; 2980967126; 819158734; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0606 :
  avoidanceCalc_fun [7; 2; 1; 0; 3; 1; 3206464447; 2306303287; 1504337181]
  = [1; 1; 3206464447; 2306303287; 1504337181; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0607 :
  avoidanceCalc_fun [1; 2; 0; 1; 1; 2; 1891802667; 1491073763; 718469099]
  = [1; 1; 255; 0; 718469099; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0608 :
  avoidanceCalc_fun [7; 0; 0; 2; 4; 1; 1102487251; 1637374540; 3468992549]
  = [4; 4; 255; 0; 3468992549; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0609 :
  avoidanceCalc_fun [6; 3; 1; 0; 3; 3; 1592073129; 3802406790; 3981638295]
  = [3; 3; 1592073129; 3802406790; 3981638295; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0610 :
  avoidanceCalc_fun [4; 1; 1; 1; 2; 2; 1165868303; 1396581799; 2455336894]
  = [2; 2; 1165868303; 1396581799; 2455336894; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0611 :
  avoidanceCalc_fun [0; 1; 1; 2; 1; 4; 985743328; 642946704; 1885457140]
  = [1; 1; 255; 0; 1885457140; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0612 :
  avoidanceCalc_fun [2; 1; 0; 0; 1; 2; 271958943; 3987175145; 3054133376]
  = [1; 1; 255; 0; 3054133376; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0613 :
  avoidanceCalc_fun [6; 1; 1; 1; 1; 0; 1544975167; 970587777; 221756537]
  = [1; 1; 255; 0; 221756537; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0614 :
  avoidanceCalc_fun [1; 3; 0; 2; 2; 4; 1526350633; 589788257; 3135316291]
  = [2; 2; 255; 0; 3135316291; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0615 :
  avoidanceCalc_fun [0; 1; 0; 0; 3; 0; 941790212; 790859282; 2592034704]
  = [3; 3; 255; 0; 2592034704; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0616 :
  avoidanceCalc_fun [3; 1; 0; 1; 2; 3; 3040921343; 366679639; 2339163248]
  = [1; 1; 255; 0; 2339163248; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0617 :
  avoidanceCalc_fun [7; 3; 0; 2; 0; 0; 4080640854; 2900099622; 530715206]
  = [0; 0; 4080640854; 2900099622; 530715206; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0618 :
  avoidanceCalc_fun [1; 1; 1; 0; 4; 1; 3593930783; 194017881; 722154258]
  = [1; 1; 3593930783; 194017881; 722154258; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0619 :
  avoidanceCalc_fun [2; 0; 0; 1; 3; 0; 979698560; 3110146885; 2886133113]
  = [3; 3; 255; 0; 2886133113; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0620 :
  avoidanceCalc_fun [4; 3; 1; 2; 2; 0; 2333485948; 4120712910; 3517125029]
  = [2; 2; 255; 0; 3517125029; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0621 :
  avoidanceCalc_fun [6; 3; 1; 0; 1; 4; 965227443; 2139288508; 3965892656]
  = [1; 1; 255; 0; 3965892656; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0622 :
  avoidanceCalc_fun [3; 1; 0; 1; 3; 1; 1961281125; 1670422015; 3579025207]
  = [1; 1; 1961281125; 1670422015; 3579025207; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0623 :
  avoidanceCalc_fun [0; 2; 1; 2; 2; 2; 1364962097; 1912033517; 781474356]
  = [2; 2; 1364962097; 1912033517; 781474356; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0624 :
  avoidanceCalc_fun [3; 1; 0; 0; 2; 4; 3905442281; 585378400; 3033693910]
  = [2; 2; 255; 0; 3033693910; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0625 :
  avoidanceCalc_fun [2; 2; 1; 1; 4; 3; 1284214545; 1740505575; 1392627223]
  = [4; 4; 255; 0; 1392627223; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0626 :
  avoidanceCalc_fun [2; 1; 0; 2; 1; 3; 265780324; 133627114; 3198131708]
  = [1; 1; 255; 0; 3198131708; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0627 :
  avoidanceCalc_fun [5; 1; 1; 0; 4; 2; 2123612775; 1343258092; 2857436682]
  = [1; 1; 255; 0; 2857436682; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0628 :
  avoidanceCalc_fun [3; 2; 0; 1; 1; 4; 1315762409; 4235313907; 1529398883]
  = [1; 1; 255; 0; 1529398883; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0629 :
  avoidanceCalc_fun [2; 3; 1; 2; 0; 1; 198241487; 3634867657; 1800905835]
  = [0; 0; 198241487; 3634867657; 1800905835; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0630 :
  avoidanceCalc_fun [2; 1; 1; 0; 0; 3; 3471429451; 1670266762; 3086404967]
  = [0; 0; 3471429451; 1670266762; 3086404967; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0631 :
  avoidanceCalc_fun [4; 2; 1; 1; 2; 1; 217864090; 4063342481; 1302304667]
  = [2; 2; 255; 0; 1302304667; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0632 :
  avoidanceCalc_fun [6; 1; 0; 2; 4; 3; 3356045672; 218932122; 2234340675]
  = [4; 4; 255; 0; 2234340675; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0633 :
  avoidanceCalc_fun [4; 2; 0; 0; 2; 4; 1676320924; 2891069917; 1929935656]
  = [2; 2; 255; 0; 1929935656; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0634 :
  avoidanceCalc_fun [7; 2; 0; 1; 1; 0; 301851602; 296141481; 2718596373]
  = [1; 1; 255; 0; 2718596373; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0635 :
  avoidanceCalc_fun [0; 3; 0; 2; 2; 1; 4282961782; 1712119439; 3038134001]
  = [2; 2; 255; 0; 3038134001; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0636 :
  avoidanceCalc_fun [6; 0; 1; 0; 1; 2; 125353015; 3498640170; 1167717632]
  = [1; 1; 255; 0; 1167717632; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0637 :
  avoidanceCalc_fun [5; 2; 1; 1; 0; 3; 3258191651; 1511352162; 2305198020]
  = [0; 0; 3258191651; 1511352162; 2305198020; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0638 :
  avoidanceCalc_fun [2; 0; 1; 2; 1; 2; 1808810150; 2995660947; 3674409274]
  = [1; 1; 255; 0; 3674409274; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0639 :
  avoidanceCalc_fun [4; 0; 0; 0; 3; 2; 2106574632; 2771815949; 1986005637]
  = [3; 3; 255; 0; 1986005637; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0640 :
  avoidanceCalc_fun [6; 3; 0; 1; 4; 2; 997190828; 2398437349; 952934934]
  = [1; 1; 255; 0; 952934934; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0641 :
  avoidanceCalc_fun [4; 1; 1; 2; 2; 4; 1541245; 606360633; 1065326911]
  = [2; 2; 255; 0; 1065326911; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0642 :
  avoidanceCalc_fun [3; 2; 1; 0; 0; 2; 223261960; 1653192801; 3819679078]
  = [1; 1; 255; 0; 3819679078; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0643 :
  avoidanceCalc_fun [3; 0; 0; 1; 3; 2; 4179400600; 1282823457; 3629256196]
  = [3; 3; 255; 0; 3629256196; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0644 :
  avoidanceCalc_fun [5; 3; 0; 2; 2; 0; 3288487835; 3968693284; 1814787273]
  = [2; 2; 255; 0; 1814787273; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0645 :
  avoidanceCalc_fun [7; 3; 0; 0; 4; 1; 2552127236; 3593942935; 719913402]
  = [2; 2; 255; 0; 719913402; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0646 :
  avoidanceCalc_fun [6; 2; 0; 1; 3; 2; 3321226674; 993078205; 330402293]
  = [3; 3; 255; 0; 330402293; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0647 :
  avoidanceCalc_fun [3; 1; 0; 2; 0; 0; 2812532783; 2283805637; 3556390426]
  = [0; 0; 2812532783; 2283805637; 3556390426; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0648 :
  avoidanceCalc_fun [3; 3; 1; 0; 0; 1; 1940407685; 3273410785; 3403784789]
  = [1; 1; 1940407685; 3273410785; 3403784789; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0649 :
  avoidanceCalc_fun [5; 1; 0; 1; 4; 1; 3185515567; 1375549823; 3786160026]
  = [4; 4; 255; 0; 3786160026; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0650 :
  avoidanceCalc_fun [7; 2; 0; 2; 3; 2; 1038569806; 933222671; 2884403585]
  = [3; 3; 255; 0; 2884403585; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0651 :
  avoidanceCalc_fun [3; 0; 0; 0; 1; 2; 2903321122; 3023113688; 3750795910]
  = [1; 1; 255; 0; 3750795910; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0652 :
  avoidanceCalc_fun [4; 1; 0; 1; 1; 4; 4086394941; 4262751891; 4034430386]
  = [1; 1; 255; 0; 4034430386; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0653 :
  avoidanceCalc_fun [5; 3; 1; 2; 4; 1; 3632659644; 90401406; 2099189900]
  = [4; 4; 255; 0; 2099189900; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0654 :
  avoidanceCalc_fun [5; 2; 0; 0; 4; 1; 2841416798; 3713748206; 1682805751]
  = [2; 2; 255; 0; 1682805751; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0655 :
  avoidanceCalc_fun [2; 0; 0; 1; 0; 2; 2838693840; 4077276603; 348449812]
  = [0; 0; 2838693840; 4077276603; 348449812; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0656 :
  avoidanceCalc_fun [2; 0; 0; 2; 0; 1; 3626943720; 3008387145; 3864891852]
  = [0; 0; 3626943720; 3008387145; 3864891852; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0657 :
  avoidanceCalc_fun [2; 0; 0; 0; 3; 4; 3545368948; 3035591327; 3507827616]
  = [3; 3; 255; 0; 3507827616; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0658 :
  avoidanceCalc_fun [7; 0; 1; 1; 3; 0; 822062266; 1657869525; 3346188186]
  = [3; 3; 255; 0; 3346188186; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0659 :
  avoidanceCalc_fun [0; 0; 1; 2; 2; 4; 635163855; 1851378419; 3163644857]
  = [2; 2; 255; 0; 3163644857; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0660 :
  avoidanceCalc_fun [7; 0; 1; 0; 2; 2; 2862991581; 1334740; 210877895]
  = [1; 1; 255; 0; 210877895; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0661 :
  avoidanceCalc_fun [2; 3; 1; 1; 4; 4; 3962584817; 2597081345; 775909969]
  = [4; 4; 3962584817; 2597081345; 775909969; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0662 :
  avoidanceCalc_fun [3; 1; 1; 2; 1; 3; 3246315636; 1746662129; 3598668885]
  = [1; 1; 255; 0; 3598668885; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0663 :
  avoidanceCalc_fun [5; 2; 0; 0; 1; 3; 1311633360; 699513620; 2746828118]
  = [2; 2; 255; 0; 2746828118; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0664 :
  avoidanceCalc_fun [4; 1; 1; 1; 1; 3; 1100977798; 2290277333; 2644582672]
  = [1; 1; 255; 0; 2644582672; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0665 :
  avoidanceCalc_fun [2; 1; 1; 2; 0; 0; 4279675343; 1118512723; 988254640]
  = [0; 0; 4279675343; 1118512723; 988254640; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0666 :
  avoidanceCalc_fun [0; 0; 1; 0; 2; 2; 4155471489; 27759621; 80856291]
  = [2; 2; 4155471489; 27759621; 80856291; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0667 :
  avoidanceCalc_fun [3; 3; 1; 1; 2; 2; 2592515850; 703938502; 2708644720]
  = [2; 2; 2592515850; 703938502; 2708644720; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0668 :
  avoidanceCalc_fun [7; 0; 1; 2; 4; 4; 1418569721; 2133466751; 323744346]
  = [4; 4; 1418569721; 2133466751; 323744346; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0669 :
  avoidanceCalc_fun [7; 1; 0; 0; 4; 1; 4128820664; 3272300167; 1743230870]
  = [4; 4; 255; 0; 1743230870; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0670 :
  avoidanceCalc_fun [7; 3; 1; 1; 3; 4; 51687705; 3026208054; 3133880008]
  = [3; 3; 255; 0; 3133880008; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0671 :
  avoidanceCalc_fun [7; 1; 1; 2; 0; 3; 679563826; 1763554341; 173092191]
  = [0; 0; 679563826; 1763554341; 173092191; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0672 :
  avoidanceCalc_fun [5; 3; 0; 0; 1; 1; 4098495756; 3557791597; 2843141142]
  = [2; 2; 255; 0; 2843141142; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0673 :
  avoidanceCalc_fun [4; 2; 0; 1; 0; 3; 1570110210; 1773241475; 4001727679]
  = [0; 0; 1570110210; 1773241475; 4001727679; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0674 :
  avoidanceCalc_fun [5; 2; 1; 2; 4; 2; 878266710; 4264200278; 1796902392]
  = [4; 4; 255; 0; 1796902392; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0675 :
  avoidanceCalc_fun [6; 3; 0; 0; 4; 1; 3467954595; 2295238798; 2128584399]
  = [2; 2; 255; 0; 2128584399; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0676 :
  avoidanceCalc_fun [3; 2; 1; 1; 1; 1; 2299729976; 3888996847; 954851617]
  = [1; 1; 2299729976; 3888996847; 954851617; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0677 :
  avoidanceCalc_fun [5; 0; 1; 2; 1; 0; 35910322; 1204552796; 3150761285]
  = [1; 1; 255; 0; 3150761285; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0678 :
  avoidanceCalc_fun [2; 1; 1; 0; 1; 2; 3258283434; 231315287; 3206115551]
  = [1; 1; 255; 0; 3206115551; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0679 :
  avoidanceCalc_fun [1; 0; 0; 1; 4; 3; 3295485085; 523879900; 1452604228]
  = [4; 4; 255; 0; 1452604228; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0680 :
  avoidanceCalc_fun [1; 0; 0; 2; 3; 3; 3442385924; 659523229; 3372971651]
  = [3; 3; 3442385924; 659523229; 3372971651; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0681 :
  avoidanceCalc_fun [3; 2; 1; 0; 1; 0; 4117118519; 3980671893; 3023886857]
  = [1; 1; 255; 0; 3023886857; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0682 :
  avoidanceCalc_fun [5; 3; 0; 1; 2; 0; 3356415461; 3161929175; 537996979]
  = [2; 2; 255; 0; 537996979; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0683 :
  avoidanceCalc_fun [4; 2; 1; 2; 4; 0; 169016668; 3612750233; 2099593992]
  = [4; 4; 255; 0; 2099593992; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0684 :
  avoidanceCalc_fun [6; 1; 0; 0; 1; 2; 1034992793; 1822354365; 2364296568]
  = [1; 1; 255; 0; 2364296568; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0685 :
  avoidanceCalc_fun [0; 1; 0; 1; 1; 4; 2757863607; 1526836379; 3415060557]
  = [1; 1; 255; 0; 3415060557; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0686 :
  avoidanceCalc_fun [7; 3; 0; 2; 3; 4; 227082535; 36101596; 2556184715]
  = [3; 3; 255; 0; 2556184715; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0687 :
  avoidanceCalc_fun [0; 1; 1; 0; 4; 2; 3745153843; 2526577007; 3368278813]
  = [4; 4; 255; 0; 3368278813; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0688 :
  avoidanceCalc_fun [0; 1; 1; 1; 4; 2; 3104730379; 4082503405; 880270500]
  = [4; 4; 255; 0; 880270500; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0689 :
  avoidanceCalc_fun [3; 0; 1; 2; 4; 1; 1451050108; 3722843300; 464732965]
  = [4; 4; 255; 0; 464732965; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0690 :
  avoidanceCalc_fun [1; 2; 0; 0; 0; 2; 770363408; 3173860576; 422068899]
  = [0; 0; 770363408; 3173860576; 422068899; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0691 :
  avoidanceCalc_fun [6; 0; 1; 1; 4; 3; 2356812627; 1084275900; 2998080474]
  = [4; 4; 255; 0; 2998080474; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0692 :
  avoidanceCalc_fun [2; 2; 1; 2; 3; 4; 3506220182; 2402810720; 195630372]
  = [3; 3; 255; 0; 195630372; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0693 :
  avoidanceCalc_fun [6; 3; 1; 0; 1; 1; 1360212040; 3839381818; 2671921131]
  = [1; 1; 1360212040; 3839381818; 2671921131; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0694 :
  avoidanceCalc_fun [4; 0; 1; 1; 2; 4; 2173298826; 613796430; 13291893]
  = [2; 2; 255; 0; 13291893; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0695 :
  avoidanceCalc_fun [7; 0; 1; 2; 2; 2; 2332434584; 1240467609; 3890601685]
  = [2; 2; 2332434584; 1240467609; 3890601685; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0696 :
  avoidanceCalc_fun [3; 3; 1; 0; 0; 4; 355180708; 252993919; 1831782363]
  = [1; 1; 255; 0; 1831782363; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0697 :
  avoidanceCalc_fun [4; 1; 1; 1; 4; 0; 1419248830; 866539991; 3794118485]
  = [4; 4; 255; 0; 3794118485; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0698 :
  avoidanceCalc_fun [6; 0; 0; 2; 3; 1; 2735737287; 4130860061; 812587144]
  = [3; 3; 255; 0; 812587144; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0699 :
  avoidanceCalc_fun [6; 1; 0; 0; 0; 0; 2805799488; 1300311761; 226262937]
  = [0; 0; 2805799488; 1300311761; 226262937; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0700 :
  avoidanceCalc_fun [2; 2; 1; 1; 0; 0; 742363676; 2403672857; 2545776982]
  = [0; 0; 742363676; 2403672857; 2545776982; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0701 :
  avoidanceCalc_fun [0; 3; 1; 2; 2; 3; 1666718056; 660616720; 3815894250]
  = [2; 2; 255; 0; 3815894250; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0702 :
  avoidanceCalc_fun [7; 0; 1; 0; 0; 3; 1263278985; 3649553554; 3738765569]
  = [1; 1; 255; 0; 3738765569; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0703 :
  avoidanceCalc_fun [7; 1; 1; 1; 3; 4; 2229488907; 3937488561; 382643123]
  = [3; 3; 255; 0; 382643123; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0704 :
  avoidanceCalc_fun [7; 0; 0; 2; 4; 2; 3174045138; 2178862443; 3989917430]
  = [4; 4; 255; 0; 3989917430; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0705 :
  avoidanceCalc_fun [2; 1; 0; 0; 1; 1; 812764556; 3738976814; 3540131802]
  = [1; 1; 812764556; 3738976814; 3540131802; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0706 :
  avoidanceCalc_fun [6; 1; 0; 1; 0; 2; 943643305; 3453611664; 3741010896]
  = [1; 1; 255; 0; 3741010896; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0707 :
  avoidanceCalc_fun [0; 3; 0; 2; 1; 3; 280631039; 2919440553; 2449170943]
  = [1; 1; 255; 0; 2449170943; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0708 :
  avoidanceCalc_fun [3; 1; 1; 0; 3; 4; 2115809602; 2729290933; 3954173500]
  = [1; 1; 255; 0; 3954173500; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0709 :
  avoidanceCalc_fun [0; 3; 0; 1; 0; 2; 3736422211; 1882515348; 1844422978]
  = [0; 0; 3736422211; 1882515348; 1844422978; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0710 :
  avoidanceCalc_fun [1; 3; 1; 2; 2; 3; 1773543194; 1381825368; 3401889468]
  = [2; 2; 255; 0; 3401889468; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0711 :
  avoidanceCalc_fun [5; 1; 1; 0; 4; 0; 4075173452; 40139647; 2590610223]
  = [1; 1; 255; 0; 2590610223; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0712 :
  avoidanceCalc_fun [2; 2; 0; 1; 2; 4; 2004594323; 4061249239; 404099807]
  = [2; 2; 255; 0; 404099807; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0713 :
  avoidanceCalc_fun [2; 2; 1; 2; 0; 0; 8063412; 3960390441; 963825598]
  = [0; 0; 8063412; 3960390441; 963825598; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0714 :
  avoidanceCalc_fun [3; 1; 0; 0; 2; 0; 4267937704; 3368197401; 3199176775]
  = [2; 2; 255; 0; 3199176775; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0715 :
  avoidanceCalc_fun [4; 2; 1; 1; 0; 3; 4228603534; 2289424228; 2596403393]
  = [0; 0; 4228603534; 2289424228; 2596403393; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0716 :
  avoidanceCalc_fun [6; 0; 0; 2; 4; 4; 1961247930; 2132363619; 3663327151]
  = [4; 4; 1961247930; 2132363619; 3663327151; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0717 :
  avoidanceCalc_fun [7; 0; 1; 0; 4; 1; 401336173; 498275036; 2756977694]
  = [1; 1; 401336173; 498275036; 2756977694; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0718 :
  avoidanceCalc_fun [7; 2; 1; 1; 0; 3; 2920592712; 4086550396; 1515391382]
  = [0; 0; 2920592712; 4086550396; 1515391382; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0719 :
  avoidanceCalc_fun [6; 3; 1; 2; 1; 0; 4222965620; 2640883833; 4282955093]
  = [1; 1; 255; 0; 4282955093; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0720 :
  avoidanceCalc_fun [0; 0; 0; 0; 1; 0; 939892342; 1821796108; 2871646205]
  = [1; 1; 255; 0; 2871646205; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0721 :
  avoidanceCalc_fun [7; 1; 0; 1; 4; 4; 1702235525; 491223893; 4061405505]
  = [1; 1; 255; 0; 4061405505; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0722 :
  avoidanceCalc_fun [0; 0; 0; 2; 2; 0; 1094967755; 88758090; 3902145990]
  = [2; 2; 255; 0; 3902145990; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0723 :
  avoidanceCalc_fun [4; 3; 0; 0; 0; 0; 1811743489; 4198308203; 3241241684]
  = [2; 2; 255; 0; 3241241684; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0724 :
  avoidanceCalc_fun [2; 2; 0; 1; 2; 1; 3803308064; 329480610; 1109398809]
  = [2; 2; 255; 0; 1109398809; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0725 :
  avoidanceCalc_fun [5; 1; 1; 2; 4; 1; 268262414; 3151586465; 965864163]
  = [4; 4; 255; 0; 965864163; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0726 :
  avoidanceCalc_fun [3; 1; 0; 0; 3; 1; 3634449778; 1539316470; 2605136228]
  = [3; 3; 255; 0; 2605136228; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0727 :
  avoidanceCalc_fun [7; 1; 1; 1; 4; 4; 4030536539; 2230313119; 2275948568]
  = [4; 4; 4030536539; 2230313119; 2275948568; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0728 :
  avoidanceCalc_fun [4; 0; 0; 2; 1; 4; 1252199904; 3820356388; 292314669]
  = [1; 1; 255; 0; 292314669; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0729 :
  avoidanceCalc_fun [7; 2; 0; 0; 2; 3; 1869175791; 1565596310; 3529063714]
  = [2; 2; 255; 0; 3529063714; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0730 :
  avoidanceCalc_fun [4; 1; 0; 1; 3; 1; 389540903; 4099139584; 4227750168]
  = [3; 3; 255; 0; 4227750168; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0731 :
  avoidanceCalc_fun [7; 3; 0; 2; 1; 4; 4161940148; 2901954538; 3013059737]
  = [1; 1; 255; 0; 3013059737; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0732 :
  avoidanceCalc_fun [1; 1; 0; 0; 1; 2; 1326148510; 1670322643; 884038838]
  = [1; 1; 255; 0; 884038838; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0733 :
  avoidanceCalc_fun [6; 0; 0; 1; 3; 3; 1953713119; 1104445035; 912376090]
  = [3; 3; 1953713119; 1104445035; 912376090; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0734 :
  avoidanceCalc_fun [1; 0; 0; 2; 0; 3; 2839220904; 1016951097; 1035224385]
  = [0; 0; 2839220904; 1016951097; 1035224385; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0735 :
  avoidanceCalc_fun [2; 2; 1; 0; 2; 3; 3435608750; 1926170909; 35796494]
  = [2; 2; 255; 0; 35796494; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0736 :
  avoidanceCalc_fun [0; 1; 1; 1; 2; 3; 2499258665; 2607776091; 2964360016]
  = [2; 2; 255; 0; 2964360016; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0737 :
  avoidanceCalc_fun [0; 2; 1; 2; 1; 0; 2181081030; 2608291543; 758282972]
  = [1; 1; 255; 0; 758282972; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0738 :
  avoidanceCalc_fun [3; 1; 0; 0; 3; 3; 1829544019; 1571788726; 2544762261]
  = [3; 3; 1829544019; 1571788726; 2544762261; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0739 :
  avoidanceCalc_fun [6; 1; 1; 1; 4; 2; 553862686; 3148570120; 1053811342]
  = [4; 4; 255; 0; 1053811342; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0740 :
  avoidanceCalc_fun [3; 2; 1; 2; 0; 0; 1022624534; 3585628080; 2851788257]
  = [0; 0; 1022624534; 3585628080; 2851788257; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0741 :
  avoidanceCalc_fun [6; 2; 0; 0; 3; 4; 1733421137; 2410561200; 2338936959]
  = [2; 2; 255; 0; 2338936959; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0742 :
  avoidanceCalc_fun [7; 0; 1; 1; 4; 1; 998522984; 3879319025; 3555534134]
  = [4; 4; 255; 0; 3555534134; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0743 :
  avoidanceCalc_fun [1; 1; 1; 2; 1; 3; 864513771; 794982382; 142779706]
  = [1; 1; 255; 0; 142779706; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0744 :
  avoidanceCalc_fun [0; 3; 1; 0; 1; 0; 1712961560; 923789478; 928705420]
  = [1; 1; 255; 0; 928705420; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0745 :
  avoidanceCalc_fun [1; 1; 0; 1; 2; 0; 2084326393; 2809680107; 443573945]
  = [2; 2; 255; 0; 443573945; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0746 :
  avoidanceCalc_fun [6; 0; 0; 2; 0; 3; 2603377423; 1739453691; 1932348451]
  = [0; 0; 2603377423; 1739453691; 1932348451; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0747 :
  avoidanceCalc_fun [7; 2; 0; 0; 0; 2; 1630488756; 3734265110; 1752417159]
  = [2; 2; 1630488756; 3734265110; 1752417159; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0748 :
  avoidanceCalc_fun [4; 1; 1; 1; 1; 0; 1532647891; 1986248496; 2148918563]
  = [1; 1; 255; 0; 2148918563; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0749 :
  avoidanceCalc_fun [2; 0; 0; 2; 1; 2; 1999859257; 4007027879; 789086051]
  = [1; 1; 255; 0; 789086051; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0750 :
  avoidanceCalc_fun [3; 0; 0; 0; 4; 4; 1700352787; 3154622449; 2020476877]
  = [4; 4; 1700352787; 3154622449; 2020476877; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0751 :
  avoidanceCalc_fun [0; 1; 1; 1; 1; 3; 1155218590; 114317649; 700006401]
  = [1; 1; 255; 0; 700006401; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0752 :
  avoidanceCalc_fun [7; 0; 1; 2; 2; 0; 1764397153; 123623422; 3074468936]
  = [2; 2; 255; 0; 3074468936; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0753 :
  avoidanceCalc_fun [5; 2; 1; 0; 4; 4; 4287882757; 3122411747; 3637206543]
  = [1; 1; 255; 0; 3637206543; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0754 :
  avoidanceCalc_fun [2; 2; 0; 1; 4; 4; 1469641573; 1689595813; 293118084]
  = [4; 4; 1469641573; 1689595813; 293118084; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0755 :
  avoidanceCalc_fun [4; 3; 0; 2; 3; 3; 3697779884; 4208882349; 529345346]
  = [3; 3; 3697779884; 4208882349; 529345346; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0756 :
  avoidanceCalc_fun [7; 1; 0; 0; 0; 0; 1049763123; 3029822417; 349980302]
  = [0; 0; 1049763123; 3029822417; 349980302; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0757 :
  avoidanceCalc_fun [2; 1; 0; 1; 0; 4; 3002873332; 1071464242; 2425169963]
  = [1; 1; 255; 0; 2425169963; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0758 :
  avoidanceCalc_fun [7; 3; 1; 2; 3; 1; 438748602; 2805844930; 1162426899]
  = [3; 3; 255; 0; 1162426899; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0759 :
  avoidanceCalc_fun [2; 3; 1; 0; 4; 3; 3182557002; 3551233262; 5704638]
  = [4; 4; 255; 0; 5704638; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0760 :
  avoidanceCalc_fun [5; 3; 0; 1; 4; 0; 2994139644; 1761905777; 3895142364]
  = [4; 4; 255; 0; 3895142364; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0761 :
  avoidanceCalc_fun [1; 3; 0; 2; 2; 3; 356526734; 1879621984; 387646037]
  = [2; 2; 255; 0; 387646037; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0762 :
  avoidanceCalc_fun [6; 1; 1; 0; 0; 1; 2880099168; 2885088724; 346435050]
  = [0; 0; 2880099168; 2885088724; 346435050; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0763 :
  avoidanceCalc_fun [1; 2; 0; 1; 2; 4; 76666452; 3372395603; 2712745197]
  = [2; 2; 255; 0; 2712745197; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0764 :
  avoidanceCalc_fun [7; 0; 1; 2; 2; 3; 1569088897; 60989019; 216260258]
  = [2; 2; 255; 0; 216260258; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0765 :
  avoidanceCalc_fun [4; 0; 1; 0; 3; 4; 882513244; 565173320; 2766756254]
  = [3; 3; 255; 0; 2766756254; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0766 :
  avoidanceCalc_fun [4; 3; 1; 1; 1; 1; 3860784561; 254409074; 107061151]
  = [1; 1; 3860784561; 254409074; 107061151; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0767 :
  avoidanceCalc_fun [6; 3; 1; 2; 2; 1; 219684465; 2711462190; 25355400]
  = [2; 2; 255; 0; 25355400; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0768 :
  avoidanceCalc_fun [3; 1; 1; 0; 3; 4; 2653669950; 1391232989; 1847552812]
  = [1; 1; 255; 0; 1847552812; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0769 :
  avoidanceCalc_fun [4; 0; 1; 1; 3; 0; 2870145665; 2197394672; 2816682775]
  = [3; 3; 255; 0; 2816682775; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0770 :
  avoidanceCalc_fun [4; 3; 1; 2; 1; 3; 1870704380; 1977174507; 221950130]
  = [1; 1; 255; 0; 221950130; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0771 :
  avoidanceCalc_fun [4; 0; 0; 0; 2; 1; 2357506213; 2463618928; 1192512681]
  = [2; 2; 255; 0; 1192512681; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0772 :
  avoidanceCalc_fun [6; 1; 1; 1; 3; 2; 2567836942; 2396128564; 2845618631]
  = [3; 3; 255; 0; 2845618631; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0773 :
  avoidanceCalc_fun [5; 3; 1; 2; 2; 1; 2133929609; 1683654174; 1656576063]
  = [2; 2; 255; 0; 1656576063; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0774 :
  avoidanceCalc_fun [2; 3; 0; 0; 0; 1; 443284346; 1911974904; 3296599934]
  = [0; 0; 443284346; 1911974904; 3296599934; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0775 :
  avoidanceCalc_fun [7; 3; 0; 1; 4; 4; 713123684; 2246301980; 1478698968]
  = [1; 1; 255; 0; 1478698968; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0776 :
  avoidanceCalc_fun [7; 3; 0; 2; 2; 1; 778420720; 2181854670; 739473098]
  = [2; 2; 255; 0; 739473098; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0777 :
  avoidanceCalc_fun [5; 2; 0; 0; 1; 4; 2657443550; 892698133; 1126891352]
  = [2; 2; 255; 0; 1126891352; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0778 :
  avoidanceCalc_fun [5; 2; 1; 1; 2; 1; 2414754149; 4121263761; 3233542574]
  = [2; 2; 255; 0; 3233542574; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0779 :
  avoidanceCalc_fun [0; 3; 0; 2; 0; 2; 246286504; 2339203581; 3672951699]
  = [0; 0; 246286504; 2339203581; 3672951699; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0780 :
  avoidanceCalc_fun [2; 1; 0; 0; 2; 3; 699135669; 3478705423; 4268953786]
  = [2; 2; 255; 0; 4268953786; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0781 :
  avoidanceCalc_fun [6; 1; 1; 1; 0; 0; 2813362584; 2424611569; 3215607367]
  = [0; 0; 2813362584; 2424611569; 3215607367; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0782 :
  avoidanceCalc_fun [6; 2; 0; 2; 3; 1; 2017290577; 40972772; 2704563402]
  = [3; 3; 255; 0; 2704563402; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0783 :
  avoidanceCalc_fun [3; 2; 1; 0; 3; 1; 1881260635; 496456114; 2248561331]
  = [1; 1; 1881260635; 496456114; 2248561331; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0784 :
  avoidanceCalc_fun [4; 0; 1; 1; 4; 2; 3301209365; 73555775; 3009266743]
  = [4; 4; 255; 0; 3009266743; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0785 :
  avoidanceCalc_fun [4; 0; 1; 2; 2; 1; 3041784823; 1630084567; 3259010868]
  = [2; 2; 255; 0; 3259010868; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0786 :
  avoidanceCalc_fun [2; 3; 1; 0; 0; 1; 3070843066; 3709600127; 2473198595]
  = [0; 0; 3070843066; 3709600127; 2473198595; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0787 :
  avoidanceCalc_fun [5; 2; 0; 1; 1; 0; 3407490556; 2302855070; 800325128]
  = [1; 1; 255; 0; 800325128; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0788 :
  avoidanceCalc_fun [5; 1; 1; 2; 0; 4; 2615460902; 2985825079; 920176133]
  = [0; 0; 2615460902; 2985825079; 920176133; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0789 :
  avoidanceCalc_fun [4; 2; 0; 0; 1; 3; 2561413027; 631911737; 3018688344]
  = [2; 2; 255; 0; 3018688344; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0790 :
  avoidanceCalc_fun [2; 3; 0; 1; 4; 3; 78376279; 697277224; 1114029639]
  = [1; 1; 255; 0; 1114029639; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0791 :
  avoidanceCalc_fun [2; 1; 0; 2; 2; 1; 300393536; 1225778763; 988487286]
  = [2; 2; 255; 0; 988487286; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0792 :
  avoidanceCalc_fun [2; 1; 0; 0; 3; 0; 422991982; 2622763692; 3916942603]
  = [3; 3; 255; 0; 3916942603; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0793 :
  avoidanceCalc_fun [0; 3; 1; 1; 1; 2; 571711988; 2559483511; 2336983444]
  = [1; 1; 255; 0; 2336983444; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0794 :
  avoidanceCalc_fun [5; 3; 0; 2; 0; 2; 3324216099; 4205875266; 1697974707]
  = [0; 0; 3324216099; 4205875266; 1697974707; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0795 :
  avoidanceCalc_fun [5; 0; 1; 0; 0; 0; 3998119922; 2055330937; 3939350330]
  = [1; 1; 255; 0; 3939350330; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0796 :
  avoidanceCalc_fun [7; 2; 1; 1; 4; 3; 3259694182; 1198598927; 3189919514]
  = [4; 4; 255; 0; 3189919514; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0797 :
  avoidanceCalc_fun [0; 3; 1; 2; 0; 4; 2134439355; 3190356233; 3757478281]
  = [0; 0; 2134439355; 3190356233; 3757478281; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0798 :
  avoidanceCalc_fun [3; 1; 0; 0; 3; 0; 4264522007; 4113503989; 4055969235]
  = [3; 3; 255; 0; 4055969235; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0799 :
  avoidanceCalc_fun [6; 1; 0; 1; 4; 2; 208993707; 2751544987; 2933508802]
  = [1; 1; 255; 0; 2933508802; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0800 :
  avoidanceCalc_fun [0; 2; 0; 2; 2; 3; 3833571948; 1426772362; 1857780151]
  = [2; 2; 255; 0; 1857780151; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0801 :
  avoidanceCalc_fun [3; 0; 0; 0; 0; 0; 2830907158; 2494927198; 3210171212]
  = [0; 0; 2830907158; 2494927198; 3210171212; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0802 :
  avoidanceCalc_fun [7; 1; 0; 1; 4; 1; 192879855; 1350495358; 1966247339]
  = [1; 1; 192879855; 1350495358; 1966247339; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0803 :
  avoidanceCalc_fun [6; 0; 0; 2; 2; 4; 3019533318; 3028831398; 3802473478]
  = [2; 2; 255; 0; 3802473478; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0804 :
  avoidanceCalc_fun [3; 2; 0; 0; 0; 0; 3965408714; 58391803; 324583127]
  = [0; 0; 3965408714; 58391803; 324583127; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0805 :
  avoidanceCalc_fun [0; 3; 0; 1; 0; 1; 2319639425; 132879633; 641548325]
  = [0; 0; 2319639425; 132879633; 641548325; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0806 :
  avoidanceCalc_fun [3; 2; 1; 2; 0; 4; 3727315646; 3845481692; 4198960890]
  = [0; 0; 3727315646; 3845481692; 4198960890; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0807 :
  avoidanceCalc_fun [5; 2; 0; 0; 2; 3; 2329972421; 1258171694; 4216035355]
  = [2; 2; 255; 0; 4216035355; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0808 :
  avoidanceCalc_fun [0; 2; 1; 1; 1; 1; 176971144; 3499366490; 3198819303]
  = [1; 1; 176971144; 3499366490; 3198819303; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0809 :
  avoidanceCalc_fun [2; 0; 1; 2; 0; 0; 3024102393; 2007468016; 1353209254]
  = [0; 0; 3024102393; 2007468016; 1353209254; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0810 :
  avoidanceCalc_fun [2; 2; 1; 0; 2; 4; 2861022968; 1962725257; 3593195043]
  = [2; 2; 255; 0; 3593195043; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0811 :
  avoidanceCalc_fun [7; 2; 0; 1; 4; 4; 78078084; 118757655; 91763197]
  = [4; 4; 78078084; 118757655; 91763197; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0812 :
  avoidanceCalc_fun [6; 2; 0; 2; 2; 2; 3527742153; 2946805356; 35510726]
  = [2; 2; 3527742153; 2946805356; 35510726; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0813 :
  avoidanceCalc_fun [6; 3; 1; 0; 1; 2; 1540405237; 3531532050; 403909107]
  = [1; 1; 255; 0; 403909107; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0814 :
  avoidanceCalc_fun [2; 1; 0; 1; 1; 3; 1208253077; 101475840; 3566002155]
  = [1; 1; 255; 0; 3566002155; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0815 :
  avoidanceCalc_fun [5; 1; 1; 2; 3; 3; 713616259; 1209861694; 1977588572]
  = [3; 3; 713616259; 1209861694; 1977588572; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0816 :
  avoidanceCalc_fun [5; 3; 1; 0; 2; 4; 2776342816; 1429292104; 559659616]
  = [1; 1; 255; 0; 559659616; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0817 :
  avoidanceCalc_fun [4; 2; 1; 1; 1; 2; 3073651346; 4225515194; 2959947473]
  = [1; 1; 255; 0; 2959947473; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0818 :
  avoidanceCalc_fun [3; 2; 0; 2; 4; 1; 1720174790; 1654096847; 199870054]
  = [4; 4; 255; 0; 199870054; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0819 :
  avoidanceCalc_fun [5; 0; 1; 0; 3; 3; 3440217260; 779700518; 2730482595]
  = [1; 1; 255; 0; 2730482595; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0820 :
  avoidanceCalc_fun [4; 0; 0; 1; 0; 2; 2945300416; 3835223547; 321230156]
  = [0; 0; 2945300416; 3835223547; 321230156; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0821 :
  avoidanceCalc_fun [6; 3; 0; 2; 0; 1; 4027741774; 1578176182; 842074269]
  = [0; 0; 4027741774; 1578176182; 842074269; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0822 :
  avoidanceCalc_fun [0; 2; 1; 0; 3; 1; 1496578116; 2164084799; 1594741770]
  = [3; 3; 255; 0; 1594741770; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0823 :
  avoidanceCalc_fun [0; 3; 0; 1; 0; 1; 3833805275; 3986907770; 2800535027]
  = [0; 0; 3833805275; 3986907770; 2800535027; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0824 :
  avoidanceCalc_fun [5; 0; 1; 2; 2; 4; 167119857; 1932242927; 2623579231]
  = [2; 2; 255; 0; 2623579231; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0825 :
  avoidanceCalc_fun [5; 2; 0; 0; 2; 3; 3695195142; 836954672; 3966584450]
  = [2; 2; 255; 0; 3966584450; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0826 :
  avoidanceCalc_fun [3; 1; 1; 1; 2; 1; 4006135413; 576427460; 1361148214]
  = [2; 2; 255; 0; 1361148214; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0827 :
  avoidanceCalc_fun [0; 3; 1; 2; 4; 2; 3095825586; 2057192758; 2023326559]
  = [4; 4; 255; 0; 2023326559; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0828 :
  avoidanceCalc_fun [3; 0; 1; 0; 4; 4; 85729264; 2523495852; 620423756]
  = [1; 1; 255; 0; 620423756; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0829 :
  avoidanceCalc_fun [0; 3; 1; 1; 3; 1; 1593835475; 3002526681; 2996676807]
  = [3; 3; 255; 0; 2996676807; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0830 :
  avoidanceCalc_fun [1; 2; 1; 2; 2; 4; 3746857238; 987531113; 1518426076]
  = [2; 2; 255; 0; 1518426076; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0831 :
  avoidanceCalc_fun [6; 2; 1; 0; 1; 4; 2129737728; 1796885794; 2956860798]
  = [1; 1; 255; 0; 2956860798; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0832 :
  avoidanceCalc_fun [5; 0; 1; 1; 2; 1; 2046016570; 1992243617; 2345814803]
  = [2; 2; 255; 0; 2345814803; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0833 :
  avoidanceCalc_fun [4; 3; 1; 2; 0; 1; 737598150; 2721323547; 3304362249]
  = [0; 0; 737598150; 2721323547; 3304362249; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0834 :
  avoidanceCalc_fun [0; 1; 1; 0; 2; 1; 856592019; 352296569; 3516855206]
  = [2; 2; 255; 0; 3516855206; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0835 :
  avoidanceCalc_fun [3; 2; 0; 1; 0; 2; 3675828806; 3817959621; 1877715383]
  = [0; 0; 3675828806; 3817959621; 1877715383; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0836 :
  avoidanceCalc_fun [2; 2; 1; 2; 3; 2; 3200106606; 2948783514; 1935073095]
  = [3; 3; 255; 0; 1935073095; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0837 :
  avoidanceCalc_fun [2; 3; 1; 0; 1; 3; 3734184480; 3310189844; 438675146]
  = [1; 1; 255; 0; 438675146; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0838 :
  avoidanceCalc_fun [2; 3; 1; 1; 2; 1; 2804991415; 2828524991; 4099961534]
  = [2; 2; 255; 0; 4099961534; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0839 :
  avoidanceCalc_fun [7; 1; 0; 2; 3; 4; 515758139; 47054078; 1706357273]
  = [3; 3; 255; 0; 1706357273; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0840 :
  avoidanceCalc_fun [5; 1; 1; 0; 4; 0; 1521400898; 730233367; 78975819]
  = [1; 1; 255; 0; 78975819; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0841 :
  avoidanceCalc_fun [4; 2; 1; 1; 4; 3; 1004247089; 2265363928; 2893506412]
  = [4; 4; 255; 0; 2893506412; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0842 :
  avoidanceCalc_fun [4; 2; 0; 2; 2; 4; 4200313413; 1082898452; 3275721367]
  = [2; 2; 255; 0; 3275721367; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0843 :
  avoidanceCalc_fun [4; 1; 0; 0; 1; 0; 432228747; 2677064543; 2158844474]
  = [1; 1; 255; 0; 2158844474; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0844 :
  avoidanceCalc_fun [6; 0; 0; 1; 2; 4; 652918488; 1721374129; 2884137165]
  = [2; 2; 255; 0; 2884137165; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0845 :
  avoidanceCalc_fun [5; 3; 0; 2; 4; 4; 2535088262; 4071727268; 2031824005]
  = [4; 4; 2535088262; 4071727268; 2031824005; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0846 :
  avoidanceCalc_fun [3; 0; 1; 0; 1; 3; 1459572389; 2360943096; 4065170317]
  = [1; 1; 255; 0; 4065170317; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0847 :
  avoidanceCalc_fun [6; 0; 1; 1; 3; 3; 689892515; 4047280966; 947967663]
  = [3; 3; 689892515; 4047280966; 947967663; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0848 :
  avoidanceCalc_fun [1; 1; 1; 2; 3; 2; 2648712166; 3312565528; 2289837572]
  = [3; 3; 255; 0; 2289837572; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0849 :
  avoidanceCalc_fun [1; 0; 0; 0; 0; 1; 1071114032; 1078785051; 3393440843]
  = [0; 0; 1071114032; 1078785051; 3393440843; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0850 :
  avoidanceCalc_fun [3; 0; 0; 1; 3; 4; 303765819; 524302335; 905619565]
  = [3; 3; 255; 0; 905619565; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0851 :
  avoidanceCalc_fun [3; 3; 1; 2; 1; 4; 3076434427; 4158489931; 4169415309]
  = [1; 1; 255; 0; 4169415309; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0852 :
  avoidanceCalc_fun [1; 2; 0; 0; 4; 4; 3442865079; 1018796144; 3810726121]
  = [4; 4; 3442865079; 1018796144; 3810726121; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0853 :
  avoidanceCalc_fun [6; 0; 1; 1; 1; 1; 513332572; 1532021736; 760406345]
  = [1; 1; 513332572; 1532021736; 760406345; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0854 :
  avoidanceCalc_fun [2; 0; 0; 2; 4; 3; 29827634; 2135989927; 781031179]
  = [4; 4; 255; 0; 781031179; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0855 :
  avoidanceCalc_fun [1; 1; 0; 0; 2; 3; 2722510624; 478487072; 3479939654]
  = [2; 2; 255; 0; 3479939654; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0856 :
  avoidanceCalc_fun [1; 1; 0; 1; 1; 3; 2294706170; 2699693143; 3374056099]
  = [1; 1; 255; 0; 3374056099; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0857 :
  avoidanceCalc_fun [4; 0; 0; 2; 0; 1; 3013389362; 3843996928; 4275040622]
  = [0; 0; 3013389362; 3843996928; 4275040622; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0858 :
  avoidanceCalc_fun [7; 0; 1; 0; 0; 2; 4257048551; 4257065776; 3571274898]
  = [1; 1; 255; 0; 3571274898; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0859 :
  avoidanceCalc_fun [2; 2; 1; 1; 1; 4; 705075552; 795104665; 4072013644]
  = [1; 1; 255; 0; 4072013644; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0860 :
  avoidanceCalc_fun [3; 3; 1; 2; 3; 0; 285961928; 1174828105; 2584288619]
  = [3; 3; 255; 0; 2584288619; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0861 :
  avoidanceCalc_fun [3; 2; 0; 0; 3; 0; 956545263; 2011191645; 2119075649]
  = [3; 3; 255; 0; 2119075649; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0862 :
  avoidanceCalc_fun [1; 1; 1; 1; 1; 2; 4219452278; 1492619893; 1777273212]
  = [1; 1; 255; 0; 1777273212; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0863 :
  avoidanceCalc_fun [1; 2; 0; 2; 4; 4; 29573761; 1040034285; 1754182272]
  = [4; 4; 29573761; 1040034285; 1754182272; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0864 :
  avoidanceCalc_fun [0; 0; 1; 0; 4; 0; 3952792291; 1753684460; 3929513311]
  = [4; 4; 255; 0; 3929513311; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0865 :
  avoidanceCalc_fun [0; 0; 1; 1; 0; 2; 233995481; 245222471; 2757194103]
  = [0; 0; 233995481; 245222471; 2757194103; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0866 :
  avoidanceCalc_fun [6; 1; 0; 2; 4; 2; 4292501934; 1940720797; 137598349]
  = [4; 4; 255; 0; 137598349; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0867 :
  avoidanceCalc_fun [0; 2; 1; 0; 1; 2; 3118491743; 3591711054; 1340332038]
  = [1; 1; 255; 0; 1340332038; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0868 :
  avoidanceCalc_fun [7; 2; 0; 1; 0; 4; 1431796641; 3553508996; 4094836376]
  = [0; 0; 1431796641; 3553508996; 4094836376; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0869 :
  avoidanceCalc_fun [4; 2; 0; 2; 4; 0; 1677285651; 659332303; 2943686960]
  = [4; 4; 255; 0; 2943686960; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0870 :
  avoidanceCalc_fun [4; 1; 0; 0; 0; 2; 663053716; 4104185133; 2184954142]
  = [0; 0; 663053716; 4104185133; 2184954142; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0871 :
  avoidanceCalc_fun [4; 1; 1; 1; 0; 0; 182784419; 1428836683; 917670384]
  = [0; 0; 182784419; 1428836683; 917670384; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0872 :
  avoidanceCalc_fun [5; 1; 0; 2; 0; 4; 2707923675; 123277423; 2072533533]
  = [0; 0; 2707923675; 123277423; 2072533533; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0873 :
  avoidanceCalc_fun [3; 1; 1; 0; 3; 1; 3677333186; 2468484919; 2277463722]
  = [1; 1; 3677333186; 2468484919; 2277463722; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0874 :
  avoidanceCalc_fun [5; 3; 0; 1; 1; 0; 46027443; 2877792366; 3930191748]
  = [1; 1; 255; 0; 3930191748; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0875 :
  avoidanceCalc_fun [7; 2; 0; 2; 4; 1; 3925032006; 3310307198; 289648735]
  = [4; 4; 255; 0; 289648735; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0876 :
  avoidanceCalc_fun [5; 1; 0; 0; 3; 1; 1272053675; 3657314423; 2707900653]
  = [3; 3; 255; 0; 2707900653; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0877 :
  avoidanceCalc_fun [3; 2; 0; 1; 2; 3; 1803300714; 766871982; 268872071]
  = [2; 2; 255; 0; 268872071; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0878 :
  avoidanceCalc_fun [3; 3; 1; 2; 4; 1; 3678739669; 2087339868; 1841592691]
  = [4; 4; 255; 0; 1841592691; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0879 :
  avoidanceCalc_fun [0; 2; 1; 0; 4; 1; 895030579; 4065579415; 2298751636]
  = [4; 4; 255; 0; 2298751636; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0880 :
  avoidanceCalc_fun [3; 1; 0; 1; 3; 1; 3748496626; 2292346109; 2654211802]
  = [1; 1; 3748496626; 2292346109; 2654211802; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0881 :
  avoidanceCalc_fun [1; 3; 0; 2; 1; 2; 2950381707; 3673773746; 568071175]
  = [1; 1; 255; 0; 568071175; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0882 :
  avoidanceCalc_fun [0; 1; 1; 0; 0; 2; 4202337767; 1596573643; 3468891188]
  = [0; 0; 4202337767; 1596573643; 3468891188; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0883 :
  avoidanceCalc_fun [2; 2; 1; 1; 4; 0; 4044256119; 2810834966; 193594419]
  = [4; 4; 255; 0; 193594419; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0884 :
  avoidanceCalc_fun [1; 3; 0; 2; 0; 2; 1896771551; 1410607971; 797957600]
  = [0; 0; 1896771551; 1410607971; 797957600; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0885 :
  avoidanceCalc_fun [4; 0; 0; 0; 0; 4; 4166395100; 2969627117; 1142491738]
  = [0; 0; 4166395100; 2969627117; 1142491738; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0886 :
  avoidanceCalc_fun [6; 0; 0; 1; 0; 1; 3545079272; 4113218611; 2477361133]
  = [0; 0; 3545079272; 4113218611; 2477361133; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0887 :
  avoidanceCalc_fun [5; 3; 1; 2; 1; 2; 4270943700; 1601261405; 1765389857]
  = [1; 1; 255; 0; 1765389857; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0888 :
  avoidanceCalc_fun [4; 0; 0; 0; 2; 0; 2323821695; 1404876147; 113818854]
  = [2; 2; 255; 0; 113818854; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0889 :
  avoidanceCalc_fun [7; 3; 0; 1; 1; 0; 1527099111; 982633847; 1886676616]
  = [1; 1; 255; 0; 1886676616; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0890 :
  avoidanceCalc_fun [2; 0; 0; 2; 4; 3; 462948589; 2348135283; 3193031234]
  = [4; 4; 255; 0; 3193031234; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0891 :
  avoidanceCalc_fun [6; 1; 1; 0; 2; 3; 136761694; 2797452457; 1740986321]
  = [2; 2; 255; 0; 1740986321; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0892 :
  avoidanceCalc_fun [5; 1; 0; 1; 1; 4; 1846553610; 672163682; 1323795335]
  = [1; 1; 255; 0; 1323795335; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0893 :
  avoidanceCalc_fun [6; 1; 0; 2; 2; 1; 1855148681; 2496197875; 131017498]
  = [2; 2; 255; 0; 131017498; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0894 :
  avoidanceCalc_fun [6; 0; 0; 0; 3; 0; 3261496935; 4210295534; 714083991]
  = [3; 3; 255; 0; 714083991; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0895 :
  avoidanceCalc_fun [4; 3; 1; 1; 4; 3; 3214945368; 1898222475; 4189606931]
  = [4; 4; 255; 0; 4189606931; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0896 :
  avoidanceCalc_fun [4; 2; 0; 2; 1; 4; 1452826143; 3796042668; 4018381219]
  = [1; 1; 255; 0; 4018381219; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0897 :
  avoidanceCalc_fun [5; 1; 0; 0; 2; 1; 1625861617; 502229542; 719833191]
  = [2; 2; 255; 0; 719833191; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0898 :
  avoidanceCalc_fun [1; 0; 1; 1; 3; 4; 3632080848; 2716341721; 1763858466]
  = [3; 3; 255; 0; 1763858466; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0899 :
  avoidanceCalc_fun [1; 0; 1; 2; 0; 2; 901598689; 1078103997; 2439095683]
  = [0; 0; 901598689; 1078103997; 2439095683; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0900 :
  avoidanceCalc_fun [5; 3; 1; 0; 3; 4; 777106250; 1576241329; 81016562]
  = [1; 1; 255; 0; 81016562; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0901 :
  avoidanceCalc_fun [6; 2; 1; 1; 0; 4; 3957595721; 4115576971; 1922425199]
  = [0; 0; 3957595721; 4115576971; 1922425199; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0902 :
  avoidanceCalc_fun [2; 2; 0; 2; 4; 2; 171991809; 3357768735; 340366642]
  = [4; 4; 255; 0; 340366642; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0903 :
  avoidanceCalc_fun [7; 2; 0; 0; 2; 2; 1703145223; 548889682; 622051899]
  = [2; 2; 1703145223; 548889682; 622051899; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0904 :
  avoidanceCalc_fun [6; 3; 0; 1; 2; 2; 987250703; 2575872413; 3503396743]
  = [1; 1; 255; 0; 3503396743; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0905 :
  avoidanceCalc_fun [1; 1; 0; 2; 0; 2; 3133379034; 2527840206; 3885403520]
  = [0; 0; 3133379034; 2527840206; 3885403520; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0906 :
  avoidanceCalc_fun [6; 0; 0; 0; 3; 3; 1087926893; 2782618420; 3421757135]
  = [3; 3; 1087926893; 2782618420; 3421757135; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0907 :
  avoidanceCalc_fun [0; 2; 0; 1; 1; 4; 2184420302; 4163011689; 3819377633]
  = [1; 1; 255; 0; 3819377633; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0908 :
  avoidanceCalc_fun [2; 1; 1; 2; 1; 1; 1148408634; 2344585070; 3303179180]
  = [1; 1; 1148408634; 2344585070; 3303179180; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0909 :
  avoidanceCalc_fun [3; 2; 1; 0; 1; 1; 3851815077; 2771874910; 2599391905]
  = [1; 1; 3851815077; 2771874910; 2599391905; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0910 :
  avoidanceCalc_fun [1; 3; 0; 1; 1; 1; 2853261202; 1190842900; 2190250797]
  = [1; 1; 2853261202; 1190842900; 2190250797; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0911 :
  avoidanceCalc_fun [7; 2; 0; 2; 1; 3; 306600511; 3794474117; 1780809850]
  = [1; 1; 255; 0; 1780809850; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0912 :
  avoidanceCalc_fun [3; 0; 0; 0; 2; 4; 3235237433; 881823412; 1298316685]
  = [2; 2; 255; 0; 1298316685; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0913 :
  avoidanceCalc_fun [7; 0; 0; 1; 0; 3; 1041167475; 455376348; 761913382]
  = [0; 0; 1041167475; 455376348; 761913382; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0914 :
  avoidanceCalc_fun [2; 3; 1; 2; 0; 1; 1118851257; 4229536098; 3515417594]
  = [0; 0; 1118851257; 4229536098; 3515417594; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0915 :
  avoidanceCalc_fun [3; 0; 0; 0; 3; 4; 3516855950; 2740570254; 3959542670]
  = [3; 3; 255; 0; 3959542670; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0916 :
  avoidanceCalc_fun [0; 0; 1; 1; 1; 1; 1893457163; 3873819208; 3608816001]
  = [1; 1; 1893457163; 3873819208; 3608816001; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0917 :
  avoidanceCalc_fun [5; 0; 1; 2; 1; 2; 2892841223; 1055946857; 247598192]
  = [1; 1; 255; 0; 247598192; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0918 :
  avoidanceCalc_fun [1; 3; 1; 0; 4; 3; 1570756342; 3513744018; 1545158437]
  = [1; 1; 255; 0; 1545158437; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0919 :
  avoidanceCalc_fun [3; 1; 1; 1; 3; 2; 2640504218; 1555825125; 2453862940]
  = [3; 3; 255; 0; 2453862940; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0920 :
  avoidanceCalc_fun [5; 1; 1; 2; 4; 3; 823675293; 3058208056; 502639964]
  = [4; 4; 255; 0; 502639964; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0921 :
  avoidanceCalc_fun [6; 0; 0; 0; 4; 2; 1584110413; 2593217032; 2868549186]
  = [4; 4; 255; 0; 2868549186; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0922 :
  avoidanceCalc_fun [6; 3; 0; 1; 3; 2; 1677754851; 3297576291; 3367999958]
  = [1; 1; 255; 0; 3367999958; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0923 :
  avoidanceCalc_fun [1; 0; 0; 2; 2; 3; 1501584476; 1891748992; 74729280]
  = [2; 2; 255; 0; 74729280; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0924 :
  avoidanceCalc_fun [2; 3; 0; 0; 0; 0; 1878839844; 521874543; 3587803273]
  = [0; 0; 1878839844; 521874543; 3587803273; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0925 :
  avoidanceCalc_fun [2; 2; 1; 1; 0; 1; 55589517; 3180696966; 4061348272]
  = [0; 0; 55589517; 3180696966; 4061348272; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0926 :
  avoidanceCalc_fun [7; 0; 1; 2; 2; 4; 1230308609; 3440000033; 3864045438]
  = [2; 2; 255; 0; 3864045438; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0927 :
  avoidanceCalc_fun [7; 3; 0; 0; 4; 1; 990840290; 2282007485; 1445930696]
  = [2; 2; 255; 0; 1445930696; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0928 :
  avoidanceCalc_fun [2; 2; 1; 1; 4; 3; 1959674556; 3195263685; 2468891631]
  = [4; 4; 255; 0; 2468891631; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0929 :
  avoidanceCalc_fun [7; 1; 0; 2; 0; 2; 2002815225; 1664546215; 287951607]
  = [0; 0; 2002815225; 1664546215; 287951607; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0930 :
  avoidanceCalc_fun [5; 2; 1; 0; 0; 1; 1683962040; 1204368445; 1175097609]
  = [1; 1; 1683962040; 1204368445; 1175097609; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0931 :
  avoidanceCalc_fun [7; 2; 0; 1; 1; 2; 1735703268; 3161196775; 3991729316]
  = [1; 1; 255; 0; 3991729316; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0932 :
  avoidanceCalc_fun [2; 2; 1; 2; 3; 1; 3875176410; 2966163850; 1257901907]
  = [3; 3; 255; 0; 1257901907; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0933 :
  avoidanceCalc_fun [4; 1; 1; 0; 1; 3; 3169215054; 1668529028; 680108808]
  = [1; 1; 255; 0; 680108808; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0934 :
  avoidanceCalc_fun [5; 2; 0; 1; 3; 2; 2282716499; 2240845557; 1632546057]
  = [3; 3; 255; 0; 1632546057; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0935 :
  avoidanceCalc_fun [1; 1; 1; 2; 0; 2; 3613438627; 41803298; 2679141865]
  = [0; 0; 3613438627; 41803298; 2679141865; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0936 :
  avoidanceCalc_fun [0; 1; 1; 0; 3; 2; 2696641400; 1566789502; 2538604735]
  = [3; 3; 255; 0; 2538604735; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0937 :
  avoidanceCalc_fun [0; 2; 1; 1; 4; 3; 1551432298; 4145696840; 3535556805]
  = [4; 4; 255; 0; 3535556805; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0938 :
  avoidanceCalc_fun [6; 2; 0; 2; 0; 2; 2768060584; 3251205932; 3156246839]
  = [0; 0; 2768060584; 3251205932; 3156246839; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0939 :
  avoidanceCalc_fun [0; 2; 1; 0; 1; 4; 2259247081; 2970698420; 1115504876]
  = [1; 1; 255; 0; 1115504876; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0940 :
  avoidanceCalc_fun [4; 3; 0; 1; 0; 1; 1210107115; 4156168329; 2494465862]
  = [0; 0; 1210107115; 4156168329; 2494465862; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0941 :
  avoidanceCalc_fun [0; 0; 0; 2; 2; 4; 2793813678; 2858245368; 2628715981]
  = [2; 2; 255; 0; 2628715981; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0942 :
  avoidanceCalc_fun [3; 3; 1; 0; 2; 0; 2954405275; 222869033; 2672128634]
  = [1; 1; 255; 0; 2672128634; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0943 :
  avoidanceCalc_fun [3; 2; 1; 1; 0; 3; 2245221337; 878653580; 2007090331]
  = [0; 0; 2245221337; 878653580; 2007090331; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0944 :
  avoidanceCalc_fun [2; 0; 0; 2; 1; 4; 924974407; 3914523880; 858966922]
  = [1; 1; 255; 0; 858966922; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0945 :
  avoidanceCalc_fun [2; 3; 0; 0; 2; 3; 2754067777; 2823869646; 1404206254]
  = [2; 2; 255; 0; 1404206254; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0946 :
  avoidanceCalc_fun [1; 2; 1; 1; 4; 4; 1725395826; 2668469746; 3869879323]
  = [4; 4; 1725395826; 2668469746; 3869879323; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0947 :
  avoidanceCalc_fun [5; 0; 1; 2; 4; 2; 2969716463; 2328202277; 1704145950]
  = [4; 4; 255; 0; 1704145950; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0948 :
  avoidanceCalc_fun [4; 3; 0; 0; 4; 4; 733306717; 1789951236; 224617906]
  = [2; 2; 255; 0; 224617906; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0949 :
  avoidanceCalc_fun [1; 3; 0; 1; 1; 2; 4106154670; 3560233310; 3112676490]
  = [1; 1; 255; 0; 3112676490; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0950 :
  avoidanceCalc_fun [2; 2; 1; 2; 0; 2; 3414912622; 2889009630; 3409954751]
  = [0; 0; 3414912622; 2889009630; 3409954751; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0951 :
  avoidanceCalc_fun [1; 3; 0; 0; 0; 2; 815526851; 1231412029; 3716750414]
  = [0; 0; 815526851; 1231412029; 3716750414; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0952 :
  avoidanceCalc_fun [7; 0; 0; 1; 2; 4; 1864957601; 726673101; 988540084]
  = [2; 2; 255; 0; 988540084; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0953 :
  avoidanceCalc_fun [7; 0; 1; 2; 1; 3; 1493988743; 1971256117; 2111079214]
  = [1; 1; 255; 0; 2111079214; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0954 :
  avoidanceCalc_fun [4; 0; 0; 0; 2; 2; 3097215355; 3235549417; 3240079126]
  = [2; 2; 3097215355; 3235549417; 3240079126; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0955 :
  avoidanceCalc_fun [0; 2; 1; 1; 2; 3; 1058212499; 4080979247; 844451371]
  = [2; 2; 255; 0; 844451371; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0956 :
  avoidanceCalc_fun [1; 1; 1; 2; 1; 0; 252891304; 4072605447; 1107937057]
  = [1; 1; 255; 0; 1107937057; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0957 :
  avoidanceCalc_fun [3; 0; 0; 0; 0; 3; 1353523628; 2478478843; 2527415707]
  = [0; 0; 1353523628; 2478478843; 2527415707; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0958 :
  avoidanceCalc_fun [4; 0; 1; 1; 2; 1; 941203069; 999586063; 1786271074]
  = [2; 2; 255; 0; 1786271074; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0959 :
  avoidanceCalc_fun [4; 3; 0; 2; 0; 2; 3254283024; 2267967974; 4032985881]
  = [0; 0; 3254283024; 2267967974; 4032985881; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0960 :
  avoidanceCalc_fun [2; 3; 0; 0; 1; 2; 2958755753; 3173259187; 118316392]
  = [1; 1; 255; 0; 118316392; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0961 :
  avoidanceCalc_fun [6; 2; 0; 1; 4; 0; 2450740343; 125085183; 2856593044]
  = [4; 4; 255; 0; 2856593044; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0962 :
  avoidanceCalc_fun [6; 3; 1; 2; 3; 4; 892692585; 3240580483; 139940444]
  = [3; 3; 255; 0; 139940444; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0963 :
  avoidanceCalc_fun [4; 0; 1; 0; 2; 4; 1712231610; 642272586; 3096731209]
  = [2; 2; 255; 0; 3096731209; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0964 :
  avoidanceCalc_fun [1; 0; 1; 1; 0; 0; 837692865; 3829823798; 1476188231]
  = [0; 0; 837692865; 3829823798; 1476188231; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0965 :
  avoidanceCalc_fun [3; 2; 1; 2; 1; 3; 1577898088; 3652573039; 3481884943]
  = [1; 1; 255; 0; 3481884943; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0966 :
  avoidanceCalc_fun [1; 2; 0; 0; 4; 3; 680571022; 1795019235; 3078983882]
  = [4; 4; 255; 0; 3078983882; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0967 :
  avoidanceCalc_fun [4; 0; 0; 1; 3; 3; 3336309572; 2842748124; 3270242954]
  = [3; 3; 3336309572; 2842748124; 3270242954; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0968 :
  avoidanceCalc_fun [0; 1; 0; 2; 4; 0; 3071970370; 3916213882; 198421638]
  = [4; 4; 255; 0; 198421638; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0969 :
  avoidanceCalc_fun [6; 3; 1; 0; 1; 4; 2939439926; 2962996947; 4177719195]
  = [1; 1; 255; 0; 4177719195; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0970 :
  avoidanceCalc_fun [7; 1; 1; 1; 4; 4; 3167635119; 213575615; 3298662956]
  = [4; 4; 3167635119; 213575615; 3298662956; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0971 :
  avoidanceCalc_fun [0; 0; 1; 2; 2; 0; 2091536586; 2785738707; 1925927987]
  = [2; 2; 255; 0; 1925927987; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0972 :
  avoidanceCalc_fun [5; 1; 0; 0; 4; 4; 1739518821; 1925562565; 1489482313]
  = [4; 4; 1739518821; 1925562565; 1489482313; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0973 :
  avoidanceCalc_fun [4; 2; 0; 1; 4; 3; 3487502575; 3599194518; 866668995]
  = [4; 4; 255; 0; 866668995; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0974 :
  avoidanceCalc_fun [1; 2; 1; 2; 4; 1; 1415311468; 2961176289; 2930438251]
  = [4; 4; 255; 0; 2930438251; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0975 :
  avoidanceCalc_fun [6; 1; 1; 0; 1; 0; 2881859646; 1314553898; 3335149345]
  = [1; 1; 255; 0; 3335149345; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0976 :
  avoidanceCalc_fun [6; 3; 0; 1; 1; 4; 1069244095; 637841624; 4185548801]
  = [1; 1; 255; 0; 4185548801; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0977 :
  avoidanceCalc_fun [3; 0; 0; 2; 2; 1; 587786408; 3176637134; 1504420836]
  = [2; 2; 255; 0; 1504420836; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0978 :
  avoidanceCalc_fun [3; 2; 0; 0; 4; 1; 259552254; 2575319870; 4073365346]
  = [4; 4; 255; 0; 4073365346; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0979 :
  avoidanceCalc_fun [2; 2; 0; 1; 3; 3; 830268277; 2422204703; 829534644]
  = [3; 3; 830268277; 2422204703; 829534644; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0980 :
  avoidanceCalc_fun [7; 1; 0; 2; 1; 4; 2617795842; 3350149897; 4174224830]
  = [1; 1; 255; 0; 4174224830; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0981 :
  avoidanceCalc_fun [4; 3; 1; 0; 3; 3; 3800792309; 2760313129; 2827003049]
  = [3; 3; 3800792309; 2760313129; 2827003049; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0982 :
  avoidanceCalc_fun [0; 2; 1; 1; 2; 2; 4277792960; 69391243; 2143955407]
  = [2; 2; 4277792960; 69391243; 2143955407; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0983 :
  avoidanceCalc_fun [1; 2; 0; 2; 2; 3; 3424749266; 1148962011; 2337551]
  = [2; 2; 255; 0; 2337551; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0984 :
  avoidanceCalc_fun [0; 0; 1; 0; 1; 2; 1477483618; 1032988573; 2591707363]
  = [1; 1; 255; 0; 2591707363; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0985 :
  avoidanceCalc_fun [3; 2; 0; 1; 0; 3; 3654537705; 1028318130; 2850025987]
  = [0; 0; 3654537705; 1028318130; 2850025987; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0986 :
  avoidanceCalc_fun [3; 2; 1; 2; 1; 4; 3271318391; 4177747356; 929552628]
  = [1; 1; 255; 0; 929552628; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0987 :
  avoidanceCalc_fun [6; 3; 0; 0; 4; 1; 2878214441; 1299634523; 1649805575]
  = [2; 2; 255; 0; 1649805575; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0988 :
  avoidanceCalc_fun [7; 2; 1; 1; 1; 0; 2152376411; 3134942017; 3920585669]
  = [1; 1; 255; 0; 3920585669; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0989 :
  avoidanceCalc_fun [4; 0; 0; 2; 2; 4; 2580058523; 3019673500; 2885450168]
  = [2; 2; 255; 0; 2885450168; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0990 :
  avoidanceCalc_fun [1; 1; 1; 0; 0; 3; 2203623757; 1461734947; 3258710418]
  = [1; 1; 255; 0; 3258710418; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0991 :
  avoidanceCalc_fun [0; 2; 1; 1; 3; 0; 1964601875; 2971767495; 3382976005]
  = [3; 3; 255; 0; 3382976005; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0992 :
  avoidanceCalc_fun [1; 1; 1; 2; 2; 1; 3870691391; 1404542476; 4102041849]
  = [2; 2; 255; 0; 4102041849; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0993 :
  avoidanceCalc_fun [1; 1; 1; 0; 3; 1; 1823093986; 900559454; 1563203743]
  = [1; 1; 1823093986; 900559454; 1563203743; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0994 :
  avoidanceCalc_fun [4; 0; 0; 1; 0; 1; 1076815936; 677498389; 404043103]
  = [0; 0; 1076815936; 677498389; 404043103; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0995 :
  avoidanceCalc_fun [2; 0; 0; 2; 2; 0; 3574808728; 3252480961; 706835725]
  = [2; 2; 255; 0; 706835725; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0996 :
  avoidanceCalc_fun [0; 0; 0; 0; 3; 2; 3158452281; 2240362436; 4087239031]
  = [3; 3; 255; 0; 4087239031; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0997 :
  avoidanceCalc_fun [1; 1; 0; 1; 3; 0; 1780242500; 3621677774; 1959413638]
  = [3; 3; 255; 0; 1959413638; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0998 :
  avoidanceCalc_fun [3; 0; 0; 2; 1; 0; 1514766464; 343833470; 1828867954]
  = [1; 1; 255; 0; 1828867954; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0999 :
  avoidanceCalc_fun [7; 1; 0; 0; 2; 1; 1435167132; 1080033008; 1806127030]
  = [2; 2; 255; 0; 1806127030; 99; 0].
Proof. vm_compute. reflexivity. Qed.


Example negative_control_wrong_expected :
  avoidanceCalc_fun [2; 3; 0; 0; 2; 2; 1834637422; 1084402589; 160188456]
  <> [3; 2; 1834637422; 1084402589; 160188456; 99; 0].
Proof. vm_compute. discriminate. Qed.
