Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

Import ListNotations.
Local Open Scope Z_scope.

(** Abstract observation of the first node; the sentinel-facing APIs use zero
    for the empty sequence. *)
Definition xizi_double_link_first_value (nodes : list Z) : Z :=
  match nodes with
  | nil => 0
  | first :: _ => first
  end.

(** Observable result of either empty-list predicate after initialization. *)
Definition xizi_double_link_call_empty_result (ret : Z) : Prop :=
  ret = 1.

(** Observable null pointer returned by head/next on the initialized list. *)
Definition xizi_double_link_call_null_result (ret : Z) : Prop :=
  ret = 0.

(** Observable length of the initialized list. *)
Definition xizi_double_link_call_len_result (ret : Z) : Prop :=
  ret = 0.

(** Abstract sequence produced by inserting one node after an empty sentinel. *)
Definition xizi_double_link_singleton_nodes (node : Z) : list Z :=
  cons node nil.
