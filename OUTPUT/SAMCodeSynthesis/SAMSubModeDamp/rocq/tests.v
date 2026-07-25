(* 由 FloatTest/tools/emit_tests.py 自动生成，请勿手改。
 * 每条约 1000 条向量一条 vm_compute 定理；coqc 编译通过即差分测试通过。 *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.
Require Import OUTPUT.SAMCodeSynthesis.SAMSubModeDamp.rocq.spec.

Import ListNotations.
Local Open Scope Z_scope.


Example t_0000 :
  samSubModeDamp_fun (f32 (1046286009)) (f32 (3179405805)) (f32 (3158234167)) 20 345 12 20 262
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0001 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 3 0 13 20 215
  = (3, 1, 14).
Proof. vm_compute. reflexivity. Qed.


Example t_0002 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 57 0 11 15 145
  = (57, 1, 11).
Proof. vm_compute. reflexivity. Qed.


Example t_0003 :
  samSubModeDamp_fun (f32 (3196626903)) (f32 (3192704205)) (f32 (1046351895)) 63 0 7 12 114
  = (63, 1, 7).
Proof. vm_compute. reflexivity. Qed.


Example t_0004 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 34 0 8 8 245
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0005 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3183739594)) (f32 (3191437066)) 28 0 18 18 194
  = (28, 1, 18).
Proof. vm_compute. reflexivity. Qed.


Example t_0006 :
  samSubModeDamp_fun (f32 (3179889500)) (f32 (1047442339)) (f32 (3183615964)) 57 104 0 5 104
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0007 :
  samSubModeDamp_fun (f32 (1018310055)) (f32 (3187739719)) (f32 (1041835717)) 38 116 0 12 117
  = (38, 117, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0008 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 1 0 7 18 222
  = (1, 1, 8).
Proof. vm_compute. reflexivity. Qed.


Example t_0009 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 67 0 1 19 254
  = (67, 1, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0010 :
  samSubModeDamp_fun (f32 (3197163461)) (f32 (1041671215)) (f32 (1049702298)) 22 4294967295 0 10 126
  = (22, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0011 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 60 0 4294967295 17 134
  = (60, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0012 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3163295869)) (f32 (1049473698)) 14 0 15 10 234
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0013 :
  samSubModeDamp_fun (f32 (1027417869)) (f32 (3195772830)) (f32 (3194785767)) 7 14 22 18 226
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0014 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 30 0 19 18 136
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0015 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 50 0 0 18 194
  = (50, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0016 :
  samSubModeDamp_fun (f32 (1040749599)) (f32 (3192704205)) (f32 (3124866264)) 22 0 7 12 256
  = (22, 1, 7).
Proof. vm_compute. reflexivity. Qed.


Example t_0017 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 33 0 7 7 164
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0018 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3197725947)) (f32 (1049377477)) 53 0 20 20 201
  = (53, 1, 20).
Proof. vm_compute. reflexivity. Qed.


Example t_0019 :
  samSubModeDamp_fun (f32 (3197406632)) (f32 (3194186370)) (f32 (1037803550)) 34 171 0 14 171
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0020 :
  samSubModeDamp_fun (f32 (3192236207)) (f32 (1045530934)) (f32 (3194875114)) 48 227 0 18 228
  = (48, 228, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0021 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 36 0 2 5 131
  = (36, 1, 3).
Proof. vm_compute. reflexivity. Qed.


Example t_0022 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 56 0 23 13 202
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0023 :
  samSubModeDamp_fun (f32 (3182552585)) (f32 (3191917588)) (f32 (1041119781)) 33 4294967295 0 12 250
  = (33, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0024 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 42 0 4294967295 8 273
  = (42, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0025 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3177687967)) (f32 (3196435442)) 57 0 16 11 195
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0026 :
  samSubModeDamp_fun (f32 (1047771198)) (f32 (3196545942)) (f32 (3196352539)) 41 240 19 8 217
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0027 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 64 0 0 7 113
  = (64, 1, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0028 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 11 0 15 7 166
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0029 :
  samSubModeDamp_fun (f32 (1013807334)) (f32 (3192704205)) (f32 (1040845867)) 64 0 16 11 286
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0030 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 71 0 12 12 194
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0031 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3154527793)) (f32 (3193066248)) 51 0 17 17 107
  = (51, 1, 17).
Proof. vm_compute. reflexivity. Qed.


Example t_0032 :
  samSubModeDamp_fun (f32 (1048213897)) (f32 (3187832878)) (f32 (3191923227)) 31 190 0 19 190
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0033 :
  samSubModeDamp_fun (f32 (3196295633)) (f32 (3192353763)) (f32 (1041555878)) 49 207 0 7 208
  = (49, 208, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0034 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 66 0 7 7 123
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0035 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 65 0 3 13 271
  = (65, 1, 3).
Proof. vm_compute. reflexivity. Qed.


Example t_0036 :
  samSubModeDamp_fun (f32 (3162217316)) (f32 (1033706782)) (f32 (3186021104)) 1 4294967295 0 13 124
  = (1, 0, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0037 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 70 0 4294967295 15 286
  = (70, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0038 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3191175997)) (f32 (3129649552)) 0 0 20 15 286
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0039 :
  samSubModeDamp_fun (f32 (3196169373)) (f32 (3189051950)) (f32 (3180983425)) 20 87 23 8 128
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0040 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 65 0 11 5 228
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0041 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 51 0 22 8 167
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0042 :
  samSubModeDamp_fun (f32 (3195023023)) (f32 (3192704205)) (f32 (1048793219)) 75 0 18 17 229
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0043 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 65 0 6 6 105
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0044 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3166126854)) (f32 (1040182768)) 2 0 13 13 169
  = (2, 1, 13).
Proof. vm_compute. reflexivity. Qed.


Example t_0045 :
  samSubModeDamp_fun (f32 (1031975694)) (f32 (3194508456)) (f32 (971662432)) 30 291 0 20 291
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0046 :
  samSubModeDamp_fun (f32 (3175219203)) (f32 (1013607212)) (f32 (1023832371)) 70 170 0 13 171
  = (70, 171, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0047 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 25 0 18 17 197
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0048 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 7 0 8 8 276
  = (7, 1, 8).
Proof. vm_compute. reflexivity. Qed.


Example t_0049 :
  samSubModeDamp_fun (f32 (1043143589)) (f32 (3194888212)) (f32 (3185561941)) 63 4294967295 0 15 231
  = (63, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0050 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 60 0 4294967295 10 145
  = (60, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0051 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1033361144)) (f32 (1027165920)) 74 0 20 15 248
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0052 :
  samSubModeDamp_fun (f32 (3186163156)) (f32 (3177576103)) (f32 (1041717988)) 46 337 22 6 206
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0053 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 40 0 25 7 119
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0054 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 52 0 2 18 149
  = (52, 1, 2).
Proof. vm_compute. reflexivity. Qed.


Example t_0055 :
  samSubModeDamp_fun (f32 (3195489602)) (f32 (3192704205)) (f32 (1046698787)) 71 0 18 14 167
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0056 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 5 0 20 20 175
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0057 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1049687210)) (f32 (1045098326)) 59 0 17 17 231
  = (59, 1, 17).
Proof. vm_compute. reflexivity. Qed.


Example t_0058 :
  samSubModeDamp_fun (f32 (1043178256)) (f32 (3186962498)) (f32 (1045173520)) 41 272 0 11 272
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0059 :
  samSubModeDamp_fun (f32 (3162861197)) (f32 (3197711691)) (f32 (3197208600)) 12 108 0 18 109
  = (12, 109, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0060 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 3 0 1 13 175
  = (3, 1, 2).
Proof. vm_compute. reflexivity. Qed.


Example t_0061 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 64 0 8 10 235
  = (64, 1, 8).
Proof. vm_compute. reflexivity. Qed.


Example t_0062 :
  samSubModeDamp_fun (f32 (3172663723)) (f32 (3179943430)) (f32 (1044121552)) 16 4294967295 0 5 105
  = (16, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0063 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 76 0 4294967295 16 219
  = (76, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0064 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3175777437)) (f32 (3196493706)) 53 0 25 20 294
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0065 :
  samSubModeDamp_fun (f32 (3191240168)) (f32 (3189563372)) (f32 (3196360614)) 23 0 17 10 224
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0066 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 11 0 25 5 116
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0067 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 40 0 18 14 215
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0068 :
  samSubModeDamp_fun (f32 (3192945979)) (f32 (3192704205)) (f32 (3197620844)) 50 0 5 19 207
  = (50, 1, 5).
Proof. vm_compute. reflexivity. Qed.


Example t_0069 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 54 0 5 5 230
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0070 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1002507721)) (f32 (3183903633)) 5 0 18 18 241
  = (5, 1, 18).
Proof. vm_compute. reflexivity. Qed.


Example t_0071 :
  samSubModeDamp_fun (f32 (1012352910)) (f32 (1005556382)) (f32 (3162344461)) 61 232 0 6 232
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0072 :
  samSubModeDamp_fun (f32 (3182001520)) (f32 (3182746016)) (f32 (3194053411)) 74 115 0 5 116
  = (74, 116, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0073 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 55 0 17 20 276
  = (55, 1, 18).
Proof. vm_compute. reflexivity. Qed.


Example t_0074 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 69 0 1 15 126
  = (69, 1, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0075 :
  samSubModeDamp_fun (f32 (1028936585)) (f32 (3196149553)) (f32 (1035159411)) 38 4294967295 0 18 135
  = (38, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0076 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 67 0 4294967295 20 235
  = (67, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0077 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3173498775)) (f32 (1030252637)) 38 0 22 17 294
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0078 :
  samSubModeDamp_fun (f32 (1040907600)) (f32 (3166363163)) (f32 (3185012696)) 37 16 15 19 112
  = (37, 17, 16).
Proof. vm_compute. reflexivity. Qed.


Example t_0079 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 72 0 4 14 270
  = (72, 1, 5).
Proof. vm_compute. reflexivity. Qed.


Example t_0080 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 48 0 11 9 294
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0081 :
  samSubModeDamp_fun (f32 (3191895703)) (f32 (3192704205)) (f32 (3170794389)) 30 0 17 12 271
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0082 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 21 0 5 5 123
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0083 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1028296024)) (f32 (3194632861)) 51 0 11 11 199
  = (51, 1, 11).
Proof. vm_compute. reflexivity. Qed.


Example t_0084 :
  samSubModeDamp_fun (f32 (3190922594)) (f32 (1048903950)) (f32 (1048566842)) 26 141 0 17 141
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0085 :
  samSubModeDamp_fun (f32 (3190613188)) (f32 (3185832681)) (f32 (3191199087)) 36 212 0 13 213
  = (36, 213, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0086 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 35 0 18 8 201
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0087 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 43 0 22 20 206
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0088 :
  samSubModeDamp_fun (f32 (3196915720)) (f32 (3191230450)) (f32 (3197003717)) 68 4294967295 0 6 280
  = (68, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0089 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 21 0 4294967295 6 262
  = (21, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0090 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3192799323)) (f32 (1046137684)) 72 0 22 17 258
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0091 :
  samSubModeDamp_fun (f32 (3162352137)) (f32 (3196067607)) (f32 (1023537675)) 43 329 25 6 115
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0092 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 68 0 10 10 207
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0093 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 17 0 21 7 194
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0094 :
  samSubModeDamp_fun (f32 (3192609383)) (f32 (3192704205)) (f32 (3192956233)) 49 0 9 5 131
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0095 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 38 0 6 6 214
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0096 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1035872860)) (f32 (3189081911)) 17 0 14 14 152
  = (17, 1, 14).
Proof. vm_compute. reflexivity. Qed.


Example t_0097 :
  samSubModeDamp_fun (f32 (3189095862)) (f32 (3191305287)) (f32 (3191372107)) 42 260 0 17 260
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0098 :
  samSubModeDamp_fun (f32 (1050117817)) (f32 (3195398262)) (f32 (1049078933)) 38 159 0 19 160
  = (38, 160, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0099 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 43 0 20 8 249
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0100 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 13 0 20 13 169
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0101 :
  samSubModeDamp_fun (f32 (3181893879)) (f32 (3188318595)) (f32 (3188270239)) 67 4294967295 0 11 234
  = (67, 0, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0102 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 55 0 4294967295 8 177
  = (55, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0103 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3188683006)) (f32 (1033818930)) 34 0 15 10 131
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0104 :
  samSubModeDamp_fun (f32 (3195700436)) (f32 (1025472752)) (f32 (1044710722)) 75 243 21 12 214
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0105 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 22 0 7 14 244
  = (22, 1, 8).
Proof. vm_compute. reflexivity. Qed.


Example t_0106 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 7 0 21 8 236
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0107 :
  samSubModeDamp_fun (f32 (1050147534)) (f32 (3192704205)) (f32 (3191352647)) 35 0 10 8 198
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0108 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 36 0 20 20 249
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0109 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3186305110)) (f32 (1041062549)) 66 0 17 17 140
  = (66, 1, 17).
Proof. vm_compute. reflexivity. Qed.


Example t_0110 :
  samSubModeDamp_fun (f32 (3185876363)) (f32 (1016725518)) (f32 (1033916805)) 44 274 0 14 274
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0111 :
  samSubModeDamp_fun (f32 (3196834777)) (f32 (1018578617)) (f32 (3197615388)) 49 109 0 12 110
  = (49, 110, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0112 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 77 0 5 15 217
  = (77, 1, 6).
Proof. vm_compute. reflexivity. Qed.


Example t_0113 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 3 0 25 6 134
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0114 :
  samSubModeDamp_fun (f32 (3193581442)) (f32 (3190036925)) (f32 (1038698106)) 23 4294967295 0 12 290
  = (23, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0115 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 14 0 4294967295 19 262
  = (14, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0116 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1036606144)) (f32 (3171664039)) 13 0 11 6 237
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0117 :
  samSubModeDamp_fun (f32 (3185062364)) (f32 (1043380514)) (f32 (3194114319)) 23 53 25 6 224
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0118 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 32 0 3 16 296
  = (32, 1, 4).
Proof. vm_compute. reflexivity. Qed.


Example t_0119 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 71 0 18 15 211
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0120 :
  samSubModeDamp_fun (f32 (3195933971)) (f32 (3192704205)) (f32 (1045926517)) 12 0 6 13 184
  = (12, 1, 6).
Proof. vm_compute. reflexivity. Qed.


Example t_0121 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 6 0 10 10 200
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0122 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1046504226)) (f32 (1048744369)) 51 0 11 11 288
  = (51, 1, 11).
Proof. vm_compute. reflexivity. Qed.


