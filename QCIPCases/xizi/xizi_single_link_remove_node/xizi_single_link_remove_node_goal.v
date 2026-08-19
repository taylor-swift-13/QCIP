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

(*----- Function xizi_single_link_remove_node -----*)

Definition xizi_single_link_remove_node_safety_wit_1 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (l2: (@list Z)) (l1: (@list Z)) (l: (@list Z)) (linklist_node_node_next: Z) (linklist_node_node_next_2: Z) (linklist_node: Z) (next: Z) (l1a: (@list Z)) (node: Z) (l1b: (@list Z)) (linklist: Z) (l0: (@list Z)) (PreH1 : (next = linklist_node)) (PreH2 : (next <> 0)) (PreH3 : ((cons (linklist) (l1)) = (app (l1a) ((cons (node) (l1b)))))) (PreH4 : (node <> 0)) (PreH5 : (linklist_node_node_next_2 = (xizi_sll_first_value (l2)))) (PreH6 : ((cons (linklist_pre) (l1)) = (cons (linklist_pre) (l0)))) (PreH7 : (linklist_pre <> 0)) (PreH8 : (linklist_node_pre <> 0)) (PreH9 : (linklist_pre <> linklist_node_pre)) (PreH10 : (linklist_node_node_next = (xizi_sll_first_value (l2)))) (PreH11 : (linklist_pre <> 0)) (PreH12 : (l = (app (l1) ((cons (linklist_node_pre) (l2)))))) ,
  ((( &( "linklist" ) )) # Ptr  |-> linklist)
  **  ((( &( "node" ) )) # Ptr  |-> node)
  **  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist node l1a )
  **  ((( &( "linklist_node" ) )) # Ptr  |-> linklist_node)
  **  (xizi_sll_to_target next linklist_node l1b )
  **  ((&((linklist_node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next_2)
  **  (xizi_sll (xizi_sll_first_value (l2)) l2 )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_single_link_remove_node_safety_wit_2 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (l2: (@list Z)) (l1: (@list Z)) (l: (@list Z)) (linklist_node_node_next: Z) (linklist_node_node_next_2: Z) (linklist_node: Z) (next: Z) (l1a: (@list Z)) (node: Z) (l1b: (@list Z)) (linklist: Z) (l0: (@list Z)) (PreH1 : (next = 0)) (PreH2 : ((cons (linklist) (l1)) = (app (l1a) ((cons (node) (l1b)))))) (PreH3 : (node <> 0)) (PreH4 : (linklist_node_node_next_2 = (xizi_sll_first_value (l2)))) (PreH5 : ((cons (linklist_pre) (l1)) = (cons (linklist_pre) (l0)))) (PreH6 : (linklist_pre <> 0)) (PreH7 : (linklist_node_pre <> 0)) (PreH8 : (linklist_pre <> linklist_node_pre)) (PreH9 : (linklist_node_node_next = (xizi_sll_first_value (l2)))) (PreH10 : (linklist_pre <> 0)) (PreH11 : (l = (app (l1) ((cons (linklist_node_pre) (l2)))))) ,
  ((( &( "linklist" ) )) # Ptr  |-> linklist)
  **  ((( &( "node" ) )) # Ptr  |-> node)
  **  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist node l1a )
  **  ((( &( "linklist_node" ) )) # Ptr  |-> linklist_node)
  **  (xizi_sll_to_target next linklist_node l1b )
  **  ((&((linklist_node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next_2)
  **  (xizi_sll (xizi_sll_first_value (l2)) l2 )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_single_link_remove_node_safety_wit_3 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (l2: (@list Z)) (l1: (@list Z)) (l: (@list Z)) (linklist_node_node_next: Z) (linklist_node_node_next_2: Z) (linklist_node: Z) (next: Z) (l1a: (@list Z)) (node: Z) (l1b: (@list Z)) (linklist: Z) (l0: (@list Z)) (PreH1 : (next = 0)) (PreH2 : (next = linklist_node)) (PreH3 : (next <> 0)) (PreH4 : ((cons (linklist) (l1)) = (app (l1a) ((cons (node) (l1b)))))) (PreH5 : (node <> 0)) (PreH6 : (linklist_node_node_next_2 = (xizi_sll_first_value (l2)))) (PreH7 : ((cons (linklist_pre) (l1)) = (cons (linklist_pre) (l0)))) (PreH8 : (linklist_pre <> 0)) (PreH9 : (linklist_node_pre <> 0)) (PreH10 : (linklist_pre <> linklist_node_pre)) (PreH11 : (linklist_node_node_next = (xizi_sll_first_value (l2)))) (PreH12 : (linklist_pre <> 0)) (PreH13 : (l = (app (l1) ((cons (linklist_node_pre) (l2)))))) ,
  ((( &( "linklist" ) )) # Ptr  |-> linklist)
  **  ((( &( "node" ) )) # Ptr  |-> node)
  **  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist node l1a )
  **  ((( &( "linklist_node" ) )) # Ptr  |-> linklist_node)
  **  (xizi_sll_to_target next linklist_node l1b )
  **  ((&((linklist_node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next_2)
  **  (xizi_sll (xizi_sll_first_value (l2)) l2 )
|--
  “ False ”
.

Definition xizi_single_link_remove_node_safety_wit_4 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (l2: (@list Z)) (l1: (@list Z)) (l: (@list Z)) (linklist_node_node_next: Z) (linklist_node_node_next_2: Z) (linklist_node: Z) (next: Z) (l1a: (@list Z)) (node: Z) (l1b: (@list Z)) (linklist: Z) (l0: (@list Z)) (PreH1 : (next <> 0)) (PreH2 : (next = 0)) (PreH3 : ((cons (linklist) (l1)) = (app (l1a) ((cons (node) (l1b)))))) (PreH4 : (node <> 0)) (PreH5 : (linklist_node_node_next_2 = (xizi_sll_first_value (l2)))) (PreH6 : ((cons (linklist_pre) (l1)) = (cons (linklist_pre) (l0)))) (PreH7 : (linklist_pre <> 0)) (PreH8 : (linklist_node_pre <> 0)) (PreH9 : (linklist_pre <> linklist_node_pre)) (PreH10 : (linklist_node_node_next = (xizi_sll_first_value (l2)))) (PreH11 : (linklist_pre <> 0)) (PreH12 : (l = (app (l1) ((cons (linklist_node_pre) (l2)))))) ,
  ((( &( "linklist" ) )) # Ptr  |-> linklist)
  **  ((( &( "node" ) )) # Ptr  |-> node)
  **  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist node l1a )
  **  ((( &( "linklist_node" ) )) # Ptr  |-> linklist_node)
  **  (xizi_sll_to_target next linklist_node l1b )
  **  ((&((linklist_node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next_2)
  **  (xizi_sll (xizi_sll_first_value (l2)) l2 )
|--
  “ False ”
.

Definition xizi_single_link_remove_node_entail_wit_1 := 
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (l2: (@list Z)) (l1: (@list Z)) (l: (@list Z)) (linklist_node_node_next: Z) (PreH1 : (linklist_pre <> 0)) (PreH2 : (linklist_node_pre <> 0)) (PreH3 : (linklist_pre <> linklist_node_pre)) (PreH4 : (linklist_node_node_next = (xizi_sll_first_value (l2)))) (PreH5 : (linklist_pre <> 0)) (PreH6 : (l = (app (l1) ((cons (linklist_node_pre) (l2)))))) ,
  (xizi_sll_to_target linklist_pre linklist_node_pre (cons (linklist_pre) (l1)) )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next)
  **  (xizi_sll (xizi_sll_first_value (l2)) l2 )
|--
  EX (linklist_node_node_next_2: Z)  (next: Z)  (l1a: (@list Z))  (l1b: (@list Z))  (l0: (@list Z)) ,
  “ ((cons (linklist_pre) (l1)) = (app (l1a) ((cons (linklist_pre) (l1b))))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_node_node_next_2 = (xizi_sll_first_value (l2))) ” 
  &&  “ ((cons (linklist_pre) (l1)) = (cons (linklist_pre) (l0))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ (linklist_pre <> linklist_node_pre) ” 
  &&  “ (linklist_node_node_next = (xizi_sll_first_value (l2))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (l = (app (l1) ((cons (linklist_node_pre) (l2))))) ”
  &&  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist_pre linklist_pre l1a )
  **  (xizi_sll_to_target next linklist_node_pre l1b )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next_2)
  **  (xizi_sll (xizi_sll_first_value (l2)) l2 )
) \/
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (l2: (@list Z)) (l1: (@list Z)) (l: (@list Z)) (linklist_node_node_next: Z) (r: Z) (l0_2: (@list Z)) (PreH1 : ((cons (linklist_pre) (l1)) = (cons (linklist_pre) (l0_2)))) (PreH2 : (linklist_pre <> 0)) (PreH3 : (linklist_node_pre <> 0)) (PreH4 : (linklist_pre <> linklist_node_pre)) (PreH5 : (linklist_node_node_next = (xizi_sll_first_value (l2)))) (PreH6 : (linklist_pre <> 0)) (PreH7 : (l = (app (l1) ((cons (linklist_node_pre) (l2)))))) ,
  (xizi_sll_to_target r linklist_node_pre l0_2 )
  **  (xizi_sll (xizi_sll_first_value (l2)) l2 )
|--
  EX (l1b: (@list Z))  (l0: (@list Z)) ,
  “ (linklist_node_node_next = (xizi_sll_first_value (l2))) ” 
  &&  “ (linklist_node_node_next = (xizi_sll_first_value (l2))) ” 
  &&  “ ((cons (linklist_pre) (l1)) = (app ((@nil Z)) ((cons (linklist_pre) (l1b))))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ ((cons (linklist_pre) (l1)) = (cons (linklist_pre) (l0))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ (linklist_pre <> linklist_node_pre) ” 
  &&  “ (linklist_node_node_next = (xizi_sll_first_value (l2))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (l = (app (l1) ((cons (linklist_node_pre) (l2))))) ”
  &&  (xizi_sll_to_target r linklist_node_pre l1b )
  **  (xizi_sll (xizi_sll_first_value (l2)) l2 )
).

Definition xizi_single_link_remove_node_entail_wit_2 := 
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (l2: (@list Z)) (l1: (@list Z)) (l: (@list Z)) (linklist_node_node_next: Z) (linklist_node_node_next_3: Z) (linklist_node: Z) (next_2: Z) (l1a_2: (@list Z)) (node: Z) (l1b_2: (@list Z)) (linklist: Z) (l0_2: (@list Z)) (PreH1 : (next_2 <> linklist_node)) (PreH2 : (next_2 <> 0)) (PreH3 : ((cons (linklist) (l1)) = (app (l1a_2) ((cons (node) (l1b_2)))))) (PreH4 : (node <> 0)) (PreH5 : (linklist_node_node_next_3 = (xizi_sll_first_value (l2)))) (PreH6 : ((cons (linklist_pre) (l1)) = (cons (linklist_pre) (l0_2)))) (PreH7 : (linklist_pre <> 0)) (PreH8 : (linklist_node_pre <> 0)) (PreH9 : (linklist_pre <> linklist_node_pre)) (PreH10 : (linklist_node_node_next = (xizi_sll_first_value (l2)))) (PreH11 : (linklist_pre <> 0)) (PreH12 : (l = (app (l1) ((cons (linklist_node_pre) (l2)))))) ,
  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_2)
  **  (xizi_sllseg linklist node l1a_2 )
  **  (xizi_sll_to_target next_2 linklist_node l1b_2 )
  **  ((&((linklist_node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next_3)
  **  (xizi_sll (xizi_sll_first_value (l2)) l2 )
|--
  EX (linklist_node_node_next_2: Z)  (next: Z)  (l1a: (@list Z))  (l1b: (@list Z))  (l0: (@list Z)) ,
  “ ((cons (linklist) (l1)) = (app (l1a) ((cons (next_2) (l1b))))) ” 
  &&  “ (next_2 <> 0) ” 
  &&  “ (linklist_node_node_next_2 = (xizi_sll_first_value (l2))) ” 
  &&  “ ((cons (linklist_pre) (l1)) = (cons (linklist_pre) (l0))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ (linklist_pre <> linklist_node_pre) ” 
  &&  “ (linklist_node_node_next = (xizi_sll_first_value (l2))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (l = (app (l1) ((cons (linklist_node_pre) (l2))))) ”
  &&  ((&((next_2)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist next_2 l1a )
  **  (xizi_sll_to_target next linklist_node l1b )
  **  ((&((linklist_node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next_2)
  **  (xizi_sll (xizi_sll_first_value (l2)) l2 )
) \/
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (l2: (@list Z)) (l1: (@list Z)) (l: (@list Z)) (linklist_node_node_next: Z) (linklist_node_node_next_3: Z) (linklist_node: Z) (next_2: Z) (l1a_2: (@list Z)) (node: Z) (l1b_2: (@list Z)) (linklist: Z) (l0_2: (@list Z)) (r: Z) (l0_3: (@list Z)) (PreH1 : (l1b_2 = (cons (next_2) (l0_3)))) (PreH2 : (next_2 <> linklist_node)) (PreH3 : (next_2 <> 0)) (PreH4 : ((cons (linklist) (l1)) = (app (l1a_2) ((cons (node) (l1b_2)))))) (PreH5 : (node <> 0)) (PreH6 : (linklist_node_node_next_3 = (xizi_sll_first_value (l2)))) (PreH7 : ((cons (linklist_pre) (l1)) = (cons (linklist_pre) (l0_2)))) (PreH8 : (linklist_pre <> 0)) (PreH9 : (linklist_node_pre <> 0)) (PreH10 : (linklist_pre <> linklist_node_pre)) (PreH11 : (linklist_node_node_next = (xizi_sll_first_value (l2)))) (PreH12 : (linklist_pre <> 0)) (PreH13 : (l = (app (l1) ((cons (linklist_node_pre) (l2)))))) ,
  (xizi_sll_to_target r linklist_node l0_3 )
  **  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_2)
  **  (xizi_sllseg linklist node l1a_2 )
  **  (xizi_sll (xizi_sll_first_value (l2)) l2 )
|--
  EX (l1a: (@list Z))  (l1b: (@list Z))  (l0: (@list Z)) ,
  “ (linklist_node_node_next_3 = (xizi_sll_first_value (l2))) ” 
  &&  “ (linklist_node_node_next_3 = (xizi_sll_first_value (l2))) ” 
  &&  “ ((cons (linklist) (l1)) = (app (l1a) ((cons (next_2) (l1b))))) ” 
  &&  “ (next_2 <> 0) ” 
  &&  “ ((cons (linklist_pre) (l1)) = (cons (linklist_pre) (l0))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ (linklist_pre <> linklist_node_pre) ” 
  &&  “ (linklist_node_node_next = (xizi_sll_first_value (l2))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (l = (app (l1) ((cons (linklist_node_pre) (l2))))) ”
  &&  (xizi_sllseg linklist next_2 l1a )
  **  (xizi_sll_to_target r linklist_node l1b )
  **  (xizi_sll (xizi_sll_first_value (l2)) l2 )
).

Definition xizi_single_link_remove_node_return_wit_1 := 
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (l2: (@list Z)) (l1: (@list Z)) (l: (@list Z)) (linklist_node_node_next: Z) (linklist_node_node_next_2: Z) (linklist_node: Z) (next: Z) (l1a: (@list Z)) (node: Z) (l1b: (@list Z)) (linklist: Z) (l0: (@list Z)) (PreH1 : (next <> 0)) (PreH2 : (next = linklist_node)) (PreH3 : (next <> 0)) (PreH4 : ((cons (linklist) (l1)) = (app (l1a) ((cons (node) (l1b)))))) (PreH5 : (node <> 0)) (PreH6 : (linklist_node_node_next_2 = (xizi_sll_first_value (l2)))) (PreH7 : ((cons (linklist_pre) (l1)) = (cons (linklist_pre) (l0)))) (PreH8 : (linklist_pre <> 0)) (PreH9 : (linklist_node_pre <> 0)) (PreH10 : (linklist_pre <> linklist_node_pre)) (PreH11 : (linklist_node_node_next = (xizi_sll_first_value (l2)))) (PreH12 : (linklist_pre <> 0)) (PreH13 : (l = (app (l1) ((cons (linklist_node_pre) (l2)))))) ,
  ((&((next)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next_2)
  **  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next_2)
  **  (xizi_sllseg linklist node l1a )
  **  (xizi_sll_to_target next linklist_node l1b )
  **  (xizi_sll (xizi_sll_first_value (l2)) l2 )
|--
  EX (linklist_node_pre_node_next: Z) ,
  “ (linklist = linklist_pre) ” 
  &&  “ (linklist_node_pre_node_next = (xizi_sll_first_value (l2))) ”
  &&  (xizi_sll_head linklist_pre (app (l1) (l2)) )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre_node_next)
) \/
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (l2: (@list Z)) (l1: (@list Z)) (l: (@list Z)) (linklist_node_node_next: Z) (linklist_node_node_next_2: Z) (linklist_node: Z) (next: Z) (l1a: (@list Z)) (node: Z) (l1b: (@list Z)) (linklist: Z) (l0: (@list Z)) (PreH1 : (next <> 0)) (PreH2 : (next = linklist_node)) (PreH3 : (next <> 0)) (PreH4 : ((cons (linklist) (l1)) = (app (l1a) ((cons (node) (l1b)))))) (PreH5 : (node <> 0)) (PreH6 : (linklist_node_node_next_2 = (xizi_sll_first_value (l2)))) (PreH7 : ((cons (linklist_pre) (l1)) = (cons (linklist_pre) (l0)))) (PreH8 : (linklist_pre <> 0)) (PreH9 : (linklist_node_pre <> 0)) (PreH10 : (linklist_pre <> linklist_node_pre)) (PreH11 : (linklist_node_node_next = (xizi_sll_first_value (l2)))) (PreH12 : (linklist_pre <> 0)) (PreH13 : (l = (app (l1) ((cons (linklist_node_pre) (l2)))))) ,
  ((&((next)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next_2)
  **  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next_2)
  **  (xizi_sllseg linklist node l1a )
  **  (xizi_sll_to_target next linklist_node l1b )
  **  (xizi_sll (xizi_sll_first_value (l2)) l2 )
|--
  EX (q: Z) ,
  “ (linklist_pre <> 0) ” 
  &&  “ (linklist = linklist_pre) ”
  &&  (xizi_sll q (app (l1) (l2)) )
  **  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> q)
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> (xizi_sll_first_value (l2)))
).

Definition xizi_single_link_remove_node_return_wit_2 := 
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (l2: (@list Z)) (l1: (@list Z)) (l: (@list Z)) (linklist_node_node_next: Z) (linklist_node_node_next_2: Z) (linklist_node: Z) (next: Z) (l1a: (@list Z)) (node: Z) (l1b: (@list Z)) (linklist: Z) (l0: (@list Z)) (PreH1 : (next = 0)) (PreH2 : (next = 0)) (PreH3 : ((cons (linklist) (l1)) = (app (l1a) ((cons (node) (l1b)))))) (PreH4 : (node <> 0)) (PreH5 : (linklist_node_node_next_2 = (xizi_sll_first_value (l2)))) (PreH6 : ((cons (linklist_pre) (l1)) = (cons (linklist_pre) (l0)))) (PreH7 : (linklist_pre <> 0)) (PreH8 : (linklist_node_pre <> 0)) (PreH9 : (linklist_pre <> linklist_node_pre)) (PreH10 : (linklist_node_node_next = (xizi_sll_first_value (l2)))) (PreH11 : (linklist_pre <> 0)) (PreH12 : (l = (app (l1) ((cons (linklist_node_pre) (l2)))))) ,
  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist node l1a )
  **  (xizi_sll_to_target next linklist_node l1b )
  **  ((&((linklist_node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next_2)
  **  (xizi_sll (xizi_sll_first_value (l2)) l2 )
|--
  EX (linklist_node_pre_node_next: Z) ,
  “ (linklist = linklist_pre) ” 
  &&  “ (linklist_node_pre_node_next = (xizi_sll_first_value (l2))) ”
  &&  (xizi_sll_head linklist_pre (app (l1) (l2)) )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre_node_next)
) \/
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (l2: (@list Z)) (l1: (@list Z)) (l: (@list Z)) (linklist_node_node_next: Z) (linklist_node_node_next_2: Z) (linklist_node: Z) (next: Z) (l1a: (@list Z)) (node: Z) (l1b: (@list Z)) (linklist: Z) (l0: (@list Z)) (PreH1 : (next = 0)) (PreH2 : (next = 0)) (PreH3 : ((cons (linklist) (l1)) = (app (l1a) ((cons (node) (l1b)))))) (PreH4 : (node <> 0)) (PreH5 : (linklist_node_node_next_2 = (xizi_sll_first_value (l2)))) (PreH6 : ((cons (linklist_pre) (l1)) = (cons (linklist_pre) (l0)))) (PreH7 : (linklist_pre <> 0)) (PreH8 : (linklist_node_pre <> 0)) (PreH9 : (linklist_pre <> linklist_node_pre)) (PreH10 : (linklist_node_node_next = (xizi_sll_first_value (l2)))) (PreH11 : (linklist_pre <> 0)) (PreH12 : (l = (app (l1) ((cons (linklist_node_pre) (l2)))))) ,
  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist node l1a )
  **  (xizi_sll_to_target next linklist_node l1b )
  **  ((&((linklist_node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next_2)
  **  (xizi_sll (xizi_sll_first_value (l2)) l2 )
|--
  EX (q: Z) ,
  “ (linklist_pre <> 0) ” 
  &&  “ (linklist = linklist_pre) ”
  &&  (xizi_sll q (app (l1) (l2)) )
  **  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> q)
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> (xizi_sll_first_value (l2)))
).

Definition xizi_single_link_remove_node_partial_solve_wit_1_pure := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (l2: (@list Z)) (l1: (@list Z)) (l: (@list Z)) (PreH1 : (l = (app (l1) ((cons (linklist_node_pre) (l2)))))) ,
  ((( &( "linklist_node" ) )) # Ptr  |-> linklist_node_pre)
  **  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  (xizi_sll_head linklist_pre l )
|--
  “ (l = (app (l1) ((cons (linklist_node_pre) (l2))))) ”
.

Definition xizi_single_link_remove_node_partial_solve_wit_1_aux := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (l2: (@list Z)) (l1: (@list Z)) (l: (@list Z)) (PreH1 : (l = (app (l1) ((cons (linklist_node_pre) (l2)))))) ,
  (xizi_sll_head linklist_pre l )
|--
  “ (l = (app (l1) ((cons (linklist_node_pre) (l2))))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (l = (app (l1) ((cons (linklist_node_pre) (l2))))) ”
  &&  (xizi_sll_head linklist_pre l )
.

Definition xizi_single_link_remove_node_partial_solve_wit_1 := xizi_single_link_remove_node_partial_solve_wit_1_pure -> xizi_single_link_remove_node_partial_solve_wit_1_aux.

Definition xizi_single_link_remove_node_partial_solve_wit_2 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (l2: (@list Z)) (l1: (@list Z)) (l: (@list Z)) (linklist_node_node_next: Z) (linklist_node_node_next_2: Z) (linklist_node: Z) (next: Z) (l1a: (@list Z)) (node: Z) (l1b: (@list Z)) (linklist: Z) (l0: (@list Z)) (PreH1 : (next <> 0)) (PreH2 : (next = linklist_node)) (PreH3 : (next <> 0)) (PreH4 : ((cons (linklist) (l1)) = (app (l1a) ((cons (node) (l1b)))))) (PreH5 : (node <> 0)) (PreH6 : (linklist_node_node_next_2 = (xizi_sll_first_value (l2)))) (PreH7 : ((cons (linklist_pre) (l1)) = (cons (linklist_pre) (l0)))) (PreH8 : (linklist_pre <> 0)) (PreH9 : (linklist_node_pre <> 0)) (PreH10 : (linklist_pre <> linklist_node_pre)) (PreH11 : (linklist_node_node_next = (xizi_sll_first_value (l2)))) (PreH12 : (linklist_pre <> 0)) (PreH13 : (l = (app (l1) ((cons (linklist_node_pre) (l2)))))) ,
  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist node l1a )
  **  (xizi_sll_to_target next linklist_node l1b )
  **  ((&((linklist_node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next_2)
  **  (xizi_sll (xizi_sll_first_value (l2)) l2 )
|--
  “ (next <> 0) ” 
  &&  “ (next = linklist_node) ” 
  &&  “ (next <> 0) ” 
  &&  “ ((cons (linklist) (l1)) = (app (l1a) ((cons (node) (l1b))))) ” 
  &&  “ (node <> 0) ” 
  &&  “ (linklist_node_node_next_2 = (xizi_sll_first_value (l2))) ” 
  &&  “ ((cons (linklist_pre) (l1)) = (cons (linklist_pre) (l0))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ (linklist_pre <> linklist_node_pre) ” 
  &&  “ (linklist_node_node_next = (xizi_sll_first_value (l2))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (l = (app (l1) ((cons (linklist_node_pre) (l2))))) ”
  &&  ((&((next)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next_2)
  **  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist node l1a )
  **  (xizi_sll_to_target next linklist_node l1b )
  **  (xizi_sll (xizi_sll_first_value (l2)) l2 )
.

Definition xizi_single_link_remove_node_which_implies_wit_1 := 
(
forall (l2: (@list Z)) (l1: (@list Z)) (l: (@list Z)) (linklist_node: Z) (linklist: Z) (PreH1 : (l = (app (l1) ((cons (linklist_node) (l2)))))) ,
  (xizi_sll_head linklist l )
|--
  EX (linklist_node_node_next: Z) ,
  “ (linklist <> 0) ” 
  &&  “ (linklist_node <> 0) ” 
  &&  “ (linklist <> linklist_node) ” 
  &&  “ (linklist_node_node_next = (xizi_sll_first_value (l2))) ”
  &&  (xizi_sll_to_target linklist linklist_node (cons (linklist) (l1)) )
  **  ((&((linklist_node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next)
  **  (xizi_sll (xizi_sll_first_value (l2)) l2 )
) \/
(
forall (l2: (@list Z)) (l1: (@list Z)) (l: (@list Z)) (linklist_node: Z) (linklist: Z) (q: Z) (PreH1 : (linklist <> 0)) (PreH2 : (l = (app (l1) ((cons (linklist_node) (l2)))))) ,
  (xizi_sll q l )
  **  ((&((linklist)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> q)
|--
  “ (linklist <> linklist_node) ” 
  &&  “ (linklist_node <> 0) ”
  &&  (xizi_sll_to_target linklist linklist_node (cons (linklist) (l1)) )
  **  ((&((linklist_node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> (xizi_sll_first_value (l2)))
  **  (xizi_sll (xizi_sll_first_value (l2)) l2 )
).

Definition xizi_single_link_remove_node_which_implies_wit_1_split_goal_1 := 
forall (l2: (@list Z)) (l1: (@list Z)) (l: (@list Z)) (linklist_node: Z) (linklist: Z) (q: Z) (PreH1 : (linklist <> 0)) (PreH2 : (l = (app (l1) ((cons (linklist_node) (l2)))))) ,
  (xizi_sll q l )
  **  ((&((linklist)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> q)
|--
  “ (linklist <> linklist_node) ”
.

Definition xizi_single_link_remove_node_which_implies_wit_1_split_goal_2 := 
forall (l2: (@list Z)) (l1: (@list Z)) (l: (@list Z)) (linklist_node: Z) (linklist: Z) (q: Z) (PreH1 : (linklist <> 0)) (PreH2 : (l = (app (l1) ((cons (linklist_node) (l2)))))) ,
  (xizi_sll q l )
  **  ((&((linklist)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> q)
|--
  “ (linklist_node <> 0) ”
.

Definition xizi_single_link_remove_node_which_implies_wit_1_split_goal_spatial := 
forall (l2: (@list Z)) (l1: (@list Z)) (l: (@list Z)) (linklist_node: Z) (linklist: Z) (q: Z) (PreH1 : (linklist <> 0)) (PreH2 : (l = (app (l1) ((cons (linklist_node) (l2)))))) ,
  (xizi_sll q l )
  **  ((&((linklist)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> q)
|--
  (xizi_sll_to_target linklist linklist_node (cons (linklist) (l1)) )
  **  ((&((linklist_node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> (xizi_sll_first_value (l2)))
  **  (xizi_sll (xizi_sll_first_value (l2)) l2 )
.

Module Type VC_Correct.

Include xizi_single_link_Strategy_Correct.

Axiom proof_of_xizi_single_link_remove_node_safety_wit_1 : xizi_single_link_remove_node_safety_wit_1.
Axiom proof_of_xizi_single_link_remove_node_safety_wit_2 : xizi_single_link_remove_node_safety_wit_2.
Axiom proof_of_xizi_single_link_remove_node_safety_wit_3 : xizi_single_link_remove_node_safety_wit_3.
Axiom proof_of_xizi_single_link_remove_node_safety_wit_4 : xizi_single_link_remove_node_safety_wit_4.
Axiom proof_of_xizi_single_link_remove_node_entail_wit_1 : xizi_single_link_remove_node_entail_wit_1.
Axiom proof_of_xizi_single_link_remove_node_entail_wit_2 : xizi_single_link_remove_node_entail_wit_2.
Axiom proof_of_xizi_single_link_remove_node_return_wit_1 : xizi_single_link_remove_node_return_wit_1.
Axiom proof_of_xizi_single_link_remove_node_return_wit_2 : xizi_single_link_remove_node_return_wit_2.
Axiom proof_of_xizi_single_link_remove_node_partial_solve_wit_1_pure : xizi_single_link_remove_node_partial_solve_wit_1_pure.
Axiom proof_of_xizi_single_link_remove_node_partial_solve_wit_1 : xizi_single_link_remove_node_partial_solve_wit_1.
Axiom proof_of_xizi_single_link_remove_node_partial_solve_wit_2 : xizi_single_link_remove_node_partial_solve_wit_2.
Axiom proof_of_xizi_single_link_remove_node_which_implies_wit_1 : xizi_single_link_remove_node_which_implies_wit_1.

End VC_Correct.
