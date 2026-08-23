(* 由 FloatTest/tools/emit_tests.py 自动生成，请勿手改。
 * 每条约 1000 条向量一条 vm_compute 定理；coqc 编译通过即差分测试通过。 *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.
Require Import OUTPUT.orbiter_new.ConstDiagSignInt.rocq.spec.

Import ListNotations.
Local Open Scope Z_scope.


Example t_0000 :
  constDiagSignInt_fun [-7; 1; 1; -18; -9; 13; 3; -15; -13; -14; 1; -18; -9; 13; 3; -15; -13; -14; 1]
  = [-6; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0001 :
  constDiagSignInt_fun [9; -2; 2; -10; -4; -6; 16; -7; 12; -1; 10; -10; -3; -6; 16; -7; 12; -1; 10]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0002 :
  constDiagSignInt_fun [2; 2; 0; 11; 7; 5; -20; 16; -8; 16; -18; 11; 7; 5; -20; 16; -8; 16; -18]
  = [3; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0003 :
  constDiagSignInt_fun [5; 0; 0; 13; -1; 9; 19; -7; -12; -5; -4; 13; -1; 9; 19; -7; -12; -5; -4]
  = [6; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0004 :
  constDiagSignInt_fun [1; 7; 1; -8; 2; -2; 11; 17; -15; 8; -10; -8; 2; -2; 11; 17; -15; 8; -10]
  = [2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0005 :
  constDiagSignInt_fun [-6; 0; 0; -16; 13; -2; 12; -4; 14; 17; -6; -16; 13; -2; 12; -4; 14; 17; -6]
  = [-5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0006 :
  constDiagSignInt_fun [8; 2; 0; 17; 18; -9; 0; -18; -13; -20; 20; 17; 18; -9; 0; -18; -13; -20; 20]
  = [9; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0007 :
  constDiagSignInt_fun [-1; 3; 2; 5; 19; -2; -17; -15; 7; 19; -14; 4; 19; -2; -17; -15; 7; 19; -14]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0008 :
  constDiagSignInt_fun [-6; 5; 0; -14; -17; -17; 16; -18; -17; -16; 9; -14; -17; -17; 16; -18; -17; -16; 9]
  = [-5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0009 :
  constDiagSignInt_fun [6; -2; 6; 8; -17; -5; 3; -2; -6; 19; -19; 8; -17; -5; 3; -2; -5; 19; -19]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0010 :
  constDiagSignInt_fun [-3; 1; 0; 4; -14; 15; 3; 19; 20; -10; -2; 4; -14; 15; 3; 19; 20; -10; -2]
  = [-2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0011 :
  constDiagSignInt_fun [-7; 5; 2; -15; 9; 7; 10; -12; -17; 20; 7; -16; 9; 7; 10; -12; -17; 20; 7]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0012 :
  constDiagSignInt_fun [-6; -1; 0; 16; 16; 0; -17; -15; -1; 1; 9; 16; 16; 0; -17; -15; -1; 1; 9]
  = [-5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0013 :
  constDiagSignInt_fun [6; 9; 5; 3; -7; 3; 10; -14; 13; -5; -8; 3; -7; 3; 10; -13; 13; -5; -8]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0014 :
  constDiagSignInt_fun [4; 2; 0; -12; -3; 14; -14; -9; -10; 14; 2; -12; -3; 14; -14; -9; -10; 14; 2]
  = [5; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0015 :
  constDiagSignInt_fun [3; 4; 7; 1; 5; 16; 5; 1; 4; -1; -6; 0; 5; 16; 5; 1; 4; -1; -6]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0016 :
  constDiagSignInt_fun [5; 9; 1; -5; -17; -2; -6; 1; -18; 7; 3; -5; -17; -2; -6; 1; -18; 7; 3]
  = [6; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0017 :
  constDiagSignInt_fun [-3; 6; 0; -14; -4; 5; 2; 0; 8; 11; 5; -14; -4; 5; 2; 0; 8; 11; 5]
  = [-2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0018 :
  constDiagSignInt_fun [-5; -1; 0; 7; 20; -11; -16; -20; 3; -18; 17; 7; 20; -11; -16; -20; 3; -18; 17]
  = [-4; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0019 :
  constDiagSignInt_fun [-1; 3; 5; 9; -1; -11; -4; 14; -9; 20; 19; 8; -1; -11; -4; 14; -9; 20; 19]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0020 :
  constDiagSignInt_fun [-3; 8; 1; -18; -1; -8; -8; -20; 14; -8; -15; -18; -1; -8; -8; -20; 14; -8; -15]
  = [-2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0021 :
  constDiagSignInt_fun [6; 8; 3; 16; 6; 15; 6; 1; 8; -10; 19; 16; 6; 16; 6; 1; 8; -10; 19]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0022 :
  constDiagSignInt_fun [-7; -2; 0; -13; 2; 15; -6; 7; -14; -18; 1; -13; 2; 15; -6; 7; -14; -18; 1]
  = [-6; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0023 :
  constDiagSignInt_fun [-1; 6; 2; 2; 3; -13; -16; 15; 14; 6; -14; 1; 3; -13; -16; 15; 14; 6; -14]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0024 :
  constDiagSignInt_fun [-1; -1; 5; -3; 12; 3; 7; -13; 18; 16; -7; -3; 12; 3; 7; -13; 18; 16; -7]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0025 :
  constDiagSignInt_fun [2; 5; 6; -7; -3; -3; -7; -17; -19; 20; -6; -7; -3; -3; -7; -17; -18; 20; -6]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0026 :
  constDiagSignInt_fun [-10; 9; 0; 7; -2; -10; 12; -1; 13; 2; -6; 7; -2; -10; 12; -1; 13; 2; -6]
  = [-9; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0027 :
  constDiagSignInt_fun [-9; -1; 8; 13; -11; 19; 9; -17; -15; -20; 3; 12; -11; 19; 9; -17; -15; -20; 3]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0028 :
  constDiagSignInt_fun [0; 8; 4; -1; -18; -8; -13; 9; -16; 13; 6; -1; -18; -8; -13; 9; -16; 13; 6]
  = [1; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0029 :
  constDiagSignInt_fun [-4; 9; 2; 5; 6; 10; 20; 7; 6; 13; -7; 5; 7; 10; 20; 7; 6; 13; -7]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0030 :
  constDiagSignInt_fun [-3; 8; 0; 7; 1; -17; 17; -6; 2; 11; -10; 7; 1; -17; 17; -6; 2; 11; -10]
  = [-2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0031 :
  constDiagSignInt_fun [2; -3; 0; -12; -20; 12; 9; 17; -8; -11; -5; -12; -20; 12; 9; 17; -8; -11; -5]
  = [3; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0032 :
  constDiagSignInt_fun [-9; -1; 5; -1; -15; 7; -18; -2; 1; -8; -2; -1; -15; 7; -18; -2; 1; -8; -2]
  = [-8; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0033 :
  constDiagSignInt_fun [-4; 8; 6; -17; 9; -4; -7; 13; 12; 7; 3; -17; 9; -4; -7; 13; 13; 7; 3]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0034 :
  constDiagSignInt_fun [-1; -3; 0; -17; 2; 12; 1; 13; -12; -14; 2; -17; 2; 12; 1; 13; -12; -14; 2]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0035 :
  constDiagSignInt_fun [8; 2; 2; -7; 7; 2; 18; -20; -11; -9; -3; -8; 7; 2; 18; -20; -11; -9; -3]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0036 :
  constDiagSignInt_fun [0; 5; 1; 1; 2; 20; 20; -6; 16; 12; -2; 1; 2; 20; 20; -6; 16; 12; -2]
  = [1; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0037 :
  constDiagSignInt_fun [-6; 9; 3; 16; -12; -6; -3; 0; -10; -10; 5; 16; -12; -5; -3; 0; -10; -10; 5]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0038 :
  constDiagSignInt_fun [10; 3; 0; -15; -19; 13; 7; 16; 5; -17; 16; -15; -19; 13; 7; 16; 5; -17; 16]
  = [11; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0039 :
  constDiagSignInt_fun [-4; 7; 3; 15; -15; 18; 4; 15; 3; 16; 5; 14; -15; 18; 4; 15; 3; 16; 5]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0040 :
  constDiagSignInt_fun [6; 4; 0; -3; 17; 16; -9; 2; 10; 19; 20; -3; 17; 16; -9; 2; 10; 19; 20]
  = [7; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0041 :
  constDiagSignInt_fun [-3; 7; 7; 17; -10; -6; 5; 14; -18; -3; -9; 17; -10; -6; 5; 14; -18; -2; -9]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0042 :
  constDiagSignInt_fun [6; 6; 0; 1; 4; 8; 5; -3; -9; -7; -20; 1; 4; 8; 5; -3; -9; -7; -20]
  = [7; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0043 :
  constDiagSignInt_fun [4; 0; 6; 5; -2; 14; -14; 0; -14; -16; -4; 4; -2; 14; -14; 0; -14; -16; -4]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0044 :
  constDiagSignInt_fun [8; 6; 2; 8; -10; -18; -17; 12; 15; 0; -19; 8; -10; -18; -17; 12; 15; 0; -19]
  = [9; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0045 :
  constDiagSignInt_fun [-4; 5; 8; 19; -18; -15; 17; 6; 6; -2; 18; 19; -18; -15; 17; 6; 6; -2; 19]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0046 :
  constDiagSignInt_fun [3; 0; 0; 5; -4; 13; 4; -16; -10; 10; -3; 5; -4; 13; 4; -16; -10; 10; -3]
  = [4; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0047 :
  constDiagSignInt_fun [-2; -2; 1; -20; -13; -13; 5; -19; 4; -5; 8; -21; -13; -13; 5; -19; 4; -5; 8]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0048 :
  constDiagSignInt_fun [10; 4; 6; -3; 2; -5; -1; 3; 5; -4; 11; -3; 2; -5; -1; 3; 5; -4; 11]
  = [11; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0049 :
  constDiagSignInt_fun [-4; -3; 3; -5; -4; 19; 2; 13; -4; 1; -8; -5; -4; 20; 2; 13; -4; 1; -8]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0050 :
  constDiagSignInt_fun [2; -1; 0; 5; -2; -12; 4; 9; 1; -6; 13; 5; -2; -12; 4; 9; 1; -6; 13]
  = [3; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0051 :
  constDiagSignInt_fun [-1; 5; 5; 4; 4; -12; -4; 10; -16; 6; -4; 3; 4; -12; -4; 10; -16; 6; -4]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0052 :
  constDiagSignInt_fun [-5; 4; 3; -13; -5; 6; -17; 20; 5; -6; 5; -13; -5; 6; -17; 20; 5; -6; 5]
  = [-4; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0053 :
  constDiagSignInt_fun [-1; -3; 5; -17; -1; -2; -15; 8; -17; -14; -13; -17; -1; -2; -15; 9; -17; -14; -13]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0054 :
  constDiagSignInt_fun [3; 1; 0; -8; -20; 7; 8; 2; -9; 4; 8; -8; -20; 7; 8; 2; -9; 4; 8]
  = [4; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0055 :
  constDiagSignInt_fun [-1; -1; 1; -7; 7; 8; 1; 2; -1; 12; -1; -8; 7; 8; 1; 2; -1; 12; -1]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0056 :
  constDiagSignInt_fun [-3; 2; 5; -5; 5; -16; -17; -7; 5; -8; 9; -5; 5; -16; -17; -7; 5; -8; 9]
  = [-2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0057 :
  constDiagSignInt_fun [-6; -1; 2; -13; 10; -13; -20; -17; 14; -12; 16; -13; 11; -13; -20; -17; 14; -12; 16]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0058 :
  constDiagSignInt_fun [-4; 0; 0; -8; 19; -1; 8; -6; -18; 1; -4; -8; 19; -1; 8; -6; -18; 1; -4]
  = [-3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0059 :
  constDiagSignInt_fun [9; -3; 7; 14; -9; 13; -12; -7; 8; -1; -11; 13; -9; 13; -12; -7; 8; -1; -11]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0060 :
  constDiagSignInt_fun [8; 7; 5; 10; -12; -4; -11; 20; 9; -9; 18; 10; -12; -4; -11; 20; 9; -9; 18]
  = [9; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0061 :
  constDiagSignInt_fun [9; 8; 2; 1; 6; 7; 7; 20; -12; -14; 13; 1; 7; 7; 7; 20; -12; -14; 13]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0062 :
  constDiagSignInt_fun [8; 1; 0; 1; 7; -14; -19; 11; 10; 8; 6; 1; 7; -14; -19; 11; 10; 8; 6]
  = [9; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0063 :
  constDiagSignInt_fun [5; -1; 5; 5; -13; -17; 8; -19; 19; 9; -18; 4; -13; -17; 8; -19; 19; 9; -18]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0064 :
  constDiagSignInt_fun [2; 9; 4; 17; -3; 6; 2; 18; -11; -9; -1; 17; -3; 6; 2; 18; -11; -9; -1]
  = [3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0065 :
  constDiagSignInt_fun [9; 5; 1; -7; 15; 2; 16; 18; -5; -20; -10; -6; 15; 2; 16; 18; -5; -20; -10]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0066 :
  constDiagSignInt_fun [10; 3; 0; 13; -11; 10; 1; 1; 6; -18; 9; 13; -11; 10; 1; 1; 6; -18; 9]
  = [11; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0067 :
  constDiagSignInt_fun [-9; -3; 5; 2; -11; 4; 12; -2; 14; -15; 18; 1; -11; 4; 12; -2; 14; -15; 18]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0068 :
  constDiagSignInt_fun [-2; 2; 8; 7; -8; -17; 3; -13; -14; -1; 6; 7; -8; -17; 3; -13; -14; -1; 6]
  = [-1; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0069 :
  constDiagSignInt_fun [-4; 0; 3; -13; -15; -10; 19; 0; -15; -10; 20; -13; -15; -9; 19; 0; -15; -10; 20]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0070 :
  constDiagSignInt_fun [-7; 3; 0; 3; 10; -9; 4; -9; 3; 6; 7; 3; 10; -9; 4; -9; 3; 6; 7]
  = [-6; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0071 :
  constDiagSignInt_fun [-10; -2; 8; 14; 0; -4; 11; 19; 6; 13; 6; 13; 0; -4; 11; 19; 6; 13; 6]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0072 :
  constDiagSignInt_fun [9; -1; 4; 4; -8; -3; -16; -9; -3; -9; 16; 4; -8; -3; -16; -9; -3; -9; 16]
  = [10; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0073 :
  constDiagSignInt_fun [-4; -1; 7; -18; -13; -16; 7; 20; 12; 20; 1; -18; -13; -16; 7; 20; 12; 21; 1]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0074 :
  constDiagSignInt_fun [-8; 5; 0; -6; 8; -19; 15; -2; 15; 3; -20; -6; 8; -19; 15; -2; 15; 3; -20]
  = [-7; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0075 :
  constDiagSignInt_fun [0; 0; 0; -14; 17; 6; 12; -13; -5; 16; -5; -14; 17; 6; 12; -13; -5; 16; -5]
  = [1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0076 :
  constDiagSignInt_fun [1; 8; 3; 13; -17; 16; -16; 9; -7; -4; 10; 13; -17; 16; -16; 9; -7; -4; 10]
  = [2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0077 :
  constDiagSignInt_fun [-6; 9; 5; 4; -16; 20; 14; 5; 2; 3; 10; 4; -16; 20; 14; 6; 2; 3; 10]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0078 :
  constDiagSignInt_fun [0; 9; 0; -11; -19; -2; -17; 19; -17; 3; -11; -11; -19; -2; -17; 19; -17; 3; -11]
  = [1; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0079 :
  constDiagSignInt_fun [5; 9; 2; -9; -5; 5; 2; -15; -20; 14; 11; -10; -5; 5; 2; -15; -20; 14; 11]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0080 :
  constDiagSignInt_fun [7; 8; 7; 2; 15; -9; -9; -1; 6; 13; 9; 2; 15; -9; -9; -1; 6; 13; 9]
  = [8; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0081 :
  constDiagSignInt_fun [-4; 0; 4; 2; -13; -3; -17; 5; -8; 9; 2; 2; -13; -3; -16; 5; -8; 9; 2]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0082 :
  constDiagSignInt_fun [2; 4; 0; -9; -10; -1; -16; -8; 2; -13; 13; -9; -10; -1; -16; -8; 2; -13; 13]
  = [3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0083 :
  constDiagSignInt_fun [-4; -2; 4; -20; 2; -15; 9; 20; 18; 1; -11; -21; 2; -15; 9; 20; 18; 1; -11]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0084 :
  constDiagSignInt_fun [8; 7; 0; -10; -12; 0; -17; 1; -19; -19; 11; -10; -12; 0; -17; 1; -19; -19; 11]
  = [9; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0085 :
  constDiagSignInt_fun [-9; 3; 6; 5; -13; 14; 10; 18; -17; 2; 18; 5; -13; 14; 10; 18; -16; 2; 18]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0086 :
  constDiagSignInt_fun [-9; -3; 0; 1; -1; 12; -7; -19; -12; 1; 20; 1; -1; 12; -7; -19; -12; 1; 20]
  = [-8; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0087 :
  constDiagSignInt_fun [8; 8; 5; 14; -3; 20; 4; 15; 15; 0; -19; 13; -3; 20; 4; 15; 15; 0; -19]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0088 :
  constDiagSignInt_fun [10; 2; 4; -12; -8; -6; 14; 6; 10; 15; -5; -12; -8; -6; 14; 6; 10; 15; -5]
  = [11; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0089 :
  constDiagSignInt_fun [6; 0; 1; -2; 16; 5; -7; 16; 14; 17; -10; -1; 16; 5; -7; 16; 14; 17; -10]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0090 :
  constDiagSignInt_fun [4; 6; 0; -3; 14; 9; -16; -17; 2; -19; 17; -3; 14; 9; -16; -17; 2; -19; 17]
  = [5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0091 :
  constDiagSignInt_fun [-3; 9; 3; 14; 5; 18; -7; 3; -17; 5; -9; 13; 5; 18; -7; 3; -17; 5; -9]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0092 :
  constDiagSignInt_fun [-6; 4; 2; -11; 5; -14; -3; 13; -1; 8; -14; -11; 5; -14; -3; 13; -1; 8; -14]
  = [-5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0093 :
  constDiagSignInt_fun [-8; 2; 3; -5; 3; -5; 12; -11; 1; 2; -8; -5; 3; -4; 12; -11; 1; 2; -8]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0094 :
  constDiagSignInt_fun [-3; -1; 0; 2; 10; -3; 9; 4; -16; -2; 1; 2; 10; -3; 9; 4; -16; -2; 1]
  = [-2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0095 :
  constDiagSignInt_fun [9; 8; 6; -11; 18; -12; 19; -13; -1; -10; 1; -12; 18; -12; 19; -13; -1; -10; 1]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0096 :
  constDiagSignInt_fun [1; 9; 8; -13; -9; 18; -8; -17; -7; 16; 6; -13; -9; 18; -8; -17; -7; 16; 6]
  = [2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0097 :
  constDiagSignInt_fun [6; 7; 0; -15; 7; -10; 7; -16; 5; 10; 6; -15; 7; -10; 7; -16; 5; 10; 6]
  = [7; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0098 :
  constDiagSignInt_fun [-8; 1; 0; 7; -14; 13; 8; 20; -19; -18; 12; 7; -14; 13; 8; 20; -19; -18; 12]
  = [-7; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0099 :
  constDiagSignInt_fun [9; 8; 1; -20; -7; -13; 11; -4; -8; 0; 14; -21; -7; -13; 11; -4; -8; 0; 14]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0100 :
  constDiagSignInt_fun [-2; 7; 3; -18; -20; -9; -6; 7; 5; 20; 0; -18; -20; -9; -6; 7; 5; 20; 0]
  = [-1; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0101 :
  constDiagSignInt_fun [-2; -3; 6; 9; -17; -18; 8; 8; 10; 13; -3; 9; -17; -18; 8; 8; 11; 13; -3]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0102 :
  constDiagSignInt_fun [8; 8; 0; -7; -3; 4; 6; -7; -7; -5; -17; -7; -3; 4; 6; -7; -7; -5; -17]
  = [9; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0103 :
  constDiagSignInt_fun [7; 5; 2; -12; 3; 13; -14; 19; 7; -2; 0; -13; 3; 13; -14; 19; 7; -2; 0]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0104 :
  constDiagSignInt_fun [-9; 2; 1; 4; 0; 2; -13; -18; -2; 5; -16; 4; 0; 2; -13; -18; -2; 5; -16]
  = [-8; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0105 :
  constDiagSignInt_fun [-1; -1; 5; 17; 15; -11; -5; -8; -5; 18; -16; 17; 15; -11; -5; -7; -5; 18; -16]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0106 :
  constDiagSignInt_fun [-4; -3; 0; 11; 9; -5; -14; 3; 16; -14; 14; 11; 9; -5; -14; 3; 16; -14; 14]
  = [-3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0107 :
  constDiagSignInt_fun [10; 7; 1; 18; 0; 20; 2; -17; -11; 19; -6; 17; 0; 20; 2; -17; -11; 19; -6]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0108 :
  constDiagSignInt_fun [-3; 1; 3; 17; 1; -17; 16; -17; -4; 12; 6; 17; 1; -17; 16; -17; -4; 12; 6]
  = [-2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0109 :
  constDiagSignInt_fun [-9; 0; 3; -9; 14; 7; -1; -11; 8; 20; 0; -9; 14; 8; -1; -11; 8; 20; 0]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0110 :
  constDiagSignInt_fun [-9; -2; 0; 3; 4; 5; 13; 6; -8; -17; -19; 3; 4; 5; 13; 6; -8; -17; -19]
  = [-8; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0111 :
  constDiagSignInt_fun [-8; 6; 3; 11; 3; -11; -9; 5; 12; -13; -7; 10; 3; -11; -9; 5; 12; -13; -7]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0112 :
  constDiagSignInt_fun [0; 3; 6; 20; -2; -2; -8; 19; -16; 8; 1; 20; -2; -2; -8; 19; -16; 8; 1]
  = [1; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0113 :
  constDiagSignInt_fun [10; 9; 5; 7; 18; -9; 11; 16; -16; -3; -17; 7; 18; -9; 11; 17; -16; -3; -17]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0114 :
  constDiagSignInt_fun [-4; 8; 0; -9; -15; -8; 1; 0; -4; 14; 12; -9; -15; -8; 1; 0; -4; 14; 12]
  = [-3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0115 :
  constDiagSignInt_fun [2; 5; 2; 14; -6; -6; -11; -4; -3; 6; -3; 13; -6; -6; -11; -4; -3; 6; -3]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0116 :
  constDiagSignInt_fun [2; 3; 8; 5; 3; -17; 11; 10; -9; -17; -7; 5; 3; -17; 11; 10; -9; -17; -7]
  = [3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0117 :
  constDiagSignInt_fun [-4; 4; 7; -4; -2; -3; -6; -13; 9; 9; -7; -4; -2; -3; -6; -13; 9; 10; -7]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0118 :
  constDiagSignInt_fun [7; 9; 0; -20; -12; 2; 9; -9; 8; -16; 6; -20; -12; 2; 9; -9; 8; -16; 6]
  = [8; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0119 :
  constDiagSignInt_fun [8; -2; 0; 1; -19; -13; -3; 1; 16; -1; -12; 1; -19; -13; -3; 1; 16; -1; -12]
  = [9; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0120 :
  constDiagSignInt_fun [-5; -2; 7; 19; 2; 15; -4; -4; -1; 17; 13; 19; 2; 15; -4; -4; -1; 17; 13]
  = [-4; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0121 :
  constDiagSignInt_fun [3; 5; 8; -9; 17; -15; 1; 20; -8; -4; -7; -9; 17; -15; 1; 20; -8; -4; -6]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0122 :
  constDiagSignInt_fun [7; -3; 0; -8; -18; 19; 19; 20; 1; 10; 7; -8; -18; 19; 19; 20; 1; 10; 7]
  = [8; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0123 :
  constDiagSignInt_fun [-1; -1; 4; -14; 5; 9; 6; 16; 12; 15; 7; -15; 5; 9; 6; 16; 12; 15; 7]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0124 :
  constDiagSignInt_fun [4; 0; 8; 11; -20; -12; -7; 14; -19; -6; 5; 11; -20; -12; -7; 14; -19; -6; 5]
  = [5; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0125 :
  constDiagSignInt_fun [3; 3; 1; 16; -6; -16; -17; 16; 2; -19; -2; 17; -6; -16; -17; 16; 2; -19; -2]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0126 :
  constDiagSignInt_fun [-6; 2; 0; 19; 18; -1; -18; 7; 13; 17; 16; 19; 18; -1; -18; 7; 13; 17; 16]
  = [-5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0127 :
  constDiagSignInt_fun [-5; 8; 7; -4; -14; -16; 10; 0; -2; 9; 14; -5; -14; -16; 10; 0; -2; 9; 14]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0128 :
  constDiagSignInt_fun [-5; 8; 2; -12; -18; 10; 13; 8; 17; -4; 3; -12; -18; 10; 13; 8; 17; -4; 3]
  = [-4; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0129 :
  constDiagSignInt_fun [7; 4; 8; -11; 6; -12; -13; -18; -17; 14; 13; -11; 6; -12; -13; -18; -17; 14; 14]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0130 :
  constDiagSignInt_fun [2; -1; 0; 0; -20; -10; 8; -13; -3; -8; -6; 0; -20; -10; 8; -13; -3; -8; -6]
  = [3; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0131 :
  constDiagSignInt_fun [-8; 2; 2; 18; -17; 8; 16; 7; -7; 15; 17; 17; -17; 8; 16; 7; -7; 15; 17]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0132 :
  constDiagSignInt_fun [2; 6; 3; 1; 7; -5; 19; 12; 2; -20; 18; 1; 7; -5; 19; 12; 2; -20; 18]
  = [3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0133 :
  constDiagSignInt_fun [-2; 0; 1; -1; 1; 2; -12; 16; 3; 17; 16; 0; 1; 2; -12; 16; 3; 17; 16]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0134 :
  constDiagSignInt_fun [-4; 4; 0; 2; -18; -3; 19; -15; 18; 16; 7; 2; -18; -3; 19; -15; 18; 16; 7]
  = [-3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0135 :
  constDiagSignInt_fun [-10; 3; 8; -14; -6; -17; 18; -12; 20; -11; -9; -15; -6; -17; 18; -12; 20; -11; -9]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0136 :
  constDiagSignInt_fun [7; 9; 7; 15; 3; 20; 19; -4; 11; 8; -11; 15; 3; 20; 19; -4; 11; 8; -11]
  = [8; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0137 :
  constDiagSignInt_fun [7; -3; 3; 5; 20; -17; -11; 20; 0; -16; 5; 5; 20; -16; -11; 20; 0; -16; 5]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0138 :
  constDiagSignInt_fun [3; 4; 0; 17; 2; 5; 14; -6; -5; -3; 20; 17; 2; 5; 14; -6; -5; -3; 20]
  = [4; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0139 :
  constDiagSignInt_fun [4; 3; 5; -7; 19; -17; 0; 0; -7; -13; 12; -8; 19; -17; 0; 0; -7; -13; 12]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0140 :
  constDiagSignInt_fun [0; 3; 6; 12; -1; -2; -11; -14; 2; 14; 14; 12; -1; -2; -11; -14; 2; 14; 14]
  = [1; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0141 :
  constDiagSignInt_fun [5; 2; 6; -5; -4; -12; 6; 20; 6; 19; 14; -5; -4; -12; 6; 20; 7; 19; 14]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0142 :
  constDiagSignInt_fun [2; 3; 0; 1; -2; 7; 8; -19; -16; 18; 8; 1; -2; 7; 8; -19; -16; 18; 8]
  = [3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0143 :
  constDiagSignInt_fun [10; 5; 5; 16; -4; 5; -20; -7; -1; -2; -17; 15; -4; 5; -20; -7; -1; -2; -17]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0144 :
  constDiagSignInt_fun [-10; 2; 6; 20; -6; -4; 2; -11; -13; 11; 20; 20; -6; -4; 2; -11; -13; 11; 20]
  = [-9; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0145 :
  constDiagSignInt_fun [-4; -2; 1; -14; -2; 19; -20; 17; -1; -1; 11; -13; -2; 19; -20; 17; -1; -1; 11]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0146 :
  constDiagSignInt_fun [-7; 0; 0; 11; 3; 6; -9; 14; -9; -19; -8; 11; 3; 6; -9; 14; -9; -19; -8]
  = [-6; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0147 :
  constDiagSignInt_fun [-3; -2; 5; 1; 20; -5; 8; -16; -15; 5; 19; 0; 20; -5; 8; -16; -15; 5; 19]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0148 :
  constDiagSignInt_fun [-2; 4; 0; 15; 20; 8; 2; -7; 4; -19; -2; 15; 20; 8; 2; -7; 4; -19; -2]
  = [-1; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0149 :
  constDiagSignInt_fun [6; 6; 2; -15; -15; 7; 8; -7; -2; 13; 11; -15; -14; 7; 8; -7; -2; 13; 11]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0150 :
  constDiagSignInt_fun [-9; 2; 0; 12; -5; -4; 0; 13; -18; -3; -1; 12; -5; -4; 0; 13; -18; -3; -1]
  = [-8; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0151 :
  constDiagSignInt_fun [-5; 9; 7; 13; 11; 12; -11; 15; 9; 10; 19; 12; 11; 12; -11; 15; 9; 10; 19]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0152 :
  constDiagSignInt_fun [-7; 0; 5; -12; -1; 2; 10; 9; -12; -11; -1; -12; -1; 2; 10; 9; -12; -11; -1]
  = [-6; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0153 :
  constDiagSignInt_fun [2; 2; 1; -17; -19; 10; 7; 5; 1; 2; 2; -16; -19; 10; 7; 5; 1; 2; 2]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0154 :
  constDiagSignInt_fun [-7; 8; 0; 2; 20; -19; 0; 17; -15; -13; 16; 2; 20; -19; 0; 17; -15; -13; 16]
  = [-6; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0155 :
  constDiagSignInt_fun [3; -1; 0; -4; 3; -14; -17; -2; -16; -13; 7; -4; 3; -14; -17; -2; -16; -13; 7]
  = [4; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0156 :
  constDiagSignInt_fun [10; -1; 2; 19; 13; -15; 7; 13; 3; -1; 4; 19; 13; -15; 7; 13; 3; -1; 4]
  = [11; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0157 :
  constDiagSignInt_fun [-5; 6; 5; -7; 12; -15; 9; 17; -11; -5; 19; -7; 12; -15; 9; 18; -11; -5; 19]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0158 :
  constDiagSignInt_fun [-4; 1; 0; 12; -18; 2; 0; 7; 4; 18; 13; 12; -18; 2; 0; 7; 4; 18; 13]
  = [-3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0159 :
  constDiagSignInt_fun [9; 2; 1; 8; 4; -7; 3; -19; 18; -14; -6; 7; 4; -7; 3; -19; 18; -14; -6]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0160 :
  constDiagSignInt_fun [-6; -2; 7; -3; 4; -5; 5; 7; 8; -3; 5; -3; 4; -5; 5; 7; 8; -3; 5]
  = [-5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0161 :
  constDiagSignInt_fun [9; 2; 4; -17; 1; 10; -4; -8; 5; -14; 11; -17; 1; 10; -3; -8; 5; -14; 11]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0162 :
  constDiagSignInt_fun [-4; 5; 0; 4; 10; -10; 5; 4; 14; 7; 13; 4; 10; -10; 5; 4; 14; 7; 13]
  = [-3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0163 :
  constDiagSignInt_fun [-9; 8; 3; 10; 14; 12; 10; -4; 4; -18; 18; 9; 14; 12; 10; -4; 4; -18; 18]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0164 :
  constDiagSignInt_fun [0; 0; 6; -17; -8; 9; -5; -5; -9; 16; 12; -17; -8; 9; -5; -5; -9; 16; 12]
  = [1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0165 :
  constDiagSignInt_fun [1; -3; 3; 8; 2; -17; -2; 13; -5; -17; -17; 8; 2; -16; -2; 13; -5; -17; -17]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0166 :
  constDiagSignInt_fun [8; 8; 0; 17; -5; 19; -8; 3; 15; -13; 2; 17; -5; 19; -8; 3; 15; -13; 2]
  = [9; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0167 :
  constDiagSignInt_fun [-2; 3; 0; -15; 10; -7; 19; 16; -1; -16; 1; -15; 10; -7; 19; 16; -1; -16; 1]
  = [-1; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0168 :
  constDiagSignInt_fun [10; 9; 7; -2; 10; 18; -4; -19; 0; 15; -19; -2; 10; 18; -4; -19; 0; 15; -19]
  = [11; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0169 :
  constDiagSignInt_fun [-1; 5; 6; -15; 5; 17; 4; -7; 5; -13; 9; -15; 5; 17; 4; -7; 6; -13; 9]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0170 :
  constDiagSignInt_fun [-8; 2; 0; 20; -18; 12; -4; -20; 6; 14; 19; 20; -18; 12; -4; -20; 6; 14; 19]
  = [-7; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0171 :
  constDiagSignInt_fun [-2; 3; 8; 16; -18; -18; 4; -16; -9; 10; -3; 15; -18; -18; 4; -16; -9; 10; -3]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0172 :
  constDiagSignInt_fun [-1; 1; 1; 18; 18; 10; 18; -8; 20; 7; 6; 18; 18; 10; 18; -8; 20; 7; 6]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0173 :
  constDiagSignInt_fun [-2; 7; 0; -3; 3; 11; 18; -5; -14; 9; -9; -3; 3; 11; 18; -5; -14; 9; -9]
  = [-1; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0174 :
  constDiagSignInt_fun [-3; -2; 0; -6; 2; -5; -1; 9; -17; -6; -2; -6; 2; -5; -1; 9; -17; -6; -2]
  = [-2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0175 :
  constDiagSignInt_fun [6; 6; 0; 18; 0; -18; -2; -8; 16; 9; -5; 18; 0; -18; -2; -8; 16; 9; -5]
  = [7; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0176 :
  constDiagSignInt_fun [7; 7; 2; 7; 6; -5; -6; -19; 19; -9; -16; 7; 6; -5; -6; -19; 19; -9; -16]
  = [8; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0177 :
  constDiagSignInt_fun [-9; 7; 3; -2; 4; 9; 7; -3; 10; 7; -8; -2; 4; 10; 7; -3; 10; 7; -8]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0178 :
  constDiagSignInt_fun [9; 5; 0; -18; 15; -12; -14; 7; -15; 12; 0; -18; 15; -12; -14; 7; -15; 12; 0]
  = [10; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0179 :
  constDiagSignInt_fun [6; 2; 0; 3; -10; 15; 2; -10; 14; -5; 14; 3; -10; 15; 2; -10; 14; -5; 14]
  = [7; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0180 :
  constDiagSignInt_fun [-9; 3; 8; -14; 19; 2; -4; -7; -5; 18; -2; -14; 19; 2; -4; -7; -5; 18; -2]
  = [-8; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0181 :
  constDiagSignInt_fun [-7; 9; 8; 9; -8; -18; -9; -4; 13; 3; -12; 9; -8; -18; -9; -4; 13; 3; -11]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0182 :
  constDiagSignInt_fun [5; 6; 0; 18; 1; -7; 12; 17; 18; 19; -10; 18; 1; -7; 12; 17; 18; 19; -10]
  = [6; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0183 :
  constDiagSignInt_fun [-1; 3; 7; 8; 0; -13; -17; -11; 1; -12; -6; 7; 0; -13; -17; -11; 1; -12; -6]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0184 :
  constDiagSignInt_fun [0; 9; 6; 4; 16; -7; -7; 0; 0; 7; -13; 4; 16; -7; -7; 0; 0; 7; -13]
  = [1; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0185 :
  constDiagSignInt_fun [6; 0; 7; -5; 6; -16; -12; 10; -20; 8; 12; -5; 6; -16; -12; 10; -20; 9; 12]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0186 :
  constDiagSignInt_fun [-6; 2; 0; 4; -6; -6; -15; 9; -14; 6; -14; 4; -6; -6; -15; 9; -14; 6; -14]
  = [-5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0187 :
  constDiagSignInt_fun [-2; 3; 7; -9; -18; -2; -9; 16; 15; -7; 3; -10; -18; -2; -9; 16; 15; -7; 3]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0188 :
  constDiagSignInt_fun [0; -2; 5; -5; -4; -11; -6; 1; -1; 17; 0; -5; -4; -11; -6; 1; -1; 17; 0]
  = [1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0189 :
  constDiagSignInt_fun [-7; 8; 6; 4; 0; -12; 17; 0; 0; 2; -17; 4; 0; -12; 17; 0; 1; 2; -17]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0190 :
  constDiagSignInt_fun [3; 1; 0; 20; -3; -12; -15; 18; 0; 19; -7; 20; -3; -12; -15; 18; 0; 19; -7]
  = [4; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0191 :
  constDiagSignInt_fun [-7; 5; 7; -17; 19; 17; -6; -19; -13; -20; -18; -18; 19; 17; -6; -19; -13; -20; -18]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0192 :
  constDiagSignInt_fun [-5; 1; 1; -8; 16; 6; -15; -14; 10; 6; -4; -8; 16; 6; -15; -14; 10; 6; -4]
  = [-4; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0193 :
  constDiagSignInt_fun [0; -1; 4; 5; 6; 16; -14; 9; 19; 18; 4; 5; 6; 16; -13; 9; 19; 18; 4]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0194 :
  constDiagSignInt_fun [5; -1; 0; -11; 1; -15; 11; 17; -6; 5; 20; -11; 1; -15; 11; 17; -6; 5; 20]
  = [6; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0195 :
  constDiagSignInt_fun [0; 5; 7; 2; 16; -1; -5; -9; 3; -6; 20; 1; 16; -1; -5; -9; 3; -6; 20]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0196 :
  constDiagSignInt_fun [4; 1; 4; 2; -14; 1; -15; 10; 12; -13; 8; 2; -14; 1; -15; 10; 12; -13; 8]
  = [5; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0197 :
  constDiagSignInt_fun [-5; 2; 7; -15; -19; 19; 7; -1; 16; 3; 2; -15; -19; 19; 7; -1; 16; 4; 2]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0198 :
  constDiagSignInt_fun [-4; -1; 0; 12; 13; 0; -17; 17; -16; -5; 0; 12; 13; 0; -17; 17; -16; -5; 0]
  = [-3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0199 :
  constDiagSignInt_fun [0; 3; 6; 5; -10; 10; -4; -2; -13; 12; 8; 4; -10; 10; -4; -2; -13; 12; 8]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0200 :
  constDiagSignInt_fun [-4; 2; 4; -20; -16; -1; -11; 7; -9; 9; -9; -20; -16; -1; -11; 7; -9; 9; -9]
  = [-3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0201 :
  constDiagSignInt_fun [4; -2; 8; -3; -11; 12; -12; -3; 3; -16; -4; -3; -11; 12; -12; -3; 3; -16; -3]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0202 :
  constDiagSignInt_fun [-8; 3; 0; 13; -10; -17; -4; 18; 9; 18; 18; 13; -10; -17; -4; 18; 9; 18; 18]
  = [-7; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0203 :
  constDiagSignInt_fun [3; 0; 6; -19; 20; 10; -6; -10; -10; -6; 7; -20; 20; 10; -6; -10; -10; -6; 7]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0204 :
  constDiagSignInt_fun [-10; -2; 5; 10; -11; 16; -10; -16; 9; 4; 2; 10; -11; 16; -10; -16; 9; 4; 2]
  = [-9; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0205 :
  constDiagSignInt_fun [6; 8; 7; 20; -7; 11; 6; 14; -4; 14; 11; 20; -7; 11; 6; 14; -4; 15; 11]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0206 :
  constDiagSignInt_fun [8; 6; 0; -13; -20; 5; -2; -10; -2; -12; 13; -13; -20; 5; -2; -10; -2; -12; 13]
  = [9; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0207 :
  constDiagSignInt_fun [-1; 6; 1; 18; 12; 6; -6; 12; 14; 13; 8; 17; 12; 6; -6; 12; 14; 13; 8]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0208 :
  constDiagSignInt_fun [3; 5; 7; 18; -15; 15; -16; -20; -3; 3; 9; 18; -15; 15; -16; -20; -3; 3; 9]
  = [4; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0209 :
  constDiagSignInt_fun [-7; -3; 7; -13; -10; -11; -13; -14; -19; -1; -18; -13; -10; -11; -13; -14; -19; 0; -18]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0210 :
  constDiagSignInt_fun [10; 6; 0; 1; 1; 1; 18; -17; -3; -2; 5; 1; 1; 1; 18; -17; -3; -2; 5]
  = [11; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0211 :
  constDiagSignInt_fun [-4; 3; 6; 11; 6; 9; -18; -3; 12; 18; -2; 10; 6; 9; -18; -3; 12; 18; -2]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0212 :
  constDiagSignInt_fun [-2; 7; 7; 1; 1; 8; 2; 12; 18; -17; -5; 1; 1; 8; 2; 12; 18; -17; -5]
  = [-1; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0213 :
  constDiagSignInt_fun [-5; 6; 0; 15; 18; -8; -13; 18; -19; -7; -13; 15; 18; -8; -13; 18; -19; -7; -13]
  = [-4; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0214 :
  constDiagSignInt_fun [7; 4; 0; -2; 9; -3; -6; -11; 17; 4; -19; -2; 9; -3; -6; -11; 17; 4; -19]
  = [8; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0215 :
  constDiagSignInt_fun [-8; 4; 2; -4; 11; 2; 17; -17; -16; 5; 4; -5; 11; 2; 17; -17; -16; 5; 4]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0216 :
  constDiagSignInt_fun [2; 4; 6; -15; -12; 6; -11; 3; 10; -14; 18; -15; -12; 6; -11; 3; 10; -14; 18]
  = [3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0217 :
  constDiagSignInt_fun [5; 0; 4; -2; 15; 5; -20; 0; 2; -13; 16; -2; 15; 5; -19; 0; 2; -13; 16]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0218 :
  constDiagSignInt_fun [0; -2; 0; -15; -3; 3; -5; -10; 8; 20; -11; -15; -3; 3; -5; -10; 8; 20; -11]
  = [1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0219 :
  constDiagSignInt_fun [4; 8; 2; 0; 15; -9; 17; 11; 3; 2; 7; -1; 15; -9; 17; 11; 3; 2; 7]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0220 :
  constDiagSignInt_fun [-2; 3; 5; -6; -9; -17; 6; 0; 0; -5; 13; -6; -9; -17; 6; 0; 0; -5; 13]
  = [-1; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0221 :
  constDiagSignInt_fun [7; -2; 0; 14; 2; 9; -5; 0; 9; 20; 10; 14; 2; 9; -5; 0; 9; 20; 10]
  = [8; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0222 :
  constDiagSignInt_fun [5; 0; 0; -16; -1; -9; 11; 12; -15; -16; -17; -16; -1; -9; 11; 12; -15; -16; -17]
  = [6; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0223 :
  constDiagSignInt_fun [-5; 3; 5; -16; 10; 19; -6; -20; -10; -9; 13; -17; 10; 19; -6; -20; -10; -9; 13]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0224 :
  constDiagSignInt_fun [5; 4; 1; 10; 12; -14; -6; -4; -15; 17; 11; 10; 12; -14; -6; -4; -15; 17; 11]
  = [6; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0225 :
  constDiagSignInt_fun [-3; 6; 3; 11; -15; -16; -19; -2; 0; 8; -8; 11; -15; -15; -19; -2; 0; 8; -8]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0226 :
  constDiagSignInt_fun [-4; -1; 0; -19; -10; 12; -11; -4; 5; -19; 14; -19; -10; 12; -11; -4; 5; -19; 14]
  = [-3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0227 :
  constDiagSignInt_fun [3; 4; 1; -11; -8; 1; -1; 15; -20; 10; 6; -12; -8; 1; -1; 15; -20; 10; 6]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0228 :
  constDiagSignInt_fun [9; -2; 7; -11; -19; 17; 2; -17; -10; -17; -4; -11; -19; 17; 2; -17; -10; -17; -4]
  = [10; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0229 :
  constDiagSignInt_fun [5; -1; 8; 11; -13; -20; 11; -14; 2; 13; -13; 11; -13; -20; 11; -14; 2; 13; -12]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0230 :
  constDiagSignInt_fun [2; -2; 0; -12; -11; -8; -12; -11; -7; 9; 13; -12; -11; -8; -12; -11; -7; 9; 13]
  = [3; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0231 :
  constDiagSignInt_fun [-9; 6; 4; -11; -3; 20; -16; -17; -4; 15; 19; -12; -3; 20; -16; -17; -4; 15; 19]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0232 :
  constDiagSignInt_fun [-4; 2; 8; -14; -18; -10; -13; -1; 10; -2; -3; -14; -18; -10; -13; -1; 10; -2; -3]
  = [-3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0233 :
  constDiagSignInt_fun [-7; 8; 6; -4; 16; -19; -16; -20; 7; -11; -17; -4; 16; -19; -16; -20; 8; -11; -17]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0234 :
  constDiagSignInt_fun [5; 5; 0; -14; 0; 7; -1; -11; 19; -2; 3; -14; 0; 7; -1; -11; 19; -2; 3]
  = [6; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0235 :
  constDiagSignInt_fun [-9; 6; 8; 0; 15; 11; -13; 7; 13; -3; 4; -1; 15; 11; -13; 7; 13; -3; 4]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0236 :
  constDiagSignInt_fun [9; -2; 8; -18; -5; 19; 13; 14; 0; -5; 3; -18; -5; 19; 13; 14; 0; -5; 3]
  = [10; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0237 :
  constDiagSignInt_fun [-2; 2; 3; 8; 11; 3; 10; -7; -17; -12; 11; 8; 11; 4; 10; -7; -17; -12; 11]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0238 :
  constDiagSignInt_fun [-9; 3; 0; 7; 16; 2; -5; -6; -3; -5; -11; 7; 16; 2; -5; -6; -3; -5; -11]
  = [-8; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0239 :
  constDiagSignInt_fun [-5; -1; 8; 20; 8; -20; 17; 20; -18; 18; -5; 19; 8; -20; 17; 20; -18; 18; -5]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0240 :
  constDiagSignInt_fun [-9; 8; 4; 20; -2; 1; 14; 19; 16; -3; 15; 20; -2; 1; 14; 19; 16; -3; 15]
  = [-8; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0241 :
  constDiagSignInt_fun [5; -2; 0; -12; 5; 10; -11; 7; 18; 3; -17; -12; 5; 10; -11; 7; 18; 3; -17]
  = [6; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0242 :
  constDiagSignInt_fun [-4; -1; 0; 4; 1; -13; -8; -2; 1; 19; -1; 4; 1; -13; -8; -2; 1; 19; -1]
  = [-3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0243 :
  constDiagSignInt_fun [8; -2; 1; -15; -14; -1; -20; 10; -6; -1; 18; -16; -14; -1; -20; 10; -6; -1; 18]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0244 :
  constDiagSignInt_fun [0; 1; 8; 3; 1; -17; 3; 13; 0; 2; 6; 3; 1; -17; 3; 13; 0; 2; 6]
  = [1; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0245 :
  constDiagSignInt_fun [-2; -1; 2; -12; -1; -7; -18; 15; 11; -8; 8; -12; 0; -7; -18; 15; 11; -8; 8]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0246 :
  constDiagSignInt_fun [-4; -1; 0; 9; 4; 12; -18; -5; 19; -18; -13; 9; 4; 12; -18; -5; 19; -18; -13]
  = [-3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0247 :
  constDiagSignInt_fun [2; 0; 7; -1; -14; -18; -13; -9; 10; 5; -6; -2; -14; -18; -13; -9; 10; 5; -6]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0248 :
  constDiagSignInt_fun [5; 9; 4; 1; 5; 7; -13; 8; 4; -13; -12; 1; 5; 7; -13; 8; 4; -13; -12]
  = [6; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0249 :
  constDiagSignInt_fun [-2; 4; 1; 1; 15; 3; 1; 12; 4; 13; -2; 2; 15; 3; 1; 12; 4; 13; -2]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0250 :
  constDiagSignInt_fun [-3; 8; 0; -12; 8; 4; 9; 12; 12; 14; 7; -12; 8; 4; 9; 12; 12; 14; 7]
  = [-2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0251 :
  constDiagSignInt_fun [-4; -3; 0; -8; 1; 2; 16; 20; -5; 4; -20; -8; 1; 2; 16; 20; -5; 4; -20]
  = [-3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0252 :
  constDiagSignInt_fun [-6; 0; 2; 14; 16; 17; 6; -16; 20; 17; 0; 14; 16; 17; 6; -16; 20; 17; 0]
  = [-5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0253 :
  constDiagSignInt_fun [4; -3; 8; 11; -10; -10; -12; -9; 7; 17; -18; 11; -10; -10; -12; -9; 7; 17; -17]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0254 :
  constDiagSignInt_fun [-8; 2; 0; 8; -16; 20; 8; 14; -15; -5; -3; 8; -16; 20; 8; 14; -15; -5; -3]
  = [-7; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0255 :
  constDiagSignInt_fun [7; 5; 3; -18; 15; 0; -18; -6; -20; 5; 14; -19; 15; 0; -18; -6; -20; 5; 14]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0256 :
  constDiagSignInt_fun [-1; -2; 0; -2; 6; -11; -2; 8; 15; -12; 14; -2; 6; -11; -2; 8; 15; -12; 14]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0257 :
  constDiagSignInt_fun [-3; 0; 7; 18; -1; 9; -11; -7; -19; -3; 3; 18; -1; 9; -11; -7; -19; -2; 3]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0258 :
  constDiagSignInt_fun [-7; 8; 0; -16; -19; -11; -18; -14; 16; -19; 12; -16; -19; -11; -18; -14; 16; -19; 12]
  = [-6; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0259 :
  constDiagSignInt_fun [0; -2; 1; 20; -7; -15; 8; 3; 2; -10; 18; 19; -7; -15; 8; 3; 2; -10; 18]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0260 :
  constDiagSignInt_fun [1; -2; 1; -4; 14; -13; -13; -2; 17; 6; -20; -4; 14; -13; -13; -2; 17; 6; -20]
  = [2; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0261 :
  constDiagSignInt_fun [1; 5; 6; -17; -9; 20; 19; -3; 14; 0; 17; -17; -9; 20; 19; -3; 15; 0; 17]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0262 :
  constDiagSignInt_fun [-3; -1; 0; -10; 13; 11; -8; 3; -17; -17; 7; -10; 13; 11; -8; 3; -17; -17; 7]
  = [-2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0263 :
  constDiagSignInt_fun [0; 6; 7; 18; 11; -18; -17; 11; -7; -19; -6; 17; 11; -18; -17; 11; -7; -19; -6]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0264 :
  constDiagSignInt_fun [-5; 5; 5; 5; -20; 7; -14; 16; 19; 6; 12; 5; -20; 7; -14; 16; 19; 6; 12]
  = [-4; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0265 :
  constDiagSignInt_fun [9; 4; 7; -16; 8; -12; -1; -2; -9; -1; -19; -16; 8; -12; -1; -2; -9; 0; -19]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0266 :
  constDiagSignInt_fun [-7; 0; 0; -20; -7; -15; 8; -6; -10; 1; -4; -20; -7; -15; 8; -6; -10; 1; -4]
  = [-6; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0267 :
  constDiagSignInt_fun [-8; 8; 8; 11; 10; -7; 4; 4; 16; 15; 18; 10; 10; -7; 4; 4; 16; 15; 18]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0268 :
  constDiagSignInt_fun [-6; 0; 3; 20; 4; 15; 13; 2; 14; 12; -10; 20; 4; 15; 13; 2; 14; 12; -10]
  = [-5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0269 :
  constDiagSignInt_fun [2; 7; 0; 4; -19; -16; 18; 7; 14; 11; -2; 4; -19; -16; 18; 7; 14; 11; -2]
  = [3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0270 :
  constDiagSignInt_fun [-1; 3; 0; 4; -6; 0; 10; -5; 13; -14; -11; 4; -6; 0; 10; -5; 13; -14; -11]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0271 :
  constDiagSignInt_fun [-8; 6; 8; 20; 12; 6; -2; -15; 0; 15; 18; 19; 12; 6; -2; -15; 0; 15; 18]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0272 :
  constDiagSignInt_fun [6; -1; 1; 2; -13; 1; -4; 20; 4; -8; -15; 2; -13; 1; -4; 20; 4; -8; -15]
  = [7; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0273 :
  constDiagSignInt_fun [3; 3; 0; -3; 20; -20; -14; 5; -18; 3; 0; -3; 20; -20; -14; 5; -18; 3; 0]
  = [4; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0274 :
  constDiagSignInt_fun [-4; 4; 0; -11; -9; 16; 5; 18; 8; -4; 10; -11; -9; 16; 5; 18; 8; -4; 10]
  = [-3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0275 :
  constDiagSignInt_fun [0; -2; 1; -8; 15; -10; 14; -10; -19; -4; -14; -9; 15; -10; 14; -10; -19; -4; -14]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0276 :
  constDiagSignInt_fun [-10; 2; 0; -13; 13; -12; -16; -19; 17; 8; -8; -13; 13; -12; -16; -19; 17; 8; -8]
  = [-9; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0277 :
  constDiagSignInt_fun [-9; -2; 5; 8; -17; -8; 15; 9; -7; -15; 0; 8; -17; -8; 15; 10; -7; -15; 0]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0278 :
  constDiagSignInt_fun [-6; 3; 0; 12; 13; -18; -8; -18; -11; 2; 1; 12; 13; -18; -8; -18; -11; 2; 1]
  = [-5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0279 :
  constDiagSignInt_fun [4; 0; 1; -2; -2; 0; 9; 18; 4; -4; -18; -3; -2; 0; 9; 18; 4; -4; -18]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0280 :
  constDiagSignInt_fun [-7; -3; 7; -7; -9; -3; 12; 4; -6; -15; 14; -7; -9; -3; 12; 4; -6; -15; 14]
  = [-6; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0281 :
  constDiagSignInt_fun [5; 8; 3; -14; 6; 17; -5; -6; 15; -5; 5; -14; 6; 18; -5; -6; 15; -5; 5]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0282 :
  constDiagSignInt_fun [-9; 7; 0; -14; 13; -12; 7; 12; 5; 5; 3; -14; 13; -12; 7; 12; 5; 5; 3]
  = [-8; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0283 :
  constDiagSignInt_fun [1; 3; 1; 7; 9; 17; 17; 2; -8; 7; -13; 6; 9; 17; 17; 2; -8; 7; -13]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0284 :
  constDiagSignInt_fun [-1; 5; 1; -13; -18; 8; 15; 0; 0; 0; -12; -13; -18; 8; 15; 0; 0; 0; -12]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0285 :
  constDiagSignInt_fun [5; 3; 4; -16; 7; 1; -16; 11; 4; -16; -18; -16; 7; 1; -15; 11; 4; -16; -18]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0286 :
  constDiagSignInt_fun [-7; -1; 0; 13; -11; 14; -1; 13; -7; 19; -4; 13; -11; 14; -1; 13; -7; 19; -4]
  = [-6; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0287 :
  constDiagSignInt_fun [10; -1; 4; 6; 14; -5; 3; 19; -13; -11; -12; 5; 14; -5; 3; 19; -13; -11; -12]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0288 :
  constDiagSignInt_fun [3; 7; 8; -1; -15; 3; -11; -14; -20; 1; -12; -1; -15; 3; -11; -14; -20; 1; -12]
  = [4; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0289 :
  constDiagSignInt_fun [5; 6; 2; 20; 12; -18; -16; -6; -9; -4; -15; 20; 13; -18; -16; -6; -9; -4; -15]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0290 :
  constDiagSignInt_fun [10; 8; 0; -4; -9; -8; -17; 17; -3; 19; 0; -4; -9; -8; -17; 17; -3; 19; 0]
  = [11; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0291 :
  constDiagSignInt_fun [8; 5; 5; 12; -1; -13; 11; 6; -20; -2; 0; 11; -1; -13; 11; 6; -20; -2; 0]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0292 :
  constDiagSignInt_fun [-10; -1; 7; -7; -16; -11; 11; 18; 11; 8; 17; -7; -16; -11; 11; 18; 11; 8; 17]
  = [-9; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0293 :
  constDiagSignInt_fun [-6; 4; 3; 16; 13; -2; -18; -15; -19; -18; 4; 16; 13; -1; -18; -15; -19; -18; 4]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0294 :
  constDiagSignInt_fun [8; 8; 0; -6; -19; -18; -13; -5; 11; -14; 4; -6; -19; -18; -13; -5; 11; -14; 4]
  = [9; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0295 :
  constDiagSignInt_fun [-7; 6; 4; 15; -16; -19; -1; 3; 12; -19; 12; 14; -16; -19; -1; 3; 12; -19; 12]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0296 :
  constDiagSignInt_fun [8; -1; 4; 1; -8; -13; -7; -10; 20; 10; -9; 1; -8; -13; -7; -10; 20; 10; -9]
  = [9; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0297 :
  constDiagSignInt_fun [8; 8; 1; -17; 10; 3; 20; -18; -9; -11; -20; -16; 10; 3; 20; -18; -9; -11; -20]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0298 :
  constDiagSignInt_fun [-5; 8; 0; 0; 17; 18; -14; 17; 11; -1; -9; 0; 17; 18; -14; 17; 11; -1; -9]
  = [-4; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0299 :
  constDiagSignInt_fun [-6; 5; 1; 17; 9; 12; 2; 17; -18; 1; 14; 16; 9; 12; 2; 17; -18; 1; 14]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0300 :
  constDiagSignInt_fun [6; 1; 0; -3; 9; 4; 14; -12; -1; -4; -14; -3; 9; 4; 14; -12; -1; -4; -14]
  = [7; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0301 :
  constDiagSignInt_fun [1; 4; 6; -6; 18; 19; 13; 9; 3; 8; -14; -6; 18; 19; 13; 9; 4; 8; -14]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0302 :
  constDiagSignInt_fun [5; 0; 0; -1; 9; 9; 2; 8; -17; 14; 5; -1; 9; 9; 2; 8; -17; 14; 5]
  = [6; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0303 :
  constDiagSignInt_fun [7; 4; 8; -4; -5; 8; -2; 2; 2; 4; 1; -5; -5; 8; -2; 2; 2; 4; 1]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0304 :
  constDiagSignInt_fun [-5; -2; 2; -5; -16; 4; 3; -19; 6; 19; 6; -5; -16; 4; 3; -19; 6; 19; 6]
  = [-4; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0305 :
  constDiagSignInt_fun [-10; 8; 5; 13; 20; 5; -6; -9; -13; -9; 3; 13; 20; 5; -6; -8; -13; -9; 3]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0306 :
  constDiagSignInt_fun [4; -2; 0; -19; -14; 4; 14; -10; 12; -9; 18; -19; -14; 4; 14; -10; 12; -9; 18]
  = [5; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0307 :
  constDiagSignInt_fun [9; -3; 1; 9; -1; -5; 12; -17; 7; 6; -16; 8; -1; -5; 12; -17; 7; 6; -16]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0308 :
  constDiagSignInt_fun [-3; 5; 4; 9; -16; -3; -4; 0; -9; -14; 1; 9; -16; -3; -4; 0; -9; -14; 1]
  = [-2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0309 :
  constDiagSignInt_fun [-7; 2; 1; 4; 10; 2; -18; -1; -17; -12; -13; 5; 10; 2; -18; -1; -17; -12; -13]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0310 :
  constDiagSignInt_fun [6; -1; 0; 9; 12; -8; -18; 8; 14; -17; 7; 9; 12; -8; -18; 8; 14; -17; 7]
  = [7; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0311 :
  constDiagSignInt_fun [3; 3; 2; 11; 13; -6; -16; 7; 3; 8; 16; 10; 13; -6; -16; 7; 3; 8; 16]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0312 :
  constDiagSignInt_fun [-8; 3; 8; 3; -12; 19; -12; 9; 0; 4; -4; 3; -12; 19; -12; 9; 0; 4; -4]
  = [-7; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0313 :
  constDiagSignInt_fun [10; 2; 0; 9; 11; 1; -7; -4; -10; -15; 6; 9; 11; 1; -7; -4; -10; -15; 6]
  = [11; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0314 :
  constDiagSignInt_fun [10; 5; 0; 6; 18; 7; -16; -7; -10; 1; 19; 6; 18; 7; -16; -7; -10; 1; 19]
  = [11; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0315 :
  constDiagSignInt_fun [9; -3; 1; 18; 1; -1; 16; -10; 16; -20; -20; 17; 1; -1; 16; -10; 16; -20; -20]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0316 :
  constDiagSignInt_fun [2; 5; 7; 6; 9; -18; 7; -2; 16; -4; 8; 6; 9; -18; 7; -2; 16; -4; 8]
  = [3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0317 :
  constDiagSignInt_fun [7; 0; 7; 5; -11; 16; -7; -9; -5; -15; -1; 5; -11; 16; -7; -9; -5; -14; -1]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0318 :
  constDiagSignInt_fun [3; 8; 0; 6; 8; -16; -14; 2; -1; 5; -15; 6; 8; -16; -14; 2; -1; 5; -15]
  = [4; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0319 :
  constDiagSignInt_fun [-8; 8; 3; -19; -1; -4; 6; -19; -1; 15; -5; -20; -1; -4; 6; -19; -1; 15; -5]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0320 :
  constDiagSignInt_fun [-3; 2; 6; 11; -10; -10; 8; -12; 12; 1; 1; 11; -10; -10; 8; -12; 12; 1; 1]
  = [-2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0321 :
  constDiagSignInt_fun [1; 2; 5; 8; -9; 8; -15; 4; -13; 19; -17; 8; -9; 8; -15; 5; -13; 19; -17]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0322 :
  constDiagSignInt_fun [-8; 8; 0; 5; 0; -20; -9; -15; 12; 13; 11; 5; 0; -20; -9; -15; 12; 13; 11]
  = [-7; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0323 :
  constDiagSignInt_fun [1; 0; 6; -6; -15; 4; 3; -12; 3; 10; 7; -7; -15; 4; 3; -12; 3; 10; 7]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0324 :
  constDiagSignInt_fun [-7; 3; 3; 16; -15; -12; 16; 3; 18; -16; 8; 16; -15; -12; 16; 3; 18; -16; 8]
  = [-6; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0325 :
  constDiagSignInt_fun [-3; 4; 7; 20; 11; -8; -9; -3; 2; 11; 0; 20; 11; -8; -9; -3; 2; 12; 0]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0326 :
  constDiagSignInt_fun [-6; 6; 0; 3; 6; 1; 19; -17; -5; 16; -8; 3; 6; 1; 19; -17; -5; 16; -8]
  = [-5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0327 :
  constDiagSignInt_fun [-5; 5; 5; -3; 17; -19; -14; 8; -9; -10; 9; -4; 17; -19; -14; 8; -9; -10; 9]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0328 :
  constDiagSignInt_fun [0; 3; 8; -6; -11; -4; 16; 3; -7; 4; 9; -6; -11; -4; 16; 3; -7; 4; 9]
  = [1; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0329 :
  constDiagSignInt_fun [-8; 3; 2; 14; -3; 17; -8; 17; -16; 19; 14; 14; -2; 17; -8; 17; -16; 19; 14]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0330 :
  constDiagSignInt_fun [-7; 7; 0; 10; 14; 10; -19; 14; -19; 14; -14; 10; 14; 10; -19; 14; -19; 14; -14]
  = [-6; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0331 :
  constDiagSignInt_fun [-10; 9; 1; -15; -15; -2; 12; -15; 5; -10; -19; -16; -15; -2; 12; -15; 5; -10; -19]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0332 :
  constDiagSignInt_fun [-10; 8; 3; -2; -4; -3; -3; 18; 17; 1; 13; -2; -4; -3; -3; 18; 17; 1; 13]
  = [-9; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0333 :
  constDiagSignInt_fun [8; 8; 5; 3; 11; 20; -6; 13; 19; -2; -17; 3; 11; 20; -6; 14; 19; -2; -17]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0334 :
  constDiagSignInt_fun [-9; 7; 0; 18; -14; 9; 5; 10; 8; 7; -9; 18; -14; 9; 5; 10; 8; 7; -9]
  = [-8; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0335 :
  constDiagSignInt_fun [2; 3; 8; -11; 19; 18; -9; -5; 3; -7; -11; -12; 19; 18; -9; -5; 3; -7; -11]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0336 :
  constDiagSignInt_fun [-3; -1; 3; -13; -20; 16; -15; 2; -3; 5; -4; -13; -20; 16; -15; 2; -3; 5; -4]
  = [-2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0337 :
  constDiagSignInt_fun [3; 6; 7; 5; 19; -18; -4; 20; 20; -16; -16; 5; 19; -18; -4; 20; 20; -15; -16]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0338 :
  constDiagSignInt_fun [-7; 7; 0; -20; -19; -13; -4; 5; -8; -7; 11; -20; -19; -13; -4; 5; -8; -7; 11]
  = [-6; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0339 :
  constDiagSignInt_fun [-9; -2; 1; -12; -4; 17; 12; 17; -9; -19; 7; -13; -4; 17; 12; 17; -9; -19; 7]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0340 :
  constDiagSignInt_fun [-2; 6; 8; 18; 19; -3; 6; -18; -15; 0; -1; 18; 19; -3; 6; -18; -15; 0; -1]
  = [-1; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0341 :
  constDiagSignInt_fun [9; 1; 3; 0; -20; -14; 4; -18; 1; -16; 11; 0; -20; -13; 4; -18; 1; -16; 11]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0342 :
  constDiagSignInt_fun [-9; 3; 0; 16; -16; -13; -7; -2; -4; -7; -10; 16; -16; -13; -7; -2; -4; -7; -10]
  = [-8; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0343 :
  constDiagSignInt_fun [-1; 9; 7; 2; 9; -3; 6; 7; -18; -11; -6; 1; 9; -3; 6; 7; -18; -11; -6]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0344 :
  constDiagSignInt_fun [6; 1; 3; -12; -7; -18; 20; -9; -13; 6; 18; -12; -7; -18; 20; -9; -13; 6; 18]
  = [7; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0345 :
  constDiagSignInt_fun [-4; 1; 7; -12; -18; 19; -3; 9; 1; 20; -4; -12; -18; 19; -3; 9; 1; 21; -4]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0346 :
  constDiagSignInt_fun [-5; -2; 0; -6; -5; -15; 2; -20; 3; -7; 11; -6; -5; -15; 2; -20; 3; -7; 11]
  = [-4; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0347 :
  constDiagSignInt_fun [9; 4; 0; -6; 6; -8; 15; -18; 12; -18; 15; -6; 6; -8; 15; -18; 12; -18; 15]
  = [10; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0348 :
  constDiagSignInt_fun [-8; 8; 2; 13; 17; -20; -17; -8; -14; -9; -12; 13; 17; -20; -17; -8; -14; -9; -12]
  = [-7; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0349 :
  constDiagSignInt_fun [-2; 1; 0; 14; 14; -7; -3; 4; -20; 2; -20; 14; 14; -7; -3; 4; -20; 2; -20]
  = [-1; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0350 :
  constDiagSignInt_fun [-8; 0; 0; 5; -11; -17; 13; -10; -16; -18; 19; 5; -11; -17; 13; -10; -16; -18; 19]
  = [-7; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0351 :
  constDiagSignInt_fun [1; -3; 3; -3; 2; -1; -16; 6; -8; 20; 20; -4; 2; -1; -16; 6; -8; 20; 20]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0352 :
  constDiagSignInt_fun [10; -3; 1; 1; -4; 18; 18; 3; -2; -10; -7; 1; -4; 18; 18; 3; -2; -10; -7]
  = [11; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0353 :
  constDiagSignInt_fun [-4; 3; 8; -15; 18; 9; -10; -20; -1; 18; -19; -15; 18; 9; -10; -20; -1; 18; -18]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0354 :
  constDiagSignInt_fun [-10; 3; 0; -7; -7; -17; -16; 10; -12; 8; -3; -7; -7; -17; -16; 10; -12; 8; -3]
  = [-9; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0355 :
  constDiagSignInt_fun [-5; 3; 5; -3; 17; 3; -5; -1; 2; -12; 15; -4; 17; 3; -5; -1; 2; -12; 15]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0356 :
  constDiagSignInt_fun [3; 3; 6; -12; 6; -8; -6; 14; 10; -5; -4; -12; 6; -8; -6; 14; 10; -5; -4]
  = [4; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0357 :
  constDiagSignInt_fun [-4; 3; 8; 13; 17; -18; 17; 1; 12; 0; -20; 13; 17; -18; 17; 1; 12; 0; -19]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0358 :
  constDiagSignInt_fun [-8; -1; 0; 12; 14; 19; 15; 10; 3; -18; 18; 12; 14; 19; 15; 10; 3; -18; 18]
  = [-7; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0359 :
  constDiagSignInt_fun [7; 7; 6; 6; 1; -10; -10; 6; -13; 12; 15; 5; 1; -10; -10; 6; -13; 12; 15]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0360 :
  constDiagSignInt_fun [2; 8; 8; 7; 3; -3; 18; 11; 12; -18; 5; 7; 3; -3; 18; 11; 12; -18; 5]
  = [3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0361 :
  constDiagSignInt_fun [-2; 8; 7; 20; -2; -4; -3; 1; -4; -10; 6; 20; -2; -4; -3; 1; -4; -9; 6]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0362 :
  constDiagSignInt_fun [6; 2; 0; 18; -2; 6; -3; -9; -12; -14; 10; 18; -2; 6; -3; -9; -12; -14; 10]
  = [7; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0363 :
  constDiagSignInt_fun [2; 8; 3; 1; 19; -11; 3; -18; -19; 9; 19; 0; 19; -11; 3; -18; -19; 9; 19]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0364 :
  constDiagSignInt_fun [-8; 8; 8; 11; -12; 1; -6; 20; 15; 9; 13; 11; -12; 1; -6; 20; 15; 9; 13]
  = [-7; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0365 :
  constDiagSignInt_fun [7; -3; 1; -2; 16; 1; 11; -20; 1; 6; -7; -1; 16; 1; 11; -20; 1; 6; -7]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0366 :
  constDiagSignInt_fun [-6; 1; 0; -13; -17; 16; 6; 18; -11; -20; 8; -13; -17; 16; 6; 18; -11; -20; 8]
  = [-5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0367 :
  constDiagSignInt_fun [-3; 7; 6; 3; -8; 7; -5; 10; 17; -2; 14; 2; -8; 7; -5; 10; 17; -2; 14]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0368 :
  constDiagSignInt_fun [-2; -3; 8; 2; -9; -6; 6; 3; 20; -20; 7; 2; -9; -6; 6; 3; 20; -20; 7]
  = [-1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0369 :
  constDiagSignInt_fun [8; 7; 2; 16; 11; -18; 9; -20; -6; -18; 17; 16; 12; -18; 9; -20; -6; -18; 17]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0370 :
  constDiagSignInt_fun [-6; -1; 0; 18; -9; 13; -9; -9; -16; 9; -1; 18; -9; 13; -9; -9; -16; 9; -1]
  = [-5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0371 :
  constDiagSignInt_fun [5; -2; 6; 7; -6; 20; -6; 18; 15; 17; 20; 6; -6; 20; -6; 18; 15; 17; 20]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0372 :
  constDiagSignInt_fun [9; 4; 6; 13; -11; 1; -11; -8; -11; -2; -3; 13; -11; 1; -11; -8; -11; -2; -3]
  = [10; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0373 :
  constDiagSignInt_fun [-5; 8; 0; -5; -1; -16; -17; -4; 0; 20; -10; -5; -1; -16; -17; -4; 0; 20; -10]
  = [-4; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0374 :
  constDiagSignInt_fun [-6; -1; 0; 17; 0; 17; -10; 7; 5; -5; 18; 17; 0; 17; -10; 7; 5; -5; 18]
  = [-5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0375 :
  constDiagSignInt_fun [-3; 7; 8; 18; 5; 4; -10; -8; -15; 14; 2; 17; 5; 4; -10; -8; -15; 14; 2]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0376 :
  constDiagSignInt_fun [10; 2; 5; 2; 1; -3; -1; -19; -15; -11; 19; 2; 1; -3; -1; -19; -15; -11; 19]
  = [11; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0377 :
  constDiagSignInt_fun [-9; 4; 1; 5; 2; 11; -7; 12; 13; 15; -4; 6; 2; 11; -7; 12; 13; 15; -4]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0378 :
  constDiagSignInt_fun [8; 8; 0; -5; -1; 20; 0; 4; -5; -1; 3; -5; -1; 20; 0; 4; -5; -1; 3]
  = [9; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0379 :
  constDiagSignInt_fun [4; 7; 7; 13; -20; -14; 4; 4; 3; 7; -6; 12; -20; -14; 4; 4; 3; 7; -6]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0380 :
  constDiagSignInt_fun [-7; 1; 7; -19; 0; 15; 2; 20; 0; 9; -9; -19; 0; 15; 2; 20; 0; 9; -9]
  = [-6; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0381 :
  constDiagSignInt_fun [5; -1; 0; -18; 1; 12; -11; -2; -5; 19; 0; -18; 1; 12; -11; -2; -5; 19; 0]
  = [6; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0382 :
  constDiagSignInt_fun [10; -2; 0; -20; 14; -8; -10; 20; -1; 11; -7; -20; 14; -8; -10; 20; -1; 11; -7]
  = [11; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0383 :
  constDiagSignInt_fun [-6; 9; 0; -19; 19; 5; -8; -18; 17; 11; 11; -19; 19; 5; -8; -18; 17; 11; 11]
  = [-5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0384 :
  constDiagSignInt_fun [9; 1; 7; 17; -18; 20; 16; 10; 1; 16; 15; 17; -18; 20; 16; 10; 1; 16; 15]
  = [10; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0385 :
  constDiagSignInt_fun [8; 7; 7; -2; -17; 8; 3; -12; -19; 16; 15; -2; -17; 8; 3; -12; -19; 17; 15]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0386 :
  constDiagSignInt_fun [-6; -2; 0; 1; -12; -17; -6; -10; -18; 6; -1; 1; -12; -17; -6; -10; -18; 6; -1]
  = [-5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0387 :
  constDiagSignInt_fun [-2; 6; 5; 5; 20; -16; 14; -17; 7; -10; 3; 4; 20; -16; 14; -17; 7; -10; 3]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0388 :
  constDiagSignInt_fun [-7; 1; 3; -8; -13; 4; 17; 19; 16; -1; 19; -8; -13; 4; 17; 19; 16; -1; 19]
  = [-6; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0389 :
  constDiagSignInt_fun [-7; -1; 5; 2; 6; 16; -9; -16; -2; 17; -11; 2; 6; 16; -9; -15; -2; 17; -11]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0390 :
  constDiagSignInt_fun [5; 1; 0; -10; 15; 4; 20; 11; 8; 11; -1; -10; 15; 4; 20; 11; 8; 11; -1]
  = [6; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0391 :
  constDiagSignInt_fun [7; -3; 1; 19; -16; -11; 19; 15; 4; 20; -2; 18; -16; -11; 19; 15; 4; 20; -2]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0392 :
  constDiagSignInt_fun [-10; 4; 7; -7; 11; -20; -12; -20; -15; 3; -12; -7; 11; -20; -12; -20; -15; 3; -12]
  = [-9; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0393 :
  constDiagSignInt_fun [9; 9; 2; 17; -15; 11; 4; 8; -2; -5; 8; 17; -14; 11; 4; 8; -2; -5; 8]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0394 :
  constDiagSignInt_fun [7; 2; 0; -12; -16; -17; -7; -6; 18; 3; 6; -12; -16; -17; -7; -6; 18; 3; 6]
  = [8; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0395 :
  constDiagSignInt_fun [-7; 0; 5; 17; -6; -11; 9; 3; -2; -11; 5; 16; -6; -11; 9; 3; -2; -11; 5]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0396 :
  constDiagSignInt_fun [-6; 8; 6; 7; 6; -9; 5; -19; 12; -20; 8; 7; 6; -9; 5; -19; 12; -20; 8]
  = [-5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0397 :
  constDiagSignInt_fun [9; 2; 8; -8; 16; 20; 10; 13; -2; -12; -3; -8; 16; 20; 10; 13; -2; -12; -2]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0398 :
  constDiagSignInt_fun [-7; 3; 0; -18; -2; -4; 17; -11; -17; 4; -19; -18; -2; -4; 17; -11; -17; 4; -19]
  = [-6; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0399 :
  constDiagSignInt_fun [-2; 5; 6; -19; -18; -8; 15; 3; -10; 8; -7; -20; -18; -8; 15; 3; -10; 8; -7]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0400 :
  constDiagSignInt_fun [-8; 0; 0; -13; -3; 15; -15; 15; 11; -11; 17; -13; -3; 15; -15; 15; 11; -11; 17]
  = [-7; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0401 :
  constDiagSignInt_fun [-8; 5; 5; 19; -18; 0; -14; -20; 20; 19; -2; 19; -18; 0; -14; -19; 20; 19; -2]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0402 :
  constDiagSignInt_fun [6; 9; 0; 15; 15; 1; 16; -9; -2; -20; -15; 15; 15; 1; 16; -9; -2; -20; -15]
  = [7; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0403 :
  constDiagSignInt_fun [-10; -1; 2; -1; -8; 18; -2; -10; -19; -10; 1; -2; -8; 18; -2; -10; -19; -10; 1]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0404 :
  constDiagSignInt_fun [-4; 6; 3; 0; 2; -14; 18; -15; 19; 3; 1; 0; 2; -14; 18; -15; 19; 3; 1]
  = [-3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0405 :
  constDiagSignInt_fun [8; -1; 4; -11; 11; 12; -18; 2; 7; 11; -7; -11; 11; 12; -17; 2; 7; 11; -7]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0406 :
  constDiagSignInt_fun [2; 1; 0; -20; -2; -8; 15; 8; -15; 7; 6; -20; -2; -8; 15; 8; -15; 7; 6]
  = [3; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0407 :
  constDiagSignInt_fun [1; 4; 2; -10; -12; 8; 12; 6; -18; 7; -16; -11; -12; 8; 12; 6; -18; 7; -16]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0408 :
  constDiagSignInt_fun [0; 4; 3; 9; -15; -18; 16; -8; 15; -6; 9; 9; -15; -18; 16; -8; 15; -6; 9]
  = [1; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0409 :
  constDiagSignInt_fun [3; 8; 0; -19; -4; -12; 17; 12; -9; -14; 17; -19; -4; -12; 17; 12; -9; -14; 17]
  = [4; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0410 :
  constDiagSignInt_fun [6; 1; 0; -5; 20; -3; -7; -4; -11; 14; -17; -5; 20; -3; -7; -4; -11; 14; -17]
  = [7; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0411 :
  constDiagSignInt_fun [-2; 5; 8; 6; -5; -18; 2; 5; 4; 5; 9; 5; -5; -18; 2; 5; 4; 5; 9]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0412 :
  constDiagSignInt_fun [-10; 5; 7; -5; 13; 2; 6; -8; -2; 18; -1; -5; 13; 2; 6; -8; -2; 18; -1]
  = [-9; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0413 :
  constDiagSignInt_fun [8; 0; 7; -1; -10; -20; -17; -20; -19; -3; 14; -1; -10; -20; -17; -20; -19; -2; 14]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0414 :
  constDiagSignInt_fun [9; -1; 0; -14; -20; -19; 5; -1; 19; -1; 2; -14; -20; -19; 5; -1; 19; -1; 2]
  = [10; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0415 :
  constDiagSignInt_fun [-6; -3; 6; 17; 20; 6; -9; -18; 8; 6; -11; 16; 20; 6; -9; -18; 8; 6; -11]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0416 :
  constDiagSignInt_fun [-1; 2; 4; -18; -8; -4; -10; -16; -19; 13; 9; -18; -8; -4; -10; -16; -19; 13; 9]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0417 :
  constDiagSignInt_fun [-10; 6; 6; -14; -2; 20; -16; 10; 17; 4; -18; -14; -2; 20; -16; 10; 18; 4; -18]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0418 :
  constDiagSignInt_fun [2; 9; 0; -4; 17; 5; 13; -1; -6; -16; 14; -4; 17; 5; 13; -1; -6; -16; 14]
  = [3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0419 :
  constDiagSignInt_fun [-4; 2; 4; -2; 3; -2; 3; 11; -4; 19; -7; -3; 3; -2; 3; 11; -4; 19; -7]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0420 :
  constDiagSignInt_fun [-1; 3; 0; 20; 14; 9; -1; 4; -8; 9; 14; 20; 14; 9; -1; 4; -8; 9; 14]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0421 :
  constDiagSignInt_fun [9; 3; 5; -6; 20; -11; 19; -8; 13; 4; 10; -6; 20; -11; 19; -7; 13; 4; 10]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0422 :
  constDiagSignInt_fun [4; 2; 0; 7; -19; -8; -20; 7; -6; -10; 9; 7; -19; -8; -20; 7; -6; -10; 9]
  = [5; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0423 :
  constDiagSignInt_fun [3; 0; 6; -5; -10; 1; 15; -10; -1; 3; 10; -6; -10; 1; 15; -10; -1; 3; 10]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0424 :
  constDiagSignInt_fun [-1; 2; 2; 3; 10; 15; 4; -18; 18; -8; 14; 3; 10; 15; 4; -18; 18; -8; 14]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0425 :
  constDiagSignInt_fun [1; -2; 3; 6; 15; -10; -5; 19; -5; 2; -5; 6; 15; -9; -5; 19; -5; 2; -5]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0426 :
  constDiagSignInt_fun [1; 4; 0; 15; -4; 3; 13; 8; 11; 3; 20; 15; -4; 3; 13; 8; 11; 3; 20]
  = [2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0427 :
  constDiagSignInt_fun [8; 3; 2; -3; -16; -13; -16; 13; 12; -16; -20; -4; -16; -13; -16; 13; 12; -16; -20]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0428 :
  constDiagSignInt_fun [-3; 0; 2; -15; 5; 5; -10; -12; 15; 0; -20; -15; 5; 5; -10; -12; 15; 0; -20]
  = [-2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0429 :
  constDiagSignInt_fun [4; 6; 1; -9; -14; 8; -20; 13; 9; 15; -12; -8; -14; 8; -20; 13; 9; 15; -12]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0430 :
  constDiagSignInt_fun [-8; 9; 0; -9; 3; -7; -12; -11; 8; -9; -1; -9; 3; -7; -12; -11; 8; -9; -1]
  = [-7; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0431 :
  constDiagSignInt_fun [7; -2; 2; -14; -11; -12; 9; -16; -19; 20; -5; -15; -11; -12; 9; -16; -19; 20; -5]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0432 :
  constDiagSignInt_fun [-10; 2; 5; 1; 3; 9; 8; -17; 14; 18; -10; 1; 3; 9; 8; -17; 14; 18; -10]
  = [-9; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0433 :
  constDiagSignInt_fun [-4; 1; 1; -8; 16; -5; -10; -2; -17; 8; -16; -7; 16; -5; -10; -2; -17; 8; -16]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0434 :
  constDiagSignInt_fun [-9; 9; 0; 11; 14; -8; -12; 8; -8; -6; 2; 11; 14; -8; -12; 8; -8; -6; 2]
  = [-8; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0435 :
  constDiagSignInt_fun [-8; 8; 2; 15; -4; -17; 8; 4; -18; -1; 17; 14; -4; -17; 8; 4; -18; -1; 17]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0436 :
  constDiagSignInt_fun [-8; -3; 8; -16; 19; 8; -11; -3; -1; -8; 1; -16; 19; 8; -11; -3; -1; -8; 1]
  = [-7; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0437 :
  constDiagSignInt_fun [-1; -1; 5; 16; -4; 1; -8; -20; 7; -3; 13; 16; -4; 1; -8; -19; 7; -3; 13]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0438 :
  constDiagSignInt_fun [-5; 4; 0; 2; -12; 1; -9; -4; 2; -17; -18; 2; -12; 1; -9; -4; 2; -17; -18]
  = [-4; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0439 :
  constDiagSignInt_fun [-10; -1; 8; -1; 1; -15; 1; -4; -19; -7; 10; -2; 1; -15; 1; -4; -19; -7; 10]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0440 :
  constDiagSignInt_fun [-10; 1; 1; -1; -8; 15; -17; -12; -15; 15; 18; -1; -8; 15; -17; -12; -15; 15; 18]
  = [-9; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0441 :
  constDiagSignInt_fun [-5; 9; 2; -16; -13; 13; -7; 4; 11; -15; 1; -16; -12; 13; -7; 4; 11; -15; 1]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0442 :
  constDiagSignInt_fun [-1; 7; 0; 18; -20; -2; 10; -14; -2; 17; 16; 18; -20; -2; 10; -14; -2; 17; 16]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0443 :
  constDiagSignInt_fun [-10; 9; 8; 19; 15; -11; -8; -9; 19; -17; -7; 18; 15; -11; -8; -9; 19; -17; -7]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0444 :
  constDiagSignInt_fun [-9; 2; 0; -7; -10; 16; 15; -20; -1; -17; -6; -7; -10; 16; 15; -20; -1; -17; -6]
  = [-8; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0445 :
  constDiagSignInt_fun [10; 4; 8; 16; -17; -16; 11; -11; -11; -14; -14; 16; -17; -16; 11; -11; -11; -14; -13]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0446 :
  constDiagSignInt_fun [6; 9; 0; -15; -17; -2; -11; 19; 12; 17; -1; -15; -17; -2; -11; 19; 12; 17; -1]
  = [7; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0447 :
  constDiagSignInt_fun [0; 8; 1; 6; 12; -16; 9; -6; 6; 0; -7; 5; 12; -16; 9; -6; 6; 0; -7]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0448 :
  constDiagSignInt_fun [-6; 3; 8; 18; 10; -6; -4; -17; -4; -9; 10; 18; 10; -6; -4; -17; -4; -9; 10]
  = [-5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0449 :
  constDiagSignInt_fun [10; 3; 2; -7; 18; 19; -16; -1; 15; -19; -20; -7; 19; 19; -16; -1; 15; -19; -20]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0450 :
  constDiagSignInt_fun [6; 3; 0; 15; 11; -7; -1; 5; 2; 15; 14; 15; 11; -7; -1; 5; 2; 15; 14]
  = [7; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0451 :
  constDiagSignInt_fun [-4; 8; 0; -12; -5; 11; -20; -19; -20; -4; 9; -12; -5; 11; -20; -19; -20; -4; 9]
  = [-3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0452 :
  constDiagSignInt_fun [3; 6; 1; -10; 4; -14; 7; -16; 8; -18; -2; -10; 4; -14; 7; -16; 8; -18; -2]
  = [4; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0453 :
  constDiagSignInt_fun [2; 3; 7; -9; -7; -10; -7; -19; -5; -9; 5; -9; -7; -10; -7; -19; -5; -8; 5]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0454 :
  constDiagSignInt_fun [-5; 6; 0; -2; -11; -5; -10; 5; 17; -9; 0; -2; -11; -5; -10; 5; 17; -9; 0]
  = [-4; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0455 :
  constDiagSignInt_fun [3; 6; 8; 11; 10; -7; -9; 16; -17; 0; -2; 10; 10; -7; -9; 16; -17; 0; -2]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0456 :
  constDiagSignInt_fun [-6; 2; 6; -19; 11; 20; -11; -10; 16; -4; -1; -19; 11; 20; -11; -10; 16; -4; -1]
  = [-5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0457 :
  constDiagSignInt_fun [7; 4; 5; -15; -13; -20; 13; -3; -10; -10; 18; -15; -13; -20; 13; -2; -10; -10; 18]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0458 :
  constDiagSignInt_fun [8; 6; 0; -9; 4; -4; -20; -8; 6; -14; 18; -9; 4; -4; -20; -8; 6; -14; 18]
  = [9; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0459 :
  constDiagSignInt_fun [-9; 9; 1; 16; -17; -17; 9; -1; 11; -19; -8; 15; -17; -17; 9; -1; 11; -19; -8]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0460 :
  constDiagSignInt_fun [5; 6; 2; 3; -3; -8; -18; 15; -20; -1; 11; 3; -3; -8; -18; 15; -20; -1; 11]
  = [6; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0461 :
  constDiagSignInt_fun [-10; 0; 7; 15; 11; 3; -13; 4; 17; 12; -4; 15; 11; 3; -13; 4; 17; 13; -4]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0462 :
  constDiagSignInt_fun [2; -3; 0; 19; 20; 17; 8; -15; 20; -14; -12; 19; 20; 17; 8; -15; 20; -14; -12]
  = [3; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0463 :
  constDiagSignInt_fun [10; 7; 7; 6; -20; 19; -17; -14; -11; 20; 16; 5; -20; 19; -17; -14; -11; 20; 16]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0464 :
  constDiagSignInt_fun [5; 2; 8; -19; 5; -20; -19; 7; -20; 17; -18; -19; 5; -20; -19; 7; -20; 17; -18]
  = [6; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0465 :
  constDiagSignInt_fun [-6; 3; 1; 13; 12; 13; 9; 10; 0; -17; 20; 14; 12; 13; 9; 10; 0; -17; 20]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0466 :
  constDiagSignInt_fun [5; 2; 0; 19; 1; 5; -4; -19; 7; -4; -8; 19; 1; 5; -4; -19; 7; -4; -8]
  = [6; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0467 :
  constDiagSignInt_fun [0; 7; 3; 13; 20; 0; 4; 11; 14; 19; 13; 12; 20; 0; 4; 11; 14; 19; 13]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0468 :
  constDiagSignInt_fun [-2; 2; 2; -5; 4; -19; 9; 10; 8; -5; 15; -5; 4; -19; 9; 10; 8; -5; 15]
  = [-1; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0469 :
  constDiagSignInt_fun [-8; 0; 8; -17; 4; -1; 8; -1; 6; 6; -6; -17; 4; -1; 8; -1; 6; 6; -5]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0470 :
  constDiagSignInt_fun [2; 4; 0; 20; -1; 9; 19; -4; -7; -1; -10; 20; -1; 9; 19; -4; -7; -1; -10]
  = [3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0471 :
  constDiagSignInt_fun [4; -2; 3; 2; 2; 7; -10; 5; -7; 5; 7; 1; 2; 7; -10; 5; -7; 5; 7]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0472 :
  constDiagSignInt_fun [5; 2; 0; -15; -6; 4; 10; 19; 18; -18; 2; -15; -6; 4; 10; 19; 18; -18; 2]
  = [6; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0473 :
  constDiagSignInt_fun [-5; 5; 3; -7; 9; 3; 16; -20; 18; -14; 12; -7; 9; 4; 16; -20; 18; -14; 12]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0474 :
  constDiagSignInt_fun [4; 4; 0; 17; 8; -17; 4; 0; -3; -13; -5; 17; 8; -17; 4; 0; -3; -13; -5]
  = [5; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0475 :
  constDiagSignInt_fun [-2; -2; 0; -14; 12; 12; 7; -3; -17; 15; 0; -14; 12; 12; 7; -3; -17; 15; 0]
  = [-1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0476 :
  constDiagSignInt_fun [0; 8; 3; -13; 10; -17; -9; 10; 18; -20; 16; -13; 10; -17; -9; 10; 18; -20; 16]
  = [1; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0477 :
  constDiagSignInt_fun [-9; 9; 1; -17; 14; -15; -2; -8; -12; -4; 12; -16; 14; -15; -2; -8; -12; -4; 12]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0478 :
  constDiagSignInt_fun [-6; 4; 0; 19; -19; -12; 19; -10; -5; -5; -13; 19; -19; -12; 19; -10; -5; -5; -13]
  = [-5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0479 :
  constDiagSignInt_fun [-2; 9; 2; 8; 18; -12; -2; 13; -2; 9; 2; 7; 18; -12; -2; 13; -2; 9; 2]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0480 :
  constDiagSignInt_fun [-3; 0; 1; -11; 19; 20; -11; -20; -5; 19; -17; -11; 19; 20; -11; -20; -5; 19; -17]
  = [-2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0481 :
  constDiagSignInt_fun [-7; 4; 1; -5; 17; -18; 14; 18; 20; -10; 13; -4; 17; -18; 14; 18; 20; -10; 13]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0482 :
  constDiagSignInt_fun [-8; -3; 0; -2; 9; 5; 10; 5; -18; 17; 2; -2; 9; 5; 10; 5; -18; 17; 2]
  = [-7; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0483 :
  constDiagSignInt_fun [10; -2; 0; 17; -1; -6; -4; -12; 0; 5; -17; 17; -1; -6; -4; -12; 0; 5; -17]
  = [11; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0484 :
  constDiagSignInt_fun [0; -2; 6; -18; 1; 18; 19; -7; 6; -6; -15; -18; 1; 18; 19; -7; 6; -6; -15]
  = [1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0485 :
  constDiagSignInt_fun [-2; 3; 8; -7; 13; 13; 6; 11; 2; -16; -2; -7; 13; 13; 6; 11; 2; -16; -1]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0486 :
  constDiagSignInt_fun [-1; -3; 0; -18; 0; 9; 16; -11; -6; 1; 14; -18; 0; 9; 16; -11; -6; 1; 14]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0487 :
  constDiagSignInt_fun [10; 4; 1; 19; 18; 1; 16; -2; -10; -16; 9; 18; 18; 1; 16; -2; -10; -16; 9]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0488 :
  constDiagSignInt_fun [3; 9; 5; 3; -5; 12; 10; 15; 9; 20; -9; 3; -5; 12; 10; 15; 9; 20; -9]
  = [4; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0489 :
  constDiagSignInt_fun [-5; -2; 2; -5; 10; -11; -2; 7; -3; 8; 11; -5; 11; -11; -2; 7; -3; 8; 11]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0490 :
  constDiagSignInt_fun [6; 5; 0; -16; -10; 10; -15; 20; 3; -17; -14; -16; -10; 10; -15; 20; 3; -17; -14]
  = [7; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0491 :
  constDiagSignInt_fun [4; 5; 8; 17; 20; -15; -9; -1; 11; 19; -13; 16; 20; -15; -9; -1; 11; 19; -13]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0492 :
  constDiagSignInt_fun [6; 9; 1; 7; 7; 17; -4; 14; 1; 11; 18; 7; 7; 17; -4; 14; 1; 11; 18]
  = [7; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0493 :
  constDiagSignInt_fun [4; -1; 8; -10; -1; -13; 1; 11; -10; 19; -14; -10; -1; -13; 1; 11; -10; 19; -13]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0494 :
  constDiagSignInt_fun [6; 6; 0; -8; -11; 12; 16; -13; 17; -14; -6; -8; -11; 12; 16; -13; 17; -14; -6]
  = [7; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0495 :
  constDiagSignInt_fun [-3; -2; 7; -9; 12; 2; 3; 5; 15; -9; 15; -10; 12; 2; 3; 5; 15; -9; 15]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0496 :
  constDiagSignInt_fun [-6; 3; 4; 5; 1; 0; -20; 11; -18; 12; 17; 5; 1; 0; -20; 11; -18; 12; 17]
  = [-5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0497 :
  constDiagSignInt_fun [1; 8; 8; -19; 17; 16; 11; 8; 2; -2; 18; -19; 17; 16; 11; 8; 2; -2; 19]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0498 :
  constDiagSignInt_fun [-2; 6; 0; 11; -4; 9; 1; -4; 17; -15; 3; 11; -4; 9; 1; -4; 17; -15; 3]
  = [-1; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0499 :
  constDiagSignInt_fun [5; 4; 7; -12; -3; -3; -10; 19; -10; 17; -10; -13; -3; -3; -10; 19; -10; 17; -10]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0500 :
  constDiagSignInt_fun [5; -1; 1; 0; 20; 5; -1; -1; -13; -1; 7; 0; 20; 5; -1; -1; -13; -1; 7]
  = [6; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0501 :
  constDiagSignInt_fun [-1; -2; 1; 10; -19; 10; -4; 19; -1; -2; -14; 11; -19; 10; -4; 19; -1; -2; -14]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0502 :
  constDiagSignInt_fun [-10; 9; 0; -11; 16; 4; 12; 15; -20; -19; -9; -11; 16; 4; 12; 15; -20; -19; -9]
  = [-9; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0503 :
  constDiagSignInt_fun [5; -2; 2; 7; -14; 9; -11; 14; -9; 3; -5; 6; -14; 9; -11; 14; -9; 3; -5]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0504 :
  constDiagSignInt_fun [4; 7; 1; 1; 12; 5; 0; 6; -20; -17; -2; 1; 12; 5; 0; 6; -20; -17; -2]
  = [5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0505 :
  constDiagSignInt_fun [9; 2; 3; -14; 20; -4; 10; 12; -14; -15; -4; -14; 20; -3; 10; 12; -14; -15; -4]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0506 :
  constDiagSignInt_fun [-10; 7; 0; -16; 0; 12; -19; -16; 15; -5; -11; -16; 0; 12; -19; -16; 15; -5; -11]
  = [-9; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0507 :
  constDiagSignInt_fun [-4; 0; 1; -15; -9; 0; -8; -16; -12; 3; -7; -16; -9; 0; -8; -16; -12; 3; -7]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0508 :
  constDiagSignInt_fun [-10; 5; 5; -12; 6; -9; -2; 14; -17; -2; -7; -12; 6; -9; -2; 14; -17; -2; -7]
  = [-9; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0509 :
  constDiagSignInt_fun [7; 9; 0; -14; -8; 5; -8; 10; 1; 11; -8; -14; -8; 5; -8; 10; 1; 11; -8]
  = [8; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0510 :
  constDiagSignInt_fun [0; 9; 0; 5; 3; -2; 20; 8; -14; 5; -8; 5; 3; -2; 20; 8; -14; 5; -8]
  = [1; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0511 :
  constDiagSignInt_fun [0; 5; 8; -9; 5; 15; 7; 12; -18; 19; -11; -10; 5; 15; 7; 12; -18; 19; -11]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0512 :
  constDiagSignInt_fun [0; -3; 5; 13; -13; -7; 12; -20; 14; -12; -4; 13; -13; -7; 12; -20; 14; -12; -4]
  = [1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0513 :
  constDiagSignInt_fun [-5; 8; 4; -1; -9; -16; 17; 0; -7; 11; 12; -1; -9; -16; 18; 0; -7; 11; 12]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0514 :
  constDiagSignInt_fun [4; 3; 0; -9; -9; 16; -6; -14; -11; 4; 11; -9; -9; 16; -6; -14; -11; 4; 11]
  = [5; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0515 :
  constDiagSignInt_fun [5; 2; 5; 0; -11; -9; -5; 17; 14; -14; -19; -1; -11; -9; -5; 17; 14; -14; -19]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0516 :
  constDiagSignInt_fun [4; -2; 0; 18; 11; 18; 2; -9; -17; 13; 7; 18; 11; 18; 2; -9; -17; 13; 7]
  = [5; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0517 :
  constDiagSignInt_fun [-7; 7; 1; 15; 4; 4; -4; -9; 14; -11; -12; 16; 4; 4; -4; -9; 14; -11; -12]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0518 :
  constDiagSignInt_fun [-9; -2; 0; -1; -20; 15; 10; -4; -8; -19; -14; -1; -20; 15; 10; -4; -8; -19; -14]
  = [-8; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0519 :
  constDiagSignInt_fun [-8; 4; 7; 12; 17; -3; -7; -9; 3; -3; 4; 11; 17; -3; -7; -9; 3; -3; 4]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0520 :
  constDiagSignInt_fun [10; 9; 6; -18; 16; 17; -2; 0; 5; -4; 8; -18; 16; 17; -2; 0; 5; -4; 8]
  = [11; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0521 :
  constDiagSignInt_fun [6; 0; 2; -12; -1; 6; -7; 9; 9; 9; -15; -12; 0; 6; -7; 9; 9; 9; -15]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0522 :
  constDiagSignInt_fun [3; 8; 0; -9; 1; 16; 19; -6; 13; 6; -19; -9; 1; 16; 19; -6; 13; 6; -19]
  = [4; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0523 :
  constDiagSignInt_fun [9; -1; 5; 10; -19; -16; 7; 18; -13; 2; -8; 9; -19; -16; 7; 18; -13; 2; -8]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0524 :
  constDiagSignInt_fun [0; 8; 5; 13; 17; -13; -6; 15; -11; 9; 3; 13; 17; -13; -6; 15; -11; 9; 3]
  = [1; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0525 :
  constDiagSignInt_fun [2; 6; 2; 0; 0; 20; -2; 18; 0; 7; 5; 0; 1; 20; -2; 18; 0; 7; 5]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0526 :
  constDiagSignInt_fun [-10; 3; 0; 5; 4; 1; 5; 19; 20; -15; -7; 5; 4; 1; 5; 19; 20; -15; -7]
  = [-9; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0527 :
  constDiagSignInt_fun [1; 0; 3; 12; -13; -8; 10; 9; -7; -17; -4; 11; -13; -8; 10; 9; -7; -17; -4]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0528 :
  constDiagSignInt_fun [7; 2; 6; -7; -1; 0; 2; -17; -18; 19; 14; -7; -1; 0; 2; -17; -18; 19; 14]
  = [8; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0529 :
  constDiagSignInt_fun [1; 6; 5; -16; -16; -18; -10; 9; -4; -16; -1; -16; -16; -18; -10; 10; -4; -16; -1]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0530 :
  constDiagSignInt_fun [-3; 0; 0; 8; -10; 2; -6; -9; 1; -16; 10; 8; -10; 2; -6; -9; 1; -16; 10]
  = [-2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0531 :
  constDiagSignInt_fun [7; -3; 1; -19; -3; 12; 11; 8; -3; 17; -19; -20; -3; 12; 11; 8; -3; 17; -19]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0532 :
  constDiagSignInt_fun [-5; 8; 7; 1; -11; 2; -8; -19; -11; 12; -15; 1; -11; 2; -8; -19; -11; 12; -15]
  = [-4; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0533 :
  constDiagSignInt_fun [9; 6; 8; 10; -2; 20; -9; -14; -15; 17; 14; 10; -2; 20; -9; -14; -15; 17; 15]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0534 :
  constDiagSignInt_fun [-6; 9; 0; 4; -5; -2; -8; 13; 19; 18; 17; 4; -5; -2; -8; 13; 19; 18; 17]
  = [-5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0535 :
  constDiagSignInt_fun [-6; 7; 4; 6; 3; -18; 0; 1; -13; 9; -13; 5; 3; -18; 0; 1; -13; 9; -13]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0536 :
  constDiagSignInt_fun [10; 7; 1; -5; -3; -10; -16; 7; 19; 5; -5; -5; -3; -10; -16; 7; 19; 5; -5]
  = [11; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0537 :
  constDiagSignInt_fun [10; 8; 4; -18; -17; 5; -15; 16; 4; -14; 1; -18; -17; 5; -14; 16; 4; -14; 1]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0538 :
  constDiagSignInt_fun [-7; 3; 0; -12; -19; 14; -14; -3; -16; 14; -1; -12; -19; 14; -14; -3; -16; 14; -1]
  = [-6; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0539 :
  constDiagSignInt_fun [0; 4; 0; 6; -15; 12; 5; 12; -16; 20; -12; 6; -15; 12; 5; 12; -16; 20; -12]
  = [1; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0540 :
  constDiagSignInt_fun [-8; 9; 7; 11; 14; -5; 8; 0; -18; -18; 17; 11; 14; -5; 8; 0; -18; -18; 17]
  = [-7; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0541 :
  constDiagSignInt_fun [-9; 4; 5; 9; -1; -7; 16; 8; -9; -15; 0; 9; -1; -7; 16; 9; -9; -15; 0]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0542 :
  constDiagSignInt_fun [-2; -2; 0; 3; -3; -11; 4; 5; -14; 14; 3; 3; -3; -11; 4; 5; -14; 14; 3]
  = [-1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0543 :
  constDiagSignInt_fun [6; 3; 8; 13; -15; 2; 16; -2; 5; 3; 16; 12; -15; 2; 16; -2; 5; 3; 16]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0544 :
  constDiagSignInt_fun [5; 2; 2; 9; -10; -8; -4; 9; 7; 12; 5; 9; -10; -8; -4; 9; 7; 12; 5]
  = [6; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0545 :
  constDiagSignInt_fun [1; 8; 1; 10; 5; 4; -15; 0; 17; 14; 7; 11; 5; 4; -15; 0; 17; 14; 7]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0546 :
  constDiagSignInt_fun [-8; 9; 0; 12; 7; 15; 5; -1; -2; 20; -5; 12; 7; 15; 5; -1; -2; 20; -5]
  = [-7; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0547 :
  constDiagSignInt_fun [1; 9; 2; -14; 15; 5; 14; -15; 19; -4; -18; -15; 15; 5; 14; -15; 19; -4; -18]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0548 :
  constDiagSignInt_fun [1; 9; 3; -4; 0; 2; -3; 11; -6; -9; -19; -4; 0; 2; -3; 11; -6; -9; -19]
  = [2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0549 :
  constDiagSignInt_fun [6; -2; 1; -11; 3; -14; 19; 12; -9; -5; -20; -10; 3; -14; 19; 12; -9; -5; -20]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0550 :
  constDiagSignInt_fun [3; 0; 0; 7; 13; 0; -11; 16; 6; 2; -5; 7; 13; 0; -11; 16; 6; 2; -5]
  = [4; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0551 :
  constDiagSignInt_fun [-4; 3; 2; 4; -11; 8; 0; -10; -15; -18; -8; 3; -11; 8; 0; -10; -15; -18; -8]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0552 :
  constDiagSignInt_fun [2; -1; 2; -12; -18; -12; 4; -19; -11; -9; -8; -12; -18; -12; 4; -19; -11; -9; -8]
  = [3; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0553 :
  constDiagSignInt_fun [-7; -3; 7; 19; -13; 1; 14; -1; -9; 14; -5; 19; -13; 1; 14; -1; -9; 15; -5]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0554 :
  constDiagSignInt_fun [-2; 7; 0; -13; -2; 10; -1; -19; -15; 16; 6; -13; -2; 10; -1; -19; -15; 16; 6]
  = [-1; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0555 :
  constDiagSignInt_fun [-4; 6; 8; 10; -4; -1; 14; 15; -17; 18; -5; 9; -4; -1; 14; 15; -17; 18; -5]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0556 :
  constDiagSignInt_fun [1; 6; 5; 11; -7; -16; 20; 17; 9; 6; -17; 11; -7; -16; 20; 17; 9; 6; -17]
  = [2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0557 :
  constDiagSignInt_fun [4; -1; 5; 1; -11; 7; -15; 10; -6; -12; -3; 1; -11; 7; -15; 11; -6; -12; -3]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0558 :
  constDiagSignInt_fun [-2; 2; 0; 0; 11; -14; 9; 14; -9; 16; -20; 0; 11; -14; 9; 14; -9; 16; -20]
  = [-1; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0559 :
  constDiagSignInt_fun [8; 1; 1; 7; -13; -7; 10; -4; 12; 16; 6; 6; -13; -7; 10; -4; 12; 16; 6]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0560 :
  constDiagSignInt_fun [-3; 3; 5; -10; 19; 3; -11; -8; -5; 16; 15; -10; 19; 3; -11; -8; -5; 16; 15]
  = [-2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0561 :
  constDiagSignInt_fun [7; 6; 2; -14; 19; 6; -13; -16; 12; -18; 15; -14; 20; 6; -13; -16; 12; -18; 15]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0562 :
  constDiagSignInt_fun [-7; 8; 0; 11; 20; -16; 19; 13; 3; -16; 8; 11; 20; -16; 19; 13; 3; -16; 8]
  = [-6; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0563 :
  constDiagSignInt_fun [-8; 6; 8; 4; -19; 20; 3; -3; -1; 18; 13; 3; -19; 20; 3; -3; -1; 18; 13]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0564 :
  constDiagSignInt_fun [6; 0; 3; 7; 12; 17; 16; -14; 6; -4; 3; 7; 12; 17; 16; -14; 6; -4; 3]
  = [7; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0565 :
  constDiagSignInt_fun [-3; 0; 6; -11; 17; -13; 13; -4; -19; 15; -20; -11; 17; -13; 13; -4; -18; 15; -20]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0566 :
  constDiagSignInt_fun [1; 6; 0; -5; -2; 10; -3; 13; -10; -20; -14; -5; -2; 10; -3; 13; -10; -20; -14]
  = [2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0567 :
  constDiagSignInt_fun [-3; 3; 3; 17; 3; -5; -3; -5; 6; -19; 13; 16; 3; -5; -3; -5; 6; -19; 13]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0568 :
  constDiagSignInt_fun [10; -3; 6; 18; -11; -2; -17; -17; 12; 8; 1; 18; -11; -2; -17; -17; 12; 8; 1]
  = [11; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0569 :
  constDiagSignInt_fun [1; -2; 8; 7; -20; -12; -9; -16; 16; 7; 15; 7; -20; -12; -9; -16; 16; 7; 16]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0570 :
  constDiagSignInt_fun [5; 2; 0; -18; -17; -10; 20; -5; -9; 18; -13; -18; -17; -10; 20; -5; -9; 18; -13]
  = [6; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0571 :
  constDiagSignInt_fun [6; -1; 6; 19; -18; -20; -13; -14; -16; -6; 18; 18; -18; -20; -13; -14; -16; -6; 18]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0572 :
  constDiagSignInt_fun [0; 4; 0; 18; 18; 7; 11; -8; 12; 9; -19; 18; 18; 7; 11; -8; 12; 9; -19]
  = [1; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0573 :
  constDiagSignInt_fun [6; 0; 5; -11; -6; 3; -3; -11; -15; 20; 12; -11; -6; 3; -3; -10; -15; 20; 12]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0574 :
  constDiagSignInt_fun [-6; 5; 0; 2; -1; -16; -9; 17; -1; 5; -11; 2; -1; -16; -9; 17; -1; 5; -11]
  = [-5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0575 :
  constDiagSignInt_fun [2; -2; 6; 11; -14; -6; -5; 8; -8; -12; -10; 10; -14; -6; -5; 8; -8; -12; -10]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0576 :
  constDiagSignInt_fun [8; 6; 4; 4; 8; -2; 12; -1; 1; 8; -14; 4; 8; -2; 12; -1; 1; 8; -14]
  = [9; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0577 :
  constDiagSignInt_fun [3; 7; 4; 12; 5; 1; 10; 19; 1; -16; 7; 12; 5; 1; 11; 19; 1; -16; 7]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0578 :
  constDiagSignInt_fun [-9; 1; 0; 0; -1; -20; -2; 10; 9; 6; -5; 0; -1; -20; -2; 10; 9; 6; -5]
  = [-8; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0579 :
  constDiagSignInt_fun [-7; 7; 7; 8; 16; -17; 16; 5; 19; -13; -17; 7; 16; -17; 16; 5; 19; -13; -17]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0580 :
  constDiagSignInt_fun [5; 7; 0; 13; -16; -1; -6; 9; -12; 2; -13; 13; -16; -1; -6; 9; -12; 2; -13]
  = [6; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0581 :
  constDiagSignInt_fun [5; 9; 3; 14; 12; 5; -19; -9; 11; 9; 2; 14; 12; 6; -19; -9; 11; 9; 2]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0582 :
  constDiagSignInt_fun [3; -2; 0; -15; -19; 17; -18; 8; 17; -3; 14; -15; -19; 17; -18; 8; 17; -3; 14]
  = [4; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0583 :
  constDiagSignInt_fun [3; 7; 0; -10; -7; 17; 11; -8; -20; -15; -1; -10; -7; 17; 11; -8; -20; -15; -1]
  = [4; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0584 :
  constDiagSignInt_fun [4; 2; 7; -17; 13; -11; -16; 11; -5; 17; 0; -17; 13; -11; -16; 11; -5; 17; 0]
  = [5; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0585 :
  constDiagSignInt_fun [-4; 5; 8; 4; 1; 9; 18; 5; 16; 7; -6; 4; 1; 9; 18; 5; 16; 7; -5]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0586 :
  constDiagSignInt_fun [2; 8; 0; -14; -2; -18; 14; 4; 1; -4; 8; -14; -2; -18; 14; 4; 1; -4; 8]
  = [3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0587 :
  constDiagSignInt_fun [-7; 2; 5; -1; -3; -13; 10; 4; -11; -20; -20; -2; -3; -13; 10; 4; -11; -20; -20]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0588 :
  constDiagSignInt_fun [-2; 3; 7; -16; -1; 2; 12; -13; -3; -9; 4; -16; -1; 2; 12; -13; -3; -9; 4]
  = [-1; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0589 :
  constDiagSignInt_fun [-1; 0; 3; -6; -2; 7; 5; -3; 0; -16; -10; -6; -2; 8; 5; -3; 0; -16; -10]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0590 :
  constDiagSignInt_fun [-6; 1; 0; -5; 11; -6; 0; 1; -6; 4; 8; -5; 11; -6; 0; 1; -6; 4; 8]
  = [-5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0591 :
  constDiagSignInt_fun [5; 1; 6; -19; 15; -15; -12; -13; 13; 12; -8; -20; 15; -15; -12; -13; 13; 12; -8]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0592 :
  constDiagSignInt_fun [-1; 7; 2; 4; -2; 14; -20; -20; 7; 8; 0; 4; -2; 14; -20; -20; 7; 8; 0]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0593 :
  constDiagSignInt_fun [-10; -3; 2; 5; 17; 1; 6; 7; 9; -9; 19; 5; 18; 1; 6; 7; 9; -9; 19]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0594 :
  constDiagSignInt_fun [7; -3; 0; 6; 3; -1; 20; -11; 16; -3; 6; 6; 3; -1; 20; -11; 16; -3; 6]
  = [8; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0595 :
  constDiagSignInt_fun [-5; 4; 8; 12; 11; -14; 20; -11; -8; 7; -3; 11; 11; -14; 20; -11; -8; 7; -3]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0596 :
  constDiagSignInt_fun [3; 8; 8; -10; 9; -1; -13; 18; 14; 2; 5; -10; 9; -1; -13; 18; 14; 2; 5]
  = [4; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0597 :
  constDiagSignInt_fun [-7; 1; 8; 2; -3; -17; -4; -9; 13; -2; -5; 2; -3; -17; -4; -9; 13; -2; -4]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0598 :
  constDiagSignInt_fun [1; -1; 0; 18; -4; 20; 7; -9; 4; -7; -12; 18; -4; 20; 7; -9; 4; -7; -12]
  = [2; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0599 :
  constDiagSignInt_fun [3; -2; 5; 13; -16; -7; 19; -18; 7; 10; -11; 12; -16; -7; 19; -18; 7; 10; -11]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0600 :
  constDiagSignInt_fun [-9; 5; 7; -5; 1; 4; 8; -4; 1; -1; -7; -5; 1; 4; 8; -4; 1; -1; -7]
  = [-8; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0601 :
  constDiagSignInt_fun [8; 6; 8; 11; 3; 18; 15; 12; 17; 2; 13; 11; 3; 18; 15; 12; 17; 2; 14]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0602 :
  constDiagSignInt_fun [-8; 2; 0; 2; 20; -19; 6; -4; -2; -4; -17; 2; 20; -19; 6; -4; -2; -4; -17]
  = [-7; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0603 :
  constDiagSignInt_fun [3; 8; 1; 8; -3; -11; -17; 15; -13; 10; 17; 7; -3; -11; -17; 15; -13; 10; 17]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0604 :
  constDiagSignInt_fun [-10; 4; 0; 1; 10; -13; 8; 15; -1; 4; 10; 1; 10; -13; 8; 15; -1; 4; 10]
  = [-9; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0605 :
  constDiagSignInt_fun [-8; 9; 8; 0; 18; 1; 16; -17; -1; 9; -3; 0; 18; 1; 16; -17; -1; 9; -2]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0606 :
  constDiagSignInt_fun [7; 2; 0; -17; -14; 20; -17; 3; 10; 20; 12; -17; -14; 20; -17; 3; 10; 20; 12]
  = [8; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0607 :
  constDiagSignInt_fun [3; -2; 5; 1; 0; 0; 17; 13; 1; -17; 8; 0; 0; 0; 17; 13; 1; -17; 8]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0608 :
  constDiagSignInt_fun [-10; 1; 6; -5; -14; 18; -13; 5; -7; -10; 8; -5; -14; 18; -13; 5; -7; -10; 8]
  = [-9; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0609 :
  constDiagSignInt_fun [-7; 7; 5; -16; 8; -10; -10; -1; 13; 9; -16; -16; 8; -10; -10; 0; 13; 9; -16]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0610 :
  constDiagSignInt_fun [10; 3; 0; -14; -13; 19; -9; -7; 15; 17; -11; -14; -13; 19; -9; -7; 15; 17; -11]
  = [11; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0611 :
  constDiagSignInt_fun [9; 5; 5; 16; -5; 1; 17; 1; 2; -2; -10; 15; -5; 1; 17; 1; 2; -2; -10]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0612 :
  constDiagSignInt_fun [5; 3; 5; -17; -9; -17; 6; 20; -6; 4; 8; -17; -9; -17; 6; 20; -6; 4; 8]
  = [6; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0613 :
  constDiagSignInt_fun [4; 9; 4; 14; 2; -1; -4; -6; 5; 3; -5; 14; 2; -1; -3; -6; 5; 3; -5]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0614 :
  constDiagSignInt_fun [0; -1; 0; -5; 7; 4; -18; -9; -15; -12; 14; -5; 7; 4; -18; -9; -15; -12; 14]
  = [1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0615 :
  constDiagSignInt_fun [4; 3; 0; -15; 15; -1; -6; -17; -11; 6; 7; -15; 15; -1; -6; -17; -11; 6; 7]
  = [5; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0616 :
  constDiagSignInt_fun [8; 0; 1; -2; -19; 1; 16; -3; 14; -7; 4; -2; -19; 1; 16; -3; 14; -7; 4]
  = [9; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0617 :
  constDiagSignInt_fun [-10; -1; 7; -5; -16; 5; 16; 20; -5; 6; 6; -5; -16; 5; 16; 20; -5; 7; 6]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0618 :
  constDiagSignInt_fun [3; -3; 0; -2; -3; 4; -13; 13; 6; -15; -9; -2; -3; 4; -13; 13; 6; -15; -9]
  = [4; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0619 :
  constDiagSignInt_fun [-1; -1; 5; -19; -20; 6; 5; -9; -17; 1; 8; -20; -20; 6; 5; -9; -17; 1; 8]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0620 :
  constDiagSignInt_fun [-9; 2; 3; -7; 19; 16; 5; 12; 9; 7; -12; -7; 19; 16; 5; 12; 9; 7; -12]
  = [-8; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0621 :
  constDiagSignInt_fun [-5; 4; 6; -9; 10; 7; 19; -15; -7; -13; -3; -9; 10; 7; 19; -15; -6; -13; -3]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0622 :
  constDiagSignInt_fun [6; -2; 0; 19; 8; 13; -17; 10; 3; 17; -2; 19; 8; 13; -17; 10; 3; 17; -2]
  = [7; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0623 :
  constDiagSignInt_fun [3; 6; 8; 14; 3; -12; -9; -7; 13; 4; -20; 13; 3; -12; -9; -7; 13; 4; -20]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0624 :
  constDiagSignInt_fun [-5; 3; 2; -17; -12; -10; -19; -16; 2; 19; 7; -17; -12; -10; -19; -16; 2; 19; 7]
  = [-4; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0625 :
  constDiagSignInt_fun [-3; -1; 1; -16; 6; 16; 10; 8; -11; 20; 1; -15; 6; 16; 10; 8; -11; 20; 1]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0626 :
  constDiagSignInt_fun [6; -3; 0; 17; 1; 0; -6; -6; 19; 5; 12; 17; 1; 0; -6; -6; 19; 5; 12]
  = [7; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0627 :
  constDiagSignInt_fun [-2; 0; 7; 15; 13; -14; 13; -10; 6; 6; -8; 14; 13; -14; 13; -10; 6; 6; -8]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0628 :
  constDiagSignInt_fun [-3; 0; 5; 2; 7; 14; 17; 0; 12; 8; 7; 2; 7; 14; 17; 0; 12; 8; 7]
  = [-2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0629 :
  constDiagSignInt_fun [8; 0; 2; 1; -8; -7; 2; -20; -2; 14; 10; 1; -7; -7; 2; -20; -2; 14; 10]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0630 :
  constDiagSignInt_fun [-6; 9; 0; 6; -19; -3; -10; 12; -6; -15; 12; 6; -19; -3; -10; 12; -6; -15; 12]
  = [-5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0631 :
  constDiagSignInt_fun [-1; 4; 5; 13; 9; -13; 15; -9; 4; 4; -3; 12; 9; -13; 15; -9; 4; 4; -3]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0632 :
  constDiagSignInt_fun [1; 5; 6; -16; 13; -13; 1; -13; 14; 4; -9; -16; 13; -13; 1; -13; 14; 4; -9]
  = [2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0633 :
  constDiagSignInt_fun [4; 1; 2; -2; -9; 16; 7; -11; 18; -18; -7; -2; -8; 16; 7; -11; 18; -18; -7]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0634 :
  constDiagSignInt_fun [7; -3; 0; 1; -15; 1; -1; 18; -2; 9; -8; 1; -15; 1; -1; 18; -2; 9; -8]
  = [8; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0635 :
  constDiagSignInt_fun [8; 7; 3; -7; -3; 7; 15; 17; -19; 2; 14; -8; -3; 7; 15; 17; -19; 2; 14]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0636 :
  constDiagSignInt_fun [3; 3; 5; -10; -2; 7; -19; -3; 18; 16; 4; -10; -2; 7; -19; -3; 18; 16; 4]
  = [4; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0637 :
  constDiagSignInt_fun [9; 8; 3; -18; 19; 0; 18; 2; 15; 8; 13; -18; 19; 1; 18; 2; 15; 8; 13]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0638 :
  constDiagSignInt_fun [8; 1; 0; -1; 1; -12; 7; -7; -17; -9; -2; -1; 1; -12; 7; -7; -17; -9; -2]
  = [9; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0639 :
  constDiagSignInt_fun [5; -3; 4; -4; -12; -5; 8; -15; -16; -6; -10; -5; -12; -5; 8; -15; -16; -6; -10]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0640 :
  constDiagSignInt_fun [8; 4; 6; -18; 15; -11; -20; -8; 11; 6; -17; -18; 15; -11; -20; -8; 11; 6; -17]
  = [9; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0641 :
  constDiagSignInt_fun [-3; 7; 7; -11; 11; -15; 13; 6; -3; -16; 4; -11; 11; -15; 13; 6; -3; -15; 4]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0642 :
  constDiagSignInt_fun [8; 7; 0; -13; -16; -11; 13; -5; 16; -18; 12; -13; -16; -11; 13; -5; 16; -18; 12]
  = [9; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0643 :
  constDiagSignInt_fun [4; -3; 3; 16; -17; 3; 4; 12; 8; -2; 10; 15; -17; 3; 4; 12; 8; -2; 10]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0644 :
  constDiagSignInt_fun [-7; -2; 5; 13; -2; 12; 20; 9; -14; 18; 10; 13; -2; 12; 20; 9; -14; 18; 10]
  = [-6; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0645 :
  constDiagSignInt_fun [8; 7; 1; 5; 18; -1; 20; -20; -5; -15; 10; 6; 18; -1; 20; -20; -5; -15; 10]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0646 :
  constDiagSignInt_fun [4; -2; 0; -14; -7; -10; 0; -7; 11; 18; 3; -14; -7; -10; 0; -7; 11; 18; 3]
  = [5; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0647 :
  constDiagSignInt_fun [10; -2; 7; -1; 13; 13; 13; 12; 12; 19; -16; -2; 13; 13; 13; 12; 12; 19; -16]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0648 :
  constDiagSignInt_fun [1; 2; 4; -4; -8; 20; 11; -10; -3; -1; -19; -4; -8; 20; 11; -10; -3; -1; -19]
  = [2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0649 :
  constDiagSignInt_fun [7; 0; 1; -7; -10; -16; 10; -3; -9; -13; 13; -6; -10; -16; 10; -3; -9; -13; 13]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0650 :
  constDiagSignInt_fun [-6; 1; 0; -4; -15; -8; 0; -10; -2; 15; 5; -4; -15; -8; 0; -10; -2; 15; 5]
  = [-5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0651 :
  constDiagSignInt_fun [6; 1; 4; -7; -11; -3; -14; -14; -10; -11; 6; -8; -11; -3; -14; -14; -10; -11; 6]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0652 :
  constDiagSignInt_fun [10; 0; 2; 11; 3; -7; 9; 17; 11; -19; -8; 11; 3; -7; 9; 17; 11; -19; -8]
  = [11; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0653 :
  constDiagSignInt_fun [10; -1; 3; 6; -1; 6; -5; -7; -13; 10; -19; 6; -1; 7; -5; -7; -13; 10; -19]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0654 :
  constDiagSignInt_fun [-5; 9; 0; -8; 19; 5; 18; -5; 17; -1; 6; -8; 19; 5; 18; -5; 17; -1; 6]
  = [-4; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0655 :
  constDiagSignInt_fun [-5; 1; 1; 18; -2; -18; 8; 20; 20; 7; 18; 17; -2; -18; 8; 20; 20; 7; 18]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0656 :
  constDiagSignInt_fun [6; 4; 0; -7; -5; -3; -1; 7; -17; -11; -6; -7; -5; -3; -1; 7; -17; -11; -6]
  = [7; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0657 :
  constDiagSignInt_fun [-8; -3; 5; 3; -2; -12; -2; 10; 12; -15; -2; 3; -2; -12; -2; 11; 12; -15; -2]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0658 :
  constDiagSignInt_fun [3; -1; 0; 18; -3; 19; 10; 1; -6; 20; 7; 18; -3; 19; 10; 1; -6; 20; 7]
  = [4; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0659 :
  constDiagSignInt_fun [5; 3; 0; -2; -11; 12; 6; 14; 14; -14; 1; -2; -11; 12; 6; 14; 14; -14; 1]
  = [6; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0660 :
  constDiagSignInt_fun [-3; 4; 6; 8; -6; 1; -14; -17; 2; 15; -13; 8; -6; 1; -14; -17; 2; 15; -13]
  = [-2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0661 :
  constDiagSignInt_fun [6; -2; 7; 7; 17; -5; 18; -10; 10; 11; -1; 7; 17; -5; 18; -10; 10; 12; -1]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0662 :
  constDiagSignInt_fun [-8; 5; 0; 14; 18; -15; -2; 18; 4; -12; -6; 14; 18; -15; -2; 18; 4; -12; -6]
  = [-7; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0663 :
  constDiagSignInt_fun [-5; -1; 3; 14; 5; -19; -1; 16; 17; 4; 15; 13; 5; -19; -1; 16; 17; 4; 15]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0664 :
  constDiagSignInt_fun [-9; -1; 1; -18; -11; -8; -4; 0; 8; -18; 4; -18; -11; -8; -4; 0; 8; -18; 4]
  = [-8; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0665 :
  constDiagSignInt_fun [-10; 5; 2; 8; -4; -15; 14; 7; -17; -1; 18; 8; -3; -15; 14; 7; -17; -1; 18]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0666 :
  constDiagSignInt_fun [-3; 7; 0; -3; 7; 10; -16; 17; 15; -11; -1; -3; 7; 10; -16; 17; 15; -11; -1]
  = [-2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0667 :
  constDiagSignInt_fun [-5; -1; 3; -4; -10; 3; -10; -11; -9; -7; 0; -5; -10; 3; -10; -11; -9; -7; 0]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0668 :
  constDiagSignInt_fun [4; 4; 7; -4; -20; -8; 15; -16; 16; 7; -11; -4; -20; -8; 15; -16; 16; 7; -11]
  = [5; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0669 :
  constDiagSignInt_fun [-8; -2; 2; -4; 9; 6; 9; 15; 20; 20; -6; -4; 10; 6; 9; 15; 20; 20; -6]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0670 :
  constDiagSignInt_fun [-3; -2; 0; -3; -8; -10; -17; 17; -11; 6; 5; -3; -8; -10; -17; 17; -11; 6; 5]
  = [-2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0671 :
  constDiagSignInt_fun [-4; 5; 0; -16; 0; 4; -12; -20; -1; 10; 5; -16; 0; 4; -12; -20; -1; 10; 5]
  = [-3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0672 :
  constDiagSignInt_fun [6; 0; 5; -3; 10; -8; -19; 20; 8; -10; -2; -3; 10; -8; -19; 20; 8; -10; -2]
  = [7; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0673 :
  constDiagSignInt_fun [-4; 4; 1; 19; 6; 1; -13; 2; 13; -13; 10; 20; 6; 1; -13; 2; 13; -13; 10]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0674 :
  constDiagSignInt_fun [-10; -2; 0; -2; -11; -10; -3; 0; -3; 12; -10; -2; -11; -10; -3; 0; -3; 12; -10]
  = [-9; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0675 :
  constDiagSignInt_fun [-10; 6; 5; 19; -19; -1; -20; 15; 1; 3; 16; 18; -19; -1; -20; 15; 1; 3; 16]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0676 :
  constDiagSignInt_fun [-3; 5; 7; -17; 15; 17; 16; 9; -18; -15; -13; -17; 15; 17; 16; 9; -18; -15; -13]
  = [-2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0677 :
  constDiagSignInt_fun [-9; 9; 2; 10; 9; -17; -2; -7; 9; -17; 13; 10; 10; -17; -2; -7; 9; -17; 13]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0678 :
  constDiagSignInt_fun [-8; 3; 0; 16; 11; -7; -17; -13; 6; -19; -11; 16; 11; -7; -17; -13; 6; -19; -11]
  = [-7; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0679 :
  constDiagSignInt_fun [-5; 3; 4; -3; -6; -10; 1; 20; 2; 13; 16; -4; -6; -10; 1; 20; 2; 13; 16]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0680 :
  constDiagSignInt_fun [5; -2; 8; 3; -11; 16; -6; 18; -15; 11; 10; 3; -11; 16; -6; 18; -15; 11; 10]
  = [6; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0681 :
  constDiagSignInt_fun [-5; -2; 6; 3; -13; 4; 7; 16; 11; 5; -1; 3; -13; 4; 7; 16; 12; 5; -1]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0682 :
  constDiagSignInt_fun [4; 5; 0; -19; 13; -10; 18; 6; -8; 15; -1; -19; 13; -10; 18; 6; -8; 15; -1]
  = [5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0683 :
  constDiagSignInt_fun [-6; 5; 0; 2; 16; -20; -8; 0; 12; -16; 3; 2; 16; -20; -8; 0; 12; -16; 3]
  = [-5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0684 :
  constDiagSignInt_fun [1; 4; 3; 1; 11; 2; -19; -17; 0; -1; 19; 1; 11; 2; -19; -17; 0; -1; 19]
  = [2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0685 :
  constDiagSignInt_fun [7; -1; 3; 14; 10; -3; 18; -12; 5; 15; -10; 14; 10; -2; 18; -12; 5; 15; -10]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0686 :
  constDiagSignInt_fun [-7; -1; 0; 5; 3; -16; -12; 16; -10; 20; 16; 5; 3; -16; -12; 16; -10; 20; 16]
  = [-6; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0687 :
  constDiagSignInt_fun [3; -1; 3; -10; 11; 18; 16; -6; 19; -9; -5; -11; 11; 18; 16; -6; 19; -9; -5]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0688 :
  constDiagSignInt_fun [7; 7; 7; 8; 19; -10; 18; -13; -8; -8; -19; 8; 19; -10; 18; -13; -8; -8; -19]
  = [8; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0689 :
  constDiagSignInt_fun [10; 3; 7; -6; 9; 2; 19; -20; -10; -5; 2; -6; 9; 2; 19; -20; -10; -4; 2]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0690 :
  constDiagSignInt_fun [1; 0; 0; -3; -18; -5; 4; 20; -1; 19; 9; -3; -18; -5; 4; 20; -1; 19; 9]
  = [2; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0691 :
  constDiagSignInt_fun [7; 3; 8; -18; -4; -19; 0; -12; 18; -16; 15; -19; -4; -19; 0; -12; 18; -16; 15]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0692 :
  constDiagSignInt_fun [-8; 4; 1; -15; -5; -12; -2; 6; -16; -19; 8; -15; -5; -12; -2; 6; -16; -19; 8]
  = [-7; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0693 :
  constDiagSignInt_fun [-7; 1; 8; 7; 6; 4; 19; -11; 0; -8; 7; 7; 6; 4; 19; -11; 0; -8; 8]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0694 :
  constDiagSignInt_fun [3; -2; 0; -15; 10; 14; 6; -5; 20; -2; 0; -15; 10; 14; 6; -5; 20; -2; 0]
  = [4; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0695 :
  constDiagSignInt_fun [10; 9; 0; -15; 0; -11; 14; 0; 3; 20; 11; -15; 0; -11; 14; 0; 3; 20; 11]
  = [11; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0696 :
  constDiagSignInt_fun [-1; -2; 8; -5; -1; 0; -3; -9; 13; 11; -15; -5; -1; 0; -3; -9; 13; 11; -15]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0697 :
  constDiagSignInt_fun [-2; 2; 5; 3; 16; 1; -5; -20; -6; -6; 12; 3; 16; 1; -5; -19; -6; -6; 12]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0698 :
  constDiagSignInt_fun [-10; 1; 0; 19; 7; 14; -15; -20; 14; -5; -3; 19; 7; 14; -15; -20; 14; -5; -3]
  = [-9; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0699 :
  constDiagSignInt_fun [-5; 9; 5; -17; 0; 18; 18; 0; 7; 7; -16; -18; 0; 18; 18; 0; 7; 7; -16]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0700 :
  constDiagSignInt_fun [1; 5; 7; -10; 4; 5; -14; -3; 18; 7; 13; -10; 4; 5; -14; -3; 18; 7; 13]
  = [2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0701 :
  constDiagSignInt_fun [1; -1; 6; 5; -11; 19; 5; 1; -14; 1; 9; 5; -11; 19; 5; 1; -13; 1; 9]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0702 :
  constDiagSignInt_fun [-8; 3; 0; 20; -4; -4; -14; 8; 10; 11; 16; 20; -4; -4; -14; 8; 10; 11; 16]
  = [-7; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0703 :
  constDiagSignInt_fun [8; -1; 5; -13; 12; -15; 5; 10; 19; -20; -15; -14; 12; -15; 5; 10; 19; -20; -15]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0704 :
  constDiagSignInt_fun [10; 2; 6; 6; 6; 19; 14; -7; -12; 11; -13; 6; 6; 19; 14; -7; -12; 11; -13]
  = [11; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0705 :
  constDiagSignInt_fun [5; 8; 3; 19; 18; -8; -14; 10; 15; 2; -17; 19; 18; -7; -14; 10; 15; 2; -17]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0706 :
  constDiagSignInt_fun [-6; -3; 0; 20; -16; -11; 20; 4; -12; -4; -13; 20; -16; -11; 20; 4; -12; -4; -13]
  = [-5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0707 :
  constDiagSignInt_fun [-4; 6; 2; -8; 18; 8; -20; -20; 7; -1; -13; -9; 18; 8; -20; -20; 7; -1; -13]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0708 :
  constDiagSignInt_fun [8; 8; 8; 10; -2; -19; -2; 6; -7; -17; -3; 10; -2; -19; -2; 6; -7; -17; -3]
  = [9; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0709 :
  constDiagSignInt_fun [-2; 8; 6; 20; -15; 1; -17; 13; -13; -11; 5; 20; -15; 1; -17; 13; -12; -11; 5]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0710 :
  constDiagSignInt_fun [-6; 4; 0; 5; -4; -18; 14; 12; -10; 16; -15; 5; -4; -18; 14; 12; -10; 16; -15]
  = [-5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0711 :
  constDiagSignInt_fun [2; 4; 0; 0; 10; 20; -15; -11; 8; -5; 13; 0; 10; 20; -15; -11; 8; -5; 13]
  = [3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0712 :
  constDiagSignInt_fun [3; -1; 7; 2; -13; 3; 9; -19; -1; 15; -18; 2; -13; 3; 9; -19; -1; 15; -18]
  = [4; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0713 :
  constDiagSignInt_fun [0; 1; 3; -19; -3; -8; -7; 3; 15; 16; 10; -19; -3; -7; -7; 3; 15; 16; 10]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0714 :
  constDiagSignInt_fun [1; 2; 0; 20; -11; 3; -1; -10; 6; -5; 19; 20; -11; 3; -1; -10; 6; -5; 19]
  = [2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0715 :
  constDiagSignInt_fun [8; 9; 8; -8; -14; 2; 13; 10; 14; 6; -1; -9; -14; 2; 13; 10; 14; 6; -1]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0716 :
  constDiagSignInt_fun [-4; 5; 6; -10; 12; -8; 6; 17; -16; 17; -15; -10; 12; -8; 6; 17; -16; 17; -15]
  = [-3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0717 :
  constDiagSignInt_fun [1; 7; 7; 15; 2; 16; -12; -20; 18; -5; -16; 15; 2; 16; -12; -20; 18; -4; -16]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0718 :
  constDiagSignInt_fun [-4; 9; 0; 5; 13; 6; 20; -8; 0; 10; -12; 5; 13; 6; 20; -8; 0; 10; -12]
  = [-3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0719 :
  constDiagSignInt_fun [-7; -1; 8; 13; 15; -1; -17; 12; -10; 16; 20; 12; 15; -1; -17; 12; -10; 16; 20]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0720 :
  constDiagSignInt_fun [-4; 1; 5; 1; -5; 10; 0; -1; -8; 13; 16; 1; -5; 10; 0; -1; -8; 13; 16]
  = [-3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0721 :
  constDiagSignInt_fun [9; 9; 8; -12; 3; 16; -19; 6; -20; -16; -7; -12; 3; 16; -19; 6; -20; -16; -6]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0722 :
  constDiagSignInt_fun [2; 6; 0; -7; -5; -5; -13; 16; -4; 13; 14; -7; -5; -5; -13; 16; -4; 13; 14]
  = [3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0723 :
  constDiagSignInt_fun [0; 0; 5; 17; -17; 3; 16; 10; -2; -16; 9; 16; -17; 3; 16; 10; -2; -16; 9]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0724 :
  constDiagSignInt_fun [5; 7; 0; -2; -15; -10; 20; -9; -7; -15; -19; -2; -15; -10; 20; -9; -7; -15; -19]
  = [6; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0725 :
  constDiagSignInt_fun [1; 9; 3; 16; 15; 10; -15; -20; 1; 17; 9; 16; 15; 11; -15; -20; 1; 17; 9]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0726 :
  constDiagSignInt_fun [-7; -1; 0; 7; 18; -6; -7; -12; 4; -1; -2; 7; 18; -6; -7; -12; 4; -1; -2]
  = [-6; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0727 :
  constDiagSignInt_fun [9; 3; 7; 2; 12; 13; 7; 0; 5; 1; -15; 1; 12; 13; 7; 0; 5; 1; -15]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0728 :
  constDiagSignInt_fun [6; 7; 4; -20; -11; -2; 7; -16; 8; 16; 18; -20; -11; -2; 7; -16; 8; 16; 18]
  = [7; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0729 :
  constDiagSignInt_fun [8; 6; 8; 13; -9; 9; 12; -5; 1; 20; -13; 13; -9; 9; 12; -5; 1; 20; -12]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0730 :
  constDiagSignInt_fun [6; 7; 0; -2; -2; 20; -13; -4; 10; 10; -1; -2; -2; 20; -13; -4; 10; 10; -1]
  = [7; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0731 :
  constDiagSignInt_fun [-1; 9; 8; -13; 17; 7; -11; -16; 10; 8; -15; -14; 17; 7; -11; -16; 10; 8; -15]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0732 :
  constDiagSignInt_fun [-10; 2; 4; -9; 13; 15; 18; 9; 13; -8; 9; -9; 13; 15; 18; 9; 13; -8; 9]
  = [-9; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0733 :
  constDiagSignInt_fun [3; -1; 2; -1; -11; 4; -11; 12; -15; -2; -17; -1; -10; 4; -11; 12; -15; -2; -17]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0734 :
  constDiagSignInt_fun [10; 6; 0; 2; 13; -6; -11; 2; 13; 2; -5; 2; 13; -6; -11; 2; 13; 2; -5]
  = [11; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0735 :
  constDiagSignInt_fun [7; 0; 1; -6; -9; 11; -9; -8; 4; 18; -20; -7; -9; 11; -9; -8; 4; 18; -20]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0736 :
  constDiagSignInt_fun [3; -3; 6; 12; 6; 13; -10; 9; 0; -14; 14; 12; 6; 13; -10; 9; 0; -14; 14]
  = [4; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0737 :
  constDiagSignInt_fun [-7; 4; 5; 0; 11; 20; 15; 16; 5; -20; 12; 0; 11; 20; 15; 17; 5; -20; 12]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0738 :
  constDiagSignInt_fun [7; 8; 0; -6; 17; 10; -13; -8; -18; 6; -8; -6; 17; 10; -13; -8; -18; 6; -8]
  = [8; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0739 :
  constDiagSignInt_fun [1; 2; 8; 19; -1; 14; 8; -10; 1; 10; 19; 18; -1; 14; 8; -10; 1; 10; 19]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0740 :
  constDiagSignInt_fun [-2; 4; 3; 15; -9; -5; -2; 19; -10; -9; 19; 15; -9; -5; -2; 19; -10; -9; 19]
  = [-1; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0741 :
  constDiagSignInt_fun [-5; 9; 0; 19; -13; 20; -10; 13; -12; -5; 13; 19; -13; 20; -10; 13; -12; -5; 13]
  = [-4; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0742 :
  constDiagSignInt_fun [3; 1; 0; -16; -11; 18; 17; 14; 9; 2; 0; -16; -11; 18; 17; 14; 9; 2; 0]
  = [4; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0743 :
  constDiagSignInt_fun [-10; 7; 4; 18; -12; -16; -13; -10; 0; -19; 11; 17; -12; -16; -13; -10; 0; -19; 11]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0744 :
  constDiagSignInt_fun [-9; 9; 0; -15; -1; -10; 0; 17; 20; -5; -20; -15; -1; -10; 0; 17; 20; -5; -20]
  = [-8; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0745 :
  constDiagSignInt_fun [7; 3; 6; -17; -12; 8; -13; 4; -2; 7; -13; -17; -12; 8; -13; 4; -1; 7; -13]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0746 :
  constDiagSignInt_fun [6; -2; 0; 20; 17; -17; -10; 15; -7; -17; -9; 20; 17; -17; -10; 15; -7; -17; -9]
  = [7; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0747 :
  constDiagSignInt_fun [-1; 3; 0; -2; 20; 17; -10; -19; 9; 17; -16; -2; 20; 17; -10; -19; 9; 17; -16]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0748 :
  constDiagSignInt_fun [7; -1; 7; -9; -4; -20; 8; 20; 20; -4; 9; -9; -4; -20; 8; 20; 20; -4; 9]
  = [8; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0749 :
  constDiagSignInt_fun [-4; 4; 5; -2; 17; 5; -5; -10; -9; 11; -13; -2; 17; 5; -5; -9; -9; 11; -13]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0750 :
  constDiagSignInt_fun [7; 7; 0; 16; -16; -18; -17; 9; 17; 5; -17; 16; -16; -18; -17; 9; 17; 5; -17]
  = [8; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0751 :
  constDiagSignInt_fun [9; 7; 2; -3; -12; 12; -14; -15; -2; 12; -2; -4; -12; 12; -14; -15; -2; 12; -2]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0752 :
  constDiagSignInt_fun [-2; -1; 0; -5; -12; -6; 6; -3; -2; 14; 0; -5; -12; -6; 6; -3; -2; 14; 0]
  = [-1; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0753 :
  constDiagSignInt_fun [1; 7; 4; 0; 14; 1; 9; -3; -5; -2; -12; 0; 14; 1; 10; -3; -5; -2; -12]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0754 :
  constDiagSignInt_fun [-6; -2; 0; 13; -11; 1; -4; 0; 4; 14; -2; 13; -11; 1; -4; 0; 4; 14; -2]
  = [-5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0755 :
  constDiagSignInt_fun [-2; 0; 3; -20; -5; 10; -11; 17; -14; 20; -19; -21; -5; 10; -11; 17; -14; 20; -19]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0756 :
  constDiagSignInt_fun [0; 0; 3; 17; -19; -10; 9; 4; -5; -14; -11; 17; -19; -10; 9; 4; -5; -14; -11]
  = [1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0757 :
  constDiagSignInt_fun [-2; 8; 7; -6; -17; -20; 11; 13; 19; 2; -7; -6; -17; -20; 11; 13; 19; 3; -7]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0758 :
  constDiagSignInt_fun [1; 6; 0; -3; -19; 0; 4; -3; 18; 11; 2; -3; -19; 0; 4; -3; 18; 11; 2]
  = [2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0759 :
  constDiagSignInt_fun [-9; 3; 3; 8; -5; -6; -4; 8; -10; -15; 5; 7; -5; -6; -4; 8; -10; -15; 5]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0760 :
  constDiagSignInt_fun [6; 0; 4; 20; 10; -13; 19; 19; 9; -14; 0; 20; 10; -13; 19; 19; 9; -14; 0]
  = [7; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0761 :
  constDiagSignInt_fun [-6; -1; 1; -13; 0; -14; -13; 2; -15; 5; -11; -12; 0; -14; -13; 2; -15; 5; -11]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0762 :
  constDiagSignInt_fun [1; -3; 0; 3; 10; -12; -13; -20; -7; 17; -20; 3; 10; -12; -13; -20; -7; 17; -20]
  = [2; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0763 :
  constDiagSignInt_fun [-3; 8; 1; -1; 8; -3; 14; 3; 18; 13; -13; -2; 8; -3; 14; 3; 18; 13; -13]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0764 :
  constDiagSignInt_fun [3; 4; 3; 17; 14; 1; 18; 14; -10; -9; 4; 17; 14; 1; 18; 14; -10; -9; 4]
  = [4; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0765 :
  constDiagSignInt_fun [3; 4; 7; 9; -16; 0; 17; -20; 6; 9; -9; 9; -16; 0; 17; -20; 6; 10; -9]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0766 :
  constDiagSignInt_fun [10; 7; 0; -9; -16; 7; 4; 4; -8; -16; -5; -9; -16; 7; 4; 4; -8; -16; -5]
  = [11; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0767 :
  constDiagSignInt_fun [6; 3; 7; -14; -4; 4; -14; -9; -5; -18; 13; -15; -4; 4; -14; -9; -5; -18; 13]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0768 :
  constDiagSignInt_fun [10; 6; 3; 15; -19; 8; 10; 4; 19; -4; 5; 15; -19; 8; 10; 4; 19; -4; 5]
  = [11; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0769 :
  constDiagSignInt_fun [-10; 8; 0; -13; -18; -16; -15; -10; -15; 13; -6; -13; -18; -16; -15; -10; -15; 13; -6]
  = [-9; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0770 :
  constDiagSignInt_fun [8; 7; 0; 11; 15; -15; 20; 12; 20; 8; -2; 11; 15; -15; 20; 12; 20; 8; -2]
  = [9; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0771 :
  constDiagSignInt_fun [9; 3; 4; 0; 19; 17; -13; -18; -13; 20; 0; -1; 19; 17; -13; -18; -13; 20; 0]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0772 :
  constDiagSignInt_fun [10; -3; 2; -14; 16; -13; -7; 8; 2; 2; -3; -14; 16; -13; -7; 8; 2; 2; -3]
  = [11; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0773 :
  constDiagSignInt_fun [2; 1; 5; -18; 1; -5; -17; 7; -15; -8; 15; -18; 1; -5; -17; 8; -15; -8; 15]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0774 :
  constDiagSignInt_fun [9; 4; 0; -10; -2; 10; 5; 3; -17; -15; 10; -10; -2; 10; 5; 3; -17; -15; 10]
  = [10; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0775 :
  constDiagSignInt_fun [-4; 2; 4; -1; -10; -5; 14; 8; 12; -13; -12; -2; -10; -5; 14; 8; 12; -13; -12]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0776 :
  constDiagSignInt_fun [3; 5; 1; 10; 20; 11; -7; 3; -2; 10; -13; 10; 20; 11; -7; 3; -2; 10; -13]
  = [4; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0777 :
  constDiagSignInt_fun [2; 8; 0; 10; 2; 4; -19; -13; -17; 0; -5; 10; 2; 4; -19; -13; -17; 0; -5]
  = [3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0778 :
  constDiagSignInt_fun [-7; 4; 0; -9; -3; 0; 9; 16; 20; 17; 11; -9; -3; 0; 9; 16; 20; 17; 11]
  = [-6; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0779 :
  constDiagSignInt_fun [6; -1; 1; 16; -6; 10; -6; 16; -8; 16; -18; 15; -6; 10; -6; 16; -8; 16; -18]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0780 :
  constDiagSignInt_fun [9; 5; 6; 5; 1; -1; -1; 12; 8; -15; -11; 5; 1; -1; -1; 12; 8; -15; -11]
  = [10; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0781 :
  constDiagSignInt_fun [7; -2; 6; 2; 4; 2; 11; 20; 17; 5; -12; 2; 4; 2; 11; 20; 18; 5; -12]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0782 :
  constDiagSignInt_fun [-9; 2; 0; 5; -10; 3; 1; 11; -2; 8; -12; 5; -10; 3; 1; 11; -2; 8; -12]
  = [-8; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0783 :
  constDiagSignInt_fun [1; 2; 6; -18; -16; -18; 8; -20; -16; 18; -4; -19; -16; -18; 8; -20; -16; 18; -4]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0784 :
  constDiagSignInt_fun [2; -2; 8; -7; -5; -3; -18; -7; -2; 8; 16; -7; -5; -3; -18; -7; -2; 8; 16]
  = [3; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0785 :
  constDiagSignInt_fun [-10; -3; 1; 17; -5; -2; 6; -3; -2; 1; -18; 18; -5; -2; 6; -3; -2; 1; -18]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0786 :
  constDiagSignInt_fun [-10; -1; 0; 15; -9; 0; 19; -12; -10; -2; -12; 15; -9; 0; 19; -12; -10; -2; -12]
  = [-9; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0787 :
  constDiagSignInt_fun [7; 0; 4; -20; 10; 3; -6; 0; 18; -9; -19; -21; 10; 3; -6; 0; 18; -9; -19]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0788 :
  constDiagSignInt_fun [-1; 3; 8; -10; 11; -20; -8; 1; 9; -16; -4; -10; 11; -20; -8; 1; 9; -16; -4]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0789 :
  constDiagSignInt_fun [-7; 0; 1; 19; 18; -11; 10; 19; 19; -12; 1; 20; 18; -11; 10; 19; 19; -12; 1]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0790 :
  constDiagSignInt_fun [-1; 5; 0; -11; 18; 18; 11; 9; -1; 10; -9; -11; 18; 18; 11; 9; -1; 10; -9]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0791 :
  constDiagSignInt_fun [-10; 9; 1; -8; -9; 5; -20; 9; -7; -13; 15; -9; -9; 5; -20; 9; -7; -13; 15]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0792 :
  constDiagSignInt_fun [4; 4; 7; 15; -16; 2; -13; 4; 0; 17; 17; 15; -16; 2; -13; 4; 0; 17; 17]
  = [5; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0793 :
  constDiagSignInt_fun [-5; 9; 2; -19; 17; 12; 13; -2; 8; 19; 19; -19; 18; 12; 13; -2; 8; 19; 19]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0794 :
  constDiagSignInt_fun [-1; 2; 0; -4; -1; -14; -2; 13; 5; -20; -11; -4; -1; -14; -2; 13; 5; -20; -11]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0795 :
  constDiagSignInt_fun [-7; 6; 6; -11; -13; -1; -6; 4; -10; 9; 20; -12; -13; -1; -6; 4; -10; 9; 20]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0796 :
  constDiagSignInt_fun [6; 3; 5; -7; 1; -3; 5; 4; 1; -6; -14; -7; 1; -3; 5; 4; 1; -6; -14]
  = [7; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0797 :
  constDiagSignInt_fun [8; -3; 1; 13; 0; -18; -5; 8; -2; -1; 4; 14; 0; -18; -5; 8; -2; -1; 4]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0798 :
  constDiagSignInt_fun [-6; 7; 0; 8; -3; 1; -15; 4; 9; 20; 19; 8; -3; 1; -15; 4; 9; 20; 19]
  = [-5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0799 :
  constDiagSignInt_fun [-5; -2; 1; -14; -15; -19; 1; -20; -15; -10; -9; -15; -15; -19; 1; -20; -15; -10; -9]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0800 :
  constDiagSignInt_fun [-4; 7; 3; -12; -13; -16; 18; -1; -3; -12; 13; -12; -13; -16; 18; -1; -3; -12; 13]
  = [-3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0801 :
  constDiagSignInt_fun [7; 9; 6; 16; -19; 2; -14; 3; -6; -16; 19; 16; -19; 2; -14; 3; -5; -16; 19]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0802 :
  constDiagSignInt_fun [9; 7; 0; 1; 12; 16; -10; -7; 20; 19; -2; 1; 12; 16; -10; -7; 20; 19; -2]
  = [10; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0803 :
  constDiagSignInt_fun [-2; 1; 8; 0; 4; -7; -14; -6; -1; -13; -10; -1; 4; -7; -14; -6; -1; -13; -10]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0804 :
  constDiagSignInt_fun [-8; -1; 2; -8; 14; 14; -20; -17; -2; -18; -6; -8; 14; 14; -20; -17; -2; -18; -6]
  = [-7; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0805 :
  constDiagSignInt_fun [-1; 5; 8; 0; -9; 4; -15; 6; -20; -7; -5; 0; -9; 4; -15; 6; -20; -7; -4]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0806 :
  constDiagSignInt_fun [1; -1; 0; -20; 3; -14; 4; -3; 9; -6; -14; -20; 3; -14; 4; -3; 9; -6; -14]
  = [2; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0807 :
  constDiagSignInt_fun [5; 9; 8; 12; -14; 15; 20; -16; 20; -13; -15; 11; -14; 15; 20; -16; 20; -13; -15]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0808 :
  constDiagSignInt_fun [9; 1; 6; 3; -4; -12; -6; -14; 7; -1; 18; 3; -4; -12; -6; -14; 7; -1; 18]
  = [10; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0809 :
  constDiagSignInt_fun [9; 2; 0; 14; -9; -20; 11; -4; 11; 16; -12; 14; -9; -20; 11; -4; 11; 16; -12]
  = [10; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0810 :
  constDiagSignInt_fun [2; -3; 0; 6; 6; -5; -2; 6; 8; 2; -4; 6; 6; -5; -2; 6; 8; 2; -4]
  = [3; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0811 :
  constDiagSignInt_fun [-9; 8; 0; -19; -1; 0; -15; -19; 11; 3; -4; -19; -1; 0; -15; -19; 11; 3; -4]
  = [-8; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0812 :
  constDiagSignInt_fun [-1; 5; 2; 12; -9; -12; 10; -10; -8; -2; 4; 12; -9; -12; 10; -10; -8; -2; 4]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0813 :
  constDiagSignInt_fun [-5; 6; 6; 12; 2; 2; -14; -2; 3; 1; 0; 12; 2; 2; -14; -2; 4; 1; 0]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0814 :
  constDiagSignInt_fun [4; 6; 0; 19; -6; 2; 11; 14; -17; -15; 14; 19; -6; 2; 11; 14; -17; -15; 14]
  = [5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0815 :
  constDiagSignInt_fun [-10; 9; 8; 8; 13; 3; -11; 7; -7; -3; -6; 7; 13; 3; -11; 7; -7; -3; -6]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0816 :
  constDiagSignInt_fun [2; 5; 6; 19; 15; 0; 7; -11; 9; 8; 20; 19; 15; 0; 7; -11; 9; 8; 20]
  = [3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0817 :
  constDiagSignInt_fun [-7; 1; 0; 9; -15; 0; -12; 2; -16; 13; 18; 9; -15; 0; -12; 2; -16; 13; 18]
  = [-6; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0818 :
  constDiagSignInt_fun [4; 0; 0; 2; 11; -4; 15; -6; 0; -20; 13; 2; 11; -4; 15; -6; 0; -20; 13]
  = [5; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0819 :
  constDiagSignInt_fun [2; 6; 3; 17; 10; 0; 17; -18; -18; 10; 3; 16; 10; 0; 17; -18; -18; 10; 3]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0820 :
  constDiagSignInt_fun [5; 5; 2; 12; -20; -3; 16; 5; 14; -19; -11; 12; -20; -3; 16; 5; 14; -19; -11]
  = [6; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0821 :
  constDiagSignInt_fun [4; 0; 3; 10; 14; 7; -5; 8; 13; 0; -10; 10; 14; 8; -5; 8; 13; 0; -10]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0822 :
  constDiagSignInt_fun [-10; 1; 0; 4; -7; -1; -4; 0; 0; 2; 11; 4; -7; -1; -4; 0; 0; 2; 11]
  = [-9; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0823 :
  constDiagSignInt_fun [-3; 3; 0; -6; -16; -15; 13; -2; -10; 1; 7; -6; -16; -15; 13; -2; -10; 1; 7]
  = [-2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0824 :
  constDiagSignInt_fun [-7; 5; 2; -18; 9; 7; 8; 13; 11; 20; -19; -18; 9; 7; 8; 13; 11; 20; -19]
  = [-6; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0825 :
  constDiagSignInt_fun [3; -1; 5; 8; -1; 20; 7; -14; 2; 16; 5; 8; -1; 20; 7; -13; 2; 16; 5]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0826 :
  constDiagSignInt_fun [-6; -2; 0; 5; 5; -15; 8; -7; 9; -18; -2; 5; 5; -15; 8; -7; 9; -18; -2]
  = [-5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0827 :
  constDiagSignInt_fun [2; 7; 8; -2; -2; 7; -13; -7; 6; 20; -17; -3; -2; 7; -13; -7; 6; 20; -17]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0828 :
  constDiagSignInt_fun [0; 2; 2; -1; 11; 9; 7; 7; -15; 7; -9; -1; 11; 9; 7; 7; -15; 7; -9]
  = [1; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0829 :
  constDiagSignInt_fun [1; 4; 3; 9; -3; -13; -3; -14; 13; -8; -11; 9; -3; -12; -3; -14; 13; -8; -11]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0830 :
  constDiagSignInt_fun [10; 4; 0; -18; 12; -18; 0; 18; 3; 16; 9; -18; 12; -18; 0; 18; 3; 16; 9]
  = [11; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0831 :
  constDiagSignInt_fun [4; 7; 5; -1; -8; 3; 2; -8; 10; -12; 13; -2; -8; 3; 2; -8; 10; -12; 13]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0832 :
  constDiagSignInt_fun [-4; 7; 8; 13; 13; -10; -14; -13; 6; -20; -18; 13; 13; -10; -14; -13; 6; -20; -18]
  = [-3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0833 :
  constDiagSignInt_fun [-1; 4; 5; 19; -6; 14; 20; 9; 20; -14; 3; 19; -6; 14; 20; 10; 20; -14; 3]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0834 :
  constDiagSignInt_fun [-9; 0; 0; 2; -18; -10; -18; -13; -4; -19; 19; 2; -18; -10; -18; -13; -4; -19; 19]
  = [-8; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0835 :
  constDiagSignInt_fun [-10; 3; 5; 19; 13; -19; 0; -15; -2; -4; 5; 18; 13; -19; 0; -15; -2; -4; 5]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0836 :
  constDiagSignInt_fun [10; 8; 5; -8; -5; -19; -7; 19; -18; 7; -14; -8; -5; -19; -7; 19; -18; 7; -14]
  = [11; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0837 :
  constDiagSignInt_fun [1; -2; 0; 10; 6; 12; 14; -15; 8; -19; 5; 10; 6; 12; 14; -15; 8; -19; 5]
  = [2; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0838 :
  constDiagSignInt_fun [1; 2; 0; 12; 19; -4; -5; -15; 9; 16; 5; 12; 19; -4; -5; -15; 9; 16; 5]
  = [2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0839 :
  constDiagSignInt_fun [5; 5; 1; 11; 15; 7; 1; -14; -4; -15; -16; 10; 15; 7; 1; -14; -4; -15; -16]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0840 :
  constDiagSignInt_fun [-4; 7; 7; -12; 7; -8; 19; 17; -11; 0; 19; -12; 7; -8; 19; 17; -11; 0; 19]
  = [-3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0841 :
  constDiagSignInt_fun [4; 9; 6; 1; -9; -15; 13; 18; 10; 15; 11; 1; -9; -15; 13; 18; 11; 15; 11]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0842 :
  constDiagSignInt_fun [9; 5; 0; 9; 17; 16; 9; 20; 2; -14; 13; 9; 17; 16; 9; 20; 2; -14; 13]
  = [10; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0843 :
  constDiagSignInt_fun [7; -3; 1; 6; -4; 4; -8; 20; -7; -16; 9; 5; -4; 4; -8; 20; -7; -16; 9]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0844 :
  constDiagSignInt_fun [0; 6; 3; 13; 2; -14; -3; -8; 10; -16; 10; 13; 2; -14; -3; -8; 10; -16; 10]
  = [1; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0845 :
  constDiagSignInt_fun [9; -2; 7; -6; -9; -15; -6; -14; -10; 7; 20; -6; -9; -15; -6; -14; -10; 8; 20]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0846 :
  constDiagSignInt_fun [8; -3; 0; -1; 0; 0; -17; -8; -14; -11; 6; -1; 0; 0; -17; -8; -14; -11; 6]
  = [9; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0847 :
  constDiagSignInt_fun [4; 2; 2; -2; -8; 5; 11; -7; 7; -6; 19; -3; -8; 5; 11; -7; 7; -6; 19]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0848 :
  constDiagSignInt_fun [-4; 2; 8; -17; 10; -4; -12; -20; -9; -17; -8; -17; 10; -4; -12; -20; -9; -17; -8]
  = [-3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0849 :
  constDiagSignInt_fun [-8; 8; 3; 10; 10; -16; 0; -9; -2; -3; 12; 10; 10; -15; 0; -9; -2; -3; 12]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0850 :
  constDiagSignInt_fun [-8; 2; 0; -13; -17; -12; 11; 13; -18; 18; 13; -13; -17; -12; 11; 13; -18; 18; 13]
  = [-7; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0851 :
  constDiagSignInt_fun [4; 0; 2; 8; -11; 2; 17; -19; -11; -2; 8; 7; -11; 2; 17; -19; -11; -2; 8]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0852 :
  constDiagSignInt_fun [5; 7; 2; 5; 13; 3; 7; 7; -20; 16; -16; 5; 13; 3; 7; 7; -20; 16; -16]
  = [6; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0853 :
  constDiagSignInt_fun [-2; 4; 1; -14; 12; 10; 8; -6; -8; 19; 12; -13; 12; 10; 8; -6; -8; 19; 12]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0854 :
  constDiagSignInt_fun [-4; 1; 0; -8; 3; 12; 2; 5; 2; -13; -5; -8; 3; 12; 2; 5; 2; -13; -5]
  = [-3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0855 :
  constDiagSignInt_fun [10; 5; 0; 8; 14; -15; -18; -17; 8; -18; -4; 8; 14; -15; -18; -17; 8; -18; -4]
  = [11; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0856 :
  constDiagSignInt_fun [-3; 4; 0; -16; -4; 10; -13; 20; 6; -18; 7; -16; -4; 10; -13; 20; 6; -18; 7]
  = [-2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0857 :
  constDiagSignInt_fun [-5; 5; 2; -8; 8; -13; -7; 8; 20; 9; 8; -8; 9; -13; -7; 8; 20; 9; 8]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0858 :
  constDiagSignInt_fun [10; 5; 0; 18; 13; 17; 5; 5; -6; 18; 17; 18; 13; 17; 5; 5; -6; 18; 17]
  = [11; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0859 :
  constDiagSignInt_fun [10; 8; 0; 15; -6; 12; -14; 12; 13; 10; -16; 15; -6; 12; -14; 12; 13; 10; -16]
  = [11; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0860 :
  constDiagSignInt_fun [4; 8; 7; 6; 4; 13; -10; 19; -1; -8; -20; 6; 4; 13; -10; 19; -1; -8; -20]
  = [5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0861 :
  constDiagSignInt_fun [7; 3; 0; -4; -2; 20; -3; -6; 3; 19; 20; -4; -2; 20; -3; -6; 3; 19; 20]
  = [8; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0862 :
  constDiagSignInt_fun [5; 5; 0; 18; -14; -20; 18; 19; 15; -15; -3; 18; -14; -20; 18; 19; 15; -15; -3]
  = [6; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0863 :
  constDiagSignInt_fun [8; 1; 1; 16; 2; 7; -8; -13; 4; -11; 9; 15; 2; 7; -8; -13; 4; -11; 9]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0864 :
  constDiagSignInt_fun [-7; -3; 4; -10; 17; -15; 6; -12; -7; 8; 20; -10; 17; -15; 6; -12; -7; 8; 20]
  = [-6; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0865 :
  constDiagSignInt_fun [9; 1; 8; 17; 19; -6; -18; -2; -11; -16; -3; 17; 19; -6; -18; -2; -11; -16; -2]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0866 :
  constDiagSignInt_fun [1; -1; 0; -8; 12; -2; -12; 7; -12; -2; 4; -8; 12; -2; -12; 7; -12; -2; 4]
  = [2; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0867 :
  constDiagSignInt_fun [-1; 3; 2; 17; -20; -17; -16; -18; -14; 6; -14; 16; -20; -17; -16; -18; -14; 6; -14]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0868 :
  constDiagSignInt_fun [-7; 4; 5; 7; 4; 10; -5; -4; -8; -1; -11; 7; 4; 10; -5; -4; -8; -1; -11]
  = [-6; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0869 :
  constDiagSignInt_fun [-7; 6; 3; 6; -12; -8; 17; -6; 6; 13; 15; 6; -12; -7; 17; -6; 6; 13; 15]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0870 :
  constDiagSignInt_fun [6; 0; 0; -14; 13; 6; 3; -10; 20; -19; 4; -14; 13; 6; 3; -10; 20; -19; 4]
  = [7; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0871 :
  constDiagSignInt_fun [-10; 5; 3; 1; -6; -5; 16; 7; -4; -14; 15; 0; -6; -5; 16; 7; -4; -14; 15]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0872 :
  constDiagSignInt_fun [5; -1; 4; 5; 18; 16; 6; -5; 6; 3; -4; 5; 18; 16; 6; -5; 6; 3; -4]
  = [6; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0873 :
  constDiagSignInt_fun [-10; 6; 2; -7; 0; 20; -11; -15; -18; -11; -2; -7; 1; 20; -11; -15; -18; -11; -2]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0874 :
  constDiagSignInt_fun [4; 6; 0; 20; 15; -20; -10; -18; -5; 13; 17; 20; 15; -20; -10; -18; -5; 13; 17]
  = [5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0875 :
  constDiagSignInt_fun [-5; 7; 2; -20; 4; -20; -6; 16; 2; 18; 11; -21; 4; -20; -6; 16; 2; 18; 11]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0876 :
  constDiagSignInt_fun [-6; -2; 0; -16; -15; 1; 0; -11; -14; -10; -17; -16; -15; 1; 0; -11; -14; -10; -17]
  = [-5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0877 :
  constDiagSignInt_fun [9; 1; 0; -13; -19; 2; 6; -16; 16; 10; 5; -13; -19; 2; 6; -16; 16; 10; 5]
  = [10; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0878 :
  constDiagSignInt_fun [9; 4; 0; -9; -4; 7; -7; -3; 12; -20; 12; -9; -4; 7; -7; -3; 12; -20; 12]
  = [10; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0879 :
  constDiagSignInt_fun [1; -2; 6; 14; 13; 1; -20; -5; 0; -1; 5; 13; 13; 1; -20; -5; 0; -1; 5]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0880 :
  constDiagSignInt_fun [-5; -2; 0; 13; 13; 4; 16; 18; -12; -10; 9; 13; 13; 4; 16; 18; -12; -10; 9]
  = [-4; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0881 :
  constDiagSignInt_fun [-4; 7; 6; -7; -14; -4; -13; 9; -12; 5; -8; -7; -14; -4; -13; 9; -11; 5; -8]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0882 :
  constDiagSignInt_fun [1; 9; 0; 5; 10; 6; -16; 20; -10; -11; -5; 5; 10; 6; -16; 20; -10; -11; -5]
  = [2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0883 :
  constDiagSignInt_fun [-5; 4; 4; -1; -8; -15; 11; -20; 6; 14; 11; -2; -8; -15; 11; -20; 6; 14; 11]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0884 :
  constDiagSignInt_fun [-6; 1; 2; -14; 11; 2; 8; 10; 3; 1; 3; -14; 11; 2; 8; 10; 3; 1; 3]
  = [-5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0885 :
  constDiagSignInt_fun [1; 4; 5; 19; 13; -11; -19; -13; -11; -17; 9; 19; 13; -11; -19; -12; -11; -17; 9]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0886 :
  constDiagSignInt_fun [9; 4; 0; 10; -10; -4; 17; -9; 8; 14; -12; 10; -10; -4; 17; -9; 8; 14; -12]
  = [10; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0887 :
  constDiagSignInt_fun [10; 0; 7; 6; -1; -6; -20; -4; 2; -7; -7; 5; -1; -6; -20; -4; 2; -7; -7]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0888 :
  constDiagSignInt_fun [10; -2; 1; 2; -2; -7; -7; -17; -15; 20; 6; 2; -2; -7; -7; -17; -15; 20; 6]
  = [11; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0889 :
  constDiagSignInt_fun [7; 5; 0; -10; 18; 11; 6; 0; -17; 18; -5; -10; 18; 11; 6; 0; -17; 18; -5]
  = [8; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0890 :
  constDiagSignInt_fun [1; 6; 0; 8; -11; -4; -6; -15; -16; 8; -18; 8; -11; -4; -6; -15; -16; 8; -18]
  = [2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0891 :
  constDiagSignInt_fun [-1; 4; 3; 1; 20; -15; -19; -4; -8; -15; 2; 0; 20; -15; -19; -4; -8; -15; 2]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0892 :
  constDiagSignInt_fun [-1; -2; 6; 13; 3; -5; -17; -6; 12; 15; -9; 13; 3; -5; -17; -6; 12; 15; -9]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0893 :
  constDiagSignInt_fun [2; 4; 0; -8; -17; 0; -20; -11; -10; 3; 16; -8; -17; 0; -20; -11; -10; 3; 16]
  = [3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0894 :
  constDiagSignInt_fun [1; 9; 0; 3; -8; 3; -9; 5; 7; 7; -19; 3; -8; 3; -9; 5; 7; 7; -19]
  = [2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0895 :
  constDiagSignInt_fun [2; 1; 6; 8; 17; -12; -3; 12; -17; 3; 7; 7; 17; -12; -3; 12; -17; 3; 7]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0896 :
  constDiagSignInt_fun [-4; 0; 5; -19; 20; -14; 18; -18; -7; 1; 8; -19; 20; -14; 18; -18; -7; 1; 8]
  = [-3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0897 :
  constDiagSignInt_fun [-9; 3; 6; 13; -16; -6; -10; -12; -12; 20; -12; 13; -16; -6; -10; -12; -11; 20; -12]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0898 :
  constDiagSignInt_fun [0; 9; 0; 4; 5; -13; 7; 0; -9; -13; -4; 4; 5; -13; 7; 0; -9; -13; -4]
  = [1; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0899 :
  constDiagSignInt_fun [3; 3; 2; 17; -18; 2; 4; 13; -5; 10; 18; 16; -18; 2; 4; 13; -5; 10; 18]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0900 :
  constDiagSignInt_fun [10; 4; 5; 0; -6; 19; 18; 16; 13; 1; 18; 0; -6; 19; 18; 16; 13; 1; 18]
  = [11; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0901 :
  constDiagSignInt_fun [4; -3; 5; -19; -2; -10; -18; 7; -10; 10; 20; -19; -2; -10; -18; 8; -10; 10; 20]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0902 :
  constDiagSignInt_fun [-5; -3; 0; -15; -4; -13; -5; -8; 20; -1; -8; -15; -4; -13; -5; -8; 20; -1; -8]
  = [-4; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0903 :
  constDiagSignInt_fun [3; 8; 7; 10; 15; 3; 16; 11; -1; 11; -7; 9; 15; 3; 16; 11; -1; 11; -7]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0904 :
  constDiagSignInt_fun [3; 3; 4; 4; 17; -13; 20; 13; -5; -2; 8; 4; 17; -13; 20; 13; -5; -2; 8]
  = [4; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0905 :
  constDiagSignInt_fun [-6; 9; 6; 16; 11; 18; 11; 4; 16; 3; -19; 16; 11; 18; 11; 4; 17; 3; -19]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0906 :
  constDiagSignInt_fun [1; 3; 0; 8; -17; 15; -17; -13; 18; 17; 8; 8; -17; 15; -17; -13; 18; 17; 8]
  = [2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0907 :
  constDiagSignInt_fun [8; 9; 4; 19; 20; 20; 3; -18; 6; 12; -10; 18; 20; 20; 3; -18; 6; 12; -10]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0908 :
  constDiagSignInt_fun [-5; -2; 4; 7; -20; 10; 14; -4; 13; -4; -3; 7; -20; 10; 14; -4; 13; -4; -3]
  = [-4; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0909 :
  constDiagSignInt_fun [8; 2; 0; 2; -3; -18; 5; 9; -16; 17; 14; 2; -3; -18; 5; 9; -16; 17; 14]
  = [9; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0910 :
  constDiagSignInt_fun [-4; 2; 0; -10; 12; 8; -4; -3; 18; -13; 17; -10; 12; 8; -4; -3; 18; -13; 17]
  = [-3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0911 :
  constDiagSignInt_fun [-10; 4; 3; -3; -17; 13; 3; 3; -8; 7; -5; -4; -17; 13; 3; 3; -8; 7; -5]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0912 :
  constDiagSignInt_fun [9; 3; 8; -13; 15; -13; -9; -2; 7; -11; -6; -13; 15; -13; -9; -2; 7; -11; -6]
  = [10; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0913 :
  constDiagSignInt_fun [-8; 5; 0; 1; 1; -8; -3; 13; -20; -1; 1; 1; 1; -8; -3; 13; -20; -1; 1]
  = [-7; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0914 :
  constDiagSignInt_fun [-2; 7; 0; -9; 17; 11; 18; 16; 13; -16; -18; -9; 17; 11; 18; 16; 13; -16; -18]
  = [-1; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0915 :
  constDiagSignInt_fun [-3; 8; 3; 17; 2; 4; -10; 3; -13; 18; -4; 16; 2; 4; -10; 3; -13; 18; -4]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0916 :
  constDiagSignInt_fun [9; -1; 4; 18; 6; 10; 10; 20; -6; 7; -7; 18; 6; 10; 10; 20; -6; 7; -7]
  = [10; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0917 :
  constDiagSignInt_fun [8; 8; 4; 2; -8; -19; -3; -4; -9; 20; 17; 2; -8; -19; -2; -4; -9; 20; 17]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0918 :
  constDiagSignInt_fun [10; 5; 0; 11; -11; 4; -3; 16; -14; 0; 3; 11; -11; 4; -3; 16; -14; 0; 3]
  = [11; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0919 :
  constDiagSignInt_fun [-6; -3; 0; 4; 17; 12; -19; 7; 15; 0; 6; 4; 17; 12; -19; 7; 15; 0; 6]
  = [-5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0920 :
  constDiagSignInt_fun [0; -2; 5; -13; -19; -9; -12; 13; -12; -10; 12; -13; -19; -9; -12; 13; -12; -10; 12]
  = [1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0921 :
  constDiagSignInt_fun [10; 7; 5; -14; -5; -14; -3; -20; 13; 19; -8; -14; -5; -14; -3; -19; 13; 19; -8]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0922 :
  constDiagSignInt_fun [3; 3; 0; -12; 6; 15; 16; 2; 15; 10; -17; -12; 6; 15; 16; 2; 15; 10; -17]
  = [4; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0923 :
  constDiagSignInt_fun [7; 7; 7; 1; -18; 15; -2; 7; -9; 3; 5; 0; -18; 15; -2; 7; -9; 3; 5]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0924 :
  constDiagSignInt_fun [3; 5; 7; -13; -4; 18; -2; -3; -9; -4; -17; -13; -4; 18; -2; -3; -9; -4; -17]
  = [4; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0925 :
  constDiagSignInt_fun [3; 1; 5; -3; -7; 9; 17; 14; -2; -6; -17; -3; -7; 9; 17; 15; -2; -6; -17]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0926 :
  constDiagSignInt_fun [4; 7; 0; 8; -11; 2; 15; -17; -15; 15; 0; 8; -11; 2; 15; -17; -15; 15; 0]
  = [5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0927 :
  constDiagSignInt_fun [-10; 6; 2; -12; -18; -10; 4; 17; 8; -14; 12; -13; -18; -10; 4; 17; 8; -14; 12]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0928 :
  constDiagSignInt_fun [8; 6; 8; 14; -20; 6; 6; 11; 13; 13; -4; 14; -20; 6; 6; 11; 13; 13; -4]
  = [9; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0929 :
  constDiagSignInt_fun [10; -2; 2; -7; -5; -7; -12; -15; -19; 9; 16; -7; -4; -7; -12; -15; -19; 9; 16]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0930 :
  constDiagSignInt_fun [6; -2; 0; -9; 18; 7; -3; -3; -12; 17; 11; -9; 18; 7; -3; -3; -12; 17; 11]
  = [7; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0931 :
  constDiagSignInt_fun [3; 6; 7; -16; -7; -10; 8; -7; 20; -4; 18; -17; -7; -10; 8; -7; 20; -4; 18]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0932 :
  constDiagSignInt_fun [1; 2; 5; -18; -12; 17; -11; -16; -1; 19; 9; -18; -12; 17; -11; -16; -1; 19; 9]
  = [2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0933 :
  constDiagSignInt_fun [7; -2; 5; -12; 8; -17; 11; -4; 18; -1; 4; -12; 8; -17; 11; -3; 18; -1; 4]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0934 :
  constDiagSignInt_fun [6; 5; 0; -2; 2; -10; -19; 15; 1; 11; -13; -2; 2; -10; -19; 15; 1; 11; -13]
  = [7; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0935 :
  constDiagSignInt_fun [-2; -2; 1; 19; 7; -9; -20; -9; 10; -13; 2; 18; 7; -9; -20; -9; 10; -13; 2]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0936 :
  constDiagSignInt_fun [-4; 9; 0; -12; -9; 17; 13; -2; 7; -13; 13; -12; -9; 17; 13; -2; 7; -13; 13]
  = [-3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0937 :
  constDiagSignInt_fun [-2; -2; 0; 14; -11; 6; 16; 18; -1; -6; 4; 14; -11; 6; 16; 18; -1; -6; 4]
  = [-1; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0938 :
  constDiagSignInt_fun [5; 3; 0; 12; -18; -14; -6; 14; 0; 9; 13; 12; -18; -14; -6; 14; 0; 9; 13]
  = [6; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0939 :
  constDiagSignInt_fun [0; 9; 1; 16; -19; 18; -4; 13; 1; 12; -10; 15; -19; 18; -4; 13; 1; 12; -10]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0940 :
  constDiagSignInt_fun [-10; 1; 5; 19; -5; 12; 20; 14; -10; 7; 16; 19; -5; 12; 20; 14; -10; 7; 16]
  = [-9; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0941 :
  constDiagSignInt_fun [-7; -1; 2; 20; 13; 2; 18; -19; -9; 3; -8; 20; 14; 2; 18; -19; -9; 3; -8]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0942 :
  constDiagSignInt_fun [10; -1; 0; -10; 5; -16; 5; 1; -16; 18; -18; -10; 5; -16; 5; 1; -16; 18; -18]
  = [11; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0943 :
  constDiagSignInt_fun [-2; 3; 5; -4; -20; -8; -13; -13; -8; -20; 14; -5; -20; -8; -13; -13; -8; -20; 14]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0944 :
  constDiagSignInt_fun [7; 7; 3; -7; 16; 18; 6; 6; -5; -6; -9; -7; 16; 18; 6; 6; -5; -6; -9]
  = [8; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0945 :
  constDiagSignInt_fun [8; 9; 6; 3; -16; 15; 2; -2; 19; -16; 7; 3; -16; 15; 2; -2; 20; -16; 7]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0946 :
  constDiagSignInt_fun [-7; -1; 0; 10; 17; -6; 18; 17; -6; -16; -19; 10; 17; -6; 18; 17; -6; -16; -19]
  = [-6; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0947 :
  constDiagSignInt_fun [1; 4; 4; 12; -3; 10; 15; 14; 12; -16; -12; 11; -3; 10; 15; 14; 12; -16; -12]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0948 :
  constDiagSignInt_fun [-4; 7; 6; 19; -12; -17; 3; -20; -15; 6; -18; 19; -12; -17; 3; -20; -15; 6; -18]
  = [-3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0949 :
  constDiagSignInt_fun [7; -1; 1; -16; -16; -12; -11; 1; -4; -5; 11; -15; -16; -12; -11; 1; -4; -5; 11]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0950 :
  constDiagSignInt_fun [-1; 5; 0; 20; 17; 16; -12; -10; -8; 1; -11; 20; 17; 16; -12; -10; -8; 1; -11]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0951 :
  constDiagSignInt_fun [-1; 7; 8; 19; 15; -18; 1; 6; -12; 5; -18; 18; 15; -18; 1; 6; -12; 5; -18]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0952 :
  constDiagSignInt_fun [-5; 4; 2; -14; 20; -15; -7; 0; 7; 16; 10; -14; 20; -15; -7; 0; 7; 16; 10]
  = [-4; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0953 :
  constDiagSignInt_fun [-5; 8; 1; 8; 8; -14; -2; 18; 5; 9; 2; 9; 8; -14; -2; 18; 5; 9; 2]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0954 :
  constDiagSignInt_fun [-6; 1; 0; -12; -16; 12; 8; -14; -13; 10; 10; -12; -16; 12; 8; -14; -13; 10; 10]
  = [-5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0955 :
  constDiagSignInt_fun [-2; 6; 4; 17; 19; -15; -10; -10; 9; -3; -5; 16; 19; -15; -10; -10; 9; -3; -5]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0956 :
  constDiagSignInt_fun [7; -2; 3; -20; 3; -19; -15; 19; -2; -8; 17; -20; 3; -19; -15; 19; -2; -8; 17]
  = [8; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0957 :
  constDiagSignInt_fun [7; 7; 2; -8; -15; -16; -2; 11; 11; 15; -4; -8; -14; -16; -2; 11; 11; 15; -4]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0958 :
  constDiagSignInt_fun [-7; 4; 0; -7; 17; 9; -5; -8; 13; 15; -19; -7; 17; 9; -5; -8; 13; 15; -19]
  = [-6; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0959 :
  constDiagSignInt_fun [1; 5; 7; -18; -6; 15; 0; 2; -16; -20; -5; -19; -6; 15; 0; 2; -16; -20; -5]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0960 :
  constDiagSignInt_fun [-8; -1; 7; 5; 18; -5; 16; 7; -20; 18; 2; 5; 18; -5; 16; 7; -20; 18; 2]
  = [-7; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0961 :
  constDiagSignInt_fun [2; -1; 4; -7; -11; -20; 5; -14; 7; 19; -20; -7; -11; -20; 6; -14; 7; 19; -20]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0962 :
  constDiagSignInt_fun [10; 4; 0; -9; -12; -2; 0; -20; 18; 13; -7; -9; -12; -2; 0; -20; 18; 13; -7]
  = [11; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0963 :
  constDiagSignInt_fun [-9; -1; 7; -1; 18; -6; -9; 5; -3; 10; -3; -2; 18; -6; -9; 5; -3; 10; -3]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0964 :
  constDiagSignInt_fun [-2; 8; 1; 1; 20; -20; -20; -15; -12; -6; 17; 1; 20; -20; -20; -15; -12; -6; 17]
  = [-1; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0965 :
  constDiagSignInt_fun [0; 9; 5; 19; 9; -15; -17; -10; 17; 8; 7; 19; 9; -15; -17; -9; 17; 8; 7]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0966 :
  constDiagSignInt_fun [9; -2; 0; -13; -17; -7; 14; 0; 17; 1; 0; -13; -17; -7; 14; 0; 17; 1; 0]
  = [10; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0967 :
  constDiagSignInt_fun [2; -2; 3; -5; 15; 17; -12; 16; 6; 11; 20; -6; 15; 17; -12; 16; 6; 11; 20]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0968 :
  constDiagSignInt_fun [6; -3; 1; 20; 0; -11; -4; -17; 15; -4; 10; 20; 0; -11; -4; -17; 15; -4; 10]
  = [7; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0969 :
  constDiagSignInt_fun [10; -3; 3; 12; -15; -10; 11; 18; -13; -2; -14; 12; -15; -9; 11; 18; -13; -2; -14]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0970 :
  constDiagSignInt_fun [-6; 2; 0; -6; 6; -8; -1; -8; -5; -11; -10; -6; 6; -8; -1; -8; -5; -11; -10]
  = [-5; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0971 :
  constDiagSignInt_fun [-4; 2; 2; 4; 11; 14; 17; 16; -4; 16; -6; 3; 11; 14; 17; 16; -4; 16; -6]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0972 :
  constDiagSignInt_fun [-9; 9; 4; -19; -8; -13; 11; 20; -6; -8; 18; -19; -8; -13; 11; 20; -6; -8; 18]
  = [-8; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0973 :
  constDiagSignInt_fun [9; 2; 7; 0; 2; 17; 2; -17; -4; 3; 9; 0; 2; 17; 2; -17; -4; 4; 9]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0974 :
  constDiagSignInt_fun [6; 9; 0; -20; 3; 20; 5; 12; 3; 1; 17; -20; 3; 20; 5; 12; 3; 1; 17]
  = [7; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0975 :
  constDiagSignInt_fun [2; 7; 8; 5; -3; 14; 17; 7; 12; -13; 6; 4; -3; 14; 17; 7; 12; -13; 6]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0976 :
  constDiagSignInt_fun [2; 6; 6; -15; 17; 2; -13; 10; -10; -11; -19; -15; 17; 2; -13; 10; -10; -11; -19]
  = [3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0977 :
  constDiagSignInt_fun [1; 3; 2; 12; -2; -3; -4; -5; 16; 11; 10; 12; -1; -3; -4; -5; 16; 11; 10]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0978 :
  constDiagSignInt_fun [-8; 2; 0; -1; 20; -4; -11; -17; 19; -1; 16; -1; 20; -4; -11; -17; 19; -1; 16]
  = [-7; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0979 :
  constDiagSignInt_fun [-2; -1; 3; 2; 4; -18; 18; -8; 13; 0; 1; 1; 4; -18; 18; -8; 13; 0; 1]
  = [0; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0980 :
  constDiagSignInt_fun [-8; -2; 5; 9; -4; 2; -13; 10; 20; 20; 18; 9; -4; 2; -13; 10; 20; 20; 18]
  = [-7; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0981 :
  constDiagSignInt_fun [5; 6; 8; -6; 8; 16; 5; 12; 8; 2; 3; -6; 8; 16; 5; 12; 8; 2; 4]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0982 :
  constDiagSignInt_fun [-10; 9; 0; 15; -5; 9; -5; -9; 18; 14; 9; 15; -5; 9; -5; -9; 18; 14; 9]
  = [-9; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0983 :
  constDiagSignInt_fun [-5; 1; 2; -9; 6; -10; 10; 7; 14; 11; -16; -10; 6; -10; 10; 7; 14; 11; -16]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0984 :
  constDiagSignInt_fun [-7; -3; 5; -3; -5; -6; 20; -19; 15; -6; 19; -3; -5; -6; 20; -19; 15; -6; 19]
  = [-6; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0985 :
  constDiagSignInt_fun [-7; 4; 8; 3; 16; 16; -9; -17; 15; 1; 20; 3; 16; 16; -9; -17; 15; 1; 21]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0986 :
  constDiagSignInt_fun [-7; 1; 0; -13; 15; 18; -10; 6; 14; 4; 9; -13; 15; 18; -10; 6; 14; 4; 9]
  = [-6; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0987 :
  constDiagSignInt_fun [-2; 8; 7; -11; -16; 17; 11; -5; -12; -13; 13; -12; -16; 17; 11; -5; -12; -13; 13]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0988 :
  constDiagSignInt_fun [7; 3; 1; 0; 0; -19; 17; -20; 7; 19; 13; 0; 0; -19; 17; -20; 7; 19; 13]
  = [8; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0989 :
  constDiagSignInt_fun [-8; 3; 3; -16; -11; 20; 3; 2; -19; 10; 3; -16; -11; 21; 3; 2; -19; 10; 3]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0990 :
  constDiagSignInt_fun [-2; 0; 0; 16; -13; 17; 8; 10; 15; -1; -9; 16; -13; 17; 8; 10; 15; -1; -9]
  = [-1; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0991 :
  constDiagSignInt_fun [-1; 4; 2; 15; 0; 19; 12; -18; 13; 0; -3; 14; 0; 19; 12; -18; 13; 0; -3]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0992 :
  constDiagSignInt_fun [3; 3; 6; -10; 8; 6; 7; 10; 6; -12; -3; -10; 8; 6; 7; 10; 6; -12; -3]
  = [4; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0993 :
  constDiagSignInt_fun [-4; 7; 8; -13; 0; -6; -10; 9; -4; 6; -9; -13; 0; -6; -10; 9; -4; 6; -8]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0994 :
  constDiagSignInt_fun [-4; -1; 0; 12; 18; 8; -8; -16; -4; -11; 19; 12; 18; 8; -8; -16; -4; -11; 19]
  = [-3; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0995 :
  constDiagSignInt_fun [9; 7; 4; 4; 19; 12; 0; -6; 9; 11; -14; 3; 19; 12; 0; -6; 9; 11; -14]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0996 :
  constDiagSignInt_fun [1; 9; 7; 19; 13; 4; 1; 19; 5; 18; -10; 19; 13; 4; 1; 19; 5; 18; -10]
  = [2; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0997 :
  constDiagSignInt_fun [10; 4; 5; -14; -11; 17; -9; -16; 20; -18; 2; -14; -11; 17; -9; -15; 20; -18; 2]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0998 :
  constDiagSignInt_fun [1; -1; 0; -3; -16; 6; 18; -20; -11; 13; 11; -3; -16; 6; 18; -20; -11; 13; 11]
  = [2; 1].
Proof. vm_compute. reflexivity. Qed.


Example t_0999 :
  constDiagSignInt_fun [-8; 8; 4; 13; -7; 19; 16; 6; -11; 15; 15; 12; -7; 19; 16; 6; -11; 15; 15]
  = [0; 0].
Proof. vm_compute. reflexivity. Qed.


Example negative_control_wrong_expected :
  constDiagSignInt_fun [-7; 1; 1; -18; -9; 13; 3; -15; -13; -14; 1; -18; -9; 13; 3; -15; -13; -14; 1]
  <> [-5; 0].
Proof. vm_compute. discriminate. Qed.
