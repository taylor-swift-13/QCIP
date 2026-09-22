(* ModeConvert_SBM 的 binary64 功能 spec。 *)
Require Import Coq.ZArith.ZArith.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.

Local Open Scope Z_scope.

Definition modeConvert_SBM_fun
    (star_time reference_time inject_delay : fp64) (work_mode : Z) : Z :=
  let elapsed := fp64_sub star_time reference_time in
  if c64_ge elapsed inject_delay then 1 else work_mode.
