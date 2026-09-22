Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import FloatTest.lib.OrbiterNewCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition attProcWalk_fun (xs : list Z) : list Z :=
  let raw_y := b64_add (nthz 2 xs) (nthz 3 xs) in
  let y := if Z.eqb (nthz 4 xs) 1 then 0 else raw_y in
  let r := if Z.eqb (nthz 4 xs) 1 then 0 else nthz 0 xs in
  let p := if Z.eqb (nthz 4 xs) 1 then 0 else nthz 1 xs in
  let tele_y := b64_add y (b64_neg (nthz 3 xs)) in
  let base := b64_add (b64_mul (nthz 0 xs) (nthz 0 xs))
                        (b64_mul (nthz 1 xs) (nthz 1 xs)) in
  [y; r; p; y; r; p; tele_y; r; p; base; 1; 2; 2; 1; 1; 1].
