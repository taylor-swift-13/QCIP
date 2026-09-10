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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_init.source Require Import xizi_double_link_init_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_init.source Require Import xizi_double_link_init_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import CRules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
Local Open Scope sac.

Lemma proof_of_InitDoubleLinkList_entail_wit_1 : InitDoubleLinkList_entail_wit_1.
Proof.
  pre_process.
  unfold XiziLocalDLL.occupy_dll_node.
  Intros prev next.
  Exists next prev.
  cancel (&(linklist_head_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next).
  cancel (&(linklist_head_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev).
Qed. 

Lemma proof_of_InitDoubleLinkList_return_wit_1 : InitDoubleLinkList_return_wit_1.
Proof.
  pre_process.
  apply XiziLocalDLL.store_dll_empty_rev.
Qed. 

