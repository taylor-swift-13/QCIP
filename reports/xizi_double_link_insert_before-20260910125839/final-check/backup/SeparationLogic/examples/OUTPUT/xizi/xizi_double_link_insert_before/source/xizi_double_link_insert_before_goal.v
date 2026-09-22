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
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@XiziStoreADLL.DL_Node A))) (head_dispatch_case: Z) (data_dispatch_case: A) (storeA_dispatch_case: (Z -> (A -> Assertion))) (PreH1 : (xizi_double_link_insert_before_anchor head_dispatch_case (xizi_dll_ptrs (nodes_dispatch_case)) linklist_pre )) ,
  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  (xizi_store_dll storeA_dispatch_case head_dispatch_case nodes_dispatch_case )
  **  (xizi_dll_node linklist_node_pre )
  **  (storeA_dispatch_case linklist_node_pre data_dispatch_case )
|--
  (EX (first: Z)  (last: Z)  (next: Z)  (before_prev: Z)  (prev: Z)  (nodes_before: (@list Z))  (nodes_after: (@list Z))  (result: (@list (@XiziStoreADLL.DL_Node A)))  (ptrs: (@list Z)) ,
  “ (first = linklist_pre) ” 
  &&  “ (ptrs = (xizi_dll_ptrs (nodes_dispatch_case))) ” 
  &&  “ (xizi_insert_before_payload nodes_dispatch_case first (XiziStoreADLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ” 
  &&  “ ((xizi_dll_ptrs (result)) = (xizi_double_link_insert_before_nodes (ptrs) (first) (linklist_node_pre))) ” 
  &&  “ (head_dispatch_case <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ (ptrs = (app (nodes_before) ((cons (first) (nodes_after))))) ” 
  &&  “ ~((In first nodes_before )) ” 
  &&  “ ((xizi_double_link_insert_before_nodes (ptrs) (first) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (first) (nodes_after))))))) ” 
  &&  “ (first <> 0) ” 
  &&  “ (first <> head_dispatch_case) ” 
  &&  “ (nodes_before = (@nil Z)) ” 
  &&  “ (prev = head_dispatch_case) ” 
  &&  “ (before_prev = last) ”
  &&  ((( &( "linklist" ) )) # Ptr  |-> first)
  **  (xizi_dll_payloads storeA_dispatch_case result )
  **  (xizi_dll_node linklist_node_pre )
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  (xizi_dllseg next first head_dispatch_case last nodes_after ))
  ||
  (EX (first: Z)  (prefix0: (@list Z))  (last: Z)  (next: Z)  (before_prev: Z)  (prev: Z)  (nodes_before: (@list Z))  (nodes_after: (@list Z))  (result: (@list (@XiziStoreADLL.DL_Node A)))  (ptrs: (@list Z)) ,
  “ (ptrs = (xizi_dll_ptrs (nodes_dispatch_case))) ” 
  &&  “ (xizi_insert_before_payload nodes_dispatch_case linklist_pre (XiziStoreADLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ” 
  &&  “ ((xizi_dll_ptrs (result)) = (xizi_double_link_insert_before_nodes (ptrs) (linklist_pre) (linklist_node_pre))) ” 
  &&  “ (head_dispatch_case <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ (ptrs = (app (nodes_before) ((cons (linklist_pre) (nodes_after))))) ” 
  &&  “ ~((In linklist_pre nodes_before )) ” 
  &&  “ ((xizi_double_link_insert_before_nodes (ptrs) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (linklist_pre) (nodes_after))))))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_pre <> head_dispatch_case) ” 
  &&  “ (nodes_before = (app (prefix0) ((cons (prev) ((@nil Z)))))) ” 
  &&  “ (prev <> 0) ” 
  &&  “ (prev <> head_dispatch_case) ”
  &&  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  (xizi_dll_payloads storeA_dispatch_case result )
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
  (EX (first: Z)  (before_prev: Z)  (prefix0_2: (@list Z))  (prev: Z)  (result: (@list (@XiziStoreADLL.DL_Node A)))  (ptrs: (@list Z)) ,
  “ (head_dispatch_case = linklist_pre) ” 
  &&  “ (ptrs = (xizi_dll_ptrs (nodes_dispatch_case))) ” 
  &&  “ (xizi_insert_before_payload nodes_dispatch_case head_dispatch_case (XiziStoreADLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ” 
  &&  “ ((xizi_dll_ptrs (result)) = (xizi_double_link_insert_before_nodes (ptrs) (head_dispatch_case) (linklist_node_pre))) ” 
  &&  “ (head_dispatch_case <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ ((xizi_double_link_insert_before_nodes (ptrs) (head_dispatch_case) (linklist_node_pre)) = (app (ptrs) ((cons (linklist_node_pre) ((@nil Z)))))) ” 
  &&  “ (ptrs = (app (prefix0_2) ((cons (prev) ((@nil Z)))))) ” 
  &&  “ (prev <> 0) ” 
  &&  “ (prev <> head_dispatch_case) ”
  &&  ((( &( "linklist" ) )) # Ptr  |-> head_dispatch_case)
  **  (xizi_dll_payloads storeA_dispatch_case result )
  **  (xizi_dll_node linklist_node_pre )
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  (xizi_dllseg first head_dispatch_case prev before_prev prefix0_2 ))
  ||
  (EX (first: Z)  (before_prev: Z)  (prev: Z)  (result: (@list (@XiziStoreADLL.DL_Node A)))  (ptrs: (@list Z)) ,
  “ (head_dispatch_case = linklist_pre) ” 
  &&  “ (ptrs = (xizi_dll_ptrs (nodes_dispatch_case))) ” 
  &&  “ (xizi_insert_before_payload nodes_dispatch_case head_dispatch_case (XiziStoreADLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ” 
  &&  “ ((xizi_dll_ptrs (result)) = (xizi_double_link_insert_before_nodes (ptrs) (head_dispatch_case) (linklist_node_pre))) ” 
  &&  “ (head_dispatch_case <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ ((xizi_double_link_insert_before_nodes (ptrs) (head_dispatch_case) (linklist_node_pre)) = (app (ptrs) ((cons (linklist_node_pre) ((@nil Z)))))) ” 
  &&  “ (ptrs = (@nil Z)) ” 
  &&  “ (prev = head_dispatch_case) ” 
  &&  “ (before_prev = head_dispatch_case) ” 
  &&  “ (first = head_dispatch_case) ”
  &&  ((( &( "linklist" ) )) # Ptr  |-> head_dispatch_case)
  **  (xizi_dll_payloads storeA_dispatch_case result )
  **  (xizi_dll_node linklist_node_pre )
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> head_dispatch_case))
.

Definition DoubleLinkListInsertNodeBefore_return_wit_1 := 
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@XiziStoreADLL.DL_Node A))) (head_dispatch_case: Z) (data_dispatch_case: A) (storeA_dispatch_case: (Z -> (A -> Assertion))) (ptrs: (@list Z)) (result_2: (@list (@XiziStoreADLL.DL_Node A))) (first: Z) (prev: Z) (before_prev: Z) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (head_dispatch_case = linklist_pre)) (PreH3 : (ptrs = (xizi_dll_ptrs (nodes_dispatch_case)))) (PreH4 : (xizi_insert_before_payload nodes_dispatch_case head_dispatch_case (XiziStoreADLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result_2 )) (PreH5 : ((xizi_dll_ptrs (result_2)) = (xizi_double_link_insert_before_nodes (ptrs) (head_dispatch_case) (linklist_node_pre)))) (PreH6 : (head_dispatch_case <> 0)) (PreH7 : (linklist_node_pre <> 0)) (PreH8 : ((xizi_double_link_insert_before_nodes (ptrs) (head_dispatch_case) (linklist_node_pre)) = (app (ptrs) ((cons (linklist_node_pre) ((@nil Z))))))) (PreH9 : (ptrs = (@nil Z))) (PreH10 : (prev = head_dispatch_case)) (PreH11 : (before_prev = head_dispatch_case)) (PreH12 : (first = head_dispatch_case)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> head_dispatch_case)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
  **  (xizi_dll_payloads storeA_dispatch_case result_2 )
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
|--
  EX (result: (@list (@XiziStoreADLL.DL_Node A))) ,
  “ (xizi_insert_before_payload nodes_dispatch_case linklist_pre (XiziStoreADLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ”
  &&  (xizi_store_dll storeA_dispatch_case head_dispatch_case result )
) \/
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@XiziStoreADLL.DL_Node A))) (head_dispatch_case: Z) (data_dispatch_case: A) (storeA_dispatch_case: (Z -> (A -> Assertion))) (ptrs: (@list Z)) (result_2: (@list (@XiziStoreADLL.DL_Node A))) (first: Z) (prev: Z) (before_prev: Z) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (head_dispatch_case = linklist_pre)) (PreH3 : (ptrs = (xizi_dll_ptrs (nodes_dispatch_case)))) (PreH4 : (xizi_insert_before_payload nodes_dispatch_case head_dispatch_case (XiziStoreADLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result_2 )) (PreH5 : ((xizi_dll_ptrs (result_2)) = (xizi_double_link_insert_before_nodes (ptrs) (head_dispatch_case) (linklist_node_pre)))) (PreH6 : (head_dispatch_case <> 0)) (PreH7 : (linklist_node_pre <> 0)) (PreH8 : ((xizi_double_link_insert_before_nodes (ptrs) (head_dispatch_case) (linklist_node_pre)) = (app (ptrs) ((cons (linklist_node_pre) ((@nil Z))))))) (PreH9 : (ptrs = (@nil Z))) (PreH10 : (prev = head_dispatch_case)) (PreH11 : (before_prev = head_dispatch_case)) (PreH12 : (first = head_dispatch_case)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> head_dispatch_case)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
  **  (xizi_dll_payloads storeA_dispatch_case result_2 )
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
|--
  EX (result: (@list (@XiziStoreADLL.DL_Node A))) ,
  “ (xizi_insert_before_payload nodes_dispatch_case linklist_pre (XiziStoreADLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ”
  &&  (xizi_store_dll storeA_dispatch_case head_dispatch_case result )
).

Definition DoubleLinkListInsertNodeBefore_return_wit_2 := 
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@XiziStoreADLL.DL_Node A))) (head_dispatch_case: Z) (data_dispatch_case: A) (storeA_dispatch_case: (Z -> (A -> Assertion))) (ptrs: (@list Z)) (result_2: (@list (@XiziStoreADLL.DL_Node A))) (first: Z) (prev: Z) (before_prev: Z) (prefix0: (@list Z)) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (head_dispatch_case = linklist_pre)) (PreH3 : (ptrs = (xizi_dll_ptrs (nodes_dispatch_case)))) (PreH4 : (xizi_insert_before_payload nodes_dispatch_case head_dispatch_case (XiziStoreADLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result_2 )) (PreH5 : ((xizi_dll_ptrs (result_2)) = (xizi_double_link_insert_before_nodes (ptrs) (head_dispatch_case) (linklist_node_pre)))) (PreH6 : (head_dispatch_case <> 0)) (PreH7 : (linklist_node_pre <> 0)) (PreH8 : ((xizi_double_link_insert_before_nodes (ptrs) (head_dispatch_case) (linklist_node_pre)) = (app (ptrs) ((cons (linklist_node_pre) ((@nil Z))))))) (PreH9 : (ptrs = (app (prefix0) ((cons (prev) ((@nil Z))))))) (PreH10 : (prev <> 0)) (PreH11 : (prev <> head_dispatch_case)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
  **  (xizi_dll_payloads storeA_dispatch_case result_2 )
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg first head_dispatch_case prev before_prev prefix0 )
|--
  EX (result: (@list (@XiziStoreADLL.DL_Node A))) ,
  “ (xizi_insert_before_payload nodes_dispatch_case linklist_pre (XiziStoreADLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ”
  &&  (xizi_store_dll storeA_dispatch_case head_dispatch_case result )
) \/
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@XiziStoreADLL.DL_Node A))) (head_dispatch_case: Z) (data_dispatch_case: A) (storeA_dispatch_case: (Z -> (A -> Assertion))) (ptrs: (@list Z)) (result_2: (@list (@XiziStoreADLL.DL_Node A))) (first: Z) (prev: Z) (before_prev: Z) (prefix0: (@list Z)) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (head_dispatch_case = linklist_pre)) (PreH3 : (ptrs = (xizi_dll_ptrs (nodes_dispatch_case)))) (PreH4 : (xizi_insert_before_payload nodes_dispatch_case head_dispatch_case (XiziStoreADLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result_2 )) (PreH5 : ((xizi_dll_ptrs (result_2)) = (xizi_double_link_insert_before_nodes (ptrs) (head_dispatch_case) (linklist_node_pre)))) (PreH6 : (head_dispatch_case <> 0)) (PreH7 : (linklist_node_pre <> 0)) (PreH8 : ((xizi_double_link_insert_before_nodes (ptrs) (head_dispatch_case) (linklist_node_pre)) = (app (ptrs) ((cons (linklist_node_pre) ((@nil Z))))))) (PreH9 : (ptrs = (app (prefix0) ((cons (prev) ((@nil Z))))))) (PreH10 : (prev <> 0)) (PreH11 : (prev <> head_dispatch_case)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
  **  (xizi_dll_payloads storeA_dispatch_case result_2 )
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg first head_dispatch_case prev before_prev prefix0 )
|--
  EX (result: (@list (@XiziStoreADLL.DL_Node A))) ,
  “ (xizi_insert_before_payload nodes_dispatch_case linklist_pre (XiziStoreADLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ”
  &&  (xizi_store_dll storeA_dispatch_case head_dispatch_case result )
).

Definition DoubleLinkListInsertNodeBefore_return_wit_3 := 
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@XiziStoreADLL.DL_Node A))) (head_dispatch_case: Z) (data_dispatch_case: A) (storeA_dispatch_case: (Z -> (A -> Assertion))) (ptrs: (@list Z)) (result_2: (@list (@XiziStoreADLL.DL_Node A))) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (last: Z) (prev: Z) (before_prev: Z) (next: Z) (prefix0: (@list Z)) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (ptrs = (xizi_dll_ptrs (nodes_dispatch_case)))) (PreH3 : (xizi_insert_before_payload nodes_dispatch_case linklist_pre (XiziStoreADLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result_2 )) (PreH4 : ((xizi_dll_ptrs (result_2)) = (xizi_double_link_insert_before_nodes (ptrs) (linklist_pre) (linklist_node_pre)))) (PreH5 : (head_dispatch_case <> 0)) (PreH6 : (linklist_node_pre <> 0)) (PreH7 : (ptrs = (app (nodes_before) ((cons (linklist_pre) (nodes_after)))))) (PreH8 : ~((In linklist_pre nodes_before ))) (PreH9 : ((xizi_double_link_insert_before_nodes (ptrs) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (linklist_pre) (nodes_after)))))))) (PreH10 : (linklist_pre <> 0)) (PreH11 : (linklist_pre <> head_dispatch_case)) (PreH12 : (nodes_before = (app (prefix0) ((cons (prev) ((@nil Z))))))) (PreH13 : (prev <> 0)) (PreH14 : (prev <> head_dispatch_case)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_pre)
  **  (xizi_dll_payloads storeA_dispatch_case result_2 )
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg next linklist_pre head_dispatch_case last nodes_after )
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first head_dispatch_case prev before_prev prefix0 )
|--
  EX (result: (@list (@XiziStoreADLL.DL_Node A))) ,
  “ (xizi_insert_before_payload nodes_dispatch_case linklist_pre (XiziStoreADLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ”
  &&  (xizi_store_dll storeA_dispatch_case head_dispatch_case result )
) \/
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@XiziStoreADLL.DL_Node A))) (head_dispatch_case: Z) (data_dispatch_case: A) (storeA_dispatch_case: (Z -> (A -> Assertion))) (ptrs: (@list Z)) (result_2: (@list (@XiziStoreADLL.DL_Node A))) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (last: Z) (prev: Z) (before_prev: Z) (next: Z) (prefix0: (@list Z)) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (ptrs = (xizi_dll_ptrs (nodes_dispatch_case)))) (PreH3 : (xizi_insert_before_payload nodes_dispatch_case linklist_pre (XiziStoreADLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result_2 )) (PreH4 : ((xizi_dll_ptrs (result_2)) = (xizi_double_link_insert_before_nodes (ptrs) (linklist_pre) (linklist_node_pre)))) (PreH5 : (head_dispatch_case <> 0)) (PreH6 : (linklist_node_pre <> 0)) (PreH7 : (ptrs = (app (nodes_before) ((cons (linklist_pre) (nodes_after)))))) (PreH8 : ~((In linklist_pre nodes_before ))) (PreH9 : ((xizi_double_link_insert_before_nodes (ptrs) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (linklist_pre) (nodes_after)))))))) (PreH10 : (linklist_pre <> 0)) (PreH11 : (linklist_pre <> head_dispatch_case)) (PreH12 : (nodes_before = (app (prefix0) ((cons (prev) ((@nil Z))))))) (PreH13 : (prev <> 0)) (PreH14 : (prev <> head_dispatch_case)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_pre)
  **  (xizi_dll_payloads storeA_dispatch_case result_2 )
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg next linklist_pre head_dispatch_case last nodes_after )
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first head_dispatch_case prev before_prev prefix0 )
|--
  EX (result: (@list (@XiziStoreADLL.DL_Node A))) ,
  “ (xizi_insert_before_payload nodes_dispatch_case linklist_pre (XiziStoreADLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ”
  &&  (xizi_store_dll storeA_dispatch_case head_dispatch_case result )
).

Definition DoubleLinkListInsertNodeBefore_return_wit_4 := 
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@XiziStoreADLL.DL_Node A))) (head_dispatch_case: Z) (data_dispatch_case: A) (storeA_dispatch_case: (Z -> (A -> Assertion))) (ptrs: (@list Z)) (result_2: (@list (@XiziStoreADLL.DL_Node A))) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (last: Z) (prev: Z) (before_prev: Z) (next: Z) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (first = linklist_pre)) (PreH3 : (ptrs = (xizi_dll_ptrs (nodes_dispatch_case)))) (PreH4 : (xizi_insert_before_payload nodes_dispatch_case first (XiziStoreADLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result_2 )) (PreH5 : ((xizi_dll_ptrs (result_2)) = (xizi_double_link_insert_before_nodes (ptrs) (first) (linklist_node_pre)))) (PreH6 : (head_dispatch_case <> 0)) (PreH7 : (linklist_node_pre <> 0)) (PreH8 : (ptrs = (app (nodes_before) ((cons (first) (nodes_after)))))) (PreH9 : ~((In first nodes_before ))) (PreH10 : ((xizi_double_link_insert_before_nodes (ptrs) (first) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (first) (nodes_after)))))))) (PreH11 : (first <> 0)) (PreH12 : (first <> head_dispatch_case)) (PreH13 : (nodes_before = (@nil Z))) (PreH14 : (prev = head_dispatch_case)) (PreH15 : (before_prev = last)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_dll_payloads storeA_dispatch_case result_2 )
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg next first head_dispatch_case last nodes_after )
|--
  EX (result: (@list (@XiziStoreADLL.DL_Node A))) ,
  “ (xizi_insert_before_payload nodes_dispatch_case linklist_pre (XiziStoreADLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ”
  &&  (xizi_store_dll storeA_dispatch_case head_dispatch_case result )
) \/
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@XiziStoreADLL.DL_Node A))) (head_dispatch_case: Z) (data_dispatch_case: A) (storeA_dispatch_case: (Z -> (A -> Assertion))) (ptrs: (@list Z)) (result_2: (@list (@XiziStoreADLL.DL_Node A))) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (last: Z) (prev: Z) (before_prev: Z) (next: Z) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (first = linklist_pre)) (PreH3 : (ptrs = (xizi_dll_ptrs (nodes_dispatch_case)))) (PreH4 : (xizi_insert_before_payload nodes_dispatch_case first (XiziStoreADLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result_2 )) (PreH5 : ((xizi_dll_ptrs (result_2)) = (xizi_double_link_insert_before_nodes (ptrs) (first) (linklist_node_pre)))) (PreH6 : (head_dispatch_case <> 0)) (PreH7 : (linklist_node_pre <> 0)) (PreH8 : (ptrs = (app (nodes_before) ((cons (first) (nodes_after)))))) (PreH9 : ~((In first nodes_before ))) (PreH10 : ((xizi_double_link_insert_before_nodes (ptrs) (first) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (first) (nodes_after)))))))) (PreH11 : (first <> 0)) (PreH12 : (first <> head_dispatch_case)) (PreH13 : (nodes_before = (@nil Z))) (PreH14 : (prev = head_dispatch_case)) (PreH15 : (before_prev = last)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_dll_payloads storeA_dispatch_case result_2 )
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg next first head_dispatch_case last nodes_after )
|--
  EX (result: (@list (@XiziStoreADLL.DL_Node A))) ,
  “ (xizi_insert_before_payload nodes_dispatch_case linklist_pre (XiziStoreADLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ”
  &&  (xizi_store_dll storeA_dispatch_case head_dispatch_case result )
).

Definition DoubleLinkListInsertNodeBefore_partial_solve_wit_1 := 
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@XiziStoreADLL.DL_Node A))) (head_dispatch_case: Z) (data_dispatch_case: A) (storeA_dispatch_case: (Z -> (A -> Assertion))) (ptrs: (@list Z)) (result: (@list (@XiziStoreADLL.DL_Node A))) (first: Z) (prev: Z) (before_prev: Z) (PreH1 : (head_dispatch_case = linklist_pre)) (PreH2 : (ptrs = (xizi_dll_ptrs (nodes_dispatch_case)))) (PreH3 : (xizi_insert_before_payload nodes_dispatch_case head_dispatch_case (XiziStoreADLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result )) (PreH4 : ((xizi_dll_ptrs (result)) = (xizi_double_link_insert_before_nodes (ptrs) (head_dispatch_case) (linklist_node_pre)))) (PreH5 : (head_dispatch_case <> 0)) (PreH6 : (linklist_node_pre <> 0)) (PreH7 : ((xizi_double_link_insert_before_nodes (ptrs) (head_dispatch_case) (linklist_node_pre)) = (app (ptrs) ((cons (linklist_node_pre) ((@nil Z))))))) (PreH8 : (ptrs = (@nil Z))) (PreH9 : (prev = head_dispatch_case)) (PreH10 : (before_prev = head_dispatch_case)) (PreH11 : (first = head_dispatch_case)) ,
  (xizi_dll_payloads storeA_dispatch_case result )
  **  (xizi_dll_node linklist_node_pre )
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> head_dispatch_case)
|--
  “ (linklist_node_pre <> 0) ” 
  &&  “ (head_dispatch_case = linklist_pre) ” 
  &&  “ (ptrs = (xizi_dll_ptrs (nodes_dispatch_case))) ” 
  &&  “ (xizi_insert_before_payload nodes_dispatch_case head_dispatch_case (XiziStoreADLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ” 
  &&  “ ((xizi_dll_ptrs (result)) = (xizi_double_link_insert_before_nodes (ptrs) (head_dispatch_case) (linklist_node_pre))) ” 
  &&  “ (head_dispatch_case <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ ((xizi_double_link_insert_before_nodes (ptrs) (head_dispatch_case) (linklist_node_pre)) = (app (ptrs) ((cons (linklist_node_pre) ((@nil Z)))))) ” 
  &&  “ (ptrs = (@nil Z)) ” 
  &&  “ (prev = head_dispatch_case) ” 
  &&  “ (before_prev = head_dispatch_case) ” 
  &&  “ (first = head_dispatch_case) ”
  &&  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |->_)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
  **  (xizi_dll_payloads storeA_dispatch_case result )
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> head_dispatch_case)
.

Definition DoubleLinkListInsertNodeBefore_partial_solve_wit_2 := 
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@XiziStoreADLL.DL_Node A))) (head_dispatch_case: Z) (data_dispatch_case: A) (storeA_dispatch_case: (Z -> (A -> Assertion))) (ptrs: (@list Z)) (result: (@list (@XiziStoreADLL.DL_Node A))) (first: Z) (prev: Z) (before_prev: Z) (prefix0: (@list Z)) (PreH1 : (head_dispatch_case = linklist_pre)) (PreH2 : (ptrs = (xizi_dll_ptrs (nodes_dispatch_case)))) (PreH3 : (xizi_insert_before_payload nodes_dispatch_case head_dispatch_case (XiziStoreADLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result )) (PreH4 : ((xizi_dll_ptrs (result)) = (xizi_double_link_insert_before_nodes (ptrs) (head_dispatch_case) (linklist_node_pre)))) (PreH5 : (head_dispatch_case <> 0)) (PreH6 : (linklist_node_pre <> 0)) (PreH7 : ((xizi_double_link_insert_before_nodes (ptrs) (head_dispatch_case) (linklist_node_pre)) = (app (ptrs) ((cons (linklist_node_pre) ((@nil Z))))))) (PreH8 : (ptrs = (app (prefix0) ((cons (prev) ((@nil Z))))))) (PreH9 : (prev <> 0)) (PreH10 : (prev <> head_dispatch_case)) ,
  (xizi_dll_payloads storeA_dispatch_case result )
  **  (xizi_dll_node linklist_node_pre )
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  (xizi_dllseg first head_dispatch_case prev before_prev prefix0 )
|--
  “ (linklist_node_pre <> 0) ” 
  &&  “ (head_dispatch_case = linklist_pre) ” 
  &&  “ (ptrs = (xizi_dll_ptrs (nodes_dispatch_case))) ” 
  &&  “ (xizi_insert_before_payload nodes_dispatch_case head_dispatch_case (XiziStoreADLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ” 
  &&  “ ((xizi_dll_ptrs (result)) = (xizi_double_link_insert_before_nodes (ptrs) (head_dispatch_case) (linklist_node_pre))) ” 
  &&  “ (head_dispatch_case <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ ((xizi_double_link_insert_before_nodes (ptrs) (head_dispatch_case) (linklist_node_pre)) = (app (ptrs) ((cons (linklist_node_pre) ((@nil Z)))))) ” 
  &&  “ (ptrs = (app (prefix0) ((cons (prev) ((@nil Z)))))) ” 
  &&  “ (prev <> 0) ” 
  &&  “ (prev <> head_dispatch_case) ”
  &&  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |->_)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
  **  (xizi_dll_payloads storeA_dispatch_case result )
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  (xizi_dllseg first head_dispatch_case prev before_prev prefix0 )
.

Definition DoubleLinkListInsertNodeBefore_partial_solve_wit_3 := 
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@XiziStoreADLL.DL_Node A))) (head_dispatch_case: Z) (data_dispatch_case: A) (storeA_dispatch_case: (Z -> (A -> Assertion))) (ptrs: (@list Z)) (result: (@list (@XiziStoreADLL.DL_Node A))) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (last: Z) (prev: Z) (before_prev: Z) (next: Z) (prefix0: (@list Z)) (PreH1 : (ptrs = (xizi_dll_ptrs (nodes_dispatch_case)))) (PreH2 : (xizi_insert_before_payload nodes_dispatch_case linklist_pre (XiziStoreADLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result )) (PreH3 : ((xizi_dll_ptrs (result)) = (xizi_double_link_insert_before_nodes (ptrs) (linklist_pre) (linklist_node_pre)))) (PreH4 : (head_dispatch_case <> 0)) (PreH5 : (linklist_node_pre <> 0)) (PreH6 : (ptrs = (app (nodes_before) ((cons (linklist_pre) (nodes_after)))))) (PreH7 : ~((In linklist_pre nodes_before ))) (PreH8 : ((xizi_double_link_insert_before_nodes (ptrs) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (linklist_pre) (nodes_after)))))))) (PreH9 : (linklist_pre <> 0)) (PreH10 : (linklist_pre <> head_dispatch_case)) (PreH11 : (nodes_before = (app (prefix0) ((cons (prev) ((@nil Z))))))) (PreH12 : (prev <> 0)) (PreH13 : (prev <> head_dispatch_case)) ,
  (xizi_dll_payloads storeA_dispatch_case result )
  **  (xizi_dll_node linklist_node_pre )
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
  &&  “ (ptrs = (xizi_dll_ptrs (nodes_dispatch_case))) ” 
  &&  “ (xizi_insert_before_payload nodes_dispatch_case linklist_pre (XiziStoreADLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ” 
  &&  “ ((xizi_dll_ptrs (result)) = (xizi_double_link_insert_before_nodes (ptrs) (linklist_pre) (linklist_node_pre))) ” 
  &&  “ (head_dispatch_case <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ (ptrs = (app (nodes_before) ((cons (linklist_pre) (nodes_after))))) ” 
  &&  “ ~((In linklist_pre nodes_before )) ” 
  &&  “ ((xizi_double_link_insert_before_nodes (ptrs) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (linklist_pre) (nodes_after))))))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_pre <> head_dispatch_case) ” 
  &&  “ (nodes_before = (app (prefix0) ((cons (prev) ((@nil Z)))))) ” 
  &&  “ (prev <> 0) ” 
  &&  “ (prev <> head_dispatch_case) ”
  &&  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |->_)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
  **  (xizi_dll_payloads storeA_dispatch_case result )
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
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@XiziStoreADLL.DL_Node A))) (head_dispatch_case: Z) (data_dispatch_case: A) (storeA_dispatch_case: (Z -> (A -> Assertion))) (ptrs: (@list Z)) (result: (@list (@XiziStoreADLL.DL_Node A))) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (last: Z) (prev: Z) (before_prev: Z) (next: Z) (PreH1 : (first = linklist_pre)) (PreH2 : (ptrs = (xizi_dll_ptrs (nodes_dispatch_case)))) (PreH3 : (xizi_insert_before_payload nodes_dispatch_case first (XiziStoreADLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result )) (PreH4 : ((xizi_dll_ptrs (result)) = (xizi_double_link_insert_before_nodes (ptrs) (first) (linklist_node_pre)))) (PreH5 : (head_dispatch_case <> 0)) (PreH6 : (linklist_node_pre <> 0)) (PreH7 : (ptrs = (app (nodes_before) ((cons (first) (nodes_after)))))) (PreH8 : ~((In first nodes_before ))) (PreH9 : ((xizi_double_link_insert_before_nodes (ptrs) (first) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (first) (nodes_after)))))))) (PreH10 : (first <> 0)) (PreH11 : (first <> head_dispatch_case)) (PreH12 : (nodes_before = (@nil Z))) (PreH13 : (prev = head_dispatch_case)) (PreH14 : (before_prev = last)) ,
  (xizi_dll_payloads storeA_dispatch_case result )
  **  (xizi_dll_node linklist_node_pre )
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  (xizi_dllseg next first head_dispatch_case last nodes_after )
|--
  “ (linklist_node_pre <> 0) ” 
  &&  “ (first = linklist_pre) ” 
  &&  “ (ptrs = (xizi_dll_ptrs (nodes_dispatch_case))) ” 
  &&  “ (xizi_insert_before_payload nodes_dispatch_case first (XiziStoreADLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ” 
  &&  “ ((xizi_dll_ptrs (result)) = (xizi_double_link_insert_before_nodes (ptrs) (first) (linklist_node_pre))) ” 
  &&  “ (head_dispatch_case <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ (ptrs = (app (nodes_before) ((cons (first) (nodes_after))))) ” 
  &&  “ ~((In first nodes_before )) ” 
  &&  “ ((xizi_double_link_insert_before_nodes (ptrs) (first) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (first) (nodes_after))))))) ” 
  &&  “ (first <> 0) ” 
  &&  “ (first <> head_dispatch_case) ” 
  &&  “ (nodes_before = (@nil Z)) ” 
  &&  “ (prev = head_dispatch_case) ” 
  &&  “ (before_prev = last) ”
  &&  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |->_)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
  **  (xizi_dll_payloads storeA_dispatch_case result )
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  (xizi_dllseg next first head_dispatch_case last nodes_after )
.

