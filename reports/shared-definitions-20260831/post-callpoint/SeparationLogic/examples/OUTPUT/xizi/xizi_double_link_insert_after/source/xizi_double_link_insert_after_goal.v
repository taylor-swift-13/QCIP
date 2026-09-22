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

(*----- Function DoubleLinkListInsertNodeAfter -----*)

Definition DoubleLinkListInsertNodeAfter_entail_wit_1 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (head_dispatch_case: Z) (PreH1 : (xizi_double_link_insert_after_anchor head_dispatch_case nodes_dispatch_case linklist_pre )) ,
  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  (xizi_dll head_dispatch_case nodes_dispatch_case )
  **  (xizi_dll_node linklist_node_pre )
|--
  (EX (next_next: Z)  (old_prev: Z)  (last: Z)  (first: Z)  (old_next: Z)  (rest: (@list Z))  (nodes_before: (@list Z))  (nodes_after: (@list Z)) ,
  “ (head_dispatch_case <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ (nodes_dispatch_case = (app (nodes_before) ((cons (linklist_pre) (nodes_after))))) ” 
  &&  “ ~((In linklist_pre nodes_before )) ” 
  &&  “ ((xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_pre) ((cons (linklist_node_pre) (nodes_after))))))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (nodes_after = (cons (old_next) (rest))) ” 
  &&  “ (old_next <> 0) ”
  &&  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  (xizi_dll_node linklist_node_pre )
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first head_dispatch_case linklist_pre old_prev nodes_before )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> old_next)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> old_prev)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_next)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_pre)
  **  (xizi_dllseg next_next old_next head_dispatch_case last rest ))
  ||
  (EX (old_prev: Z)  (first: Z)  (nodes_before: (@list Z))  (nodes_after: (@list Z)) ,
  “ (head_dispatch_case <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ (nodes_dispatch_case = (app (nodes_before) ((cons (linklist_pre) (nodes_after))))) ” 
  &&  “ ~((In linklist_pre nodes_before )) ” 
  &&  “ ((xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_pre) ((cons (linklist_node_pre) (nodes_after))))))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (nodes_after = (@nil Z)) ”
  &&  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  (xizi_dll_node linklist_node_pre )
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_dllseg first head_dispatch_case linklist_pre old_prev nodes_before )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> old_prev)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_pre))
  ||
  (EX (next_next: Z)  (last: Z)  (old_next: Z)  (rest_2: (@list Z)) ,
  “ (head_dispatch_case = linklist_pre) ” 
  &&  “ (head_dispatch_case <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ ((xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (head_dispatch_case) (linklist_node_pre)) = (cons (linklist_node_pre) (nodes_dispatch_case))) ” 
  &&  “ (nodes_dispatch_case = (cons (old_next) (rest_2))) ” 
  &&  “ (old_next <> 0) ”
  &&  ((( &( "linklist" ) )) # Ptr  |-> head_dispatch_case)
  **  (xizi_dll_node linklist_node_pre )
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> old_next)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_next)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> head_dispatch_case)
  **  (xizi_dllseg next_next old_next head_dispatch_case last rest_2 ))
  ||
  (EX (old_next: Z)  (last: Z)  (first: Z) ,
  “ (head_dispatch_case = linklist_pre) ” 
  &&  “ (head_dispatch_case <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ ((xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (head_dispatch_case) (linklist_node_pre)) = (cons (linklist_node_pre) (nodes_dispatch_case))) ” 
  &&  “ (nodes_dispatch_case = (@nil Z)) ” 
  &&  “ (first = head_dispatch_case) ” 
  &&  “ (last = head_dispatch_case) ” 
  &&  “ (old_next = head_dispatch_case) ”
  &&  ((( &( "linklist" ) )) # Ptr  |-> head_dispatch_case)
  **  (xizi_dll_node linklist_node_pre )
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> head_dispatch_case))
.

Definition DoubleLinkListInsertNodeAfter_return_wit_1 := 
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (head_dispatch_case: Z) (first: Z) (last: Z) (old_next: Z) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (head_dispatch_case = linklist_pre)) (PreH3 : (head_dispatch_case <> 0)) (PreH4 : (linklist_node_pre <> 0)) (PreH5 : ((xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (head_dispatch_case) (linklist_node_pre)) = (cons (linklist_node_pre) (nodes_dispatch_case)))) (PreH6 : (nodes_dispatch_case = (@nil Z))) (PreH7 : (first = head_dispatch_case)) (PreH8 : (last = head_dispatch_case)) (PreH9 : (old_next = head_dispatch_case)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> head_dispatch_case)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
|--
  (xizi_dll head_dispatch_case (xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) )
) \/
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (head_dispatch_case: Z) (first: Z) (last: Z) (old_next: Z) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (head_dispatch_case = linklist_pre)) (PreH3 : (head_dispatch_case <> 0)) (PreH4 : (linklist_node_pre <> 0)) (PreH5 : ((xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (head_dispatch_case) (linklist_node_pre)) = (cons (linklist_node_pre) (nodes_dispatch_case)))) (PreH6 : (nodes_dispatch_case = (@nil Z))) (PreH7 : (first = head_dispatch_case)) (PreH8 : (last = head_dispatch_case)) (PreH9 : (old_next = head_dispatch_case)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> head_dispatch_case)
|--
  (xizi_dllseg linklist_node_pre head_dispatch_case head_dispatch_case linklist_node_pre (xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) )
).

