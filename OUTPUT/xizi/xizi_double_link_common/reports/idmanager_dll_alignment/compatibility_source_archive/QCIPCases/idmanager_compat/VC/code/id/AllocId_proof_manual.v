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
From QCIPCases.idmanager_compat.VC.code.id Require Import AllocId_goal.
From QCIPCases.idmanager_compat.VC.code.id Require Import AllocId_proof_auto.
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

Lemma proof_of_AllocId_safety_wit_6_split_goal_1 : AllocId_safety_wit_6_split_goal_1.
Proof.
  unfold AllocId_safety_wit_6_split_goal_1.
  intros; Intros; subst; simpl in *; entailer!.
  unfold id_map_bytes_ok in *; lia.
Qed.

Lemma proof_of_AllocId_safety_wit_6_split_goal_2 : AllocId_safety_wit_6_split_goal_2.
Proof.
  unfold AllocId_safety_wit_6_split_goal_2.
  intros; Intros; subst; simpl in *; entailer!.
  unfold id_map_bytes_ok in *; lia.
Qed.

Lemma proof_of_AllocId_safety_wit_6 : AllocId_safety_wit_6.
Proof.
  unfold AllocId_safety_wit_6.
  left; intros; Intros; subst; simpl in *; entailer!;
    unfold id_map_bytes_ok in *; lia.
Qed.

Lemma proof_of_AllocId_safety_wit_16_split_goal_1 : AllocId_safety_wit_16_split_goal_1.
Proof.
  unfold AllocId_safety_wit_16_split_goal_1.
  intros; Intros; subst; simpl in *; entailer!.
  unfold id_map_bytes_ok in PreH9.
  destruct PreH9 as (Hidmax_nonneg & Hidmax_bound & Hlen & Hids & Hbytes & Hbits).
  rewrite Z.quot_div_nonneg in PreH3 by lia.
  assert ((m.(idmax) + 7) / 8 <= 8193) by (apply Z.div_le_upper_bound; lia).
  lia.
Qed.

Lemma proof_of_AllocId_safety_wit_16_split_goal_2 : AllocId_safety_wit_16_split_goal_2.
Proof.
  unfold AllocId_safety_wit_16_split_goal_2.
  intros; Intros; subst; simpl in *; entailer!.
Qed.

Lemma proof_of_AllocId_safety_wit_16 : AllocId_safety_wit_16.
Proof.
  unfold AllocId_safety_wit_16.
  left; intros; Intros; subst; simpl in *; entailer!.
  unfold id_map_bytes_ok in PreH9.
  destruct PreH9 as (Hidmax_nonneg & Hidmax_bound & Hlen & Hids & Hbytes & Hbits).
  rewrite Z.quot_div_nonneg in PreH3 by lia.
  assert ((m.(idmax) + 7) / 8 <= 8193) by (apply Z.div_le_upper_bound; lia).
  lia.
Qed.

Lemma proof_of_AllocId_safety_wit_19_split_goal_1 : AllocId_safety_wit_19_split_goal_1.
Proof.
  unfold AllocId_safety_wit_19_split_goal_1.
  intros; Intros; subst; simpl in *; entailer!.
  unfold allocid_entry_scan_inv in PreH8.
  destruct PreH8 as [Hid_range _].
  unfold id_map_bytes_ok in PreH4.
  destruct PreH4 as (Hidmax_nonneg & Hidmax_bound & Hrest).
  rewrite Z.quot_div_nonneg in PreH3 by lia.
  assert ((m.(idmax) + 7) / 8 <= 8193) by (apply Z.div_le_upper_bound; lia).
  lia.
Qed.

Lemma proof_of_AllocId_safety_wit_19_split_goal_2 : AllocId_safety_wit_19_split_goal_2.
Proof.
  unfold AllocId_safety_wit_19_split_goal_2.
  intros; Intros; subst; simpl in *; entailer!.
  unfold allocid_entry_scan_inv in *.
  lia.
Qed.

