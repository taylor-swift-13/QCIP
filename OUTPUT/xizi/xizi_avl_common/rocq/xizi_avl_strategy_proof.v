Require Import Coq.ZArith.ZArith.
Require Import Coq.Strings.String.
From SimpleC.SL Require Import SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
From QCIPLib.xizi.xizi_avl_common Require Import xizi_avl_lib.
From QCIPLib.xizi.xizi_avl_common Require Import xizi_avl_strategy_goal.

Import naive_C_Rules.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.

Lemma xizi_avl_strategy501_correctness : xizi_avl_strategy501.
Proof.
  pre_process_default.
  Intros.
  sep_apply store_addr_avl_null; [ | assumption].
  entailer!.
Qed.

Lemma xizi_avl_strategy502_correctness : xizi_avl_strategy502.
Proof.
  pre_process_default.
  sep_apply store_addr_avl_empty_rev.
  entailer!.
Qed.

Lemma xizi_avl_strategy503_correctness : xizi_avl_strategy503.
Proof.
  pre_process_default.
  Intros.
  sep_apply store_addr_avl_nonnull; [ | assumption].
  Intros data height left_tree right_tree.
  Exists data height left_tree right_tree.
  entailer!.
  apply derivable1_wand_sepcon_adjoint.
  entailer!.
Qed.

Lemma xizi_avl_strategy504_correctness : xizi_avl_strategy504.
Proof.
  pre_process_default.
  Intros.
  unfold store_addr_avl, generic_store_addr_avl.
  entailer!.
Qed.

Lemma xizi_avl_strategy505_correctness : xizi_avl_strategy505.
Proof.
  pre_process_default.
  sep_apply avl_node_fields_unfold.
  entailer!.
Qed.

Lemma xizi_avl_strategy506_correctness : xizi_avl_strategy506.
Proof.
  pre_process_default.
  unfold avl_node_fields, avl_concrete_node_store,
    xizi_avl_struct_name, xizi_avl_data_field, xizi_avl_height_field,
    xizi_avl_left_field, xizi_avl_right_field.
  entailer!.
Qed.

Lemma xizi_avl_strategy507_correctness : xizi_avl_strategy507.
Proof.
  pre_process_default.
  sep_apply store_addr_avl_shape_unfold.
  Intros t.
  Exists t.
  entailer!.
  apply derivable1_wand_sepcon_adjoint.
  entailer!.
Qed.

Lemma xizi_avl_strategy508_correctness : xizi_avl_strategy508.
Proof.
  pre_process_default.
  unfold store_addr_avl_shape, generic_store_addr_avl_shape,
    store_addr_avl.
  Exists t.
  entailer!.
Qed.

Lemma xizi_avl_strategy509_correctness : xizi_avl_strategy509.
Proof.
  pre_process_default.
  sep_apply store_nonempty_addr_avl_unfold.
  entailer!.
Qed.

Lemma xizi_avl_strategy510_correctness : xizi_avl_strategy510.
Proof.
  pre_process_default.
  Intros.
  unfold store_nonempty_addr_avl, generic_store_nonempty_addr_avl.
  entailer!.
Qed.
