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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_insert_after.source Require Import xizi_double_link_insert_after_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_insert_after.source Require Import xizi_double_link_insert_after_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import CRules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_insert_after.source Require Import xizi_double_link_insert_after_lib.
Local Open Scope sac.

Lemma proof_of_DoubleLinkListInsertNodeAfter_entail_wit_1 : DoubleLinkListInsertNodeAfter_entail_wit_1.
Proof.
pre_process.
destruct (Z.eq_dec linklist_pre head_dispatch_case) as [Heq|Hneq].
- subst linklist_pre.
  unfold XiziLocalDLL.store_dll, XiziLocalDLL.occupy_dll_node.
  Intros first last detached_prev detached_next.
  destruct nodes_dispatch_case as [|[next_data old_next] rest].
  + simpl XiziLocalDLL.dllseg. Intros. destruct H; subst first last.
    Right.
    Exists head_dispatch_case head_dispatch_case head_dispatch_case detached_prev detached_next.
    unfold xizi_insert_after_dispatch_payload.
    entailer!.
  + simpl XiziLocalDLL.dllseg. Intros next_next. subst first.
    Left. Right.
    Exists next_next last next_data old_next rest detached_prev detached_next.
    unfold xizi_insert_after_dispatch_payload.
    entailer!.
- unfold xizi_double_link_insert_after_anchor in PreH1.
  destruct PreH1 as [Hin|Heq]; [|contradiction].
  destruct (payload_first_split__payload_insert_after nodes_dispatch_case linklist_pre Hin)
    as (prefix & anchor_data & suffix & Hnodes & Hfirst).
  subst nodes_dispatch_case.
  unfold XiziLocalDLL.store_dll, XiziLocalDLL.occupy_dll_node.
  Intros first last detached_prev detached_next.
  sep_apply_l_atomic (XiziLocalDLL.dllseg_split storeA_dispatch_case first head_dispatch_case head_dispatch_case last prefix (DLL.Build_DL_Node anchor_data linklist_pre :: suffix)).
  Intros anchor old_prev.
  simpl XiziLocalDLL.dllseg. Intros old_next. subst anchor.
  destruct suffix as [|[next_data next_ptr] rest].
  + simpl XiziLocalDLL.dllseg. Intros. destruct H; subst old_next last.
    Left. Left. Left.
    Exists old_prev first prefix anchor_data (@nil (DLL.DL_Node A)) detached_prev detached_next.
    split_pure_spatial.
    * entailer!.
    * split_pures; dump_pre_spatial; try reflexivity; try assumption.
      unfold xizi_insert_after_dispatch_payload, xizi_insert_after_payload.
      right; split; [exact Hneq|].
      exists prefix, (DLL.Build_DL_Node anchor_data linklist_pre), nil.
      repeat split; auto.
  + simpl XiziLocalDLL.dllseg. Intros next_next. subst old_next.
    Left. Left. Right.
    Exists next_next old_prev last first next_data next_ptr rest prefix anchor_data (DLL.Build_DL_Node next_data next_ptr :: rest) detached_prev detached_next.
    split_pure_spatial.
    * entailer!.
    * split_pures; dump_pre_spatial; try reflexivity; try assumption.
      unfold xizi_insert_after_dispatch_payload, xizi_insert_after_payload.
      right; split; [exact Hneq|].
      exists prefix, (DLL.Build_DL_Node anchor_data linklist_pre), (DLL.Build_DL_Node next_data next_ptr :: rest).
      repeat split; auto.
Qed. 

Lemma proof_of_DoubleLinkListInsertNodeAfter_return_wit_1 : DoubleLinkListInsertNodeAfter_return_wit_1.
Proof.
pre_process.
Exists (DLL.Build_DL_Node data_dispatch_case linklist_node_pre :: nil).
split_pure_spatial.
- unfold XiziLocalDLL.store_dll.
  Exists linklist_node_pre linklist_node_pre.
  simpl XiziLocalDLL.dllseg.
  Exists head_dispatch_case.
  simpl XiziLocalDLL.dllseg.
  entailer!.
- dump_pre_spatial. subst. exact PreH2.
Qed. 

