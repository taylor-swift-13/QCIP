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
From SimpleC.EE.INPUT.xizi.xizi_avl_left_rotate Require Import xizi_avl_left_rotate_goal.
From SimpleC.EE.INPUT.xizi.xizi_avl_left_rotate Require Import xizi_avl_left_rotate_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import QCIPLib.xizi.xizi_avl_common.xizi_avl_graph_lib.
Local Open Scope sac.

Lemma proof_of_xizi_avl_left_rotate_entail_wit_1_1 : xizi_avl_left_rotate_entail_wit_1_1.
Proof.
  aggressive_pre_process.
  assert (Hkey : INT_MIN <= avl_key_of g_low_level_spec avl_node_pre <= INT_MAX) by lia.
  pose proof (avl_left_rotate_root_height_gt__left_rotation_graph_heights
    g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec
    retval retval_2 PreH8 PreH16 PreH7 PreH6 PreH18 PreH19 PreH23 PreH5) as Hheight.
  sep_apply_l_atomic (avl_left_rotate_demoted_store__left_rotation_graph_heights
    g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec
    (unsigned_last_nbits (unsigned_last_nbits retval 32 + 1) 32)
    PreH8 PreH9 PreH12 PreH16 PreH11 Hkey (conj PreH22 PreH23) Hheight).
  cancel.
Qed. 

Lemma proof_of_xizi_avl_left_rotate_entail_wit_1_2 : xizi_avl_left_rotate_entail_wit_1_2.
Proof.
  aggressive_pre_process.
  assert (Hkey : INT_MIN <= avl_key_of g_low_level_spec avl_node_pre <= INT_MAX) by lia.
  pose proof (avl_left_rotate_root_height_le__left_rotation_graph_heights
    g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec
    retval retval_2 PreH8 PreH16 PreH7 PreH6 PreH18 PreH19 PreH23 PreH5) as Hheight.
  sep_apply_l_atomic (avl_left_rotate_demoted_store__left_rotation_graph_heights
    g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec
    (unsigned_last_nbits (unsigned_last_nbits retval_2 32 + 1) 32)
    PreH8 PreH9 PreH12 PreH16 PreH11 Hkey (conj PreH22 PreH23) Hheight).
  cancel.
Qed. 

Lemma proof_of_xizi_avl_left_rotate_return_wit_1 : xizi_avl_left_rotate_return_wit_1.
Proof.
  aggressive_pre_process.
  assert (Hkey : INT_MIN <= avl_key_of g_low_level_spec promoted_low_level_spec <= INT_MAX) by lia.
  pose proof (avl_left_rotate_promoted_height_gt__left_rotation_graph_heights
    g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec
    retval retval_2 PreH8 PreH9 PreH12 PreH7 PreH6 PreH10 PreH11 PreH15 PreH5) as Hheight.
  sep_apply_l_atomic (avl_left_rotate_promoted_tree__left_rotation_graph_heights
    g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec
    (unsigned_last_nbits (unsigned_last_nbits retval 32 + 1) 32)
    PreH8 PreH9 PreH12 PreH13 Hkey (conj PreH14 PreH15) Hheight).
  cancel.
Qed. 

Lemma proof_of_xizi_avl_left_rotate_return_wit_2 : xizi_avl_left_rotate_return_wit_2.
Proof.
  aggressive_pre_process.
  assert (Hkey : INT_MIN <= avl_key_of g_low_level_spec promoted_low_level_spec <= INT_MAX) by lia.
  pose proof (avl_left_rotate_promoted_height_le__left_rotation_graph_heights
    g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec
    retval retval_2 PreH8 PreH9 PreH12 PreH7 PreH6 PreH10 PreH11 PreH15 PreH5) as Hheight.
  sep_apply_l_atomic (avl_left_rotate_promoted_tree__left_rotation_graph_heights
    g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec
    (unsigned_last_nbits (unsigned_last_nbits retval_2 32 + 1) 32)
    PreH8 PreH9 PreH12 PreH13 Hkey (conj PreH14 PreH15) Hheight).
  cancel.
Qed. 

Lemma proof_of_xizi_avl_left_rotate_derive_high_level_spec_by_low_level_spec : xizi_avl_left_rotate_derive_high_level_spec_by_low_level_spec.
Proof.
  pre_process.
  rename avl_node_pre into x.
  rename before_high_level_spec into g.
  match goal with Hi : avl_left_rotation_cached_input g x |- _ =>
    destruct (avl_left_cached_output_exists__left_rotation_cached_graph g x Hi)
      as [after [y [Hxy [Hy [Hresult [Ha [Hb [Hc Hd]]]]]]]];
    pose proof Hi as [Hv [Hr [Hx [Hnx [Hrightnn [Hcmax Hmax]]]]]]
  end.
  pose proof Hresult as [_ [Hny [Hroot [Hm [Hafter _]]]]].
  pose proof (proj1 (proj2 Hafter) x
    (proj2 (proj2 (proj2 (avl_left_rotation_domain_keys__left_rotation_graph_heights g after x y x Hm))) Hx)) as [[Hdx Hux] _].
  pose proof (proj1 (proj2 Hafter) y
    (proj2 (proj2 (proj2 (avl_left_rotation_domain_keys__left_rotation_graph_heights g after x y y Hm))) Hy)) as [[Hdy Huy] _].
  Exists g after y root_cached_height_high_level_spec.
  sep_apply_l_atomic (avl_tree_store_left_rotation_expose_cached_root__left_rotation_cached_graph g x y root_cached_height_high_level_spec Hv Hr Hx Hnx Hxy Hy Hny).
  Intros.
  rewrite Hxy. simpl avl_ptr_of.
  split_pure_spatial.
  - entailer!.
    apply derivable1_wand_sepcon_adjoint.
    Intros ret.
    Exists ret.
    unfold avl_left_rotation_post.
    Exists after.
    subst ret. entailer!.
  - entailer!.
Qed. 

