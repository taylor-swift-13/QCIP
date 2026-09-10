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
From CRTOS_Verify.VC.code.id Require Import GetObj_goal.
From CRTOS_Verify.VC.code.id Require Import GetObj_proof_auto.
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
Require Import SL.ConAssertion SL.CriticalSTS SL.NestedCriticalSTS.
From MonadLib.StateRelMonad Require Export StateRelMonad.
Export MonadNotation.
Local Open Scope sac.
Local Open Scope monad.
Require Import CRTOS_Verify.lib.idnode.
Import DLL.
Import IDNode.
Local Open Scope sac.

Lemma proof_of_GetObj_safety_wit_1_split_goal_1 : GetObj_safety_wit_1_split_goal_1.
Proof. Abort.

Lemma proof_of_GetObj_safety_wit_1_split_goal_2 : GetObj_safety_wit_1_split_goal_2.
Proof. Abort.

Lemma proof_of_GetObj_safety_wit_1 : GetObj_safety_wit_1.
Proof.
  unfold GetObj_safety_wit_1.
  apply or_introl.
  intros id_pre manager_pre m manager_callee_hoffset manager_callee_id_max
    id_map htable bytes H0 H1 Hbytes Hbuckets Hidmax Hhoff Hid0 Hidlt.
  entailer!; subst; unfold idbuckets_ok in Hbuckets; lia.
Qed. 

Lemma proof_of_GetObj_entail_wit_2_linked_bucket_split_goal_spatial : GetObj_entail_wit_2_linked_bucket_split_goal_spatial.
Proof. Abort.

Lemma proof_of_GetObj_entail_wit_2_linked_bucket : GetObj_entail_wit_2_linked_bucket.
Proof.
  unfold GetObj_entail_wit_2_linked_bucket.
  right.
  intros; Intros; subst; simpl in *.
  unfold store_dll.
  Exists next prev.
  entailer!.
Qed. 

Lemma proof_of_GetObj_entail_wit_3_linked_bucket : GetObj_entail_wit_3_linked_bucket.
Proof.
  unfold GetObj_entail_wit_3_linked_bucket.
  right.
  intros; Intros; subst; simpl in *.
  unfold store_dll.
  Intros h pt.
  Exists h pt.
  entailer!.
Qed. 

Lemma proof_of_GetObj_entail_wit_4_linked_bucket : GetObj_entail_wit_4_linked_bucket.
Proof.
  unfold GetObj_entail_wit_4_linked_bucket.
  right.
  intros; Intros; subst; simpl in *.
  Exists (htable + (Z.rem id_pre m.(hoffset)) * sizeof("SysDoubleLinklistNode")).
  Exists (@nil (DL_Node Z)).
  Exists nodes.
  simpl.
  entailer!.
  unfold idnodes_no_id; simpl; tauto.
Qed. 

Lemma proof_of_GetObj_entail_wit_5_linked_bucket : GetObj_entail_wit_5_linked_bucket.
Proof.
  unfold GetObj_entail_wit_5_linked_bucket.
  right.
  intros; Intros; subst; simpl in *.
  destruct suffix as [| d rest]; simpl in *.
  - entailer!.
  - Intros node_next.
    Exists node_next.
    Exists (getData d).
    Exists rest.
    entailer!.
    destruct d; simpl in *; subst; reflexivity.
Qed. 

Lemma proof_of_GetObj_entail_wit_6_linked_bucket_split_goal_1 : GetObj_entail_wit_6_linked_bucket_split_goal_1.
Proof. Abort.

Lemma proof_of_GetObj_entail_wit_6_linked_bucket_split_goal_spatial : GetObj_entail_wit_6_linked_bucket_split_goal_spatial.
Proof. Abort.

Lemma proof_of_GetObj_entail_wit_6_linked_bucket : GetObj_entail_wit_6_linked_bucket.
Proof.
  unfold GetObj_entail_wit_6_linked_bucket.
  right.
  intros; Intros; subst; simpl in *.
  unfold store_idnode, idmanager_storeA.
  Intros p.
  apply addr_of_arrow_field_inv in H.
  inversion H; subst.
  entailer!.
Qed. 