Definition DoubleLinkListInsertNodeAfter_return_wit_1_split_goal_spatial := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (head_dispatch_case: Z) (first: Z) (last: Z) (old_next: Z) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (head_dispatch_case = linklist_pre)) (PreH3 : (head_dispatch_case <> 0)) (PreH4 : (linklist_node_pre <> 0)) (PreH5 : ((xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (head_dispatch_case) (linklist_node_pre)) = (cons (linklist_node_pre) (nodes_dispatch_case)))) (PreH6 : (nodes_dispatch_case = (@nil Z))) (PreH7 : (first = head_dispatch_case)) (PreH8 : (last = head_dispatch_case)) (PreH9 : (old_next = head_dispatch_case)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> head_dispatch_case)
|--
  (xizi_dllseg linklist_node_pre head_dispatch_case head_dispatch_case linklist_node_pre (xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) )
.

Definition DoubleLinkListInsertNodeAfter_return_wit_2 := 
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (head_dispatch_case: Z) (last: Z) (old_next: Z) (next_next: Z) (rest: (@list Z)) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (head_dispatch_case = linklist_pre)) (PreH3 : (head_dispatch_case <> 0)) (PreH4 : (linklist_node_pre <> 0)) (PreH5 : ((xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (head_dispatch_case) (linklist_node_pre)) = (cons (linklist_node_pre) (nodes_dispatch_case)))) (PreH6 : (nodes_dispatch_case = (cons (old_next) (rest)))) (PreH7 : (old_next <> 0)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> old_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> head_dispatch_case)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_next)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg next_next old_next head_dispatch_case last rest )
|--
  (xizi_dll head_dispatch_case (xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) )
) \/
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (head_dispatch_case: Z) (last: Z) (old_next: Z) (next_next: Z) (rest: (@list Z)) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (head_dispatch_case = linklist_pre)) (PreH3 : (head_dispatch_case <> 0)) (PreH4 : (linklist_node_pre <> 0)) (PreH5 : ((xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (head_dispatch_case) (linklist_node_pre)) = (cons (linklist_node_pre) (nodes_dispatch_case)))) (PreH6 : (nodes_dispatch_case = (cons (old_next) (rest)))) (PreH7 : (old_next <> 0)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> old_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> head_dispatch_case)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_next)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg next_next old_next head_dispatch_case last rest )
|--
  (xizi_dllseg linklist_node_pre head_dispatch_case head_dispatch_case last (xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) )
).

