Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
From Flocq.IEEE754 Require Import Bits.
Require Import FloatTest.lib.OrbiterNewCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition F64_ZERO := f64 0.
Definition F64_ONE := f64 4607182418800017408.
Definition F64_TWO := f64 4611686018427387904.

Fixpoint chebyshev_loop (fuel index n : nat) (tao tn1 tn acc : fp64)
                         (coeffs : list fp64) : fp64 :=
  match fuel, coeffs with
  | O, _ | _, [] => acc
  | S fuel', c :: coeffs' =>
      if Nat.leb index n then
        let '(tn1', tn') :=
          match index with
          | O => (F64_ZERO, F64_ONE)
          | S O => (tn, tao)
          | _ => (tn, fp64_sub (fp64_mul (fp64_mul F64_TWO tao) tn) tn1)
          end in
        let acc' := fp64_add acc (fp64_mul c tn') in
        chebyshev_loop fuel' (S index) n tao tn1' tn' acc' coeffs'
      else acc
  end.

Definition chebyshev_fun (xs : list Z) : list Z :=
  let coeffs := [f64 (nthz 2 xs); f64 (nthz 3 xs); f64 (nthz 4 xs);
                 f64 (nthz 5 xs); f64 (nthz 6 xs); f64 (nthz 7 xs)] in
  [bits_of_b64 (chebyshev_loop 6 0 (Z.to_nat (nthz 0 xs))
                 (f64 (nthz 1 xs)) F64_ZERO F64_ZERO F64_ZERO coeffs)].
