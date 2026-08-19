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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_insert_before.source Require Import xizi_double_link_insert_before_lib.
Local Open Scope sac.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_strategy_goal.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_strategy_proof.

(*----- Function xizi_double_link_insert_before -----*)

Definition xizi_double_link_insert_before_entail_wit_1 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes: (@list Z)) (head: Z) (PreH1 : (In linklist_pre nodes )) ,
  (xizi_dll head nodes )
  **  (xizi_dll_node linklist_node_pre )
|--
  (EX (last: Z)  (next: Z)  (before_prev: Z)  (prev: Z)  (nodes_before: (@list Z))  (nodes_after: (@list Z)) ,
  “ (nodes = (app (nodes_before) ((cons (linklist_pre) (nodes_after))))) ” 
  &&  “ ~((In linklist_pre nodes_before )) ” 
  &&  “ ((xizi_double_link_insert_before_nodes (nodes) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (linklist_pre) (nodes_after))))))) ” 
  &&  “ (linklist_pre = linklist_pre) ” 
  &&  “ (head <> 0) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ (nodes_before = (@nil Z)) ” 
  &&  “ (prev = head) ” 
  &&  “ (before_prev = last) ”
  &&  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  (xizi_dllseg next linklist_pre head last nodes_after )
  **  (xizi_dll_node linklist_node_pre ))
  ||
  (EX (first: Z)  (prefix0: (@list Z))  (last: Z)  (next: Z)  (before_prev: Z)  (prev: Z)  (nodes_before: (@list Z))  (nodes_after: (@list Z)) ,
  “ (nodes = (app (nodes_before) ((cons (linklist_pre) (nodes_after))))) ” 
  &&  “ ~((In linklist_pre nodes_before )) ” 
  &&  “ ((xizi_double_link_insert_before_nodes (nodes) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (linklist_pre) (nodes_after))))))) ” 
  &&  “ (head <> 0) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ (nodes_before = (app (prefix0) ((cons (prev) ((@nil Z)))))) ” 
  &&  “ (prev <> 0) ” 
  &&  “ (prev <> head) ”
  &&  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  (xizi_dllseg next linklist_pre head last nodes_after )
  **  (xizi_dll_node linklist_node_pre )
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first head prev before_prev prefix0 ))
.

Definition xizi_double_link_insert_before_return_wit_1 := 
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes: (@list Z)) (head: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (last: Z) (prev: Z) (before_prev: Z) (next: Z) (prefix0: (@list Z)) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (nodes = (app (nodes_before) ((cons (linklist_pre) (nodes_after)))))) (PreH3 : ~((In linklist_pre nodes_before ))) (PreH4 : ((xizi_double_link_insert_before_nodes (nodes) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (linklist_pre) (nodes_after)))))))) (PreH5 : (head <> 0)) (PreH6 : (linklist_pre <> 0)) (PreH7 : (linklist_node_pre <> 0)) (PreH8 : (nodes_before = (app (prefix0) ((cons (prev) ((@nil Z))))))) (PreH9 : (prev <> 0)) (PreH10 : (prev <> head)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg next linklist_pre head last nodes_after )
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first head prev before_prev prefix0 )
|--
  (xizi_dll head (xizi_double_link_insert_before_nodes (nodes) (linklist_pre) (linklist_node_pre)) )
) \/
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes: (@list Z)) (head: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (last: Z) (prev: Z) (before_prev: Z) (next: Z) (prefix0: (@list Z)) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (nodes = (app (nodes_before) ((cons (linklist_pre) (nodes_after)))))) (PreH3 : ~((In linklist_pre nodes_before ))) (PreH4 : ((xizi_double_link_insert_before_nodes (nodes) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (linklist_pre) (nodes_after)))))))) (PreH5 : (head <> 0)) (PreH6 : (linklist_pre <> 0)) (PreH7 : (linklist_node_pre <> 0)) (PreH8 : (nodes_before = (app (prefix0) ((cons (prev) ((@nil Z))))))) (PreH9 : (prev <> 0)) (PreH10 : (prev <> head)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg next linklist_pre head last nodes_after )
  **  (xizi_dllseg first head prev before_prev prefix0 )
|--
  (xizi_dllseg first head head last (xizi_double_link_insert_before_nodes (nodes) (linklist_pre) (linklist_node_pre)) )
).

Definition xizi_double_link_insert_before_return_wit_1_split_goal_spatial := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes: (@list Z)) (head: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (last: Z) (prev: Z) (before_prev: Z) (next: Z) (prefix0: (@list Z)) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (nodes = (app (nodes_before) ((cons (linklist_pre) (nodes_after)))))) (PreH3 : ~((In linklist_pre nodes_before ))) (PreH4 : ((xizi_double_link_insert_before_nodes (nodes) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (linklist_pre) (nodes_after)))))))) (PreH5 : (head <> 0)) (PreH6 : (linklist_pre <> 0)) (PreH7 : (linklist_node_pre <> 0)) (PreH8 : (nodes_before = (app (prefix0) ((cons (prev) ((@nil Z))))))) (PreH9 : (prev <> 0)) (PreH10 : (prev <> head)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg next linklist_pre head last nodes_after )
  **  (xizi_dllseg first head prev before_prev prefix0 )
|--
  (xizi_dllseg first head head last (xizi_double_link_insert_before_nodes (nodes) (linklist_pre) (linklist_node_pre)) )
.

