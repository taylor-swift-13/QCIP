Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import FloatTest.lib.OrbiterNewCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition cru_pack_fly (xs : list Z) : bool := Z.eqb (nthz 0 xs) 1.
Definition cru_pack_tmp (xs : list Z) : Z :=
  if cru_pack_fly xs then
    if Z.eqb (nthz 1 xs) 3 then nthz 3 xs else
    if Z.eqb (nthz 1 xs) 4 then nthz 4 xs else
    if Z.eqb (nthz 1 xs) 5 then nthz 5 xs else
    if Z.eqb (nthz 1 xs) 6 then nthz 6 xs else
    if Z.eqb (nthz 1 xs) 7 then nthz 7 xs else
    if Z.eqb (nthz 1 xs) 8 then nthz 8 xs else 0
  else nthz 9 xs.

Definition cruPack_fun (xs : list Z) : list Z :=
  let header := if cru_pack_fly xs then 170 else 187 in
  [nthz 2 xs; cru_pack_tmp xs; u32 (nthz 11 xs); header;
   nthz 12 xs; nthz 13 xs; 255; 255;
   u8 (header + nthz 12 xs + nthz 13 xs + 444 * 255);
   1; 1; if cru_pack_fly xs then 208 else 41; 446; 1; 1; 447].
