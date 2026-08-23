Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import FloatTest.lib.OrbiterNewCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition set_bit0 (word bit : Z) : Z :=
  Z.lor (Z.land word 4294967294) bit.

Definition attDeterWalkMode_fun (xs : list Z) : list Z :=
  let task_number := nthz 0 xs in
  let static_mode := nthz 1 xs in
  let att_valid := nthz 2 xs in
  let angle_case := nthz 3 xs in
  let gyr_inv := nthz 4 xs in
  let acc_inv := nthz 5 xs in
  let initial_task := nthz 6 xs in
  let initial_tilt := nthz 7 xs in
  let active := (1 <=? task_number) && (task_number <=? 8) in
  let above := (Z.eqb angle_case 1) || (Z.eqb angle_case 2) in
  let result :=
    if active then
      if Z.eqb static_mode 1 then
        if (Z.eqb att_valid 1) && above
        then (62, set_bit0 initial_tilt 1)
        else (initial_task, set_bit0 initial_tilt 0)
      else
        let tilt_task := if above then 62 else initial_task in
        let tilt_word := if above then set_bit0 initial_tilt 1 else initial_tilt in
        let final_task := if (2 <? gyr_inv) || (2 <? acc_inv) then 35 else tilt_task in
        (final_task, tilt_word)
    else (initial_task, initial_tilt) in
  let '(final_task, final_tilt) := result in
  let active_count := if active then 1 else 0 in
  let sts_count := if Z.eqb task_number 1 then 1 else 0 in
  let trace := if Z.eqb task_number 1 then 1234 else if active then 123 else 0 in
  [final_task; final_tilt; active_count; active_count; active_count; sts_count; trace].
