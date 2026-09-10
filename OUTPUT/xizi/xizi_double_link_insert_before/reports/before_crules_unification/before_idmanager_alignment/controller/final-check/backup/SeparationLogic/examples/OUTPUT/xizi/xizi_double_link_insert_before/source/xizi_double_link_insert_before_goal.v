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

(*----- Function DoubleLinkListInsertNodeBefore -----*)

Definition DoubleLinkListInsertNodeBefore_entail_wit_1 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (head_dispatch_case: Z) (PreH1 : (xizi_double_link_insert_before_anchor head_dispatch_case nodes_dispatch_case linklist_pre )) ,
  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  (xizi_dll head_dispatch_case nodes_dispatch_case )
  **  (xizi_dll_node linklist_node_pre )
|--
  (EX (first: Z)  (last: Z)  (next: Z)  (before_prev: Z)  (prev: Z)  (nodes_before: (@list Z))  (nodes_after: (@list Z)) ,
  “ (first = linklist_pre) ” 
  &&  “ (head_dispatch_case <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ (nodes_dispatch_case = (app (nodes_before) ((cons (first) (nodes_after))))) ” 
  &&  “ ~((In first nodes_before )) ” 
  &&  “ ((xizi_double_link_insert_before_nodes (nodes_dispatch_case) (first) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (first) (nodes_after))))))) ” 
  &&  “ (first <> 0) ” 
  &&  “ (first <> head_dispatch_case) ” 
  &&  “ (nodes_before = (@nil Z)) ” 
  &&  “ (prev = head_dispatch_case) ” 
  &&  “ (before_prev = last) ”
  &&  ((( &( "linklist" ) )) # Ptr  |-> first)
  **  (xizi_dll_node linklist_node_pre )
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  (xizi_dllseg next first head_dispatch_case last nodes_after ))
  ||
  (EX (first: Z)  (prefix0: (@list Z))  (last: Z)  (next: Z)  (before_prev: Z)  (prev: Z)  (nodes_before: (@list Z))  (nodes_after: (@list Z)) ,
  “ (head_dispatch_case <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ (nodes_dispatch_case = (app (nodes_before) ((cons (linklist_pre) (nodes_after))))) ” 
  &&  “ ~((In linklist_pre nodes_before )) ” 
  &&  “ ((xizi_double_link_insert_before_nodes (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (linklist_pre) (nodes_after))))))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_pre <> head_dispatch_case) ” 
  &&  “ (nodes_before = (app (prefix0) ((cons (prev) ((@nil Z)))))) ” 
  &&  “ (prev <> 0) ” 
  &&  “ (prev <> head_dispatch_case) ”
  &&  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  (xizi_dll_node linklist_node_pre )
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  (xizi_dllseg next linklist_pre head_dispatch_case last nodes_after )
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first head_dispatch_case prev before_prev prefix0 ))
  ||
  (EX (first: Z)  (before_prev: Z)  (prefix0_2: (@list Z))  (prev: Z) ,
  “ (head_dispatch_case = linklist_pre) ” 
  &&  “ (head_dispatch_case <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ ((xizi_double_link_insert_before_nodes (nodes_dispatch_case) (head_dispatch_case) (linklist_node_pre)) = (app (nodes_dispatch_case) ((cons (linklist_node_pre) ((@nil Z)))))) ” 
  &&  “ (nodes_dispatch_case = (app (prefix0_2) ((cons (prev) ((@nil Z)))))) ” 
  &&  “ (prev <> 0) ” 
  &&  “ (prev <> head_dispatch_case) ”
  &&  ((( &( "linklist" ) )) # Ptr  |-> head_dispatch_case)
  **  (xizi_dll_node linklist_node_pre )
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  (xizi_dllseg first head_dispatch_case prev before_prev prefix0_2 ))
  ||
  (EX (first: Z)  (before_prev: Z)  (prev: Z) ,
  “ (head_dispatch_case = linklist_pre) ” 
  &&  “ (head_dispatch_case <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ ((xizi_double_link_insert_before_nodes (nodes_dispatch_case) (head_dispatch_case) (linklist_node_pre)) = (app (nodes_dispatch_case) ((cons (linklist_node_pre) ((@nil Z)))))) ” 
  &&  “ (nodes_dispatch_case = (@nil Z)) ” 
  &&  “ (prev = head_dispatch_case) ” 
  &&  “ (before_prev = head_dispatch_case) ” 
  &&  “ (first = head_dispatch_case) ”
  &&  ((( &( "linklist" ) )) # Ptr  |-> head_dispatch_case)
  **  (xizi_dll_node linklist_node_pre )
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> head_dispatch_case))
.

Definition DoubleLinkListInsertNodeBefore_return_wit_1 := 
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (head_dispatch_case: Z) (first: Z) (prev: Z) (before_prev: Z) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (head_dispatch_case = linklist_pre)) (PreH3 : (head_dispatch_case <> 0)) (PreH4 : (linklist_node_pre <> 0)) (PreH5 : ((xizi_double_link_insert_before_nodes (nodes_dispatch_case) (head_dispatch_case) (linklist_node_pre)) = (app (nodes_dispatch_case) ((cons (linklist_node_pre) ((@nil Z))))))) (PreH6 : (nodes_dispatch_case = (@nil Z))) (PreH7 : (prev = head_dispatch_case)) (PreH8 : (before_prev = head_dispatch_case)) (PreH9 : (first = head_dispatch_case)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> head_dispatch_case)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
|--
  (xizi_dll head_dispatch_case (xizi_double_link_insert_before_nodes (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) )
) \/
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (head_dispatch_case: Z) (first: Z) (prev: Z) (before_prev: Z) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (head_dispatch_case = linklist_pre)) (PreH3 : (head_dispatch_case <> 0)) (PreH4 : (linklist_node_pre <> 0)) (PreH5 : ((xizi_double_link_insert_before_nodes (nodes_dispatch_case) (head_dispatch_case) (linklist_node_pre)) = (app (nodes_dispatch_case) ((cons (linklist_node_pre) ((@nil Z))))))) (PreH6 : (nodes_dispatch_case = (@nil Z))) (PreH7 : (prev = head_dispatch_case)) (PreH8 : (before_prev = head_dispatch_case)) (PreH9 : (first = head_dispatch_case)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> head_dispatch_case)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
|--
  (xizi_dllseg linklist_node_pre head_dispatch_case head_dispatch_case linklist_node_pre (xizi_double_link_insert_before_nodes (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) )
).

Definition DoubleLinkListInsertNodeBefore_return_wit_1_split_goal_spatial := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (head_dispatch_case: Z) (first: Z) (prev: Z) (before_prev: Z) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (head_dispatch_case = linklist_pre)) (PreH3 : (head_dispatch_case <> 0)) (PreH4 : (linklist_node_pre <> 0)) (PreH5 : ((xizi_double_link_insert_before_nodes (nodes_dispatch_case) (head_dispatch_case) (linklist_node_pre)) = (app (nodes_dispatch_case) ((cons (linklist_node_pre) ((@nil Z))))))) (PreH6 : (nodes_dispatch_case = (@nil Z))) (PreH7 : (prev = head_dispatch_case)) (PreH8 : (before_prev = head_dispatch_case)) (PreH9 : (first = head_dispatch_case)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> head_dispatch_case)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
|--
  (xizi_dllseg linklist_node_pre head_dispatch_case head_dispatch_case linklist_node_pre (xizi_double_link_insert_before_nodes (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) )
.

Definition DoubleLinkListInsertNodeBefore_return_wit_2 := 
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (head_dispatch_case: Z) (first: Z) (prev: Z) (before_prev: Z) (prefix0: (@list Z)) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (head_dispatch_case = linklist_pre)) (PreH3 : (head_dispatch_case <> 0)) (PreH4 : (linklist_node_pre <> 0)) (PreH5 : ((xizi_double_link_insert_before_nodes (nodes_dispatch_case) (head_dispatch_case) (linklist_node_pre)) = (app (nodes_dispatch_case) ((cons (linklist_node_pre) ((@nil Z))))))) (PreH6 : (nodes_dispatch_case = (app (prefix0) ((cons (prev) ((@nil Z))))))) (PreH7 : (prev <> 0)) (PreH8 : (prev <> head_dispatch_case)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg first head_dispatch_case prev before_prev prefix0 )
|--
  (xizi_dll head_dispatch_case (xizi_double_link_insert_before_nodes (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) )
) \/
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (head_dispatch_case: Z) (first: Z) (prev: Z) (before_prev: Z) (prefix0: (@list Z)) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (head_dispatch_case = linklist_pre)) (PreH3 : (head_dispatch_case <> 0)) (PreH4 : (linklist_node_pre <> 0)) (PreH5 : ((xizi_double_link_insert_before_nodes (nodes_dispatch_case) (head_dispatch_case) (linklist_node_pre)) = (app (nodes_dispatch_case) ((cons (linklist_node_pre) ((@nil Z))))))) (PreH6 : (nodes_dispatch_case = (app (prefix0) ((cons (prev) ((@nil Z))))))) (PreH7 : (prev <> 0)) (PreH8 : (prev <> head_dispatch_case)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  (xizi_dllseg first head_dispatch_case prev before_prev prefix0 )
|--
  (xizi_dllseg first head_dispatch_case head_dispatch_case linklist_node_pre (xizi_double_link_insert_before_nodes (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) )
).

Definition DoubleLinkListInsertNodeBefore_return_wit_2_split_goal_spatial := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (head_dispatch_case: Z) (first: Z) (prev: Z) (before_prev: Z) (prefix0: (@list Z)) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (head_dispatch_case = linklist_pre)) (PreH3 : (head_dispatch_case <> 0)) (PreH4 : (linklist_node_pre <> 0)) (PreH5 : ((xizi_double_link_insert_before_nodes (nodes_dispatch_case) (head_dispatch_case) (linklist_node_pre)) = (app (nodes_dispatch_case) ((cons (linklist_node_pre) ((@nil Z))))))) (PreH6 : (nodes_dispatch_case = (app (prefix0) ((cons (prev) ((@nil Z))))))) (PreH7 : (prev <> 0)) (PreH8 : (prev <> head_dispatch_case)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  (xizi_dllseg first head_dispatch_case prev before_prev prefix0 )
|--
  (xizi_dllseg first head_dispatch_case head_dispatch_case linklist_node_pre (xizi_double_link_insert_before_nodes (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) )
.

Definition DoubleLinkListInsertNodeBefore_return_wit_3 := 
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (head_dispatch_case: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (last: Z) (prev: Z) (before_prev: Z) (next: Z) (prefix0: (@list Z)) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (head_dispatch_case <> 0)) (PreH3 : (linklist_node_pre <> 0)) (PreH4 : (nodes_dispatch_case = (app (nodes_before) ((cons (linklist_pre) (nodes_after)))))) (PreH5 : ~((In linklist_pre nodes_before ))) (PreH6 : ((xizi_double_link_insert_before_nodes (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (linklist_pre) (nodes_after)))))))) (PreH7 : (linklist_pre <> 0)) (PreH8 : (linklist_pre <> head_dispatch_case)) (PreH9 : (nodes_before = (app (prefix0) ((cons (prev) ((@nil Z))))))) (PreH10 : (prev <> 0)) (PreH11 : (prev <> head_dispatch_case)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg next linklist_pre head_dispatch_case last nodes_after )
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first head_dispatch_case prev before_prev prefix0 )
|--
  (xizi_dll head_dispatch_case (xizi_double_link_insert_before_nodes (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) )
) \/
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (head_dispatch_case: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (last: Z) (prev: Z) (before_prev: Z) (next: Z) (prefix0: (@list Z)) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (head_dispatch_case <> 0)) (PreH3 : (linklist_node_pre <> 0)) (PreH4 : (nodes_dispatch_case = (app (nodes_before) ((cons (linklist_pre) (nodes_after)))))) (PreH5 : ~((In linklist_pre nodes_before ))) (PreH6 : ((xizi_double_link_insert_before_nodes (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (linklist_pre) (nodes_after)))))))) (PreH7 : (linklist_pre <> 0)) (PreH8 : (linklist_pre <> head_dispatch_case)) (PreH9 : (nodes_before = (app (prefix0) ((cons (prev) ((@nil Z))))))) (PreH10 : (prev <> 0)) (PreH11 : (prev <> head_dispatch_case)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg next linklist_pre head_dispatch_case last nodes_after )
  **  (xizi_dllseg first head_dispatch_case prev before_prev prefix0 )
