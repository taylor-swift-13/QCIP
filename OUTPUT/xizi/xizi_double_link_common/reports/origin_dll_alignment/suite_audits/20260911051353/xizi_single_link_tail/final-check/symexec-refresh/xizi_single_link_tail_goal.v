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
From SimpleC.EE.OUTPUT.xizi.xizi_single_link_tail.source Require Import xizi_single_link_tail_lib.
Local Open Scope sac.
Require Import xizi_single_link_strategy_goal.
Require Import xizi_single_link_strategy_proof.

(*----- Function SingleLinkListGetTailNode -----*)

Definition SingleLinkListGetTailNode_entail_wit_1 := 
(
forall (A: Type) (linklist_pre: Z) (l: (@list (@sll_payload_node A))) (storeA: (Z -> (A -> Assertion))) ,
  (xizi_sll_head_payload storeA linklist_pre l )
|--
  (xizi_sll_head linklist_pre (xizi_sll_payload_addresses (l)) )
  **  (xizi_sll_remove_payloads storeA l )
) \/
(
forall (A: Type) (linklist_pre: Z) (l: (@list (@sll_payload_node A))) (storeA: (Z -> (A -> Assertion))) ,
  (xizi_sll_head_payload storeA linklist_pre l )
|--
  EX (q: Z) ,
  “ (linklist_pre <> 0) ”
  &&  (xizi_sll q (xizi_sll_payload_addresses (l)) )
  **  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> q)
  **  (xizi_sll_remove_payloads storeA l )
).

Definition SingleLinkListGetTailNode_entail_wit_2 := 
(
forall (A: Type) (linklist_pre: Z) (l: (@list (@sll_payload_node A))) (storeA: (Z -> (A -> Assertion))) ,
  (xizi_sll_head linklist_pre (xizi_sll_payload_addresses (l)) )
  **  (xizi_sll_remove_payloads storeA l )
|--
  EX (next: Z)  (l1: (@list Z))  (l2: (@list Z)) ,
  “ ((cons (linklist_pre) ((xizi_sll_payload_addresses (l)))) = (app (l1) ((cons (linklist_pre) (l2))))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_pre <> 0) ”
  &&  (xizi_sllseg linklist_pre linklist_pre l1 )
  **  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sll next l2 )
  **  (xizi_sll_remove_payloads storeA l )
) \/
(
forall (A: Type) (linklist_pre: Z) (l: (@list (@sll_payload_node A))) (PreH1 : (linklist_pre <> 0)) ,
  TT && emp 
|--
  “ ((cons (linklist_pre) ((xizi_sll_payload_addresses (l)))) = (app ((@nil Z)) ((cons (linklist_pre) ((xizi_sll_payload_addresses (l))))))) ”
  &&  emp
).

Definition SingleLinkListGetTailNode_entail_wit_2_split_goal_1 := 
forall (A: Type) (linklist_pre: Z) (l: (@list (@sll_payload_node A))) (PreH1 : (linklist_pre <> 0)) ,
  ((cons (linklist_pre) ((xizi_sll_payload_addresses (l)))) = (app ((@nil Z)) ((cons (linklist_pre) ((xizi_sll_payload_addresses (l)))))))
.

