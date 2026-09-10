Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

Import ListNotations.
Local Open Scope Z_scope.

(** The abstract head of a suffix.  The empty suffix corresponds to the
    circular sentinel, which the public C API reports as [NULL]. *)
Definition xizi_double_link_first_value (nodes : list Z) : Z :=
  match nodes with
  | nil => 0
  | next :: _ => next
  end.

(** Mathematical observation returned by the next-node API.  It searches
    the complete abstract sequence for the first occurrence of [node] and
    returns the following node, or [NULL] at the end (and when absent). *)
Fixpoint xizi_double_link_next_value
  (nodes : list Z) (node : Z) : Z :=
  match nodes with
  | nil => 0
  | current :: suffix =>
      if Z.eq_dec current node
      then xizi_double_link_first_value suffix
      else xizi_double_link_next_value suffix node
  end.

(** Publicly admissible query nodes: either an abstract member or the
    circular sentinel itself.  The predicate intentionally hides all
    implementation-level prefix/suffix cuts. *)
Definition xizi_double_link_next_anchor
  (head : Z) (nodes : list Z) (node : Z) : Prop :=
  In node nodes \/ node = head.

(** Complete public observation for the next-node API.  A sentinel query
    wraps to the abstract first node (or [NULL] for the empty sequence);
    a member query uses the ordinary sequence successor observation. *)
Definition xizi_double_link_next_dispatch_value
  (nodes : list Z) (head node : Z) : Z :=
  if Z.eq_dec node head
  then xizi_double_link_first_value nodes
  else xizi_double_link_next_value nodes node.
