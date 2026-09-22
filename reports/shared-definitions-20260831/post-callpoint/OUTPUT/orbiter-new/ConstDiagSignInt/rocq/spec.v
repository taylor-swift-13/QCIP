Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
Require Import FloatTest.lib.OrbiterNewCommon.

Import ListNotations.
Local Open Scope Z_scope.

Fixpoint prefix_equal (fuel : nat) (xs ys : list Z) : bool :=
  match fuel with
  | O => true
  | S fuel' =>
      match xs, ys with
      | x :: xs', y :: ys' => Z.eqb x y && prefix_equal fuel' xs' ys'
      | _, _ => false
      end
  end.

Definition constDiagSignInt_fun (xs : list Z) : list Z :=
  let cnt := nthz 0 xs in
  let max_count := nthz 1 xs in
  let size := Z.to_nat (nthz 2 xs) in
  let values := [nthz 3 xs; nthz 4 xs; nthz 5 xs; nthz 6 xs;
                 nthz 7 xs; nthz 8 xs; nthz 9 xs; nthz 10 xs] in
  let old_values := [nthz 11 xs; nthz 12 xs; nthz 13 xs; nthz 14 xs;
                     nthz 15 xs; nthz 16 xs; nthz 17 xs; nthz 18 xs] in
  let cnt' := if prefix_equal size values old_values then cnt + 1 else 0 in
  [cnt'; if max_count <? cnt' then 1 else 0].
