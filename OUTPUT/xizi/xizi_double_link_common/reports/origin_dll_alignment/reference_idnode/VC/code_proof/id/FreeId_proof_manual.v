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
From CRTOS_Verify.VC.code.id Require Import FreeId_goal.
From CRTOS_Verify.VC.code.id Require Import FreeId_proof_auto.
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

Lemma proof_of_FreeId_safety_wit_3_split_goal_1 : FreeId_safety_wit_3_split_goal_1.
Proof.
  unfold FreeId_safety_wit_3_split_goal_1; intros; entailer!.
  pose proof (signed_Lastnbits_range (1 * 2 ^ (id_pre mod 8)) 32 ltac:(lia)).
  rewrite Z.rem_mod_nonneg by lia.
  lia.
Qed.

Lemma proof_of_FreeId_safety_wit_3_split_goal_2 : FreeId_safety_wit_3_split_goal_2.
Proof.
  unfold FreeId_safety_wit_3_split_goal_2; intros; entailer!.
  pose proof (signed_Lastnbits_range (1 * 2 ^ (id_pre mod 8)) 32 ltac:(lia)).
  rewrite Z.rem_mod_nonneg by lia.
  lia.
Qed.

Lemma proof_of_FreeId_safety_wit_3_split_goal_3 : FreeId_safety_wit_3_split_goal_3.
Proof.
  unfold FreeId_safety_wit_3_split_goal_3; intros; entailer!.
  rewrite Z.rem_mod_nonneg by lia.
  pose proof (Z.mod_pos_bound id_pre 8 ltac:(lia)).
  lia.
Qed.

Lemma proof_of_FreeId_safety_wit_3_split_goal_4 : FreeId_safety_wit_3_split_goal_4.
Proof.
  unfold FreeId_safety_wit_3_split_goal_4; intros; entailer!.
  rewrite Z.rem_mod_nonneg by lia.
  pose proof (Z.mod_pos_bound id_pre 8 ltac:(lia)).
  lia.
Qed.

Lemma proof_of_FreeId_safety_wit_3 : FreeId_safety_wit_3.
Proof.
  unfold FreeId_safety_wit_3.
  left; intros; entailer!;
    try rewrite Z.rem_mod_nonneg by lia;
    try pose proof (signed_Lastnbits_range (1 * 2 ^ (id_pre mod 8)) 32 ltac:(lia));
    try pose proof (Z.mod_pos_bound id_pre 8 ltac:(lia));
    lia.
Qed.

Lemma proof_of_FreeId_return_wit_1_split_goal_spatial : FreeId_return_wit_1_split_goal_spatial.
Proof.
  unfold FreeId_return_wit_1_split_goal_spatial; intros; Intros; subst; simpl in *.
  unfold store_idmanager_freeid_post, store_id_map, store_uchar_array.
  Exists id_map htable.
  entailer!.
  Exists (replace_Znth (id_pre ÷ 8)
    (Z.land (Znth (id_pre ÷ 8) bytes 0)
      (unsigned_last_nbits (Z.lnot (signed_last_nbits (Z.shiftl 1 (id_pre % 8)) 32)) 8)) bytes).
  entailer!.
  - rewrite Z.quot_div_nonneg by lia.
    rewrite Z.rem_mod_nonneg by lia.
    entailer!.
  - rewrite Z.quot_div_nonneg by lia.
    rewrite Z.rem_mod_nonneg by lia.
    eapply id_map_bytes_ok_freeid_clear; eauto.
Qed.

Lemma proof_of_FreeId_return_wit_1 : FreeId_return_wit_1.
Proof.
  unfold FreeId_return_wit_1.
  left.
  apply proof_of_FreeId_return_wit_1_split_goal_spatial.
Qed.

Lemma proof_of_FreeId_which_implies_wit_1 : FreeId_which_implies_wit_1.
Proof.
  unfold FreeId_which_implies_wit_1.
  right; intros.
  unfold store_idmanager, store_id_map, store_uchar_array.
  Intros id_map htable bytes.
  Exists htable id_map bytes.
  entailer!.
  - rewrite Z.quot_div_nonneg by (unfold id_map_bytes_ok in H0; lia).
    entailer!.
  - rewrite Z.quot_div_nonneg by lia.
    apply Z.div_lt_upper_bound; try lia.
    pose proof (idmax_le_8_quot_ceil8 m.(idmax) ltac:(unfold id_map_bytes_ok in H0; lia)) as Hceil.
    lia.
  - rewrite Z.quot_div_nonneg by lia.
    apply Z.div_pos; lia.
Qed.
