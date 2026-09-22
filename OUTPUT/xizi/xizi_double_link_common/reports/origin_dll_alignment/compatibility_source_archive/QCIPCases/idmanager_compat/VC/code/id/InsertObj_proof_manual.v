Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Strings.String.
Require Import Coq.Strings.Ascii.
Require Import Coq.Lists.List.
Require Import Coq.Classes.RelationClasses.
Require Import Coq.Classes.Morphisms.
Require Import Coq.micromega.Psatz.
Require Import Coq.Sorting.Permutation.
From AUXLib Require Import int_auto Axioms Feq Idents ListLib VMap.
Require Import SetsClass.SetsClass. Import SetsNotation.
From SimpleC.SL Require Import Mem SeparationLogic.
From QCIPCases.idmanager_compat.VC.code.id Require Import InsertObj_goal.
From QCIPCases.idmanager_compat.VC.code.id Require Import InsertObj_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From AUXLib Require Import int_auto Axioms Feq Idents ListLib VMap.
Require Import SetsClass.SetsClass. Import SetsNotation.
From SimpleC.SL Require Import Mem SeparationLogic MapLib.
Require Import Logic.LogicGenerator.demo932.Interface.
Import CRules.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string.
Local Open Scope list.
Import ListNotations.
Require Import SimpleC.SL.ConAssertion SimpleC.SL.CriticalSTS SimpleC.SL.NestedCriticalSTS.
From MonadLib.StateRelMonad Require Export StateRelMonad.
Export MonadNotation.
Local Open Scope sac.
Local Open Scope monad.
Require Import QCIPCases.idmanager_compat.lib.idnode.
Import DLL.
Import IDNode.
Local Open Scope sac.

Lemma proof_of_InsertObj_safety_wit_1_split_goal_1 : InsertObj_safety_wit_1_split_goal_1.
Proof. Abort.

Lemma proof_of_InsertObj_safety_wit_1_split_goal_2 : InsertObj_safety_wit_1_split_goal_2.
Proof. Abort.

Lemma proof_of_InsertObj_safety_wit_1 : InsertObj_safety_wit_1.
Proof.
  unfold InsertObj_safety_wit_1.
  left; intros; Intros; subst; simpl in *; entailer!;
    unfold idbuckets_ok in *; lia.
Qed.

Lemma proof_of_InsertObj_entail_wit_1_empty_bucket_split_goal_spatial : InsertObj_entail_wit_1_empty_bucket_split_goal_spatial.
Proof. Abort.

Lemma proof_of_InsertObj_entail_wit_1_empty_bucket : InsertObj_entail_wit_1_empty_bucket.
Proof.
  unfold InsertObj_entail_wit_1_empty_bucket.
  left; intros; Intros; subst; simpl in *.
  Exists (m.(hoffset)) (m.(idmax)).
  unfold store_idnode_unlinked, store_idnode, idmanager_storeA.
  Exists idnode_pre.
  entailer!; csimpl; entailer!.
Qed.

Lemma proof_of_InsertObj_entail_wit_2_linked_bucket_split_goal_spatial : InsertObj_entail_wit_2_linked_bucket_split_goal_spatial.
Proof. Abort.

Lemma proof_of_InsertObj_entail_wit_2_linked_bucket : InsertObj_entail_wit_2_linked_bucket.
Proof.
  unfold InsertObj_entail_wit_2_linked_bucket.
  left; intros; Intros; subst; simpl in *.
  Exists (m.(hoffset)) (m.(idmax)).
  unfold store_dll.
  Exists next prev.
  unfold store_idnode_unlinked, store_idnode, idmanager_storeA.
  Exists idnode_pre.
  entailer!; csimpl; entailer!.
Qed.

Lemma proof_of_InsertObj_entail_wit_5_empty_bucket_split_goal_spatial : InsertObj_entail_wit_5_empty_bucket_split_goal_spatial.
Proof. Abort.