Lemma proof_of_DoubleLinkListInsertNodeAfter_return_wit_2 : DoubleLinkListInsertNodeAfter_return_wit_2.
Proof.
pre_process.
Exists (DLL.Build_DL_Node data_dispatch_case linklist_node_pre :: nodes_dispatch_case).
split_pure_spatial.
- subst nodes_dispatch_case. unfold XiziLocalDLL.store_dll.
  Exists linklist_node_pre last.
  simpl XiziLocalDLL.dllseg. Exists old_next next_next.
  entailer!.
- dump_pre_spatial. subst. exact PreH2.
Qed. 

Lemma proof_of_DoubleLinkListInsertNodeAfter_return_wit_3 : DoubleLinkListInsertNodeAfter_return_wit_3.
Proof.
pre_process.
Exists (nodes_before ++ DLL.Build_DL_Node anchor_data linklist_pre :: DLL.Build_DL_Node data_dispatch_case linklist_node_pre :: nodes_after).
split_pure_spatial.
- subst nodes_after. unfold XiziLocalDLL.store_dll.
  Exists first last.
  sep_apply_r_atomic (XiziLocalDLL.dllseg_concat storeA_dispatch_case first head_dispatch_case linklist_pre old_prev head_dispatch_case last nodes_before (DLL.Build_DL_Node anchor_data linklist_pre :: DLL.Build_DL_Node data_dispatch_case linklist_node_pre :: DLL.Build_DL_Node next_data old_next :: rest)).
  simpl XiziLocalDLL.dllseg. Exists linklist_node_pre old_next next_next.
  entailer!.
- dump_pre_spatial. exact PreH3.
Qed. 

Lemma proof_of_DoubleLinkListInsertNodeAfter_return_wit_4 : DoubleLinkListInsertNodeAfter_return_wit_4.
Proof.
pre_process.
Exists (nodes_before ++ DLL.Build_DL_Node anchor_data linklist_pre :: DLL.Build_DL_Node data_dispatch_case linklist_node_pre :: nodes_after).
split_pure_spatial.
- subst nodes_after. unfold XiziLocalDLL.store_dll.
  Exists first linklist_node_pre.
  sep_apply_r_atomic (XiziLocalDLL.dllseg_concat storeA_dispatch_case first head_dispatch_case linklist_pre old_prev head_dispatch_case linklist_node_pre nodes_before (DLL.Build_DL_Node anchor_data linklist_pre :: DLL.Build_DL_Node data_dispatch_case linklist_node_pre :: nil)).
  simpl XiziLocalDLL.dllseg. Exists linklist_node_pre head_dispatch_case.
  entailer!.
- dump_pre_spatial. exact PreH3.
Qed. 

Lemma proof_of_DoubleLinkListInsertNodeAfter_derive_sentinel_case_by_dispatch_case : DoubleLinkListInsertNodeAfter_derive_sentinel_case_by_dispatch_case.
Proof.
pre_process.
Exists A storeA_sentinel_case data_sentinel_case linklist_pre nodes_sentinel_case.
unfold xizi_double_link_insert_after_anchor.
entailer!.
apply_sepcon_adjoint.
Intros result.
unfold xizi_insert_after_dispatch_payload in H.
destruct H as [[_ Heq]|[Hneq _]]; [subst result; entailer! | contradiction].
Qed. 

Lemma proof_of_DoubleLinkListInsertNodeAfter_derive_member_case_by_dispatch_case : DoubleLinkListInsertNodeAfter_derive_member_case_by_dispatch_case.
Proof.
pre_process.
prop_apply_p (store_dll_member_not_sentinel__insert_after_payload storeA_member_case head_member_case nodes_member_case linklist_pre H).
Intros_p Hneq.
Exists A storeA_member_case data_member_case head_member_case nodes_member_case.
unfold xizi_double_link_insert_after_anchor.
entailer!.
apply_sepcon_adjoint.
Intros result.
unfold xizi_insert_after_dispatch_payload in H0.
destruct H0 as [[Heq _]|[_ Hresult]]; [contradiction|].
Exists result. entailer!.
Qed. 

