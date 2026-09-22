Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import FloatTest.lib.OrbiterNewCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition CMI_ONE : Z := 4607182418800017408.
Definition CMI_TWO : Z := 4611686018427387904.
Definition cmiCalculate_fun (xs : list Z) : list Z :=
  let tme := if Z.eqb (nthz 0 xs) 1 then nthz 1 xs else nthz 2 xs in
  let a := b64_div (b64_mul (nthz 3 xs) (b64_sub (nthz 1 xs) tme)) CMI_TWO in
  let q0 := nthz 4 xs in let q1 := nthz 5 xs in
  let q2 := b64_add (nthz 6 xs) a in
  let q3 := b64_add (nthz 7 xs) (b64_add a CMI_ONE) in
  [0; tme;
   q0;q1;q2;q3;q0;q1;q2;q3;q0;
   q0;q3;q2;q1;q0;q3;q2;q1;q0;
   q2;q3;q0; 1;1;1;1;1].
