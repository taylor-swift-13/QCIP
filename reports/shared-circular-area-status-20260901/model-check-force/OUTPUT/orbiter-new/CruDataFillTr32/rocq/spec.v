Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
Require Import FloatTest.lib.OrbiterNewCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition tr32_byte (base step i : Z) : Z := u8 (base + i * step).
Definition tr32_word (base step i : Z) : Z :=
  u32 (16777216 * tr32_byte base step (4 * i) +
       65536 * tr32_byte base step (4 * i + 1) +
       256 * tr32_byte base step (4 * i + 2) +
       tr32_byte base step (4 * i + 3)).

Fixpoint tr32_sum_aux (base step : Z) (i fuel : nat) : Z :=
  match fuel with
  | O => 0
  | S n => tr32_word base step (Z.of_nat i) + tr32_sum_aux base step (S i) n
  end.

Definition cruDataFillTr32_fun (xs : list Z) : list Z :=
  let b := nthz 0 xs in let s := nthz 1 xs in
  [128; 1; tr32_word b s 0; tr32_word b s 127; tr32_sum_aux b s O 128].
