Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
From Flocq.IEEE754 Require Import Bits.
Require Import FloatTest.lib.OrbiterNewCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition CT_ZERO := f64 0.
Definition CT_HALF := f64 4602678819172646912.
Definition CT_TWO := f64 4611686018427387904.
Definition CT_SIX := f64 4618441417868443648.
Definition ct_nth (n : nat) (xs : list fp64) := nth n xs CT_ZERO.

Definition ct_n_as_fp (n : Z) : fp64 :=
  match n with
  | 1 => f64 4607182418800017408
  | 2 => f64 4611686018427387904
  | 3 => f64 4613937818241073152
  | _ => f64 4616189618054758400
  end.

Definition ct_dyn (x g : list fp64) : list fp64 :=
  [ct_nth 3 x; ct_nth 4 x; ct_nth 5 x;
   ct_nth 0 g; ct_nth 1 g; ct_nth 2 g].

Definition ct_scale (x : list fp64) (k : fp64) : list fp64 :=
  [fp64_mul (ct_nth 0 x) k; fp64_mul (ct_nth 1 x) k;
   fp64_mul (ct_nth 2 x) k; fp64_mul (ct_nth 3 x) k;
   fp64_mul (ct_nth 4 x) k; fp64_mul (ct_nth 5 x) k].

Definition ct_addcoef (x k : list fp64) (coef : fp64) : list fp64 :=
  [fp64_add (ct_nth 0 x) (fp64_mul coef (ct_nth 0 k));
   fp64_add (ct_nth 1 x) (fp64_mul coef (ct_nth 1 k));
   fp64_add (ct_nth 2 x) (fp64_mul coef (ct_nth 2 k));
   fp64_add (ct_nth 3 x) (fp64_mul coef (ct_nth 3 k));
   fp64_add (ct_nth 4 x) (fp64_mul coef (ct_nth 4 k));
   fp64_add (ct_nth 5 x) (fp64_mul coef (ct_nth 5 k))].

Definition ct_add (x k : list fp64) : list fp64 := ct_addcoef x k (f64 4607182418800017408).

Definition ct_weighted (x k1 k2 k3 k4 : list fp64) : list fp64 :=
  let term (i : nat) :=
    fp64_div
      (fp64_add
        (fp64_add
          (fp64_add (ct_nth i k1) (fp64_mul CT_TWO (ct_nth i k2)))
          (fp64_mul CT_TWO (ct_nth i k3)))
        (ct_nth i k4)) CT_SIX in
  [fp64_add (ct_nth 0 x) (term 0%nat); fp64_add (ct_nth 1 x) (term 1%nat);
   fp64_add (ct_nth 2 x) (term 2%nat); fp64_add (ct_nth 3 x) (term 3%nat);
   fp64_add (ct_nth 4 x) (term 4%nat); fp64_add (ct_nth 5 x) (term 5%nat)].

Definition ct_step (x g : list fp64) (h : fp64) : list fp64 * list fp64 :=
  let k1 := ct_scale (ct_dyn x g) h in
  let x2 := ct_addcoef x k1 CT_HALF in
  let k2 := ct_scale (ct_dyn x2 g) h in
  let x3 := ct_addcoef x k2 CT_HALF in
  let k3 := ct_scale (ct_dyn x3 g) h in
  let x4 := ct_add x k3 in
  let k4 := ct_scale (ct_dyn x4 g) h in
  (ct_weighted x k1 k2 k3 k4,
   [ct_nth 0 x4; ct_nth 1 x4; ct_nth 2 x4]).

Fixpoint ct_iter (fuel : nat) (x g : list fp64) (h : fp64)
  : list fp64 * list fp64 :=
  match fuel with
  | O => (x, [ct_nth 0 x; ct_nth 1 x; ct_nth 2 x])
  | S fuel' =>
      let '(x', last_r) := ct_step x g h in
      match fuel' with
      | O => (x', last_r)
      | _ => ct_iter fuel' x' g h
      end
  end.

Definition coastingTrajectory_fun (xs : list Z) : list Z :=
  let n := nthz 7 xs in
  let x := [f64 (nthz 0 xs); f64 (nthz 1 xs); f64 (nthz 2 xs);
            f64 (nthz 3 xs); f64 (nthz 4 xs); f64 (nthz 5 xs)] in
  let g := [f64 (nthz 8 xs); f64 (nthz 9 xs); f64 (nthz 10 xs)] in
  let h := fp64_div (f64 (nthz 6 xs)) (ct_n_as_fp n) in
  let '(out, last_r) := ct_iter (Z.to_nat n) x g h in
  [bits_of_b64 (ct_nth 0 out); bits_of_b64 (ct_nth 1 out);
   bits_of_b64 (ct_nth 2 out); bits_of_b64 (ct_nth 3 out);
   bits_of_b64 (ct_nth 4 out); bits_of_b64 (ct_nth 5 out);
   4 * n;
   bits_of_b64 (ct_nth 0 last_r); bits_of_b64 (ct_nth 1 last_r);
   bits_of_b64 (ct_nth 2 last_r)].
