(* 由 FloatTest/tools/emit_tests.py 自动生成，请勿手改。
 * 每条约 1000 条向量一条 vm_compute 定理；coqc 编译通过即差分测试通过。 *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.
Require Import OUTPUT.orbiter_new.CruDataReadFromTr32.rocq.spec.

Import ListNotations.
Local Open Scope Z_scope.


Example t_0000 :
  cruDataReadFromTr32_fun [0; 0]
  = [128; 1; 0; 0; 0; 0; 0; 0; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0001 :
  cruDataReadFromTr32_fun [4294967295; 1]
  = [128; 1; 255; 255; 255; 255; 0; 0; 0; 126; 9021].
Proof. vm_compute. reflexivity. Qed.


Example t_0002 :
  cruDataReadFromTr32_fun [2585872506; 4059995495]
  = [128; 1; 154; 33; 72; 122; 167; 113; 94; 147; 68421].
Proof. vm_compute. reflexivity. Qed.


Example t_0003 :
  cruDataReadFromTr32_fun [7999096; 2323203961]
  = [128; 1; 0; 122; 14; 120; 178; 164; 131; 127; 64748].
Proof. vm_compute. reflexivity. Qed.


Example t_0004 :
  cruDataReadFromTr32_fun [2702038149; 1834637422]
  = [128; 1; 161; 13; 212; 133; 224; 223; 179; 23; 66049].
Proof. vm_compute. reflexivity. Qed.


Example t_0005 :
  cruDataReadFromTr32_fun [1084402589; 160188456]
  = [128; 1; 64; 162; 171; 157; 253; 58; 119; 117; 66116].
Proof. vm_compute. reflexivity. Qed.


Example t_0006 :
  cruDataReadFromTr32_fun [2948726956; 416004509]
  = [128; 1; 175; 194; 0; 172; 252; 211; 21; 143; 65275].
Proof. vm_compute. reflexivity. Qed.


Example t_0007 :
  cruDataReadFromTr32_fun [2931305906; 3631388369]
  = [128; 1; 174; 184; 45; 178; 15; 144; 255; 97; 65314].
Proof. vm_compute. reflexivity. Qed.


Example t_0008 :
  cruDataReadFromTr32_fun [3027916968; 2141877501]
  = [128; 1; 180; 122; 88; 168; 10; 10; 98; 43; 57491].
Proof. vm_compute. reflexivity. Qed.


Example t_0009 :
  cruDataReadFromTr32_fun [3848658849; 1481159309]
  = [128; 1; 229; 101; 223; 161; 177; 118; 115; 148; 65560].
Proof. vm_compute. reflexivity. Qed.


Example t_0010 :
  cruDataReadFromTr32_fun [641665090; 1959579487]
  = [128; 1; 38; 63; 8; 66; 23; 217; 232; 99; 63603].
Proof. vm_compute. reflexivity. Qed.


Example t_0011 :
  cruDataReadFromTr32_fun [227576381; 1540848358]
  = [128; 1; 13; 144; 138; 61; 157; 118; 130; 87; 65258].
Proof. vm_compute. reflexivity. Qed.


Example t_0012 :
  cruDataReadFromTr32_fun [416437868; 2689063878]
  = [128; 1; 24; 210; 86; 108; 156; 120; 93; 166; 65476].
Proof. vm_compute. reflexivity. Qed.


Example t_0013 :
  cruDataReadFromTr32_fun [867344185; 1036791916]
  = [128; 1; 51; 178; 159; 57; 219; 254; 164; 205; 65536].
Proof. vm_compute. reflexivity. Qed.


Example t_0014 :
  cruDataReadFromTr32_fun [2195624457; 607830180]
  = [128; 1; 130; 222; 146; 9; 124; 4; 35; 101; 64644].
Proof. vm_compute. reflexivity. Qed.


Example t_0015 :
  cruDataReadFromTr32_fun [2199782105; 4016269080]
  = [128; 1; 131; 30; 2; 217; 69; 110; 39; 193; 64408].
Proof. vm_compute. reflexivity. Qed.


Example t_0016 :
  cruDataReadFromTr32_fun [2096976300; 2030682621]
  = [128; 1; 124; 253; 81; 172; 136; 212; 142; 47; 64232].
Proof. vm_compute. reflexivity. Qed.


Example t_0017 :
  cruDataReadFromTr32_fun [1610427099; 2175854420]
  = [128; 1; 95; 253; 42; 219; 182; 191; 237; 135; 65229].
Proof. vm_compute. reflexivity. Qed.


Example t_0018 :
  cruDataReadFromTr32_fun [1797078221; 792075010]
  = [128; 1; 107; 29; 60; 205; 214; 244; 162; 203; 65825].
Proof. vm_compute. reflexivity. Qed.


Example t_0019 :
  cruDataReadFromTr32_fun [828990927; 2484093179]
  = [128; 1; 49; 105; 101; 207; 165; 121; 162; 84; 65921].
Proof. vm_compute. reflexivity. Qed.


Example t_0020 :
  cruDataReadFromTr32_fun [1952373191; 309148250]
  = [128; 1; 116; 94; 217; 199; 152; 142; 204; 109; 65394].
Proof. vm_compute. reflexivity. Qed.


Example t_0021 :
  cruDataReadFromTr32_fun [468172741; 3295867895]
  = [128; 1; 27; 231; 191; 197; 144; 238; 199; 78; 65691].
Proof. vm_compute. reflexivity. Qed.


Example t_0022 :
  cruDataReadFromTr32_fun [4140822242; 2508380880]
  = [128; 1; 246; 207; 238; 226; 34; 186; 124; 18; 65020].
Proof. vm_compute. reflexivity. Qed.


Example t_0023 :
  cruDataReadFromTr32_fun [3567788904; 3699136154]
  = [128; 1; 212; 168; 35; 104; 54; 87; 25; 206; 65691].
Proof. vm_compute. reflexivity. Qed.


Example t_0024 :
  cruDataReadFromTr32_fun [2048712859; 1461585734]
  = [128; 1; 122; 28; 224; 155; 178; 2; 124; 85; 65118].
Proof. vm_compute. reflexivity. Qed.


Example t_0025 :
  cruDataReadFromTr32_fun [1488081395; 491460992]
  = [128; 1; 88; 178; 81; 243; 224; 243; 248; 115; 72506].
Proof. vm_compute. reflexivity. Qed.


Example t_0026 :
  cruDataReadFromTr32_fun [2424482578; 179949170]
  = [128; 1; 144; 130; 171; 18; 226; 176; 21; 160; 65897].
Proof. vm_compute. reflexivity. Qed.


Example t_0027 :
  cruDataReadFromTr32_fun [3989753463; 852570605]
  = [128; 1; 237; 206; 206; 119; 35; 150; 147; 10; 64915].
Proof. vm_compute. reflexivity. Qed.


Example t_0028 :
  cruDataReadFromTr32_fun [858867427; 2021610932]
  = [128; 1; 51; 49; 70; 227; 250; 92; 203; 47; 63794].
Proof. vm_compute. reflexivity. Qed.


Example t_0029 :
  cruDataReadFromTr32_fun [3901575170; 1013579452]
  = [128; 1; 232; 141; 80; 2; 225; 34; 175; 70; 65406].
Proof. vm_compute. reflexivity. Qed.


Example t_0030 :
  cruDataReadFromTr32_fun [3121760245; 3330688873]
  = [128; 1; 186; 18; 71; 245; 54; 175; 181; 12; 64881].
Proof. vm_compute. reflexivity. Qed.


Example t_0031 :
  cruDataReadFromTr32_fun [1319110686; 2393117005]
  = [128; 1; 78; 160; 8; 30; 18; 4; 157; 81; 64434].
Proof. vm_compute. reflexivity. Qed.


Example t_0032 :
  cruDataReadFromTr32_fun [2333473842; 1181920670]
  = [128; 1; 139; 21; 252; 50; 125; 250; 29; 148; 64893].
Proof. vm_compute. reflexivity. Qed.


Example t_0033 :
  cruDataReadFromTr32_fun [4255053180; 110684461]
  = [128; 1; 253; 158; 245; 124; 67; 122; 162; 207; 65212].
Proof. vm_compute. reflexivity. Qed.


Example t_0034 :
  cruDataReadFromTr32_fun [104609039; 4157288261]
  = [128; 1; 6; 60; 53; 15; 244; 8; 168; 74; 65439].
Proof. vm_compute. reflexivity. Qed.


Example t_0035 :
  cruDataReadFromTr32_fun [2544699736; 475054858]
  = [128; 1; 151; 173; 9; 88; 163; 189; 203; 78; 65656].
Proof. vm_compute. reflexivity. Qed.


Example t_0036 :
  cruDataReadFromTr32_fun [3727440680; 3405359790]
  = [128; 1; 222; 44; 59; 40; 144; 7; 231; 122; 67064].
Proof. vm_compute. reflexivity. Qed.


Example t_0037 :
  cruDataReadFromTr32_fun [2501251076; 2799583687]
  = [128; 1; 149; 22; 16; 4; 93; 88; 177; 189; 65340].
Proof. vm_compute. reflexivity. Qed.


Example t_0038 :
  cruDataReadFromTr32_fun [4144982284; 916535896]
  = [128; 1; 247; 15; 105; 12; 17; 11; 90; 180; 65256].
Proof. vm_compute. reflexivity. Qed.


Example t_0039 :
  cruDataReadFromTr32_fun [1947740373; 85267206]
  = [128; 1; 116; 24; 40; 213; 249; 140; 152; 207; 66627].
Proof. vm_compute. reflexivity. Qed.


Example t_0040 :
  cruDataReadFromTr32_fun [2304350366; 2730927896]
  = [128; 1; 137; 89; 152; 158; 73; 230; 125; 134; 65693].
Proof. vm_compute. reflexivity. Qed.


Example t_0041 :
  cruDataReadFromTr32_fun [3245085510; 1050618699]
  = [128; 1; 193; 108; 19; 70; 210; 98; 141; 123; 65102].
Proof. vm_compute. reflexivity. Qed.


Example t_0042 :
  cruDataReadFromTr32_fun [466949431; 3201851748]
  = [128; 1; 27; 213; 21; 55; 201; 45; 101; 211; 65121].
Proof. vm_compute. reflexivity. Qed.


Example t_0043 :
  cruDataReadFromTr32_fun [1532544032; 3849002966]
  = [128; 1; 91; 88; 196; 32; 43; 125; 143; 74; 65252].
Proof. vm_compute. reflexivity. Qed.


Example t_0044 :
  cruDataReadFromTr32_fun [4170962501; 1277173222]
  = [128; 1; 248; 155; 214; 69; 188; 138; 171; 95; 65172].
Proof. vm_compute. reflexivity. Qed.


Example t_0045 :
  cruDataReadFromTr32_fun [4284837282; 1697597231]
  = [128; 1; 255; 101; 109; 162; 49; 217; 189; 243; 65918].
Proof. vm_compute. reflexivity. Qed.


Example t_0046 :
  cruDataReadFromTr32_fun [1260726674; 2868910329]
  = [128; 1; 75; 37; 41; 146; 32; 49; 141; 25; 52060].
Proof. vm_compute. reflexivity. Qed.


Example t_0047 :
  cruDataReadFromTr32_fun [3071298556; 4013102487]
  = [128; 1; 183; 16; 75; 252; 97; 104; 1; 229; 63792].
Proof. vm_compute. reflexivity. Qed.


Example t_0048 :
  cruDataReadFromTr32_fun [3121116699; 2962018220]
  = [128; 1; 186; 8; 118; 27; 79; 227; 124; 111; 65241].
Proof. vm_compute. reflexivity. Qed.


Example t_0049 :
  cruDataReadFromTr32_fun [2746698577; 815430317]
  = [128; 1; 163; 183; 75; 81; 192; 90; 39; 36; 64641].
Proof. vm_compute. reflexivity. Qed.


Example t_0050 :
  cruDataReadFromTr32_fun [2727178621; 3007795024]
  = [128; 1; 162; 141; 113; 125; 146; 237; 202; 45; 66006].
Proof. vm_compute. reflexivity. Qed.


Example t_0051 :
  cruDataReadFromTr32_fun [1143785903; 1064236210]
  = [128; 1; 68; 44; 201; 175; 188; 56; 45; 253; 64899].
Proof. vm_compute. reflexivity. Qed.


Example t_0052 :
  cruDataReadFromTr32_fun [2077474720; 1580560749]
  = [128; 1; 123; 211; 191; 160; 56; 87; 4; 179; 64978].
Proof. vm_compute. reflexivity. Qed.


Example t_0053 :
  cruDataReadFromTr32_fun [616452591; 3811539727]
  = [128; 1; 36; 190; 81; 239; 217; 76; 94; 96; 64836].
Proof. vm_compute. reflexivity. Qed.


Example t_0054 :
  cruDataReadFromTr32_fun [104679164; 1752495118]
  = [128; 1; 6; 61; 70; 252; 216; 66; 89; 238; 65155].
Proof. vm_compute. reflexivity. Qed.


Example t_0055 :
  cruDataReadFromTr32_fun [1629325662; 3867425402]
  = [128; 1; 97; 29; 137; 94; 188; 182; 139; 228; 65163].
Proof. vm_compute. reflexivity. Qed.


Example t_0056 :
  cruDataReadFromTr32_fun [2366403405; 4282808917]
  = [128; 1; 141; 12; 115; 77; 49; 3; 35; 120; 62613].
Proof. vm_compute. reflexivity. Qed.


Example t_0057 :
  cruDataReadFromTr32_fun [531599710; 4009469808]
  = [128; 1; 31; 175; 145; 94; 174; 135; 161; 238; 66155].
Proof. vm_compute. reflexivity. Qed.


Example t_0058 :
  cruDataReadFromTr32_fun [1534203068; 1701088305]
  = [128; 1; 91; 114; 20; 188; 168; 83; 161; 11; 64978].
Proof. vm_compute. reflexivity. Qed.


Example t_0059 :
  cruDataReadFromTr32_fun [4119054171; 1293521822]
  = [128; 1; 245; 131; 199; 91; 53; 52; 2; 189; 64363].
Proof. vm_compute. reflexivity. Qed.


Example t_0060 :
  cruDataReadFromTr32_fun [3259056199; 3945171397]
  = [128; 1; 194; 65; 64; 71; 106; 95; 153; 2; 65585].
Proof. vm_compute. reflexivity. Qed.


Example t_0061 :
  cruDataReadFromTr32_fun [268515021; 2257863886]
  = [128; 1; 16; 1; 54; 205; 211; 143; 88; 255; 64829].
Proof. vm_compute. reflexivity. Qed.


Example t_0062 :
  cruDataReadFromTr32_fun [2602269560; 2031826070]
  = [128; 1; 155; 27; 123; 120; 175; 154; 145; 226; 65096].
Proof. vm_compute. reflexivity. Qed.


Example t_0063 :
  cruDataReadFromTr32_fun [1592655855; 3993792721]
  = [128; 1; 94; 237; 255; 239; 119; 25; 247; 158; 65251].
Proof. vm_compute. reflexivity. Qed.


Example t_0064 :
  cruDataReadFromTr32_fun [2773562277; 56371716]
  = [128; 1; 165; 81; 51; 165; 80; 10; 11; 161; 65719].
Proof. vm_compute. reflexivity. Qed.


Example t_0065 :
  cruDataReadFromTr32_fun [4048986395; 2253103312]
  = [128; 1; 241; 86; 161; 27; 144; 219; 104; 75; 66341].
Proof. vm_compute. reflexivity. Qed.


Example t_0066 :
  cruDataReadFromTr32_fun [4259067285; 575107974]
  = [128; 1; 253; 220; 53; 149; 255; 78; 133; 15; 64741].
Proof. vm_compute. reflexivity. Qed.


Example t_0067 :
  cruDataReadFromTr32_fun [1715237938; 1370505989]
  = [128; 1; 102; 60; 116; 50; 236; 173; 179; 173; 65596].
Proof. vm_compute. reflexivity. Qed.


Example t_0068 :
  cruDataReadFromTr32_fun [3076050212; 3739037224]
  = [128; 1; 183; 88; 205; 36; 71; 18; 178; 252; 65475].
Proof. vm_compute. reflexivity. Qed.


Example t_0069 :
  cruDataReadFromTr32_fun [2112552610; 1958326642]
  = [128; 1; 125; 234; 254; 162; 102; 10; 6; 48; 65332].
Proof. vm_compute. reflexivity. Qed.


Example t_0070 :
  cruDataReadFromTr32_fun [155572166; 411112007]
  = [128; 1; 9; 69; 215; 198; 49; 77; 232; 255; 65859].
Proof. vm_compute. reflexivity. Qed.


Example t_0071 :
  cruDataReadFromTr32_fun [1197825707; 4002531162]
  = [128; 1; 71; 101; 94; 171; 161; 183; 68; 81; 65136].
Proof. vm_compute. reflexivity. Qed.


Example t_0072 :
  cruDataReadFromTr32_fun [3304864838; 4241546411]
  = [128; 1; 196; 252; 60; 70; 48; 153; 181; 27; 64955].
Proof. vm_compute. reflexivity. Qed.


Example t_0073 :
  cruDataReadFromTr32_fun [2888717819; 1551378740]
  = [128; 1; 172; 46; 85; 251; 139; 202; 198; 199; 65588].
Proof. vm_compute. reflexivity. Qed.


Example t_0074 :
  cruDataReadFromTr32_fun [1736762140; 1478874115]
  = [128; 1; 103; 132; 227; 28; 34; 73; 16; 153; 63843].
Proof. vm_compute. reflexivity. Qed.


Example t_0075 :
  cruDataReadFromTr32_fun [3456180122; 2664676001]
  = [128; 1; 206; 1; 31; 154; 153; 10; 181; 121; 65277].
Proof. vm_compute. reflexivity. Qed.


Example t_0076 :
  cruDataReadFromTr32_fun [3015475143; 2621168085]
  = [128; 1; 179; 188; 127; 199; 53; 109; 144; 114; 65373].
Proof. vm_compute. reflexivity. Qed.


Example t_0077 :
  cruDataReadFromTr32_fun [841903100; 1579728667]
  = [128; 1; 50; 46; 107; 252; 232; 101; 58; 97; 64170].
Proof. vm_compute. reflexivity. Qed.


Example t_0078 :
  cruDataReadFromTr32_fun [3026922238; 1648878536]
  = [128; 1; 180; 107; 42; 254; 118; 21; 43; 54; 65410].
Proof. vm_compute. reflexivity. Qed.


Example t_0079 :
  cruDataReadFromTr32_fun [2572036569; 2117681843]
  = [128; 1; 153; 78; 41; 217; 55; 182; 64; 166; 65787].
Proof. vm_compute. reflexivity. Qed.


Example t_0080 :
  cruDataReadFromTr32_fun [3754811868; 3685396826]
  = [128; 1; 223; 205; 225; 220; 217; 123; 221; 130; 65116].
Proof. vm_compute. reflexivity. Qed.


Example t_0081 :
  cruDataReadFromTr32_fun [1731509212; 266915014]
  = [128; 1; 103; 52; 187; 220; 75; 178; 82; 22; 65975].
Proof. vm_compute. reflexivity. Qed.


Example t_0082 :
  cruDataReadFromTr32_fun [4032211179; 2477606060]
  = [128; 1; 240; 86; 168; 235; 51; 75; 186; 63; 65291].
Proof. vm_compute. reflexivity. Qed.


Example t_0083 :
  cruDataReadFromTr32_fun [4215552019; 3243113683]
  = [128; 1; 251; 68; 56; 19; 224; 244; 164; 192; 65400].
Proof. vm_compute. reflexivity. Qed.


Example t_0084 :
  cruDataReadFromTr32_fun [3582039020; 2366047913]
  = [128; 1; 213; 129; 147; 236; 203; 253; 225; 195; 67489].
Proof. vm_compute. reflexivity. Qed.


Example t_0085 :
  cruDataReadFromTr32_fun [1642271603; 2977406040]
  = [128; 1; 97; 227; 19; 115; 108; 57; 163; 27; 64793].
Proof. vm_compute. reflexivity. Qed.


Example t_0086 :
  cruDataReadFromTr32_fun [3499133061; 690199989]
  = [128; 1; 208; 144; 136; 133; 57; 59; 197; 80; 65659].
Proof. vm_compute. reflexivity. Qed.


Example t_0087 :
  cruDataReadFromTr32_fun [2445274576; 555006389]
  = [128; 1; 145; 191; 237; 208; 251; 8; 14; 155; 65867].
Proof. vm_compute. reflexivity. Qed.


Example t_0088 :
  cruDataReadFromTr32_fun [1271809751; 3819395573]
  = [128; 1; 75; 206; 70; 215; 59; 211; 231; 98; 66432].
Proof. vm_compute. reflexivity. Qed.


Example t_0089 :
  cruDataReadFromTr32_fun [3612684048; 4089855209]
  = [128; 1; 215; 85; 47; 16; 198; 173; 102; 167; 65938].
Proof. vm_compute. reflexivity. Qed.


Example t_0090 :
  cruDataReadFromTr32_fun [2115147099; 1869955352]
  = [128; 1; 126; 18; 149; 91; 201; 61; 224; 67; 65561].
Proof. vm_compute. reflexivity. Qed.


Example t_0091 :
  cruDataReadFromTr32_fun [1901151859; 77734306]
  = [128; 1; 113; 81; 70; 115; 189; 191; 245; 209; 66147].
Proof. vm_compute. reflexivity. Qed.


Example t_0092 :
  cruDataReadFromTr32_fun [4251122481; 2902068500]
  = [128; 1; 253; 98; 251; 49; 205; 111; 120; 29; 64743].
Proof. vm_compute. reflexivity. Qed.


Example t_0093 :
  cruDataReadFromTr32_fun [1911644318; 281803970]
  = [128; 1; 113; 241; 96; 158; 199; 35; 196; 220; 64688].
Proof. vm_compute. reflexivity. Qed.


Example t_0094 :
  cruDataReadFromTr32_fun [782893329; 1602397523]
  = [128; 1; 46; 170; 1; 17; 144; 122; 5; 62; 65119].
Proof. vm_compute. reflexivity. Qed.


Example t_0095 :
  cruDataReadFromTr32_fun [3601946890; 2553683682]
  = [128; 1; 214; 177; 89; 10; 89; 138; 171; 40; 65501].
Proof. vm_compute. reflexivity. Qed.


Example t_0096 :
  cruDataReadFromTr32_fun [1896366461; 4006799978]
  = [128; 1; 113; 8; 65; 125; 235; 170; 140; 19; 64900].
Proof. vm_compute. reflexivity. Qed.


Example t_0097 :
  cruDataReadFromTr32_fun [757970221; 1996629974]
  = [128; 1; 45; 45; 181; 45; 55; 63; 120; 87; 64523].
Proof. vm_compute. reflexivity. Qed.


Example t_0098 :
  cruDataReadFromTr32_fun [568047863; 2997792179]
  = [128; 1; 33; 219; 184; 247; 198; 131; 228; 196; 65135].
Proof. vm_compute. reflexivity. Qed.


Example t_0099 :
  cruDataReadFromTr32_fun [2753444598; 4018100042]
  = [128; 1; 164; 30; 58; 246; 116; 74; 136; 172; 66034].
Proof. vm_compute. reflexivity. Qed.


Example t_0100 :
  cruDataReadFromTr32_fun [370742347; 2453364412]
  = [128; 1; 22; 25; 20; 75; 161; 141; 19; 143; 65067].
Proof. vm_compute. reflexivity. Qed.


Example t_0101 :
  cruDataReadFromTr32_fun [3548659683; 1084647523]
  = [128; 1; 211; 132; 63; 227; 230; 18; 9; 0; 65074].
Proof. vm_compute. reflexivity. Qed.


Example t_0102 :
  cruDataReadFromTr32_fun [2883272037; 1255485873]
  = [128; 1; 171; 219; 61; 101; 203; 158; 228; 52; 66123].
Proof. vm_compute. reflexivity. Qed.


Example t_0103 :
  cruDataReadFromTr32_fun [1863900075; 3187375811]
  = [128; 1; 111; 24; 219; 171; 174; 220; 190; 104; 66150].
Proof. vm_compute. reflexivity. Qed.


Example t_0104 :
  cruDataReadFromTr32_fun [2820587086; 2929729431]
  = [128; 1; 168; 30; 190; 78; 73; 142; 106; 55; 64091].
Proof. vm_compute. reflexivity. Qed.


Example t_0105 :
  cruDataReadFromTr32_fun [2723593429; 2002953571]
  = [128; 1; 162; 86; 188; 213; 220; 70; 200; 242; 65402].
Proof. vm_compute. reflexivity. Qed.


Example t_0106 :
  cruDataReadFromTr32_fun [4215737493; 3942243584]
  = [128; 1; 251; 71; 12; 149; 141; 59; 175; 149; 68240].
Proof. vm_compute. reflexivity. Qed.


Example t_0107 :
  cruDataReadFromTr32_fun [3134626789; 3925444404]
  = [128; 1; 186; 214; 155; 229; 205; 160; 174; 177; 65621].
Proof. vm_compute. reflexivity. Qed.


Example t_0108 :
  cruDataReadFromTr32_fun [2535797680; 892302350]
  = [128; 1; 151; 37; 51; 176; 249; 175; 198; 162; 64970].
Proof. vm_compute. reflexivity. Qed.


Example t_0109 :
  cruDataReadFromTr32_fun [44991783; 2953758873]
  = [128; 1; 2; 174; 133; 39; 90; 4; 9; 14; 65245].
Proof. vm_compute. reflexivity. Qed.


Example t_0110 :
  cruDataReadFromTr32_fun [3461466875; 3626281629]
  = [128; 1; 206; 81; 202; 251; 8; 130; 110; 222; 63170].
Proof. vm_compute. reflexivity. Qed.


Example t_0111 :
  cruDataReadFromTr32_fun [2551062176; 2624892947]
  = [128; 1; 152; 14; 30; 160; 53; 241; 120; 13; 65426].
Proof. vm_compute. reflexivity. Qed.


Example t_0112 :
  cruDataReadFromTr32_fun [714477778; 4010083463]
  = [128; 1; 42; 150; 16; 210; 190; 19; 79; 203; 65833].
Proof. vm_compute. reflexivity. Qed.


Example t_0113 :
  cruDataReadFromTr32_fun [1925219462; 3325016255]
  = [128; 1; 114; 192; 132; 134; 196; 109; 43; 71; 65197].
Proof. vm_compute. reflexivity. Qed.


Example t_0114 :
  cruDataReadFromTr32_fun [3660956112; 2631834993]
  = [128; 1; 218; 53; 193; 208; 172; 165; 220; 223; 65864].
Proof. vm_compute. reflexivity. Qed.


Example t_0115 :
  cruDataReadFromTr32_fun [1114477957; 2682568381]
  = [128; 1; 66; 109; 149; 133; 148; 232; 53; 72; 65916].
Proof. vm_compute. reflexivity. Qed.


Example t_0116 :
  cruDataReadFromTr32_fun [3664851605; 2832666704]
  = [128; 1; 218; 113; 50; 149; 157; 34; 74; 69; 64191].
Proof. vm_compute. reflexivity. Qed.


Example t_0117 :
  cruDataReadFromTr32_fun [465160795; 3580721219]
  = [128; 1; 27; 185; 202; 91; 253; 8; 115; 152; 66877].
Proof. vm_compute. reflexivity. Qed.


Example t_0118 :
  cruDataReadFromTr32_fun [328381606; 3141324480]
  = [128; 1; 19; 146; 180; 166; 246; 189; 69; 230; 65652].
Proof. vm_compute. reflexivity. Qed.


Example t_0119 :
  cruDataReadFromTr32_fun [306933269; 3661058991]
  = [128; 1; 18; 75; 110; 21; 83; 189; 241; 230; 64986].
Proof. vm_compute. reflexivity. Qed.


Example t_0120 :
  cruDataReadFromTr32_fun [478312712; 4037430171]
  = [128; 1; 28; 130; 121; 8; 127; 1; 250; 237; 65405].
Proof. vm_compute. reflexivity. Qed.


Example t_0121 :
  cruDataReadFromTr32_fun [1684060658; 3097047978]
  = [128; 1; 100; 96; 185; 242; 248; 97; 91; 72; 65221].
Proof. vm_compute. reflexivity. Qed.


Example t_0122 :
  cruDataReadFromTr32_fun [665122514; 2896821745]
  = [128; 1; 39; 164; 246; 210; 207; 249; 241; 97; 65710].
Proof. vm_compute. reflexivity. Qed.


Example t_0123 :
  cruDataReadFromTr32_fun [3601953970; 2917334870]
  = [128; 1; 214; 177; 116; 178; 26; 78; 32; 92; 58436].
Proof. vm_compute. reflexivity. Qed.


Example t_0124 :
  cruDataReadFromTr32_fun [1626655094; 2983533728]
  = [128; 1; 96; 244; 201; 118; 153; 173; 252; 214; 65835].
Proof. vm_compute. reflexivity. Qed.


Example t_0125 :
  cruDataReadFromTr32_fun [1055643606; 3500312781]
  = [128; 1; 62; 235; 215; 214; 191; 141; 181; 137; 65370].
Proof. vm_compute. reflexivity. Qed.


Example t_0126 :
  cruDataReadFromTr32_fun [152187730; 1681233791]
  = [128; 1; 9; 18; 51; 82; 191; 168; 91; 83; 65021].
Proof. vm_compute. reflexivity. Qed.


Example t_0127 :
  cruDataReadFromTr32_fun [1351978916; 794390943]
  = [128; 1; 80; 149; 143; 164; 205; 244; 237; 133; 66057].
Proof. vm_compute. reflexivity. Qed.


Example t_0128 :
  cruDataReadFromTr32_fun [2195048003; 3726312812]
  = [128; 1; 130; 213; 198; 67; 178; 61; 118; 215; 64797].
Proof. vm_compute. reflexivity. Qed.


Example t_0129 :
  cruDataReadFromTr32_fun [3739990495; 2023019206]
  = [128; 1; 222; 235; 185; 223; 176; 192; 74; 25; 65067].
Proof. vm_compute. reflexivity. Qed.


Example t_0130 :
  cruDataReadFromTr32_fun [380791147; 2067824643]
  = [128; 1; 22; 178; 105; 107; 59; 177; 234; 232; 72359].
Proof. vm_compute. reflexivity. Qed.


Example t_0131 :
  cruDataReadFromTr32_fun [3469466390; 1349908466]
  = [128; 1; 206; 203; 219; 22; 185; 81; 220; 36; 65028].
Proof. vm_compute. reflexivity. Qed.


Example t_0132 :
  cruDataReadFromTr32_fun [690648011; 260799044]
  = [128; 1; 41; 42; 115; 203; 223; 92; 27; 135; 65115].
Proof. vm_compute. reflexivity. Qed.


Example t_0133 :
  cruDataReadFromTr32_fun [77792907; 1561485189]
  = [128; 1; 4; 163; 6; 139; 48; 192; 105; 134; 63675].
Proof. vm_compute. reflexivity. Qed.


Example t_0134 :
  cruDataReadFromTr32_fun [4139597438; 2357211768]
  = [128; 1; 246; 189; 62; 126; 170; 86; 72; 6; 66562].
Proof. vm_compute. reflexivity. Qed.


Example t_0135 :
  cruDataReadFromTr32_fun [2293944054; 4205151545]
  = [128; 1; 136; 186; 206; 246; 224; 215; 230; 61; 64861].
Proof. vm_compute. reflexivity. Qed.


Example t_0136 :
  cruDataReadFromTr32_fun [3462247460; 2799348753]
  = [128; 1; 206; 93; 180; 36; 148; 217; 16; 147; 65197].
Proof. vm_compute. reflexivity. Qed.


Example t_0137 :
  cruDataReadFromTr32_fun [159519890; 3421530721]
  = [128; 1; 9; 130; 20; 146; 53; 198; 218; 177; 64991].
Proof. vm_compute. reflexivity. Qed.


Example t_0138 :
  cruDataReadFromTr32_fun [1396897310; 3178581374]
  = [128; 1; 83; 66; 246; 30; 80; 116; 103; 160; 65014].
Proof. vm_compute. reflexivity. Qed.


Example t_0139 :
  cruDataReadFromTr32_fun [2908956433; 400345470]
  = [128; 1; 173; 99; 39; 17; 131; 235; 28; 147; 65294].
Proof. vm_compute. reflexivity. Qed.


Example t_0140 :
  cruDataReadFromTr32_fun [1183751156; 3835750818]
  = [128; 1; 70; 142; 155; 244; 178; 98; 131; 82; 65557].
Proof. vm_compute. reflexivity. Qed.


Example t_0141 :
  cruDataReadFromTr32_fun [3389704999; 841437767]
  = [128; 1; 202; 10; 203; 39; 171; 140; 156; 96; 64550].
Proof. vm_compute. reflexivity. Qed.


Example t_0142 :
  cruDataReadFromTr32_fun [1093391954; 2583058781]
  = [128; 1; 65; 43; 214; 82; 162; 98; 43; 117; 64984].
Proof. vm_compute. reflexivity. Qed.


Example t_0143 :
  cruDataReadFromTr32_fun [2247819402; 1275723846]
  = [128; 1; 133; 251; 0; 138; 62; 241; 35; 68; 51247].
Proof. vm_compute. reflexivity. Qed.


Example t_0144 :
  cruDataReadFromTr32_fun [3430566603; 3802090910]
  = [128; 1; 204; 122; 74; 203; 57; 129; 204; 45; 65666].
Proof. vm_compute. reflexivity. Qed.


Example t_0145 :
  cruDataReadFromTr32_fun [1368202474; 4036684460]
  = [128; 1; 81; 141; 28; 234; 174; 103; 136; 62; 65456].
Proof. vm_compute. reflexivity. Qed.


Example t_0146 :
  cruDataReadFromTr32_fun [2844430185; 3210767780]
  = [128; 1; 169; 138; 143; 105; 154; 96; 243; 197; 66913].
Proof. vm_compute. reflexivity. Qed.


Example t_0147 :
  cruDataReadFromTr32_fun [3527758156; 1476097060]
  = [128; 1; 210; 69; 81; 76; 120; 3; 239; 40; 63047].
Proof. vm_compute. reflexivity. Qed.


Example t_0148 :
  cruDataReadFromTr32_fun [2867184185; 2012170832]
  = [128; 1; 170; 229; 194; 57; 42; 155; 159; 233; 65536].
Proof. vm_compute. reflexivity. Qed.


Example t_0149 :
  cruDataReadFromTr32_fun [1543191761; 3889933414]
  = [128; 1; 91; 251; 60; 209; 97; 245; 195; 107; 65036].
Proof. vm_compute. reflexivity. Qed.


Example t_0150 :
  cruDataReadFromTr32_fun [3510443309; 38773901]
  = [128; 1; 209; 61; 29; 45; 246; 191; 191; 32; 67018].
Proof. vm_compute. reflexivity. Qed.


Example t_0151 :
  cruDataReadFromTr32_fun [333723902; 3004634050]
  = [128; 1; 19; 228; 56; 254; 236; 87; 6; 60; 64879].
Proof. vm_compute. reflexivity. Qed.


Example t_0152 :
  cruDataReadFromTr32_fun [2982916898; 4169434850]
  = [128; 1; 177; 203; 179; 34; 251; 138; 157; 64; 64961].
Proof. vm_compute. reflexivity. Qed.


Example t_0153 :
  cruDataReadFromTr32_fun [976588099; 1499015932]
  = [128; 1; 58; 53; 141; 67; 141; 113; 224; 71; 65766].
Proof. vm_compute. reflexivity. Qed.


Example t_0154 :
  cruDataReadFromTr32_fun [1099337848; 2100008209]
  = [128; 1; 65; 134; 144; 120; 90; 37; 131; 231; 66308].
Proof. vm_compute. reflexivity. Qed.


Example t_0155 :
  cruDataReadFromTr32_fun [2987730357; 3461843180]
  = [128; 1; 178; 21; 37; 181; 15; 130; 18; 201; 64789].
Proof. vm_compute. reflexivity. Qed.


Example t_0156 :
  cruDataReadFromTr32_fun [3106395846; 3645060510]
  = [128; 1; 185; 39; 214; 198; 129; 127; 112; 40; 65527].
Proof. vm_compute. reflexivity. Qed.


Example t_0157 :
  cruDataReadFromTr32_fun [2198996670; 306652108]
  = [128; 1; 131; 18; 6; 190; 148; 92; 200; 242; 64189].
Proof. vm_compute. reflexivity. Qed.


Example t_0158 :
  cruDataReadFromTr32_fun [3703528926; 3567576837]
  = [128; 1; 220; 191; 93; 222; 90; 141; 249; 89; 64762].
Proof. vm_compute. reflexivity. Qed.


Example t_0159 :
  cruDataReadFromTr32_fun [1216711501; 2768928527]
  = [128; 1; 72; 133; 139; 77; 40; 186; 147; 190; 66071].
Proof. vm_compute. reflexivity. Qed.


Example t_0160 :
  cruDataReadFromTr32_fun [752610439; 3220928476]
  = [128; 1; 44; 219; 236; 135; 106; 156; 98; 171; 67962].
Proof. vm_compute. reflexivity. Qed.


Example t_0161 :
  cruDataReadFromTr32_fun [2105524885; 2659333746]
  = [128; 1; 125; 127; 194; 149; 32; 24; 197; 35; 64441].
Proof. vm_compute. reflexivity. Qed.


Example t_0162 :
  cruDataReadFromTr32_fun [1159332276; 1961232061]
  = [128; 1; 69; 26; 1; 180; 67; 55; 89; 119; 64059].
Proof. vm_compute. reflexivity. Qed.


Example t_0163 :
  cruDataReadFromTr32_fun [1612476097; 2574682112]
  = [128; 1; 96; 28; 110; 193; 129; 233; 230; 193; 75286].
Proof. vm_compute. reflexivity. Qed.


Example t_0164 :
  cruDataReadFromTr32_fun [537484734; 2343933810]
  = [128; 1; 32; 9; 93; 190; 111; 31; 127; 76; 65285].
Proof. vm_compute. reflexivity. Qed.


Example t_0165 :
  cruDataReadFromTr32_fun [1351181608; 2735864196]
  = [128; 1; 80; 137; 101; 40; 54; 116; 45; 164; 64538].
Proof. vm_compute. reflexivity. Qed.


Example t_0166 :
  cruDataReadFromTr32_fun [1554245742; 2174194097]
  = [128; 1; 92; 163; 232; 110; 166; 213; 47; 61; 65040].
Proof. vm_compute. reflexivity. Qed.


Example t_0167 :
  cruDataReadFromTr32_fun [2602097104; 3555867131]
  = [128; 1; 155; 24; 217; 208; 192; 67; 157; 85; 66107].
Proof. vm_compute. reflexivity. Qed.


Example t_0168 :
  cruDataReadFromTr32_fun [3875932490; 2211145847]
  = [128; 1; 231; 6; 9; 74; 72; 238; 220; 83; 65310].
Proof. vm_compute. reflexivity. Qed.


Example t_0169 :
  cruDataReadFromTr32_fun [353349604; 2711470024]
  = [128; 1; 21; 15; 175; 228; 66; 81; 212; 28; 65145].
Proof. vm_compute. reflexivity. Qed.


Example t_0170 :
  cruDataReadFromTr32_fun [2859678258; 1625856622]
  = [128; 1; 170; 115; 58; 50; 189; 215; 214; 196; 65492].
Proof. vm_compute. reflexivity. Qed.


Example t_0171 :
  cruDataReadFromTr32_fun [1338120552; 3884742121]
  = [128; 1; 79; 194; 25; 104; 46; 112; 151; 255; 64915].
Proof. vm_compute. reflexivity. Qed.


Example t_0172 :
  cruDataReadFromTr32_fun [3778651676; 51584192]
  = [128; 1; 225; 57; 166; 28; 103; 180; 233; 92; 63743].
Proof. vm_compute. reflexivity. Qed.


Example t_0173 :
  cruDataReadFromTr32_fun [946212633; 430395210]
  = [128; 1; 56; 102; 15; 25; 242; 102; 100; 207; 65034].
Proof. vm_compute. reflexivity. Qed.


Example t_0174 :
  cruDataReadFromTr32_fun [4153079262; 2231456147]
  = [128; 1; 247; 138; 245; 222; 243; 50; 109; 203; 67179].
Proof. vm_compute. reflexivity. Qed.


Example t_0175 :
  cruDataReadFromTr32_fun [3944694027; 3114378135]
  = [128; 1; 235; 31; 65; 11; 2; 79; 104; 244; 64904].
Proof. vm_compute. reflexivity. Qed.


Example t_0176 :
  cruDataReadFromTr32_fun [3829542109; 121349509]
  = [128; 1; 228; 66; 44; 221; 122; 217; 73; 216; 64977].
Proof. vm_compute. reflexivity. Qed.


Example t_0177 :
  cruDataReadFromTr32_fun [1894916061; 4041258808]
  = [128; 1; 112; 242; 31; 221; 240; 109; 4; 165; 65024].
Proof. vm_compute. reflexivity. Qed.


Example t_0178 :
  cruDataReadFromTr32_fun [2298557256; 2332875988]
  = [128; 1; 137; 1; 51; 72; 132; 98; 192; 116; 64393].
Proof. vm_compute. reflexivity. Qed.


Example t_0179 :
  cruDataReadFromTr32_fun [1412026879; 121545434]
  = [128; 1; 84; 41; 209; 255; 236; 60; 156; 37; 66684].
Proof. vm_compute. reflexivity. Qed.


Example t_0180 :
  cruDataReadFromTr32_fun [2729194741; 1674006162]
  = [128; 1; 162; 172; 52; 245; 34; 140; 47; 99; 65213].
Proof. vm_compute. reflexivity. Qed.


Example t_0181 :
  cruDataReadFromTr32_fun [3524080882; 2794146912]
  = [128; 1; 210; 13; 52; 242; 113; 40; 24; 146; 65474].
Proof. vm_compute. reflexivity. Qed.


Example t_0182 :
  cruDataReadFromTr32_fun [2713670765; 988098535]
  = [128; 1; 161; 191; 84; 109; 217; 114; 24; 6; 64838].
Proof. vm_compute. reflexivity. Qed.


Example t_0183 :
  cruDataReadFromTr32_fun [1890752848; 1925822926]
  = [128; 1; 112; 178; 153; 80; 98; 197; 198; 130; 64685].
Proof. vm_compute. reflexivity. Qed.


Example t_0184 :
  cruDataReadFromTr32_fun [813180223; 3145397872]
  = [128; 1; 48; 120; 37; 63; 50; 120; 102; 207; 66461].
Proof. vm_compute. reflexivity. Qed.


Example t_0185 :
  cruDataReadFromTr32_fun [2463367161; 3855184260]
  = [128; 1; 146; 211; 255; 249; 145; 195; 80; 117; 65748].
Proof. vm_compute. reflexivity. Qed.


Example t_0186 :
  cruDataReadFromTr32_fun [3060672920; 1254409895]
  = [128; 1; 182; 110; 41; 152; 206; 12; 182; 113; 65369].
Proof. vm_compute. reflexivity. Qed.


Example t_0187 :
  cruDataReadFromTr32_fun [2112629601; 1216158633]
  = [128; 1; 125; 236; 43; 97; 115; 252; 228; 56; 64806].
Proof. vm_compute. reflexivity. Qed.


Example t_0188 :
  cruDataReadFromTr32_fun [2069626181; 1070485288]
  = [128; 1; 123; 91; 253; 69; 34; 181; 66; 29; 67181].
Proof. vm_compute. reflexivity. Qed.


Example t_0189 :
  cruDataReadFromTr32_fun [2538289095; 1684285740]
  = [128; 1; 151; 75; 55; 199; 100; 251; 164; 155; 65440].
Proof. vm_compute. reflexivity. Qed.


Example t_0190 :
  cruDataReadFromTr32_fun [2659395499; 1914170486]
  = [128; 1; 158; 131; 39; 171; 56; 97; 118; 53; 65688].
Proof. vm_compute. reflexivity. Qed.


Example t_0191 :
  cruDataReadFromTr32_fun [832291362; 389765526]
  = [128; 1; 49; 155; 194; 34; 184; 13; 51; 140; 64470].
Proof. vm_compute. reflexivity. Qed.


Example t_0192 :
  cruDataReadFromTr32_fun [2800198426; 2591027220]
  = [128; 1; 166; 231; 163; 26; 68; 111; 189; 6; 65015].
Proof. vm_compute. reflexivity. Qed.


Example t_0193 :
  cruDataReadFromTr32_fun [2326221833; 4215645337]
  = [128; 1; 138; 167; 84; 9; 50; 51; 251; 240; 65414].
Proof. vm_compute. reflexivity. Qed.


Example t_0194 :
  cruDataReadFromTr32_fun [2593145195; 3001041161]
  = [128; 1; 154; 144; 65; 107; 87; 208; 132; 226; 65756].
Proof. vm_compute. reflexivity. Qed.


Example t_0195 :
  cruDataReadFromTr32_fun [2662253903; 2597238378]
  = [128; 1; 158; 174; 197; 79; 107; 59; 67; 229; 65163].
Proof. vm_compute. reflexivity. Qed.


Example t_0196 :
  cruDataReadFromTr32_fun [3328664700; 266326540]
  = [128; 1; 198; 103; 100; 124; 166; 112; 152; 112; 65201].
Proof. vm_compute. reflexivity. Qed.


Example t_0197 :
  cruDataReadFromTr32_fun [1097710907; 962707747]
  = [128; 1; 65; 109; 189; 59; 184; 236; 141; 152; 65247].
Proof. vm_compute. reflexivity. Qed.


Example t_0198 :
  cruDataReadFromTr32_fun [3026590057; 3944081609]
  = [128; 1; 180; 102; 25; 105; 84; 68; 149; 32; 64763].
Proof. vm_compute. reflexivity. Qed.


Example t_0199 :
  cruDataReadFromTr32_fun [3429273104; 649294130]
  = [128; 1; 204; 102; 142; 16; 255; 107; 181; 222; 65601].
Proof. vm_compute. reflexivity. Qed.


Example t_0200 :
  cruDataReadFromTr32_fun [4272213469; 3568698089]
  = [128; 1; 254; 164; 205; 221; 132; 240; 63; 116; 65788].
Proof. vm_compute. reflexivity. Qed.


Example t_0201 :
  cruDataReadFromTr32_fun [1112838304; 2847329163]
  = [128; 1; 66; 84; 144; 160; 116; 3; 138; 149; 63729].
Proof. vm_compute. reflexivity. Qed.


Example t_0202 :
  cruDataReadFromTr32_fun [3886923508; 2181334056]
  = [128; 1; 231; 173; 190; 244; 103; 235; 78; 204; 66518].
Proof. vm_compute. reflexivity. Qed.


Example t_0203 :
  cruDataReadFromTr32_fun [763057000; 990141681]
  = [128; 1; 45; 123; 83; 104; 116; 165; 110; 247; 63828].
Proof. vm_compute. reflexivity. Qed.


Example t_0204 :
  cruDataReadFromTr32_fun [44630544; 2614968621]
  = [128; 1; 2; 169; 2; 16; 85; 108; 87; 99; 64698].
Proof. vm_compute. reflexivity. Qed.


Example t_0205 :
  cruDataReadFromTr32_fun [304784432; 19498244]
  = [128; 1; 18; 42; 164; 48; 165; 195; 161; 44; 60453].
Proof. vm_compute. reflexivity. Qed.


Example t_0206 :
  cruDataReadFromTr32_fun [3263920774; 2102846743]
  = [128; 1; 194; 139; 122; 134; 240; 167; 32; 239; 64976].
Proof. vm_compute. reflexivity. Qed.


Example t_0207 :
  cruDataReadFromTr32_fun [4089316952; 2315572406]
  = [128; 1; 243; 190; 6; 88; 108; 35; 140; 162; 65754].
Proof. vm_compute. reflexivity. Qed.


Example t_0208 :
  cruDataReadFromTr32_fun [794757292; 272791850]
  = [128; 1; 47; 95; 8; 172; 64; 89; 36; 130; 65030].
Proof. vm_compute. reflexivity. Qed.


Example t_0209 :
  cruDataReadFromTr32_fun [3651357247; 2577478131]
  = [128; 1; 217; 163; 74; 63; 16; 155; 17; 204; 64041].
Proof. vm_compute. reflexivity. Qed.


Example t_0210 :
  cruDataReadFromTr32_fun [207695918; 3679179176]
  = [128; 1; 12; 97; 48; 46; 214; 254; 50; 134; 65180].
Proof. vm_compute. reflexivity. Qed.


Example t_0211 :
  cruDataReadFromTr32_fun [4102120433; 3976690034]
  = [128; 1; 244; 129; 99; 241; 139; 54; 163; 127; 66570].
Proof. vm_compute. reflexivity. Qed.


Example t_0212 :
  cruDataReadFromTr32_fun [2677603994; 3767204980]
  = [128; 1; 159; 152; 254; 154; 4; 140; 60; 38; 66370].
Proof. vm_compute. reflexivity. Qed.


Example t_0213 :
  cruDataReadFromTr32_fun [1438540354; 2610067777]
  = [128; 1; 85; 190; 98; 66; 131; 104; 137; 129; 65015].
Proof. vm_compute. reflexivity. Qed.


Example t_0214 :
  cruDataReadFromTr32_fun [3827930114; 3940438578]
  = [128; 1; 228; 41; 148; 2; 104; 116; 90; 208; 65305].
Proof. vm_compute. reflexivity. Qed.


Example t_0215 :
  cruDataReadFromTr32_fun [4195306724; 889858760]
  = [128; 1; 250; 15; 76; 228; 74; 26; 134; 28; 65151].
Proof. vm_compute. reflexivity. Qed.


Example t_0216 :
  cruDataReadFromTr32_fun [3724915121; 3681324618]
  = [128; 1; 222; 5; 177; 177; 184; 224; 72; 103; 62976].
Proof. vm_compute. reflexivity. Qed.


Example t_0217 :
  cruDataReadFromTr32_fun [501722850; 710306195]
  = [128; 1; 29; 231; 174; 226; 30; 198; 14; 207; 65159].
Proof. vm_compute. reflexivity. Qed.


Example t_0218 :
  cruDataReadFromTr32_fun [3221540629; 1246008223]
  = [128; 1; 192; 4; 207; 21; 152; 10; 10; 246; 65086].
Proof. vm_compute. reflexivity. Qed.


Example t_0219 :
  cruDataReadFromTr32_fun [4069187533; 1963331730]
  = [128; 1; 242; 138; 223; 205; 0; 141; 24; 59; 65030].
Proof. vm_compute. reflexivity. Qed.


Example t_0220 :
  cruDataReadFromTr32_fun [577522669; 1670877122]
  = [128; 1; 34; 108; 75; 237; 138; 156; 157; 43; 65283].
Proof. vm_compute. reflexivity. Qed.


Example t_0221 :
  cruDataReadFromTr32_fun [181090746; 579274496]
  = [128; 1; 10; 203; 57; 186; 43; 199; 178; 186; 72353].
Proof. vm_compute. reflexivity. Qed.


Example t_0222 :
  cruDataReadFromTr32_fun [227966633; 221271151]
  = [128; 1; 13; 150; 126; 169; 152; 144; 97; 186; 64859].
Proof. vm_compute. reflexivity. Qed.


Example t_0223 :
  cruDataReadFromTr32_fun [1515195488; 3474410396]
  = [128; 1; 90; 80; 12; 96; 22; 222; 142; 196; 65020].
Proof. vm_compute. reflexivity. Qed.


Example t_0224 :
  cruDataReadFromTr32_fun [3835433116; 299877699]
  = [128; 1; 228; 156; 16; 156; 194; 158; 236; 217; 65387].
Proof. vm_compute. reflexivity. Qed.


Example t_0225 :
  cruDataReadFromTr32_fun [1178417962; 2114591490]
  = [128; 1; 70; 61; 59; 42; 205; 64; 161; 40; 65323].
Proof. vm_compute. reflexivity. Qed.


Example t_0226 :
  cruDataReadFromTr32_fun [2942242774; 963229398]
  = [128; 1; 175; 95; 15; 214; 42; 208; 196; 0; 64824].
Proof. vm_compute. reflexivity. Qed.


Example t_0227 :
  cruDataReadFromTr32_fun [993186662; 2843861657]
  = [128; 1; 59; 50; 211; 102; 82; 162; 61; 77; 65252].
Proof. vm_compute. reflexivity. Qed.


Example t_0228 :
  cruDataReadFromTr32_fun [448207714; 2926210971]
  = [128; 1; 26; 183; 27; 98; 161; 132; 121; 71; 64928].
Proof. vm_compute. reflexivity. Qed.


Example t_0229 :
  cruDataReadFromTr32_fun [2031397296; 1598120395]
  = [128; 1; 121; 20; 169; 176; 186; 132; 45; 101; 65377].
Proof. vm_compute. reflexivity. Qed.


Example t_0230 :
  cruDataReadFromTr32_fun [2675624501; 132113615]
  = [128; 1; 159; 122; 202; 53; 135; 141; 76; 230; 65677].
Proof. vm_compute. reflexivity. Qed.


Example t_0231 :
  cruDataReadFromTr32_fun [2704319779; 2495062759]
  = [128; 1; 161; 48; 165; 35; 104; 74; 117; 188; 64481].
Proof. vm_compute. reflexivity. Qed.


Example t_0232 :
  cruDataReadFromTr32_fun [1493994633; 2980964513]
  = [128; 1; 89; 12; 140; 137; 126; 82; 244; 104; 65395].
Proof. vm_compute. reflexivity. Qed.


Example t_0233 :
  cruDataReadFromTr32_fun [2064736820; 1790300597]
  = [128; 1; 123; 17; 98; 52; 107; 68; 106; 255; 65623].
Proof. vm_compute. reflexivity. Qed.


Example t_0234 :
  cruDataReadFromTr32_fun [4119851462; 3053500201]
  = [128; 1; 245; 143; 241; 198; 63; 234; 207; 29; 73512].
Proof. vm_compute. reflexivity. Qed.


Example t_0235 :
  cruDataReadFromTr32_fun [666549513; 170175876]
  = [128; 1; 39; 186; 189; 9; 47; 236; 209; 133; 64309].
Proof. vm_compute. reflexivity. Qed.


Example t_0236 :
  cruDataReadFromTr32_fun [3741333269; 719391411]
  = [128; 1; 223; 0; 55; 21; 36; 164; 133; 226; 65112].
Proof. vm_compute. reflexivity. Qed.


Example t_0237 :
  cruDataReadFromTr32_fun [3130190825; 1001824652]
  = [128; 1; 186; 146; 235; 233; 90; 45; 16; 93; 65792].
Proof. vm_compute. reflexivity. Qed.


Example t_0238 :
  cruDataReadFromTr32_fun [3148958542; 4146159090]
  = [128; 1; 187; 177; 75; 78; 85; 62; 230; 92; 65650].
Proof. vm_compute. reflexivity. Qed.


Example t_0239 :
  cruDataReadFromTr32_fun [804159218; 1218028068]
  = [128; 1; 47; 238; 126; 242; 52; 37; 238; 206; 67018].
Proof. vm_compute. reflexivity. Qed.


Example t_0240 :
  cruDataReadFromTr32_fun [3299097608; 1936830637]
  = [128; 1; 196; 164; 60; 8; 10; 10; 225; 219; 65004].
Proof. vm_compute. reflexivity. Qed.


Example t_0241 :
  cruDataReadFromTr32_fun [2247584208; 23576253]
  = [128; 1; 133; 247; 105; 208; 56; 111; 9; 147; 66832].
Proof. vm_compute. reflexivity. Qed.


Example t_0242 :
  cruDataReadFromTr32_fun [1996074825; 294436263]
  = [128; 1; 118; 249; 175; 73; 43; 203; 197; 34; 65321].
Proof. vm_compute. reflexivity. Qed.


Example t_0243 :
  cruDataReadFromTr32_fun [3643924456; 3937400646]
  = [128; 1; 217; 49; 223; 232; 70; 125; 139; 162; 65638].
Proof. vm_compute. reflexivity. Qed.


Example t_0244 :
  cruDataReadFromTr32_fun [3035553082; 70705755]
  = [128; 1; 180; 238; 221; 58; 204; 41; 40; 95; 64562].
Proof. vm_compute. reflexivity. Qed.


Example t_0245 :
  cruDataReadFromTr32_fun [2462037794; 1629361731]
  = [128; 1; 146; 191; 183; 34; 192; 172; 194; 95; 66009].
Proof. vm_compute. reflexivity. Qed.


Example t_0246 :
  cruDataReadFromTr32_fun [2660313260; 1704791039]
  = [128; 1; 158; 145; 40; 172; 7; 122; 28; 45; 62485].
Proof. vm_compute. reflexivity. Qed.


Example t_0247 :
  cruDataReadFromTr32_fun [2012751899; 1970532850]
  = [128; 1; 119; 248; 40; 27; 188; 125; 47; 41; 65668].
Proof. vm_compute. reflexivity. Qed.


Example t_0248 :
  cruDataReadFromTr32_fun [845813770; 1423373431]
  = [128; 1; 50; 106; 24; 10; 73; 13; 95; 19; 64004].
Proof. vm_compute. reflexivity. Qed.


Example t_0249 :
  cruDataReadFromTr32_fun [2791707705; 2952665418]
  = [128; 1; 166; 102; 20; 57; 245; 116; 159; 239; 65006].
Proof. vm_compute. reflexivity. Qed.


Example t_0250 :
  cruDataReadFromTr32_fun [144640372; 1107530290]
  = [128; 1; 8; 159; 9; 116; 200; 100; 144; 66; 64345].
Proof. vm_compute. reflexivity. Qed.


Example t_0251 :
  cruDataReadFromTr32_fun [352602312; 1753459431]
  = [128; 1; 21; 4; 72; 200; 238; 86; 17; 97; 64379].
Proof. vm_compute. reflexivity. Qed.


Example t_0252 :
  cruDataReadFromTr32_fun [1166406702; 3631785735]
  = [128; 1; 69; 133; 244; 46; 169; 96; 208; 167; 65313].
Proof. vm_compute. reflexivity. Qed.


Example t_0253 :
  cruDataReadFromTr32_fun [4226943486; 2572740523]
  = [128; 1; 251; 242; 9; 254; 15; 12; 247; 211; 63359].
Proof. vm_compute. reflexivity. Qed.


Example t_0254 :
  cruDataReadFromTr32_fun [1780939367; 573204584]
  = [128; 1; 106; 38; 250; 103; 93; 48; 197; 255; 65438].
Proof. vm_compute. reflexivity. Qed.


Example t_0255 :
  cruDataReadFromTr32_fun [3049593220; 1440228250]
  = [128; 1; 181; 197; 25; 132; 75; 254; 194; 234; 65093].
Proof. vm_compute. reflexivity. Qed.


Example t_0256 :
  cruDataReadFromTr32_fun [4237237541; 455960872]
  = [128; 1; 252; 143; 29; 37; 120; 22; 71; 253; 65418].
Proof. vm_compute. reflexivity. Qed.


Example t_0257 :
  cruDataReadFromTr32_fun [2407934399; 575900021]
  = [128; 1; 143; 134; 41; 191; 150; 247; 90; 202; 65443].
Proof. vm_compute. reflexivity. Qed.


Example t_0258 :
  cruDataReadFromTr32_fun [612767374; 381351340]
  = [128; 1; 36; 134; 22; 142; 107; 69; 246; 226; 64915].
Proof. vm_compute. reflexivity. Qed.


Example t_0259 :
  cruDataReadFromTr32_fun [4254431161; 385312311]
  = [128; 1; 253; 149; 119; 185; 98; 81; 45; 2; 64213].
Proof. vm_compute. reflexivity. Qed.


Example t_0260 :
  cruDataReadFromTr32_fun [132452329; 3968007526]
  = [128; 1; 7; 229; 15; 233; 92; 224; 197; 131; 67132].
Proof. vm_compute. reflexivity. Qed.


Example t_0261 :
  cruDataReadFromTr32_fun [284981649; 807047303]
  = [128; 1; 16; 252; 121; 145; 238; 42; 44; 138; 65019].
Proof. vm_compute. reflexivity. Qed.


Example t_0262 :
  cruDataReadFromTr32_fun [3736346581; 1467280409]
  = [128; 1; 222; 180; 31; 213; 65; 181; 64; 60; 65271].
Proof. vm_compute. reflexivity. Qed.


Example t_0263 :
  cruDataReadFromTr32_fun [4060357791; 1335733400]
  = [128; 1; 242; 4; 36; 159; 113; 60; 196; 7; 65778].
Proof. vm_compute. reflexivity. Qed.


Example t_0264 :
  cruDataReadFromTr32_fun [275303608; 1592524830]
  = [128; 1; 16; 104; 204; 184; 39; 124; 219; 154; 75791].
Proof. vm_compute. reflexivity. Qed.


Example t_0265 :
  cruDataReadFromTr32_fun [3113799277; 1104123313]
  = [128; 1; 185; 152; 206; 109; 95; 148; 17; 60; 64495].
Proof. vm_compute. reflexivity. Qed.


Example t_0266 :
  cruDataReadFromTr32_fun [2165482823; 123076868]
  = [128; 1; 129; 18; 165; 71; 36; 189; 38; 67; 69372].
Proof. vm_compute. reflexivity. Qed.


Example t_0267 :
  cruDataReadFromTr32_fun [3626279624; 4093393572]
  = [128; 1; 216; 36; 162; 200; 226; 69; 186; 36; 65708].
Proof. vm_compute. reflexivity. Qed.


Example t_0268 :
  cruDataReadFromTr32_fun [2862682147; 2050292164]
  = [128; 1; 170; 161; 16; 35; 74; 232; 248; 95; 65477].
Proof. vm_compute. reflexivity. Qed.


Example t_0269 :
  cruDataReadFromTr32_fun [741187232; 2030517368]
  = [128; 1; 44; 45; 158; 160; 54; 196; 158; 40; 64704].
Proof. vm_compute. reflexivity. Qed.


Example t_0270 :
  cruDataReadFromTr32_fun [2805460006; 2478135146]
  = [128; 1; 167; 55; 236; 38; 238; 46; 73; 188; 64800].
Proof. vm_compute. reflexivity. Qed.


Example t_0271 :
  cruDataReadFromTr32_fun [3566384684; 1721207120]
  = [128; 1; 212; 146; 182; 44; 185; 191; 212; 220; 65080].
Proof. vm_compute. reflexivity. Qed.


Example t_0272 :
  cruDataReadFromTr32_fun [3641011864; 2192643177]
  = [128; 1; 217; 5; 110; 152; 174; 222; 142; 175; 65354].
Proof. vm_compute. reflexivity. Qed.


Example t_0273 :
  cruDataReadFromTr32_fun [3579616848; 2922234755]
  = [128; 1; 213; 92; 158; 80; 62; 16; 156; 77; 65617].
Proof. vm_compute. reflexivity. Qed.


Example t_0274 :
  cruDataReadFromTr32_fun [1616497752; 587504160]
  = [128; 1; 96; 89; 204; 88; 191; 162; 66; 56; 65765].
Proof. vm_compute. reflexivity. Qed.


Example t_0275 :
  cruDataReadFromTr32_fun [1488306264; 4243268594]
  = [128; 1; 88; 181; 192; 88; 209; 92; 149; 102; 64586].
Proof. vm_compute. reflexivity. Qed.


Example t_0276 :
  cruDataReadFromTr32_fun [3890766939; 29589937]
  = [128; 1; 231; 232; 100; 91; 199; 229; 187; 42; 62944].
Proof. vm_compute. reflexivity. Qed.


Example t_0277 :
  cruDataReadFromTr32_fun [3177528484; 2549922540]
  = [128; 1; 189; 101; 60; 164; 35; 197; 247; 184; 64881].
Proof. vm_compute. reflexivity. Qed.


Example t_0278 :
  cruDataReadFromTr32_fun [177938665; 373013762]
  = [128; 1; 10; 155; 32; 233; 18; 61; 228; 231; 65325].
Proof. vm_compute. reflexivity. Qed.


Example t_0279 :
  cruDataReadFromTr32_fun [3765285994; 1747053863]
  = [128; 1; 224; 109; 180; 106; 137; 66; 90; 195; 65212].
Proof. vm_compute. reflexivity. Qed.


Example t_0280 :
  cruDataReadFromTr32_fun [3250501724; 3601970119]
  = [128; 1; 193; 190; 184; 92; 67; 230; 232; 21; 65134].
Proof. vm_compute. reflexivity. Qed.


Example t_0281 :
  cruDataReadFromTr32_fun [2741599795; 1879913995]
  = [128; 1; 163; 105; 126; 51; 57; 247; 77; 168; 65409].
Proof. vm_compute. reflexivity. Qed.


Example t_0282 :
  cruDataReadFromTr32_fun [1461257694; 1340612653]
  = [128; 1; 87; 25; 5; 222; 251; 64; 252; 49; 65690].
Proof. vm_compute. reflexivity. Qed.


Example t_0283 :
  cruDataReadFromTr32_fun [2408020716; 3478038576]
  = [128; 1; 143; 135; 122; 236; 103; 140; 234; 188; 65671].
Proof. vm_compute. reflexivity. Qed.


Example t_0284 :
  cruDataReadFromTr32_fun [152108696; 2614558332]
  = [128; 1; 9; 16; 254; 152; 88; 185; 62; 28; 69217].
Proof. vm_compute. reflexivity. Qed.


Example t_0285 :
  cruDataReadFromTr32_fun [1396441035; 1750901397]
  = [128; 1; 83; 59; 255; 203; 25; 48; 167; 182; 65189].
Proof. vm_compute. reflexivity. Qed.


Example t_0286 :
  cruDataReadFromTr32_fun [2184357068; 3537414877]
  = [128; 1; 130; 50; 164; 204; 27; 175; 104; 111; 64591].
Proof. vm_compute. reflexivity. Qed.


Example t_0287 :
  cruDataReadFromTr32_fun [652548429; 1571513400]
  = [128; 1; 38; 229; 25; 77; 158; 235; 209; 21; 65542].
Proof. vm_compute. reflexivity. Qed.


Example t_0288 :
  cruDataReadFromTr32_fun [2938880747; 1772066558]
  = [128; 1; 175; 43; 194; 235; 21; 87; 170; 237; 65203].
Proof. vm_compute. reflexivity. Qed.


Example t_0289 :
  cruDataReadFromTr32_fun [2928270102; 3557257571]
  = [128; 1; 174; 137; 219; 22; 222; 59; 27; 51; 65154].
Proof. vm_compute. reflexivity. Qed.


Example t_0290 :
  cruDataReadFromTr32_fun [3091158194; 4277548547]
  = [128; 1; 184; 63; 84; 178; 52; 100; 32; 47; 64955].
Proof. vm_compute. reflexivity. Qed.


Example t_0291 :
  cruDataReadFromTr32_fun [316986734; 641718242]
  = [128; 1; 18; 228; 213; 110; 12; 144; 238; 140; 64272].
Proof. vm_compute. reflexivity. Qed.


Example t_0292 :
  cruDataReadFromTr32_fun [3589335125; 4042696278]
  = [128; 1; 213; 240; 232; 85; 96; 77; 108; 255; 66230].
Proof. vm_compute. reflexivity. Qed.


Example t_0293 :
  cruDataReadFromTr32_fun [2592371266; 706684806]
  = [128; 1; 154; 132; 114; 66; 127; 249; 13; 188; 65214].
Proof. vm_compute. reflexivity. Qed.


Example t_0294 :
  cruDataReadFromTr32_fun [3177401803; 1728654703]
  = [128; 1; 189; 99; 77; 203; 218; 240; 215; 220; 65926].
Proof. vm_compute. reflexivity. Qed.


Example t_0295 :
  cruDataReadFromTr32_fun [381850663; 3921986852]
  = [128; 1; 22; 194; 148; 39; 15; 96; 97; 3; 64848].
Proof. vm_compute. reflexivity. Qed.


Example t_0296 :
  cruDataReadFromTr32_fun [1726953944; 1365156711]
  = [128; 1; 102; 239; 57; 216; 196; 226; 73; 241; 65224].
Proof. vm_compute. reflexivity. Qed.


Example t_0297 :
  cruDataReadFromTr32_fun [762212952; 1998635762]
  = [128; 1; 45; 110; 114; 88; 70; 175; 40; 102; 65246].
Proof. vm_compute. reflexivity. Qed.


Example t_0298 :
  cruDataReadFromTr32_fun [159068012; 2309637643]
  = [128; 1; 9; 123; 47; 108; 84; 243; 238; 225; 64122].
Proof. vm_compute. reflexivity. Qed.


Example t_0299 :
  cruDataReadFromTr32_fun [3550962267; 1366426116]
  = [128; 1; 211; 167; 98; 91; 59; 54; 98; 87; 65044].
Proof. vm_compute. reflexivity. Qed.


Example t_0300 :
  cruDataReadFromTr32_fun [3812203062; 4122288309]
  = [128; 1; 227; 57; 154; 54; 200; 20; 212; 1; 65789].
Proof. vm_compute. reflexivity. Qed.


Example t_0301 :
  cruDataReadFromTr32_fun [3916783660; 2588019053]
  = [128; 1; 233; 117; 96; 44; 112; 56; 13; 63; 66079].
Proof. vm_compute. reflexivity. Qed.


Example t_0302 :
  cruDataReadFromTr32_fun [2222027423; 3775420226]
  = [128; 1; 132; 113; 114; 159; 39; 148; 188; 93; 65419].
Proof. vm_compute. reflexivity. Qed.


Example t_0303 :
  cruDataReadFromTr32_fun [2763267944; 1048675677]
  = [128; 1; 164; 180; 31; 104; 166; 245; 72; 139; 65090].
Proof. vm_compute. reflexivity. Qed.


Example t_0304 :
  cruDataReadFromTr32_fun [985292069; 1914768740]
  = [128; 1; 58; 186; 93; 37; 217; 32; 1; 193; 65797].
Proof. vm_compute. reflexivity. Qed.


Example t_0305 :
  cruDataReadFromTr32_fun [1971724250; 3721848229]
  = [128; 1; 117; 134; 31; 218; 131; 34; 12; 181; 65371].
Proof. vm_compute. reflexivity. Qed.


Example t_0306 :
  cruDataReadFromTr32_fun [445882176; 599770306]
  = [128; 1; 26; 147; 159; 64; 214; 182; 59; 126; 64316].
Proof. vm_compute. reflexivity. Qed.


Example t_0307 :
  cruDataReadFromTr32_fun [3537281893; 2264249705]
  = [128; 1; 210; 214; 163; 101; 198; 187; 162; 124; 65518].
Proof. vm_compute. reflexivity. Qed.


Example t_0308 :
  cruDataReadFromTr32_fun [2580859183; 2498084948]
  = [128; 1; 153; 212; 201; 47; 119; 207; 50; 219; 65579].
Proof. vm_compute. reflexivity. Qed.


Example t_0309 :
  cruDataReadFromTr32_fun [964306075; 2067196265]
  = [128; 1; 57; 122; 36; 155; 89; 183; 239; 178; 66018].
Proof. vm_compute. reflexivity. Qed.


Example t_0310 :
  cruDataReadFromTr32_fun [1261399038; 1563350027]
  = [128; 1; 75; 47; 107; 254; 133; 106; 157; 115; 64137].
Proof. vm_compute. reflexivity. Qed.


Example t_0311 :
  cruDataReadFromTr32_fun [1355658171; 2468104864]
  = [128; 1; 80; 205; 179; 187; 75; 214; 185; 27; 67378].
Proof. vm_compute. reflexivity. Qed.


Example t_0312 :
  cruDataReadFromTr32_fun [2867004349; 448398741]
  = [128; 1; 170; 227; 3; 189; 237; 43; 200; 168; 64596].
Proof. vm_compute. reflexivity. Qed.


Example t_0313 :
  cruDataReadFromTr32_fun [490240599; 2715454269]
  = [128; 1; 29; 56; 122; 87; 104; 163; 141; 154; 64504].
Proof. vm_compute. reflexivity. Qed.


Example t_0314 :
  cruDataReadFromTr32_fun [3136383445; 514516268]
  = [128; 1; 186; 241; 105; 213; 241; 185; 26; 169; 65452].
Proof. vm_compute. reflexivity. Qed.


Example t_0315 :
  cruDataReadFromTr32_fun [4104055199; 397569746]
  = [128; 1; 244; 158; 233; 159; 182; 35; 227; 205; 65279].
Proof. vm_compute. reflexivity. Qed.


Example t_0316 :
  cruDataReadFromTr32_fun [1357292295; 90757062]
  = [128; 1; 80; 230; 163; 7; 255; 233; 174; 65; 67033].
Proof. vm_compute. reflexivity. Qed.


Example t_0317 :
  cruDataReadFromTr32_fun [2744504330; 844716025]
  = [128; 1; 163; 149; 208; 10; 157; 232; 116; 145; 66579].
Proof. vm_compute. reflexivity. Qed.


Example t_0318 :
  cruDataReadFromTr32_fun [664346220; 3183833210]
  = [128; 1; 39; 153; 30; 108; 76; 139; 234; 242; 65379].
Proof. vm_compute. reflexivity. Qed.


Example t_0319 :
  cruDataReadFromTr32_fun [3308078213; 400514919]
  = [128; 1; 197; 45; 68; 133; 156; 253; 152; 158; 65163].
Proof. vm_compute. reflexivity. Qed.


Example t_0320 :
  cruDataReadFromTr32_fun [1323613253; 2157119483]
  = [128; 1; 78; 228; 188; 69; 23; 213; 177; 202; 66255].
Proof. vm_compute. reflexivity. Qed.


Example t_0321 :
  cruDataReadFromTr32_fun [123581941; 1467285842]
  = [128; 1; 7; 93; 181; 245; 106; 105; 93; 163; 64607].
Proof. vm_compute. reflexivity. Qed.


Example t_0322 :
  cruDataReadFromTr32_fun [3199151909; 3683202068]
  = [128; 1; 190; 175; 47; 37; 167; 192; 5; 17; 64823].
Proof. vm_compute. reflexivity. Qed.


Example t_0323 :
  cruDataReadFromTr32_fun [487430412; 2785647184]
  = [128; 1; 29; 13; 153; 12; 123; 209; 38; 188; 65050].
Proof. vm_compute. reflexivity. Qed.


Example t_0324 :
  cruDataReadFromTr32_fun [2810564230; 1331944375]
  = [128; 1; 167; 133; 206; 134; 10; 15; 206; 79; 65920].
Proof. vm_compute. reflexivity. Qed.


Example t_0325 :
  cruDataReadFromTr32_fun [876257082; 2351803278]
  = [128; 1; 52; 58; 159; 58; 190; 226; 186; 172; 65112].
Proof. vm_compute. reflexivity. Qed.


Example t_0326 :
  cruDataReadFromTr32_fun [2462263515; 1097490331]
  = [128; 1; 146; 195; 40; 219; 6; 136; 150; 192; 65322].
Proof. vm_compute. reflexivity. Qed.


Example t_0327 :
  cruDataReadFromTr32_fun [2026026597; 588348546]
  = [128; 1; 120; 194; 182; 101; 222; 111; 122; 227; 65005].
Proof. vm_compute. reflexivity. Qed.


Example t_0328 :
  cruDataReadFromTr32_fun [331486532; 2761400630]
  = [128; 1; 19; 194; 21; 68; 186; 251; 15; 14; 64206].
Proof. vm_compute. reflexivity. Qed.


Example t_0329 :
  cruDataReadFromTr32_fun [1706673364; 303365037]
  = [128; 1; 101; 185; 196; 212; 94; 34; 159; 167; 66347].
Proof. vm_compute. reflexivity. Qed.


Example t_0330 :
  cruDataReadFromTr32_fun [3083956477; 391788585]
  = [128; 1; 183; 209; 112; 253; 77; 147; 77; 84; 64925].
Proof. vm_compute. reflexivity. Qed.


Example t_0331 :
  cruDataReadFromTr32_fun [998805363; 1598899213]
  = [128; 1; 59; 136; 143; 115; 130; 221; 81; 230; 65511].
Proof. vm_compute. reflexivity. Qed.


Example t_0332 :
  cruDataReadFromTr32_fun [3979622312; 4247174999]
  = [128; 1; 237; 52; 55; 168; 131; 109; 35; 209; 67039].
Proof. vm_compute. reflexivity. Qed.


Example t_0333 :
  cruDataReadFromTr32_fun [335393448; 1287643139]
  = [128; 1; 19; 253; 178; 168; 39; 45; 212; 37; 70095].
Proof. vm_compute. reflexivity. Qed.


Example t_0334 :
  cruDataReadFromTr32_fun [1898276126; 2368877907]
  = [128; 1; 113; 37; 101; 30; 125; 13; 217; 75; 64889].
Proof. vm_compute. reflexivity. Qed.


Example t_0335 :
  cruDataReadFromTr32_fun [2311198563; 2745005793]
  = [128; 1; 137; 194; 23; 99; 180; 224; 17; 2; 65228].
Proof. vm_compute. reflexivity. Qed.


Example t_0336 :
  cruDataReadFromTr32_fun [3331181870; 3862794976]
  = [128; 1; 198; 141; 205; 46; 255; 25; 170; 78; 65126].
Proof. vm_compute. reflexivity. Qed.


Example t_0337 :
  cruDataReadFromTr32_fun [2336570403; 4230466817]
  = [128; 1; 139; 69; 60; 35; 163; 3; 239; 162; 61023].
Proof. vm_compute. reflexivity. Qed.


Example t_0338 :
  cruDataReadFromTr32_fun [2248291747; 1974325866]
  = [128; 1; 134; 2; 53; 163; 231; 61; 152; 57; 65276].
Proof. vm_compute. reflexivity. Qed.


Example t_0339 :
  cruDataReadFromTr32_fun [2037792661; 4265810823]
  = [128; 1; 121; 118; 63; 149; 156; 192; 231; 142; 65312].
Proof. vm_compute. reflexivity. Qed.


Example t_0340 :
  cruDataReadFromTr32_fun [1450489494; 1531496542]
  = [128; 1; 86; 116; 182; 150; 159; 144; 29; 56; 64875].
Proof. vm_compute. reflexivity. Qed.


Example t_0341 :
  cruDataReadFromTr32_fun [2199922264; 254610542]
  = [128; 1; 131; 32; 38; 88; 10; 121; 80; 234; 65111].
Proof. vm_compute. reflexivity. Qed.


Example t_0342 :
  cruDataReadFromTr32_fun [4269124938; 3851332477]
  = [128; 1; 254; 117; 173; 74; 224; 60; 192; 77; 64434].
Proof. vm_compute. reflexivity. Qed.


Example t_0343 :
  cruDataReadFromTr32_fun [3427952791; 50614712]
  = [128; 1; 204; 82; 104; 151; 75; 118; 242; 223; 64998].
Proof. vm_compute. reflexivity. Qed.


Example t_0344 :
  cruDataReadFromTr32_fun [2427404767; 3873884368]
  = [128; 1; 144; 175; 65; 223; 29; 44; 225; 15; 66041].
Proof. vm_compute. reflexivity. Qed.


Example t_0345 :
  cruDataReadFromTr32_fun [224080507; 2703447532]
  = [128; 1; 13; 91; 50; 123; 253; 226; 210; 143; 65618].
Proof. vm_compute. reflexivity. Qed.


Example t_0346 :
  cruDataReadFromTr32_fun [3255808613; 615629958]
  = [128; 1; 194; 15; 178; 101; 246; 64; 48; 223; 65311].
Proof. vm_compute. reflexivity. Qed.


Example t_0347 :
  cruDataReadFromTr32_fun [1478755101; 3893851314]
  = [128; 1; 88; 36; 3; 29; 123; 198; 231; 107; 65431].
Proof. vm_compute. reflexivity. Qed.


Example t_0348 :
  cruDataReadFromTr32_fun [2826794354; 3818500466]
  = [128; 1; 168; 125; 117; 114; 145; 188; 125; 0; 64872].
Proof. vm_compute. reflexivity. Qed.


Example t_0349 :
  cruDataReadFromTr32_fun [2926441124; 288355384]
  = [128; 1; 174; 109; 242; 164; 53; 56; 26; 108; 66031].
Proof. vm_compute. reflexivity. Qed.


Example t_0350 :
  cruDataReadFromTr32_fun [529831514; 1797795798]
  = [128; 1; 31; 148; 150; 90; 72; 132; 81; 132; 65016].
Proof. vm_compute. reflexivity. Qed.


Example t_0351 :
  cruDataReadFromTr32_fun [2306067026; 119252968]
  = [128; 1; 137; 115; 202; 82; 16; 44; 22; 106; 65744].
Proof. vm_compute. reflexivity. Qed.


Example t_0352 :
  cruDataReadFromTr32_fun [3047469858; 1085379879]
  = [128; 1; 181; 164; 179; 34; 205; 189; 177; 123; 65050].
Proof. vm_compute. reflexivity. Qed.


Example t_0353 :
  cruDataReadFromTr32_fun [2141047589; 3002614078]
  = [128; 1; 127; 157; 203; 37; 72; 198; 40; 231; 64859].
Proof. vm_compute. reflexivity. Qed.


Example t_0354 :
  cruDataReadFromTr32_fun [1764298393; 4191898374]
  = [128; 1; 105; 41; 14; 153; 92; 243; 70; 147; 65574].
Proof. vm_compute. reflexivity. Qed.


Example t_0355 :
  cruDataReadFromTr32_fun [1632330602; 2324119793]
  = [128; 1; 97; 75; 99; 106; 26; 100; 154; 249; 64902].
Proof. vm_compute. reflexivity. Qed.


Example t_0356 :
  cruDataReadFromTr32_fun [936627469; 1868274820]
  = [128; 1; 55; 211; 205; 13; 118; 70; 114; 137; 65211].
Proof. vm_compute. reflexivity. Qed.


Example t_0357 :
  cruDataReadFromTr32_fun [3356377313; 2217059942]
  = [128; 1; 200; 14; 64; 225; 86; 187; 205; 123; 65038].
Proof. vm_compute. reflexivity. Qed.


Example t_0358 :
  cruDataReadFromTr32_fun [2237715957; 2371260507]
  = [128; 1; 133; 96; 213; 245; 163; 82; 115; 26; 65601].
Proof. vm_compute. reflexivity. Qed.


Example t_0359 :
  cruDataReadFromTr32_fun [22028225; 3786277828]
  = [128; 1; 1; 80; 31; 193; 246; 163; 253; 253; 66097].
Proof. vm_compute. reflexivity. Qed.


Example t_0360 :
  cruDataReadFromTr32_fun [786461717; 3504108100]
  = [128; 1; 46; 224; 116; 21; 204; 61; 35; 209; 65255].
Proof. vm_compute. reflexivity. Qed.


Example t_0361 :
  cruDataReadFromTr32_fun [2606030790; 504228207]
  = [128; 1; 155; 84; 223; 198; 132; 59; 173; 215; 65773].
Proof. vm_compute. reflexivity. Qed.


Example t_0362 :
  cruDataReadFromTr32_fun [2728215660; 3608249918]
  = [128; 1; 162; 157; 68; 108; 84; 78; 221; 46; 65513].
Proof. vm_compute. reflexivity. Qed.


Example t_0363 :
  cruDataReadFromTr32_fun [1606160212; 3969791003]
  = [128; 1; 95; 188; 15; 84; 194; 55; 232; 185; 65534].
Proof. vm_compute. reflexivity. Qed.


Example t_0364 :
  cruDataReadFromTr32_fun [2447418055; 3760859840]
  = [128; 1; 145; 224; 162; 199; 198; 203; 216; 7; 63685].
Proof. vm_compute. reflexivity. Qed.


Example t_0365 :
  cruDataReadFromTr32_fun [3163517430; 1262658207]
  = [128; 1; 188; 143; 113; 246; 18; 158; 30; 215; 64995].
Proof. vm_compute. reflexivity. Qed.


Example t_0366 :
  cruDataReadFromTr32_fun [2826820865; 2901049451]
  = [128; 1; 168; 125; 221; 1; 112; 211; 146; 22; 66161].
Proof. vm_compute. reflexivity. Qed.


Example t_0367 :
  cruDataReadFromTr32_fun [2289606592; 3919669400]
  = [128; 1; 136; 120; 159; 192; 111; 139; 131; 40; 65029].
Proof. vm_compute. reflexivity. Qed.


Example t_0368 :
  cruDataReadFromTr32_fun [3712563139; 3795304047]
  = [128; 1; 221; 73; 55; 195; 22; 240; 176; 212; 65453].
Proof. vm_compute. reflexivity. Qed.


Example t_0369 :
  cruDataReadFromTr32_fun [3686411843; 772378671]
  = [128; 1; 219; 186; 46; 67; 178; 120; 181; 148; 65340].
Proof. vm_compute. reflexivity. Qed.


Example t_0370 :
  cruDataReadFromTr32_fun [3427274928; 245506549]
  = [128; 1; 204; 72; 16; 176; 14; 182; 233; 59; 65530].
Proof. vm_compute. reflexivity. Qed.


Example t_0371 :
  cruDataReadFromTr32_fun [260820132; 1527250587]
  = [128; 1; 15; 139; 204; 164; 56; 131; 27; 137; 63823].
Proof. vm_compute. reflexivity. Qed.


Example t_0372 :
  cruDataReadFromTr32_fun [2330070975; 3951689897]
  = [128; 1; 138; 226; 15; 191; 100; 88; 99; 150; 56548].
Proof. vm_compute. reflexivity. Qed.


Example t_0373 :
  cruDataReadFromTr32_fun [2868475969; 2595287178]
  = [128; 1; 170; 249; 120; 65; 104; 192; 204; 183; 65279].
Proof. vm_compute. reflexivity. Qed.


Example t_0374 :
  cruDataReadFromTr32_fun [3180058440; 2221542443]
  = [128; 1; 189; 139; 215; 72; 110; 39; 224; 157; 65365].
Proof. vm_compute. reflexivity. Qed.


Example t_0375 :
  cruDataReadFromTr32_fun [3393238636; 753448189]
  = [128; 1; 202; 64; 182; 108; 17; 178; 127; 239; 64102].
Proof. vm_compute. reflexivity. Qed.


Example t_0376 :
  cruDataReadFromTr32_fun [1857256505; 2317267089]
  = [128; 1; 110; 179; 124; 57; 243; 237; 20; 40; 64871].
Proof. vm_compute. reflexivity. Qed.


Example t_0377 :
  cruDataReadFromTr32_fun [422600085; 3851147287]
  = [128; 1; 25; 48; 93; 149; 249; 144; 144; 254; 65169].
Proof. vm_compute. reflexivity. Qed.


Example t_0378 :
  cruDataReadFromTr32_fun [2446875958; 508412703]
  = [128; 1; 145; 216; 93; 54; 154; 108; 41; 151; 65382].
Proof. vm_compute. reflexivity. Qed.


Example t_0379 :
  cruDataReadFromTr32_fun [3192140683; 2757578260]
  = [128; 1; 190; 68; 51; 139; 72; 141; 239; 119; 65214].
Proof. vm_compute. reflexivity. Qed.


Example t_0380 :
  cruDataReadFromTr32_fun [2747584193; 4153362968]
  = [128; 1; 163; 196; 206; 193; 115; 218; 144; 169; 65115].
Proof. vm_compute. reflexivity. Qed.


Example t_0381 :
  cruDataReadFromTr32_fun [2348460887; 560357088]
  = [128; 1; 139; 250; 171; 87; 29; 195; 188; 119; 69040].
Proof. vm_compute. reflexivity. Qed.


Example t_0382 :
  cruDataReadFromTr32_fun [3506258388; 3311379603]
  = [128; 1; 208; 253; 65; 212; 187; 111; 230; 193; 66312].
Proof. vm_compute. reflexivity. Qed.


Example t_0383 :
  cruDataReadFromTr32_fun [2269271565; 527028952]
  = [128; 1; 135; 66; 86; 13; 28; 193; 239; 53; 66080].
Proof. vm_compute. reflexivity. Qed.


Example t_0384 :
  cruDataReadFromTr32_fun [465940736; 676233382]
  = [128; 1; 27; 197; 177; 0; 26; 183; 131; 90; 68024].
Proof. vm_compute. reflexivity. Qed.


Example t_0385 :
  cruDataReadFromTr32_fun [2535731002; 1919157944]
  = [128; 1; 151; 36; 47; 58; 86; 195; 132; 130; 65176].
Proof. vm_compute. reflexivity. Qed.


Example t_0386 :
  cruDataReadFromTr32_fun [47699952; 881081698]
  = [128; 1; 2; 215; 215; 240; 16; 114; 75; 142; 65019].
Proof. vm_compute. reflexivity. Qed.


Example t_0387 :
  cruDataReadFromTr32_fun [1875679478; 1944159516]
  = [128; 1; 111; 204; 152; 246; 236; 173; 161; 218; 65951].
Proof. vm_compute. reflexivity. Qed.


Example t_0388 :
  cruDataReadFromTr32_fun [3005015647; 243028887]
  = [128; 1; 179; 28; 230; 95; 226; 202; 94; 72; 65652].
Proof. vm_compute. reflexivity. Qed.


Example t_0389 :
  cruDataReadFromTr32_fun [2514285791; 3709187451]
  = [128; 1; 149; 220; 244; 223; 67; 161; 252; 228; 65422].
Proof. vm_compute. reflexivity. Qed.


Example t_0390 :
  cruDataReadFromTr32_fun [2790149624; 1896614217]
  = [128; 1; 166; 78; 77; 248; 187; 70; 233; 47; 66170].
Proof. vm_compute. reflexivity. Qed.


Example t_0391 :
  cruDataReadFromTr32_fun [2984859238; 538856331]
  = [128; 1; 177; 233; 86; 102; 160; 240; 208; 91; 66161].
Proof. vm_compute. reflexivity. Qed.


Example t_0392 :
  cruDataReadFromTr32_fun [373778142; 590912514]
  = [128; 1; 22; 71; 102; 222; 143; 92; 203; 220; 64996].
Proof. vm_compute. reflexivity. Qed.


Example t_0393 :
  cruDataReadFromTr32_fun [4058597404; 1411138749]
  = [128; 1; 241; 233; 72; 28; 171; 239; 97; 223; 65055].
Proof. vm_compute. reflexivity. Qed.


Example t_0394 :
  cruDataReadFromTr32_fun [2632575179; 2423573312]
  = [128; 1; 156; 233; 232; 203; 70; 218; 189; 139; 62842].
Proof. vm_compute. reflexivity. Qed.


Example t_0395 :
  cruDataReadFromTr32_fun [4140103462; 1332926740]
  = [128; 1; 246; 196; 247; 38; 96; 190; 168; 18; 66006].
Proof. vm_compute. reflexivity. Qed.


Example t_0396 :
  cruDataReadFromTr32_fun [864011135; 229846209]
  = [128; 1; 51; 127; 195; 127; 255; 98; 247; 62; 66961].
Proof. vm_compute. reflexivity. Qed.


Example t_0397 :
  cruDataReadFromTr32_fun [2639793356; 988943403]
  = [128; 1; 157; 88; 12; 204; 219; 112; 14; 33; 65652].
Proof. vm_compute. reflexivity. Qed.


Example t_0398 :
  cruDataReadFromTr32_fun [1595320139; 4234756412]
  = [128; 1; 95; 22; 167; 75; 151; 78; 4; 15; 65626].
Proof. vm_compute. reflexivity. Qed.


Example t_0399 :
  cruDataReadFromTr32_fun [41105318; 3732973319]
  = [128; 1; 2; 115; 55; 166; 100; 70; 20; 31; 63354].
Proof. vm_compute. reflexivity. Qed.


Example t_0400 :
  cruDataReadFromTr32_fun [1188745636; 1019444718]
  = [128; 1; 70; 218; 209; 164; 107; 214; 74; 182; 65227].
Proof. vm_compute. reflexivity. Qed.


Example t_0401 :
  cruDataReadFromTr32_fun [3744288486; 4162764510]
  = [128; 1; 223; 45; 78; 230; 246; 109; 255; 8; 64632].
Proof. vm_compute. reflexivity. Qed.


Example t_0402 :
  cruDataReadFromTr32_fun [3889034984; 2167633541]
  = [128; 1; 231; 205; 246; 232; 0; 85; 194; 227; 65390].
Proof. vm_compute. reflexivity. Qed.


Example t_0403 :
  cruDataReadFromTr32_fun [3697076708; 2864967181]
  = [128; 1; 220; 92; 233; 228; 147; 144; 2; 87; 66631].
Proof. vm_compute. reflexivity. Qed.


Example t_0404 :
  cruDataReadFromTr32_fun [331266943; 2902674083]
  = [128; 1; 19; 190; 187; 127; 232; 96; 194; 92; 64863].
Proof. vm_compute. reflexivity. Qed.


Example t_0405 :
  cruDataReadFromTr32_fun [2980743107; 3637498869]
  = [128; 1; 177; 170; 135; 195; 64; 196; 174; 78; 65389].
Proof. vm_compute. reflexivity. Qed.


Example t_0406 :
  cruDataReadFromTr32_fun [191381539; 32060550]
  = [128; 1; 11; 104; 64; 35; 254; 25; 78; 157; 65972].
Proof. vm_compute. reflexivity. Qed.


Example t_0407 :
  cruDataReadFromTr32_fun [700294510; 2144684982]
  = [128; 1; 41; 189; 165; 110; 148; 142; 52; 184; 60629].
Proof. vm_compute. reflexivity. Qed.


Example t_0408 :
  cruDataReadFromTr32_fun [555530939; 1427431477]
  = [128; 1; 33; 28; 186; 187; 86; 119; 245; 6; 61316].
Proof. vm_compute. reflexivity. Qed.


Example t_0409 :
  cruDataReadFromTr32_fun [4009701422; 2032502347]
  = [128; 1; 238; 255; 48; 46; 8; 156; 207; 99; 64845].
Proof. vm_compute. reflexivity. Qed.


Example t_0410 :
  cruDataReadFromTr32_fun [2297085028; 201862534]
  = [128; 1; 136; 234; 188; 100; 128; 249; 81; 222; 65485].
Proof. vm_compute. reflexivity. Qed.


Example t_0411 :
  cruDataReadFromTr32_fun [308172150; 1653713744]
  = [128; 1; 18; 94; 85; 118; 248; 162; 82; 38; 64531].
Proof. vm_compute. reflexivity. Qed.


Example t_0412 :
  cruDataReadFromTr32_fun [981917035; 995679475]
  = [128; 1; 58; 134; 221; 107; 171; 156; 121; 248; 65080].
Proof. vm_compute. reflexivity. Qed.


Example t_0413 :
  cruDataReadFromTr32_fun [1216068717; 4025113211]
  = [128; 1; 72; 123; 188; 109; 77; 190; 159; 114; 64798].
Proof. vm_compute. reflexivity. Qed.


Example t_0414 :
  cruDataReadFromTr32_fun [523510845; 3860202862]
  = [128; 1; 31; 52; 36; 61; 68; 32; 213; 207; 65495].
Proof. vm_compute. reflexivity. Qed.


Example t_0415 :
  cruDataReadFromTr32_fun [546725589; 3281467844]
  = [128; 1; 32; 150; 94; 213; 40; 156; 7; 17; 65056].
Proof. vm_compute. reflexivity. Qed.


Example t_0416 :
  cruDataReadFromTr32_fun [2957804216; 2823658779]
  = [128; 1; 176; 76; 130; 184; 46; 205; 115; 29; 65593].
Proof. vm_compute. reflexivity. Qed.


Example t_0417 :
  cruDataReadFromTr32_fun [396313244; 2407231240]
  = [128; 1; 23; 159; 66; 156; 69; 219; 87; 148; 65488].
Proof. vm_compute. reflexivity. Qed.


Example t_0418 :
  cruDataReadFromTr32_fun [4294401275; 3143779811]
  = [128; 1; 255; 247; 92; 251; 245; 184; 8; 152; 65195].
Proof. vm_compute. reflexivity. Qed.


Example t_0419 :
  cruDataReadFromTr32_fun [1890963888; 2154800583]
  = [128; 1; 112; 181; 209; 176; 40; 25; 15; 105; 63410].
Proof. vm_compute. reflexivity. Qed.


Example t_0420 :
  cruDataReadFromTr32_fun [2458860851; 214295711]
  = [128; 1; 146; 143; 61; 51; 232; 187; 168; 20; 65502].
Proof. vm_compute. reflexivity. Qed.


Example t_0421 :
  cruDataReadFromTr32_fun [1232749597; 1535664599]
  = [128; 1; 73; 122; 68; 29; 178; 34; 205; 198; 64933].
Proof. vm_compute. reflexivity. Qed.


Example t_0422 :
  cruDataReadFromTr32_fun [3358202424; 3900450558]
  = [128; 1; 200; 42; 26; 56; 29; 193; 114; 58; 65083].
Proof. vm_compute. reflexivity. Qed.


Example t_0423 :
  cruDataReadFromTr32_fun [1860760881; 651343255]
  = [128; 1; 110; 232; 245; 49; 177; 113; 11; 26; 65704].
Proof. vm_compute. reflexivity. Qed.


Example t_0424 :
  cruDataReadFromTr32_fun [3190592641; 450511542]
  = [128; 1; 190; 44; 148; 129; 16; 115; 172; 203; 65611].
Proof. vm_compute. reflexivity. Qed.


Example t_0425 :
  cruDataReadFromTr32_fun [3008468684; 3821407226]
  = [128; 1; 179; 81; 150; 204; 178; 145; 135; 210; 65193].
Proof. vm_compute. reflexivity. Qed.


Example t_0426 :
  cruDataReadFromTr32_fun [592805902; 2562967426]
  = [128; 1; 35; 85; 128; 14; 236; 117; 121; 140; 65750].
Proof. vm_compute. reflexivity. Qed.


Example t_0427 :
  cruDataReadFromTr32_fun [3111559280; 878123083]
  = [128; 1; 185; 118; 160; 112; 176; 171; 173; 165; 65824].
Proof. vm_compute. reflexivity. Qed.


Example t_0428 :
  cruDataReadFromTr32_fun [3177274715; 175028722]
  = [128; 1; 189; 97; 93; 91; 234; 79; 156; 105; 66011].
Proof. vm_compute. reflexivity. Qed.


Example t_0429 :
  cruDataReadFromTr32_fun [3355400038; 1410379469]
  = [128; 1; 199; 255; 87; 102; 124; 70; 15; 25; 63251].
Proof. vm_compute. reflexivity. Qed.


Example t_0430 :
  cruDataReadFromTr32_fun [2551644744; 2300311805]
  = [128; 1; 152; 23; 2; 72; 156; 247; 135; 203; 65641].
Proof. vm_compute. reflexivity. Qed.


Example t_0431 :
  cruDataReadFromTr32_fun [2223482196; 2354259097]
  = [128; 1; 132; 135; 165; 84; 33; 198; 205; 59; 65491].
Proof. vm_compute. reflexivity. Qed.


Example t_0432 :
  cruDataReadFromTr32_fun [1790251370; 3823599403]
  = [128; 1; 106; 181; 17; 106; 122; 141; 39; 191; 66213].
Proof. vm_compute. reflexivity. Qed.


Example t_0433 :
  cruDataReadFromTr32_fun [2663082105; 2822554930]
  = [128; 1; 158; 187; 104; 121; 20; 225; 60; 71; 65919].
Proof. vm_compute. reflexivity. Qed.


Example t_0434 :
  cruDataReadFromTr32_fun [212742163; 400442371]
  = [128; 1; 12; 174; 48; 19; 227; 241; 237; 144; 62881].
Proof. vm_compute. reflexivity. Qed.


Example t_0435 :
  cruDataReadFromTr32_fun [2131710672; 921520900]
  = [128; 1; 127; 15; 82; 208; 190; 199; 137; 204; 65171].
Proof. vm_compute. reflexivity. Qed.


Example t_0436 :
  cruDataReadFromTr32_fun [1664226366; 148490023]
  = [128; 1; 99; 50; 20; 62; 199; 59; 224; 151; 66251].
Proof. vm_compute. reflexivity. Qed.


Example t_0437 :
  cruDataReadFromTr32_fun [16037062; 3879051033]
  = [128; 1; 0; 244; 180; 198; 180; 142; 162; 45; 65524].
Proof. vm_compute. reflexivity. Qed.


Example t_0438 :
  cruDataReadFromTr32_fun [2817914785; 3708468403]
  = [128; 1; 167; 245; 247; 161; 80; 73; 148; 110; 65015].
Proof. vm_compute. reflexivity. Qed.


Example t_0439 :
  cruDataReadFromTr32_fun [2605070188; 898023736]
  = [128; 1; 155; 70; 55; 108; 41; 32; 18; 52; 64854].
Proof. vm_compute. reflexivity. Qed.


Example t_0440 :
  cruDataReadFromTr32_fun [848206876; 1063370800]
  = [128; 1; 50; 142; 156; 28; 164; 12; 243; 236; 67270].
Proof. vm_compute. reflexivity. Qed.


Example t_0441 :
  cruDataReadFromTr32_fun [1465104359; 4192879485]
  = [128; 1; 87; 83; 183; 231; 82; 139; 50; 234; 65637].
Proof. vm_compute. reflexivity. Qed.


Example t_0442 :
  cruDataReadFromTr32_fun [1772032104; 2928544670]
  = [128; 1; 105; 159; 16; 104; 2; 22; 211; 202; 64054].
Proof. vm_compute. reflexivity. Qed.


Example t_0443 :
  cruDataReadFromTr32_fun [2472218281; 1051960237]
  = [128; 1; 147; 91; 14; 169; 174; 121; 65; 124; 64788].
Proof. vm_compute. reflexivity. Qed.


Example t_0444 :
  cruDataReadFromTr32_fun [20632234; 4216829050]
  = [128; 1; 1; 58; 210; 170; 177; 189; 91; 48; 66815].
Proof. vm_compute. reflexivity. Qed.


Example t_0445 :
  cruDataReadFromTr32_fun [514803021; 1550062590]
  = [128; 1; 30; 175; 69; 77; 244; 85; 48; 79; 65414].
Proof. vm_compute. reflexivity. Qed.


Example t_0446 :
  cruDataReadFromTr32_fun [349668867; 2509579820]
  = [128; 1; 20; 215; 134; 3; 73; 213; 117; 215; 65184].
Proof. vm_compute. reflexivity. Qed.


Example t_0447 :
  cruDataReadFromTr32_fun [1821928282; 268513980]
  = [128; 1; 108; 152; 107; 90; 93; 48; 150; 158; 68200].
Proof. vm_compute. reflexivity. Qed.


Example t_0448 :
  cruDataReadFromTr32_fun [1352354523; 4010442877]
  = [128; 1; 80; 155; 74; 219; 230; 209; 8; 222; 68178].
Proof. vm_compute. reflexivity. Qed.


Example t_0449 :
  cruDataReadFromTr32_fun [2005479071; 132670702]
  = [128; 1; 119; 137; 46; 159; 99; 211; 64; 177; 65288].
Proof. vm_compute. reflexivity. Qed.


Example t_0450 :
  cruDataReadFromTr32_fun [2153630974; 3367213024]
  = [128; 1; 128; 93; 204; 254; 17; 118; 37; 30; 67121].
Proof. vm_compute. reflexivity. Qed.


Example t_0451 :
  cruDataReadFromTr32_fun [2598033393; 2785243275]
  = [128; 1; 154; 218; 215; 241; 246; 143; 172; 230; 64055].
Proof. vm_compute. reflexivity. Qed.


Example t_0452 :
  cruDataReadFromTr32_fun [1400699124; 69099226]
  = [128; 1; 83; 124; 248; 244; 94; 142; 7; 26; 65286].
Proof. vm_compute. reflexivity. Qed.


Example t_0453 :
  cruDataReadFromTr32_fun [4211494615; 2284410737]
  = [128; 1; 251; 6; 78; 215; 135; 136; 175; 230; 65427].
Proof. vm_compute. reflexivity. Qed.


Example t_0454 :
  cruDataReadFromTr32_fun [1809141675; 1840590672]
  = [128; 1; 107; 213; 79; 171; 216; 183; 200; 91; 67881].
Proof. vm_compute. reflexivity. Qed.


Example t_0455 :
  cruDataReadFromTr32_fun [2532275251; 3766495698]
  = [128; 1; 150; 239; 116; 51; 246; 132; 51; 97; 69212].
Proof. vm_compute. reflexivity. Qed.


Example t_0456 :
  cruDataReadFromTr32_fun [1126267046; 2506163293]
  = [128; 1; 67; 33; 120; 166; 94; 66; 162; 201; 65082].
Proof. vm_compute. reflexivity. Qed.


Example t_0457 :
  cruDataReadFromTr32_fun [3042915319; 307771190]
  = [128; 1; 181; 95; 51; 247; 207; 34; 151; 193; 64452].
Proof. vm_compute. reflexivity. Qed.


Example t_0458 :
  cruDataReadFromTr32_fun [3280798668; 2738160614]
  = [128; 1; 195; 141; 3; 204; 186; 217; 242; 230; 64966].
Proof. vm_compute. reflexivity. Qed.


Example t_0459 :
  cruDataReadFromTr32_fun [1824603234; 476445823]
  = [128; 1; 108; 193; 60; 98; 131; 89; 127; 99; 66597].
Proof. vm_compute. reflexivity. Qed.


Example t_0460 :
  cruDataReadFromTr32_fun [2714522440; 2003367041]
  = [128; 1; 161; 204; 83; 72; 222; 221; 159; 71; 64843].
Proof. vm_compute. reflexivity. Qed.


Example t_0461 :
  cruDataReadFromTr32_fun [2593257309; 2536192677]
  = [128; 1; 154; 145; 247; 93; 153; 4; 15; 56; 65420].
Proof. vm_compute. reflexivity. Qed.


Example t_0462 :
  cruDataReadFromTr32_fun [4031627404; 3238542135]
  = [128; 1; 240; 77; 192; 140; 179; 99; 32; 213; 65278].
Proof. vm_compute. reflexivity. Qed.


Example t_0463 :
  cruDataReadFromTr32_fun [3381076550; 405717511]
  = [128; 1; 201; 135; 34; 70; 200; 185; 99; 191; 65969].
Proof. vm_compute. reflexivity. Qed.


Example t_0464 :
  cruDataReadFromTr32_fun [1949789639; 4170355578]
  = [128; 1; 116; 55; 109; 199; 196; 238; 151; 77; 64848].
Proof. vm_compute. reflexivity. Qed.


Example t_0465 :
  cruDataReadFromTr32_fun [1855558285; 2515127213]
  = [128; 1; 110; 153; 146; 141; 205; 149; 157; 96; 65618].
Proof. vm_compute. reflexivity. Qed.


Example t_0466 :
  cruDataReadFromTr32_fun [3270956361; 794034127]
  = [128; 1; 194; 246; 213; 73; 61; 162; 188; 250; 74998].
Proof. vm_compute. reflexivity. Qed.


Example t_0467 :
  cruDataReadFromTr32_fun [3038863924; 3070082204]
  = [128; 1; 181; 33; 98; 52; 125; 1; 243; 152; 61723].
Proof. vm_compute. reflexivity. Qed.


Example t_0468 :
  cruDataReadFromTr32_fun [490734139; 890874380]
  = [128; 1; 29; 64; 2; 59; 116; 251; 94; 47; 66365].
Proof. vm_compute. reflexivity. Qed.


Example t_0469 :
  cruDataReadFromTr32_fun [262130822; 2594836333]
  = [128; 1; 15; 159; 204; 134; 201; 253; 115; 153; 64962].
Proof. vm_compute. reflexivity. Qed.


Example t_0470 :
  cruDataReadFromTr32_fun [1586083219; 350410829]
  = [128; 1; 94; 137; 181; 147; 187; 19; 3; 198; 65133].
Proof. vm_compute. reflexivity. Qed.


Example t_0471 :
  cruDataReadFromTr32_fun [3134441645; 3267821729]
  = [128; 1; 186; 211; 200; 173; 91; 141; 24; 140; 68753].
Proof. vm_compute. reflexivity. Qed.


Example t_0472 :
  cruDataReadFromTr32_fun [878889439; 781316161]
  = [128; 1; 52; 98; 201; 223; 78; 200; 250; 30; 64572].
Proof. vm_compute. reflexivity. Qed.


Example t_0473 :
  cruDataReadFromTr32_fun [2948948482; 3410723433]
  = [128; 1; 175; 197; 98; 2; 138; 59; 20; 25; 64806].
Proof. vm_compute. reflexivity. Qed.


Example t_0474 :
  cruDataReadFromTr32_fun [3946164606; 1381953247]
  = [128; 1; 235; 53; 177; 126; 200; 78; 50; 31; 64836].
Proof. vm_compute. reflexivity. Qed.


Example t_0475 :
  cruDataReadFromTr32_fun [3105268882; 843180567]
  = [128; 1; 185; 22; 164; 146; 167; 201; 197; 251; 65908].
Proof. vm_compute. reflexivity. Qed.


Example t_0476 :
  cruDataReadFromTr32_fun [3238197603; 4057869124]
  = [128; 1; 193; 2; 249; 99; 190; 58; 112; 31; 64844].
Proof. vm_compute. reflexivity. Qed.


Example t_0477 :
  cruDataReadFromTr32_fun [2290897759; 588027853]
  = [128; 1; 136; 140; 83; 95; 235; 203; 162; 18; 65010].
Proof. vm_compute. reflexivity. Qed.


Example t_0478 :
  cruDataReadFromTr32_fun [4181522197; 1076361190]
  = [128; 1; 249; 60; 247; 21; 205; 16; 242; 47; 64415].
Proof. vm_compute. reflexivity. Qed.


Example t_0479 :
  cruDataReadFromTr32_fun [2404372399; 1766064753]
  = [128; 1; 143; 79; 207; 175; 200; 13; 5; 190; 67042].
Proof. vm_compute. reflexivity. Qed.


Example t_0480 :
  cruDataReadFromTr32_fun [3922985522; 538799852]
  = [128; 1; 233; 212; 2; 50; 216; 110; 9; 70; 64820].
Proof. vm_compute. reflexivity. Qed.


Example t_0481 :
  cruDataReadFromTr32_fun [317187577; 867746923]
  = [128; 1; 18; 231; 229; 249; 187; 145; 87; 14; 65327].
Proof. vm_compute. reflexivity. Qed.


Example t_0482 :
  cruDataReadFromTr32_fun [3355268949; 3825825186]
  = [128; 1; 199; 253; 87; 85; 232; 174; 178; 179; 64753].
Proof. vm_compute. reflexivity. Qed.


Example t_0483 :
  cruDataReadFromTr32_fun [804449480; 2964436167]
  = [128; 1; 47; 242; 236; 200; 216; 27; 155; 129; 66101].
Proof. vm_compute. reflexivity. Qed.


Example t_0484 :
  cruDataReadFromTr32_fun [1471695701; 1904656941]
  = [128; 1; 87; 184; 75; 85; 169; 146; 159; 168; 65356].
Proof. vm_compute. reflexivity. Qed.


Example t_0485 :
  cruDataReadFromTr32_fun [3356516386; 1178421599]
  = [128; 1; 200; 16; 96; 34; 160; 119; 198; 67; 65349].
Proof. vm_compute. reflexivity. Qed.


Example t_0486 :
  cruDataReadFromTr32_fun [4008758053; 3631723824]
  = [128; 1; 238; 240; 203; 37; 82; 83; 173; 245; 65909].
Proof. vm_compute. reflexivity. Qed.


Example t_0487 :
  cruDataReadFromTr32_fun [1200450324; 959768153]
  = [128; 1; 71; 141; 107; 20; 168; 203; 177; 59; 65394].
Proof. vm_compute. reflexivity. Qed.


Example t_0488 :
  cruDataReadFromTr32_fun [1053266057; 2133775195]
  = [128; 1; 62; 199; 144; 137; 87; 2; 106; 174; 65724].
Proof. vm_compute. reflexivity. Qed.


Example t_0489 :
  cruDataReadFromTr32_fun [2704402604; 2478744569]
  = [128; 1; 161; 49; 232; 172; 236; 197; 65; 51; 64963].
Proof. vm_compute. reflexivity. Qed.


Example t_0490 :
  cruDataReadFromTr32_fun [3311724242; 204562420]
  = [128; 1; 197; 100; 230; 210; 209; 227; 128; 222; 63773].
Proof. vm_compute. reflexivity. Qed.


Example t_0491 :
  cruDataReadFromTr32_fun [2356416753; 342185700]
  = [128; 1; 140; 116; 16; 241; 170; 186; 44; 13; 65115].
Proof. vm_compute. reflexivity. Qed.


Example t_0492 :
  cruDataReadFromTr32_fun [2707065716; 3432236521]
  = [128; 1; 161; 90; 139; 116; 30; 169; 186; 11; 65396].
Proof. vm_compute. reflexivity. Qed.


Example t_0493 :
  cruDataReadFromTr32_fun [1410503774; 498953874]
  = [128; 1; 84; 18; 148; 94; 21; 12; 110; 204; 65172].
Proof. vm_compute. reflexivity. Qed.


Example t_0494 :
  cruDataReadFromTr32_fun [1673533860; 4269347582]
  = [128; 1; 99; 192; 25; 164; 161; 208; 133; 166; 65055].
Proof. vm_compute. reflexivity. Qed.


Example t_0495 :
  cruDataReadFromTr32_fun [1791618101; 381309568]
  = [128; 1; 106; 201; 236; 53; 177; 56; 217; 181; 63986].
Proof. vm_compute. reflexivity. Qed.


Example t_0496 :
  cruDataReadFromTr32_fun [2780907545; 1153280723]
  = [128; 1; 165; 193; 72; 25; 191; 217; 6; 198; 67244].
Proof. vm_compute. reflexivity. Qed.


Example t_0497 :
  cruDataReadFromTr32_fun [605754965; 720713481]
  = [128; 1; 36; 27; 22; 85; 115; 193; 99; 204; 65053].
Proof. vm_compute. reflexivity. Qed.


Example t_0498 :
  cruDataReadFromTr32_fun [2246316098; 3674539311]
  = [128; 1; 133; 228; 16; 66; 45; 97; 162; 147; 62844].
Proof. vm_compute. reflexivity. Qed.


Example t_0499 :
  cruDataReadFromTr32_fun [2147702104; 3109123120]
  = [128; 1; 128; 3; 85; 88; 111; 107; 249; 40; 64913].
Proof. vm_compute. reflexivity. Qed.


Example t_0500 :
  cruDataReadFromTr32_fun [394101189; 3182842346]
  = [128; 1; 23; 125; 129; 197; 52; 240; 36; 219; 65388].
Proof. vm_compute. reflexivity. Qed.


Example t_0501 :
  cruDataReadFromTr32_fun [3630157221; 1717859293]
  = [128; 1; 216; 95; 205; 165; 164; 53; 72; 72; 63335].
Proof. vm_compute. reflexivity. Qed.


Example t_0502 :
  cruDataReadFromTr32_fun [4207221004; 2829630613]
  = [128; 1; 250; 197; 25; 12; 166; 122; 166; 247; 65855].
Proof. vm_compute. reflexivity. Qed.


Example t_0503 :
  cruDataReadFromTr32_fun [317180350; 3784929425]
  = [128; 1; 18; 231; 201; 190; 254; 6; 161; 173; 64182].
Proof. vm_compute. reflexivity. Qed.


Example t_0504 :
  cruDataReadFromTr32_fun [1348704434; 2233809001]
  = [128; 1; 80; 99; 152; 178; 93; 218; 148; 201; 65657].
Proof. vm_compute. reflexivity. Qed.


Example t_0505 :
  cruDataReadFromTr32_fun [1970324519; 2272453523]
  = [128; 1; 117; 112; 196; 39; 167; 111; 170; 20; 66525].
Proof. vm_compute. reflexivity. Qed.


Example t_0506 :
  cruDataReadFromTr32_fun [2994592800; 388889826]
  = [128; 1; 178; 125; 220; 32; 50; 78; 80; 62; 66066].
Proof. vm_compute. reflexivity. Qed.


Example t_0507 :
  cruDataReadFromTr32_fun [1240006801; 1759521934]
  = [128; 1; 73; 233; 0; 145; 81; 31; 27; 3; 65262].
Proof. vm_compute. reflexivity. Qed.


Example t_0508 :
  cruDataReadFromTr32_fun [1473076948; 3971239047]
  = [128; 1; 87; 205; 94; 212; 197; 63; 85; 205; 65305].
Proof. vm_compute. reflexivity. Qed.


Example t_0509 :
  cruDataReadFromTr32_fun [3747964677; 139446812]
  = [128; 1; 223; 101; 103; 5; 254; 250; 170; 233; 66007].
Proof. vm_compute. reflexivity. Qed.


Example t_0510 :
  cruDataReadFromTr32_fun [285363500; 3063786306]
  = [128; 1; 17; 2; 77; 44; 169; 58; 66; 234; 64635].
Proof. vm_compute. reflexivity. Qed.


Example t_0511 :
  cruDataReadFromTr32_fun [689266176; 3212057471]
  = [128; 1; 41; 21; 94; 0; 35; 175; 2; 1; 65481].
Proof. vm_compute. reflexivity. Qed.


Example t_0512 :
  cruDataReadFromTr32_fun [3452527005; 4253566769]
  = [128; 1; 205; 201; 97; 157; 148; 100; 178; 236; 66483].
Proof. vm_compute. reflexivity. Qed.


Example t_0513 :
  cruDataReadFromTr32_fun [399501518; 2991886233]
  = [128; 1; 23; 207; 232; 206; 143; 195; 37; 181; 65353].
Proof. vm_compute. reflexivity. Qed.


Example t_0514 :
  cruDataReadFromTr32_fun [1897760634; 1627257809]
  = [128; 1; 113; 29; 135; 122; 143; 29; 116; 41; 65207].
Proof. vm_compute. reflexivity. Qed.


Example t_0515 :
  cruDataReadFromTr32_fun [3388633504; 945016221]
  = [128; 1; 201; 250; 113; 160; 187; 141; 114; 131; 65890].
Proof. vm_compute. reflexivity. Qed.


Example t_0516 :
  cruDataReadFromTr32_fun [2217588574; 2370716110]
  = [128; 1; 132; 45; 183; 94; 158; 0; 92; 144; 64973].
Proof. vm_compute. reflexivity. Qed.


Example t_0517 :
  cruDataReadFromTr32_fun [3761215978; 4270330645]
  = [128; 1; 224; 47; 153; 234; 37; 177; 17; 85; 65906].
Proof. vm_compute. reflexivity. Qed.


Example t_0518 :
  cruDataReadFromTr32_fun [2344189605; 3019526355]
  = [128; 1; 139; 185; 126; 165; 212; 231; 151; 82; 64240].
Proof. vm_compute. reflexivity. Qed.


Example t_0519 :
  cruDataReadFromTr32_fun [3280764046; 352461495]
  = [128; 1; 195; 140; 124; 142; 47; 155; 181; 87; 64977].
Proof. vm_compute. reflexivity. Qed.


Example t_0520 :
  cruDataReadFromTr32_fun [3354561547; 3292727256]
  = [128; 1; 199; 242; 140; 11; 37; 51; 112; 51; 65176].
Proof. vm_compute. reflexivity. Qed.


Example t_0521 :
  cruDataReadFromTr32_fun [3945914075; 1579720319]
  = [128; 1; 235; 49; 222; 219; 161; 88; 127; 220; 65129].
Proof. vm_compute. reflexivity. Qed.


Example t_0522 :
  cruDataReadFromTr32_fun [3384534817; 3328092628]
  = [128; 1; 201; 187; 231; 33; 50; 178; 39; 77; 65530].
Proof. vm_compute. reflexivity. Qed.


Example t_0523 :
  cruDataReadFromTr32_fun [1217986191; 1315922232]
  = [128; 1; 72; 152; 254; 143; 49; 218; 57; 87; 65571].
Proof. vm_compute. reflexivity. Qed.


Example t_0524 :
  cruDataReadFromTr32_fun [1964265204; 1268113618]
  = [128; 1; 117; 20; 78; 244; 244; 110; 215; 34; 64881].
Proof. vm_compute. reflexivity. Qed.


Example t_0525 :
  cruDataReadFromTr32_fun [4264327326; 585867279]
  = [128; 1; 254; 44; 120; 158; 81; 16; 224; 15; 66765].
Proof. vm_compute. reflexivity. Qed.


Example t_0526 :
  cruDataReadFromTr32_fun [3068206366; 3946359501]
  = [128; 1; 182; 225; 29; 30; 103; 253; 216; 209; 65775].
Proof. vm_compute. reflexivity. Qed.


Example t_0527 :
  cruDataReadFromTr32_fun [2987497416; 3158935428]
  = [128; 1; 178; 17; 151; 200; 26; 139; 210; 68; 64839].
Proof. vm_compute. reflexivity. Qed.


Example t_0528 :
  cruDataReadFromTr32_fun [3570872461; 4215451149]
  = [128; 1; 212; 215; 48; 141; 122; 235; 137; 0; 66944].
Proof. vm_compute. reflexivity. Qed.


Example t_0529 :
  cruDataReadFromTr32_fun [2294819485; 555019253]
  = [128; 1; 136; 200; 42; 157; 242; 41; 57; 40; 65160].
Proof. vm_compute. reflexivity. Qed.


Example t_0530 :
  cruDataReadFromTr32_fun [77890149; 2021887818]
  = [128; 1; 4; 164; 130; 101; 205; 232; 152; 27; 65482].
Proof. vm_compute. reflexivity. Qed.


Example t_0531 :
  cruDataReadFromTr32_fun [1767416730; 3659828051]
  = [128; 1; 105; 88; 163; 154; 161; 121; 193; 199; 65064].
Proof. vm_compute. reflexivity. Qed.


Example t_0532 :
  cruDataReadFromTr32_fun [4255957605; 977941872]
  = [128; 1; 253; 172; 194; 101; 232; 125; 68; 245; 65188].
Proof. vm_compute. reflexivity. Qed.


Example t_0533 :
  cruDataReadFromTr32_fun [716864238; 1943020334]
  = [128; 1; 42; 186; 122; 238; 158; 251; 238; 192; 65075].
Proof. vm_compute. reflexivity. Qed.


Example t_0534 :
  cruDataReadFromTr32_fun [2347821849; 2622069089]
  = [128; 1; 139; 240; 235; 25; 20; 116; 2; 56; 64046].
Proof. vm_compute. reflexivity. Qed.


Example t_0535 :
  cruDataReadFromTr32_fun [1424595355; 462102210]
  = [128; 1; 84; 233; 153; 155; 254; 237; 219; 217; 65903].
Proof. vm_compute. reflexivity. Qed.


Example t_0536 :
  cruDataReadFromTr32_fun [3659255396; 326532868]
  = [128; 1; 218; 27; 206; 100; 129; 228; 209; 96; 65114].
Proof. vm_compute. reflexivity. Qed.


Example t_0537 :
  cruDataReadFromTr32_fun [4286377522; 3164316114]
  = [128; 1; 255; 124; 238; 50; 144; 178; 53; 96; 66169].
Proof. vm_compute. reflexivity. Qed.


Example t_0538 :
  cruDataReadFromTr32_fun [2176648340; 1882842909]
  = [128; 1; 129; 189; 4; 148; 46; 118; 171; 247; 65563].
Proof. vm_compute. reflexivity. Qed.


Example t_0539 :
  cruDataReadFromTr32_fun [2147957220; 472084031]
  = [128; 1; 128; 7; 57; 228; 117; 154; 235; 37; 65204].
Proof. vm_compute. reflexivity. Qed.


Example t_0540 :
  cruDataReadFromTr32_fun [1948756050; 3808860102]
  = [128; 1; 116; 39; 168; 82; 20; 108; 243; 140; 64007].
Proof. vm_compute. reflexivity. Qed.


Example t_0541 :
  cruDataReadFromTr32_fun [4275356605; 2869140417]
  = [128; 1; 254; 212; 195; 189; 213; 159; 8; 124; 61859].
Proof. vm_compute. reflexivity. Qed.


Example t_0542 :
  cruDataReadFromTr32_fun [1242496632; 3276592744]
  = [128; 1; 74; 14; 254; 120; 45; 45; 92; 16; 65223].
Proof. vm_compute. reflexivity. Qed.


Example t_0543 :
  cruDataReadFromTr32_fun [1866792970; 2738697909]
  = [128; 1; 111; 69; 0; 10; 106; 163; 35; 213; 65148].
Proof. vm_compute. reflexivity. Qed.


Example t_0544 :
  cruDataReadFromTr32_fun [2584531323; 3738680503]
  = [128; 1; 154; 12; 209; 123; 39; 19; 112; 68; 65479].
Proof. vm_compute. reflexivity. Qed.


Example t_0545 :
  cruDataReadFromTr32_fun [3566430969; 1959498885]
  = [128; 1; 212; 147; 106; 249; 197; 146; 24; 244; 65382].
Proof. vm_compute. reflexivity. Qed.


Example t_0546 :
  cruDataReadFromTr32_fun [2670897376; 1329702836]
  = [128; 1; 159; 50; 168; 224; 240; 196; 219; 44; 66079].
Proof. vm_compute. reflexivity. Qed.


Example t_0547 :
  cruDataReadFromTr32_fun [2925465167; 2763814091]
  = [128; 1; 174; 95; 14; 79; 103; 220; 255; 4; 65511].
Proof. vm_compute. reflexivity. Qed.


Example t_0548 :
  cruDataReadFromTr32_fun [2120922241; 2615680614]
  = [128; 1; 126; 106; 180; 129; 214; 145; 201; 27; 65541].
Proof. vm_compute. reflexivity. Qed.


Example t_0549 :
  cruDataReadFromTr32_fun [768882093; 641148354]
  = [128; 1; 45; 212; 53; 173; 35; 47; 240; 235; 65328].
Proof. vm_compute. reflexivity. Qed.


Example t_0550 :
  cruDataReadFromTr32_fun [1329683033; 1163579305]
  = [128; 1; 79; 65; 90; 89; 183; 78; 95; 48; 65651].
Proof. vm_compute. reflexivity. Qed.


Example t_0551 :
  cruDataReadFromTr32_fun [3657152100; 3192837864]
  = [128; 1; 217; 251; 182; 100; 67; 24; 83; 124; 65279].
Proof. vm_compute. reflexivity. Qed.


Example t_0552 :
  cruDataReadFromTr32_fun [2255156653; 2362107880]
  = [128; 1; 134; 106; 245; 173; 95; 20; 1; 197; 65210].
Proof. vm_compute. reflexivity. Qed.


Example t_0553 :
  cruDataReadFromTr32_fun [1110244591; 327340144]
  = [128; 1; 66; 44; 252; 239; 240; 18; 100; 127; 66942].
Proof. vm_compute. reflexivity. Qed.


Example t_0554 :
  cruDataReadFromTr32_fun [1636018405; 2774754003]
  = [128; 1; 97; 131; 168; 229; 109; 209; 175; 146; 65863].
Proof. vm_compute. reflexivity. Qed.


Example t_0555 :
  cruDataReadFromTr32_fun [1739090147; 4236210507]
  = [128; 1; 103; 168; 104; 227; 170; 225; 157; 24; 64932].
Proof. vm_compute. reflexivity. Qed.


Example t_0556 :
  cruDataReadFromTr32_fun [1367632035; 3668654804]
  = [128; 1; 81; 132; 104; 163; 204; 118; 151; 207; 65307].
Proof. vm_compute. reflexivity. Qed.


Example t_0557 :
  cruDataReadFromTr32_fun [2721176935; 1979659458]
  = [128; 1; 162; 49; 221; 103; 43; 205; 9; 165; 65340].
Proof. vm_compute. reflexivity. Qed.


Example t_0558 :
  cruDataReadFromTr32_fun [289921797; 710061159]
  = [128; 1; 17; 71; 219; 5; 16; 75; 98; 30; 64894].
Proof. vm_compute. reflexivity. Qed.


Example t_0559 :
  cruDataReadFromTr32_fun [1514580168; 3629714950]
  = [128; 1; 90; 70; 168; 200; 174; 116; 157; 194; 64613].
Proof. vm_compute. reflexivity. Qed.


Example t_0560 :
  cruDataReadFromTr32_fun [3803037334; 2826534569]
  = [128; 1; 226; 173; 190; 150; 118; 243; 148; 109; 64386].
Proof. vm_compute. reflexivity. Qed.


Example t_0561 :
  cruDataReadFromTr32_fun [1005421483; 2479898179]
  = [128; 1; 59; 237; 131; 171; 144; 60; 102; 232; 66087].
Proof. vm_compute. reflexivity. Qed.


Example t_0562 :
  cruDataReadFromTr32_fun [3982714404; 2969031195]
  = [128; 1; 237; 99; 102; 36; 184; 84; 161; 137; 64989].
Proof. vm_compute. reflexivity. Qed.


Example t_0563 :
  cruDataReadFromTr32_fun [1643224020; 1433126321]
  = [128; 1; 97; 241; 155; 212; 194; 104; 174; 163; 63044].
Proof. vm_compute. reflexivity. Qed.


Example t_0564 :
  cruDataReadFromTr32_fun [2306143082; 1392963168]
  = [128; 1; 137; 116; 243; 106; 185; 229; 53; 10; 65980].
Proof. vm_compute. reflexivity. Qed.


Example t_0565 :
  cruDataReadFromTr32_fun [520487943; 1180521554]
  = [128; 1; 31; 6; 4; 7; 7; 82; 216; 181; 65595].
Proof. vm_compute. reflexivity. Qed.


Example t_0566 :
  cruDataReadFromTr32_fun [1930325102; 2330073483]
  = [128; 1; 115; 14; 108; 110; 89; 57; 24; 99; 64426].
Proof. vm_compute. reflexivity. Qed.


Example t_0567 :
  cruDataReadFromTr32_fun [1184985157; 4105840882]
  = [128; 1; 70; 161; 112; 69; 174; 251; 192; 83; 67091].
Proof. vm_compute. reflexivity. Qed.


Example t_0568 :
  cruDataReadFromTr32_fun [3109066383; 2637455552]
  = [128; 1; 185; 80; 150; 143; 182; 76; 149; 207; 62995].
Proof. vm_compute. reflexivity. Qed.


Example t_0569 :
  cruDataReadFromTr32_fun [1590613076; 3303210142]
  = [128; 1; 94; 206; 212; 84; 11; 106; 38; 182; 65616].
Proof. vm_compute. reflexivity. Qed.


Example t_0570 :
  cruDataReadFromTr32_fun [2293362267; 241027545]
  = [128; 1; 136; 177; 238; 91; 169; 57; 17; 2; 65171].
Proof. vm_compute. reflexivity. Qed.


Example t_0571 :
  cruDataReadFromTr32_fun [2703238102; 2822839122]
  = [128; 1; 161; 32; 35; 214; 25; 108; 177; 132; 65263].
Proof. vm_compute. reflexivity. Qed.


Example t_0572 :
  cruDataReadFromTr32_fun [2273842753; 303179727]
  = [128; 1; 135; 136; 22; 65; 126; 137; 213; 242; 64781].
Proof. vm_compute. reflexivity. Qed.


Example t_0573 :
  cruDataReadFromTr32_fun [2211699340; 2682416622]
  = [128; 1; 131; 211; 218; 140; 213; 40; 99; 158; 64925].
Proof. vm_compute. reflexivity. Qed.


Example t_0574 :
  cruDataReadFromTr32_fun [1064632057; 4182604291]
  = [128; 1; 63; 116; 254; 249; 236; 228; 134; 118; 62939].
Proof. vm_compute. reflexivity. Qed.


Example t_0575 :
  cruDataReadFromTr32_fun [3630602639; 934896241]
  = [128; 1; 216; 102; 153; 143; 125; 94; 111; 158; 65916].
Proof. vm_compute. reflexivity. Qed.


Example t_0576 :
  cruDataReadFromTr32_fun [1144219872; 3224594629]
  = [128; 1; 68; 51; 104; 224; 157; 180; 98; 155; 62033].
Proof. vm_compute. reflexivity. Qed.


Example t_0577 :
  cruDataReadFromTr32_fun [999585582; 3587633950]
  = [128; 1; 59; 148; 119; 46; 81; 55; 19; 16; 65127].
Proof. vm_compute. reflexivity. Qed.


Example t_0578 :
  cruDataReadFromTr32_fun [3938654104; 1672610901]
  = [128; 1; 234; 195; 23; 152; 96; 19; 61; 195; 64932].
Proof. vm_compute. reflexivity. Qed.


Example t_0579 :
  cruDataReadFromTr32_fun [761823008; 1007112648]
  = [128; 1; 45; 104; 127; 32; 245; 10; 17; 88; 65694].
Proof. vm_compute. reflexivity. Qed.


Example t_0580 :
  cruDataReadFromTr32_fun [2445414000; 3714962456]
  = [128; 1; 145; 194; 14; 112; 107; 62; 70; 88; 64968].
Proof. vm_compute. reflexivity. Qed.


Example t_0581 :
  cruDataReadFromTr32_fun [979141175; 1383300722]
  = [128; 1; 58; 92; 130; 55; 33; 168; 60; 197; 66603].
Proof. vm_compute. reflexivity. Qed.


Example t_0582 :
  cruDataReadFromTr32_fun [2595629307; 4223106504]
  = [128; 1; 154; 182; 40; 251; 122; 189; 143; 51; 64538].
Proof. vm_compute. reflexivity. Qed.


Example t_0583 :
  cruDataReadFromTr32_fun [146851643; 1227553788]
  = [128; 1; 8; 192; 199; 59; 85; 19; 201; 63; 64375].
Proof. vm_compute. reflexivity. Qed.


Example t_0584 :
  cruDataReadFromTr32_fun [901907484; 2220452403]
  = [128; 1; 53; 194; 4; 28; 222; 29; 179; 105; 64077].
Proof. vm_compute. reflexivity. Qed.


Example t_0585 :
  cruDataReadFromTr32_fun [386797069; 2000530215]
  = [128; 1; 23; 14; 14; 13; 62; 165; 246; 102; 65419].
Proof. vm_compute. reflexivity. Qed.


Example t_0586 :
  cruDataReadFromTr32_fun [1508286497; 4072491328]
  = [128; 1; 89; 230; 160; 33; 197; 205; 246; 225; 65681].
Proof. vm_compute. reflexivity. Qed.


Example t_0587 :
  cruDataReadFromTr32_fun [2558102199; 3707690379]
  = [128; 1; 152; 121; 138; 183; 58; 233; 114; 172; 60165].
Proof. vm_compute. reflexivity. Qed.


Example t_0588 :
  cruDataReadFromTr32_fun [3119865966; 1488235092]
  = [128; 1; 185; 245; 96; 110; 187; 149; 224; 26; 66193].
Proof. vm_compute. reflexivity. Qed.


Example t_0589 :
  cruDataReadFromTr32_fun [4265083174; 2255720833]
  = [128; 1; 254; 56; 1; 38; 177; 141; 48; 37; 64658].
Proof. vm_compute. reflexivity. Qed.


Example t_0590 :
  cruDataReadFromTr32_fun [54196239; 826635335]
  = [128; 1; 3; 58; 248; 15; 116; 175; 167; 72; 64890].
Proof. vm_compute. reflexivity. Qed.


Example t_0591 :
  cruDataReadFromTr32_fun [2235974103; 1674961824]
  = [128; 1; 133; 70; 65; 215; 12; 98; 46; 55; 65863].
Proof. vm_compute. reflexivity. Qed.


Example t_0592 :
  cruDataReadFromTr32_fun [1900961991; 3343028222]
  = [128; 1; 113; 78; 96; 199; 75; 83; 207; 201; 64283].
Proof. vm_compute. reflexivity. Qed.


Example t_0593 :
  cruDataReadFromTr32_fun [983411578; 444950193]
  = [128; 1; 58; 157; 171; 122; 98; 203; 157; 73; 66266].
Proof. vm_compute. reflexivity. Qed.


Example t_0594 :
  cruDataReadFromTr32_fun [3877148559; 3981508734]
  = [128; 1; 231; 24; 151; 143; 162; 71; 214; 17; 72449].
Proof. vm_compute. reflexivity. Qed.


Example t_0595 :
  cruDataReadFromTr32_fun [2088047538; 2397861663]
  = [128; 1; 124; 117; 19; 178; 99; 196; 44; 19; 65486].
Proof. vm_compute. reflexivity. Qed.


Example t_0596 :
  cruDataReadFromTr32_fun [1071787047; 301831591]
  = [128; 1; 63; 226; 44; 39; 44; 175; 106; 0; 66830].
Proof. vm_compute. reflexivity. Qed.


Example t_0597 :
  cruDataReadFromTr32_fun [3361087276; 2633854027]
  = [128; 1; 200; 86; 31; 44; 170; 14; 216; 97; 62533].
Proof. vm_compute. reflexivity. Qed.


Example t_0598 :
  cruDataReadFromTr32_fun [2144905994; 4090510406]
  = [128; 1; 127; 216; 171; 10; 116; 38; 145; 196; 65219].
Proof. vm_compute. reflexivity. Qed.


Example t_0599 :
  cruDataReadFromTr32_fun [649870553; 2715326354]
  = [128; 1; 38; 188; 60; 217; 113; 47; 110; 71; 65261].
Proof. vm_compute. reflexivity. Qed.


Example t_0600 :
  cruDataReadFromTr32_fun [2237043247; 4135007886]
  = [128; 1; 133; 86; 146; 47; 202; 122; 162; 161; 65461].
Proof. vm_compute. reflexivity. Qed.


Example t_0601 :
  cruDataReadFromTr32_fun [2389823240; 3444865373]
  = [128; 1; 142; 113; 207; 8; 107; 90; 4; 43; 63803].
Proof. vm_compute. reflexivity. Qed.


Example t_0602 :
  cruDataReadFromTr32_fun [1302741083; 981636783]
  = [128; 1; 77; 166; 64; 91; 84; 111; 1; 44; 65591].
Proof. vm_compute. reflexivity. Qed.


Example t_0603 :
  cruDataReadFromTr32_fun [3681372820; 4249328130]
  = [128; 1; 219; 109; 74; 148; 129; 242; 177; 146; 67104].
Proof. vm_compute. reflexivity. Qed.


Example t_0604 :
  cruDataReadFromTr32_fun [496270853; 4181628926]
  = [128; 1; 29; 148; 126; 5; 195; 161; 229; 7; 65513].
Proof. vm_compute. reflexivity. Qed.


Example t_0605 :
  cruDataReadFromTr32_fun [2103385351; 2063627648]
  = [128; 1; 125; 95; 29; 7; 130; 153; 103; 135; 57633].
Proof. vm_compute. reflexivity. Qed.


Example t_0606 :
  cruDataReadFromTr32_fun [1184589464; 68731860]
  = [128; 1; 70; 155; 102; 152; 78; 228; 140; 196; 65395].
Proof. vm_compute. reflexivity. Qed.


Example t_0607 :
  cruDataReadFromTr32_fun [1847502522; 1975598029]
  = [128; 1; 110; 30; 166; 186; 216; 251; 81; 109; 66378].
Proof. vm_compute. reflexivity. Qed.


Example t_0608 :
  cruDataReadFromTr32_fun [391519223; 2548030029]
  = [128; 1; 23; 86; 27; 247; 111; 99; 104; 42; 64921].
Proof. vm_compute. reflexivity. Qed.


Example t_0609 :
  cruDataReadFromTr32_fun [3323934039; 229145325]
  = [128; 1; 198; 31; 53; 87; 140; 180; 48; 234; 64417].
Proof. vm_compute. reflexivity. Qed.


Example t_0610 :
  cruDataReadFromTr32_fun [2451081759; 2820566438]
  = [128; 1; 146; 24; 138; 31; 249; 48; 239; 121; 65748].
Proof. vm_compute. reflexivity. Qed.


Example t_0611 :
  cruDataReadFromTr32_fun [3290295474; 453356038]
  = [128; 1; 196; 29; 236; 178; 43; 237; 69; 172; 65575].
Proof. vm_compute. reflexivity. Qed.


Example t_0612 :
  cruDataReadFromTr32_fun [315666031; 955226991]
  = [128; 1; 18; 208; 174; 111; 81; 174; 202; 128; 66106].
Proof. vm_compute. reflexivity. Qed.


Example t_0613 :
  cruDataReadFromTr32_fun [1439062622; 1456710034]
  = [128; 1; 85; 198; 90; 94; 104; 195; 129; 204; 64740].
Proof. vm_compute. reflexivity. Qed.


Example t_0614 :
  cruDataReadFromTr32_fun [2903828131; 1209130293]
  = [128; 1; 173; 20; 230; 163; 109; 241; 163; 238; 66181].
Proof. vm_compute. reflexivity. Qed.


Example t_0615 :
  cruDataReadFromTr32_fun [2068147589; 1408781019]
  = [128; 1; 123; 69; 109; 133; 35; 114; 144; 42; 64795].
Proof. vm_compute. reflexivity. Qed.


Example t_0616 :
  cruDataReadFromTr32_fun [298000904; 3502927979]
  = [128; 1; 17; 195; 34; 8; 166; 48; 231; 29; 65225].
Proof. vm_compute. reflexivity. Qed.


Example t_0617 :
  cruDataReadFromTr32_fun [2828184035; 527947695]
  = [128; 1; 168; 146; 169; 227; 69; 6; 169; 180; 65185].
Proof. vm_compute. reflexivity. Qed.


Example t_0618 :
  cruDataReadFromTr32_fun [217096921; 2021555276]
  = [128; 1; 12; 240; 162; 217; 211; 176; 76; 141; 66810].
Proof. vm_compute. reflexivity. Qed.


Example t_0619 :
  cruDataReadFromTr32_fun [2747448702; 236093709]
  = [128; 1; 163; 194; 189; 126; 158; 240; 194; 241; 65958].
Proof. vm_compute. reflexivity. Qed.


Example t_0620 :
  cruDataReadFromTr32_fun [1350081056; 3386203043]
  = [128; 1; 80; 120; 154; 32; 113; 81; 15; 253; 67547].
Proof. vm_compute. reflexivity. Qed.


Example t_0621 :
  cruDataReadFromTr32_fun [458923892; 3880415912]
  = [128; 1; 27; 90; 159; 116; 217; 73; 128; 204; 65409].
Proof. vm_compute. reflexivity. Qed.


Example t_0622 :
  cruDataReadFromTr32_fun [927126487; 1269261501]
  = [128; 1; 55; 66; 211; 215; 191; 77; 205; 154; 65959].
Proof. vm_compute. reflexivity. Qed.


Example t_0623 :
  cruDataReadFromTr32_fun [1680572473; 3743095204]
  = [128; 1; 100; 43; 128; 57; 18; 157; 56; 149; 63450].
Proof. vm_compute. reflexivity. Qed.


Example t_0624 :
  cruDataReadFromTr32_fun [2608616141; 4045464226]
  = [128; 1; 155; 124; 82; 205; 58; 204; 193; 43; 65556].
Proof. vm_compute. reflexivity. Qed.


Example t_0625 :
  cruDataReadFromTr32_fun [1570859945; 2993255097]
  = [128; 1; 93; 161; 107; 169; 223; 241; 85; 112; 66264].
Proof. vm_compute. reflexivity. Qed.


Example t_0626 :
  cruDataReadFromTr32_fun [1024962842; 1585772538]
  = [128; 1; 61; 23; 177; 26; 33; 14; 182; 32; 65202].
Proof. vm_compute. reflexivity. Qed.


Example t_0627 :
  cruDataReadFromTr32_fun [543126701; 1352868381]
  = [128; 1; 32; 95; 116; 173; 33; 77; 97; 16; 65423].
Proof. vm_compute. reflexivity. Qed.


Example t_0628 :
  cruDataReadFromTr32_fun [3670725798; 2849173183]
  = [128; 1; 218; 202; 212; 166; 26; 111; 69; 103; 65240].
Proof. vm_compute. reflexivity. Qed.


Example t_0629 :
  cruDataReadFromTr32_fun [1853211226; 1039810869]
  = [128; 1; 110; 117; 194; 90; 45; 156; 27; 165; 65022].
Proof. vm_compute. reflexivity. Qed.


Example t_0630 :
  cruDataReadFromTr32_fun [45602983; 3605223815]
  = [128; 1; 2; 183; 216; 167; 157; 129; 66; 160; 65574].
Proof. vm_compute. reflexivity. Qed.


Example t_0631 :
  cruDataReadFromTr32_fun [304186518; 1712169370]
  = [128; 1; 18; 33; 132; 150; 178; 228; 175; 252; 65204].
Proof. vm_compute. reflexivity. Qed.


Example t_0632 :
  cruDataReadFromTr32_fun [94488532; 837458302]
  = [128; 1; 5; 161; 199; 212; 201; 3; 237; 86; 66333].
Proof. vm_compute. reflexivity. Qed.


Example t_0633 :
  cruDataReadFromTr32_fun [3918157546; 2409726110]
  = [128; 1; 233; 138; 86; 234; 42; 169; 37; 76; 65210].
Proof. vm_compute. reflexivity. Qed.


Example t_0634 :
  cruDataReadFromTr32_fun [3895488063; 1166371261]
  = [128; 1; 232; 48; 110; 63; 101; 95; 227; 2; 65608].
Proof. vm_compute. reflexivity. Qed.


Example t_0635 :
  cruDataReadFromTr32_fun [1343072382; 185278331]
  = [128; 1; 80; 13; 168; 126; 202; 146; 70; 131; 64488].
Proof. vm_compute. reflexivity. Qed.


Example t_0636 :
  cruDataReadFromTr32_fun [274830430; 2890711542]
  = [128; 1; 16; 97; 148; 94; 138; 117; 205; 104; 65470].
Proof. vm_compute. reflexivity. Qed.


Example t_0637 :
  cruDataReadFromTr32_fun [2962792948; 32849266]
  = [128; 1; 176; 152; 161; 244; 169; 66; 29; 130; 65475].
Proof. vm_compute. reflexivity. Qed.


Example t_0638 :
  cruDataReadFromTr32_fun [1583443148; 2404015800]
  = [128; 1; 94; 97; 108; 204; 116; 70; 106; 20; 65432].
Proof. vm_compute. reflexivity. Qed.


Example t_0639 :
  cruDataReadFromTr32_fun [3167938651; 2687032784]
  = [128; 1; 188; 210; 232; 91; 49; 24; 242; 139; 65513].
Proof. vm_compute. reflexivity. Qed.


Example t_0640 :
  cruDataReadFromTr32_fun [3810870188; 3671690483]
  = [128; 1; 227; 37; 67; 172; 117; 18; 48; 57; 65380].
Proof. vm_compute. reflexivity. Qed.


Example t_0641 :
  cruDataReadFromTr32_fun [3947815642; 3977797164]
  = [128; 1; 235; 78; 226; 218; 138; 101; 154; 174; 65583].
Proof. vm_compute. reflexivity. Qed.


Example t_0642 :
  cruDataReadFromTr32_fun [4050334461; 1621887944]
  = [128; 1; 241; 107; 50; 253; 230; 197; 11; 53; 65895].
Proof. vm_compute. reflexivity. Qed.


Example t_0643 :
  cruDataReadFromTr32_fun [1224973731; 4057780923]
  = [128; 1; 73; 3; 157; 163; 69; 144; 40; 104; 65305].
Proof. vm_compute. reflexivity. Qed.


Example t_0644 :
  cruDataReadFromTr32_fun [4159580177; 3463690177]
  = [128; 1; 247; 238; 40; 17; 99; 86; 80; 208; 65446].
Proof. vm_compute. reflexivity. Qed.


Example t_0645 :
  cruDataReadFromTr32_fun [2204901109; 101949688]
  = [128; 1; 131; 108; 30; 245; 135; 40; 249; 253; 65001].
Proof. vm_compute. reflexivity. Qed.


Example t_0646 :
  cruDataReadFromTr32_fun [2865140652; 140448246]
  = [128; 1; 170; 198; 147; 172; 209; 240; 124; 182; 65993].
Proof. vm_compute. reflexivity. Qed.


Example t_0647 :
  cruDataReadFromTr32_fun [3739686550; 4082765247]
  = [128; 1; 222; 231; 22; 150; 152; 147; 232; 87; 65499].
Proof. vm_compute. reflexivity. Qed.


Example t_0648 :
  cruDataReadFromTr32_fun [1162136574; 3671069778]
  = [128; 1; 69; 68; 203; 254; 210; 126; 224; 172; 65478].
Proof. vm_compute. reflexivity. Qed.


Example t_0649 :
  cruDataReadFromTr32_fun [3378603856; 1411603423]
  = [128; 1; 201; 97; 103; 80; 134; 235; 250; 241; 65404].
Proof. vm_compute. reflexivity. Qed.


Example t_0650 :
  cruDataReadFromTr32_fun [3556214229; 3399367232]
  = [128; 1; 211; 247; 133; 213; 88; 118; 107; 149; 64439].
Proof. vm_compute. reflexivity. Qed.


Example t_0651 :
  cruDataReadFromTr32_fun [1778233461; 2057623114]
  = [128; 1; 105; 253; 176; 117; 65; 195; 255; 43; 65668].
Proof. vm_compute. reflexivity. Qed.


Example t_0652 :
  cruDataReadFromTr32_fun [2343013920; 3389297214]
  = [128; 1; 139; 167; 142; 32; 195; 236; 26; 226; 67782].
Proof. vm_compute. reflexivity. Qed.


Example t_0653 :
  cruDataReadFromTr32_fun [43149035; 917330413]
  = [128; 1; 2; 146; 102; 235; 34; 146; 3; 126; 65660].
Proof. vm_compute. reflexivity. Qed.


Example t_0654 :
  cruDataReadFromTr32_fun [2690899759; 1112162555]
  = [128; 1; 160; 99; 223; 47; 131; 58; 27; 180; 65822].
Proof. vm_compute. reflexivity. Qed.


Example t_0655 :
  cruDataReadFromTr32_fun [211774637; 1939910029]
  = [128; 1; 12; 159; 108; 173; 105; 85; 133; 160; 65485].
Proof. vm_compute. reflexivity. Qed.


Example t_0656 :
  cruDataReadFromTr32_fun [527455588; 2326721993]
  = [128; 1; 31; 112; 85; 100; 236; 60; 68; 27; 65138].
Proof. vm_compute. reflexivity. Qed.


Example t_0657 :
  cruDataReadFromTr32_fun [851810879; 168502736]
  = [128; 1; 50; 197; 154; 63; 46; 77; 92; 111; 66664].
Proof. vm_compute. reflexivity. Qed.


Example t_0658 :
  cruDataReadFromTr32_fun [3339936524; 4054388737]
  = [128; 1; 199; 19; 99; 12; 169; 242; 83; 139; 57971].
Proof. vm_compute. reflexivity. Qed.


Example t_0659 :
  cruDataReadFromTr32_fun [2233715669; 800223678]
  = [128; 1; 133; 35; 203; 213; 46; 170; 57; 23; 64244].
Proof. vm_compute. reflexivity. Qed.


Example t_0660 :
  cruDataReadFromTr32_fun [3810686505; 1705536748]
  = [128; 1; 227; 34; 118; 41; 81; 176; 127; 61; 64782].
Proof. vm_compute. reflexivity. Qed.


Example t_0661 :
  cruDataReadFromTr32_fun [336022235; 4244254954]
  = [128; 1; 20; 7; 74; 219; 148; 37; 142; 241; 67316].
Proof. vm_compute. reflexivity. Qed.


Example t_0662 :
  cruDataReadFromTr32_fun [1926845951; 1238481100]
  = [128; 1; 114; 217; 85; 255; 17; 228; 3; 51; 65425].
Proof. vm_compute. reflexivity. Qed.


Example t_0663 :
  cruDataReadFromTr32_fun [1365484529; 1626589605]
  = [128; 1; 81; 99; 163; 241; 106; 84; 172; 204; 65202].
Proof. vm_compute. reflexivity. Qed.


Example t_0664 :
  cruDataReadFromTr32_fun [2534385684; 2054977628]
  = [128; 1; 151; 15; 168; 20; 90; 207; 93; 184; 65516].
Proof. vm_compute. reflexivity. Qed.


Example t_0665 :
  cruDataReadFromTr32_fun [1618274506; 1639534775]
  = [128; 1; 96; 116; 232; 202; 219; 99; 243; 147; 66496].
Proof. vm_compute. reflexivity. Qed.


Example t_0666 :
  cruDataReadFromTr32_fun [2318508892; 2985979228]
  = [128; 1; 138; 49; 163; 92; 213; 109; 228; 0; 65759].
Proof. vm_compute. reflexivity. Qed.


Example t_0667 :
  cruDataReadFromTr32_fun [1780575731; 1830792802]
  = [128; 1; 106; 33; 109; 243; 140; 216; 240; 145; 65590].
Proof. vm_compute. reflexivity. Qed.


Example t_0668 :
  cruDataReadFromTr32_fun [281284053; 1820348159]
  = [128; 1; 16; 196; 13; 213; 228; 107; 62; 86; 71187].
Proof. vm_compute. reflexivity. Qed.


Example t_0669 :
  cruDataReadFromTr32_fun [2330239376; 3654107708]
  = [128; 1; 138; 228; 161; 144; 151; 184; 125; 84; 65256].
Proof. vm_compute. reflexivity. Qed.


Example t_0670 :
  cruDataReadFromTr32_fun [151517374; 1700306015]
  = [128; 1; 9; 7; 248; 190; 79; 253; 139; 223; 66120].
Proof. vm_compute. reflexivity. Qed.


Example t_0671 :
  cruDataReadFromTr32_fun [1185736344; 2127496476]
  = [128; 1; 70; 172; 230; 152; 47; 96; 111; 124; 64162].
Proof. vm_compute. reflexivity. Qed.


Example t_0672 :
  cruDataReadFromTr32_fun [3822640813; 922515017]
  = [128; 1; 227; 216; 222; 173; 43; 23; 140; 228; 65340].
Proof. vm_compute. reflexivity. Qed.


Example t_0673 :
  cruDataReadFromTr32_fun [469220361; 3224271437]
  = [128; 1; 27; 247; 188; 9; 115; 6; 104; 60; 66011].
Proof. vm_compute. reflexivity. Qed.


Example t_0674 :
  cruDataReadFromTr32_fun [3183089893; 2226423126]
  = [128; 1; 189; 186; 24; 229; 147; 72; 62; 143; 66035].
Proof. vm_compute. reflexivity. Qed.


Example t_0675 :
  cruDataReadFromTr32_fun [997674251; 4128829646]
  = [128; 1; 59; 119; 77; 11; 81; 214; 195; 61; 65577].
Proof. vm_compute. reflexivity. Qed.


Example t_0676 :
  cruDataReadFromTr32_fun [2149639053; 2699619971]
  = [128; 1; 128; 32; 227; 141; 83; 175; 54; 138; 65152].
Proof. vm_compute. reflexivity. Qed.


Example t_0677 :
  cruDataReadFromTr32_fun [3378146244; 1354591809]
  = [128; 1; 201; 90; 107; 196; 215; 84; 30; 3; 65089].
Proof. vm_compute. reflexivity. Qed.


Example t_0678 :
  cruDataReadFromTr32_fun [2217952150; 3031872471]
  = [128; 1; 132; 51; 67; 150; 42; 214; 123; 63; 64875].
Proof. vm_compute. reflexivity. Qed.


Example t_0679 :
  cruDataReadFromTr32_fun [2020086458; 1714960480]
  = [128; 1; 120; 104; 18; 186; 46; 76; 10; 90; 65333].
Proof. vm_compute. reflexivity. Qed.


Example t_0680 :
  cruDataReadFromTr32_fun [4024998984; 1414035400]
  = [128; 1; 239; 232; 156; 72; 191; 220; 8; 128; 64656].
Proof. vm_compute. reflexivity. Qed.


Example t_0681 :
  cruDataReadFromTr32_fun [1520794785; 1575210386]
  = [128; 1; 90; 165; 124; 161; 238; 168; 120; 15; 65852].
Proof. vm_compute. reflexivity. Qed.


Example t_0682 :
  cruDataReadFromTr32_fun [355878889; 198155922]
  = [128; 1; 21; 54; 71; 233; 241; 53; 242; 87; 65401].
Proof. vm_compute. reflexivity. Qed.


Example t_0683 :
  cruDataReadFromTr32_fun [1520712091; 1058960289]
  = [128; 1; 90; 164; 57; 155; 170; 191; 150; 122; 64980].
Proof. vm_compute. reflexivity. Qed.


Example t_0684 :
  cruDataReadFromTr32_fun [1469581666; 2361802201]
  = [128; 1; 87; 152; 9; 98; 45; 240; 184; 9; 65263].
Proof. vm_compute. reflexivity. Qed.


Example t_0685 :
  cruDataReadFromTr32_fun [2257589802; 3038650500]
  = [128; 1; 134; 144; 22; 42; 96; 130; 55; 166; 65292].
Proof. vm_compute. reflexivity. Qed.


Example t_0686 :
  cruDataReadFromTr32_fun [2525047284; 1790218709]
  = [128; 1; 150; 129; 41; 244; 134; 21; 130; 159; 64756].
Proof. vm_compute. reflexivity. Qed.


Example t_0687 :
  cruDataReadFromTr32_fun [3053814387; 3201191386]
  = [128; 1; 182; 5; 130; 115; 94; 94; 33; 153; 65350].
Proof. vm_compute. reflexivity. Qed.


Example t_0688 :
  cruDataReadFromTr32_fun [3688998019; 2019645488]
  = [128; 1; 219; 225; 164; 131; 148; 44; 100; 83; 64127].
Proof. vm_compute. reflexivity. Qed.


Example t_0689 :
  cruDataReadFromTr32_fun [1692524318; 3800944079]
  = [128; 1; 100; 225; 223; 30; 201; 58; 248; 207; 65591].
Proof. vm_compute. reflexivity. Qed.


Example t_0690 :
  cruDataReadFromTr32_fun [2018176211; 1127215400]
  = [128; 1; 120; 74; 236; 211; 205; 19; 143; 171; 65749].
Proof. vm_compute. reflexivity. Qed.


Example t_0691 :
  cruDataReadFromTr32_fun [4243403956; 1253773718]
  = [128; 1; 252; 237; 52; 180; 15; 186; 238; 30; 64936].
Proof. vm_compute. reflexivity. Qed.


Example t_0692 :
  cruDataReadFromTr32_fun [3254153207; 3390089433]
  = [128; 1; 193; 246; 111; 247; 0; 58; 51; 158; 64794].
Proof. vm_compute. reflexivity. Qed.


Example t_0693 :
  cruDataReadFromTr32_fun [3865461284; 2670945040]
  = [128; 1; 230; 102; 66; 36; 224; 228; 103; 20; 63251].
Proof. vm_compute. reflexivity. Qed.


Example t_0694 :
  cruDataReadFromTr32_fun [1655142077; 1818116569]
  = [128; 1; 98; 167; 118; 189; 37; 106; 33; 100; 64501].
Proof. vm_compute. reflexivity. Qed.


Example t_0695 :
  cruDataReadFromTr32_fun [888370398; 3266305346]
  = [128; 1; 52; 243; 116; 222; 202; 50; 56; 156; 64853].
Proof. vm_compute. reflexivity. Qed.


Example t_0696 :
  cruDataReadFromTr32_fun [168689552; 1729135813]
  = [128; 1; 10; 13; 255; 144; 43; 63; 221; 75; 64771].
Proof. vm_compute. reflexivity. Qed.


Example t_0697 :
  cruDataReadFromTr32_fun [4166273591; 82075082]
  = [128; 1; 248; 84; 74; 55; 101; 158; 209; 109; 63853].
Proof. vm_compute. reflexivity. Qed.


Example t_0698 :
  cruDataReadFromTr32_fun [3886851549; 2362736757]
  = [128; 1; 231; 172; 165; 221; 197; 24; 95; 232; 65378].
Proof. vm_compute. reflexivity. Qed.


Example t_0699 :
  cruDataReadFromTr32_fun [2219295182; 2676398252]
  = [128; 1; 132; 71; 193; 206; 168; 13; 127; 34; 65505].
Proof. vm_compute. reflexivity. Qed.


Example t_0700 :
  cruDataReadFromTr32_fun [2531928490; 2445829505]
  = [128; 1; 150; 234; 41; 170; 233; 84; 132; 169; 65361].
Proof. vm_compute. reflexivity. Qed.


Example t_0701 :
  cruDataReadFromTr32_fun [2321767070; 2076874043]
  = [128; 1; 138; 99; 90; 158; 243; 227; 98; 227; 66334].
Proof. vm_compute. reflexivity. Qed.


Example t_0702 :
  cruDataReadFromTr32_fun [1856331009; 1351168907]
  = [128; 1; 110; 165; 93; 1; 98; 181; 238; 246; 64809].
Proof. vm_compute. reflexivity. Qed.


Example t_0703 :
  cruDataReadFromTr32_fun [1428538871; 3128616764]
  = [128; 1; 85; 37; 197; 247; 216; 30; 124; 187; 65485].
Proof. vm_compute. reflexivity. Qed.


Example t_0704 :
  cruDataReadFromTr32_fun [836888564; 1637484464]
  = [128; 1; 49; 225; 231; 244; 157; 75; 184; 68; 64389].
Proof. vm_compute. reflexivity. Qed.


Example t_0705 :
  cruDataReadFromTr32_fun [547312023; 195525158]
  = [128; 1; 32; 159; 81; 151; 232; 180; 234; 113; 65958].
Proof. vm_compute. reflexivity. Qed.


Example t_0706 :
  cruDataReadFromTr32_fun [2870923662; 1050590713]
  = [128; 1; 171; 30; 209; 142; 187; 223; 16; 21; 64164].
Proof. vm_compute. reflexivity. Qed.


Example t_0707 :
  cruDataReadFromTr32_fun [1871356606; 2458605216]
  = [128; 1; 111; 138; 162; 190; 34; 170; 156; 30; 67021].
Proof. vm_compute. reflexivity. Qed.


Example t_0708 :
  cruDataReadFromTr32_fun [3745416545; 147315632]
  = [128; 1; 223; 62; 133; 97; 58; 100; 129; 177; 64179].
Proof. vm_compute. reflexivity. Qed.


Example t_0709 :
  cruDataReadFromTr32_fun [4257849144; 1411405637]
  = [128; 1; 253; 201; 159; 56; 185; 212; 234; 115; 65526].
Proof. vm_compute. reflexivity. Qed.


Example t_0710 :
  cruDataReadFromTr32_fun [2186262445; 780454037]
  = [128; 1; 130; 79; 183; 173; 150; 47; 57; 152; 65453].
Proof. vm_compute. reflexivity. Qed.


Example t_0711 :
  cruDataReadFromTr32_fun [2389125867; 1174327693]
  = [128; 1; 142; 103; 42; 235; 71; 209; 31; 222; 62686].
Proof. vm_compute. reflexivity. Qed.


Example t_0712 :
  cruDataReadFromTr32_fun [4062228567; 1185675061]
  = [128; 1; 242; 32; 176; 87; 1; 112; 83; 162; 65189].
Proof. vm_compute. reflexivity. Qed.


Example t_0713 :
  cruDataReadFromTr32_fun [2106326887; 4253281544]
  = [128; 1; 125; 139; 255; 103; 65; 254; 150; 95; 65972].
Proof. vm_compute. reflexivity. Qed.


Example t_0714 :
  cruDataReadFromTr32_fun [4203871280; 1942636171]
  = [128; 1; 250; 145; 252; 48; 107; 234; 251; 37; 65586].
Proof. vm_compute. reflexivity. Qed.


Example t_0715 :
  cruDataReadFromTr32_fun [107841864; 453895011]
  = [128; 1; 6; 109; 137; 72; 114; 81; 87; 101; 64405].
Proof. vm_compute. reflexivity. Qed.


Example t_0716 :
  cruDataReadFromTr32_fun [1343738246; 2280710640]
  = [128; 1; 80; 23; 209; 134; 192; 151; 231; 150; 64676].
Proof. vm_compute. reflexivity. Qed.


Example t_0717 :
  cruDataReadFromTr32_fun [502280332; 4125508812]
  = [128; 1; 29; 240; 48; 140; 27; 44; 81; 192; 65084].
Proof. vm_compute. reflexivity. Qed.


Example t_0718 :
  cruDataReadFromTr32_fun [1258561570; 556050522]
  = [128; 1; 75; 4; 32; 34; 188; 51; 164; 200; 63680].
Proof. vm_compute. reflexivity. Qed.


Example t_0719 :
  cruDataReadFromTr32_fun [2846297986; 2035629163]
  = [128; 1; 169; 167; 15; 130; 218; 240; 8; 151; 69474].
Proof. vm_compute. reflexivity. Qed.


Example t_0720 :
  cruDataReadFromTr32_fun [692098813; 3444655772]
  = [128; 1; 41; 64; 150; 253; 4; 146; 158; 97; 65115].
Proof. vm_compute. reflexivity. Qed.


Example t_0721 :
  cruDataReadFromTr32_fun [3186123023; 2058350517]
  = [128; 1; 189; 232; 97; 15; 155; 48; 75; 218; 64814].
Proof. vm_compute. reflexivity. Qed.


Example t_0722 :
  cruDataReadFromTr32_fun [1830551901; 730392967]
  = [128; 1; 109; 28; 1; 93; 6; 7; 219; 86; 65262].
Proof. vm_compute. reflexivity. Qed.


Example t_0723 :
  cruDataReadFromTr32_fun [2479891147; 905072230]
  = [128; 1; 147; 208; 34; 203; 87; 5; 7; 101; 64717].
Proof. vm_compute. reflexivity. Qed.


Example t_0724 :
  cruDataReadFromTr32_fun [472593001; 2409055012]
  = [128; 1; 28; 43; 50; 105; 88; 53; 129; 69; 65264].
Proof. vm_compute. reflexivity. Qed.


Example t_0725 :
  cruDataReadFromTr32_fun [3054966396; 739616600]
  = [128; 1; 182; 23; 22; 124; 148; 213; 27; 36; 65136].
Proof. vm_compute. reflexivity. Qed.


Example t_0726 :
  cruDataReadFromTr32_fun [324039713; 3228225683]
  = [128; 1; 19; 80; 116; 33; 136; 77; 237; 14; 64975].
Proof. vm_compute. reflexivity. Qed.


Example t_0727 :
  cruDataReadFromTr32_fun [1381891119; 144081744]
  = [128; 1; 82; 93; 252; 47; 149; 9; 32; 223; 65954].
Proof. vm_compute. reflexivity. Qed.


Example t_0728 :
  cruDataReadFromTr32_fun [844245522; 2434846992]
  = [128; 1; 50; 82; 42; 18; 49; 153; 225; 2; 64773].
Proof. vm_compute. reflexivity. Qed.


Example t_0729 :
  cruDataReadFromTr32_fun [2663789155; 857942972]
  = [128; 1; 158; 198; 50; 99; 253; 56; 228; 167; 64584].
Proof. vm_compute. reflexivity. Qed.


Example t_0730 :
  cruDataReadFromTr32_fun [1278801782; 450511440]
  = [128; 1; 76; 56; 247; 118; 158; 127; 221; 38; 65099].
Proof. vm_compute. reflexivity. Qed.


Example t_0731 :
  cruDataReadFromTr32_fun [3539485670; 597018498]
  = [128; 1; 210; 248; 67; 230; 122; 70; 61; 100; 65538].
Proof. vm_compute. reflexivity. Qed.


Example t_0732 :
  cruDataReadFromTr32_fun [459573666; 2769433945]
  = [128; 1; 27; 100; 137; 162; 255; 109; 0; 201; 64692].
Proof. vm_compute. reflexivity. Qed.


Example t_0733 :
  cruDataReadFromTr32_fun [3795255652; 1300089589]
  = [128; 1; 226; 55; 1; 100; 83; 158; 176; 239; 64633].
Proof. vm_compute. reflexivity. Qed.


Example t_0734 :
  cruDataReadFromTr32_fun [1815807705; 1253487096]
  = [128; 1; 108; 59; 6; 217; 124; 221; 80; 225; 64015].
Proof. vm_compute. reflexivity. Qed.


Example t_0735 :
  cruDataReadFromTr32_fun [839970732; 2731381670]
  = [128; 1; 50; 16; 239; 172; 246; 13; 47; 6; 65277].
Proof. vm_compute. reflexivity. Qed.


Example t_0736 :
  cruDataReadFromTr32_fun [3750926996; 1188918788]
  = [128; 1; 223; 146; 154; 148; 7; 112; 38; 144; 64764].
Proof. vm_compute. reflexivity. Qed.


Example t_0737 :
  cruDataReadFromTr32_fun [1954477637; 3003511417]
  = [128; 1; 116; 126; 246; 69; 68; 114; 64; 76; 65453].
Proof. vm_compute. reflexivity. Qed.


Example t_0738 :
  cruDataReadFromTr32_fun [849515522; 294787570]
  = [128; 1; 50; 162; 148; 2; 234; 29; 115; 16; 64952].
Proof. vm_compute. reflexivity. Qed.


Example t_0739 :
  cruDataReadFromTr32_fun [3681148728; 1622071299]
  = [128; 1; 219; 105; 223; 56; 210; 39; 8; 181; 64285].
Proof. vm_compute. reflexivity. Qed.


Example t_0740 :
  cruDataReadFromTr32_fun [3646896778; 4230905067]
  = [128; 1; 217; 95; 58; 138; 244; 111; 51; 31; 65017].
Proof. vm_compute. reflexivity. Qed.


Example t_0741 :
  cruDataReadFromTr32_fun [1858404405; 4084554212]
  = [128; 1; 110; 197; 0; 53; 53; 252; 152; 81; 64889].
Proof. vm_compute. reflexivity. Qed.


Example t_0742 :
  cruDataReadFromTr32_fun [1190538753; 3663675047]
  = [128; 1; 70; 246; 46; 1; 156; 54; 66; 218; 64801].
Proof. vm_compute. reflexivity. Qed.


Example t_0743 :
  cruDataReadFromTr32_fun [154429676; 4221853525]
  = [128; 1; 9; 52; 104; 236; 223; 191; 180; 23; 66180].
Proof. vm_compute. reflexivity. Qed.


Example t_0744 :
  cruDataReadFromTr32_fun [1871148707; 1735848565]
  = [128; 1; 111; 135; 118; 163; 195; 137; 190; 174; 64999].
Proof. vm_compute. reflexivity. Qed.


Example t_0745 :
  cruDataReadFromTr32_fun [1487646808; 32008402]
  = [128; 1; 88; 171; 176; 88; 74; 247; 176; 134; 65465].
Proof. vm_compute. reflexivity. Qed.


Example t_0746 :
  cruDataReadFromTr32_fun [3990462717; 1411967305]
  = [128; 1; 237; 217; 160; 253; 174; 37; 92; 52; 65928].
Proof. vm_compute. reflexivity. Qed.


Example t_0747 :
  cruDataReadFromTr32_fun [3009368181; 1397815384]
  = [128; 1; 179; 95; 80; 117; 8; 138; 132; 29; 65619].
Proof. vm_compute. reflexivity. Qed.


Example t_0748 :
  cruDataReadFromTr32_fun [203007725; 2374901244]
  = [128; 1; 12; 25; 166; 237; 69; 154; 134; 241; 65199].
Proof. vm_compute. reflexivity. Qed.


Example t_0749 :
  cruDataReadFromTr32_fun [4074556370; 2678010847]
  = [128; 1; 242; 220; 203; 210; 34; 215; 135; 115; 65235].
Proof. vm_compute. reflexivity. Qed.


Example t_0750 :
  cruDataReadFromTr32_fun [2525776416; 1041837332]
  = [128; 1; 150; 140; 74; 32; 101; 9; 167; 12; 65517].
Proof. vm_compute. reflexivity. Qed.


Example t_0751 :
  cruDataReadFromTr32_fun [3712773064; 2430832570]
  = [128; 1; 221; 76; 107; 200; 190; 48; 185; 14; 65821].
Proof. vm_compute. reflexivity. Qed.


Example t_0752 :
  cruDataReadFromTr32_fun [3292443559; 607944919]
  = [128; 1; 196; 62; 179; 167; 190; 66; 158; 80; 65394].
Proof. vm_compute. reflexivity. Qed.


Example t_0753 :
  cruDataReadFromTr32_fun [2161023292; 3409663847]
  = [128; 1; 128; 206; 153; 60; 83; 62; 245; 85; 65164].
Proof. vm_compute. reflexivity. Qed.


Example t_0754 :
  cruDataReadFromTr32_fun [2038766934; 2633254125]
  = [128; 1; 121; 133; 29; 86; 86; 179; 78; 233; 65337].
Proof. vm_compute. reflexivity. Qed.


Example t_0755 :
  cruDataReadFromTr32_fun [2971743483; 2009056012]
  = [128; 1; 177; 33; 52; 251; 25; 66; 247; 239; 63398].
Proof. vm_compute. reflexivity. Qed.


Example t_0756 :
  cruDataReadFromTr32_fun [852832773; 2516921470]
  = [128; 1; 50; 213; 50; 5; 159; 102; 68; 135; 64339].
Proof. vm_compute. reflexivity. Qed.


Example t_0757 :
  cruDataReadFromTr32_fun [666011526; 4263191587]
  = [128; 1; 39; 178; 135; 134; 55; 41; 116; 227; 66383].
Proof. vm_compute. reflexivity. Qed.


Example t_0758 :
  cruDataReadFromTr32_fun [2607696772; 3424879628]
  = [128; 1; 155; 110; 75; 132; 225; 12; 205; 120; 65637].
Proof. vm_compute. reflexivity. Qed.


Example t_0759 :
  cruDataReadFromTr32_fun [1318686821; 1937553410]
  = [128; 1; 78; 153; 144; 101; 153; 120; 217; 99; 64596].
Proof. vm_compute. reflexivity. Qed.


Example t_0760 :
  cruDataReadFromTr32_fun [3270914861; 4055410563]
  = [128; 1; 194; 246; 51; 45; 173; 145; 77; 42; 65304].
Proof. vm_compute. reflexivity. Qed.


Example t_0761 :
  cruDataReadFromTr32_fun [86664533; 285346115]
  = [128; 1; 5; 42; 101; 85; 117; 44; 253; 146; 65063].
Proof. vm_compute. reflexivity. Qed.


Example t_0762 :
  cruDataReadFromTr32_fun [242983126; 4292793335]
  = [128; 1; 14; 123; 160; 214; 254; 6; 200; 95; 53896].
Proof. vm_compute. reflexivity. Qed.


Example t_0763 :
  cruDataReadFromTr32_fun [2012709683; 1891908019]
  = [128; 1; 119; 247; 131; 51; 105; 80; 35; 0; 65735].
Proof. vm_compute. reflexivity. Qed.


Example t_0764 :
  cruDataReadFromTr32_fun [2970936755; 2477142765]
  = [128; 1; 177; 20; 229; 179; 240; 136; 41; 70; 65514].
Proof. vm_compute. reflexivity. Qed.


Example t_0765 :
  cruDataReadFromTr32_fun [540468696; 480509040]
  = [128; 1; 32; 54; 229; 216; 85; 145; 33; 104; 65667].
Proof. vm_compute. reflexivity. Qed.


Example t_0766 :
  cruDataReadFromTr32_fun [3163322761; 54465785]
  = [128; 1; 188; 140; 121; 137; 88; 215; 225; 16; 64663].
Proof. vm_compute. reflexivity. Qed.


Example t_0767 :
  cruDataReadFromTr32_fun [2676242226; 1854237194]
  = [128; 1; 159; 132; 55; 50; 115; 179; 210; 40; 65000].
Proof. vm_compute. reflexivity. Qed.


Example t_0768 :
  cruDataReadFromTr32_fun [3339611398; 1233761344]
  = [128; 1; 199; 14; 109; 6; 66; 94; 216; 198; 62061].
Proof. vm_compute. reflexivity. Qed.


Example t_0769 :
  cruDataReadFromTr32_fun [1059260754; 2502306688]
  = [128; 1; 63; 35; 9; 82; 61; 18; 157; 210; 67193].
Proof. vm_compute. reflexivity. Qed.


Example t_0770 :
  cruDataReadFromTr32_fun [2191900938; 1845646821]
  = [128; 1; 130; 165; 193; 10; 21; 206; 93; 165; 67273].
Proof. vm_compute. reflexivity. Qed.


Example t_0771 :
  cruDataReadFromTr32_fun [990365910; 4032214579]
  = [128; 1; 59; 7; 200; 214; 118; 12; 44; 35; 65536].
Proof. vm_compute. reflexivity. Qed.


Example t_0772 :
  cruDataReadFromTr32_fun [1051324422; 211298384]
  = [128; 1; 62; 169; 240; 6; 126; 37; 239; 182; 65115].
Proof. vm_compute. reflexivity. Qed.


Example t_0773 :
  cruDataReadFromTr32_fun [770423976; 372119707]
  = [128; 1; 45; 235; 188; 168; 46; 201; 241; 141; 65446].
Proof. vm_compute. reflexivity. Qed.


Example t_0774 :
  cruDataReadFromTr32_fun [107168853; 444041234]
  = [128; 1; 6; 99; 68; 85; 39; 175; 197; 67; 65261].
Proof. vm_compute. reflexivity. Qed.


Example t_0775 :
  cruDataReadFromTr32_fun [655837597; 1192327817]
  = [128; 1; 39; 23; 73; 157; 104; 195; 19; 148; 64860].
Proof. vm_compute. reflexivity. Qed.


Example t_0776 :
  cruDataReadFromTr32_fun [1417090558; 989212391]
  = [128; 1; 84; 119; 21; 254; 148; 152; 90; 151; 65222].
Proof. vm_compute. reflexivity. Qed.


Example t_0777 :
  cruDataReadFromTr32_fun [3233600784; 2285272097]
  = [128; 1; 192; 188; 213; 16; 83; 196; 105; 111; 65296].
Proof. vm_compute. reflexivity. Qed.


Example t_0778 :
  cruDataReadFromTr32_fun [544665644; 1070899510]
  = [128; 1; 32; 118; 240; 44; 202; 242; 233; 246; 64153].
Proof. vm_compute. reflexivity. Qed.


Example t_0779 :
  cruDataReadFromTr32_fun [2234531190; 2089836791]
  = [128; 1; 133; 48; 61; 118; 80; 208; 87; 255; 64902].
Proof. vm_compute. reflexivity. Qed.


Example t_0780 :
  cruDataReadFromTr32_fun [1351634258; 2874566880]
  = [128; 1; 80; 144; 77; 82; 80; 110; 84; 114; 65433].
Proof. vm_compute. reflexivity. Qed.


Example t_0781 :
  cruDataReadFromTr32_fun [650165887; 3756340458]
  = [128; 1; 38; 192; 190; 127; 57; 117; 254; 149; 65601].
Proof. vm_compute. reflexivity. Qed.


Example t_0782 :
  cruDataReadFromTr32_fun [3513496165; 1997852383]
  = [128; 1; 209; 107; 178; 101; 228; 190; 83; 6; 64872].
Proof. vm_compute. reflexivity. Qed.


Example t_0783 :
  cruDataReadFromTr32_fun [3182568462; 3988636362]
  = [128; 1; 189; 178; 36; 14; 174; 213; 198; 68; 65393].
Proof. vm_compute. reflexivity. Qed.


Example t_0784 :
  cruDataReadFromTr32_fun [1572110704; 1306826287]
  = [128; 1; 93; 180; 129; 112; 2; 27; 2; 193; 65121].
Proof. vm_compute. reflexivity. Qed.


Example t_0785 :
  cruDataReadFromTr32_fun [3252367984; 3323741587]
  = [128; 1; 193; 219; 50; 112; 9; 225; 182; 93; 64480].
Proof. vm_compute. reflexivity. Qed.


Example t_0786 :
  cruDataReadFromTr32_fun [4270260858; 3729054392]
  = [128; 1; 254; 135; 2; 122; 66; 175; 131; 194; 65215].
Proof. vm_compute. reflexivity. Qed.


Example t_0787 :
  cruDataReadFromTr32_fun [1444877763; 2958284197]
  = [128; 1; 86; 31; 21; 195; 207; 182; 18; 158; 65368].
Proof. vm_compute. reflexivity. Qed.


Example t_0788 :
  cruDataReadFromTr32_fun [3634305693; 2856667002]
  = [128; 1; 216; 159; 26; 157; 80; 253; 144; 35; 63362].
Proof. vm_compute. reflexivity. Qed.


Example t_0789 :
  cruDataReadFromTr32_fun [2266710254; 1625704512]
  = [128; 1; 135; 27; 64; 238; 153; 89; 24; 174; 67538].
Proof. vm_compute. reflexivity. Qed.


Example t_0790 :
  cruDataReadFromTr32_fun [2534315330; 3930081223]
  = [128; 1; 151; 14; 149; 66; 204; 242; 48; 251; 65090].
Proof. vm_compute. reflexivity. Qed.


Example t_0791 :
  cruDataReadFromTr32_fun [2718013499; 1180389522]
  = [128; 1; 162; 1; 152; 59; 137; 78; 144; 169; 65367].
Proof. vm_compute. reflexivity. Qed.


Example t_0792 :
  cruDataReadFromTr32_fun [96907632; 2194995690]
  = [128; 1; 5; 198; 177; 112; 237; 110; 172; 134; 65123].
Proof. vm_compute. reflexivity. Qed.


Example t_0793 :
  cruDataReadFromTr32_fun [2040187922; 868827127]
  = [128; 1; 121; 154; 204; 18; 42; 113; 135; 155; 63627].
Proof. vm_compute. reflexivity. Qed.


Example t_0794 :
  cruDataReadFromTr32_fun [2828032941; 1362582406]
  = [128; 1; 168; 144; 91; 173; 243; 6; 195; 39; 65698].
Proof. vm_compute. reflexivity. Qed.


Example t_0795 :
  cruDataReadFromTr32_fun [177020096; 3706408757]
  = [128; 1; 10; 141; 28; 192; 163; 73; 104; 11; 65099].
Proof. vm_compute. reflexivity. Qed.


Example t_0796 :
  cruDataReadFromTr32_fun [1830709939; 2241453464]
  = [128; 1; 109; 30; 106; 179; 180; 115; 89; 27; 65416].
Proof. vm_compute. reflexivity. Qed.


Example t_0797 :
  cruDataReadFromTr32_fun [194072291; 3251106314]
  = [128; 1; 11; 145; 78; 227; 45; 194; 97; 217; 65710].
Proof. vm_compute. reflexivity. Qed.


Example t_0798 :
  cruDataReadFromTr32_fun [3330063321; 1798083887]
  = [128; 1; 198; 124; 187; 217; 241; 154; 190; 42; 65126].
Proof. vm_compute. reflexivity. Qed.


Example t_0799 :
  cruDataReadFromTr32_fun [2910383460; 325691184]
  = [128; 1; 173; 120; 237; 100; 78; 226; 222; 52; 65328].
Proof. vm_compute. reflexivity. Qed.


Example t_0800 :
  cruDataReadFromTr32_fun [458464796; 2492637168]
  = [128; 1; 27; 83; 158; 28; 208; 16; 246; 44; 66890].
Proof. vm_compute. reflexivity. Qed.


Example t_0801 :
  cruDataReadFromTr32_fun [4180697651; 1660473545]
  = [128; 1; 249; 48; 98; 51; 18; 159; 245; 234; 66191].
Proof. vm_compute. reflexivity. Qed.


Example t_0802 :
  cruDataReadFromTr32_fun [156830126; 2681476221]
  = [128; 1; 9; 89; 9; 174; 83; 143; 51; 177; 65441].
Proof. vm_compute. reflexivity. Qed.


Example t_0803 :
  cruDataReadFromTr32_fun [315733082; 1588987975]
  = [128; 1; 18; 209; 180; 90; 15; 31; 207; 147; 65368].
Proof. vm_compute. reflexivity. Qed.


Example t_0804 :
  cruDataReadFromTr32_fun [1325010566; 667676850]
  = [128; 1; 78; 250; 14; 134; 13; 38; 118; 212; 65854].
Proof. vm_compute. reflexivity. Qed.


Example t_0805 :
  cruDataReadFromTr32_fun [39843808; 1733849754]
  = [128; 1; 2; 95; 247; 224; 71; 64; 210; 70; 64996].
Proof. vm_compute. reflexivity. Qed.


Example t_0806 :
  cruDataReadFromTr32_fun [3620741172; 3328201500]
  = [128; 1; 215; 208; 32; 52; 65; 153; 91; 24; 64974].
Proof. vm_compute. reflexivity. Qed.


Example t_0807 :
  cruDataReadFromTr32_fun [2896563222; 1636304392]
  = [128; 1; 172; 166; 12; 22; 15; 33; 10; 14; 64896].
Proof. vm_compute. reflexivity. Qed.


Example t_0808 :
  cruDataReadFromTr32_fun [4052941115; 3804257087]
  = [128; 1; 241; 146; 249; 59; 111; 0; 61; 124; 65949].
Proof. vm_compute. reflexivity. Qed.


Example t_0809 :
  cruDataReadFromTr32_fun [3604531566; 4215175322]
  = [128; 1; 214; 216; 201; 110; 122; 214; 157; 212; 65751].
Proof. vm_compute. reflexivity. Qed.


Example t_0810 :
  cruDataReadFromTr32_fun [3250237383; 3564948502]
  = [128; 1; 193; 186; 175; 199; 43; 163; 238; 177; 64990].
Proof. vm_compute. reflexivity. Qed.


Example t_0811 :
  cruDataReadFromTr32_fun [609332438; 1735257760]
  = [128; 1; 36; 81; 172; 214; 115; 219; 14; 54; 66361].
Proof. vm_compute. reflexivity. Qed.


Example t_0812 :
  cruDataReadFromTr32_fun [1405063928; 4063894077]
  = [128; 1; 83; 191; 146; 248; 126; 146; 151; 59; 65451].
Proof. vm_compute. reflexivity. Qed.


Example t_0813 :
  cruDataReadFromTr32_fun [954548091; 2599502602]
  = [128; 1; 56; 229; 63; 123; 22; 149; 129; 113; 65289].
Proof. vm_compute. reflexivity. Qed.


Example t_0814 :
  cruDataReadFromTr32_fun [1609017010; 3461735861]
  = [128; 1; 95; 231; 166; 178; 188; 132; 155; 125; 64697].
Proof. vm_compute. reflexivity. Qed.


Example t_0815 :
  cruDataReadFromTr32_fun [148597342; 261392300]
  = [128; 1; 8; 219; 106; 94; 195; 138; 184; 178; 64935].
Proof. vm_compute. reflexivity. Qed.


Example t_0816 :
  cruDataReadFromTr32_fun [3268629074; 2577433087]
  = [128; 1; 194; 211; 82; 82; 249; 115; 207; 211; 65006].
Proof. vm_compute. reflexivity. Qed.


Example t_0817 :
  cruDataReadFromTr32_fun [862602661; 485441354]
  = [128; 1; 51; 106; 69; 165; 142; 26; 171; 91; 65310].
Proof. vm_compute. reflexivity. Qed.


Example t_0818 :
  cruDataReadFromTr32_fun [442000594; 2869458915]
  = [128; 1; 26; 88; 100; 210; 243; 139; 222; 111; 66266].
Proof. vm_compute. reflexivity. Qed.


Example t_0819 :
  cruDataReadFromTr32_fun [519598031; 4230478561]
  = [128; 1; 30; 248; 111; 207; 54; 205; 229; 110; 65240].
Proof. vm_compute. reflexivity. Qed.


Example t_0820 :
  cruDataReadFromTr32_fun [897146701; 4162859855]
  = [128; 1; 53; 121; 95; 77; 77; 114; 211; 126; 65148].
Proof. vm_compute. reflexivity. Qed.


Example t_0821 :
  cruDataReadFromTr32_fun [1070697276; 3137362427]
  = [128; 1; 63; 209; 139; 60; 4; 254; 46; 193; 78319].
Proof. vm_compute. reflexivity. Qed.


Example t_0822 :
  cruDataReadFromTr32_fun [830933764; 2701154702]
  = [128; 1; 49; 135; 11; 4; 16; 179; 120; 118; 68800].
Proof. vm_compute. reflexivity. Qed.


Example t_0823 :
  cruDataReadFromTr32_fun [1376832339; 3491395956]
  = [128; 1; 82; 16; 203; 83; 143; 51; 11; 223; 65491].
Proof. vm_compute. reflexivity. Qed.


Example t_0824 :
  cruDataReadFromTr32_fun [3592882757; 2807799654]
  = [128; 1; 214; 39; 10; 69; 220; 155; 29; 223; 64902].
Proof. vm_compute. reflexivity. Qed.


Example t_0825 :
  cruDataReadFromTr32_fun [821173248; 995908950]
  = [128; 1; 48; 242; 28; 0; 163; 196; 105; 170; 65018].
Proof. vm_compute. reflexivity. Qed.


Example t_0826 :
  cruDataReadFromTr32_fun [3913559387; 1163841599]
  = [128; 1; 233; 68; 45; 91; 83; 77; 124; 156; 64783].
Proof. vm_compute. reflexivity. Qed.


Example t_0827 :
  cruDataReadFromTr32_fun [315382876; 3230774074]
  = [128; 1; 18; 204; 92; 92; 155; 20; 70; 34; 65535].
Proof. vm_compute. reflexivity. Qed.


Example t_0828 :
  cruDataReadFromTr32_fun [1761328362; 1953248836]
  = [128; 1; 104; 251; 188; 234; 42; 170; 168; 166; 65831].
Proof. vm_compute. reflexivity. Qed.


Example t_0829 :
  cruDataReadFromTr32_fun [632301242; 1504210561]
  = [128; 1; 37; 176; 38; 186; 160; 62; 248; 185; 64802].
Proof. vm_compute. reflexivity. Qed.


Example t_0830 :
  cruDataReadFromTr32_fun [2069211478; 3472391562]
  = [128; 1; 123; 85; 169; 86; 40; 155; 240; 204; 65196].
Proof. vm_compute. reflexivity. Qed.


Example t_0831 :
  cruDataReadFromTr32_fun [1774774303; 3825626049]
  = [128; 1; 105; 200; 232; 31; 136; 248; 92; 222; 65983].
Proof. vm_compute. reflexivity. Qed.


Example t_0832 :
  cruDataReadFromTr32_fun [3650815035; 2600994035]
  = [128; 1; 217; 155; 4; 59; 194; 149; 120; 200; 63603].
Proof. vm_compute. reflexivity. Qed.


Example t_0833 :
  cruDataReadFromTr32_fun [3360156565; 3261977519]
  = [128; 1; 200; 71; 235; 149; 60; 195; 239; 102; 64253].
Proof. vm_compute. reflexivity. Qed.


Example t_0834 :
  cruDataReadFromTr32_fun [1548625140; 2543892719]
  = [128; 1; 92; 78; 36; 244; 149; 9; 227; 133; 66546].
Proof. vm_compute. reflexivity. Qed.


Example t_0835 :
  cruDataReadFromTr32_fun [1797401914; 2756453534]
  = [128; 1; 107; 34; 45; 58; 236; 232; 87; 156; 63647].
Proof. vm_compute. reflexivity. Qed.


Example t_0836 :
  cruDataReadFromTr32_fun [957777876; 3319047188]
  = [128; 1; 57; 22; 135; 212; 93; 147; 237; 192; 65262].
Proof. vm_compute. reflexivity. Qed.


Example t_0837 :
  cruDataReadFromTr32_fun [2012492453; 1190796205]
  = [128; 1; 119; 244; 50; 165; 174; 7; 237; 120; 64784].
Proof. vm_compute. reflexivity. Qed.


Example t_0838 :
  cruDataReadFromTr32_fun [3453582662; 1148762610]
  = [128; 1; 205; 217; 125; 70; 197; 189; 188; 84; 65243].
Proof. vm_compute. reflexivity. Qed.


Example t_0839 :
  cruDataReadFromTr32_fun [1853704725; 758696952]
  = [128; 1; 110; 125; 74; 21; 221; 170; 122; 29; 64715].
Proof. vm_compute. reflexivity. Qed.


Example t_0840 :
  cruDataReadFromTr32_fun [3549968558; 1459185052]
  = [128; 1; 211; 152; 56; 174; 249; 81; 161; 18; 65889].
Proof. vm_compute. reflexivity. Qed.


Example t_0841 :
  cruDataReadFromTr32_fun [747801869; 1065475322]
  = [128; 1; 44; 146; 141; 13; 173; 255; 45; 19; 65753].
Proof. vm_compute. reflexivity. Qed.


Example t_0842 :
  cruDataReadFromTr32_fun [2870180975; 4111304177]
  = [128; 1; 171; 19; 124; 111; 60; 200; 238; 254; 64878].
Proof. vm_compute. reflexivity. Qed.


Example t_0843 :
  cruDataReadFromTr32_fun [3880307633; 4203952282]
  = [128; 1; 231; 72; 203; 177; 54; 81; 224; 23; 65860].
Proof. vm_compute. reflexivity. Qed.


Example t_0844 :
  cruDataReadFromTr32_fun [1756705697; 563491857]
  = [128; 1; 104; 181; 51; 161; 18; 57; 8; 16; 64952].
Proof. vm_compute. reflexivity. Qed.


Example t_0845 :
  cruDataReadFromTr32_fun [1761224209; 493221269]
  = [128; 1; 104; 250; 38; 17; 254; 142; 250; 252; 65518].
Proof. vm_compute. reflexivity. Qed.


Example t_0846 :
  cruDataReadFromTr32_fun [3717912537; 767882794]
  = [128; 1; 221; 154; 215; 217; 146; 80; 246; 175; 65233].
Proof. vm_compute. reflexivity. Qed.


Example t_0847 :
  cruDataReadFromTr32_fun [97607891; 544424573]
  = [128; 1; 5; 209; 96; 211; 30; 255; 92; 214; 65358].
Proof. vm_compute. reflexivity. Qed.


Example t_0848 :
  cruDataReadFromTr32_fun [3687557497; 2122720343]
  = [128; 1; 219; 203; 169; 121; 160; 87; 176; 162; 65637].
Proof. vm_compute. reflexivity. Qed.


Example t_0849 :
  cruDataReadFromTr32_fun [288994796; 2869845906]
  = [128; 1; 17; 57; 181; 236; 237; 91; 31; 90; 64495].
Proof. vm_compute. reflexivity. Qed.


Example t_0850 :
  cruDataReadFromTr32_fun [4234361112; 2707713954]
  = [128; 1; 252; 99; 57; 24; 13; 54; 154; 118; 64896].
Proof. vm_compute. reflexivity. Qed.


Example t_0851 :
  cruDataReadFromTr32_fun [516668090; 2961332927]
  = [128; 1; 30; 203; 186; 186; 175; 118; 191; 123; 65850].
Proof. vm_compute. reflexivity. Qed.


Example t_0852 :
  cruDataReadFromTr32_fun [1413184011; 3036910081]
  = [128; 1; 84; 59; 122; 11; 33; 0; 232; 138; 59810].
Proof. vm_compute. reflexivity. Qed.


Example t_0853 :
  cruDataReadFromTr32_fun [477850086; 1181409814]
  = [128; 1; 28; 123; 105; 230; 11; 129; 146; 208; 65069].
Proof. vm_compute. reflexivity. Qed.


Example t_0854 :
  cruDataReadFromTr32_fun [3602961624; 1122802307]
  = [128; 1; 214; 192; 212; 216; 10; 33; 123; 213; 65400].
Proof. vm_compute. reflexivity. Qed.


Example t_0855 :
  cruDataReadFromTr32_fun [928517716; 219346641]
  = [128; 1; 55; 88; 14; 84; 179; 192; 128; 3; 65152].
Proof. vm_compute. reflexivity. Qed.


Example t_0856 :
  cruDataReadFromTr32_fun [292960513; 3815619189]
  = [128; 1; 17; 118; 57; 1; 228; 229; 185; 12; 63898].
Proof. vm_compute. reflexivity. Qed.


Example t_0857 :
  cruDataReadFromTr32_fun [3852593204; 3516309150]
  = [128; 1; 229; 161; 232; 52; 223; 90; 152; 150; 65616].
Proof. vm_compute. reflexivity. Qed.


Example t_0858 :
  cruDataReadFromTr32_fun [930319006; 4188644984]
  = [128; 1; 55; 115; 138; 158; 18; 157; 32; 38; 64417].
Proof. vm_compute. reflexivity. Qed.


Example t_0859 :
  cruDataReadFromTr32_fun [2243748713; 1149988944]
  = [128; 1; 133; 188; 227; 105; 134; 233; 155; 25; 65832].
Proof. vm_compute. reflexivity. Qed.


Example t_0860 :
  cruDataReadFromTr32_fun [3863506515; 1352128487]
  = [128; 1; 230; 72; 110; 83; 225; 156; 137; 236; 65097].
Proof. vm_compute. reflexivity. Qed.


Example t_0861 :
  cruDataReadFromTr32_fun [933202597; 2210327017]
  = [128; 1; 55; 159; 138; 165; 147; 85; 149; 60; 65406].
Proof. vm_compute. reflexivity. Qed.


Example t_0862 :
  cruDataReadFromTr32_fun [2214298091; 356949860]
  = [128; 1; 131; 251; 129; 235; 18; 4; 148; 135; 66016].
Proof. vm_compute. reflexivity. Qed.


Example t_0863 :
  cruDataReadFromTr32_fun [2712300463; 3064413777]
  = [128; 1; 161; 170; 107; 175; 62; 162; 85; 222; 65573].
Proof. vm_compute. reflexivity. Qed.


Example t_0864 :
  cruDataReadFromTr32_fun [1073299362; 2289331911]
  = [128; 1; 63; 249; 63; 162; 241; 188; 52; 91; 65609].
Proof. vm_compute. reflexivity. Qed.


Example t_0865 :
  cruDataReadFromTr32_fun [929263411; 531124119]
  = [128; 1; 55; 99; 111; 51; 235; 226; 235; 28; 65787].
Proof. vm_compute. reflexivity. Qed.


Example t_0866 :
  cruDataReadFromTr32_fun [2057887338; 77123173]
  = [128; 1; 122; 168; 222; 106; 194; 119; 66; 133; 66187].
Proof. vm_compute. reflexivity. Qed.


Example t_0867 :
  cruDataReadFromTr32_fun [4072162367; 2965964380]
  = [128; 1; 242; 184; 68; 63; 166; 114; 107; 227; 65471].
Proof. vm_compute. reflexivity. Qed.


Example t_0868 :
  cruDataReadFromTr32_fun [457636213; 3447839238]
  = [128; 1; 27; 70; 249; 117; 14; 178; 34; 111; 65023].
Proof. vm_compute. reflexivity. Qed.


Example t_0869 :
  cruDataReadFromTr32_fun [1160845372; 1061738875]
  = [128; 1; 69; 49; 24; 60; 170; 84; 252; 65; 65287].
Proof. vm_compute. reflexivity. Qed.


Example t_0870 :
  cruDataReadFromTr32_fun [2846116425; 2594217334]
  = [128; 1; 169; 164; 74; 73; 95; 82; 103; 211; 65457].
Proof. vm_compute. reflexivity. Qed.


Example t_0871 :
  cruDataReadFromTr32_fun [3576523291; 4087150586]
  = [128; 1; 213; 45; 106; 27; 176; 12; 111; 33; 65365].
Proof. vm_compute. reflexivity. Qed.


Example t_0872 :
  cruDataReadFromTr32_fun [3546008618; 55839208]
  = [128; 1; 211; 91; 204; 42; 122; 12; 182; 66; 64342].
Proof. vm_compute. reflexivity. Qed.


Example t_0873 :
  cruDataReadFromTr32_fun [2900458882; 1948916144]
  = [128; 1; 172; 225; 125; 130; 77; 196; 59; 210; 64177].
Proof. vm_compute. reflexivity. Qed.


Example t_0874 :
  cruDataReadFromTr32_fun [601558205; 1497783330]
  = [128; 1; 35; 219; 12; 189; 109; 194; 193; 155; 65202].
Proof. vm_compute. reflexivity. Qed.


Example t_0875 :
  cruDataReadFromTr32_fun [2493564068; 375725859]
  = [128; 1; 148; 160; 196; 164; 176; 203; 55; 1; 65730].
Proof. vm_compute. reflexivity. Qed.


Example t_0876 :
  cruDataReadFromTr32_fun [619164657; 4172903218]
  = [128; 1; 36; 231; 179; 241; 136; 231; 217; 191; 65030].
Proof. vm_compute. reflexivity. Qed.


Example t_0877 :
  cruDataReadFromTr32_fun [75095512; 725916492]
  = [128; 1; 4; 121; 221; 216; 123; 130; 232; 140; 65034].
Proof. vm_compute. reflexivity. Qed.


Example t_0878 :
  cruDataReadFromTr32_fun [2832745461; 1469738088]
  = [128; 1; 168; 216; 67; 245; 30; 116; 11; 141; 64903].
Proof. vm_compute. reflexivity. Qed.


Example t_0879 :
  cruDataReadFromTr32_fun [2528133470; 3440174909]
  = [128; 1; 150; 176; 65; 94; 80; 22; 248; 161; 64511].
Proof. vm_compute. reflexivity. Qed.


Example t_0880 :
  cruDataReadFromTr32_fun [1844764715; 3417606978]
  = [128; 1; 109; 244; 224; 43; 124; 133; 245; 233; 65816].
Proof. vm_compute. reflexivity. Qed.


Example t_0881 :
  cruDataReadFromTr32_fun [596239491; 2117919977]
  = [128; 1; 35; 137; 228; 131; 195; 191; 116; 26; 65488].
Proof. vm_compute. reflexivity. Qed.


Example t_0882 :
  cruDataReadFromTr32_fun [1246814522; 2408038223]
  = [128; 1; 74; 80; 225; 58; 126; 168; 201; 107; 64725].
Proof. vm_compute. reflexivity. Qed.


Example t_0883 :
  cruDataReadFromTr32_fun [697862775; 1940531519]
  = [128; 1; 41; 152; 138; 119; 139; 3; 0; 184; 63962].
Proof. vm_compute. reflexivity. Qed.


Example t_0884 :
  cruDataReadFromTr32_fun [1452767794; 2004758019]
  = [128; 1; 86; 151; 122; 50; 158; 48; 77; 175; 64413].
Proof. vm_compute. reflexivity. Qed.


Example t_0885 :
  cruDataReadFromTr32_fun [1292182192; 1645912933]
  = [128; 1; 77; 5; 34; 176; 248; 60; 49; 203; 64711].
Proof. vm_compute. reflexivity. Qed.


Example t_0886 :
  cruDataReadFromTr32_fun [3296042223; 2354912783]
  = [128; 1; 196; 117; 156; 239; 102; 167; 134; 96; 64233].
Proof. vm_compute. reflexivity. Qed.


Example t_0887 :
  cruDataReadFromTr32_fun [1234334493; 81621794]
  = [128; 1; 73; 146; 115; 29; 179; 110; 144; 251; 65734].
Proof. vm_compute. reflexivity. Qed.


Example t_0888 :
  cruDataReadFromTr32_fun [3581069866; 1843740160]
  = [128; 1; 213; 114; 202; 42; 90; 44; 140; 42; 53950].
Proof. vm_compute. reflexivity. Qed.


Example t_0889 :
  cruDataReadFromTr32_fun [892106043; 2807886262]
  = [128; 1; 53; 44; 117; 59; 60; 72; 94; 133; 64962].
Proof. vm_compute. reflexivity. Qed.


Example t_0890 :
  cruDataReadFromTr32_fun [1118931920; 2436308546]
  = [128; 1; 66; 177; 139; 208; 77; 9; 142; 142; 65293].
Proof. vm_compute. reflexivity. Qed.


Example t_0891 :
  cruDataReadFromTr32_fun [1975131327; 3998903965]
  = [128; 1; 117; 186; 28; 191; 180; 150; 252; 162; 65713].
Proof. vm_compute. reflexivity. Qed.


Example t_0892 :
  cruDataReadFromTr32_fun [3951027033; 4260498655]
  = [128; 1; 235; 127; 227; 89; 230; 148; 69; 250; 65254].
Proof. vm_compute. reflexivity. Qed.


Example t_0893 :
  cruDataReadFromTr32_fun [3285564260; 2802821469]
  = [128; 1; 195; 213; 187; 100; 164; 154; 192; 135; 65334].
Proof. vm_compute. reflexivity. Qed.


Example t_0894 :
  cruDataReadFromTr32_fun [1277248996; 2475507319]
  = [128; 1; 76; 33; 69; 228; 127; 51; 66; 237; 65451].
Proof. vm_compute. reflexivity. Qed.


Example t_0895 :
  cruDataReadFromTr32_fun [3805458895; 1156189476]
  = [128; 1; 226; 210; 177; 207; 18; 239; 54; 171; 65737].
Proof. vm_compute. reflexivity. Qed.


Example t_0896 :
  cruDataReadFromTr32_fun [1435110897; 2083718511]
  = [128; 1; 85; 138; 13; 241; 242; 217; 192; 2; 64141].
Proof. vm_compute. reflexivity. Qed.


Example t_0897 :
  cruDataReadFromTr32_fun [3500587363; 2563468776]
  = [128; 1; 208; 166; 185; 99; 157; 146; 63; 123; 64966].
Proof. vm_compute. reflexivity. Qed.


Example t_0898 :
  cruDataReadFromTr32_fun [1219840077; 3299838852]
  = [128; 1; 72; 181; 72; 77; 219; 203; 126; 201; 65749].
Proof. vm_compute. reflexivity. Qed.


Example t_0899 :
  cruDataReadFromTr32_fun [2818611376; 4249098827]
  = [128; 1; 168; 0; 152; 176; 76; 201; 163; 229; 65382].
Proof. vm_compute. reflexivity. Qed.


Example t_0900 :
  cruDataReadFromTr32_fun [2236711569; 3933621032]
  = [128; 1; 133; 81; 130; 145; 214; 0; 203; 105; 64680].
Proof. vm_compute. reflexivity. Qed.


Example t_0901 :
  cruDataReadFromTr32_fun [3346737028; 2338831877]
  = [128; 1; 199; 123; 39; 132; 239; 242; 107; 255; 67354].
Proof. vm_compute. reflexivity. Qed.


Example t_0902 :
  cruDataReadFromTr32_fun [1224500265; 688392772]
  = [128; 1; 72; 252; 100; 41; 163; 249; 123; 229; 65401].
Proof. vm_compute. reflexivity. Qed.


Example t_0903 :
  cruDataReadFromTr32_fun [1455062947; 2810378713]
  = [128; 1; 86; 186; 127; 163; 112; 180; 114; 74; 65428].
Proof. vm_compute. reflexivity. Qed.


Example t_0904 :
  cruDataReadFromTr32_fun [805981588; 3501268590]
  = [128; 1; 48; 10; 77; 148; 183; 232; 102; 38; 64347].
Proof. vm_compute. reflexivity. Qed.


Example t_0905 :
  cruDataReadFromTr32_fun [1465272771; 548118502]
  = [128; 1; 87; 86; 73; 195; 140; 122; 156; 221; 63772].
Proof. vm_compute. reflexivity. Qed.


Example t_0906 :
  cruDataReadFromTr32_fun [1975950955; 3229806700]
  = [128; 1; 117; 198; 158; 107; 246; 187; 227; 255; 65308].
Proof. vm_compute. reflexivity. Qed.


Example t_0907 :
  cruDataReadFromTr32_fun [505229434; 2080459021]
  = [128; 1; 30; 29; 48; 122; 162; 192; 109; 237; 62022].
Proof. vm_compute. reflexivity. Qed.


Example t_0908 :
  cruDataReadFromTr32_fun [2139922201; 2548938418]
  = [128; 1; 127; 140; 159; 25; 222; 122; 65; 103; 65434].
Proof. vm_compute. reflexivity. Qed.


Example t_0909 :
  cruDataReadFromTr32_fun [2353661111; 1950053632]
  = [128; 1; 140; 74; 4; 183; 53; 201; 15; 183; 72714].
Proof. vm_compute. reflexivity. Qed.


Example t_0910 :
  cruDataReadFromTr32_fun [576864970; 482118866]
  = [128; 1; 34; 98; 66; 202; 99; 236; 30; 248; 64351].
Proof. vm_compute. reflexivity. Qed.


Example t_0911 :
  cruDataReadFromTr32_fun [3371952265; 1596516205]
  = [128; 1; 200; 251; 232; 137; 254; 70; 183; 156; 65793].
Proof. vm_compute. reflexivity. Qed.


Example t_0912 :
  cruDataReadFromTr32_fun [3285688308; 3302955081]
  = [128; 1; 195; 215; 159; 244; 110; 132; 172; 43; 65715].
Proof. vm_compute. reflexivity. Qed.


Example t_0913 :
  cruDataReadFromTr32_fun [3399182857; 169130661]
  = [128; 1; 202; 155; 106; 9; 202; 228; 1; 228; 65717].
Proof. vm_compute. reflexivity. Qed.


Example t_0914 :
  cruDataReadFromTr32_fun [1307985701; 302349880]
  = [128; 1; 77; 246; 71; 37; 62; 175; 228; 237; 64126].
Proof. vm_compute. reflexivity. Qed.


Example t_0915 :
  cruDataReadFromTr32_fun [3595034256; 1175680510]
  = [128; 1; 214; 71; 222; 144; 153; 239; 103; 146; 65320].
Proof. vm_compute. reflexivity. Qed.


Example t_0916 :
  cruDataReadFromTr32_fun [455025255; 521982524]
  = [128; 1; 27; 31; 34; 103; 138; 107; 110; 43; 65004].
Proof. vm_compute. reflexivity. Qed.


Example t_0917 :
  cruDataReadFromTr32_fun [276266217; 785999580]
  = [128; 1; 16; 119; 124; 233; 78; 81; 132; 13; 65264].
Proof. vm_compute. reflexivity. Qed.


Example t_0918 :
  cruDataReadFromTr32_fun [4211623921; 4058838588]
  = [128; 1; 251; 8; 71; 241; 255; 150; 111; 181; 65535].
Proof. vm_compute. reflexivity. Qed.


Example t_0919 :
  cruDataReadFromTr32_fun [1354783819; 2757280575]
  = [128; 1; 80; 192; 92; 75; 216; 201; 56; 140; 65278].
Proof. vm_compute. reflexivity. Qed.


Example t_0920 :
  cruDataReadFromTr32_fun [3525973186; 2422595521]
  = [128; 1; 210; 42; 20; 194; 116; 180; 21; 129; 66002].
Proof. vm_compute. reflexivity. Qed.


Example t_0921 :
  cruDataReadFromTr32_fun [3983992172; 3194104048]
  = [128; 1; 237; 118; 229; 108; 96; 41; 52; 124; 65576].
Proof. vm_compute. reflexivity. Qed.


Example t_0922 :
  cruDataReadFromTr32_fun [1870405450; 2561474505]
  = [128; 1; 111; 124; 31; 74; 45; 79; 4; 1; 50695].
Proof. vm_compute. reflexivity. Qed.


Example t_0923 :
  cruDataReadFromTr32_fun [4267660664; 4286944741]
  = [128; 1; 254; 95; 85; 120; 193; 164; 178; 19; 77797].
Proof. vm_compute. reflexivity. Qed.


Example t_0924 :
  cruDataReadFromTr32_fun [1132427150; 272881071]
  = [128; 1; 67; 127; 119; 142; 85; 38; 121; 95; 65122].
Proof. vm_compute. reflexivity. Qed.


Example t_0925 :
  cruDataReadFromTr32_fun [875555653; 286748390]
  = [128; 1; 52; 47; 235; 69; 174; 207; 239; 95; 64416].
Proof. vm_compute. reflexivity. Qed.


Example t_0926 :
  cruDataReadFromTr32_fun [2183549986; 1223460917]
  = [128; 1; 130; 38; 84; 34; 175; 125; 230; 109; 64796].
Proof. vm_compute. reflexivity. Qed.


Example t_0927 :
  cruDataReadFromTr32_fun [977809326; 1804790545]
  = [128; 1; 58; 72; 47; 174; 152; 42; 205; 29; 65167].
Proof. vm_compute. reflexivity. Qed.


Example t_0928 :
  cruDataReadFromTr32_fun [1550630102; 1158807415]
  = [128; 1; 92; 108; 188; 214; 160; 90; 120; 223; 68831].
Proof. vm_compute. reflexivity. Qed.


Example t_0929 :
  cruDataReadFromTr32_fun [3882520103; 793439160]
  = [128; 1; 231; 106; 142; 39; 93; 149; 126; 111; 65575].
Proof. vm_compute. reflexivity. Qed.


Example t_0930 :
  cruDataReadFromTr32_fun [4120101496; 608023739]
  = [128; 1; 245; 147; 194; 120; 240; 48; 107; 61; 65131].
Proof. vm_compute. reflexivity. Qed.


Example t_0931 :
  cruDataReadFromTr32_fun [3026507571; 2075184140]
  = [128; 1; 180; 100; 215; 51; 17; 26; 17; 39; 65519].
Proof. vm_compute. reflexivity. Qed.


Example t_0932 :
  cruDataReadFromTr32_fun [13014644; 1035845886]
  = [128; 1; 0; 198; 150; 116; 161; 233; 84; 118; 65569].
Proof. vm_compute. reflexivity. Qed.


Example t_0933 :
  cruDataReadFromTr32_fun [2008990206; 4272918795]
  = [128; 1; 119; 190; 193; 254; 208; 215; 182; 115; 62051].
Proof. vm_compute. reflexivity. Qed.


Example t_0934 :
  cruDataReadFromTr32_fun [2303679093; 2018710446]
  = [128; 1; 137; 79; 90; 117; 58; 134; 29; 199; 66208].
Proof. vm_compute. reflexivity. Qed.


Example t_0935 :
  cruDataReadFromTr32_fun [2832210195; 1283905808]
  = [128; 1; 168; 208; 25; 19; 159; 181; 200; 3; 65184].
Proof. vm_compute. reflexivity. Qed.


Example t_0936 :
  cruDataReadFromTr32_fun [290071614; 2920576368]
  = [128; 1; 17; 74; 36; 62; 109; 112; 102; 206; 65620].
Proof. vm_compute. reflexivity. Qed.


Example t_0937 :
  cruDataReadFromTr32_fun [1014552241; 148147498]
  = [128; 1; 60; 120; 214; 177; 157; 234; 222; 135; 65556].
Proof. vm_compute. reflexivity. Qed.


Example t_0938 :
  cruDataReadFromTr32_fun [3959551458; 400998668]
  = [128; 1; 236; 1; 245; 226; 199; 123; 186; 214; 65464].
Proof. vm_compute. reflexivity. Qed.


Example t_0939 :
  cruDataReadFromTr32_fun [2206095414; 3081510557]
  = [128; 1; 131; 126; 88; 54; 161; 225; 136; 25; 65380].
Proof. vm_compute. reflexivity. Qed.


Example t_0940 :
  cruDataReadFromTr32_fun [2910098808; 1824253214]
  = [128; 1; 173; 116; 149; 120; 158; 171; 63; 90; 65266].
Proof. vm_compute. reflexivity. Qed.


Example t_0941 :
  cruDataReadFromTr32_fun [3533286354; 3167275520]
  = [128; 1; 210; 153; 171; 210; 122; 53; 225; 210; 75927].
Proof. vm_compute. reflexivity. Qed.


Example t_0942 :
  cruDataReadFromTr32_fun [1659075686; 1825473366]
  = [128; 1; 98; 227; 124; 102; 93; 86; 164; 16; 65141].
Proof. vm_compute. reflexivity. Qed.


Example t_0943 :
  cruDataReadFromTr32_fun [3553326231; 2225921103]
  = [128; 1; 211; 203; 116; 151; 165; 140; 191; 200; 65658].
Proof. vm_compute. reflexivity. Qed.


Example t_0944 :
  cruDataReadFromTr32_fun [2771157218; 263288017]
  = [128; 1; 165; 44; 128; 226; 110; 53; 116; 145; 65713].
Proof. vm_compute. reflexivity. Qed.


Example t_0945 :
  cruDataReadFromTr32_fun [849489579; 110069233]
  = [128; 1; 50; 162; 46; 171; 115; 213; 161; 58; 65290].
Proof. vm_compute. reflexivity. Qed.


Example t_0946 :
  cruDataReadFromTr32_fun [1264531331; 4287908258]
  = [128; 1; 75; 95; 55; 131; 21; 239; 190; 225; 55274].
Proof. vm_compute. reflexivity. Qed.


Example t_0947 :
  cruDataReadFromTr32_fun [3765905937; 2241839226]
  = [128; 1; 224; 119; 42; 17; 42; 183; 166; 151; 65258].
Proof. vm_compute. reflexivity. Qed.


Example t_0948 :
  cruDataReadFromTr32_fun [2943469244; 3323136767]
  = [128; 1; 175; 113; 198; 188; 242; 228; 59; 61; 65556].
Proof. vm_compute. reflexivity. Qed.


Example t_0949 :
  cruDataReadFromTr32_fun [3407736277; 4017238603]
  = [128; 1; 203; 29; 237; 213; 148; 196; 225; 10; 65125].
Proof. vm_compute. reflexivity. Qed.


Example t_0950 :
  cruDataReadFromTr32_fun [1149220926; 1417279793]
  = [128; 1; 68; 127; 184; 62; 45; 2; 87; 141; 65496].
Proof. vm_compute. reflexivity. Qed.


Example t_0951 :
  cruDataReadFromTr32_fun [839757117; 1092594493]
  = [128; 1; 50; 13; 173; 61; 128; 195; 160; 128; 64252].
Proof. vm_compute. reflexivity. Qed.


Example t_0952 :
  cruDataReadFromTr32_fun [1623465762; 102754055]
  = [128; 1; 96; 196; 31; 34; 106; 151; 187; 155; 64256].
Proof. vm_compute. reflexivity. Qed.


Example t_0953 :
  cruDataReadFromTr32_fun [3699088090; 4123559699]
  = [128; 1; 220; 123; 154; 218; 202; 246; 157; 71; 65524].
Proof. vm_compute. reflexivity. Qed.


Example t_0954 :
  cruDataReadFromTr32_fun [1670923082; 78046025]
  = [128; 1; 99; 152; 67; 74; 178; 99; 4; 129; 65603].
Proof. vm_compute. reflexivity. Qed.


Example t_0955 :
  cruDataReadFromTr32_fun [1474880982; 904395701]
  = [128; 1; 87; 232; 229; 214; 21; 254; 196; 161; 66558].
Proof. vm_compute. reflexivity. Qed.


Example t_0956 :
  cruDataReadFromTr32_fun [2281077874; 421655801]
  = [128; 1; 135; 246; 124; 114; 255; 207; 3; 249; 63604].
Proof. vm_compute. reflexivity. Qed.


Example t_0957 :
  cruDataReadFromTr32_fun [3777225005; 3476640954]
  = [128; 1; 225; 35; 225; 45; 174; 148; 233; 115; 65289].
Proof. vm_compute. reflexivity. Qed.


Example t_0958 :
  cruDataReadFromTr32_fun [1942717047; 1797323216]
  = [128; 1; 115; 203; 130; 119; 153; 39; 112; 167; 65154].
Proof. vm_compute. reflexivity. Qed.


Example t_0959 :
  cruDataReadFromTr32_fun [2507583428; 4025120470]
  = [128; 1; 149; 118; 175; 196; 154; 199; 163; 238; 64851].
Proof. vm_compute. reflexivity. Qed.


Example t_0960 :
  cruDataReadFromTr32_fun [2657353971; 3194929669]
  = [128; 1; 158; 100; 0; 243; 23; 86; 65; 110; 63518].
Proof. vm_compute. reflexivity. Qed.


Example t_0961 :
  cruDataReadFromTr32_fun [1796533398; 346853299]
  = [128; 1; 107; 20; 236; 150; 172; 176; 54; 99; 65400].
Proof. vm_compute. reflexivity. Qed.


Example t_0962 :
  cruDataReadFromTr32_fun [3075373877; 3929488830]
  = [128; 1; 183; 78; 123; 53; 232; 182; 28; 119; 65617].
Proof. vm_compute. reflexivity. Qed.


Example t_0963 :
  cruDataReadFromTr32_fun [3698821495; 444713416]
  = [128; 1; 220; 119; 137; 119; 2; 218; 163; 175; 64874].
Proof. vm_compute. reflexivity. Qed.


Example t_0964 :
  cruDataReadFromTr32_fun [468133330; 1926364626]
  = [128; 1; 27; 231; 37; 210; 18; 20; 17; 0; 63942].
Proof. vm_compute. reflexivity. Qed.


Example t_0965 :
  cruDataReadFromTr32_fun [1255851316; 854298394]
  = [128; 1; 74; 218; 197; 52; 141; 182; 195; 26; 65113].
Proof. vm_compute. reflexivity. Qed.


Example t_0966 :
  cruDataReadFromTr32_fun [3848289455; 3061511127]
  = [128; 1; 229; 96; 60; 175; 108; 95; 52; 88; 64911].
Proof. vm_compute. reflexivity. Qed.


Example t_0967 :
  cruDataReadFromTr32_fun [535189330; 3554171572]
  = [128; 1; 31; 230; 87; 82; 56; 59; 86; 158; 65073].
Proof. vm_compute. reflexivity. Qed.


Example t_0968 :
  cruDataReadFromTr32_fun [985246708; 1758488494]
  = [128; 1; 58; 185; 171; 244; 58; 29; 27; 70; 65143].
Proof. vm_compute. reflexivity. Qed.


Example t_0969 :
  cruDataReadFromTr32_fun [4028623311; 3687481147]
  = [128; 1; 240; 31; 233; 207; 249; 149; 8; 20; 64041].
Proof. vm_compute. reflexivity. Qed.


Example t_0970 :
  cruDataReadFromTr32_fun [145254170; 1213091375]
  = [128; 1; 8; 168; 103; 26; 231; 129; 48; 107; 65489].
Proof. vm_compute. reflexivity. Qed.


Example t_0971 :
  cruDataReadFromTr32_fun [2203012089; 2594128052]
  = [128; 1; 131; 79; 75; 249; 56; 80; 101; 69; 64742].
Proof. vm_compute. reflexivity. Qed.


Example t_0972 :
  cruDataReadFromTr32_fun [3516333243; 894237466]
  = [128; 1; 209; 150; 252; 187; 66; 199; 142; 161; 66763].
Proof. vm_compute. reflexivity. Qed.


Example t_0973 :
  cruDataReadFromTr32_fun [2983682427; 1492546800]
  = [128; 1; 177; 215; 97; 123; 212; 27; 100; 139; 65391].
Proof. vm_compute. reflexivity. Qed.


Example t_0974 :
  cruDataReadFromTr32_fun [1652633635; 407682147]
  = [128; 1; 98; 129; 48; 35; 112; 146; 165; 64; 66065].
Proof. vm_compute. reflexivity. Qed.


Example t_0975 :
  cruDataReadFromTr32_fun [984165704; 369019597]
  = [128; 1; 58; 169; 45; 72; 36; 15; 200; 251; 61834].
Proof. vm_compute. reflexivity. Qed.


Example t_0976 :
  cruDataReadFromTr32_fun [177629663; 1691004474]
  = [128; 1; 10; 150; 105; 223; 11; 34; 216; 165; 64929].
Proof. vm_compute. reflexivity. Qed.


Example t_0977 :
  cruDataReadFromTr32_fun [3403423487; 2264011164]
  = [128; 1; 202; 220; 30; 255; 188; 242; 219; 99; 65291].
Proof. vm_compute. reflexivity. Qed.


Example t_0978 :
  cruDataReadFromTr32_fun [2630395877; 3264751267]
  = [128; 1; 156; 200; 167; 229; 38; 67; 210; 194; 65164].
Proof. vm_compute. reflexivity. Qed.


Example t_0979 :
  cruDataReadFromTr32_fun [805722673; 3757597634]
  = [128; 1; 48; 6; 90; 49; 76; 63; 215; 111; 65859].
Proof. vm_compute. reflexivity. Qed.


Example t_0980 :
  cruDataReadFromTr32_fun [2071168539; 3691828254]
  = [128; 1; 123; 115; 134; 27; 165; 208; 192; 253; 64874].
Proof. vm_compute. reflexivity. Qed.


Example t_0981 :
  cruDataReadFromTr32_fun [2099082602; 3893152671]
  = [128; 1; 125; 29; 117; 106; 155; 118; 121; 75; 64338].
Proof. vm_compute. reflexivity. Qed.


Example t_0982 :
  cruDataReadFromTr32_fun [3379147386; 3482708143]
  = [128; 1; 201; 105; 178; 122; 196; 200; 33; 75; 65394].
Proof. vm_compute. reflexivity. Qed.


Example t_0983 :
  cruDataReadFromTr32_fun [584822537; 646651921]
  = [128; 1; 34; 219; 175; 9; 65; 224; 151; 120; 64867].
Proof. vm_compute. reflexivity. Qed.


Example t_0984 :
  cruDataReadFromTr32_fun [3152495316; 3456268387]
  = [128; 1; 187; 231; 66; 212; 239; 32; 251; 241; 64773].
Proof. vm_compute. reflexivity. Qed.


Example t_0985 :
  cruDataReadFromTr32_fun [47084361; 870210728]
  = [128; 1; 2; 206; 115; 73; 190; 30; 106; 161; 64431].
Proof. vm_compute. reflexivity. Qed.


Example t_0986 :
  cruDataReadFromTr32_fun [3150358233; 4127451747]
  = [128; 1; 187; 198; 166; 217; 199; 183; 237; 246; 64954].
Proof. vm_compute. reflexivity. Qed.


Example t_0987 :
  cruDataReadFromTr32_fun [3276003396; 2135572031]
  = [128; 1; 195; 67; 216; 68; 233; 24; 185; 133; 63792].
Proof. vm_compute. reflexivity. Qed.


Example t_0988 :
  cruDataReadFromTr32_fun [1850997702; 3088260458]
  = [128; 1; 110; 83; 251; 198; 191; 207; 147; 92; 64759].
Proof. vm_compute. reflexivity. Qed.


Example t_0989 :
  cruDataReadFromTr32_fun [3625269923; 268033077]
  = [128; 1; 216; 21; 58; 163; 197; 9; 120; 238; 65113].
Proof. vm_compute. reflexivity. Qed.


Example t_0990 :
  cruDataReadFromTr32_fun [1617142403; 2685720102]
  = [128; 1; 96; 99; 162; 131; 202; 185; 223; 93; 64223].
Proof. vm_compute. reflexivity. Qed.


Example t_0991 :
  cruDataReadFromTr32_fun [1338945388; 2623803034]
  = [128; 1; 79; 206; 175; 108; 229; 113; 237; 210; 65669].
Proof. vm_compute. reflexivity. Qed.


Example t_0992 :
  cruDataReadFromTr32_fun [1193247569; 1993573933]
  = [128; 1; 71; 31; 131; 81; 58; 15; 19; 164; 64562].
Proof. vm_compute. reflexivity. Qed.


Example t_0993 :
  cruDataReadFromTr32_fun [2722862626; 4175908296]
  = [128; 1; 162; 75; 150; 34; 29; 11; 44; 90; 64104].
Proof. vm_compute. reflexivity. Qed.


Example t_0994 :
  cruDataReadFromTr32_fun [660718460; 972963177]
  = [128; 1; 39; 97; 195; 124; 236; 130; 58; 147; 65914].
Proof. vm_compute. reflexivity. Qed.


Example t_0995 :
  cruDataReadFromTr32_fun [3155916092; 1846344352]
  = [128; 1; 188; 27; 117; 60; 84; 139; 202; 156; 65837].
Proof. vm_compute. reflexivity. Qed.


Example t_0996 :
  cruDataReadFromTr32_fun [4210007875; 688312966]
  = [128; 1; 250; 239; 159; 67; 85; 82; 15; 189; 64129].
Proof. vm_compute. reflexivity. Qed.


Example t_0997 :
  cruDataReadFromTr32_fun [1512741946; 2437599878]
  = [128; 1; 90; 42; 156; 58; 110; 73; 12; 180; 65028].
Proof. vm_compute. reflexivity. Qed.


Example t_0998 :
  cruDataReadFromTr32_fun [2999441909; 2911943483]
  = [128; 1; 178; 199; 217; 245; 205; 148; 188; 58; 64204].
Proof. vm_compute. reflexivity. Qed.


Example t_0999 :
  cruDataReadFromTr32_fun [2677631065; 4153763754]
  = [128; 1; 159; 153; 104; 89; 114; 183; 213; 175; 65191].
Proof. vm_compute. reflexivity. Qed.


Example negative_control_wrong_expected :
  cruDataReadFromTr32_fun [0; 0]
  <> [129; 1; 0; 0; 0; 0; 0; 0; 0; 0; 0].
Proof. vm_compute. discriminate. Qed.
