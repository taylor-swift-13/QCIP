(* Executable model for the covered CS_IRES_Attitude paths. *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.
Require Import FloatTest.lib.FloatTrig.

Import ListNotations.
Local Open Scope Z_scope.

Definition ires_z : fp64 := f64 0.
Definition ires_one : fp64 := f64 4607182418800017408.
Definition ires_half : fp64 := f64 4602678819172646912.
Definition ires_two : fp64 := f64 4611686018427387904.

Definition ires_limit (x bound : fp64) : fp64 :=
  if c_gt64 x bound then bound
  else if c_lt64 x (fp64_neg bound) then fp64_neg bound else x.

Definition ires_select (fv : list Z) (phi_i theta_i : list fp64)
    (old_phi old_theta : fp64) : fp64 * fp64 * Z :=
  match fv, phi_i, theta_i with
  | [f0;f1], [p0;p1], [t0;t1] =>
      if (f0 =? 1) && (f1 =? 1) then
        (fp64_mul ires_half (fp64_add p0 p1),
         fp64_mul ires_half (fp64_add t0 t1), 2)
      else if f0 =? 1 then (p0,t0,1)
      else if f1 =? 1 then (p1,t1,1)
      else (old_phi,old_theta,0)
  | _,_,_ => (old_phi,old_theta,0)
  end.

Definition ires_rate (factor old current old2 ts bound : fp64) : fp64 :=
  ires_limit
    (fp64_add (fp64_mul factor old)
      (fp64_div
        (fp64_div
          (fp64_mul (fp64_sub ires_one factor) (fp64_sub current old2))
          ires_two) ts)) bound.

Definition cs_IRES_Attitude_fun
    (kind fs0 fs1 : Z) (fv fu : list Z)
    (phi_i theta_i state history comps params : list fp64) : list Z :=
  if kind =? 0 then
    [0;0;0;0] ++ map bits_of_b64 (state ++ [ires_z;ires_z;ires_z] ++ history)
  else
    match state, history, comps, params with
    | [old_phi;old_theta;old_dphi;old_dtheta],
      [phi_lst;phi_lst2;theta_lst;theta_lst2],
      [dphi_comp;dtheta_comp], [factor;lim_phi;lim_theta;ts] =>
        let '(phi,theta,cnt) := ires_select fv phi_i theta_i old_phi old_theta in
        let dphi := if cnt =? 0 then ires_z
          else ires_rate factor old_dphi phi phi_lst ts lim_phi in
        let dtheta := if cnt =? 0 then ires_z
          else ires_rate factor old_dtheta theta theta_lst ts lim_theta in
        let ep := fp64_sub phi dphi_comp in
        let et := fp64_sub theta dtheta_comp in
        let eb := [fp64_neg (ported_sin et);
                   fp64_mul (ported_sin ep) (ported_cos et);
                   fp64_mul (ported_cos ep) (ported_cos et)] in
        fv ++ fu ++ map bits_of_b64
          ([phi;theta;dphi;dtheta] ++ eb ++
           [old_phi;phi_lst;old_theta;theta_lst])
    | _,_,_,_ => []
    end.
