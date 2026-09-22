Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

Import ListNotations.
Local Open Scope Z_scope.

(** A public anchor accepted by the implementation is either an abstract list
    member or the sentinel itself.  This proposition deliberately hides all
    pointer-level cuts used to implement the two cases. *)
Definition xizi_double_link_insert_after_anchor
  (head : Z) (nodes : list Z) (anchor : Z) : Prop :=
  In anchor nodes \/ anchor = head.

(** Pure sequence semantics for inserting [inserted] immediately after the
    first occurrence of [anchor] in the complete abstract sequence.  If the
    anchor is absent the sequence is unchanged.  This is a list-level API
    transformation and does not expose the circular C pointer updates. *)
Fixpoint xizi_double_link_insert_after_nodes
  (nodes : list Z) (anchor inserted : Z) : list Z :=
  match nodes with
  | nil => nil
  | current :: suffix =>
      if Z.eq_dec current anchor
      then current :: inserted :: suffix
      else current ::
           xizi_double_link_insert_after_nodes suffix anchor inserted
  end.

(** Public dispatch semantics.  Inserting after the sentinel prepends to the
    abstract node sequence; inserting after an ordinary member uses the
    first-occurrence transformation above. *)
Definition xizi_double_link_insert_after_dispatch_nodes
  (head : Z) (nodes : list Z) (anchor inserted : Z) : list Z :=
  if Z.eq_dec anchor head
  then inserted :: nodes
  else xizi_double_link_insert_after_nodes nodes anchor inserted.

Lemma xizi_in_first_split__implementation_dll_split_reassembly :
  forall (nodes : list Z) (anchor : Z),
    In anchor nodes ->
    exists prefix suffix,
      nodes = prefix ++ anchor :: suffix /\ ~ In anchor prefix.
Proof.
  induction nodes as [| current rest IH]; intros anchor Hin.
  - contradiction.
  - destruct (Z.eq_dec current anchor) as [Heq | Hneq].
    + subst current.
      exists nil, rest.
      simpl.
      tauto.
    + destruct Hin as [Heq | Hin].
      * contradiction.
      * destruct (IH anchor Hin) as [prefix [suffix [Hseq Hfirst]]].
        exists (current :: prefix), suffix.
        simpl.
        rewrite Hseq.
        split; [reflexivity |].
        intros [Heq | Hinprefix]; [contradiction | auto].
Qed.
Lemma xizi_insert_after_first_occurrence__implementation_dll_split_reassembly :
  forall (prefix suffix : list Z) (anchor inserted : Z),
    ~ In anchor prefix ->
    xizi_double_link_insert_after_nodes
      (prefix ++ anchor :: suffix) anchor inserted =
    prefix ++ anchor :: inserted :: suffix.
Proof.
  induction prefix as [| current rest IH]; intros suffix anchor inserted Hnotin.
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
