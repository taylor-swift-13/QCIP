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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_remove_node.source Require Import xizi_double_link_remove_node_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_remove_node.source Require Import xizi_double_link_remove_node_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_remove_node.source Require Import xizi_double_link_remove_node_lib.
Local Open Scope sac.

Lemma proof_of_DoubleLinkListRmNode_return_wit_1 : DoubleLinkListRmNode_return_wit_1.
Proof.
  unfold DoubleLinkListRmNode_return_wit_1.
  left.
  intros linklist_node suffix prefix node_prev node_next head dispatch
    Hdispatch Hnode.
  rewrite Hdispatch.
  unfold xizi_dll_next, xizi_dll_prev.
  entailer!.
  eapply derivable1_trans.
  2: apply
       (xizi_dll_remove_result__dll_cut_split_reconnect
          head prefix suffix linklist_node node_next node_prev Hnode).
  entailer!.
Qed.

Lemma proof_of_DoubleLinkListRmNode_derive_remove_self_loop_spec_by_strong_spec : DoubleLinkListRmNode_derive_remove_self_loop_spec_by_strong_spec.
Proof.
  unfold DoubleLinkListRmNode_derive_remove_self_loop_spec_by_strong_spec.
  intros linklist_node.
  unfold xizi_dll, XiziDLL.dll at 1.
  Intros first last.
  simpl.
  Intros.
  destruct H0 as [Hfirst Hlast].
  subst first; subst last.
  Exists 1 linklist_node linklist_node linklist_node (@nil Z) (@nil Z).
  rewrite <- logic_equiv_sepcon_emp.
  apply derivable1_sepcon_mono.
  - Right.
    unfold xizi_dll_links, XiziDLL.links.
    entailer!.
  - apply derivable1_wand_sepcon_adjoint.
    Split; entailer!.
Qed.

Lemma proof_of_DoubleLinkListRmNode_derive_remove_tail_spec_by_strong_spec : DoubleLinkListRmNode_derive_remove_tail_spec_by_strong_spec.
Proof.
  unfold DoubleLinkListRmNode_derive_remove_tail_spec_by_strong_spec.
  intros linklist_node prefix head.
  sep_apply_l_atomic
    (xizi_dll_split_at_node__dll_cut_split_reconnect
       head prefix linklist_node (@nil Z)).
  Intros node_next node_prev.
  Exists 0 head node_next node_prev prefix (@nil Z).
  rewrite <- logic_equiv_sepcon_emp.
  apply derivable1_sepcon_mono.
  - Left.
    unfold xizi_dll_next, xizi_dll_prev.
    entailer!.
  - apply derivable1_wand_sepcon_adjoint.
    rewrite app_nil_r.
    Split; entailer!.
Qed.

Lemma proof_of_DoubleLinkListRmNode_derive_remove_front_spec_by_strong_spec : DoubleLinkListRmNode_derive_remove_front_spec_by_strong_spec.
Proof.
  unfold DoubleLinkListRmNode_derive_remove_front_spec_by_strong_spec.
  intros linklist_node suffix head.
  sep_apply_l_atomic
    (xizi_dll_split_at_node__dll_cut_split_reconnect
       head (@nil Z) linklist_node suffix).
  Intros node_next node_prev.
  Exists 0 head node_next node_prev (@nil Z) suffix.
  rewrite <- logic_equiv_sepcon_emp.
  apply derivable1_sepcon_mono.
  - Left.
    unfold xizi_dll_next, xizi_dll_prev.
    entailer!.
  - apply derivable1_wand_sepcon_adjoint.
    simpl.
    Split; entailer!.
Qed.

Lemma proof_of_DoubleLinkListRmNode_derive_remove_member_spec_by_strong_spec : DoubleLinkListRmNode_derive_remove_member_spec_by_strong_spec.
Proof.
  pre_process.
  pose proof
    (xizi_dll_remove_first_split__spec_derivations_direct
       linklist_node_pre nodes_remove_member_spec H) as
    (prefix & suffix & Hnodes & _ & Hremove).
  rewrite Hnodes.
  rewrite Hnodes in Hremove.
  sep_apply_l_atomic
    (xizi_dll_split_at_node__dll_cut_split_reconnect
       head_remove_member_spec prefix linklist_node_pre suffix).
  Intros node_next node_prev.
  Exists 0 head_remove_member_spec node_next node_prev prefix suffix.
  rewrite <- logic_equiv_sepcon_emp.
  apply derivable1_sepcon_mono.
  - Left.
    unfold xizi_dll_next, xizi_dll_prev.
    entailer!.
  - apply derivable1_wand_sepcon_adjoint.
    rewrite Hremove.
    Split; entailer!.
Qed.
