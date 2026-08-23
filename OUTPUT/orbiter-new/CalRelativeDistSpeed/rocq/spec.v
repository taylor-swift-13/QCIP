Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From Flocq.IEEE754 Require Import Bits.
Require Import FloatTest.lib.OrbiterNewCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition cr_at (base axis leg : nat) (xs : list Z) : fp64 :=
  f64 (nthz (base + axis * 6 + leg) xs).

Definition cr_metric (base i j : nat) (xs : list Z) : Z :=
  let d0 := fp64_sub (cr_at base 0 i xs) (cr_at base 0 j xs) in
  let d1 := fp64_sub (cr_at base 1 i xs) (cr_at base 1 j xs) in
  let d2 := fp64_sub (cr_at base 2 i xs) (cr_at base 2 j xs) in
  bits_of_b64
    (fp64_sqrt
      (fp64_add (fp64_add (fp64_mul d0 d0) (fp64_mul d1 d1))
                (fp64_mul d2 d2))).

Definition cr_touch (i j : nat) (xs : list Z) : Z :=
  if (nthz (36 + i) xs =? 1) && (nthz (36 + j) xs =? 1) then 1 else 0.

Definition cr_metrics (base : nat) (xs : list Z) : list Z :=
  [cr_metric base 0 1 xs; cr_metric base 0 2 xs; cr_metric base 0 3 xs;
   cr_metric base 0 4 xs; cr_metric base 0 5 xs; cr_metric base 1 2 xs;
   cr_metric base 1 3 xs; cr_metric base 1 4 xs; cr_metric base 1 5 xs;
   cr_metric base 2 3 xs; cr_metric base 2 4 xs; cr_metric base 2 5 xs;
   cr_metric base 3 4 xs; cr_metric base 3 5 xs; cr_metric base 4 5 xs].

Definition cr_touches (xs : list Z) : list Z :=
  [cr_touch 0 1 xs; cr_touch 0 2 xs; cr_touch 0 3 xs; cr_touch 0 4 xs;
   cr_touch 0 5 xs; cr_touch 1 2 xs; cr_touch 1 3 xs; cr_touch 1 4 xs;
   cr_touch 1 5 xs; cr_touch 2 3 xs; cr_touch 2 4 xs; cr_touch 2 5 xs;
   cr_touch 3 4 xs; cr_touch 3 5 xs; cr_touch 4 5 xs].

Definition calRelativeDistSpeed_fun (xs : list Z) : list Z :=
  cr_metrics 0 xs ++ cr_metrics 18 xs ++ cr_touches xs.
