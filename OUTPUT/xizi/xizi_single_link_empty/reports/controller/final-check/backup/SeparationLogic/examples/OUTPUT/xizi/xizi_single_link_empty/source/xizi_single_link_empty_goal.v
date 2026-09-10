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

(*----- Function IsSingleLinkListEmpty -----*)

Definition IsSingleLinkListEmpty_safety_wit_1 := 
forall (linklist_pre: Z) (l: (@list Z)) (q: Z) (PreH1 : (linklist_pre <> 0)) ,
  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> q)
  **  (xizi_sll q l )
  **  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition IsSingleLinkListEmpty_return_wit_1 := 
(
forall (linklist_pre: Z) (l: (@list Z)) (q: Z) (PreH1 : (q <> 0)) (PreH2 : (linklist_pre <> 0)) ,
  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> q)
  **  (xizi_sll q l )
|--
  “ (l <> (@nil Z)) ” 
  &&  “ (0 = 0) ”
  &&  (xizi_sll_head linklist_pre l )
) \/
(
forall (linklist_pre: Z) (l: (@list Z)) (q: Z) (q_2: Z) (l0: (@list Z)) (PreH1 : (l = (cons (q) (l0)))) (PreH2 : (q <> 0)) (PreH3 : (linklist_pre <> 0)) ,
  (xizi_sll q_2 l0 )
  **  ((&((q)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> q_2)
|--
  “ (l <> (@nil Z)) ”
  &&  (xizi_sll q l )
).

Definition IsSingleLinkListEmpty_return_wit_1_split_goal_1 := 
forall (linklist_pre: Z) (l: (@list Z)) (q: Z) (q_2: Z) (l0: (@list Z)) (PreH1 : (l = (cons (q) (l0)))) (PreH2 : (q <> 0)) (PreH3 : (linklist_pre <> 0)) ,
  (xizi_sll q_2 l0 )
  **  ((&((q)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> q_2)
|--
  “ (l <> (@nil Z)) ”
.

Definition IsSingleLinkListEmpty_return_wit_1_split_goal_spatial := 
forall (linklist_pre: Z) (l: (@list Z)) (q: Z) (q_2: Z) (l0: (@list Z)) (PreH1 : (l = (cons (q) (l0)))) (PreH2 : (q <> 0)) (PreH3 : (linklist_pre <> 0)) ,
  (xizi_sll q_2 l0 )
  **  ((&((q)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> q_2)
|--
  (xizi_sll q l )
.

Definition IsSingleLinkListEmpty_return_wit_2 := 
(
forall (linklist_pre: Z) (l: (@list Z)) (q: Z) (PreH1 : (q = 0)) (PreH2 : (linklist_pre <> 0)) ,
  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> q)
  **  (xizi_sll q l )
|--
  “ (l = (@nil Z)) ” 
  &&  “ (1 = 1) ”
  &&  (xizi_sll_head linklist_pre l )
) \/
(
forall (linklist_pre: Z) (l: (@list Z)) (q: Z) (PreH1 : (q = 0)) (PreH2 : (linklist_pre <> 0)) ,
  (xizi_sll q l )
|--
  “ (l = (@nil Z)) ”
  &&  (xizi_sll q l )
).

Definition IsSingleLinkListEmpty_return_wit_2_split_goal_1 := 
forall (linklist_pre: Z) (l: (@list Z)) (q: Z) (PreH1 : (q = 0)) (PreH2 : (linklist_pre <> 0)) ,
  (xizi_sll q l )
|--
  “ (l = (@nil Z)) ”
.

Definition IsSingleLinkListEmpty_return_wit_2_split_goal_spatial := 
forall (linklist_pre: Z) (l: (@list Z)) (q: Z) (PreH1 : (q = 0)) (PreH2 : (linklist_pre <> 0)) ,
  (xizi_sll q l )
|--
  (xizi_sll q l )
.

Definition IsSingleLinkListEmpty_partial_solve_wit_1 := 
forall (linklist_pre: Z) (l: (@list Z)) ,
  (xizi_sll_head linklist_pre l )
|--
  EX (q: Z) ,
  “ (linklist_pre <> 0) ”
  &&  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> q)
  **  (xizi_sll q l )
.

Module Type VC_Correct.

Include xizi_single_link_Strategy_Correct.

Axiom proof_of_IsSingleLinkListEmpty_safety_wit_1 : IsSingleLinkListEmpty_safety_wit_1.
Axiom proof_of_IsSingleLinkListEmpty_return_wit_1 : IsSingleLinkListEmpty_return_wit_1.
Axiom proof_of_IsSingleLinkListEmpty_return_wit_2 : IsSingleLinkListEmpty_return_wit_2.
Axiom proof_of_IsSingleLinkListEmpty_partial_solve_wit_1 : IsSingleLinkListEmpty_partial_solve_wit_1.

End VC_Correct.