Example t_0123 :
  samSubModeDamp_fun (f32 (3172702454)) (f32 (3197709488)) (f32 (3185931014)) 63 228 0 13 228
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0124 :
  samSubModeDamp_fun (f32 (3192831525)) (f32 (1045922889)) (f32 (3189894623)) 47 154 0 17 155
  = (47, 155, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0125 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 4 0 24 17 127
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0126 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 32 0 3 10 103
  = (32, 1, 3).
Proof. vm_compute. reflexivity. Qed.


Example t_0127 :
  samSubModeDamp_fun (f32 (1038254820)) (f32 (1046012283)) (f32 (3187503788)) 66 4294967295 0 20 178
  = (66, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0128 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 16 0 4294967295 9 246
  = (16, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0129 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1039675271)) (f32 (1022000422)) 52 0 16 11 236
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0130 :
  samSubModeDamp_fun (f32 (3196224712)) (f32 (3172373010)) (f32 (1043520513)) 13 35 22 11 260
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0131 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 13 0 13 5 165
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0132 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 8 0 8 9 128
  = (8, 1, 8).
Proof. vm_compute. reflexivity. Qed.


Example t_0133 :
  samSubModeDamp_fun (f32 (3197445311)) (f32 (3192704205)) (f32 (3196268165)) 33 0 18 10 125
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0134 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 37 0 18 18 200
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0135 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3191877626)) (f32 (3194818027)) 11 0 16 16 204
  = (11, 1, 16).
Proof. vm_compute. reflexivity. Qed.


Example t_0136 :
  samSubModeDamp_fun (f32 (1045715258)) (f32 (3196967066)) (f32 (3197659601)) 63 234 0 8 234
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0137 :
  samSubModeDamp_fun (f32 (1047466369)) (f32 (1040236162)) (f32 (3196560111)) 77 165 0 17 166
  = (77, 166, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0138 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 72 0 2 12 159
  = (72, 1, 3).
Proof. vm_compute. reflexivity. Qed.


Example t_0139 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 23 0 1 14 234
  = (23, 1, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0140 :
  samSubModeDamp_fun (f32 (3193155157)) (f32 (1044280331)) (f32 (3190141178)) 71 4294967295 0 13 132
  = (71, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0141 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 31 0 4294967295 15 267
  = (31, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0142 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3181332305)) (f32 (1035110531)) 47 0 18 13 145
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0143 :
  samSubModeDamp_fun (f32 (1038431397)) (f32 (1032212831)) (f32 (1027017610)) 4 172 20 14 142
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0144 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 55 0 3 6 144
  = (55, 1, 4).
Proof. vm_compute. reflexivity. Qed.


Example t_0145 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 51 0 4 17 196
  = (51, 1, 4).
Proof. vm_compute. reflexivity. Qed.


Example t_0146 :
  samSubModeDamp_fun (f32 (1034805634)) (f32 (3192704205)) (f32 (1047007192)) 76 0 1 11 284
  = (76, 1, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0147 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 12 0 19 19 207
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0148 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1033092698)) (f32 (3189889125)) 23 0 8 8 127
  = (23, 1, 8).
Proof. vm_compute. reflexivity. Qed.


Example t_0149 :
  samSubModeDamp_fun (f32 (3195852096)) (f32 (1021887744)) (f32 (3190779333)) 27 192 0 11 192
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0150 :
  samSubModeDamp_fun (f32 (1042912458)) (f32 (3185349445)) (f32 (3197509354)) 66 201 0 5 202
  = (66, 202, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0151 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 24 0 17 20 114
  = (24, 1, 18).
Proof. vm_compute. reflexivity. Qed.


Example t_0152 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 55 0 21 8 209
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0153 :
  samSubModeDamp_fun (f32 (1032322086)) (f32 (3187118039)) (f32 (1030882732)) 69 4294967295 0 13 249
  = (69, 0, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0154 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 72 0 4294967295 18 300
  = (72, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0155 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1048113412)) (f32 (1048756404)) 1 0 13 8 184
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0156 :
  samSubModeDamp_fun (f32 (1042277552)) (f32 (3176061336)) (f32 (1045612280)) 69 119 21 6 131
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0157 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 17 0 0 8 185
  = (17, 1, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0158 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 34 0 19 5 273
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0159 :
  samSubModeDamp_fun (f32 (1049191089)) (f32 (3192704205)) (f32 (1043893589)) 3 0 23 11 262
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0160 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 52 0 8 8 257
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0161 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3153978580)) (f32 (1045274536)) 1 0 18 18 118
  = (1, 1, 18).
Proof. vm_compute. reflexivity. Qed.


Example t_0162 :
  samSubModeDamp_fun (f32 (3191255603)) (f32 (1049138298)) (f32 (3197063971)) 5 249 0 7 249
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0163 :
  samSubModeDamp_fun (f32 (1049570968)) (f32 (3196724655)) (f32 (3194198163)) 57 169 0 17 170
  = (57, 170, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0164 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 77 0 23 10 122
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0165 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 10 0 3 11 299
  = (10, 1, 3).
Proof. vm_compute. reflexivity. Qed.


Example t_0166 :
  samSubModeDamp_fun (f32 (3174572033)) (f32 (3188893480)) (f32 (1046788407)) 9 4294967295 0 10 208
  = (9, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0167 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 50 0 4294967295 15 251
  = (50, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0168 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3190873332)) (f32 (1027450738)) 39 0 15 10 181
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0169 :
  samSubModeDamp_fun (f32 (3159867583)) (f32 (3177772093)) (f32 (3197497149)) 13 127 1 9 265
  = (13, 128, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0170 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 76 0 8 9 155
  = (76, 1, 9).
Proof. vm_compute. reflexivity. Qed.


Example t_0171 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 27 0 14 15 218
  = (27, 1, 14).
Proof. vm_compute. reflexivity. Qed.


Example t_0172 :
  samSubModeDamp_fun (f32 (3194776515)) (f32 (3192704205)) (f32 (3189149947)) 36 0 8 12 158
  = (36, 1, 8).
Proof. vm_compute. reflexivity. Qed.


Example t_0173 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 35 0 7 7 108
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0174 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1048775688)) (f32 (1044218574)) 61 0 19 19 298
  = (61, 1, 19).
Proof. vm_compute. reflexivity. Qed.


Example t_0175 :
  samSubModeDamp_fun (f32 (1039989321)) (f32 (3172848787)) (f32 (1049826075)) 32 155 0 6 155
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0176 :
  samSubModeDamp_fun (f32 (1035546390)) (f32 (1026225115)) (f32 (3182246301)) 10 202 0 11 203
  = (10, 203, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0177 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 32 0 25 10 250
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0178 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 30 0 5 10 103
  = (30, 1, 5).
Proof. vm_compute. reflexivity. Qed.


Example t_0179 :
  samSubModeDamp_fun (f32 (1044458214)) (f32 (3193144471)) (f32 (1030928491)) 39 4294967295 0 7 237
  = (39, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0180 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 31 0 4294967295 8 107
  = (31, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0181 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3196778130)) (f32 (3189455976)) 49 0 16 11 274
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0182 :
  samSubModeDamp_fun (f32 (1040235106)) (f32 (3191690085)) (f32 (1049574991)) 38 135 23 18 127
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0183 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 64 0 13 13 134
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0184 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 16 0 25 20 153
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0185 :
  samSubModeDamp_fun (f32 (1041322084)) (f32 (3192704205)) (f32 (3190191108)) 46 0 21 10 136
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0186 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 64 0 12 12 162
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0187 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3190903862)) (f32 (3172734686)) 24 0 9 9 287
  = (24, 1, 9).
Proof. vm_compute. reflexivity. Qed.


Example t_0188 :
  samSubModeDamp_fun (f32 (1048383068)) (f32 (3194611139)) (f32 (1045411702)) 57 187 0 5 187
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0189 :
  samSubModeDamp_fun (f32 (3182272645)) (f32 (3162794160)) (f32 (1043388237)) 79 295 0 20 296
  = (79, 296, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0190 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 15 0 5 17 246
  = (15, 1, 6).
Proof. vm_compute. reflexivity. Qed.


Example t_0191 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 72 0 1 20 287
  = (72, 1, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0192 :
  samSubModeDamp_fun (f32 (3191950773)) (f32 (1049899047)) (f32 (1029104442)) 52 4294967295 0 8 107
  = (52, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0193 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 3 0 4294967295 9 230
  = (3, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0194 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3165920573)) (f32 (1041790772)) 18 0 25 20 162
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0195 :
  samSubModeDamp_fun (f32 (1043318264)) (f32 (1049865449)) (f32 (1041512490)) 7 208 10 12 108
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0196 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 15 0 20 17 151
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0197 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 2 0 21 13 181
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0198 :
  samSubModeDamp_fun (f32 (3196612995)) (f32 (3192704205)) (f32 (3181179298)) 51 0 12 9 233
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0199 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 65 0 20 20 114
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0200 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3175339032)) (f32 (3177885019)) 70 0 14 14 191
  = (70, 1, 14).
Proof. vm_compute. reflexivity. Qed.


Example t_0201 :
  samSubModeDamp_fun (f32 (3189660778)) (f32 (1048678102)) (f32 (1036800481)) 31 208 0 7 208
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0202 :
  samSubModeDamp_fun (f32 (1040547573)) (f32 (3195388532)) (f32 (3194378168)) 58 263 0 14 264
  = (58, 264, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0203 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 40 0 9 5 178
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0204 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 65 0 22 9 263
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0205 :
  samSubModeDamp_fun (f32 (3178054027)) (f32 (3149053339)) (f32 (1049574047)) 12 4294967295 0 20 213
  = (12, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0206 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 2 0 4294967295 7 297
  = (2, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0207 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1015501580)) (f32 (3195021751)) 9 0 22 17 258
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0208 :
  samSubModeDamp_fun (f32 (3197191016)) (f32 (1004354265)) (f32 (1041389518)) 39 48 15 17 262
  = (39, 49, 15).
Proof. vm_compute. reflexivity. Qed.


Example t_0209 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 36 0 7 12 224
  = (36, 1, 8).
Proof. vm_compute. reflexivity. Qed.


Example t_0210 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 77 0 7 15 106
  = (77, 1, 7).
Proof. vm_compute. reflexivity. Qed.


Example t_0211 :
  samSubModeDamp_fun (f32 (3190056265)) (f32 (3192704205)) (f32 (1040624045)) 75 0 4 11 247
  = (75, 1, 4).
Proof. vm_compute. reflexivity. Qed.


Example t_0212 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 8 0 14 14 279
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0213 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3165361062)) (f32 (3192971092)) 51 0 12 12 254
  = (51, 1, 12).
Proof. vm_compute. reflexivity. Qed.


Example t_0214 :
  samSubModeDamp_fun (f32 (3180595059)) (f32 (3171037749)) (f32 (3166529197)) 56 148 0 6 148
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0215 :
  samSubModeDamp_fun (f32 (1018336412)) (f32 (3179528866)) (f32 (1046909379)) 52 177 0 9 178
  = (52, 178, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0216 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 29 0 24 17 292
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0217 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 55 0 13 12 111
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0218 :
  samSubModeDamp_fun (f32 (3190738287)) (f32 (1048450226)) (f32 (3189287260)) 73 4294967295 0 6 123
  = (73, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0219 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 47 0 4294967295 17 279
  = (47, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0220 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1038232269)) (f32 (3179789052)) 53 0 24 19 187
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0221 :
  samSubModeDamp_fun (f32 (3184733788)) (f32 (1025046718)) (f32 (1049154691)) 31 276 0 18 292
  = (31, 277, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0222 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 5 0 8 11 140
  = (5, 1, 9).
Proof. vm_compute. reflexivity. Qed.


Example t_0223 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 77 0 23 18 174
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0224 :
  samSubModeDamp_fun (f32 (3196709676)) (f32 (3192704205)) (f32 (1045854778)) 37 0 20 18 191
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0225 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 0 0 9 9 130
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0226 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1044274506)) (f32 (3163493515)) 15 0 19 19 157
  = (15, 1, 19).
Proof. vm_compute. reflexivity. Qed.


Example t_0227 :
  samSubModeDamp_fun (f32 (3172951692)) (f32 (1040900258)) (f32 (3185546659)) 9 127 0 13 127
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0228 :
  samSubModeDamp_fun (f32 (1046060591)) (f32 (1037543543)) (f32 (1042462192)) 4 149 0 17 150
  = (4, 150, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0229 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 59 0 12 17 215
  = (59, 1, 13).
Proof. vm_compute. reflexivity. Qed.


Example t_0230 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 29 0 12 14 201
  = (29, 1, 12).
Proof. vm_compute. reflexivity. Qed.


Example t_0231 :
  samSubModeDamp_fun (f32 (1049995743)) (f32 (3187765130)) (f32 (1045531348)) 68 4294967295 0 20 190
  = (68, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0232 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 56 0 4294967295 5 246
  = (56, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0233 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3157975462)) (f32 (1029226349)) 37 0 18 13 193
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0234 :
  samSubModeDamp_fun (f32 (3190784486)) (f32 (3196476655)) (f32 (3187115088)) 49 265 15 7 195
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0235 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 47 0 24 14 148
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0236 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 43 0 24 14 254
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0237 :
  samSubModeDamp_fun (f32 (1048957821)) (f32 (3192704205)) (f32 (1016512327)) 34 0 15 19 207
  = (34, 1, 15).
Proof. vm_compute. reflexivity. Qed.


Example t_0238 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 32 0 16 16 276
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0239 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1048562433)) (f32 (3177690636)) 12 0 9 9 179
  = (12, 1, 9).
Proof. vm_compute. reflexivity. Qed.


Example t_0240 :
  samSubModeDamp_fun (f32 (1039234020)) (f32 (3196866868)) (f32 (1041508047)) 34 300 0 9 300
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0241 :
  samSubModeDamp_fun (f32 (1038190537)) (f32 (3187825887)) (f32 (3190865122)) 22 187 0 10 188
  = (22, 188, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0242 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 72 0 5 13 176
  = (72, 1, 6).
Proof. vm_compute. reflexivity. Qed.


Example t_0243 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 58 0 23 6 263
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0244 :
  samSubModeDamp_fun (f32 (3194418059)) (f32 (1049579456)) (f32 (3183640327)) 36 4294967295 0 12 117
  = (36, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0245 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 11 0 4294967295 9 124
  = (11, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0246 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1048726441)) (f32 (1012381843)) 1 0 22 17 120
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0247 :
  samSubModeDamp_fun (f32 (1046905516)) (f32 (1049393970)) (f32 (1037017040)) 0 184 2 6 229
  = (0, 185, 2).
Proof. vm_compute. reflexivity. Qed.


Example t_0248 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 1 0 19 20 131
  = (1, 1, 20).
Proof. vm_compute. reflexivity. Qed.


Example t_0249 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 23 0 24 14 270
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0250 :
  samSubModeDamp_fun (f32 (1040555474)) (f32 (3192704205)) (f32 (1008114847)) 50 0 11 18 274
  = (50, 1, 11).
Proof. vm_compute. reflexivity. Qed.


Example t_0251 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 65 0 20 20 217
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0252 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1043891622)) (f32 (3196723764)) 25 0 19 19 175
  = (25, 1, 19).
