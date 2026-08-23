Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
From Flocq.IEEE754 Require Import Bits.
Require Import FloatTest.lib.OrbiterNewCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition AV_ZERO := f64 0.
Definition av_nth (n : nat) (v : list fp64) : fp64 := nth n v AV_ZERO.

Definition av_cross (a b : list fp64) : list fp64 :=
  [fp64_sub (fp64_mul (av_nth 1 a) (av_nth 2 b))
            (fp64_mul (av_nth 2 a) (av_nth 1 b));
   fp64_sub (fp64_mul (av_nth 2 a) (av_nth 0 b))
            (fp64_mul (av_nth 0 a) (av_nth 2 b));
   fp64_sub (fp64_mul (av_nth 0 a) (av_nth 1 b))
            (fp64_mul (av_nth 1 a) (av_nth 0 b))].

Definition av_norm (a : list fp64) : fp64 :=
  fp64_sqrt
    (fp64_add
      (fp64_add (fp64_mul (av_nth 0 a) (av_nth 0 a))
                (fp64_mul (av_nth 1 a) (av_nth 1 a)))
      (fp64_mul (av_nth 2 a) (av_nth 2 a))).

Definition av_unit (a : list fp64) : list fp64 :=
  let norm := av_norm a in
  if c_eq64 norm AV_ZERO then a
  else [fp64_div (av_nth 0 a) norm; fp64_div (av_nth 1 a) norm;
        fp64_div (av_nth 2 a) norm].

Definition av_entry (i j : nat) (x1i x1b v2i v2b v3i v3b : list fp64) : Z :=
  bits_of_b64
    (fp64_add
      (fp64_add (fp64_mul (av_nth i x1b) (av_nth j x1i))
                (fp64_mul (av_nth i v2b) (av_nth j v2i)))
      (fp64_mul (av_nth i v3b) (av_nth j v3i))).

Definition avv_fun (xs : list Z) : list Z :=
  let x1i := [f64 (nthz 0 xs); f64 (nthz 1 xs); f64 (nthz 2 xs)] in
  let x2i := [f64 (nthz 3 xs); f64 (nthz 4 xs); f64 (nthz 5 xs)] in
  let x1b := [f64 (nthz 6 xs); f64 (nthz 7 xs); f64 (nthz 8 xs)] in
  let x2b := [f64 (nthz 9 xs); f64 (nthz 10 xs); f64 (nthz 11 xs)] in
  let v2i := av_unit (av_cross x1i x2i) in
  let v3i := av_cross x1i v2i in
  let v2b := av_unit (av_cross x1b x2b) in
  let v3b := av_cross x1b v2b in
  [av_entry 0 0 x1i x1b v2i v2b v3i v3b;
   av_entry 0 1 x1i x1b v2i v2b v3i v3b;
   av_entry 0 2 x1i x1b v2i v2b v3i v3b;
   av_entry 1 0 x1i x1b v2i v2b v3i v3b;
   av_entry 1 1 x1i x1b v2i v2b v3i v3b;
   av_entry 1 2 x1i x1b v2i v2b v3i v3b;
   av_entry 2 0 x1i x1b v2i v2b v3i v3b;
   av_entry 2 1 x1i x1b v2i v2b v3i v3b;
   av_entry 2 2 x1i x1b v2i v2b v3i v3b].
