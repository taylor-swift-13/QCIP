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
From SimpleC.EE.OUTPUT.xizi.xizi_single_link_append.source Require Import xizi_single_link_append_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_single_link_append.source Require Import xizi_single_link_append_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_single_link_common Require Import xizi_single_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_single_link_append.source Require Import xizi_single_link_append_lib.
Local Open Scope sac.

Lemma proof_of_AppendSingleLinkList_entail_wit_1 : AppendSingleLinkList_entail_wit_1.
Proof.
  pre_process.
  sep_apply (payload_head_factor__remove_payloads A storeA l linklist_pre).
  entailer!.
Qed. 

Lemma proof_of_AppendSingleLinkList_entail_wit_2 : AppendSingleLinkList_entail_wit_2.
Proof.
  aggressive_pre_process; reflexivity.
Qed. 

Lemma proof_of_AppendSingleLinkList_entail_wit_3 : AppendSingleLinkList_entail_wit_3.
Proof.
  aggressive_pre_process.
  Exists (l1a_2 ++ (node :: nil)) l0.
  change "SingleLinklistNode" with xizi_struct_name.
  change "node_next" with xizi_next_field.
  sep_apply (xizi_sllseg_len1 node next_2 ltac:(assumption)).
  sep_apply (xizi_sllseg_sllseg linklist_pre node next_2 l1a_2 (node :: nil)).
  entailer!.
  subst l1b_2. rewrite <- app_assoc. simpl. assumption.
Qed. 

Lemma proof_of_AppendSingleLinkList_return_wit_1 : AppendSingleLinkList_return_wit_1.
Proof.
  pre_process.
  subst next.
  sep_apply (xizi_sll_zero 0 l1b eq_refl).
  Intros. subst l1b.
  change "SingleLinklistNode" with xizi_struct_name.
  change "node_next" with xizi_next_field.
  sep_apply (xizi_sll_len1 linklist_node_pre 0 ltac:(assumption) eq_refl).
  sep_apply (xizi_sll_cons node linklist_node_pre (linklist_node_pre :: nil) ltac:(assumption)).
  sep_apply (xizi_sllseg_sll linklist_pre node l1a (node :: linklist_node_pre :: nil)).
  sep_apply (payloads_append_singleton__append_payload A storeA l data linklist_node_pre).
  assert (Heq : l1a ++ node :: linklist_node_pre :: nil =
    linklist_pre :: xizi_sll_payload_addresses (l ++ Build_sll_payload_node data linklist_node_pre :: nil)).
  { unfold xizi_sll_payload_addresses in *. rewrite map_app. simpl.
    change (l1a ++ (node :: nil) ++ (linklist_node_pre :: nil) =
      (linklist_pre :: map sll_payload_ptr l) ++ (linklist_node_pre :: nil)).
    rewrite app_assoc. f_equal. symmetry. exact PreH1. }
  rewrite Heq at 1.
  sep_apply (xizi_sll_head_from_cons linklist_pre (xizi_sll_payload_addresses (l ++ Build_sll_payload_node data linklist_node_pre :: nil))).
  sep_apply (payload_head_unfactor__remove_payloads A storeA (l ++ Build_sll_payload_node data linklist_node_pre :: nil) linklist_pre).
  entailer!.
Qed. 