Proof. vm_compute. reflexivity. Qed.


Example t_0253 :
  samSubModeDamp_fun (f32 (3185334358)) (f32 (1039478257)) (f32 (1026246790)) 51 281 0 15 281
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0254 :
  samSubModeDamp_fun (f32 (3196223731)) (f32 (1036681635)) (f32 (3194174555)) 10 227 0 12 228
  = (10, 228, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0255 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 47 0 17 11 271
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0256 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 20 0 4 6 185
  = (20, 1, 4).
Proof. vm_compute. reflexivity. Qed.


Example t_0257 :
  samSubModeDamp_fun (f32 (3197419264)) (f32 (1041391455)) (f32 (1049655229)) 56 4294967295 0 14 293
  = (56, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0258 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 34 0 4294967295 16 253
  = (34, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0259 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1049130517)) (f32 (3186259949)) 44 0 10 5 136
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0260 :
  samSubModeDamp_fun (f32 (1045587355)) (f32 (3195832820)) (f32 (3196659244)) 61 241 21 14 169
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0261 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 58 0 14 18 243
  = (58, 1, 15).
Proof. vm_compute. reflexivity. Qed.


Example t_0262 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 55 0 1 8 251
  = (55, 1, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0263 :
  samSubModeDamp_fun (f32 (3188047168)) (f32 (3192704205)) (f32 (1049652431)) 52 0 6 10 260
  = (52, 1, 6).
Proof. vm_compute. reflexivity. Qed.


Example t_0264 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 40 0 17 17 190
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0265 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3189590538)) (f32 (1028724137)) 50 0 5 5 288
  = (50, 1, 5).
Proof. vm_compute. reflexivity. Qed.


Example t_0266 :
  samSubModeDamp_fun (f32 (3188624773)) (f32 (3161109824)) (f32 (1008062665)) 20 297 0 15 297
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0267 :
  samSubModeDamp_fun (f32 (3166456806)) (f32 (3189352653)) (f32 (1021727550)) 63 142 0 14 143
  = (63, 143, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0268 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 13 0 8 11 287
  = (13, 1, 9).
Proof. vm_compute. reflexivity. Qed.


Example t_0269 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 3 0 16 5 156
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0270 :
  samSubModeDamp_fun (f32 (1047222422)) (f32 (1050168065)) (f32 (3185410942)) 48 4294967295 0 11 176
  = (48, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0271 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 52 0 4294967295 9 286
  = (52, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0272 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1042877237)) (f32 (3189720681)) 3 0 11 6 151
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0273 :
  samSubModeDamp_fun (f32 (3181320917)) (f32 (1041634238)) (f32 (1049324010)) 58 161 5 11 167
  = (58, 162, 5).
Proof. vm_compute. reflexivity. Qed.


Example t_0274 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 27 0 13 16 202
  = (27, 1, 14).
Proof. vm_compute. reflexivity. Qed.


Example t_0275 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 8 0 14 15 148
  = (8, 1, 14).
Proof. vm_compute. reflexivity. Qed.


Example t_0276 :
  samSubModeDamp_fun (f32 (3175993630)) (f32 (3192704205)) (f32 (3190452482)) 48 0 16 14 257
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0277 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 11 0 16 16 275
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0278 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1043959374)) (f32 (1040665775)) 0 0 20 20 155
  = (0, 1, 20).
Proof. vm_compute. reflexivity. Qed.


Example t_0279 :
  samSubModeDamp_fun (f32 (3140577917)) (f32 (1011530254)) (f32 (1024918717)) 29 266 0 5 266
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0280 :
  samSubModeDamp_fun (f32 (1025153215)) (f32 (3183958665)) (f32 (3193574227)) 64 202 0 10 203
  = (64, 203, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0281 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 42 0 15 20 112
  = (42, 1, 16).
Proof. vm_compute. reflexivity. Qed.


Example t_0282 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 31 0 25 14 258
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0283 :
  samSubModeDamp_fun (f32 (1040727330)) (f32 (3185041144)) (f32 (1049197572)) 45 4294967295 0 13 110
  = (45, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0284 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 39 0 4294967295 13 140
  = (39, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0285 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1046717142)) (f32 (1022963813)) 62 0 21 16 227
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0286 :
  samSubModeDamp_fun (f32 (1011821398)) (f32 (3193725837)) (f32 (3189933360)) 31 113 17 19 122
  = (31, 114, 17).
Proof. vm_compute. reflexivity. Qed.


Example t_0287 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 46 0 21 6 251
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0288 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 64 0 11 13 224
  = (64, 1, 11).
Proof. vm_compute. reflexivity. Qed.


Example t_0289 :
  samSubModeDamp_fun (f32 (1048300414)) (f32 (3192704205)) (f32 (1049020606)) 70 0 19 18 271
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0290 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 18 0 19 19 140
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0291 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1045370132)) (f32 (1049603332)) 57 0 7 7 175
  = (57, 1, 7).
Proof. vm_compute. reflexivity. Qed.


Example t_0292 :
  samSubModeDamp_fun (f32 (1045299547)) (f32 (3182006378)) (f32 (1047058969)) 62 264 0 10 264
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0293 :
  samSubModeDamp_fun (f32 (3171019812)) (f32 (3184988382)) (f32 (1033444035)) 4 237 0 10 238
  = (4, 238, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0294 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 2 0 5 11 203
  = (2, 1, 6).
Proof. vm_compute. reflexivity. Qed.


Example t_0295 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 62 0 18 6 208
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0296 :
  samSubModeDamp_fun (f32 (1049363134)) (f32 (1050192054)) (f32 (3182843008)) 10 4294967295 0 16 160
  = (10, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0297 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 29 0 4294967295 8 173
  = (29, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0298 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3192210206)) (f32 (3160703197)) 39 0 18 13 193
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0299 :
  samSubModeDamp_fun (f32 (3197555064)) (f32 (1046117182)) (f32 (1035344524)) 31 38 4 15 193
  = (31, 39, 4).
Proof. vm_compute. reflexivity. Qed.


Example t_0300 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 6 0 21 7 291
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0301 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 1 0 4 8 270
  = (1, 1, 4).
Proof. vm_compute. reflexivity. Qed.


Example t_0302 :
  samSubModeDamp_fun (f32 (3193642501)) (f32 (3192704205)) (f32 (3197408847)) 26 0 9 12 147
  = (26, 1, 9).
Proof. vm_compute. reflexivity. Qed.


Example t_0303 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 53 0 5 5 177
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0304 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1034924211)) (f32 (1047580915)) 27 0 10 10 212
  = (27, 1, 10).
Proof. vm_compute. reflexivity. Qed.


Example t_0305 :
  samSubModeDamp_fun (f32 (1000272476)) (f32 (1047726193)) (f32 (3180957086)) 31 105 0 16 105
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0306 :
  samSubModeDamp_fun (f32 (1038312275)) (f32 (3183440438)) (f32 (3174315886)) 25 296 0 14 297
  = (25, 297, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0307 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 42 0 18 8 182
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0308 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 28 0 1 5 252
  = (28, 1, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0309 :
  samSubModeDamp_fun (f32 (1011235657)) (f32 (3191536107)) (f32 (3196830454)) 62 4294967295 0 18 108
  = (62, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0310 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 28 0 4294967295 15 127
  = (28, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0311 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3196636741)) (f32 (3174668849)) 38 0 24 19 277
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0312 :
  samSubModeDamp_fun (f32 (3196602337)) (f32 (3192750505)) (f32 (3155866625)) 20 225 3 14 188
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0313 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 21 0 25 18 264
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0314 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 71 0 16 8 135
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0315 :
  samSubModeDamp_fun (f32 (1024756507)) (f32 (3192704205)) (f32 (1032285329)) 54 0 6 5 168
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0316 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 45 0 12 12 155
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0317 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1049788837)) (f32 (3152439593)) 71 0 12 12 252
  = (71, 1, 12).
Proof. vm_compute. reflexivity. Qed.


Example t_0318 :
  samSubModeDamp_fun (f32 (1037517306)) (f32 (3181673133)) (f32 (3188151219)) 31 140 0 18 140
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0319 :
  samSubModeDamp_fun (f32 (1024974230)) (f32 (3190987878)) (f32 (3187021565)) 35 285 0 8 286
  = (35, 286, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0320 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 11 0 25 13 137
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0321 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 13 0 7 18 150
  = (13, 1, 7).
Proof. vm_compute. reflexivity. Qed.


Example t_0322 :
  samSubModeDamp_fun (f32 (3175392207)) (f32 (3183375052)) (f32 (3191859911)) 12 4294967295 0 15 204
  = (12, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0323 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 73 0 4294967295 12 164
  = (73, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0324 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1035731364)) (f32 (3187690609)) 20 0 16 11 298
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0325 :
  samSubModeDamp_fun (f32 (3159257341)) (f32 (1006715448)) (f32 (1044778205)) 66 218 14 13 133
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0326 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 16 0 14 11 190
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0327 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 46 0 6 16 195
  = (46, 1, 6).
Proof. vm_compute. reflexivity. Qed.


Example t_0328 :
  samSubModeDamp_fun (f32 (3157640617)) (f32 (3192704205)) (f32 (3191926416)) 60 0 14 10 165
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0329 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 22 0 6 6 283
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0330 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1027759607)) (f32 (1042607894)) 36 0 19 19 296
  = (36, 1, 19).
Proof. vm_compute. reflexivity. Qed.


Example t_0331 :
  samSubModeDamp_fun (f32 (3196013665)) (f32 (3194185400)) (f32 (1030340002)) 71 135 0 19 135
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0332 :
  samSubModeDamp_fun (f32 (3193091831)) (f32 (1045831515)) (f32 (3196050876)) 67 175 0 9 176
  = (67, 176, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0333 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 74 0 13 13 229
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0334 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 72 0 6 10 192
  = (72, 1, 6).
Proof. vm_compute. reflexivity. Qed.


Example t_0335 :
  samSubModeDamp_fun (f32 (1040370828)) (f32 (3196553855)) (f32 (1050228623)) 62 4294967295 0 13 153
  = (62, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0336 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 27 0 4294967295 7 288
  = (27, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0337 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1049990524)) (f32 (1041675408)) 76 0 11 6 151
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0338 :
  samSubModeDamp_fun (f32 (3191592298)) (f32 (3177148283)) (f32 (1040604522)) 43 276 21 15 108
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0339 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 2 0 1 19 168
  = (2, 1, 2).
Proof. vm_compute. reflexivity. Qed.


Example t_0340 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 1 0 24 7 231
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0341 :
  samSubModeDamp_fun (f32 (3174621787)) (f32 (3192704205)) (f32 (3196992182)) 64 0 17 17 254
  = (64, 1, 17).
Proof. vm_compute. reflexivity. Qed.


Example t_0342 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 30 0 13 13 122
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0343 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3189919226)) (f32 (1037136554)) 78 0 10 10 120
  = (78, 1, 10).
Proof. vm_compute. reflexivity. Qed.


Example t_0344 :
  samSubModeDamp_fun (f32 (1042853954)) (f32 (3195343813)) (f32 (1047543700)) 59 285 0 11 285
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0345 :
  samSubModeDamp_fun (f32 (1044122360)) (f32 (3194725602)) (f32 (3188748544)) 76 226 0 11 227
  = (76, 227, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0346 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 12 0 19 15 225
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0347 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 15 0 21 14 108
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0348 :
  samSubModeDamp_fun (f32 (3197241630)) (f32 (3187646982)) (f32 (1049780894)) 13 4294967295 0 13 246
  = (13, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0349 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 37 0 4294967295 9 166
  = (37, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0350 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1031896871)) (f32 (3190333347)) 67 0 16 11 141
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0351 :
  samSubModeDamp_fun (f32 (3191957683)) (f32 (3181112288)) (f32 (3188416579)) 22 42 4 11 163
  = (22, 43, 4).
Proof. vm_compute. reflexivity. Qed.


Example t_0352 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 59 0 19 12 181
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0353 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 41 0 13 6 295
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0354 :
  samSubModeDamp_fun (f32 (3181390283)) (f32 (3192704205)) (f32 (3191924018)) 63 0 16 18 162
  = (63, 1, 16).
Proof. vm_compute. reflexivity. Qed.


Example t_0355 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 24 0 10 10 282
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0356 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1046268749)) (f32 (1039269557)) 54 0 16 16 288
  = (54, 1, 16).
Proof. vm_compute. reflexivity. Qed.


Example t_0357 :
  samSubModeDamp_fun (f32 (1036583532)) (f32 (3180552367)) (f32 (1032372527)) 75 263 0 12 263
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0358 :
  samSubModeDamp_fun (f32 (3196191553)) (f32 (3192239334)) (f32 (1045907291)) 38 227 0 19 228
  = (38, 228, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0359 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 61 0 6 13 280
  = (61, 1, 7).
Proof. vm_compute. reflexivity. Qed.


Example t_0360 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 24 0 23 13 224
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0361 :
  samSubModeDamp_fun (f32 (3193619894)) (f32 (1047409961)) (f32 (3182721981)) 64 4294967295 0 16 175
  = (64, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0362 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 8 0 4294967295 17 255
  = (8, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0363 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3194407864)) (f32 (3180333853)) 68 0 11 6 281
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0364 :
  samSubModeDamp_fun (f32 (1047713103)) (f32 (3196445623)) (f32 (3186563394)) 37 33 18 9 155
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0365 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 39 0 22 15 183
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0366 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 19 0 15 12 188
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0367 :
  samSubModeDamp_fun (f32 (1044843573)) (f32 (3192704205)) (f32 (1038677526)) 24 0 25 9 265
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0368 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 15 0 12 12 286
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0369 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3178308303)) (f32 (3181990821)) 45 0 19 19 249
  = (45, 1, 19).
Proof. vm_compute. reflexivity. Qed.


Example t_0370 :
  samSubModeDamp_fun (f32 (1037105976)) (f32 (3195416541)) (f32 (3192476418)) 33 185 0 14 185
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0371 :
  samSubModeDamp_fun (f32 (3191672209)) (f32 (3196997130)) (f32 (3196590021)) 61 273 0 17 274
  = (61, 274, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0372 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 60 0 8 6 236
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0373 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 48 0 25 16 114
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0374 :
  samSubModeDamp_fun (f32 (3183788986)) (f32 (1015818103)) (f32 (3188764707)) 75 4294967295 0 15 264
  = (75, 0, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0375 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 6 0 4294967295 6 153
  = (6, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0376 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3189288998)) (f32 (1038013828)) 52 0 20 15 196
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0377 :
  samSubModeDamp_fun (f32 (1036986237)) (f32 (1048304979)) (f32 (3192769521)) 61 300 1 17 175
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0378 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 45 0 21 11 126
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0379 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 61 0 22 15 149
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0380 :
  samSubModeDamp_fun (f32 (1042007378)) (f32 (3192704205)) (f32 (1043860680)) 15 0 12 13 163
  = (15, 1, 12).
Proof. vm_compute. reflexivity. Qed.


Example t_0381 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 1 0 11 11 107
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0382 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3163870254)) (f32 (1043386222)) 5 0 16 16 190
  = (5, 1, 16).
