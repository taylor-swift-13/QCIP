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
  apply (payload_head_factor__remove_payloads A storeA l linklist_pre).
Qed. 

Lemma proof_of_SingleLinkListGetTailNode_entail_wit_2 : SingleLinkListGetTailNode_entail_wit_2.
Proof.
  pre_process.
  unfold xizi_sll_head, generic_sll_head.
  Intros next. Intros.
  Exists next (@nil Z) (xizi_sll_payload_addresses l).
  unfold xizi_sllseg. simpl.
  unfold xizi_head_store, sll_head_store.
  entailer!.
Qed. 

Lemma proof_of_SingleLinkListGetTailNode_entail_wit_3 : SingleLinkListGetTailNode_entail_wit_3.
Proof.
  pre_process.
  change "SingleLinklistNode" with xizi_struct_name.
  change "node_next" with xizi_next_field.
  sep_apply (xizi_sll_not_zero next_2 l2_2 ltac:(assumption)).
  Intros q suffix. Intros.
  Exists q (l1_2 ++ (linklist :: nil)) suffix.
  sep_apply (xizi_sllseg_len1 linklist next_2 ltac:(assumption)).
  sep_apply (xizi_sllseg_sllseg linklist_pre linklist next_2 l1_2 (linklist :: nil)).
  entailer!.
  subst l2_2. rewrite <- app_assoc. exact PreH1.
Qed. 

Lemma proof_of_SingleLinkListGetTailNode_return_wit_1 : SingleLinkListGetTailNode_return_wit_1.
Proof.
  pre_process.
  change "SingleLinklistNode" with xizi_struct_name.
  change "node_next" with xizi_next_field.
  subst next.
  sep_apply (xizi_sll_zero 0 l2 eq_refl).
  Intros. subst l2.
  sep_apply (xizi_sll_len1 linklist 0 ltac:(assumption) eq_refl).
  sep_apply (xizi_sllseg_sll linklist_pre linklist l1 (linklist :: nil)).
  unfold addr in *.
  rewrite <- PreH1.
  sep_apply (xizi_sll_tail_cons_head linklist_pre (xizi_sll_payload_addresses l)).
  sep_apply (payload_head_unfactor__remove_payloads A storeA l linklist_pre).
  entailer!.
  eapply tail_of_sentinel_decomposition__tail_traversal. exact PreH1.
Qed. 

