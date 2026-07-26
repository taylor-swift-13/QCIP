(* CS_Ctrl_Att_Rate 的 FS_ModeProc=2 直接输入路径 binary64 spec。 *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition bits3 (x0 x1 x2 : fp64) : list Z :=
  [bits_of_b64 x0; bits_of_b64 x1; bits_of_b64 x2].

Definition ctrlAttRate_mode2_fun
    (a0 a1 a2 da0 da1 da2 w0 w1 w2 : fp64)
  : list Z * list Z * list Z * list Z * list Z :=
  (bits3 a0 a1 a2, bits3 da0 da1 da2, bits3 w0 w1 w2,
   bits3 a0 a1 a2, bits3 da0 da1 da2).
