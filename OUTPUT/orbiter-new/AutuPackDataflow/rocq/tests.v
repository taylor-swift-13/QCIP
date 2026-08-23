(* 由 FloatTest/tools/emit_tests.py 自动生成，请勿手改。
 * 每条约 1000 条向量一条 vm_compute 定理；coqc 编译通过即差分测试通过。 *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.
Require Import OUTPUT.orbiter_new.AutuPackDataflow.rocq.spec.

Import ListNotations.
Local Open Scope Z_scope.


Example t_0000 :
  autuPackDataflow_fun [0; 0; 5; 24; 25; 5]
  = [0; 25; 5; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0001 :
  autuPackDataflow_fun [1; 4; 3; 8; 12; 5]
  = [0; 0; 0; 0; 3; 3; 26; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0002 :
  autuPackDataflow_fun [0; 4; 1; 8; 29; 1]
  = [0; 29; 1; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0003 :
  autuPackDataflow_fun [1; 1; 2; 31; 29; 6]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0004 :
  autuPackDataflow_fun [0; 0; 0; 25; 12; 1]
  = [0; 12; 1; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0005 :
  autuPackDataflow_fun [1; 4; 3; 24; 12; 5]
  = [0; 0; 0; 0; 3; 3; 26; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0006 :
  autuPackDataflow_fun [0; 5; 2; 13; 2; 7]
  = [0; 2; 7; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0007 :
  autuPackDataflow_fun [1; 3; 5; 26; 5; 7]
  = [0; 0; 0; 1; 2; 3; 23; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0008 :
  autuPackDataflow_fun [0; 4; 2; 8; 26; 3]
  = [0; 26; 3; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0009 :
  autuPackDataflow_fun [1; 2; 1; 0; 18; 2]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0010 :
  autuPackDataflow_fun [0; 1; 5; 3; 20; 2]
  = [0; 20; 2; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0011 :
  autuPackDataflow_fun [1; 4; 3; 9; 30; 5]
  = [0; 0; 0; 1; 2; 3; 25; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0012 :
  autuPackDataflow_fun [0; 4; 4; 28; 13; 7]
  = [0; 13; 7; 2; 2; 4; 44; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0013 :
  autuPackDataflow_fun [1; 3; 0; 10; 8; 6]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0014 :
  autuPackDataflow_fun [0; 4; 5; 12; 24; 5]
  = [0; 24; 5; 2; 2; 4; 44; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0015 :
  autuPackDataflow_fun [1; 0; 4; 24; 6; 3]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0016 :
  autuPackDataflow_fun [0; 3; 4; 0; 22; 5]
  = [0; 22; 5; 0; 3; 3; 26; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0017 :
  autuPackDataflow_fun [1; 4; 0; 15; 18; 1]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0018 :
  autuPackDataflow_fun [0; 0; 5; 27; 12; 1]
  = [0; 12; 1; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0019 :
  autuPackDataflow_fun [1; 3; 3; 16; 15; 2]
  = [0; 0; 0; 0; 3; 3; 26; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0020 :
  autuPackDataflow_fun [0; 2; 3; 15; 15; 4]
  = [0; 15; 4; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0021 :
  autuPackDataflow_fun [1; 2; 2; 26; 13; 5]
  = [0; 0; 0; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0022 :
  autuPackDataflow_fun [0; 4; 2; 28; 17; 3]
  = [0; 17; 3; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0023 :
  autuPackDataflow_fun [1; 2; 1; 5; 13; 6]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0024 :
  autuPackDataflow_fun [0; 0; 0; 15; 17; 5]
  = [0; 17; 5; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0025 :
  autuPackDataflow_fun [1; 2; 5; 16; 21; 6]
  = [0; 0; 0; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0026 :
  autuPackDataflow_fun [0; 2; 3; 4; 8; 2]
  = [0; 8; 2; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0027 :
  autuPackDataflow_fun [1; 0; 4; 7; 11; 2]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0028 :
  autuPackDataflow_fun [0; 2; 1; 27; 20; 4]
  = [0; 20; 4; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0029 :
  autuPackDataflow_fun [1; 5; 0; 1; 7; 5]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0030 :
  autuPackDataflow_fun [0; 2; 3; 30; 8; 1]
  = [0; 8; 1; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0031 :
  autuPackDataflow_fun [1; 5; 0; 26; 28; 6]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0032 :
  autuPackDataflow_fun [0; 5; 2; 19; 19; 4]
  = [0; 19; 4; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0033 :
  autuPackDataflow_fun [1; 1; 1; 24; 5; 5]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0034 :
  autuPackDataflow_fun [0; 4; 3; 23; 21; 0]
  = [0; 21; 0; 3; 0; 3; 13; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0035 :
  autuPackDataflow_fun [1; 3; 3; 24; 19; 2]
  = [0; 0; 0; 0; 3; 3; 26; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0036 :
  autuPackDataflow_fun [0; 5; 0; 30; 2; 1]
  = [0; 2; 1; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0037 :
  autuPackDataflow_fun [1; 3; 4; 2; 29; 2]
  = [0; 0; 0; 1; 2; 3; 23; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0038 :
  autuPackDataflow_fun [0; 1; 4; 23; 19; 6]
  = [0; 19; 6; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0039 :
  autuPackDataflow_fun [1; 2; 3; 28; 3; 3]
  = [0; 0; 0; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0040 :
  autuPackDataflow_fun [0; 3; 1; 11; 3; 6]
  = [0; 3; 6; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0041 :
  autuPackDataflow_fun [1; 5; 3; 3; 21; 0]
  = [0; 0; 0; 2; 1; 3; 22; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0042 :
  autuPackDataflow_fun [0; 5; 2; 16; 14; 7]
  = [0; 14; 7; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0043 :
  autuPackDataflow_fun [1; 3; 1; 29; 0; 3]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0044 :
  autuPackDataflow_fun [0; 4; 5; 6; 31; 0]
  = [0; 31; 0; 2; 2; 4; 68; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0045 :
  autuPackDataflow_fun [1; 3; 5; 29; 21; 0]
  = [0; 0; 0; 2; 1; 3; 16; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0046 :
  autuPackDataflow_fun [0; 1; 1; 6; 0; 5]
  = [0; 0; 5; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0047 :
  autuPackDataflow_fun [1; 5; 2; 27; 18; 2]
  = [0; 0; 0; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0048 :
  autuPackDataflow_fun [0; 4; 3; 18; 22; 6]
  = [0; 22; 6; 1; 2; 3; 23; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0049 :
  autuPackDataflow_fun [1; 2; 4; 13; 18; 7]
  = [0; 0; 0; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0050 :
  autuPackDataflow_fun [0; 0; 1; 3; 12; 7]
  = [0; 12; 7; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0051 :
  autuPackDataflow_fun [1; 2; 3; 3; 22; 2]
  = [0; 0; 0; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0052 :
  autuPackDataflow_fun [0; 3; 4; 11; 5; 6]
  = [0; 5; 6; 2; 1; 3; 22; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0053 :
  autuPackDataflow_fun [1; 2; 2; 25; 4; 1]
  = [0; 0; 0; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0054 :
  autuPackDataflow_fun [0; 2; 1; 30; 30; 1]
  = [0; 30; 1; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0055 :
  autuPackDataflow_fun [1; 0; 4; 2; 7; 7]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0056 :
  autuPackDataflow_fun [0; 2; 3; 10; 6; 3]
  = [0; 6; 3; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0057 :
  autuPackDataflow_fun [1; 0; 0; 12; 9; 4]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0058 :
  autuPackDataflow_fun [0; 0; 0; 25; 16; 1]
  = [0; 16; 1; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0059 :
  autuPackDataflow_fun [1; 4; 3; 13; 30; 2]
  = [0; 0; 0; 2; 1; 3; 16; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0060 :
  autuPackDataflow_fun [0; 4; 0; 3; 28; 0]
  = [0; 28; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0061 :
  autuPackDataflow_fun [1; 5; 5; 12; 6; 6]
  = [0; 0; 0; 2; 3; 5; 206; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0062 :
  autuPackDataflow_fun [0; 4; 0; 30; 5; 5]
  = [0; 5; 5; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0063 :
  autuPackDataflow_fun [1; 5; 3; 28; 21; 2]
  = [0; 0; 0; 1; 2; 3; 17; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0064 :
  autuPackDataflow_fun [0; 4; 5; 1; 0; 6]
  = [0; 0; 6; 1; 3; 4; 79; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0065 :
  autuPackDataflow_fun [1; 2; 4; 4; 14; 1]
  = [0; 0; 0; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0066 :
  autuPackDataflow_fun [0; 4; 3; 10; 23; 4]
  = [0; 23; 4; 1; 2; 3; 23; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0067 :
  autuPackDataflow_fun [1; 0; 2; 14; 8; 1]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0068 :
  autuPackDataflow_fun [0; 4; 0; 25; 10; 6]
  = [0; 10; 6; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0069 :
  autuPackDataflow_fun [1; 3; 1; 23; 29; 5]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0070 :
  autuPackDataflow_fun [0; 1; 2; 8; 20; 7]
  = [0; 20; 7; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0071 :
  autuPackDataflow_fun [1; 4; 3; 18; 18; 0]
  = [0; 0; 0; 1; 2; 3; 23; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0072 :
  autuPackDataflow_fun [0; 5; 1; 16; 14; 7]
  = [0; 14; 7; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0073 :
  autuPackDataflow_fun [1; 0; 1; 4; 24; 7]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0074 :
  autuPackDataflow_fun [0; 5; 1; 5; 8; 7]
  = [0; 8; 7; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0075 :
  autuPackDataflow_fun [1; 0; 3; 22; 2; 6]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0076 :
  autuPackDataflow_fun [0; 2; 4; 9; 25; 3]
  = [0; 25; 3; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0077 :
  autuPackDataflow_fun [1; 3; 5; 10; 28; 4]
  = [0; 0; 0; 1; 2; 3; 23; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0078 :
  autuPackDataflow_fun [0; 3; 1; 9; 9; 0]
  = [0; 9; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0079 :
  autuPackDataflow_fun [1; 0; 1; 9; 0; 3]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0080 :
  autuPackDataflow_fun [0; 4; 4; 8; 17; 0]
  = [0; 17; 0; 1; 3; 4; 53; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0081 :
  autuPackDataflow_fun [1; 3; 0; 4; 6; 7]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0082 :
  autuPackDataflow_fun [0; 4; 2; 12; 10; 7]
  = [0; 10; 7; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0083 :
  autuPackDataflow_fun [1; 3; 4; 8; 17; 2]
  = [0; 0; 0; 0; 3; 3; 26; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0084 :
  autuPackDataflow_fun [0; 4; 4; 2; 1; 2]
  = [0; 1; 2; 1; 3; 4; 77; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0085 :
  autuPackDataflow_fun [1; 2; 4; 8; 17; 2]
  = [0; 0; 0; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0086 :
  autuPackDataflow_fun [0; 2; 3; 21; 31; 5]
  = [0; 31; 5; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0087 :
  autuPackDataflow_fun [1; 0; 3; 2; 26; 0]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0088 :
  autuPackDataflow_fun [0; 1; 5; 0; 28; 4]
  = [0; 28; 4; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0089 :
  autuPackDataflow_fun [1; 1; 0; 2; 22; 6]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0090 :
  autuPackDataflow_fun [0; 0; 1; 2; 27; 0]
  = [0; 27; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0091 :
  autuPackDataflow_fun [1; 1; 5; 15; 3; 7]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0092 :
  autuPackDataflow_fun [0; 5; 5; 20; 21; 6]
  = [0; 21; 6; 2; 3; 5; 152; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0093 :
  autuPackDataflow_fun [1; 5; 3; 4; 21; 3]
  = [0; 0; 0; 1; 2; 3; 17; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0094 :
  autuPackDataflow_fun [0; 1; 2; 14; 18; 2]
  = [0; 18; 2; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0095 :
  autuPackDataflow_fun [1; 0; 2; 13; 16; 5]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0096 :
  autuPackDataflow_fun [0; 3; 5; 8; 6; 2]
  = [0; 6; 2; 0; 3; 3; 26; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0097 :
  autuPackDataflow_fun [1; 3; 2; 3; 12; 7]
  = [0; 0; 0; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0098 :
  autuPackDataflow_fun [0; 5; 0; 10; 23; 1]
  = [0; 23; 1; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0099 :
  autuPackDataflow_fun [1; 0; 2; 18; 8; 7]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0100 :
  autuPackDataflow_fun [0; 2; 5; 30; 11; 7]
  = [0; 11; 7; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0101 :
  autuPackDataflow_fun [1; 0; 4; 26; 5; 0]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0102 :
  autuPackDataflow_fun [0; 1; 3; 14; 12; 1]
  = [0; 12; 1; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0103 :
  autuPackDataflow_fun [1; 5; 3; 6; 17; 7]
  = [0; 0; 0; 2; 1; 3; 14; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0104 :
  autuPackDataflow_fun [0; 1; 1; 31; 24; 0]
  = [0; 24; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0105 :
  autuPackDataflow_fun [1; 4; 1; 17; 7; 4]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0106 :
  autuPackDataflow_fun [0; 0; 0; 3; 4; 0]
  = [0; 4; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0107 :
  autuPackDataflow_fun [1; 0; 2; 10; 12; 0]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0108 :
  autuPackDataflow_fun [0; 0; 3; 16; 3; 0]
  = [0; 3; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0109 :
  autuPackDataflow_fun [1; 2; 2; 18; 27; 1]
  = [0; 0; 0; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0110 :
  autuPackDataflow_fun [0; 0; 2; 9; 2; 2]
  = [0; 2; 2; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0111 :
  autuPackDataflow_fun [1; 5; 2; 7; 19; 3]
  = [0; 0; 0; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0112 :
  autuPackDataflow_fun [0; 4; 3; 12; 16; 0]
  = [0; 16; 0; 1; 2; 3; 17; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0113 :
  autuPackDataflow_fun [1; 4; 3; 21; 12; 5]
  = [0; 0; 0; 2; 1; 3; 16; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0114 :
  autuPackDataflow_fun [0; 1; 4; 11; 30; 6]
  = [0; 30; 6; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0115 :
  autuPackDataflow_fun [1; 3; 0; 3; 14; 2]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0116 :
  autuPackDataflow_fun [0; 5; 4; 2; 6; 3]
  = [0; 6; 3; 1; 3; 4; 77; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0117 :
  autuPackDataflow_fun [1; 5; 3; 4; 24; 7]
  = [0; 0; 0; 1; 2; 3; 17; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0118 :
  autuPackDataflow_fun [0; 4; 0; 12; 11; 3]
  = [0; 11; 3; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0119 :
  autuPackDataflow_fun [1; 2; 4; 21; 12; 5]
  = [0; 0; 0; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0120 :
  autuPackDataflow_fun [0; 1; 4; 8; 29; 5]
  = [0; 29; 5; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0121 :
  autuPackDataflow_fun [1; 0; 2; 5; 0; 2]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0122 :
  autuPackDataflow_fun [0; 1; 5; 15; 20; 3]
  = [0; 20; 3; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0123 :
  autuPackDataflow_fun [1; 5; 4; 11; 27; 0]
  = [0; 0; 0; 3; 1; 4; 49; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0124 :
  autuPackDataflow_fun [0; 3; 5; 23; 29; 5]
  = [0; 29; 5; 3; 0; 3; 13; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0125 :
  autuPackDataflow_fun [1; 2; 1; 18; 7; 6]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0126 :
  autuPackDataflow_fun [0; 2; 5; 12; 26; 5]
  = [0; 26; 5; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0127 :
  autuPackDataflow_fun [1; 3; 1; 27; 21; 2]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0128 :
  autuPackDataflow_fun [0; 5; 4; 12; 16; 6]
  = [0; 16; 6; 2; 2; 4; 44; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0129 :
  autuPackDataflow_fun [1; 5; 0; 14; 27; 3]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0130 :
  autuPackDataflow_fun [0; 5; 4; 4; 22; 4]
  = [0; 22; 4; 1; 3; 4; 71; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0131 :
  autuPackDataflow_fun [1; 5; 5; 9; 19; 5]
  = [0; 0; 0; 2; 3; 5; 214; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0132 :
  autuPackDataflow_fun [0; 0; 1; 8; 3; 6]
  = [0; 3; 6; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0133 :
  autuPackDataflow_fun [1; 5; 3; 1; 14; 0]
  = [0; 0; 0; 1; 2; 3; 25; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0134 :
  autuPackDataflow_fun [0; 3; 1; 3; 10; 5]
  = [0; 10; 5; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0135 :
  autuPackDataflow_fun [1; 3; 4; 30; 24; 6]
  = [0; 0; 0; 2; 1; 3; 14; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0136 :
  autuPackDataflow_fun [0; 0; 3; 23; 24; 7]
  = [0; 24; 7; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0137 :
  autuPackDataflow_fun [1; 2; 1; 12; 5; 6]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0138 :
  autuPackDataflow_fun [0; 5; 0; 18; 18; 4]
  = [0; 18; 4; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0139 :
  autuPackDataflow_fun [1; 2; 0; 22; 18; 0]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0140 :
  autuPackDataflow_fun [0; 2; 5; 5; 30; 1]
  = [0; 30; 1; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0141 :
  autuPackDataflow_fun [1; 2; 4; 17; 13; 4]
  = [0; 0; 0; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0142 :
  autuPackDataflow_fun [0; 3; 4; 21; 27; 1]
  = [0; 27; 1; 2; 1; 3; 16; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0143 :
  autuPackDataflow_fun [1; 4; 1; 4; 6; 7]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0144 :
  autuPackDataflow_fun [0; 4; 2; 20; 27; 7]
  = [0; 27; 7; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0145 :
  autuPackDataflow_fun [1; 0; 2; 31; 1; 3]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0146 :
  autuPackDataflow_fun [0; 4; 0; 3; 15; 3]
  = [0; 15; 3; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0147 :
  autuPackDataflow_fun [1; 5; 0; 21; 4; 3]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0148 :
  autuPackDataflow_fun [0; 1; 3; 1; 10; 0]
  = [0; 10; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0149 :
  autuPackDataflow_fun [1; 3; 4; 29; 25; 1]
  = [0; 0; 0; 2; 1; 3; 16; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0150 :
  autuPackDataflow_fun [0; 5; 3; 22; 31; 3]
  = [0; 31; 3; 2; 1; 3; 14; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0151 :
  autuPackDataflow_fun [1; 0; 3; 24; 23; 0]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0152 :
  autuPackDataflow_fun [0; 0; 3; 13; 24; 0]
  = [0; 24; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0153 :
  autuPackDataflow_fun [1; 2; 2; 24; 16; 2]
  = [0; 0; 0; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0154 :
  autuPackDataflow_fun [0; 0; 4; 31; 23; 7]
  = [0; 23; 7; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0155 :
  autuPackDataflow_fun [1; 5; 4; 9; 6; 3]
  = [0; 0; 0; 2; 2; 4; 52; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0156 :
  autuPackDataflow_fun [0; 2; 0; 28; 29; 3]
  = [0; 29; 3; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0157 :
  autuPackDataflow_fun [1; 4; 2; 20; 31; 1]
  = [0; 0; 0; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0158 :
  autuPackDataflow_fun [0; 2; 3; 11; 28; 6]
  = [0; 28; 6; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0159 :
  autuPackDataflow_fun [1; 1; 2; 14; 6; 6]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0160 :
  autuPackDataflow_fun [0; 4; 5; 4; 13; 7]
  = [0; 13; 7; 1; 3; 4; 71; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0161 :
  autuPackDataflow_fun [1; 1; 3; 21; 3; 6]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0162 :
  autuPackDataflow_fun [0; 4; 2; 27; 21; 6]
  = [0; 21; 6; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0163 :
  autuPackDataflow_fun [1; 5; 0; 6; 22; 0]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0164 :
  autuPackDataflow_fun [0; 3; 1; 13; 27; 5]
  = [0; 27; 5; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0165 :
  autuPackDataflow_fun [1; 4; 5; 4; 24; 3]
  = [0; 0; 0; 1; 3; 4; 71; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0166 :
  autuPackDataflow_fun [0; 4; 0; 27; 3; 0]
  = [0; 3; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0167 :
  autuPackDataflow_fun [1; 3; 5; 31; 29; 7]
  = [0; 0; 0; 3; 0; 3; 13; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0168 :
  autuPackDataflow_fun [0; 2; 4; 17; 23; 1]
  = [0; 23; 1; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0169 :
  autuPackDataflow_fun [1; 2; 0; 26; 14; 2]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0170 :
  autuPackDataflow_fun [0; 2; 3; 27; 18; 6]
  = [0; 18; 6; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0171 :
  autuPackDataflow_fun [1; 5; 2; 29; 20; 1]
  = [0; 0; 0; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0172 :
  autuPackDataflow_fun [0; 4; 5; 25; 18; 3]
  = [0; 18; 3; 2; 2; 4; 52; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0173 :
  autuPackDataflow_fun [1; 3; 2; 4; 30; 7]
  = [0; 0; 0; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0174 :
  autuPackDataflow_fun [0; 4; 5; 1; 19; 4]
  = [0; 19; 4; 1; 3; 4; 79; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0175 :
  autuPackDataflow_fun [1; 0; 2; 16; 7; 5]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0176 :
  autuPackDataflow_fun [0; 2; 4; 9; 13; 2]
  = [0; 13; 2; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0177 :
  autuPackDataflow_fun [1; 0; 5; 30; 3; 4]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0178 :
  autuPackDataflow_fun [0; 0; 0; 27; 29; 7]
  = [0; 29; 7; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0179 :
  autuPackDataflow_fun [1; 0; 0; 0; 17; 3]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0180 :
  autuPackDataflow_fun [0; 0; 4; 23; 17; 3]
  = [0; 17; 3; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0181 :
  autuPackDataflow_fun [1; 2; 3; 18; 6; 5]
  = [0; 0; 0; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0182 :
  autuPackDataflow_fun [0; 3; 4; 12; 6; 2]
  = [0; 6; 2; 1; 2; 3; 17; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0183 :
  autuPackDataflow_fun [1; 1; 2; 1; 29; 5]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0184 :
  autuPackDataflow_fun [0; 0; 1; 6; 7; 7]
  = [0; 7; 7; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0185 :
  autuPackDataflow_fun [1; 0; 3; 13; 9; 7]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0186 :
  autuPackDataflow_fun [0; 0; 2; 27; 12; 6]
  = [0; 12; 6; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0187 :
  autuPackDataflow_fun [1; 1; 1; 13; 13; 1]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0188 :
  autuPackDataflow_fun [0; 5; 3; 2; 9; 6]
  = [0; 9; 6; 1; 2; 3; 23; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0189 :
  autuPackDataflow_fun [1; 3; 4; 23; 3; 4]
  = [0; 0; 0; 3; 0; 3; 13; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0190 :
  autuPackDataflow_fun [0; 3; 1; 21; 6; 7]
  = [0; 6; 7; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0191 :
  autuPackDataflow_fun [1; 1; 0; 12; 25; 3]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0192 :
  autuPackDataflow_fun [0; 3; 0; 8; 7; 5]
  = [0; 7; 5; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0193 :
  autuPackDataflow_fun [1; 3; 4; 31; 5; 0]
  = [0; 0; 0; 3; 0; 3; 13; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0194 :
  autuPackDataflow_fun [0; 4; 5; 9; 27; 4]
  = [0; 27; 4; 2; 2; 4; 52; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0195 :
  autuPackDataflow_fun [1; 5; 0; 20; 17; 4]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0196 :
  autuPackDataflow_fun [0; 0; 1; 30; 18; 4]
  = [0; 18; 4; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0197 :
  autuPackDataflow_fun [1; 0; 3; 0; 25; 3]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0198 :
  autuPackDataflow_fun [0; 5; 5; 2; 15; 0]
  = [0; 15; 0; 1; 4; 5; 239; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0199 :
  autuPackDataflow_fun [1; 4; 1; 10; 5; 5]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0200 :
  autuPackDataflow_fun [0; 4; 1; 30; 17; 2]
  = [0; 17; 2; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0201 :
  autuPackDataflow_fun [1; 1; 3; 19; 0; 2]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0202 :
  autuPackDataflow_fun [0; 5; 2; 20; 7; 5]
  = [0; 7; 5; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0203 :
  autuPackDataflow_fun [1; 4; 2; 2; 0; 7]
  = [0; 0; 0; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0204 :
  autuPackDataflow_fun [0; 5; 1; 14; 25; 2]
  = [0; 25; 2; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0205 :
  autuPackDataflow_fun [1; 3; 4; 29; 30; 6]
  = [0; 0; 0; 2; 1; 3; 16; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0206 :
  autuPackDataflow_fun [0; 4; 5; 5; 19; 6]
  = [0; 19; 6; 2; 2; 4; 70; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0207 :
  autuPackDataflow_fun [1; 3; 1; 24; 27; 7]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0208 :
  autuPackDataflow_fun [0; 3; 2; 15; 24; 4]
  = [0; 24; 4; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0209 :
  autuPackDataflow_fun [1; 4; 0; 15; 30; 5]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0210 :
  autuPackDataflow_fun [0; 2; 4; 13; 13; 5]
  = [0; 13; 5; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0211 :
  autuPackDataflow_fun [1; 1; 5; 10; 26; 3]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0212 :
  autuPackDataflow_fun [0; 5; 0; 14; 14; 1]
  = [0; 14; 1; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0213 :
  autuPackDataflow_fun [1; 5; 1; 2; 4; 4]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0214 :
  autuPackDataflow_fun [0; 0; 4; 20; 29; 4]
  = [0; 29; 4; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0215 :
  autuPackDataflow_fun [1; 1; 4; 6; 29; 1]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0216 :
  autuPackDataflow_fun [0; 4; 4; 10; 21; 3]
  = [0; 21; 3; 2; 2; 4; 50; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0217 :
  autuPackDataflow_fun [1; 1; 1; 5; 0; 4]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0218 :
  autuPackDataflow_fun [0; 3; 1; 1; 6; 5]
  = [0; 6; 5; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0219 :
  autuPackDataflow_fun [1; 4; 3; 9; 4; 0]
  = [0; 0; 0; 1; 2; 3; 25; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0220 :
  autuPackDataflow_fun [0; 5; 0; 15; 16; 5]
  = [0; 16; 5; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0221 :
  autuPackDataflow_fun [1; 3; 5; 11; 3; 4]
  = [0; 0; 0; 2; 1; 3; 22; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0222 :
  autuPackDataflow_fun [0; 5; 2; 5; 7; 0]
  = [0; 7; 0; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0223 :
  autuPackDataflow_fun [1; 0; 2; 9; 11; 3]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0224 :
  autuPackDataflow_fun [0; 4; 1; 20; 17; 2]
  = [0; 17; 2; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0225 :
  autuPackDataflow_fun [1; 2; 3; 18; 14; 3]
  = [0; 0; 0; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0226 :
  autuPackDataflow_fun [0; 5; 2; 15; 0; 4]
  = [0; 0; 4; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0227 :
  autuPackDataflow_fun [1; 2; 3; 25; 22; 2]
  = [0; 0; 0; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0228 :
  autuPackDataflow_fun [0; 1; 5; 12; 14; 1]
  = [0; 14; 1; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0229 :
  autuPackDataflow_fun [1; 3; 1; 17; 0; 5]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0230 :
  autuPackDataflow_fun [0; 4; 4; 24; 21; 0]
  = [0; 21; 0; 1; 3; 4; 53; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0231 :
  autuPackDataflow_fun [1; 0; 4; 24; 23; 2]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0232 :
  autuPackDataflow_fun [0; 3; 4; 27; 28; 4]
  = [0; 28; 4; 2; 1; 3; 22; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0233 :
  autuPackDataflow_fun [1; 3; 3; 7; 1; 0]
  = [0; 0; 0; 3; 0; 3; 13; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0234 :
  autuPackDataflow_fun [0; 1; 1; 14; 20; 6]
  = [0; 20; 6; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0235 :
  autuPackDataflow_fun [1; 3; 1; 7; 23; 0]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0236 :
  autuPackDataflow_fun [0; 1; 2; 26; 17; 7]
  = [0; 17; 7; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0237 :
  autuPackDataflow_fun [1; 2; 2; 31; 7; 7]
  = [0; 0; 0; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0238 :
  autuPackDataflow_fun [0; 0; 3; 10; 6; 1]
  = [0; 6; 1; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0239 :
  autuPackDataflow_fun [1; 2; 3; 14; 8; 5]
  = [0; 0; 0; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0240 :
  autuPackDataflow_fun [0; 5; 3; 20; 2; 5]
  = [0; 2; 5; 1; 2; 3; 17; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0241 :
  autuPackDataflow_fun [1; 2; 1; 0; 24; 4]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0242 :
  autuPackDataflow_fun [0; 4; 5; 23; 13; 7]
  = [0; 13; 7; 3; 1; 4; 67; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0243 :
  autuPackDataflow_fun [1; 3; 1; 6; 18; 6]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0244 :
  autuPackDataflow_fun [0; 1; 5; 30; 18; 3]
  = [0; 18; 3; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0245 :
  autuPackDataflow_fun [1; 3; 5; 27; 8; 3]
  = [0; 0; 0; 2; 1; 3; 22; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0246 :
  autuPackDataflow_fun [0; 5; 3; 25; 12; 6]
  = [0; 12; 6; 1; 2; 3; 25; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0247 :
  autuPackDataflow_fun [1; 3; 4; 3; 20; 0]
  = [0; 0; 0; 2; 1; 3; 22; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0248 :
  autuPackDataflow_fun [0; 1; 3; 25; 4; 5]
  = [0; 4; 5; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0249 :
  autuPackDataflow_fun [1; 2; 3; 25; 26; 2]
  = [0; 0; 0; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0250 :
  autuPackDataflow_fun [0; 1; 5; 6; 31; 2]
  = [0; 31; 2; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0251 :
  autuPackDataflow_fun [1; 3; 3; 7; 22; 2]
  = [0; 0; 0; 3; 0; 3; 13; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0252 :
  autuPackDataflow_fun [0; 2; 2; 10; 30; 7]
  = [0; 30; 7; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0253 :
  autuPackDataflow_fun [1; 3; 0; 27; 30; 6]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0254 :
  autuPackDataflow_fun [0; 4; 2; 12; 24; 3]
  = [0; 24; 3; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0255 :
  autuPackDataflow_fun [1; 4; 0; 19; 26; 4]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0256 :
  autuPackDataflow_fun [0; 3; 0; 3; 27; 1]
  = [0; 27; 1; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0257 :
  autuPackDataflow_fun [1; 5; 5; 24; 12; 6]
  = [0; 0; 0; 2; 3; 5; 134; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0258 :
  autuPackDataflow_fun [0; 4; 1; 30; 18; 0]
  = [0; 18; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0259 :
  autuPackDataflow_fun [1; 3; 3; 0; 21; 2]
  = [0; 0; 0; 0; 3; 3; 26; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0260 :
  autuPackDataflow_fun [0; 2; 2; 11; 13; 7]
  = [0; 13; 7; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0261 :
  autuPackDataflow_fun [1; 3; 5; 13; 4; 1]
  = [0; 0; 0; 2; 1; 3; 16; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0262 :
  autuPackDataflow_fun [0; 1; 0; 12; 1; 5]
  = [0; 1; 5; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0263 :
  autuPackDataflow_fun [1; 0; 3; 12; 27; 2]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0264 :
  autuPackDataflow_fun [0; 5; 0; 17; 5; 4]
  = [0; 5; 4; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0265 :
  autuPackDataflow_fun [1; 0; 2; 23; 28; 4]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0266 :
  autuPackDataflow_fun [0; 3; 4; 21; 31; 0]
  = [0; 31; 0; 2; 1; 3; 16; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0267 :
  autuPackDataflow_fun [1; 4; 2; 31; 24; 4]
  = [0; 0; 0; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0268 :
  autuPackDataflow_fun [0; 1; 5; 9; 13; 5]
  = [0; 13; 5; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0269 :
  autuPackDataflow_fun [1; 2; 1; 14; 13; 3]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0270 :
  autuPackDataflow_fun [0; 2; 3; 22; 23; 2]
  = [0; 23; 2; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0271 :
  autuPackDataflow_fun [1; 4; 0; 8; 1; 2]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0272 :
  autuPackDataflow_fun [0; 3; 0; 27; 1; 2]
  = [0; 1; 2; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0273 :
  autuPackDataflow_fun [1; 5; 2; 4; 20; 5]
  = [0; 0; 0; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0274 :
  autuPackDataflow_fun [0; 1; 4; 3; 16; 6]
  = [0; 16; 6; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0275 :
  autuPackDataflow_fun [1; 1; 1; 8; 20; 6]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0276 :
  autuPackDataflow_fun [0; 1; 1; 4; 16; 5]
  = [0; 16; 5; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0277 :
  autuPackDataflow_fun [1; 1; 4; 2; 16; 5]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0278 :
  autuPackDataflow_fun [0; 5; 0; 29; 21; 6]
  = [0; 21; 6; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0279 :
  autuPackDataflow_fun [1; 0; 4; 1; 30; 3]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0280 :
  autuPackDataflow_fun [0; 1; 3; 23; 28; 4]
  = [0; 28; 4; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0281 :
  autuPackDataflow_fun [1; 2; 1; 6; 14; 1]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0282 :
  autuPackDataflow_fun [0; 2; 2; 1; 16; 0]
  = [0; 16; 0; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0283 :
  autuPackDataflow_fun [1; 3; 1; 21; 11; 5]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0284 :
  autuPackDataflow_fun [0; 5; 5; 7; 8; 0]
  = [0; 8; 0; 3; 2; 5; 229; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0285 :
  autuPackDataflow_fun [1; 1; 4; 3; 6; 0]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0286 :
  autuPackDataflow_fun [0; 0; 2; 2; 26; 2]
  = [0; 26; 2; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0287 :
  autuPackDataflow_fun [1; 5; 3; 28; 15; 5]
  = [0; 0; 0; 1; 2; 3; 17; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0288 :
  autuPackDataflow_fun [0; 1; 5; 11; 6; 1]
  = [0; 6; 1; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0289 :
  autuPackDataflow_fun [1; 2; 0; 24; 1; 3]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0290 :
  autuPackDataflow_fun [0; 1; 4; 18; 16; 3]
  = [0; 16; 3; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0291 :
  autuPackDataflow_fun [1; 4; 4; 16; 6; 2]
  = [0; 0; 0; 0; 4; 4; 80; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0292 :
  autuPackDataflow_fun [0; 2; 1; 4; 21; 1]
  = [0; 21; 1; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0293 :
  autuPackDataflow_fun [1; 4; 0; 6; 20; 4]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0294 :
  autuPackDataflow_fun [0; 5; 3; 2; 18; 0]
  = [0; 18; 0; 1; 2; 3; 23; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0295 :
  autuPackDataflow_fun [1; 3; 4; 11; 21; 4]
  = [0; 0; 0; 2; 1; 3; 22; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0296 :
  autuPackDataflow_fun [0; 1; 3; 12; 21; 3]
  = [0; 21; 3; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0297 :
  autuPackDataflow_fun [1; 3; 2; 18; 29; 1]
  = [0; 0; 0; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0298 :
  autuPackDataflow_fun [0; 5; 0; 13; 28; 2]
  = [0; 28; 2; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0299 :
  autuPackDataflow_fun [1; 3; 2; 20; 8; 2]
  = [0; 0; 0; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0300 :
  autuPackDataflow_fun [0; 1; 1; 28; 7; 6]
  = [0; 7; 6; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0301 :
  autuPackDataflow_fun [1; 3; 3; 12; 5; 6]
  = [0; 0; 0; 1; 2; 3; 17; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0302 :
  autuPackDataflow_fun [0; 4; 3; 4; 12; 5]
  = [0; 12; 5; 1; 2; 3; 17; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0303 :
  autuPackDataflow_fun [1; 2; 1; 3; 21; 3]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0304 :
  autuPackDataflow_fun [0; 2; 5; 19; 19; 3]
  = [0; 19; 3; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0305 :
  autuPackDataflow_fun [1; 5; 4; 16; 9; 1]
  = [0; 0; 0; 0; 4; 4; 80; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0306 :
  autuPackDataflow_fun [0; 0; 2; 6; 0; 2]
  = [0; 0; 2; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0307 :
  autuPackDataflow_fun [1; 0; 0; 5; 22; 3]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0308 :
  autuPackDataflow_fun [0; 4; 4; 8; 27; 5]
  = [0; 27; 5; 1; 3; 4; 53; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0309 :
  autuPackDataflow_fun [1; 4; 5; 9; 30; 7]
  = [0; 0; 0; 2; 2; 4; 52; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0310 :
  autuPackDataflow_fun [0; 4; 3; 12; 22; 6]
  = [0; 22; 6; 1; 2; 3; 17; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0311 :
  autuPackDataflow_fun [1; 3; 4; 0; 31; 2]
  = [0; 0; 0; 0; 3; 3; 26; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0312 :
  autuPackDataflow_fun [0; 5; 5; 14; 10; 0]
  = [0; 10; 0; 3; 2; 5; 203; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0313 :
  autuPackDataflow_fun [1; 3; 4; 19; 26; 0]
  = [0; 0; 0; 2; 1; 3; 22; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0314 :
  autuPackDataflow_fun [0; 3; 3; 29; 26; 6]
  = [0; 26; 6; 2; 1; 3; 16; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0315 :
  autuPackDataflow_fun [1; 2; 0; 7; 27; 2]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0316 :
  autuPackDataflow_fun [0; 0; 2; 18; 23; 5]
  = [0; 23; 5; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0317 :
  autuPackDataflow_fun [1; 4; 0; 21; 19; 0]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0318 :
  autuPackDataflow_fun [0; 1; 0; 25; 15; 4]
  = [0; 15; 4; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0319 :
  autuPackDataflow_fun [1; 0; 2; 16; 19; 1]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0320 :
  autuPackDataflow_fun [0; 0; 3; 26; 7; 6]
  = [0; 7; 6; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0321 :
  autuPackDataflow_fun [1; 2; 0; 26; 20; 4]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0322 :
  autuPackDataflow_fun [0; 0; 2; 27; 31; 6]
  = [0; 31; 6; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0323 :
  autuPackDataflow_fun [1; 4; 5; 22; 22; 0]
  = [0; 0; 0; 2; 2; 4; 68; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0324 :
  autuPackDataflow_fun [0; 0; 5; 27; 10; 2]
  = [0; 10; 2; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0325 :
  autuPackDataflow_fun [1; 3; 2; 12; 18; 7]
  = [0; 0; 0; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0326 :
  autuPackDataflow_fun [0; 3; 4; 18; 3; 7]
  = [0; 3; 7; 1; 2; 3; 23; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0327 :
  autuPackDataflow_fun [1; 5; 3; 15; 28; 3]
  = [0; 0; 0; 3; 0; 3; 13; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0328 :
  autuPackDataflow_fun [0; 4; 2; 19; 20; 5]
  = [0; 20; 5; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0329 :
  autuPackDataflow_fun [1; 2; 2; 22; 27; 7]
  = [0; 0; 0; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0330 :
  autuPackDataflow_fun [0; 4; 0; 10; 4; 2]
  = [0; 4; 2; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0331 :
  autuPackDataflow_fun [1; 5; 2; 10; 31; 1]
  = [0; 0; 0; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0332 :
  autuPackDataflow_fun [0; 5; 5; 21; 15; 4]
  = [0; 15; 4; 3; 2; 5; 151; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0333 :
  autuPackDataflow_fun [1; 1; 4; 30; 20; 4]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0334 :
  autuPackDataflow_fun [0; 5; 1; 6; 18; 5]
  = [0; 18; 5; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0335 :
  autuPackDataflow_fun [1; 0; 0; 28; 13; 2]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0336 :
  autuPackDataflow_fun [0; 5; 5; 17; 26; 1]
  = [0; 26; 1; 2; 3; 5; 160; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0337 :
  autuPackDataflow_fun [1; 1; 3; 21; 25; 2]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0338 :
  autuPackDataflow_fun [0; 5; 1; 25; 23; 4]
  = [0; 23; 4; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0339 :
  autuPackDataflow_fun [1; 0; 2; 2; 26; 7]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0340 :
  autuPackDataflow_fun [0; 1; 1; 6; 22; 0]
  = [0; 22; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0341 :
  autuPackDataflow_fun [1; 1; 0; 17; 1; 5]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0342 :
  autuPackDataflow_fun [0; 0; 2; 30; 24; 1]
  = [0; 24; 1; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0343 :
  autuPackDataflow_fun [1; 0; 5; 7; 5; 1]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0344 :
  autuPackDataflow_fun [0; 1; 4; 15; 17; 2]
  = [0; 17; 2; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0345 :
  autuPackDataflow_fun [1; 3; 5; 23; 10; 5]
  = [0; 0; 0; 3; 0; 3; 13; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0346 :
  autuPackDataflow_fun [0; 5; 0; 21; 6; 4]
  = [0; 6; 4; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0347 :
  autuPackDataflow_fun [1; 3; 1; 22; 27; 2]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0348 :
  autuPackDataflow_fun [0; 2; 0; 2; 16; 5]
  = [0; 16; 5; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0349 :
  autuPackDataflow_fun [1; 0; 4; 3; 17; 2]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0350 :
  autuPackDataflow_fun [0; 4; 4; 21; 8; 6]
  = [0; 8; 6; 2; 2; 4; 70; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0351 :
  autuPackDataflow_fun [1; 3; 1; 2; 3; 1]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0352 :
  autuPackDataflow_fun [0; 4; 5; 23; 31; 2]
  = [0; 31; 2; 3; 1; 4; 67; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0353 :
  autuPackDataflow_fun [1; 3; 2; 5; 15; 7]
  = [0; 0; 0; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0354 :
  autuPackDataflow_fun [0; 5; 4; 10; 0; 3]
  = [0; 0; 3; 2; 2; 4; 50; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0355 :
  autuPackDataflow_fun [1; 0; 2; 2; 31; 5]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0356 :
  autuPackDataflow_fun [0; 3; 3; 4; 29; 4]
  = [0; 29; 4; 1; 2; 3; 17; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0357 :
  autuPackDataflow_fun [1; 3; 5; 4; 17; 7]
  = [0; 0; 0; 1; 2; 3; 17; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0358 :
  autuPackDataflow_fun [0; 5; 0; 13; 4; 0]
  = [0; 4; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0359 :
  autuPackDataflow_fun [1; 3; 1; 8; 4; 5]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0360 :
  autuPackDataflow_fun [0; 3; 2; 3; 25; 4]
  = [0; 25; 4; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0361 :
  autuPackDataflow_fun [1; 0; 3; 6; 11; 4]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0362 :
  autuPackDataflow_fun [0; 4; 3; 25; 18; 7]
  = [0; 18; 7; 1; 2; 3; 25; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0363 :
  autuPackDataflow_fun [1; 2; 2; 18; 9; 5]
  = [0; 0; 0; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0364 :
  autuPackDataflow_fun [0; 4; 3; 9; 5; 5]
  = [0; 5; 5; 1; 2; 3; 25; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0365 :
  autuPackDataflow_fun [1; 0; 0; 30; 7; 4]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0366 :
  autuPackDataflow_fun [0; 3; 4; 17; 28; 3]
  = [0; 28; 3; 1; 2; 3; 25; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0367 :
  autuPackDataflow_fun [1; 5; 2; 1; 12; 0]
  = [0; 0; 0; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0368 :
  autuPackDataflow_fun [0; 2; 1; 24; 5; 6]
  = [0; 5; 6; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0369 :
  autuPackDataflow_fun [1; 5; 3; 6; 2; 5]
  = [0; 0; 0; 2; 1; 3; 14; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0370 :
  autuPackDataflow_fun [0; 4; 1; 22; 23; 7]
  = [0; 23; 7; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0371 :
  autuPackDataflow_fun [1; 2; 4; 27; 19; 4]
  = [0; 0; 0; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0372 :
  autuPackDataflow_fun [0; 0; 0; 30; 11; 5]
  = [0; 11; 5; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0373 :
  autuPackDataflow_fun [1; 4; 5; 16; 30; 0]
  = [0; 0; 0; 0; 4; 4; 80; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0374 :
  autuPackDataflow_fun [0; 5; 2; 2; 12; 6]
  = [0; 12; 6; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0375 :
  autuPackDataflow_fun [1; 5; 0; 30; 18; 0]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0376 :
  autuPackDataflow_fun [0; 0; 2; 23; 15; 2]
  = [0; 15; 2; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0377 :
  autuPackDataflow_fun [1; 1; 1; 17; 3; 2]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0378 :
  autuPackDataflow_fun [0; 1; 0; 28; 31; 5]
  = [0; 31; 5; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0379 :
  autuPackDataflow_fun [1; 1; 2; 17; 29; 5]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0380 :
  autuPackDataflow_fun [0; 4; 3; 26; 19; 2]
  = [0; 19; 2; 1; 2; 3; 23; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0381 :
  autuPackDataflow_fun [1; 3; 4; 21; 18; 1]
  = [0; 0; 0; 2; 1; 3; 16; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0382 :
  autuPackDataflow_fun [0; 3; 4; 23; 16; 4]
  = [0; 16; 4; 3; 0; 3; 13; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0383 :
  autuPackDataflow_fun [1; 2; 5; 5; 22; 3]
  = [0; 0; 0; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0384 :
  autuPackDataflow_fun [0; 3; 4; 23; 8; 2]
  = [0; 8; 2; 3; 0; 3; 13; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0385 :
  autuPackDataflow_fun [1; 4; 4; 26; 15; 7]
  = [0; 0; 0; 2; 2; 4; 50; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0386 :
  autuPackDataflow_fun [0; 0; 0; 20; 14; 7]
  = [0; 14; 7; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0387 :
  autuPackDataflow_fun [1; 3; 2; 15; 25; 4]
  = [0; 0; 0; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0388 :
  autuPackDataflow_fun [0; 1; 2; 27; 16; 3]
  = [0; 16; 3; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0389 :
  autuPackDataflow_fun [1; 5; 0; 13; 31; 2]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0390 :
  autuPackDataflow_fun [0; 3; 4; 5; 3; 1]
  = [0; 3; 1; 2; 1; 3; 16; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0391 :
  autuPackDataflow_fun [1; 2; 5; 30; 10; 7]
  = [0; 0; 0; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0392 :
  autuPackDataflow_fun [0; 4; 3; 9; 17; 4]
  = [0; 17; 4; 1; 2; 3; 25; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0393 :
  autuPackDataflow_fun [1; 1; 5; 8; 25; 3]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0394 :
  autuPackDataflow_fun [0; 4; 3; 6; 10; 3]
  = [0; 10; 3; 2; 1; 3; 14; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0395 :
  autuPackDataflow_fun [1; 5; 3; 6; 12; 2]
  = [0; 0; 0; 2; 1; 3; 14; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0396 :
  autuPackDataflow_fun [0; 1; 1; 2; 8; 4]
  = [0; 8; 4; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0397 :
  autuPackDataflow_fun [1; 1; 2; 0; 3; 6]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0398 :
  autuPackDataflow_fun [0; 0; 0; 21; 27; 1]
  = [0; 27; 1; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0399 :
  autuPackDataflow_fun [1; 0; 1; 9; 22; 7]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0400 :
  autuPackDataflow_fun [0; 1; 1; 22; 28; 0]
  = [0; 28; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0401 :
  autuPackDataflow_fun [1; 1; 2; 16; 2; 7]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0402 :
  autuPackDataflow_fun [0; 1; 0; 5; 12; 0]
  = [0; 12; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0403 :
  autuPackDataflow_fun [1; 4; 5; 5; 11; 5]
  = [0; 0; 0; 2; 2; 4; 70; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0404 :
  autuPackDataflow_fun [0; 1; 1; 14; 2; 6]
  = [0; 2; 6; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0405 :
  autuPackDataflow_fun [1; 0; 3; 20; 23; 1]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0406 :
  autuPackDataflow_fun [0; 4; 0; 18; 16; 1]
  = [0; 16; 1; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0407 :
  autuPackDataflow_fun [1; 4; 5; 4; 17; 6]
  = [0; 0; 0; 1; 3; 4; 71; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0408 :
  autuPackDataflow_fun [0; 4; 0; 8; 25; 5]
  = [0; 25; 5; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0409 :
  autuPackDataflow_fun [1; 4; 1; 11; 1; 7]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0410 :
  autuPackDataflow_fun [0; 0; 1; 27; 16; 6]
  = [0; 16; 6; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0411 :
  autuPackDataflow_fun [1; 0; 2; 16; 12; 0]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0412 :
  autuPackDataflow_fun [0; 4; 2; 5; 29; 3]
  = [0; 29; 3; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0413 :
  autuPackDataflow_fun [1; 4; 4; 20; 31; 5]
  = [0; 0; 0; 1; 3; 4; 71; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0414 :
  autuPackDataflow_fun [0; 2; 3; 4; 10; 5]
  = [0; 10; 5; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0415 :
  autuPackDataflow_fun [1; 4; 2; 14; 27; 0]
  = [0; 0; 0; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0416 :
  autuPackDataflow_fun [0; 4; 0; 2; 13; 5]
  = [0; 13; 5; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0417 :
  autuPackDataflow_fun [1; 0; 1; 25; 26; 7]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0418 :
  autuPackDataflow_fun [0; 1; 0; 30; 27; 3]
  = [0; 27; 3; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0419 :
  autuPackDataflow_fun [1; 4; 2; 26; 6; 5]
  = [0; 0; 0; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0420 :
  autuPackDataflow_fun [0; 3; 0; 4; 0; 5]
  = [0; 0; 5; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0421 :
  autuPackDataflow_fun [1; 5; 1; 2; 15; 3]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0422 :
  autuPackDataflow_fun [0; 0; 3; 18; 17; 1]
  = [0; 17; 1; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0423 :
  autuPackDataflow_fun [1; 1; 3; 16; 2; 2]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0424 :
  autuPackDataflow_fun [0; 1; 1; 4; 15; 0]
  = [0; 15; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0425 :
  autuPackDataflow_fun [1; 1; 4; 15; 31; 4]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0426 :
  autuPackDataflow_fun [0; 3; 4; 12; 8; 6]
  = [0; 8; 6; 1; 2; 3; 17; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0427 :
  autuPackDataflow_fun [1; 4; 1; 0; 2; 7]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0428 :
  autuPackDataflow_fun [0; 5; 1; 27; 27; 4]
  = [0; 27; 4; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0429 :
  autuPackDataflow_fun [1; 4; 5; 14; 15; 3]
  = [0; 0; 0; 3; 1; 4; 41; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0430 :
  autuPackDataflow_fun [0; 2; 0; 23; 0; 1]
  = [0; 0; 1; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0431 :
  autuPackDataflow_fun [1; 4; 2; 17; 29; 3]
  = [0; 0; 0; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0432 :
  autuPackDataflow_fun [0; 4; 2; 14; 25; 7]
  = [0; 25; 7; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0433 :
  autuPackDataflow_fun [1; 1; 4; 21; 12; 5]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0434 :
  autuPackDataflow_fun [0; 0; 4; 27; 17; 2]
  = [0; 17; 2; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0435 :
  autuPackDataflow_fun [1; 2; 5; 15; 15; 1]
  = [0; 0; 0; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0436 :
  autuPackDataflow_fun [0; 4; 5; 23; 10; 7]
  = [0; 10; 7; 3; 1; 4; 67; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0437 :
  autuPackDataflow_fun [1; 1; 3; 24; 17; 3]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0438 :
  autuPackDataflow_fun [0; 2; 3; 19; 30; 1]
  = [0; 30; 1; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0439 :
  autuPackDataflow_fun [1; 2; 3; 27; 26; 4]
  = [0; 0; 0; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0440 :
  autuPackDataflow_fun [0; 0; 5; 19; 4; 6]
  = [0; 4; 6; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0441 :
  autuPackDataflow_fun [1; 5; 5; 13; 20; 7]
  = [0; 0; 0; 3; 2; 5; 205; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0442 :
  autuPackDataflow_fun [0; 3; 2; 31; 0; 4]
  = [0; 0; 4; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0443 :
  autuPackDataflow_fun [1; 1; 3; 10; 18; 3]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0444 :
  autuPackDataflow_fun [0; 1; 1; 16; 4; 7]
  = [0; 4; 7; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0445 :
  autuPackDataflow_fun [1; 1; 2; 20; 1; 6]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0446 :
  autuPackDataflow_fun [0; 0; 0; 30; 26; 3]
  = [0; 26; 3; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0447 :
  autuPackDataflow_fun [1; 3; 0; 15; 16; 6]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0448 :
  autuPackDataflow_fun [0; 4; 2; 29; 12; 7]
  = [0; 12; 7; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0449 :
  autuPackDataflow_fun [1; 5; 2; 6; 10; 0]
  = [0; 0; 0; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0450 :
  autuPackDataflow_fun [0; 3; 0; 25; 3; 2]
  = [0; 3; 2; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0451 :
  autuPackDataflow_fun [1; 4; 4; 11; 31; 4]
  = [0; 0; 0; 3; 1; 4; 49; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0452 :
  autuPackDataflow_fun [0; 1; 3; 22; 11; 0]
  = [0; 11; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0453 :
  autuPackDataflow_fun [1; 0; 0; 7; 7; 7]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0454 :
  autuPackDataflow_fun [0; 1; 4; 8; 19; 0]
  = [0; 19; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0455 :
  autuPackDataflow_fun [1; 1; 5; 4; 26; 3]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0456 :
  autuPackDataflow_fun [0; 5; 3; 26; 9; 3]
  = [0; 9; 3; 1; 2; 3; 23; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0457 :
  autuPackDataflow_fun [1; 2; 0; 21; 17; 4]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0458 :
  autuPackDataflow_fun [0; 4; 3; 18; 20; 0]
  = [0; 20; 0; 1; 2; 3; 23; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0459 :
  autuPackDataflow_fun [1; 5; 5; 14; 6; 5]
  = [0; 0; 0; 3; 2; 5; 203; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0460 :
  autuPackDataflow_fun [0; 1; 4; 23; 25; 4]
  = [0; 25; 4; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0461 :
  autuPackDataflow_fun [1; 0; 2; 4; 13; 7]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0462 :
  autuPackDataflow_fun [0; 5; 0; 28; 4; 7]
  = [0; 4; 7; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0463 :
  autuPackDataflow_fun [1; 1; 5; 22; 10; 5]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0464 :
  autuPackDataflow_fun [0; 4; 0; 30; 28; 6]
  = [0; 28; 6; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0465 :
  autuPackDataflow_fun [1; 1; 0; 12; 27; 0]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0466 :
  autuPackDataflow_fun [0; 2; 2; 29; 0; 5]
  = [0; 0; 5; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0467 :
  autuPackDataflow_fun [1; 0; 1; 14; 24; 6]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0468 :
  autuPackDataflow_fun [0; 0; 0; 4; 6; 3]
  = [0; 6; 3; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0469 :
  autuPackDataflow_fun [1; 0; 2; 12; 13; 6]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0470 :
  autuPackDataflow_fun [0; 4; 2; 21; 20; 1]
  = [0; 20; 1; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0471 :
  autuPackDataflow_fun [1; 5; 3; 9; 30; 0]
  = [0; 0; 0; 1; 2; 3; 25; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0472 :
  autuPackDataflow_fun [0; 1; 4; 8; 27; 3]
  = [0; 27; 3; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0473 :
  autuPackDataflow_fun [1; 2; 0; 22; 25; 4]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0474 :
  autuPackDataflow_fun [0; 2; 2; 15; 26; 6]
  = [0; 26; 6; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0475 :
  autuPackDataflow_fun [1; 5; 0; 26; 8; 2]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0476 :
  autuPackDataflow_fun [0; 0; 2; 2; 27; 4]
  = [0; 27; 4; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0477 :
  autuPackDataflow_fun [1; 1; 4; 16; 4; 5]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0478 :
  autuPackDataflow_fun [0; 3; 3; 28; 0; 4]
  = [0; 0; 4; 1; 2; 3; 17; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0479 :
  autuPackDataflow_fun [1; 3; 5; 10; 14; 4]
  = [0; 0; 0; 1; 2; 3; 23; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0480 :
  autuPackDataflow_fun [0; 2; 5; 9; 20; 7]
  = [0; 20; 7; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0481 :
  autuPackDataflow_fun [1; 2; 1; 30; 25; 5]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0482 :
  autuPackDataflow_fun [0; 3; 5; 1; 26; 3]
  = [0; 26; 3; 1; 2; 3; 25; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0483 :
  autuPackDataflow_fun [1; 2; 2; 7; 1; 2]
  = [0; 0; 0; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0484 :
  autuPackDataflow_fun [0; 5; 2; 29; 15; 0]
  = [0; 15; 0; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0485 :
  autuPackDataflow_fun [1; 2; 5; 11; 28; 0]
  = [0; 0; 0; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0486 :
  autuPackDataflow_fun [0; 1; 5; 0; 25; 5]
  = [0; 25; 5; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0487 :
  autuPackDataflow_fun [1; 3; 5; 22; 10; 3]
  = [0; 0; 0; 2; 1; 3; 14; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0488 :
  autuPackDataflow_fun [0; 1; 3; 21; 24; 0]
  = [0; 24; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0489 :
  autuPackDataflow_fun [1; 1; 3; 6; 29; 4]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0490 :
  autuPackDataflow_fun [0; 2; 1; 31; 17; 0]
  = [0; 17; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0491 :
  autuPackDataflow_fun [1; 2; 4; 2; 0; 2]
  = [0; 0; 0; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0492 :
  autuPackDataflow_fun [0; 3; 1; 8; 24; 6]
  = [0; 24; 6; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0493 :
  autuPackDataflow_fun [1; 3; 1; 29; 3; 0]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0494 :
  autuPackDataflow_fun [0; 3; 0; 17; 24; 5]
  = [0; 24; 5; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0495 :
  autuPackDataflow_fun [1; 4; 4; 7; 25; 1]
  = [0; 0; 0; 3; 1; 4; 67; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0496 :
  autuPackDataflow_fun [0; 0; 2; 24; 30; 1]
  = [0; 30; 1; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0497 :
  autuPackDataflow_fun [1; 1; 3; 27; 4; 4]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0498 :
  autuPackDataflow_fun [0; 5; 3; 1; 6; 5]
  = [0; 6; 5; 1; 2; 3; 25; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0499 :
  autuPackDataflow_fun [1; 4; 1; 24; 9; 4]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0500 :
  autuPackDataflow_fun [0; 3; 5; 27; 25; 4]
  = [0; 25; 4; 2; 1; 3; 22; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0501 :
  autuPackDataflow_fun [1; 1; 0; 13; 4; 3]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0502 :
  autuPackDataflow_fun [0; 1; 0; 10; 27; 1]
  = [0; 27; 1; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0503 :
  autuPackDataflow_fun [1; 1; 0; 3; 6; 2]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0504 :
  autuPackDataflow_fun [0; 4; 2; 9; 1; 5]
  = [0; 1; 5; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0505 :
  autuPackDataflow_fun [1; 1; 0; 23; 4; 1]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0506 :
  autuPackDataflow_fun [0; 0; 3; 12; 4; 5]
  = [0; 4; 5; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0507 :
  autuPackDataflow_fun [1; 3; 2; 4; 23; 2]
  = [0; 0; 0; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0508 :
  autuPackDataflow_fun [0; 4; 4; 29; 2; 6]
  = [0; 2; 6; 3; 1; 4; 43; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0509 :
  autuPackDataflow_fun [1; 2; 0; 15; 1; 5]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0510 :
  autuPackDataflow_fun [0; 5; 4; 17; 0; 2]
  = [0; 0; 2; 1; 3; 4; 79; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0511 :
  autuPackDataflow_fun [1; 0; 4; 24; 9; 7]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0512 :
  autuPackDataflow_fun [0; 4; 5; 22; 19; 2]
  = [0; 19; 2; 2; 2; 4; 68; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0513 :
  autuPackDataflow_fun [1; 3; 1; 28; 9; 0]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0514 :
  autuPackDataflow_fun [0; 4; 3; 6; 11; 0]
  = [0; 11; 0; 2; 1; 3; 14; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0515 :
  autuPackDataflow_fun [1; 1; 2; 12; 22; 7]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0516 :
  autuPackDataflow_fun [0; 2; 0; 20; 30; 5]
  = [0; 30; 5; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0517 :
  autuPackDataflow_fun [1; 1; 5; 26; 15; 4]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0518 :
  autuPackDataflow_fun [0; 3; 3; 4; 28; 2]
  = [0; 28; 2; 1; 2; 3; 17; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0519 :
  autuPackDataflow_fun [1; 2; 1; 4; 8; 4]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0520 :
  autuPackDataflow_fun [0; 2; 3; 13; 10; 4]
  = [0; 10; 4; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0521 :
  autuPackDataflow_fun [1; 1; 2; 20; 15; 1]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0522 :
  autuPackDataflow_fun [0; 1; 1; 30; 10; 7]
  = [0; 10; 7; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0523 :
  autuPackDataflow_fun [1; 3; 3; 31; 25; 3]
  = [0; 0; 0; 3; 0; 3; 13; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0524 :
  autuPackDataflow_fun [0; 3; 0; 0; 11; 3]
  = [0; 11; 3; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0525 :
  autuPackDataflow_fun [1; 4; 2; 13; 0; 3]
  = [0; 0; 0; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0526 :
  autuPackDataflow_fun [0; 5; 2; 12; 29; 0]
  = [0; 29; 0; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0527 :
  autuPackDataflow_fun [1; 5; 4; 23; 1; 5]
  = [0; 0; 0; 3; 1; 4; 67; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0528 :
  autuPackDataflow_fun [0; 1; 4; 12; 7; 1]
  = [0; 7; 1; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0529 :
  autuPackDataflow_fun [1; 2; 1; 29; 21; 4]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0530 :
  autuPackDataflow_fun [0; 4; 0; 19; 2; 2]
  = [0; 2; 2; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0531 :
  autuPackDataflow_fun [1; 4; 1; 31; 24; 3]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0532 :
  autuPackDataflow_fun [0; 2; 3; 4; 8; 1]
  = [0; 8; 1; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0533 :
  autuPackDataflow_fun [1; 5; 0; 1; 27; 2]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0534 :
  autuPackDataflow_fun [0; 3; 4; 29; 22; 4]
  = [0; 22; 4; 2; 1; 3; 16; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0535 :
  autuPackDataflow_fun [1; 1; 5; 24; 25; 0]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0536 :
  autuPackDataflow_fun [0; 1; 3; 7; 4; 0]
  = [0; 4; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0537 :
  autuPackDataflow_fun [1; 5; 5; 29; 6; 4]
  = [0; 0; 0; 4; 1; 5; 124; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0538 :
  autuPackDataflow_fun [0; 4; 3; 26; 6; 0]
  = [0; 6; 0; 1; 2; 3; 23; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0539 :
  autuPackDataflow_fun [1; 2; 2; 25; 28; 4]
  = [0; 0; 0; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0540 :
  autuPackDataflow_fun [0; 0; 2; 5; 26; 2]
  = [0; 26; 2; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0541 :
  autuPackDataflow_fun [1; 2; 0; 6; 14; 7]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0542 :
  autuPackDataflow_fun [0; 4; 5; 6; 21; 3]
  = [0; 21; 3; 2; 2; 4; 68; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0543 :
  autuPackDataflow_fun [1; 4; 0; 29; 23; 2]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0544 :
  autuPackDataflow_fun [0; 5; 2; 23; 21; 1]
  = [0; 21; 1; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0545 :
  autuPackDataflow_fun [1; 1; 4; 11; 2; 3]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0546 :
  autuPackDataflow_fun [0; 1; 0; 29; 0; 3]
  = [0; 0; 3; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0547 :
  autuPackDataflow_fun [1; 0; 4; 19; 23; 7]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0548 :
  autuPackDataflow_fun [0; 0; 4; 19; 8; 5]
  = [0; 8; 5; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0549 :
  autuPackDataflow_fun [1; 3; 5; 7; 2; 3]
  = [0; 0; 0; 3; 0; 3; 13; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0550 :
  autuPackDataflow_fun [0; 4; 5; 0; 4; 0]
  = [0; 4; 0; 0; 4; 4; 80; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0551 :
  autuPackDataflow_fun [1; 4; 4; 24; 30; 3]
  = [0; 0; 0; 1; 3; 4; 53; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0552 :
  autuPackDataflow_fun [0; 1; 3; 24; 21; 6]
  = [0; 21; 6; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0553 :
  autuPackDataflow_fun [1; 3; 1; 9; 22; 6]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0554 :
  autuPackDataflow_fun [0; 3; 5; 28; 1; 3]
  = [0; 1; 3; 1; 2; 3; 17; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0555 :
  autuPackDataflow_fun [1; 5; 1; 0; 5; 0]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0556 :
  autuPackDataflow_fun [0; 5; 3; 30; 14; 4]
  = [0; 14; 4; 2; 1; 3; 14; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0557 :
  autuPackDataflow_fun [1; 5; 0; 19; 21; 6]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0558 :
  autuPackDataflow_fun [0; 2; 1; 19; 11; 4]
  = [0; 11; 4; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0559 :
  autuPackDataflow_fun [1; 1; 5; 14; 28; 4]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0560 :
  autuPackDataflow_fun [0; 0; 4; 11; 31; 3]
  = [0; 31; 3; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0561 :
  autuPackDataflow_fun [1; 5; 3; 11; 26; 7]
  = [0; 0; 0; 2; 1; 3; 22; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0562 :
  autuPackDataflow_fun [0; 0; 3; 19; 20; 6]
  = [0; 20; 6; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0563 :
  autuPackDataflow_fun [1; 4; 3; 6; 10; 2]
  = [0; 0; 0; 2; 1; 3; 14; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0564 :
  autuPackDataflow_fun [0; 4; 0; 4; 2; 5]
  = [0; 2; 5; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0565 :
  autuPackDataflow_fun [1; 1; 0; 30; 6; 6]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0566 :
  autuPackDataflow_fun [0; 3; 4; 19; 27; 4]
  = [0; 27; 4; 2; 1; 3; 22; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0567 :
  autuPackDataflow_fun [1; 0; 5; 13; 4; 6]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0568 :
  autuPackDataflow_fun [0; 5; 1; 14; 10; 3]
  = [0; 10; 3; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0569 :
  autuPackDataflow_fun [1; 4; 3; 3; 3; 7]
  = [0; 0; 0; 2; 1; 3; 22; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0570 :
  autuPackDataflow_fun [0; 1; 1; 23; 3; 6]
  = [0; 3; 6; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0571 :
  autuPackDataflow_fun [1; 0; 5; 25; 22; 7]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0572 :
  autuPackDataflow_fun [0; 5; 5; 14; 18; 7]
  = [0; 18; 7; 3; 2; 5; 203; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0573 :
  autuPackDataflow_fun [1; 3; 3; 13; 17; 2]
  = [0; 0; 0; 2; 1; 3; 16; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0574 :
  autuPackDataflow_fun [0; 2; 5; 17; 10; 7]
  = [0; 10; 7; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0575 :
  autuPackDataflow_fun [1; 5; 2; 21; 7; 4]
  = [0; 0; 0; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0576 :
  autuPackDataflow_fun [0; 4; 1; 21; 28; 7]
  = [0; 28; 7; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0577 :
  autuPackDataflow_fun [1; 0; 1; 14; 17; 4]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0578 :
  autuPackDataflow_fun [0; 3; 2; 23; 7; 2]
  = [0; 7; 2; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0579 :
  autuPackDataflow_fun [1; 1; 1; 22; 29; 2]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0580 :
  autuPackDataflow_fun [0; 0; 2; 2; 21; 4]
  = [0; 21; 4; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0581 :
  autuPackDataflow_fun [1; 4; 2; 17; 13; 1]
  = [0; 0; 0; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0582 :
  autuPackDataflow_fun [0; 0; 4; 2; 7; 4]
  = [0; 7; 4; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0583 :
  autuPackDataflow_fun [1; 1; 0; 10; 29; 6]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0584 :
  autuPackDataflow_fun [0; 0; 5; 14; 12; 2]
  = [0; 12; 2; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0585 :
  autuPackDataflow_fun [1; 2; 3; 4; 29; 1]
  = [0; 0; 0; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0586 :
  autuPackDataflow_fun [0; 2; 5; 23; 28; 6]
  = [0; 28; 6; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0587 :
  autuPackDataflow_fun [1; 4; 2; 7; 3; 0]
  = [0; 0; 0; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0588 :
  autuPackDataflow_fun [0; 2; 5; 30; 0; 5]
  = [0; 0; 5; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0589 :
  autuPackDataflow_fun [1; 5; 0; 1; 16; 1]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0590 :
  autuPackDataflow_fun [0; 0; 1; 23; 10; 6]
  = [0; 10; 6; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0591 :
  autuPackDataflow_fun [1; 3; 5; 2; 6; 2]
  = [0; 0; 0; 1; 2; 3; 23; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0592 :
  autuPackDataflow_fun [0; 1; 3; 5; 24; 6]
  = [0; 24; 6; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0593 :
  autuPackDataflow_fun [1; 2; 4; 2; 21; 6]
  = [0; 0; 0; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0594 :
  autuPackDataflow_fun [0; 3; 2; 3; 0; 6]
  = [0; 0; 6; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0595 :
  autuPackDataflow_fun [1; 1; 1; 20; 7; 5]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0596 :
  autuPackDataflow_fun [0; 0; 2; 7; 17; 4]
  = [0; 17; 4; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0597 :
  autuPackDataflow_fun [1; 3; 1; 15; 9; 6]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0598 :
  autuPackDataflow_fun [0; 5; 0; 14; 27; 4]
  = [0; 27; 4; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0599 :
  autuPackDataflow_fun [1; 0; 5; 7; 25; 2]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0600 :
  autuPackDataflow_fun [0; 3; 5; 11; 1; 6]
  = [0; 1; 6; 2; 1; 3; 22; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0601 :
  autuPackDataflow_fun [1; 3; 1; 31; 12; 6]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0602 :
  autuPackDataflow_fun [0; 2; 3; 4; 12; 7]
  = [0; 12; 7; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0603 :
  autuPackDataflow_fun [1; 3; 0; 27; 1; 5]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0604 :
  autuPackDataflow_fun [0; 1; 3; 6; 8; 5]
  = [0; 8; 5; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0605 :
  autuPackDataflow_fun [1; 4; 1; 5; 6; 7]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0606 :
  autuPackDataflow_fun [0; 0; 0; 0; 30; 6]
  = [0; 30; 6; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0607 :
  autuPackDataflow_fun [1; 3; 3; 18; 5; 3]
  = [0; 0; 0; 1; 2; 3; 23; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0608 :
  autuPackDataflow_fun [0; 3; 2; 3; 1; 1]
  = [0; 1; 1; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0609 :
  autuPackDataflow_fun [1; 2; 5; 22; 6; 7]
  = [0; 0; 0; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0610 :
  autuPackDataflow_fun [0; 0; 1; 14; 22; 0]
  = [0; 22; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0611 :
  autuPackDataflow_fun [1; 0; 1; 2; 19; 5]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0612 :
  autuPackDataflow_fun [0; 1; 4; 22; 9; 2]
  = [0; 9; 2; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0613 :
  autuPackDataflow_fun [1; 0; 3; 22; 13; 1]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0614 :
  autuPackDataflow_fun [0; 2; 1; 12; 20; 2]
  = [0; 20; 2; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0615 :
  autuPackDataflow_fun [1; 1; 0; 19; 11; 7]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0616 :
  autuPackDataflow_fun [0; 0; 3; 3; 19; 6]
  = [0; 19; 6; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0617 :
  autuPackDataflow_fun [1; 1; 3; 8; 30; 7]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0618 :
  autuPackDataflow_fun [0; 1; 0; 20; 4; 1]
  = [0; 4; 1; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0619 :
  autuPackDataflow_fun [1; 1; 2; 7; 26; 3]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0620 :
  autuPackDataflow_fun [0; 2; 2; 19; 17; 6]
  = [0; 17; 6; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0621 :
  autuPackDataflow_fun [1; 2; 0; 12; 30; 4]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0622 :
  autuPackDataflow_fun [0; 1; 3; 11; 17; 6]
  = [0; 17; 6; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0623 :
  autuPackDataflow_fun [1; 4; 4; 3; 16; 4]
  = [0; 0; 0; 2; 2; 4; 76; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0624 :
  autuPackDataflow_fun [0; 3; 5; 23; 25; 0]
  = [0; 25; 0; 3; 0; 3; 13; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0625 :
  autuPackDataflow_fun [1; 1; 1; 27; 11; 5]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0626 :
  autuPackDataflow_fun [0; 4; 1; 20; 7; 7]
  = [0; 7; 7; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0627 :
  autuPackDataflow_fun [1; 0; 1; 1; 13; 3]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0628 :
  autuPackDataflow_fun [0; 0; 3; 12; 25; 0]
  = [0; 25; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0629 :
  autuPackDataflow_fun [1; 1; 3; 2; 11; 3]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0630 :
  autuPackDataflow_fun [0; 1; 5; 26; 31; 2]
  = [0; 31; 2; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0631 :
  autuPackDataflow_fun [1; 0; 3; 7; 26; 7]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0632 :
  autuPackDataflow_fun [0; 4; 2; 28; 24; 4]
  = [0; 24; 4; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0633 :
  autuPackDataflow_fun [1; 4; 0; 26; 25; 2]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0634 :
  autuPackDataflow_fun [0; 5; 4; 0; 23; 1]
  = [0; 23; 1; 0; 4; 4; 80; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0635 :
  autuPackDataflow_fun [1; 4; 0; 1; 8; 0]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0636 :
  autuPackDataflow_fun [0; 2; 5; 19; 2; 0]
  = [0; 2; 0; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0637 :
  autuPackDataflow_fun [1; 0; 0; 27; 26; 5]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0638 :
  autuPackDataflow_fun [0; 5; 1; 0; 23; 2]
  = [0; 23; 2; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0639 :
  autuPackDataflow_fun [1; 2; 5; 12; 10; 7]
  = [0; 0; 0; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0640 :
  autuPackDataflow_fun [0; 0; 3; 27; 13; 6]
  = [0; 13; 6; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0641 :
  autuPackDataflow_fun [1; 2; 3; 16; 4; 2]
  = [0; 0; 0; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0642 :
  autuPackDataflow_fun [0; 3; 3; 10; 13; 2]
  = [0; 13; 2; 1; 2; 3; 23; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0643 :
  autuPackDataflow_fun [1; 5; 0; 9; 17; 4]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0644 :
  autuPackDataflow_fun [0; 4; 1; 27; 19; 7]
  = [0; 19; 7; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0645 :
  autuPackDataflow_fun [1; 0; 0; 7; 19; 0]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0646 :
  autuPackDataflow_fun [0; 5; 5; 24; 11; 5]
  = [0; 11; 5; 2; 3; 5; 134; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0647 :
  autuPackDataflow_fun [1; 4; 4; 23; 4; 3]
  = [0; 0; 0; 3; 1; 4; 67; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0648 :
  autuPackDataflow_fun [0; 3; 4; 18; 1; 1]
  = [0; 1; 1; 1; 2; 3; 23; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0649 :
  autuPackDataflow_fun [1; 3; 2; 19; 6; 0]
  = [0; 0; 0; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0650 :
  autuPackDataflow_fun [0; 4; 1; 17; 26; 6]
  = [0; 26; 6; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0651 :
  autuPackDataflow_fun [1; 3; 0; 26; 12; 7]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0652 :
  autuPackDataflow_fun [0; 5; 5; 26; 20; 0]
  = [0; 20; 0; 3; 2; 5; 131; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0653 :
  autuPackDataflow_fun [1; 1; 1; 22; 14; 3]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0654 :
  autuPackDataflow_fun [0; 4; 3; 19; 21; 4]
  = [0; 21; 4; 2; 1; 3; 22; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0655 :
  autuPackDataflow_fun [1; 5; 1; 4; 24; 2]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0656 :
  autuPackDataflow_fun [0; 1; 4; 24; 14; 6]
  = [0; 14; 6; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0657 :
  autuPackDataflow_fun [1; 0; 0; 10; 27; 5]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0658 :
  autuPackDataflow_fun [0; 2; 1; 12; 7; 3]
  = [0; 7; 3; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0659 :
  autuPackDataflow_fun [1; 5; 5; 0; 3; 2]
  = [0; 0; 0; 0; 5; 5; 242; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0660 :
  autuPackDataflow_fun [0; 1; 3; 25; 31; 6]
  = [0; 31; 6; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0661 :
  autuPackDataflow_fun [1; 3; 4; 3; 20; 5]
  = [0; 0; 0; 2; 1; 3; 22; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0662 :
  autuPackDataflow_fun [0; 3; 2; 16; 3; 4]
  = [0; 3; 4; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0663 :
  autuPackDataflow_fun [1; 4; 0; 23; 25; 6]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0664 :
  autuPackDataflow_fun [0; 1; 5; 3; 19; 3]
  = [0; 19; 3; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0665 :
  autuPackDataflow_fun [1; 0; 4; 24; 23; 2]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0666 :
  autuPackDataflow_fun [0; 2; 4; 22; 10; 4]
  = [0; 10; 4; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0667 :
  autuPackDataflow_fun [1; 2; 5; 16; 17; 7]
  = [0; 0; 0; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0668 :
  autuPackDataflow_fun [0; 2; 2; 22; 3; 4]
  = [0; 3; 4; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0669 :
  autuPackDataflow_fun [1; 2; 2; 2; 1; 1]
  = [0; 0; 0; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0670 :
  autuPackDataflow_fun [0; 2; 0; 13; 0; 5]
  = [0; 0; 5; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0671 :
  autuPackDataflow_fun [1; 3; 5; 3; 13; 7]
  = [0; 0; 0; 2; 1; 3; 22; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0672 :
  autuPackDataflow_fun [0; 2; 2; 5; 28; 1]
  = [0; 28; 1; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0673 :
  autuPackDataflow_fun [1; 2; 2; 8; 21; 1]
  = [0; 0; 0; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0674 :
  autuPackDataflow_fun [0; 1; 1; 1; 18; 1]
  = [0; 18; 1; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0675 :
  autuPackDataflow_fun [1; 5; 1; 17; 22; 1]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0676 :
  autuPackDataflow_fun [0; 3; 4; 2; 14; 0]
  = [0; 14; 0; 1; 2; 3; 23; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0677 :
  autuPackDataflow_fun [1; 0; 1; 9; 24; 7]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0678 :
  autuPackDataflow_fun [0; 4; 5; 6; 22; 4]
  = [0; 22; 4; 2; 2; 4; 68; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0679 :
  autuPackDataflow_fun [1; 1; 1; 0; 27; 6]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0680 :
  autuPackDataflow_fun [0; 4; 1; 14; 20; 2]
  = [0; 20; 2; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0681 :
  autuPackDataflow_fun [1; 1; 2; 19; 3; 4]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0682 :
  autuPackDataflow_fun [0; 4; 4; 24; 17; 2]
  = [0; 17; 2; 1; 3; 4; 53; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0683 :
  autuPackDataflow_fun [1; 2; 0; 1; 14; 1]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0684 :
  autuPackDataflow_fun [0; 1; 1; 18; 4; 3]
  = [0; 4; 3; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0685 :
  autuPackDataflow_fun [1; 0; 0; 18; 31; 0]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0686 :
  autuPackDataflow_fun [0; 2; 5; 12; 17; 5]
  = [0; 17; 5; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0687 :
  autuPackDataflow_fun [1; 1; 3; 1; 1; 7]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0688 :
  autuPackDataflow_fun [0; 0; 1; 13; 18; 7]
  = [0; 18; 7; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0689 :
  autuPackDataflow_fun [1; 0; 1; 11; 21; 3]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0690 :
  autuPackDataflow_fun [0; 3; 4; 5; 22; 5]
  = [0; 22; 5; 2; 1; 3; 16; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0691 :
  autuPackDataflow_fun [1; 2; 5; 0; 10; 2]
  = [0; 0; 0; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0692 :
  autuPackDataflow_fun [0; 2; 5; 30; 23; 4]
  = [0; 23; 4; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0693 :
  autuPackDataflow_fun [1; 4; 2; 15; 14; 0]
  = [0; 0; 0; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0694 :
  autuPackDataflow_fun [0; 0; 2; 24; 9; 7]
  = [0; 9; 7; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0695 :
  autuPackDataflow_fun [1; 2; 0; 19; 1; 7]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0696 :
  autuPackDataflow_fun [0; 0; 2; 19; 15; 2]
  = [0; 15; 2; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0697 :
  autuPackDataflow_fun [1; 4; 4; 13; 1; 5]
  = [0; 0; 0; 3; 1; 4; 43; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0698 :
  autuPackDataflow_fun [0; 1; 1; 9; 19; 4]
  = [0; 19; 4; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0699 :
  autuPackDataflow_fun [1; 0; 5; 10; 29; 3]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0700 :
  autuPackDataflow_fun [0; 3; 4; 13; 15; 0]
  = [0; 15; 0; 2; 1; 3; 16; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0701 :
  autuPackDataflow_fun [1; 1; 3; 14; 21; 6]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0702 :
  autuPackDataflow_fun [0; 1; 0; 28; 26; 5]
  = [0; 26; 5; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0703 :
  autuPackDataflow_fun [1; 5; 1; 24; 22; 3]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0704 :
  autuPackDataflow_fun [0; 1; 1; 3; 0; 1]
  = [0; 0; 1; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0705 :
  autuPackDataflow_fun [1; 5; 0; 27; 0; 5]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0706 :
  autuPackDataflow_fun [0; 0; 2; 12; 9; 0]
  = [0; 9; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0707 :
  autuPackDataflow_fun [1; 5; 1; 0; 5; 5]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0708 :
  autuPackDataflow_fun [0; 3; 2; 10; 25; 0]
  = [0; 25; 0; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0709 :
  autuPackDataflow_fun [1; 2; 1; 23; 19; 4]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0710 :
  autuPackDataflow_fun [0; 0; 3; 7; 5; 5]
  = [0; 5; 5; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0711 :
  autuPackDataflow_fun [1; 0; 5; 22; 10; 0]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0712 :
  autuPackDataflow_fun [0; 3; 3; 6; 5; 5]
  = [0; 5; 5; 2; 1; 3; 14; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0713 :
  autuPackDataflow_fun [1; 4; 3; 3; 24; 5]
  = [0; 0; 0; 2; 1; 3; 22; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0714 :
  autuPackDataflow_fun [0; 2; 0; 11; 13; 6]
  = [0; 13; 6; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0715 :
  autuPackDataflow_fun [1; 4; 3; 27; 0; 2]
  = [0; 0; 0; 2; 1; 3; 22; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0716 :
  autuPackDataflow_fun [0; 2; 3; 23; 11; 1]
  = [0; 11; 1; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0717 :
  autuPackDataflow_fun [1; 1; 1; 8; 27; 1]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0718 :
  autuPackDataflow_fun [0; 1; 5; 27; 2; 5]
  = [0; 2; 5; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0719 :
  autuPackDataflow_fun [1; 0; 4; 16; 8; 5]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0720 :
  autuPackDataflow_fun [0; 3; 5; 22; 15; 0]
  = [0; 15; 0; 2; 1; 3; 14; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0721 :
  autuPackDataflow_fun [1; 2; 3; 6; 13; 5]
  = [0; 0; 0; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0722 :
  autuPackDataflow_fun [0; 2; 5; 20; 6; 0]
  = [0; 6; 0; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0723 :
  autuPackDataflow_fun [1; 4; 4; 30; 14; 4]
  = [0; 0; 0; 3; 1; 4; 41; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0724 :
  autuPackDataflow_fun [0; 5; 2; 3; 13; 3]
  = [0; 13; 3; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0725 :
  autuPackDataflow_fun [1; 4; 2; 10; 0; 7]
  = [0; 0; 0; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0726 :
  autuPackDataflow_fun [0; 3; 0; 28; 14; 2]
  = [0; 14; 2; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0727 :
  autuPackDataflow_fun [1; 4; 5; 23; 5; 6]
  = [0; 0; 0; 3; 1; 4; 67; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0728 :
  autuPackDataflow_fun [0; 1; 0; 4; 16; 5]
  = [0; 16; 5; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0729 :
  autuPackDataflow_fun [1; 0; 3; 30; 26; 4]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0730 :
  autuPackDataflow_fun [0; 4; 4; 25; 21; 3]
  = [0; 21; 3; 2; 2; 4; 52; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0731 :
  autuPackDataflow_fun [1; 3; 2; 0; 13; 2]
  = [0; 0; 0; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0732 :
  autuPackDataflow_fun [0; 5; 2; 8; 22; 0]
  = [0; 22; 0; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0733 :
  autuPackDataflow_fun [1; 5; 5; 24; 21; 6]
  = [0; 0; 0; 2; 3; 5; 134; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0734 :
  autuPackDataflow_fun [0; 3; 1; 0; 8; 7]
  = [0; 8; 7; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0735 :
  autuPackDataflow_fun [1; 5; 4; 1; 11; 5]
  = [0; 0; 0; 1; 3; 4; 79; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0736 :
  autuPackDataflow_fun [0; 0; 3; 10; 11; 3]
  = [0; 11; 3; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0737 :
  autuPackDataflow_fun [1; 0; 1; 3; 11; 3]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0738 :
  autuPackDataflow_fun [0; 2; 0; 8; 25; 7]
  = [0; 25; 7; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0739 :
  autuPackDataflow_fun [1; 4; 1; 10; 4; 4]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0740 :
  autuPackDataflow_fun [0; 3; 0; 8; 15; 2]
  = [0; 15; 2; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0741 :
  autuPackDataflow_fun [1; 5; 5; 7; 12; 1]
  = [0; 0; 0; 3; 2; 5; 229; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0742 :
  autuPackDataflow_fun [0; 4; 1; 27; 13; 1]
  = [0; 13; 1; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0743 :
  autuPackDataflow_fun [1; 0; 4; 23; 11; 0]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0744 :
  autuPackDataflow_fun [0; 2; 4; 15; 31; 3]
  = [0; 31; 3; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0745 :
  autuPackDataflow_fun [1; 3; 0; 1; 29; 5]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0746 :
  autuPackDataflow_fun [0; 4; 4; 6; 13; 4]
  = [0; 13; 4; 2; 2; 4; 68; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0747 :
  autuPackDataflow_fun [1; 5; 2; 23; 23; 0]
  = [0; 0; 0; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0748 :
  autuPackDataflow_fun [0; 5; 1; 28; 6; 1]
  = [0; 6; 1; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0749 :
  autuPackDataflow_fun [1; 0; 5; 30; 30; 6]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0750 :
  autuPackDataflow_fun [0; 2; 1; 5; 27; 5]
  = [0; 27; 5; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0751 :
  autuPackDataflow_fun [1; 1; 0; 0; 22; 4]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0752 :
  autuPackDataflow_fun [0; 2; 3; 5; 6; 2]
  = [0; 6; 2; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0753 :
  autuPackDataflow_fun [1; 4; 4; 31; 5; 4]
  = [0; 0; 0; 4; 0; 4; 40; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0754 :
  autuPackDataflow_fun [0; 2; 1; 27; 30; 2]
  = [0; 30; 2; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0755 :
  autuPackDataflow_fun [1; 4; 5; 1; 20; 3]
  = [0; 0; 0; 1; 3; 4; 79; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0756 :
  autuPackDataflow_fun [0; 3; 4; 6; 0; 4]
  = [0; 0; 4; 2; 1; 3; 14; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0757 :
  autuPackDataflow_fun [1; 5; 0; 14; 24; 4]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0758 :
  autuPackDataflow_fun [0; 4; 0; 26; 19; 2]
  = [0; 19; 2; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0759 :
  autuPackDataflow_fun [1; 3; 5; 9; 2; 3]
  = [0; 0; 0; 1; 2; 3; 25; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0760 :
  autuPackDataflow_fun [0; 0; 3; 3; 18; 6]
  = [0; 18; 6; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0761 :
  autuPackDataflow_fun [1; 4; 5; 24; 21; 7]
  = [0; 0; 0; 1; 3; 4; 53; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0762 :
  autuPackDataflow_fun [0; 1; 0; 28; 19; 1]
  = [0; 19; 1; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0763 :
  autuPackDataflow_fun [1; 2; 1; 28; 17; 2]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0764 :
  autuPackDataflow_fun [0; 3; 4; 7; 31; 3]
  = [0; 31; 3; 3; 0; 3; 13; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0765 :
  autuPackDataflow_fun [1; 2; 4; 16; 15; 7]
  = [0; 0; 0; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0766 :
  autuPackDataflow_fun [0; 2; 3; 27; 22; 0]
  = [0; 22; 0; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0767 :
  autuPackDataflow_fun [1; 1; 5; 19; 10; 6]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0768 :
  autuPackDataflow_fun [0; 4; 3; 29; 15; 0]
  = [0; 15; 0; 2; 1; 3; 16; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0769 :
  autuPackDataflow_fun [1; 5; 3; 8; 31; 2]
  = [0; 0; 0; 0; 3; 3; 26; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0770 :
  autuPackDataflow_fun [0; 5; 3; 2; 25; 3]
  = [0; 25; 3; 1; 2; 3; 23; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0771 :
  autuPackDataflow_fun [1; 1; 2; 9; 18; 6]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0772 :
  autuPackDataflow_fun [0; 4; 2; 3; 23; 6]
  = [0; 23; 6; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0773 :
  autuPackDataflow_fun [1; 5; 5; 23; 9; 2]
  = [0; 0; 0; 4; 1; 5; 148; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0774 :
  autuPackDataflow_fun [0; 2; 1; 16; 15; 6]
  = [0; 15; 6; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0775 :
  autuPackDataflow_fun [1; 0; 3; 11; 7; 6]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0776 :
  autuPackDataflow_fun [0; 0; 0; 17; 30; 1]
  = [0; 30; 1; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0777 :
  autuPackDataflow_fun [1; 5; 1; 2; 5; 7]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0778 :
  autuPackDataflow_fun [0; 0; 2; 27; 15; 4]
  = [0; 15; 4; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0779 :
  autuPackDataflow_fun [1; 3; 2; 8; 10; 1]
  = [0; 0; 0; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0780 :
  autuPackDataflow_fun [0; 5; 5; 1; 30; 7]
  = [0; 30; 7; 1; 4; 5; 241; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0781 :
  autuPackDataflow_fun [1; 2; 3; 24; 23; 7]
  = [0; 0; 0; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0782 :
  autuPackDataflow_fun [0; 0; 2; 1; 15; 4]
  = [0; 15; 4; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0783 :
  autuPackDataflow_fun [1; 5; 4; 22; 5; 2]
  = [0; 0; 0; 2; 2; 4; 68; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0784 :
  autuPackDataflow_fun [0; 4; 4; 8; 6; 3]
  = [0; 6; 3; 1; 3; 4; 53; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0785 :
  autuPackDataflow_fun [1; 3; 1; 10; 17; 6]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0786 :
  autuPackDataflow_fun [0; 3; 0; 25; 26; 2]
  = [0; 26; 2; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0787 :
  autuPackDataflow_fun [1; 3; 3; 28; 6; 6]
  = [0; 0; 0; 1; 2; 3; 17; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0788 :
  autuPackDataflow_fun [0; 1; 5; 22; 4; 5]
  = [0; 4; 5; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0789 :
  autuPackDataflow_fun [1; 3; 4; 20; 23; 1]
  = [0; 0; 0; 1; 2; 3; 17; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0790 :
  autuPackDataflow_fun [0; 0; 3; 3; 28; 5]
  = [0; 28; 5; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0791 :
  autuPackDataflow_fun [1; 4; 3; 9; 6; 2]
  = [0; 0; 0; 1; 2; 3; 25; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0792 :
  autuPackDataflow_fun [0; 3; 1; 26; 27; 1]
  = [0; 27; 1; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0793 :
  autuPackDataflow_fun [1; 1; 4; 27; 0; 3]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0794 :
  autuPackDataflow_fun [0; 0; 2; 11; 23; 4]
  = [0; 23; 4; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0795 :
  autuPackDataflow_fun [1; 4; 2; 30; 17; 6]
  = [0; 0; 0; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0796 :
  autuPackDataflow_fun [0; 4; 3; 7; 25; 4]
  = [0; 25; 4; 3; 0; 3; 13; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0797 :
  autuPackDataflow_fun [1; 1; 1; 3; 4; 0]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0798 :
  autuPackDataflow_fun [0; 5; 1; 23; 10; 5]
  = [0; 10; 5; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0799 :
  autuPackDataflow_fun [1; 3; 5; 23; 3; 7]
  = [0; 0; 0; 3; 0; 3; 13; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0800 :
  autuPackDataflow_fun [0; 3; 2; 20; 24; 6]
  = [0; 24; 6; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0801 :
  autuPackDataflow_fun [1; 2; 2; 1; 19; 7]
  = [0; 0; 0; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0802 :
  autuPackDataflow_fun [0; 0; 4; 8; 22; 6]
  = [0; 22; 6; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0803 :
  autuPackDataflow_fun [1; 5; 4; 28; 8; 4]
  = [0; 0; 0; 2; 2; 4; 44; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0804 :
  autuPackDataflow_fun [0; 1; 0; 4; 0; 2]
  = [0; 0; 2; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0805 :
  autuPackDataflow_fun [1; 5; 1; 27; 2; 5]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0806 :
  autuPackDataflow_fun [0; 0; 4; 13; 15; 1]
  = [0; 15; 1; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0807 :
  autuPackDataflow_fun [1; 0; 5; 5; 4; 1]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0808 :
  autuPackDataflow_fun [0; 0; 0; 25; 0; 3]
  = [0; 0; 3; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0809 :
  autuPackDataflow_fun [1; 0; 4; 12; 24; 2]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0810 :
  autuPackDataflow_fun [0; 5; 0; 10; 9; 4]
  = [0; 9; 4; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0811 :
  autuPackDataflow_fun [1; 1; 1; 17; 30; 3]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0812 :
  autuPackDataflow_fun [0; 5; 5; 3; 2; 2]
  = [0; 2; 2; 2; 3; 5; 238; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0813 :
  autuPackDataflow_fun [1; 0; 4; 29; 22; 6]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0814 :
  autuPackDataflow_fun [0; 4; 3; 9; 0; 1]
  = [0; 0; 1; 1; 2; 3; 25; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0815 :
  autuPackDataflow_fun [1; 0; 5; 30; 8; 5]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0816 :
  autuPackDataflow_fun [0; 2; 3; 25; 27; 4]
  = [0; 27; 4; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0817 :
  autuPackDataflow_fun [1; 3; 3; 12; 7; 1]
  = [0; 0; 0; 1; 2; 3; 17; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0818 :
  autuPackDataflow_fun [0; 3; 4; 23; 7; 1]
  = [0; 7; 1; 3; 0; 3; 13; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0819 :
  autuPackDataflow_fun [1; 5; 5; 18; 14; 4]
  = [0; 0; 0; 2; 3; 5; 158; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0820 :
  autuPackDataflow_fun [0; 5; 5; 0; 26; 0]
  = [0; 26; 0; 0; 5; 5; 242; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0821 :
  autuPackDataflow_fun [1; 3; 3; 8; 2; 5]
  = [0; 0; 0; 0; 3; 3; 26; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0822 :
  autuPackDataflow_fun [0; 0; 2; 16; 23; 3]
  = [0; 23; 3; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0823 :
  autuPackDataflow_fun [1; 1; 1; 1; 12; 2]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0824 :
  autuPackDataflow_fun [0; 1; 5; 5; 13; 5]
  = [0; 13; 5; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0825 :
  autuPackDataflow_fun [1; 4; 0; 27; 30; 0]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0826 :
  autuPackDataflow_fun [0; 2; 4; 26; 24; 1]
  = [0; 24; 1; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0827 :
  autuPackDataflow_fun [1; 5; 5; 26; 15; 0]
  = [0; 0; 0; 3; 2; 5; 131; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0828 :
  autuPackDataflow_fun [0; 4; 1; 16; 27; 0]
  = [0; 27; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0829 :
  autuPackDataflow_fun [1; 3; 0; 6; 5; 5]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0830 :
  autuPackDataflow_fun [0; 3; 0; 22; 21; 7]
  = [0; 21; 7; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0831 :
  autuPackDataflow_fun [1; 2; 0; 4; 25; 0]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0832 :
  autuPackDataflow_fun [0; 3; 1; 16; 19; 2]
  = [0; 19; 2; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0833 :
  autuPackDataflow_fun [1; 4; 4; 12; 6; 3]
  = [0; 0; 0; 2; 2; 4; 44; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0834 :
  autuPackDataflow_fun [0; 3; 1; 10; 11; 0]
  = [0; 11; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0835 :
  autuPackDataflow_fun [1; 3; 5; 5; 29; 4]
  = [0; 0; 0; 2; 1; 3; 16; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0836 :
  autuPackDataflow_fun [0; 3; 1; 7; 6; 3]
  = [0; 6; 3; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0837 :
  autuPackDataflow_fun [1; 3; 1; 15; 26; 0]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0838 :
  autuPackDataflow_fun [0; 3; 0; 5; 24; 4]
  = [0; 24; 4; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0839 :
  autuPackDataflow_fun [1; 4; 4; 16; 14; 2]
  = [0; 0; 0; 0; 4; 4; 80; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0840 :
  autuPackDataflow_fun [0; 3; 1; 3; 22; 2]
  = [0; 22; 2; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0841 :
  autuPackDataflow_fun [1; 4; 1; 18; 25; 2]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0842 :
  autuPackDataflow_fun [0; 4; 3; 31; 0; 0]
  = [0; 0; 0; 3; 0; 3; 13; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0843 :
  autuPackDataflow_fun [1; 3; 0; 7; 25; 0]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0844 :
  autuPackDataflow_fun [0; 4; 0; 14; 23; 4]
  = [0; 23; 4; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0845 :
  autuPackDataflow_fun [1; 1; 4; 14; 17; 2]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0846 :
  autuPackDataflow_fun [0; 5; 0; 24; 2; 0]
  = [0; 2; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0847 :
  autuPackDataflow_fun [1; 3; 3; 17; 5; 1]
  = [0; 0; 0; 1; 2; 3; 25; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0848 :
  autuPackDataflow_fun [0; 0; 3; 23; 25; 1]
  = [0; 25; 1; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0849 :
  autuPackDataflow_fun [1; 4; 1; 1; 4; 2]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0850 :
  autuPackDataflow_fun [0; 2; 5; 14; 5; 3]
  = [0; 5; 3; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0851 :
  autuPackDataflow_fun [1; 3; 5; 4; 17; 4]
  = [0; 0; 0; 1; 2; 3; 17; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0852 :
  autuPackDataflow_fun [0; 2; 1; 15; 30; 5]
  = [0; 30; 5; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0853 :
  autuPackDataflow_fun [1; 2; 4; 29; 25; 0]
  = [0; 0; 0; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0854 :
  autuPackDataflow_fun [0; 0; 1; 24; 28; 4]
  = [0; 28; 4; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0855 :
  autuPackDataflow_fun [1; 0; 0; 19; 21; 6]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0856 :
  autuPackDataflow_fun [0; 3; 2; 14; 6; 4]
  = [0; 6; 4; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0857 :
  autuPackDataflow_fun [1; 0; 0; 18; 19; 1]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0858 :
  autuPackDataflow_fun [0; 3; 2; 20; 19; 7]
  = [0; 19; 7; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0859 :
  autuPackDataflow_fun [1; 5; 2; 12; 29; 0]
  = [0; 0; 0; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0860 :
  autuPackDataflow_fun [0; 1; 2; 31; 3; 2]
  = [0; 3; 2; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0861 :
  autuPackDataflow_fun [1; 5; 2; 18; 10; 0]
  = [0; 0; 0; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0862 :
  autuPackDataflow_fun [0; 0; 4; 10; 26; 3]
  = [0; 26; 3; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0863 :
  autuPackDataflow_fun [1; 4; 1; 30; 20; 0]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0864 :
  autuPackDataflow_fun [0; 2; 4; 23; 8; 2]
  = [0; 8; 2; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0865 :
  autuPackDataflow_fun [1; 5; 1; 28; 20; 4]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0866 :
  autuPackDataflow_fun [0; 5; 1; 22; 27; 4]
  = [0; 27; 4; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0867 :
  autuPackDataflow_fun [1; 0; 3; 28; 4; 5]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0868 :
  autuPackDataflow_fun [0; 5; 3; 31; 12; 0]
  = [0; 12; 0; 3; 0; 3; 13; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0869 :
  autuPackDataflow_fun [1; 0; 3; 15; 25; 5]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0870 :
  autuPackDataflow_fun [0; 4; 3; 5; 16; 4]
  = [0; 16; 4; 2; 1; 3; 16; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0871 :
  autuPackDataflow_fun [1; 2; 1; 10; 12; 1]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0872 :
  autuPackDataflow_fun [0; 5; 3; 17; 8; 4]
  = [0; 8; 4; 1; 2; 3; 25; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0873 :
  autuPackDataflow_fun [1; 5; 1; 30; 15; 2]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0874 :
  autuPackDataflow_fun [0; 5; 0; 25; 9; 4]
  = [0; 9; 4; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0875 :
  autuPackDataflow_fun [1; 3; 5; 31; 4; 7]
  = [0; 0; 0; 3; 0; 3; 13; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0876 :
  autuPackDataflow_fun [0; 2; 3; 10; 1; 2]
  = [0; 1; 2; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0877 :
  autuPackDataflow_fun [1; 0; 5; 25; 11; 0]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0878 :
  autuPackDataflow_fun [0; 4; 3; 3; 25; 2]
  = [0; 25; 2; 2; 1; 3; 22; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0879 :
  autuPackDataflow_fun [1; 3; 5; 30; 14; 0]
  = [0; 0; 0; 2; 1; 3; 14; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0880 :
  autuPackDataflow_fun [0; 2; 2; 26; 29; 0]
  = [0; 29; 0; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0881 :
  autuPackDataflow_fun [1; 0; 4; 1; 5; 4]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0882 :
  autuPackDataflow_fun [0; 0; 5; 5; 7; 6]
  = [0; 7; 6; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0883 :
  autuPackDataflow_fun [1; 0; 2; 10; 17; 4]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0884 :
  autuPackDataflow_fun [0; 1; 4; 1; 11; 6]
  = [0; 11; 6; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0885 :
  autuPackDataflow_fun [1; 5; 2; 20; 13; 0]
  = [0; 0; 0; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0886 :
  autuPackDataflow_fun [0; 0; 0; 7; 31; 5]
  = [0; 31; 5; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0887 :
  autuPackDataflow_fun [1; 5; 3; 4; 1; 6]
  = [0; 0; 0; 1; 2; 3; 17; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0888 :
  autuPackDataflow_fun [0; 0; 5; 0; 2; 4]
  = [0; 2; 4; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0889 :
  autuPackDataflow_fun [1; 0; 0; 6; 8; 5]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0890 :
  autuPackDataflow_fun [0; 2; 5; 11; 23; 5]
  = [0; 23; 5; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0891 :
  autuPackDataflow_fun [1; 3; 5; 13; 2; 4]
  = [0; 0; 0; 2; 1; 3; 16; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0892 :
  autuPackDataflow_fun [0; 5; 3; 3; 17; 1]
  = [0; 17; 1; 2; 1; 3; 22; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0893 :
  autuPackDataflow_fun [1; 1; 3; 25; 31; 1]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0894 :
  autuPackDataflow_fun [0; 3; 3; 10; 26; 7]
  = [0; 26; 7; 1; 2; 3; 23; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0895 :
  autuPackDataflow_fun [1; 3; 3; 7; 9; 5]
  = [0; 0; 0; 3; 0; 3; 13; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0896 :
  autuPackDataflow_fun [0; 1; 5; 15; 21; 1]
  = [0; 21; 1; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0897 :
  autuPackDataflow_fun [1; 2; 4; 28; 25; 0]
  = [0; 0; 0; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0898 :
  autuPackDataflow_fun [0; 0; 5; 10; 2; 3]
  = [0; 2; 3; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0899 :
  autuPackDataflow_fun [1; 0; 1; 30; 2; 0]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0900 :
  autuPackDataflow_fun [0; 3; 0; 18; 1; 1]
  = [0; 1; 1; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0901 :
  autuPackDataflow_fun [1; 2; 4; 27; 31; 3]
  = [0; 0; 0; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0902 :
  autuPackDataflow_fun [0; 4; 2; 17; 25; 4]
  = [0; 25; 4; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0903 :
  autuPackDataflow_fun [1; 3; 0; 21; 30; 4]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0904 :
  autuPackDataflow_fun [0; 4; 2; 23; 28; 3]
  = [0; 28; 3; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0905 :
  autuPackDataflow_fun [1; 3; 0; 21; 23; 3]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0906 :
  autuPackDataflow_fun [0; 0; 0; 2; 5; 5]
  = [0; 5; 5; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0907 :
  autuPackDataflow_fun [1; 2; 0; 5; 27; 1]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0908 :
  autuPackDataflow_fun [0; 4; 0; 11; 12; 0]
  = [0; 12; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0909 :
  autuPackDataflow_fun [1; 4; 1; 29; 26; 2]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0910 :
  autuPackDataflow_fun [0; 2; 5; 5; 6; 6]
  = [0; 6; 6; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0911 :
  autuPackDataflow_fun [1; 1; 5; 3; 10; 5]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0912 :
  autuPackDataflow_fun [0; 0; 1; 13; 5; 2]
  = [0; 5; 2; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0913 :
  autuPackDataflow_fun [1; 1; 1; 20; 3; 3]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0914 :
  autuPackDataflow_fun [0; 2; 0; 16; 13; 4]
  = [0; 13; 4; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0915 :
  autuPackDataflow_fun [1; 0; 3; 20; 23; 3]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0916 :
  autuPackDataflow_fun [0; 5; 5; 25; 13; 1]
  = [0; 13; 1; 3; 2; 5; 133; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0917 :
  autuPackDataflow_fun [1; 1; 5; 18; 3; 0]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0918 :
  autuPackDataflow_fun [0; 5; 1; 31; 3; 0]
  = [0; 3; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0919 :
  autuPackDataflow_fun [1; 5; 3; 10; 16; 7]
  = [0; 0; 0; 1; 2; 3; 23; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0920 :
  autuPackDataflow_fun [0; 0; 5; 22; 20; 5]
  = [0; 20; 5; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0921 :
  autuPackDataflow_fun [1; 0; 1; 8; 22; 6]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0922 :
  autuPackDataflow_fun [0; 2; 1; 16; 10; 2]
  = [0; 10; 2; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0923 :
  autuPackDataflow_fun [1; 3; 4; 29; 0; 2]
  = [0; 0; 0; 2; 1; 3; 16; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0924 :
  autuPackDataflow_fun [0; 0; 0; 19; 6; 0]
  = [0; 6; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0925 :
  autuPackDataflow_fun [1; 3; 2; 4; 30; 2]
  = [0; 0; 0; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0926 :
  autuPackDataflow_fun [0; 1; 4; 5; 4; 4]
  = [0; 4; 4; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0927 :
  autuPackDataflow_fun [1; 5; 2; 28; 12; 6]
  = [0; 0; 0; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0928 :
  autuPackDataflow_fun [0; 5; 0; 23; 5; 5]
  = [0; 5; 5; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0929 :
  autuPackDataflow_fun [1; 2; 1; 4; 27; 3]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0930 :
  autuPackDataflow_fun [0; 2; 2; 25; 24; 5]
  = [0; 24; 5; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0931 :
  autuPackDataflow_fun [1; 0; 1; 24; 31; 6]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0932 :
  autuPackDataflow_fun [0; 3; 2; 23; 3; 3]
  = [0; 3; 3; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0933 :
  autuPackDataflow_fun [1; 2; 5; 4; 25; 7]
  = [0; 0; 0; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0934 :
  autuPackDataflow_fun [0; 1; 3; 25; 0; 6]
  = [0; 0; 6; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0935 :
  autuPackDataflow_fun [1; 2; 3; 8; 30; 1]
  = [0; 0; 0; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0936 :
  autuPackDataflow_fun [0; 2; 1; 12; 15; 4]
  = [0; 15; 4; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0937 :
  autuPackDataflow_fun [1; 4; 2; 9; 21; 1]
  = [0; 0; 0; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0938 :
  autuPackDataflow_fun [0; 5; 1; 3; 14; 0]
  = [0; 14; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0939 :
  autuPackDataflow_fun [1; 3; 4; 0; 2; 5]
  = [0; 0; 0; 0; 3; 3; 26; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0940 :
  autuPackDataflow_fun [0; 0; 4; 4; 15; 6]
  = [0; 15; 6; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0941 :
  autuPackDataflow_fun [1; 1; 1; 24; 5; 6]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0942 :
  autuPackDataflow_fun [0; 5; 3; 5; 5; 0]
  = [0; 5; 0; 2; 1; 3; 16; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0943 :
  autuPackDataflow_fun [1; 4; 3; 27; 29; 0]
  = [0; 0; 0; 2; 1; 3; 22; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0944 :
  autuPackDataflow_fun [0; 4; 1; 8; 4; 1]
  = [0; 4; 1; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0945 :
  autuPackDataflow_fun [1; 2; 4; 19; 19; 6]
  = [0; 0; 0; 2; 0; 2; 4; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0946 :
  autuPackDataflow_fun [0; 2; 5; 26; 28; 3]
  = [0; 28; 3; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0947 :
  autuPackDataflow_fun [1; 2; 0; 30; 8; 2]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0948 :
  autuPackDataflow_fun [0; 3; 2; 28; 1; 5]
  = [0; 1; 5; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0949 :
  autuPackDataflow_fun [1; 0; 2; 15; 24; 3]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0950 :
  autuPackDataflow_fun [0; 2; 4; 10; 5; 2]
  = [0; 5; 2; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0951 :
  autuPackDataflow_fun [1; 4; 3; 9; 28; 0]
  = [0; 0; 0; 1; 2; 3; 25; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0952 :
  autuPackDataflow_fun [0; 2; 3; 30; 23; 5]
  = [0; 23; 5; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0953 :
  autuPackDataflow_fun [1; 1; 4; 15; 1; 0]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0954 :
  autuPackDataflow_fun [0; 2; 3; 14; 5; 0]
  = [0; 5; 0; 1; 1; 2; 5; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0955 :
  autuPackDataflow_fun [1; 2; 1; 21; 18; 7]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0956 :
  autuPackDataflow_fun [0; 1; 0; 15; 0; 6]
  = [0; 0; 6; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0957 :
  autuPackDataflow_fun [1; 5; 3; 14; 19; 3]
  = [0; 0; 0; 2; 1; 3; 14; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0958 :
  autuPackDataflow_fun [0; 0; 3; 13; 3; 1]
  = [0; 3; 1; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0959 :
  autuPackDataflow_fun [1; 0; 5; 5; 27; 4]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0960 :
  autuPackDataflow_fun [0; 2; 0; 18; 12; 3]
  = [0; 12; 3; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0961 :
  autuPackDataflow_fun [1; 0; 3; 13; 9; 2]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0962 :
  autuPackDataflow_fun [0; 3; 3; 8; 6; 5]
  = [0; 6; 5; 0; 3; 3; 26; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0963 :
  autuPackDataflow_fun [1; 1; 4; 15; 0; 4]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0964 :
  autuPackDataflow_fun [0; 4; 2; 0; 19; 6]
  = [0; 19; 6; 0; 2; 2; 8; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0965 :
  autuPackDataflow_fun [1; 2; 1; 11; 20; 6]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0966 :
  autuPackDataflow_fun [0; 0; 5; 22; 4; 5]
  = [0; 4; 5; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0967 :
  autuPackDataflow_fun [1; 3; 5; 0; 5; 2]
  = [0; 0; 0; 0; 3; 3; 26; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0968 :
  autuPackDataflow_fun [0; 3; 3; 6; 7; 5]
  = [0; 7; 5; 2; 1; 3; 14; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0969 :
  autuPackDataflow_fun [1; 0; 2; 14; 7; 6]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0970 :
  autuPackDataflow_fun [0; 5; 5; 5; 31; 7]
  = [0; 31; 7; 2; 3; 5; 232; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0971 :
  autuPackDataflow_fun [1; 1; 3; 14; 24; 5]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0972 :
  autuPackDataflow_fun [0; 1; 5; 3; 11; 7]
  = [0; 11; 7; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0973 :
  autuPackDataflow_fun [1; 0; 2; 19; 23; 3]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0974 :
  autuPackDataflow_fun [0; 2; 1; 30; 15; 3]
  = [0; 15; 3; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0975 :
  autuPackDataflow_fun [1; 2; 0; 9; 6; 7]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0976 :
  autuPackDataflow_fun [0; 2; 3; 17; 6; 2]
  = [0; 6; 2; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0977 :
  autuPackDataflow_fun [1; 5; 3; 30; 0; 5]
  = [0; 0; 0; 2; 1; 3; 14; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0978 :
  autuPackDataflow_fun [0; 3; 4; 3; 0; 0]
  = [0; 0; 0; 2; 1; 3; 22; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0979 :
  autuPackDataflow_fun [1; 2; 0; 17; 28; 2]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0980 :
  autuPackDataflow_fun [0; 0; 5; 9; 0; 6]
  = [0; 0; 6; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0981 :
  autuPackDataflow_fun [1; 3; 1; 7; 10; 7]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0982 :
  autuPackDataflow_fun [0; 3; 5; 1; 19; 4]
  = [0; 19; 4; 1; 2; 3; 25; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0983 :
  autuPackDataflow_fun [1; 1; 1; 9; 1; 3]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0984 :
  autuPackDataflow_fun [0; 2; 1; 14; 9; 1]
  = [0; 9; 1; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0985 :
  autuPackDataflow_fun [1; 0; 2; 16; 11; 1]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0986 :
  autuPackDataflow_fun [0; 2; 3; 5; 31; 7]
  = [0; 31; 7; 1; 1; 2; 7; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0987 :
  autuPackDataflow_fun [1; 4; 1; 27; 30; 6]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0988 :
  autuPackDataflow_fun [0; 1; 2; 6; 6; 1]
  = [0; 6; 1; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0989 :
  autuPackDataflow_fun [1; 3; 1; 30; 4; 7]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0990 :
  autuPackDataflow_fun [0; 1; 0; 10; 8; 6]
  = [0; 8; 6; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0991 :
  autuPackDataflow_fun [1; 1; 4; 0; 5; 1]
  = [0; 0; 0; 0; 1; 1; 2; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0992 :
  autuPackDataflow_fun [0; 4; 3; 17; 13; 0]
  = [0; 13; 0; 1; 2; 3; 25; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0993 :
  autuPackDataflow_fun [1; 2; 0; 5; 14; 7]
  = [0; 0; 0; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0994 :
  autuPackDataflow_fun [0; 3; 4; 31; 19; 4]
  = [0; 19; 4; 3; 0; 3; 13; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0995 :
  autuPackDataflow_fun [1; 4; 1; 21; 14; 0]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0996 :
  autuPackDataflow_fun [0; 5; 1; 31; 23; 0]
  = [0; 23; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0997 :
  autuPackDataflow_fun [1; 4; 3; 28; 20; 1]
  = [0; 0; 0; 1; 2; 3; 17; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0998 :
  autuPackDataflow_fun [0; 3; 0; 19; 9; 4]
  = [0; 9; 4; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0999 :
  autuPackDataflow_fun [1; 3; 1; 9; 0; 6]
  = [0; 0; 0; 1; 0; 1; 1; 1; 1].
Proof. vm_compute. reflexivity. Qed.


Example negative_control_wrong_expected :
  autuPackDataflow_fun [0; 0; 5; 24; 25; 5]
  <> [1; 25; 5; 0; 0; 0; 0; 1; 1].
Proof. vm_compute. discriminate. Qed.
