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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_init_then_insert_before.source Require Import xizi_double_link_init_then_insert_before_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_init_then_insert_before.source Require Import xizi_double_link_init_then_insert_before_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_init_then_insert_before.source Require Import xizi_double_link_init_then_insert_before_lib.
Local Open Scope sac.

Lemma proof_of_InitDoubleLinkList_return_wit_1 : InitDoubleLinkList_return_wit_1.
Proof.
  pre_process.
  apply XiziStoreADLL.store_dll_empty_rev.
  exact PreH1.
Qed. 

Lemma proof_of_xizi_double_link_init_then_insert_before_return_wit_1 : xizi_double_link_init_then_insert_before_return_wit_1.
Proof.
  pre_process.
Qed. 

Lemma proof_of_DoubleLinkListInsertNodeBefore_derive_sentinel_case_by_dispatch_case : DoubleLinkListInsertNodeBefore_derive_sentinel_case_by_dispatch_case.
Proof.
  pre_process.
  prop_apply_p (store_dll_absent__insert_before_payload A storeA_sentinel_case linklist_pre nodes_sentinel_case).
  Intros_p Habsent.
  Exists A storeA_sentinel_case data_sentinel_case linklist_pre nodes_sentinel_case.
  apply sepcon_cancel_end.
  - split_pure_spatial.
    + cancel; try reflexivity.
    + dump_pre_spatial. unfold xizi_double_link_insert_before_anchor. auto.
  - apply derivable1_wand_sepcon_adjoint.
    Intros result.
    rename H into Hresult.
    rewrite (payload_absent_result__insert_before_payload A nodes_sentinel_case result linklist_pre (XiziStoreADLL.Build_DL_Node data_sentinel_case linklist_node_pre) Habsent Hresult).
    cancel; try reflexivity.
Qed. 

Lemma proof_of_DoubleLinkListInsertNodeBefore_derive_member_case_by_dispatch_case : DoubleLinkListInsertNodeBefore_derive_member_case_by_dispatch_case.
Proof.
  pre_process.
  Exists A storeA_member_case data_member_case head_member_case nodes_member_case.
  apply sepcon_cancel_end.
  - split_pure_spatial.
    + cancel; try reflexivity.
    + dump_pre_spatial. unfold xizi_double_link_insert_before_anchor. auto.
  - apply derivable1_wand_sepcon_adjoint.
    Intros result.
    Exists result.
    split_pure_spatial.
    + cancel; reflexivity.
    + dump_pre_spatial. assumption.
Qed. 

