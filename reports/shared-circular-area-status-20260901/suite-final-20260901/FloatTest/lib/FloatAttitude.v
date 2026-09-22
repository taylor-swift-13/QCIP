(* Shared deterministic fp64 attitude formulas used by FloatTest cases. *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
Require Import FloatTest.lib.FloatTestCommon.
Require Import FloatTest.lib.FloatTrig.

Import ListNotations.
Local Open Scope Z_scope.

Definition fa_dot3 (x0 x1 x2 y0 y1 y2 : fp64) : fp64 :=
  fp64_add (fp64_add (fp64_add ZERO64 (fp64_mul x0 y0)) (fp64_mul x1 y1))
           (fp64_mul x2 y2).

Definition fa_mm331 (a b : list fp64) : list fp64 :=
  match a, b with
  | [a0; a1; a2; a3; a4; a5; a6; a7; a8], [b0; b1; b2] =>
      [fa_dot3 a0 a1 a2 b0 b1 b2;
       fa_dot3 a3 a4 a5 b0 b1 b2;
       fa_dot3 a6 a7 a8 b0 b1 b2]
  | _, _ => []
  end.

Definition fa_mm333 (a b : list fp64) : list fp64 :=
  match a, b with
  | [a0; a1; a2; a3; a4; a5; a6; a7; a8],
    [b0; b1; b2; b3; b4; b5; b6; b7; b8] =>
    [fa_dot3 a0 a1 a2 b0 b3 b6; fa_dot3 a0 a1 a2 b1 b4 b7; fa_dot3 a0 a1 a2 b2 b5 b8;
     fa_dot3 a3 a4 a5 b0 b3 b6; fa_dot3 a3 a4 a5 b1 b4 b7; fa_dot3 a3 a4 a5 b2 b5 b8;
     fa_dot3 a6 a7 a8 b0 b3 b6; fa_dot3 a6 a7 a8 b1 b4 b7; fa_dot3 a6 a7 a8 b2 b5 b8]
  | _, _ => []
  end.

Definition fa_angle2c123 (a1 a2 a3 : fp64) : list fp64 :=
  let s1 := ported_sin a1 in let c1 := ported_cos a1 in
  let s2 := ported_sin a2 in let c2 := ported_cos a2 in
  let s3 := ported_sin a3 in let c3 := ported_cos a3 in
  [fp64_mul c2 c3; fp64_mul (fp64_neg c2) s3; s2;
   fp64_add (fp64_mul c1 s3) (fp64_mul (fp64_mul s1 s2) c3);
   fp64_sub (fp64_mul c1 c3) (fp64_mul (fp64_mul s1 s2) s3);
   fp64_mul (fp64_neg s1) c2;
   fp64_sub (fp64_mul s1 s3) (fp64_mul (fp64_mul c1 s2) c3);
   fp64_add (fp64_mul (fp64_mul c1 s2) s3) (fp64_mul s1 c3);
   fp64_mul c1 c2].

Definition fa_angle2c132 (a1 a2 a3 : fp64) : list fp64 :=
  let s1 := ported_sin a1 in let c1 := ported_cos a1 in
  let s2 := ported_sin a2 in let c2 := ported_cos a2 in
  let s3 := ported_sin a3 in let c3 := ported_cos a3 in
  [fp64_mul c2 c3; fp64_neg s3; fp64_mul s2 c3;
   fp64_add (fp64_mul (fp64_mul c1 s3) c2) (fp64_mul s1 s2);
   fp64_mul c1 c3;
   fp64_sub (fp64_mul (fp64_mul c1 s2) s3) (fp64_mul s1 c2);
   fp64_sub (fp64_mul (fp64_mul s1 s3) c2) (fp64_mul c1 s2);
   fp64_mul s1 c3;
   fp64_add (fp64_mul c1 c2) (fp64_mul (fp64_mul s1 s2) s3)].

Definition fa_angle2c213 (a1 a2 a3 : fp64) : list fp64 :=
  let s1 := ported_sin a1 in let c1 := ported_cos a1 in
  let s2 := ported_sin a2 in let c2 := ported_cos a2 in
  let s3 := ported_sin a3 in let c3 := ported_cos a3 in
  [fp64_add (fp64_mul c2 c3) (fp64_mul (fp64_mul s1 s2) s3);
   fp64_add (fp64_mul (fp64_neg c2) s3) (fp64_mul (fp64_mul s1 s2) c3);
   fp64_mul s2 c1; fp64_mul c1 s3; fp64_mul c1 c3; fp64_neg s1;
   fp64_sub (fp64_mul (fp64_mul c2 s1) s3) (fp64_mul s2 c3);
   fp64_add (fp64_mul s2 s3) (fp64_mul (fp64_mul c2 s1) c3);
   fp64_mul c2 c1].

Definition fa_angle2c231 (a1 a2 a3 : fp64) : list fp64 :=
  let s1 := ported_sin a1 in let c1 := ported_cos a1 in
  let s2 := ported_sin a2 in let c2 := ported_cos a2 in
  let s3 := ported_sin a3 in let c3 := ported_cos a3 in
  [fp64_mul c2 c3;
   fp64_sub (fp64_mul s2 s1) (fp64_mul (fp64_mul c2 s3) c1);
   fp64_add (fp64_mul s2 c1) (fp64_mul (fp64_mul c2 s3) s1);
   s3; fp64_mul c3 c1; fp64_mul (fp64_neg c3) s1;
   fp64_mul (fp64_neg s2) c3;
   fp64_add (fp64_mul c2 s1) (fp64_mul (fp64_mul s2 s3) c1);
   fp64_sub (fp64_mul c2 c1) (fp64_mul (fp64_mul s2 s3) s1)].

Definition fa_angle2c312 (a1 a2 a3 : fp64) : list fp64 :=
  let s1 := ported_sin a1 in let c1 := ported_cos a1 in
  let s2 := ported_sin a2 in let c2 := ported_cos a2 in
  let s3 := ported_sin a3 in let c3 := ported_cos a3 in
  [fp64_sub (fp64_mul c2 c3) (fp64_mul (fp64_mul s1 s2) s3);
   fp64_mul (fp64_neg c1) s3;
   fp64_add (fp64_mul s2 c3) (fp64_mul (fp64_mul s1 c2) s3);
   fp64_add (fp64_mul c2 s3) (fp64_mul (fp64_mul s1 s2) c3);
   fp64_mul c1 c3;
   fp64_sub (fp64_mul s2 s3) (fp64_mul (fp64_mul s1 c2) c3);
   fp64_mul (fp64_neg c1) s2; s1; fp64_mul c1 c2].

Definition fa_angle2c321 (a1 a2 a3 : fp64) : list fp64 :=
  let s1 := ported_sin a1 in let c1 := ported_cos a1 in
  let s2 := ported_sin a2 in let c2 := ported_cos a2 in
  let s3 := ported_sin a3 in let c3 := ported_cos a3 in
  [fp64_mul c2 c3;
   fp64_sub (fp64_mul (fp64_mul s1 s2) c3) (fp64_mul c1 s3);
   fp64_add (fp64_mul (fp64_mul c1 s2) c3) (fp64_mul s1 s3);
   fp64_mul c2 s3;
   fp64_add (fp64_mul (fp64_mul s1 s2) s3) (fp64_mul c1 c3);
   fp64_sub (fp64_mul (fp64_mul c1 s2) s3) (fp64_mul s1 c3);
   fp64_neg s2; fp64_mul s1 c2; fp64_mul c1 c2].

Definition fa_angle2c (sv : Z) (a : list fp64) : list fp64 :=
  match a with
  | [a1; a2; a3] =>
      if sv =? 123 then fa_angle2c123 a1 a2 a3
      else if sv =? 132 then fa_angle2c132 a1 a2 a3
      else if sv =? 213 then fa_angle2c213 a1 a2 a3
      else if sv =? 231 then fa_angle2c231 a1 a2 a3
      else if sv =? 312 then fa_angle2c312 a1 a2 a3
      else fa_angle2c321 a1 a2 a3
  | _ => []
  end.

Definition fa_w2d_euler (sv : Z) (a w initial : list fp64) : list fp64 :=
  match a, w, initial with
  | [a1; a2; a3], [w0; w1; w2], [r0; r1; r2] =>
    let s1 := ported_sin a1 in let s2 := ported_sin a2 in
    let s3 := ported_sin a3 in let c1 := ported_cos a1 in
    let c2 := ported_cos a2 in let c3 := ported_cos a3 in
    if sv =? 132 then
      [fp64_div (fp64_add (fp64_mul c2 w0) (fp64_mul s2 w2)) c3;
       fp64_add w1 (fp64_div (fp64_mul (fp64_add (fp64_mul c2 w0) (fp64_mul s2 w2)) s3) c3);
       fp64_add (fp64_mul (fp64_neg s2) w0) (fp64_mul c2 w2)]
    else if sv =? 321 then
      [fp64_add w0 (fp64_div (fp64_mul (fp64_add (fp64_mul s1 w1) (fp64_mul c1 w2)) s2) c2);
       fp64_sub (fp64_mul c1 w1) (fp64_mul s1 w2);
       fp64_div (fp64_add (fp64_mul s1 w1) (fp64_mul c1 w2)) c2]
    else if sv =? 312 then
      [fp64_add (fp64_mul w0 c2) (fp64_mul w2 s2);
       fp64_add w1 (fp64_div (fp64_mul (fp64_sub (fp64_mul w0 s2) (fp64_mul w2 c2)) s1) c1);
       fp64_div (fp64_add (fp64_mul (fp64_neg w0) s2) (fp64_mul w2 c2)) c1]
    else if sv =? 213 then
      [fp64_sub (fp64_mul c3 w0) (fp64_mul s3 w1);
       fp64_div (fp64_add (fp64_mul s3 w0) (fp64_mul c3 w1)) c1;
       fp64_add w2 (fp64_div (fp64_mul (fp64_add (fp64_mul s3 w0) (fp64_mul c3 w1)) s1) c1)]
    else if sv =? 123 then
      [fp64_div (fp64_sub (fp64_mul c3 w0) (fp64_mul s3 w1)) c2;
       fp64_add (fp64_mul c3 w1) (fp64_mul s3 w0);
       fp64_sub w2 (fp64_div (fp64_mul (fp64_sub (fp64_mul c3 w0) (fp64_mul s3 w1)) s2) c2)]
    else if sv =? 231 then
      [fp64_sub w0 (fp64_div (fp64_mul (fp64_sub (fp64_mul c1 w1) (fp64_mul s1 w2)) s3) c3);
       fp64_div (fp64_sub (fp64_mul c1 w1) (fp64_mul s1 w2)) c3;
       fp64_add (fp64_mul c1 w2) (fp64_mul s1 w1)]
    else [r0; r1; r2]
  | _, _, _ => []
  end.

Definition fa_qmulti (p q : list fp64) : list fp64 :=
  match p, q with
  | [px; py; pz; pw], [qx; qy; qz; qw] =>
      [fp64_add (fp64_add (fp64_mul pw qx) (fp64_mul qw px))
                (fp64_sub (fp64_mul py qz) (fp64_mul pz qy));
       fp64_add (fp64_add (fp64_mul pw qy) (fp64_mul qw py))
                (fp64_sub (fp64_mul pz qx) (fp64_mul px qz));
       fp64_add (fp64_add (fp64_mul pw qz) (fp64_mul qw pz))
                (fp64_sub (fp64_mul px qy) (fp64_mul py qx));
       fp64_sub (fp64_mul pw qw)
                (fp64_add (fp64_add (fp64_mul px qx) (fp64_mul py qy))
                          (fp64_mul pz qz))]
  | _, _ => []
  end.

Definition fa_q2c (q : list fp64) : list fp64 :=
  match q with
  | [q1; q2; q3; q4] =>
    [fp64_sub ONE64 (fp64_mul TWO64 (fp64_add (fp64_mul q2 q2) (fp64_mul q3 q3)));
     fp64_mul TWO64 (fp64_sub (fp64_mul q1 q2) (fp64_mul q3 q4));
     fp64_mul TWO64 (fp64_add (fp64_mul q1 q3) (fp64_mul q2 q4));
     fp64_mul TWO64 (fp64_add (fp64_mul q1 q2) (fp64_mul q3 q4));
     fp64_sub ONE64 (fp64_mul TWO64 (fp64_add (fp64_mul q1 q1) (fp64_mul q3 q3)));
     fp64_mul TWO64 (fp64_sub (fp64_mul q2 q3) (fp64_mul q1 q4));
     fp64_mul TWO64 (fp64_sub (fp64_mul q1 q3) (fp64_mul q2 q4));
     fp64_mul TWO64 (fp64_add (fp64_mul q2 q3) (fp64_mul q1 q4));
     fp64_sub ONE64 (fp64_mul TWO64 (fp64_add (fp64_mul q1 q1) (fp64_mul q2 q2)))]
  | _ => []
  end.

Definition fa_c2q (m : list fp64) : list fp64 :=
  match m with
  | [m0; m1; m2; m3; m4; m5; m6; m7; m8] =>
    let tr := fp64_add (fp64_add m0 m4) m8 in
    if c_gt64 tr ZERO64 then
      let s := fp64_mul (fp64_sqrt (fp64_add tr ONE64)) TWO64 in
      [fp64_div (fp64_sub m7 m5) s; fp64_div (fp64_sub m2 m6) s;
       fp64_div (fp64_sub m3 m1) s; fp64_mul (f64 0x3FD0000000000000) s]
    else if c_gt64 m0 m4 && c_gt64 m0 m8 then
      let s := fp64_mul (fp64_sqrt (fp64_sub (fp64_sub (fp64_add ONE64 m0) m4) m8)) TWO64 in
      [fp64_mul (f64 0x3FD0000000000000) s; fp64_div (fp64_add m1 m3) s;
       fp64_div (fp64_add m2 m6) s; fp64_div (fp64_sub m7 m5) s]
    else if c_gt64 m4 m8 then
      let s := fp64_mul (fp64_sqrt (fp64_sub (fp64_sub (fp64_add ONE64 m4) m0) m8)) TWO64 in
      [fp64_div (fp64_add m1 m3) s; fp64_mul (f64 0x3FD0000000000000) s;
       fp64_div (fp64_add m5 m7) s; fp64_div (fp64_sub m2 m6) s]
    else
      let s := fp64_mul (fp64_sqrt (fp64_sub (fp64_sub (fp64_add ONE64 m8) m0) m4)) TWO64 in
      [fp64_div (fp64_add m2 m6) s; fp64_div (fp64_add m5 m7) s;
       fp64_mul (f64 0x3FD0000000000000) s; fp64_div (fp64_sub m3 m1) s]
  | _ => []
  end.