Definition DoubleLinkListInsertNodeAfter_return_wit_2_split_goal_spatial := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (head_dispatch_case: Z) (last: Z) (old_next: Z) (next_next: Z) (rest: (@list Z)) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (head_dispatch_case = linklist_pre)) (PreH3 : (head_dispatch_case <> 0)) (PreH4 : (linklist_node_pre <> 0)) (PreH5 : ((xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (head_dispatch_case) (linklist_node_pre)) = (cons (linklist_node_pre) (nodes_dispatch_case)))) (PreH6 : (nodes_dispatch_case = (cons (old_next) (rest)))) (PreH7 : (old_next <> 0)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> old_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> head_dispatch_case)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_next)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg next_next old_next head_dispatch_case last rest )
|--
  (xizi_dllseg linklist_node_pre head_dispatch_case head_dispatch_case last (xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) )
.

Definition DoubleLinkListInsertNodeAfter_return_wit_3 := 
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (head_dispatch_case: Z) (first: Z) (old_prev: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (head_dispatch_case <> 0)) (PreH3 : (linklist_node_pre <> 0)) (PreH4 : (nodes_dispatch_case = (app (nodes_before) ((cons (linklist_pre) (nodes_after)))))) (PreH5 : ~((In linklist_pre nodes_before ))) (PreH6 : ((xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_pre) ((cons (linklist_node_pre) (nodes_after)))))))) (PreH7 : (linklist_pre <> 0)) (PreH8 : (nodes_after = (@nil Z))) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_pre)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_dllseg first head_dispatch_case linklist_pre old_prev nodes_before )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> old_prev)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
|--
  (xizi_dll head_dispatch_case (xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) )
) \/
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (head_dispatch_case: Z) (first: Z) (old_prev: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (head_dispatch_case <> 0)) (PreH3 : (linklist_node_pre <> 0)) (PreH4 : (nodes_dispatch_case = (app (nodes_before) ((cons (linklist_pre) (nodes_after)))))) (PreH5 : ~((In linklist_pre nodes_before ))) (PreH6 : ((xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_pre) ((cons (linklist_node_pre) (nodes_after)))))))) (PreH7 : (linklist_pre <> 0)) (PreH8 : (nodes_after = (@nil Z))) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_pre)
  **  (xizi_dllseg first head_dispatch_case linklist_pre old_prev nodes_before )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> old_prev)
|--
  (xizi_dllseg first head_dispatch_case head_dispatch_case linklist_node_pre (xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) )
).

Definition DoubleLinkListInsertNodeAfter_return_wit_3_split_goal_spatial := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (head_dispatch_case: Z) (first: Z) (old_prev: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (head_dispatch_case <> 0)) (PreH3 : (linklist_node_pre <> 0)) (PreH4 : (nodes_dispatch_case = (app (nodes_before) ((cons (linklist_pre) (nodes_after)))))) (PreH5 : ~((In linklist_pre nodes_before ))) (PreH6 : ((xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_pre) ((cons (linklist_node_pre) (nodes_after)))))))) (PreH7 : (linklist_pre <> 0)) (PreH8 : (nodes_after = (@nil Z))) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_pre)
  **  (xizi_dllseg first head_dispatch_case linklist_pre old_prev nodes_before )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> old_prev)
|--
  (xizi_dllseg first head_dispatch_case head_dispatch_case linklist_node_pre (xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) )
.

