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
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_insert_after.source Require Import xizi_double_link_insert_after_lib.
Local Open Scope sac.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_strategy_goal.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_strategy_proof.

(*----- Function xizi_double_link_insert_after -----*)

Definition xizi_double_link_insert_after_entail_wit_1 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes: (@list Z)) (head: Z) (PreH1 : (In linklist_pre nodes )) ,
  (xizi_dll head nodes )
  **  (xizi_dll_node linklist_node_pre )
|--
  (EX (old_prev: Z)  (first: Z)  (nodes_before: (@list Z))  (nodes_after: (@list Z)) ,
  “ (nodes = (app (nodes_before) ((cons (linklist_pre) (nodes_after))))) ” 
  &&  “ ~((In linklist_pre nodes_before )) ” 
  &&  “ ((xizi_double_link_insert_after_nodes (nodes) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_pre) ((cons (linklist_node_pre) (nodes_after))))))) ” 
  &&  “ (nodes_after = (@nil Z)) ” 
  &&  “ (head <> 0) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ”
  &&  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_dllseg first head linklist_pre old_prev nodes_before )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> old_prev)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_pre)
  **  (xizi_dll_node linklist_node_pre ))
  ||
  (EX (next_next: Z)  (old_prev_2: Z)  (last: Z)  (first_2: Z)  (old_next: Z)  (rest: (@list Z))  (nodes_before_2: (@list Z))  (nodes_after_2: (@list Z)) ,
  “ (nodes = (app (nodes_before_2) ((cons (linklist_pre) (nodes_after_2))))) ” 
  &&  “ ~((In linklist_pre nodes_before_2 )) ” 
  &&  “ ((xizi_double_link_insert_after_nodes (nodes) (linklist_pre) (linklist_node_pre)) = (app (nodes_before_2) ((cons (linklist_pre) ((cons (linklist_node_pre) (nodes_after_2))))))) ” 
  &&  “ (nodes_after_2 = (cons (old_next) (rest))) ” 
  &&  “ (head <> 0) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ (old_next <> 0) ”
  &&  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_2)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first_2 head linklist_pre old_prev_2 nodes_before_2 )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> old_next)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> old_prev_2)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_next)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_pre)
  **  (xizi_dllseg next_next old_next head last rest )
  **  (xizi_dll_node linklist_node_pre ))
.

Definition xizi_double_link_insert_after_return_wit_1 := 
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes: (@list Z)) (head: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (last: Z) (old_next: Z) (old_prev: Z) (next_next: Z) (rest: (@list Z)) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (nodes = (app (nodes_before) ((cons (linklist_pre) (nodes_after)))))) (PreH3 : ~((In linklist_pre nodes_before ))) (PreH4 : ((xizi_double_link_insert_after_nodes (nodes) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_pre) ((cons (linklist_node_pre) (nodes_after)))))))) (PreH5 : (nodes_after = (cons (old_next) (rest)))) (PreH6 : (head <> 0)) (PreH7 : (linklist_pre <> 0)) (PreH8 : (linklist_node_pre <> 0)) (PreH9 : (old_next <> 0)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> old_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_pre)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first head linklist_pre old_prev nodes_before )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> old_prev)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_next)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg next_next old_next head last rest )
|--
  (xizi_dll head (xizi_double_link_insert_after_nodes (nodes) (linklist_pre) (linklist_node_pre)) )
) \/
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes: (@list Z)) (head: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (last: Z) (old_next: Z) (old_prev: Z) (next_next: Z) (rest: (@list Z)) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (nodes = (app (nodes_before) ((cons (linklist_pre) (nodes_after)))))) (PreH3 : ~((In linklist_pre nodes_before ))) (PreH4 : ((xizi_double_link_insert_after_nodes (nodes) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_pre) ((cons (linklist_node_pre) (nodes_after)))))))) (PreH5 : (nodes_after = (cons (old_next) (rest)))) (PreH6 : (head <> 0)) (PreH7 : (linklist_pre <> 0)) (PreH8 : (linklist_node_pre <> 0)) (PreH9 : (old_next <> 0)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> old_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_pre)
  **  (xizi_dllseg first head linklist_pre old_prev nodes_before )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> old_prev)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_next)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg next_next old_next head last rest )
