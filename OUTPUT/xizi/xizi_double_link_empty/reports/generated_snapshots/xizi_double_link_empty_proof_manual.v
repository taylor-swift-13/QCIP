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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_empty.source Require Import xizi_double_link_empty_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_empty.source Require Import xizi_double_link_empty_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import CRules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
Local Open Scope sac.

Lemma proof_of_IsDoubleLinkListEmpty_entail_wit_1 : IsDoubleLinkListEmpty_entail_wit_1.
Proof.
 pre_process. unfold XiziLocalDLL.store_dll.
 Intros first last. Exists last first. repeat progress cancel.
Qed. 

Lemma proof_of_IsDoubleLinkListEmpty_return_wit_1 : IsDoubleLinkListEmpty_return_wit_1.
Proof.
 pre_process.
 destruct nodes_general as [|node nodes].
 - simpl XiziLocalDLL.dllseg. Intros_p Heq. destruct Heq; contradiction.
 - unfold XiziLocalDLL.store_dll. Exists first last.
   split_pure_spatial.
   + repeat progress cancel.
   + split_pures; dump_pre_spatial; congruence.
Qed. 

Lemma proof_of_IsDoubleLinkListEmpty_return_wit_2 : IsDoubleLinkListEmpty_return_wit_2.
Proof.
 pre_process. subst first.
 destruct nodes_general as [|node nodes].
 - unfold XiziLocalDLL.store_dll. Exists linklist_pre last.
   split_pure_spatial.
   + repeat progress cancel.
   + split_pures; dump_pre_spatial; reflexivity.
 - simpl XiziLocalDLL.dllseg. Intros next.
   sep_apply_l_atomic (dup_store_ptr
      (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_next")) linklist_pre next).
   Intros_p Hfalse. contradiction.
Qed. 

Lemma proof_of_IsDoubleLinkListEmpty_derive_nil_case_by_general : IsDoubleLinkListEmpty_derive_nil_case_by_general.
Proof.
 pre_process.
 Exists A storeA_nil_case (@nil (DLL.DL_Node A)).
 cancel (XiziLocalDLL.store_dll storeA_nil_case linklist_pre nil).
 apply derivable1_wand_sepcon_adjoint.
 Split.
 - Intros retval. contradiction.
 - Intros retval. Exists retval. split_pure_spatial.
   + repeat progress cancel.
   + dump_pre_spatial. assumption.
Qed. 