Definition SingleLinkListGetTailNode_entail_wit_3 := 
(
forall (A: Type) (linklist_pre: Z) (l: (@list (@sll_payload_node A))) (storeA: (Z -> (A -> Assertion))) (next_2: Z) (l1_2: (@list Z)) (linklist: Z) (l2_2: (@list Z)) (PreH1 : ((cons (linklist_pre) ((xizi_sll_payload_addresses (l)))) = (app (l1_2) ((cons (linklist) (l2_2)))))) (PreH2 : (linklist <> 0)) (PreH3 : (linklist_pre <> 0)) (PreH4 : (next_2 <> 0)) ,
  (xizi_sllseg linklist_pre linklist l1_2 )
  **  ((&((linklist)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_2)
  **  (xizi_sll next_2 l2_2 )
  **  (xizi_sll_remove_payloads storeA l )
|--
  EX (next: Z)  (l1: (@list Z))  (l2: (@list Z)) ,
  “ ((cons (linklist_pre) ((xizi_sll_payload_addresses (l)))) = (app (l1) ((cons (next_2) (l2))))) ” 
  &&  “ (next_2 <> 0) ” 
  &&  “ (linklist_pre <> 0) ”
  &&  (xizi_sllseg linklist_pre next_2 l1 )
  **  ((&((next_2)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sll next l2 )
  **  (xizi_sll_remove_payloads storeA l )
) \/
(
forall (A: Type) (linklist_pre: Z) (l: (@list (@sll_payload_node A))) (storeA: (Z -> (A -> Assertion))) (next_2: Z) (l1_2: (@list Z)) (linklist: Z) (l2_2: (@list Z)) (q: Z) (l0: (@list Z)) (PreH1 : (l2_2 = (cons (next_2) (l0)))) (PreH2 : ((cons (linklist_pre) ((xizi_sll_payload_addresses (l)))) = (app (l1_2) ((cons (linklist) (l2_2)))))) (PreH3 : (linklist <> 0)) (PreH4 : (linklist_pre <> 0)) (PreH5 : (next_2 <> 0)) ,
  (xizi_sll q l0 )
  **  (xizi_sllseg linklist_pre linklist l1_2 )
  **  ((&((linklist)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_2)
  **  (xizi_sll_remove_payloads storeA l )
|--
  EX (l1: (@list Z))  (l2: (@list Z)) ,
  “ ((cons (linklist_pre) ((xizi_sll_payload_addresses (l)))) = (app (l1) ((cons (next_2) (l2))))) ” 
  &&  “ (next_2 <> 0) ” 
  &&  “ (linklist_pre <> 0) ”
  &&  (xizi_sllseg linklist_pre next_2 l1 )
  **  (xizi_sll q l2 )
  **  (xizi_sll_remove_payloads storeA l )
).

Definition SingleLinkListGetTailNode_return_wit_1 := 
(
forall (A: Type) (linklist_pre: Z) (l: (@list (@sll_payload_node A))) (storeA: (Z -> (A -> Assertion))) (next: Z) (l1: (@list Z)) (linklist: Z) (l2: (@list Z)) (PreH1 : ((cons (linklist_pre) ((xizi_sll_payload_addresses (l)))) = (app (l1) ((cons (linklist) (l2)))))) (PreH2 : (linklist <> 0)) (PreH3 : (linklist_pre <> 0)) (PreH4 : (next = 0)) ,
  (xizi_sllseg linklist_pre linklist l1 )
  **  ((&((linklist)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sll next l2 )
  **  (xizi_sll_remove_payloads storeA l )
|--
  “ (linklist = (xizi_sll_tail_value ((xizi_sll_payload_addresses (l))) (linklist_pre))) ”
  &&  (xizi_sll_head_payload storeA linklist_pre l )
) \/
(
forall (A: Type) (linklist_pre: Z) (l: (@list (@sll_payload_node A))) (storeA: (Z -> (A -> Assertion))) (next: Z) (l1: (@list Z)) (linklist: Z) (l2: (@list Z)) (PreH1 : ((cons (linklist_pre) ((xizi_sll_payload_addresses (l)))) = (app (l1) ((cons (linklist) (l2)))))) (PreH2 : (linklist <> 0)) (PreH3 : (linklist_pre <> 0)) (PreH4 : (next = 0)) ,
  (xizi_sllseg linklist_pre linklist l1 )
  **  ((&((linklist)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sll next l2 )
  **  (xizi_sll_remove_payloads storeA l )
|--
  “ (linklist = (xizi_sll_tail_value ((xizi_sll_payload_addresses (l))) (linklist_pre))) ”
  &&  (xizi_sll_head_payload storeA linklist_pre l )
).

Definition SingleLinkListGetTailNode_return_wit_1_split_goal_1 := 
forall (A: Type) (linklist_pre: Z) (l: (@list (@sll_payload_node A))) (storeA: (Z -> (A -> Assertion))) (next: Z) (l1: (@list Z)) (linklist: Z) (l2: (@list Z)) (PreH1 : ((cons (linklist_pre) ((xizi_sll_payload_addresses (l)))) = (app (l1) ((cons (linklist) (l2)))))) (PreH2 : (linklist <> 0)) (PreH3 : (linklist_pre <> 0)) (PreH4 : (next = 0)) ,
  (xizi_sllseg linklist_pre linklist l1 )
  **  ((&((linklist)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sll next l2 )
  **  (xizi_sll_remove_payloads storeA l )
|--
  “ (linklist = (xizi_sll_tail_value ((xizi_sll_payload_addresses (l))) (linklist_pre))) ”
.

Definition SingleLinkListGetTailNode_return_wit_1_split_goal_spatial := 
forall (A: Type) (linklist_pre: Z) (l: (@list (@sll_payload_node A))) (storeA: (Z -> (A -> Assertion))) (next: Z) (l1: (@list Z)) (linklist: Z) (l2: (@list Z)) (PreH1 : ((cons (linklist_pre) ((xizi_sll_payload_addresses (l)))) = (app (l1) ((cons (linklist) (l2)))))) (PreH2 : (linklist <> 0)) (PreH3 : (linklist_pre <> 0)) (PreH4 : (next = 0)) ,
  (xizi_sllseg linklist_pre linklist l1 )
  **  ((&((linklist)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sll next l2 )
  **  (xizi_sll_remove_payloads storeA l )
|--
  (xizi_sll_head_payload storeA linklist_pre l )
.

Module Type VC_Correct.

Include xizi_single_link_Strategy_Correct.

Axiom proof_of_SingleLinkListGetTailNode_entail_wit_1 : SingleLinkListGetTailNode_entail_wit_1.
Axiom proof_of_SingleLinkListGetTailNode_entail_wit_2 : SingleLinkListGetTailNode_entail_wit_2.
Axiom proof_of_SingleLinkListGetTailNode_entail_wit_3 : SingleLinkListGetTailNode_entail_wit_3.
Axiom proof_of_SingleLinkListGetTailNode_return_wit_1 : SingleLinkListGetTailNode_return_wit_1.

End VC_Correct.
