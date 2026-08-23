Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import FloatTest.lib.OrbiterNewCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition av_trigger1 (xs : list Z) : bool :=
  Z.testbit (nthz 0 xs) 0 && Z.eqb (nthz 2 xs) 1 && Z.eqb (nthz 3 xs) 0.
Definition av_trigger2 (xs : list Z) : bool :=
  Z.testbit (nthz 0 xs) 1 && Z.eqb (nthz 2 xs) 0 &&
  Z.testbit (nthz 1 xs) 0 && Z.eqb (nthz 3 xs) 1.
Definition av_trigger3 (xs : list Z) : bool :=
  Z.testbit (nthz 0 xs) 2 && Z.eqb (nthz 2 xs) 0 &&
  Z.testbit (nthz 1 xs) 1 && Z.eqb (nthz 3 xs) 0.
Definition av_final_flag (xs : list Z) : Z :=
  if av_trigger3 xs then 2 else if (av_trigger1 xs || av_trigger2 xs)%bool then 1 else nthz 4 xs.

Definition avoidanceCalc_fun (xs : list Z) : list Z :=
  let flag := av_final_flag xs in
  let changed := negb (Z.eqb flag 0) && negb (Z.eqb flag (nthz 5 xs)) in
  [flag; flag;
   if changed then 255 else nthz 6 xs;
   if changed then 0 else nthz 7 xs;
   nthz 8 xs; 99; 0].
