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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_head_rec.source Require Import xizi_double_link_head_rec_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_head_rec.source Require Import xizi_double_link_head_rec_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_head_rec.source
      Require Import xizi_double_link_head_rec_lib.
Local Open Scope sac.

Lemma proof_of_DoubleLinkListGetHead_entail_wit_1 : DoubleLinkListGetHead_entail_wit_1.
Proof.
  pre_process.
  unfold xizi_store_dll, XiziStoreADLL.store_dll,
    xizi_dll_links, XiziDLL.links.
  cbn [XiziDoubleLinkLayout.struct_name XiziDoubleLinkLayout.next_field XiziDoubleLinkLayout.prev_field].
  Intros first last.
  Exists last first.
  split_pure_spatial.
  - cancel; cbn; cancel.
  - dump_pre_spatial. assumption.
Qed. 

Lemma proof_of_DoubleLinkListGetHead_return_wit_1 : DoubleLinkListGetHead_return_wit_1.
Proof.
  pre_process.
  split_pure_spatial.
  - unfold xizi_store_dll, XiziStoreADLL.store_dll.
    Exists first_link last_link.
    unfold xizi_dll_links, XiziDLL.links.
    cbn [XiziDoubleLinkLayout.struct_name XiziDoubleLinkLayout.next_field XiziDoubleLinkLayout.prev_field].
    split_pure_spatial.
    + cancel; cbn; cancel.
    + dump_pre_spatial. assumption.
  - destruct nodes_general as [|a rest].
    + dump_pre_spatial. reflexivity.
    + cbn [XiziStoreADLL.dllseg].
      Intros next.
      dump_pre_spatial. contradiction.
Qed. 

Lemma proof_of_DoubleLinkListGetHead_return_wit_2 : DoubleLinkListGetHead_return_wit_2.
Proof.
  pre_process.
  split_pure_spatial.
  - unfold xizi_store_dll, XiziStoreADLL.store_dll.
    Exists first_link last_link.
    unfold xizi_dll_links, XiziDLL.links.
    cbn [XiziDoubleLinkLayout.struct_name XiziDoubleLinkLayout.next_field XiziDoubleLinkLayout.prev_field].
    split_pure_spatial.
    + cancel; cbn; cancel.
    + dump_pre_spatial. assumption.
  - destruct nodes_general as [|a rest].
    + cbn [XiziStoreADLL.dllseg]. Intros.
      dump_pre_spatial. tauto.
    + cbn [XiziStoreADLL.dllseg]. Intros next.
      dump_pre_spatial.
      cbn [xizi_double_link_first_value xizi_dll_ptrs map].
      assumption.
Qed. 

Lemma proof_of_DoubleLinkListGetHead_derive_nil_case_by_general : DoubleLinkListGetHead_derive_nil_case_by_general.
Proof.
  pre_process.
  Exists A storeA_nil_case (@nil (XiziStoreADLL.DL_Node A)).
  apply sepcon_cancel_end.
  - cancel; cbn; cancel.
  - apply derivable1_wand_sepcon_adjoint.
    Intros retval_2.
    Exists retval_2.
    split_pure_spatial.
    + cancel; cbn; cancel.
    + dump_pre_spatial. exact H.
Qed. 

