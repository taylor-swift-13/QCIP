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
Import DLL.
Local Open Scope sac.

Lemma proof_of_DoubleLinkListRmNode_entail_wit_1 : DoubleLinkListRmNode_entail_wit_1.
Proof.
  pre_process.
  subst nodes_strong_spec.
  unfold store_dll.
  Intros first last.
  sep_apply_l_atomic
    (dllseg_split storeA_strong_spec first head_strong_spec
       head_strong_spec last prefix_strong_spec
       (removed_strong_spec :: suffix_strong_spec)).
  Intros removed_ptr removed_prev.
  simpl dllseg.
  Intros node_next.
  Intros.
  subst removed_ptr.
  rewrite PreH1.
  sep_apply_l_atomic
    (dllseg_to_dllseg_shift storeA_strong_spec first head_strong_spec
       linklist_node_pre removed_prev prefix_strong_spec).
  sep_apply_l_atomic
    (dllseg_to_dllseg_shift_rev storeA_strong_spec node_next
       linklist_node_pre head_strong_spec last suffix_strong_spec).
  Exists node_next removed_prev.
  entailer!.
Qed. 

Lemma proof_of_DoubleLinkListRmNode_return_wit_1 : DoubleLinkListRmNode_return_wit_1.
Proof.
  pre_process.
  sep_apply_l_atomic
    (dllseg_shift_to_dllseg storeA_strong_spec head_strong_spec
       node_prev node_next prefix_strong_spec).
  Intros first.
  sep_apply_l_atomic
    (dllseg_shift_rev_to_dllseg storeA_strong_spec node_next
       node_prev head_strong_spec suffix_strong_spec).
  Intros last.
  sep_apply_l_atomic
    (dllseg_concat storeA_strong_spec first head_strong_spec
       node_next node_prev head_strong_spec last
       prefix_strong_spec suffix_strong_spec).
  unfold xizi_dll_detached, store_dll.
  Exists first last linklist_node_pre linklist_node_pre.
  simpl dllseg.
  entailer!.
Qed. 

Lemma proof_of_DoubleLinkListRmNode_derive_remove_tail_spec_by_strong_spec : DoubleLinkListRmNode_derive_remove_tail_spec_by_strong_spec.
Proof.
  unfold DoubleLinkListRmNode_derive_remove_tail_spec_by_strong_spec.
  intros A node pre a head storeA. Intros.
  Exists A storeA head a (pre ++ a :: nil) pre (@nil (DL_Node A)).
  apply sepcon_cancel_end.
  - split_pure_spatial; [repeat progress cancel |].
    split_pures; dump_pre_spatial; auto.
  - apply derivable1_wand_sepcon_adjoint.
    rewrite app_nil_r.
    repeat progress cancel.
    cancel (storeA node (getData a)).
    cancel.
Qed.

Lemma proof_of_DoubleLinkListRmNode_derive_remove_front_spec_by_strong_spec : DoubleLinkListRmNode_derive_remove_front_spec_by_strong_spec.
Proof.
  unfold DoubleLinkListRmNode_derive_remove_front_spec_by_strong_spec.
  intros A node suf a head storeA. Intros.
  Exists A storeA head a (a :: suf) (@nil (DL_Node A)) suf.
  apply sepcon_cancel_end.
  - split_pure_spatial; [repeat progress cancel |].
    split_pures; dump_pre_spatial; auto.
  - apply derivable1_wand_sepcon_adjoint.
    simpl app.
    repeat progress cancel.
    cancel (storeA node (getData a)).
    cancel.
Qed.

Lemma proof_of_DoubleLinkListRmNode_derive_remove_member_spec_by_strong_spec : DoubleLinkListRmNode_derive_remove_member_spec_by_strong_spec.
Proof.
  unfold DoubleLinkListRmNode_derive_remove_member_spec_by_strong_spec.
  intros A node nodes head storeA. Intros.
  destruct (first_split__storeA_remove node nodes H)
    as (pre & a & suf & Hnodes & Hp & Hr).
  Exists A storeA head a nodes pre suf.
  apply sepcon_cancel_end.
  - split_pure_spatial; [repeat progress cancel |].
    split_pures; dump_pre_spatial; auto.
  - apply derivable1_wand_sepcon_adjoint.
    Exists (pre ++ suf) a.
    split_pure_spatial; [repeat progress cancel |].
    split_pures; dump_pre_spatial; auto.
    unfold xizi_dll_remove_node_rel.
    split.
    + exists pre, suf; auto.
    + rewrite Hp; exact Hr.
Qed.
