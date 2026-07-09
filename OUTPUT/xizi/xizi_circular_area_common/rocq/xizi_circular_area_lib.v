Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
From AUXLib Require Import ListLib.

Local Open Scope Z_scope.
Local Open Scope list_scope.

Lemma xizi_Znth_replace_Znth_same :
  forall {A : Type} (i : Z) (x d : A) (l : list A),
    0 <= i < Zlength l ->
    Znth i (replace_Znth i x l) d = x.
Proof.
  intros.
  apply Znth_replace_Znth_Same.
  exact H.
Qed.

Lemma xizi_Znth_replace_Znth_diff :
  forall {A : Type} (k i : Z) (x d : A) (l : list A),
    0 <= k < Zlength l ->
    0 <= i < Zlength l ->
    k <> i ->
    Znth k (replace_Znth i x l) d = Znth k l d.
Proof.
  intros.
  eapply Znth_replace_Znth_Diff; eauto.
Qed.
