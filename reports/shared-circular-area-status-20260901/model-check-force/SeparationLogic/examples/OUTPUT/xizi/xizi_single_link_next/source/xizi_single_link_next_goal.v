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
Local Open Scope sac.
Require Import xizi_single_link_strategy_goal.
Require Import xizi_single_link_strategy_proof.

(*----- Function SingleLinkListGetNextNode -----*)

Definition SingleLinkListGetNextNode_return_wit_1 := 
(
forall (linklist_node_pre: Z) (l: (@list Z)) (prefix: (@list Z)) (suffix: (@list Z)) (next: Z) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (not (In (linklist_node_pre) (prefix)) )) (PreH3 : (l = (app (prefix) ((cons (linklist_node_pre) (suffix)))))) ,
  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sll next suffix )
  **  (xizi_sllseg (xizi_sll_first_value (l)) linklist_node_pre prefix )
|--
  “ (next = (xizi_sll_next_value (l) (linklist_node_pre))) ”
  &&  (xizi_sll (xizi_sll_first_value (l)) l )
) \/
(
forall (linklist_node_pre: Z) (l: (@list Z)) (prefix: (@list Z)) (suffix: (@list Z)) (next: Z) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (not (In (linklist_node_pre) (prefix)) )) (PreH3 : (l = (app (prefix) ((cons (linklist_node_pre) (suffix)))))) ,
  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sll next suffix )
  **  (xizi_sllseg (xizi_sll_first_value (l)) linklist_node_pre prefix )
|--
  “ (next = (xizi_sll_next_value (l) (linklist_node_pre))) ”
  &&  (xizi_sll (xizi_sll_first_value (l)) l )
).

Definition SingleLinkListGetNextNode_return_wit_1_split_goal_1 := 
forall (linklist_node_pre: Z) (l: (@list Z)) (prefix: (@list Z)) (suffix: (@list Z)) (next: Z) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (not (In (linklist_node_pre) (prefix)) )) (PreH3 : (l = (app (prefix) ((cons (linklist_node_pre) (suffix)))))) ,
  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sll next suffix )
  **  (xizi_sllseg (xizi_sll_first_value (l)) linklist_node_pre prefix )
|--
  “ (next = (xizi_sll_next_value (l) (linklist_node_pre))) ”
.

Definition SingleLinkListGetNextNode_return_wit_1_split_goal_spatial := 
forall (linklist_node_pre: Z) (l: (@list Z)) (prefix: (@list Z)) (suffix: (@list Z)) (next: Z) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (not (In (linklist_node_pre) (prefix)) )) (PreH3 : (l = (app (prefix) ((cons (linklist_node_pre) (suffix)))))) ,
  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sll next suffix )
  **  (xizi_sllseg (xizi_sll_first_value (l)) linklist_node_pre prefix )
|--
  (xizi_sll (xizi_sll_first_value (l)) l )
.

Definition SingleLinkListGetNextNode_partial_solve_wit_1 := 
forall (linklist_node_pre: Z) (l: (@list Z)) (PreH1 : (In linklist_node_pre l )) ,
  (xizi_sll (xizi_sll_first_value (l)) l )
|--
  EX (next: Z)  (suffix: (@list Z))  (prefix: (@list Z)) ,
  “ (linklist_node_pre <> 0) ” 
  &&  “ (not (In (linklist_node_pre) (prefix)) ) ” 
  &&  “ (l = (app (prefix) ((cons (linklist_node_pre) (suffix))))) ”
  &&  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sll next suffix )
  **  (xizi_sllseg (xizi_sll_first_value (l)) linklist_node_pre prefix )
.

Module Type VC_Correct.

Include xizi_single_link_Strategy_Correct.

Axiom proof_of_SingleLinkListGetNextNode_return_wit_1 : SingleLinkListGetNextNode_return_wit_1.
Axiom proof_of_SingleLinkListGetNextNode_partial_solve_wit_1 : SingleLinkListGetNextNode_partial_solve_wit_1.

End VC_Correct.
