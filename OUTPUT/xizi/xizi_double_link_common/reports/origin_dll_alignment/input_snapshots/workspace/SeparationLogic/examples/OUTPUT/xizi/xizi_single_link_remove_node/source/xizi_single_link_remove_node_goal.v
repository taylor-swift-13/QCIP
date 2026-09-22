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
From SimpleC.EE.OUTPUT.xizi.xizi_single_link_remove_node.source Require Import xizi_single_link_remove_node_lib.
Local Open Scope sac.
Require Import xizi_single_link_strategy_goal.
Require Import xizi_single_link_strategy_proof.

(*----- Function SingleLinkListRmNode -----*)

Definition SingleLinkListRmNode_safety_wit_1 := 
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (l2_strong_spec: (@list (@sll_payload_node A))) (l1_strong_spec: (@list (@sll_payload_node A))) (l_strong_spec: (@list (@sll_payload_node A))) (a_strong_spec: A) (storeA_strong_spec: (Z -> (A -> Assertion))) (linklist_node_node_next: Z) (next: Z) (l1a: (@list Z)) (node: Z) (l1b: (@list Z)) (PreH1 : (next = linklist_node_pre)) (PreH2 : (next <> 0)) (PreH3 : (l_strong_spec = (app (l1_strong_spec) ((cons ((Build_sll_payload_node (a_strong_spec) (linklist_node_pre))) (l2_strong_spec)))))) (PreH4 : (linklist_node_pre <> 0)) (PreH5 : ((cons (linklist_pre) ((xizi_sll_payload_addresses (l1_strong_spec)))) = (app (l1a) ((cons (node) (l1b)))))) (PreH6 : (node <> 0)) (PreH7 : (linklist_node_node_next = (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))))) ,
  ((( &( "linklist_node" ) )) # Ptr  |-> linklist_node_pre)
  **  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  ((( &( "node" ) )) # Ptr  |-> node)
  **  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist_pre node l1a )
  **  (xizi_sll_to_target next linklist_node_pre l1b )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next)
  **  (xizi_sll (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))) (xizi_sll_payload_addresses (l2_strong_spec)) )
  **  (xizi_sll_remove_payloads storeA_strong_spec l_strong_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition SingleLinkListRmNode_safety_wit_2 := 
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (l2_strong_spec: (@list (@sll_payload_node A))) (l1_strong_spec: (@list (@sll_payload_node A))) (l_strong_spec: (@list (@sll_payload_node A))) (a_strong_spec: A) (storeA_strong_spec: (Z -> (A -> Assertion))) (linklist_node_node_next: Z) (next: Z) (l1a: (@list Z)) (node: Z) (l1b: (@list Z)) (PreH1 : (next = 0)) (PreH2 : (l_strong_spec = (app (l1_strong_spec) ((cons ((Build_sll_payload_node (a_strong_spec) (linklist_node_pre))) (l2_strong_spec)))))) (PreH3 : (linklist_node_pre <> 0)) (PreH4 : ((cons (linklist_pre) ((xizi_sll_payload_addresses (l1_strong_spec)))) = (app (l1a) ((cons (node) (l1b)))))) (PreH5 : (node <> 0)) (PreH6 : (linklist_node_node_next = (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))))) ,
  ((( &( "linklist_node" ) )) # Ptr  |-> linklist_node_pre)
  **  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  ((( &( "node" ) )) # Ptr  |-> node)
  **  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist_pre node l1a )
  **  (xizi_sll_to_target next linklist_node_pre l1b )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next)
  **  (xizi_sll (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))) (xizi_sll_payload_addresses (l2_strong_spec)) )
  **  (xizi_sll_remove_payloads storeA_strong_spec l_strong_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition SingleLinkListRmNode_safety_wit_3 := 
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (l2_strong_spec: (@list (@sll_payload_node A))) (l1_strong_spec: (@list (@sll_payload_node A))) (l_strong_spec: (@list (@sll_payload_node A))) (a_strong_spec: A) (storeA_strong_spec: (Z -> (A -> Assertion))) (linklist_node_node_next: Z) (next: Z) (l1a: (@list Z)) (node: Z) (l1b: (@list Z)) (PreH1 : (next = 0)) (PreH2 : (next = linklist_node_pre)) (PreH3 : (next <> 0)) (PreH4 : (l_strong_spec = (app (l1_strong_spec) ((cons ((Build_sll_payload_node (a_strong_spec) (linklist_node_pre))) (l2_strong_spec)))))) (PreH5 : (linklist_node_pre <> 0)) (PreH6 : ((cons (linklist_pre) ((xizi_sll_payload_addresses (l1_strong_spec)))) = (app (l1a) ((cons (node) (l1b)))))) (PreH7 : (node <> 0)) (PreH8 : (linklist_node_node_next = (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))))) ,
  ((( &( "linklist_node" ) )) # Ptr  |-> linklist_node_pre)
  **  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  ((( &( "node" ) )) # Ptr  |-> node)
  **  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist_pre node l1a )
  **  (xizi_sll_to_target next linklist_node_pre l1b )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next)
  **  (xizi_sll (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))) (xizi_sll_payload_addresses (l2_strong_spec)) )
  **  (xizi_sll_remove_payloads storeA_strong_spec l_strong_spec )
