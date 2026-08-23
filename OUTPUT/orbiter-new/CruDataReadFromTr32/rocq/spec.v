Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
Require Import FloatTest.lib.OrbiterNewCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition tr32_read_word (base step : Z) (i : nat) : Z :=
  u32 (base + Z.of_nat i * step).
Definition tr32_b0 (w : Z) : Z := u8 (Z.shiftr w 24).
Definition tr32_b1 (w : Z) : Z := u8 (Z.shiftr w 16).
Definition tr32_b2 (w : Z) : Z := u8 (Z.shiftr w 8).
Definition tr32_b3 (w : Z) : Z := u8 w.
Definition tr32_byte_sum (w : Z) : Z :=
  tr32_b0 w + tr32_b1 w + tr32_b2 w + tr32_b3 w.

Fixpoint tr32_read_sum_aux (base step : Z) (i fuel : nat) : Z :=
  match fuel with
  | O => 0
  | S n => tr32_byte_sum (tr32_read_word base step i) +
           tr32_read_sum_aux base step (S i) n
  end.

Definition cruDataReadFromTr32_fun (xs : list Z) : list Z :=
  let b := nthz 0 xs in let s := nthz 1 xs in
  let first := tr32_read_word b s O in let last := tr32_read_word b s 127 in
  [128; 1;
   tr32_b0 first; tr32_b1 first; tr32_b2 first; tr32_b3 first;
   tr32_b0 last; tr32_b1 last; tr32_b2 last; tr32_b3 last;
   tr32_read_sum_aux b s O 128].
