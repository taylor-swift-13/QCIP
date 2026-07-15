Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
From QCIPLib.xizi.xizi_avl_common Require Import xizi_avl_strategy_goal.
Import naive_C_Rules.
Require Import QCIPLib.xizi.xizi_avl_common.xizi_avl_lib.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Lemma xizi_avl_strategy0_correctness : xizi_avl_strategy0.
Proof.
  pre_process_default.
  Intros_p H0.
  subst tr1.
  cancel.
Qed.

Lemma xizi_avl_strategy9_correctness : xizi_avl_strategy9.
  pre_process_default.
Qed.

Lemma xizi_avl_strategy12_correctness : xizi_avl_strategy12.
  pre_process_default.
Qed.

Lemma xizi_avl_strategy7_correctness : xizi_avl_strategy7.
Proof.
  pre_process_default.
  unfold single_tree_node.
  repeat cancel.
Qed.

Lemma xizi_avl_strategy8_correctness : xizi_avl_strategy8.
Proof.
  pre_process_default.
  unfold single_tree_node.
  repeat cancel.
Qed.

Lemma xizi_avl_strategy1_correctness : xizi_avl_strategy1.
Proof.
  pre_process_default.
  destruct tr.
  - simpl.
    Intros_p H0.
    contradiction.
  - simpl.
    Intros pl.
    Intros pr.
    Intros d.
    Intros h.
    Exists d.
    Exists h.
    Exists pl.
    Exists pr.
    Exists tr1.
    Exists tr2.
    normalize.
    rewrite <- elim_wand_emp_emp.
    elim_emp.
    split_pures.
    split_pure_spatial.
    + unfold single_tree_node.
      repeat cancel.
    + split_pures.
      * dump_pre_spatial.
        exact H.
      * dump_pre_spatial.
        reflexivity.
Qed.

Lemma xizi_avl_strategy2_correctness : xizi_avl_strategy2.
Proof.
  pre_process_default.
  split_pure_spatial.
  - Intros_r tr.
    Intros_r tr1.
    Intros_r tr2.
    Intros_r l.
    Intros_r h.
    Intros_r d.
    Intros_r r.
    apply_sepcon_adjoint.
    elim_emp.
    Intros_p H0.
    subst tr.
    simpl.
    Exists l.
    Exists r.
    Exists d.
    Exists h.
    split_pure_spatial.
    + unfold single_tree_node.
      repeat cancel.
    + dump_pre_spatial.
      exact H.
  - dump_pre_spatial.
    exact H.
Qed.

Lemma xizi_avl_strategy3_correctness : xizi_avl_strategy3.
Proof.
  pre_process_default.
  destruct tr.
  - simpl.
    split_pure_spatial.
    + Intros_p H0.
      cancel.
    + split_pures.
      * dump_pre_spatial.
        exact H.
      * dump_pre_spatial.
        reflexivity.
  - simpl.
    Intros pl.
    Intros pr.
    Intros d.
    Intros h.
    contradiction.
Qed.

Lemma xizi_avl_strategy4_correctness : xizi_avl_strategy4.
Proof.
  pre_process_default.
  split_pure_spatial.
  - Intros_r tr.
    apply_sepcon_adjoint.
    elim_emp.
    Intros_p H0.
    subst tr p.
    simpl.
    split_pure_spatial.
    + cancel.
    + dump_pre_spatial.
      reflexivity.
  - dump_pre_spatial.
    exact H.
Qed.

Lemma xizi_avl_strategy10_correctness : xizi_avl_strategy10.
Proof.
  pre_process_default.
  Intros tr.
  Exists tr.
  normalize.
  rewrite <- elim_wand_emp_emp.
  elim_emp.
  cancel.
Qed.

Lemma xizi_avl_strategy11_correctness : xizi_avl_strategy11.
Proof.
  pre_process_default.
  unfold store_tree_shape.
  Exists tr.
  cancel.
Qed.

Lemma xizi_avl_strategy13_correctness : xizi_avl_strategy13.
Proof.
  pre_process_default.
  unfold store_non_empty_tree.
  Intros_p H.
  split_pure_spatial.
  - cancel.
  - dump_pre_spatial.
    exact H.
Qed.

Lemma xizi_avl_strategy15_correctness : xizi_avl_strategy15.
Proof.
  pre_process_default.
  split_pure_spatial.
  - apply_sepcon_adjoint.
    elim_emp.
    unfold store_non_empty_tree.
    split_pure_spatial.
    + cancel.
    + dump_pre_spatial.
      exact H.
  - dump_pre_spatial.
    exact H.
Qed.

Lemma xizi_avl_strategy16_correctness : xizi_avl_strategy16.
Proof.
  pre_process_default.
  split_pure_spatial.
  - Intros_r tr.
    Intros_r tr1.
    Intros_r tr2.
    Intros_r l.
    Intros_r h.
    Intros_r d.
    Intros_r r.
    apply_sepcon_adjoint.
    elim_emp.
    Intros_p H0.
    subst tr.
    simpl.
    Exists l.
    Exists r.
    Exists d.
    Exists h.
    split_pure_spatial.
    + unfold single_tree_node.
      repeat cancel.
    + dump_pre_spatial.
      exact H.
  - dump_pre_spatial.
    exact H.
Qed.

Lemma xizi_avl_strategy17_correctness : xizi_avl_strategy17.
Proof.
  pre_process_default.
  Intros_p H.
  subst tr.
  simpl.
  split_pure_spatial.
  - cancel.
  - dump_pre_spatial.
    reflexivity.
Qed.

Lemma xizi_avl_strategy5_correctness : xizi_avl_strategy5.
Proof.
  pre_process_default.
  unfold single_tree_node.
  repeat cancel.
Qed.

Lemma xizi_avl_strategy6_correctness : xizi_avl_strategy6.
Proof.
  pre_process_default.
  unfold single_tree_node.
  repeat cancel.
Qed.