Definition xizi_double_link_insert_before_return_wit_2 := 
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes: (@list Z)) (head: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (last: Z) (prev: Z) (before_prev: Z) (next: Z) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (nodes = (app (nodes_before) ((cons (first) (nodes_after)))))) (PreH3 : ~((In first nodes_before ))) (PreH4 : ((xizi_double_link_insert_before_nodes (nodes) (first) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (first) (nodes_after)))))))) (PreH5 : (first = linklist_pre)) (PreH6 : (head <> 0)) (PreH7 : (first <> 0)) (PreH8 : (linklist_node_pre <> 0)) (PreH9 : (nodes_before = (@nil Z))) (PreH10 : (prev = head)) (PreH11 : (before_prev = last)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg next first head last nodes_after )
|--
  (xizi_dll head (xizi_double_link_insert_before_nodes (nodes) (linklist_pre) (linklist_node_pre)) )
) \/
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes: (@list Z)) (head: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (last: Z) (prev: Z) (before_prev: Z) (next: Z) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (nodes = (app (nodes_before) ((cons (first) (nodes_after)))))) (PreH3 : ~((In first nodes_before ))) (PreH4 : ((xizi_double_link_insert_before_nodes (nodes) (first) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (first) (nodes_after)))))))) (PreH5 : (first = linklist_pre)) (PreH6 : (head <> 0)) (PreH7 : (first <> 0)) (PreH8 : (linklist_node_pre <> 0)) (PreH9 : (nodes_before = (@nil Z))) (PreH10 : (prev = head)) (PreH11 : (before_prev = last)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg next first head last nodes_after )
|--
  EX (last_2: Z)  (first_2: Z) ,
  “ (head <> 0) ”
  &&  (xizi_dllseg first_2 head head last_2 (xizi_double_link_insert_before_nodes (nodes) (linklist_pre) (linklist_node_pre)) )
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last_2)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_2)
).

Definition xizi_double_link_insert_before_partial_solve_wit_1 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes: (@list Z)) (head: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (last: Z) (prev: Z) (before_prev: Z) (next: Z) (prefix0: (@list Z)) (PreH1 : (nodes = (app (nodes_before) ((cons (linklist_pre) (nodes_after)))))) (PreH2 : ~((In linklist_pre nodes_before ))) (PreH3 : ((xizi_double_link_insert_before_nodes (nodes) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (linklist_pre) (nodes_after)))))))) (PreH4 : (head <> 0)) (PreH5 : (linklist_pre <> 0)) (PreH6 : (linklist_node_pre <> 0)) (PreH7 : (nodes_before = (app (prefix0) ((cons (prev) ((@nil Z))))))) (PreH8 : (prev <> 0)) (PreH9 : (prev <> head)) ,
  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  (xizi_dllseg next linklist_pre head last nodes_after )
  **  (xizi_dll_node linklist_node_pre )
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first head prev before_prev prefix0 )
|--
  “ (linklist_node_pre <> 0) ” 
  &&  “ (nodes = (app (nodes_before) ((cons (linklist_pre) (nodes_after))))) ” 
  &&  “ ~((In linklist_pre nodes_before )) ” 
  &&  “ ((xizi_double_link_insert_before_nodes (nodes) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (linklist_pre) (nodes_after))))))) ” 
  &&  “ (head <> 0) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ (nodes_before = (app (prefix0) ((cons (prev) ((@nil Z)))))) ” 
  &&  “ (prev <> 0) ” 
  &&  “ (prev <> head) ”
  &&  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |->_)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  (xizi_dllseg next linklist_pre head last nodes_after )
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first head prev before_prev prefix0 )
.

Definition xizi_double_link_insert_before_partial_solve_wit_2 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes: (@list Z)) (head: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (last: Z) (prev: Z) (before_prev: Z) (next: Z) (PreH1 : (nodes = (app (nodes_before) ((cons (first) (nodes_after)))))) (PreH2 : ~((In first nodes_before ))) (PreH3 : ((xizi_double_link_insert_before_nodes (nodes) (first) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (first) (nodes_after)))))))) (PreH4 : (first = linklist_pre)) (PreH5 : (head <> 0)) (PreH6 : (first <> 0)) (PreH7 : (linklist_node_pre <> 0)) (PreH8 : (nodes_before = (@nil Z))) (PreH9 : (prev = head)) (PreH10 : (before_prev = last)) ,
  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  (xizi_dllseg next first head last nodes_after )
  **  (xizi_dll_node linklist_node_pre )
|--
  “ (linklist_node_pre <> 0) ” 
  &&  “ (nodes = (app (nodes_before) ((cons (first) (nodes_after))))) ” 
  &&  “ ~((In first nodes_before )) ” 
  &&  “ ((xizi_double_link_insert_before_nodes (nodes) (first) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (first) (nodes_after))))))) ” 
  &&  “ (first = linklist_pre) ” 
  &&  “ (head <> 0) ” 
  &&  “ (first <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ (nodes_before = (@nil Z)) ” 
  &&  “ (prev = head) ” 
  &&  “ (before_prev = last) ”
  &&  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |->_)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  (xizi_dllseg next first head last nodes_after )
.

Module Type VC_Correct.

Include xizi_double_link_Strategy_Correct.

Axiom proof_of_xizi_double_link_insert_before_entail_wit_1 : xizi_double_link_insert_before_entail_wit_1.
Axiom proof_of_xizi_double_link_insert_before_return_wit_1 : xizi_double_link_insert_before_return_wit_1.
Axiom proof_of_xizi_double_link_insert_before_return_wit_2 : xizi_double_link_insert_before_return_wit_2.
Axiom proof_of_xizi_double_link_insert_before_partial_solve_wit_1 : xizi_double_link_insert_before_partial_solve_wit_1.
Axiom proof_of_xizi_double_link_insert_before_partial_solve_wit_2 : xizi_double_link_insert_before_partial_solve_wit_2.

End VC_Correct.
