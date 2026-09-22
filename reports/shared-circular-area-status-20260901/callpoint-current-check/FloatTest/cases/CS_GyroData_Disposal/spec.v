(* CS_GyroData_Disposal 的历史值回退路径 binary64 spec。 *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition gyro_stop_flag
    (no_use_group fs_attd mode_stop : Z) : Z :=
  if (Z.eqb no_use_group 1 &&
      (Z.eqb fs_attd 0 || Z.eqb fs_attd 1) &&
      Z.eqb mode_stop 1)%bool
  then 1 else 0.

Definition gyro_history_fallback_fun
    (no_use_group fs_attd mode_stop valid_count : Z)
    (history current : list fp64) : Z * list Z :=
  let stop := gyro_stop_flag no_use_group fs_attd mode_stop in
  let use_history :=
    (Z.eqb stop 1 ||
     negb (Z.eqb valid_count 3 || Z.eqb valid_count 4))%bool in
  let selected := if use_history then history else current in
  (stop, map bits_of_b64 selected).
