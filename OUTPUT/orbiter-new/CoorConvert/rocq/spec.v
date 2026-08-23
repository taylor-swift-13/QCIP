Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
From Flocq.IEEE754 Require Import Bits.
Require Import FloatTest.lib.OrbiterNewCommon.
Require Import FloatTest.lib.FloatTrig.

Import ListNotations.
Local Open Scope Z_scope.

Definition coorConvert_fun (xs : list Z) : list Z :=
  let x := f64 (nthz 0 xs) in let y := f64 (nthz 1 xs) in
  let x0 := f64 (nthz 2 xs) in let y0 := f64 (nthz 3 xs) in
  let a := f64 (nthz 4 xs) in let b := f64 (nthz 5 xs) in
  let sin_a := ported_sin a in let cos_a := ported_cos a in
  let sin_b := ported_sin b in let cos_b := ported_cos b in
  let xt := fp64_sub (fp64_add (fp64_mul cos_a x) (fp64_mul sin_a y)) x0 in
  let yt := fp64_sub (fp64_add (fp64_mul (fp64_neg sin_a) x)
                                (fp64_mul cos_a y)) y0 in
  let out0 := fp64_add (fp64_mul cos_b xt) (fp64_mul sin_b yt) in
  let out1 := fp64_add (fp64_mul (fp64_neg sin_b) xt) (fp64_mul cos_b yt) in
  [bits_of_b64 out0; bits_of_b64 out1].