|--
  (xizi_dllseg first head_dispatch_case head_dispatch_case last (xizi_double_link_insert_before_nodes (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) )
).

Definition DoubleLinkListInsertNodeBefore_return_wit_3_split_goal_spatial := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (head_dispatch_case: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (last: Z) (prev: Z) (before_prev: Z) (next: Z) (prefix0: (@list Z)) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (head_dispatch_case <> 0)) (PreH3 : (linklist_node_pre <> 0)) (PreH4 : (nodes_dispatch_case = (app (nodes_before) ((cons (linklist_pre) (nodes_after)))))) (PreH5 : ~((In linklist_pre nodes_before ))) (PreH6 : ((xizi_double_link_insert_before_nodes (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (linklist_pre) (nodes_after)))))))) (PreH7 : (linklist_pre <> 0)) (PreH8 : (linklist_pre <> head_dispatch_case)) (PreH9 : (nodes_before = (app (prefix0) ((cons (prev) ((@nil Z))))))) (PreH10 : (prev <> 0)) (PreH11 : (prev <> head_dispatch_case)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg next linklist_pre head_dispatch_case last nodes_after )
  **  (xizi_dllseg first head_dispatch_case prev before_prev prefix0 )
|--
  (xizi_dllseg first head_dispatch_case head_dispatch_case last (xizi_double_link_insert_before_nodes (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) )
.

Definition DoubleLinkListInsertNodeBefore_return_wit_4 := 
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (head_dispatch_case: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (last: Z) (prev: Z) (before_prev: Z) (next: Z) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (first = linklist_pre)) (PreH3 : (head_dispatch_case <> 0)) (PreH4 : (linklist_node_pre <> 0)) (PreH5 : (nodes_dispatch_case = (app (nodes_before) ((cons (first) (nodes_after)))))) (PreH6 : ~((In first nodes_before ))) (PreH7 : ((xizi_double_link_insert_before_nodes (nodes_dispatch_case) (first) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (first) (nodes_after)))))))) (PreH8 : (first <> 0)) (PreH9 : (first <> head_dispatch_case)) (PreH10 : (nodes_before = (@nil Z))) (PreH11 : (prev = head_dispatch_case)) (PreH12 : (before_prev = last)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg next first head_dispatch_case last nodes_after )
|--
  (xizi_dll head_dispatch_case (xizi_double_link_insert_before_nodes (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) )
) \/
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (head_dispatch_case: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (last: Z) (prev: Z) (before_prev: Z) (next: Z) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (first = linklist_pre)) (PreH3 : (head_dispatch_case <> 0)) (PreH4 : (linklist_node_pre <> 0)) (PreH5 : (nodes_dispatch_case = (app (nodes_before) ((cons (first) (nodes_after)))))) (PreH6 : ~((In first nodes_before ))) (PreH7 : ((xizi_double_link_insert_before_nodes (nodes_dispatch_case) (first) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (first) (nodes_after)))))))) (PreH8 : (first <> 0)) (PreH9 : (first <> head_dispatch_case)) (PreH10 : (nodes_before = (@nil Z))) (PreH11 : (prev = head_dispatch_case)) (PreH12 : (before_prev = last)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg next first head_dispatch_case last nodes_after )
|--
  EX (last_2: Z)  (first_2: Z) ,
  “ (head_dispatch_case <> 0) ”
  &&  (xizi_dllseg first_2 head_dispatch_case head_dispatch_case last_2 (xizi_double_link_insert_before_nodes (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) )
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last_2)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_2)
).

