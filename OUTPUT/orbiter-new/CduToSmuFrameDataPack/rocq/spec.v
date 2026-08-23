Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import FloatTest.lib.OrbiterNewCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition dec8 (x : Z) : Z := if Z.ltb 0 x then x - 1 else x.
Definition haz_byte (xs : list Z) (i : Z) : Z := u8 (nthz 11 xs + i * nthz 12 xs).
Definition wifi_valid (xs : list Z) : bool :=
  negb (Z.eqb (u8 (nthz 1 xs)) 170) &&
  (Z.eqb (Z.land (nthz 2 xs) 3) 1 || Z.eqb (Z.land (nthz 2 xs) 3) 2) &&
  negb (Z.eqb (nthz 3 xs) 1).
Definition frame_valid1 (xs : list Z) : Z :=
  128 + (if wifi_valid xs then 64 else 0) +
  (if Z.ltb 0 (nthz 13 xs) then 32 else 0) +
  (if Z.ltb 0 (nthz 14 xs) then 16 else 0) +
  (if Z.ltb 0 (nthz 15 xs) then 8 else 0) + 4 +
  (if Z.even (nthz 7 xs) then 2 else 0) +
  (if Z.ltb 0 (nthz 16 xs) then 1 else 0).
Definition frame_valid2 (xs : list Z) : Z :=
  (if Z.ltb 0 (nthz 17 xs) then 128 else 0) +
  (if Z.ltb 0 (nthz 18 xs) then 64 else 0) + 32 + 16 +
  (if Z.ltb 0 (nthz 19 xs) then 4 else 0).
Definition obstacle_even (xs : list Z) : bool := Z.even (nthz 19 xs).
Definition obstacle_at (xs : list Z) (pos : Z) : Z :=
  if obstacle_even xs then
    if Z.eqb pos 34 then u8 (nthz 10 xs) else haz_byte xs (pos - 35)
  else if Z.leb pos 855 then haz_byte xs (978 + pos - 34) else 170.

Definition cduToSmuFrameDataPack_fun (xs : list Z) : list Z :=
  [frame_valid1 xs; frame_valid2 xs;
   if Z.eqb (u8 (nthz 1 xs)) 170 then 1 else nthz 3 xs;
   dec8 (nthz 13 xs); dec8 (nthz 14 xs); dec8 (nthz 15 xs);
   dec8 (nthz 16 xs); dec8 (nthz 17 xs); dec8 (nthz 18 xs); dec8 (nthz 19 xs);
   u8 (Z.land (nthz 0 xs) 15 + Z.shiftl (Z.land (nthz 2 xs) 3) 4 +
       Z.shiftl (Z.land (nthz 4 xs) 3) 6);
   u8 (nthz 5 xs); u8 (nthz 6 xs);
   0; 0; 0; 0; 0; 0; u8 (nthz 8 xs); u8 (nthz 9 xs); 0; 0;
   if obstacle_even xs then 1 else 2;
   obstacle_at xs 34; obstacle_at xs 35; obstacle_at xs 855;
   obstacle_at xs 856; obstacle_at xs 1012].
