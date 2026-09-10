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

Lemma xizi_double_link_next_value_first_occurrence__double_link_get_next_dispatch :
  forall (prefix suffix : list Z) (node : Z),
    ~ In node prefix ->
    xizi_double_link_next_value (prefix ++ node :: suffix) node =
      xizi_double_link_first_value suffix.
Proof.
  induction prefix as [|current prefix IH]; intros suffix node Hnotin.
  - simpl.
    destruct (Z.eq_dec node node); [reflexivity | contradiction].
  - simpl in Hnotin |- *.
    destruct (Z.eq_dec current node) as [Heq | Hneq].
    + subst current. exfalso. apply Hnotin. now left.
    + apply IH. intro Hin. apply Hnotin. now right.
Qed.
Lemma xizi_double_link_first_occurrence_split__double_link_get_next_dispatch :
  forall (nodes : list Z) (node : Z),
    In node nodes ->
    exists prefix suffix,
      nodes = prefix ++ node :: suffix /\ ~ In node prefix.
Proof.
  induction nodes as [|current rest IH]; intros node Hin.
  - contradiction.
  - destruct (Z.eq_dec current node) as [Heq | Hneq].
    + subst current. exists nil, rest. simpl. split; [reflexivity |].
      intros Hnil. exact Hnil.
    + destruct Hin as [Heq | Hin]; [contradiction |].
      destruct (IH node Hin) as (prefix & suffix & Hshape & Hfresh).
      exists (current :: prefix), suffix. simpl.
      split.
      * now rewrite Hshape.
      * intros [Heq | Hin']; [contradiction | now apply Hfresh].
Qed.
Lemma xizi_double_link_dispatch_first_occurrence__double_link_get_next_dispatch :
  forall (prefix suffix : list Z) (head node : Z),
    node <> head ->
    ~ In node prefix ->
    xizi_double_link_next_dispatch_value (prefix ++ node :: suffix) head node =
      xizi_double_link_first_value suffix.
Proof.
  intros prefix suffix head node Hneq Hfresh.
  unfold xizi_double_link_next_dispatch_value.
  destruct (Z.eq_dec node head); [contradiction |].
  now apply xizi_double_link_next_value_first_occurrence__double_link_get_next_dispatch.
Qed.
