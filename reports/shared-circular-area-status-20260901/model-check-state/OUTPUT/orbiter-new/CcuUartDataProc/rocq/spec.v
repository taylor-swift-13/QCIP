Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import FloatTest.lib.OrbiterNewCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition ccu_byte (xs : list Z) (i : Z) : Z := u8 (nthz 0 xs + i * nthz 1 xs).
Definition ccu_word32 (xs : list Z) (i : Z) : Z :=
  u32 (16777216 * ccu_byte xs i + 65536 * ccu_byte xs (i + 1) +
       256 * ccu_byte xs (i + 2) + ccu_byte xs (i + 3)).
Definition ccu_s32 (w : Z) : Z := if Z.leb 2147483648 w then w - 4294967296 else w.
Definition ccu_word64 (xs : list Z) (i : Z) : Z :=
  ccu_word32 xs i * 4294967296 + ccu_word32 xs (i + 4).
Definition ccu_ok (xs : list Z) : bool := Z.eqb (nthz 2 xs) 0.
Definition ccu_abnormal (xs : list Z) : Z :=
  if (Z.eqb (nthz 2 xs) 3 || Z.eqb (nthz 2 xs) 4)%bool then 51
  else if Z.eqb (nthz 2 xs) 2 then 255
  else if Z.eqb (nthz 2 xs) 1 then 17 else 0.
Definition ccu_valid_flag (xs : list Z) (bit : Z) : Z :=
  if Z.testbit (nthz 3 xs) bit then 1 else 0.
Definition ccu_parsed_s32 (xs : list Z) (i : Z) : Z :=
  if ccu_ok xs then ccu_s32 (ccu_word32 xs i) else nthz 4 xs.
Definition ccu_parsed_t (xs : list Z) (i : Z) : Z :=
  if ccu_ok xs then ccu_word64 xs i else nthz 5 xs.

Definition ccuUartDataProc_fun (xs : list Z) : list Z :=
  let valid := if ccu_ok xs then 1 else 0 in
  [valid; valid; ccu_abnormal xs;
   if ccu_ok xs then ccu_byte xs 14 else u32 (nthz 4 xs);
   if ccu_ok xs then ccu_byte xs 15 else u32 (nthz 4 xs);
   if ccu_ok xs then ccu_valid_flag xs 0 else u32 (nthz 4 xs);
   if ccu_ok xs then ccu_valid_flag xs 1 else u32 (nthz 4 xs);
   if ccu_ok xs then ccu_valid_flag xs 2 else u32 (nthz 4 xs);
   ccu_parsed_s32 xs 19; ccu_parsed_s32 xs 23;
   ccu_parsed_s32 xs 27; ccu_parsed_s32 xs 31;
   ccu_parsed_s32 xs 43; ccu_parsed_s32 xs 47;
   ccu_parsed_s32 xs 51; ccu_parsed_s32 xs 55;
   ccu_parsed_s32 xs 67; ccu_parsed_s32 xs 71;
   ccu_parsed_s32 xs 75; ccu_parsed_s32 xs 79;
   ccu_parsed_t xs 35; ccu_parsed_t xs 59; ccu_parsed_t xs 83].
