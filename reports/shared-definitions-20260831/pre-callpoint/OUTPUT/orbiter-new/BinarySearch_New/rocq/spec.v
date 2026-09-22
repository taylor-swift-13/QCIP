Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
Require Import FloatTest.lib.OrbiterNewCommon.

Import ListNotations.
Local Open Scope Z_scope.

Fixpoint binary_search_fuel (fuel : nat) (id lo hi : Z) (table : list Z) : Z :=
  match fuel with
  | O => -1
  | S fuel' =>
      if lo <=? hi then
        let mid := (lo + hi) / 2 in
        let candidate := nth (Z.to_nat mid) table 0 in
        if candidate <? id then binary_search_fuel fuel' id (mid + 1) hi table
        else if candidate >? id then binary_search_fuel fuel' id lo (mid - 1) table
        else mid
      else -1
  end.

Definition binarySearch_New_fun (xs : list Z) : list Z :=
  let table := [nthz 1 xs; nthz 2 xs; nthz 3 xs; nthz 4 xs;
                nthz 5 xs; nthz 6 xs; nthz 7 xs; nthz 8 xs] in
  [binary_search_fuel 9 (nthz 0 xs) (nthz 9 xs) (nthz 10 xs) table].