|--
  “ False ”
.

Definition SingleLinkListRmNode_safety_wit_4 := 
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (l2_strong_spec: (@list (@sll_payload_node A))) (l1_strong_spec: (@list (@sll_payload_node A))) (l_strong_spec: (@list (@sll_payload_node A))) (a_strong_spec: A) (storeA_strong_spec: (Z -> (A -> Assertion))) (linklist_node_node_next: Z) (next: Z) (l1a: (@list Z)) (node: Z) (l1b: (@list Z)) (PreH1 : (next <> 0)) (PreH2 : (next = 0)) (PreH3 : (l_strong_spec = (app (l1_strong_spec) ((cons ((Build_sll_payload_node (a_strong_spec) (linklist_node_pre))) (l2_strong_spec)))))) (PreH4 : (linklist_node_pre <> 0)) (PreH5 : ((cons (linklist_pre) ((xizi_sll_payload_addresses (l1_strong_spec)))) = (app (l1a) ((cons (node) (l1b)))))) (PreH6 : (node <> 0)) (PreH7 : (linklist_node_node_next = (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))))) ,
  ((( &( "linklist_node" ) )) # Ptr  |-> linklist_node_pre)
  **  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  ((( &( "node" ) )) # Ptr  |-> node)
  **  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist_pre node l1a )
  **  (xizi_sll_to_target next linklist_node_pre l1b )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next)
  **  (xizi_sll (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))) (xizi_sll_payload_addresses (l2_strong_spec)) )
  **  (xizi_sll_remove_payloads storeA_strong_spec l_strong_spec )
|--
  “ False ”
.

Definition SingleLinkListRmNode_entail_wit_1 := 
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (l2_strong_spec: (@list (@sll_payload_node A))) (l1_strong_spec: (@list (@sll_payload_node A))) (l_strong_spec: (@list (@sll_payload_node A))) (a_strong_spec: A) (storeA_strong_spec: (Z -> (A -> Assertion))) (PreH1 : (l_strong_spec = (app (l1_strong_spec) ((cons ((Build_sll_payload_node (a_strong_spec) (linklist_node_pre))) (l2_strong_spec)))))) ,
  (xizi_sll_head_payload storeA_strong_spec linklist_pre l_strong_spec )
|--
  EX (linklist_node_node_next: Z) ,
  “ (l_strong_spec = (app (l1_strong_spec) ((cons ((Build_sll_payload_node (a_strong_spec) (linklist_node_pre))) (l2_strong_spec))))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ (linklist_pre <> linklist_node_pre) ” 
  &&  “ (linklist_node_node_next = (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec))))) ”
  &&  (xizi_sll_to_target linklist_pre linklist_node_pre (cons (linklist_pre) ((xizi_sll_payload_addresses (l1_strong_spec)))) )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next)
  **  (xizi_sll (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))) (xizi_sll_payload_addresses (l2_strong_spec)) )
  **  (xizi_sll_remove_payloads storeA_strong_spec l_strong_spec )
) \/
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (l2_strong_spec: (@list (@sll_payload_node A))) (l1_strong_spec: (@list (@sll_payload_node A))) (l_strong_spec: (@list (@sll_payload_node A))) (a_strong_spec: A) (storeA_strong_spec: (Z -> (A -> Assertion))) (PreH1 : (l_strong_spec = (app (l1_strong_spec) ((cons ((Build_sll_payload_node (a_strong_spec) (linklist_node_pre))) (l2_strong_spec)))))) ,
  (xizi_sll_head_payload storeA_strong_spec linklist_pre l_strong_spec )
|--
  “ (linklist_pre <> linklist_node_pre) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ (linklist_pre <> 0) ”
  &&  (xizi_sll_to_target linklist_pre linklist_node_pre (cons (linklist_pre) ((xizi_sll_payload_addresses (l1_strong_spec)))) )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))))
  **  (xizi_sll (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))) (xizi_sll_payload_addresses (l2_strong_spec)) )
  **  (xizi_sll_remove_payloads storeA_strong_spec l_strong_spec )
).

Definition SingleLinkListRmNode_entail_wit_1_split_goal_1 := 
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (l2_strong_spec: (@list (@sll_payload_node A))) (l1_strong_spec: (@list (@sll_payload_node A))) (l_strong_spec: (@list (@sll_payload_node A))) (a_strong_spec: A) (storeA_strong_spec: (Z -> (A -> Assertion))) (PreH1 : (l_strong_spec = (app (l1_strong_spec) ((cons ((Build_sll_payload_node (a_strong_spec) (linklist_node_pre))) (l2_strong_spec)))))) ,
  (xizi_sll_head_payload storeA_strong_spec linklist_pre l_strong_spec )
|--
  “ (linklist_pre <> linklist_node_pre) ”
.

Definition SingleLinkListRmNode_entail_wit_1_split_goal_2 := 
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (l2_strong_spec: (@list (@sll_payload_node A))) (l1_strong_spec: (@list (@sll_payload_node A))) (l_strong_spec: (@list (@sll_payload_node A))) (a_strong_spec: A) (storeA_strong_spec: (Z -> (A -> Assertion))) (PreH1 : (l_strong_spec = (app (l1_strong_spec) ((cons ((Build_sll_payload_node (a_strong_spec) (linklist_node_pre))) (l2_strong_spec)))))) ,
  (xizi_sll_head_payload storeA_strong_spec linklist_pre l_strong_spec )
