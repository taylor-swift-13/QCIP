Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import FloatTest.lib.OrbiterNewCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition cdu_power_switch (xs : list Z) : bool :=
  if Z.eqb (nthz 0 xs) 0 then Z.eqb (nthz 1 xs) 1 && Z.eqb (nthz 7 xs) 0
  else if Z.eqb (nthz 0 xs) 1 then Z.eqb (nthz 2 xs) 1 && Z.eqb (nthz 8 xs) 0
  else Z.eqb (nthz 3 xs) 1 && Z.eqb (nthz 9 xs) 0.

Definition cdu_power_reset_value (xs : list Z) : Z :=
  if cdu_power_switch xs then 0 else nthz 14 xs.

Definition cduModulePowerDutyGet_fun (xs : list Z) : list Z :=
  let reset := cdu_power_reset_value xs in
  [nthz 4 xs; nthz 5 xs; nthz 6 xs;
   nthz 7 xs; nthz 8 xs; nthz 9 xs;
   nthz 1 xs; nthz 2 xs; nthz 3 xs;
   nthz 10 xs; nthz 11 xs; nthz 12 xs;
   if cdu_power_switch xs then 0 else nthz 13 xs;
   reset; reset; reset; reset; reset; reset; 9; 1].
