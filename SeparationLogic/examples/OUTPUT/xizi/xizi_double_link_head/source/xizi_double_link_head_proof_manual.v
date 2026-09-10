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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_head.source Require Import xizi_double_link_head_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_head.source Require Import xizi_double_link_head_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import CRules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_head.source
      Require Import xizi_double_link_head_lib.
Local Open Scope sac.

Lemma proof_of_DoubleLinkListGetHead_entail_wit_1 : DoubleLinkListGetHead_entail_wit_1.
Proof.
 pre_process. unfold XiziLocalDLL.store_dll.
 Intros first last. Exists last first. entailer!.
Qed. 

Lemma proof_of_DoubleLinkListGetHead_return_wit_1 : DoubleLinkListGetHead_return_wit_1.
Proof.
 pre_process. subst nodes_general.
 split_pure_spatial.
 - unfold XiziLocalDLL.store_dll. Exists first_out last_out. entailer!.
 - dump_pre_spatial. reflexivity.
Qed. 

Lemma proof_of_DoubleLinkListGetHead_return_wit_2 : DoubleLinkListGetHead_return_wit_2.
Proof.
 pre_process.
 split_pure_spatial.
 - unfold XiziLocalDLL.store_dll. Exists first_out last_out. entailer!.
 - destruct nodes_general as [| a rest]; [contradiction |].
   simpl [XiziLocalDLL.dllseg]. Intros next. Intros.
   dump_pre_spatial. assumption.
Qed. 

Lemma proof_of_DoubleLinkListGetHead_derive_nil_case_by_general : DoubleLinkListGetHead_derive_nil_case_by_general.
Proof.
 pre_process.
 Exists A storeA_nil_case (@nil (DLL.DL_Node A)).
 apply sepcon_cancel_end.
 - cancel.
 - apply derivable1_wand_sepcon_adjoint. cancel.
   Intros retval. Intros. Exists retval. entailer!.
Qed. 

Lemma proof_of_IsDoubleLinkListEmpty_derive_expanded_by_general : IsDoubleLinkListEmpty_derive_expanded_by_general.
Proof.
 pre_process.
 Exists A storeA_expanded nodes_expanded.
 apply sepcon_cancel_end.
 - unfold XiziLocalDLL.store_dll. Exists first_link_expanded last_link_expanded.
   entailer!.
 - apply derivable1_wand_sepcon_adjoint. cancel.
   Split.
   + Intros retval. Intros. unfold XiziLocalDLL.store_dll.
     Intros first last. Left. Exists last first retval. entailer!.
   + Intros retval. Intros. unfold XiziLocalDLL.store_dll.
     Intros first last. Right. Exists last first retval. entailer!.
Qed. 

