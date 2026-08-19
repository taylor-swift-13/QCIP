Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

Import ListNotations.
Local Open Scope Z_scope.

(** Mathematical observation used by the recursive-list head accessor.
    This is intentionally the same total interface shape as
    [xizi_sll_first_value]: an empty abstract node sequence maps to NULL,
    while a nonempty sequence maps to its first node address. *)
Definition xizi_double_link_head_rec_value (nodes : list Z) : Z :=
  match nodes with
  | nil => 0
  | first :: _ => first
  end.
