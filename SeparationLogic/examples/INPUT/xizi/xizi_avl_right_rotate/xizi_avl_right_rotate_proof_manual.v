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
From SimpleC.EE.INPUT.xizi.xizi_avl_right_rotate Require Import xizi_avl_right_rotate_goal.
From SimpleC.EE.INPUT.xizi.xizi_avl_right_rotate Require Import xizi_avl_right_rotate_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import QCIPLib.xizi.xizi_avl_common.xizi_avl_graph_lib.
Local Open Scope sac.

Lemma proof_of_xizi_avl_right_rotate_entail_wit_1_1 : xizi_avl_right_rotate_entail_wit_1_1.
Proof.
  aggressive_pre_process.
  pose proof (avl_right_rotate_root_height_gt__right_rotation_graph
    g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec
    retval_2 retval PreH8 PreH16 PreH6 PreH7 PreH18 PreH19 PreH23 PreH5) as Hheight.
  sep_apply_l_atomic (avl_right_rotate_demoted_store__right_rotation_graph
    g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec
    (unsigned_last_nbits (unsigned_last_nbits retval 32 + 1) 32)
    PreH8 PreH9 PreH12 PreH16 PreH11 (ltac:(lia)) (ltac:(lia)) Hheight).
  entailer!.
Qed. 

Lemma proof_of_xizi_avl_right_rotate_entail_wit_1_2 : xizi_avl_right_rotate_entail_wit_1_2.
Proof.
  aggressive_pre_process.
  pose proof (avl_right_rotate_root_height_le__right_rotation_graph
    g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec
    retval_2 retval PreH8 PreH16 PreH6 PreH7 PreH18 PreH19 PreH23 PreH5) as Hheight.
  sep_apply_l_atomic (avl_right_rotate_demoted_store__right_rotation_graph
    g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec
    (unsigned_last_nbits (unsigned_last_nbits retval_2 32 + 1) 32)
    PreH8 PreH9 PreH12 PreH16 PreH11 (ltac:(lia)) (ltac:(lia)) Hheight).
  entailer!.
Qed. 

Lemma proof_of_xizi_avl_right_rotate_return_wit_1 : xizi_avl_right_rotate_return_wit_1.
Proof.
  aggressive_pre_process.
  pose proof (avl_right_rotate_promoted_height_gt__right_rotation_graph
    g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec
    retval_2 retval PreH8 PreH9 PreH12 PreH6 PreH7 PreH10 PreH11 PreH15 PreH5) as Hheight.
  sep_apply_l_atomic (avl_right_rotate_promoted_tree__right_rotation_graph
    g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec
    (unsigned_last_nbits (unsigned_last_nbits retval 32 + 1) 32)
    PreH8 PreH9 PreH12 PreH13 (ltac:(lia)) (ltac:(lia)) Hheight).
  entailer!.
Qed. 

Lemma proof_of_xizi_avl_right_rotate_return_wit_2 : xizi_avl_right_rotate_return_wit_2.
Proof.
  aggressive_pre_process.
  pose proof (avl_right_rotate_promoted_height_le__right_rotation_graph
    g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec
    retval_2 retval PreH8 PreH9 PreH12 PreH6 PreH7 PreH10 PreH11 PreH15 PreH5) as Hheight.
  sep_apply_l_atomic (avl_right_rotate_promoted_tree__right_rotation_graph
    g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec
    (unsigned_last_nbits (unsigned_last_nbits retval_2 32 + 1) 32)
    PreH8 PreH9 PreH12 PreH13 (ltac:(lia)) (ltac:(lia)) Hheight).
  entailer!.
Qed. 

Lemma proof_of_xizi_avl_right_rotate_derive_high_level_spec_by_low_level_spec : xizi_avl_right_rotate_derive_high_level_spec_by_low_level_spec.
Proof.
  pre_process.
  rename H into Hinput.
  destruct (avl_right_rotation_output_exists__right_rotation_graph
    before_high_level_spec avl_node_pre Hinput)
    as [after [y [Hxy [Hy [Hresult [HC [HB [HA HD]]]]]]]].
  pose proof Hresult as [Hptr [Hny [Hr [Hm [Hvafter [Hnodes Hkeys]]]]]].
  pose proof Hinput as [Hv [Hroot [Hx [Hnx Hrest]]]].
  pose proof (proj1 (proj2 Hvafter) avl_node_pre
    (proj2 (proj2 (proj2 (avl_right_rotation_domain_keys__right_rotation_graph
      before_high_level_spec after avl_node_pre y avl_node_pre Hm))) Hx)) as [Hheightx _].
  pose proof (proj1 (proj2 Hvafter) y
    (proj2 (proj2 (proj2 (avl_right_rotation_domain_keys__right_rotation_graph
      before_high_level_spec after avl_node_pre y y Hm))) Hy)) as [Hheighty _].
  Exists before_high_level_spec after y root_cached_height_high_level_spec.
  sep_apply_l_atomic (avl_tree_store_right_rotation_expose_cached_root__right_rotation_graph
    before_high_level_spec avl_node_pre y root_cached_height_high_level_spec
    Hv Hroot Hx Hnx Hxy Hy Hny).
  entailer!.
  apply derivable1_wand_sepcon_adjoint.
  Intros result.
  subst result. Exists y. unfold avl_right_rotation_post. Exists after.
  entailer!.
Qed. 