Proof. vm_compute. reflexivity. Qed.


Example t_0383 :
  samSubModeDamp_fun (f32 (1025682734)) (f32 (1044622642)) (f32 (3172866009)) 54 123 0 15 123
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0384 :
  samSubModeDamp_fun (f32 (3194907630)) (f32 (1034918859)) (f32 (1043962674)) 58 270 0 19 271
  = (58, 271, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0385 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 40 0 11 9 168
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0386 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 38 0 10 7 196
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0387 :
  samSubModeDamp_fun (f32 (1049462241)) (f32 (1037579596)) (f32 (1043464793)) 38 4294967295 0 16 285
  = (38, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0388 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 12 0 4294967295 6 284
  = (12, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0389 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3197679903)) (f32 (1048581965)) 26 0 22 17 294
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0390 :
  samSubModeDamp_fun (f32 (3192940602)) (f32 (1050050217)) (f32 (3196706553)) 48 316 12 7 300
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0391 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 0 0 7 13 189
  = (0, 1, 8).
Proof. vm_compute. reflexivity. Qed.


Example t_0392 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 23 0 9 17 158
  = (23, 1, 9).
Proof. vm_compute. reflexivity. Qed.


Example t_0393 :
  samSubModeDamp_fun (f32 (1033694081)) (f32 (3192704205)) (f32 (1039968789)) 9 0 13 13 106
  = (9, 1, 13).
Proof. vm_compute. reflexivity. Qed.


Example t_0394 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 36 0 17 17 155
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0395 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3182896673)) (f32 (1033664316)) 6 0 6 6 144
  = (6, 1, 6).
Proof. vm_compute. reflexivity. Qed.


Example t_0396 :
  samSubModeDamp_fun (f32 (1026367675)) (f32 (1043702840)) (f32 (3197258687)) 38 256 0 7 256
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0397 :
  samSubModeDamp_fun (f32 (3165520237)) (f32 (1045966200)) (f32 (1047193599)) 15 193 0 20 194
  = (15, 194, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0398 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 26 0 23 6 157
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0399 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 46 0 15 17 168
  = (46, 1, 15).
Proof. vm_compute. reflexivity. Qed.


Example t_0400 :
  samSubModeDamp_fun (f32 (1048319391)) (f32 (3195698405)) (f32 (3189157262)) 33 4294967295 0 19 290
  = (33, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0401 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 10 0 4294967295 17 106
  = (10, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0402 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3168128681)) (f32 (1047181513)) 24 0 10 5 105
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0403 :
  samSubModeDamp_fun (f32 (3171118218)) (f32 (1048898606)) (f32 (1040063318)) 63 269 16 15 201
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0404 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 11 0 23 13 126
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0405 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 76 0 1 18 290
  = (76, 1, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0406 :
  samSubModeDamp_fun (f32 (3196154299)) (f32 (3192704205)) (f32 (1048491926)) 43 0 25 19 286
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0407 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 69 0 7 7 150
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0408 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1036126396)) (f32 (1045574689)) 23 0 6 6 123
  = (23, 1, 6).
Proof. vm_compute. reflexivity. Qed.


Example t_0409 :
  samSubModeDamp_fun (f32 (3197405314)) (f32 (1016626591)) (f32 (3170326225)) 3 183 0 19 183
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0410 :
  samSubModeDamp_fun (f32 (3183260908)) (f32 (1032146918)) (f32 (1040894767)) 9 169 0 8 170
  = (9, 170, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0411 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 75 0 12 8 134
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0412 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 40 0 21 9 204
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0413 :
  samSubModeDamp_fun (f32 (992241338)) (f32 (3197338427)) (f32 (3192262415)) 21 4294967295 0 16 231
  = (21, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0414 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 67 0 4294967295 10 150
  = (67, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0415 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1046607527)) (f32 (3188262986)) 40 0 11 6 266
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0416 :
  samSubModeDamp_fun (f32 (3177789132)) (f32 (3172790648)) (f32 (3194839070)) 72 41 3 8 233
  = (72, 42, 3).
Proof. vm_compute. reflexivity. Qed.


Example t_0417 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 19 0 11 5 116
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0418 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 56 0 17 16 129
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0419 :
  samSubModeDamp_fun (f32 (1037895393)) (f32 (3192704205)) (f32 (1041656133)) 8 0 15 7 221
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0420 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 7 0 9 9 254
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0421 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3180014858)) (f32 (3197364791)) 76 0 5 5 238
  = (76, 1, 5).
Proof. vm_compute. reflexivity. Qed.


Example t_0422 :
  samSubModeDamp_fun (f32 (1034224990)) (f32 (1034433901)) (f32 (3181963413)) 64 230 0 10 230
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0423 :
  samSubModeDamp_fun (f32 (3155949688)) (f32 (1027348267)) (f32 (1034764810)) 40 281 0 20 282
  = (40, 282, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0424 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 24 0 23 18 222
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0425 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 2 0 19 12 205
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0426 :
  samSubModeDamp_fun (f32 (3187425787)) (f32 (1042059441)) (f32 (1045161540)) 50 4294967295 0 12 146
  = (50, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0427 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 50 0 4294967295 19 123
  = (50, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0428 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3185199795)) (f32 (3192158061)) 76 0 10 5 193
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0429 :
  samSubModeDamp_fun (f32 (3154602846)) (f32 (3171834735)) (f32 (3180105400)) 38 105 0 18 179
  = (38, 106, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0430 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 0 0 18 5 216
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0431 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 54 0 7 16 149
  = (54, 1, 7).
Proof. vm_compute. reflexivity. Qed.


Example t_0432 :
  samSubModeDamp_fun (f32 (1034735632)) (f32 (3192704205)) (f32 (1020290266)) 24 0 3 19 180
  = (24, 1, 3).
Proof. vm_compute. reflexivity. Qed.


Example t_0433 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 15 0 11 11 219
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0434 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3181791478)) (f32 (1043330996)) 28 0 10 10 273
  = (28, 1, 10).
Proof. vm_compute. reflexivity. Qed.


Example t_0435 :
  samSubModeDamp_fun (f32 (3197584955)) (f32 (3130166650)) (f32 (1042686100)) 55 285 0 7 285
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0436 :
  samSubModeDamp_fun (f32 (3196286743)) (f32 (1043688194)) (f32 (3180181393)) 19 148 0 9 149
  = (19, 149, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0437 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 62 0 8 6 166
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0438 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 70 0 9 13 276
  = (70, 1, 9).
Proof. vm_compute. reflexivity. Qed.


Example t_0439 :
  samSubModeDamp_fun (f32 (3191556398)) (f32 (3189777558)) (f32 (3180874220)) 31 4294967295 0 12 287
  = (31, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0440 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 4 0 4294967295 5 108
  = (4, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0441 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1036330345)) (f32 (3153906664)) 4 0 17 12 118
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0442 :
  samSubModeDamp_fun (f32 (3193861378)) (f32 (3195913076)) (f32 (3157882486)) 57 39 12 8 201
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0443 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 47 0 8 15 207
  = (47, 1, 9).
Proof. vm_compute. reflexivity. Qed.


Example t_0444 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 66 0 5 5 254
  = (66, 1, 5).
Proof. vm_compute. reflexivity. Qed.


Example t_0445 :
  samSubModeDamp_fun (f32 (1035755571)) (f32 (3192704205)) (f32 (3190109122)) 19 0 25 12 145
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0446 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 8 0 11 11 238
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0447 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3192973746)) (f32 (1043063418)) 61 0 18 18 286
  = (61, 1, 18).
Proof. vm_compute. reflexivity. Qed.


Example t_0448 :
  samSubModeDamp_fun (f32 (1034708039)) (f32 (1049747259)) (f32 (3186947057)) 47 248 0 14 248
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0449 :
  samSubModeDamp_fun (f32 (1048774918)) (f32 (3193621597)) (f32 (3193751183)) 48 114 0 5 115
  = (48, 115, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0450 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 33 0 18 6 212
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0451 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 13 0 14 18 283
  = (13, 1, 14).
Proof. vm_compute. reflexivity. Qed.


Example t_0452 :
  samSubModeDamp_fun (f32 (3185700535)) (f32 (1045609271)) (f32 (3196157331)) 42 4294967295 0 7 190
  = (42, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0453 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 74 0 4294967295 7 231
  = (74, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0454 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1050148789)) (f32 (1036506078)) 70 0 15 10 289
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0455 :
  samSubModeDamp_fun (f32 (1047450062)) (f32 (3163520410)) (f32 (3195766036)) 33 11 25 10 192
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0456 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 2 0 11 5 256
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0457 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 62 0 6 9 296
  = (62, 1, 6).
Proof. vm_compute. reflexivity. Qed.


Example t_0458 :
  samSubModeDamp_fun (f32 (1025822668)) (f32 (3192704205)) (f32 (3181333149)) 78 0 20 17 218
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0459 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 62 0 6 6 255
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0460 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1040499996)) (f32 (3186317883)) 49 0 20 20 262
  = (49, 1, 20).
Proof. vm_compute. reflexivity. Qed.


Example t_0461 :
  samSubModeDamp_fun (f32 (1049213423)) (f32 (1044086837)) (f32 (3196994023)) 57 102 0 5 102
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0462 :
  samSubModeDamp_fun (f32 (1015397349)) (f32 (1046343082)) (f32 (1038014863)) 29 188 0 17 189
  = (29, 189, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0463 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 63 0 18 20 230
  = (63, 1, 19).
Proof. vm_compute. reflexivity. Qed.


Example t_0464 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 48 0 25 8 195
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0465 :
  samSubModeDamp_fun (f32 (1037386780)) (f32 (1047331694)) (f32 (1046556728)) 5 4294967295 0 10 227
  = (5, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0466 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 13 0 4294967295 9 215
  = (13, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0467 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3184479978)) (f32 (1026398481)) 65 0 14 9 250
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0468 :
  samSubModeDamp_fun (f32 (3197309618)) (f32 (1042031210)) (f32 (3197412928)) 55 221 8 10 167
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0469 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 3 0 5 19 171
  = (3, 1, 6).
Proof. vm_compute. reflexivity. Qed.


Example t_0470 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 12 0 4 9 158
  = (12, 1, 4).
Proof. vm_compute. reflexivity. Qed.


Example t_0471 :
  samSubModeDamp_fun (f32 (3186908691)) (f32 (3192704205)) (f32 (3165189528)) 15 0 10 7 196
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0472 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 43 0 11 11 213
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0473 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1048324829)) (f32 (1045808380)) 23 0 17 17 107
  = (23, 1, 17).
Proof. vm_compute. reflexivity. Qed.


Example t_0474 :
  samSubModeDamp_fun (f32 (1048950448)) (f32 (1020477189)) (f32 (1022343698)) 26 154 0 18 154
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0475 :
  samSubModeDamp_fun (f32 (3190699950)) (f32 (1028831129)) (f32 (1047745567)) 74 230 0 16 231
  = (74, 231, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0476 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 14 0 20 9 195
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0477 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 41 0 11 19 256
  = (41, 1, 11).
Proof. vm_compute. reflexivity. Qed.


Example t_0478 :
  samSubModeDamp_fun (f32 (1040749098)) (f32 (3184771677)) (f32 (1035721915)) 26 4294967295 0 14 117
  = (26, 0, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0479 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 55 0 4294967295 11 200
  = (55, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0480 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3191078679)) (f32 (3172099827)) 78 0 24 19 281
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0481 :
  samSubModeDamp_fun (f32 (3189365234)) (f32 (1049544655)) (f32 (1049984527)) 64 205 22 18 158
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0482 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 32 0 10 5 227
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0483 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 77 0 24 12 182
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0484 :
  samSubModeDamp_fun (f32 (3176616001)) (f32 (3192704205)) (f32 (1042925674)) 14 0 20 11 290
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0485 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 38 0 6 6 134
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0486 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1043132805)) (f32 (3174732401)) 74 0 17 17 123
  = (74, 1, 17).
Proof. vm_compute. reflexivity. Qed.


Example t_0487 :
  samSubModeDamp_fun (f32 (3191714926)) (f32 (3184381902)) (f32 (1037056888)) 43 286 0 6 286
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0488 :
  samSubModeDamp_fun (f32 (1044550852)) (f32 (3190337744)) (f32 (3166021747)) 77 260 0 16 261
  = (77, 261, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0489 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 73 0 9 11 104
  = (73, 1, 10).
Proof. vm_compute. reflexivity. Qed.


Example t_0490 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 14 0 24 15 129
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0491 :
  samSubModeDamp_fun (f32 (1034239116)) (f32 (1048747712)) (f32 (3185633823)) 42 4294967295 0 12 225
  = (42, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0492 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 0 0 4294967295 10 245
  = (0, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0493 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3185859318)) (f32 (1040361547)) 49 0 10 5 282
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0494 :
  samSubModeDamp_fun (f32 (3169767998)) (f32 (1047902213)) (f32 (3194396760)) 67 349 5 15 125
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0495 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 44 0 17 12 298
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0496 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 67 0 17 13 150
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0497 :
  samSubModeDamp_fun (f32 (1041048950)) (f32 (3192704205)) (f32 (3195228682)) 33 0 10 7 103
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0498 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 15 0 17 17 287
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0499 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1046685806)) (f32 (3177081564)) 37 0 18 18 274
  = (37, 1, 18).
Proof. vm_compute. reflexivity. Qed.


Example t_0500 :
  samSubModeDamp_fun (f32 (3181765586)) (f32 (3191457721)) (f32 (3185303707)) 8 103 0 14 103
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0501 :
  samSubModeDamp_fun (f32 (3182676073)) (f32 (3190439989)) (f32 (3189906356)) 35 290 0 19 291
  = (35, 291, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0502 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 71 0 15 10 282
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0503 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 23 0 8 16 178
  = (23, 1, 8).
Proof. vm_compute. reflexivity. Qed.


Example t_0504 :
  samSubModeDamp_fun (f32 (1041799947)) (f32 (3197606393)) (f32 (1036539703)) 48 4294967295 0 15 256
  = (48, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0505 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 54 0 4294967295 10 116
  = (54, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0506 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1046335202)) (f32 (1039196460)) 13 0 24 19 125
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0507 :
  samSubModeDamp_fun (f32 (3157937534)) (f32 (1023646296)) (f32 (1046878032)) 38 253 12 18 286
  = (38, 254, 12).
Proof. vm_compute. reflexivity. Qed.


Example t_0508 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 23 0 16 8 298
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0509 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 76 0 16 15 288
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0510 :
  samSubModeDamp_fun (f32 (1021477630)) (f32 (3192704205)) (f32 (3162501538)) 30 0 12 14 196
  = (30, 1, 12).
Proof. vm_compute. reflexivity. Qed.


Example t_0511 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 16 0 9 9 242
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0512 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1045081114)) (f32 (1047135867)) 77 0 20 20 276
  = (77, 1, 20).