|--
  “ (linklist_node_pre <> 0) ”
.

Definition SingleLinkListRmNode_entail_wit_1_split_goal_3 := 
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (l2_strong_spec: (@list (@sll_payload_node A))) (l1_strong_spec: (@list (@sll_payload_node A))) (l_strong_spec: (@list (@sll_payload_node A))) (a_strong_spec: A) (storeA_strong_spec: (Z -> (A -> Assertion))) (PreH1 : (l_strong_spec = (app (l1_strong_spec) ((cons ((Build_sll_payload_node (a_strong_spec) (linklist_node_pre))) (l2_strong_spec)))))) ,
  (xizi_sll_head_payload storeA_strong_spec linklist_pre l_strong_spec )
|--
  “ (linklist_pre <> 0) ”
.

Definition SingleLinkListRmNode_entail_wit_1_split_goal_spatial := 
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (l2_strong_spec: (@list (@sll_payload_node A))) (l1_strong_spec: (@list (@sll_payload_node A))) (l_strong_spec: (@list (@sll_payload_node A))) (a_strong_spec: A) (storeA_strong_spec: (Z -> (A -> Assertion))) (PreH1 : (l_strong_spec = (app (l1_strong_spec) ((cons ((Build_sll_payload_node (a_strong_spec) (linklist_node_pre))) (l2_strong_spec)))))) ,
  (xizi_sll_head_payload storeA_strong_spec linklist_pre l_strong_spec )
|--
  (xizi_sll_to_target linklist_pre linklist_node_pre (cons (linklist_pre) ((xizi_sll_payload_addresses (l1_strong_spec)))) )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))))
  **  (xizi_sll (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))) (xizi_sll_payload_addresses (l2_strong_spec)) )
  **  (xizi_sll_remove_payloads storeA_strong_spec l_strong_spec )
.

Definition SingleLinkListRmNode_entail_wit_2 := 
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (l2_strong_spec: (@list (@sll_payload_node A))) (l1_strong_spec: (@list (@sll_payload_node A))) (l_strong_spec: (@list (@sll_payload_node A))) (a_strong_spec: A) (storeA_strong_spec: (Z -> (A -> Assertion))) (linklist_node_node_next_2: Z) (PreH1 : (l_strong_spec = (app (l1_strong_spec) ((cons ((Build_sll_payload_node (a_strong_spec) (linklist_node_pre))) (l2_strong_spec)))))) (PreH2 : (linklist_pre <> 0)) (PreH3 : (linklist_node_pre <> 0)) (PreH4 : (linklist_pre <> linklist_node_pre)) (PreH5 : (linklist_node_node_next_2 = (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))))) ,
  (xizi_sll_to_target linklist_pre linklist_node_pre (cons (linklist_pre) ((xizi_sll_payload_addresses (l1_strong_spec)))) )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next_2)
  **  (xizi_sll (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))) (xizi_sll_payload_addresses (l2_strong_spec)) )
  **  (xizi_sll_remove_payloads storeA_strong_spec l_strong_spec )
|--
  EX (linklist_node_node_next: Z)  (next: Z)  (l1a: (@list Z))  (l1b: (@list Z)) ,
  “ (l_strong_spec = (app (l1_strong_spec) ((cons ((Build_sll_payload_node (a_strong_spec) (linklist_node_pre))) (l2_strong_spec))))) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ ((cons (linklist_pre) ((xizi_sll_payload_addresses (l1_strong_spec)))) = (app (l1a) ((cons (linklist_pre) (l1b))))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_node_node_next = (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec))))) ”
  &&  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist_pre linklist_pre l1a )
  **  (xizi_sll_to_target next linklist_node_pre l1b )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next)
  **  (xizi_sll (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))) (xizi_sll_payload_addresses (l2_strong_spec)) )
  **  (xizi_sll_remove_payloads storeA_strong_spec l_strong_spec )
) \/
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (l2_strong_spec: (@list (@sll_payload_node A))) (l1_strong_spec: (@list (@sll_payload_node A))) (l_strong_spec: (@list (@sll_payload_node A))) (a_strong_spec: A) (linklist_node_node_next_2: Z) (l0: (@list Z)) (PreH1 : ((cons (linklist_pre) ((xizi_sll_payload_addresses (l1_strong_spec)))) = (cons (linklist_pre) (l0)))) (PreH2 : (l_strong_spec = (app (l1_strong_spec) ((cons ((Build_sll_payload_node (a_strong_spec) (linklist_node_pre))) (l2_strong_spec)))))) (PreH3 : (linklist_pre <> 0)) (PreH4 : (linklist_node_pre <> 0)) (PreH5 : (linklist_pre <> linklist_node_pre)) (PreH6 : (linklist_node_node_next_2 = (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))))) ,
  TT && emp 
|--
  “ ((cons (linklist_pre) ((xizi_sll_payload_addresses (l1_strong_spec)))) = (app ((@nil Z)) ((cons (linklist_pre) (l0))))) ”
  &&  emp
).

