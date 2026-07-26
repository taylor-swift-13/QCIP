(* CS_Gyro_Att_Predict 的非法序列路径 binary64 spec。 *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition gyro_limit (x bound : fp64) : fp64 :=
  if c64_gt x bound then bound
  else if c64_lt x (fp64_neg bound) then fp64_neg bound
  else x.

Definition gyro_rate
    (delta d0 de dt bound : fp64) : fp64 :=
  gyro_limit
    (fp64_sub
       (fp64_div delta dt)
       (fp64_div (fp64_add d0 de) (f64 4660134898793709568)))
    bound.

Definition gyroPredict_invalid_sequence_fun
    (dg0 dg1 dg2 d00 d01 d02 de0 de1 de2
     wo0 wo1 wo2 dt bound : fp64)
  : list Z * list Z * list Z * list Z * list Z :=
  let w0 := gyro_rate dg0 d00 de0 dt bound in
  let w1 := gyro_rate dg1 d01 de1 dt bound in
  let w2 := gyro_rate dg2 d02 de2 dt bound in
  ([bits_of_b64 w0; bits_of_b64 w1; bits_of_b64 w2],
   [bits_of_b64 (fp64_sub w0 wo0);
    bits_of_b64 (fp64_sub w1 wo1);
    bits_of_b64 (fp64_sub w2 wo2)],
   [0; 0; 0],
   [0; 0; 0],
   [4607182418800017408; 0; 0;
    0; 4607182418800017408; 0;
    0; 0; 4607182418800017408]).