Proof. vm_compute. reflexivity. Qed.


Example t_0513 :
  samSubModeDamp_fun (f32 (3159109917)) (f32 (3171961139)) (f32 (3196308322)) 68 192 0 10 192
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0514 :
  samSubModeDamp_fun (f32 (3164041738)) (f32 (3196861400)) (f32 (3190971415)) 27 119 0 14 120
  = (27, 120, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0515 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 20 0 4 5 200
  = (20, 1, 5).
Proof. vm_compute. reflexivity. Qed.


Example t_0516 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 42 0 18 18 175
  = (42, 1, 18).
Proof. vm_compute. reflexivity. Qed.


Example t_0517 :
  samSubModeDamp_fun (f32 (1041976304)) (f32 (3194309040)) (f32 (3185403275)) 3 4294967295 0 16 235
  = (3, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0518 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 13 0 4294967295 6 291
  = (13, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0519 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1032144147)) (f32 (1019323599)) 12 0 21 16 203
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0520 :
  samSubModeDamp_fun (f32 (1048357985)) (f32 (1043267061)) (f32 (3189996765)) 13 197 3 11 229
  = (13, 198, 3).
Proof. vm_compute. reflexivity. Qed.


Example t_0521 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 67 0 0 15 128
  = (67, 1, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0522 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 37 0 17 15 148
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0523 :
  samSubModeDamp_fun (f32 (1030371027)) (f32 (3192704205)) (f32 (1017793127)) 61 0 1 10 188
  = (61, 1, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0524 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 51 0 5 5 229
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0525 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1048988347)) (f32 (3196918961)) 11 0 5 5 274
  = (11, 1, 5).
Proof. vm_compute. reflexivity. Qed.


Example t_0526 :
  samSubModeDamp_fun (f32 (3181414093)) (f32 (3186003064)) (f32 (3197365058)) 45 204 0 17 204
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0527 :
  samSubModeDamp_fun (f32 (1042462110)) (f32 (1038498766)) (f32 (3193293905)) 55 231 0 16 232
  = (55, 232, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0528 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 63 0 8 12 296
  = (63, 1, 9).
Proof. vm_compute. reflexivity. Qed.


Example t_0529 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 28 0 20 8 278
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0530 :
  samSubModeDamp_fun (f32 (1049887682)) (f32 (3177435534)) (f32 (1025385227)) 58 4294967295 0 6 190
  = (58, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0531 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 43 0 4294967295 11 121
  = (43, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0532 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1047825344)) (f32 (3171399389)) 33 0 22 17 149
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0533 :
  samSubModeDamp_fun (f32 (3171624822)) (f32 (3192021491)) (f32 (3187393189)) 20 165 19 14 242
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0534 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 71 0 13 14 146
  = (71, 1, 14).
Proof. vm_compute. reflexivity. Qed.


Example t_0535 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 59 0 5 7 200
  = (59, 1, 5).
Proof. vm_compute. reflexivity. Qed.


Example t_0536 :
  samSubModeDamp_fun (f32 (3193841615)) (f32 (3192704205)) (f32 (1024445375)) 62 0 23 14 247
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0537 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 67 0 13 13 238
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0538 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1042115571)) (f32 (3166741112)) 29 0 10 10 278
  = (29, 1, 10).
Proof. vm_compute. reflexivity. Qed.


Example t_0539 :
  samSubModeDamp_fun (f32 (1039119935)) (f32 (1042918159)) (f32 (1047476240)) 21 206 0 19 206
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0540 :
  samSubModeDamp_fun (f32 (3182893995)) (f32 (1049747183)) (f32 (3170984906)) 16 174 0 17 175
  = (16, 175, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0541 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 57 0 19 20 287
  = (57, 1, 20).
Proof. vm_compute. reflexivity. Qed.


Example t_0542 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 77 0 17 19 167
  = (77, 1, 17).
Proof. vm_compute. reflexivity. Qed.


Example t_0543 :
  samSubModeDamp_fun (f32 (3196417943)) (f32 (1047845619)) (f32 (1043548990)) 67 4294967295 0 5 197
  = (67, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0544 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 73 0 4294967295 20 198
  = (73, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0545 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3188856898)) (f32 (1017537460)) 36 0 17 12 186
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0546 :
  samSubModeDamp_fun (f32 (1026152188)) (f32 (3195488704)) (f32 (3161658365)) 6 61 21 12 261
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0547 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 9 0 25 17 110
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0548 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 4 0 14 15 131
  = (4, 1, 14).
Proof. vm_compute. reflexivity. Qed.


Example t_0549 :
  samSubModeDamp_fun (f32 (3187924102)) (f32 (3192704205)) (f32 (3173472059)) 56 0 19 10 233
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0550 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 27 0 5 5 290
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0551 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3170725914)) (f32 (1043918752)) 11 0 7 7 103
  = (11, 1, 7).
Proof. vm_compute. reflexivity. Qed.


Example t_0552 :
  samSubModeDamp_fun (f32 (1037030595)) (f32 (1032711739)) (f32 (1049254185)) 77 267 0 6 267
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0553 :
  samSubModeDamp_fun (f32 (3181852913)) (f32 (3193242365)) (f32 (3195597943)) 70 278 0 7 279
  = (70, 279, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0554 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 35 0 17 5 119
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0555 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 7 0 7 9 139
  = (7, 1, 7).
Proof. vm_compute. reflexivity. Qed.


Example t_0556 :
  samSubModeDamp_fun (f32 (3188982049)) (f32 (1033766259)) (f32 (3197309479)) 15 4294967295 0 7 245
  = (15, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0557 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 49 0 4294967295 13 164
  = (49, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0558 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1042258852)) (f32 (1036780425)) 41 0 23 18 133
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0559 :
  samSubModeDamp_fun (f32 (1040205068)) (f32 (1041943281)) (f32 (3195569875)) 38 329 21 17 117
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0560 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 3 0 22 19 175
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0561 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 12 0 4 11 187
  = (12, 1, 4).
Proof. vm_compute. reflexivity. Qed.


Example t_0562 :
  samSubModeDamp_fun (f32 (1047673512)) (f32 (3192704205)) (f32 (1045872965)) 68 0 4 8 285
  = (68, 1, 4).
Proof. vm_compute. reflexivity. Qed.


Example t_0563 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 19 0 6 6 145
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0564 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1038516106)) (f32 (3196903282)) 65 0 10 10 237
  = (65, 1, 10).
Proof. vm_compute. reflexivity. Qed.


Example t_0565 :
  samSubModeDamp_fun (f32 (3184111209)) (f32 (3189534031)) (f32 (1033775101)) 52 178 0 14 178
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0566 :
  samSubModeDamp_fun (f32 (1050153975)) (f32 (3196760039)) (f32 (3193863344)) 34 161 0 13 162
  = (34, 162, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0567 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 29 0 7 16 151
  = (29, 1, 8).
Proof. vm_compute. reflexivity. Qed.


Example t_0568 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 35 0 16 9 219
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0569 :
  samSubModeDamp_fun (f32 (1040415084)) (f32 (3191579094)) (f32 (3190828952)) 40 4294967295 0 20 133
  = (40, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0570 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 8 0 4294967295 6 119
  = (8, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0571 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3192392480)) (f32 (1048969343)) 47 0 20 15 105
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0572 :
  samSubModeDamp_fun (f32 (3195753642)) (f32 (3173365342)) (f32 (3193221294)) 51 259 12 7 282
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0573 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 42 0 7 7 175
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0574 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 20 0 1 15 196
  = (20, 1, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0575 :
  samSubModeDamp_fun (f32 (3173481334)) (f32 (3192704205)) (f32 (1018956739)) 49 0 6 10 210
  = (49, 1, 6).
Proof. vm_compute. reflexivity. Qed.


Example t_0576 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 27 0 5 5 245
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0577 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1040664585)) (f32 (1048958494)) 68 0 10 10 106
  = (68, 1, 10).
Proof. vm_compute. reflexivity. Qed.


Example t_0578 :
  samSubModeDamp_fun (f32 (1037800719)) (f32 (3185820566)) (f32 (3190414834)) 53 126 0 11 126
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0579 :
  samSubModeDamp_fun (f32 (1034606799)) (f32 (3177338097)) (f32 (3177902121)) 34 169 0 8 170
  = (34, 170, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0580 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 23 0 10 6 234
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0581 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 58 0 17 19 197
  = (58, 1, 17).
Proof. vm_compute. reflexivity. Qed.


Example t_0582 :
  samSubModeDamp_fun (f32 (1044039060)) (f32 (1046208416)) (f32 (1035468445)) 79 4294967295 0 15 160
  = (79, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0583 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 26 0 4294967295 12 194
  = (26, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0584 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1043561839)) (f32 (3190494125)) 68 0 15 10 213
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0585 :
  samSubModeDamp_fun (f32 (3188664579)) (f32 (1041641472)) (f32 (3185569504)) 6 209 16 17 132
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0586 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 72 0 18 9 214
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0587 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 76 0 4 5 114
  = (76, 1, 4).
Proof. vm_compute. reflexivity. Qed.


Example t_0588 :
  samSubModeDamp_fun (f32 (1039352148)) (f32 (3192704205)) (f32 (1049845663)) 31 0 9 12 103
  = (31, 1, 9).
Proof. vm_compute. reflexivity. Qed.


Example t_0589 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 38 0 17 17 187
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0590 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1026156195)) (f32 (3190488198)) 27 0 15 15 176
  = (27, 1, 15).
Proof. vm_compute. reflexivity. Qed.


Example t_0591 :
  samSubModeDamp_fun (f32 (1029758906)) (f32 (1049057787)) (f32 (1049460579)) 18 285 0 9 285
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0592 :
  samSubModeDamp_fun (f32 (3171084900)) (f32 (1002242415)) (f32 (3190309549)) 16 233 0 17 234
  = (16, 234, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0593 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 41 0 14 15 235
  = (41, 1, 15).
Proof. vm_compute. reflexivity. Qed.


Example t_0594 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 57 0 1 6 215
  = (57, 1, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0595 :
  samSubModeDamp_fun (f32 (1042627244)) (f32 (3196958830)) (f32 (1049406074)) 16 4294967295 0 19 264
  = (16, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0596 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 2 0 4294967295 19 252
  = (2, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0597 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3190691899)) (f32 (3172883813)) 2 0 17 12 189
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0598 :
  samSubModeDamp_fun (f32 (3182757762)) (f32 (3194995330)) (f32 (1026766537)) 69 128 2 13 286
  = (69, 129, 2).
Proof. vm_compute. reflexivity. Qed.


Example t_0599 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 56 0 21 5 280
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0600 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 62 0 8 16 118
  = (62, 1, 8).
Proof. vm_compute. reflexivity. Qed.


Example t_0601 :
  samSubModeDamp_fun (f32 (3180674948)) (f32 (3192704205)) (f32 (1029563449)) 44 0 2 18 239
  = (44, 1, 2).
Proof. vm_compute. reflexivity. Qed.


Example t_0602 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 42 0 13 13 130
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0603 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3170416180)) (f32 (1043398163)) 73 0 13 13 228
  = (73, 1, 13).
Proof. vm_compute. reflexivity. Qed.


Example t_0604 :
  samSubModeDamp_fun (f32 (3196756388)) (f32 (1045541527)) (f32 (1046912279)) 62 272 0 19 272
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0605 :
  samSubModeDamp_fun (f32 (3173280930)) (f32 (1027626990)) (f32 (1021757716)) 55 282 0 15 283
  = (55, 283, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0606 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 23 0 6 19 291
  = (23, 1, 7).
Proof. vm_compute. reflexivity. Qed.


Example t_0607 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 67 0 2 13 157
  = (67, 1, 2).
Proof. vm_compute. reflexivity. Qed.


Example t_0608 :
  samSubModeDamp_fun (f32 (3190842319)) (f32 (3171483218)) (f32 (3192398590)) 41 4294967295 0 8 184
  = (41, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0609 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 78 0 4294967295 12 241
  = (78, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0610 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3175357462)) (f32 (3194289841)) 68 0 22 17 252
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0611 :
  samSubModeDamp_fun (f32 (3175080137)) (f32 (1047854434)) (f32 (1049297099)) 3 342 19 20 170
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0612 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 14 0 11 20 192
  = (14, 1, 12).
Proof. vm_compute. reflexivity. Qed.


Example t_0613 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 18 0 21 15 269
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0614 :
  samSubModeDamp_fun (f32 (1042516153)) (f32 (3192704205)) (f32 (1047246634)) 4 0 16 15 260
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0615 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 73 0 17 17 195
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0616 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3188517645)) (f32 (3192271288)) 0 0 17 17 186
  = (0, 1, 17).
Proof. vm_compute. reflexivity. Qed.


Example t_0617 :
  samSubModeDamp_fun (f32 (3176228366)) (f32 (3188674474)) (f32 (3195805808)) 56 111 0 9 111
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0618 :
  samSubModeDamp_fun (f32 (3195120853)) (f32 (1044570247)) (f32 (3188687119)) 60 151 0 6 152
  = (60, 152, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0619 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 49 0 2 5 208
  = (49, 1, 3).
Proof. vm_compute. reflexivity. Qed.


Example t_0620 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 14 0 14 17 245
  = (14, 1, 14).
Proof. vm_compute. reflexivity. Qed.


Example t_0621 :
  samSubModeDamp_fun (f32 (3163135840)) (f32 (1049925845)) (f32 (3181256759)) 68 4294967295 0 12 216
  = (68, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0622 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 24 0 4294967295 10 101
  = (24, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0623 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1034427756)) (f32 (1028211693)) 48 0 25 20 239
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0624 :
  samSubModeDamp_fun (f32 (1042888918)) (f32 (3180783683)) (f32 (3173458573)) 10 102 24 11 268
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0625 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 51 0 2 12 100
  = (51, 1, 3).
Proof. vm_compute. reflexivity. Qed.


Example t_0626 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 50 0 11 12 183
  = (50, 1, 11).
Proof. vm_compute. reflexivity. Qed.


Example t_0627 :
  samSubModeDamp_fun (f32 (3187697119)) (f32 (3192704205)) (f32 (3195803057)) 2 0 23 12 273
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0628 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 37 0 10 10 252
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0629 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3196459166)) (f32 (1050238750)) 37 0 8 8 190
  = (37, 1, 8).
Proof. vm_compute. reflexivity. Qed.


