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
  sep_apply_l_atomic (dll_decompose__storeA_shared storeA_dispatch_case linklist_pre nodes_dispatch_case).
  destruct (Z.eq_dec linklist_node_pre linklist_pre) as [Heq|Hneq].
  - Right. subst linklist_node_pre.
    unfold xizi_dll, XiziDLL.dll. Intros first last. Intros.
    fold xizi_dllseg. fold xizi_dll_links.
    prop_apply_p (seg_nonzero__dll_next_rec_last_dispatch (xizi_dll_ptrs nodes_dispatch_case) first linklist_pre linklist_pre last H).
    Exists last first. unfold xizi_dll_links, XiziDLL.links.
    unfold xizi_double_link_next_dispatch_value.
    destruct (Z.eq_dec linklist_pre linklist_pre); [entailer!|contradiction].
  - Left. unfold xizi_double_link_next_anchor in PreH1.
    destruct PreH1 as [Hin|Heq]; [|contradiction].
    destruct (xizi_double_link_first_occurrence_split__double_link_get_next_dispatch _ _ Hin)
      as [before [after [Hshape Hfresh]]].
    rewrite Hshape.
    sep_apply_l_atomic (dll_expose__dll_next_rec_last_dispatch linklist_pre before linklist_node_pre after Hfresh).
    Intros first last prev next. Exists prev last next before after first.
    unfold xizi_dll_links, XiziDLL.links.
    rewrite (xizi_double_link_dispatch_first_occurrence__double_link_get_next_dispatch before after linklist_pre linklist_node_pre Hneq Hfresh).
    entailer!.
Qed. 

Lemma proof_of_DoubleLinkListGetNext_return_wit_1 : DoubleLinkListGetNext_return_wit_1.
Proof.
  pre_process.
  prop_apply_p (seg_first__dll_next_rec_last_dispatch (xizi_dll_ptrs nodes_dispatch_case) first linklist_pre linklist_pre last).
  Intros_p Hfirst.
  subst linklist_node_pre.
  split_pure_spatial.
  - sep_apply_r_atomic (dll_compose__storeA_shared storeA_dispatch_case linklist_pre nodes_dispatch_case).
    sep_apply_r_atomic (xizi_dll_close linklist_pre first last (xizi_dll_ptrs nodes_dispatch_case) PreH2).
    unfold xizi_dll_links, XiziDLL.links. entailer!.
  - dump_pre_spatial. rewrite PreH5. symmetry. apply Hfirst. exact PreH1.
Qed. 

Lemma proof_of_DoubleLinkListGetNext_return_wit_2 : DoubleLinkListGetNext_return_wit_2.
Proof.
  pre_process.
  prop_apply_p (seg_first__dll_next_rec_last_dispatch nodes_after node_next linklist_node_pre linklist_pre last).
  Intros_p Hfirst.
  split_pure_spatial.
  - sep_apply_r_atomic (dll_compose__storeA_shared storeA_dispatch_case linklist_pre nodes_dispatch_case).
    rewrite PreH4.
    sep_apply_r_atomic (dll_reassemble__dll_next_rec_last_dispatch linklist_pre first last linklist_node_pre node_prev node_next nodes_before nodes_after PreH2 PreH7 PreH8).
    unfold xizi_dll_links, XiziDLL.links. entailer!.
  - dump_pre_spatial. rewrite PreH6. symmetry. apply Hfirst. exact PreH1.
Qed. 

Lemma proof_of_DoubleLinkListGetNext_return_wit_3 : DoubleLinkListGetNext_return_wit_3.
Proof.
  pre_process.
  prop_apply_p (seg_first__dll_next_rec_last_dispatch nodes_after node_next linklist_node_pre linklist_pre last).
  Intros_p Hfirst.
  split_pure_spatial.
  - sep_apply_r_atomic (dll_compose__storeA_shared storeA_dispatch_case linklist_pre nodes_dispatch_case).
    rewrite PreH4.
    sep_apply_r_atomic (dll_reassemble__dll_next_rec_last_dispatch linklist_pre first last linklist_node_pre node_prev node_next nodes_before nodes_after PreH2 PreH7 PreH8).
    unfold xizi_dll_links, XiziDLL.links. entailer!.
  - dump_pre_spatial. rewrite PreH6. symmetry. apply Hfirst. exact PreH1.
Qed. 

Lemma proof_of_DoubleLinkListGetNext_return_wit_4 : DoubleLinkListGetNext_return_wit_4.
Proof.
  pre_process.
  prop_apply_p (seg_first__dll_next_rec_last_dispatch (xizi_dll_ptrs nodes_dispatch_case) first linklist_pre linklist_pre last).
  Intros_p Hfirst.
  subst linklist_node_pre.
  split_pure_spatial.
  - sep_apply_r_atomic (dll_compose__storeA_shared storeA_dispatch_case linklist_pre nodes_dispatch_case).
    sep_apply_r_atomic (xizi_dll_close linklist_pre first last (xizi_dll_ptrs nodes_dispatch_case) PreH2).
    unfold xizi_dll_links, XiziDLL.links. entailer!.
  - dump_pre_spatial. rewrite PreH5. symmetry. apply Hfirst. exact PreH1.
Qed. 

Lemma proof_of_DoubleLinkListGetNext_derive_sentinel_case_by_dispatch_case : DoubleLinkListGetNext_derive_sentinel_case_by_dispatch_case.
Proof.
  pre_process.
  Exists A storeA_sentinel_case nodes_sentinel_case.
  rewrite <- (logic_equiv_sepcon_emp (xizi_store_dll storeA_sentinel_case linklist_pre nodes_sentinel_case)) at 1.
  apply derivable1_sepcon_mono.
  - unfold xizi_double_link_next_anchor. entailer!.
  - apply_sepcon_adjoint.
  Intros retval. Intros.
  Exists retval.
  unfold xizi_double_link_next_anchor, xizi_double_link_next_dispatch_value in *.
  subst linklist_node_pre.
  destruct (Z.eq_dec linklist_pre linklist_pre); [entailer!|contradiction].
Qed. 

Lemma proof_of_DoubleLinkListGetNext_derive_member_case_by_dispatch_case : DoubleLinkListGetNext_derive_member_case_by_dispatch_case.
Proof.
  pre_process.
  prop_apply_p (store_member_exclude__dll_next_rec_last_dispatch A storeA_member_case linklist_pre nodes_member_case linklist_node_pre H).
  Intros_p Hneq.
  Exists A storeA_member_case nodes_member_case.
  rewrite <- (logic_equiv_sepcon_emp (xizi_store_dll storeA_member_case linklist_pre nodes_member_case)) at 1.
  apply derivable1_sepcon_mono.
  - unfold xizi_double_link_next_anchor. entailer!.
  - apply_sepcon_adjoint.
  Intros retval. Intros. Exists retval.
  unfold xizi_double_link_next_anchor, xizi_double_link_next_dispatch_value in *.
  destruct (Z.eq_dec linklist_node_pre linklist_pre); [contradiction|entailer!].
Qed. 