Lemma proof_of_AllocId_safety_wit_19 : AllocId_safety_wit_19.
Proof.
  unfold AllocId_safety_wit_19.
  left; intros; Intros; subst; simpl in *; entailer!.
  - unfold allocid_entry_scan_inv in *; lia.
  - unfold allocid_entry_scan_inv in PreH8.
    destruct PreH8 as [Hid_range _].
    unfold id_map_bytes_ok in PreH4.
    destruct PreH4 as (Hidmax_nonneg & Hidmax_bound & Hrest).
    rewrite Z.quot_div_nonneg in PreH3 by lia.
    assert ((m.(idmax) + 7) / 8 <= 8193) by (apply Z.div_le_upper_bound; lia).
    lia.
Qed.

Lemma proof_of_AllocId_safety_wit_24_split_goal_1 : AllocId_safety_wit_24_split_goal_1.
Proof.
  unfold AllocId_safety_wit_24_split_goal_1.
  intros; Intros; subst; simpl in *; entailer!.
  pose proof (signed_Lastnbits_range
    match 2 ^ (id % 8) with
    | 0 => 0
    | Z.pos y' => Z.pos y'
    | Z.neg y' => Z.neg y'
    end 32 ltac:(lia)) as [_ Hupper].
  replace (2 ^ (32 - 1)) with (Z.succ 2147483647) in Hupper by reflexivity.
  apply Zlt_succ_le; exact Hupper.
Qed.

Lemma proof_of_AllocId_safety_wit_24_split_goal_2 : AllocId_safety_wit_24_split_goal_2.
Proof.
  unfold AllocId_safety_wit_24_split_goal_2.
  intros; Intros; subst; simpl in *; entailer!.
  pose proof (signed_Lastnbits_range
    match 2 ^ (id % 8) with
    | 0 => 0
    | Z.pos y' => Z.pos y'
    | Z.neg y' => Z.neg y'
    end 32 ltac:(lia)) as [Hlower _].
  replace (2 ^ (32 - 1)) with 2147483648 in Hlower by reflexivity.
  lia.
Qed.

Lemma proof_of_AllocId_safety_wit_24_split_goal_3 : AllocId_safety_wit_24_split_goal_3.
Proof.
  unfold AllocId_safety_wit_24_split_goal_3.
  intros; Intros; subst; simpl in *; entailer!.
  pose proof (Z.rem_bound_abs id 8 ltac:(lia)).
  lia.
Qed.

Lemma proof_of_AllocId_safety_wit_24_split_goal_4 : AllocId_safety_wit_24_split_goal_4.
Proof.
  unfold AllocId_safety_wit_24_split_goal_4.
  intros; Intros; subst; simpl in *; entailer!.
  unfold allocid_entry_scan_inv in PreH9.
  destruct PreH9 as [Hid_range _].
  apply Z.rem_nonneg; lia.
Qed.

Lemma proof_of_AllocId_safety_wit_24 : AllocId_safety_wit_24.
Proof.
  unfold AllocId_safety_wit_24.
  left; intros; Intros; subst; simpl in *; entailer!.
  - unfold allocid_entry_scan_inv in PreH9.
    destruct PreH9 as [Hid_range _].
    apply Z.rem_nonneg; lia.
  - pose proof (Z.rem_bound_abs id 8 ltac:(lia)).
    lia.
  - pose proof (signed_Lastnbits_range
      match 2 ^ (id % 8) with
      | 0 => 0
      | Z.pos y' => Z.pos y'
      | Z.neg y' => Z.neg y'
      end 32 ltac:(lia)) as [Hlower _].
    replace (2 ^ (32 - 1)) with 2147483648 in Hlower by reflexivity.
    lia.
  - pose proof (signed_Lastnbits_range
      match 2 ^ (id % 8) with
      | 0 => 0
      | Z.pos y' => Z.pos y'
      | Z.neg y' => Z.neg y'
      end 32 ltac:(lia)) as [_ Hupper].
    replace (2 ^ (32 - 1)) with (Z.succ 2147483647) in Hupper by reflexivity.
    apply Zlt_succ_le; exact Hupper.