Definition DoubleLinkListInsertNodeAfter_return_wit_4 := 
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (head_dispatch_case: Z) (first: Z) (last: Z) (old_next: Z) (old_prev: Z) (next_next: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (rest: (@list Z)) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (head_dispatch_case <> 0)) (PreH3 : (linklist_node_pre <> 0)) (PreH4 : (nodes_dispatch_case = (app (nodes_before) ((cons (linklist_pre) (nodes_after)))))) (PreH5 : ~((In linklist_pre nodes_before ))) (PreH6 : ((xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_pre) ((cons (linklist_node_pre) (nodes_after)))))))) (PreH7 : (linklist_pre <> 0)) (PreH8 : (nodes_after = (cons (old_next) (rest)))) (PreH9 : (old_next <> 0)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> old_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_pre)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first head_dispatch_case linklist_pre old_prev nodes_before )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> old_prev)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_next)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg next_next old_next head_dispatch_case last rest )
|--
  (xizi_dll head_dispatch_case (xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) )
) \/
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (head_dispatch_case: Z) (first: Z) (last: Z) (old_next: Z) (old_prev: Z) (next_next: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (rest: (@list Z)) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (head_dispatch_case <> 0)) (PreH3 : (linklist_node_pre <> 0)) (PreH4 : (nodes_dispatch_case = (app (nodes_before) ((cons (linklist_pre) (nodes_after)))))) (PreH5 : ~((In linklist_pre nodes_before ))) (PreH6 : ((xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_pre) ((cons (linklist_node_pre) (nodes_after)))))))) (PreH7 : (linklist_pre <> 0)) (PreH8 : (nodes_after = (cons (old_next) (rest)))) (PreH9 : (old_next <> 0)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> old_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_pre)
  **  (xizi_dllseg first head_dispatch_case linklist_pre old_prev nodes_before )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> old_prev)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_next)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg next_next old_next head_dispatch_case last rest )
|--
  (xizi_dllseg first head_dispatch_case head_dispatch_case last (xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) )
).

Definition DoubleLinkListInsertNodeAfter_return_wit_4_split_goal_spatial := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (head_dispatch_case: Z) (first: Z) (last: Z) (old_next: Z) (old_prev: Z) (next_next: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (rest: (@list Z)) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (head_dispatch_case <> 0)) (PreH3 : (linklist_node_pre <> 0)) (PreH4 : (nodes_dispatch_case = (app (nodes_before) ((cons (linklist_pre) (nodes_after)))))) (PreH5 : ~((In linklist_pre nodes_before ))) (PreH6 : ((xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_pre) ((cons (linklist_node_pre) (nodes_after)))))))) (PreH7 : (linklist_pre <> 0)) (PreH8 : (nodes_after = (cons (old_next) (rest)))) (PreH9 : (old_next <> 0)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> old_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_pre)
  **  (xizi_dllseg first head_dispatch_case linklist_pre old_prev nodes_before )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> old_prev)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_next)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg next_next old_next head_dispatch_case last rest )
|--
  (xizi_dllseg first head_dispatch_case head_dispatch_case last (xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) )
.

Definition DoubleLinkListInsertNodeAfter_partial_solve_wit_1 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (head_dispatch_case: Z) (first: Z) (last: Z) (old_next: Z) (PreH1 : (head_dispatch_case = linklist_pre)) (PreH2 : (head_dispatch_case <> 0)) (PreH3 : (linklist_node_pre <> 0)) (PreH4 : ((xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (head_dispatch_case) (linklist_node_pre)) = (cons (linklist_node_pre) (nodes_dispatch_case)))) (PreH5 : (nodes_dispatch_case = (@nil Z))) (PreH6 : (first = head_dispatch_case)) (PreH7 : (last = head_dispatch_case)) (PreH8 : (old_next = head_dispatch_case)) ,
  (xizi_dll_node linklist_node_pre )
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
|--
  “ (linklist_node_pre <> 0) ” 
  &&  “ (head_dispatch_case = linklist_pre) ” 
  &&  “ (head_dispatch_case <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ ((xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (head_dispatch_case) (linklist_node_pre)) = (cons (linklist_node_pre) (nodes_dispatch_case))) ” 
  &&  “ (nodes_dispatch_case = (@nil Z)) ” 
  &&  “ (first = head_dispatch_case) ” 
  &&  “ (last = head_dispatch_case) ” 
  &&  “ (old_next = head_dispatch_case) ”
  &&  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |->_)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
.

