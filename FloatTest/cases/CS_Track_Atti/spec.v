(* CS_Track_Atti 的零姿态/速率转换、单位惯量路径 binary64 spec。 *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition track_axis
    (last_rate current_w last_w dt factor : fp64) : fp64 * fp64 :=
  let acceleration := fp64_div (fp64_sub (f64 0) last_rate) dt in
  let angular_acceleration := fp64_div (fp64_sub current_w last_w) dt in
  (acceleration, fp64_mul factor angular_acceleration).

Definition trackAttitude_zero_conversion_fun
    (lr0 lr1 lr2 w0 w1 w2 lw0 lw1 lw2 dt factor : fp64)
  : list Z * list Z * list Z * list Z * list Z :=
  let '(dd0, tq0) := track_axis lr0 w0 lw0 dt factor in
  let '(dd1, tq1) := track_axis lr1 w1 lw1 dt factor in
  let '(dd2, tq2) := track_axis lr2 w2 lw2 dt factor in
  ([bits_of_b64 dd0; bits_of_b64 dd1; bits_of_b64 dd2],
   [bits_of_b64 tq0; bits_of_b64 tq1; bits_of_b64 tq2],
   [0; 0; 0],
   [0; 0; 0],
   [bits_of_b64 w0; bits_of_b64 w1; bits_of_b64 w2]).
