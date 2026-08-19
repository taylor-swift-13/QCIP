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

(*----- Function xizi_single_link_remove_node -----*)

Definition xizi_single_link_remove_node_safety_wit_1 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (l2_strong_spec: (@list Z)) (l1_strong_spec: (@list Z)) (l_strong_spec: (@list Z)) (linklist_node_node_next: Z) (linklist_node_node_next_2: Z) (next: Z) (l1a: (@list Z)) (node: Z) (l1b: (@list Z)) (l0: (@list Z)) (PreH1 : (next = linklist_node_pre)) (PreH2 : (next <> 0)) (PreH3 : ((cons (linklist_pre) (l1_strong_spec)) = (app (l1a) ((cons (node) (l1b)))))) (PreH4 : (node <> 0)) (PreH5 : (linklist_node_node_next_2 = (xizi_sll_first_value (l2_strong_spec)))) (PreH6 : ((cons (linklist_pre) (l1_strong_spec)) = (cons (linklist_pre) (l0)))) (PreH7 : (linklist_pre <> 0)) (PreH8 : (linklist_node_pre <> 0)) (PreH9 : (linklist_pre <> linklist_node_pre)) (PreH10 : (linklist_node_node_next = (xizi_sll_first_value (l2_strong_spec)))) (PreH11 : (linklist_pre <> 0)) (PreH12 : (l_strong_spec = (app (l1_strong_spec) ((cons (linklist_node_pre) (l2_strong_spec)))))) ,
  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  ((( &( "linklist_node" ) )) # Ptr  |-> linklist_node_pre)
  **  ((( &( "node" ) )) # Ptr  |-> node)
  **  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist_pre node l1a )
  **  (xizi_sll_to_target next linklist_node_pre l1b )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next_2)
  **  (xizi_sll (xizi_sll_first_value (l2_strong_spec)) l2_strong_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_single_link_remove_node_safety_wit_2 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (l2_strong_spec: (@list Z)) (l1_strong_spec: (@list Z)) (l_strong_spec: (@list Z)) (linklist_node_node_next: Z) (linklist_node_node_next_2: Z) (next: Z) (l1a: (@list Z)) (node: Z) (l1b: (@list Z)) (l0: (@list Z)) (PreH1 : (next = 0)) (PreH2 : ((cons (linklist_pre) (l1_strong_spec)) = (app (l1a) ((cons (node) (l1b)))))) (PreH3 : (node <> 0)) (PreH4 : (linklist_node_node_next_2 = (xizi_sll_first_value (l2_strong_spec)))) (PreH5 : ((cons (linklist_pre) (l1_strong_spec)) = (cons (linklist_pre) (l0)))) (PreH6 : (linklist_pre <> 0)) (PreH7 : (linklist_node_pre <> 0)) (PreH8 : (linklist_pre <> linklist_node_pre)) (PreH9 : (linklist_node_node_next = (xizi_sll_first_value (l2_strong_spec)))) (PreH10 : (linklist_pre <> 0)) (PreH11 : (l_strong_spec = (app (l1_strong_spec) ((cons (linklist_node_pre) (l2_strong_spec)))))) ,
  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  ((( &( "linklist_node" ) )) # Ptr  |-> linklist_node_pre)
  **  ((( &( "node" ) )) # Ptr  |-> node)
  **  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist_pre node l1a )
  **  (xizi_sll_to_target next linklist_node_pre l1b )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next_2)
  **  (xizi_sll (xizi_sll_first_value (l2_strong_spec)) l2_strong_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_single_link_remove_node_safety_wit_3 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (l2_strong_spec: (@list Z)) (l1_strong_spec: (@list Z)) (l_strong_spec: (@list Z)) (linklist_node_node_next: Z) (linklist_node_node_next_2: Z) (next: Z) (l1a: (@list Z)) (node: Z) (l1b: (@list Z)) (l0: (@list Z)) (PreH1 : (next = 0)) (PreH2 : (next = linklist_node_pre)) (PreH3 : (next <> 0)) (PreH4 : ((cons (linklist_pre) (l1_strong_spec)) = (app (l1a) ((cons (node) (l1b)))))) (PreH5 : (node <> 0)) (PreH6 : (linklist_node_node_next_2 = (xizi_sll_first_value (l2_strong_spec)))) (PreH7 : ((cons (linklist_pre) (l1_strong_spec)) = (cons (linklist_pre) (l0)))) (PreH8 : (linklist_pre <> 0)) (PreH9 : (linklist_node_pre <> 0)) (PreH10 : (linklist_pre <> linklist_node_pre)) (PreH11 : (linklist_node_node_next = (xizi_sll_first_value (l2_strong_spec)))) (PreH12 : (linklist_pre <> 0)) (PreH13 : (l_strong_spec = (app (l1_strong_spec) ((cons (linklist_node_pre) (l2_strong_spec)))))) ,
  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  ((( &( "linklist_node" ) )) # Ptr  |-> linklist_node_pre)
  **  ((( &( "node" ) )) # Ptr  |-> node)
  **  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist_pre node l1a )
  **  (xizi_sll_to_target next linklist_node_pre l1b )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next_2)
  **  (xizi_sll (xizi_sll_first_value (l2_strong_spec)) l2_strong_spec )
|--
  “ False ”
.

Definition xizi_single_link_remove_node_safety_wit_4 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (l2_strong_spec: (@list Z)) (l1_strong_spec: (@list Z)) (l_strong_spec: (@list Z)) (linklist_node_node_next: Z) (linklist_node_node_next_2: Z) (next: Z) (l1a: (@list Z)) (node: Z) (l1b: (@list Z)) (l0: (@list Z)) (PreH1 : (next <> 0)) (PreH2 : (next = 0)) (PreH3 : ((cons (linklist_pre) (l1_strong_spec)) = (app (l1a) ((cons (node) (l1b)))))) (PreH4 : (node <> 0)) (PreH5 : (linklist_node_node_next_2 = (xizi_sll_first_value (l2_strong_spec)))) (PreH6 : ((cons (linklist_pre) (l1_strong_spec)) = (cons (linklist_pre) (l0)))) (PreH7 : (linklist_pre <> 0)) (PreH8 : (linklist_node_pre <> 0)) (PreH9 : (linklist_pre <> linklist_node_pre)) (PreH10 : (linklist_node_node_next = (xizi_sll_first_value (l2_strong_spec)))) (PreH11 : (linklist_pre <> 0)) (PreH12 : (l_strong_spec = (app (l1_strong_spec) ((cons (linklist_node_pre) (l2_strong_spec)))))) ,
  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  ((( &( "linklist_node" ) )) # Ptr  |-> linklist_node_pre)
  **  ((( &( "node" ) )) # Ptr  |-> node)
  **  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist_pre node l1a )
  **  (xizi_sll_to_target next linklist_node_pre l1b )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next_2)
  **  (xizi_sll (xizi_sll_first_value (l2_strong_spec)) l2_strong_spec )
|--
  “ False ”
.

Definition xizi_single_link_remove_node_entail_wit_1 := 
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (l2_strong_spec: (@list Z)) (l1_strong_spec: (@list Z)) (l_strong_spec: (@list Z)) (linklist_node_node_next: Z) (PreH1 : (linklist_pre <> 0)) (PreH2 : (linklist_node_pre <> 0)) (PreH3 : (linklist_pre <> linklist_node_pre)) (PreH4 : (linklist_node_node_next = (xizi_sll_first_value (l2_strong_spec)))) (PreH5 : (linklist_pre <> 0)) (PreH6 : (l_strong_spec = (app (l1_strong_spec) ((cons (linklist_node_pre) (l2_strong_spec)))))) ,
  (xizi_sll_to_target linklist_pre linklist_node_pre (cons (linklist_pre) (l1_strong_spec)) )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next)
  **  (xizi_sll (xizi_sll_first_value (l2_strong_spec)) l2_strong_spec )
|--
  EX (linklist_node_node_next_2: Z)  (next: Z)  (l1a: (@list Z))  (l1b: (@list Z))  (l0: (@list Z)) ,
  “ ((cons (linklist_pre) (l1_strong_spec)) = (app (l1a) ((cons (linklist_pre) (l1b))))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_node_node_next_2 = (xizi_sll_first_value (l2_strong_spec))) ” 
  &&  “ ((cons (linklist_pre) (l1_strong_spec)) = (cons (linklist_pre) (l0))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ (linklist_pre <> linklist_node_pre) ” 
  &&  “ (linklist_node_node_next = (xizi_sll_first_value (l2_strong_spec))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (l_strong_spec = (app (l1_strong_spec) ((cons (linklist_node_pre) (l2_strong_spec))))) ”
  &&  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist_pre linklist_pre l1a )
  **  (xizi_sll_to_target next linklist_node_pre l1b )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next_2)
  **  (xizi_sll (xizi_sll_first_value (l2_strong_spec)) l2_strong_spec )
) \/
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (l2_strong_spec: (@list Z)) (l1_strong_spec: (@list Z)) (l_strong_spec: (@list Z)) (linklist_node_node_next: Z) (r: Z) (l0_2: (@list Z)) (PreH1 : ((cons (linklist_pre) (l1_strong_spec)) = (cons (linklist_pre) (l0_2)))) (PreH2 : (linklist_pre <> 0)) (PreH3 : (linklist_node_pre <> 0)) (PreH4 : (linklist_pre <> linklist_node_pre)) (PreH5 : (linklist_node_node_next = (xizi_sll_first_value (l2_strong_spec)))) (PreH6 : (linklist_pre <> 0)) (PreH7 : (l_strong_spec = (app (l1_strong_spec) ((cons (linklist_node_pre) (l2_strong_spec)))))) ,
  (xizi_sll_to_target r linklist_node_pre l0_2 )
  **  (xizi_sll (xizi_sll_first_value (l2_strong_spec)) l2_strong_spec )