Qed.

Lemma proof_of_AllocId_entail_wit_1 : AllocId_entail_wit_1.
Proof.
  unfold AllocId_entail_wit_1.
  left; intros.
  Exists htable_2 id_map_2 manager_callee_hoffset manager_callee_id_max bytes_2.
  entailer!.
  all: subst; try entailer!; try reflexivity;
    try (unfold allocid_index_scan_inv; split; [lia | intros i Hi; lia]);
    try (apply Z.quot_pos; unfold id_map_bytes_ok in PreH1; lia).
Qed.

Lemma proof_of_AllocId_entail_wit_2_split_goal_1 : AllocId_entail_wit_2_split_goal_1.
Proof.
  unfold AllocId_entail_wit_2_split_goal_1.
  intros; Intros; subst; simpl in *; entailer!.
  unfold allocid_index_scan_inv in *.
  split; [lia |].
  intros i Hi.
  destruct (Z.eq_dec i index).
  - subst; assumption.
  - apply PreH10; lia.
Qed.

Lemma proof_of_AllocId_entail_wit_2_split_goal_spatial : AllocId_entail_wit_2_split_goal_spatial.
Proof.
  unfold AllocId_entail_wit_2_split_goal_spatial.
  intros; entailer!.
Qed.

Lemma proof_of_AllocId_entail_wit_2 : AllocId_entail_wit_2.
Proof.
  unfold AllocId_entail_wit_2.
  right; intros; Intros; subst; simpl in *; entailer!.
  unfold allocid_index_scan_inv in *.
  split; [lia |].
  intros i Hi.
  destruct (Z.eq_dec i index).
  - subst; assumption.
  - apply PreH10; lia.
Qed.

Lemma proof_of_AllocId_entail_wit_3_split_goal_1 : AllocId_entail_wit_3_split_goal_1.
Proof.
  unfold AllocId_entail_wit_3_split_goal_1.
  intros; Intros; subst; simpl in *; entailer!.
  eapply allocid_entry_scan_inv_init; eauto.
Qed.

Lemma proof_of_AllocId_entail_wit_3_split_goal_spatial : AllocId_entail_wit_3_split_goal_spatial.
Proof.
  unfold AllocId_entail_wit_3_split_goal_spatial.
  intros; entailer!.
Qed.

Lemma proof_of_AllocId_entail_wit_3 : AllocId_entail_wit_3.
Proof.
  unfold AllocId_entail_wit_3.
  right; intros; Intros; subst; simpl in *; entailer!.
  eapply allocid_entry_scan_inv_init; eauto.
Qed.

Lemma proof_of_AllocId_entail_wit_4_split_goal_1 : AllocId_entail_wit_4_split_goal_1.
Proof.
  unfold AllocId_entail_wit_4_split_goal_1.
  intros; Intros; subst; simpl in *; entailer!.
  eapply allocid_entry_scan_inv_step; eauto.
  eapply id_map_bytes_ok_Znth_range; eauto.
Qed.

Lemma proof_of_AllocId_entail_wit_4_split_goal_spatial : AllocId_entail_wit_4_split_goal_spatial.
Proof.
  unfold AllocId_entail_wit_4_split_goal_spatial.
  intros; entailer!.
Qed.

Lemma proof_of_AllocId_entail_wit_4 : AllocId_entail_wit_4.
Proof.
  unfold AllocId_entail_wit_4.
  right; intros; Intros; subst; simpl in *; entailer!.
  eapply allocid_entry_scan_inv_step; eauto.
  eapply id_map_bytes_ok_Znth_range; eauto.
Qed.

