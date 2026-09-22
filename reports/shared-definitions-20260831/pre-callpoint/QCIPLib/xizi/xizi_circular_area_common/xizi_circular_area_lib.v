Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
From AUXLib Require Import ListLib.

Local Open Scope Z_scope.
Local Open Scope list_scope.

(** Pure consistency facts shared by every live circular-buffer descriptor.
    Spatial ownership of the descriptor fields and the backing byte array stays
    explicit in each C contract. *)
Definition CircularAreaDescriptorState
    (readidx writeidx area_length b_status : Z)
    (buffer_contents : list Z) : Prop :=
  0 <= readidx < area_length /\
  0 <= writeidx < area_length /\
  0 < area_length <= 256 /\
  (b_status = 0 \/ b_status = 1) /\
  Zlength buffer_contents = area_length.

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
