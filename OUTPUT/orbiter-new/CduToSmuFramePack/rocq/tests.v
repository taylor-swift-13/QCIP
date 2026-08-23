(* 由 FloatTest/tools/emit_tests.py 自动生成，请勿手改。
 * 每条约 1000 条向量一条 vm_compute 定理；coqc 编译通过即差分测试通过。 *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.
Require Import OUTPUT.orbiter_new.CduToSmuFramePack.rocq.spec.

Import ListNotations.
Local Open Scope Z_scope.


Example t_0000 :
  cduToSmuFramePack_fun [0; 122; 103; 120; 121; 133; 110]
  = [1; 235; 149; 204; 56; 3; 249; 68; 103; 120; 0; 121; 133; 110; 227; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0001 :
  cduToSmuFramePack_fun [1; 157; 40; 172; 157; 178; 209]
  = [2; 235; 149; 204; 56; 3; 249; 68; 40; 172; 1; 157; 178; 209; 163; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0002 :
  cduToSmuFramePack_fun [254; 168; 253; 161; 141; 66; 95]
  = [255; 235; 149; 204; 56; 3; 249; 68; 253; 161; 254; 141; 66; 95; 222; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0003 :
  cduToSmuFramePack_fun [255; 61; 230; 108; 198; 57; 108]
  = [0; 235; 149; 204; 56; 3; 249; 68; 230; 108; 255; 198; 57; 108; 170; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0004 :
  cduToSmuFramePack_fun [9; 164; 217; 24; 172; 253; 219]
  = [10; 235; 149; 204; 56; 3; 249; 68; 217; 24; 9; 172; 253; 219; 202; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0005 :
  cduToSmuFramePack_fun [84; 205; 2; 207; 251; 199; 90]
  = [85; 235; 149; 204; 56; 3; 249; 68; 2; 207; 84; 251; 199; 90; 79; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0006 :
  cduToSmuFramePack_fun [197; 247; 226; 208; 104; 154; 155]
  = [198; 235; 149; 204; 56; 3; 249; 68; 226; 208; 197; 104; 154; 155; 214; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0007 :
  cduToSmuFramePack_fun [70; 243; 128; 18; 114; 119; 237]
  = [71; 235; 149; 204; 56; 3; 249; 68; 128; 18; 70; 114; 119; 237; 168; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0008 :
  cduToSmuFramePack_fun [227; 180; 2; 188; 245; 105; 30]
  = [228; 235; 149; 204; 56; 3; 249; 68; 2; 188; 227; 245; 105; 30; 137; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0009 :
  cduToSmuFramePack_fun [77; 50; 158; 124; 45; 15; 69]
  = [78; 235; 149; 204; 56; 3; 249; 68; 158; 124; 77; 45; 15; 69; 112; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0010 :
  cduToSmuFramePack_fun [88; 10; 40; 174; 4; 199; 12]
  = [89; 235; 149; 204; 56; 3; 249; 68; 40; 174; 88; 4; 199; 12; 189; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0011 :
  cduToSmuFramePack_fun [88; 213; 6; 158; 24; 70; 75]
  = [89; 235; 149; 204; 56; 3; 249; 68; 6; 158; 88; 24; 70; 75; 67; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0012 :
  cduToSmuFramePack_fun [55; 100; 32; 214; 69; 230; 162]
  = [56; 235; 149; 204; 56; 3; 249; 68; 32; 214; 55; 69; 230; 162; 198; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0013 :
  cduToSmuFramePack_fun [47; 146; 249; 252; 151; 27; 172]
  = [48; 235; 149; 204; 56; 3; 249; 68; 249; 252; 47; 151; 27; 172; 202; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0014 :
  cduToSmuFramePack_fun [81; 173; 125; 80; 175; 178; 160]
  = [82; 235; 149; 204; 56; 3; 249; 68; 125; 80; 81; 175; 178; 160; 237; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0015 :
  cduToSmuFramePack_fun [109; 239; 15; 252; 14; 94; 122]
  = [110; 235; 149; 204; 56; 3; 249; 68; 15; 252; 109; 14; 94; 122; 144; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0016 :
  cduToSmuFramePack_fun [77; 85; 94; 112; 188; 49; 91]
  = [78; 235; 149; 204; 56; 3; 249; 68; 94; 112; 77; 188; 49; 91; 1; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0017 :
  cduToSmuFramePack_fun [158; 71; 197; 205; 206; 120; 150]
  = [159; 235; 149; 204; 56; 3; 249; 68; 197; 205; 158; 206; 120; 150; 110; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0018 :
  cduToSmuFramePack_fun [239; 209; 165; 4; 27; 208; 149]
  = [240; 235; 149; 204; 56; 3; 249; 68; 165; 4; 239; 27; 208; 149; 238; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0019 :
  cduToSmuFramePack_fun [134; 50; 5; 36; 40; 162; 114]
  = [135; 235; 149; 204; 56; 3; 249; 68; 5; 36; 134; 40; 162; 114; 115; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0020 :
  cduToSmuFramePack_fun [198; 71; 171; 90; 70; 171; 251]
  = [199; 235; 149; 204; 56; 3; 249; 68; 171; 90; 198; 70; 171; 251; 25; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0021 :
  cduToSmuFramePack_fun [52; 28; 3; 154; 161; 199; 213]
  = [53; 235; 149; 204; 56; 3; 249; 68; 3; 154; 52; 161; 199; 213; 202; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0022 :
  cduToSmuFramePack_fun [252; 27; 254; 200; 217; 179; 220]
  = [253; 235; 149; 204; 56; 3; 249; 68; 254; 200; 252; 217; 179; 220; 244; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0023 :
  cduToSmuFramePack_fun [90; 220; 198; 235; 172; 19; 211]
  = [91; 235; 149; 204; 56; 3; 249; 68; 198; 235; 90; 172; 19; 211; 217; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0024 :
  cduToSmuFramePack_fun [236; 169; 115; 88; 133; 181; 208]
  = [237; 235; 149; 204; 56; 3; 249; 68; 115; 88; 236; 133; 181; 208; 199; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0025 :
  cduToSmuFramePack_fun [181; 215; 245; 16; 233; 91; 24]
  = [182; 235; 149; 204; 56; 3; 249; 68; 245; 16; 181; 233; 91; 24; 152; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0026 :
  cduToSmuFramePack_fun [115; 162; 49; 20; 158; 194; 17]
  = [116; 235; 149; 204; 56; 3; 249; 68; 49; 20; 115; 158; 194; 17; 145; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0027 :
  cduToSmuFramePack_fun [83; 10; 226; 125; 106; 45; 214]
  = [84; 235; 149; 204; 56; 3; 249; 68; 226; 125; 83; 106; 45; 214; 215; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0028 :
  cduToSmuFramePack_fun [247; 179; 246; 74; 75; 188; 227]
  = [248; 235; 149; 204; 56; 3; 249; 68; 246; 74; 247; 75; 188; 227; 155; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0029 :
  cduToSmuFramePack_fun [99; 101; 177; 171; 195; 78; 151]
  = [100; 235; 149; 204; 56; 3; 249; 68; 177; 171; 99; 195; 78; 151; 37; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0030 :
  cduToSmuFramePack_fun [213; 99; 149; 0; 229; 52; 176]
  = [214; 235; 149; 204; 56; 3; 249; 68; 149; 0; 213; 229; 52; 176; 13; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0031 :
  cduToSmuFramePack_fun [14; 39; 153; 251; 157; 160; 19]
  = [15; 235; 149; 204; 56; 3; 249; 68; 153; 251; 14; 157; 160; 19; 20; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0032 :
  cduToSmuFramePack_fun [210; 135; 134; 191; 208; 113; 133]
  = [211; 235; 149; 204; 56; 3; 249; 68; 134; 191; 210; 208; 113; 133; 191; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0033 :
  cduToSmuFramePack_fun [189; 149; 80; 91; 67; 166; 192]
  = [190; 235; 149; 204; 56; 3; 249; 68; 80; 91; 189; 67; 166; 192; 47; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0034 :
  cduToSmuFramePack_fun [21; 175; 8; 155; 242; 170; 210]
  = [22; 235; 149; 204; 56; 3; 249; 68; 8; 155; 21; 242; 170; 210; 216; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0035 :
  cduToSmuFramePack_fun [241; 178; 86; 118; 160; 214; 205]
  = [242; 235; 149; 204; 56; 3; 249; 68; 86; 118; 241; 160; 214; 205; 136; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0036 :
  cduToSmuFramePack_fun [82; 127; 164; 159; 67; 108; 223]
  = [83; 235; 149; 204; 56; 3; 249; 68; 164; 159; 82; 67; 108; 223; 117; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0037 :
  cduToSmuFramePack_fun [198; 107; 3; 22; 242; 203; 68]
  = [199; 235; 149; 204; 56; 3; 249; 68; 3; 22; 198; 242; 203; 68; 74; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0038 :
  cduToSmuFramePack_fun [139; 133; 126; 120; 246; 57; 36]
  = [140; 235; 149; 204; 56; 3; 249; 68; 126; 120; 139; 246; 57; 36; 210; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0039 :
  cduToSmuFramePack_fun [17; 146; 97; 30; 126; 17; 126]
  = [18; 235; 149; 204; 56; 3; 249; 68; 97; 30; 17; 126; 17; 126; 229; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0040 :
  cduToSmuFramePack_fun [244; 162; 39; 71; 82; 93; 138]
  = [245; 235; 149; 204; 56; 3; 249; 68; 39; 71; 244; 82; 93; 138; 3; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0041 :
  cduToSmuFramePack_fun [70; 203; 158; 234; 172; 105; 164]
  = [71; 235; 149; 204; 56; 3; 249; 68; 158; 234; 70; 172; 105; 164; 177; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0042 :
  cduToSmuFramePack_fun [76; 36; 57; 80; 209; 102; 45]
  = [77; 235; 149; 204; 56; 3; 249; 68; 57; 80; 76; 209; 102; 45; 133; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0043 :
  cduToSmuFramePack_fun [141; 254; 194; 34; 226; 67; 252]
  = [142; 235; 149; 204; 56; 3; 249; 68; 194; 34; 141; 226; 67; 252; 242; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0044 :
  cduToSmuFramePack_fun [120; 17; 181; 236; 198; 158; 190]
  = [121; 235; 149; 204; 56; 3; 249; 68; 181; 236; 120; 198; 158; 190; 145; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0045 :
  cduToSmuFramePack_fun [204; 222; 5; 77; 15; 135; 220]
  = [205; 235; 149; 204; 56; 3; 249; 68; 5; 77; 204; 15; 135; 220; 176; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0046 :
  cduToSmuFramePack_fun [149; 114; 180; 189; 193; 0; 190]
  = [150; 235; 149; 204; 56; 3; 249; 68; 180; 189; 149; 193; 0; 190; 141; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0047 :
  cduToSmuFramePack_fun [114; 40; 132; 110; 177; 208; 251]
  = [115; 235; 149; 204; 56; 3; 249; 68; 132; 110; 114; 177; 208; 251; 244; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0048 :
  cduToSmuFramePack_fun [74; 119; 228; 200; 50; 110; 104]
  = [75; 235; 149; 204; 56; 3; 249; 68; 228; 200; 74; 50; 110; 104; 192; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0049 :
  cduToSmuFramePack_fun [233; 28; 192; 25; 74; 222; 147]
  = [234; 235; 149; 204; 56; 3; 249; 68; 192; 25; 233; 74; 222; 147; 57; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0050 :
  cduToSmuFramePack_fun [11; 151; 221; 133; 221; 56; 72]
  = [12; 235; 149; 204; 56; 3; 249; 68; 221; 133; 11; 221; 56; 72; 204; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0051 :
  cduToSmuFramePack_fun [212; 255; 218; 245; 146; 242; 96]
  = [213; 235; 149; 204; 56; 3; 249; 68; 218; 245; 212; 146; 242; 96; 217; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0052 :
  cduToSmuFramePack_fun [109; 231; 80; 206; 63; 112; 249]
  = [110; 235; 149; 204; 56; 3; 249; 68; 80; 206; 109; 63; 112; 249; 213; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0053 :
  cduToSmuFramePack_fun [132; 152; 167; 97; 169; 69; 40]
  = [133; 235; 149; 204; 56; 3; 249; 68; 167; 97; 132; 169; 69; 40; 150; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0054 :
  cduToSmuFramePack_fun [199; 44; 171; 118; 34; 150; 26]
  = [200; 235; 149; 204; 56; 3; 249; 68; 171; 118; 199; 34; 150; 26; 150; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0055 :
  cduToSmuFramePack_fun [20; 9; 153; 107; 9; 79; 106]
  = [21; 235; 149; 204; 56; 3; 249; 68; 153; 107; 20; 9; 79; 106; 160; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0056 :
  cduToSmuFramePack_fun [124; 12; 59; 35; 105; 201; 16]
  = [125; 235; 149; 204; 56; 3; 249; 68; 59; 35; 124; 105; 201; 16; 184; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0057 :
  cduToSmuFramePack_fun [50; 221; 233; 160; 139; 244; 40]
  = [51; 235; 149; 204; 56; 3; 249; 68; 233; 160; 50; 139; 244; 40; 144; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0058 :
  cduToSmuFramePack_fun [104; 241; 16; 45; 48; 4; 134]
  = [105; 235; 149; 204; 56; 3; 249; 68; 16; 45; 104; 48; 4; 134; 117; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0059 :
  cduToSmuFramePack_fun [23; 88; 182; 172; 42; 63; 243]
  = [24; 235; 149; 204; 56; 3; 249; 68; 182; 172; 23; 42; 63; 243; 73; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0060 :
  cduToSmuFramePack_fun [46; 168; 241; 114; 154; 116; 66]
  = [47; 235; 149; 204; 56; 3; 249; 68; 241; 114; 46; 154; 116; 66; 245; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0061 :
  cduToSmuFramePack_fun [65; 2; 50; 228; 200; 177; 74]
  = [66; 235; 149; 204; 56; 3; 249; 68; 50; 228; 65; 200; 177; 74; 66; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0062 :
  cduToSmuFramePack_fun [226; 147; 21; 159; 205; 146; 237]
  = [227; 235; 149; 204; 56; 3; 249; 68; 21; 159; 226; 205; 146; 237; 28; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0063 :
  cduToSmuFramePack_fun [194; 186; 0; 169; 111; 96; 156]
  = [195; 235; 149; 204; 56; 3; 249; 68; 0; 169; 194; 111; 96; 156; 238; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0064 :
  cduToSmuFramePack_fun [156; 67; 42; 2; 214; 214; 102]
  = [157; 235; 149; 204; 56; 3; 249; 68; 42; 2; 156; 214; 214; 102; 116; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0065 :
  cduToSmuFramePack_fun [153; 98; 155; 176; 203; 53; 207]
  = [154; 235; 149; 204; 56; 3; 249; 68; 155; 176; 153; 203; 53; 207; 155; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0066 :
  cduToSmuFramePack_fun [35; 231; 137; 161; 52; 181; 198]
  = [36; 235; 149; 204; 56; 3; 249; 68; 137; 161; 35; 52; 181; 198; 158; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0067 :
  cduToSmuFramePack_fun [41; 9; 132; 21; 179; 233; 140]
  = [42; 235; 149; 204; 56; 3; 249; 68; 132; 21; 41; 179; 233; 140; 176; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0068 :
  cduToSmuFramePack_fun [78; 242; 242; 36; 8; 173; 208]
  = [79; 235; 149; 204; 56; 3; 249; 68; 242; 36; 78; 8; 173; 208; 241; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0069 :
  cduToSmuFramePack_fun [189; 73; 167; 232; 70; 58; 91]
  = [190; 235; 149; 204; 56; 3; 249; 68; 167; 232; 189; 70; 58; 91; 109; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0070 :
  cduToSmuFramePack_fun [34; 67; 172; 255; 27; 242; 10]
  = [35; 235; 149; 204; 56; 3; 249; 68; 172; 255; 34; 27; 242; 10; 126; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0071 :
  cduToSmuFramePack_fun [119; 57; 74; 116; 50; 200; 231]
  = [120; 235; 149; 204; 56; 3; 249; 68; 74; 116; 119; 50; 200; 231; 60; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0072 :
  cduToSmuFramePack_fun [46; 7; 254; 171; 103; 104; 132]
  = [47; 235; 149; 204; 56; 3; 249; 68; 254; 171; 46; 103; 104; 132; 12; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0073 :
  cduToSmuFramePack_fun [154; 37; 40; 191; 117; 142; 172]
  = [155; 235; 149; 204; 56; 3; 249; 68; 40; 191; 154; 117; 142; 172; 110; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0074 :
  cduToSmuFramePack_fun [185; 55; 233; 102; 145; 135; 213]
  = [186; 235; 149; 204; 56; 3; 249; 68; 233; 102; 185; 145; 135; 213; 55; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0075 :
  cduToSmuFramePack_fun [25; 159; 152; 184; 30; 109; 177]
  = [26; 235; 149; 204; 56; 3; 249; 68; 152; 184; 25; 30; 109; 177; 55; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0076 :
  cduToSmuFramePack_fun [71; 4; 200; 164; 35; 196; 160]
  = [72; 235; 149; 204; 56; 3; 249; 68; 200; 164; 71; 35; 196; 160; 70; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0077 :
  cduToSmuFramePack_fun [120; 38; 106; 44; 80; 152; 105]
  = [121; 235; 149; 204; 56; 3; 249; 68; 106; 44; 120; 80; 152; 105; 143; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0078 :
  cduToSmuFramePack_fun [80; 131; 88; 32; 88; 242; 91]
  = [81; 235; 149; 204; 56; 3; 249; 68; 88; 32; 80; 88; 242; 91; 135; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0079 :
  cduToSmuFramePack_fun [177; 164; 236; 233; 2; 106; 39]
  = [178; 235; 149; 204; 56; 3; 249; 68; 236; 233; 177; 2; 106; 39; 101; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0080 :
  cduToSmuFramePack_fun [92; 199; 51; 11; 222; 45; 236]
  = [93; 235; 149; 204; 56; 3; 249; 68; 51; 11; 92; 222; 45; 236; 243; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0081 :
  cduToSmuFramePack_fun [48; 152; 124; 203; 149; 204; 221]
  = [49; 235; 149; 204; 56; 3; 249; 68; 124; 203; 48; 149; 204; 221; 169; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0082 :
  cduToSmuFramePack_fun [77; 56; 235; 254; 22; 99; 178]
  = [78; 235; 149; 204; 56; 3; 249; 68; 235; 254; 77; 22; 99; 178; 149; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0083 :
  cduToSmuFramePack_fun [3; 110; 226; 85; 86; 66; 134]
  = [4; 235; 149; 204; 56; 3; 249; 68; 226; 85; 3; 86; 66; 134; 152; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0084 :
  cduToSmuFramePack_fun [203; 111; 39; 36; 216; 103; 88]
  = [204; 235; 149; 204; 56; 3; 249; 68; 39; 36; 203; 216; 103; 88; 223; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0085 :
  cduToSmuFramePack_fun [242; 108; 11; 91; 4; 54; 181]
  = [243; 235; 149; 204; 56; 3; 249; 68; 11; 91; 242; 4; 54; 181; 163; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0086 :
  cduToSmuFramePack_fun [44; 109; 159; 66; 104; 93; 37]
  = [45; 235; 149; 204; 56; 3; 249; 68; 159; 66; 44; 104; 93; 37; 69; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0087 :
  cduToSmuFramePack_fun [100; 218; 165; 64; 194; 101; 105]
  = [101; 235; 149; 204; 56; 3; 249; 68; 165; 64; 100; 194; 101; 105; 49; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0088 :
  cduToSmuFramePack_fun [47; 84; 155; 105; 254; 11; 187]
  = [48; 235; 149; 204; 56; 3; 249; 68; 155; 105; 47; 254; 11; 187; 163; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0089 :
  cduToSmuFramePack_fun [160; 189; 149; 87; 61; 213; 44]
  = [161; 235; 149; 204; 56; 3; 249; 68; 149; 87; 160; 61; 213; 44; 184; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0090 :
  cduToSmuFramePack_fun [159; 210; 7; 198; 10; 249; 108]
  = [160; 235; 149; 204; 56; 3; 249; 68; 7; 198; 159; 10; 249; 108; 163; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0091 :
  cduToSmuFramePack_fun [122; 133; 103; 69; 251; 245; 82]
  = [123; 235; 149; 204; 56; 3; 249; 68; 103; 69; 122; 251; 245; 82; 102; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0092 :
  cduToSmuFramePack_fun [37; 20; 12; 80; 134; 183; 58]
  = [38; 235; 149; 204; 56; 3; 249; 68; 12; 80; 37; 134; 183; 58; 36; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0093 :
  cduToSmuFramePack_fun [142; 219; 155; 101; 130; 68; 54]
  = [143; 235; 149; 204; 56; 3; 249; 68; 155; 101; 142; 130; 68; 54; 212; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0094 :
  cduToSmuFramePack_fun [212; 173; 253; 41; 115; 13; 168]
  = [213; 235; 149; 204; 56; 3; 249; 68; 253; 41; 212; 115; 13; 168; 240; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0095 :
  cduToSmuFramePack_fun [87; 168; 3; 30; 83; 99; 225]
  = [88; 235; 149; 204; 56; 3; 249; 68; 3; 30; 87; 83; 99; 225; 35; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0096 :
  cduToSmuFramePack_fun [46; 224; 35; 1; 163; 106; 149]
  = [47; 235; 149; 204; 56; 3; 249; 68; 35; 1; 46; 163; 106; 149; 248; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0097 :
  cduToSmuFramePack_fun [135; 150; 94; 88; 110; 74; 125]
  = [136; 235; 149; 204; 56; 3; 249; 68; 94; 88; 135; 110; 74; 125; 130; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0098 :
  cduToSmuFramePack_fun [151; 184; 223; 208; 123; 236; 101]
  = [152; 235; 149; 204; 56; 3; 249; 68; 223; 208; 151; 123; 236; 101; 70; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0099 :
  cduToSmuFramePack_fun [134; 29; 178; 114; 114; 164; 56]
  = [135; 235; 149; 204; 56; 3; 249; 68; 178; 114; 134; 114; 164; 56; 166; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0100 :
  cduToSmuFramePack_fun [90; 214; 82; 232; 34; 39; 37]
  = [91; 235; 149; 204; 56; 3; 249; 68; 82; 232; 90; 34; 39; 37; 146; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0101 :
  cduToSmuFramePack_fun [62; 153; 6; 106; 241; 13; 132]
  = [63; 235; 149; 204; 56; 3; 249; 68; 6; 106; 62; 241; 13; 132; 22; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0102 :
  cduToSmuFramePack_fun [225; 102; 245; 91; 193; 196; 21]
  = [226; 235; 149; 204; 56; 3; 249; 68; 245; 91; 225; 193; 196; 21; 123; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0103 :
  cduToSmuFramePack_fun [68; 198; 111; 108; 62; 84; 27]
  = [69; 235; 149; 204; 56; 3; 249; 68; 111; 108; 68; 62; 84; 27; 60; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0104 :
  cduToSmuFramePack_fun [199; 192; 246; 159; 1; 107; 192]
  = [200; 235; 149; 204; 56; 3; 249; 68; 246; 159; 199; 1; 107; 192; 76; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0105 :
  cduToSmuFramePack_fun [152; 195; 111; 67; 47; 176; 245]
  = [153; 235; 149; 204; 56; 3; 249; 68; 111; 67; 152; 47; 176; 245; 184; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0106 :
  cduToSmuFramePack_fun [164; 155; 191; 169; 65; 138; 72]
  = [165; 235; 149; 204; 56; 3; 249; 68; 191; 169; 164; 65; 138; 72; 233; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0107 :
  cduToSmuFramePack_fun [43; 108; 253; 57; 145; 149; 23]
  = [44; 235; 149; 204; 56; 3; 249; 68; 253; 57; 43; 145; 149; 23; 250; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0108 :
  cduToSmuFramePack_fun [54; 31; 139; 20; 193; 24; 87]
  = [55; 235; 149; 204; 56; 3; 249; 68; 139; 20; 54; 193; 24; 87; 151; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0109 :
  cduToSmuFramePack_fun [224; 212; 147; 13; 216; 0; 166]
  = [225; 235; 149; 204; 56; 3; 249; 68; 147; 13; 224; 216; 0; 166; 170; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0110 :
  cduToSmuFramePack_fun [58; 184; 240; 98; 246; 28; 95]
  = [59; 235; 149; 204; 56; 3; 249; 68; 240; 98; 58; 246; 28; 95; 49; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0111 :
  cduToSmuFramePack_fun [151; 223; 123; 248; 73; 102; 139]
  = [152; 235; 149; 204; 56; 3; 249; 68; 123; 248; 151; 73; 102; 139; 86; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0112 :
  cduToSmuFramePack_fun [222; 2; 28; 189; 203; 64; 38]
  = [223; 235; 149; 204; 56; 3; 249; 68; 28; 189; 222; 203; 64; 38; 16; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0113 :
  cduToSmuFramePack_fun [20; 127; 193; 204; 43; 75; 60]
  = [21; 235; 149; 204; 56; 3; 249; 68; 193; 204; 20; 43; 75; 60; 165; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0114 :
  cduToSmuFramePack_fun [166; 7; 164; 238; 230; 222; 232]
  = [167; 235; 149; 204; 56; 3; 249; 68; 164; 238; 166; 230; 222; 232; 198; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0115 :
  cduToSmuFramePack_fun [133; 228; 13; 127; 163; 195; 245]
  = [134; 235; 149; 204; 56; 3; 249; 68; 13; 127; 133; 163; 195; 245; 56; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0116 :
  cduToSmuFramePack_fun [35; 134; 110; 182; 187; 53; 46]
  = [36; 235; 149; 204; 56; 3; 249; 68; 110; 182; 35; 187; 53; 46; 85; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0117 :
  cduToSmuFramePack_fun [75; 100; 134; 118; 80; 107; 243]
  = [76; 235; 149; 204; 56; 3; 249; 68; 134; 118; 75; 80; 107; 243; 193; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0118 :
  cduToSmuFramePack_fun [109; 123; 61; 110; 213; 196; 184]
  = [110; 235; 149; 204; 56; 3; 249; 68; 61; 110; 109; 213; 196; 184; 243; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0119 :
  cduToSmuFramePack_fun [27; 156; 8; 251; 227; 176; 199]
  = [28; 235; 149; 204; 56; 3; 249; 68; 8; 251; 27; 227; 176; 199; 52; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0120 :
  cduToSmuFramePack_fun [51; 159; 29; 215; 56; 254; 49]
  = [52; 235; 149; 204; 56; 3; 249; 68; 29; 215; 51; 56; 254; 49; 32; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0121 :
  cduToSmuFramePack_fun [151; 129; 182; 204; 250; 14; 130]
  = [152; 235; 149; 204; 56; 3; 249; 68; 182; 204; 151; 250; 14; 130; 217; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0122 :
  cduToSmuFramePack_fun [112; 75; 91; 242; 102; 205; 72]
  = [113; 235; 149; 204; 56; 3; 249; 68; 91; 242; 112; 102; 205; 72; 98; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0123 :
  cduToSmuFramePack_fun [253; 84; 153; 106; 43; 121; 50]
  = [254; 235; 149; 204; 56; 3; 249; 68; 153; 106; 253; 43; 121; 50; 130; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0124 :
  cduToSmuFramePack_fun [19; 3; 208; 4; 62; 39; 198]
  = [20; 235; 149; 204; 56; 3; 249; 68; 208; 4; 19; 62; 39; 198; 44; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0125 :
  cduToSmuFramePack_fun [25; 161; 179; 108; 56; 28; 48]
  = [26; 235; 149; 204; 56; 3; 249; 68; 179; 108; 25; 56; 28; 48; 50; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0126 :
  cduToSmuFramePack_fun [231; 125; 104; 158; 169; 173; 170]
  = [232; 235; 149; 204; 56; 3; 249; 68; 104; 158; 231; 169; 173; 170; 91; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0127 :
  cduToSmuFramePack_fun [122; 77; 254; 3; 44; 90; 188]
  = [123; 235; 149; 204; 56; 3; 249; 68; 254; 3; 122; 44; 90; 188; 203; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0128 :
  cduToSmuFramePack_fun [219; 125; 159; 238; 254; 224; 241]
  = [220; 235; 149; 204; 56; 3; 249; 68; 159; 238; 219; 254; 224; 241; 165; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0129 :
  cduToSmuFramePack_fun [139; 244; 218; 215; 113; 171; 80]
  = [140; 235; 149; 204; 56; 3; 249; 68; 218; 215; 139; 113; 171; 80; 148; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0130 :
  cduToSmuFramePack_fun [51; 210; 166; 93; 247; 54; 204]
  = [52; 235; 149; 204; 56; 3; 249; 68; 166; 93; 51; 247; 54; 204; 247; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0131 :
  cduToSmuFramePack_fun [230; 98; 127; 72; 129; 93; 165]
  = [231; 235; 149; 204; 56; 3; 249; 68; 127; 72; 230; 129; 93; 165; 24; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0132 :
  cduToSmuFramePack_fun [140; 55; 70; 7; 199; 122; 141]
  = [141; 235; 149; 204; 56; 3; 249; 68; 70; 7; 140; 199; 122; 141; 233; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0133 :
  cduToSmuFramePack_fun [173; 73; 207; 52; 156; 59; 12]
  = [174; 235; 149; 204; 56; 3; 249; 68; 207; 52; 173; 156; 59; 12; 217; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0134 :
  cduToSmuFramePack_fun [134; 109; 147; 77; 173; 161; 223]
  = [135; 235; 149; 204; 56; 3; 249; 68; 147; 77; 134; 173; 161; 223; 225; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0135 :
  cduToSmuFramePack_fun [65; 2; 105; 126; 223; 146; 23]
  = [66; 235; 149; 204; 56; 3; 249; 68; 105; 126; 65; 223; 146; 23; 216; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0136 :
  cduToSmuFramePack_fun [99; 68; 95; 205; 21; 230; 175]
  = [100; 235; 149; 204; 56; 3; 249; 68; 95; 205; 99; 21; 230; 175; 197; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0137 :
  cduToSmuFramePack_fun [113; 50; 236; 249; 107; 85; 162]
  = [114; 235; 149; 204; 56; 3; 249; 68; 236; 249; 113; 107; 85; 162; 64; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0138 :
  cduToSmuFramePack_fun [200; 199; 85; 45; 34; 95; 37]
  = [201; 235; 149; 204; 56; 3; 249; 68; 85; 45; 200; 34; 95; 37; 82; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0139 :
  cduToSmuFramePack_fun [48; 20; 89; 137; 91; 172; 249]
  = [49; 235; 149; 204; 56; 3; 249; 68; 89; 137; 48; 91; 172; 249; 62; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0140 :
  cduToSmuFramePack_fun [210; 244; 241; 228; 116; 233; 94]
  = [211; 235; 149; 204; 56; 3; 249; 68; 241; 228; 210; 116; 233; 94; 78; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0141 :
  cduToSmuFramePack_fun [146; 164; 254; 53; 128; 25; 211]
  = [147; 235; 149; 204; 56; 3; 249; 68; 254; 53; 146; 128; 25; 211; 125; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0142 :
  cduToSmuFramePack_fun [85; 9; 66; 47; 88; 48; 197]
  = [86; 235; 149; 204; 56; 3; 249; 68; 66; 47; 85; 88; 48; 197; 217; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0143 :
  cduToSmuFramePack_fun [234; 165; 221; 12; 149; 190; 145]
  = [235; 235; 149; 204; 56; 3; 249; 68; 221; 12; 234; 149; 190; 145; 245; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0144 :
  cduToSmuFramePack_fun [178; 105; 39; 147; 32; 226; 145]
  = [179; 235; 149; 204; 56; 3; 249; 68; 39; 147; 178; 32; 226; 145; 133; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0145 :
  cduToSmuFramePack_fun [142; 212; 135; 5; 28; 44; 66]
  = [143; 235; 149; 204; 56; 3; 249; 68; 135; 5; 142; 28; 44; 66; 80; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0146 :
  cduToSmuFramePack_fun [0; 127; 157; 49; 206; 153; 122]
  = [1; 235; 149; 204; 56; 3; 249; 68; 157; 49; 0; 206; 153; 122; 1; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0147 :
  cduToSmuFramePack_fun [209; 160; 157; 94; 206; 234; 21]
  = [210; 235; 149; 204; 56; 3; 249; 68; 157; 94; 209; 206; 234; 21; 29; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0148 :
  cduToSmuFramePack_fun [165; 211; 142; 183; 11; 216; 219]
  = [166; 235; 149; 204; 56; 3; 249; 68; 142; 183; 165; 11; 216; 219; 98; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0149 :
  cduToSmuFramePack_fun [127; 33; 212; 143; 56; 244; 210]
  = [128; 235; 149; 204; 56; 3; 249; 68; 212; 143; 127; 56; 244; 210; 86; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0150 :
  cduToSmuFramePack_fun [158; 15; 30; 205; 200; 132; 141]
  = [159; 235; 149; 204; 56; 3; 249; 68; 30; 205; 158; 200; 132; 141; 212; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0151 :
  cduToSmuFramePack_fun [13; 157; 245; 101; 74; 154; 83]
  = [14; 235; 149; 204; 56; 3; 249; 68; 245; 101; 13; 74; 154; 83; 76; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0152 :
  cduToSmuFramePack_fun [101; 112; 238; 46; 25; 97; 155]
  = [102; 235; 149; 204; 56; 3; 249; 68; 238; 46; 101; 25; 97; 155; 186; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0153 :
  cduToSmuFramePack_fun [194; 100; 4; 50; 210; 148; 29]
  = [195; 235; 149; 204; 56; 3; 249; 68; 4; 50; 194; 210; 148; 29; 71; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0154 :
  cduToSmuFramePack_fun [228; 63; 82; 198; 189; 193; 120]
  = [229; 235; 149; 204; 56; 3; 249; 68; 82; 198; 228; 189; 193; 120; 196; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0155 :
  cduToSmuFramePack_fun [104; 10; 181; 123; 183; 249; 133]
  = [105; 235; 149; 204; 56; 3; 249; 68; 181; 123; 104; 183; 249; 133; 133; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0156 :
  cduToSmuFramePack_fun [224; 180; 79; 203; 129; 102; 173]
  = [225; 235; 149; 204; 56; 3; 249; 68; 79; 203; 224; 129; 102; 173; 250; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0157 :
  cduToSmuFramePack_fun [194; 89; 169; 100; 232; 173; 232]
  = [195; 235; 149; 204; 56; 3; 249; 68; 169; 100; 194; 232; 173; 232; 178; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0158 :
  cduToSmuFramePack_fun [239; 112; 229; 211; 227; 75; 163]
  = [240; 235; 149; 204; 56; 3; 249; 68; 229; 211; 239; 227; 75; 163; 156; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0159 :
  cduToSmuFramePack_fun [212; 103; 194; 5; 103; 200; 6]
  = [213; 235; 149; 204; 56; 3; 249; 68; 194; 5; 212; 103; 200; 6; 114; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0160 :
  cduToSmuFramePack_fun [150; 169; 171; 67; 36; 27; 212]
  = [151; 235; 149; 204; 56; 3; 249; 68; 171; 67; 150; 36; 27; 212; 157; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0161 :
  cduToSmuFramePack_fun [177; 106; 96; 7; 82; 110; 139]
  = [178; 235; 149; 204; 56; 3; 249; 68; 96; 7; 177; 82; 110; 139; 219; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0162 :
  cduToSmuFramePack_fun [69; 242; 143; 192; 84; 158; 91]
  = [70; 235; 149; 204; 56; 3; 249; 68; 143; 192; 69; 84; 158; 91; 233; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0163 :
  cduToSmuFramePack_fun [217; 214; 82; 65; 207; 140; 238]
  = [218; 235; 149; 204; 56; 3; 249; 68; 82; 65; 217; 207; 140; 238; 69; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0164 :
  cduToSmuFramePack_fun [249; 3; 143; 113; 224; 197; 46]
  = [250; 235; 149; 204; 56; 3; 249; 68; 143; 113; 249; 224; 197; 46; 230; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0165 :
  cduToSmuFramePack_fun [30; 152; 85; 32; 200; 112; 24]
  = [31; 235; 149; 204; 56; 3; 249; 68; 85; 32; 30; 200; 112; 24; 215; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0166 :
  cduToSmuFramePack_fun [55; 114; 251; 200; 59; 252; 28]
  = [56; 235; 149; 204; 56; 3; 249; 68; 251; 200; 55; 59; 252; 28; 85; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0167 :
  cduToSmuFramePack_fun [51; 13; 39; 33; 64; 183; 139]
  = [52; 235; 149; 204; 56; 3; 249; 68; 39; 33; 51; 64; 183; 139; 139; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0168 :
  cduToSmuFramePack_fun [110; 84; 38; 129; 15; 71; 215]
  = [111; 235; 149; 204; 56; 3; 249; 68; 38; 129; 110; 15; 71; 215; 238; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0169 :
  cduToSmuFramePack_fun [160; 199; 254; 122; 177; 143; 126]
  = [161; 235; 149; 204; 56; 3; 249; 68; 254; 122; 160; 177; 143; 126; 56; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0170 :
  cduToSmuFramePack_fun [178; 31; 39; 167; 44; 75; 10]
  = [179; 235; 149; 204; 56; 3; 249; 68; 39; 167; 178; 44; 75; 10; 147; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0171 :
  cduToSmuFramePack_fun [70; 217; 146; 47; 142; 8; 93]
  = [71; 235; 149; 204; 56; 3; 249; 68; 146; 47; 70; 142; 8; 93; 96; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0172 :
  cduToSmuFramePack_fun [91; 175; 148; 2; 5; 254; 7]
  = [92; 235; 149; 204; 56; 3; 249; 68; 148; 2; 91; 5; 254; 7; 173; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0173 :
  cduToSmuFramePack_fun [128; 152; 212; 186; 205; 247; 77]
  = [129; 235; 149; 204; 56; 3; 249; 68; 212; 186; 128; 205; 247; 77; 19; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0174 :
  cduToSmuFramePack_fun [87; 237; 31; 166; 178; 6; 111]
  = [88; 235; 149; 204; 56; 3; 249; 68; 31; 166; 87; 178; 6; 111; 145; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0175 :
  cduToSmuFramePack_fun [111; 94; 146; 163; 53; 133; 219]
  = [112; 235; 149; 204; 56; 3; 249; 68; 146; 163; 111; 53; 133; 219; 89; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0176 :
  cduToSmuFramePack_fun [8; 107; 227; 175; 217; 76; 126]
  = [9; 235; 149; 204; 56; 3; 249; 68; 227; 175; 8; 217; 76; 126; 167; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0177 :
  cduToSmuFramePack_fun [13; 32; 163; 116; 168; 215; 189]
  = [14; 235; 149; 204; 56; 3; 249; 68; 163; 116; 13; 168; 215; 189; 228; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0178 :
  cduToSmuFramePack_fun [57; 164; 205; 162; 169; 185; 26]
  = [58; 235; 149; 204; 56; 3; 249; 68; 205; 162; 57; 169; 185; 26; 112; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0179 :
  cduToSmuFramePack_fun [250; 173; 29; 166; 191; 90; 53]
  = [251; 235; 149; 204; 56; 3; 249; 68; 29; 166; 250; 191; 90; 53; 217; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0180 :
  cduToSmuFramePack_fun [167; 135; 150; 154; 212; 126; 234]
  = [168; 235; 149; 204; 56; 3; 249; 68; 150; 154; 167; 212; 126; 234; 245; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0181 :
  cduToSmuFramePack_fun [158; 63; 189; 126; 123; 94; 246]
  = [159; 235; 149; 204; 56; 3; 249; 68; 189; 126; 158; 123; 94; 246; 122; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0182 :
  cduToSmuFramePack_fun [244; 114; 204; 184; 91; 208; 172]
  = [245; 235; 149; 204; 56; 3; 249; 68; 204; 184; 244; 91; 208; 172; 87; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0183 :
  cduToSmuFramePack_fun [243; 218; 44; 253; 200; 163; 187]
  = [244; 235; 149; 204; 56; 3; 249; 68; 44; 253; 243; 200; 163; 187; 154; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0184 :
  cduToSmuFramePack_fun [17; 193; 245; 248; 172; 246; 150]
  = [18; 235; 149; 204; 56; 3; 249; 68; 245; 248; 17; 172; 246; 150; 236; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0185 :
  cduToSmuFramePack_fun [191; 254; 82; 80; 223; 213; 64]
  = [192; 235; 149; 204; 56; 3; 249; 68; 82; 80; 191; 223; 213; 64; 181; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0186 :
  cduToSmuFramePack_fun [117; 74; 32; 62; 235; 237; 47]
  = [118; 235; 149; 204; 56; 3; 249; 68; 32; 62; 117; 235; 237; 47; 18; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0187 :
  cduToSmuFramePack_fun [251; 173; 141; 100; 201; 63; 208]
  = [252; 235; 149; 204; 56; 3; 249; 68; 141; 100; 251; 201; 63; 208; 146; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0188 :
  cduToSmuFramePack_fun [12; 1; 213; 190; 41; 236; 219]
  = [13; 235; 149; 204; 56; 3; 249; 68; 213; 190; 12; 41; 236; 219; 197; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0189 :
  cduToSmuFramePack_fun [234; 255; 204; 241; 165; 20; 92]
  = [235; 235; 149; 204; 56; 3; 249; 68; 204; 241; 234; 165; 20; 92; 14; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0190 :
  cduToSmuFramePack_fun [202; 183; 92; 92; 243; 98; 213]
  = [203; 235; 149; 204; 56; 3; 249; 68; 92; 92; 202; 243; 98; 213; 238; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0191 :
  cduToSmuFramePack_fun [255; 144; 60; 190; 95; 152; 28]
  = [0; 235; 149; 204; 56; 3; 249; 68; 60; 190; 255; 95; 152; 28; 112; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0192 :
  cduToSmuFramePack_fun [173; 73; 9; 77; 229; 86; 11]
  = [174; 235; 149; 204; 56; 3; 249; 68; 9; 77; 173; 229; 86; 11; 143; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0193 :
  cduToSmuFramePack_fun [206; 141; 131; 196; 65; 150; 215]
  = [207; 235; 149; 204; 56; 3; 249; 68; 131; 196; 206; 65; 150; 215; 81; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0194 :
  cduToSmuFramePack_fun [186; 96; 72; 200; 161; 146; 233]
  = [187; 235; 149; 204; 56; 3; 249; 68; 72; 200; 186; 161; 146; 233; 234; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0195 :
  cduToSmuFramePack_fun [146; 155; 161; 98; 217; 42; 132]
  = [147; 235; 149; 204; 56; 3; 249; 68; 161; 98; 146; 217; 42; 132; 230; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0196 :
  cduToSmuFramePack_fun [244; 213; 115; 218; 131; 48; 30]
  = [245; 235; 149; 204; 56; 3; 249; 68; 115; 218; 244; 131; 48; 30; 176; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0197 :
  cduToSmuFramePack_fun [207; 211; 40; 180; 150; 247; 217]
  = [208; 235; 149; 204; 56; 3; 249; 68; 40; 180; 207; 150; 247; 217; 203; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0198 :
  cduToSmuFramePack_fun [36; 16; 189; 217; 222; 66; 144]
  = [37; 235; 149; 204; 56; 3; 249; 68; 189; 217; 36; 222; 66; 144; 206; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0199 :
  cduToSmuFramePack_fun [197; 55; 202; 221; 117; 206; 172]
  = [198; 235; 149; 204; 56; 3; 249; 68; 202; 221; 197; 117; 206; 172; 157; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0200 :
  cduToSmuFramePack_fun [170; 129; 158; 59; 1; 139; 247]
  = [171; 235; 149; 204; 56; 3; 249; 68; 158; 59; 170; 1; 139; 247; 60; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0201 :
  cduToSmuFramePack_fun [60; 244; 176; 151; 38; 142; 249]
  = [61; 235; 149; 204; 56; 3; 249; 68; 176; 151; 60; 38; 142; 249; 28; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0202 :
  cduToSmuFramePack_fun [190; 160; 97; 176; 56; 69; 173]
  = [191; 235; 149; 204; 56; 3; 249; 68; 97; 176; 190; 56; 69; 173; 125; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0203 :
  cduToSmuFramePack_fun [149; 235; 141; 87; 53; 103; 8]
  = [150; 235; 149; 204; 56; 3; 249; 68; 141; 87; 149; 53; 103; 8; 135; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0204 :
  cduToSmuFramePack_fun [48; 139; 72; 99; 134; 240; 140]
  = [49; 235; 149; 204; 56; 3; 249; 68; 72; 99; 48; 134; 240; 140; 135; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0205 :
  cduToSmuFramePack_fun [204; 34; 90; 130; 107; 253; 156]
  = [205; 235; 149; 204; 56; 3; 249; 68; 90; 130; 204; 107; 253; 156; 20; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0206 :
  cduToSmuFramePack_fun [15; 181; 93; 135; 203; 102; 105]
  = [16; 235; 149; 204; 56; 3; 249; 68; 93; 135; 15; 203; 102; 105; 235; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0207 :
  cduToSmuFramePack_fun [36; 124; 88; 33; 147; 47; 80]
  = [37; 235; 149; 204; 56; 3; 249; 68; 88; 33; 36; 147; 47; 80; 43; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0208 :
  cduToSmuFramePack_fun [18; 16; 99; 188; 118; 80; 230]
  = [19; 235; 149; 204; 56; 3; 249; 68; 99; 188; 18; 118; 80; 230; 65; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0209 :
  cduToSmuFramePack_fun [130; 162; 89; 100; 245; 217; 248]
  = [131; 235; 149; 204; 56; 3; 249; 68; 89; 100; 130; 245; 217; 248; 109; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0210 :
  cduToSmuFramePack_fun [172; 166; 148; 4; 69; 121; 2]
  = [173; 235; 149; 204; 56; 3; 249; 68; 148; 4; 172; 69; 121; 2; 52; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0211 :
  cduToSmuFramePack_fun [242; 56; 3; 138; 235; 53; 228]
  = [243; 235; 149; 204; 56; 3; 249; 68; 3; 138; 242; 235; 53; 228; 183; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0212 :
  cduToSmuFramePack_fun [1; 167; 236; 85; 163; 117; 88]
  = [2; 235; 149; 204; 56; 3; 249; 68; 236; 85; 1; 163; 117; 88; 212; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0213 :
  cduToSmuFramePack_fun [210; 253; 73; 117; 88; 237; 252]
  = [211; 235; 149; 204; 56; 3; 249; 68; 73; 117; 210; 88; 237; 252; 63; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0214 :
  cduToSmuFramePack_fun [210; 223; 32; 20; 200; 186; 167]
  = [211; 235; 149; 204; 56; 3; 249; 68; 32; 20; 210; 200; 186; 167; 65; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0215 :
  cduToSmuFramePack_fun [215; 60; 103; 86; 237; 251; 12]
  = [216; 235; 149; 204; 56; 3; 249; 68; 103; 86; 215; 237; 251; 12; 132; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0216 :
  cduToSmuFramePack_fun [5; 126; 134; 35; 132; 12; 101]
  = [6; 235; 149; 204; 56; 3; 249; 68; 134; 35; 5; 132; 12; 101; 3; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0217 :
  cduToSmuFramePack_fun [2; 45; 131; 85; 67; 214; 247]
  = [3; 235; 149; 204; 56; 3; 249; 68; 131; 85; 2; 67; 214; 247; 184; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0218 :
  cduToSmuFramePack_fun [51; 179; 179; 237; 216; 112; 137]
  = [52; 235; 149; 204; 56; 3; 249; 68; 179; 237; 51; 216; 112; 137; 30; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0219 :
  cduToSmuFramePack_fun [249; 50; 10; 6; 64; 82; 128]
  = [250; 235; 149; 204; 56; 3; 249; 68; 10; 6; 249; 64; 82; 128; 163; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0220 :
  cduToSmuFramePack_fun [10; 229; 214; 51; 6; 80; 168]
  = [11; 235; 149; 204; 56; 3; 249; 68; 214; 51; 10; 6; 80; 168; 207; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0221 :
  cduToSmuFramePack_fun [155; 85; 18; 157; 137; 254; 231]
  = [156; 235; 149; 204; 56; 3; 249; 68; 18; 157; 155; 137; 254; 231; 86; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0222 :
  cduToSmuFramePack_fun [16; 33; 44; 54; 118; 247; 82]
  = [17; 235; 149; 204; 56; 3; 249; 68; 44; 54; 16; 118; 247; 82; 167; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0223 :
  cduToSmuFramePack_fun [224; 127; 234; 101; 223; 14; 202]
  = [225; 235; 149; 204; 56; 3; 249; 68; 234; 101; 224; 223; 14; 202; 56; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0224 :
  cduToSmuFramePack_fun [112; 47; 112; 147; 122; 184; 195]
  = [113; 235; 149; 204; 56; 3; 249; 68; 112; 147; 112; 122; 184; 195; 26; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0225 :
  cduToSmuFramePack_fun [165; 157; 122; 238; 64; 66; 199]
  = [166; 235; 149; 204; 56; 3; 249; 68; 122; 238; 165; 64; 66; 199; 4; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0226 :
  cduToSmuFramePack_fun [59; 146; 112; 234; 18; 247; 173]
  = [60; 235; 149; 204; 56; 3; 249; 68; 112; 234; 59; 18; 247; 173; 147; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0227 :
  cduToSmuFramePack_fun [134; 192; 53; 179; 152; 227; 10]
  = [135; 235; 149; 204; 56; 3; 249; 68; 53; 179; 134; 152; 227; 10; 183; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0228 :
  cduToSmuFramePack_fun [217; 47; 100; 48; 28; 240; 51]
  = [218; 235; 149; 204; 56; 3; 249; 68; 100; 48; 217; 28; 240; 51; 94; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0229 :
  cduToSmuFramePack_fun [201; 174; 125; 90; 71; 134; 178]
  = [202; 235; 149; 204; 56; 3; 249; 68; 125; 90; 201; 71; 134; 178; 223; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0230 :
  cduToSmuFramePack_fun [224; 154; 52; 28; 22; 8; 59]
  = [225; 235; 149; 204; 56; 3; 249; 68; 52; 28; 224; 22; 8; 59; 97; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0231 :
  cduToSmuFramePack_fun [63; 110; 154; 199; 22; 214; 160]
  = [64; 235; 149; 204; 56; 3; 249; 68; 154; 199; 63; 22; 214; 160; 108; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0232 :
  cduToSmuFramePack_fun [248; 61; 123; 10; 178; 181; 94]
  = [249; 235; 149; 204; 56; 3; 249; 68; 123; 10; 248; 178; 181; 94; 48; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0233 :
  cduToSmuFramePack_fun [172; 82; 255; 165; 74; 210; 227]
  = [173; 235; 149; 204; 56; 3; 249; 68; 255; 165; 172; 74; 210; 227; 23; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0234 :
  cduToSmuFramePack_fun [207; 225; 77; 79; 60; 251; 4]
  = [208; 235; 149; 204; 56; 3; 249; 68; 77; 79; 207; 60; 251; 4; 156; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0235 :
  cduToSmuFramePack_fun [142; 83; 116; 69; 102; 0; 86]
  = [143; 235; 149; 204; 56; 3; 249; 68; 116; 69; 142; 102; 0; 86; 189; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0236 :
  cduToSmuFramePack_fun [91; 63; 92; 58; 234; 68; 186]
  = [92; 235; 149; 204; 56; 3; 249; 68; 92; 58; 91; 234; 68; 186; 171; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0237 :
  cduToSmuFramePack_fun [129; 86; 138; 31; 193; 59; 243]
  = [130; 235; 149; 204; 56; 3; 249; 68; 138; 31; 129; 193; 59; 243; 169; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0238 :
  cduToSmuFramePack_fun [149; 175; 244; 239; 58; 158; 212]
  = [150; 235; 149; 204; 56; 3; 249; 68; 244; 239; 149; 58; 158; 212; 214; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0239 :
  cduToSmuFramePack_fun [20; 165; 173; 70; 242; 21; 248]
  = [21; 235; 149; 204; 56; 3; 249; 68; 173; 70; 20; 242; 21; 248; 68; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0240 :
  cduToSmuFramePack_fun [174; 156; 13; 250; 111; 241; 177]
  = [175; 235; 149; 204; 56; 3; 249; 68; 13; 250; 174; 111; 241; 177; 130; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0241 :
  cduToSmuFramePack_fun [154; 161; 17; 17; 149; 217; 42]
  = [155; 235; 149; 204; 56; 3; 249; 68; 17; 17; 154; 149; 217; 42; 202; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0242 :
  cduToSmuFramePack_fun [211; 125; 121; 87; 236; 146; 24]
  = [212; 235; 149; 204; 56; 3; 249; 68; 121; 87; 211; 236; 146; 24; 167; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0243 :
  cduToSmuFramePack_fun [162; 186; 191; 11; 1; 230; 22]
  = [163; 235; 149; 204; 56; 3; 249; 68; 191; 11; 162; 1; 230; 22; 129; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0244 :
  cduToSmuFramePack_fun [216; 131; 84; 209; 1; 117; 52]
  = [217; 235; 149; 204; 56; 3; 249; 68; 84; 209; 216; 1; 117; 52; 193; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0245 :
  cduToSmuFramePack_fun [158; 158; 120; 105; 80; 83; 231]
  = [159; 235; 149; 204; 56; 3; 249; 68; 120; 105; 158; 80; 83; 231; 169; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0246 :
  cduToSmuFramePack_fun [165; 233; 235; 100; 175; 81; 162]
  = [166; 235; 149; 204; 56; 3; 249; 68; 235; 100; 165; 175; 81; 162; 28; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0247 :
  cduToSmuFramePack_fun [199; 51; 151; 106; 101; 63; 92]
  = [200; 235; 149; 204; 56; 3; 249; 68; 151; 106; 199; 101; 63; 92; 66; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0248 :
  cduToSmuFramePack_fun [117; 6; 60; 123; 73; 118; 27]
  = [118; 235; 149; 204; 56; 3; 249; 68; 60; 123; 117; 73; 118; 27; 246; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0249 :
  cduToSmuFramePack_fun [250; 42; 232; 130; 176; 189; 34]
  = [251; 235; 149; 204; 56; 3; 249; 68; 232; 130; 250; 176; 189; 34; 235; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0250 :
  cduToSmuFramePack_fun [164; 35; 241; 50; 216; 76; 245]
  = [165; 235; 149; 204; 56; 3; 249; 68; 241; 50; 164; 216; 76; 245; 58; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0251 :
  cduToSmuFramePack_fun [104; 94; 61; 43; 66; 131; 233]
  = [105; 235; 149; 204; 56; 3; 249; 68; 61; 43; 104; 66; 131; 233; 158; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0252 :
  cduToSmuFramePack_fun [58; 79; 119; 63; 50; 3; 176]
  = [59; 235; 149; 204; 56; 3; 249; 68; 119; 63; 58; 50; 3; 176; 199; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0253 :
  cduToSmuFramePack_fun [101; 239; 15; 29; 34; 42; 0]
  = [102; 235; 149; 204; 56; 3; 249; 68; 15; 29; 101; 34; 42; 0; 15; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0254 :
  cduToSmuFramePack_fun [59; 182; 208; 66; 191; 157; 89]
  = [60; 235; 149; 204; 56; 3; 249; 68; 208; 66; 59; 191; 157; 89; 82; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0255 :
  cduToSmuFramePack_fun [223; 100; 93; 228; 119; 207; 36]
  = [224; 235; 149; 204; 56; 3; 249; 68; 93; 228; 223; 119; 207; 36; 86; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0256 :
  cduToSmuFramePack_fun [241; 111; 99; 232; 77; 132; 176]
  = [242; 235; 149; 204; 56; 3; 249; 68; 99; 232; 241; 77; 132; 176; 239; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0257 :
  cduToSmuFramePack_fun [75; 145; 40; 132; 5; 41; 68]
  = [76; 235; 149; 204; 56; 3; 249; 68; 40; 132; 75; 5; 41; 68; 191; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0258 :
  cduToSmuFramePack_fun [163; 217; 148; 110; 195; 230; 107]
  = [164; 235; 149; 204; 56; 3; 249; 68; 148; 110; 163; 195; 230; 107; 31; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0259 :
  cduToSmuFramePack_fun [108; 122; 13; 25; 178; 183; 0]
  = [109; 235; 149; 204; 56; 3; 249; 68; 13; 25; 108; 178; 183; 0; 147; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0260 :
  cduToSmuFramePack_fun [202; 210; 137; 109; 244; 73; 9]
  = [203; 235; 149; 204; 56; 3; 249; 68; 137; 109; 202; 244; 73; 9; 206; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0261 :
  cduToSmuFramePack_fun [165; 37; 56; 144; 254; 103; 60]
  = [166; 235; 149; 204; 56; 3; 249; 68; 56; 144; 165; 254; 103; 60; 76; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0262 :
  cduToSmuFramePack_fun [233; 220; 241; 60; 75; 63; 194]
  = [234; 235; 149; 204; 56; 3; 249; 68; 241; 60; 233; 75; 63; 194; 158; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0263 :
  cduToSmuFramePack_fun [193; 108; 240; 74; 201; 120; 229]
  = [194; 235; 149; 204; 56; 3; 249; 68; 240; 74; 193; 201; 120; 229; 125; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0264 :
  cduToSmuFramePack_fun [142; 175; 69; 230; 34; 53; 174]
  = [143; 235; 149; 204; 56; 3; 249; 68; 69; 230; 142; 34; 53; 174; 112; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0265 :
  cduToSmuFramePack_fun [17; 214; 119; 39; 184; 120; 187]
  = [18; 235; 149; 204; 56; 3; 249; 68; 119; 39; 17; 184; 120; 187; 42; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0266 :
  cduToSmuFramePack_fun [51; 12; 116; 254; 254; 11; 117]
  = [52; 235; 149; 204; 56; 3; 249; 68; 116; 254; 51; 254; 11; 117; 191; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0267 :
  cduToSmuFramePack_fun [174; 19; 16; 62; 112; 177; 42]
  = [175; 235; 149; 204; 56; 3; 249; 68; 16; 62; 174; 112; 177; 42; 129; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0268 :
  cduToSmuFramePack_fun [226; 12; 54; 157; 120; 30; 210]
  = [227; 235; 149; 204; 56; 3; 249; 68; 54; 157; 226; 120; 30; 210; 185; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0269 :
  cduToSmuFramePack_fun [0; 102; 86; 151; 79; 226; 209]
  = [1; 235; 149; 204; 56; 3; 249; 68; 86; 151; 0; 79; 226; 209; 159; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0270 :
  cduToSmuFramePack_fun [171; 241; 131; 162; 17; 122; 188]
  = [172; 235; 149; 204; 56; 3; 249; 68; 131; 162; 171; 17; 122; 188; 45; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0271 :
  cduToSmuFramePack_fun [255; 213; 75; 62; 49; 61; 61]
  = [0; 235; 149; 204; 56; 3; 249; 68; 75; 62; 255; 49; 61; 61; 209; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0272 :
  cduToSmuFramePack_fun [34; 7; 218; 19; 74; 73; 214]
  = [35; 235; 149; 204; 56; 3; 249; 68; 218; 19; 34; 74; 73; 214; 90; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0273 :
  cduToSmuFramePack_fun [181; 114; 249; 45; 186; 119; 208]
  = [182; 235; 149; 204; 56; 3; 249; 68; 249; 45; 181; 186; 119; 208; 228; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0274 :
  cduToSmuFramePack_fun [196; 214; 243; 5; 150; 179; 53]
  = [197; 235; 149; 204; 56; 3; 249; 68; 243; 5; 196; 150; 179; 53; 202; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0275 :
  cduToSmuFramePack_fun [190; 119; 200; 210; 210; 52; 26]
  = [191; 235; 149; 204; 56; 3; 249; 68; 200; 210; 190; 210; 52; 26; 58; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0276 :
  cduToSmuFramePack_fun [175; 215; 82; 180; 244; 174; 207]
  = [176; 235; 149; 204; 56; 3; 249; 68; 82; 180; 175; 244; 174; 207; 168; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0277 :
  cduToSmuFramePack_fun [59; 26; 47; 249; 180; 187; 26]
  = [60; 235; 149; 204; 56; 3; 249; 68; 47; 249; 59; 180; 187; 26; 196; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0278 :
  cduToSmuFramePack_fun [123; 240; 35; 99; 72; 205; 223]
  = [124; 235; 149; 204; 56; 3; 249; 68; 35; 99; 123; 72; 205; 223; 25; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0279 :
  cduToSmuFramePack_fun [58; 255; 156; 229; 163; 49; 194]
  = [59; 235; 149; 204; 56; 3; 249; 68; 156; 229; 58; 163; 49; 194; 163; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0280 :
  cduToSmuFramePack_fun [27; 30; 106; 159; 122; 175; 9]
  = [28; 235; 149; 204; 56; 3; 249; 68; 106; 159; 27; 122; 175; 9; 246; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0281 :
  cduToSmuFramePack_fun [17; 212; 99; 73; 168; 217; 99]
  = [18; 235; 149; 204; 56; 3; 249; 68; 99; 73; 17; 168; 217; 99; 77; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0282 :
  cduToSmuFramePack_fun [68; 63; 198; 106; 163; 53; 131]
  = [69; 235; 149; 204; 56; 3; 249; 68; 198; 106; 68; 163; 53; 131; 161; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0283 :
  cduToSmuFramePack_fun [38; 108; 154; 81; 45; 34; 200]
  = [39; 235; 149; 204; 56; 3; 249; 68; 154; 81; 38; 45; 34; 200; 132; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0284 :
  cduToSmuFramePack_fun [124; 105; 60; 160; 67; 134; 58]
  = [125; 235; 149; 204; 56; 3; 249; 68; 60; 160; 124; 67; 134; 58; 225; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0285 :
  cduToSmuFramePack_fun [134; 245; 59; 89; 170; 19; 169]
  = [135; 235; 149; 204; 56; 3; 249; 68; 59; 89; 134; 170; 19; 169; 94; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0286 :
  cduToSmuFramePack_fun [246; 15; 65; 131; 246; 156; 72]
  = [247; 235; 149; 204; 56; 3; 249; 68; 65; 131; 246; 246; 156; 72; 6; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0287 :
  cduToSmuFramePack_fun [97; 170; 208; 162; 247; 183; 34]
  = [98; 235; 149; 204; 56; 3; 249; 68; 208; 162; 97; 247; 183; 34; 155; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0288 :
  cduToSmuFramePack_fun [133; 76; 200; 84; 177; 165; 203]
  = [134; 235; 149; 204; 56; 3; 249; 68; 200; 84; 133; 177; 165; 203; 222; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0289 :
  cduToSmuFramePack_fun [117; 71; 151; 78; 34; 174; 164]
  = [118; 235; 149; 204; 56; 3; 249; 68; 151; 78; 117; 34; 174; 164; 48; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0290 :
  cduToSmuFramePack_fun [103; 244; 87; 65; 206; 138; 242]
  = [104; 235; 149; 204; 56; 3; 249; 68; 87; 65; 103; 206; 138; 242; 53; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0291 :
  cduToSmuFramePack_fun [208; 97; 202; 155; 36; 49; 230]
  = [209; 235; 149; 204; 56; 3; 249; 68; 202; 155; 208; 36; 49; 230; 102; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0292 :
  cduToSmuFramePack_fun [208; 246; 200; 121; 189; 168; 193]
  = [209; 235; 149; 204; 56; 3; 249; 68; 200; 121; 208; 189; 168; 193; 7; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0293 :
  cduToSmuFramePack_fun [107; 193; 183; 100; 125; 187; 176]
  = [108; 235; 149; 204; 56; 3; 249; 68; 183; 100; 107; 125; 187; 176; 36; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0294 :
  cduToSmuFramePack_fun [38; 110; 36; 112; 140; 72; 184]
  = [39; 235; 149; 204; 56; 3; 249; 68; 36; 112; 38; 140; 72; 184; 134; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0295 :
  cduToSmuFramePack_fun [164; 69; 157; 179; 158; 192; 84]
  = [165; 235; 149; 204; 56; 3; 249; 68; 157; 179; 164; 158; 192; 84; 36; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0296 :
  cduToSmuFramePack_fun [255; 77; 212; 173; 196; 74; 21]
  = [0; 235; 149; 204; 56; 3; 249; 68; 212; 173; 255; 196; 74; 21; 177; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0297 :
  cduToSmuFramePack_fun [182; 246; 206; 123; 216; 54; 156]
  = [183; 235; 149; 204; 56; 3; 249; 68; 206; 123; 182; 216; 54; 156; 121; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0298 :
  cduToSmuFramePack_fun [226; 13; 141; 228; 89; 249; 250]
  = [227; 235; 149; 204; 56; 3; 249; 68; 141; 228; 226; 89; 249; 250; 45; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0299 :
  cduToSmuFramePack_fun [119; 183; 172; 190; 219; 139; 252]
  = [120; 235; 149; 204; 56; 3; 249; 68; 172; 190; 119; 219; 139; 252; 133; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0300 :
  cduToSmuFramePack_fun [54; 186; 38; 253; 113; 202; 164]
  = [55; 235; 149; 204; 56; 3; 249; 68; 38; 253; 54; 113; 202; 164; 80; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0301 :
  cduToSmuFramePack_fun [128; 45; 139; 55; 194; 47; 147]
  = [129; 235; 149; 204; 56; 3; 249; 68; 139; 55; 128; 194; 47; 147; 148; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0302 :
  cduToSmuFramePack_fun [52; 117; 114; 81; 33; 61; 63]
  = [53; 235; 149; 204; 56; 3; 249; 68; 114; 81; 52; 33; 61; 63; 114; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0303 :
  cduToSmuFramePack_fun [48; 194; 186; 33; 189; 36; 207]
  = [49; 235; 149; 204; 56; 3; 249; 68; 186; 33; 48; 189; 36; 207; 99; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0304 :
  cduToSmuFramePack_fun [120; 227; 170; 239; 31; 204; 35]
  = [121; 235; 149; 204; 56; 3; 249; 68; 170; 239; 120; 31; 204; 35; 249; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0305 :
  cduToSmuFramePack_fun [218; 140; 136; 54; 172; 245; 192]
  = [219; 235; 149; 204; 56; 3; 249; 68; 136; 54; 218; 172; 245; 192; 149; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0306 :
  cduToSmuFramePack_fun [162; 199; 249; 127; 155; 219; 228]
  = [163; 235; 149; 204; 56; 3; 249; 68; 249; 127; 162; 155; 219; 228; 214; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0307 :
  cduToSmuFramePack_fun [34; 219; 46; 79; 107; 116; 62]
  = [35; 235; 149; 204; 56; 3; 249; 68; 46; 79; 34; 107; 116; 62; 6; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0308 :
  cduToSmuFramePack_fun [247; 96; 249; 124; 226; 177; 61]
  = [248; 235; 149; 204; 56; 3; 249; 68; 249; 124; 247; 226; 177; 61; 64; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0309 :
  cduToSmuFramePack_fun [43; 198; 156; 174; 121; 15; 109]
  = [44; 235; 149; 204; 56; 3; 249; 68; 156; 174; 43; 121; 15; 109; 218; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0310 :
  cduToSmuFramePack_fun [130; 53; 172; 189; 250; 92; 59]
  = [131; 235; 149; 204; 56; 3; 249; 68; 172; 189; 130; 250; 92; 59; 218; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0311 :
  cduToSmuFramePack_fun [241; 82; 100; 235; 47; 207; 73]
  = [242; 235; 149; 204; 56; 3; 249; 68; 100; 235; 241; 47; 207; 73; 79; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0312 :
  cduToSmuFramePack_fun [246; 221; 215; 202; 31; 101; 47]
  = [247; 235; 149; 204; 56; 3; 249; 68; 215; 202; 246; 31; 101; 47; 120; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0313 :
  cduToSmuFramePack_fun [248; 241; 99; 134; 95; 83; 158]
  = [249; 235; 149; 204; 56; 3; 249; 68; 99; 134; 248; 95; 83; 158; 71; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0314 :
  cduToSmuFramePack_fun [241; 168; 97; 59; 58; 156; 230]
  = [242; 235; 149; 204; 56; 3; 249; 68; 97; 59; 241; 58; 156; 230; 93; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0315 :
  cduToSmuFramePack_fun [119; 179; 100; 70; 93; 241; 109]
  = [120; 235; 149; 204; 56; 3; 249; 68; 100; 70; 119; 93; 241; 109; 86; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0316 :
  cduToSmuFramePack_fun [84; 7; 39; 158; 63; 160; 12]
  = [85; 235; 149; 204; 56; 3; 249; 68; 39; 158; 84; 63; 160; 12; 230; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0317 :
  cduToSmuFramePack_fun [19; 155; 234; 82; 35; 213; 151]
  = [20; 235; 149; 204; 56; 3; 249; 68; 234; 82; 19; 35; 213; 151; 168; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0318 :
  cduToSmuFramePack_fun [48; 164; 95; 163; 210; 52; 225]
  = [49; 235; 149; 204; 56; 3; 249; 68; 95; 163; 48; 210; 52; 225; 101; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0319 :
  cduToSmuFramePack_fun [174; 200; 102; 158; 186; 19; 61]
  = [175; 235; 149; 204; 56; 3; 249; 68; 102; 158; 174; 186; 19; 61; 16; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0320 :
  cduToSmuFramePack_fun [148; 175; 240; 110; 80; 218; 93]
  = [149; 235; 149; 204; 56; 3; 249; 68; 240; 110; 148; 80; 218; 93; 43; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0321 :
  cduToSmuFramePack_fun [236; 167; 7; 74; 102; 42; 24]
  = [237; 235; 149; 204; 56; 3; 249; 68; 7; 74; 236; 102; 42; 24; 7; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0322 :
  cduToSmuFramePack_fun [121; 138; 249; 131; 250; 208; 74]
  = [122; 235; 149; 204; 56; 3; 249; 68; 249; 131; 121; 250; 208; 74; 193; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0323 :
  cduToSmuFramePack_fun [107; 95; 180; 73; 177; 22; 171]
  = [108; 235; 149; 204; 56; 3; 249; 68; 180; 73; 107; 177; 22; 171; 236; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0324 :
  cduToSmuFramePack_fun [184; 10; 14; 167; 167; 135; 209]
  = [185; 235; 149; 204; 56; 3; 249; 68; 14; 167; 184; 167; 135; 209; 36; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0325 :
  cduToSmuFramePack_fun [124; 72; 179; 120; 241; 17; 4]
  = [125; 235; 149; 204; 56; 3; 249; 68; 179; 120; 124; 241; 17; 4; 1; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0326 :
  cduToSmuFramePack_fun [250; 59; 245; 131; 218; 169; 243]
  = [251; 235; 149; 204; 56; 3; 249; 68; 245; 131; 250; 218; 169; 243; 242; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0327 :
  cduToSmuFramePack_fun [226; 90; 213; 177; 156; 28; 75]
  = [227; 235; 149; 204; 56; 3; 249; 68; 213; 177; 226; 156; 28; 75; 195; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0328 :
  cduToSmuFramePack_fun [178; 20; 104; 211; 189; 78; 230]
  = [179; 235; 149; 204; 56; 3; 249; 68; 104; 211; 178; 189; 78; 230; 10; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0329 :
  cduToSmuFramePack_fun [245; 115; 128; 87; 249; 252; 12]
  = [246; 235; 149; 204; 56; 3; 249; 68; 128; 87; 245; 249; 252; 12; 199; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0330 :
  cduToSmuFramePack_fun [218; 68; 109; 135; 67; 248; 220]
  = [219; 235; 149; 204; 56; 3; 249; 68; 109; 135; 218; 67; 248; 220; 113; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0331 :
  cduToSmuFramePack_fun [4; 231; 21; 77; 182; 106; 221]
  = [5; 235; 149; 204; 56; 3; 249; 68; 21; 77; 4; 182; 106; 221; 5; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0332 :
  cduToSmuFramePack_fun [158; 40; 126; 92; 206; 81; 202]
  = [159; 235; 149; 204; 56; 3; 249; 68; 126; 92; 158; 206; 81; 202; 117; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0333 :
  cduToSmuFramePack_fun [44; 123; 48; 216; 118; 29; 128]
  = [45; 235; 149; 204; 56; 3; 249; 68; 48; 216; 44; 118; 29; 128; 209; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0334 :
  cduToSmuFramePack_fun [253; 200; 175; 46; 24; 118; 108]
  = [254; 235; 149; 204; 56; 3; 249; 68; 175; 46; 253; 24; 118; 108; 40; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0335 :
  cduToSmuFramePack_fun [76; 132; 198; 67; 170; 118; 236]
  = [77; 235; 149; 204; 56; 3; 249; 68; 198; 67; 76; 170; 118; 236; 109; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0336 :
  cduToSmuFramePack_fun [13; 6; 96; 42; 245; 84; 89]
  = [14; 235; 149; 204; 56; 3; 249; 68; 96; 42; 13; 245; 84; 89; 41; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0337 :
  cduToSmuFramePack_fun [133; 237; 201; 94; 32; 93; 64]
  = [134; 235; 149; 204; 56; 3; 249; 68; 201; 94; 133; 32; 93; 64; 183; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0338 :
  cduToSmuFramePack_fun [200; 187; 51; 218; 168; 118; 249]
  = [201; 235; 149; 204; 56; 3; 249; 68; 51; 218; 200; 168; 118; 249; 246; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0339 :
  cduToSmuFramePack_fun [12; 28; 160; 79; 218; 54; 155]
  = [13; 235; 149; 204; 56; 3; 249; 68; 160; 79; 12; 218; 54; 155; 98; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0340 :
  cduToSmuFramePack_fun [36; 218; 8; 2; 180; 104; 2]
  = [37; 235; 149; 204; 56; 3; 249; 68; 8; 2; 36; 180; 104; 2; 164; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0341 :
  cduToSmuFramePack_fun [219; 116; 89; 186; 240; 132; 85]
  = [220; 235; 149; 204; 56; 3; 249; 68; 89; 186; 219; 240; 132; 85; 163; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0342 :
  cduToSmuFramePack_fun [87; 77; 124; 192; 140; 105; 171]
  = [88; 235; 149; 204; 56; 3; 249; 68; 124; 192; 87; 140; 105; 171; 65; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0343 :
  cduToSmuFramePack_fun [74; 78; 172; 150; 5; 233; 20]
  = [75; 235; 149; 204; 56; 3; 249; 68; 172; 150; 74; 5; 233; 20; 142; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0344 :
  cduToSmuFramePack_fun [119; 190; 185; 94; 153; 149; 159]
  = [120; 235; 149; 204; 56; 3; 249; 68; 185; 94; 119; 153; 149; 159; 59; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0345 :
  cduToSmuFramePack_fun [45; 129; 58; 3; 104; 214; 135]
  = [46; 235; 149; 204; 56; 3; 249; 68; 58; 3; 45; 104; 214; 135; 101; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0346 :
  cduToSmuFramePack_fun [65; 226; 181; 164; 189; 111; 144]
  = [66; 235; 149; 204; 56; 3; 249; 68; 181; 164; 65; 189; 111; 144; 62; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0347 :
  cduToSmuFramePack_fun [34; 183; 139; 188; 32; 65; 107]
  = [35; 235; 149; 204; 56; 3; 249; 68; 139; 188; 34; 32; 65; 107; 119; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0348 :
  cduToSmuFramePack_fun [32; 249; 37; 219; 107; 150; 138]
  = [33; 235; 149; 204; 56; 3; 249; 68; 37; 219; 32; 107; 150; 138; 81; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0349 :
  cduToSmuFramePack_fun [115; 241; 171; 21; 248; 208; 141]
  = [116; 235; 149; 204; 56; 3; 249; 68; 171; 21; 115; 248; 208; 141; 158; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0350 :
  cduToSmuFramePack_fun [197; 102; 93; 180; 210; 179; 31]
  = [198; 235; 149; 204; 56; 3; 249; 68; 93; 180; 197; 210; 179; 31; 42; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0351 :
  cduToSmuFramePack_fun [17; 240; 220; 104; 194; 128; 178]
  = [18; 235; 149; 204; 56; 3; 249; 68; 220; 104; 17; 194; 128; 178; 109; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0352 :
  cduToSmuFramePack_fun [99; 209; 136; 56; 174; 19; 53]
  = [100; 235; 149; 204; 56; 3; 249; 68; 136; 56; 99; 174; 19; 53; 239; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0353 :
  cduToSmuFramePack_fun [125; 35; 40; 99; 194; 241; 216]
  = [126; 235; 149; 204; 56; 3; 249; 68; 40; 99; 125; 194; 241; 216; 237; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0354 :
  cduToSmuFramePack_fun [213; 22; 206; 7; 249; 41; 56]
  = [214; 235; 149; 204; 56; 3; 249; 68; 206; 7; 213; 249; 41; 56; 20; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0355 :
  cduToSmuFramePack_fun [20; 184; 62; 137; 215; 225; 123]
  = [21; 235; 149; 204; 56; 3; 249; 68; 62; 137; 20; 215; 225; 123; 66; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0356 :
  cduToSmuFramePack_fun [36; 60; 167; 19; 1; 6; 117]
  = [37; 235; 149; 204; 56; 3; 249; 68; 167; 19; 36; 1; 6; 117; 86; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0357 :
  cduToSmuFramePack_fun [164; 171; 120; 105; 100; 53; 153]
  = [165; 235; 149; 204; 56; 3; 249; 68; 120; 105; 164; 100; 53; 153; 161; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0358 :
  cduToSmuFramePack_fun [187; 153; 156; 185; 4; 237; 132]
  = [188; 235; 149; 204; 56; 3; 249; 68; 156; 185; 187; 4; 237; 132; 107; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0359 :
  cduToSmuFramePack_fun [59; 77; 210; 138; 59; 177; 143]
  = [60; 235; 149; 204; 56; 3; 249; 68; 210; 138; 59; 59; 177; 143; 32; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0360 :
  cduToSmuFramePack_fun [16; 131; 6; 162; 46; 120; 233]
  = [17; 235; 149; 204; 56; 3; 249; 68; 6; 162; 16; 46; 120; 233; 97; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0361 :
  cduToSmuFramePack_fun [33; 221; 199; 134; 247; 132; 97]
  = [34; 235; 149; 204; 56; 3; 249; 68; 199; 134; 33; 247; 132; 97; 120; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0362 :
  cduToSmuFramePack_fun [8; 177; 140; 132; 21; 25; 32]
  = [9; 235; 149; 204; 56; 3; 249; 68; 140; 132; 8; 21; 25; 32; 252; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0363 :
  cduToSmuFramePack_fun [4; 151; 114; 54; 36; 157; 226]
  = [5; 235; 149; 204; 56; 3; 249; 68; 114; 54; 4; 36; 157; 226; 81; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0364 :
  cduToSmuFramePack_fun [142; 116; 88; 175; 193; 53; 143]
  = [143; 235; 149; 204; 56; 3; 249; 68; 88; 175; 142; 193; 53; 143; 6; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0365 :
  cduToSmuFramePack_fun [180; 241; 224; 122; 172; 216; 152]
  = [181; 235; 149; 204; 56; 3; 249; 68; 224; 122; 180; 172; 216; 152; 64; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0366 :
  cduToSmuFramePack_fun [233; 39; 170; 173; 22; 115; 42]
  = [234; 235; 149; 204; 56; 3; 249; 68; 170; 173; 233; 22; 115; 42; 21; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0367 :
  cduToSmuFramePack_fun [101; 253; 188; 169; 48; 184; 95]
  = [102; 235; 149; 204; 56; 3; 249; 68; 188; 169; 101; 48; 184; 95; 127; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0368 :
  cduToSmuFramePack_fun [230; 171; 160; 47; 160; 236; 150]
  = [231; 235; 149; 204; 56; 3; 249; 68; 160; 47; 230; 160; 236; 150; 193; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0369 :
  cduToSmuFramePack_fun [207; 90; 6; 116; 222; 21; 29]
  = [208; 235; 149; 204; 56; 3; 249; 68; 6; 116; 207; 222; 21; 29; 177; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0370 :
  cduToSmuFramePack_fun [197; 218; 175; 12; 201; 29; 100]
  = [198; 235; 149; 204; 56; 3; 249; 68; 175; 12; 197; 201; 29; 100; 34; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0371 :
  cduToSmuFramePack_fun [156; 186; 60; 105; 36; 200; 172]
  = [157; 235; 149; 204; 56; 3; 249; 68; 60; 105; 156; 36; 200; 172; 241; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0372 :
  cduToSmuFramePack_fun [136; 207; 109; 138; 204; 75; 158]
  = [137; 235; 149; 204; 56; 3; 249; 68; 109; 138; 136; 204; 75; 158; 38; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0373 :
  cduToSmuFramePack_fun [148; 207; 233; 195; 57; 254; 202]
  = [149; 235; 149; 204; 56; 3; 249; 68; 233; 195; 148; 57; 254; 202; 51; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0374 :
  cduToSmuFramePack_fun [223; 201; 201; 63; 89; 11; 111]
  = [224; 235; 149; 204; 56; 3; 249; 68; 201; 63; 223; 89; 11; 111; 0; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0375 :
  cduToSmuFramePack_fun [120; 192; 43; 51; 52; 162; 77]
  = [121; 235; 149; 204; 56; 3; 249; 68; 43; 51; 120; 52; 162; 77; 189; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0376 :
  cduToSmuFramePack_fun [192; 107; 163; 198; 172; 189; 64]
  = [193; 235; 149; 204; 56; 3; 249; 68; 163; 198; 192; 172; 189; 64; 60; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0377 :
  cduToSmuFramePack_fun [95; 164; 23; 65; 221; 213; 114]
  = [96; 235; 149; 204; 56; 3; 249; 68; 23; 65; 95; 221; 213; 114; 39; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0378 :
  cduToSmuFramePack_fun [12; 135; 209; 194; 209; 61; 117]
  = [13; 235; 149; 204; 56; 3; 249; 68; 209; 194; 12; 209; 61; 117; 4; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0379 :
  cduToSmuFramePack_fun [116; 202; 254; 19; 66; 66; 236]
  = [117; 235; 149; 204; 56; 3; 249; 68; 254; 19; 116; 66; 66; 236; 45; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0380 :
  cduToSmuFramePack_fun [55; 63; 216; 67; 74; 243; 4]
  = [56; 235; 149; 204; 56; 3; 249; 68; 216; 67; 55; 74; 243; 4; 101; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0381 :
  cduToSmuFramePack_fun [8; 241; 245; 250; 1; 187; 218]
  = [9; 235; 149; 204; 56; 3; 249; 68; 245; 250; 8; 1; 187; 218; 163; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0382 :
  cduToSmuFramePack_fun [251; 136; 93; 150; 188; 43; 193]
  = [252; 235; 149; 204; 56; 3; 249; 68; 93; 150; 251; 188; 43; 193; 106; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0383 :
  cduToSmuFramePack_fun [120; 217; 40; 125; 225; 71; 196]
  = [121; 235; 149; 204; 56; 3; 249; 68; 40; 125; 120; 225; 71; 196; 111; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0384 :
  cduToSmuFramePack_fun [64; 125; 191; 157; 198; 28; 222]
  = [65; 235; 149; 204; 56; 3; 249; 68; 191; 157; 64; 198; 28; 222; 202; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0385 :
  cduToSmuFramePack_fun [67; 26; 230; 8; 22; 180; 153]
  = [68; 235; 149; 204; 56; 3; 249; 68; 230; 8; 67; 22; 180; 153; 108; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0386 :
  cduToSmuFramePack_fun [60; 28; 20; 26; 69; 122; 18]
  = [61; 235; 149; 204; 56; 3; 249; 68; 20; 26; 60; 69; 122; 18; 247; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0387 :
  cduToSmuFramePack_fun [2; 52; 102; 142; 63; 36; 83]
  = [3; 235; 149; 204; 56; 3; 249; 68; 102; 142; 2; 63; 36; 83; 24; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0388 :
  cduToSmuFramePack_fun [70; 117; 19; 244; 196; 157; 215]
  = [71; 235; 149; 204; 56; 3; 249; 68; 19; 244; 70; 196; 157; 215; 99; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0389 :
  cduToSmuFramePack_fun [178; 151; 216; 215; 21; 145; 235]
  = [179; 235; 149; 204; 56; 3; 249; 68; 216; 215; 178; 21; 145; 235; 244; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0390 :
  cduToSmuFramePack_fun [20; 75; 34; 179; 65; 92; 61]
  = [21; 235; 149; 204; 56; 3; 249; 68; 34; 179; 20; 65; 92; 61; 237; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0391 :
  cduToSmuFramePack_fun [32; 147; 110; 136; 19; 151; 143]
  = [33; 235; 149; 204; 56; 3; 249; 68; 110; 136; 32; 19; 151; 143; 137; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0392 :
  cduToSmuFramePack_fun [68; 46; 243; 40; 5; 81; 165]
  = [69; 235; 149; 204; 56; 3; 249; 68; 243; 40; 68; 5; 81; 165; 26; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0393 :
  cduToSmuFramePack_fun [167; 226; 187; 76; 223; 96; 164]
  = [168; 235; 149; 204; 56; 3; 249; 68; 187; 76; 167; 223; 96; 164; 121; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0394 :
  cduToSmuFramePack_fun [168; 60; 190; 88; 222; 83; 119]
  = [169; 235; 149; 204; 56; 3; 249; 68; 190; 88; 168; 222; 83; 119; 98; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0395 :
  cduToSmuFramePack_fun [25; 24; 53; 142; 199; 31; 137]
  = [26; 235; 149; 204; 56; 3; 249; 68; 53; 142; 25; 199; 31; 137; 63; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0396 :
  cduToSmuFramePack_fun [54; 6; 61; 121; 188; 129; 67]
  = [55; 235; 149; 204; 56; 3; 249; 68; 61; 121; 54; 188; 129; 67; 92; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0397 :
  cduToSmuFramePack_fun [105; 239; 192; 197; 56; 189; 241]
  = [106; 235; 149; 204; 56; 3; 249; 68; 192; 197; 105; 56; 189; 241; 6; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0398 :
  cduToSmuFramePack_fun [222; 110; 84; 45; 34; 243; 85]
  = [223; 235; 149; 204; 56; 3; 249; 68; 84; 45; 222; 34; 243; 85; 9; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0399 :
  cduToSmuFramePack_fun [78; 14; 89; 19; 107; 100; 91]
  = [79; 235; 149; 204; 56; 3; 249; 68; 89; 19; 78; 107; 100; 91; 100; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0400 :
  cduToSmuFramePack_fun [55; 110; 92; 100; 154; 134; 43]
  = [56; 235; 149; 204; 56; 3; 249; 68; 92; 100; 55; 154; 134; 43; 130; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0401 :
  cduToSmuFramePack_fun [95; 75; 85; 195; 171; 186; 95]
  = [96; 235; 149; 204; 56; 3; 249; 68; 85; 195; 95; 171; 186; 95; 101; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0402 :
  cduToSmuFramePack_fun [254; 201; 243; 148; 126; 58; 127]
  = [255; 235; 149; 204; 56; 3; 249; 68; 243; 148; 254; 126; 58; 127; 2; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0403 :
  cduToSmuFramePack_fun [134; 106; 138; 252; 114; 132; 2]
  = [135; 235; 149; 204; 56; 3; 249; 68; 138; 252; 134; 114; 132; 2; 124; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0404 :
  cduToSmuFramePack_fun [157; 231; 250; 222; 230; 86; 209]
  = [158; 235; 149; 204; 56; 3; 249; 68; 250; 222; 157; 230; 86; 209; 36; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0405 :
  cduToSmuFramePack_fun [82; 243; 251; 140; 26; 209; 173]
  = [83; 235; 149; 204; 56; 3; 249; 68; 251; 140; 82; 26; 209; 173; 107; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0406 :
  cduToSmuFramePack_fun [196; 142; 59; 181; 110; 10; 91]
  = [197; 235; 149; 204; 56; 3; 249; 68; 59; 181; 196; 110; 10; 91; 7; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0407 :
  cduToSmuFramePack_fun [242; 235; 67; 131; 47; 107; 47]
  = [243; 235; 149; 204; 56; 3; 249; 68; 67; 131; 242; 47; 107; 47; 235; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0408 :
  cduToSmuFramePack_fun [55; 3; 46; 132; 163; 121; 214]
  = [56; 235; 149; 204; 56; 3; 249; 68; 46; 132; 55; 163; 121; 214; 245; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0409 :
  cduToSmuFramePack_fun [103; 73; 65; 206; 178; 183; 1]
  = [104; 235; 149; 204; 56; 3; 249; 68; 65; 206; 103; 178; 183; 1; 38; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0410 :
  cduToSmuFramePack_fun [157; 205; 241; 194; 36; 229; 241]
  = [158; 235; 149; 204; 56; 3; 249; 68; 241; 194; 157; 36; 229; 241; 88; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0411 :
  cduToSmuFramePack_fun [170; 15; 157; 2; 117; 39; 100]
  = [171; 235; 149; 204; 56; 3; 249; 68; 157; 2; 170; 117; 39; 100; 187; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0412 :
  cduToSmuFramePack_fun [118; 81; 21; 92; 159; 156; 7]
  = [119; 235; 149; 204; 56; 3; 249; 68; 21; 92; 118; 159; 156; 7; 255; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0413 :
  cduToSmuFramePack_fun [78; 177; 76; 97; 204; 215; 103]
  = [79; 235; 149; 204; 56; 3; 249; 68; 76; 97; 78; 204; 215; 103; 155; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0414 :
  cduToSmuFramePack_fun [58; 39; 93; 182; 61; 226; 86]
  = [59; 235; 149; 204; 56; 3; 249; 68; 93; 182; 58; 61; 226; 86; 228; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0415 :
  cduToSmuFramePack_fun [46; 98; 149; 252; 142; 192; 17]
  = [47; 235; 149; 204; 56; 3; 249; 68; 149; 252; 46; 142; 192; 17; 6; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0416 :
  cduToSmuFramePack_fun [237; 137; 180; 236; 98; 71; 212]
  = [238; 235; 149; 204; 56; 3; 249; 68; 180; 236; 237; 98; 71; 212; 208; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0417 :
  cduToSmuFramePack_fun [159; 192; 138; 221; 182; 212; 151]
  = [160; 235; 149; 204; 56; 3; 249; 68; 138; 221; 159; 182; 212; 151; 235; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0418 :
  cduToSmuFramePack_fun [206; 172; 178; 222; 63; 4; 157]
  = [207; 235; 149; 204; 56; 3; 249; 68; 178; 222; 206; 63; 4; 157; 26; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0419 :
  cduToSmuFramePack_fun [49; 190; 241; 247; 28; 94; 98]
  = [50; 235; 149; 204; 56; 3; 249; 68; 241; 247; 49; 28; 94; 98; 213; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0420 :
  cduToSmuFramePack_fun [246; 167; 99; 64; 230; 61; 254]
  = [247; 235; 149; 204; 56; 3; 249; 68; 99; 64; 246; 230; 61; 254; 220; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0421 :
  cduToSmuFramePack_fun [192; 197; 177; 48; 193; 176; 217]
  = [193; 235; 149; 204; 56; 3; 249; 68; 177; 48; 192; 193; 176; 217; 105; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0422 :
  cduToSmuFramePack_fun [222; 149; 23; 234; 182; 189; 145]
  = [223; 235; 149; 204; 56; 3; 249; 68; 23; 234; 222; 182; 189; 145; 1; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0423 :
  cduToSmuFramePack_fun [194; 38; 202; 161; 133; 69; 88]
  = [195; 235; 149; 204; 56; 3; 249; 68; 202; 161; 194; 133; 69; 88; 127; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0424 :
  cduToSmuFramePack_fun [126; 250; 106; 2; 149; 38; 235]
  = [127; 235; 149; 204; 56; 3; 249; 68; 106; 2; 126; 149; 38; 235; 40; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0425 :
  cduToSmuFramePack_fun [46; 67; 128; 142; 187; 29; 244]
  = [47; 235; 149; 204; 56; 3; 249; 68; 128; 142; 46; 187; 29; 244; 162; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0426 :
  cduToSmuFramePack_fun [231; 53; 244; 186; 199; 81; 20]
  = [232; 235; 149; 204; 56; 3; 249; 68; 244; 186; 231; 199; 81; 20; 31; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0427 :
  cduToSmuFramePack_fun [127; 83; 239; 41; 246; 253; 84]
  = [128; 235; 149; 204; 56; 3; 249; 68; 239; 41; 127; 246; 253; 84; 152; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0428 :
  cduToSmuFramePack_fun [14; 219; 124; 26; 5; 71; 249]
  = [15; 235; 149; 204; 56; 3; 249; 68; 124; 26; 14; 5; 71; 249; 51; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0429 :
  cduToSmuFramePack_fun [58; 137; 165; 43; 65; 158; 197]
  = [59; 235; 149; 204; 56; 3; 249; 68; 165; 43; 58; 65; 158; 197; 116; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0430 :
  cduToSmuFramePack_fun [227; 31; 204; 246; 88; 61; 132]
  = [228; 235; 149; 204; 56; 3; 249; 68; 204; 246; 227; 88; 61; 132; 80; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0431 :
  cduToSmuFramePack_fun [236; 63; 113; 22; 27; 161; 237]
  = [237; 235; 149; 204; 56; 3; 249; 68; 113; 22; 236; 27; 161; 237; 238; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0432 :
  cduToSmuFramePack_fun [33; 233; 134; 200; 205; 74; 19]
  = [34; 235; 149; 204; 56; 3; 249; 68; 134; 200; 33; 205; 74; 19; 31; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0433 :
  cduToSmuFramePack_fun [37; 102; 95; 16; 236; 192; 254]
  = [38; 235; 149; 204; 56; 3; 249; 68; 95; 16; 37; 236; 192; 254; 238; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0434 :
  cduToSmuFramePack_fun [222; 21; 219; 114; 101; 91; 193]
  = [223; 235; 149; 204; 56; 3; 249; 68; 219; 114; 222; 101; 91; 193; 202; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0435 :
  cduToSmuFramePack_fun [186; 131; 1; 145; 166; 97; 246]
  = [187; 235; 149; 204; 56; 3; 249; 68; 1; 145; 186; 166; 97; 246; 99; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0436 :
  cduToSmuFramePack_fun [230; 175; 156; 145; 238; 150; 160]
  = [231; 235; 149; 204; 56; 3; 249; 68; 156; 145; 230; 238; 150; 160; 233; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0437 :
  cduToSmuFramePack_fun [222; 107; 34; 51; 5; 119; 212]
  = [223; 235; 149; 204; 56; 3; 249; 68; 34; 51; 222; 5; 119; 212; 237; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0438 :
  cduToSmuFramePack_fun [214; 41; 194; 242; 7; 150; 109]
  = [215; 235; 149; 204; 56; 3; 249; 68; 194; 242; 214; 7; 150; 109; 154; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0439 :
  cduToSmuFramePack_fun [129; 26; 161; 204; 212; 130; 17]
  = [130; 235; 149; 204; 56; 3; 249; 68; 161; 204; 129; 212; 130; 17; 45; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0440 :
  cduToSmuFramePack_fun [198; 83; 203; 183; 8; 187; 3]
  = [199; 235; 149; 204; 56; 3; 249; 68; 203; 183; 198; 8; 187; 3; 200; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0441 :
  cduToSmuFramePack_fun [83; 174; 15; 123; 232; 62; 23]
  = [84; 235; 149; 204; 56; 3; 249; 68; 15; 123; 83; 232; 62; 23; 218; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0442 :
  cduToSmuFramePack_fun [117; 218; 180; 228; 9; 105; 48]
  = [118; 235; 149; 204; 56; 3; 249; 68; 180; 228; 117; 9; 105; 48; 7; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0443 :
  cduToSmuFramePack_fun [199; 26; 235; 108; 36; 243; 49]
  = [200; 235; 149; 204; 56; 3; 249; 68; 235; 108; 199; 36; 243; 49; 62; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0444 :
  cduToSmuFramePack_fun [198; 34; 80; 108; 62; 156; 223]
  = [199; 235; 149; 204; 56; 3; 249; 68; 80; 108; 198; 62; 156; 223; 163; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0445 :
  cduToSmuFramePack_fun [121; 107; 81; 86; 30; 24; 35]
  = [122; 235; 149; 204; 56; 3; 249; 68; 81; 86; 121; 30; 24; 35; 227; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0446 :
  cduToSmuFramePack_fun [48; 4; 239; 203; 215; 217; 248]
  = [49; 235; 149; 204; 56; 3; 249; 68; 239; 203; 48; 215; 217; 248; 158; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0447 :
  cduToSmuFramePack_fun [81; 137; 123; 139; 37; 38; 15]
  = [82; 235; 149; 204; 56; 3; 249; 68; 123; 139; 81; 37; 38; 15; 119; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0448 :
  cduToSmuFramePack_fun [20; 39; 119; 8; 213; 225; 141]
  = [21; 235; 149; 204; 56; 3; 249; 68; 119; 8; 20; 213; 225; 141; 248; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0449 :
  cduToSmuFramePack_fun [147; 134; 161; 236; 25; 56; 47]
  = [148; 235; 149; 204; 56; 3; 249; 68; 161; 236; 147; 25; 56; 47; 144; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0450 :
  cduToSmuFramePack_fun [173; 2; 139; 75; 165; 237; 250]
  = [174; 235; 149; 204; 56; 3; 249; 68; 139; 75; 173; 165; 237; 250; 55; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0451 :
  cduToSmuFramePack_fun [31; 58; 144; 219; 199; 250; 231]
  = [32; 235; 149; 204; 56; 3; 249; 68; 144; 219; 31; 199; 250; 231; 74; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0452 :
  cduToSmuFramePack_fun [78; 40; 28; 120; 44; 70; 44]
  = [79; 235; 149; 204; 56; 3; 249; 68; 28; 120; 78; 44; 70; 44; 148; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0453 :
  cduToSmuFramePack_fun [154; 57; 34; 143; 92; 64; 151]
  = [155; 235; 149; 204; 56; 3; 249; 68; 34; 143; 154; 92; 64; 151; 164; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0454 :
  cduToSmuFramePack_fun [249; 188; 188; 129; 200; 40; 186]
  = [250; 235; 149; 204; 56; 3; 249; 68; 188; 129; 249; 200; 40; 186; 220; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0455 :
  cduToSmuFramePack_fun [37; 179; 34; 88; 2; 128; 251]
  = [38; 235; 149; 204; 56; 3; 249; 68; 34; 88; 37; 2; 128; 251; 150; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0456 :
  cduToSmuFramePack_fun [90; 13; 133; 31; 224; 55; 66]
  = [91; 235; 149; 204; 56; 3; 249; 68; 133; 31; 90; 224; 55; 66; 229; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0457 :
  cduToSmuFramePack_fun [242; 75; 12; 138; 199; 92; 223]
  = [243; 235; 149; 204; 56; 3; 249; 68; 12; 138; 242; 199; 92; 223; 180; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0458 :
  cduToSmuFramePack_fun [155; 109; 150; 228; 53; 240; 164]
  = [156; 235; 149; 204; 56; 3; 249; 68; 150; 228; 155; 53; 240; 164; 44; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0459 :
  cduToSmuFramePack_fun [226; 1; 95; 234; 77; 162; 199]
  = [227; 235; 149; 204; 56; 3; 249; 68; 95; 234; 226; 77; 162; 199; 23; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0460 :
  cduToSmuFramePack_fun [88; 201; 145; 148; 150; 35; 187]
  = [89; 235; 149; 204; 56; 3; 249; 68; 145; 148; 88; 150; 35; 187; 55; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0461 :
  cduToSmuFramePack_fun [19; 135; 118; 0; 167; 211; 184]
  = [20; 235; 149; 204; 56; 3; 249; 68; 118; 0; 19; 167; 211; 184; 157; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0462 :
  cduToSmuFramePack_fun [211; 225; 88; 203; 229; 112; 240]
  = [212; 235; 149; 204; 56; 3; 249; 68; 88; 203; 211; 229; 112; 240; 49; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0463 :
  cduToSmuFramePack_fun [55; 68; 75; 61; 214; 114; 193]
  = [56; 235; 149; 204; 56; 3; 249; 68; 75; 61; 55; 214; 114; 193; 84; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0464 :
  cduToSmuFramePack_fun [225; 189; 30; 147; 6; 184; 244]
  = [226; 235; 149; 204; 56; 3; 249; 68; 30; 147; 225; 6; 184; 244; 50; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0465 :
  cduToSmuFramePack_fun [209; 81; 122; 214; 227; 70; 250]
  = [210; 235; 149; 204; 56; 3; 249; 68; 122; 214; 209; 227; 70; 250; 26; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0466 :
  cduToSmuFramePack_fun [44; 23; 35; 219; 250; 244; 88]
  = [45; 235; 149; 204; 56; 3; 249; 68; 35; 219; 44; 250; 244; 88; 114; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0467 :
  cduToSmuFramePack_fun [19; 235; 214; 206; 27; 188; 45]
  = [20; 235; 149; 204; 56; 3; 249; 68; 214; 206; 19; 27; 188; 45; 37; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0468 :
  cduToSmuFramePack_fun [83; 181; 228; 49; 237; 164; 216]
  = [84; 235; 149; 204; 56; 3; 249; 68; 228; 49; 83; 237; 164; 216; 47; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0469 :
  cduToSmuFramePack_fun [82; 145; 248; 216; 14; 62; 250]
  = [83; 235; 149; 204; 56; 3; 249; 68; 248; 216; 82; 14; 62; 250; 190; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0470 :
  cduToSmuFramePack_fun [136; 106; 187; 133; 236; 153; 140]
  = [137; 235; 149; 204; 56; 3; 249; 68; 187; 133; 136; 236; 153; 140; 81; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0471 :
  cduToSmuFramePack_fun [231; 115; 17; 221; 0; 131; 2]
  = [232; 235; 149; 204; 56; 3; 249; 68; 17; 221; 231; 0; 131; 2; 84; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0472 :
  cduToSmuFramePack_fun [199; 159; 153; 95; 134; 255; 70]
  = [200; 235; 149; 204; 56; 3; 249; 68; 153; 95; 199; 134; 255; 70; 28; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0473 :
  cduToSmuFramePack_fun [195; 84; 29; 215; 174; 240; 195]
  = [196; 235; 149; 204; 56; 3; 249; 68; 29; 215; 195; 174; 240; 195; 196; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0474 :
  cduToSmuFramePack_fun [132; 228; 96; 247; 185; 102; 61]
  = [133; 235; 149; 204; 56; 3; 249; 68; 96; 247; 132; 185; 102; 61; 3; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0475 :
  cduToSmuFramePack_fun [87; 227; 19; 195; 248; 240; 248]
  = [88; 235; 149; 204; 56; 3; 249; 68; 19; 195; 87; 248; 240; 248; 231; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0476 :
  cduToSmuFramePack_fun [151; 114; 84; 84; 182; 106; 108]
  = [152; 235; 149; 204; 56; 3; 249; 68; 84; 84; 151; 182; 106; 108; 211; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0477 :
  cduToSmuFramePack_fun [208; 147; 80; 113; 255; 14; 58]
  = [209; 235; 149; 204; 56; 3; 249; 68; 80; 113; 208; 255; 14; 58; 18; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0478 :
  cduToSmuFramePack_fun [246; 131; 28; 16; 38; 226; 65]
  = [247; 235; 149; 204; 56; 3; 249; 68; 28; 16; 246; 38; 226; 65; 133; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0479 :
  cduToSmuFramePack_fun [81; 104; 168; 205; 192; 181; 115]
  = [82; 235; 149; 204; 56; 3; 249; 68; 168; 205; 81; 192; 181; 115; 66; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0480 :
  cduToSmuFramePack_fun [5; 99; 109; 55; 246; 28; 197]
  = [6; 235; 149; 204; 56; 3; 249; 68; 109; 55; 5; 246; 28; 197; 90; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0481 :
  cduToSmuFramePack_fun [188; 25; 46; 206; 40; 85; 209]
  = [189; 235; 149; 204; 56; 3; 249; 68; 46; 206; 188; 40; 85; 209; 236; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0482 :
  cduToSmuFramePack_fun [157; 181; 129; 82; 233; 227; 133]
  = [158; 235; 149; 204; 56; 3; 249; 68; 129; 82; 157; 233; 227; 133; 31; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0483 :
  cduToSmuFramePack_fun [145; 22; 17; 135; 172; 34; 110]
  = [146; 235; 149; 204; 56; 3; 249; 68; 17; 135; 145; 172; 34; 110; 117; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0484 :
  cduToSmuFramePack_fun [216; 76; 137; 137; 88; 87; 12]
  = [217; 235; 149; 204; 56; 3; 249; 68; 137; 137; 216; 88; 87; 12; 193; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0485 :
  cduToSmuFramePack_fun [193; 102; 182; 236; 47; 19; 224]
  = [194; 235; 149; 204; 56; 3; 249; 68; 182; 236; 193; 47; 19; 224; 53; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0486 :
  cduToSmuFramePack_fun [91; 30; 74; 21; 78; 52; 178]
  = [92; 235; 149; 204; 56; 3; 249; 68; 74; 21; 91; 78; 52; 178; 142; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0487 :
  cduToSmuFramePack_fun [177; 128; 179; 195; 132; 110; 124]
  = [178; 235; 149; 204; 56; 3; 249; 68; 179; 195; 177; 132; 110; 124; 217; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0488 :
  cduToSmuFramePack_fun [88; 209; 10; 74; 214; 1; 206]
  = [89; 235; 149; 204; 56; 3; 249; 68; 10; 74; 88; 214; 1; 206; 39; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0489 :
  cduToSmuFramePack_fun [1; 25; 33; 178; 164; 59; 40]
  = [2; 235; 149; 204; 56; 3; 249; 68; 33; 178; 1; 164; 59; 40; 193; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0490 :
  cduToSmuFramePack_fun [58; 242; 127; 160; 124; 109; 12]
  = [59; 235; 149; 204; 56; 3; 249; 68; 127; 160; 58; 124; 109; 12; 86; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0491 :
  cduToSmuFramePack_fun [241; 93; 19; 167; 97; 1; 127]
  = [242; 235; 149; 204; 56; 3; 249; 68; 19; 167; 241; 97; 1; 127; 186; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0492 :
  cduToSmuFramePack_fun [12; 85; 141; 114; 87; 58; 225]
  = [13; 235; 149; 204; 56; 3; 249; 68; 141; 114; 12; 87; 58; 225; 27; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0493 :
  cduToSmuFramePack_fun [235; 85; 155; 171; 138; 165; 22]
  = [236; 235; 149; 204; 56; 3; 249; 68; 155; 171; 235; 138; 165; 22; 20; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0494 :
  cduToSmuFramePack_fun [61; 74; 35; 224; 42; 18; 88]
  = [62; 235; 149; 204; 56; 3; 249; 68; 35; 224; 61; 42; 18; 88; 12; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0495 :
  cduToSmuFramePack_fun [93; 126; 151; 132; 96; 152; 15]
  = [94; 235; 149; 204; 56; 3; 249; 68; 151; 132; 93; 96; 152; 15; 223; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0496 :
  cduToSmuFramePack_fun [14; 208; 0; 92; 56; 201; 71]
  = [15; 235; 149; 204; 56; 3; 249; 68; 0; 92; 14; 56; 201; 71; 150; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0497 :
  cduToSmuFramePack_fun [66; 88; 243; 1; 159; 210; 242]
  = [67; 235; 149; 204; 56; 3; 249; 68; 243; 1; 66; 159; 210; 242; 13; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0498 :
  cduToSmuFramePack_fun [115; 175; 194; 48; 112; 205; 193]
  = [116; 235; 149; 204; 56; 3; 249; 68; 194; 48; 115; 112; 205; 193; 21; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0499 :
  cduToSmuFramePack_fun [205; 193; 103; 9; 147; 220; 174]
  = [206; 235; 149; 204; 56; 3; 249; 68; 103; 9; 205; 147; 220; 174; 16; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0500 :
  cduToSmuFramePack_fun [255; 138; 189; 83; 29; 54; 173]
  = [0; 235; 149; 204; 56; 3; 249; 68; 189; 83; 255; 29; 54; 173; 199; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0501 :
  cduToSmuFramePack_fun [143; 168; 219; 115; 110; 21; 198]
  = [144; 235; 149; 204; 56; 3; 249; 68; 219; 115; 143; 110; 21; 198; 58; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0502 :
  cduToSmuFramePack_fun [173; 112; 60; 250; 189; 163; 149]
  = [174; 235; 149; 204; 56; 3; 249; 68; 60; 250; 173; 189; 163; 149; 252; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0503 :
  cduToSmuFramePack_fun [184; 150; 203; 35; 89; 131; 32]
  = [185; 235; 149; 204; 56; 3; 249; 68; 203; 35; 184; 89; 131; 32; 178; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0504 :
  cduToSmuFramePack_fun [97; 5; 192; 187; 64; 149; 34]
  = [98; 235; 149; 204; 56; 3; 249; 68; 192; 187; 97; 64; 149; 34; 209; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0505 :
  cduToSmuFramePack_fun [40; 172; 201; 208; 105; 77; 96]
  = [41; 235; 149; 204; 56; 3; 249; 68; 201; 208; 40; 105; 77; 96; 179; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0506 :
  cduToSmuFramePack_fun [69; 165; 207; 56; 42; 25; 168]
  = [70; 235; 149; 204; 56; 3; 249; 68; 207; 56; 69; 42; 25; 168; 117; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0507 :
  cduToSmuFramePack_fun [12; 85; 119; 243; 4; 178; 55]
  = [13; 235; 149; 204; 56; 3; 249; 68; 119; 243; 12; 4; 178; 55; 1; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0508 :
  cduToSmuFramePack_fun [103; 5; 45; 52; 133; 214; 170]
  = [104; 235; 149; 204; 56; 3; 249; 68; 45; 52; 103; 133; 214; 170; 203; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0509 :
  cduToSmuFramePack_fun [240; 223; 127; 6; 133; 5; 106]
  = [241; 235; 149; 204; 56; 3; 249; 68; 127; 6; 240; 133; 5; 106; 123; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0510 :
  cduToSmuFramePack_fun [159; 195; 184; 5; 30; 196; 107]
  = [160; 235; 149; 204; 56; 3; 249; 68; 184; 5; 159; 30; 196; 107; 67; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0511 :
  cduToSmuFramePack_fun [141; 134; 38; 69; 123; 64; 162]
  = [142; 235; 149; 204; 56; 3; 249; 68; 38; 69; 141; 123; 64; 162; 69; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0512 :
  cduToSmuFramePack_fun [26; 213; 23; 139; 1; 235; 31]
  = [27; 235; 149; 204; 56; 3; 249; 68; 23; 139; 26; 1; 235; 31; 101; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0513 :
  cduToSmuFramePack_fun [232; 219; 113; 133; 97; 91; 66]
  = [233; 235; 149; 204; 56; 3; 249; 68; 113; 133; 232; 97; 91; 66; 38; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0514 :
  cduToSmuFramePack_fun [221; 148; 104; 208; 104; 77; 197]
  = [222; 235; 149; 204; 56; 3; 249; 68; 104; 208; 221; 104; 77; 197; 187; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0515 :
  cduToSmuFramePack_fun [217; 214; 15; 208; 36; 81; 6]
  = [218; 235; 149; 204; 56; 3; 249; 68; 15; 208; 217; 36; 81; 6; 195; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0516 :
  cduToSmuFramePack_fun [109; 61; 242; 33; 52; 38; 96]
  = [110; 235; 149; 204; 56; 3; 249; 68; 242; 33; 109; 52; 38; 96; 40; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0517 :
  cduToSmuFramePack_fun [86; 88; 126; 46; 124; 115; 44]
  = [87; 235; 149; 204; 56; 3; 249; 68; 126; 46; 86; 124; 115; 44; 145; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0518 :
  cduToSmuFramePack_fun [67; 237; 187; 134; 238; 42; 128]
  = [68; 235; 149; 204; 56; 3; 249; 68; 187; 134; 67; 238; 42; 128; 106; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0519 :
  cduToSmuFramePack_fun [95; 9; 74; 92; 142; 234; 52]
  = [96; 235; 149; 204; 56; 3; 249; 68; 74; 92; 95; 142; 234; 52; 119; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0520 :
  cduToSmuFramePack_fun [55; 87; 5; 222; 247; 88; 164]
  = [56; 235; 149; 204; 56; 3; 249; 68; 5; 222; 55; 247; 88; 164; 143; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0521 :
  cduToSmuFramePack_fun [144; 125; 54; 77; 94; 122; 124]
  = [145; 235; 149; 204; 56; 3; 249; 68; 54; 77; 144; 94; 122; 124; 213; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0522 :
  cduToSmuFramePack_fun [166; 140; 153; 149; 43; 17; 34]
  = [167; 235; 149; 204; 56; 3; 249; 68; 153; 149; 166; 43; 17; 34; 206; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0523 :
  cduToSmuFramePack_fun [32; 237; 18; 169; 254; 200; 214]
  = [33; 235; 149; 204; 56; 3; 249; 68; 18; 169; 32; 254; 200; 214; 197; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0524 :
  cduToSmuFramePack_fun [208; 127; 13; 120; 21; 38; 19]
  = [209; 235; 149; 204; 56; 3; 249; 68; 13; 120; 208; 21; 38; 19; 245; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0525 :
  cduToSmuFramePack_fun [185; 128; 8; 127; 207; 152; 161]
  = [186; 235; 149; 204; 56; 3; 249; 68; 8; 127; 185; 207; 152; 161; 140; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0526 :
  cduToSmuFramePack_fun [171; 53; 56; 229; 170; 43; 35]
  = [172; 235; 149; 204; 56; 3; 249; 68; 56; 229; 171; 170; 43; 35; 30; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0527 :
  cduToSmuFramePack_fun [48; 159; 131; 139; 75; 40; 68]
  = [49; 235; 149; 204; 56; 3; 249; 68; 131; 139; 48; 75; 40; 68; 135; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0528 :
  cduToSmuFramePack_fun [136; 25; 15; 4; 125; 106; 4]
  = [137; 235; 149; 204; 56; 3; 249; 68; 15; 4; 136; 125; 106; 4; 108; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0529 :
  cduToSmuFramePack_fun [68; 217; 176; 232; 239; 90; 25]
  = [69; 235; 149; 204; 56; 3; 249; 68; 176; 232; 68; 239; 90; 25; 164; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0530 :
  cduToSmuFramePack_fun [219; 135; 108; 249; 130; 197; 155]
  = [220; 235; 149; 204; 56; 3; 249; 68; 108; 249; 219; 130; 197; 155; 4; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0531 :
  cduToSmuFramePack_fun [173; 25; 58; 26; 23; 75; 32]
  = [174; 235; 149; 204; 56; 3; 249; 68; 58; 26; 173; 23; 75; 32; 105; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0532 :
  cduToSmuFramePack_fun [148; 144; 143; 223; 235; 59; 114]
  = [149; 235; 149; 204; 56; 3; 249; 68; 143; 223; 148; 235; 59; 114; 254; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0533 :
  cduToSmuFramePack_fun [161; 29; 21; 236; 104; 134; 13]
  = [162; 235; 149; 204; 56; 3; 249; 68; 21; 236; 161; 104; 134; 13; 75; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0534 :
  cduToSmuFramePack_fun [108; 233; 226; 151; 247; 64; 103]
  = [109; 235; 149; 204; 56; 3; 249; 68; 226; 151; 108; 247; 64; 103; 9; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0535 :
  cduToSmuFramePack_fun [179; 92; 230; 161; 178; 125; 30]
  = [180; 235; 149; 204; 56; 3; 249; 68; 230; 161; 179; 178; 125; 30; 195; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0536 :
  cduToSmuFramePack_fun [126; 190; 78; 71; 133; 59; 221]
  = [127; 235; 149; 204; 56; 3; 249; 68; 78; 71; 126; 133; 59; 221; 144; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0537 :
  cduToSmuFramePack_fun [61; 154; 32; 246; 92; 22; 31]
  = [62; 235; 149; 204; 56; 3; 249; 68; 32; 246; 61; 92; 22; 31; 188; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0538 :
  cduToSmuFramePack_fun [133; 230; 90; 144; 74; 95; 229]
  = [134; 235; 149; 204; 56; 3; 249; 68; 90; 144; 133; 74; 95; 229; 173; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0539 :
  cduToSmuFramePack_fun [140; 36; 201; 155; 94; 154; 212]
  = [141; 235; 149; 204; 56; 3; 249; 68; 201; 155; 140; 94; 154; 212; 8; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0540 :
  cduToSmuFramePack_fun [199; 1; 84; 123; 141; 8; 38]
  = [200; 235; 149; 204; 56; 3; 249; 68; 84; 123; 199; 141; 8; 38; 135; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0541 :
  cduToSmuFramePack_fun [224; 60; 133; 198; 46; 56; 228]
  = [225; 235; 149; 204; 56; 3; 249; 68; 133; 198; 224; 46; 56; 228; 113; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0542 :
  cduToSmuFramePack_fun [186; 70; 26; 243; 178; 169; 5]
  = [187; 235; 149; 204; 56; 3; 249; 68; 26; 243; 186; 178; 169; 5; 151; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0543 :
  cduToSmuFramePack_fun [137; 34; 83; 254; 57; 99; 18]
  = [138; 235; 149; 204; 56; 3; 249; 68; 83; 254; 137; 57; 99; 18; 240; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0544 :
  cduToSmuFramePack_fun [198; 22; 223; 120; 245; 127; 97]
  = [199; 235; 149; 204; 56; 3; 249; 68; 223; 120; 198; 245; 127; 97; 2; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0545 :
  cduToSmuFramePack_fun [56; 220; 211; 153; 26; 181; 156]
  = [57; 235; 149; 204; 56; 3; 249; 68; 211; 153; 56; 26; 181; 156; 75; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0546 :
  cduToSmuFramePack_fun [209; 178; 11; 22; 39; 127; 91]
  = [210; 235; 149; 204; 56; 3; 249; 68; 11; 22; 209; 39; 127; 91; 123; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0547 :
  cduToSmuFramePack_fun [176; 24; 208; 207; 207; 26; 41]
  = [177; 235; 149; 204; 56; 3; 249; 68; 208; 207; 176; 207; 26; 41; 85; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0548 :
  cduToSmuFramePack_fun [251; 22; 88; 39; 57; 179; 106]
  = [252; 235; 149; 204; 56; 3; 249; 68; 88; 39; 251; 57; 179; 106; 224; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0549 :
  cduToSmuFramePack_fun [126; 40; 243; 189; 15; 208; 135]
  = [127; 235; 149; 204; 56; 3; 249; 68; 243; 189; 126; 15; 208; 135; 168; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0550 :
  cduToSmuFramePack_fun [43; 8; 63; 66; 247; 133; 2]
  = [44; 235; 149; 204; 56; 3; 249; 68; 63; 66; 43; 247; 133; 2; 254; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0551 :
  cduToSmuFramePack_fun [185; 251; 165; 106; 233; 146; 86]
  = [186; 235; 149; 204; 56; 3; 249; 68; 165; 106; 185; 233; 146; 86; 35; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0552 :
  cduToSmuFramePack_fun [102; 130; 163; 247; 206; 169; 33]
  = [103; 235; 149; 204; 56; 3; 249; 68; 163; 247; 102; 206; 169; 33; 192; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0553 :
  cduToSmuFramePack_fun [87; 137; 242; 222; 65; 80; 111]
  = [88; 235; 149; 204; 56; 3; 249; 68; 242; 222; 87; 65; 80; 111; 237; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0554 :
  cduToSmuFramePack_fun [110; 250; 11; 235; 199; 166; 152]
  = [111; 235; 149; 204; 56; 3; 249; 68; 11; 235; 110; 199; 166; 152; 1; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0555 :
  cduToSmuFramePack_fun [234; 17; 30; 49; 173; 197; 194]
  = [235; 235; 149; 204; 56; 3; 249; 68; 30; 49; 234; 173; 197; 194; 195; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0556 :
  cduToSmuFramePack_fun [37; 183; 192; 178; 123; 47; 204]
  = [38; 235; 149; 204; 56; 3; 249; 68; 192; 178; 37; 123; 47; 204; 79; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0557 :
  cduToSmuFramePack_fun [89; 138; 104; 10; 105; 33; 21]
  = [90; 235; 149; 204; 56; 3; 249; 68; 104; 10; 89; 105; 33; 21; 34; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0558 :
  cduToSmuFramePack_fun [225; 62; 191; 102; 111; 24; 23]
  = [226; 235; 149; 204; 56; 3; 249; 68; 191; 102; 225; 111; 24; 23; 132; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0559 :
  cduToSmuFramePack_fun [143; 80; 104; 97; 47; 60; 83]
  = [144; 235; 149; 204; 56; 3; 249; 68; 104; 97; 143; 47; 60; 83; 250; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0560 :
  cduToSmuFramePack_fun [238; 182; 197; 130; 40; 134; 200]
  = [239; 235; 149; 204; 56; 3; 249; 68; 197; 130; 238; 40; 134; 200; 251; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0561 :
  cduToSmuFramePack_fun [166; 179; 155; 1; 170; 81; 14]
  = [167; 235; 149; 204; 56; 3; 249; 68; 155; 1; 166; 170; 81; 14; 197; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0562 :
  cduToSmuFramePack_fun [13; 42; 57; 122; 90; 55; 167]
  = [14; 235; 149; 204; 56; 3; 249; 68; 57; 122; 13; 90; 55; 167; 240; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0563 :
  cduToSmuFramePack_fun [92; 6; 6; 235; 231; 22; 68]
  = [93; 235; 149; 204; 56; 3; 249; 68; 6; 235; 92; 231; 22; 68; 126; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0564 :
  cduToSmuFramePack_fun [101; 233; 66; 148; 23; 217; 148]
  = [102; 235; 149; 204; 56; 3; 249; 68; 66; 148; 101; 23; 217; 148; 69; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0565 :
  cduToSmuFramePack_fun [87; 99; 188; 197; 154; 47; 41]
  = [88; 235; 149; 204; 56; 3; 249; 68; 188; 197; 87; 154; 47; 41; 164; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0566 :
  cduToSmuFramePack_fun [38; 130; 63; 215; 154; 155; 65]
  = [39; 235; 149; 204; 56; 3; 249; 68; 63; 215; 38; 154; 155; 65; 218; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0567 :
  cduToSmuFramePack_fun [129; 170; 251; 32; 3; 148; 110]
  = [130; 235; 149; 204; 56; 3; 249; 68; 251; 32; 129; 3; 148; 110; 153; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0568 :
  cduToSmuFramePack_fun [203; 23; 124; 98; 206; 190; 49]
  = [204; 235; 149; 204; 56; 3; 249; 68; 124; 98; 203; 206; 190; 49; 104; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0569 :
  cduToSmuFramePack_fun [222; 162; 35; 71; 249; 116; 25]
  = [223; 235; 149; 204; 56; 3; 249; 68; 35; 71; 222; 249; 116; 25; 54; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0570 :
  cduToSmuFramePack_fun [149; 99; 228; 128; 185; 235; 119]
  = [150; 235; 149; 204; 56; 3; 249; 68; 228; 128; 149; 185; 235; 119; 238; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0571 :
  cduToSmuFramePack_fun [74; 53; 119; 207; 119; 99; 255]
  = [75; 235; 149; 204; 56; 3; 249; 68; 119; 207; 74; 119; 99; 255; 199; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0572 :
  cduToSmuFramePack_fun [33; 66; 20; 248; 54; 56; 188]
  = [34; 235; 149; 204; 56; 3; 249; 68; 20; 248; 33; 54; 56; 188; 255; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0573 :
  cduToSmuFramePack_fun [225; 19; 183; 198; 100; 72; 214]
  = [226; 235; 149; 204; 56; 3; 249; 68; 183; 198; 225; 100; 72; 214; 26; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0574 :
  cduToSmuFramePack_fun [230; 89; 42; 252; 136; 212; 89]
  = [231; 235; 149; 204; 56; 3; 249; 68; 42; 252; 230; 136; 212; 89; 39; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0575 :
  cduToSmuFramePack_fun [30; 4; 192; 178; 83; 191; 155]
  = [31; 235; 149; 204; 56; 3; 249; 68; 192; 178; 30; 83; 191; 155; 73; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0576 :
  cduToSmuFramePack_fun [162; 181; 90; 90; 237; 239; 97]
  = [163; 235; 149; 204; 56; 3; 249; 68; 90; 90; 162; 237; 239; 97; 241; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0577 :
  cduToSmuFramePack_fun [154; 249; 133; 100; 97; 172; 130]
  = [155; 235; 149; 204; 56; 3; 249; 68; 133; 100; 154; 97; 172; 130; 184; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0578 :
  cduToSmuFramePack_fun [185; 160; 115; 186; 182; 172; 216]
  = [186; 235; 149; 204; 56; 3; 249; 68; 115; 186; 185; 182; 172; 216; 164; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0579 :
  cduToSmuFramePack_fun [10; 7; 224; 138; 201; 188; 139]
  = [11; 235; 149; 204; 56; 3; 249; 68; 224; 138; 10; 201; 188; 139; 102; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0580 :
  cduToSmuFramePack_fun [191; 209; 94; 219; 87; 235; 227]
  = [192; 235; 149; 204; 56; 3; 249; 68; 94; 219; 191; 87; 235; 227; 243; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0581 :
  cduToSmuFramePack_fun [194; 98; 200; 108; 93; 22; 94]
  = [195; 235; 149; 204; 56; 3; 249; 68; 200; 108; 194; 93; 22; 94; 175; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0582 :
  cduToSmuFramePack_fun [190; 53; 105; 32; 17; 126; 223]
  = [191; 235; 149; 204; 56; 3; 249; 68; 105; 32; 190; 17; 126; 223; 19; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0583 :
  cduToSmuFramePack_fun [254; 104; 189; 0; 189; 217; 59]
  = [255; 235; 149; 204; 56; 3; 249; 68; 189; 0; 254; 189; 217; 59; 32; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0584 :
  cduToSmuFramePack_fun [116; 179; 15; 76; 71; 65; 53]
  = [117; 235; 149; 204; 56; 3; 249; 68; 15; 76; 116; 71; 65; 53; 6; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0585 :
  cduToSmuFramePack_fun [86; 119; 39; 25; 245; 243; 18]
  = [87; 235; 149; 204; 56; 3; 249; 68; 39; 25; 86; 245; 243; 18; 82; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0586 :
  cduToSmuFramePack_fun [142; 4; 181; 137; 160; 58; 24]
  = [143; 235; 149; 204; 56; 3; 249; 68; 181; 137; 142; 160; 58; 24; 202; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0587 :
  cduToSmuFramePack_fun [69; 187; 104; 66; 173; 246; 84]
  = [70; 235; 149; 204; 56; 3; 249; 68; 104; 66; 69; 173; 246; 84; 240; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0588 :
  cduToSmuFramePack_fun [48; 119; 139; 223; 215; 97; 108]
  = [49; 235; 149; 204; 56; 3; 249; 68; 139; 223; 48; 215; 97; 108; 0; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0589 :
  cduToSmuFramePack_fun [154; 73; 143; 165; 45; 53; 154]
  = [155; 235; 149; 204; 56; 3; 249; 68; 143; 165; 154; 45; 53; 154; 16; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0590 :
  cduToSmuFramePack_fun [234; 251; 222; 152; 14; 182; 218]
  = [235; 235; 149; 204; 56; 3; 249; 68; 222; 152; 234; 14; 182; 218; 136; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0591 :
  cduToSmuFramePack_fun [56; 241; 23; 47; 186; 79; 184]
  = [57; 235; 149; 204; 56; 3; 249; 68; 23; 47; 56; 186; 79; 184; 85; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0592 :
  cduToSmuFramePack_fun [228; 141; 240; 59; 48; 251; 92]
  = [229; 235; 149; 204; 56; 3; 249; 68; 240; 59; 228; 48; 251; 92; 36; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0593 :
  cduToSmuFramePack_fun [6; 101; 165; 147; 64; 214; 53]
  = [7; 235; 149; 204; 56; 3; 249; 68; 165; 147; 6; 64; 214; 53; 71; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0594 :
  cduToSmuFramePack_fun [183; 74; 218; 36; 217; 200; 163]
  = [184; 235; 149; 204; 56; 3; 249; 68; 218; 36; 183; 217; 200; 163; 49; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0595 :
  cduToSmuFramePack_fun [69; 16; 19; 218; 148; 154; 76]
  = [70; 235; 149; 204; 56; 3; 249; 68; 19; 218; 69; 148; 154; 76; 16; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0596 :
  cduToSmuFramePack_fun [38; 243; 123; 211; 138; 75; 32]
  = [39; 235; 149; 204; 56; 3; 249; 68; 123; 211; 38; 138; 75; 32; 99; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0597 :
  cduToSmuFramePack_fun [243; 11; 229; 125; 196; 3; 153]
  = [244; 235; 149; 204; 56; 3; 249; 68; 229; 125; 243; 196; 3; 153; 95; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0598 :
  cduToSmuFramePack_fun [39; 166; 243; 243; 17; 239; 122]
  = [40; 235; 149; 204; 56; 3; 249; 68; 243; 243; 39; 17; 239; 122; 183; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0599 :
  cduToSmuFramePack_fun [64; 3; 34; 69; 120; 188; 24]
  = [65; 235; 149; 204; 56; 3; 249; 68; 34; 69; 64; 120; 188; 24; 13; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0600 :
  cduToSmuFramePack_fun [8; 240; 110; 162; 239; 29; 3]
  = [9; 235; 149; 204; 56; 3; 249; 68; 110; 162; 8; 239; 29; 3; 75; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0601 :
  cduToSmuFramePack_fun [246; 154; 100; 165; 114; 25; 218]
  = [247; 235; 149; 204; 56; 3; 249; 68; 100; 165; 246; 114; 25; 218; 60; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0602 :
  cduToSmuFramePack_fun [244; 5; 159; 192; 120; 71; 124]
  = [245; 235; 149; 204; 56; 3; 249; 68; 159; 192; 244; 120; 71; 124; 140; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0603 :
  cduToSmuFramePack_fun [71; 89; 40; 142; 22; 78; 87]
  = [72; 235; 149; 204; 56; 3; 249; 68; 40; 142; 71; 22; 78; 87; 30; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0604 :
  cduToSmuFramePack_fun [204; 41; 116; 78; 113; 2; 87]
  = [205; 235; 149; 204; 56; 3; 249; 68; 116; 78; 204; 113; 2; 87; 94; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0605 :
  cduToSmuFramePack_fun [130; 216; 226; 0; 159; 179; 145]
  = [131; 235; 149; 204; 56; 3; 249; 68; 226; 0; 130; 159; 179; 145; 187; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0606 :
  cduToSmuFramePack_fun [69; 25; 44; 235; 215; 25; 137]
  = [70; 235; 149; 204; 56; 3; 249; 68; 44; 235; 69; 215; 25; 137; 187; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0607 :
  cduToSmuFramePack_fun [0; 239; 97; 164; 162; 86; 207]
  = [1; 235; 149; 204; 56; 3; 249; 68; 97; 164; 0; 162; 86; 207; 254; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0608 :
  cduToSmuFramePack_fun [142; 5; 235; 77; 39; 196; 241]
  = [143; 235; 149; 204; 56; 3; 249; 68; 235; 77; 142; 39; 196; 241; 160; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0609 :
  cduToSmuFramePack_fun [84; 216; 161; 239; 190; 181; 152]
  = [85; 235; 149; 204; 56; 3; 249; 68; 161; 239; 84; 190; 181; 152; 99; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0610 :
  cduToSmuFramePack_fun [178; 61; 57; 112; 190; 65; 248]
  = [179; 235; 149; 204; 56; 3; 249; 68; 57; 112; 178; 190; 65; 248; 64; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0611 :
  cduToSmuFramePack_fun [220; 12; 54; 28; 51; 117; 126]
  = [221; 235; 149; 204; 56; 3; 249; 68; 54; 28; 220; 51; 117; 126; 240; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0612 :
  cduToSmuFramePack_fun [119; 204; 206; 198; 156; 180; 154]
  = [120; 235; 149; 204; 56; 3; 249; 68; 206; 198; 119; 156; 180; 154; 17; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0613 :
  cduToSmuFramePack_fun [146; 211; 225; 231; 150; 148; 211]
  = [147; 235; 149; 204; 56; 3; 249; 68; 225; 231; 146; 150; 148; 211; 17; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0614 :
  cduToSmuFramePack_fun [95; 137; 60; 236; 93; 40; 91]
  = [96; 235; 149; 204; 56; 3; 249; 68; 60; 236; 95; 93; 40; 91; 45; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0615 :
  cduToSmuFramePack_fun [220; 127; 195; 210; 147; 238; 18]
  = [221; 235; 149; 204; 56; 3; 249; 68; 195; 210; 220; 147; 238; 18; 86; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0616 :
  cduToSmuFramePack_fun [42; 160; 158; 254; 42; 58; 59]
  = [43; 235; 149; 204; 56; 3; 249; 68; 158; 254; 42; 42; 58; 59; 233; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0617 :
  cduToSmuFramePack_fun [218; 27; 94; 52; 232; 226; 44]
  = [219; 235; 149; 204; 56; 3; 249; 68; 94; 52; 218; 232; 226; 44; 44; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0618 :
  cduToSmuFramePack_fun [247; 168; 122; 25; 67; 252; 180]
  = [248; 235; 149; 204; 56; 3; 249; 68; 122; 25; 247; 67; 252; 180; 145; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0619 :
  cduToSmuFramePack_fun [4; 105; 217; 246; 155; 132; 124]
  = [5; 235; 149; 204; 56; 3; 249; 68; 217; 246; 4; 155; 132; 124; 244; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0620 :
  cduToSmuFramePack_fun [3; 92; 4; 21; 5; 123; 223]
  = [4; 235; 149; 204; 56; 3; 249; 68; 4; 21; 3; 5; 123; 223; 183; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0621 :
  cduToSmuFramePack_fun [140; 232; 174; 97; 47; 89; 213]
  = [141; 235; 149; 204; 56; 3; 249; 68; 174; 97; 140; 47; 89; 213; 140; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0622 :
  cduToSmuFramePack_fun [130; 215; 197; 48; 108; 94; 219]
  = [131; 235; 149; 204; 56; 3; 249; 68; 197; 48; 130; 108; 94; 219; 158; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0623 :
  cduToSmuFramePack_fun [138; 140; 193; 5; 43; 17; 72]
  = [139; 235; 149; 204; 56; 3; 249; 68; 193; 5; 138; 43; 17; 72; 112; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0624 :
  cduToSmuFramePack_fun [204; 3; 239; 158; 175; 34; 151]
  = [205; 235; 149; 204; 56; 3; 249; 68; 239; 158; 204; 175; 34; 151; 219; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0625 :
  cduToSmuFramePack_fun [116; 25; 73; 212; 161; 255; 95]
  = [117; 235; 149; 204; 56; 3; 249; 68; 73; 212; 116; 161; 255; 95; 118; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0626 :
  cduToSmuFramePack_fun [132; 103; 116; 57; 138; 65; 162]
  = [133; 235; 149; 204; 56; 3; 249; 68; 116; 57; 132; 138; 65; 162; 64; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0627 :
  cduToSmuFramePack_fun [154; 197; 25; 171; 72; 20; 69]
  = [155; 235; 149; 204; 56; 3; 249; 68; 25; 171; 154; 72; 20; 69; 125; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0628 :
  cduToSmuFramePack_fun [227; 57; 18; 135; 217; 62; 14]
  = [228; 235; 149; 204; 56; 3; 249; 68; 18; 135; 227; 217; 62; 14; 199; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0629 :
  cduToSmuFramePack_fun [96; 92; 36; 58; 125; 200; 202]
  = [97; 235; 149; 204; 56; 3; 249; 68; 36; 58; 96; 125; 200; 202; 9; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0630 :
  cduToSmuFramePack_fun [106; 225; 37; 252; 210; 31; 165]
  = [107; 235; 149; 204; 56; 3; 249; 68; 37; 252; 106; 210; 31; 165; 23; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0631 :
  cduToSmuFramePack_fun [7; 22; 32; 172; 106; 209; 108]
  = [8; 235; 149; 204; 56; 3; 249; 68; 32; 172; 7; 106; 209; 108; 138; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0632 :
  cduToSmuFramePack_fun [67; 98; 225; 139; 118; 45; 38]
  = [68; 235; 149; 204; 56; 3; 249; 68; 225; 139; 67; 118; 45; 38; 96; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0633 :
  cduToSmuFramePack_fun [212; 77; 208; 182; 108; 199; 63]
  = [213; 235; 149; 204; 56; 3; 249; 68; 208; 182; 212; 108; 199; 63; 218; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0634 :
  cduToSmuFramePack_fun [253; 133; 183; 164; 1; 110; 24]
  = [254; 235; 149; 204; 56; 3; 249; 68; 183; 164; 253; 1; 110; 24; 221; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0635 :
  cduToSmuFramePack_fun [77; 96; 226; 220; 32; 198; 38]
  = [78; 235; 149; 204; 56; 3; 249; 68; 226; 220; 77; 32; 198; 38; 27; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0636 :
  cduToSmuFramePack_fun [40; 5; 100; 197; 235; 183; 117]
  = [41; 235; 149; 204; 56; 3; 249; 68; 100; 197; 40; 235; 183; 117; 102; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0637 :
  cduToSmuFramePack_fun [43; 209; 205; 2; 172; 111; 229]
  = [44; 235; 149; 204; 56; 3; 249; 68; 205; 2; 43; 172; 111; 229; 208; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0638 :
  cduToSmuFramePack_fun [3; 241; 49; 11; 35; 25; 255]
  = [4; 235; 149; 204; 56; 3; 249; 68; 49; 11; 3; 35; 25; 255; 144; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0639 :
  cduToSmuFramePack_fun [121; 191; 251; 202; 218; 7; 247]
  = [122; 235; 149; 204; 56; 3; 249; 68; 251; 202; 121; 218; 7; 247; 232; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0640 :
  cduToSmuFramePack_fun [135; 103; 73; 101; 25; 33; 207]
  = [136; 235; 149; 204; 56; 3; 249; 68; 73; 101; 135; 25; 33; 207; 224; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0641 :
  cduToSmuFramePack_fun [21; 177; 56; 20; 28; 249; 136]
  = [22; 235; 149; 204; 56; 3; 249; 68; 56; 20; 21; 28; 249; 136; 148; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0642 :
  cduToSmuFramePack_fun [32; 161; 170; 34; 3; 156; 31]
  = [33; 235; 149; 204; 56; 3; 249; 68; 170; 34; 32; 3; 156; 31; 32; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0643 :
  cduToSmuFramePack_fun [62; 66; 16; 253; 68; 82; 225]
  = [63; 235; 149; 204; 56; 3; 249; 68; 16; 253; 62; 68; 82; 225; 106; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0644 :
  cduToSmuFramePack_fun [9; 222; 132; 59; 95; 195; 66]
  = [10; 235; 149; 204; 56; 3; 249; 68; 132; 59; 9; 95; 195; 66; 76; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0645 :
  cduToSmuFramePack_fun [246; 49; 249; 52; 33; 200; 149]
  = [247; 235; 149; 204; 56; 3; 249; 68; 249; 52; 246; 33; 200; 149; 55; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0646 :
  cduToSmuFramePack_fun [254; 252; 110; 232; 55; 92; 91]
  = [255; 235; 149; 204; 56; 3; 249; 68; 110; 232; 254; 55; 92; 91; 190; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0647 :
  cduToSmuFramePack_fun [141; 224; 181; 119; 211; 82; 72]
  = [142; 235; 149; 204; 56; 3; 249; 68; 181; 119; 141; 211; 82; 72; 42; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0648 :
  cduToSmuFramePack_fun [194; 165; 101; 94; 232; 133; 123]
  = [195; 235; 149; 204; 56; 3; 249; 68; 101; 94; 194; 232; 133; 123; 171; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0649 :
  cduToSmuFramePack_fun [169; 216; 8; 11; 172; 24; 200]
  = [170; 235; 149; 204; 56; 3; 249; 68; 8; 11; 169; 172; 24; 200; 188; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0650 :
  cduToSmuFramePack_fun [17; 29; 250; 186; 38; 23; 37]
  = [18; 235; 149; 204; 56; 3; 249; 68; 250; 186; 17; 38; 23; 37; 213; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0651 :
  cduToSmuFramePack_fun [6; 102; 75; 19; 131; 74; 45]
  = [7; 235; 149; 204; 56; 3; 249; 68; 75; 19; 6; 131; 74; 45; 14; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0652 :
  cduToSmuFramePack_fun [150; 229; 109; 197; 138; 37; 81]
  = [151; 235; 149; 204; 56; 3; 249; 68; 109; 197; 150; 138; 37; 81; 134; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0653 :
  cduToSmuFramePack_fun [20; 227; 11; 72; 136; 176; 109]
  = [21; 235; 149; 204; 56; 3; 249; 68; 11; 72; 20; 136; 176; 109; 230; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0654 :
  cduToSmuFramePack_fun [180; 210; 239; 116; 215; 51; 175]
  = [181; 235; 149; 204; 56; 3; 249; 68; 239; 116; 180; 215; 51; 175; 152; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0655 :
  cduToSmuFramePack_fun [195; 185; 45; 145; 175; 143; 18]
  = [196; 235; 149; 204; 56; 3; 249; 68; 45; 145; 195; 175; 143; 18; 247; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0656 :
  cduToSmuFramePack_fun [3; 48; 81; 141; 95; 99; 96]
  = [4; 235; 149; 204; 56; 3; 249; 68; 81; 141; 3; 95; 99; 96; 167; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0657 :
  cduToSmuFramePack_fun [127; 15; 170; 176; 175; 156; 227]
  = [128; 235; 149; 204; 56; 3; 249; 68; 170; 176; 127; 175; 156; 227; 121; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0658 :
  cduToSmuFramePack_fun [54; 244; 229; 148; 169; 136; 22]
  = [55; 235; 149; 204; 56; 3; 249; 68; 229; 148; 54; 169; 136; 22; 226; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0659 :
  cduToSmuFramePack_fun [126; 210; 143; 16; 202; 2; 95]
  = [127; 235; 149; 204; 56; 3; 249; 68; 143; 16; 126; 202; 2; 95; 16; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0660 :
  cduToSmuFramePack_fun [146; 189; 64; 130; 254; 144; 51]
  = [147; 235; 149; 204; 56; 3; 249; 68; 64; 130; 146; 254; 144; 51; 3; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0661 :
  cduToSmuFramePack_fun [6; 240; 117; 134; 4; 126; 162]
  = [7; 235; 149; 204; 56; 3; 249; 68; 117; 134; 6; 4; 126; 162; 73; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0662 :
  cduToSmuFramePack_fun [215; 186; 165; 36; 76; 227; 24]
  = [216; 235; 149; 204; 56; 3; 249; 68; 165; 36; 215; 76; 227; 24; 255; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0663 :
  cduToSmuFramePack_fun [124; 204; 222; 171; 40; 119; 197]
  = [125; 235; 149; 204; 56; 3; 249; 68; 222; 171; 124; 40; 119; 197; 133; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0664 :
  cduToSmuFramePack_fun [189; 154; 115; 36; 219; 75; 182]
  = [190; 235; 149; 204; 56; 3; 249; 68; 115; 36; 189; 219; 75; 182; 8; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0665 :
  cduToSmuFramePack_fun [6; 25; 88; 173; 156; 255; 120]
  = [7; 235; 149; 204; 56; 3; 249; 68; 88; 173; 6; 156; 255; 120; 4; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0666 :
  cduToSmuFramePack_fun [159; 14; 221; 28; 55; 163; 219]
  = [160; 235; 149; 204; 56; 3; 249; 68; 221; 28; 159; 55; 163; 219; 205; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0667 :
  cduToSmuFramePack_fun [168; 243; 228; 25; 15; 77; 219]
  = [169; 235; 149; 204; 56; 3; 249; 68; 228; 25; 168; 15; 77; 219; 214; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0668 :
  cduToSmuFramePack_fun [153; 0; 214; 32; 247; 8; 126]
  = [154; 235; 149; 204; 56; 3; 249; 68; 214; 32; 153; 247; 8; 126; 80; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0669 :
  cduToSmuFramePack_fun [17; 190; 83; 204; 175; 20; 42]
  = [18; 235; 149; 204; 56; 3; 249; 68; 83; 204; 17; 175; 20; 42; 253; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0670 :
  cduToSmuFramePack_fun [124; 73; 149; 65; 51; 145; 67]
  = [125; 235; 149; 204; 56; 3; 249; 68; 149; 65; 124; 51; 145; 67; 159; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0671 :
  cduToSmuFramePack_fun [46; 208; 69; 156; 0; 162; 61]
  = [47; 235; 149; 204; 56; 3; 249; 68; 69; 156; 46; 0; 162; 61; 210; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0672 :
  cduToSmuFramePack_fun [74; 6; 132; 79; 254; 119; 27]
  = [75; 235; 149; 204; 56; 3; 249; 68; 132; 79; 74; 254; 119; 27; 157; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0673 :
  cduToSmuFramePack_fun [56; 165; 62; 53; 141; 69; 69]
  = [57; 235; 149; 204; 56; 3; 249; 68; 62; 53; 56; 141; 69; 69; 0; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0674 :
  cduToSmuFramePack_fun [112; 32; 211; 155; 125; 224; 162]
  = [113; 235; 149; 204; 56; 3; 249; 68; 211; 155; 112; 125; 224; 162; 97; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0675 :
  cduToSmuFramePack_fun [59; 200; 164; 57; 70; 194; 243]
  = [60; 235; 149; 204; 56; 3; 249; 68; 164; 57; 59; 70; 194; 243; 103; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0676 :
  cduToSmuFramePack_fun [115; 166; 236; 53; 26; 220; 67]
  = [116; 235; 149; 204; 56; 3; 249; 68; 236; 53; 115; 26; 220; 67; 253; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0677 :
  cduToSmuFramePack_fun [56; 54; 62; 136; 82; 59; 168]
  = [57; 235; 149; 204; 56; 3; 249; 68; 62; 136; 56; 82; 59; 168; 131; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0678 :
  cduToSmuFramePack_fun [220; 129; 173; 190; 64; 175; 56]
  = [221; 235; 149; 204; 56; 3; 249; 68; 173; 190; 220; 64; 175; 56; 164; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0679 :
  cduToSmuFramePack_fun [179; 38; 28; 234; 37; 138; 208]
  = [180; 235; 149; 204; 56; 3; 249; 68; 28; 234; 179; 37; 138; 208; 104; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0680 :
  cduToSmuFramePack_fun [97; 41; 188; 120; 180; 135; 190]
  = [98; 235; 149; 204; 56; 3; 249; 68; 188; 120; 97; 180; 135; 190; 148; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0681 :
  cduToSmuFramePack_fun [151; 229; 115; 6; 79; 97; 152]
  = [152; 235; 149; 204; 56; 3; 249; 68; 115; 6; 151; 79; 97; 152; 22; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0682 :
  cduToSmuFramePack_fun [182; 183; 174; 133; 96; 206; 233]
  = [183; 235; 149; 204; 56; 3; 249; 68; 174; 133; 182; 96; 206; 233; 66; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0683 :
  cduToSmuFramePack_fun [149; 146; 159; 73; 30; 143; 64]
  = [150; 235; 149; 204; 56; 3; 249; 68; 159; 73; 149; 30; 143; 64; 178; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0684 :
  cduToSmuFramePack_fun [238; 9; 57; 14; 179; 219; 200]
  = [239; 235; 149; 204; 56; 3; 249; 68; 57; 14; 238; 179; 219; 200; 81; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0685 :
  cduToSmuFramePack_fun [151; 77; 195; 97; 90; 165; 69]
  = [152; 235; 149; 204; 56; 3; 249; 68; 195; 97; 151; 90; 165; 69; 13; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0686 :
  cduToSmuFramePack_fun [187; 196; 6; 82; 114; 236; 195]
  = [188; 235; 149; 204; 56; 3; 249; 68; 6; 82; 187; 114; 236; 195; 192; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0687 :
  cduToSmuFramePack_fun [252; 1; 45; 9; 58; 27; 105]
  = [253; 235; 149; 204; 56; 3; 249; 68; 45; 9; 252; 58; 27; 105; 38; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0688 :
  cduToSmuFramePack_fun [200; 6; 61; 249; 204; 111; 128]
  = [201; 235; 149; 204; 56; 3; 249; 68; 61; 249; 200; 204; 111; 128; 169; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0689 :
  cduToSmuFramePack_fun [44; 242; 242; 0; 51; 22; 214]
  = [45; 235; 149; 204; 56; 3; 249; 68; 242; 0; 44; 51; 22; 214; 69; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0690 :
  cduToSmuFramePack_fun [239; 235; 212; 166; 130; 111; 22]
  = [240; 235; 149; 204; 56; 3; 249; 68; 212; 166; 239; 130; 111; 22; 218; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0691 :
  cduToSmuFramePack_fun [132; 229; 125; 77; 96; 69; 90]
  = [133; 235; 149; 204; 56; 3; 249; 68; 125; 77; 132; 96; 69; 90; 11; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0692 :
  cduToSmuFramePack_fun [229; 173; 166; 167; 53; 230; 214]
  = [230; 235; 149; 204; 56; 3; 249; 68; 166; 167; 229; 53; 230; 214; 241; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0693 :
  cduToSmuFramePack_fun [206; 39; 30; 253; 39; 5; 191]
  = [207; 235; 149; 204; 56; 3; 249; 68; 30; 253; 206; 39; 5; 191; 246; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0694 :
  cduToSmuFramePack_fun [55; 29; 9; 78; 24; 181; 33]
  = [56; 235; 149; 204; 56; 3; 249; 68; 9; 78; 55; 24; 181; 33; 42; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0695 :
  cduToSmuFramePack_fun [43; 227; 235; 31; 144; 202; 115]
  = [44; 235; 149; 204; 56; 3; 249; 68; 235; 31; 43; 144; 202; 115; 220; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0696 :
  cduToSmuFramePack_fun [55; 211; 76; 37; 126; 15; 43]
  = [56; 235; 149; 204; 56; 3; 249; 68; 76; 37; 55; 126; 15; 43; 26; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0697 :
  cduToSmuFramePack_fun [148; 216; 169; 134; 151; 84; 89]
  = [149; 235; 149; 204; 56; 3; 249; 68; 169; 134; 148; 151; 84; 89; 123; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0698 :
  cduToSmuFramePack_fun [17; 6; 202; 15; 167; 190; 160]
  = [18; 235; 149; 204; 56; 3; 249; 68; 202; 15; 17; 167; 190; 160; 223; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0699 :
  cduToSmuFramePack_fun [149; 227; 16; 35; 224; 144; 244]
  = [150; 235; 149; 204; 56; 3; 249; 68; 16; 35; 149; 224; 144; 244; 6; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0700 :
  cduToSmuFramePack_fun [218; 209; 92; 146; 190; 159; 233]
  = [219; 235; 149; 204; 56; 3; 249; 68; 92; 146; 218; 190; 159; 233; 228; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0701 :
  cduToSmuFramePack_fun [128; 214; 225; 233; 7; 106; 63]
  = [129; 235; 149; 204; 56; 3; 249; 68; 225; 233; 128; 7; 106; 63; 138; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0702 :
  cduToSmuFramePack_fun [129; 121; 65; 243; 228; 179; 89]
  = [130; 235; 149; 204; 56; 3; 249; 68; 65; 243; 129; 228; 179; 89; 75; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0703 :
  cduToSmuFramePack_fun [41; 97; 67; 144; 41; 14; 233]
  = [42; 235; 149; 204; 56; 3; 249; 68; 67; 144; 41; 41; 14; 233; 18; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0704 :
  cduToSmuFramePack_fun [25; 4; 18; 144; 171; 49; 138]
  = [26; 235; 149; 204; 56; 3; 249; 68; 18; 144; 25; 171; 49; 138; 45; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0705 :
  cduToSmuFramePack_fun [165; 133; 255; 87; 112; 31; 27]
  = [166; 235; 149; 204; 56; 3; 249; 68; 255; 87; 165; 112; 31; 27; 163; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0706 :
  cduToSmuFramePack_fun [254; 254; 221; 86; 38; 70; 33]
  = [255; 235; 149; 204; 56; 3; 249; 68; 221; 86; 254; 38; 70; 33; 30; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0707 :
  cduToSmuFramePack_fun [249; 31; 158; 196; 31; 89; 18]
  = [250; 235; 149; 204; 56; 3; 249; 68; 158; 196; 249; 31; 89; 18; 119; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0708 :
  cduToSmuFramePack_fun [170; 104; 86; 225; 132; 128; 69]
  = [171; 235; 149; 204; 56; 3; 249; 68; 86; 225; 170; 132; 128; 69; 190; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0709 :
  cduToSmuFramePack_fun [121; 204; 195; 81; 77; 144; 124]
  = [122; 235; 149; 204; 56; 3; 249; 68; 195; 81; 121; 77; 144; 124; 2; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0710 :
  cduToSmuFramePack_fun [206; 165; 206; 175; 91; 18; 223]
  = [207; 235; 149; 204; 56; 3; 249; 68; 206; 175; 206; 91; 18; 223; 213; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0711 :
  cduToSmuFramePack_fun [179; 188; 48; 203; 117; 78; 112]
  = [180; 235; 149; 204; 56; 3; 249; 68; 48; 203; 179; 117; 78; 112; 221; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0712 :
  cduToSmuFramePack_fun [7; 101; 255; 55; 8; 102; 221]
  = [8; 235; 149; 204; 56; 3; 249; 68; 255; 55; 7; 8; 102; 221; 70; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0713 :
  cduToSmuFramePack_fun [92; 84; 49; 237; 52; 179; 233]
  = [93; 235; 149; 204; 56; 3; 249; 68; 49; 237; 92; 52; 179; 233; 246; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0714 :
  cduToSmuFramePack_fun [236; 3; 79; 233; 96; 214; 2]
  = [237; 235; 149; 204; 56; 3; 249; 68; 79; 233; 236; 96; 214; 2; 118; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0715 :
  cduToSmuFramePack_fun [42; 163; 253; 178; 17; 231; 23]
  = [43; 235; 149; 204; 56; 3; 249; 68; 253; 178; 42; 17; 231; 23; 66; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0716 :
  cduToSmuFramePack_fun [114; 65; 192; 136; 170; 100; 234]
  = [115; 235; 149; 204; 56; 3; 249; 68; 192; 136; 114; 170; 100; 234; 104; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0717 :
  cduToSmuFramePack_fun [252; 5; 189; 131; 205; 11; 103]
  = [253; 235; 149; 204; 56; 3; 249; 68; 189; 131; 252; 205; 11; 103; 121; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0718 :
  cduToSmuFramePack_fun [236; 10; 155; 162; 220; 159; 223]
  = [237; 235; 149; 204; 56; 3; 249; 68; 155; 162; 236; 220; 159; 223; 59; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0719 :
  cduToSmuFramePack_fun [233; 243; 99; 226; 107; 211; 153]
  = [234; 235; 149; 204; 56; 3; 249; 68; 99; 226; 233; 107; 211; 153; 255; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0720 :
  cduToSmuFramePack_fun [124; 207; 201; 107; 66; 149; 199]
  = [125; 235; 149; 204; 56; 3; 249; 68; 201; 107; 124; 66; 149; 199; 64; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0721 :
  cduToSmuFramePack_fun [133; 63; 75; 138; 103; 116; 106]
  = [134; 235; 149; 204; 56; 3; 249; 68; 75; 138; 133; 103; 116; 106; 113; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0722 :
  cduToSmuFramePack_fun [61; 187; 105; 154; 145; 155; 150]
  = [62; 235; 149; 204; 56; 3; 249; 68; 105; 154; 61; 145; 155; 150; 12; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0723 :
  cduToSmuFramePack_fun [185; 52; 208; 55; 104; 154; 67]
  = [186; 235; 149; 204; 56; 3; 249; 68; 208; 55; 185; 104; 154; 67; 113; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0724 :
  cduToSmuFramePack_fun [148; 54; 150; 50; 196; 156; 221]
  = [149; 235; 149; 204; 56; 3; 249; 68; 150; 50; 148; 196; 156; 221; 233; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0725 :
  cduToSmuFramePack_fun [40; 175; 150; 174; 107; 107; 210]
  = [41; 235; 149; 204; 56; 3; 249; 68; 150; 174; 40; 107; 107; 210; 198; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0726 :
  cduToSmuFramePack_fun [169; 21; 8; 31; 22; 63; 131]
  = [170; 235; 149; 204; 56; 3; 249; 68; 8; 31; 169; 22; 63; 131; 198; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0727 :
  cduToSmuFramePack_fun [118; 143; 241; 198; 100; 145; 204]
  = [119; 235; 149; 204; 56; 3; 249; 68; 241; 198; 118; 100; 145; 204; 96; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0728 :
  cduToSmuFramePack_fun [217; 55; 42; 0; 149; 22; 15]
  = [218; 235; 149; 204; 56; 3; 249; 68; 42; 0; 217; 149; 22; 15; 255; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0729 :
  cduToSmuFramePack_fun [181; 181; 35; 98; 196; 98; 120]
  = [182; 235; 149; 204; 56; 3; 249; 68; 35; 98; 181; 196; 98; 120; 54; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0730 :
  cduToSmuFramePack_fun [33; 24; 222; 166; 147; 58; 124]
  = [34; 235; 149; 204; 56; 3; 249; 68; 222; 166; 33; 147; 58; 124; 226; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0731 :
  cduToSmuFramePack_fun [148; 234; 127; 225; 40; 13; 133]
  = [149; 235; 149; 204; 56; 3; 249; 68; 127; 225; 148; 40; 13; 133; 38; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0732 :
  cduToSmuFramePack_fun [38; 87; 102; 88; 4; 172; 229]
  = [39; 235; 149; 204; 56; 3; 249; 68; 102; 88; 38; 4; 172; 229; 251; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0733 :
  cduToSmuFramePack_fun [22; 244; 137; 55; 224; 142; 125]
  = [23; 235; 149; 204; 56; 3; 249; 68; 137; 55; 22; 224; 142; 125; 173; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0734 :
  cduToSmuFramePack_fun [57; 63; 51; 134; 101; 117; 155]
  = [58; 235; 149; 204; 56; 3; 249; 68; 51; 134; 57; 101; 117; 155; 57; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0735 :
  cduToSmuFramePack_fun [8; 97; 102; 243; 216; 230; 46]
  = [9; 235; 149; 204; 56; 3; 249; 68; 102; 243; 8; 216; 230; 46; 67; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0736 :
  cduToSmuFramePack_fun [177; 152; 33; 4; 109; 231; 52]
  = [178; 235; 149; 204; 56; 3; 249; 68; 33; 4; 177; 109; 231; 52; 82; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0737 :
  cduToSmuFramePack_fun [43; 242; 155; 36; 201; 239; 243]
  = [44; 235; 149; 204; 56; 3; 249; 68; 155; 36; 43; 201; 239; 243; 157; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0738 :
  cduToSmuFramePack_fun [104; 210; 228; 4; 151; 186; 14]
  = [105; 235; 149; 204; 56; 3; 249; 68; 228; 4; 104; 151; 186; 14; 119; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0739 :
  cduToSmuFramePack_fun [126; 0; 160; 73; 178; 189; 245]
  = [127; 235; 149; 204; 56; 3; 249; 68; 160; 73; 126; 178; 189; 245; 15; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0740 :
  cduToSmuFramePack_fun [147; 25; 146; 223; 127; 47; 197]
  = [148; 235; 149; 204; 56; 3; 249; 68; 146; 223; 147; 127; 47; 197; 93; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0741 :
  cduToSmuFramePack_fun [26; 19; 55; 217; 233; 224; 133]
  = [27; 235; 149; 204; 56; 3; 249; 68; 55; 217; 26; 233; 224; 133; 178; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0742 :
  cduToSmuFramePack_fun [225; 85; 125; 233; 102; 77; 44]
  = [226; 235; 149; 204; 56; 3; 249; 68; 125; 233; 225; 102; 77; 44; 196; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0743 :
  cduToSmuFramePack_fun [47; 127; 154; 151; 178; 156; 71]
  = [48; 235; 149; 204; 56; 3; 249; 68; 154; 151; 47; 178; 156; 71; 71; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0744 :
  cduToSmuFramePack_fun [166; 78; 15; 129; 115; 184; 106]
  = [167; 235; 149; 204; 56; 3; 249; 68; 15; 129; 166; 115; 184; 106; 203; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0745 :
  cduToSmuFramePack_fun [95; 126; 34; 216; 134; 4; 225]
  = [96; 235; 149; 204; 56; 3; 249; 68; 34; 216; 95; 134; 4; 225; 36; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0746 :
  cduToSmuFramePack_fun [198; 60; 172; 61; 147; 178; 37]
  = [199; 235; 149; 204; 56; 3; 249; 68; 172; 61; 198; 147; 178; 37; 21; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0747 :
  cduToSmuFramePack_fun [251; 123; 135; 128; 188; 126; 140]
  = [252; 235; 149; 204; 56; 3; 249; 68; 135; 128; 251; 188; 126; 140; 82; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0748 :
  cduToSmuFramePack_fun [253; 254; 160; 170; 169; 94; 238]
  = [254; 235; 149; 204; 56; 3; 249; 68; 160; 170; 253; 169; 94; 238; 156; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0749 :
  cduToSmuFramePack_fun [247; 114; 108; 124; 253; 79; 208]
  = [248; 235; 149; 204; 56; 3; 249; 68; 108; 124; 247; 253; 79; 208; 3; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0750 :
  cduToSmuFramePack_fun [187; 20; 170; 132; 6; 169; 230]
  = [188; 235; 149; 204; 56; 3; 249; 68; 170; 132; 187; 6; 169; 230; 170; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0751 :
  cduToSmuFramePack_fun [232; 73; 204; 210; 176; 4; 21]
  = [233; 235; 149; 204; 56; 3; 249; 68; 204; 210; 232; 176; 4; 21; 149; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0752 :
  cduToSmuFramePack_fun [117; 116; 159; 160; 119; 104; 175]
  = [118; 235; 149; 204; 56; 3; 249; 68; 159; 160; 117; 119; 104; 175; 46; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0753 :
  cduToSmuFramePack_fun [49; 204; 186; 213; 154; 232; 168]
  = [50; 235; 149; 204; 56; 3; 249; 68; 186; 213; 49; 154; 232; 168; 6; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0754 :
  cduToSmuFramePack_fun [157; 89; 97; 207; 243; 185; 143]
  = [158; 235; 149; 204; 56; 3; 249; 68; 97; 207; 157; 243; 185; 143; 110; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0755 :
  cduToSmuFramePack_fun [4; 213; 161; 75; 221; 212; 199]
  = [5; 235; 149; 204; 56; 3; 249; 68; 161; 75; 4; 221; 212; 199; 6; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0756 :
  cduToSmuFramePack_fun [178; 151; 153; 161; 49; 241; 1]
  = [179; 235; 149; 204; 56; 3; 249; 68; 153; 161; 178; 49; 241; 1; 17; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0757 :
  cduToSmuFramePack_fun [81; 147; 89; 59; 181; 170; 116]
  = [82; 235; 149; 204; 56; 3; 249; 68; 89; 59; 81; 181; 170; 116; 242; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0758 :
  cduToSmuFramePack_fun [241; 85; 45; 114; 22; 144; 64]
  = [242; 235; 149; 204; 56; 3; 249; 68; 45; 114; 241; 22; 144; 64; 20; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0759 :
  cduToSmuFramePack_fun [208; 20; 86; 12; 57; 7; 190]
  = [209; 235; 149; 204; 56; 3; 249; 68; 86; 12; 208; 57; 7; 190; 92; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0760 :
  cduToSmuFramePack_fun [125; 134; 213; 16; 130; 165; 49]
  = [126; 235; 149; 204; 56; 3; 249; 68; 213; 16; 125; 130; 165; 49; 170; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0761 :
  cduToSmuFramePack_fun [161; 42; 207; 83; 176; 112; 0]
  = [162; 235; 149; 204; 56; 3; 249; 68; 207; 83; 161; 176; 112; 0; 219; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0762 :
  cduToSmuFramePack_fun [45; 65; 157; 129; 5; 227; 187]
  = [46; 235; 149; 204; 56; 3; 249; 68; 157; 129; 45; 5; 227; 187; 164; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0763 :
  cduToSmuFramePack_fun [175; 193; 250; 253; 10; 198; 112]
  = [176; 235; 149; 204; 56; 3; 249; 68; 250; 253; 175; 10; 198; 112; 156; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0764 :
  cduToSmuFramePack_fun [7; 0; 141; 95; 63; 249; 127]
  = [8; 235; 149; 204; 56; 3; 249; 68; 141; 95; 7; 63; 249; 127; 238; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0765 :
  cduToSmuFramePack_fun [90; 239; 89; 150; 104; 224; 184]
  = [91; 235; 149; 204; 56; 3; 249; 68; 89; 150; 90; 104; 224; 184; 123; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0766 :
  cduToSmuFramePack_fun [135; 150; 231; 131; 111; 6; 215]
  = [136; 235; 149; 204; 56; 3; 249; 68; 231; 131; 135; 111; 6; 215; 77; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0767 :
  cduToSmuFramePack_fun [25; 54; 200; 7; 205; 31; 5]
  = [26; 235; 149; 204; 56; 3; 249; 68; 200; 7; 25; 205; 31; 5; 41; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0768 :
  cduToSmuFramePack_fun [74; 50; 37; 95; 213; 231; 122]
  = [75; 235; 149; 204; 56; 3; 249; 68; 37; 95; 74; 213; 231; 122; 140; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0769 :
  cduToSmuFramePack_fun [148; 43; 12; 109; 22; 228; 10]
  = [149; 235; 149; 204; 56; 3; 249; 68; 12; 109; 148; 22; 228; 10; 251; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0770 :
  cduToSmuFramePack_fun [248; 255; 106; 2; 131; 191; 229]
  = [249; 235; 149; 204; 56; 3; 249; 68; 106; 2; 248; 131; 191; 229; 221; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0771 :
  cduToSmuFramePack_fun [78; 193; 99; 196; 86; 86; 248]
  = [79; 235; 149; 204; 56; 3; 249; 68; 99; 196; 78; 86; 86; 248; 207; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0772 :
  cduToSmuFramePack_fun [254; 107; 18; 93; 34; 163; 142]
  = [255; 235; 149; 204; 56; 3; 249; 68; 18; 93; 254; 34; 163; 142; 42; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0773 :
  cduToSmuFramePack_fun [207; 35; 78; 189; 124; 91; 56]
  = [208; 235; 149; 204; 56; 3; 249; 68; 78; 189; 207; 124; 91; 56; 67; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0774 :
  cduToSmuFramePack_fun [239; 33; 93; 56; 191; 232; 106]
  = [240; 235; 149; 204; 56; 3; 249; 68; 93; 56; 239; 191; 232; 106; 11; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0775 :
  cduToSmuFramePack_fun [178; 92; 69; 178; 113; 103; 252]
  = [179; 235; 149; 204; 56; 3; 249; 68; 69; 178; 178; 113; 103; 252; 185; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0776 :
  cduToSmuFramePack_fun [7; 170; 87; 223; 65; 176; 78]
  = [8; 235; 149; 204; 56; 3; 249; 68; 87; 223; 7; 65; 176; 78; 116; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0777 :
  cduToSmuFramePack_fun [106; 91; 157; 220; 68; 137; 72]
  = [107; 235; 149; 204; 56; 3; 249; 68; 157; 220; 106; 68; 137; 72; 66; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0778 :
  cduToSmuFramePack_fun [100; 231; 33; 4; 157; 131; 171]
  = [101; 235; 149; 204; 56; 3; 249; 68; 33; 4; 100; 157; 131; 171; 246; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0779 :
  cduToSmuFramePack_fun [2; 41; 67; 149; 55; 149; 9]
  = [3; 235; 149; 204; 56; 3; 249; 68; 67; 149; 2; 55; 149; 9; 181; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0780 :
  cduToSmuFramePack_fun [45; 211; 194; 77; 82; 229; 215]
  = [46; 235; 149; 204; 56; 3; 249; 68; 194; 77; 45; 82; 229; 215; 4; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0781 :
  cduToSmuFramePack_fun [179; 92; 202; 213; 250; 241; 92]
  = [180; 235; 149; 204; 56; 3; 249; 68; 202; 213; 179; 250; 241; 92; 213; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0782 :
  cduToSmuFramePack_fun [153; 8; 206; 29; 14; 145; 206]
  = [154; 235; 149; 204; 56; 3; 249; 68; 206; 29; 153; 14; 145; 206; 197; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0783 :
  cduToSmuFramePack_fun [153; 189; 120; 40; 113; 200; 139]
  = [154; 235; 149; 204; 56; 3; 249; 68; 120; 40; 153; 113; 200; 139; 235; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0784 :
  cduToSmuFramePack_fun [239; 183; 155; 77; 7; 247; 56]
  = [240; 235; 149; 204; 56; 3; 249; 68; 155; 77; 239; 7; 247; 56; 79; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0785 :
  cduToSmuFramePack_fun [155; 103; 39; 220; 139; 192; 221]
  = [156; 235; 149; 204; 56; 3; 249; 68; 39; 220; 155; 139; 192; 221; 104; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0786 :
  cduToSmuFramePack_fun [241; 8; 246; 51; 111; 29; 248]
  = [242; 235; 149; 204; 56; 3; 249; 68; 246; 51; 241; 111; 29; 248; 114; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0787 :
  cduToSmuFramePack_fun [225; 227; 18; 154; 11; 237; 164]
  = [226; 235; 149; 204; 56; 3; 249; 68; 18; 154; 225; 11; 237; 164; 3; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0788 :
  cduToSmuFramePack_fun [107; 192; 201; 95; 243; 124; 164]
  = [108; 235; 149; 204; 56; 3; 249; 68; 201; 95; 107; 243; 124; 164; 106; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0789 :
  cduToSmuFramePack_fun [37; 193; 58; 20; 215; 149; 16]
  = [38; 235; 149; 204; 56; 3; 249; 68; 58; 20; 37; 215; 149; 16; 165; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0790 :
  cduToSmuFramePack_fun [224; 163; 214; 172; 177; 186; 231]
  = [225; 235; 149; 204; 56; 3; 249; 68; 214; 172; 224; 177; 186; 231; 14; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0791 :
  cduToSmuFramePack_fun [83; 188; 218; 90; 238; 219; 136]
  = [84; 235; 149; 204; 56; 3; 249; 68; 218; 90; 83; 238; 219; 136; 212; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0792 :
  cduToSmuFramePack_fun [143; 150; 96; 36; 102; 179; 187]
  = [144; 235; 149; 204; 56; 3; 249; 68; 96; 36; 143; 102; 179; 187; 247; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0793 :
  cduToSmuFramePack_fun [64; 251; 72; 58; 235; 228; 56]
  = [65; 235; 149; 204; 56; 3; 249; 68; 72; 58; 64; 235; 228; 56; 83; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0794 :
  cduToSmuFramePack_fun [13; 65; 111; 138; 78; 117; 31]
  = [14; 235; 149; 204; 56; 3; 249; 68; 111; 138; 13; 78; 117; 31; 158; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0795 :
  cduToSmuFramePack_fun [92; 223; 61; 74; 152; 153; 213]
  = [93; 235; 149; 204; 56; 3; 249; 68; 61; 74; 92; 152; 153; 213; 251; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0796 :
  cduToSmuFramePack_fun [83; 243; 61; 81; 67; 164; 127]
  = [84; 235; 149; 204; 56; 3; 249; 68; 61; 81; 83; 67; 164; 127; 65; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0797 :
  cduToSmuFramePack_fun [219; 188; 81; 185; 148; 13; 190]
  = [220; 235; 149; 204; 56; 3; 249; 68; 81; 185; 219; 148; 13; 190; 64; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0798 :
  cduToSmuFramePack_fun [215; 85; 166; 132; 168; 49; 204]
  = [216; 235; 149; 204; 56; 3; 249; 68; 166; 132; 215; 168; 49; 204; 68; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0799 :
  cduToSmuFramePack_fun [199; 29; 136; 158; 125; 228; 128]
  = [200; 235; 149; 204; 56; 3; 249; 68; 136; 158; 199; 125; 228; 128; 124; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0800 :
  cduToSmuFramePack_fun [123; 64; 209; 153; 186; 198; 173]
  = [124; 235; 149; 204; 56; 3; 249; 68; 209; 153; 123; 186; 198; 173; 214; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0801 :
  cduToSmuFramePack_fun [170; 87; 28; 25; 86; 144; 87]
  = [171; 235; 149; 204; 56; 3; 249; 68; 28; 25; 170; 86; 144; 87; 158; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0802 :
  cduToSmuFramePack_fun [57; 184; 138; 104; 16; 234; 167]
  = [58; 235; 149; 204; 56; 3; 249; 68; 138; 104; 57; 16; 234; 167; 0; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0803 :
  cduToSmuFramePack_fun [76; 69; 78; 96; 137; 146; 1]
  = [77; 235; 149; 204; 56; 3; 249; 68; 78; 96; 76; 137; 146; 1; 148; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0804 :
  cduToSmuFramePack_fun [143; 209; 95; 55; 142; 11; 177]
  = [144; 235; 149; 204; 56; 3; 249; 68; 95; 55; 143; 142; 11; 177; 69; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0805 :
  cduToSmuFramePack_fun [179; 39; 80; 74; 130; 61; 210]
  = [180; 235; 149; 204; 56; 3; 249; 68; 80; 74; 179; 130; 61; 210; 0; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0806 :
  cduToSmuFramePack_fun [107; 246; 66; 73; 52; 246; 55]
  = [108; 235; 149; 204; 56; 3; 249; 68; 66; 73; 107; 52; 246; 55; 39; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0807 :
  cduToSmuFramePack_fun [140; 46; 218; 22; 41; 112; 202]
  = [141; 235; 149; 204; 56; 3; 249; 68; 218; 22; 140; 41; 112; 202; 159; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0808 :
  cduToSmuFramePack_fun [220; 169; 144; 208; 144; 179; 124]
  = [221; 235; 149; 204; 56; 3; 249; 68; 144; 208; 220; 144; 179; 124; 1; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0809 :
  cduToSmuFramePack_fun [58; 233; 255; 169; 255; 107; 149]
  = [59; 235; 149; 204; 56; 3; 249; 68; 255; 169; 58; 255; 107; 149; 103; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0810 :
  cduToSmuFramePack_fun [241; 95; 218; 66; 181; 60; 80]
  = [242; 235; 149; 204; 56; 3; 249; 68; 218; 66; 241; 181; 60; 80; 96; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0811 :
  cduToSmuFramePack_fun [51; 248; 72; 20; 67; 148; 66]
  = [52; 235; 149; 204; 56; 3; 249; 68; 72; 20; 51; 67; 148; 66; 92; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0812 :
  cduToSmuFramePack_fun [145; 95; 137; 179; 75; 26; 88]
  = [146; 235; 149; 204; 56; 3; 249; 68; 137; 179; 145; 75; 26; 88; 156; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0813 :
  cduToSmuFramePack_fun [188; 45; 25; 17; 212; 239; 76]
  = [189; 235; 149; 204; 56; 3; 249; 68; 25; 17; 188; 212; 239; 76; 195; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0814 :
  cduToSmuFramePack_fun [127; 47; 250; 134; 156; 128; 134]
  = [128; 235; 149; 204; 56; 3; 249; 68; 250; 134; 127; 156; 128; 134; 83; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0815 :
  cduToSmuFramePack_fun [147; 215; 223; 42; 30; 127; 125]
  = [148; 235; 149; 204; 56; 3; 249; 68; 223; 42; 147; 30; 127; 125; 56; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0816 :
  cduToSmuFramePack_fun [242; 180; 41; 190; 27; 77; 26]
  = [243; 235; 149; 204; 56; 3; 249; 68; 41; 190; 242; 27; 77; 26; 199; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0817 :
  cduToSmuFramePack_fun [58; 63; 168; 25; 71; 204; 166]
  = [59; 235; 149; 204; 56; 3; 249; 68; 168; 25; 58; 71; 204; 166; 134; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0818 :
  cduToSmuFramePack_fun [167; 61; 99; 142; 100; 193; 222]
  = [168; 235; 149; 204; 56; 3; 249; 68; 99; 142; 167; 100; 193; 222; 137; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0819 :
  cduToSmuFramePack_fun [16; 214; 6; 141; 186; 99; 175]
  = [17; 235; 149; 204; 56; 3; 249; 68; 6; 141; 16; 186; 99; 175; 255; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0820 :
  cduToSmuFramePack_fun [23; 128; 161; 90; 104; 109; 220]
  = [24; 235; 149; 204; 56; 3; 249; 68; 161; 90; 23; 104; 109; 220; 7; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0821 :
  cduToSmuFramePack_fun [30; 15; 126; 11; 99; 238; 72]
  = [31; 235; 149; 204; 56; 3; 249; 68; 126; 11; 30; 99; 238; 72; 178; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0822 :
  cduToSmuFramePack_fun [124; 150; 14; 7; 29; 200; 249]
  = [125; 235; 149; 204; 56; 3; 249; 68; 14; 7; 124; 29; 200; 249; 127; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0823 :
  cduToSmuFramePack_fun [116; 121; 85; 24; 88; 10; 176]
  = [117; 235; 149; 204; 56; 3; 249; 68; 85; 24; 116; 88; 10; 176; 153; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0824 :
  cduToSmuFramePack_fun [94; 118; 12; 253; 79; 13; 238]
  = [95; 235; 149; 204; 56; 3; 249; 68; 12; 253; 94; 79; 13; 238; 129; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0825 :
  cduToSmuFramePack_fun [75; 184; 133; 85; 65; 48; 20]
  = [76; 235; 149; 204; 56; 3; 249; 68; 133; 85; 75; 65; 48; 20; 222; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0826 :
  cduToSmuFramePack_fun [240; 64; 188; 203; 74; 198; 180]
  = [241; 235; 149; 204; 56; 3; 249; 68; 188; 203; 240; 74; 198; 180; 255; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0827 :
  cduToSmuFramePack_fun [7; 118; 51; 228; 1; 107; 84]
  = [8; 235; 149; 204; 56; 3; 249; 68; 51; 228; 7; 1; 107; 84; 174; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0828 :
  cduToSmuFramePack_fun [122; 234; 92; 39; 8; 32; 162]
  = [123; 235; 149; 204; 56; 3; 249; 68; 92; 39; 122; 8; 32; 162; 63; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0829 :
  cduToSmuFramePack_fun [25; 189; 221; 209; 89; 11; 14]
  = [26; 235; 149; 204; 56; 3; 249; 68; 221; 209; 25; 89; 11; 14; 39; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0830 :
  cduToSmuFramePack_fun [161; 227; 91; 245; 116; 199; 233]
  = [162; 235; 149; 204; 56; 3; 249; 68; 91; 245; 161; 116; 199; 233; 239; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0831 :
  cduToSmuFramePack_fun [114; 246; 100; 47; 9; 183; 148]
  = [115; 235; 149; 204; 56; 3; 249; 68; 100; 47; 114; 9; 183; 148; 41; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0832 :
  cduToSmuFramePack_fun [241; 91; 159; 24; 132; 56; 90]
  = [242; 235; 149; 204; 56; 3; 249; 68; 159; 24; 241; 132; 56; 90; 8; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0833 :
  cduToSmuFramePack_fun [20; 243; 224; 36; 45; 135; 94]
  = [21; 235; 149; 204; 56; 3; 249; 68; 224; 36; 20; 45; 135; 94; 36; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0834 :
  cduToSmuFramePack_fun [94; 34; 128; 239; 150; 34; 124]
  = [95; 235; 149; 204; 56; 3; 249; 68; 128; 239; 94; 150; 34; 124; 105; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0835 :
  cduToSmuFramePack_fun [201; 62; 153; 95; 39; 0; 24]
  = [202; 235; 149; 204; 56; 3; 249; 68; 153; 95; 201; 39; 0; 24; 224; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0836 :
  cduToSmuFramePack_fun [231; 71; 216; 117; 137; 180; 234]
  = [232; 235; 149; 204; 56; 3; 249; 68; 216; 117; 231; 137; 180; 234; 189; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0837 :
  cduToSmuFramePack_fun [153; 177; 141; 76; 80; 117; 158]
  = [154; 235; 149; 204; 56; 3; 249; 68; 141; 76; 153; 80; 117; 158; 107; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0838 :
  cduToSmuFramePack_fun [211; 182; 214; 212; 118; 42; 146]
  = [212; 235; 149; 204; 56; 3; 249; 68; 214; 212; 211; 118; 42; 146; 255; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0839 :
  cduToSmuFramePack_fun [223; 107; 26; 25; 0; 66; 143]
  = [224; 235; 149; 204; 56; 3; 249; 68; 26; 25; 223; 0; 66; 143; 77; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0840 :
  cduToSmuFramePack_fun [114; 168; 57; 65; 106; 118; 243]
  = [115; 235; 149; 204; 56; 3; 249; 68; 57; 65; 114; 106; 118; 243; 211; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0841 :
  cduToSmuFramePack_fun [15; 127; 174; 29; 14; 160; 225]
  = [16; 235; 149; 204; 56; 3; 249; 68; 174; 29; 15; 14; 160; 225; 187; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0842 :
  cduToSmuFramePack_fun [53; 29; 98; 41; 91; 80; 208]
  = [54; 235; 149; 204; 56; 3; 249; 68; 98; 41; 53; 91; 80; 208; 233; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0843 :
  cduToSmuFramePack_fun [2; 205; 11; 106; 198; 215; 220]
  = [3; 235; 149; 204; 56; 3; 249; 68; 11; 106; 2; 198; 215; 220; 254; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0844 :
  cduToSmuFramePack_fun [43; 177; 222; 239; 207; 83; 182]
  = [44; 235; 149; 204; 56; 3; 249; 68; 222; 239; 43; 207; 83; 182; 102; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0845 :
  cduToSmuFramePack_fun [149; 246; 65; 75; 16; 33; 30]
  = [150; 235; 149; 204; 56; 3; 249; 68; 65; 75; 149; 16; 33; 30; 64; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0846 :
  cduToSmuFramePack_fun [8; 142; 251; 46; 161; 212; 242]
  = [9; 235; 149; 204; 56; 3; 249; 68; 251; 46; 8; 161; 212; 242; 24; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0847 :
  cduToSmuFramePack_fun [22; 176; 225; 150; 14; 80; 236]
  = [23; 235; 149; 204; 56; 3; 249; 68; 225; 150; 22; 14; 80; 236; 123; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0848 :
  cduToSmuFramePack_fun [109; 81; 176; 127; 39; 204; 237]
  = [110; 235; 149; 204; 56; 3; 249; 68; 176; 127; 109; 39; 204; 237; 82; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0849 :
  cduToSmuFramePack_fun [203; 255; 104; 241; 54; 145; 25]
  = [204; 235; 149; 204; 56; 3; 249; 68; 104; 241; 203; 54; 145; 25; 86; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0850 :
  cduToSmuFramePack_fun [13; 45; 119; 235; 238; 58; 200]
  = [14; 235; 149; 204; 56; 3; 249; 68; 119; 235; 13; 238; 58; 200; 45; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0851 :
  cduToSmuFramePack_fun [255; 193; 6; 0; 24; 166; 140]
  = [0; 235; 149; 204; 56; 3; 249; 68; 6; 0; 255; 24; 166; 140; 5; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0852 :
  cduToSmuFramePack_fun [185; 41; 74; 21; 224; 249; 235]
  = [186; 235; 149; 204; 56; 3; 249; 68; 74; 21; 185; 224; 249; 235; 226; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0853 :
  cduToSmuFramePack_fun [185; 134; 76; 248; 40; 203; 15]
  = [186; 235; 149; 204; 56; 3; 249; 68; 76; 248; 185; 40; 203; 15; 239; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0854 :
  cduToSmuFramePack_fun [251; 35; 151; 246; 6; 212; 19]
  = [252; 235; 149; 204; 56; 3; 249; 68; 151; 246; 251; 6; 212; 19; 207; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0855 :
  cduToSmuFramePack_fun [180; 22; 135; 172; 65; 83; 227]
  = [181; 235; 149; 204; 56; 3; 249; 68; 135; 172; 180; 65; 83; 227; 110; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0856 :
  cduToSmuFramePack_fun [105; 211; 48; 35; 66; 40; 110]
  = [106; 235; 149; 204; 56; 3; 249; 68; 48; 35; 105; 66; 40; 110; 78; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0857 :
  cduToSmuFramePack_fun [219; 196; 57; 167; 99; 139; 124]
  = [220; 235; 149; 204; 56; 3; 249; 68; 57; 167; 219; 99; 139; 124; 177; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0858 :
  cduToSmuFramePack_fun [134; 33; 146; 19; 241; 205; 112]
  = [135; 235; 149; 204; 56; 3; 249; 68; 146; 19; 134; 241; 205; 112; 207; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0859 :
  cduToSmuFramePack_fun [17; 57; 17; 243; 158; 81; 1]
  = [18; 235; 149; 204; 56; 3; 249; 68; 17; 243; 17; 158; 81; 1; 43; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0860 :
  cduToSmuFramePack_fun [87; 32; 161; 169; 86; 97; 254]
  = [88; 235; 149; 204; 56; 3; 249; 68; 161; 169; 87; 86; 97; 254; 218; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0861 :
  cduToSmuFramePack_fun [72; 181; 170; 5; 41; 29; 5]
  = [73; 235; 149; 204; 56; 3; 249; 68; 170; 5; 72; 41; 29; 5; 160; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0862 :
  cduToSmuFramePack_fun [227; 15; 90; 146; 130; 178; 114]
  = [228; 235; 149; 204; 56; 3; 249; 68; 90; 146; 227; 130; 178; 114; 231; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0863 :
  cduToSmuFramePack_fun [101; 165; 132; 244; 219; 80; 154]
  = [102; 235; 149; 204; 56; 3; 249; 68; 132; 244; 101; 219; 80; 154; 224; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0864 :
  cduToSmuFramePack_fun [124; 172; 173; 66; 71; 149; 78]
  = [125; 235; 149; 204; 56; 3; 249; 68; 173; 66; 124; 71; 149; 78; 113; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0865 :
  cduToSmuFramePack_fun [69; 23; 51; 209; 142; 210; 145]
  = [70; 235; 149; 204; 56; 3; 249; 68; 51; 209; 69; 142; 210; 145; 60; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0866 :
  cduToSmuFramePack_fun [42; 48; 106; 244; 50; 43; 111]
  = [43; 235; 149; 204; 56; 3; 249; 68; 106; 244; 42; 50; 43; 111; 248; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0867 :
  cduToSmuFramePack_fun [111; 105; 190; 9; 186; 194; 19]
  = [112; 235; 149; 204; 56; 3; 249; 68; 190; 9; 111; 186; 194; 19; 75; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0868 :
  cduToSmuFramePack_fun [226; 251; 243; 134; 7; 74; 238]
  = [227; 235; 149; 204; 56; 3; 249; 68; 243; 134; 226; 7; 74; 238; 36; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0869 :
  cduToSmuFramePack_fun [190; 45; 3; 108; 68; 16; 252]
  = [191; 235; 149; 204; 56; 3; 249; 68; 3; 108; 190; 68; 16; 252; 75; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0870 :
  cduToSmuFramePack_fun [113; 220; 217; 159; 148; 159; 40]
  = [114; 235; 149; 204; 56; 3; 249; 68; 217; 159; 113; 148; 159; 40; 128; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0871 :
  cduToSmuFramePack_fun [142; 96; 85; 230; 89; 35; 92]
  = [143; 235; 149; 204; 56; 3; 249; 68; 85; 230; 142; 89; 35; 92; 165; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0872 :
  cduToSmuFramePack_fun [33; 96; 212; 234; 113; 154; 192]
  = [34; 235; 149; 204; 56; 3; 249; 68; 212; 234; 33; 113; 154; 192; 174; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0873 :
  cduToSmuFramePack_fun [255; 39; 84; 83; 237; 151; 204]
  = [0; 235; 149; 204; 56; 3; 249; 68; 84; 83; 255; 237; 151; 204; 24; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0874 :
  cduToSmuFramePack_fun [251; 19; 2; 129; 91; 162; 172]
  = [252; 235; 149; 204; 56; 3; 249; 68; 2; 129; 251; 91; 162; 172; 97; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0875 :
  cduToSmuFramePack_fun [248; 169; 3; 5; 92; 72; 158]
  = [249; 235; 149; 204; 56; 3; 249; 68; 3; 5; 248; 92; 72; 158; 72; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0876 :
  cduToSmuFramePack_fun [20; 79; 151; 145; 195; 177; 114]
  = [21; 235; 149; 204; 56; 3; 249; 68; 151; 145; 20; 195; 177; 114; 20; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0877 :
  cduToSmuFramePack_fun [159; 62; 207; 185; 220; 118; 113]
  = [160; 235; 149; 204; 56; 3; 249; 68; 207; 185; 159; 220; 118; 113; 202; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0878 :
  cduToSmuFramePack_fun [46; 136; 35; 237; 25; 52; 80]
  = [47; 235; 149; 204; 56; 3; 249; 68; 35; 237; 46; 25; 52; 80; 175; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0879 :
  cduToSmuFramePack_fun [62; 221; 44; 164; 140; 119; 249]
  = [63; 235; 149; 204; 56; 3; 249; 68; 44; 164; 62; 140; 119; 249; 56; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0880 :
  cduToSmuFramePack_fun [187; 129; 240; 23; 132; 255; 111]
  = [188; 235; 149; 204; 56; 3; 249; 68; 240; 23; 187; 132; 255; 111; 234; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0881 :
  cduToSmuFramePack_fun [98; 184; 252; 235; 178; 204; 76]
  = [99; 235; 149; 204; 56; 3; 249; 68; 252; 235; 98; 178; 204; 76; 71; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0882 :
  cduToSmuFramePack_fun [62; 137; 68; 165; 112; 169; 6]
  = [63; 235; 149; 204; 56; 3; 249; 68; 68; 165; 62; 112; 169; 6; 12; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0883 :
  cduToSmuFramePack_fun [133; 19; 141; 2; 14; 52; 199]
  = [134; 235; 149; 204; 56; 3; 249; 68; 141; 2; 133; 14; 52; 199; 87; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0884 :
  cduToSmuFramePack_fun [37; 43; 119; 165; 95; 137; 30]
  = [38; 235; 149; 204; 56; 3; 249; 68; 119; 165; 37; 95; 137; 30; 49; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0885 :
  cduToSmuFramePack_fun [63; 10; 103; 130; 232; 224; 122]
  = [64; 235; 149; 204; 56; 3; 249; 68; 103; 130; 63; 232; 224; 122; 34; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0886 :
  cduToSmuFramePack_fun [248; 126; 127; 247; 82; 195; 95]
  = [249; 235; 149; 204; 56; 3; 249; 68; 127; 247; 248; 82; 195; 95; 66; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0887 :
  cduToSmuFramePack_fun [100; 28; 216; 127; 179; 86; 84]
  = [101; 235; 149; 204; 56; 3; 249; 68; 216; 127; 100; 179; 86; 84; 212; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0888 :
  cduToSmuFramePack_fun [72; 240; 206; 202; 197; 54; 30]
  = [73; 235; 149; 204; 56; 3; 249; 68; 206; 202; 72; 197; 54; 30; 29; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0889 :
  cduToSmuFramePack_fun [201; 224; 222; 21; 88; 61; 174]
  = [202; 235; 149; 204; 56; 3; 249; 68; 222; 21; 201; 88; 61; 174; 3; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0890 :
  cduToSmuFramePack_fun [41; 190; 71; 101; 145; 174; 88]
  = [42; 235; 149; 204; 56; 3; 249; 68; 71; 101; 41; 145; 174; 88; 76; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0891 :
  cduToSmuFramePack_fun [43; 126; 129; 227; 168; 253; 147]
  = [44; 235; 149; 204; 56; 3; 249; 68; 129; 227; 43; 168; 253; 147; 39; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0892 :
  cduToSmuFramePack_fun [194; 217; 208; 206; 158; 181; 15]
  = [195; 235; 149; 204; 56; 3; 249; 68; 208; 206; 194; 158; 181; 15; 40; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0893 :
  cduToSmuFramePack_fun [186; 46; 153; 89; 243; 66; 152]
  = [187; 235; 149; 204; 56; 3; 249; 68; 153; 89; 186; 243; 66; 152; 57; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0894 :
  cduToSmuFramePack_fun [241; 71; 174; 10; 126; 107; 117]
  = [242; 235; 149; 204; 56; 3; 249; 68; 174; 10; 241; 126; 107; 117; 105; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0895 :
  cduToSmuFramePack_fun [81; 228; 202; 171; 130; 81; 126]
  = [82; 235; 149; 204; 56; 3; 249; 68; 202; 171; 81; 130; 81; 126; 227; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0896 :
  cduToSmuFramePack_fun [9; 91; 178; 179; 60; 44; 45]
  = [10; 235; 149; 204; 56; 3; 249; 68; 178; 179; 9; 60; 44; 45; 77; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0897 :
  cduToSmuFramePack_fun [84; 76; 21; 63; 55; 68; 220]
  = [85; 235; 149; 204; 56; 3; 249; 68; 21; 63; 84; 55; 68; 220; 27; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0898 :
  cduToSmuFramePack_fun [253; 32; 34; 247; 215; 52; 82]
  = [254; 235; 149; 204; 56; 3; 249; 68; 34; 247; 253; 215; 52; 82; 247; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0899 :
  cduToSmuFramePack_fun [15; 169; 34; 6; 186; 127; 3]
  = [16; 235; 149; 204; 56; 3; 249; 68; 34; 6; 15; 186; 127; 3; 121; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0900 :
  cduToSmuFramePack_fun [61; 14; 84; 153; 163; 252; 158]
  = [62; 235; 149; 204; 56; 3; 249; 68; 84; 153; 61; 163; 252; 158; 231; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0901 :
  cduToSmuFramePack_fun [8; 181; 165; 81; 63; 48; 38]
  = [9; 235; 149; 204; 56; 3; 249; 68; 165; 81; 8; 63; 48; 38; 241; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0902 :
  cduToSmuFramePack_fun [55; 5; 108; 166; 182; 20; 131]
  = [56; 235; 149; 204; 56; 3; 249; 68; 108; 166; 55; 182; 20; 131; 148; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0903 :
  cduToSmuFramePack_fun [163; 57; 88; 162; 63; 172; 121]
  = [164; 235; 149; 204; 56; 3; 249; 68; 88; 162; 163; 63; 172; 121; 39; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0904 :
  cduToSmuFramePack_fun [131; 87; 40; 71; 66; 189; 232]
  = [132; 235; 149; 204; 56; 3; 249; 68; 40; 71; 131; 66; 189; 232; 91; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0905 :
  cduToSmuFramePack_fun [70; 115; 64; 75; 118; 178; 93]
  = [71; 235; 149; 204; 56; 3; 249; 68; 64; 75; 70; 118; 178; 93; 80; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0906 :
  cduToSmuFramePack_fun [52; 173; 147; 110; 172; 11; 216]
  = [53; 235; 149; 204; 56; 3; 249; 68; 147; 110; 52; 172; 11; 216; 146; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0907 :
  cduToSmuFramePack_fun [35; 103; 165; 57; 244; 119; 148]
  = [36; 235; 149; 204; 56; 3; 249; 68; 165; 57; 35; 244; 119; 148; 162; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0908 :
  cduToSmuFramePack_fun [245; 199; 110; 144; 21; 35; 66]
  = [246; 235; 149; 204; 56; 3; 249; 68; 110; 144; 245; 21; 35; 66; 207; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0909 :
  cduToSmuFramePack_fun [179; 205; 180; 41; 39; 165; 242]
  = [180; 235; 149; 204; 56; 3; 249; 68; 180; 41; 179; 39; 165; 242; 92; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0910 :
  cduToSmuFramePack_fun [121; 58; 239; 34; 207; 57; 230]
  = [122; 235; 149; 204; 56; 3; 249; 68; 239; 34; 121; 207; 57; 230; 144; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0911 :
  cduToSmuFramePack_fun [102; 15; 26; 208; 63; 83; 84]
  = [103; 235; 149; 204; 56; 3; 249; 68; 26; 208; 102; 63; 83; 84; 168; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0912 :
  cduToSmuFramePack_fun [3; 187; 9; 137; 131; 137; 6]
  = [4; 235; 149; 204; 56; 3; 249; 68; 9; 137; 3; 131; 137; 6; 177; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0913 :
  cduToSmuFramePack_fun [222; 223; 23; 245; 211; 126; 181]
  = [223; 235; 149; 204; 56; 3; 249; 68; 23; 245; 222; 211; 126; 181; 2; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0914 :
  cduToSmuFramePack_fun [242; 184; 66; 171; 155; 194; 208]
  = [243; 235; 149; 204; 56; 3; 249; 68; 66; 171; 242; 155; 194; 208; 64; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0915 :
  cduToSmuFramePack_fun [222; 92; 197; 138; 108; 138; 183]
  = [223; 235; 149; 204; 56; 3; 249; 68; 197; 138; 222; 108; 138; 183; 22; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0916 :
  cduToSmuFramePack_fun [107; 212; 78; 26; 231; 22; 94]
  = [108; 235; 149; 204; 56; 3; 249; 68; 78; 26; 107; 231; 22; 94; 218; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0917 :
  cduToSmuFramePack_fun [76; 151; 221; 32; 77; 168; 239]
  = [77; 235; 149; 204; 56; 3; 249; 68; 221; 32; 76; 77; 168; 239; 47; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0918 :
  cduToSmuFramePack_fun [126; 171; 150; 4; 30; 62; 52]
  = [127; 235; 149; 204; 56; 3; 249; 68; 150; 4; 126; 30; 62; 52; 146; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0919 :
  cduToSmuFramePack_fun [6; 166; 6; 123; 230; 136; 164]
  = [7; 235; 149; 204; 56; 3; 249; 68; 6; 123; 6; 230; 136; 164; 201; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0920 :
  cduToSmuFramePack_fun [162; 202; 251; 215; 128; 95; 210]
  = [163; 235; 149; 204; 56; 3; 249; 68; 251; 215; 162; 128; 95; 210; 93; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0921 :
  cduToSmuFramePack_fun [29; 120; 129; 17; 37; 179; 122]
  = [30; 235; 149; 204; 56; 3; 249; 68; 129; 17; 29; 37; 179; 122; 181; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0922 :
  cduToSmuFramePack_fun [21; 159; 170; 190; 220; 250; 213]
  = [22; 235; 149; 204; 56; 3; 249; 68; 170; 190; 21; 220; 250; 213; 186; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0923 :
  cduToSmuFramePack_fun [246; 44; 237; 38; 197; 46; 27]
  = [247; 235; 149; 204; 56; 3; 249; 68; 237; 38; 246; 197; 46; 27; 243; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0924 :
  cduToSmuFramePack_fun [112; 238; 51; 89; 196; 136; 90]
  = [113; 235; 149; 204; 56; 3; 249; 68; 51; 89; 112; 196; 136; 90; 226; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0925 :
  cduToSmuFramePack_fun [231; 210; 148; 9; 0; 76; 249]
  = [232; 235; 149; 204; 56; 3; 249; 68; 148; 9; 231; 0; 76; 249; 145; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0926 :
  cduToSmuFramePack_fun [240; 166; 66; 10; 203; 154; 89]
  = [241; 235; 149; 204; 56; 3; 249; 68; 66; 10; 240; 203; 154; 89; 42; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0927 :
  cduToSmuFramePack_fun [248; 137; 35; 95; 126; 8; 84]
  = [249; 235; 149; 204; 56; 3; 249; 68; 35; 95; 248; 126; 8; 84; 26; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0928 :
  cduToSmuFramePack_fun [226; 132; 23; 253; 134; 254; 72]
  = [227; 235; 149; 204; 56; 3; 249; 68; 23; 253; 226; 134; 254; 72; 206; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0929 :
  cduToSmuFramePack_fun [166; 200; 201; 108; 198; 182; 207]
  = [167; 235; 149; 204; 56; 3; 249; 68; 201; 108; 166; 198; 182; 207; 122; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0930 :
  cduToSmuFramePack_fun [187; 83; 54; 245; 18; 243; 10]
  = [188; 235; 149; 204; 56; 3; 249; 68; 54; 245; 187; 18; 243; 10; 175; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0931 :
  cduToSmuFramePack_fun [33; 118; 223; 152; 149; 0; 235]
  = [34; 235; 149; 204; 56; 3; 249; 68; 223; 152; 33; 149; 0; 235; 232; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0932 :
  cduToSmuFramePack_fun [213; 137; 19; 30; 80; 131; 62]
  = [214; 235; 149; 204; 56; 3; 249; 68; 19; 30; 213; 80; 131; 62; 221; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0933 :
  cduToSmuFramePack_fun [92; 221; 135; 189; 2; 154; 32]
  = [93; 235; 149; 204; 56; 3; 249; 68; 135; 189; 92; 2; 154; 32; 138; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0934 :
  cduToSmuFramePack_fun [72; 96; 132; 66; 243; 112; 32]
  = [73; 235; 149; 204; 56; 3; 249; 68; 132; 66; 72; 243; 112; 32; 149; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0935 :
  cduToSmuFramePack_fun [146; 186; 209; 147; 146; 202; 94]
  = [147; 235; 149; 204; 56; 3; 249; 68; 209; 147; 146; 146; 202; 94; 200; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0936 :
  cduToSmuFramePack_fun [29; 198; 207; 102; 229; 56; 115]
  = [30; 235; 149; 204; 56; 3; 249; 68; 207; 102; 29; 229; 56; 115; 82; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0937 :
  cduToSmuFramePack_fun [161; 225; 172; 38; 163; 100; 40]
  = [162; 235; 149; 204; 56; 3; 249; 68; 172; 38; 161; 163; 100; 40; 152; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0938 :
  cduToSmuFramePack_fun [204; 132; 203; 192; 251; 76; 238]
  = [205; 235; 149; 204; 56; 3; 249; 68; 203; 192; 204; 251; 76; 238; 152; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0939 :
  cduToSmuFramePack_fun [123; 216; 28; 182; 78; 182; 157]
  = [124; 235; 149; 204; 56; 3; 249; 68; 28; 182; 123; 78; 182; 157; 98; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0940 :
  cduToSmuFramePack_fun [216; 254; 7; 90; 156; 68; 63]
  = [217; 235; 149; 204; 56; 3; 249; 68; 7; 90; 216; 156; 68; 63; 184; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0941 :
  cduToSmuFramePack_fun [10; 120; 63; 250; 174; 212; 219]
  = [11; 235; 149; 204; 56; 3; 249; 68; 63; 250; 10; 174; 212; 219; 84; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0942 :
  cduToSmuFramePack_fun [122; 243; 133; 180; 33; 98; 252]
  = [123; 235; 149; 204; 56; 3; 249; 68; 133; 180; 122; 33; 98; 252; 44; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0943 :
  cduToSmuFramePack_fun [241; 239; 95; 77; 38; 48; 192]
  = [242; 235; 149; 204; 56; 3; 249; 68; 95; 77; 241; 38; 48; 192; 229; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0944 :
  cduToSmuFramePack_fun [13; 6; 48; 130; 83; 217; 249]
  = [14; 235; 149; 204; 56; 3; 249; 68; 48; 130; 13; 83; 217; 249; 212; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0945 :
  cduToSmuFramePack_fun [104; 105; 117; 196; 54; 184; 219]
  = [105; 235; 149; 204; 56; 3; 249; 68; 117; 196; 104; 54; 184; 219; 240; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0946 :
  cduToSmuFramePack_fun [35; 200; 69; 178; 54; 95; 67]
  = [36; 235; 149; 204; 56; 3; 249; 68; 69; 178; 35; 54; 95; 67; 70; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0947 :
  cduToSmuFramePack_fun [48; 195; 200; 9; 240; 172; 76]
  = [49; 235; 149; 204; 56; 3; 249; 68; 200; 9; 48; 240; 172; 76; 131; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0948 :
  cduToSmuFramePack_fun [152; 83; 155; 132; 92; 211; 217]
  = [153; 235; 149; 204; 56; 3; 249; 68; 155; 132; 152; 92; 211; 217; 121; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0949 :
  cduToSmuFramePack_fun [199; 57; 134; 63; 159; 198; 22]
  = [200; 235; 149; 204; 56; 3; 249; 68; 134; 63; 199; 159; 198; 22; 45; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0950 :
  cduToSmuFramePack_fun [105; 220; 150; 114; 17; 108; 57]
  = [106; 235; 149; 204; 56; 3; 249; 68; 150; 114; 105; 17; 108; 57; 99; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0951 :
  cduToSmuFramePack_fun [0; 34; 126; 29; 112; 249; 160]
  = [1; 235; 149; 204; 56; 3; 249; 68; 126; 29; 0; 112; 249; 160; 12; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0952 :
  cduToSmuFramePack_fun [222; 58; 161; 19; 228; 75; 113]
  = [223; 235; 149; 204; 56; 3; 249; 68; 161; 19; 222; 228; 75; 113; 74; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0953 :
  cduToSmuFramePack_fun [222; 125; 198; 27; 9; 232; 121]
  = [223; 235; 149; 204; 56; 3; 249; 68; 198; 27; 222; 9; 232; 121; 151; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0954 :
  cduToSmuFramePack_fun [163; 11; 61; 147; 121; 166; 67]
  = [164; 235; 149; 204; 56; 3; 249; 68; 61; 147; 163; 121; 166; 67; 127; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0955 :
  cduToSmuFramePack_fun [50; 110; 181; 43; 70; 197; 183]
  = [51; 235; 149; 204; 56; 3; 249; 68; 181; 43; 50; 70; 197; 183; 20; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0956 :
  cduToSmuFramePack_fun [202; 70; 61; 27; 29; 110; 154]
  = [203; 235; 149; 204; 56; 3; 249; 68; 61; 27; 202; 29; 110; 154; 183; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0957 :
  cduToSmuFramePack_fun [71; 138; 231; 107; 192; 167; 32]
  = [72; 235; 149; 204; 56; 3; 249; 68; 231; 107; 71; 192; 167; 32; 216; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0958 :
  cduToSmuFramePack_fun [20; 202; 178; 147; 253; 68; 0]
  = [21; 235; 149; 204; 56; 3; 249; 68; 178; 147; 20; 253; 68; 0; 210; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0959 :
  cduToSmuFramePack_fun [183; 191; 190; 87; 209; 134; 46]
  = [184; 235; 149; 204; 56; 3; 249; 68; 190; 87; 183; 209; 134; 46; 35; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0960 :
  cduToSmuFramePack_fun [171; 59; 254; 25; 237; 101; 227]
  = [172; 235; 149; 204; 56; 3; 249; 68; 254; 25; 171; 237; 101; 227; 1; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0961 :
  cduToSmuFramePack_fun [94; 83; 66; 23; 75; 156; 126]
  = [95; 235; 149; 204; 56; 3; 249; 68; 66; 23; 94; 75; 156; 126; 214; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0962 :
  cduToSmuFramePack_fun [195; 168; 68; 49; 216; 108; 116]
  = [196; 235; 149; 204; 56; 3; 249; 68; 68; 49; 195; 216; 108; 116; 4; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0963 :
  cduToSmuFramePack_fun [178; 180; 230; 123; 69; 20; 151]
  = [179; 235; 149; 204; 56; 3; 249; 68; 230; 123; 178; 69; 20; 151; 111; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0964 :
  cduToSmuFramePack_fun [204; 93; 12; 248; 162; 139; 95]
  = [205; 235; 149; 204; 56; 3; 249; 68; 12; 248; 204; 162; 139; 95; 138; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0965 :
  cduToSmuFramePack_fun [58; 14; 144; 184; 211; 1; 216]
  = [59; 235; 149; 204; 56; 3; 249; 68; 144; 184; 58; 211; 1; 216; 174; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0966 :
  cduToSmuFramePack_fun [177; 205; 29; 167; 218; 181; 61]
  = [178; 235; 149; 204; 56; 3; 249; 68; 29; 167; 177; 218; 181; 61; 79; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0967 :
  cduToSmuFramePack_fun [134; 164; 133; 107; 152; 147; 165]
  = [135; 235; 149; 204; 56; 3; 249; 68; 133; 107; 134; 152; 147; 165; 146; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0968 :
  cduToSmuFramePack_fun [244; 165; 248; 141; 166; 36; 15]
  = [245; 235; 149; 204; 56; 3; 249; 68; 248; 141; 244; 166; 36; 15; 144; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0969 :
  cduToSmuFramePack_fun [146; 209; 163; 70; 175; 249; 169]
  = [147; 235; 149; 204; 56; 3; 249; 68; 163; 70; 146; 175; 249; 169; 162; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0970 :
  cduToSmuFramePack_fun [161; 122; 182; 230; 24; 4; 169]
  = [162; 235; 149; 204; 56; 3; 249; 68; 182; 230; 161; 24; 4; 169; 154; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0971 :
  cduToSmuFramePack_fun [172; 222; 103; 176; 48; 27; 75]
  = [173; 235; 149; 204; 56; 3; 249; 68; 103; 176; 172; 48; 27; 75; 121; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0972 :
  cduToSmuFramePack_fun [187; 160; 64; 169; 72; 59; 255]
  = [188; 235; 149; 204; 56; 3; 249; 68; 64; 169; 187; 72; 59; 255; 170; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0973 :
  cduToSmuFramePack_fun [109; 195; 127; 55; 124; 230; 251]
  = [110; 235; 149; 204; 56; 3; 249; 68; 127; 55; 109; 124; 230; 251; 26; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0974 :
  cduToSmuFramePack_fun [75; 141; 201; 82; 200; 174; 222]
  = [76; 235; 149; 204; 56; 3; 249; 68; 201; 82; 75; 200; 174; 222; 72; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0975 :
  cduToSmuFramePack_fun [183; 112; 233; 110; 20; 139; 22]
  = [184; 235; 149; 204; 56; 3; 249; 68; 233; 110; 183; 20; 139; 22; 231; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0976 :
  cduToSmuFramePack_fun [236; 92; 232; 73; 18; 4; 88]
  = [237; 235; 149; 204; 56; 3; 249; 68; 232; 73; 236; 18; 4; 88; 199; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0977 :
  cduToSmuFramePack_fun [196; 6; 50; 167; 11; 153; 25]
  = [197; 235; 149; 204; 56; 3; 249; 68; 50; 167; 196; 11; 153; 25; 74; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0978 :
  cduToSmuFramePack_fun [198; 173; 175; 32; 32; 70; 41]
  = [199; 235; 149; 204; 56; 3; 249; 68; 175; 32; 198; 32; 70; 41; 242; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0979 :
  cduToSmuFramePack_fun [153; 122; 40; 203; 250; 87; 163]
  = [154; 235; 149; 204; 56; 3; 249; 68; 40; 203; 153; 250; 87; 163; 24; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0980 :
  cduToSmuFramePack_fun [100; 24; 136; 62; 27; 50; 0]
  = [101; 235; 149; 204; 56; 3; 249; 68; 136; 62; 100; 27; 50; 0; 107; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0981 :
  cduToSmuFramePack_fun [110; 39; 112; 155; 104; 129; 231]
  = [111; 235; 149; 204; 56; 3; 249; 68; 112; 155; 110; 104; 129; 231; 107; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0982 :
  cduToSmuFramePack_fun [48; 146; 250; 218; 223; 239; 52]
  = [49; 235; 149; 204; 56; 3; 249; 68; 250; 218; 48; 223; 239; 52; 78; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0983 :
  cduToSmuFramePack_fun [96; 153; 76; 163; 211; 167; 33]
  = [97; 235; 149; 204; 56; 3; 249; 68; 76; 163; 96; 211; 167; 33; 208; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0984 :
  cduToSmuFramePack_fun [18; 200; 73; 107; 187; 118; 212]
  = [19; 235; 149; 204; 56; 3; 249; 68; 73; 107; 18; 187; 118; 212; 31; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0985 :
  cduToSmuFramePack_fun [217; 248; 239; 93; 65; 193; 217]
  = [218; 235; 149; 204; 56; 3; 249; 68; 239; 93; 217; 65; 193; 217; 180; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0986 :
  cduToSmuFramePack_fun [15; 55; 234; 118; 117; 124; 217]
  = [16; 235; 149; 204; 56; 3; 249; 68; 234; 118; 15; 117; 124; 217; 123; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0987 :
  cduToSmuFramePack_fun [118; 66; 135; 208; 129; 237; 128]
  = [119; 235; 149; 204; 56; 3; 249; 68; 135; 208; 118; 129; 237; 128; 99; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0988 :
  cduToSmuFramePack_fun [224; 80; 75; 17; 132; 227; 236]
  = [225; 235; 149; 204; 56; 3; 249; 68; 75; 17; 224; 132; 227; 236; 115; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0989 :
  cduToSmuFramePack_fun [95; 160; 68; 97; 190; 198; 217]
  = [96; 235; 149; 204; 56; 3; 249; 68; 68; 97; 95; 190; 198; 217; 229; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0990 :
  cduToSmuFramePack_fun [71; 119; 142; 77; 172; 140; 248]
  = [72; 235; 149; 204; 56; 3; 249; 68; 142; 77; 71; 172; 140; 248; 20; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0991 :
  cduToSmuFramePack_fun [174; 157; 141; 232; 26; 27; 231]
  = [175; 235; 149; 204; 56; 3; 249; 68; 141; 232; 174; 26; 27; 231; 237; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0992 :
  cduToSmuFramePack_fun [5; 95; 78; 6; 39; 94; 144]
  = [6; 235; 149; 204; 56; 3; 249; 68; 78; 6; 5; 39; 94; 144; 128; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0993 :
  cduToSmuFramePack_fun [204; 216; 161; 132; 152; 36; 122]
  = [205; 235; 149; 204; 56; 3; 249; 68; 161; 132; 204; 152; 36; 122; 155; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0994 :
  cduToSmuFramePack_fun [68; 114; 221; 19; 207; 48; 172]
  = [69; 235; 149; 204; 56; 3; 249; 68; 221; 19; 68; 207; 48; 172; 231; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0995 :
  cduToSmuFramePack_fun [149; 126; 84; 22; 148; 45; 30]
  = [150; 235; 149; 204; 56; 3; 249; 68; 84; 22; 149; 148; 45; 30; 62; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0996 :
  cduToSmuFramePack_fun [4; 205; 19; 38; 46; 163; 75]
  = [5; 235; 149; 204; 56; 3; 249; 68; 19; 38; 4; 46; 163; 75; 103; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0997 :
  cduToSmuFramePack_fun [240; 189; 81; 0; 187; 40; 219]
  = [241; 235; 149; 204; 56; 3; 249; 68; 81; 0; 240; 187; 40; 219; 237; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0998 :
  cduToSmuFramePack_fun [111; 29; 235; 57; 23; 181; 131]
  = [112; 235; 149; 204; 56; 3; 249; 68; 235; 57; 111; 23; 181; 131; 144; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example t_0999 :
  cduToSmuFramePack_fun [194; 55; 170; 253; 223; 200; 89]
  = [195; 235; 149; 204; 56; 3; 249; 68; 170; 253; 194; 223; 200; 89; 171; 1; 1; 1; 1; 1017].
Proof. vm_compute. reflexivity. Qed.


Example negative_control_wrong_expected :
  cduToSmuFramePack_fun [0; 122; 103; 120; 121; 133; 110]
  <> [0; 235; 149; 204; 56; 3; 249; 68; 103; 120; 0; 121; 133; 110; 227; 1; 1; 1; 1; 1017].
Proof. vm_compute. discriminate. Qed.
