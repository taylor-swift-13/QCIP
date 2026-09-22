Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

Import ListNotations.
Local Open Scope Z_scope.

Fixpoint xizi_sll_remove_first (node: Z) (l: list Z): list Z :=
  match l with
  | nil => nil
  | current :: suffix =>
      if Z.eq_dec current node
      then suffix
      else current :: xizi_sll_remove_first node suffix
  end.

Lemma xizi_sll_remove_first_app_first_hit__spec_derivations:
  forall node prefix suffix,
    ~ In node prefix ->
    xizi_sll_remove_first node (prefix ++ node :: suffix) = prefix ++ suffix.
Proof.
  intros node prefix.
  induction prefix as [| current prefix IH]; intros suffix Hnotin.
  - simpl.
    destruct (Z.eq_dec node node); [reflexivity | congruence].
  - simpl in Hnotin |- *.
    destruct (Z.eq_dec current node) as [Heq | Hneq].
    + subst current.
      exfalso.
      apply Hnotin.
      left.
      reflexivity.
    + f_equal.
      apply IH.
      intro Hin.
      apply Hnotin.
      right.
      exact Hin.
Qed.