Definition SingleLinkListRmNode_entail_wit_2_split_goal_1 := 
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (l2_strong_spec: (@list (@sll_payload_node A))) (l1_strong_spec: (@list (@sll_payload_node A))) (l_strong_spec: (@list (@sll_payload_node A))) (a_strong_spec: A) (linklist_node_node_next_2: Z) (l0: (@list Z)) (PreH1 : ((cons (linklist_pre) ((xizi_sll_payload_addresses (l1_strong_spec)))) = (cons (linklist_pre) (l0)))) (PreH2 : (l_strong_spec = (app (l1_strong_spec) ((cons ((Build_sll_payload_node (a_strong_spec) (linklist_node_pre))) (l2_strong_spec)))))) (PreH3 : (linklist_pre <> 0)) (PreH4 : (linklist_node_pre <> 0)) (PreH5 : (linklist_pre <> linklist_node_pre)) (PreH6 : (linklist_node_node_next_2 = (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))))) ,
  ((cons (linklist_pre) ((xizi_sll_payload_addresses (l1_strong_spec)))) = (app ((@nil Z)) ((cons (linklist_pre) (l0)))))
.

Definition SingleLinkListRmNode_entail_wit_3 := 
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (l2_strong_spec: (@list (@sll_payload_node A))) (l1_strong_spec: (@list (@sll_payload_node A))) (l_strong_spec: (@list (@sll_payload_node A))) (a_strong_spec: A) (storeA_strong_spec: (Z -> (A -> Assertion))) (linklist_node_node_next_2: Z) (next_2: Z) (l1a_2: (@list Z)) (node: Z) (l1b_2: (@list Z)) (PreH1 : (next_2 <> linklist_node_pre)) (PreH2 : (next_2 <> 0)) (PreH3 : (l_strong_spec = (app (l1_strong_spec) ((cons ((Build_sll_payload_node (a_strong_spec) (linklist_node_pre))) (l2_strong_spec)))))) (PreH4 : (linklist_node_pre <> 0)) (PreH5 : ((cons (linklist_pre) ((xizi_sll_payload_addresses (l1_strong_spec)))) = (app (l1a_2) ((cons (node) (l1b_2)))))) (PreH6 : (node <> 0)) (PreH7 : (linklist_node_node_next_2 = (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))))) ,
  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_2)
  **  (xizi_sllseg linklist_pre node l1a_2 )
  **  (xizi_sll_to_target next_2 linklist_node_pre l1b_2 )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next_2)
  **  (xizi_sll (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))) (xizi_sll_payload_addresses (l2_strong_spec)) )
  **  (xizi_sll_remove_payloads storeA_strong_spec l_strong_spec )
|--
  EX (linklist_node_node_next: Z)  (next: Z)  (l1a: (@list Z))  (l1b: (@list Z)) ,
  “ (l_strong_spec = (app (l1_strong_spec) ((cons ((Build_sll_payload_node (a_strong_spec) (linklist_node_pre))) (l2_strong_spec))))) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ ((cons (linklist_pre) ((xizi_sll_payload_addresses (l1_strong_spec)))) = (app (l1a) ((cons (next_2) (l1b))))) ” 
  &&  “ (next_2 <> 0) ” 
  &&  “ (linklist_node_node_next = (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec))))) ”
  &&  ((&((next_2)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist_pre next_2 l1a )
  **  (xizi_sll_to_target next linklist_node_pre l1b )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next)
  **  (xizi_sll (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))) (xizi_sll_payload_addresses (l2_strong_spec)) )
  **  (xizi_sll_remove_payloads storeA_strong_spec l_strong_spec )
) \/
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (l2_strong_spec: (@list (@sll_payload_node A))) (l1_strong_spec: (@list (@sll_payload_node A))) (l_strong_spec: (@list (@sll_payload_node A))) (a_strong_spec: A) (storeA_strong_spec: (Z -> (A -> Assertion))) (linklist_node_node_next_2: Z) (next_2: Z) (l1a_2: (@list Z)) (node: Z) (l1b_2: (@list Z)) (r: Z) (l0: (@list Z)) (PreH1 : (l1b_2 = (cons (next_2) (l0)))) (PreH2 : (next_2 <> linklist_node_pre)) (PreH3 : (next_2 <> 0)) (PreH4 : (l_strong_spec = (app (l1_strong_spec) ((cons ((Build_sll_payload_node (a_strong_spec) (linklist_node_pre))) (l2_strong_spec)))))) (PreH5 : (linklist_node_pre <> 0)) (PreH6 : ((cons (linklist_pre) ((xizi_sll_payload_addresses (l1_strong_spec)))) = (app (l1a_2) ((cons (node) (l1b_2)))))) (PreH7 : (node <> 0)) (PreH8 : (linklist_node_node_next_2 = (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))))) ,
  (xizi_sll_to_target r linklist_node_pre l0 )
  **  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_2)
  **  (xizi_sllseg linklist_pre node l1a_2 )
  **  (xizi_sll (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))) (xizi_sll_payload_addresses (l2_strong_spec)) )
  **  (xizi_sll_remove_payloads storeA_strong_spec l_strong_spec )
