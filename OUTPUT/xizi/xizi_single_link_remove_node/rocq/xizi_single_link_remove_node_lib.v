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

Lemma xizi_sll_remove_first_split__spec_derivations_direct:
  forall (node: Z) (l: list Z),
    In node l ->
    exists prefix suffix,
      l = prefix ++ node :: suffix /\
      ~ In node prefix /\
      xizi_sll_remove_first node l = prefix ++ suffix.
Proof.
  intros node l.
  induction l as [| current tail IH].
  - simpl. tauto.
  - intros Hin.
    simpl in Hin.
    destruct (Z.eq_dec current node) as [Heq | Hneq].
    + subst current.
      exists nil, tail.
      split; [reflexivity |].
      split; [simpl; tauto |].
      simpl.
      destruct (Z.eq_dec node node); [reflexivity | contradiction].
    + destruct Hin as [Heq | Hin]; [congruence |].
      destruct (IH Hin) as (prefix & suffix & Hl & Hnotin & Hremove).
      exists (current :: prefix), suffix.
      split.
      * simpl. rewrite Hl. reflexivity.
      * split.
        -- simpl. intros [Heq | Hmember].
           ++ congruence.
           ++ contradiction.
        -- simpl. destruct (Z.eq_dec current node); [contradiction |].
           rewrite Hremove. reflexivity.
Qed.
