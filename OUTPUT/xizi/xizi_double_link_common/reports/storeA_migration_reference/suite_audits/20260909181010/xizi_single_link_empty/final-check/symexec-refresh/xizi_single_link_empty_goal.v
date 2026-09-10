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
Require Import xizi_single_link_empty_lib.
Local Open Scope sac.
Require Import xizi_single_link_strategy_goal.
Require Import xizi_single_link_strategy_proof.

(*----- Function IsSingleLinkListEmpty -----*)

Definition IsSingleLinkListEmpty_safety_wit_1 := 
forall (A: Type) (linklist_pre: Z) (l: (@list (@sll_payload_node A))) (storeA: (Z -> (A -> Assertion))) (first: Z) (PreH1 : (linklist_pre <> 0)) ,
  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_sll_payload storeA first l )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition IsSingleLinkListEmpty_entail_wit_1 := 
(
forall (A: Type) (linklist_pre: Z) (l: (@list (@sll_payload_node A))) (storeA: (Z -> (A -> Assertion))) ,
  (xizi_sll_head_payload storeA linklist_pre l )
|--
  EX (first: Z) ,
  “ (linklist_pre <> 0) ”
  &&  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_sll_payload storeA first l )
) \/
(
forall (A: Type) (linklist_pre: Z) (l: (@list (@sll_payload_node A))) (storeA: (Z -> (A -> Assertion))) ,
  (xizi_sll_head_payload storeA linklist_pre l )
|--
  EX (first: Z) ,
  “ (linklist_pre <> 0) ”
  &&  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_sll_payload storeA first l )
).

Definition IsSingleLinkListEmpty_return_wit_1 := 
(
forall (A: Type) (linklist_pre: Z) (l: (@list (@sll_payload_node A))) (storeA: (Z -> (A -> Assertion))) (first: Z) (PreH1 : (first <> 0)) (PreH2 : (linklist_pre <> 0)) ,
  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_sll_payload storeA first l )
|--
  “ (xizi_sll_empty_result l 0 ) ”
  &&  (xizi_sll_head_payload storeA linklist_pre l )
) \/
(
forall (A: Type) (linklist_pre: Z) (l: (@list (@sll_payload_node A))) (storeA: (Z -> (A -> Assertion))) (first: Z) (PreH1 : (first <> 0)) (PreH2 : (linklist_pre <> 0)) ,
  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_sll_payload storeA first l )
|--
  “ (xizi_sll_empty_result l 0 ) ”
  &&  (xizi_sll_head_payload storeA linklist_pre l )
).

Definition IsSingleLinkListEmpty_return_wit_1_split_goal_1 := 
forall (A: Type) (linklist_pre: Z) (l: (@list (@sll_payload_node A))) (storeA: (Z -> (A -> Assertion))) (first: Z) (PreH1 : (first <> 0)) (PreH2 : (linklist_pre <> 0)) ,
  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_sll_payload storeA first l )
|--
  “ (xizi_sll_empty_result l 0 ) ”
.

Definition IsSingleLinkListEmpty_return_wit_1_split_goal_spatial := 
forall (A: Type) (linklist_pre: Z) (l: (@list (@sll_payload_node A))) (storeA: (Z -> (A -> Assertion))) (first: Z) (PreH1 : (first <> 0)) (PreH2 : (linklist_pre <> 0)) ,
  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_sll_payload storeA first l )
|--
  (xizi_sll_head_payload storeA linklist_pre l )
.

Definition IsSingleLinkListEmpty_return_wit_2 := 
(
forall (A: Type) (linklist_pre: Z) (l: (@list (@sll_payload_node A))) (storeA: (Z -> (A -> Assertion))) (first: Z) (PreH1 : (first = 0)) (PreH2 : (linklist_pre <> 0)) ,
  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_sll_payload storeA first l )
|--
  “ (xizi_sll_empty_result l 1 ) ”
  &&  (xizi_sll_head_payload storeA linklist_pre l )
) \/
(
forall (A: Type) (linklist_pre: Z) (l: (@list (@sll_payload_node A))) (storeA: (Z -> (A -> Assertion))) (first: Z) (PreH1 : (first = 0)) (PreH2 : (linklist_pre <> 0)) ,
  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_sll_payload storeA first l )
|--
  “ (xizi_sll_empty_result l 1 ) ”
  &&  (xizi_sll_head_payload storeA linklist_pre l )
).

Definition IsSingleLinkListEmpty_return_wit_2_split_goal_1 := 
forall (A: Type) (linklist_pre: Z) (l: (@list (@sll_payload_node A))) (storeA: (Z -> (A -> Assertion))) (first: Z) (PreH1 : (first = 0)) (PreH2 : (linklist_pre <> 0)) ,
  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_sll_payload storeA first l )
|--
  “ (xizi_sll_empty_result l 1 ) ”
.

Definition IsSingleLinkListEmpty_return_wit_2_split_goal_spatial := 
forall (A: Type) (linklist_pre: Z) (l: (@list (@sll_payload_node A))) (storeA: (Z -> (A -> Assertion))) (first: Z) (PreH1 : (first = 0)) (PreH2 : (linklist_pre <> 0)) ,
  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_sll_payload storeA first l )
|--
  (xizi_sll_head_payload storeA linklist_pre l )
.

Module Type VC_Correct.

Include xizi_single_link_Strategy_Correct.

Axiom proof_of_IsSingleLinkListEmpty_safety_wit_1 : IsSingleLinkListEmpty_safety_wit_1.
Axiom proof_of_IsSingleLinkListEmpty_entail_wit_1 : IsSingleLinkListEmpty_entail_wit_1.
Axiom proof_of_IsSingleLinkListEmpty_return_wit_1 : IsSingleLinkListEmpty_return_wit_1.
Axiom proof_of_IsSingleLinkListEmpty_return_wit_2 : IsSingleLinkListEmpty_return_wit_2.

End VC_Correct.
