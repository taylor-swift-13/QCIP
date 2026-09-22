Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

Import ListNotations.
Local Open Scope Z_scope.

(** A valid public query targets either an abstract member or the sentinel.
    The sentinel remains outside the abstract node sequence. *)
Definition xizi_double_link_next_anchor
  (head : Z) (nodes : list Z) (node : Z) : Prop :=
  In node nodes \/ node = head.

(** The abstract head of a suffix.  The empty suffix corresponds to the
    circular sentinel, which the public C API reports as [NONE] / [NULL]. *)
Definition xizi_double_link_first_value (nodes : list Z) : Z :=
  match nodes with
  | nil => 0
  | next :: _ => next
  end.

(** Mathematical observation returned by [xizi_double_link_next].

    The definition searches the complete abstract node sequence for the
    queried node and returns the following abstract node.  If the queried
    node is last, or is absent, the result is [NULL].  It describes only the
    sequence-level API result and does not mirror the circular C control
    flow. *)
Fixpoint xizi_double_link_next_value
  (nodes : list Z) (node : Z) : Z :=
  match nodes with
  | nil => 0
  | current :: suffix =>
      if Z.eq_dec current node
      then xizi_double_link_first_value suffix
      else xizi_double_link_next_value suffix node
  end.

(** Unified list-level result for the public dispatch specification.  A
    sentinel query observes the abstract first node, while a member query
    observes its successor in the complete abstract sequence. *)
Definition xizi_double_link_next_dispatch_value
  (head : Z) (nodes : list Z) (node : Z) : Z :=
  if Z.eq_dec node head
  then xizi_double_link_first_value nodes
  else xizi_double_link_next_value nodes node.

Lemma xizi_double_link_next_value_first_occurrence__next_dispatch_split_reassemble_and_derive :
  forall (before : list Z) (node : Z) (after : list Z),
    ~ In node before ->
    xizi_double_link_next_value (before ++ node :: after) node =
      xizi_double_link_first_value after.
Proof.
  induction before as [| current before IH]; intros node after Hnotin.
  - simpl.
    destruct (Z.eq_dec node node); [reflexivity | contradiction].
  - simpl in Hnotin |- *.
    destruct (Z.eq_dec current node) as [Heq | Hneq].
    + subst current. exfalso. apply Hnotin. now left.
    + apply IH. intro Hin. apply Hnotin. now right.
Qed.
