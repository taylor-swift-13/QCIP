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
From SimpleC.EE.OUTPUT.xizi.xizi_single_link_append.source Require Import xizi_single_link_append_lib.
Local Open Scope sac.
Require Import xizi_single_link_strategy_goal.
Require Import xizi_single_link_strategy_proof.

(*----- Function AppendSingleLinkList -----*)

Definition AppendSingleLinkList_safety_wit_1 := 
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (data: A) (l: (@list (@sll_payload_node A))) (storeA: (Z -> (A -> Assertion))) (next: Z) (l1a: (@list Z)) (node: Z) (l1b: (@list Z)) (PreH1 : ((cons (linklist_pre) ((xizi_sll_payload_addresses (l)))) = (app (l1a) ((cons (node) (l1b)))))) (PreH2 : (node <> 0)) (PreH3 : (linklist_node_pre <> 0)) (PreH4 : (next = 0)) ,
  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  ((( &( "linklist_node" ) )) # Ptr  |-> linklist_node_pre)
  **  ((( &( "node" ) )) # Ptr  |-> node)
  **  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  (xizi_sllseg linklist_pre node l1a )
  **  (xizi_sll next l1b )
  **  (xizi_sll_remove_payloads storeA l )
  **  (storeA linklist_node_pre data )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AppendSingleLinkList_entail_wit_1 := 
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (data: A) (l: (@list (@sll_payload_node A))) (storeA: (Z -> (A -> Assertion))) ,
  (xizi_sll_head_payload storeA linklist_pre l )
  **  (xizi_sll_node linklist_node_pre )
  **  (storeA linklist_node_pre data )
|--
  (xizi_sll_head linklist_pre (xizi_sll_payload_addresses (l)) )
  **  (xizi_sll_node linklist_node_pre )
  **  (xizi_sll_remove_payloads storeA l )
  **  (storeA linklist_node_pre data )
) \/
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (data: A) (l: (@list (@sll_payload_node A))) (storeA: (Z -> (A -> Assertion))) (PreH1 : (linklist_node_pre <> 0)) ,
  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
  **  (xizi_sll_head_payload storeA linklist_pre l )
  **  (storeA linklist_node_pre data )
|--
  EX (q: Z) ,
  “ (linklist_pre <> 0) ”
  &&  (xizi_sll q (xizi_sll_payload_addresses (l)) )
  **  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> q)
  **  (xizi_sll_node linklist_node_pre )
  **  (xizi_sll_remove_payloads storeA l )
  **  (storeA linklist_node_pre data )
).

Definition AppendSingleLinkList_entail_wit_2 := 
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (data: A) (l: (@list (@sll_payload_node A))) (storeA: (Z -> (A -> Assertion))) ,
  (xizi_sll_head linklist_pre (xizi_sll_payload_addresses (l)) )
  **  (xizi_sll_node linklist_node_pre )
  **  (xizi_sll_remove_payloads storeA l )
  **  (storeA linklist_node_pre data )
|--
  EX (next: Z)  (l1a: (@list Z))  (l1b: (@list Z)) ,
  “ ((cons (linklist_pre) ((xizi_sll_payload_addresses (l)))) = (app (l1a) ((cons (linklist_pre) (l1b))))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ”
  &&  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist_pre linklist_pre l1a )
  **  (xizi_sll next l1b )
  **  (xizi_sll_remove_payloads storeA l )
  **  (storeA linklist_node_pre data )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
) \/
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (l: (@list (@sll_payload_node A))) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (linklist_pre <> 0)) ,
  TT && emp 
|--
  “ ((cons (linklist_pre) ((xizi_sll_payload_addresses (l)))) = (app ((@nil Z)) ((cons (linklist_pre) ((xizi_sll_payload_addresses (l))))))) ”
  &&  emp
).

Definition AppendSingleLinkList_entail_wit_2_split_goal_1 := 
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (l: (@list (@sll_payload_node A))) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (linklist_pre <> 0)) ,
  ((cons (linklist_pre) ((xizi_sll_payload_addresses (l)))) = (app ((@nil Z)) ((cons (linklist_pre) ((xizi_sll_payload_addresses (l)))))))
.

Definition AppendSingleLinkList_entail_wit_3 := 
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (data: A) (l: (@list (@sll_payload_node A))) (storeA: (Z -> (A -> Assertion))) (next_2: Z) (l1a_2: (@list Z)) (node: Z) (l1b_2: (@list Z)) (PreH1 : ((cons (linklist_pre) ((xizi_sll_payload_addresses (l)))) = (app (l1a_2) ((cons (node) (l1b_2)))))) (PreH2 : (node <> 0)) (PreH3 : (linklist_node_pre <> 0)) (PreH4 : (next_2 <> 0)) ,
  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_2)
  **  (xizi_sllseg linklist_pre node l1a_2 )
  **  (xizi_sll next_2 l1b_2 )
  **  (xizi_sll_remove_payloads storeA l )
  **  (storeA linklist_node_pre data )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