|--
  EX (l1b: (@list Z))  (l0: (@list Z)) ,
  “ (linklist_node_node_next = (xizi_sll_first_value (l2_strong_spec))) ” 
  &&  “ (linklist_node_node_next = (xizi_sll_first_value (l2_strong_spec))) ” 
  &&  “ ((cons (linklist_pre) (l1_strong_spec)) = (app ((@nil Z)) ((cons (linklist_pre) (l1b))))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ ((cons (linklist_pre) (l1_strong_spec)) = (cons (linklist_pre) (l0))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ (linklist_pre <> linklist_node_pre) ” 
  &&  “ (linklist_node_node_next = (xizi_sll_first_value (l2_strong_spec))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (l_strong_spec = (app (l1_strong_spec) ((cons (linklist_node_pre) (l2_strong_spec))))) ”
  &&  (xizi_sll_to_target r linklist_node_pre l1b )
  **  (xizi_sll (xizi_sll_first_value (l2_strong_spec)) l2_strong_spec )
).

Definition xizi_single_link_remove_node_entail_wit_2 := 
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (l2_strong_spec: (@list Z)) (l1_strong_spec: (@list Z)) (l_strong_spec: (@list Z)) (linklist_node_node_next: Z) (linklist_node_node_next_3: Z) (next_2: Z) (l1a_2: (@list Z)) (node: Z) (l1b_2: (@list Z)) (l0_2: (@list Z)) (PreH1 : (next_2 <> linklist_node_pre)) (PreH2 : (next_2 <> 0)) (PreH3 : ((cons (linklist_pre) (l1_strong_spec)) = (app (l1a_2) ((cons (node) (l1b_2)))))) (PreH4 : (node <> 0)) (PreH5 : (linklist_node_node_next_3 = (xizi_sll_first_value (l2_strong_spec)))) (PreH6 : ((cons (linklist_pre) (l1_strong_spec)) = (cons (linklist_pre) (l0_2)))) (PreH7 : (linklist_pre <> 0)) (PreH8 : (linklist_node_pre <> 0)) (PreH9 : (linklist_pre <> linklist_node_pre)) (PreH10 : (linklist_node_node_next = (xizi_sll_first_value (l2_strong_spec)))) (PreH11 : (linklist_pre <> 0)) (PreH12 : (l_strong_spec = (app (l1_strong_spec) ((cons (linklist_node_pre) (l2_strong_spec)))))) ,
  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_2)
  **  (xizi_sllseg linklist_pre node l1a_2 )
  **  (xizi_sll_to_target next_2 linklist_node_pre l1b_2 )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next_3)
  **  (xizi_sll (xizi_sll_first_value (l2_strong_spec)) l2_strong_spec )
