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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next_rec_last.source Require Import xizi_double_link_next_rec_last_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next_rec_last.source Require Import xizi_double_link_next_rec_last_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next_rec_last.source Require Import xizi_double_link_next_rec_last_lib.
Local Open Scope sac.

Lemma proof_of_DoubleLinkListGetNext_entail_wit_1 : DoubleLinkListGetNext_entail_wit_1.
Proof.
 pre_process.
 destruct PreH1 as [Hin|Heq].
 - destruct (xizi_double_link_first_occurrence_split__double_link_get_next_dispatch _ _ Hin) as [before [after [Hxs Hnot]]].
   Left.
   sep_apply_l_atomic (dll_decompose__storeA_shared storeA_dispatch_case linklist_pre nodes_dispatch_case).
   rewrite Hxs.
   sep_apply_l_atomic (dll_expose__dll_next_rec_last_payload_dispatch linklist_pre before linklist_node_pre after Hnot).
   Intros first last prev next. Intros.
   Exists prev last next before after first.
   unfold xizi_dll_links, XiziDLL.links, XiziDoubleLinkLayout.struct_name, XiziDoubleLinkLayout.next_field, XiziDoubleLinkLayout.prev_field.
   entailer!.
   apply xizi_double_link_dispatch_first_occurrence__double_link_get_next_dispatch; auto.
 - Right. subst linklist_node_pre.
   sep_apply_l_atomic (dll_decompose__storeA_shared storeA_dispatch_case linklist_pre nodes_dispatch_case).
   unfold xizi_dll, XiziDLL.dll. Intros first last. Intros. fold xizi_dllseg.
   prop_apply_p (seg_nonzero__dll_next_rec_last_payload_dispatch (xizi_dll_ptrs nodes_dispatch_case) first linklist_pre linklist_pre last H).
   Exists last first.
   unfold XiziDLL.links, XiziDoubleLinkLayout.struct_name, XiziDoubleLinkLayout.next_field, XiziDoubleLinkLayout.prev_field.
   entailer!.
   unfold xizi_double_link_next_dispatch_value. destruct (Z.eq_dec linklist_pre linklist_pre); congruence.
Qed. 

Lemma proof_of_DoubleLinkListGetNext_return_wit_1 : DoubleLinkListGetNext_return_wit_1.
Proof.
 pre_process.
 prop_apply_p (seg_first__dll_next_rec_last_payload_dispatch (xizi_dll_ptrs nodes_dispatch_case) first linklist_pre linklist_pre last).
 Intros.
 split_pure_spatial.
 - sep_apply_r_atomic (dll_compose__storeA_shared storeA_dispatch_case linklist_pre nodes_dispatch_case).
   sep_apply_r_atomic (xizi_dll_close linklist_pre first last (xizi_dll_ptrs nodes_dispatch_case) PreH2).
   subst linklist_node_pre.
   unfold xizi_dll_links, XiziDLL.links, XiziDoubleLinkLayout.struct_name, XiziDoubleLinkLayout.next_field, XiziDoubleLinkLayout.prev_field.
   entailer!.
 - dump_pre_spatial. rewrite PreH5. destruct H; symmetry; auto.
Qed. 

Lemma proof_of_DoubleLinkListGetNext_return_wit_2 : DoubleLinkListGetNext_return_wit_2.
Proof.
 pre_process.
 prop_apply_p (seg_first__dll_next_rec_last_payload_dispatch nodes_after node_next linklist_node_pre linklist_pre last).
 Intros.
 split_pure_spatial.
 - sep_apply_r_atomic (dll_compose__storeA_shared storeA_dispatch_case linklist_pre nodes_dispatch_case).
   rewrite PreH4.
   sep_apply_r_atomic (dll_reassemble__dll_next_rec_last_payload_dispatch linklist_pre first last linklist_node_pre node_prev node_next nodes_before nodes_after PreH2 PreH7 PreH8).
   unfold xizi_dll_links, XiziDLL.links, XiziDoubleLinkLayout.struct_name, XiziDoubleLinkLayout.next_field, XiziDoubleLinkLayout.prev_field.
   entailer!.
 - dump_pre_spatial. rewrite PreH6. destruct H; symmetry; auto.