Definition DoubleLinkListInsertNodeBefore_partial_solve_wit_1 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (head_dispatch_case: Z) (first: Z) (prev: Z) (before_prev: Z) (PreH1 : (head_dispatch_case = linklist_pre)) (PreH2 : (head_dispatch_case <> 0)) (PreH3 : (linklist_node_pre <> 0)) (PreH4 : ((xizi_double_link_insert_before_nodes (nodes_dispatch_case) (head_dispatch_case) (linklist_node_pre)) = (app (nodes_dispatch_case) ((cons (linklist_node_pre) ((@nil Z))))))) (PreH5 : (nodes_dispatch_case = (@nil Z))) (PreH6 : (prev = head_dispatch_case)) (PreH7 : (before_prev = head_dispatch_case)) (PreH8 : (first = head_dispatch_case)) ,
  (xizi_dll_node linklist_node_pre )
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> head_dispatch_case)
|--
  “ (linklist_node_pre <> 0) ” 
  &&  “ (head_dispatch_case = linklist_pre) ” 
  &&  “ (head_dispatch_case <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ ((xizi_double_link_insert_before_nodes (nodes_dispatch_case) (head_dispatch_case) (linklist_node_pre)) = (app (nodes_dispatch_case) ((cons (linklist_node_pre) ((@nil Z)))))) ” 
  &&  “ (nodes_dispatch_case = (@nil Z)) ” 
  &&  “ (prev = head_dispatch_case) ” 
  &&  “ (before_prev = head_dispatch_case) ” 
  &&  “ (first = head_dispatch_case) ”
  &&  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |->_)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> head_dispatch_case)
