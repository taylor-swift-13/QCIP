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
Import CRules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next.source Require Import xizi_double_link_next_lib.
Import DLL.
Local Open Scope sac.

Lemma proof_of_DoubleLinkListGetNext_entail_wit_1 : DoubleLinkListGetNext_entail_wit_1.
Proof.
  pre_process.
  prop_apply_p (next_store_exclusion__next_dispatch_resources
    A storeA_dispatch_case linklist_pre nodes_dispatch_case).
  Intros_p Hhead_notin.
  unfold xizi_double_link_next_anchor in PreH1.
  destruct PreH1 as [Hin | Heq].
  - Left.
    destruct (xizi_double_link_in_first_occurrence__dll_dispatch_forbidden_free
      (ptrs nodes_dispatch_case) linklist_node_pre Hin)
      as [nodes_before [nodes_after [Hnodes Hnotin]]].
    assert (Hneq : linklist_node_pre <> linklist_pre).
    { intro Heq. subst linklist_node_pre. contradiction. }
    assert (Hvalue : xizi_double_link_next_dispatch_value linklist_pre
      (ptrs nodes_dispatch_case) linklist_node_pre =
      xizi_double_link_first_value nodes_after).
    { apply xizi_double_link_next_value_at_first_occurrence__dll_dispatch_forbidden_free
        with (before := nodes_before); assumption. }
    sep_apply_l_atomic (store_dll_decompose storeA_dispatch_case linklist_pre nodes_dispatch_case).
    unfold addr_store_dll, store_dll. Intros first last.
    fold (addr_dllseg first linklist_pre linklist_pre last (ptrs nodes_dispatch_case)).
    rewrite Hnodes.
    sep_apply_l_atomic (next_addr_segment_cut__next_dispatch_resources
      nodes_before nodes_after first linklist_pre linklist_pre last linklist_node_pre).
    Intros node_prev node_next.
    Exists node_next node_prev last first nodes_before nodes_after.
    entailer!.
    rewrite <- Hnodes. exact Hvalue.
  - Right.
    sep_apply_l_atomic (store_dll_decompose storeA_dispatch_case linklist_pre nodes_dispatch_case).
    unfold addr_store_dll, store_dll. Intros first last.
    fold (addr_dllseg first linklist_pre linklist_pre last (ptrs nodes_dispatch_case)).
    Exists last first.
    entailer!.
    subst linklist_node_pre.
    unfold xizi_double_link_next_dispatch_value.
    destruct (Z.eq_dec linklist_pre linklist_pre); congruence.
Qed.

Lemma proof_of_DoubleLinkListGetNext_return_wit_1 : DoubleLinkListGetNext_return_wit_1.
Proof.
  pre_process.
  subst first. subst linklist_node_pre.
  prop_apply_p (next_empty_observation__next_dispatch_resources
    (ptrs nodes_dispatch_case) linklist_pre linklist_pre linklist_pre last).
  Intros_p Hempty.
  split_pure_spatial.
  - sep_apply_r_atomic (next_store_close__next_dispatch_resources
      A storeA_dispatch_case linklist_pre nodes_dispatch_case linklist_pre last).
    sepcon_right_assoc. repeat progress cancel.
  - dump_pre_spatial. rewrite PreH3, Hempty. reflexivity.
Qed.

Lemma proof_of_DoubleLinkListGetNext_return_wit_2 : DoubleLinkListGetNext_return_wit_2.
Proof.
  pre_process.
  subst node_next.
  prop_apply_p (next_empty_observation__next_dispatch_resources
    nodes_after linklist_pre first linklist_node_pre last).
  Intros_p Hempty.
  sep_apply_l_atomic (next_addr_segment_rejoin__next_dispatch_resources
    nodes_before nodes_after first linklist_pre linklist_pre last
    linklist_node_pre node_prev linklist_pre).
  split_pure_spatial.
  - sep_apply_r_atomic (next_store_close__next_dispatch_resources
      A storeA_dispatch_case linklist_pre nodes_dispatch_case first last).
    sepcon_right_assoc. repeat progress cancel.
    setoid_rewrite <- PreH2. cancel.
  - dump_pre_spatial. rewrite PreH4, Hempty. reflexivity.
Qed.

Lemma proof_of_DoubleLinkListGetNext_return_wit_3 : DoubleLinkListGetNext_return_wit_3.
Proof.
  pre_process.
  prop_apply_p (next_nonempty_observation__next_dispatch_resources
    nodes_after node_next linklist_node_pre linklist_pre last PreH1).
  Intros_p Hnext.
  sep_apply_l_atomic (next_addr_segment_rejoin__next_dispatch_resources
    nodes_before nodes_after first linklist_pre linklist_pre last
    linklist_node_pre node_prev node_next).
  split_pure_spatial.
  - sep_apply_r_atomic (next_store_close__next_dispatch_resources
      A storeA_dispatch_case linklist_pre nodes_dispatch_case first last).
    sepcon_right_assoc. repeat progress cancel.
    setoid_rewrite <- PreH2. cancel.
  - dump_pre_spatial. rewrite PreH4. exact Hnext.
Qed.

Lemma proof_of_DoubleLinkListGetNext_return_wit_4 : DoubleLinkListGetNext_return_wit_4.
Proof.
  pre_process.
  subst linklist_node_pre.
  prop_apply_p (next_nonempty_observation__next_dispatch_resources
    (ptrs nodes_dispatch_case) first linklist_pre linklist_pre last PreH1).
  Intros_p Hfirst.
  split_pure_spatial.
  - sep_apply_r_atomic (next_store_close__next_dispatch_resources
      A storeA_dispatch_case linklist_pre nodes_dispatch_case first last).
    sepcon_right_assoc. repeat progress cancel.
  - dump_pre_spatial. rewrite PreH3. exact Hfirst.
Qed.

Lemma proof_of_DoubleLinkListGetNext_derive_sentinel_case_by_dispatch_case : DoubleLinkListGetNext_derive_sentinel_case_by_dispatch_case.
Proof.
  pre_process.
  Exists A storeA_sentinel_case nodes_sentinel_case.
  subst linklist_node_pre.
  entailer!.
  unfold xizi_double_link_next_anchor. auto.
  apply derivable1_wand_sepcon_adjoint.
  Intros retval_2.
  Exists (xizi_double_link_first_value (ptrs nodes_sentinel_case)).
  entailer!.
  unfold xizi_double_link_next_anchor. auto.
Qed.

Lemma proof_of_DoubleLinkListGetNext_derive_member_case_by_dispatch_case : DoubleLinkListGetNext_derive_member_case_by_dispatch_case.
Proof.
  pre_process.
  Exists A storeA_member_case nodes_member_case.
  entailer!.
  apply derivable1_wand_sepcon_adjoint.
  Intros retval_2.
  prop_apply_p (next_store_exclusion__next_dispatch_resources
    A storeA_member_case linklist_pre nodes_member_case).
  Intros_p Hhead_notin.
  Exists (xizi_double_link_next_value (ptrs nodes_member_case) linklist_node_pre).
  entailer!.
  unfold xizi_double_link_next_anchor. auto.
Qed.