|--
  EX (l1a: (@list Z))  (l1b: (@list Z)) ,
  “ (linklist_node_node_next_2 = (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec))))) ” 
  &&  “ (linklist_node_node_next_2 = (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec))))) ” 
  &&  “ (l_strong_spec = (app (l1_strong_spec) ((cons ((Build_sll_payload_node (a_strong_spec) (linklist_node_pre))) (l2_strong_spec))))) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ ((cons (linklist_pre) ((xizi_sll_payload_addresses (l1_strong_spec)))) = (app (l1a) ((cons (next_2) (l1b))))) ” 
  &&  “ (next_2 <> 0) ”
  &&  (xizi_sllseg linklist_pre next_2 l1a )
  **  (xizi_sll_to_target r linklist_node_pre l1b )
  **  (xizi_sll (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))) (xizi_sll_payload_addresses (l2_strong_spec)) )
  **  (xizi_sll_remove_payloads storeA_strong_spec l_strong_spec )
).

Definition SingleLinkListRmNode_return_wit_1 := 
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (l2_strong_spec: (@list (@sll_payload_node A))) (l1_strong_spec: (@list (@sll_payload_node A))) (l_strong_spec: (@list (@sll_payload_node A))) (a_strong_spec: A) (storeA_strong_spec: (Z -> (A -> Assertion))) (linklist_node_node_next: Z) (next: Z) (l1a: (@list Z)) (node: Z) (l1b: (@list Z)) (PreH1 : (next <> 0)) (PreH2 : (next = linklist_node_pre)) (PreH3 : (next <> 0)) (PreH4 : (l_strong_spec = (app (l1_strong_spec) ((cons ((Build_sll_payload_node (a_strong_spec) (linklist_node_pre))) (l2_strong_spec)))))) (PreH5 : (linklist_node_pre <> 0)) (PreH6 : ((cons (linklist_pre) ((xizi_sll_payload_addresses (l1_strong_spec)))) = (app (l1a) ((cons (node) (l1b)))))) (PreH7 : (node <> 0)) (PreH8 : (linklist_node_node_next = (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))))) ,
  ((&((next)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))))
  **  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))))
  **  (xizi_sllseg linklist_pre node l1a )
  **  (xizi_sll_to_target next linklist_node_pre l1b )
  **  (xizi_sll (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))) (xizi_sll_payload_addresses (l2_strong_spec)) )
  **  (xizi_sll_remove_payloads storeA_strong_spec l_strong_spec )
|--
  EX (linklist_node_pre_node_next: Z) ,
  “ (linklist_pre = linklist_pre) ” 
  &&  “ (linklist_node_pre_node_next = (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec))))) ”
  &&  (xizi_sll_head_payload storeA_strong_spec linklist_pre (app (l1_strong_spec) (l2_strong_spec)) )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre_node_next)
  **  (storeA_strong_spec linklist_node_pre a_strong_spec )
) \/
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (l2_strong_spec: (@list (@sll_payload_node A))) (l1_strong_spec: (@list (@sll_payload_node A))) (l_strong_spec: (@list (@sll_payload_node A))) (a_strong_spec: A) (storeA_strong_spec: (Z -> (A -> Assertion))) (linklist_node_node_next: Z) (next: Z) (l1a: (@list Z)) (node: Z) (l1b: (@list Z)) (PreH1 : (next <> 0)) (PreH2 : (next = linklist_node_pre)) (PreH3 : (next <> 0)) (PreH4 : (l_strong_spec = (app (l1_strong_spec) ((cons ((Build_sll_payload_node (a_strong_spec) (linklist_node_pre))) (l2_strong_spec)))))) (PreH5 : (linklist_node_pre <> 0)) (PreH6 : ((cons (linklist_pre) ((xizi_sll_payload_addresses (l1_strong_spec)))) = (app (l1a) ((cons (node) (l1b)))))) (PreH7 : (node <> 0)) (PreH8 : (linklist_node_node_next = (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))))) ,
  ((&((next)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))))
  **  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))))
  **  (xizi_sllseg linklist_pre node l1a )
  **  (xizi_sll_to_target next linklist_node_pre l1b )
  **  (xizi_sll (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))) (xizi_sll_payload_addresses (l2_strong_spec)) )
  **  (xizi_sll_remove_payloads storeA_strong_spec l_strong_spec )
|--
  (xizi_sll_head_payload storeA_strong_spec linklist_pre (app (l1_strong_spec) (l2_strong_spec)) )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))))
  **  (storeA_strong_spec linklist_node_pre a_strong_spec )
).

Definition SingleLinkListRmNode_return_wit_1_split_goal_spatial := 
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (l2_strong_spec: (@list (@sll_payload_node A))) (l1_strong_spec: (@list (@sll_payload_node A))) (l_strong_spec: (@list (@sll_payload_node A))) (a_strong_spec: A) (storeA_strong_spec: (Z -> (A -> Assertion))) (linklist_node_node_next: Z) (next: Z) (l1a: (@list Z)) (node: Z) (l1b: (@list Z)) (PreH1 : (next <> 0)) (PreH2 : (next = linklist_node_pre)) (PreH3 : (next <> 0)) (PreH4 : (l_strong_spec = (app (l1_strong_spec) ((cons ((Build_sll_payload_node (a_strong_spec) (linklist_node_pre))) (l2_strong_spec)))))) (PreH5 : (linklist_node_pre <> 0)) (PreH6 : ((cons (linklist_pre) ((xizi_sll_payload_addresses (l1_strong_spec)))) = (app (l1a) ((cons (node) (l1b)))))) (PreH7 : (node <> 0)) (PreH8 : (linklist_node_node_next = (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))))) ,
  ((&((next)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))))
  **  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))))
  **  (xizi_sllseg linklist_pre node l1a )
  **  (xizi_sll_to_target next linklist_node_pre l1b )
  **  (xizi_sll (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))) (xizi_sll_payload_addresses (l2_strong_spec)) )
  **  (xizi_sll_remove_payloads storeA_strong_spec l_strong_spec )