.

Definition DoubleLinkListInsertNodeBefore_partial_solve_wit_2 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (head_dispatch_case: Z) (first: Z) (prev: Z) (before_prev: Z) (prefix0: (@list Z)) (PreH1 : (head_dispatch_case = linklist_pre)) (PreH2 : (head_dispatch_case <> 0)) (PreH3 : (linklist_node_pre <> 0)) (PreH4 : ((xizi_double_link_insert_before_nodes (nodes_dispatch_case) (head_dispatch_case) (linklist_node_pre)) = (app (nodes_dispatch_case) ((cons (linklist_node_pre) ((@nil Z))))))) (PreH5 : (nodes_dispatch_case = (app (prefix0) ((cons (prev) ((@nil Z))))))) (PreH6 : (prev <> 0)) (PreH7 : (prev <> head_dispatch_case)) ,
  (xizi_dll_node linklist_node_pre )
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  (xizi_dllseg first head_dispatch_case prev before_prev prefix0 )
|--
  “ (linklist_node_pre <> 0) ” 
  &&  “ (head_dispatch_case = linklist_pre) ” 
  &&  “ (head_dispatch_case <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ ((xizi_double_link_insert_before_nodes (nodes_dispatch_case) (head_dispatch_case) (linklist_node_pre)) = (app (nodes_dispatch_case) ((cons (linklist_node_pre) ((@nil Z)))))) ” 
  &&  “ (nodes_dispatch_case = (app (prefix0) ((cons (prev) ((@nil Z)))))) ” 
  &&  “ (prev <> 0) ” 
  &&  “ (prev <> head_dispatch_case) ”
  &&  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |->_)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  (xizi_dllseg first head_dispatch_case prev before_prev prefix0 )