Definition DoubleLinkListInsertNodeAfter_partial_solve_wit_2 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (head_dispatch_case: Z) (last: Z) (old_next: Z) (next_next: Z) (rest: (@list Z)) (PreH1 : (head_dispatch_case = linklist_pre)) (PreH2 : (head_dispatch_case <> 0)) (PreH3 : (linklist_node_pre <> 0)) (PreH4 : ((xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (head_dispatch_case) (linklist_node_pre)) = (cons (linklist_node_pre) (nodes_dispatch_case)))) (PreH5 : (nodes_dispatch_case = (cons (old_next) (rest)))) (PreH6 : (old_next <> 0)) ,
  (xizi_dll_node linklist_node_pre )
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> old_next)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_next)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg next_next old_next head_dispatch_case last rest )
|--
  “ (linklist_node_pre <> 0) ” 
  &&  “ (head_dispatch_case = linklist_pre) ” 
  &&  “ (head_dispatch_case <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ ((xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (head_dispatch_case) (linklist_node_pre)) = (cons (linklist_node_pre) (nodes_dispatch_case))) ” 
  &&  “ (nodes_dispatch_case = (cons (old_next) (rest))) ” 
  &&  “ (old_next <> 0) ”
  &&  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |->_)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> old_next)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_next)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg next_next old_next head_dispatch_case last rest )
.

Definition DoubleLinkListInsertNodeAfter_partial_solve_wit_3 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (head_dispatch_case: Z) (first: Z) (old_prev: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (PreH1 : (head_dispatch_case <> 0)) (PreH2 : (linklist_node_pre <> 0)) (PreH3 : (nodes_dispatch_case = (app (nodes_before) ((cons (linklist_pre) (nodes_after)))))) (PreH4 : ~((In linklist_pre nodes_before ))) (PreH5 : ((xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_pre) ((cons (linklist_node_pre) (nodes_after)))))))) (PreH6 : (linklist_pre <> 0)) (PreH7 : (nodes_after = (@nil Z))) ,
  (xizi_dll_node linklist_node_pre )
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_dllseg first head_dispatch_case linklist_pre old_prev nodes_before )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> old_prev)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
|--
  “ (linklist_node_pre <> 0) ” 
  &&  “ (head_dispatch_case <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ (nodes_dispatch_case = (app (nodes_before) ((cons (linklist_pre) (nodes_after))))) ” 
  &&  “ ~((In linklist_pre nodes_before )) ” 
  &&  “ ((xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_pre) ((cons (linklist_node_pre) (nodes_after))))))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (nodes_after = (@nil Z)) ”
  &&  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |->_)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_dllseg first head_dispatch_case linklist_pre old_prev nodes_before )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> old_prev)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
.

Definition DoubleLinkListInsertNodeAfter_partial_solve_wit_4 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (head_dispatch_case: Z) (first: Z) (last: Z) (old_next: Z) (old_prev: Z) (next_next: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (rest: (@list Z)) (PreH1 : (head_dispatch_case <> 0)) (PreH2 : (linklist_node_pre <> 0)) (PreH3 : (nodes_dispatch_case = (app (nodes_before) ((cons (linklist_pre) (nodes_after)))))) (PreH4 : ~((In linklist_pre nodes_before ))) (PreH5 : ((xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_pre) ((cons (linklist_node_pre) (nodes_after)))))))) (PreH6 : (linklist_pre <> 0)) (PreH7 : (nodes_after = (cons (old_next) (rest)))) (PreH8 : (old_next <> 0)) ,
  (xizi_dll_node linklist_node_pre )
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first head_dispatch_case linklist_pre old_prev nodes_before )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> old_next)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> old_prev)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_next)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg next_next old_next head_dispatch_case last rest )
|--
  “ (linklist_node_pre <> 0) ” 
  &&  “ (head_dispatch_case <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ (nodes_dispatch_case = (app (nodes_before) ((cons (linklist_pre) (nodes_after))))) ” 
  &&  “ ~((In linklist_pre nodes_before )) ” 
  &&  “ ((xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_pre) ((cons (linklist_node_pre) (nodes_after))))))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (nodes_after = (cons (old_next) (rest))) ” 
  &&  “ (old_next <> 0) ”
  &&  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |->_)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first head_dispatch_case linklist_pre old_prev nodes_before )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> old_next)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> old_prev)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_next)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg next_next old_next head_dispatch_case last rest )
