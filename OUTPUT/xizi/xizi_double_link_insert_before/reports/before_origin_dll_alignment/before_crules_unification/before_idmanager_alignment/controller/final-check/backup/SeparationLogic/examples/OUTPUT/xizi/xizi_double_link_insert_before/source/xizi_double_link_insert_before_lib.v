Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

Import ListNotations.
Local Open Scope Z_scope.

(** An admissible public anchor is either an abstract member or the sentinel
    itself.  Keeping this as a proposition avoids exposing either internal
    predecessor cut in the public contracts. *)
Definition xizi_double_link_insert_before_anchor
  (head : Z) (nodes : list Z) (anchor : Z) : Prop :=
  In anchor nodes \/ anchor = head.

(** Pure sequence semantics for inserting [inserted] immediately before the
    first occurrence of [anchor] in the complete abstract sequence.  Reaching
    the end appends [inserted]; in particular this is the public sentinel-head
    behavior, because the sentinel is not an element of the abstract node
    sequence.  This is a list-level API transformation and does not expose the
    circular C pointer updates. *)
Fixpoint xizi_double_link_insert_before_nodes
  (nodes : list Z) (anchor inserted : Z) : list Z :=
  match nodes with
  | nil => inserted :: nil
  | current :: suffix =>
      if Z.eq_dec current anchor
      then inserted :: current :: suffix
      else current ::
           xizi_double_link_insert_before_nodes suffix anchor inserted
  end.

Lemma xizi_in_first_split__insert_before_dispatch_and_reassembly :
  forall (nodes : list Z) anchor,
    In anchor nodes ->
    exists prefix suffix,
      nodes = prefix ++ anchor :: suffix /\ ~ In anchor prefix.
Proof.
  induction nodes as [| current nodes IH]; intros anchor Hin.
  - contradiction.
  - destruct (Z.eq_dec current anchor) as [Heq | Hneq].
    + subst current.
      exists nil, nodes.
      simpl.
      split; [reflexivity | tauto].
    + destruct Hin as [Heq | Hin].
      * contradiction.
      * destruct (IH anchor Hin) as [prefix [suffix [Hnodes Hnotin]]].
        exists (current :: prefix), suffix.
        simpl.
        rewrite Hnodes.
        split; [reflexivity |].
        intros [Heq | Hin_prefix]; contradiction.
Qed.
Lemma xizi_insert_before_first_occurrence__insert_before_dispatch_and_reassembly :
  forall prefix suffix anchor inserted,
    ~ In anchor prefix ->
    xizi_double_link_insert_before_nodes
      (prefix ++ anchor :: suffix) anchor inserted =
    prefix ++ inserted :: anchor :: suffix.
Proof.
  induction prefix as [| current prefix IH];
    intros suffix anchor inserted Hnotin.
  - simpl.
    destruct (Z.eq_dec anchor anchor); [reflexivity | contradiction].
  - simpl in Hnotin |- *.
    destruct (Z.eq_dec current anchor) as [Heq | Hneq].
    + exfalso.
      apply Hnotin.
      left; exact Heq.
    + f_equal.
      apply IH.
      intros Hin.
      apply Hnotin.
      right; exact Hin.
Qed.
Lemma xizi_insert_before_absent_append__insert_before_dispatch_and_reassembly :
  forall nodes anchor inserted,
    ~ In anchor nodes ->
    xizi_double_link_insert_before_nodes nodes anchor inserted =
    nodes ++ inserted :: nil.
Proof.
  induction nodes as [| current nodes IH];
    intros anchor inserted Hnotin.
  - reflexivity.
  - simpl in Hnotin |- *.
    destruct (Z.eq_dec current anchor) as [Heq | Hneq].
    + exfalso.
      apply Hnotin.
      left; exact Heq.
    + f_equal.
      apply IH.
      intros Hin.
      apply Hnotin.
      right; exact Hin.
Qed.
