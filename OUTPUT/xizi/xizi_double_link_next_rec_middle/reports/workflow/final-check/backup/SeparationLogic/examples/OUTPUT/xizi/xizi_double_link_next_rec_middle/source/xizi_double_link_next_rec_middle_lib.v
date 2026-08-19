Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

Import ListNotations.
Local Open Scope Z_scope.

(** Mathematical observation implemented by the C accessor: the successor of
    the selected node is the first address in the suffix, or [NULL] when the
    selected node is the last element before the sentinel.  This is a property
    of the abstract sequence decomposition, not an encoding of the C control
    flow. *)
Definition xizi_double_link_next_value (nodes_after : list Z) : Z :=
  match nodes_after with
  | nil => 0
  | next :: _ => next
  end.
