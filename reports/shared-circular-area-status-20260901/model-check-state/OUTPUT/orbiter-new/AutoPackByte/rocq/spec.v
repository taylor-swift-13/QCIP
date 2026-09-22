Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import FloatTest.lib.OrbiterNewCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition auto_byte_width (t : Z) : Z :=
  if Z.eqb t 2 then 2 else if Z.eqb t 3 then 3 else
  if Z.eqb t 4 then 4 else if Z.eqb t 7 then 8 else 1.

Definition auto_byte_dst (xs : list Z) : Z :=
  if Z.eqb (nthz 1 xs) 1 then nthz 2 xs else nthz 4 xs.

Definition auto_byte_packed (t value rel width : Z) : Z :=
  if Z.eqb t 6 then 0 else u8 (Z.shiftr value (8 * (width - 1 - rel))).

Definition auto_byte_cell (xs : list Z) (i : Z) : Z :=
  let t := nthz 0 xs in let width := auto_byte_width t in
  let dst := auto_byte_dst xs in
  if (Z.leb dst i && Z.ltb i (dst + width))%bool
  then auto_byte_packed t (nthz 6 xs) (i - dst) width
  else nthz 5 xs.

Definition autoPackByte_fun (xs : list Z) : list Z :=
  let first := Z.eqb (nthz 1 xs) 1 in
  let width := auto_byte_width (nthz 0 xs) in
  [nthz 1 xs;
   if first then nthz 2 xs else nthz 4 xs;
   if first then nthz 2 xs + width else nthz 2 xs;
   nthz 3 xs;
   auto_byte_cell xs 0; auto_byte_cell xs 1; auto_byte_cell xs 2;
   auto_byte_cell xs 3; auto_byte_cell xs 4; auto_byte_cell xs 5;
   auto_byte_cell xs 6; auto_byte_cell xs 7; auto_byte_cell xs 8;
   auto_byte_cell xs 9; auto_byte_cell xs 10; auto_byte_cell xs 11;
   auto_byte_cell xs 12; auto_byte_cell xs 13; auto_byte_cell xs 14;
   auto_byte_cell xs 15].