|--
  (xizi_dllseg first head head last (xizi_double_link_insert_after_nodes (nodes) (linklist_pre) (linklist_node_pre)) )
).

Definition xizi_double_link_insert_after_return_wit_1_split_goal_spatial := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes: (@list Z)) (head: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (last: Z) (old_next: Z) (old_prev: Z) (next_next: Z) (rest: (@list Z)) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (nodes = (app (nodes_before) ((cons (linklist_pre) (nodes_after)))))) (PreH3 : ~((In linklist_pre nodes_before ))) (PreH4 : ((xizi_double_link_insert_after_nodes (nodes) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_pre) ((cons (linklist_node_pre) (nodes_after)))))))) (PreH5 : (nodes_after = (cons (old_next) (rest)))) (PreH6 : (head <> 0)) (PreH7 : (linklist_pre <> 0)) (PreH8 : (linklist_node_pre <> 0)) (PreH9 : (old_next <> 0)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> old_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_pre)
  **  (xizi_dllseg first head linklist_pre old_prev nodes_before )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> old_prev)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_next)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg next_next old_next head last rest )
|--
  (xizi_dllseg first head head last (xizi_double_link_insert_after_nodes (nodes) (linklist_pre) (linklist_node_pre)) )
.

Definition xizi_double_link_insert_after_return_wit_2 := 
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes: (@list Z)) (head: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (old_prev: Z) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (nodes = (app (nodes_before) ((cons (linklist_pre) (nodes_after)))))) (PreH3 : ~((In linklist_pre nodes_before ))) (PreH4 : ((xizi_double_link_insert_after_nodes (nodes) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_pre) ((cons (linklist_node_pre) (nodes_after)))))))) (PreH5 : (nodes_after = (@nil Z))) (PreH6 : (head <> 0)) (PreH7 : (linklist_pre <> 0)) (PreH8 : (linklist_node_pre <> 0)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_pre)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_dllseg first head linklist_pre old_prev nodes_before )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> old_prev)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
|--
  (xizi_dll head (xizi_double_link_insert_after_nodes (nodes) (linklist_pre) (linklist_node_pre)) )
) \/
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes: (@list Z)) (head: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (old_prev: Z) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (nodes = (app (nodes_before) ((cons (linklist_pre) (nodes_after)))))) (PreH3 : ~((In linklist_pre nodes_before ))) (PreH4 : ((xizi_double_link_insert_after_nodes (nodes) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_pre) ((cons (linklist_node_pre) (nodes_after)))))))) (PreH5 : (nodes_after = (@nil Z))) (PreH6 : (head <> 0)) (PreH7 : (linklist_pre <> 0)) (PreH8 : (linklist_node_pre <> 0)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_pre)
  **  (xizi_dllseg first head linklist_pre old_prev nodes_before )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> old_prev)
|--
  (xizi_dllseg first head head linklist_node_pre (xizi_double_link_insert_after_nodes (nodes) (linklist_pre) (linklist_node_pre)) )
).

Definition xizi_double_link_insert_after_return_wit_2_split_goal_spatial := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes: (@list Z)) (head: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (old_prev: Z) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (nodes = (app (nodes_before) ((cons (linklist_pre) (nodes_after)))))) (PreH3 : ~((In linklist_pre nodes_before ))) (PreH4 : ((xizi_double_link_insert_after_nodes (nodes) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_pre) ((cons (linklist_node_pre) (nodes_after)))))))) (PreH5 : (nodes_after = (@nil Z))) (PreH6 : (head <> 0)) (PreH7 : (linklist_pre <> 0)) (PreH8 : (linklist_node_pre <> 0)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_pre)
  **  (xizi_dllseg first head linklist_pre old_prev nodes_before )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> old_prev)