|--
  (xizi_sll_head_payload storeA_strong_spec linklist_pre (app (l1_strong_spec) (l2_strong_spec)) )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))))
  **  (storeA_strong_spec linklist_node_pre a_strong_spec )
.

Definition SingleLinkListRmNode_return_wit_2 := 
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (l2_strong_spec: (@list (@sll_payload_node A))) (l1_strong_spec: (@list (@sll_payload_node A))) (l_strong_spec: (@list (@sll_payload_node A))) (a_strong_spec: A) (storeA_strong_spec: (Z -> (A -> Assertion))) (linklist_node_node_next: Z) (next: Z) (l1a: (@list Z)) (node: Z) (l1b: (@list Z)) (PreH1 : (next = 0)) (PreH2 : (next = 0)) (PreH3 : (l_strong_spec = (app (l1_strong_spec) ((cons ((Build_sll_payload_node (a_strong_spec) (linklist_node_pre))) (l2_strong_spec)))))) (PreH4 : (linklist_node_pre <> 0)) (PreH5 : ((cons (linklist_pre) ((xizi_sll_payload_addresses (l1_strong_spec)))) = (app (l1a) ((cons (node) (l1b)))))) (PreH6 : (node <> 0)) (PreH7 : (linklist_node_node_next = (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))))) ,
  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist_pre node l1a )
  **  (xizi_sll_to_target next linklist_node_pre l1b )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next)
  **  (xizi_sll (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))) (xizi_sll_payload_addresses (l2_strong_spec)) )
  **  (xizi_sll_remove_payloads storeA_strong_spec l_strong_spec )
|--
  EX (linklist_node_pre_node_next: Z) ,
  “ (linklist_pre = linklist_pre) ” 
  &&  “ (linklist_node_pre_node_next = (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec))))) ”
  &&  (xizi_sll_head_payload storeA_strong_spec linklist_pre (app (l1_strong_spec) (l2_strong_spec)) )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre_node_next)
  **  (storeA_strong_spec linklist_node_pre a_strong_spec )
) \/
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (l2_strong_spec: (@list (@sll_payload_node A))) (l1_strong_spec: (@list (@sll_payload_node A))) (l_strong_spec: (@list (@sll_payload_node A))) (a_strong_spec: A) (storeA_strong_spec: (Z -> (A -> Assertion))) (linklist_node_node_next: Z) (next: Z) (l1a: (@list Z)) (node: Z) (l1b: (@list Z)) (PreH1 : (next = 0)) (PreH2 : (next = 0)) (PreH3 : (l_strong_spec = (app (l1_strong_spec) ((cons ((Build_sll_payload_node (a_strong_spec) (linklist_node_pre))) (l2_strong_spec)))))) (PreH4 : (linklist_node_pre <> 0)) (PreH5 : ((cons (linklist_pre) ((xizi_sll_payload_addresses (l1_strong_spec)))) = (app (l1a) ((cons (node) (l1b)))))) (PreH6 : (node <> 0)) (PreH7 : (linklist_node_node_next = (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))))) ,
  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist_pre node l1a )
  **  (xizi_sll_to_target next linklist_node_pre l1b )
  **  (xizi_sll (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))) (xizi_sll_payload_addresses (l2_strong_spec)) )
  **  (xizi_sll_remove_payloads storeA_strong_spec l_strong_spec )
|--
  (xizi_sll_head_payload storeA_strong_spec linklist_pre (app (l1_strong_spec) (l2_strong_spec)) )
  **  (storeA_strong_spec linklist_node_pre a_strong_spec )
).

Definition SingleLinkListRmNode_return_wit_2_split_goal_spatial := 
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (l2_strong_spec: (@list (@sll_payload_node A))) (l1_strong_spec: (@list (@sll_payload_node A))) (l_strong_spec: (@list (@sll_payload_node A))) (a_strong_spec: A) (storeA_strong_spec: (Z -> (A -> Assertion))) (linklist_node_node_next: Z) (next: Z) (l1a: (@list Z)) (node: Z) (l1b: (@list Z)) (PreH1 : (next = 0)) (PreH2 : (next = 0)) (PreH3 : (l_strong_spec = (app (l1_strong_spec) ((cons ((Build_sll_payload_node (a_strong_spec) (linklist_node_pre))) (l2_strong_spec)))))) (PreH4 : (linklist_node_pre <> 0)) (PreH5 : ((cons (linklist_pre) ((xizi_sll_payload_addresses (l1_strong_spec)))) = (app (l1a) ((cons (node) (l1b)))))) (PreH6 : (node <> 0)) (PreH7 : (linklist_node_node_next = (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))))) ,
  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist_pre node l1a )
  **  (xizi_sll_to_target next linklist_node_pre l1b )
  **  (xizi_sll (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))) (xizi_sll_payload_addresses (l2_strong_spec)) )
  **  (xizi_sll_remove_payloads storeA_strong_spec l_strong_spec )