|--
  EX (linklist_node_node_next_2: Z)  (next: Z)  (l1a: (@list Z))  (l1b: (@list Z))  (l0: (@list Z)) ,
  “ ((cons (linklist_pre) (l1_strong_spec)) = (app (l1a) ((cons (next_2) (l1b))))) ” 
  &&  “ (next_2 <> 0) ” 
  &&  “ (linklist_node_node_next_2 = (xizi_sll_first_value (l2_strong_spec))) ” 
  &&  “ ((cons (linklist_pre) (l1_strong_spec)) = (cons (linklist_pre) (l0))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ (linklist_pre <> linklist_node_pre) ” 
  &&  “ (linklist_node_node_next = (xizi_sll_first_value (l2_strong_spec))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (l_strong_spec = (app (l1_strong_spec) ((cons (linklist_node_pre) (l2_strong_spec))))) ”
  &&  ((&((next_2)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist_pre next_2 l1a )
  **  (xizi_sll_to_target next linklist_node_pre l1b )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next_2)
  **  (xizi_sll (xizi_sll_first_value (l2_strong_spec)) l2_strong_spec )
) \/
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (l2_strong_spec: (@list Z)) (l1_strong_spec: (@list Z)) (l_strong_spec: (@list Z)) (linklist_node_node_next: Z) (linklist_node_node_next_3: Z) (next_2: Z) (l1a_2: (@list Z)) (node: Z) (l1b_2: (@list Z)) (l0_2: (@list Z)) (r: Z) (l0_3: (@list Z)) (PreH1 : (l1b_2 = (cons (next_2) (l0_3)))) (PreH2 : (next_2 <> linklist_node_pre)) (PreH3 : (next_2 <> 0)) (PreH4 : ((cons (linklist_pre) (l1_strong_spec)) = (app (l1a_2) ((cons (node) (l1b_2)))))) (PreH5 : (node <> 0)) (PreH6 : (linklist_node_node_next_3 = (xizi_sll_first_value (l2_strong_spec)))) (PreH7 : ((cons (linklist_pre) (l1_strong_spec)) = (cons (linklist_pre) (l0_2)))) (PreH8 : (linklist_pre <> 0)) (PreH9 : (linklist_node_pre <> 0)) (PreH10 : (linklist_pre <> linklist_node_pre)) (PreH11 : (linklist_node_node_next = (xizi_sll_first_value (l2_strong_spec)))) (PreH12 : (linklist_pre <> 0)) (PreH13 : (l_strong_spec = (app (l1_strong_spec) ((cons (linklist_node_pre) (l2_strong_spec)))))) ,
  (xizi_sll_to_target r linklist_node_pre l0_3 )
  **  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_2)
  **  (xizi_sllseg linklist_pre node l1a_2 )
  **  (xizi_sll (xizi_sll_first_value (l2_strong_spec)) l2_strong_spec )
|--
  EX (l1a: (@list Z))  (l1b: (@list Z))  (l0: (@list Z)) ,
  “ (linklist_node_node_next_3 = (xizi_sll_first_value (l2_strong_spec))) ” 
  &&  “ (linklist_node_node_next_3 = (xizi_sll_first_value (l2_strong_spec))) ” 
  &&  “ ((cons (linklist_pre) (l1_strong_spec)) = (app (l1a) ((cons (next_2) (l1b))))) ” 
  &&  “ (next_2 <> 0) ” 
  &&  “ ((cons (linklist_pre) (l1_strong_spec)) = (cons (linklist_pre) (l0))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ (linklist_pre <> linklist_node_pre) ” 
  &&  “ (linklist_node_node_next = (xizi_sll_first_value (l2_strong_spec))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (l_strong_spec = (app (l1_strong_spec) ((cons (linklist_node_pre) (l2_strong_spec))))) ”
  &&  (xizi_sllseg linklist_pre next_2 l1a )
  **  (xizi_sll_to_target r linklist_node_pre l1b )
  **  (xizi_sll (xizi_sll_first_value (l2_strong_spec)) l2_strong_spec )
).

Definition xizi_single_link_remove_node_return_wit_1 := 
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (l2_strong_spec: (@list Z)) (l1_strong_spec: (@list Z)) (l_strong_spec: (@list Z)) (linklist_node_node_next: Z) (linklist_node_node_next_2: Z) (next: Z) (l1a: (@list Z)) (node: Z) (l1b: (@list Z)) (l0: (@list Z)) (PreH1 : (next <> 0)) (PreH2 : (next = linklist_node_pre)) (PreH3 : (next <> 0)) (PreH4 : ((cons (linklist_pre) (l1_strong_spec)) = (app (l1a) ((cons (node) (l1b)))))) (PreH5 : (node <> 0)) (PreH6 : (linklist_node_node_next_2 = (xizi_sll_first_value (l2_strong_spec)))) (PreH7 : ((cons (linklist_pre) (l1_strong_spec)) = (cons (linklist_pre) (l0)))) (PreH8 : (linklist_pre <> 0)) (PreH9 : (linklist_node_pre <> 0)) (PreH10 : (linklist_pre <> linklist_node_pre)) (PreH11 : (linklist_node_node_next = (xizi_sll_first_value (l2_strong_spec)))) (PreH12 : (linklist_pre <> 0)) (PreH13 : (l_strong_spec = (app (l1_strong_spec) ((cons (linklist_node_pre) (l2_strong_spec)))))) ,
  ((&((next)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next_2)
  **  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next_2)
  **  (xizi_sllseg linklist_pre node l1a )
  **  (xizi_sll_to_target next linklist_node_pre l1b )
  **  (xizi_sll (xizi_sll_first_value (l2_strong_spec)) l2_strong_spec )
|--
  EX (linklist_node_pre_node_next: Z) ,
  “ (linklist_pre = linklist_pre) ” 
  &&  “ (linklist_node_pre_node_next = (xizi_sll_first_value (l2_strong_spec))) ”
  &&  (xizi_sll_head linklist_pre (app (l1_strong_spec) (l2_strong_spec)) )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre_node_next)
) \/
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (l2_strong_spec: (@list Z)) (l1_strong_spec: (@list Z)) (l_strong_spec: (@list Z)) (linklist_node_node_next: Z) (linklist_node_node_next_2: Z) (next: Z) (l1a: (@list Z)) (node: Z) (l1b: (@list Z)) (l0: (@list Z)) (PreH1 : (next <> 0)) (PreH2 : (next = linklist_node_pre)) (PreH3 : (next <> 0)) (PreH4 : ((cons (linklist_pre) (l1_strong_spec)) = (app (l1a) ((cons (node) (l1b)))))) (PreH5 : (node <> 0)) (PreH6 : (linklist_node_node_next_2 = (xizi_sll_first_value (l2_strong_spec)))) (PreH7 : ((cons (linklist_pre) (l1_strong_spec)) = (cons (linklist_pre) (l0)))) (PreH8 : (linklist_pre <> 0)) (PreH9 : (linklist_node_pre <> 0)) (PreH10 : (linklist_pre <> linklist_node_pre)) (PreH11 : (linklist_node_node_next = (xizi_sll_first_value (l2_strong_spec)))) (PreH12 : (linklist_pre <> 0)) (PreH13 : (l_strong_spec = (app (l1_strong_spec) ((cons (linklist_node_pre) (l2_strong_spec)))))) ,
  ((&((next)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next_2)
  **  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next_2)
  **  (xizi_sllseg linklist_pre node l1a )
  **  (xizi_sll_to_target next linklist_node_pre l1b )
  **  (xizi_sll (xizi_sll_first_value (l2_strong_spec)) l2_strong_spec )
|--
  EX (q: Z) ,
  “ (linklist_pre <> 0) ”
  &&  (xizi_sll q (app (l1_strong_spec) (l2_strong_spec)) )
  **  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> q)
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> (xizi_sll_first_value (l2_strong_spec)))
).

