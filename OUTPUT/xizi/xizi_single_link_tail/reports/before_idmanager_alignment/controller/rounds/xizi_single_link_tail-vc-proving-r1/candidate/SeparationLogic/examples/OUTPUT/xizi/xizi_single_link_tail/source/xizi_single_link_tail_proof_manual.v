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
From SimpleC.EE.OUTPUT.xizi.xizi_single_link_tail.source Require Import xizi_single_link_tail_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_single_link_tail.source Require Import xizi_single_link_tail_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_single_link_common Require Import xizi_single_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_single_link_tail.source Require Import xizi_single_link_tail_lib.
Local Open Scope sac.

Lemma proof_of_SingleLinkListGetTailNode_entail_wit_1 : SingleLinkListGetTailNode_entail_wit_1.
Proof.
  pre_process.
  apply payload_head_factor__remove_payloads.
Qed. 

Lemma proof_of_SingleLinkListGetTailNode_entail_wit_2 : SingleLinkListGetTailNode_entail_wit_2.
Proof.
  aggressive_pre_process.
  entailer!.
Qed. 

Lemma proof_of_SingleLinkListGetTailNode_entail_wit_3 : SingleLinkListGetTailNode_entail_wit_3.
Proof.
  aggressive_pre_process.
  Exists (l1_2 ++ current :: nil) l0.
  pose proof (xizi_sllseg_len1 current next_2 PreH3) as Hseg.
  unfold xizi_struct_name, xizi_next_field in Hseg.
  sep_apply Hseg.
  sep_apply (xizi_sllseg_sllseg first_2 current next_2 l1_2 (current :: nil)).
  entailer!.
  subst l2_2. rewrite <- app_assoc. simpl. assumption.
Qed. 

Lemma proof_of_SingleLinkListGetTailNode_return_wit_1 : SingleLinkListGetTailNode_return_wit_1.
Proof.
  pre_process.
  subst next.
  sep_apply (xizi_sll_zero 0 l2 eq_refl).
  Intros. subst l2.
  split_pure_spatial.
  - pose proof (xizi_sll_len1 current 0 PreH2 eq_refl) as Hnode.
    unfold xizi_struct_name, xizi_next_field in Hnode.
    sep_apply Hnode.
    sep_apply (xizi_sllseg_sll first current l1 (current :: nil)).
    sep_apply_r_atomic (payload_head_unfactor__remove_payloads A storeA l linklist_pre).
    rewrite PreH1.
    unfold xizi_sll_head, generic_sll_head, xizi_head_store, sll_head_store, sll_link,
      xizi_struct_name, xizi_next_field.
    Exists first. entailer!.
  - rewrite PreH1. rewrite xizi_sll_tail_value_app_last. entailer!.
Qed. 

Lemma proof_of_SingleLinkListGetTailNode_return_wit_2 : SingleLinkListGetTailNode_return_wit_2.
Proof.
  pre_process.
  subst q.
  split_pure_spatial.
  - sep_apply_r_atomic (payload_head_unfactor__remove_payloads A storeA l linklist_pre).
    unfold xizi_sll_head, generic_sll_head, xizi_head_store, sll_head_store, sll_link,
      xizi_struct_name, xizi_next_field.
    Exists 0. entailer!.
  - sep_apply (xizi_sll_zero 0 (xizi_sll_payload_addresses l) eq_refl).
    Intros. rewrite H. unfold xizi_sll_tail_value. simpl. entailer!.
Qed. 

