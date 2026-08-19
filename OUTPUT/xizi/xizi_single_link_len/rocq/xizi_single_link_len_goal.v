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

(*----- Function xizi_single_link_len -----*)

Definition xizi_single_link_len_safety_wit_1 := 
forall (linklist_pre: Z) (l: (@list Z)) ,
  ((( &( "length" ) )) # UInt  |->_)
  **  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  (xizi_sll_head linklist_pre l )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_single_link_len_safety_wit_2 := 
forall (linklist_pre: Z) (l: (@list Z)) (tmp_list: Z) (first: Z) (length: Z) (l1: (@list Z)) (l2: (@list Z)) (PreH1 : (l = (app (l1) (l2)))) (PreH2 : (length = (Zlength (l1)))) (PreH3 : (linklist_pre <> 0)) ,
  ((( &( "length" ) )) # UInt  |-> length)
  **  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((( &( "tmp_list" ) )) # Ptr  |-> tmp_list)
  **  (xizi_sllseg first tmp_list l1 )
  **  (xizi_sll tmp_list l2 )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_single_link_len_entail_wit_1 := 
(
forall (linklist_pre: Z) (l: (@list Z)) (q: Z) (PreH1 : (linklist_pre <> 0)) ,
  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> q)
  **  (xizi_sll q l )
|--
  EX (first: Z)  (l1: (@list Z))  (l2: (@list Z)) ,
  “ (l = (app (l1) (l2))) ” 
  &&  “ (0 = (Zlength (l1))) ” 
  &&  “ (linklist_pre <> 0) ”
  &&  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_sllseg first q l1 )
  **  (xizi_sll q l2 )
) \/
(
forall (linklist_pre: Z) (l: (@list Z)) (q: Z) (PreH1 : (linklist_pre <> 0)) ,
  (xizi_sll q l )
|--
  EX (l2: (@list Z)) ,
  “ (l = (app ((@nil Z)) (l2))) ” 
  &&  “ (0 = (Zlength ((@nil Z)))) ” 
  &&  “ (linklist_pre <> 0) ”
  &&  (xizi_sll q l2 )
).

Definition xizi_single_link_len_entail_wit_2 := 
(
forall (linklist_pre: Z) (l: (@list Z)) (tmp_list: Z) (first_2: Z) (length: Z) (l1_2: (@list Z)) (l2_2: (@list Z)) (q: Z) (l0: (@list Z)) (PreH1 : (l2_2 = (cons (tmp_list) (l0)))) (PreH2 : (tmp_list <> 0)) (PreH3 : (l = (app (l1_2) (l2_2)))) (PreH4 : (length = (Zlength (l1_2)))) (PreH5 : (linklist_pre <> 0)) ,
  ((&((tmp_list)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> q)
  **  (xizi_sll q l0 )
  **  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_2)
  **  (xizi_sllseg first_2 tmp_list l1_2 )
|--
  EX (first: Z)  (l1: (@list Z))  (l2: (@list Z)) ,
  “ (l = (app (l1) (l2))) ” 
  &&  “ ((unsigned_last_nbits ((length + 1 )) (32)) = (Zlength (l1))) ” 
  &&  “ (linklist_pre <> 0) ”
  &&  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_sllseg first q l1 )
  **  (xizi_sll q l2 )
) \/
(
forall (linklist_pre: Z) (l: (@list Z)) (tmp_list: Z) (first_2: Z) (length: Z) (l1_2: (@list Z)) (l2_2: (@list Z)) (q: Z) (l0: (@list Z)) (PreH1 : (l2_2 = (cons (tmp_list) (l0)))) (PreH2 : (tmp_list <> 0)) (PreH3 : (l = (app (l1_2) (l2_2)))) (PreH4 : (length = (Zlength (l1_2)))) (PreH5 : (linklist_pre <> 0)) ,
  ((&((tmp_list)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> q)
  **  (xizi_sll q l0 )
  **  (xizi_sllseg first_2 tmp_list l1_2 )
|--
  EX (l1: (@list Z))  (l2: (@list Z)) ,
  “ (l = (app (l1) (l2))) ” 
  &&  “ ((unsigned_last_nbits ((length + 1 )) (32)) = (Zlength (l1))) ” 
  &&  “ (linklist_pre <> 0) ”
  &&  (xizi_sllseg first_2 q l1 )
  **  (xizi_sll q l2 )
).

Definition xizi_single_link_len_return_wit_1 := 
(
forall (linklist_pre: Z) (l: (@list Z)) (tmp_list: Z) (first: Z) (length: Z) (l1: (@list Z)) (l2: (@list Z)) (PreH1 : (tmp_list = 0)) (PreH2 : (l = (app (l1) (l2)))) (PreH3 : (length = (Zlength (l1)))) (PreH4 : (linklist_pre <> 0)) ,
  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_sllseg first tmp_list l1 )
  **  (xizi_sll tmp_list l2 )
|--
  “ (length = (Zlength (l))) ”
  &&  (xizi_sll_head linklist_pre l )
) \/
(
forall (linklist_pre: Z) (l: (@list Z)) (tmp_list: Z) (first: Z) (length: Z) (l1: (@list Z)) (l2: (@list Z)) (PreH1 : (tmp_list = 0)) (PreH2 : (l = (app (l1) (l2)))) (PreH3 : (length = (Zlength (l1)))) (PreH4 : (linklist_pre <> 0)) ,
  (xizi_sllseg first tmp_list l1 )
  **  (xizi_sll tmp_list l2 )
|--
  “ (length = (Zlength (l))) ”
  &&  (xizi_sll first l )
).

Definition xizi_single_link_len_return_wit_1_split_goal_1 := 
forall (linklist_pre: Z) (l: (@list Z)) (tmp_list: Z) (first: Z) (length: Z) (l1: (@list Z)) (l2: (@list Z)) (PreH1 : (tmp_list = 0)) (PreH2 : (l = (app (l1) (l2)))) (PreH3 : (length = (Zlength (l1)))) (PreH4 : (linklist_pre <> 0)) ,
  (xizi_sllseg first tmp_list l1 )
  **  (xizi_sll tmp_list l2 )
|--
  “ (length = (Zlength (l))) ”
.

Definition xizi_single_link_len_return_wit_1_split_goal_spatial := 
forall (linklist_pre: Z) (l: (@list Z)) (tmp_list: Z) (first: Z) (length: Z) (l1: (@list Z)) (l2: (@list Z)) (PreH1 : (tmp_list = 0)) (PreH2 : (l = (app (l1) (l2)))) (PreH3 : (length = (Zlength (l1)))) (PreH4 : (linklist_pre <> 0)) ,
  (xizi_sllseg first tmp_list l1 )
  **  (xizi_sll tmp_list l2 )
|--
  (xizi_sll first l )
.

Definition xizi_single_link_len_partial_solve_wit_1 := 
forall (linklist_pre: Z) (l: (@list Z)) ,
  (xizi_sll_head linklist_pre l )
|--
  EX (q: Z) ,
  “ (linklist_pre <> 0) ”
  &&  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> q)
  **  (xizi_sll q l )
.

Definition xizi_single_link_len_partial_solve_wit_2 := 
forall (linklist_pre: Z) (l: (@list Z)) (tmp_list: Z) (first: Z) (length: Z) (l1: (@list Z)) (l2: (@list Z)) (PreH1 : (tmp_list <> 0)) (PreH2 : (l = (app (l1) (l2)))) (PreH3 : (length = (Zlength (l1)))) (PreH4 : (linklist_pre <> 0)) ,
  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_sllseg first tmp_list l1 )
  **  (xizi_sll tmp_list l2 )