Example t_0630 :
  samSubModeDamp_fun (f32 (1041703522)) (f32 (3188079616)) (f32 (3196602936)) 17 277 0 20 277
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0631 :
  samSubModeDamp_fun (f32 (3196231423)) (f32 (3194408169)) (f32 (3183388809)) 58 250 0 10 251
  = (58, 251, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0632 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 48 0 25 14 226
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0633 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 28 0 15 18 198
  = (28, 1, 15).
Proof. vm_compute. reflexivity. Qed.


Example t_0634 :
  samSubModeDamp_fun (f32 (1048798707)) (f32 (1046858322)) (f32 (3193496763)) 17 4294967295 0 16 235
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0635 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 79 0 4294967295 8 185
  = (79, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0636 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1045559707)) (f32 (3178604210)) 37 0 11 6 222
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0637 :
  samSubModeDamp_fun (f32 (3187780485)) (f32 (3189537545)) (f32 (3195300012)) 15 2 9 15 107
  = (15, 3, 9).
Proof. vm_compute. reflexivity. Qed.


Example t_0638 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 25 0 3 15 219
  = (25, 1, 4).
Proof. vm_compute. reflexivity. Qed.


Example t_0639 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 38 0 21 11 135
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0640 :
  samSubModeDamp_fun (f32 (3179789191)) (f32 (3192704205)) (f32 (3189198562)) 11 0 15 5 248
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0641 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 34 0 15 15 200
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0642 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1037278107)) (f32 (3191684302)) 40 0 13 13 208
  = (40, 1, 13).
Proof. vm_compute. reflexivity. Qed.


Example t_0643 :
  samSubModeDamp_fun (f32 (3190085093)) (f32 (3197164293)) (f32 (3193121351)) 7 286 0 13 286
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0644 :
  samSubModeDamp_fun (f32 (1047368285)) (f32 (1043585789)) (f32 (3187423612)) 67 117 0 20 118
  = (67, 118, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0645 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 76 0 2 13 129
  = (76, 1, 3).
Proof. vm_compute. reflexivity. Qed.


Example t_0646 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 25 0 13 15 128
  = (25, 1, 13).
Proof. vm_compute. reflexivity. Qed.


Example t_0647 :
  samSubModeDamp_fun (f32 (1034840088)) (f32 (3177105016)) (f32 (1042192173)) 64 4294967295 0 15 186
  = (64, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0648 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 4 0 4294967295 12 119
  = (4, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0649 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1015284180)) (f32 (1008879153)) 59 0 12 7 213
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0650 :
  samSubModeDamp_fun (f32 (3196351071)) (f32 (3194225848)) (f32 (1050245476)) 4 18 11 9 162
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0651 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 15 0 5 14 223
  = (15, 1, 6).
Proof. vm_compute. reflexivity. Qed.


Example t_0652 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 0 0 11 8 271
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0653 :
  samSubModeDamp_fun (f32 (1035504484)) (f32 (3192704205)) (f32 (1025386441)) 46 0 18 12 240
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0654 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 38 0 15 15 192
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0655 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1040983059)) (f32 (1041746153)) 8 0 5 5 187
  = (8, 1, 5).
Proof. vm_compute. reflexivity. Qed.


Example t_0656 :
  samSubModeDamp_fun (f32 (1038375596)) (f32 (3186313283)) (f32 (3183996210)) 23 136 0 12 136
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0657 :
  samSubModeDamp_fun (f32 (3188362944)) (f32 (1046809824)) (f32 (1042397317)) 10 280 0 10 281
  = (10, 281, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0658 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 76 0 8 16 193
  = (76, 1, 9).
Proof. vm_compute. reflexivity. Qed.


Example t_0659 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 49 0 6 8 135
  = (49, 1, 6).
Proof. vm_compute. reflexivity. Qed.


Example t_0660 :
  samSubModeDamp_fun (f32 (3180202679)) (f32 (1033499417)) (f32 (3197454774)) 1 4294967295 0 6 103
  = (1, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0661 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 44 0 4294967295 18 190
  = (44, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0662 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1049179175)) (f32 (1049797983)) 28 0 24 19 260
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0663 :
  samSubModeDamp_fun (f32 (3191823961)) (f32 (3197566520)) (f32 (3193434616)) 51 170 12 10 103
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0664 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 58 0 4 13 121
  = (58, 1, 5).
Proof. vm_compute. reflexivity. Qed.


Example t_0665 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 11 0 18 5 232
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0666 :
  samSubModeDamp_fun (f32 (1037302377)) (f32 (3192704205)) (f32 (1047235242)) 75 0 13 20 114
  = (75, 1, 13).
Proof. vm_compute. reflexivity. Qed.


Example t_0667 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 6 0 17 17 274
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0668 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3182124539)) (f32 (1025292571)) 28 0 6 6 288
  = (28, 1, 6).
Proof. vm_compute. reflexivity. Qed.


Example t_0669 :
  samSubModeDamp_fun (f32 (1018743615)) (f32 (1043117975)) (f32 (1034600348)) 60 254 0 17 254
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0670 :
  samSubModeDamp_fun (f32 (1040110129)) (f32 (3194947384)) (f32 (1033808347)) 74 176 0 15 177
  = (74, 177, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0671 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 39 0 11 11 171
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0672 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 66 0 16 19 103
  = (66, 1, 16).
Proof. vm_compute. reflexivity. Qed.


Example t_0673 :
  samSubModeDamp_fun (f32 (3195096947)) (f32 (3186665555)) (f32 (3190076650)) 26 4294967295 0 13 254
  = (26, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0674 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 40 0 4294967295 16 258
  = (40, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0675 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1049286091)) (f32 (3193623253)) 25 0 21 16 157
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0676 :
  samSubModeDamp_fun (f32 (1043229240)) (f32 (3179939944)) (f32 (3197011731)) 69 5 4 19 122
  = (69, 6, 4).
Proof. vm_compute. reflexivity. Qed.


Example t_0677 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 3 0 25 5 242
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0678 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 57 0 24 17 163
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0679 :
  samSubModeDamp_fun (f32 (1048880420)) (f32 (3192704205)) (f32 (3180130129)) 21 0 24 6 273
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0680 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 18 0 18 18 153
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0681 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1039954761)) (f32 (3192252848)) 78 0 6 6 248
  = (78, 1, 6).
Proof. vm_compute. reflexivity. Qed.


Example t_0682 :
  samSubModeDamp_fun (f32 (3194580972)) (f32 (1048093153)) (f32 (3176112084)) 24 263 0 16 263
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0683 :
  samSubModeDamp_fun (f32 (1049258420)) (f32 (1030485108)) (f32 (1050093212)) 48 204 0 8 205
  = (48, 205, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0684 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 12 0 23 9 215
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0685 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 63 0 0 8 129
  = (63, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0686 :
  samSubModeDamp_fun (f32 (1049724733)) (f32 (1048327703)) (f32 (3195501511)) 27 4294967295 0 10 289
  = (27, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0687 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 39 0 4294967295 6 247
  = (39, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0688 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3183809464)) (f32 (1034719446)) 58 0 16 11 283
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0689 :
  samSubModeDamp_fun (f32 (3182704517)) (f32 (3188621569)) (f32 (3194894200)) 23 90 1 19 252
  = (23, 91, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0690 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 39 0 21 6 113
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0691 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 29 0 25 13 174
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0692 :
  samSubModeDamp_fun (f32 (1049065252)) (f32 (3192704205)) (f32 (3180803540)) 46 0 9 14 260
  = (46, 1, 9).
Proof. vm_compute. reflexivity. Qed.


Example t_0693 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 44 0 17 17 172
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0694 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3194457239)) (f32 (3185762976)) 31 0 20 20 292
  = (31, 1, 20).
Proof. vm_compute. reflexivity. Qed.


Example t_0695 :
  samSubModeDamp_fun (f32 (3188749382)) (f32 (3188705593)) (f32 (1040655229)) 36 213 0 11 213
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0696 :
  samSubModeDamp_fun (f32 (1049879958)) (f32 (1044019477)) (f32 (3185775697)) 41 229 0 19 230
  = (41, 230, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0697 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 31 0 16 9 249
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0698 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 53 0 24 6 283
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0699 :
  samSubModeDamp_fun (f32 (1041264150)) (f32 (3182878539)) (f32 (3179272730)) 31 4294967295 0 11 157
  = (31, 0, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0700 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 34 0 4294967295 13 125
  = (34, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0701 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1031044407)) (f32 (3193094888)) 77 0 14 9 124
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0702 :
  samSubModeDamp_fun (f32 (1045213137)) (f32 (1046602520)) (f32 (1033110141)) 9 120 1 11 294
  = (9, 121, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0703 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 39 0 22 14 263
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0704 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 11 0 2 7 263
  = (11, 1, 2).
Proof. vm_compute. reflexivity. Qed.


Example t_0705 :
  samSubModeDamp_fun (f32 (3186741097)) (f32 (3192704205)) (f32 (3182810585)) 54 0 24 15 291
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0706 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 39 0 15 15 147
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0707 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1020031036)) (f32 (1045499335)) 39 0 16 16 234
  = (39, 1, 16).
Proof. vm_compute. reflexivity. Qed.


Example t_0708 :
  samSubModeDamp_fun (f32 (1043677098)) (f32 (3185091776)) (f32 (3190597284)) 48 207 0 18 207
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0709 :
  samSubModeDamp_fun (f32 (1041926551)) (f32 (3183094969)) (f32 (1035802915)) 62 264 0 11 265
  = (62, 265, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0710 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 13 0 15 5 158
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0711 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 42 0 13 13 270
  = (42, 1, 13).
Proof. vm_compute. reflexivity. Qed.


Example t_0712 :
  samSubModeDamp_fun (f32 (3184812752)) (f32 (3196810155)) (f32 (1043955218)) 16 4294967295 0 15 196
  = (16, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0713 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 32 0 4294967295 10 255
  = (32, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0714 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1045914866)) (f32 (1025036975)) 79 0 14 9 148
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0715 :
  samSubModeDamp_fun (f32 (3193418294)) (f32 (1026816111)) (f32 (3185359518)) 66 212 23 18 202
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0716 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 46 0 24 17 271
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0717 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 44 0 24 15 133
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0718 :
  samSubModeDamp_fun (f32 (3177462551)) (f32 (3192704205)) (f32 (1039631441)) 26 0 13 5 107
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0719 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 39 0 7 7 203
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0720 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3189506254)) (f32 (3163864021)) 61 0 12 12 111
  = (61, 1, 12).
Proof. vm_compute. reflexivity. Qed.


Example t_0721 :
  samSubModeDamp_fun (f32 (1048500517)) (f32 (3191721576)) (f32 (1042689844)) 67 223 0 12 223
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0722 :
  samSubModeDamp_fun (f32 (3191203859)) (f32 (3189909906)) (f32 (3166999315)) 48 121 0 17 122
  = (48, 122, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0723 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 24 0 16 11 254
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0724 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 63 0 25 7 279
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0725 :
  samSubModeDamp_fun (f32 (1032527578)) (f32 (3192616748)) (f32 (3189841935)) 51 4294967295 0 12 204
  = (51, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0726 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 28 0 4294967295 17 128
  = (28, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0727 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3192077622)) (f32 (1043281657)) 37 0 15 10 205
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0728 :
  samSubModeDamp_fun (f32 (1048732891)) (f32 (3176557697)) (f32 (1047928340)) 13 322 19 18 210
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0729 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 9 0 15 11 204
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0730 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 43 0 17 12 197
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0731 :
  samSubModeDamp_fun (f32 (1026462594)) (f32 (3192704205)) (f32 (1047491408)) 64 0 17 17 294
  = (64, 1, 17).
Proof. vm_compute. reflexivity. Qed.


Example t_0732 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 62 0 15 15 143
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0733 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3178629458)) (f32 (1009611166)) 57 0 7 7 243
  = (57, 1, 7).
Proof. vm_compute. reflexivity. Qed.


Example t_0734 :
  samSubModeDamp_fun (f32 (3193796304)) (f32 (3191480257)) (f32 (1043347904)) 56 286 0 13 286
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0735 :
  samSubModeDamp_fun (f32 (3195505380)) (f32 (3191061022)) (f32 (1048256001)) 66 124 0 5 125
  = (66, 125, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0736 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 4 0 15 5 174
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0737 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 53 0 2 6 298
  = (53, 1, 2).
Proof. vm_compute. reflexivity. Qed.


Example t_0738 :
  samSubModeDamp_fun (f32 (1047800469)) (f32 (1038381445)) (f32 (3194783651)) 42 4294967295 0 16 269
  = (42, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0739 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 4 0 4294967295 9 233
  = (4, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0740 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3197364068)) (f32 (1019113514)) 39 0 14 9 299
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0741 :
  samSubModeDamp_fun (f32 (1042638356)) (f32 (3189882344)) (f32 (1023790274)) 77 118 5 6 298
  = (77, 119, 5).
Proof. vm_compute. reflexivity. Qed.


Example t_0742 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 56 0 16 20 260
  = (56, 1, 17).
Proof. vm_compute. reflexivity. Qed.


Example t_0743 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 57 0 1 14 142
  = (57, 1, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0744 :
  samSubModeDamp_fun (f32 (1045142970)) (f32 (3192704205)) (f32 (1046092786)) 45 0 5 15 189
  = (45, 1, 5).
Proof. vm_compute. reflexivity. Qed.


Example t_0745 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 29 0 12 12 102
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0746 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3172504204)) (f32 (3185339899)) 30 0 10 10 158
  = (30, 1, 10).
Proof. vm_compute. reflexivity. Qed.


Example t_0747 :
  samSubModeDamp_fun (f32 (3194571394)) (f32 (1045696690)) (f32 (3174544950)) 19 197 0 12 197
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0748 :
  samSubModeDamp_fun (f32 (3188852854)) (f32 (1010464325)) (f32 (998838483)) 11 182 0 12 183
  = (11, 183, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0749 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 68 0 7 15 186
  = (68, 1, 8).
Proof. vm_compute. reflexivity. Qed.


Example t_0750 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 70 0 18 8 163
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0751 :
  samSubModeDamp_fun (f32 (1044087077)) (f32 (1045723736)) (f32 (3189832037)) 47 4294967295 0 13 149
  = (47, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0752 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 70 0 4294967295 19 112
  = (70, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0753 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1032984992)) (f32 (3196294456)) 71 0 19 14 222
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0754 :
  samSubModeDamp_fun (f32 (1046833849)) (f32 (1048274143)) (f32 (1049481858)) 53 141 4 7 213
  = (53, 142, 4).
Proof. vm_compute. reflexivity. Qed.


Example t_0755 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 63 0 4 6 227
  = (63, 1, 5).
Proof. vm_compute. reflexivity. Qed.


Example t_0756 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 54 0 25 8 152
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0757 :
  samSubModeDamp_fun (f32 (1043860864)) (f32 (3192704205)) (f32 (3188385930)) 23 0 23 5 152
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0758 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 76 0 17 17 284
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0759 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3187859054)) (f32 (3178924249)) 66 0 16 16 207
  = (66, 1, 16).
