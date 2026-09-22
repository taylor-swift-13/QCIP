(* CS_OrbitComputation 顶层轨道有效性与输出控制 binary64 spec。 *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition orbit_abs (x : fp64) : fp64 :=
  if c64_lt x (f64 0) then fp64_neg x else x.

Definition orbitControl_fun
    (star_time t0 limit w0 lmdg earth_rate : fp64)
    (work_mode abnormal old_no_orbit_count : Z)
  : Z * Z * Z * list Z * Z :=
  let delta := fp64_sub star_time t0 in
  let invalid_time := c64_ge (orbit_abs delta) limit in
  let valid :=
    if invalid_time then 0 else if Z.eqb abnormal 0 then 0 else 1 in
  let no_insert :=
    if c64_ge (orbit_abs delta)
         (fp64_mul limit (f64 4604480259023595110))
    then 1 else 0 in
  let no_orbit_count :=
    if (negb (Z.eqb work_mode 9) &&
        negb (Z.eqb work_mode 8) &&
        Z.eqb valid 0)%bool
    then old_no_orbit_count + 1 else 0 in
  let lmdG :=
    fp64_add lmdg (fp64_mul earth_rate delta) in
  (valid, no_insert, no_orbit_count,
   [0; bits_of_b64 (fp64_neg w0); 0], bits_of_b64 lmdG).
