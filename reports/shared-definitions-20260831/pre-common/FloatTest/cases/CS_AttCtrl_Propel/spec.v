(* CS_AttCtrl_Propel/CS_ThrParamCfgX 的 binary64 功能 spec。 *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.

Local Open Scope Z_scope.

Definition z_eqb (x y : Z) : bool := Z.eqb x y.

Definition cs_ThrParamCfgX_fun
    (work_mode : Z) (mode_timer panel_unfold_start : fp64)
    (earth_acq yaw_capt jet_back scan_mode rw8 sub_mode unload : Z) : Z :=
  if (z_eqb work_mode 1 && c64_lt mode_timer panel_unfold_start)%bool then 0
  else if
    (z_eqb work_mode 6 ||
     z_eqb work_mode 7 ||
     (z_eqb work_mode 8 && z_eqb earth_acq 1) ||
     (z_eqb work_mode 8 && z_eqb earth_acq 0 && z_eqb yaw_capt 1) ||
     (z_eqb work_mode 12 && z_eqb jet_back 1 && z_eqb scan_mode 10))%bool
  then 1
  else if
    (z_eqb work_mode 8 && z_eqb rw8 0 && z_eqb sub_mode 2)%bool
  then 2
  else if z_eqb unload 1 then 3
  else 4.
