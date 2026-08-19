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

Lemma xizi_double_link_in_first_occurrence__dll_dispatch_forbidden_free :
  forall (nodes : list Z) node,
    In node nodes ->
    exists before after,
      nodes = before ++ node :: after /\ ~ In node before.
Proof.
  induction nodes as [| current rest IH]; intros node Hin.
  - contradiction.
  - destruct (Z.eq_dec current node) as [Heq | Hneq].
    + subst current. exists nil, rest. simpl. tauto.
    + simpl in Hin. destruct Hin as [Heq | Hin]; [contradiction |].
      destruct (IH node Hin) as [before [after [Hnodes Hnotin]]].
      exists (current :: before), after. simpl. subst rest. tauto.
Qed.
Lemma xizi_double_link_next_value_at_first_occurrence__dll_dispatch_forbidden_free :
  forall (head node : Z) (nodes before after : list Z),
    node <> head ->
    nodes = before ++ node :: after ->
    ~ In node before ->
    xizi_double_link_next_dispatch_value head nodes node =
      xizi_double_link_first_value after.
Proof.
  intros head node nodes before after Hneq Hnodes Hnotin.
  unfold xizi_double_link_next_dispatch_value.
  destruct (Z.eq_dec node head); [contradiction |].
  subst nodes.
  induction before as [| current rest IH].
  - simpl. destruct (Z.eq_dec node node); congruence.
  - simpl in Hnotin |- *.
    assert (Hcurrent : current <> node) by
      (intro Heq; apply Hnotin; left; exact Heq).
    assert (Hrest : ~ In node rest) by
      (intro Hin; apply Hnotin; right; exact Hin).
    destruct (Z.eq_dec current node); [contradiction |].
    apply IH. exact Hrest.
Qed.