|--
  (xizi_dllseg first head head linklist_node_pre (xizi_double_link_insert_after_nodes (nodes) (linklist_pre) (linklist_node_pre)) )
.

Definition xizi_double_link_insert_after_partial_solve_wit_1 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes: (@list Z)) (head: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (last: Z) (old_next: Z) (old_prev: Z) (next_next: Z) (rest: (@list Z)) (PreH1 : (nodes = (app (nodes_before) ((cons (linklist_pre) (nodes_after)))))) (PreH2 : ~((In linklist_pre nodes_before ))) (PreH3 : ((xizi_double_link_insert_after_nodes (nodes) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_pre) ((cons (linklist_node_pre) (nodes_after)))))))) (PreH4 : (nodes_after = (cons (old_next) (rest)))) (PreH5 : (head <> 0)) (PreH6 : (linklist_pre <> 0)) (PreH7 : (linklist_node_pre <> 0)) (PreH8 : (old_next <> 0)) ,
  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first head linklist_pre old_prev nodes_before )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> old_next)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> old_prev)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_next)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg next_next old_next head last rest )
  **  (xizi_dll_node linklist_node_pre )
|--
  “ (linklist_node_pre <> 0) ” 
  &&  “ (nodes = (app (nodes_before) ((cons (linklist_pre) (nodes_after))))) ” 
  &&  “ ~((In linklist_pre nodes_before )) ” 
  &&  “ ((xizi_double_link_insert_after_nodes (nodes) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_pre) ((cons (linklist_node_pre) (nodes_after))))))) ” 
  &&  “ (nodes_after = (cons (old_next) (rest))) ” 
  &&  “ (head <> 0) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ (old_next <> 0) ”
  &&  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |->_)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first head linklist_pre old_prev nodes_before )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> old_next)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> old_prev)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_next)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg next_next old_next head last rest )
.

Definition xizi_double_link_insert_after_partial_solve_wit_2 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes: (@list Z)) (head: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (old_prev: Z) (PreH1 : (nodes = (app (nodes_before) ((cons (linklist_pre) (nodes_after)))))) (PreH2 : ~((In linklist_pre nodes_before ))) (PreH3 : ((xizi_double_link_insert_after_nodes (nodes) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_pre) ((cons (linklist_node_pre) (nodes_after)))))))) (PreH4 : (nodes_after = (@nil Z))) (PreH5 : (head <> 0)) (PreH6 : (linklist_pre <> 0)) (PreH7 : (linklist_node_pre <> 0)) ,
  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_dllseg first head linklist_pre old_prev nodes_before )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> old_prev)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dll_node linklist_node_pre )
|--
  “ (linklist_node_pre <> 0) ” 
  &&  “ (nodes = (app (nodes_before) ((cons (linklist_pre) (nodes_after))))) ” 
  &&  “ ~((In linklist_pre nodes_before )) ” 
  &&  “ ((xizi_double_link_insert_after_nodes (nodes) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_pre) ((cons (linklist_node_pre) (nodes_after))))))) ” 
  &&  “ (nodes_after = (@nil Z)) ” 
  &&  “ (head <> 0) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ”
  &&  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |->_)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_dllseg first head linklist_pre old_prev nodes_before )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> old_prev)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
.

Module Type VC_Correct.

Include xizi_double_link_Strategy_Correct.

Axiom proof_of_xizi_double_link_insert_after_entail_wit_1 : xizi_double_link_insert_after_entail_wit_1.
Axiom proof_of_xizi_double_link_insert_after_return_wit_1 : xizi_double_link_insert_after_return_wit_1.
Axiom proof_of_xizi_double_link_insert_after_return_wit_2 : xizi_double_link_insert_after_return_wit_2.
Axiom proof_of_xizi_double_link_insert_after_partial_solve_wit_1 : xizi_double_link_insert_after_partial_solve_wit_1.
Axiom proof_of_xizi_double_link_insert_after_partial_solve_wit_2 : xizi_double_link_insert_after_partial_solve_wit_2.

End VC_Correct.
