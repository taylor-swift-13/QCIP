Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

Import ListNotations.
Local Open Scope Z_scope.

(** Mathematical observation returned by [xizi_double_link_next].

    [nodes_after] is the abstract suffix strictly after the queried node in
    the circular sentinel list.  A nonempty suffix exposes its first node;
    an empty suffix means that the concrete next link reaches the sentinel,
    which the C API reports as [NONE] / [NULL].  This is deliberately an
    observation of the abstract sequence, not a model of the C control flow. *)
Definition xizi_double_link_next_value (nodes_after : list Z) : Z :=
  match nodes_after with
  | nil => 0
  | next :: _ => next
  end.
