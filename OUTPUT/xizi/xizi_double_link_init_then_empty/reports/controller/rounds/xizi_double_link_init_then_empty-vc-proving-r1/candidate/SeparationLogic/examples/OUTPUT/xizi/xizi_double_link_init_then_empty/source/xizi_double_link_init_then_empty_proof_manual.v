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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_init_then_empty.source Require Import xizi_double_link_init_then_empty_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_init_then_empty.source Require Import xizi_double_link_init_then_empty_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
Local Open Scope sac.

Lemma proof_of_InitDoubleLinkList_return_wit_1 : InitDoubleLinkList_return_wit_1.
Proof.
  pre_process.
  apply XiziStoreADLL.store_dll_empty_rev.
  assumption.
Qed. 

Lemma proof_of_IsDoubleLinkListEmpty_entail_wit_1 : IsDoubleLinkListEmpty_entail_wit_1.
Proof.
  pre_process.
  unfold xizi_store_dll, XiziStoreADLL.store_dll.
  Intros first last.
  Exists last first.
  unfold xizi_dll_links, XiziDLL.links.
  entailer!.
Qed. 

Lemma proof_of_IsDoubleLinkListEmpty_return_wit_1 : IsDoubleLinkListEmpty_return_wit_1.
Proof.
  pre_process.
  destruct nodes_general as [|a rest].
  - simpl XiziStoreADLL.dllseg.
    Intros.
    destruct H as [Hfirst Hlast].
    contradiction.
  - unfold xizi_store_dll, XiziStoreADLL.store_dll.
    Exists first last.
    unfold xizi_dll_links, XiziDLL.links.
    entailer!.
    discriminate.
Qed. 

Lemma proof_of_IsDoubleLinkListEmpty_return_wit_2 : IsDoubleLinkListEmpty_return_wit_2.
Proof.
  pre_process.
  destruct nodes_general as [|a rest].
  - unfold xizi_store_dll, XiziStoreADLL.store_dll.
    Exists first last.
    unfold xizi_dll_links, XiziDLL.links.
    entailer!.
  - simpl XiziStoreADLL.dllseg.
    Intros next.
    Intros.
    contradiction.
Qed. 

Lemma proof_of_IsDoubleLinkListEmpty_derive_nil_case_by_general : IsDoubleLinkListEmpty_derive_nil_case_by_general.
Proof.
  pre_process.
  Exists A storeA_nil_case (@nil (XiziStoreADLL.DL_Node A)).
  apply sepcon_cancel_end.
  - cancel.
  - apply derivable1_wand_sepcon_adjoint.
    cancel.
    Split.
    + Intros retval_2.
      Intros.
      contradiction.
    + Intros retval_2.
      Exists retval_2.
      entailer!.
Qed. 