Proof. vm_compute. reflexivity. Qed.


Example t_0760 :
  samSubModeDamp_fun (f32 (1046869306)) (f32 (1042091723)) (f32 (1043579662)) 25 268 0 10 268
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0761 :
  samSubModeDamp_fun (f32 (3196842003)) (f32 (3163302840)) (f32 (3182079410)) 3 198 0 15 199
  = (3, 199, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0762 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 50 0 11 13 164
  = (50, 1, 12).
Proof. vm_compute. reflexivity. Qed.


Example t_0763 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 72 0 3 16 103
  = (72, 1, 3).
Proof. vm_compute. reflexivity. Qed.


Example t_0764 :
  samSubModeDamp_fun (f32 (3192493669)) (f32 (1027179280)) (f32 (1049824689)) 48 4294967295 0 17 211
  = (48, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0765 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 1 0 4294967295 13 239
  = (1, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0766 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3196867893)) (f32 (1040828187)) 28 0 18 13 178
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0767 :
  samSubModeDamp_fun (f32 (3163862972)) (f32 (1041571023)) (f32 (3197710379)) 16 27 4 18 189
  = (16, 28, 4).
Proof. vm_compute. reflexivity. Qed.


Example t_0768 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 20 0 25 8 220
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0769 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 39 0 12 8 287
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0770 :
  samSubModeDamp_fun (f32 (1024401336)) (f32 (3192704205)) (f32 (3176073647)) 44 0 11 11 102
  = (44, 1, 11).
Proof. vm_compute. reflexivity. Qed.


Example t_0771 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 77 0 8 8 146
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0772 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3189760219)) (f32 (1039856540)) 65 0 5 5 263
  = (65, 1, 5).
Proof. vm_compute. reflexivity. Qed.


Example t_0773 :
  samSubModeDamp_fun (f32 (1035743439)) (f32 (1024425167)) (f32 (1035126756)) 48 138 0 9 138
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0774 :
  samSubModeDamp_fun (f32 (3196451126)) (f32 (1046480553)) (f32 (1042701024)) 30 140 0 9 141
  = (30, 141, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0775 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 4 0 22 15 278
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0776 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 79 0 11 12 210
  = (79, 1, 11).
Proof. vm_compute. reflexivity. Qed.


Example t_0777 :
  samSubModeDamp_fun (f32 (1018266913)) (f32 (3195374391)) (f32 (1048953074)) 40 4294967295 0 11 144
  = (40, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0778 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 12 0 4294967295 19 224
  = (12, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0779 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1049971921)) (f32 (3175346300)) 42 0 15 10 270
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0780 :
  samSubModeDamp_fun (f32 (3116230245)) (f32 (1048691724)) (f32 (1036826409)) 26 174 19 15 183
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0781 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 17 0 24 8 237
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0782 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 68 0 6 11 106
  = (68, 1, 6).
Proof. vm_compute. reflexivity. Qed.


Example t_0783 :
  samSubModeDamp_fun (f32 (3193804764)) (f32 (3192704205)) (f32 (3170604444)) 49 0 5 18 125
  = (49, 1, 5).
Proof. vm_compute. reflexivity. Qed.


Example t_0784 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 53 0 20 20 150
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0785 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3194044906)) (f32 (1045626624)) 64 0 14 14 113
  = (64, 1, 14).
Proof. vm_compute. reflexivity. Qed.


Example t_0786 :
  samSubModeDamp_fun (f32 (3189337717)) (f32 (1002437212)) (f32 (1041387899)) 15 117 0 18 117
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0787 :
  samSubModeDamp_fun (f32 (1047781735)) (f32 (1045234488)) (f32 (1027460946)) 43 102 0 6 103
  = (43, 103, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0788 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 54 0 22 6 299
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0789 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 3 0 13 10 238
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0790 :
  samSubModeDamp_fun (f32 (3195266931)) (f32 (3192912847)) (f32 (1031302043)) 25 4294967295 0 13 159
  = (25, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0791 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 74 0 4294967295 17 105
  = (74, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0792 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3188002980)) (f32 (3181644542)) 66 0 21 16 118
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0793 :
  samSubModeDamp_fun (f32 (3192462730)) (f32 (1046602719)) (f32 (1036398526)) 12 52 11 11 260
  = (12, 53, 11).
Proof. vm_compute. reflexivity. Qed.


Example t_0794 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 77 0 1 6 154
  = (77, 1, 2).
Proof. vm_compute. reflexivity. Qed.


Example t_0795 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 23 0 22 8 298
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0796 :
  samSubModeDamp_fun (f32 (1041336086)) (f32 (3192704205)) (f32 (1048702734)) 19 0 14 16 188
  = (19, 1, 14).
Proof. vm_compute. reflexivity. Qed.


Example t_0797 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 69 0 16 16 281
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0798 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1029321544)) (f32 (3167199138)) 57 0 6 6 200
  = (57, 1, 6).
Proof. vm_compute. reflexivity. Qed.


Example t_0799 :
  samSubModeDamp_fun (f32 (1048860764)) (f32 (3192600793)) (f32 (3186888117)) 65 185 0 20 185
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0800 :
  samSubModeDamp_fun (f32 (3195986840)) (f32 (3188418584)) (f32 (3197577884)) 71 158 0 13 159
  = (71, 159, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0801 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 16 0 11 17 146
  = (16, 1, 12).
Proof. vm_compute. reflexivity. Qed.


Example t_0802 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 21 0 17 8 160
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0803 :
  samSubModeDamp_fun (f32 (3183114723)) (f32 (3192242339)) (f32 (3192517589)) 17 4294967295 0 14 259
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0804 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 22 0 4294967295 14 278
  = (22, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0805 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3181403887)) (f32 (3194376088)) 2 0 25 20 228
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0806 :
  samSubModeDamp_fun (f32 (3195699028)) (f32 (1040641860)) (f32 (3196402934)) 65 81 12 6 197
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0807 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 51 0 17 8 189
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0808 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 42 0 1 13 227
  = (42, 1, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0809 :
  samSubModeDamp_fun (f32 (1024756560)) (f32 (3192704205)) (f32 (1045474969)) 0 0 10 16 202
  = (0, 1, 10).
Proof. vm_compute. reflexivity. Qed.


Example t_0810 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 29 0 7 7 264
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0811 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1041292639)) (f32 (3197292493)) 66 0 19 19 254
  = (66, 1, 19).
Proof. vm_compute. reflexivity. Qed.


Example t_0812 :
  samSubModeDamp_fun (f32 (1043736257)) (f32 (1026720317)) (f32 (1040706652)) 53 294 0 20 294
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0813 :
  samSubModeDamp_fun (f32 (3194541015)) (f32 (1035307188)) (f32 (1041965409)) 53 243 0 11 244
  = (53, 244, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0814 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 7 0 14 11 152
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0815 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 32 0 25 13 108
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0816 :
  samSubModeDamp_fun (f32 (1045355972)) (f32 (1049214822)) (f32 (3185415809)) 17 4294967295 0 8 155
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0817 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 59 0 4294967295 16 131
  = (59, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0818 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1049810783)) (f32 (1042227272)) 62 0 15 10 287
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0819 :
  samSubModeDamp_fun (f32 (1039290427)) (f32 (1030504641)) (f32 (3193173425)) 54 161 8 10 230
  = (54, 162, 8).
Proof. vm_compute. reflexivity. Qed.


Example t_0820 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 32 0 20 10 296
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0821 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 78 0 18 8 194
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0822 :
  samSubModeDamp_fun (f32 (3192149274)) (f32 (3192704205)) (f32 (3178550134)) 49 0 11 8 278
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0823 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 39 0 10 10 199
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0824 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3192757016)) (f32 (1046790022)) 74 0 11 11 188
  = (74, 1, 11).
Proof. vm_compute. reflexivity. Qed.


Example t_0825 :
  samSubModeDamp_fun (f32 (3179783532)) (f32 (3190309607)) (f32 (1038315178)) 52 119 0 10 119
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0826 :
  samSubModeDamp_fun (f32 (3182463424)) (f32 (1032747399)) (f32 (3187885472)) 40 265 0 9 266
  = (40, 266, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0827 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 67 0 7 11 110
  = (67, 1, 8).
Proof. vm_compute. reflexivity. Qed.


Example t_0828 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 29 0 21 19 294
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0829 :
  samSubModeDamp_fun (f32 (3185049782)) (f32 (3176582530)) (f32 (1047969895)) 51 4294967295 0 13 150
  = (51, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0830 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 27 0 4294967295 8 111
  = (27, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0831 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1049636892)) (f32 (3191822190)) 7 0 20 15 218
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0832 :
  samSubModeDamp_fun (f32 (3190042466)) (f32 (3187845316)) (f32 (3197143963)) 61 299 14 12 267
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0833 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 3 0 24 10 185
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0834 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 43 0 19 16 220
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0835 :
  samSubModeDamp_fun (f32 (1031847513)) (f32 (3192704205)) (f32 (1049928869)) 38 0 7 20 261
  = (38, 1, 7).
Proof. vm_compute. reflexivity. Qed.


Example t_0836 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 6 0 11 11 231
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0837 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1031606652)) (f32 (1032619231)) 20 0 15 15 274
  = (20, 1, 15).
Proof. vm_compute. reflexivity. Qed.


Example t_0838 :
  samSubModeDamp_fun (f32 (3183021434)) (f32 (1027400096)) (f32 (3197242602)) 68 130 0 17 130
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0839 :
  samSubModeDamp_fun (f32 (3194524510)) (f32 (1048783974)) (f32 (3188598867)) 72 282 0 12 283
  = (72, 283, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0840 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 55 0 2 14 232
  = (55, 1, 3).
Proof. vm_compute. reflexivity. Qed.


Example t_0841 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 55 0 4 18 157
  = (55, 1, 4).
Proof. vm_compute. reflexivity. Qed.


Example t_0842 :
  samSubModeDamp_fun (f32 (1049303931)) (f32 (1038477292)) (f32 (3163288259)) 8 4294967295 0 14 240
  = (8, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0843 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 65 0 4294967295 7 125
  = (65, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0844 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3170106638)) (f32 (1049424412)) 28 0 14 9 108
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0845 :
  samSubModeDamp_fun (f32 (3176082274)) (f32 (1047903038)) (f32 (3146698012)) 78 10 2 18 296
  = (78, 11, 2).
Proof. vm_compute. reflexivity. Qed.


Example t_0846 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 33 0 2 20 269
  = (33, 1, 3).
Proof. vm_compute. reflexivity. Qed.


Example t_0847 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 78 0 3 6 280
  = (78, 1, 3).
Proof. vm_compute. reflexivity. Qed.


Example t_0848 :
  samSubModeDamp_fun (f32 (1045969825)) (f32 (3192704205)) (f32 (1048811777)) 28 0 12 10 103
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0849 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 33 0 14 14 218
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0850 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1040739205)) (f32 (1049065894)) 36 0 9 9 141
  = (36, 1, 9).
Proof. vm_compute. reflexivity. Qed.


Example t_0851 :
  samSubModeDamp_fun (f32 (1049487974)) (f32 (1036374428)) (f32 (3195899566)) 13 295 0 7 295
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0852 :
  samSubModeDamp_fun (f32 (3184904002)) (f32 (1035987389)) (f32 (3134376828)) 35 282 0 16 283
  = (35, 283, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0853 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 0 0 24 15 274
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0854 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 66 0 20 17 261
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0855 :
  samSubModeDamp_fun (f32 (1049389596)) (f32 (1043554499)) (f32 (3196385708)) 79 4294967295 0 9 193
  = (79, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0856 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 53 0 4294967295 5 147
  = (53, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0857 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3185922527)) (f32 (1049377898)) 43 0 22 17 210
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0858 :
  samSubModeDamp_fun (f32 (3190710715)) (f32 (1038799997)) (f32 (3182770635)) 63 179 14 6 212
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0859 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 1 0 16 17 261
  = (1, 1, 17).
Proof. vm_compute. reflexivity. Qed.


Example t_0860 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 66 0 21 20 230
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0861 :
  samSubModeDamp_fun (f32 (1033266375)) (f32 (3192704205)) (f32 (1049521723)) 27 0 20 13 122
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0862 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 72 0 8 8 295
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0863 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1040013039)) (f32 (3197275583)) 10 0 18 18 165
  = (10, 1, 18).
Proof. vm_compute. reflexivity. Qed.


Example t_0864 :
  samSubModeDamp_fun (f32 (1048438108)) (f32 (1037555569)) (f32 (1046196811)) 35 115 0 5 115
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0865 :
  samSubModeDamp_fun (f32 (1048971945)) (f32 (3182054311)) (f32 (1048238017)) 76 219 0 16 220
  = (76, 220, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0866 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 64 0 23 20 203
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0867 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 35 0 14 13 247
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0868 :
  samSubModeDamp_fun (f32 (1046732517)) (f32 (1036098707)) (f32 (3188303080)) 0 4294967295 0 15 125
  = (0, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0869 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 77 0 4294967295 10 172
  = (77, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0870 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3174939598)) (f32 (3197723665)) 18 0 22 17 155
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0871 :
  samSubModeDamp_fun (f32 (1040681087)) (f32 (3195330496)) (f32 (1048826771)) 70 207 13 10 177
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0872 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 78 0 19 16 291
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0873 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 7 0 22 20 279
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0874 :
  samSubModeDamp_fun (f32 (3196993180)) (f32 (3192704205)) (f32 (1025684352)) 57 0 0 19 165
  = (57, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0875 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 14 0 17 17 272
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0876 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1024438917)) (f32 (3168018566)) 37 0 15 15 141
  = (37, 1, 15).
Proof. vm_compute. reflexivity. Qed.


Example t_0877 :
  samSubModeDamp_fun (f32 (1041263991)) (f32 (1047707120)) (f32 (1019660918)) 32 220 0 5 220
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0878 :
  samSubModeDamp_fun (f32 (3196216744)) (f32 (1047837599)) (f32 (3176519324)) 9 174 0 19 175
  = (9, 175, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0879 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 22 0 17 7 189
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0880 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 69 0 1 10 108
  = (69, 1, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0881 :
  samSubModeDamp_fun (f32 (3169353954)) (f32 (1040490479)) (f32 (3196012365)) 77 4294967295 0 14 212
  = (77, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0882 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 49 0 4294967295 19 259
  = (49, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0883 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1000595720)) (f32 (1040353111)) 57 0 18 13 122
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0884 :
  samSubModeDamp_fun (f32 (1032269925)) (f32 (3165012473)) (f32 (3191526265)) 63 77 8 10 165
  = (63, 78, 8).
Proof. vm_compute. reflexivity. Qed.


Example t_0885 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 28 0 16 17 194
  = (28, 1, 17).
Proof. vm_compute. reflexivity. Qed.


Example t_0886 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 23 0 7 7 258
  = (23, 1, 7).
Proof. vm_compute. reflexivity. Qed.


Example t_0887 :
  samSubModeDamp_fun (f32 (1034273448)) (f32 (3192704205)) (f32 (978469578)) 54 0 5 6 190
  = (54, 1, 5).
Proof. vm_compute. reflexivity. Qed.


Example t_0888 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 57 0 6 6 298
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0889 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3190755889)) (f32 (1050247055)) 73 0 15 15 260
  = (73, 1, 15).
