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
  intros linklist_node_pre suffix_strong_spec prefix_strong_spec
    node_prev_strong_spec node_next_strong_spec head_strong_spec
    dispatch_case_strong_spec PreH1 PreH2.
  rewrite PreH1.
  pose proof
    (xizi_dll_remove_result__dll_cut_split_reconnect
       head_strong_spec prefix_strong_spec suffix_strong_spec
       linklist_node_pre node_next_strong_spec node_prev_strong_spec PreH2)
    as Hremove.
  unfold xizi_dll_next, xizi_dll_prev,
    XiziDoubleLinkLayout.struct_name,
    XiziDoubleLinkLayout.next_field,
    XiziDoubleLinkLayout.prev_field in Hremove.
  sep_apply_l_atomic Hremove.
  entailer!.
Qed.

Lemma proof_of_DoubleLinkListRmNode_derive_remove_self_loop_spec_by_strong_spec : DoubleLinkListRmNode_derive_remove_self_loop_spec_by_strong_spec.
Proof.
  pre_process.
  Exists 1 linklist_node_pre linklist_node_pre linklist_node_pre
    (@nil Z) (@nil Z).
  assert (Hwand :
    emp |--
    (((“ 1 = 0 ” &&
       xizi_dll linklist_node_pre ((@nil Z) ++ (@nil Z)) **
       xizi_dll linklist_node_pre nil) ||
      (“ 1 = 1 ” && xizi_dll linklist_node_pre nil)) -*
     xizi_dll linklist_node_pre nil)).
  {
    apply derivable1_wand_sepcon_adjoint.
    Split; entailer!.
  }
  sep_apply_r_atomic Hwand.
  entailer!.
  Right.
  unfold xizi_dll, XiziDLL.dll at 1.
  Intros first last.
  simpl.
  Intros.
  destruct H0 as [Hfirst Hlast].
  subst first; subst last.
  unfold XiziDLL.links.
  entailer!.
Qed.

Lemma proof_of_DoubleLinkListRmNode_derive_remove_tail_spec_by_strong_spec : DoubleLinkListRmNode_derive_remove_tail_spec_by_strong_spec.
Proof.
  pre_process.
  sep_apply_l_atomic
    (xizi_dll_split_at_node__dll_cut_split_reconnect
       head_remove_tail_spec prefix_remove_tail_spec linklist_node_pre
       (@nil Z)).
  Intros node_next node_prev.
  Exists 0 head_remove_tail_spec node_next node_prev
    prefix_remove_tail_spec (@nil Z).
  unfold xizi_dll_next, xizi_dll_prev,
    XiziDoubleLinkLayout.struct_name,
    XiziDoubleLinkLayout.next_field,
    XiziDoubleLinkLayout.prev_field.
  assert (Hwand :
    emp |--
    (((“ 0 = 0 ” &&
       xizi_dll head_remove_tail_spec
         (prefix_remove_tail_spec ++ (@nil Z)) **
       xizi_dll linklist_node_pre nil) ||
      (“ 0 = 1 ” && xizi_dll linklist_node_pre nil)) -*
     (xizi_dll head_remove_tail_spec prefix_remove_tail_spec **
      xizi_dll linklist_node_pre nil))).
  {
    apply derivable1_wand_sepcon_adjoint.
    Split.
    - rewrite app_nil_r.
      entailer!.
    - entailer!.
  }
  sep_apply_r_atomic Hwand.
  entailer!.
  Left.
  entailer!.
Qed.

Lemma proof_of_DoubleLinkListRmNode_derive_remove_front_spec_by_strong_spec : DoubleLinkListRmNode_derive_remove_front_spec_by_strong_spec.
Proof.
  pre_process.
  sep_apply_l_atomic
    (xizi_dll_split_at_node__dll_cut_split_reconnect
       head_remove_front_spec (@nil Z) linklist_node_pre
       suffix_remove_front_spec).
  Intros node_next node_prev.
  Exists 0 head_remove_front_spec node_next node_prev
    (@nil Z) suffix_remove_front_spec.
  unfold xizi_dll_next, xizi_dll_prev,
    XiziDoubleLinkLayout.struct_name,
    XiziDoubleLinkLayout.next_field,
    XiziDoubleLinkLayout.prev_field.
  assert (Hwand :
    emp |--
    (((“ 0 = 0 ” &&
       xizi_dll head_remove_front_spec
         ((@nil Z) ++ suffix_remove_front_spec) **
       xizi_dll linklist_node_pre nil) ||
      (“ 0 = 1 ” && xizi_dll linklist_node_pre nil)) -*
     (xizi_dll head_remove_front_spec suffix_remove_front_spec **
      xizi_dll linklist_node_pre nil))).
  {
    apply derivable1_wand_sepcon_adjoint.
    Split; entailer!.
  }
  sep_apply_r_atomic Hwand.
  entailer!.
  Left.
  entailer!.
Qed.

Lemma proof_of_DoubleLinkListRmNode_derive_remove_member_spec_by_strong_spec : DoubleLinkListRmNode_derive_remove_member_spec_by_strong_spec.
Proof.
  pre_process.
  pose proof
    (xizi_dll_remove_first_split__spec_derivations_direct
       linklist_node_pre nodes_remove_member_spec H) as
    (prefix_strong_spec & suffix_strong_spec & Hnodes & Hnotin & Hremove).
  rewrite Hnodes at 1.
  sep_apply_l_atomic
    (xizi_dll_split_at_node__dll_cut_split_reconnect
       head_remove_member_spec prefix_strong_spec linklist_node_pre
       suffix_strong_spec).
  Intros node_next node_prev.
  Exists 0 head_remove_member_spec node_next node_prev
    prefix_strong_spec suffix_strong_spec.
  unfold xizi_dll_next, xizi_dll_prev,
    XiziDoubleLinkLayout.struct_name,
    XiziDoubleLinkLayout.next_field,
    XiziDoubleLinkLayout.prev_field.
  assert (Hwand :
    emp |--
    (((“ 0 = 0 ” &&
       xizi_dll head_remove_member_spec
         (prefix_strong_spec ++ suffix_strong_spec) **
       xizi_dll linklist_node_pre nil) ||
      (“ 0 = 1 ” && xizi_dll linklist_node_pre nil)) -*
     (xizi_dll head_remove_member_spec
        (xizi_dll_remove_first linklist_node_pre nodes_remove_member_spec) **
      xizi_dll linklist_node_pre nil))).
  {
    apply derivable1_wand_sepcon_adjoint.
    Split.
    - rewrite Hremove.
      entailer!.
    - entailer!.
  }
  sep_apply_r_atomic Hwand.
  entailer!.
  Left.
  entailer!.
Qed.