Lemma proof_of_AllocId_return_wit_1_split_goal_spatial : AllocId_return_wit_1_split_goal_spatial.
Proof.
  unfold AllocId_return_wit_1_split_goal_spatial; intros; Intros; subst; simpl in *.
  prop_apply store_ushort_range.
  Intros.
  unfold store_idmanager_allocid_post, store_idmanager_allocated_unlinked,
    store_id_map, store_uchar_array; left; split.
  - entailer!; split.
    + apply idmanager_first_free_id_min; eapply allocid_success_min_free; eauto.
    + lia.
  - exists id_map; exists htable; split.
    + entailer!; eapply allocid_success_min_free; eauto.
    + eapply derivable1_imp; [| exact H0].
      Exists (replace_Znth index
        (Z.lor (unsigned_last_nbits (Znth index bytes 0) 8)
          (unsigned_last_nbits (Z.shiftl 1 (id % 8)) 8)) bytes).
      entailer!; try (eapply id_map_bytes_ok_allocid_set; eauto).
      * rewrite Z.quot_div_nonneg by (unfold id_map_bytes_ok in PreH5; lia).
        entailer!.
      * rewrite Z.rem_mod_nonneg by (unfold allocid_entry_scan_inv in PreH9; lia).
        eapply id_map_bytes_ok_allocid_set; eauto.
Qed.

Lemma proof_of_AllocId_return_wit_1 : AllocId_return_wit_1.
Proof.
  left.
  apply proof_of_AllocId_return_wit_1_split_goal_spatial.
Qed.

Lemma proof_of_AllocId_return_wit_2_split_goal_spatial : AllocId_return_wit_2_split_goal_spatial.
Proof.
  unfold AllocId_return_wit_2_split_goal_spatial; intros; Intros; subst; simpl in *.
  unfold store_idmanager_allocid_post, store_idmanager, store_id_map,
    store_uchar_array; right; split.
  - entailer!; split;
      [ assert (Hfull: idmanager_full m) by (eapply allocid_entry_scan_inv_full; eauto; lia);
        apply idmanager_first_free_id_full; auto; unfold id_map_bytes_ok in PreH5; tauto
      | reflexivity ].
  - exists id_map; exists htable.
    eapply derivable1_imp; [| exact H].
    Exists bytes.
    entailer!.
    rewrite Z.quot_div_nonneg by (unfold id_map_bytes_ok in PreH5; lia).
    entailer!.
Qed.

Lemma proof_of_AllocId_return_wit_2 : AllocId_return_wit_2.
Proof.
  left.
  apply proof_of_AllocId_return_wit_2_split_goal_spatial.
Qed.

Lemma proof_of_AllocId_return_wit_3_split_goal_spatial : AllocId_return_wit_3_split_goal_spatial.
Proof.
  unfold AllocId_return_wit_3_split_goal_spatial; intros; Intros; subst; simpl in *.
  unfold store_idmanager_allocid_post, store_idmanager, store_id_map,
    store_uchar_array; right; split.
  - entailer!; split;
      [ assert (Hfull: idmanager_full m) by (eapply allocid_index_scan_inv_full; eauto);
        apply idmanager_first_free_id_full; auto; unfold id_map_bytes_ok in PreH8; tauto
      | reflexivity ].
  - exists id_map; exists htable.
    eapply derivable1_imp; [| exact H].
    Exists bytes.
    entailer!.
    rewrite Z.quot_div_nonneg by (unfold id_map_bytes_ok in PreH8; lia).
    entailer!.
Qed.

Lemma proof_of_AllocId_return_wit_3 : AllocId_return_wit_3.
Proof.
  left.
  apply proof_of_AllocId_return_wit_3_split_goal_spatial.
Qed.

Lemma proof_of_AllocId_which_implies_wit_1 : AllocId_which_implies_wit_1.
Proof.
  unfold AllocId_which_implies_wit_1.
  right; intros.
  unfold store_idmanager, store_id_map, store_uchar_array.
  Intros id_map htable bytes.
  Exists htable id_map bytes.
  entailer!.
  match goal with
  | Hmap: id_map_bytes_ok _ _ _ |- _ =>
      rewrite Z.quot_div_nonneg by (unfold id_map_bytes_ok in Hmap; lia)
  end.
  entailer!.
Qed.
