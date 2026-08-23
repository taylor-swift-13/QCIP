Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import FloatTest.lib.OrbiterNewCommon.

Import ListNotations.
Local Open Scope Z_scope.

Fixpoint dispatch_bit_count (n : nat) (pattern : Z) : Z :=
  match n with
  | O => 0
  | S k => (if Z.testbit pattern 0 then 1 else 0) +
           dispatch_bit_count k (Z.shiftr pattern 1)
  end.
Fixpoint dispatch_sequence (n : nat) (pattern : Z) : Z :=
  match n with
  | O => 0
  | S k => (if Z.testbit pattern 0 then 1 else 2) +
           3 * dispatch_sequence k (Z.shiftr pattern 1)
  end.

Definition autuPackDataflow_fun (xs : list Z) : list Z :=
  let nz := Z.min (nthz 1 xs) (nthz 2 xs) in
  let n := Z.to_nat nz in let bits := dispatch_bit_count n (nthz 3 xs) in
  [0;
   if Z.eqb (nthz 0 xs) 1 then 0 else nthz 4 xs;
   if Z.eqb (nthz 0 xs) 1 then 0 else nthz 5 xs;
   bits; nz - bits; nz; dispatch_sequence n (nthz 3 xs); 1; 1].