Definition xizi_single_link_remove_node_return_wit_2 := 
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (l2_strong_spec: (@list Z)) (l1_strong_spec: (@list Z)) (l_strong_spec: (@list Z)) (linklist_node_node_next: Z) (linklist_node_node_next_2: Z) (next: Z) (l1a: (@list Z)) (node: Z) (l1b: (@list Z)) (l0: (@list Z)) (PreH1 : (next = 0)) (PreH2 : (next = 0)) (PreH3 : ((cons (linklist_pre) (l1_strong_spec)) = (app (l1a) ((cons (node) (l1b)))))) (PreH4 : (node <> 0)) (PreH5 : (linklist_node_node_next_2 = (xizi_sll_first_value (l2_strong_spec)))) (PreH6 : ((cons (linklist_pre) (l1_strong_spec)) = (cons (linklist_pre) (l0)))) (PreH7 : (linklist_pre <> 0)) (PreH8 : (linklist_node_pre <> 0)) (PreH9 : (linklist_pre <> linklist_node_pre)) (PreH10 : (linklist_node_node_next = (xizi_sll_first_value (l2_strong_spec)))) (PreH11 : (linklist_pre <> 0)) (PreH12 : (l_strong_spec = (app (l1_strong_spec) ((cons (linklist_node_pre) (l2_strong_spec)))))) ,
  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist_pre node l1a )
  **  (xizi_sll_to_target next linklist_node_pre l1b )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next_2)
  **  (xizi_sll (xizi_sll_first_value (l2_strong_spec)) l2_strong_spec )
