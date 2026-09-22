Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
From Flocq.IEEE754 Require Import Bits.
Require Import FloatTest.lib.OrbiterNewCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition UQ_ONE := f64 4607182418800017408.
Definition UQ_LIMIT := f64 4607182328728024861.

Definition reconstruct_q4 (a b c : Z) : Z :=
  let aa := fp64_mul (f64 a) (f64 a) in
  let bb := fp64_mul (f64 b) (f64 b) in
  let cc := fp64_mul (f64 c) (f64 c) in
  let sum := fp64_add (fp64_add aa bb) cc in
  let bounded := if c_gt64 sum UQ_LIMIT then UQ_LIMIT else sum in
  bits_of_b64 (fp64_sqrt (fp64_sub UQ_ONE bounded)).

Definition cruDataFlyUnpackQ_fun (xs : list Z) : list Z :=
  [reconstruct_q4 (nthz 0 xs) (nthz 1 xs) (nthz 2 xs);
   reconstruct_q4 (nthz 3 xs) (nthz 4 xs) (nthz 5 xs);
   reconstruct_q4 (nthz 6 xs) (nthz 7 xs) (nthz 8 xs);
   reconstruct_q4 (nthz 9 xs) (nthz 10 xs) (nthz 11 xs)].
