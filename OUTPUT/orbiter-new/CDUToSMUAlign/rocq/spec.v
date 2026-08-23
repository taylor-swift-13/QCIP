Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
Require Import FloatTest.lib.OrbiterNewCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition choose_flag (flag new old : Z) : Z := if flag =? 1 then new else old.
Definition cleared_flag (_flag : Z) : Z := 0.
Definition refreshed_counter (flag old : Z) : Z := if flag =? 1 then 8 else old.

Definition cduToSmuAlign_fun (xs : list Z) : list Z :=
  let f_safe := nthz 8 xs in
  let f_path := nthz 9 xs in
  let f_move := nthz 10 xs in
  let f_slope1 := nthz 11 xs in
  let f_slope2 := nthz 12 xs in
  let f_motion := nthz 13 xs in
  [nthz 0 xs;
   choose_flag f_safe (nthz 1 xs) (nthz 15 xs);
   choose_flag f_path (nthz 2 xs) (nthz 16 xs);
   choose_flag f_move (nthz 3 xs) (nthz 17 xs);
   choose_flag f_slope1 (nthz 4 xs) (nthz 18 xs);
   choose_flag f_slope2 (nthz 5 xs) (nthz 19 xs);
   choose_flag f_motion (nthz 6 xs) (nthz 20 xs);
   choose_flag f_motion (nthz 7 xs) (nthz 21 xs);
   cleared_flag f_safe; cleared_flag f_path; cleared_flag f_move;
   cleared_flag f_slope1; cleared_flag f_slope2; cleared_flag f_motion;
   refreshed_counter f_safe (nthz 22 xs);
   refreshed_counter f_path (nthz 23 xs);
   refreshed_counter f_move (nthz 24 xs);
   refreshed_counter f_slope1 (nthz 25 xs);
   refreshed_counter f_slope2 (nthz 26 xs);
   refreshed_counter f_motion (nthz 27 xs)].
