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
From SimpleC.EE.INPUT.xizi.xizi_avl_lr_rotate Require Import xizi_avl_lr_rotate_goal.
From SimpleC.EE.INPUT.xizi.xizi_avl_lr_rotate Require Import xizi_avl_lr_rotate_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import QCIPLib.xizi.xizi_avl_common.xizi_avl_graph_lib.
Local Open Scope sac.

Lemma proof_of_xizi_avl_lr_rotate_entail_wit_1 : xizi_avl_lr_rotate_entail_wit_1.
Proof.
  pre_process.
  sep_apply_l_atomic (avl_lr_expose_inner__lr_graph_composition before_high_level_spec avl_node_pre root_cached_height_high_level_spec PreH1).
  entailer!.
  eapply avl_lr_prepare_inner__lr_graph_composition; eauto.
Qed. 

Lemma proof_of_xizi_avl_lr_rotate_entail_wit_2 : xizi_avl_lr_rotate_entail_wit_2.
Proof.
  aggressive_pre_process.
  unfold avl_left_rotation_post. Intros h.
  match goal with Hout : avl_left_rotation_result _ h _ _ |- _ =>
    sep_apply_l_atomic (avl_lr_lift__lr_graph_composition before_high_level_spec h avl_node_pre retval
      root_cached_height_high_level_spec PreH5 Hout (ltac:(lia)) (ltac:(lia)))
  end.
  Intros m. Exists m. entailer!.
Qed. 

Lemma proof_of_xizi_avl_lr_rotate_return_wit_1 : xizi_avl_lr_rotate_return_wit_1.
Proof.
  pre_process.
  unfold avl_right_rotation_post. Intros after.
  unfold avl_lr_rotation_post. Exists after.
  split_pure_spatial.
  - cancel (avl_tree_store after).
  - dump_pre_spatial. eapply avl_lr_compose_result__lr_graph_composition; eauto.
Qed. 