Qed. 

Lemma proof_of_DoubleLinkListGetNext_return_wit_3 : DoubleLinkListGetNext_return_wit_3.
Proof.
 pre_process.
 prop_apply_p (seg_first__dll_next_rec_last_payload_dispatch nodes_after node_next linklist_node_pre linklist_pre last).
 Intros.
 split_pure_spatial.
 - sep_apply_r_atomic (dll_compose__storeA_shared storeA_dispatch_case linklist_pre nodes_dispatch_case).
   rewrite PreH4.
   sep_apply_r_atomic (dll_reassemble__dll_next_rec_last_payload_dispatch linklist_pre first last linklist_node_pre node_prev node_next nodes_before nodes_after PreH2 PreH7 PreH8).
   unfold xizi_dll_links, XiziDLL.links, XiziDoubleLinkLayout.struct_name, XiziDoubleLinkLayout.next_field, XiziDoubleLinkLayout.prev_field.
   entailer!.
 - dump_pre_spatial. rewrite PreH6. destruct H; symmetry; auto.
Qed. 

Lemma proof_of_DoubleLinkListGetNext_return_wit_4 : DoubleLinkListGetNext_return_wit_4.
Proof.
 pre_process.
 prop_apply_p (seg_first__dll_next_rec_last_payload_dispatch (xizi_dll_ptrs nodes_dispatch_case) first linklist_pre linklist_pre last).
 Intros.
 split_pure_spatial.
 - sep_apply_r_atomic (dll_compose__storeA_shared storeA_dispatch_case linklist_pre nodes_dispatch_case).
   sep_apply_r_atomic (xizi_dll_close linklist_pre first last (xizi_dll_ptrs nodes_dispatch_case) PreH2).
   subst linklist_node_pre.
   unfold xizi_dll_links, XiziDLL.links, XiziDoubleLinkLayout.struct_name, XiziDoubleLinkLayout.next_field, XiziDoubleLinkLayout.prev_field.
   entailer!.
 - dump_pre_spatial. rewrite PreH5. destruct H; symmetry; auto.
Qed. 

Lemma proof_of_DoubleLinkListGetNext_derive_sentinel_case_by_dispatch_case : DoubleLinkListGetNext_derive_sentinel_case_by_dispatch_case.
Proof.
 pre_process.
 Exists A storeA_sentinel_case nodes_sentinel_case.
 apply sepcon_cancel_end.
 - entailer!. unfold xizi_double_link_next_anchor. auto.
 - apply derivable1_wand_sepcon_adjoint.
   Intros retval. Exists retval. entailer!.
   subst linklist_node_pre.
   unfold xizi_double_link_next_dispatch_value in H0.
   destruct (Z.eq_dec linklist_pre linklist_pre); congruence.
Qed. 

Lemma proof_of_DoubleLinkListGetNext_derive_member_case_by_dispatch_case : DoubleLinkListGetNext_derive_member_case_by_dispatch_case.
Proof.
 pre_process.
 prop_apply_p (store_member_exclude__dll_next_rec_last_payload_dispatch A storeA_member_case linklist_pre nodes_member_case linklist_node_pre H).
 Intros.
 Exists A storeA_member_case nodes_member_case.
 apply sepcon_cancel_end.
 - entailer!. unfold xizi_double_link_next_anchor. auto.
 - apply derivable1_wand_sepcon_adjoint.
   Intros retval. Exists retval. entailer!.
   unfold xizi_double_link_next_dispatch_value in H1.
   destruct (Z.eq_dec linklist_node_pre linklist_pre); congruence.
Qed. 

