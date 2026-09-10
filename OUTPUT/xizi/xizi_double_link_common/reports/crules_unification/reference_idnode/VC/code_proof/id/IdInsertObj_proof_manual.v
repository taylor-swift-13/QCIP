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
From CRTOS_Verify.VC.code.id Require Import IdInsertObj_goal.
From CRTOS_Verify.VC.code.id Require Import IdInsertObj_proof_auto.
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

Lemma proof_of_IdInsertObj_entail_wit_1_alloc_succeeded_split_goal_spatial : IdInsertObj_entail_wit_1_alloc_succeeded_split_goal_spatial.
Proof. Abort.

Lemma proof_of_IdInsertObj_entail_wit_1_alloc_succeeded : IdInsertObj_entail_wit_1_alloc_succeeded.
Proof.
  unfold IdInsertObj_entail_wit_1_alloc_succeeded.
  left; intros; subst.
  unfold store_idnode_unlinked, store_idnode, idmanager_storeA.
  Exists idnode_pre.
  entailer!; csimpl; entailer!.
Qed.

Lemma proof_of_IdInsertObj_return_wit_1_alloc_succeeded_split_goal_spatial : IdInsertObj_return_wit_1_alloc_succeeded_split_goal_spatial.
Proof. Abort.

Lemma proof_of_IdInsertObj_return_wit_1_alloc_succeeded : IdInsertObj_return_wit_1_alloc_succeeded.
Proof.
  unfold IdInsertObj_return_wit_1_alloc_succeeded.
  left; intros.
  unfold store_idmanager_insert_post.
  right; entailer!.
  split; [exact PreH1 | exact H].
Qed.

Lemma proof_of_IdInsertObj_return_wit_2_alloc_failed_split_goal_spatial : IdInsertObj_return_wit_2_alloc_failed_split_goal_spatial.
Proof. Abort.

Lemma proof_of_IdInsertObj_return_wit_2_alloc_failed : IdInsertObj_return_wit_2_alloc_failed.
Proof.
  unfold IdInsertObj_return_wit_2_alloc_failed.
  left; intros; subst.
  unfold store_idmanager_insert_post.
  left; entailer!.
  split; [reflexivity | exact H].
Qed.

Lemma proof_of_IdInsertObj_which_implies_wit_1 : IdInsertObj_which_implies_wit_1.
Proof.
  unfold IdInsertObj_which_implies_wit_1, store_idmanager_allocid_post.
  intros.
  rewrite derivable1_orp_sepcon_l.
  apply derivable1_orp_elim.
  - Right; entailer!;
      try (apply idmanager_first_free_id_some_min; tauto);
      try tauto;
      try (pose proof (idmanager_first_free_id_some_min m alloc_id_ret ltac:(tauto));
           unfold idmanager_min_free_id in *; lia).
  - Left; entailer!.
Qed.

Lemma proof_of_IdInsertObj_which_implies_wit_2 : IdInsertObj_which_implies_wit_2.
Proof.
  unfold IdInsertObj_which_implies_wit_2, store_idnode_insert_ready.
  left; intros; Intros.
  Exists alloc_id_ret.
  entailer!.
Qed.