Lemma proof_of_InsertObj_entail_wit_5_empty_bucket : InsertObj_entail_wit_5_empty_bucket.
Proof.
  unfold InsertObj_entail_wit_5_empty_bucket.
  left; intros; Intros; subst; simpl in *.
  assert (Hrem: Z.rem id m.(hoffset) = Z.modulo id m.(hoffset))
    by (apply Z.rem_mod_nonneg;
        [unfold idmanager_min_free_id in PreH2; lia |
         unfold idbuckets_ok in PreH4; lia]).
  rewrite Hrem in *.
  unfold store_idmanager, store_id_map, store_uchar_array.
  simpl.
  Exists id_map htable bytes.
  entailer!.
  - rewrite Z.quot_div_nonneg by (unfold id_map_bytes_ok in PreH3; lia).
    sep_apply (store_idbuckets_insert (m.(storeA)) htable (m.(hoffset))
      (id mod m.(hoffset)) (Znth (id mod m.(hoffset)) m.(idbuckets) [])
      (m.(idbuckets)) nodes id (&(idnode_pre # "IdNode" ->ₛ "link"))).
    unfold idmanager_insert_bucket.
    entailer!.
    exact PreH6.
    reflexivity.
    apply Z.mod_pos_bound. unfold idbuckets_ok in PreH4; lia.
  - apply idbuckets_ok_insert; auto.
Qed.

Lemma proof_of_InsertObj_entail_wit_6_linked_bucket_split_goal_spatial : InsertObj_entail_wit_6_linked_bucket_split_goal_spatial.
Proof. Abort.

Lemma proof_of_InsertObj_entail_wit_6_linked_bucket : InsertObj_entail_wit_6_linked_bucket.
Proof.
  unfold InsertObj_entail_wit_6_linked_bucket.
  left; intros; Intros; subst; simpl in *.
  assert (Hrem: Z.rem id m.(hoffset) = Z.modulo id m.(hoffset))
    by (apply Z.rem_mod_nonneg;
        [unfold idmanager_min_free_id in PreH2; lia |
         unfold idbuckets_ok in PreH4; lia]).
  rewrite Hrem in *.
  unfold store_idmanager, store_id_map, store_uchar_array.
  simpl.
  Exists id_map htable bytes.
  entailer!.
  - rewrite Z.quot_div_nonneg by (unfold id_map_bytes_ok in PreH3; lia).
    sep_apply (store_idbuckets_insert (m.(storeA)) htable (m.(hoffset))
      (id mod m.(hoffset)) (Znth (id mod m.(hoffset)) m.(idbuckets) [])
      (m.(idbuckets)) nodes id (&(idnode_pre # "IdNode" ->ₛ "link"))).
    unfold idmanager_insert_bucket.
    entailer!.
    exact PreH6.
    reflexivity.
    apply Z.mod_pos_bound. unfold idbuckets_ok in PreH4; lia.
  - apply idbuckets_ok_insert; auto.
Qed.

Lemma proof_of_InsertObj_which_implies_wit_1 : InsertObj_which_implies_wit_1.
Proof.
  unfold InsertObj_which_implies_wit_1.
  left; intros.
  unfold store_idmanager_allocated_unlinked, store_id_map, store_uchar_array,
    store_idnode_unlinked, store_idnode, idmanager_storeA.
  Intros id_map htable bytes p.
  apply addr_of_arrow_field_inv in H2.
  inversion H2; subst.
  Exists htable id_map (m.(hoffset)) (m.(idmax)) bytes.
  entailer!.
  csimpl.
  rewrite Z.quot_div_nonneg by (unfold id_map_bytes_ok in H1; lia).
  entailer!.
Qed.

Lemma proof_of_InsertObj_which_implies_wit_2 : InsertObj_which_implies_wit_2.
Proof.
  unfold InsertObj_which_implies_wit_2.
  intros; Intros; subst; simpl in *.
  assert (0 <= id mod m.(hoffset) < Zlength m.(idbuckets)) as Hidx
    by (unfold idbuckets_ok in PreH4; destruct PreH4 as [? [? _]];
        rewrite H0; apply Z.mod_pos_bound; lia).
  sep_apply (store_idbuckets_split (m.(storeA)) htable (m.(hoffset))
    (id mod m.(hoffset)) (m.(idbuckets)) Hidx).
  Intros bucket.
  sep_apply (store_idbucket_cases (m.(storeA))
    (htable + (id mod m.(hoffset)) * sizeof("SysDoubleLinklistNode")) bucket).
  entailer!.
  assert (Hrem: Z.rem id m.(hoffset) = Z.modulo id m.(hoffset))
    by (apply Z.rem_mod_nonneg;
        [unfold idmanager_min_free_id in PreH2; lia |
         unfold idbuckets_ok in PreH4; lia]).
  rewrite derivable1_orp_sepcon_l.
  apply derivable1_orp_elim.
  - Left. Exists 0 0 0 0 (@nil (DL_Node Z)) bucket. entailer!;
      try (rewrite Hrem; cancel); try (rewrite Hrem; exact H).
  - Right. Intros nodes prev next. Exists next prev nodes bucket. entailer!;
      try (rewrite Hrem; cancel); try (rewrite Hrem; exact H).
Qed.