.

Definition DoubleLinkListInsertNodeBefore_partial_solve_wit_3 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (head_dispatch_case: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (last: Z) (prev: Z) (before_prev: Z) (next: Z) (prefix0: (@list Z)) (PreH1 : (head_dispatch_case <> 0)) (PreH2 : (linklist_node_pre <> 0)) (PreH3 : (nodes_dispatch_case = (app (nodes_before) ((cons (linklist_pre) (nodes_after)))))) (PreH4 : ~((In linklist_pre nodes_before ))) (PreH5 : ((xizi_double_link_insert_before_nodes (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (linklist_pre) (nodes_after)))))))) (PreH6 : (linklist_pre <> 0)) (PreH7 : (linklist_pre <> head_dispatch_case)) (PreH8 : (nodes_before = (app (prefix0) ((cons (prev) ((@nil Z))))))) (PreH9 : (prev <> 0)) (PreH10 : (prev <> head_dispatch_case)) ,
  (xizi_dll_node linklist_node_pre )
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  (xizi_dllseg next linklist_pre head_dispatch_case last nodes_after )
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first head_dispatch_case prev before_prev prefix0 )
|--
  “ (linklist_node_pre <> 0) ” 
  &&  “ (head_dispatch_case <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ (nodes_dispatch_case = (app (nodes_before) ((cons (linklist_pre) (nodes_after))))) ” 
  &&  “ ~((In linklist_pre nodes_before )) ” 
  &&  “ ((xizi_double_link_insert_before_nodes (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (linklist_pre) (nodes_after))))))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_pre <> head_dispatch_case) ” 
  &&  “ (nodes_before = (app (prefix0) ((cons (prev) ((@nil Z)))))) ” 
  &&  “ (prev <> 0) ” 
  &&  “ (prev <> head_dispatch_case) ”
  &&  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |->_)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  (xizi_dllseg next linklist_pre head_dispatch_case last nodes_after )
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first head_dispatch_case prev before_prev prefix0 )
.

