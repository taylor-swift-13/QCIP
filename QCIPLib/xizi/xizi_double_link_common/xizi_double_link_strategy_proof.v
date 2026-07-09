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
  sep_apply xizi_dll_nil.
  entailer!.
Qed.

Lemma xizi_double_link_strategy402_correctness : xizi_double_link_strategy402.
Proof.
  pre_process_default.
  unfold xizi_dll, generic_dll_head, xizi_double_head_store,
    dll_head_store, dll_links, dll_next_link, dll_prev_link,
    xizi_double_struct_name, xizi_double_next_field, xizi_double_prev_field.
  unfold xizi_dllseg, generic_dllseg.
  Exists p p.
  entailer!.
Qed.

Lemma xizi_double_link_strategy403_correctness : xizi_double_link_strategy403.
Proof.
  pre_process_default.
  sep_apply xizi_dll_cons.
  Intros first last.
  unfold xizi_double_struct_name, xizi_double_next_field,
    xizi_double_prev_field.
  Exists first last.
  entailer!.
  apply derivable1_wand_sepcon_adjoint.
  entailer!.
Qed.

Lemma xizi_double_link_strategy404_correctness : xizi_double_link_strategy404.
Proof.
  pre_process_default.
  unfold xizi_dll, generic_dll_head, xizi_double_head_store,
    dll_head_store, dll_links, dll_next_link, dll_prev_link,
    xizi_double_struct_name, xizi_double_next_field, xizi_double_prev_field.
  Exists first last.
  entailer!.
Qed.

Lemma xizi_double_link_strategy405_correctness : xizi_double_link_strategy405.
Proof.
  pre_process_default.
  Intros.
  subst.
  sep_apply xizi_dllseg_same_rev.
  entailer!.
Qed.

Lemma xizi_double_link_strategy406_correctness : xizi_double_link_strategy406.
Proof.
  pre_process_default.
  rewrite <- logic_equiv_coq_prop_or.
  Intros.
  assert (p <> tail) by (destruct H; congruence).
  sep_apply xizi_dllseg_not_same; [ | tauto ].
  Intros nxt l0.
  unfold xizi_double_struct_name, xizi_double_next_field,
    xizi_double_prev_field.
  Exists nxt l0.
  rewrite <- logic_equiv_coq_prop_or.
  entailer!.
  try rewrite <- derivable1_wand_sepcon_adjoint.
  entailer!.
Qed.

Lemma xizi_double_link_strategy407_correctness : xizi_double_link_strategy407.
Proof.
  pre_process_default.
  sep_apply xizi_dllseg_same.
  entailer!.
Qed.
