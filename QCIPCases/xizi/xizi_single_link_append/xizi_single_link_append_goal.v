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
From QCIPLib.xizi.xizi_single_link_common Require Import xizi_single_link_strategy_goal.
From QCIPLib.xizi.xizi_single_link_common Require Import xizi_single_link_strategy_proof.

(*----- Function xizi_single_link_append -----*)

Definition xizi_single_link_append_safety_wit_1 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (old_next: Z) (l: (@list Z)) (next: Z) (l1a: (@list Z)) (node: Z) (l1b: (@list Z)) (l0: (@list Z)) (PreH1 : (l = (app (l1a) ((cons (node) (l1b)))))) (PreH2 : (node <> 0)) (PreH3 : (l = (cons (linklist_pre) (l0)))) (PreH4 : (linklist_pre <> 0)) (PreH5 : (linklist_node_pre <> 0)) (PreH6 : (next = 0)) ,
  ((( &( "node" ) )) # Ptr  |-> node)
  **  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  ((( &( "linklist_node" ) )) # Ptr  |-> linklist_node_pre)
  **  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  (xizi_sllseg linklist_pre node l1a )
  **  (xizi_sll next l1b )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> old_next)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_single_link_append_entail_wit_1 := 
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (old_next: Z) (l: (@list Z)) (PreH1 : (linklist_pre <> 0)) (PreH2 : (linklist_node_pre <> 0)) ,
  (xizi_sll linklist_pre l )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> old_next)
|--
  EX (next: Z)  (l1a: (@list Z))  (l1b: (@list Z))  (l0: (@list Z)) ,
  “ (l = (app (l1a) ((cons (linklist_pre) (l1b))))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (l = (cons (linklist_pre) (l0))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ”
  &&  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist_pre linklist_pre l1a )
  **  (xizi_sll next l1b )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> old_next)
) \/
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (l: (@list Z)) (q: Z) (l0_2: (@list Z)) (PreH1 : (l = (cons (linklist_pre) (l0_2)))) (PreH2 : (linklist_pre <> 0)) (PreH3 : (linklist_node_pre <> 0)) ,
  (xizi_sll q l0_2 )
|--
  EX (l1b: (@list Z))  (l0: (@list Z)) ,
  “ (l = (app ((@nil Z)) ((cons (linklist_pre) (l1b))))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (l = (cons (linklist_pre) (l0))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ”
  &&  (xizi_sll q l1b )
).

Definition xizi_single_link_append_entail_wit_2 := 
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (old_next: Z) (l: (@list Z)) (next_2: Z) (l1a_2: (@list Z)) (node: Z) (l1b_2: (@list Z)) (l0_2: (@list Z)) (PreH1 : (l = (app (l1a_2) ((cons (node) (l1b_2)))))) (PreH2 : (node <> 0)) (PreH3 : (l = (cons (linklist_pre) (l0_2)))) (PreH4 : (linklist_pre <> 0)) (PreH5 : (linklist_node_pre <> 0)) (PreH6 : (next_2 <> 0)) ,
  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_2)
  **  (xizi_sllseg linklist_pre node l1a_2 )
  **  (xizi_sll next_2 l1b_2 )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> old_next)
|--
  EX (next: Z)  (l1a: (@list Z))  (l1b: (@list Z))  (l0: (@list Z)) ,
  “ (l = (app (l1a) ((cons (next_2) (l1b))))) ” 
  &&  “ (next_2 <> 0) ” 
  &&  “ (l = (cons (linklist_pre) (l0))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ”
  &&  ((&((next_2)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist_pre next_2 l1a )
  **  (xizi_sll next l1b )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> old_next)
) \/
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (l: (@list Z)) (next_2: Z) (l1a_2: (@list Z)) (node: Z) (l1b_2: (@list Z)) (l0_2: (@list Z)) (q: Z) (l0_3: (@list Z)) (PreH1 : (l1b_2 = (cons (next_2) (l0_3)))) (PreH2 : (l = (app (l1a_2) ((cons (node) (l1b_2)))))) (PreH3 : (node <> 0)) (PreH4 : (l = (cons (linklist_pre) (l0_2)))) (PreH5 : (linklist_pre <> 0)) (PreH6 : (linklist_node_pre <> 0)) (PreH7 : (next_2 <> 0)) ,
  (xizi_sll q l0_3 )
  **  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_2)
  **  (xizi_sllseg linklist_pre node l1a_2 )
|--
  EX (l1a: (@list Z))  (l1b: (@list Z))  (l0: (@list Z)) ,
  “ (l = (app (l1a) ((cons (next_2) (l1b))))) ” 
  &&  “ (next_2 <> 0) ” 
  &&  “ (l = (cons (linklist_pre) (l0))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ”
  &&  (xizi_sllseg linklist_pre next_2 l1a )
  **  (xizi_sll q l1b )
).

Definition xizi_single_link_append_return_wit_1 := 
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (l: (@list Z)) (next: Z) (l1a: (@list Z)) (node: Z) (l1b: (@list Z)) (l0: (@list Z)) (PreH1 : (l = (app (l1a) ((cons (node) (l1b)))))) (PreH2 : (node <> 0)) (PreH3 : (l = (cons (linklist_pre) (l0)))) (PreH4 : (linklist_pre <> 0)) (PreH5 : (linklist_node_pre <> 0)) (PreH6 : (next = 0)) ,
  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  (xizi_sllseg linklist_pre node l1a )
  **  (xizi_sll next l1b )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> 0)
|--
  (xizi_sll linklist_pre (app (l) ((cons (linklist_node_pre) ((@nil Z))))) )
) \/
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (l: (@list Z)) (next: Z) (l1a: (@list Z)) (node: Z) (l1b: (@list Z)) (l0: (@list Z)) (PreH1 : (l = (app (l1a) ((cons (node) (l1b)))))) (PreH2 : (node <> 0)) (PreH3 : (l = (cons (linklist_pre) (l0)))) (PreH4 : (linklist_pre <> 0)) (PreH5 : (linklist_node_pre <> 0)) (PreH6 : (next = 0)) ,
  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  (xizi_sllseg linklist_pre node l1a )
  **  (xizi_sll next l1b )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> 0)
|--
  (xizi_sll linklist_pre (app (l) ((cons (linklist_node_pre) ((@nil Z))))) )
).

Definition xizi_single_link_append_return_wit_1_split_goal_spatial := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (l: (@list Z)) (next: Z) (l1a: (@list Z)) (node: Z) (l1b: (@list Z)) (l0: (@list Z)) (PreH1 : (l = (app (l1a) ((cons (node) (l1b)))))) (PreH2 : (node <> 0)) (PreH3 : (l = (cons (linklist_pre) (l0)))) (PreH4 : (linklist_pre <> 0)) (PreH5 : (linklist_node_pre <> 0)) (PreH6 : (next = 0)) ,
  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  (xizi_sllseg linklist_pre node l1a )
  **  (xizi_sll next l1b )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> 0)
|--
  (xizi_sll linklist_pre (app (l) ((cons (linklist_node_pre) ((@nil Z))))) )
.

Module Type VC_Correct.

Include xizi_single_link_Strategy_Correct.

Axiom proof_of_xizi_single_link_append_safety_wit_1 : xizi_single_link_append_safety_wit_1.
Axiom proof_of_xizi_single_link_append_entail_wit_1 : xizi_single_link_append_entail_wit_1.
Axiom proof_of_xizi_single_link_append_entail_wit_2 : xizi_single_link_append_entail_wit_2.
Axiom proof_of_xizi_single_link_append_return_wit_1 : xizi_single_link_append_return_wit_1.

End VC_Correct.