Definition DoubleLinkListInsertNodeBefore_partial_solve_wit_4 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (head_dispatch_case: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (last: Z) (prev: Z) (before_prev: Z) (next: Z) (PreH1 : (first = linklist_pre)) (PreH2 : (head_dispatch_case <> 0)) (PreH3 : (linklist_node_pre <> 0)) (PreH4 : (nodes_dispatch_case = (app (nodes_before) ((cons (first) (nodes_after)))))) (PreH5 : ~((In first nodes_before ))) (PreH6 : ((xizi_double_link_insert_before_nodes (nodes_dispatch_case) (first) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (first) (nodes_after)))))))) (PreH7 : (first <> 0)) (PreH8 : (first <> head_dispatch_case)) (PreH9 : (nodes_before = (@nil Z))) (PreH10 : (prev = head_dispatch_case)) (PreH11 : (before_prev = last)) ,
  (xizi_dll_node linklist_node_pre )
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  (xizi_dllseg next first head_dispatch_case last nodes_after )
|--
  “ (linklist_node_pre <> 0) ” 
  &&  “ (first = linklist_pre) ” 
  &&  “ (head_dispatch_case <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ (nodes_dispatch_case = (app (nodes_before) ((cons (first) (nodes_after))))) ” 
  &&  “ ~((In first nodes_before )) ” 
  &&  “ ((xizi_double_link_insert_before_nodes (nodes_dispatch_case) (first) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (first) (nodes_after))))))) ” 
  &&  “ (first <> 0) ” 
  &&  “ (first <> head_dispatch_case) ” 
  &&  “ (nodes_before = (@nil Z)) ” 
  &&  “ (prev = head_dispatch_case) ” 
  &&  “ (before_prev = last) ”
  &&  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |->_)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  (xizi_dllseg next first head_dispatch_case last nodes_after )