|--
  (xizi_sll_head_payload storeA_strong_spec linklist_pre (app (l1_strong_spec) (l2_strong_spec)) )
  **  (storeA_strong_spec linklist_node_pre a_strong_spec )
.

Definition SingleLinkListRmNode_partial_solve_wit_1 := 
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (l2_strong_spec: (@list (@sll_payload_node A))) (l1_strong_spec: (@list (@sll_payload_node A))) (l_strong_spec: (@list (@sll_payload_node A))) (a_strong_spec: A) (storeA_strong_spec: (Z -> (A -> Assertion))) (linklist_node_node_next: Z) (next: Z) (l1a: (@list Z)) (node: Z) (l1b: (@list Z)) (PreH1 : (next <> 0)) (PreH2 : (next = linklist_node_pre)) (PreH3 : (next <> 0)) (PreH4 : (l_strong_spec = (app (l1_strong_spec) ((cons ((Build_sll_payload_node (a_strong_spec) (linklist_node_pre))) (l2_strong_spec)))))) (PreH5 : (linklist_node_pre <> 0)) (PreH6 : ((cons (linklist_pre) ((xizi_sll_payload_addresses (l1_strong_spec)))) = (app (l1a) ((cons (node) (l1b)))))) (PreH7 : (node <> 0)) (PreH8 : (linklist_node_node_next = (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))))) ,
  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist_pre node l1a )
  **  (xizi_sll_to_target next linklist_node_pre l1b )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next)
  **  (xizi_sll (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))) (xizi_sll_payload_addresses (l2_strong_spec)) )
  **  (xizi_sll_remove_payloads storeA_strong_spec l_strong_spec )
|--
  “ (next <> 0) ” 
  &&  “ (next = linklist_node_pre) ” 
  &&  “ (next <> 0) ” 
  &&  “ (l_strong_spec = (app (l1_strong_spec) ((cons ((Build_sll_payload_node (a_strong_spec) (linklist_node_pre))) (l2_strong_spec))))) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ ((cons (linklist_pre) ((xizi_sll_payload_addresses (l1_strong_spec)))) = (app (l1a) ((cons (node) (l1b))))) ” 
  &&  “ (node <> 0) ” 
  &&  “ (linklist_node_node_next = (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec))))) ”
  &&  ((&((next)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))))
  **  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist_pre node l1a )
  **  (xizi_sll_to_target next linklist_node_pre l1b )
  **  (xizi_sll (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec)))) (xizi_sll_payload_addresses (l2_strong_spec)) )
  **  (xizi_sll_remove_payloads storeA_strong_spec l_strong_spec )
.

Definition SingleLinkListRmNode_derive_remove_tail_spec_by_strong_spec := 
forall (A: Type) ,
forall (linklist_node_pre: Z) (linklist_pre: Z) (prefix_remove_tail_spec: (@list (@sll_payload_node A))) (a_remove_tail_spec: A) (storeA_remove_tail_spec: (Z -> (A -> Assertion))) ,
  (xizi_sll_head_payload storeA_remove_tail_spec linklist_pre (app (prefix_remove_tail_spec) ((cons ((Build_sll_payload_node (a_remove_tail_spec) (linklist_node_pre))) (nil)))) )
|--
EX (A: Type) ,
EX (storeA_strong_spec: (Z -> (A -> Assertion))) (a_strong_spec: A) (l_strong_spec: (@list (@sll_payload_node A))) (l1_strong_spec: (@list (@sll_payload_node A))) (l2_strong_spec: (@list (@sll_payload_node A))) ,
  (“ (l_strong_spec = (app (l1_strong_spec) ((cons ((Build_sll_payload_node (a_strong_spec) (linklist_node_pre))) (l2_strong_spec))))) ”
  &&  (xizi_sll_head_payload storeA_strong_spec linklist_pre l_strong_spec ))
  **
  ((EX linklist_node_callee_node_next retval,
  “ (retval = linklist_pre) ” 
  &&  “ (linklist_node_callee_node_next = (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec))))) ”
  &&  (xizi_sll_head_payload storeA_strong_spec linklist_pre (app (l1_strong_spec) (l2_strong_spec)) )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_callee_node_next)
  **  (storeA_strong_spec linklist_node_pre a_strong_spec ))
  -*
  ((xizi_sll_head_payload storeA_remove_tail_spec linklist_pre prefix_remove_tail_spec )
  **  (xizi_sll_node linklist_node_pre )
  **  (storeA_remove_tail_spec linklist_node_pre a_remove_tail_spec )))
.

Definition SingleLinkListRmNode_derive_remove_front_spec_by_strong_spec := 
forall (A: Type) ,
forall (linklist_node_pre: Z) (linklist_pre: Z) (suffix_remove_front_spec: (@list (@sll_payload_node A))) (a_remove_front_spec: A) (storeA_remove_front_spec: (Z -> (A -> Assertion))) ,
  (xizi_sll_head_payload storeA_remove_front_spec linklist_pre (cons ((Build_sll_payload_node (a_remove_front_spec) (linklist_node_pre))) (suffix_remove_front_spec)) )
