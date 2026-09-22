(* ThreeAxisController 的 fp32 功能 spec。
 * 输入为 pAngle[3]、pRate[3]、destRate[3]、Kp[3]、Kd[3]；
 * 输出依次为 Up[3]、Ud[3]、fy[3]、u[3]，均保留 fp32 值。
 *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition c_8    : fp32 := f32 (0x41000000).
Definition c_1p2  : fp32 := f32 (0x3F99999A).
Definition c_1p3  : fp32 := f32 (0x3FA66666).

Definition limit_f (x b : fp32) : fp32 :=
  if c_gt x b then b
  else if c_lt x (fp32_neg b) then fp32_neg b
  else x.

Definition threeAxisController_fun
    (a0 a1 a2 r0 r1 r2 d0 d1 d2 kp0 kp1 kp2 kd0 kd1 kd2 : fp32)
  : list Z * list Z * list Z * list Z :=
  let up0 := limit_f a0 c_8 in
  let up1 := limit_f a1 c_8 in
  let up2 := f32 0 in
  let ud0 := limit_f (fp32_sub r0 d0) c_1p2 in
  let ud1 := limit_f (fp32_sub r1 d1) c_1p2 in
  let ud2 := limit_f r2 c_1p2 in
  let fy0 := fp32_add (fp32_mul up0 kp0) (fp32_mul ud0 kd0) in
  let fy1 := fp32_add (fp32_mul up1 kp1) (fp32_mul ud1 kd1) in
  let fy2 := fp32_mul ud2 kd2 in
  let u0 := limit_f fy0 c_1p3 in
  let u1 := limit_f fy1 c_1p3 in
  let u2 := limit_f fy2 c_1p3 in
  ([bits_of_b32 up0; bits_of_b32 up1; bits_of_b32 up2],
   [bits_of_b32 ud0; bits_of_b32 ud1; bits_of_b32 ud2],
   [bits_of_b32 fy0; bits_of_b32 fy1; bits_of_b32 fy2],
   [bits_of_b32 u0; bits_of_b32 u1; bits_of_b32 u2]).
