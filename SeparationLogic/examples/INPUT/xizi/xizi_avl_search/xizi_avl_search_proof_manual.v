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
From SimpleC.EE.INPUT.xizi.xizi_avl_search Require Import xizi_avl_search_goal.
From SimpleC.EE.INPUT.xizi.xizi_avl_search Require Import xizi_avl_search_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import QCIPLib.xizi.xizi_avl_common.xizi_avl_graph_lib.
Local Open Scope sac.

Lemma proof_of_xizi_avl_search_entail_wit_2 : xizi_avl_search_entail_wit_2.
Proof.
  pre_process.
  prop_apply_p (avl_subtree_store_valid_guard__graph_store_decomposition g_low_level_spec avl_node_pre).
  Intros_p Hguard.
  assert (Hvalid : avl_vvalid g_low_level_spec avl_node_pre) by (apply Hguard; exact PreH1).
  sep_apply_l_atomic (avl_subtree_store_decompose__height_accessor g_low_level_spec avl_node_pre PreH4 PreH1 Hvalid).
  all: prop_apply_p (avl_graph_node_store_facts__graph_store_decomposition g_low_level_spec avl_node_pre).
  all: Intros_p Hfacts.
  all: unfold avl_graph_node_store; entailer!.
Qed. 

Lemma proof_of_xizi_avl_search_entail_wit_3 : xizi_avl_search_entail_wit_3.
Proof.
  pre_process.
  pose proof (avl_search_cursor_descend_right__cursor_branch_invariant__tree_valid g_low_level_spec avl_node_pre data_pre PreH5 PreH6 PreH1 PreH12) as Hdesc.
  entailer!.
Qed. 

Lemma proof_of_xizi_avl_search_entail_wit_4 : xizi_avl_search_entail_wit_4.
Proof.
  pre_process.
  pose proof (avl_search_cursor_descend_left__cursor_branch_invariant__tree_valid g_low_level_spec avl_node_pre data_pre PreH5 PreH6 ltac:(lia) PreH12) as Hdesc.
  entailer!.
Qed. 

Lemma proof_of_xizi_avl_search_return_wit_1 : xizi_avl_search_return_wit_1.
Proof. pre_process. split_pure_spatial. - sep_apply_r_atomic (avl_subtree_store_fold__height_accessor g_low_level_spec avl_node_pre PreH7 PreH9 PreH8). unfold avl_graph_node_store in *. entailer!. - unfold avl_search_result. right. repeat split; try assumption; lia. Qed. 

Lemma proof_of_xizi_avl_search_return_wit_2 : xizi_avl_search_return_wit_2.
Proof. pre_process. split_pure_spatial. - sep_apply_r_atomic (avl_subtree_store_fold__height_accessor g_low_level_spec avl_node_pre PreH7 PreH9 PreH8). unfold avl_graph_node_store in *. entailer!. - entailer!. Qed. 

Lemma proof_of_xizi_avl_search_return_wit_3 : xizi_avl_search_return_wit_3.
Proof. pre_process. split_pure_spatial. - sep_apply_r_atomic (avl_subtree_store_fold__height_accessor g_low_level_spec avl_node_pre PreH7 PreH9 PreH8). unfold avl_graph_node_store in *. entailer!. - entailer!. Qed. 

Lemma proof_of_xizi_avl_search_return_wit_4 : xizi_avl_search_return_wit_4.
Proof.
  pre_process.
  split_pure_spatial.
  - cancel (avl_subtree_store_at g_low_level_spec avl_node_pre).
  - split_pures.
    + dump_pre_spatial. unfold avl_search_result. left. split; [reflexivity|].
      intros x Hv Hkey.
      subst avl_node_pre.
      eapply (avl_null_cursor_excludes_matching_key__mapping_refinement__tree_valid g_low_level_spec data_pre x PreH4 Hv Hkey).
      apply PreH5; assumption.
Qed. 

Lemma proof_of_xizi_avl_search_derive_high_level_spec_by_low_level_spec : xizi_avl_search_derive_high_level_spec_by_low_level_spec.
Proof.
  pre_process.
  unfold avl_mapping_root_rep.
  Intros g.
  destruct H as [Hg [Hroot Hmap]].
  Exists g.
  split_pure_spatial.
  - sep_apply_l_atomic (avl_root_tree_store_to_subtree_store g avl_node_pre Hg Hroot).
    cancel (avl_subtree_store_at g avl_node_pre).
    apply_sepcon_adjoint.
    Intros retval.
    rename H into Hsearch.
    destruct Hsearch as [[Hret Habsent]|[Hret [Hvalid Hkey]]].
    + assert (Hnone : m_high_level_spec data_pre = None).
      { destruct (m_high_level_spec data_pre) as [x|] eqn:Hentry; [|reflexivity].
        destruct (proj1 (Hmap data_pre x) Hentry) as [Hx Hkx].
        exfalso. exact (Habsent x Hx Hkx). }
      Right.
      Exists retval.
      Exists g.
      entailer!.
      eapply avl_subtree_store_to_root_tree_store; eauto.
    + assert (Hsome : m_high_level_spec data_pre = Some retval).
      { apply (proj2 (Hmap data_pre retval)). auto. }
      Left.
      Exists retval.
      Exists g.
      entailer!.
      eapply avl_subtree_store_to_root_tree_store; eauto.
  - split_pures.
    + dump_pre_spatial; assumption.
    + dump_pre_spatial.
      eapply avl_root_cursor_valid__mapping_refinement__tree_valid; eauto.
Qed. 