|--
EX (A: Type) ,
EX (storeA_strong_spec: (Z -> (A -> Assertion))) (a_strong_spec: A) (l_strong_spec: (@list (@sll_payload_node A))) (l1_strong_spec: (@list (@sll_payload_node A))) (l2_strong_spec: (@list (@sll_payload_node A))) ,
  (“ (l_strong_spec = (app (l1_strong_spec) ((cons ((Build_sll_payload_node (a_strong_spec) (linklist_node_pre))) (l2_strong_spec))))) ”
  &&  (xizi_sll_head_payload storeA_strong_spec linklist_pre l_strong_spec ))
  **
  ((EX linklist_node_callee_node_next retval,
  “ (retval = linklist_pre) ” 
  &&  “ (linklist_node_callee_node_next = (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec))))) ”
  &&  (xizi_sll_head_payload storeA_strong_spec linklist_pre (app (l1_strong_spec) (l2_strong_spec)) )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_callee_node_next)
  **  (storeA_strong_spec linklist_node_pre a_strong_spec ))
  -*
  ((xizi_sll_head_payload storeA_remove_front_spec linklist_pre suffix_remove_front_spec )
  **  (xizi_sll_node linklist_node_pre )
  **  (storeA_remove_front_spec linklist_node_pre a_remove_front_spec )))
.

Definition SingleLinkListRmNode_derive_remove_member_spec_by_strong_spec := 
forall (A: Type) ,
forall (linklist_node_pre: Z) (linklist_pre: Z) (l_remove_member_spec: (@list (@sll_payload_node A))) (storeA_remove_member_spec: (Z -> (A -> Assertion))) ,
  “ (In linklist_node_pre (xizi_sll_payload_addresses (l_remove_member_spec)) ) ”
  &&  (xizi_sll_head_payload storeA_remove_member_spec linklist_pre l_remove_member_spec )
|--
EX (A: Type) ,
EX (storeA_strong_spec: (Z -> (A -> Assertion))) (a_strong_spec: A) (l_strong_spec: (@list (@sll_payload_node A))) (l1_strong_spec: (@list (@sll_payload_node A))) (l2_strong_spec: (@list (@sll_payload_node A))) ,
  (“ (l_strong_spec = (app (l1_strong_spec) ((cons ((Build_sll_payload_node (a_strong_spec) (linklist_node_pre))) (l2_strong_spec))))) ”
  &&  (xizi_sll_head_payload storeA_strong_spec linklist_pre l_strong_spec ))
  **
  ((EX linklist_node_callee_node_next retval,
  “ (retval = linklist_pre) ” 
  &&  “ (linklist_node_callee_node_next = (xizi_sll_first_value ((xizi_sll_payload_addresses (l2_strong_spec))))) ”
  &&  (xizi_sll_head_payload storeA_strong_spec linklist_pre (app (l1_strong_spec) (l2_strong_spec)) )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_callee_node_next)
  **  (storeA_strong_spec linklist_node_pre a_strong_spec ))
  -*
  (EX a output,
  “ (xizi_sll_payload_remove linklist_node_pre a l_remove_member_spec output ) ”
  &&  (xizi_sll_head_payload storeA_remove_member_spec linklist_pre output )
  **  (xizi_sll_node linklist_node_pre )
  **  (storeA_remove_member_spec linklist_node_pre a )))
.

Module Type VC_Correct.

Include xizi_single_link_Strategy_Correct.

Axiom proof_of_SingleLinkListRmNode_safety_wit_1 : SingleLinkListRmNode_safety_wit_1.
Axiom proof_of_SingleLinkListRmNode_safety_wit_2 : SingleLinkListRmNode_safety_wit_2.
Axiom proof_of_SingleLinkListRmNode_safety_wit_3 : SingleLinkListRmNode_safety_wit_3.
Axiom proof_of_SingleLinkListRmNode_safety_wit_4 : SingleLinkListRmNode_safety_wit_4.
Axiom proof_of_SingleLinkListRmNode_entail_wit_1 : SingleLinkListRmNode_entail_wit_1.
Axiom proof_of_SingleLinkListRmNode_entail_wit_2 : SingleLinkListRmNode_entail_wit_2.
Axiom proof_of_SingleLinkListRmNode_entail_wit_3 : SingleLinkListRmNode_entail_wit_3.
Axiom proof_of_SingleLinkListRmNode_return_wit_1 : SingleLinkListRmNode_return_wit_1.
Axiom proof_of_SingleLinkListRmNode_return_wit_2 : SingleLinkListRmNode_return_wit_2.
Axiom proof_of_SingleLinkListRmNode_partial_solve_wit_1 : SingleLinkListRmNode_partial_solve_wit_1.
Axiom proof_of_SingleLinkListRmNode_derive_remove_tail_spec_by_strong_spec : SingleLinkListRmNode_derive_remove_tail_spec_by_strong_spec.
Axiom proof_of_SingleLinkListRmNode_derive_remove_front_spec_by_strong_spec : SingleLinkListRmNode_derive_remove_front_spec_by_strong_spec.
Axiom proof_of_SingleLinkListRmNode_derive_remove_member_spec_by_strong_spec : SingleLinkListRmNode_derive_remove_member_spec_by_strong_spec.

End VC_Correct.