|--
  EX (l0: (@list Z))  (q: Z) ,
  “ (l2 = (cons (tmp_list) (l0))) ” 
  &&  “ (tmp_list <> 0) ” 
  &&  “ (l = (app (l1) (l2))) ” 
  &&  “ (length = (Zlength (l1))) ” 
  &&  “ (linklist_pre <> 0) ”
  &&  ((&((tmp_list)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> q)
  **  (xizi_sll q l0 )
  **  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_sllseg first tmp_list l1 )
.

Module Type VC_Correct.

Include xizi_single_link_Strategy_Correct.

Axiom proof_of_xizi_single_link_len_safety_wit_1 : xizi_single_link_len_safety_wit_1.
Axiom proof_of_xizi_single_link_len_safety_wit_2 : xizi_single_link_len_safety_wit_2.
Axiom proof_of_xizi_single_link_len_entail_wit_1 : xizi_single_link_len_entail_wit_1.
Axiom proof_of_xizi_single_link_len_entail_wit_2 : xizi_single_link_len_entail_wit_2.
Axiom proof_of_xizi_single_link_len_return_wit_1 : xizi_single_link_len_return_wit_1.
Axiom proof_of_xizi_single_link_len_partial_solve_wit_1 : xizi_single_link_len_partial_solve_wit_1.
Axiom proof_of_xizi_single_link_len_partial_solve_wit_2 : xizi_single_link_len_partial_solve_wit_2.

End VC_Correct.
