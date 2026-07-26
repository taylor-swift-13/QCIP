(* CS_PrecessionNutationCal 的非法 qJD 回退路径 binary64 spec。 *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition c64_abs (x : fp64) : fp64 :=
  if c64_lt x (f64 0) then fp64_neg x else x.

Definition qjd_invalid (q0 q1 q2 : fp64) : bool :=
  negb
    (c64_lt (c64_abs q0) (f64 4587366580439587226) &&
     c64_lt (c64_abs q1) (f64 4587366580439587226) &&
     c64_lt (c64_abs q2) (f64 4587366580439587226))%bool.

Definition identity33_bits : list Z :=
  [4607182418800017408; 0; 0;
   0; 4607182418800017408; 0;
   0; 0; 4607182418800017408].

Definition precession_invalid_qjd_fun (q0 q1 q2 : fp64)
  : Z * list Z :=
  if qjd_invalid q0 q1 q2 then (1, identity33_bits)
  else (0, []).