|--
  EX (linklist_node_pre_node_next: Z) ,
  “ (linklist_pre = linklist_pre) ” 
  &&  “ (linklist_node_pre_node_next = (xizi_sll_first_value (l2_strong_spec))) ”
  &&  (xizi_sll_head linklist_pre (app (l1_strong_spec) (l2_strong_spec)) )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre_node_next)
) \/
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (l2_strong_spec: (@list Z)) (l1_strong_spec: (@list Z)) (l_strong_spec: (@list Z)) (linklist_node_node_next: Z) (linklist_node_node_next_2: Z) (next: Z) (l1a: (@list Z)) (node: Z) (l1b: (@list Z)) (l0: (@list Z)) (PreH1 : (next = 0)) (PreH2 : (next = 0)) (PreH3 : ((cons (linklist_pre) (l1_strong_spec)) = (app (l1a) ((cons (node) (l1b)))))) (PreH4 : (node <> 0)) (PreH5 : (linklist_node_node_next_2 = (xizi_sll_first_value (l2_strong_spec)))) (PreH6 : ((cons (linklist_pre) (l1_strong_spec)) = (cons (linklist_pre) (l0)))) (PreH7 : (linklist_pre <> 0)) (PreH8 : (linklist_node_pre <> 0)) (PreH9 : (linklist_pre <> linklist_node_pre)) (PreH10 : (linklist_node_node_next = (xizi_sll_first_value (l2_strong_spec)))) (PreH11 : (linklist_pre <> 0)) (PreH12 : (l_strong_spec = (app (l1_strong_spec) ((cons (linklist_node_pre) (l2_strong_spec)))))) ,
  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist_pre node l1a )
  **  (xizi_sll_to_target next linklist_node_pre l1b )
  **  (xizi_sll (xizi_sll_first_value (l2_strong_spec)) l2_strong_spec )
