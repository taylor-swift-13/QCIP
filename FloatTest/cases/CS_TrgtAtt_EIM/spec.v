(* CS_TrgtAtt_EIM 的零目标角、单位矩阵路径 binary64 spec。 *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition identity33_bits_eim : list Z :=
  [4607182418800017408; 0; 0;
   0; 4607182418800017408; 0;
   0; 0; 4607182418800017408].

Definition trgtAtt_EIM_identity_fun (w0 w1 w2 : fp64)
  : list Z * list Z * list Z :=
  (identity33_bits_eim,
   [bits_of_b64 w0; bits_of_b64 w1; bits_of_b64 w2],
   [bits_of_b64 (fp64_sub w0 w0);
    bits_of_b64 (fp64_sub w1 w1);
    bits_of_b64 (fp64_sub w2 w2)]).
