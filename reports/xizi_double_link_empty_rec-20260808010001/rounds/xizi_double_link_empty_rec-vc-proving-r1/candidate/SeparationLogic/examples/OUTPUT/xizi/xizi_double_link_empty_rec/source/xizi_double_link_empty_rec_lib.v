Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

Import ListNotations.
Local Open Scope Z_scope.

(** Pure, reusable semantics of the recursive DLL emptiness query.
    The concrete ownership/shape is deliberately kept in [xizi_dll] at the
    C-spec boundary, so callers can use this relation without unfolding the
    sentinel representation. *)
Definition xizi_double_link_empty_rec_result
  (nodes : list Z) (result : Z) : Prop :=
  (nodes = nil /\ result = 1) \/
  (nodes <> nil /\ result = 0).