Lemma proof_of_GetObj_entail_wit_7_linked_bucket : GetObj_entail_wit_7_linked_bucket.
Proof.
  unfold GetObj_entail_wit_7_linked_bucket.
  right.
  intros; Intros; subst; simpl in *.
  Exists (&(idnode # "IdNode" ->ₛ "link")).
  Exists (prefix_2 ++ ({| getData := node_id; getPtr := &(idnode # "IdNode" ->ₛ "link") |} :: nil)).
  Exists rest.
  entailer!.
  sep_apply (dllseg_store_idnode_tail_append_field (m.(storeA)) idnode first_2
    (htable + Z.rem id_pre m.(hoffset) * sizeof("SysDoubleLinklistNode"))
    (&(idnode # "IdNode" ->ₛ "link")) prev_cur_2 node_next node_id prefix_2).
  entailer!.
  all: try (unfold idmanager_storeA in PreH13; exact PreH13);
       try reflexivity;
       try (unfold idnodes_no_id in *; rewrite map_app; simpl; intros Hin;
            apply in_app_or in Hin; destruct Hin as [Hin | [Hin | Hin]];
            [apply PreH9; exact Hin | lia | contradiction]).
  rewrite <- app_assoc.
  reflexivity.
Qed. 

Lemma proof_of_GetObj_return_wit_1_linked_bucket_split_goal_spatial : GetObj_return_wit_1_linked_bucket_split_goal_spatial.
Proof. Abort.

Lemma proof_of_GetObj_return_wit_1_linked_bucket : GetObj_return_wit_1_linked_bucket.
Proof.
  unfold GetObj_return_wit_1_linked_bucket.
  left.
  intros; Intros; subst; simpl in *.
  assert (Hrem: Z.rem id_pre m.(hoffset) = Z.modulo id_pre m.(hoffset))
    by (apply Z.rem_mod_nonneg; [lia | unfold idbuckets_ok in PreH11; lia]).
  rewrite Hrem in *.
  sep_apply (dllseg_exit_suffix_nil (m.(storeA))
    (htable + id_pre mod m.(hoffset) * sizeof("SysDoubleLinklistNode"))
    prev_cur last suffix).
  Intros.
  subst suffix.
  unfold store_idmanager_getobj_post, idmanager_getobj_ret,
    store_idmanager, store_id_map, store_uchar_array.
  Exists id_map htable bytes.
  entailer!.
  - rewrite Z.quot_div_nonneg by (unfold id_map_bytes_ok in PreH10; lia).
    sep_apply (dllseg_concat (store_idnode (m.(storeA))) first
      (htable + id_pre mod m.(hoffset) * sizeof("SysDoubleLinklistNode"))
      (htable + id_pre mod m.(hoffset) * sizeof("SysDoubleLinklistNode")) prev_cur
      (htable + id_pre mod m.(hoffset) * sizeof("SysDoubleLinklistNode")) last
      prefix (@nil (DL_Node Z))).
    rewrite app_nil_r.
    sep_apply (store_idbuckets_merge_dllseg (m.(storeA)) htable (m.(hoffset))
      (id_pre mod m.(hoffset))
      (Znth (id_pre mod m.(hoffset)) m.(idbuckets) [])
      (m.(idbuckets)) prefix first last).
    entailer!.
    all: try reflexivity;
         try (rewrite <- PreH9; rewrite PreH7; rewrite app_nil_r; reflexivity);
         try (apply Z.mod_pos_bound; unfold idbuckets_ok in PreH11; lia).
    rewrite <- PreH9.
    rewrite app_nil_r.
    reflexivity.
  - left.
    split; [reflexivity |].
    eapply idmanager_query_false_from_bucket; eauto.
    unfold idnodes_no_id in PreH8.
    rewrite app_nil_r.
    exact PreH8.
Qed. 

Lemma proof_of_GetObj_return_wit_2_linked_bucket_split_goal_spatial : GetObj_return_wit_2_linked_bucket_split_goal_spatial.
Proof. Abort.

Lemma proof_of_GetObj_return_wit_2_linked_bucket : GetObj_return_wit_2_linked_bucket.
Proof.
  unfold GetObj_return_wit_2_linked_bucket.
  left.
  intros; Intros; subst; simpl in *.
  assert (Hrem: Z.rem id_pre m.(hoffset) = Z.modulo id_pre m.(hoffset))
    by (apply Z.rem_mod_nonneg; [lia | unfold idbuckets_ok in PreH12; lia]).
  rewrite Hrem in *.
  unfold store_idmanager_getobj_post, idmanager_getobj_ret,
    store_idmanager, store_id_map, store_uchar_array.
  Exists id_map htable bytes.
  entailer!.
  - rewrite Z.quot_div_nonneg by (unfold id_map_bytes_ok in PreH11; lia).
    sep_apply (dllseg_store_idnode_tail_append_field (m.(storeA)) idnode first
      (htable + id_pre mod m.(hoffset) * sizeof("SysDoubleLinklistNode"))
      (&(idnode # "IdNode" ->ₛ "link")) prev_cur node_next id_pre prefix).
    entailer!.
    sep_apply (dllseg_concat (store_idnode (m.(storeA))) first
      (htable + id_pre mod m.(hoffset) * sizeof("SysDoubleLinklistNode"))
      node_next (&(idnode # "IdNode" ->ₛ "link"))
      (htable + id_pre mod m.(hoffset) * sizeof("SysDoubleLinklistNode")) last
      (prefix ++ {| getData := id_pre; getPtr := &(idnode # "IdNode" ->ₛ "link") |} :: nil)
      rest).
    rewrite <- app_assoc.
    simpl.
    sep_apply (store_idbuckets_merge_dllseg (m.(storeA)) htable (m.(hoffset))
      (id_pre mod m.(hoffset))
      (Znth (id_pre mod m.(hoffset)) m.(idbuckets) [])
      (m.(idbuckets))
      (prefix ++ {| getData := id_pre; getPtr := &(idnode # "IdNode" ->ₛ "link") |} :: rest)
      first last).
    entailer!.
    all: try reflexivity;
         try (rewrite PreH10; reflexivity);
         try (apply Z.mod_pos_bound; unfold idbuckets_ok in PreH12; lia).
    unfold idmanager_storeA in PreH13.
    exact PreH13.
  - right.
    split.
    + eapply idmanager_query_true_from_bucket; eauto.
      rewrite map_app.
      apply in_or_app.
      right.
      simpl.
      auto.
    + exact PreH13.
Qed. 

Lemma proof_of_GetObj_return_wit_3_empty_bucket_split_goal_spatial : GetObj_return_wit_3_empty_bucket_split_goal_spatial.
Proof. Abort.

Lemma proof_of_GetObj_return_wit_3_empty_bucket : GetObj_return_wit_3_empty_bucket.
Proof.
  unfold GetObj_return_wit_3_empty_bucket.
  left.
  intros; Intros; subst; simpl in *.
  assert (Hrem: Z.rem id_pre m.(hoffset) = Z.modulo id_pre m.(hoffset))
    by (apply Z.rem_mod_nonneg; [lia | unfold idbuckets_ok in PreH11; lia]).
  rewrite Hrem in *.
  unfold store_idmanager_getobj_post, idmanager_getobj_ret,
    store_idmanager, store_id_map, store_uchar_array.
  Exists id_map htable bytes.
  entailer!.
  - rewrite Z.quot_div_nonneg by (unfold id_map_bytes_ok in PreH10; lia).
    sep_apply (store_idbuckets_merge (m.(storeA)) htable (m.(hoffset))
      (id_pre mod m.(hoffset)) (Znth (id_pre mod m.(hoffset)) m.(idbuckets) [])
      (m.(idbuckets)) (@nil (DL_Node Z))).
    entailer!.
    all: try reflexivity; try (rewrite PreH7; reflexivity);
         try (apply Z.mod_pos_bound; unfold idbuckets_ok in PreH11; lia).
  - left.
    split; [reflexivity |].
    eapply idmanager_query_false_from_bucket; eauto.
Qed. 

Lemma proof_of_GetObj_which_implies_wit_1 : GetObj_which_implies_wit_1.
Proof.
  unfold GetObj_which_implies_wit_1, store_idmanager, store_id_map, store_uchar_array.
  right; intros.
  Intros id_map htable bytes.
  Exists htable id_map bytes.
  entailer!.
  rewrite Z.quot_div_nonneg by (unfold id_map_bytes_ok in H0; lia).
  entailer!.
Qed. 

Lemma proof_of_GetObj_which_implies_wit_2 : GetObj_which_implies_wit_2.
Proof.
  unfold GetObj_which_implies_wit_2.
  intros; Intros; subst; simpl in *.
  assert (0 <= id_pre mod m.(hoffset) < Zlength m.(idbuckets)) as Hidx
    by (unfold idbuckets_ok in PreH7; destruct PreH7 as [? [? _]];
        rewrite H0; apply Z.mod_pos_bound; lia).
  sep_apply (store_idbuckets_split (m.(storeA)) htable (m.(hoffset))
    (id_pre mod m.(hoffset)) (m.(idbuckets)) Hidx).
  Intros bucket.
  sep_apply (store_idbucket_cases (m.(storeA))
    (htable + (id_pre mod m.(hoffset)) * sizeof("SysDoubleLinklistNode")) bucket).
  entailer!.
  assert (Hrem: Z.rem id_pre m.(hoffset) = Z.modulo id_pre m.(hoffset))
    by (apply Z.rem_mod_nonneg; [lia | unfold idbuckets_ok in PreH7; lia]).
  rewrite derivable1_orp_sepcon_l.
  apply derivable1_orp_elim.
  - Left. Exists 0 0 0 0 (@nil (DL_Node Z)) bucket.
    entailer!; try (rewrite Hrem; cancel); try (rewrite Hrem; exact H).
  - Right. Intros nodes prev next. Exists next prev nodes bucket.
    entailer!; try (rewrite Hrem; cancel); try (rewrite Hrem; exact H).
Qed. 