|--
  EX (q: Z) ,
  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_node_node_next_2 = (xizi_sll_first_value (l2_strong_spec))) ” 
  &&  “ (linklist_node_node_next_2 = (xizi_sll_first_value (l2_strong_spec))) ”
  &&  (xizi_sll q (app (l1_strong_spec) (l2_strong_spec)) )
  **  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> q)
).

Definition xizi_single_link_remove_node_partial_solve_wit_1_pure := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (l2_strong_spec: (@list Z)) (l1_strong_spec: (@list Z)) (l_strong_spec: (@list Z)) (PreH1 : (l_strong_spec = (app (l1_strong_spec) ((cons (linklist_node_pre) (l2_strong_spec)))))) ,
  ((( &( "linklist_node" ) )) # Ptr  |-> linklist_node_pre)
  **  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  (xizi_sll_head linklist_pre l_strong_spec )
|--
  “ (l_strong_spec = (app (l1_strong_spec) ((cons (linklist_node_pre) (l2_strong_spec))))) ”
.

Definition xizi_single_link_remove_node_partial_solve_wit_1_aux := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (l2_strong_spec: (@list Z)) (l1_strong_spec: (@list Z)) (l_strong_spec: (@list Z)) (PreH1 : (l_strong_spec = (app (l1_strong_spec) ((cons (linklist_node_pre) (l2_strong_spec)))))) ,
  (xizi_sll_head linklist_pre l_strong_spec )
|--
  “ (l_strong_spec = (app (l1_strong_spec) ((cons (linklist_node_pre) (l2_strong_spec))))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (l_strong_spec = (app (l1_strong_spec) ((cons (linklist_node_pre) (l2_strong_spec))))) ”
  &&  (xizi_sll_head linklist_pre l_strong_spec )
.

Definition xizi_single_link_remove_node_partial_solve_wit_1 := xizi_single_link_remove_node_partial_solve_wit_1_pure -> xizi_single_link_remove_node_partial_solve_wit_1_aux.

Definition xizi_single_link_remove_node_partial_solve_wit_2 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (l2_strong_spec: (@list Z)) (l1_strong_spec: (@list Z)) (l_strong_spec: (@list Z)) (linklist_node_node_next: Z) (linklist_node_node_next_2: Z) (next: Z) (l1a: (@list Z)) (node: Z) (l1b: (@list Z)) (l0: (@list Z)) (PreH1 : (next <> 0)) (PreH2 : (next = linklist_node_pre)) (PreH3 : (next <> 0)) (PreH4 : ((cons (linklist_pre) (l1_strong_spec)) = (app (l1a) ((cons (node) (l1b)))))) (PreH5 : (node <> 0)) (PreH6 : (linklist_node_node_next_2 = (xizi_sll_first_value (l2_strong_spec)))) (PreH7 : ((cons (linklist_pre) (l1_strong_spec)) = (cons (linklist_pre) (l0)))) (PreH8 : (linklist_pre <> 0)) (PreH9 : (linklist_node_pre <> 0)) (PreH10 : (linklist_pre <> linklist_node_pre)) (PreH11 : (linklist_node_node_next = (xizi_sll_first_value (l2_strong_spec)))) (PreH12 : (linklist_pre <> 0)) (PreH13 : (l_strong_spec = (app (l1_strong_spec) ((cons (linklist_node_pre) (l2_strong_spec)))))) ,
  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist_pre node l1a )
  **  (xizi_sll_to_target next linklist_node_pre l1b )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next_2)
  **  (xizi_sll (xizi_sll_first_value (l2_strong_spec)) l2_strong_spec )
