Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
From SimpleC.SL Require Import SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_strategy_goal.

Import naive_C_Rules.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Lemma xizi_double_link_strategy401_correctness : xizi_double_link_strategy401.
Proof.
  pre_process_default.
  unfold xizi_dll, XiziDLL.dll.
  Intros first last.
  simpl.
  Intros.
  destruct H0 as [Hfirst Hlast].
  subst first; subst last.
  unfold XiziDLL.links.
  entailer!.
Qed.

Lemma xizi_double_link_strategy402_correctness : xizi_double_link_strategy402.
Proof.
  pre_process_default.
  Intros.
  apply xizi_dll_empty_rev; assumption.
Qed.

Lemma xizi_double_link_strategy403_correctness : xizi_double_link_strategy403.
Proof.
  pre_process_default.
  unfold xizi_dll, XiziDLL.dll.
  Intros first last.
  unfold XiziDLL.links.
  Exists first last.
  entailer!.
  rewrite <- sepcon_emp_equiv at 1.
  apply derivable1_sepcon_mono.
  - apply derivable1_refl.
  - rewrite <- derivable1_wand_sepcon_adjoint.
    entailer!.
Qed.

Lemma xizi_double_link_strategy404_correctness : xizi_double_link_strategy404.
Proof.
  pre_process_default.
  unfold xizi_dll, XiziDLL.dll.
  Exists first last.
  unfold XiziDLL.links.
  entailer!.
Qed.

Lemma xizi_double_link_strategy405_correctness : xizi_double_link_strategy405.
Proof.
  pre_process_default.
  unfold xizi_dll_node.
  entailer!.
Qed.

Lemma xizi_double_link_strategy407_correctness : xizi_double_link_strategy407.
Proof.
  pre_process_default.
  unfold xizi_dll_node.
  entailer!.
Qed.

Lemma xizi_double_link_strategy406_correctness : xizi_double_link_strategy406.
Proof.
  pre_process_default.
  rewrite <- logic_equiv_coq_prop_or.
  Intros.
  assert (p <> tail) by (destruct H; congruence).
  sep_apply xizi_dllseg_unfold; [ | assumption ].
  Intros nxt l0.
  unfold xizi_dll_links, XiziDLL.links.
  Exists nxt l0.
  rewrite <- logic_equiv_coq_prop_or.
  entailer!.
  try rewrite <- derivable1_wand_sepcon_adjoint.
  entailer!.
Qed.

Lemma xizi_double_link_strategy408_correctness : xizi_double_link_strategy408.
Proof.
  pre_process_default.
  unfold xizi_dll, XiziDLL.dll.
  Intros actual_first last.
  simpl.
  Intros next.
  Intros.
  subst actual_first.
  unfold XiziDLL.links.
  Exists next last.
  entailer!.
  rewrite <- sepcon_emp_equiv at 1.
  apply derivable1_sepcon_mono.
  - apply derivable1_refl.
  - rewrite <- derivable1_wand_sepcon_adjoint.
    entailer!.
Qed.

Lemma xizi_double_link_strategy409_correctness : xizi_double_link_strategy409.
Proof.
  pre_process_default.
  entailer!.
  Intros_R.
  apply derivable1_wand_sepcon_adjoint.
  unfold xizi_dll, XiziDLL.dll.
  Exists first last.
  simpl.
  Exists next.
  unfold XiziDLL.links.
  entailer!.
Qed.
