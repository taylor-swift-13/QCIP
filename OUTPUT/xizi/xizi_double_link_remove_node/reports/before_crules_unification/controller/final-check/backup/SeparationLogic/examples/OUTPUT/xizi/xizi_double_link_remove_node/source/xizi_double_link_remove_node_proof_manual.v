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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_remove_node.source Require Import xizi_double_link_remove_node_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_remove_node.source Require Import xizi_double_link_remove_node_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_remove_node.source Require Import xizi_double_link_remove_node_lib.
Local Open Scope sac.

Lemma proof_of_DoubleLinkListRmNode_entail_wit_1 : DoubleLinkListRmNode_entail_wit_1.
Proof.
 pre_process. subst nodes_strong_spec. subst linklist_node_pre.
 sep_apply_l_atomic (dll_decompose__storeA_remove storeA_strong_spec head_strong_spec (prefix_strong_spec ++ removed_strong_spec :: suffix_strong_spec)).
 sep_apply_l_atomic (payloads_split__storeA_remove storeA_strong_spec prefix_strong_spec (removed_strong_spec :: suffix_strong_spec)).
 unfold xizi_dll_ptrs; rewrite map_app; simpl map.
 sep_apply_l_atomic (xizi_dll_split_at_node__dll_cut_split_reconnect head_strong_spec (map XiziStoreADLL.getPtr prefix_strong_spec) (XiziStoreADLL.getPtr removed_strong_spec) (map XiziStoreADLL.getPtr suffix_strong_spec)).
 Intros node_next node_prev. Exists node_next node_prev.
 unfold xizi_dll_next, xizi_dll_prev, xizi_dll_payloads; simpl.
 entailer!.
Qed. 

Lemma proof_of_DoubleLinkListRmNode_return_wit_1 : DoubleLinkListRmNode_return_wit_1.
Proof.
 pre_process.
 pose proof (xizi_dll_remove_result__dll_cut_split_reconnect head_strong_spec (xizi_dll_ptrs prefix_strong_spec) (xizi_dll_ptrs suffix_strong_spec) linklist_node_pre node_next node_prev PreH1) as Hr.
 unfold xizi_dll_next, xizi_dll_prev, XiziDoubleLinkLayout.struct_name, XiziDoubleLinkLayout.next_field, XiziDoubleLinkLayout.prev_field in Hr.
 sep_apply_l_atomic Hr.
 sep_apply_l_atomic (payloads_join__storeA_remove storeA_strong_spec prefix_strong_spec suffix_strong_spec).
 assert (Hp : xizi_dll_ptrs (prefix_strong_spec ++ suffix_strong_spec) = xizi_dll_ptrs prefix_strong_spec ++ xizi_dll_ptrs suffix_strong_spec) by (unfold xizi_dll_ptrs; apply map_app).
 pose proof (dll_compose__storeA_remove storeA_strong_spec head_strong_spec (prefix_strong_spec ++ suffix_strong_spec)) as Hc.
 rewrite Hp in Hc.
 sep_apply_r_atomic Hc.
 entailer!.
Qed. 

Lemma proof_of_DoubleLinkListRmNode_derive_remove_tail_spec_by_strong_spec : DoubleLinkListRmNode_derive_remove_tail_spec_by_strong_spec.
Proof.
 pre_process.
 Exists A storeA_remove_tail_spec head_remove_tail_spec removed_remove_tail_spec (prefix_remove_tail_spec ++ removed_remove_tail_spec :: nil) prefix_remove_tail_spec (@nil (XiziStoreADLL.DL_Node A)).
 rewrite app_nil_r. entailer!.
 apply derivable1_wand_sepcon_adjoint. entailer!.
Qed. 

Lemma proof_of_DoubleLinkListRmNode_derive_remove_front_spec_by_strong_spec : DoubleLinkListRmNode_derive_remove_front_spec_by_strong_spec.
Proof.
 pre_process.
 Exists A storeA_remove_front_spec head_remove_front_spec removed_remove_front_spec (removed_remove_front_spec :: suffix_remove_front_spec) (@nil (XiziStoreADLL.DL_Node A)) suffix_remove_front_spec.
 simpl app. entailer!.
 apply derivable1_wand_sepcon_adjoint. entailer!.
Qed. 

Lemma proof_of_DoubleLinkListRmNode_derive_remove_member_spec_by_strong_spec : DoubleLinkListRmNode_derive_remove_member_spec_by_strong_spec.
Proof.
 pre_process.
 destruct (first_split__storeA_remove linklist_node_pre nodes_remove_member_spec H) as (prefix & removed & suffix & Hnodes & Hptr & Hremove).
 Exists A storeA_remove_member_spec head_remove_member_spec removed nodes_remove_member_spec prefix suffix.
 entailer!.
 apply derivable1_wand_sepcon_adjoint.
 Exists (prefix ++ suffix) removed.
 entailer!.
 unfold xizi_dll_remove_node_rel. split.
 - exists prefix, suffix. auto.
 - rewrite Hptr. exact Hremove.
Qed. 