|--
  “ (next <> 0) ” 
  &&  “ (next = linklist_node_pre) ” 
  &&  “ (next <> 0) ” 
  &&  “ ((cons (linklist_pre) (l1_strong_spec)) = (app (l1a) ((cons (node) (l1b))))) ” 
  &&  “ (node <> 0) ” 
  &&  “ (linklist_node_node_next_2 = (xizi_sll_first_value (l2_strong_spec))) ” 
  &&  “ ((cons (linklist_pre) (l1_strong_spec)) = (cons (linklist_pre) (l0))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ (linklist_pre <> linklist_node_pre) ” 
  &&  “ (linklist_node_node_next = (xizi_sll_first_value (l2_strong_spec))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (l_strong_spec = (app (l1_strong_spec) ((cons (linklist_node_pre) (l2_strong_spec))))) ”
  &&  ((&((next)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next_2)
  **  ((&((node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist_pre node l1a )
  **  (xizi_sll_to_target next linklist_node_pre l1b )
  **  (xizi_sll (xizi_sll_first_value (l2_strong_spec)) l2_strong_spec )
.

Definition xizi_single_link_remove_node_which_implies_wit_1 := 
(
forall (l2_strong_spec: (@list Z)) (l1_strong_spec: (@list Z)) (l_strong_spec: (@list Z)) (linklist_node: Z) (linklist: Z) (PreH1 : (l_strong_spec = (app (l1_strong_spec) ((cons (linklist_node) (l2_strong_spec)))))) ,
  (xizi_sll_head linklist l_strong_spec )
|--
  EX (linklist_node_node_next: Z) ,
  “ (linklist <> 0) ” 
  &&  “ (linklist_node <> 0) ” 
  &&  “ (linklist <> linklist_node) ” 
  &&  “ (linklist_node_node_next = (xizi_sll_first_value (l2_strong_spec))) ”
  &&  (xizi_sll_to_target linklist linklist_node (cons (linklist) (l1_strong_spec)) )
  **  ((&((linklist_node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_node_next)
  **  (xizi_sll (xizi_sll_first_value (l2_strong_spec)) l2_strong_spec )
) \/
(
forall (l2_strong_spec: (@list Z)) (l1_strong_spec: (@list Z)) (l_strong_spec: (@list Z)) (linklist_node: Z) (linklist: Z) (q: Z) (PreH1 : (linklist <> 0)) (PreH2 : (l_strong_spec = (app (l1_strong_spec) ((cons (linklist_node) (l2_strong_spec)))))) ,
  (xizi_sll q l_strong_spec )
  **  ((&((linklist)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> q)
|--
  “ (linklist <> linklist_node) ” 
  &&  “ (linklist_node <> 0) ”
  &&  (xizi_sll_to_target linklist linklist_node (cons (linklist) (l1_strong_spec)) )
  **  ((&((linklist_node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> (xizi_sll_first_value (l2_strong_spec)))
  **  (xizi_sll (xizi_sll_first_value (l2_strong_spec)) l2_strong_spec )
).

Definition xizi_single_link_remove_node_which_implies_wit_1_split_goal_1 := 
forall (l2_strong_spec: (@list Z)) (l1_strong_spec: (@list Z)) (l_strong_spec: (@list Z)) (linklist_node: Z) (linklist: Z) (q: Z) (PreH1 : (linklist <> 0)) (PreH2 : (l_strong_spec = (app (l1_strong_spec) ((cons (linklist_node) (l2_strong_spec)))))) ,
  (xizi_sll q l_strong_spec )
  **  ((&((linklist)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> q)
|--
  “ (linklist <> linklist_node) ”
.

Definition xizi_single_link_remove_node_which_implies_wit_1_split_goal_2 := 
forall (l2_strong_spec: (@list Z)) (l1_strong_spec: (@list Z)) (l_strong_spec: (@list Z)) (linklist_node: Z) (linklist: Z) (q: Z) (PreH1 : (linklist <> 0)) (PreH2 : (l_strong_spec = (app (l1_strong_spec) ((cons (linklist_node) (l2_strong_spec)))))) ,
  (xizi_sll q l_strong_spec )
  **  ((&((linklist)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> q)
|--
  “ (linklist_node <> 0) ”
.

Definition xizi_single_link_remove_node_which_implies_wit_1_split_goal_spatial := 
forall (l2_strong_spec: (@list Z)) (l1_strong_spec: (@list Z)) (l_strong_spec: (@list Z)) (linklist_node: Z) (linklist: Z) (q: Z) (PreH1 : (linklist <> 0)) (PreH2 : (l_strong_spec = (app (l1_strong_spec) ((cons (linklist_node) (l2_strong_spec)))))) ,
  (xizi_sll q l_strong_spec )
  **  ((&((linklist)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> q)
|--
  (xizi_sll_to_target linklist linklist_node (cons (linklist) (l1_strong_spec)) )
  **  ((&((linklist_node)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> (xizi_sll_first_value (l2_strong_spec)))
  **  (xizi_sll (xizi_sll_first_value (l2_strong_spec)) l2_strong_spec )
.

Definition xizi_single_link_remove_node_derive_remove_tail_spec_by_strong_spec := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (prefix_remove_tail_spec: (@list Z)) ,
  (xizi_sll_head linklist_pre (app (prefix_remove_tail_spec) ((cons (linklist_node_pre) (nil)))) )
|--
EX (l_strong_spec: (@list Z)) (l1_strong_spec: (@list Z)) (l2_strong_spec: (@list Z)) ,
  (“ (l_strong_spec = (app (l1_strong_spec) ((cons (linklist_node_pre) (l2_strong_spec))))) ”
  &&  (xizi_sll_head linklist_pre l_strong_spec ))
  **
  ((EX linklist_node_callee_node_next retval,
  “ (retval = linklist_pre) ” 
  &&  “ (linklist_node_callee_node_next = (xizi_sll_first_value (l2_strong_spec))) ”
  &&  (xizi_sll_head linklist_pre (app (l1_strong_spec) (l2_strong_spec)) )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_callee_node_next))
  -*
  ((xizi_sll_head linklist_pre prefix_remove_tail_spec )
  **  (xizi_sll_node linklist_node_pre )))
.

Definition xizi_single_link_remove_node_derive_remove_front_spec_by_strong_spec := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (suffix_remove_front_spec: (@list Z)) ,
  (xizi_sll_head linklist_pre (cons (linklist_node_pre) (suffix_remove_front_spec)) )
|--
EX (l_strong_spec: (@list Z)) (l1_strong_spec: (@list Z)) (l2_strong_spec: (@list Z)) ,
  (“ (l_strong_spec = (app (l1_strong_spec) ((cons (linklist_node_pre) (l2_strong_spec))))) ”
  &&  (xizi_sll_head linklist_pre l_strong_spec ))
  **
  ((EX linklist_node_callee_node_next retval,
  “ (retval = linklist_pre) ” 
  &&  “ (linklist_node_callee_node_next = (xizi_sll_first_value (l2_strong_spec))) ”
  &&  (xizi_sll_head linklist_pre (app (l1_strong_spec) (l2_strong_spec)) )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_callee_node_next))
  -*
  ((xizi_sll_head linklist_pre suffix_remove_front_spec )
  **  (xizi_sll_node linklist_node_pre )))
.

Definition xizi_single_link_remove_node_derive_remove_member_spec_by_strong_spec := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (l_remove_member_spec: (@list Z)) ,
  “ (In linklist_node_pre l_remove_member_spec ) ”
  &&  (xizi_sll_head linklist_pre l_remove_member_spec )
|--
EX (l_strong_spec: (@list Z)) (l1_strong_spec: (@list Z)) (l2_strong_spec: (@list Z)) ,
  (“ (l_strong_spec = (app (l1_strong_spec) ((cons (linklist_node_pre) (l2_strong_spec))))) ”
  &&  (xizi_sll_head linklist_pre l_strong_spec ))
  **
  ((EX linklist_node_callee_node_next retval,
  “ (retval = linklist_pre) ” 
  &&  “ (linklist_node_callee_node_next = (xizi_sll_first_value (l2_strong_spec))) ”
  &&  (xizi_sll_head linklist_pre (app (l1_strong_spec) (l2_strong_spec)) )
  **  ((&((linklist_node_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_callee_node_next))
  -*
  ((xizi_sll_head linklist_pre (xizi_sll_remove_first (linklist_node_pre) (l_remove_member_spec)) )
  **  (xizi_sll_node linklist_node_pre )))
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
Axiom proof_of_xizi_single_link_remove_node_derive_remove_tail_spec_by_strong_spec : xizi_single_link_remove_node_derive_remove_tail_spec_by_strong_spec.
Axiom proof_of_xizi_single_link_remove_node_derive_remove_front_spec_by_strong_spec : xizi_single_link_remove_node_derive_remove_front_spec_by_strong_spec.
Axiom proof_of_xizi_single_link_remove_node_derive_remove_member_spec_by_strong_spec : xizi_single_link_remove_node_derive_remove_member_spec_by_strong_spec.

End VC_Correct.
