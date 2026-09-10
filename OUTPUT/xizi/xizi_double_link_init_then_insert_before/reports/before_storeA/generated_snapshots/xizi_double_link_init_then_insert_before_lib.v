Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

Import ListNotations.
Local Open Scope Z_scope.

(** An insertion anchor is either a member of the abstract node sequence or
    the sentinel that owns that sequence.  This is the public admissibility
    condition; callers do not need to expose an implementation-level cut. *)
Definition xizi_double_link_insert_before_anchor
  (head : Z) (nodes : list Z) (anchor : Z) : Prop :=
  In anchor nodes \/ anchor = head.

(** Insert [inserted] before the first occurrence of [anchor].  Reaching the
    end represents insertion before the sentinel, hence appending the new
    node.  This is a pure list transformation rather than a model of the C
    pointer updates. *)
Fixpoint xizi_double_link_insert_before_nodes
  (nodes : list Z) (anchor inserted : Z) : list Z :=
  match nodes with
  | nil => cons inserted nil
  | current :: suffix =>
      if Z.eq_dec current anchor
      then inserted :: current :: suffix
      else current ::
           xizi_double_link_insert_before_nodes suffix anchor inserted
  end.

Lemma xizi_insert_before_absent_append__dispatch_case_derivations :
  forall nodes anchor inserted,
    ~ In anchor nodes ->
    xizi_double_link_insert_before_nodes nodes anchor inserted =
      nodes ++ inserted :: nil.
Proof.
  induction nodes as [| current suffix IH]; intros anchor inserted Hnotin.
  - reflexivity.
  - simpl in Hnotin |- *.
    destruct (Z.eq_dec current anchor) as [Heq | Hneq].
    + subst current. exfalso. apply Hnotin. left. reflexivity.
    + f_equal. apply IH. intros Hin. apply Hnotin. right. exact Hin.
Qed.
