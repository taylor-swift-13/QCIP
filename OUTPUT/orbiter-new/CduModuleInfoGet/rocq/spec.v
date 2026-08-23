Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import FloatTest.lib.OrbiterNewCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition cdu_info_flag (xs : list Z) : Z :=
  u32 (Z.land (nthz 3 xs) 4294967288 + nthz 0 xs +
       2 * nthz 1 xs + 4 * nthz 2 xs).

Definition cdu_info_switch (xs : list Z) : bool :=
  if Z.eqb (cdu_info_flag xs) 0 then Z.eqb (nthz 4 xs) 1 && Z.eqb (nthz 10 xs) 0
  else if Z.eqb (cdu_info_flag xs) 1 then Z.eqb (nthz 5 xs) 1 && Z.eqb (nthz 11 xs) 0
  else Z.eqb (nthz 6 xs) 1 && Z.eqb (nthz 12 xs) 0.

Definition cdu_info_reset_value (xs : list Z) : Z :=
  if cdu_info_switch xs then 0 else nthz 17 xs.

Definition cduModuleInfoGet_fun (xs : list Z) : list Z :=
  let reset := cdu_info_reset_value xs in
  [cdu_info_flag xs;
   nthz 7 xs; nthz 8 xs; nthz 9 xs;
   nthz 10 xs; nthz 11 xs; nthz 12 xs;
   nthz 10 xs; nthz 11 xs; nthz 12 xs;
   nthz 13 xs; nthz 14 xs; nthz 15 xs;
   if cdu_info_switch xs then 0 else nthz 16 xs;
   reset; reset; reset; reset; reset; reset; 12; 1].
