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

Lemma proof_of_DoubleLinkListRmNode_entail_wit_1 : DoubleLinkListRmNode_entail_wit_1.
Proof.
  unfold DoubleLinkListRmNode_entail_wit_1; left.
  intros A node suf pre nodes a head storeA Hp Hnodes.
  subst nodes. unfold XiziLocalDLL.store_dll.
  Intros first last.
  sep_apply_l_atomic (XiziLocalDLL.dllseg_split storeA first head head last pre (a :: suf)).
  Intros mid prev.
  unfold XiziLocalDLL.dllseg at 2; fold (@XiziLocalDLL.dllseg A).
  Intros next.
  match goal with H : mid = DLL.getPtr a |- _ => rewrite Hp in H; subst mid end.
  sep_apply_l_atomic (XiziLocalDLL.dllseg_to_dllseg_shift storeA first head node prev pre).
  fold (XiziLocalDLL.dllseg storeA next node head last suf).
  sep_apply_l_atomic (XiziLocalDLL.dllseg_to_dllseg_shift_rev storeA next node head last suf).
  Exists next prev. repeat progress cancel.
Qed. 

Lemma proof_of_DoubleLinkListRmNode_return_wit_1 : DoubleLinkListRmNode_return_wit_1.
Proof.
  unfold DoubleLinkListRmNode_return_wit_1; left.
  intros A node suf pre a head storeA next prev.
  sep_apply_l_atomic (XiziLocalDLL.store_dll_empty_rev storeA node).
  cancel (XiziLocalDLL.store_dll storeA node nil).
  cancel (storeA node (DLL.getData a)).
  sep_apply_l_atomic (XiziLocalDLL.dllseg_shift_to_dllseg storeA head prev next pre).
  Intros first.
  sep_apply_l_atomic (XiziLocalDLL.dllseg_shift_rev_to_dllseg storeA next prev head suf).
  Intros last.
  sep_apply_l_atomic (XiziLocalDLL.dllseg_concat storeA first head next prev head last pre suf).
  unfold XiziLocalDLL.store_dll. Exists first last. repeat progress cancel.
Qed. 

Lemma proof_of_DoubleLinkListRmNode_derive_remove_tail_spec_by_strong_spec : DoubleLinkListRmNode_derive_remove_tail_spec_by_strong_spec.
Proof.
  unfold DoubleLinkListRmNode_derive_remove_tail_spec_by_strong_spec.
  intros A node pre a head storeA. Intros.
  Exists A storeA head a (pre ++ a :: nil) pre (@nil (DLL.DL_Node A)).
  apply sepcon_cancel_end.
  - split_pure_spatial; [repeat progress cancel |]. split_pures; dump_pre_spatial; auto.
  - apply derivable1_wand_sepcon_adjoint. rewrite app_nil_r. repeat progress cancel. cancel (storeA node (DLL.getData a)). cancel.
Qed. 

Lemma proof_of_DoubleLinkListRmNode_derive_remove_front_spec_by_strong_spec : DoubleLinkListRmNode_derive_remove_front_spec_by_strong_spec.
Proof.
  unfold DoubleLinkListRmNode_derive_remove_front_spec_by_strong_spec.
  intros A node suf a head storeA. Intros.
  Exists A storeA head a (a :: suf) (@nil (DLL.DL_Node A)) suf.
  apply sepcon_cancel_end.
  - split_pure_spatial; [repeat progress cancel |]. split_pures; dump_pre_spatial; auto.
  - apply derivable1_wand_sepcon_adjoint. simpl app. repeat progress cancel. cancel (storeA node (DLL.getData a)). cancel.
Qed. 

Lemma proof_of_DoubleLinkListRmNode_derive_remove_member_spec_by_strong_spec : DoubleLinkListRmNode_derive_remove_member_spec_by_strong_spec.
Proof.
  unfold DoubleLinkListRmNode_derive_remove_member_spec_by_strong_spec.
  intros A node nodes head storeA. Intros.
  destruct (first_split__storeA_remove node nodes H) as (pre & a & suf & Hnodes & Hp & Hr).
  Exists A storeA head a nodes pre suf.
  apply sepcon_cancel_end.
  - split_pure_spatial; [repeat progress cancel |]. split_pures; dump_pre_spatial; auto.
  - apply derivable1_wand_sepcon_adjoint.
    Exists (pre ++ suf) a.
    split_pure_spatial; [repeat progress cancel |].
    split_pures; dump_pre_spatial; auto.
    unfold xizi_dll_remove_node_rel. split.
    + exists pre, suf; auto.
    + rewrite Hp; exact Hr.
Qed. 

