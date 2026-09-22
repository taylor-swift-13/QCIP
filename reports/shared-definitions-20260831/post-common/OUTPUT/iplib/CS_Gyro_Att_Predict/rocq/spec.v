(* Executable binary64 model for the active CS_Gyro_Att_Predict path. *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.
Require Import FloatTest.lib.FloatTrig.
Require Import FloatTest.lib.FloatAttitude.

Import ListNotations.
Local Open Scope Z_scope.

Definition gyro_limit64 (x bound : fp64) : fp64 :=
  if c_gt64 x bound then bound
  else if c_lt64 x (fp64_neg bound) then fp64_neg bound
  else x.

Definition gyro_rate64 (delta d0 de dt bound : fp64) : fp64 :=
  gyro_limit64
    (fp64_sub (fp64_div delta dt)
      (fp64_div (fp64_add d0 de) (f64 4660134898793709568)))
    bound.

Definition abs64 (x : fp64) : fp64 :=
  if c_lt64 x ZERO64 then fp64_neg x else x.

Definition bump_if_singular (x : fp64) : fp64 :=
  if c_lt64 (abs64 (ported_cos x)) (f64 4502148214488346440)
  then fp64_add x (f64 4562254508917369340)
  else x.

Definition gyro_guarded_angles (sv : Z) (a : list fp64) : list fp64 :=
  match a with
  | [a0; a1; a2] =>
      if (sv =? 123) || (sv =? 321) then [a0; bump_if_singular a1; a2]
      else if (sv =? 213) || (sv =? 312) then [bump_if_singular a0; a1; a2]
      else if (sv =? 132) || (sv =? 231) then [a0; a1; bump_if_singular a2]
      else [a0; a1; a2]
  | _ => []
  end.

Definition gyro_add_step (a rate : list fp64) (dt : fp64) : list fp64 :=
  match a, rate with
  | [a0; a1; a2], [r0; r1; r2] =>
      [fp64_add a0 (fp64_mul r0 dt);
       fp64_add a1 (fp64_mul r1 dt);
       fp64_add a2 (fp64_mul r2 dt)]
  | _, _ => []
  end.

Definition gyro_mod_pnhp_no_wrap (a : list fp64) : list fp64 :=
  map fp64_via_fp32 a.

Definition gyro_limit_angles (a bounds : list fp64) : list fp64 :=
  match a, bounds with
  | [a0; a1; a2], [b0; b1; b2] =>
      [gyro_limit64 a0 b0; gyro_limit64 a1 b1; gyro_limit64 a2 b2]
  | _, _ => []
  end.

Definition cs_Gyro_Att_Predict_fun
    (wm : Z) (seq : list Z)
    (dg d0 de w0i a_initial angle_bounds : list fp64)
    (dt rate_bound : fp64) : list Z :=
  match dg, d0, de with
  | [dg0; dg1; dg2], [d00; d01; d02], [de0; de1; de2] =>
      let sv := nth (Z.to_nat wm) seq 321 in
      let w := [gyro_rate64 dg0 d00 de0 dt rate_bound;
                gyro_rate64 dg1 d01 de1 dt rate_bound;
                gyro_rate64 dg2 d02 de2 dt rate_bound] in
      let orbital := fa_mm331 (fa_angle2c sv a_initial) w0i in
      let wbo :=
        match w, orbital with
        | [w0; w1; w2], [o0; o1; o2] =>
            [fp64_sub w0 o0; fp64_sub w1 o1; fp64_sub w2 o2]
        | _, _ => []
        end in
      let rate := fa_w2d_euler sv (gyro_guarded_angles sv a_initial) wbo
                                 [ZERO64; ZERO64; ZERO64] in
      let a_mod := gyro_mod_pnhp_no_wrap (gyro_add_step a_initial rate dt) in
      let cbo := fa_angle2c sv a_mod in
      let a_final := gyro_limit_angles a_mod angle_bounds in
      map bits_of_b64 (w ++ wbo ++ rate ++ a_final ++ cbo)
  | _, _, _ => []
  end.
