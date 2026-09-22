(* Executable binary64 model for the covered CS_Ctrl_Att_Rate paths. *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.
Require Import FloatTest.lib.FloatAttitude.

Import ListNotations.
Local Open Scope Z_scope.

Definition car_z : fp64 := f64 0.
Definition car_zero3 : list fp64 := [car_z; car_z; car_z].
Definition car_zero9 : list fp64 :=
  [car_z;car_z;car_z;car_z;car_z;car_z;car_z;car_z;car_z].

Definition car_sub3 (a b : list fp64) : list fp64 :=
  match a, b with
  | [a0;a1;a2], [b0;b1;b2] =>
      [fp64_sub a0 b0; fp64_sub a1 b1; fp64_sub a2 b2]
  | _, _ => []
  end.

Definition car_mod_no_wrap3 (a b : list fp64) : list fp64 :=
  map fp64_via_fp32 (car_sub3 a b).

Definition car_bmc3 (a : list fp64) : list fp64 :=
  match a with | [x;y;z] => [x;y;car_z] | _ => [] end.

Definition cs_Ctrl_Att_Rate_fun
    (mode_proc fs_attd bmc sv : Z)
    (a rate wbo w cbo ires w0i aref daref : list fp64) : list Z :=
  let selected :=
    if fs_attd =? 4 then
      match ires with
      | [phi;theta;dphi;dtheta] =>
          let a4 := [phi;theta;car_z] in
          let r4 := [dphi;dtheta;car_z] in
          let c4 := fa_angle2c sv a4 in
          (a4, r4, car_zero3, fa_mm331 c4 w0i, c4)
      | _ => ([],[],[],[],[])
      end
    else (a, rate, wbo, w, cbo) in
  let '(aclp, rclp, wboclp, wclp, cboclp) := selected in
  if mode_proc =? 2 then
    map bits_of_b64 (a ++ rate ++ wbo ++ car_zero3 ++ car_zero9 ++ a ++ rate)
  else
    let controls :=
      if bmc =? 1 then (car_bmc3 aclp, car_bmc3 rclp)
      else (car_mod_no_wrap3 aclp aref, car_sub3 rclp daref) in
    let '(ac, rc) := controls in
    map bits_of_b64 (aclp ++ rclp ++ wboclp ++ wclp ++ cboclp ++ ac ++ rc).
