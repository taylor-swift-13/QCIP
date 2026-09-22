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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next.source Require Import xizi_double_link_next_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next.source Require Import xizi_double_link_next_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next.source Require Import xizi_double_link_next_lib.
Local Open Scope sac.

Lemma proof_of_DoubleLinkListGetNext_entail_wit_1 : DoubleLinkListGetNext_entail_wit_1.
Proof.
  pre_process.
  sep_apply_l_atomic (XiziLocalDLL.store_dll_decompose storeA_dispatch_case linklist_pre nodes_dispatch_case).
  unfold XiziLocalDLL.addr_store_dll, XiziLocalDLL.store_dll.
  Intros first last.
  fold (XiziLocalDLL.addr_dllseg first linklist_pre linklist_pre last (XiziLocalDLL.ptrs nodes_dispatch_case)).
  destruct (Z.eq_dec linklist_node_pre linklist_pre) as [Heq | Hneq].
  - Right. Exists last first. split_pure_spatial.
    + sepcon_right_assoc. repeat progress cancel.
    + split_pures; dump_pre_spatial; try exact Heq.
      unfold xizi_double_link_next_dispatch_value. destruct (Z.eq_dec linklist_node_pre linklist_pre); congruence.
  - assert (Hin : In linklist_node_pre (XiziLocalDLL.ptrs nodes_dispatch_case)) by
      (unfold xizi_double_link_next_anchor in *; tauto).
    destruct (xizi_double_link_in_first_occurrence__dll_dispatch_forbidden_free _ _ Hin)
      as [before [after [Hnodes Hnotin]]].
    rewrite Hnodes.
    sep_apply_l_atomic (next_addr_segment_cut__next_dispatch_resources before after first linklist_pre linklist_pre last linklist_node_pre).
    Intros p q. Left. Exists q p last first before after.
    split_pure_spatial.
    + sepcon_right_assoc. repeat progress cancel.
    + split_pures; dump_pre_spatial; try reflexivity; try assumption.
      eapply xizi_double_link_next_value_at_first_occurrence__dll_dispatch_forbidden_free; eauto.
Qed. 

Lemma proof_of_DoubleLinkListGetNext_return_wit_1 : DoubleLinkListGetNext_return_wit_1.
Proof.
  pre_process. subst first linklist_node_pre.
  prop_apply_p (next_empty_observation__next_dispatch_resources (XiziLocalDLL.ptrs nodes_dispatch_case) linklist_pre linklist_pre linklist_pre last).
  Intros_p Hempty.
  split_pure_spatial.
  - sep_apply_r_atomic (next_store_close__next_dispatch_resources A storeA_dispatch_case linklist_pre nodes_dispatch_case linklist_pre last). sepcon_right_assoc. repeat progress cancel.
  - dump_pre_spatial. rewrite PreH3, Hempty. reflexivity.
Qed. 

Lemma proof_of_DoubleLinkListGetNext_return_wit_2 : DoubleLinkListGetNext_return_wit_2.
Proof.
  pre_process. subst node_next.
  prop_apply_p (next_empty_observation__next_dispatch_resources nodes_after linklist_pre first linklist_node_pre last).
  Intros_p Hempty.
  split_pure_spatial.
  - sep_apply_l_atomic (next_addr_segment_rejoin__next_dispatch_resources nodes_before nodes_after first linklist_pre linklist_pre last linklist_node_pre node_prev linklist_pre).
    unfold addr in *. rewrite <- PreH2.
    sep_apply_r_atomic (next_store_close__next_dispatch_resources A storeA_dispatch_case linklist_pre nodes_dispatch_case first last). sepcon_right_assoc. repeat progress cancel.
  - dump_pre_spatial. rewrite PreH4, Hempty. reflexivity.
Qed. 

Lemma proof_of_DoubleLinkListGetNext_return_wit_3 : DoubleLinkListGetNext_return_wit_3.
Proof.
  pre_process.
  prop_apply_p (next_nonempty_observation__next_dispatch_resources nodes_after node_next linklist_node_pre linklist_pre last PreH1).
  Intros_p Hnext.
  split_pure_spatial.
  - sep_apply_l_atomic (next_addr_segment_rejoin__next_dispatch_resources nodes_before nodes_after first linklist_pre linklist_pre last linklist_node_pre node_prev node_next).
    unfold addr in *. rewrite <- PreH2.
    sep_apply_r_atomic (next_store_close__next_dispatch_resources A storeA_dispatch_case linklist_pre nodes_dispatch_case first last). sepcon_right_assoc. repeat progress cancel.
  - dump_pre_spatial. rewrite PreH4. exact Hnext.
Qed. 

Lemma proof_of_DoubleLinkListGetNext_return_wit_4 : DoubleLinkListGetNext_return_wit_4.
Proof.
  pre_process. subst linklist_node_pre.
  prop_apply_p (next_nonempty_observation__next_dispatch_resources (XiziLocalDLL.ptrs nodes_dispatch_case) first linklist_pre linklist_pre last PreH1).
  Intros_p Hnext.
  split_pure_spatial.
  - sep_apply_r_atomic (next_store_close__next_dispatch_resources A storeA_dispatch_case linklist_pre nodes_dispatch_case first last). sepcon_right_assoc. repeat progress cancel.
  - dump_pre_spatial. rewrite PreH3. exact Hnext.
Qed. 

Lemma proof_of_DoubleLinkListGetNext_derive_sentinel_case_by_dispatch_case : DoubleLinkListGetNext_derive_sentinel_case_by_dispatch_case.
Proof.
  pre_process.
  Exists A storeA_sentinel_case nodes_sentinel_case.
  apply sepcon_cancel_end.
  - split_pure_spatial.
    + sepcon_right_assoc. repeat progress cancel.
    + dump_pre_spatial. unfold xizi_double_link_next_anchor. tauto.
  - apply derivable1_wand_sepcon_adjoint. Intros retval. rename H0 into Hret.
    Exists retval. split_pure_spatial.
    + sepcon_right_assoc. repeat progress cancel.
    + dump_pre_spatial. rewrite Hret.
      unfold xizi_double_link_next_dispatch_value.
      destruct (Z.eq_dec linklist_node_pre linklist_pre); congruence.
Qed. 

Lemma proof_of_DoubleLinkListGetNext_derive_member_case_by_dispatch_case : DoubleLinkListGetNext_derive_member_case_by_dispatch_case.
Proof.
  pre_process.
  prop_apply_p (next_store_exclusion__next_dispatch_resources A storeA_member_case linklist_pre nodes_member_case).
  Intros_p Hnotin.
  assert (Hneq : linklist_node_pre <> linklist_pre) by (intro Heq; subst; contradiction).
  Exists A storeA_member_case nodes_member_case.
  apply sepcon_cancel_end.
  - split_pure_spatial.
    + sepcon_right_assoc. repeat progress cancel.
    + dump_pre_spatial. unfold xizi_double_link_next_anchor. tauto.
  - apply derivable1_wand_sepcon_adjoint. Intros retval. rename H0 into Hret.
    Exists retval. split_pure_spatial.
    + sepcon_right_assoc. repeat progress cancel.
    + dump_pre_spatial. rewrite Hret.
      unfold xizi_double_link_next_dispatch_value.
      destruct (Z.eq_dec linklist_node_pre linklist_pre); congruence.
Qed. 