Definition DoubleLinkListInsertNodeBefore_derive_sentinel_case_by_dispatch_case := 
forall (A: Type) ,
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_sentinel_case: (@list (@XiziStoreADLL.DL_Node A))) (data_sentinel_case: A) (storeA_sentinel_case: (Z -> (A -> Assertion))) ,
  (xizi_store_dll storeA_sentinel_case linklist_pre nodes_sentinel_case )
  **  (xizi_dll_node linklist_node_pre )
  **  (storeA_sentinel_case linklist_node_pre data_sentinel_case )
|--
EX (A: Type) ,
EX (storeA_dispatch_case: (Z -> (A -> Assertion))) (data_dispatch_case: A) (head_dispatch_case: Z) (nodes_dispatch_case: (@list (@XiziStoreADLL.DL_Node A))) ,
  (“ (xizi_double_link_insert_before_anchor head_dispatch_case (xizi_dll_ptrs (nodes_dispatch_case)) linklist_pre ) ”
  &&  (xizi_store_dll storeA_dispatch_case head_dispatch_case nodes_dispatch_case )
  **  (xizi_dll_node linklist_node_pre )
  **  (storeA_dispatch_case linklist_node_pre data_dispatch_case ))
  **
  ((EX result,
  “ (xizi_insert_before_payload nodes_dispatch_case linklist_pre (XiziStoreADLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ”
  &&  (xizi_store_dll storeA_dispatch_case head_dispatch_case result ))
  -*
  ((xizi_store_dll storeA_sentinel_case linklist_pre (app (nodes_sentinel_case) ((cons ((XiziStoreADLL.Build_DL_Node (data_sentinel_case) (linklist_node_pre))) (nil)))) )))
.

Definition DoubleLinkListInsertNodeBefore_derive_member_case_by_dispatch_case := 
forall (A: Type) ,
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_member_case: (@list (@XiziStoreADLL.DL_Node A))) (head_member_case: Z) (data_member_case: A) (storeA_member_case: (Z -> (A -> Assertion))) ,
  “ (In linklist_pre (xizi_dll_ptrs (nodes_member_case)) ) ”
  &&  (xizi_store_dll storeA_member_case head_member_case nodes_member_case )
  **  (xizi_dll_node linklist_node_pre )
  **  (storeA_member_case linklist_node_pre data_member_case )
|--
EX (A: Type) ,
EX (storeA_dispatch_case: (Z -> (A -> Assertion))) (data_dispatch_case: A) (head_dispatch_case: Z) (nodes_dispatch_case: (@list (@XiziStoreADLL.DL_Node A))) ,
  (“ (xizi_double_link_insert_before_anchor head_dispatch_case (xizi_dll_ptrs (nodes_dispatch_case)) linklist_pre ) ”
  &&  (xizi_store_dll storeA_dispatch_case head_dispatch_case nodes_dispatch_case )
  **  (xizi_dll_node linklist_node_pre )
  **  (storeA_dispatch_case linklist_node_pre data_dispatch_case ))
  **
  ((EX result_2,
  “ (xizi_insert_before_payload nodes_dispatch_case linklist_pre (XiziStoreADLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result_2 ) ”
  &&  (xizi_store_dll storeA_dispatch_case head_dispatch_case result_2 ))
  -*
  (EX result,
  “ (xizi_insert_before_payload nodes_member_case linklist_pre (XiziStoreADLL.Build_DL_Node (data_member_case) (linklist_node_pre)) result ) ”
  &&  (xizi_store_dll storeA_member_case head_member_case result )))
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
