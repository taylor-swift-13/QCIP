Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
Require Import FloatTest.lib.OrbiterNewCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition cru1553_byte (base step i : Z) : Z := u8 (base + i * step).
Definition cru1553_word (base step i : Z) : Z :=
  u16 (256 * cru1553_byte base step i + cru1553_byte base step (i + 1)).

Definition cruDataFill1553B_fun (xs : list Z) : list Z :=
  let b := nthz 0 xs in let s := nthz 1 xs in
  [8; 8; 1; 1;
   cru1553_word b s 0; cru1553_word b s 64;
   cru1553_word b s 128; cru1553_word b s 192;
   cru1553_word b s 256; cru1553_word b s 320;
   cru1553_word b s 384; cru1553_word b s 448;
   cru1553_word b s 62; cru1553_word b s 126;
   cru1553_word b s 190; cru1553_word b s 254;
   cru1553_word b s 318; cru1553_word b s 382;
   cru1553_word b s 446; cru1553_word b s 510].