|--
  EX (next: Z)  (l1a: (@list Z))  (l1b: (@list Z)) ,
  “ ((cons (linklist_pre) ((xizi_sll_payload_addresses (l)))) = (app (l1a) ((cons (next_2) (l1b))))) ” 
  &&  “ (next_2 <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ”
  &&  ((&((next_2)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist_pre next_2 l1a )
  **  (xizi_sll next l1b )
  **  (xizi_sll_remove_payloads storeA l )
  **  (storeA linklist_node_pre data )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
) \/
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (data: A) (l: (@list (@sll_payload_node A))) (storeA: (Z -> (A -> Assertion))) (next_2: Z) (l1a_2: (@list Z)) (node: Z) (l1b_2: (@list Z)) (q: Z) (l0: (@list Z)) (PreH1 : (l1b_2 = (cons (next_2) (l0)))) (PreH2 : ((cons (linklist_pre) ((xizi_sll_payload_addresses (l)))) = (app (l1a_2) ((cons (node) (l1b_2)))))) (PreH3 : (node <> 0)) (PreH4 : (linklist_node_pre <> 0)) (PreH5 : (next_2 <> 0)) ,
  (xizi_sll q l0 )
  **  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_2)
  **  (xizi_sllseg linklist_pre node l1a_2 )
  **  (xizi_sll_remove_payloads storeA l )
  **  (storeA linklist_node_pre data )
|--
  EX (l1a: (@list Z))  (l1b: (@list Z)) ,
  “ ((cons (linklist_pre) ((xizi_sll_payload_addresses (l)))) = (app (l1a) ((cons (next_2) (l1b))))) ” 
  &&  “ (next_2 <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ”
  &&  (xizi_sllseg linklist_pre next_2 l1a )
  **  (xizi_sll q l1b )
  **  (xizi_sll_remove_payloads storeA l )
  **  (storeA linklist_node_pre data )
).

Definition AppendSingleLinkList_return_wit_1 := 
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (data: A) (l: (@list (@sll_payload_node A))) (storeA: (Z -> (A -> Assertion))) (next: Z) (l1a: (@list Z)) (node: Z) (l1b: (@list Z)) (PreH1 : ((cons (linklist_pre) ((xizi_sll_payload_addresses (l)))) = (app (l1a) ((cons (node) (l1b)))))) (PreH2 : (node <> 0)) (PreH3 : (linklist_node_pre <> 0)) (PreH4 : (next = 0)) ,
  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  (xizi_sllseg linklist_pre node l1a )
  **  (xizi_sll next l1b )
  **  (xizi_sll_remove_payloads storeA l )
  **  (storeA linklist_node_pre data )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> 0)
|--
  (xizi_sll_head_payload storeA linklist_pre (app (l) ((cons ((Build_sll_payload_node (data) (linklist_node_pre))) ((@nil (@sll_payload_node A)))))) )
) \/
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (data: A) (l: (@list (@sll_payload_node A))) (storeA: (Z -> (A -> Assertion))) (next: Z) (l1a: (@list Z)) (node: Z) (l1b: (@list Z)) (PreH1 : ((cons (linklist_pre) ((xizi_sll_payload_addresses (l)))) = (app (l1a) ((cons (node) (l1b)))))) (PreH2 : (node <> 0)) (PreH3 : (linklist_node_pre <> 0)) (PreH4 : (next = 0)) ,
  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  (xizi_sllseg linklist_pre node l1a )
  **  (xizi_sll next l1b )
  **  (xizi_sll_remove_payloads storeA l )
  **  (storeA linklist_node_pre data )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> 0)
|--
  (xizi_sll_head_payload storeA linklist_pre (app (l) ((cons ((Build_sll_payload_node (data) (linklist_node_pre))) ((@nil (@sll_payload_node A)))))) )
).

Definition AppendSingleLinkList_return_wit_1_split_goal_spatial := 
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (data: A) (l: (@list (@sll_payload_node A))) (storeA: (Z -> (A -> Assertion))) (next: Z) (l1a: (@list Z)) (node: Z) (l1b: (@list Z)) (PreH1 : ((cons (linklist_pre) ((xizi_sll_payload_addresses (l)))) = (app (l1a) ((cons (node) (l1b)))))) (PreH2 : (node <> 0)) (PreH3 : (linklist_node_pre <> 0)) (PreH4 : (next = 0)) ,
  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  (xizi_sllseg linklist_pre node l1a )
  **  (xizi_sll next l1b )
  **  (xizi_sll_remove_payloads storeA l )
  **  (storeA linklist_node_pre data )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> 0)
|--
  (xizi_sll_head_payload storeA linklist_pre (app (l) ((cons ((Build_sll_payload_node (data) (linklist_node_pre))) ((@nil (@sll_payload_node A)))))) )
.

Module Type VC_Correct.

Include xizi_single_link_Strategy_Correct.

Axiom proof_of_AppendSingleLinkList_safety_wit_1 : AppendSingleLinkList_safety_wit_1.
Axiom proof_of_AppendSingleLinkList_entail_wit_1 : AppendSingleLinkList_entail_wit_1.
Axiom proof_of_AppendSingleLinkList_entail_wit_2 : AppendSingleLinkList_entail_wit_2.
Axiom proof_of_AppendSingleLinkList_entail_wit_3 : AppendSingleLinkList_entail_wit_3.
Axiom proof_of_AppendSingleLinkList_return_wit_1 : AppendSingleLinkList_return_wit_1.

End VC_Correct.