Proof. vm_compute. reflexivity. Qed.


Example t_0890 :
  samSubModeDamp_fun (f32 (1001522280)) (f32 (3178104724)) (f32 (1049853241)) 43 110 0 9 110
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0891 :
  samSubModeDamp_fun (f32 (3191445842)) (f32 (1044898023)) (f32 (3195299050)) 68 296 0 16 297
  = (68, 297, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0892 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 36 0 19 7 122
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0893 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 8 0 3 20 287
  = (8, 1, 3).
Proof. vm_compute. reflexivity. Qed.


Example t_0894 :
  samSubModeDamp_fun (f32 (1046061303)) (f32 (3194045899)) (f32 (1045317365)) 22 4294967295 0 15 198
  = (22, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0895 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 59 0 4294967295 12 274
  = (59, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0896 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1006224655)) (f32 (1045600961)) 27 0 23 18 255
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0897 :
  samSubModeDamp_fun (f32 (3194969142)) (f32 (3182599719)) (f32 (1041603479)) 11 268 25 13 239
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0898 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 30 0 0 16 171
  = (30, 1, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0899 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 42 0 12 20 126
  = (42, 1, 12).
Proof. vm_compute. reflexivity. Qed.


Example t_0900 :
  samSubModeDamp_fun (f32 (3188027837)) (f32 (3192704205)) (f32 (3193488862)) 18 0 14 10 146
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0901 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 9 0 15 15 160
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0902 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3177702655)) (f32 (3197582328)) 75 0 13 13 169
  = (75, 1, 13).
Proof. vm_compute. reflexivity. Qed.


Example t_0903 :
  samSubModeDamp_fun (f32 (3180957252)) (f32 (1041076200)) (f32 (1046360809)) 9 138 0 11 138
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0904 :
  samSubModeDamp_fun (f32 (1024612358)) (f32 (3197552507)) (f32 (3191432890)) 40 292 0 11 293
  = (40, 293, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0905 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 79 0 9 20 190
  = (79, 1, 10).
Proof. vm_compute. reflexivity. Qed.


Example t_0906 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 29 0 0 18 119
  = (29, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0907 :
  samSubModeDamp_fun (f32 (1030790578)) (f32 (3192626927)) (f32 (3189171444)) 55 4294967295 0 14 213
  = (55, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0908 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 22 0 4294967295 5 131
  = (22, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0909 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (956148240)) (f32 (3184274167)) 42 0 13 8 294
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0910 :
  samSubModeDamp_fun (f32 (3197265251)) (f32 (1041897801)) (f32 (3184730619)) 46 94 23 15 192
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0911 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 51 0 19 20 145
  = (51, 1, 20).
Proof. vm_compute. reflexivity. Qed.


Example t_0912 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 53 0 0 11 168
  = (53, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0913 :
  samSubModeDamp_fun (f32 (3195625805)) (f32 (3192704205)) (f32 (1046769460)) 68 0 14 13 223
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0914 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 5 0 7 7 158
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0915 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1050130690)) (f32 (3191443246)) 60 0 16 16 225
  = (60, 1, 16).
Proof. vm_compute. reflexivity. Qed.


Example t_0916 :
  samSubModeDamp_fun (f32 (1031685665)) (f32 (3196618169)) (f32 (3192517547)) 24 164 0 15 164
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0917 :
  samSubModeDamp_fun (f32 (1044247369)) (f32 (3197535093)) (f32 (1041453203)) 20 280 0 18 281
  = (20, 281, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0918 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 58 0 15 14 245
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0919 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 76 0 6 9 236
  = (76, 1, 6).
Proof. vm_compute. reflexivity. Qed.


Example t_0920 :
  samSubModeDamp_fun (f32 (1034423543)) (f32 (1036141654)) (f32 (3190513263)) 41 4294967295 0 10 208
  = (41, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0921 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 66 0 4294967295 6 235
  = (66, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0922 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1042178726)) (f32 (1025953358)) 53 0 25 20 141
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0923 :
  samSubModeDamp_fun (f32 (3187027570)) (f32 (1043559416)) (f32 (1042841295)) 39 150 21 16 198
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0924 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 33 0 13 20 266
  = (33, 1, 14).
Proof. vm_compute. reflexivity. Qed.


Example t_0925 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 9 0 11 11 112
  = (9, 1, 11).
Proof. vm_compute. reflexivity. Qed.


Example t_0926 :
  samSubModeDamp_fun (f32 (3188286872)) (f32 (3192704205)) (f32 (1044090877)) 77 0 25 10 241
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0927 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 25 0 14 14 234
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0928 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1049894405)) (f32 (3197668245)) 5 0 10 10 260
  = (5, 1, 10).
Proof. vm_compute. reflexivity. Qed.


Example t_0929 :
  samSubModeDamp_fun (f32 (1039567162)) (f32 (1032588514)) (f32 (3123340103)) 67 194 0 18 194
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0930 :
  samSubModeDamp_fun (f32 (3172556063)) (f32 (3189302245)) (f32 (1040918790)) 67 234 0 11 235
  = (67, 235, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0931 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 22 0 20 19 108
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0932 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 13 0 14 20 106
  = (13, 1, 14).
Proof. vm_compute. reflexivity. Qed.


Example t_0933 :
  samSubModeDamp_fun (f32 (3194864503)) (f32 (3179909827)) (f32 (3181661715)) 24 4294967295 0 16 204
  = (24, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0934 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 20 0 4294967295 6 246
  = (20, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0935 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3173175539)) (f32 (3189017932)) 34 0 18 13 149
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0936 :
  samSubModeDamp_fun (f32 (1049313616)) (f32 (3176031651)) (f32 (3188671043)) 61 179 7 9 277
  = (61, 180, 7).
Proof. vm_compute. reflexivity. Qed.


Example t_0937 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 5 0 25 7 252
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0938 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 1 0 17 16 164
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0939 :
  samSubModeDamp_fun (f32 (3188992280)) (f32 (3192704205)) (f32 (1049168651)) 51 0 8 16 174
  = (51, 1, 8).
Proof. vm_compute. reflexivity. Qed.


Example t_0940 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 51 0 10 10 130
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0941 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1020880153)) (f32 (1035107240)) 28 0 12 12 187
  = (28, 1, 12).
Proof. vm_compute. reflexivity. Qed.


Example t_0942 :
  samSubModeDamp_fun (f32 (1037667366)) (f32 (3162192713)) (f32 (3188800396)) 42 201 0 6 201
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0943 :
  samSubModeDamp_fun (f32 (1036776253)) (f32 (1041007123)) (f32 (1044902617)) 12 101 0 14 102
  = (12, 102, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0944 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 56 0 7 6 248
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0945 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 12 0 10 13 247
  = (12, 1, 10).
Proof. vm_compute. reflexivity. Qed.


Example t_0946 :
  samSubModeDamp_fun (f32 (1044712414)) (f32 (3194113172)) (f32 (1028786880)) 10 4294967295 0 18 172
  = (10, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0947 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 63 0 4294967295 9 174
  = (63, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0948 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3176876906)) (f32 (3193543146)) 72 0 20 15 299
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0949 :
  samSubModeDamp_fun (f32 (1038831975)) (f32 (3165434405)) (f32 (1047181779)) 74 304 3 12 163
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0950 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 4 0 4 20 178
  = (4, 1, 5).
Proof. vm_compute. reflexivity. Qed.


Example t_0951 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 29 0 23 20 214
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0952 :
  samSubModeDamp_fun (f32 (3190977654)) (f32 (3192704205)) (f32 (1036663760)) 25 0 5 18 283
  = (25, 1, 5).
Proof. vm_compute. reflexivity. Qed.


Example t_0953 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 48 0 11 11 106
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0954 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3197423923)) (f32 (1045167871)) 58 0 20 20 182
  = (58, 1, 20).
Proof. vm_compute. reflexivity. Qed.


Example t_0955 :
  samSubModeDamp_fun (f32 (3172153301)) (f32 (1014809969)) (f32 (3188902582)) 2 252 0 9 252
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0956 :
  samSubModeDamp_fun (f32 (1036656984)) (f32 (1032010346)) (f32 (3185855087)) 53 181 0 6 182
  = (53, 182, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0957 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 20 0 3 19 259
  = (20, 1, 4).
Proof. vm_compute. reflexivity. Qed.


Example t_0958 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 28 0 6 19 179
  = (28, 1, 6).
Proof. vm_compute. reflexivity. Qed.


Example t_0959 :
  samSubModeDamp_fun (f32 (1043471113)) (f32 (1049493924)) (f32 (3191841564)) 29 4294967295 0 20 216
  = (29, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0960 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 40 0 4294967295 9 152
  = (40, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0961 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1022149551)) (f32 (1046288314)) 43 0 21 16 235
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0962 :
  samSubModeDamp_fun (f32 (1016151718)) (f32 (1002681569)) (f32 (3189509078)) 9 122 21 7 265
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0963 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 73 0 22 11 199
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0964 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 43 0 8 20 110
  = (43, 1, 8).
Proof. vm_compute. reflexivity. Qed.


Example t_0965 :
  samSubModeDamp_fun (f32 (1044590172)) (f32 (3192704205)) (f32 (3196917358)) 54 0 8 19 168
  = (54, 1, 8).
Proof. vm_compute. reflexivity. Qed.


Example t_0966 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 67 0 20 20 138
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0967 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1039254685)) (f32 (1031764470)) 17 0 15 15 280
  = (17, 1, 15).
Proof. vm_compute. reflexivity. Qed.


Example t_0968 :
  samSubModeDamp_fun (f32 (1046492012)) (f32 (1024858791)) (f32 (1045102072)) 28 222 0 8 222
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0969 :
  samSubModeDamp_fun (f32 (3196745868)) (f32 (3189045122)) (f32 (1048744902)) 4 237 0 19 238
  = (4, 238, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0970 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 65 0 19 10 203
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0971 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 42 0 25 7 251
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0972 :
  samSubModeDamp_fun (f32 (1034306980)) (f32 (1033243182)) (f32 (1043890834)) 49 4294967295 0 7 197
  = (49, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0973 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 24 0 4294967295 7 276
  = (24, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0974 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1049695814)) (f32 (3192970809)) 61 0 13 8 216
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0975 :
  samSubModeDamp_fun (f32 (3190285507)) (f32 (1039434992)) (f32 (3189288035)) 18 304 12 19 160
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0976 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 56 0 5 5 241
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0977 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 18 0 6 20 107
  = (18, 1, 6).
Proof. vm_compute. reflexivity. Qed.


Example t_0978 :
  samSubModeDamp_fun (f32 (3194599165)) (f32 (3192704205)) (f32 (3187182154)) 31 0 24 5 193
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0979 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 56 0 9 9 279
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0980 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (3181970093)) (f32 (1048424456)) 67 0 9 9 215
  = (67, 1, 9).
Proof. vm_compute. reflexivity. Qed.


Example t_0981 :
  samSubModeDamp_fun (f32 (1049917644)) (f32 (3176088495)) (f32 (1039366693)) 74 212 0 11 212
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0982 :
  samSubModeDamp_fun (f32 (3170473159)) (f32 (3197644732)) (f32 (3174280081)) 13 261 0 9 262
  = (13, 262, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0983 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 44 0 15 16 299
  = (44, 1, 16).
Proof. vm_compute. reflexivity. Qed.


Example t_0984 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 64 0 5 19 204
  = (64, 1, 5).
Proof. vm_compute. reflexivity. Qed.


Example t_0985 :
  samSubModeDamp_fun (f32 (1049044307)) (f32 (1016071804)) (f32 (3195565759)) 66 4294967295 0 7 193
  = (66, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0986 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 24 0 4294967295 7 233
  = (24, 1, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0987 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1035527631)) (f32 (3195737462)) 75 0 14 9 251
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0988 :
  samSubModeDamp_fun (f32 (1032734958)) (f32 (1049342169)) (f32 (3180400259)) 34 20 3 7 230
  = (34, 21, 3).
Proof. vm_compute. reflexivity. Qed.


Example t_0989 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 14 0 13 14 252
  = (14, 1, 14).
Proof. vm_compute. reflexivity. Qed.


Example t_0990 :
  samSubModeDamp_fun (f32 (1041865114)) (f32 (1036831949)) (f32 (1036831949)) 32 0 6 5 195
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0991 :
  samSubModeDamp_fun (f32 (3186500864)) (f32 (3192704205)) (f32 (3177651492)) 75 0 4 11 145
  = (75, 1, 4).
Proof. vm_compute. reflexivity. Qed.


Example t_0992 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 46 0 17 17 256
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0993 :
  samSubModeDamp_fun (f32 (1065353216)) (f32 (1050086479)) (f32 (3166667591)) 35 0 14 14 154
  = (35, 1, 14).
Proof. vm_compute. reflexivity. Qed.


Example t_0994 :
  samSubModeDamp_fun (f32 (3133684526)) (f32 (3188377281)) (f32 (1049970487)) 19 203 0 5 203
  = (17, 0, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0995 :
  samSubModeDamp_fun (f32 (1043976763)) (f32 (1045765458)) (f32 (3194905519)) 56 159 0 11 160
  = (56, 160, 0).
Proof. vm_compute. reflexivity. Qed.


Example t_0996 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (1036831949)) (f32 (1036831949)) 32 0 3 11 296
  = (32, 1, 4).
Proof. vm_compute. reflexivity. Qed.


Example t_0997 :
  samSubModeDamp_fun (f32 (2143289344)) (f32 (2143289344)) (f32 (2143289344)) 74 0 7 14 251
  = (74, 1, 7).
Proof. vm_compute. reflexivity. Qed.


Example t_0998 :
  samSubModeDamp_fun (f32 (3178139370)) (f32 (3184013917)) (f32 (3179911975)) 13 4294967295 0 20 263
  = (13, 0, 1).
Proof. vm_compute. reflexivity. Qed.


Example t_0999 :
  samSubModeDamp_fun (f32 (1036831949)) (f32 (1036831949)) (f32 (1036831949)) 28 0 4294967295 12 115
  = (28, 1, 0).
Proof. vm_compute. reflexivity. Qed.
