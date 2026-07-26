(* ModeConvert_EIM 的 binary64 功能 spec。 *)
Require Import Coq.ZArith.ZArith.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.

Local Open Scope Z_scope.

Definition modeConvert_EIM_fun
    (timer end_time : fp64) (work_mode : Z) : Z :=
  if c64_gt timer end_time then 2 else work_mode.