.

Definition DoubleLinkListInsertNodeBefore_derive_sentinel_case_by_dispatch_case := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_sentinel_case: (@list Z)) ,
  (xizi_dll linklist_pre nodes_sentinel_case )
  **  (xizi_dll_node linklist_node_pre )
|--
EX (head_dispatch_case: Z) (nodes_dispatch_case: (@list Z)) ,
  (“ (xizi_double_link_insert_before_anchor head_dispatch_case nodes_dispatch_case linklist_pre ) ”
  &&  (xizi_dll head_dispatch_case nodes_dispatch_case )
  **  (xizi_dll_node linklist_node_pre ))
  **
  (((xizi_dll head_dispatch_case (xizi_double_link_insert_before_nodes (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) ))
  -*
  ((xizi_dll linklist_pre (app (nodes_sentinel_case) ((cons (linklist_node_pre) (nil)))) )))
.

Definition DoubleLinkListInsertNodeBefore_derive_member_case_by_dispatch_case := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_member_case: (@list Z)) (head_member_case: Z) ,
  “ (In linklist_pre nodes_member_case ) ”
  &&  (xizi_dll head_member_case nodes_member_case )
  **  (xizi_dll_node linklist_node_pre )
|--
EX (head_dispatch_case: Z) (nodes_dispatch_case: (@list Z)) ,
  (“ (xizi_double_link_insert_before_anchor head_dispatch_case nodes_dispatch_case linklist_pre ) ”
  &&  (xizi_dll head_dispatch_case nodes_dispatch_case )
  **  (xizi_dll_node linklist_node_pre ))
  **
  (((xizi_dll head_dispatch_case (xizi_double_link_insert_before_nodes (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) ))
  -*
  ((xizi_dll head_member_case (xizi_double_link_insert_before_nodes (nodes_member_case) (linklist_pre) (linklist_node_pre)) )))
.

Module Type VC_Correct.

Include xizi_double_link_Strategy_Correct.

Axiom proof_of_DoubleLinkListInsertNodeBefore_entail_wit_1 : DoubleLinkListInsertNodeBefore_entail_wit_1.
Axiom proof_of_DoubleLinkListInsertNodeBefore_return_wit_1 : DoubleLinkListInsertNodeBefore_return_wit_1.
Axiom proof_of_DoubleLinkListInsertNodeBefore_return_wit_2 : DoubleLinkListInsertNodeBefore_return_wit_2.
Axiom proof_of_DoubleLinkListInsertNodeBefore_return_wit_3 : DoubleLinkListInsertNodeBefore_return_wit_3.
Axiom proof_of_DoubleLinkListInsertNodeBefore_return_wit_4 : DoubleLinkListInsertNodeBefore_return_wit_4.
Axiom proof_of_DoubleLinkListInsertNodeBefore_partial_solve_wit_1 : DoubleLinkListInsertNodeBefore_partial_solve_wit_1.
Axiom proof_of_DoubleLinkListInsertNodeBefore_partial_solve_wit_2 : DoubleLinkListInsertNodeBefore_partial_solve_wit_2.
Axiom proof_of_DoubleLinkListInsertNodeBefore_partial_solve_wit_3 : DoubleLinkListInsertNodeBefore_partial_solve_wit_3.
Axiom proof_of_DoubleLinkListInsertNodeBefore_partial_solve_wit_4 : DoubleLinkListInsertNodeBefore_partial_solve_wit_4.
Axiom proof_of_DoubleLinkListInsertNodeBefore_derive_sentinel_case_by_dispatch_case : DoubleLinkListInsertNodeBefore_derive_sentinel_case_by_dispatch_case.
Axiom proof_of_DoubleLinkListInsertNodeBefore_derive_member_case_by_dispatch_case : DoubleLinkListInsertNodeBefore_derive_member_case_by_dispatch_case.

End VC_Correct.
