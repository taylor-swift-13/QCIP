(* Executable fp64 model of IP_CS_Track_Atti.c.
 * C2Angle* is explicitly modeled as the driver's injected-angle observed stub;
 * all downstream computations retain the original C operation order. *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.
Require Import FloatTest.lib.FloatTrig.
Require Import OUTPUT.iplib.CS_TrgtAtt_EIM.rocq.spec.

Import ListNotations.
Local Open Scope Z_scope.

Definition w2d_euler (sv : Z) (a w da_initial : list fp64) : list fp64 :=
  match a, w with
  | [a1; a2; a3], [w0; w1; w2] =>
    let s1 := ported_sin a1 in let s2 := ported_sin a2 in
    let s3 := ported_sin a3 in let c1 := ported_cos a1 in
    let c2 := ported_cos a2 in let c3 := ported_cos a3 in
    if sv =? 132 then
      let t := fp64_add (fp64_mul c2 w0) (fp64_mul s2 w2) in
      [fp64_div t c3;
       fp64_add w1 (fp64_div (fp64_mul t s3) c3);
       fp64_add (fp64_mul (fp64_neg s2) w0) (fp64_mul c2 w2)]
    else if sv =? 321 then
      let t := fp64_add (fp64_mul s1 w1) (fp64_mul c1 w2) in
      [fp64_add w0 (fp64_div (fp64_mul t s2) c2);
       fp64_sub (fp64_mul c1 w1) (fp64_mul s1 w2);
       fp64_div t c2]
    else if sv =? 312 then
      let t := fp64_sub (fp64_mul w0 s2) (fp64_mul w2 c2) in
      [fp64_add (fp64_mul w0 c2) (fp64_mul w2 s2);
       fp64_add w1 (fp64_div (fp64_mul t s1) c1);
       fp64_div (fp64_add (fp64_mul (fp64_neg w0) s2) (fp64_mul w2 c2)) c1]
    else if sv =? 213 then
      let t := fp64_add (fp64_mul s3 w0) (fp64_mul c3 w1) in
      [fp64_sub (fp64_mul c3 w0) (fp64_mul s3 w1);
       fp64_div t c1;
       fp64_add w2 (fp64_div (fp64_mul t s1) c1)]
    else if sv =? 123 then
      let t := fp64_sub (fp64_mul c3 w0) (fp64_mul s3 w1) in
      [fp64_div t c2;
       fp64_add (fp64_mul c3 w1) (fp64_mul s3 w0);
       fp64_sub w2 (fp64_div (fp64_mul t s2) c2)]
    else if sv =? 231 then
      let t := fp64_sub (fp64_mul c1 w1) (fp64_mul s1 w2) in
      [fp64_sub w0 (fp64_div (fp64_mul t s3) c3);
       fp64_div t c3;
       fp64_add (fp64_mul c1 w2) (fp64_mul s1 w1)]
    else da_initial
  | _, _ => []
  end.

Definition derivative3 (now previous : list fp64) (dt : fp64) : list fp64 :=
  match now, previous with
  | [x0; x1; x2], [p0; p1; p2] =>
      [fp64_div (fp64_sub x0 p0) dt;
       fp64_div (fp64_sub x1 p1) dt;
       fp64_div (fp64_sub x2 p2) dt]
  | _, _ => []
  end.

Definition scale3 (k : fp64) (v : list fp64) : list fp64 :=
  match v with
  | [x0; x1; x2] => [fp64_mul k x0; fp64_mul k x1; fp64_mul k x2]
  | _ => []
  end.

Definition norm3 (v : list fp64) : fp64 :=
  match v with
  | [x0; x1; x2] =>
      fp64_sqrt (fp64_add (fp64_add (fp64_mul x0 x0) (fp64_mul x1 x1))
                          (fp64_mul x2 x2))
  | _ => ZERO64
  end.

Definition dispatch_tag (sv : Z) : Z :=
  if sv =? 123 then 123 else if sv =? 132 then 132
  else if sv =? 213 then 213 else if sv =? 231 then 231
  else if sv =? 312 then 312 else 321.

Definition cs_Track_Atti_fun
    (wm : Z) (seq : list Z)
    (angles wro wri da_initial da_previous wri_previous : list fp64)
    (dt : fp64) (inertia : list fp64) (mdf mlf : fp64)
  : list Z * list Z * list Z * list Z * list Z * list Z * Z :=
  let sv := nth (Z.to_nat wm) seq 321 in
  let da := w2d_euler sv angles wro da_initial in
  let dda := derivative3 da da_previous dt in
  let wa := derivative3 wri wri_previous dt in
  let torque0 := scale3 mdf (mm331 inertia wa) in
  let torque := if c_gt64 (norm3 torque0) mlf
                then [ZERO64; ZERO64; ZERO64] else torque0 in
  (map bits_of_b64 angles, map bits_of_b64 da, map bits_of_b64 dda,
   map bits_of_b64 torque, map bits_of_b64 da, map bits_of_b64 wri,
   dispatch_tag sv).
