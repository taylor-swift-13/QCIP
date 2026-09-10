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
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_single_link_common Require Import xizi_single_link_lib.
Require Import SimpleC.EE.OUTPUT.xizi.xizi_single_link_insert_after.source.xizi_single_link_insert_after_lib.
Local Open Scope sac.
Require Import xizi_single_link_strategy_goal.
Require Import xizi_single_link_strategy_proof.

(*----- Function SingleLinkListNodeInsert -----*)

Definition SingleLinkListNodeInsert_entail_wit_1 := 
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (l: (@list (@sll_payload_node A))) (a: A) (storeA: (Z -> (A -> Assertion))) ,
  (xizi_sll_head_payload storeA linklist_pre l )
  **  (storeA linklist_node_pre a )
  **  (xizi_sll_node linklist_node_pre )
|--
  EX (first: Z) ,
  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ”
  &&  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
  **  (storeA linklist_node_pre a )
  **  (xizi_sll_payload storeA first l )
) \/
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (l: (@list (@sll_payload_node A))) (a: A) (storeA: (Z -> (A -> Assertion))) (PreH1 : (linklist_node_pre <> 0)) ,
  (xizi_sll_head_payload storeA linklist_pre l )
  **  (storeA linklist_node_pre a )
|--
  EX (first: Z) ,
  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ”
  &&  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (storeA linklist_node_pre a )
  **  (xizi_sll_payload storeA first l )
).

Definition SingleLinkListNodeInsert_return_wit_1 := 
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (l: (@list (@sll_payload_node A))) (a: A) (storeA: (Z -> (A -> Assertion))) (first: Z) (PreH1 : (linklist_pre <> 0)) (PreH2 : (linklist_node_pre <> 0)) ,
  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (storeA linklist_node_pre a )
  **  (xizi_sll_payload storeA first l )
|--
  (xizi_sll_head_payload storeA linklist_pre (cons ((Build_sll_payload_node (a) (linklist_node_pre))) (l)) )
) \/
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (l: (@list (@sll_payload_node A))) (a: A) (storeA: (Z -> (A -> Assertion))) (first: Z) (PreH1 : (linklist_pre <> 0)) (PreH2 : (linklist_node_pre <> 0)) ,
  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (storeA linklist_node_pre a )
  **  (xizi_sll_payload storeA first l )
|--
  (xizi_sll_head_payload storeA linklist_pre (cons ((Build_sll_payload_node (a) (linklist_node_pre))) (l)) )
).

Definition SingleLinkListNodeInsert_return_wit_1_split_goal_spatial := 
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (l: (@list (@sll_payload_node A))) (a: A) (storeA: (Z -> (A -> Assertion))) (first: Z) (PreH1 : (linklist_pre <> 0)) (PreH2 : (linklist_node_pre <> 0)) ,
  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (storeA linklist_node_pre a )
  **  (xizi_sll_payload storeA first l )
|--
  (xizi_sll_head_payload storeA linklist_pre (cons ((Build_sll_payload_node (a) (linklist_node_pre))) (l)) )
.

Module Type VC_Correct.

Include xizi_single_link_Strategy_Correct.

Axiom proof_of_SingleLinkListNodeInsert_entail_wit_1 : SingleLinkListNodeInsert_entail_wit_1.
Axiom proof_of_SingleLinkListNodeInsert_return_wit_1 : SingleLinkListNodeInsert_return_wit_1.

End VC_Correct.
