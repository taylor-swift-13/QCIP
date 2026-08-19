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

(*----- Function xizi_single_link_tail -----*)

Definition xizi_single_link_tail_safety_wit_1 := 
forall (linklist_pre: Z) (l: (@list Z)) (q: Z) (PreH1 : (linklist_pre <> 0)) ,
  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> q)
  **  (xizi_sll q l )
  **  ((( &( "current" ) )) # Ptr  |-> q)
  **  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_single_link_tail_entail_wit_1 := 
(
forall (linklist_pre: Z) (l: (@list Z)) (q: Z) (PreH1 : (q <> 0)) (PreH2 : (linklist_pre <> 0)) ,
  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> q)
  **  (xizi_sll q l )
|--
  EX (next: Z)  (first: Z)  (l1: (@list Z))  (l2: (@list Z)) ,
  “ (l = (app (l1) ((cons (q) (l2))))) ” 
  &&  “ (q <> 0) ” 
  &&  “ (linklist_pre <> 0) ”
  &&  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_sllseg first q l1 )
  **  ((&((q)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sll next l2 )
) \/
(
forall (linklist_pre: Z) (l: (@list Z)) (q: Z) (q_2: Z) (l0: (@list Z)) (PreH1 : (l = (cons (q) (l0)))) (PreH2 : (q <> 0)) (PreH3 : (linklist_pre <> 0)) ,
  (xizi_sll q_2 l0 )
|--
  EX (l2: (@list Z)) ,
  “ (l = (app ((@nil Z)) ((cons (q) (l2))))) ” 
  &&  “ (q <> 0) ” 
  &&  “ (linklist_pre <> 0) ”
  &&  (xizi_sll q_2 l2 )
).

Definition xizi_single_link_tail_entail_wit_2 := 
(
forall (linklist_pre: Z) (l: (@list Z)) (next_2: Z) (first_2: Z) (l1_2: (@list Z)) (current: Z) (l2_2: (@list Z)) (PreH1 : (l = (app (l1_2) ((cons (current) (l2_2)))))) (PreH2 : (current <> 0)) (PreH3 : (linklist_pre <> 0)) (PreH4 : (next_2 <> 0)) ,
  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_2)
  **  (xizi_sllseg first_2 current l1_2 )
  **  ((&((current)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_2)
  **  (xizi_sll next_2 l2_2 )
|--
  EX (next: Z)  (first: Z)  (l1: (@list Z))  (l2: (@list Z)) ,
  “ (l = (app (l1) ((cons (next_2) (l2))))) ” 
  &&  “ (next_2 <> 0) ” 
  &&  “ (linklist_pre <> 0) ”
  &&  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_sllseg first next_2 l1 )
  **  ((&((next_2)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sll next l2 )
) \/
(
forall (linklist_pre: Z) (l: (@list Z)) (next_2: Z) (first_2: Z) (l1_2: (@list Z)) (current: Z) (l2_2: (@list Z)) (q: Z) (l0: (@list Z)) (PreH1 : (l2_2 = (cons (next_2) (l0)))) (PreH2 : (l = (app (l1_2) ((cons (current) (l2_2)))))) (PreH3 : (current <> 0)) (PreH4 : (linklist_pre <> 0)) (PreH5 : (next_2 <> 0)) ,
  (xizi_sll q l0 )
  **  (xizi_sllseg first_2 current l1_2 )
  **  ((&((current)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_2)
|--
  EX (l1: (@list Z))  (l2: (@list Z)) ,
  “ (l = (app (l1) ((cons (next_2) (l2))))) ” 
  &&  “ (next_2 <> 0) ” 
  &&  “ (linklist_pre <> 0) ”
  &&  (xizi_sllseg first_2 next_2 l1 )
  **  (xizi_sll q l2 )
).

Definition xizi_single_link_tail_return_wit_1 := 
(
forall (linklist_pre: Z) (l: (@list Z)) (next: Z) (first: Z) (l1: (@list Z)) (current: Z) (l2: (@list Z)) (PreH1 : (l = (app (l1) ((cons (current) (l2)))))) (PreH2 : (current <> 0)) (PreH3 : (linklist_pre <> 0)) (PreH4 : (next = 0)) ,
  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_sllseg first current l1 )
  **  ((&((current)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sll next l2 )
|--
  “ (current = (xizi_sll_tail_value (l) (linklist_pre))) ”
  &&  (xizi_sll_head linklist_pre l )
) \/
(
forall (linklist_pre: Z) (l: (@list Z)) (next: Z) (first: Z) (l1: (@list Z)) (current: Z) (l2: (@list Z)) (PreH1 : (l = (app (l1) ((cons (current) (l2)))))) (PreH2 : (current <> 0)) (PreH3 : (linklist_pre <> 0)) (PreH4 : (next = 0)) ,
  (xizi_sllseg first current l1 )
  **  ((&((current)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sll next l2 )
|--
  “ (current = (xizi_sll_tail_value (l) (linklist_pre))) ”
  &&  (xizi_sll first l )
).

Definition xizi_single_link_tail_return_wit_1_split_goal_1 := 
forall (linklist_pre: Z) (l: (@list Z)) (next: Z) (first: Z) (l1: (@list Z)) (current: Z) (l2: (@list Z)) (PreH1 : (l = (app (l1) ((cons (current) (l2)))))) (PreH2 : (current <> 0)) (PreH3 : (linklist_pre <> 0)) (PreH4 : (next = 0)) ,
  (xizi_sllseg first current l1 )
  **  ((&((current)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sll next l2 )
|--
  “ (current = (xizi_sll_tail_value (l) (linklist_pre))) ”
.

Definition xizi_single_link_tail_return_wit_1_split_goal_spatial := 
forall (linklist_pre: Z) (l: (@list Z)) (next: Z) (first: Z) (l1: (@list Z)) (current: Z) (l2: (@list Z)) (PreH1 : (l = (app (l1) ((cons (current) (l2)))))) (PreH2 : (current <> 0)) (PreH3 : (linklist_pre <> 0)) (PreH4 : (next = 0)) ,
  (xizi_sllseg first current l1 )
  **  ((&((current)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sll next l2 )
|--
  (xizi_sll first l )
.

Definition xizi_single_link_tail_return_wit_2 := 
(
forall (linklist_pre: Z) (l: (@list Z)) (q: Z) (PreH1 : (q = 0)) (PreH2 : (linklist_pre <> 0)) ,
  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> q)
  **  (xizi_sll q l )
|--
  “ (linklist_pre = (xizi_sll_tail_value (l) (linklist_pre))) ”
  &&  (xizi_sll_head linklist_pre l )
) \/
(
forall (linklist_pre: Z) (l: (@list Z)) (q: Z) (PreH1 : (q = 0)) (PreH2 : (linklist_pre <> 0)) ,
  (xizi_sll q l )
|--
  “ (linklist_pre = (xizi_sll_tail_value (l) (linklist_pre))) ”
  &&  (xizi_sll q l )
).

Definition xizi_single_link_tail_return_wit_2_split_goal_1 := 
forall (linklist_pre: Z) (l: (@list Z)) (q: Z) (PreH1 : (q = 0)) (PreH2 : (linklist_pre <> 0)) ,
  (xizi_sll q l )
|--
  “ (linklist_pre = (xizi_sll_tail_value (l) (linklist_pre))) ”
.

Definition xizi_single_link_tail_return_wit_2_split_goal_spatial := 
forall (linklist_pre: Z) (l: (@list Z)) (q: Z) (PreH1 : (q = 0)) (PreH2 : (linklist_pre <> 0)) ,
  (xizi_sll q l )
|--
  (xizi_sll q l )
.

Definition xizi_single_link_tail_partial_solve_wit_1 := 
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

Axiom proof_of_xizi_single_link_tail_safety_wit_1 : xizi_single_link_tail_safety_wit_1.
Axiom proof_of_xizi_single_link_tail_entail_wit_1 : xizi_single_link_tail_entail_wit_1.
Axiom proof_of_xizi_single_link_tail_entail_wit_2 : xizi_single_link_tail_entail_wit_2.
Axiom proof_of_xizi_single_link_tail_return_wit_1 : xizi_single_link_tail_return_wit_1.
Axiom proof_of_xizi_single_link_tail_return_wit_2 : xizi_single_link_tail_return_wit_2.
Axiom proof_of_xizi_single_link_tail_partial_solve_wit_1 : xizi_single_link_tail_partial_solve_wit_1.

End VC_Correct.
