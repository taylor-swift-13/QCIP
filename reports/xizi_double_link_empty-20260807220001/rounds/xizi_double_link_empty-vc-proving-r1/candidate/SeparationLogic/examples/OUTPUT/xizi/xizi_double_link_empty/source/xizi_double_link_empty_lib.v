Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

Import ListNotations.
Local Open Scope Z_scope.

(** [xizi_double_link_empty_result nodes result] is the pure API-level
    semantics of the emptiness query.  It is intentionally independent of
    the concrete DLL layout: ownership is carried separately by [xizi_dll]. *)
Definition xizi_double_link_empty_result
  (nodes : list Z) (result : Z) : Prop :=
  (nodes = nil /\ result = 1) \/
  (nodes <> nil /\ result = 0).
