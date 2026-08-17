(* Binary64 model of the covered CS_OrbitComputationFun control layer. *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition orbit_abs64 (x : fp64) : fp64 :=
  if c64_lt x (f64 0) then fp64_neg x else x.

Definition cs_OrbitComputation_fun
    (star_time t0 limit w0 lmdg earth_rate : fp64)
    (work_mode abnormal old_no_orbit_count : Z) : list Z :=
  let delta := fp64_sub star_time t0 in
  let valid :=
    if c64_ge (orbit_abs64 delta) limit then 0
    else if abnormal =? 0 then 0 else 1 in
  let no_insert :=
    if c64_ge (orbit_abs64 delta)
         (fp64_mul limit (f64 4604480259023595110))
    then 1 else 0 in
  let no_orbit_count :=
    if (negb (work_mode =? 9) && negb (work_mode =? 8) && (valid =? 0))%bool
    then old_no_orbit_count + 1 else 0 in
  let lmdG := fp64_add lmdg (fp64_mul earth_rate delta) in
  [valid; no_insert; no_orbit_count;
   0; bits_of_b64 (fp64_neg w0); 0; bits_of_b64 lmdG;
   1; 1; 1; 1].
