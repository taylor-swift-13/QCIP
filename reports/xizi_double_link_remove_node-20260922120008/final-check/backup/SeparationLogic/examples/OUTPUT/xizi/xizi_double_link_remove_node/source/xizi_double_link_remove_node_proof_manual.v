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
Import CRules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_remove_node.source Require Import xizi_double_link_remove_node_lib.
Local Open Scope sac.

Lemma proof_of_DoubleLinkListRmNode_entail_wit_1 : DoubleLinkListRmNode_entail_wit_1.
Proof.
  pre_process.
  subst nodes_strong_spec linklist_node_pre.
  unfold DLL.store_dll.
  Intros first last.
  sep_apply_l_atomic
    (DLL.dllseg_split storeA_strong_spec first head_strong_spec
       head_strong_spec last prefix_strong_spec
       (removed_strong_spec :: suffix_strong_spec)).
  Intros removed_ptr removed_prev.
  simpl DLL.dllseg.
  Intros removed_next.
  Intros.
  subst removed_ptr.
  sep_apply_l_atomic
    (DLL.dllseg_to_dllseg_shift storeA_strong_spec first head_strong_spec
       (DLL.getPtr removed_strong_spec) removed_prev prefix_strong_spec).
  sep_apply_l_atomic
    (DLL.dllseg_to_dllseg_shift_rev storeA_strong_spec removed_next
       (DLL.getPtr removed_strong_spec) head_strong_spec last suffix_strong_spec).
  Exists removed_next removed_prev.
  cancel (DLL.dllseg_shift storeA_strong_spec head_strong_spec removed_prev
            prefix_strong_spec).
  cancel (DLL.dllseg_shift_rev storeA_strong_spec removed_next
            head_strong_spec suffix_strong_spec).
  entailer!.
Qed.

Lemma proof_of_DoubleLinkListRmNode_return_wit_1 : DoubleLinkListRmNode_return_wit_1.
Proof.
  pre_process.
  sep_apply_l_atomic
    (DLL.dllseg_shift_to_dllseg storeA_strong_spec head_strong_spec
       node_prev node_next prefix_strong_spec).
  Intros first.
  sep_apply_l_atomic
    (DLL.dllseg_shift_rev_to_dllseg storeA_strong_spec node_next
       node_prev head_strong_spec suffix_strong_spec).
  Intros last.
  sep_apply_l_atomic
    (DLL.dllseg_concat storeA_strong_spec first head_strong_spec node_next
       node_prev head_strong_spec last prefix_strong_spec suffix_strong_spec).
  unfold xizi_dll_detached.
  sep_apply_r_atomic (DLL.store_dll_empty_rev (fun _ : addr => fun _ : unit => emp)
                        linklist_node_pre).
  unfold DLL.store_dll.
  Exists first last.
  entailer!.
Qed.

Lemma proof_of_DoubleLinkListRmNode_derive_remove_tail_spec_by_strong_spec : DoubleLinkListRmNode_derive_remove_tail_spec_by_strong_spec.
Proof.
  pre_process.
  Exists A storeA_remove_tail_spec head_remove_tail_spec
    removed_remove_tail_spec
    (prefix_remove_tail_spec ++ removed_remove_tail_spec :: nil)
    prefix_remove_tail_spec nil.
  apply sepcon_cancel_end.
  - entailer!.
  - apply derivable1_wand_sepcon_adjoint.
    simpl. rewrite ?app_nil_r. entailer!.
Qed.

Lemma proof_of_DoubleLinkListRmNode_derive_remove_front_spec_by_strong_spec : DoubleLinkListRmNode_derive_remove_front_spec_by_strong_spec.
Proof.
  pre_process.
  Exists A storeA_remove_front_spec head_remove_front_spec
    removed_remove_front_spec
    (nil ++ removed_remove_front_spec :: suffix_remove_front_spec)
    nil suffix_remove_front_spec.
  apply sepcon_cancel_end.
  - entailer!.
  - apply derivable1_wand_sepcon_adjoint.
    simpl. entailer!.
Qed.

Lemma proof_of_DoubleLinkListRmNode_derive_remove_member_spec_by_strong_spec : DoubleLinkListRmNode_derive_remove_member_spec_by_strong_spec.
Proof.
  pre_process.
  destruct (first_split__storeA_remove linklist_node_pre
    nodes_remove_member_spec H) as
    (prefix & removed & suffix & Hnodes & Hptr & Hremove).
  Exists A storeA_remove_member_spec head_remove_member_spec removed
    nodes_remove_member_spec prefix suffix.
  apply sepcon_cancel_end.
  - entailer!.
  - apply derivable1_wand_sepcon_adjoint.
    Exists (prefix ++ suffix) removed.
    unfold xizi_dll_remove_node_rel.
    entailer!.
    + exists prefix, suffix. split; [exact Hnodes | reflexivity].
    + rewrite Hptr. exact Hremove.
Qed.
