Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import FloatTest.lib.OrbiterNewCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition auto_bit_width (kind : Z) : Z :=
  if (Z.leb 32769 kind && Z.leb kind 32775)%bool then kind - 32768 else 1.
Definition auto_bit_pos (xs : list Z) : Z :=
  if Z.eqb (nthz 1 xs) 1
  then 8 - auto_bit_width (nthz 0 xs) - nthz 3 xs
  else nthz 5 xs.
Definition auto_bit_dst (xs : list Z) : Z :=
  if Z.eqb (nthz 1 xs) 1 then nthz 2 xs else nthz 4 xs.

Definition auto_bit_value (xs : list Z) : Z :=
  let kind := nthz 0 xs in let width := auto_bit_width kind in
  if Z.eqb kind 32776 then 0
  else if Z.eqb kind 12800 then if Z.eqb (nthz 7 xs) (nthz 8 xs) then 1 else 0
  else if Z.eqb kind 2048 then if Z.eqb (u8 (nthz 7 xs)) (nthz 8 xs) then 1 else 0
  else Z.land (nthz 7 xs) (Z.ones width).

Definition auto_bit_result_byte (xs : list Z) : Z :=
  let width := auto_bit_width (nthz 0 xs) in let pos := auto_bit_pos xs in
  let mask := Z.shiftl (Z.ones width) pos in
  u8 (Z.lor (Z.land (nthz 6 xs) (Z.lnot mask))
             (Z.shiftl (auto_bit_value xs) pos)).

Definition auto_bit_cell (xs : list Z) (i : Z) : Z :=
  if Z.eqb i (auto_bit_dst xs) then auto_bit_result_byte xs else nthz 6 xs.

Definition autoPackBit_fun (xs : list Z) : list Z :=
  let first := Z.eqb (nthz 1 xs) 1 in
  let width := auto_bit_width (nthz 0 xs) in
  let total := nthz 3 xs + width in
  let pos := auto_bit_pos xs in
  [nthz 1 xs;
   if first then nthz 2 xs else nthz 4 xs;
   u32 (nthz 0 xs * 65536 + pos);
   if first then nthz 2 xs + (if Z.ltb 7 total then 1 else 0) else nthz 2 xs;
   if first then (if Z.ltb 7 total then total - 8 else total) else nthz 3 xs;
   auto_bit_cell xs 0; auto_bit_cell xs 1; auto_bit_cell xs 2;
   auto_bit_cell xs 3; auto_bit_cell xs 4; auto_bit_cell xs 5;
   auto_bit_cell xs 6; auto_bit_cell xs 7; auto_bit_cell xs 8;
   auto_bit_cell xs 9; auto_bit_cell xs 10; auto_bit_cell xs 11].
