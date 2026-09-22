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
Require Import SimpleC.EE.OUTPUT.xizi.xizi_single_link_next.source.xizi_single_link_next_lib.
Local Open Scope sac.
Require Import xizi_single_link_strategy_goal.
Require Import xizi_single_link_strategy_proof.

(*----- Function SingleLinkListGetNextNode -----*)

Definition SingleLinkListGetNextNode_entail_wit_1 := 
(
forall (A: Type) (linklist_node_pre: Z) (l: (@list (@sll_payload_node A))) (storeA: (Z -> (A -> Assertion))) (PreH1 : (In linklist_node_pre (xizi_sll_next_ptrs (l)) )) ,
  (xizi_sll_payload storeA (xizi_sll_first_value ((xizi_sll_next_ptrs (l)))) l )
|--
  EX (next: Z)  (prefix: (@list (@sll_payload_node A)))  (a: A)  (suffix: (@list (@sll_payload_node A))) ,
  “ (linklist_node_pre <> 0) ” 
  &&  “ (l = (app (prefix) ((cons ((Build_sll_payload_node (a) (linklist_node_pre))) (suffix))))) ” 
  &&  “ (not (In (linklist_node_pre) ((xizi_sll_next_ptrs (prefix)))) ) ”
  &&  (xizi_sllseg_payload storeA (xizi_sll_first_value ((xizi_sll_next_ptrs (l)))) linklist_node_pre prefix )
  **  (storeA linklist_node_pre a )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sll_payload storeA next suffix )
) \/
(
forall (A: Type) (linklist_node_pre: Z) (l: (@list (@sll_payload_node A))) (storeA: (Z -> (A -> Assertion))) (PreH1 : (In linklist_node_pre (xizi_sll_next_ptrs (l)) )) ,
  (xizi_sll_payload storeA (xizi_sll_first_value ((xizi_sll_next_ptrs (l)))) l )
|--
  EX (next: Z)  (prefix: (@list (@sll_payload_node A)))  (a: A)  (suffix: (@list (@sll_payload_node A))) ,
  “ (linklist_node_pre <> 0) ” 
  &&  “ (l = (app (prefix) ((cons ((Build_sll_payload_node (a) (linklist_node_pre))) (suffix))))) ” 
  &&  “ (not (In (linklist_node_pre) ((xizi_sll_next_ptrs (prefix)))) ) ”
  &&  (xizi_sllseg_payload storeA (xizi_sll_first_value ((xizi_sll_next_ptrs (l)))) linklist_node_pre prefix )
  **  (storeA linklist_node_pre a )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sll_payload storeA next suffix )
).

Definition SingleLinkListGetNextNode_return_wit_1 := 
(
forall (A: Type) (linklist_node_pre: Z) (l: (@list (@sll_payload_node A))) (storeA: (Z -> (A -> Assertion))) (prefix: (@list (@sll_payload_node A))) (suffix: (@list (@sll_payload_node A))) (a: A) (next: Z) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (l = (app (prefix) ((cons ((Build_sll_payload_node (a) (linklist_node_pre))) (suffix)))))) (PreH3 : (not (In (linklist_node_pre) ((xizi_sll_next_ptrs (prefix)))) )) ,
  (xizi_sllseg_payload storeA (xizi_sll_first_value ((xizi_sll_next_ptrs (l)))) linklist_node_pre prefix )
  **  (storeA linklist_node_pre a )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sll_payload storeA next suffix )
|--
  “ (next = (xizi_sll_next_value ((xizi_sll_next_ptrs (l))) (linklist_node_pre))) ”
  &&  (xizi_sll_payload storeA (xizi_sll_first_value ((xizi_sll_next_ptrs (l)))) l )
) \/
(
forall (A: Type) (linklist_node_pre: Z) (l: (@list (@sll_payload_node A))) (storeA: (Z -> (A -> Assertion))) (prefix: (@list (@sll_payload_node A))) (suffix: (@list (@sll_payload_node A))) (a: A) (next: Z) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (l = (app (prefix) ((cons ((Build_sll_payload_node (a) (linklist_node_pre))) (suffix)))))) (PreH3 : (not (In (linklist_node_pre) ((xizi_sll_next_ptrs (prefix)))) )) ,
  (xizi_sllseg_payload storeA (xizi_sll_first_value ((xizi_sll_next_ptrs (l)))) linklist_node_pre prefix )
  **  (storeA linklist_node_pre a )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sll_payload storeA next suffix )
|--
  “ (next = (xizi_sll_next_value ((xizi_sll_next_ptrs (l))) (linklist_node_pre))) ”
  &&  (xizi_sll_payload storeA (xizi_sll_first_value ((xizi_sll_next_ptrs (l)))) l )
).

Definition SingleLinkListGetNextNode_return_wit_1_split_goal_1 := 
forall (A: Type) (linklist_node_pre: Z) (l: (@list (@sll_payload_node A))) (storeA: (Z -> (A -> Assertion))) (prefix: (@list (@sll_payload_node A))) (suffix: (@list (@sll_payload_node A))) (a: A) (next: Z) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (l = (app (prefix) ((cons ((Build_sll_payload_node (a) (linklist_node_pre))) (suffix)))))) (PreH3 : (not (In (linklist_node_pre) ((xizi_sll_next_ptrs (prefix)))) )) ,
  (xizi_sllseg_payload storeA (xizi_sll_first_value ((xizi_sll_next_ptrs (l)))) linklist_node_pre prefix )
  **  (storeA linklist_node_pre a )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sll_payload storeA next suffix )
|--
  “ (next = (xizi_sll_next_value ((xizi_sll_next_ptrs (l))) (linklist_node_pre))) ”
.

Definition SingleLinkListGetNextNode_return_wit_1_split_goal_spatial := 
forall (A: Type) (linklist_node_pre: Z) (l: (@list (@sll_payload_node A))) (storeA: (Z -> (A -> Assertion))) (prefix: (@list (@sll_payload_node A))) (suffix: (@list (@sll_payload_node A))) (a: A) (next: Z) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (l = (app (prefix) ((cons ((Build_sll_payload_node (a) (linklist_node_pre))) (suffix)))))) (PreH3 : (not (In (linklist_node_pre) ((xizi_sll_next_ptrs (prefix)))) )) ,
  (xizi_sllseg_payload storeA (xizi_sll_first_value ((xizi_sll_next_ptrs (l)))) linklist_node_pre prefix )
  **  (storeA linklist_node_pre a )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sll_payload storeA next suffix )
|--
  (xizi_sll_payload storeA (xizi_sll_first_value ((xizi_sll_next_ptrs (l)))) l )
.

Module Type VC_Correct.

Include xizi_single_link_Strategy_Correct.

Axiom proof_of_SingleLinkListGetNextNode_entail_wit_1 : SingleLinkListGetNextNode_entail_wit_1.
Axiom proof_of_SingleLinkListGetNextNode_return_wit_1 : SingleLinkListGetNextNode_return_wit_1.

End VC_Correct.