.

Definition DoubleLinkListInsertNodeAfter_derive_sentinel_case_by_dispatch_case := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_sentinel_case: (@list Z)) ,
  (xizi_dll linklist_pre nodes_sentinel_case )
  **  (xizi_dll_node linklist_node_pre )
|--
EX (head_dispatch_case: Z) (nodes_dispatch_case: (@list Z)) ,
  (“ (xizi_double_link_insert_after_anchor head_dispatch_case nodes_dispatch_case linklist_pre ) ”
  &&  (xizi_dll head_dispatch_case nodes_dispatch_case )
  **  (xizi_dll_node linklist_node_pre ))
  **
  (((xizi_dll head_dispatch_case (xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) ))
  -*
  ((xizi_dll linklist_pre (cons (linklist_node_pre) (nodes_sentinel_case)) )))
.

Definition DoubleLinkListInsertNodeAfter_derive_member_case_by_dispatch_case := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_member_case: (@list Z)) (head_member_case: Z) ,
  “ (In linklist_pre nodes_member_case ) ”
  &&  (xizi_dll head_member_case nodes_member_case )
  **  (xizi_dll_node linklist_node_pre )
|--
EX (head_dispatch_case: Z) (nodes_dispatch_case: (@list Z)) ,
  (“ (xizi_double_link_insert_after_anchor head_dispatch_case nodes_dispatch_case linklist_pre ) ”
  &&  (xizi_dll head_dispatch_case nodes_dispatch_case )
  **  (xizi_dll_node linklist_node_pre ))
  **
  (((xizi_dll head_dispatch_case (xizi_double_link_insert_after_dispatch_nodes (head_dispatch_case) (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) ))
  -*
  ((xizi_dll head_member_case (xizi_double_link_insert_after_nodes (nodes_member_case) (linklist_pre) (linklist_node_pre)) )))
.

Module Type VC_Correct.

Include xizi_double_link_Strategy_Correct.

Axiom proof_of_DoubleLinkListInsertNodeAfter_entail_wit_1 : DoubleLinkListInsertNodeAfter_entail_wit_1.
Axiom proof_of_DoubleLinkListInsertNodeAfter_return_wit_1 : DoubleLinkListInsertNodeAfter_return_wit_1.
Axiom proof_of_DoubleLinkListInsertNodeAfter_return_wit_2 : DoubleLinkListInsertNodeAfter_return_wit_2.
Axiom proof_of_DoubleLinkListInsertNodeAfter_return_wit_3 : DoubleLinkListInsertNodeAfter_return_wit_3.
Axiom proof_of_DoubleLinkListInsertNodeAfter_return_wit_4 : DoubleLinkListInsertNodeAfter_return_wit_4.
Axiom proof_of_DoubleLinkListInsertNodeAfter_partial_solve_wit_1 : DoubleLinkListInsertNodeAfter_partial_solve_wit_1.
Axiom proof_of_DoubleLinkListInsertNodeAfter_partial_solve_wit_2 : DoubleLinkListInsertNodeAfter_partial_solve_wit_2.
Axiom proof_of_DoubleLinkListInsertNodeAfter_partial_solve_wit_3 : DoubleLinkListInsertNodeAfter_partial_solve_wit_3.
Axiom proof_of_DoubleLinkListInsertNodeAfter_partial_solve_wit_4 : DoubleLinkListInsertNodeAfter_partial_solve_wit_4.
Axiom proof_of_DoubleLinkListInsertNodeAfter_derive_sentinel_case_by_dispatch_case : DoubleLinkListInsertNodeAfter_derive_sentinel_case_by_dispatch_case.
Axiom proof_of_DoubleLinkListInsertNodeAfter_derive_member_case_by_dispatch_case : DoubleLinkListInsertNodeAfter_derive_member_case_by_dispatch_case.

End VC_Correct.
