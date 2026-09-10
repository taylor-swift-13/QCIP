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
From SimpleC.EE.OUTPUT.xizi.xizi_single_link_remove_node.source Require Import xizi_single_link_remove_node_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_single_link_remove_node.source Require Import xizi_single_link_remove_node_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_single_link_common Require Import xizi_single_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_single_link_remove_node.source Require Import xizi_single_link_remove_node_lib.
Local Open Scope sac.

Lemma proof_of_SingleLinkListRmNode_entail_wit_1 : SingleLinkListRmNode_entail_wit_1.
Proof.
pre_process.
 sep_apply (payload_head_factor__remove_payloads A storeA_strong_spec l_strong_spec linklist_pre).
 unfold xizi_sll_head, generic_sll_head. Intros first. Intros.
 rewrite PreH1. unfold xizi_sll_payload_addresses. rewrite map_app. simpl.
 fold xizi_sll. unfold xizi_head_store, sll_head_store, sll_link.
 sep_apply (xizi_sll_head_split_target linklist_pre first (map sll_payload_ptr l1_strong_spec) linklist_node_pre (map sll_payload_ptr l2_strong_spec) H).
 Exists (xizi_sll_first_value (map sll_payload_ptr l2_strong_spec)). entailer!.
Qed. 

Lemma proof_of_SingleLinkListRmNode_entail_wit_2 : SingleLinkListRmNode_entail_wit_2.
Proof.
aggressive_pre_process. entailer!.
Qed. 

Lemma proof_of_SingleLinkListRmNode_entail_wit_3 : SingleLinkListRmNode_entail_wit_3.
Proof.
aggressive_pre_process.
 Exists (l1a_2 ++ node :: nil) l0.
 fold xizi_struct_name xizi_next_field.
 sep_apply (xizi_sllseg_len1 node next_2 PreH7).
 sep_apply (xizi_sllseg_sllseg linklist_pre node next_2 l1a_2 (node :: nil)).
 entailer!. rewrite <- app_assoc. simpl. rewrite <- PreH1. exact PreH6.
Qed. 

Lemma proof_of_SingleLinkListRmNode_return_wit_1 : SingleLinkListRmNode_return_wit_1.
Proof.
aggressive_pre_process. subst next.
 fold xizi_struct_name xizi_next_field.
 sep_apply (xizi_sll_to_target_same linklist_node_pre l1b). Intros.
 subst l1b. rewrite PreH4.
 sep_apply (payloads_remove_split__remove_payloads A storeA_strong_spec l1_strong_spec l2_strong_spec a_strong_spec linklist_node_pre).
 sep_apply (xizi_sll_cons node (xizi_sll_first_value (xizi_sll_payload_addresses l2_strong_spec)) (xizi_sll_payload_addresses l2_strong_spec) PreH7).
 sep_apply (xizi_sllseg_sll linklist_pre node l1a (node :: xizi_sll_payload_addresses l2_strong_spec)).
 assert (E: l1a ++ node :: xizi_sll_payload_addresses l2_strong_spec = linklist_pre :: xizi_sll_payload_addresses (l1_strong_spec ++ l2_strong_spec)).
 { unfold xizi_sll_payload_addresses in *. rewrite map_app.
   pose proof (f_equal (fun k => k ++ map sll_payload_ptr l2_strong_spec) PreH6) as Ep.
   cbn beta in Ep. rewrite <- app_assoc in Ep. simpl in Ep. symmetry. exact Ep. }
 setoid_rewrite E. sep_apply (xizi_sll_head_from_cons linklist_pre (xizi_sll_payload_addresses (l1_strong_spec ++ l2_strong_spec))).
 sep_apply (payload_head_unfactor__remove_payloads A storeA_strong_spec (l1_strong_spec ++ l2_strong_spec) linklist_pre). entailer!.
Qed. 

Lemma proof_of_SingleLinkListRmNode_return_wit_2 : SingleLinkListRmNode_return_wit_2.
Proof.
pre_process. subst next.
 sep_apply (xizi_sll_to_target_zero_nonzero linklist_node_pre l1b PreH4).
 entailer!.
Qed. 

Lemma proof_of_SingleLinkListRmNode_derive_remove_tail_spec_by_strong_spec : SingleLinkListRmNode_derive_remove_tail_spec_by_strong_spec.
Proof.
pre_process.
 prop_apply (payload_member_nonzero__remove_payloads A storeA_remove_tail_spec linklist_pre prefix_remove_tail_spec a_remove_tail_spec linklist_node_pre nil). Intros.
 Exists A storeA_remove_tail_spec a_remove_tail_spec (prefix_remove_tail_spec ++ Build_sll_payload_node a_remove_tail_spec linklist_node_pre :: nil) prefix_remove_tail_spec nil.
 apply sepcon_cancel_end.
 - entailer!.
 - apply derivable1_wand_sepcon_adjoint. Intros q retval. Intros.
   unfold xizi_sll_node. sep_apply store_ptr_undef_store_ptr.
   simpl. rewrite ?app_nil_r. entailer!.
Qed. 

Lemma proof_of_SingleLinkListRmNode_derive_remove_front_spec_by_strong_spec : SingleLinkListRmNode_derive_remove_front_spec_by_strong_spec.
Proof.
pre_process.
 prop_apply (payload_member_nonzero__remove_payloads A storeA_remove_front_spec linklist_pre nil a_remove_front_spec linklist_node_pre suffix_remove_front_spec). Intros.
 Exists A storeA_remove_front_spec a_remove_front_spec (nil ++ Build_sll_payload_node a_remove_front_spec linklist_node_pre :: suffix_remove_front_spec) nil suffix_remove_front_spec.
 apply sepcon_cancel_end.
 - entailer!.
 - apply derivable1_wand_sepcon_adjoint. Intros q retval. Intros.
   unfold xizi_sll_node. sep_apply store_ptr_undef_store_ptr.
   simpl. rewrite ?app_nil_r. entailer!.
Qed. 

Lemma proof_of_SingleLinkListRmNode_derive_remove_member_spec_by_strong_spec : SingleLinkListRmNode_derive_remove_member_spec_by_strong_spec.
Proof.
pre_process.
 destruct (payload_first_occurrence__remove_payloads A linklist_node_pre l_remove_member_spec H) as (a & p & s & E & Hnot & Hr).
 rewrite E.
 prop_apply (payload_member_nonzero__remove_payloads A storeA_remove_member_spec linklist_pre p a linklist_node_pre s). Intros.
 Exists A storeA_remove_member_spec a (p ++ Build_sll_payload_node a linklist_node_pre :: s) p s.
 apply sepcon_cancel_end.
 - entailer!.
 - apply derivable1_wand_sepcon_adjoint. Intros q retval. Intros.
   Exists a (p ++ s). unfold xizi_sll_node. sep_apply store_ptr_undef_store_ptr.
   entailer!. rewrite <- E. exact Hr.
Qed. 

