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
Import CRules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_insert_before.source Require Import xizi_double_link_insert_before_lib.
Local Open Scope sac.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_strategy_goal.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_strategy_proof.

(*----- Function DoubleLinkListInsertNodeBefore -----*)

Definition DoubleLinkListInsertNodeBefore_entail_wit_1 := 
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (head_dispatch_case: Z) (data_dispatch_case: A) (storeA_dispatch_case: (Z -> (A -> Assertion))) (PreH1 : (xizi_double_link_insert_before_anchor head_dispatch_case (XiziLocalDLL.ptrs (nodes_dispatch_case)) linklist_pre )) ,
  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  (XiziLocalDLL.store_dll storeA_dispatch_case head_dispatch_case nodes_dispatch_case )
  **  (XiziLocalDLL.occupy_dll_node linklist_node_pre )
  **  (storeA_dispatch_case linklist_node_pre data_dispatch_case )
|--
  (EX (first: Z)  (last: Z)  (next: Z)  (before_prev: Z)  (prev: Z)  (nodes_before: (@list Z))  (nodes_after: (@list Z))  (old_next: Z)  (old_prev: Z)  (result: (@list (@DLL.DL_Node A)))  (ptrs: (@list Z)) ,
  “ (first = linklist_pre) ” 
  &&  “ (ptrs = (XiziLocalDLL.ptrs (nodes_dispatch_case))) ” 
  &&  “ (xizi_insert_before_payload nodes_dispatch_case first (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ” 
  &&  “ ((XiziLocalDLL.ptrs (result)) = (xizi_double_link_insert_before_nodes (ptrs) (first) (linklist_node_pre))) ” 
  &&  “ (ptrs = (app (nodes_before) ((cons (first) (nodes_after))))) ” 
  &&  “ ~((In first nodes_before )) ” 
  &&  “ ((xizi_double_link_insert_before_nodes (ptrs) (first) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (first) (nodes_after))))))) ” 
  &&  “ (nodes_before = (@nil Z)) ” 
  &&  “ (prev = head_dispatch_case) ” 
  &&  “ (before_prev = last) ”
  &&  ((( &( "linklist" ) )) # Ptr  |-> first)
  **  (XiziLocalDLL.payloads storeA_dispatch_case result )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> old_prev)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> old_next)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  (XiziLocalDLL.addr_dllseg next first head_dispatch_case last nodes_after ))
  ||
  (EX (first: Z)  (prefix0: (@list Z))  (last: Z)  (next: Z)  (before_prev: Z)  (prev: Z)  (nodes_before: (@list Z))  (nodes_after: (@list Z))  (old_next: Z)  (old_prev: Z)  (result: (@list (@DLL.DL_Node A)))  (ptrs: (@list Z)) ,
  “ (ptrs = (XiziLocalDLL.ptrs (nodes_dispatch_case))) ” 
  &&  “ (xizi_insert_before_payload nodes_dispatch_case linklist_pre (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ” 
  &&  “ ((XiziLocalDLL.ptrs (result)) = (xizi_double_link_insert_before_nodes (ptrs) (linklist_pre) (linklist_node_pre))) ” 
  &&  “ (ptrs = (app (nodes_before) ((cons (linklist_pre) (nodes_after))))) ” 
  &&  “ ~((In linklist_pre nodes_before )) ” 
  &&  “ ((xizi_double_link_insert_before_nodes (ptrs) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (linklist_pre) (nodes_after))))))) ” 
  &&  “ (nodes_before = (app (prefix0) ((cons (prev) ((@nil Z)))))) ”
  &&  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  (XiziLocalDLL.payloads storeA_dispatch_case result )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> old_prev)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> old_next)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  (XiziLocalDLL.addr_dllseg next linklist_pre head_dispatch_case last nodes_after )
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (XiziLocalDLL.addr_dllseg first head_dispatch_case prev before_prev prefix0 ))
  ||
  (EX (first: Z)  (before_prev: Z)  (prefix0_2: (@list Z))  (prev: Z)  (old_next: Z)  (old_prev: Z)  (result: (@list (@DLL.DL_Node A)))  (ptrs: (@list Z)) ,
  “ (head_dispatch_case = linklist_pre) ” 
  &&  “ (ptrs = (XiziLocalDLL.ptrs (nodes_dispatch_case))) ” 
  &&  “ (xizi_insert_before_payload nodes_dispatch_case head_dispatch_case (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ” 
  &&  “ ((XiziLocalDLL.ptrs (result)) = (xizi_double_link_insert_before_nodes (ptrs) (head_dispatch_case) (linklist_node_pre))) ” 
  &&  “ ((xizi_double_link_insert_before_nodes (ptrs) (head_dispatch_case) (linklist_node_pre)) = (app (ptrs) ((cons (linklist_node_pre) ((@nil Z)))))) ” 
  &&  “ (ptrs = (app (prefix0_2) ((cons (prev) ((@nil Z)))))) ”
  &&  ((( &( "linklist" ) )) # Ptr  |-> head_dispatch_case)
  **  (XiziLocalDLL.payloads storeA_dispatch_case result )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> old_prev)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> old_next)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  (XiziLocalDLL.addr_dllseg first head_dispatch_case prev before_prev prefix0_2 ))
  ||
  (EX (first: Z)  (before_prev: Z)  (prev: Z)  (old_next: Z)  (old_prev: Z)  (result: (@list (@DLL.DL_Node A)))  (ptrs: (@list Z)) ,
  “ (head_dispatch_case = linklist_pre) ” 
  &&  “ (ptrs = (XiziLocalDLL.ptrs (nodes_dispatch_case))) ” 
  &&  “ (xizi_insert_before_payload nodes_dispatch_case head_dispatch_case (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ” 
  &&  “ ((XiziLocalDLL.ptrs (result)) = (xizi_double_link_insert_before_nodes (ptrs) (head_dispatch_case) (linklist_node_pre))) ” 
  &&  “ ((xizi_double_link_insert_before_nodes (ptrs) (head_dispatch_case) (linklist_node_pre)) = (app (ptrs) ((cons (linklist_node_pre) ((@nil Z)))))) ” 
  &&  “ (ptrs = (@nil Z)) ” 
  &&  “ (prev = head_dispatch_case) ” 
  &&  “ (before_prev = head_dispatch_case) ” 
  &&  “ (first = head_dispatch_case) ”
  &&  ((( &( "linklist" ) )) # Ptr  |-> head_dispatch_case)
  **  (XiziLocalDLL.payloads storeA_dispatch_case result )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> old_prev)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> old_next)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> head_dispatch_case))
.

Definition DoubleLinkListInsertNodeBefore_return_wit_1 := 
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (head_dispatch_case: Z) (data_dispatch_case: A) (storeA_dispatch_case: (Z -> (A -> Assertion))) (ptrs: (@list Z)) (result_2: (@list (@DLL.DL_Node A))) (first: Z) (prev: Z) (before_prev: Z) (PreH1 : (head_dispatch_case = linklist_pre)) (PreH2 : (ptrs = (XiziLocalDLL.ptrs (nodes_dispatch_case)))) (PreH3 : (xizi_insert_before_payload nodes_dispatch_case head_dispatch_case (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result_2 )) (PreH4 : ((XiziLocalDLL.ptrs (result_2)) = (xizi_double_link_insert_before_nodes (ptrs) (head_dispatch_case) (linklist_node_pre)))) (PreH5 : ((xizi_double_link_insert_before_nodes (ptrs) (head_dispatch_case) (linklist_node_pre)) = (app (ptrs) ((cons (linklist_node_pre) ((@nil Z))))))) (PreH6 : (ptrs = (@nil Z))) (PreH7 : (prev = head_dispatch_case)) (PreH8 : (before_prev = head_dispatch_case)) (PreH9 : (first = head_dispatch_case)) ,
  (XiziLocalDLL.payloads storeA_dispatch_case result_2 )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> head_dispatch_case)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
|--
  EX (result: (@list (@DLL.DL_Node A))) ,
  “ (xizi_insert_before_payload nodes_dispatch_case linklist_pre (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ”
  &&  (XiziLocalDLL.store_dll storeA_dispatch_case head_dispatch_case result )
) \/
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (head_dispatch_case: Z) (data_dispatch_case: A) (storeA_dispatch_case: (Z -> (A -> Assertion))) (ptrs: (@list Z)) (result_2: (@list (@DLL.DL_Node A))) (first: Z) (prev: Z) (before_prev: Z) (PreH1 : (head_dispatch_case = linklist_pre)) (PreH2 : (ptrs = (XiziLocalDLL.ptrs (nodes_dispatch_case)))) (PreH3 : (xizi_insert_before_payload nodes_dispatch_case head_dispatch_case (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result_2 )) (PreH4 : ((XiziLocalDLL.ptrs (result_2)) = (xizi_double_link_insert_before_nodes (ptrs) (head_dispatch_case) (linklist_node_pre)))) (PreH5 : ((xizi_double_link_insert_before_nodes (ptrs) (head_dispatch_case) (linklist_node_pre)) = (app (ptrs) ((cons (linklist_node_pre) ((@nil Z))))))) (PreH6 : (ptrs = (@nil Z))) (PreH7 : (prev = head_dispatch_case)) (PreH8 : (before_prev = head_dispatch_case)) (PreH9 : (first = head_dispatch_case)) ,
  (XiziLocalDLL.payloads storeA_dispatch_case result_2 )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> head_dispatch_case)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
|--
  EX (result: (@list (@DLL.DL_Node A))) ,
  “ (xizi_insert_before_payload nodes_dispatch_case linklist_pre (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ”
  &&  (XiziLocalDLL.store_dll storeA_dispatch_case head_dispatch_case result )
).

Definition DoubleLinkListInsertNodeBefore_return_wit_2 := 
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (head_dispatch_case: Z) (data_dispatch_case: A) (storeA_dispatch_case: (Z -> (A -> Assertion))) (ptrs: (@list Z)) (result_2: (@list (@DLL.DL_Node A))) (first: Z) (prev: Z) (before_prev: Z) (prefix0: (@list Z)) (PreH1 : (head_dispatch_case = linklist_pre)) (PreH2 : (ptrs = (XiziLocalDLL.ptrs (nodes_dispatch_case)))) (PreH3 : (xizi_insert_before_payload nodes_dispatch_case head_dispatch_case (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result_2 )) (PreH4 : ((XiziLocalDLL.ptrs (result_2)) = (xizi_double_link_insert_before_nodes (ptrs) (head_dispatch_case) (linklist_node_pre)))) (PreH5 : ((xizi_double_link_insert_before_nodes (ptrs) (head_dispatch_case) (linklist_node_pre)) = (app (ptrs) ((cons (linklist_node_pre) ((@nil Z))))))) (PreH6 : (ptrs = (app (prefix0) ((cons (prev) ((@nil Z))))))) ,
  (XiziLocalDLL.payloads storeA_dispatch_case result_2 )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (XiziLocalDLL.addr_dllseg first head_dispatch_case prev before_prev prefix0 )
|--
  EX (result: (@list (@DLL.DL_Node A))) ,
  “ (xizi_insert_before_payload nodes_dispatch_case linklist_pre (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ”
  &&  (XiziLocalDLL.store_dll storeA_dispatch_case head_dispatch_case result )
) \/
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (head_dispatch_case: Z) (data_dispatch_case: A) (storeA_dispatch_case: (Z -> (A -> Assertion))) (ptrs: (@list Z)) (result_2: (@list (@DLL.DL_Node A))) (first: Z) (prev: Z) (before_prev: Z) (prefix0: (@list Z)) (PreH1 : (head_dispatch_case = linklist_pre)) (PreH2 : (ptrs = (XiziLocalDLL.ptrs (nodes_dispatch_case)))) (PreH3 : (xizi_insert_before_payload nodes_dispatch_case head_dispatch_case (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result_2 )) (PreH4 : ((XiziLocalDLL.ptrs (result_2)) = (xizi_double_link_insert_before_nodes (ptrs) (head_dispatch_case) (linklist_node_pre)))) (PreH5 : ((xizi_double_link_insert_before_nodes (ptrs) (head_dispatch_case) (linklist_node_pre)) = (app (ptrs) ((cons (linklist_node_pre) ((@nil Z))))))) (PreH6 : (ptrs = (app (prefix0) ((cons (prev) ((@nil Z))))))) ,
  (XiziLocalDLL.payloads storeA_dispatch_case result_2 )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (XiziLocalDLL.addr_dllseg first head_dispatch_case prev before_prev prefix0 )
|--
  EX (result: (@list (@DLL.DL_Node A))) ,
  “ (xizi_insert_before_payload nodes_dispatch_case linklist_pre (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ”
  &&  (XiziLocalDLL.store_dll storeA_dispatch_case head_dispatch_case result )
).

Definition DoubleLinkListInsertNodeBefore_return_wit_3 := 
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (head_dispatch_case: Z) (data_dispatch_case: A) (storeA_dispatch_case: (Z -> (A -> Assertion))) (ptrs: (@list Z)) (result_2: (@list (@DLL.DL_Node A))) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (last: Z) (prev: Z) (before_prev: Z) (next: Z) (prefix0: (@list Z)) (PreH1 : (ptrs = (XiziLocalDLL.ptrs (nodes_dispatch_case)))) (PreH2 : (xizi_insert_before_payload nodes_dispatch_case linklist_pre (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result_2 )) (PreH3 : ((XiziLocalDLL.ptrs (result_2)) = (xizi_double_link_insert_before_nodes (ptrs) (linklist_pre) (linklist_node_pre)))) (PreH4 : (ptrs = (app (nodes_before) ((cons (linklist_pre) (nodes_after)))))) (PreH5 : ~((In linklist_pre nodes_before ))) (PreH6 : ((xizi_double_link_insert_before_nodes (ptrs) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (linklist_pre) (nodes_after)))))))) (PreH7 : (nodes_before = (app (prefix0) ((cons (prev) ((@nil Z))))))) ,
  (XiziLocalDLL.payloads storeA_dispatch_case result_2 )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (XiziLocalDLL.addr_dllseg next linklist_pre head_dispatch_case last nodes_after )
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (XiziLocalDLL.addr_dllseg first head_dispatch_case prev before_prev prefix0 )
|--
  EX (result: (@list (@DLL.DL_Node A))) ,
  “ (xizi_insert_before_payload nodes_dispatch_case linklist_pre (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ”
  &&  (XiziLocalDLL.store_dll storeA_dispatch_case head_dispatch_case result )
) \/
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (head_dispatch_case: Z) (data_dispatch_case: A) (storeA_dispatch_case: (Z -> (A -> Assertion))) (ptrs: (@list Z)) (result_2: (@list (@DLL.DL_Node A))) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (last: Z) (prev: Z) (before_prev: Z) (next: Z) (prefix0: (@list Z)) (PreH1 : (ptrs = (XiziLocalDLL.ptrs (nodes_dispatch_case)))) (PreH2 : (xizi_insert_before_payload nodes_dispatch_case linklist_pre (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result_2 )) (PreH3 : ((XiziLocalDLL.ptrs (result_2)) = (xizi_double_link_insert_before_nodes (ptrs) (linklist_pre) (linklist_node_pre)))) (PreH4 : (ptrs = (app (nodes_before) ((cons (linklist_pre) (nodes_after)))))) (PreH5 : ~((In linklist_pre nodes_before ))) (PreH6 : ((xizi_double_link_insert_before_nodes (ptrs) (linklist_pre) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (linklist_pre) (nodes_after)))))))) (PreH7 : (nodes_before = (app (prefix0) ((cons (prev) ((@nil Z))))))) ,
  (XiziLocalDLL.payloads storeA_dispatch_case result_2 )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (XiziLocalDLL.addr_dllseg next linklist_pre head_dispatch_case last nodes_after )
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (XiziLocalDLL.addr_dllseg first head_dispatch_case prev before_prev prefix0 )
|--
  EX (result: (@list (@DLL.DL_Node A))) ,
  “ (xizi_insert_before_payload nodes_dispatch_case linklist_pre (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ”
  &&  (XiziLocalDLL.store_dll storeA_dispatch_case head_dispatch_case result )
).

Definition DoubleLinkListInsertNodeBefore_return_wit_4 := 
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (head_dispatch_case: Z) (data_dispatch_case: A) (storeA_dispatch_case: (Z -> (A -> Assertion))) (ptrs: (@list Z)) (result_2: (@list (@DLL.DL_Node A))) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (last: Z) (prev: Z) (before_prev: Z) (next: Z) (PreH1 : (first = linklist_pre)) (PreH2 : (ptrs = (XiziLocalDLL.ptrs (nodes_dispatch_case)))) (PreH3 : (xizi_insert_before_payload nodes_dispatch_case first (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result_2 )) (PreH4 : ((XiziLocalDLL.ptrs (result_2)) = (xizi_double_link_insert_before_nodes (ptrs) (first) (linklist_node_pre)))) (PreH5 : (ptrs = (app (nodes_before) ((cons (first) (nodes_after)))))) (PreH6 : ~((In first nodes_before ))) (PreH7 : ((xizi_double_link_insert_before_nodes (ptrs) (first) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (first) (nodes_after)))))))) (PreH8 : (nodes_before = (@nil Z))) (PreH9 : (prev = head_dispatch_case)) (PreH10 : (before_prev = last)) ,
  (XiziLocalDLL.payloads storeA_dispatch_case result_2 )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (XiziLocalDLL.addr_dllseg next first head_dispatch_case last nodes_after )
|--
  EX (result: (@list (@DLL.DL_Node A))) ,
  “ (xizi_insert_before_payload nodes_dispatch_case linklist_pre (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ”
  &&  (XiziLocalDLL.store_dll storeA_dispatch_case head_dispatch_case result )
) \/
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (head_dispatch_case: Z) (data_dispatch_case: A) (storeA_dispatch_case: (Z -> (A -> Assertion))) (ptrs: (@list Z)) (result_2: (@list (@DLL.DL_Node A))) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (last: Z) (prev: Z) (before_prev: Z) (next: Z) (PreH1 : (first = linklist_pre)) (PreH2 : (ptrs = (XiziLocalDLL.ptrs (nodes_dispatch_case)))) (PreH3 : (xizi_insert_before_payload nodes_dispatch_case first (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result_2 )) (PreH4 : ((XiziLocalDLL.ptrs (result_2)) = (xizi_double_link_insert_before_nodes (ptrs) (first) (linklist_node_pre)))) (PreH5 : (ptrs = (app (nodes_before) ((cons (first) (nodes_after)))))) (PreH6 : ~((In first nodes_before ))) (PreH7 : ((xizi_double_link_insert_before_nodes (ptrs) (first) (linklist_node_pre)) = (app (nodes_before) ((cons (linklist_node_pre) ((cons (first) (nodes_after)))))))) (PreH8 : (nodes_before = (@nil Z))) (PreH9 : (prev = head_dispatch_case)) (PreH10 : (before_prev = last)) ,
  (XiziLocalDLL.payloads storeA_dispatch_case result_2 )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before_prev)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (XiziLocalDLL.addr_dllseg next first head_dispatch_case last nodes_after )
|--
  EX (result: (@list (@DLL.DL_Node A))) ,
  “ (xizi_insert_before_payload nodes_dispatch_case linklist_pre (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ”
  &&  (XiziLocalDLL.store_dll storeA_dispatch_case head_dispatch_case result )
).

Definition DoubleLinkListInsertNodeBefore_derive_sentinel_case_by_dispatch_case := 
forall (A: Type) ,
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_sentinel_case: (@list (@DLL.DL_Node A))) (data_sentinel_case: A) (storeA_sentinel_case: (Z -> (A -> Assertion))) ,
  (XiziLocalDLL.store_dll storeA_sentinel_case linklist_pre nodes_sentinel_case )
  **  (XiziLocalDLL.occupy_dll_node linklist_node_pre )
  **  (storeA_sentinel_case linklist_node_pre data_sentinel_case )
|--
EX (A: Type) ,
EX (storeA_dispatch_case: (Z -> (A -> Assertion))) (data_dispatch_case: A) (head_dispatch_case: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) ,
  (“ (xizi_double_link_insert_before_anchor head_dispatch_case (XiziLocalDLL.ptrs (nodes_dispatch_case)) linklist_pre ) ”
  &&  (XiziLocalDLL.store_dll storeA_dispatch_case head_dispatch_case nodes_dispatch_case )
  **  (XiziLocalDLL.occupy_dll_node linklist_node_pre )
  **  (storeA_dispatch_case linklist_node_pre data_dispatch_case ))
  **
  ((EX result,
  “ (xizi_insert_before_payload nodes_dispatch_case linklist_pre (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ”
  &&  (XiziLocalDLL.store_dll storeA_dispatch_case head_dispatch_case result ))
  -*
  ((XiziLocalDLL.store_dll storeA_sentinel_case linklist_pre (app (nodes_sentinel_case) ((cons ((DLL.Build_DL_Node (data_sentinel_case) (linklist_node_pre))) (nil)))) )))
.

Definition DoubleLinkListInsertNodeBefore_derive_member_case_by_dispatch_case := 
forall (A: Type) ,
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_member_case: (@list (@DLL.DL_Node A))) (head_member_case: Z) (data_member_case: A) (storeA_member_case: (Z -> (A -> Assertion))) ,
  “ (In linklist_pre (XiziLocalDLL.ptrs (nodes_member_case)) ) ”
  &&  (XiziLocalDLL.store_dll storeA_member_case head_member_case nodes_member_case )
  **  (XiziLocalDLL.occupy_dll_node linklist_node_pre )
  **  (storeA_member_case linklist_node_pre data_member_case )
|--
EX (A: Type) ,
EX (storeA_dispatch_case: (Z -> (A -> Assertion))) (data_dispatch_case: A) (head_dispatch_case: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) ,
  (“ (xizi_double_link_insert_before_anchor head_dispatch_case (XiziLocalDLL.ptrs (nodes_dispatch_case)) linklist_pre ) ”
  &&  (XiziLocalDLL.store_dll storeA_dispatch_case head_dispatch_case nodes_dispatch_case )
  **  (XiziLocalDLL.occupy_dll_node linklist_node_pre )
  **  (storeA_dispatch_case linklist_node_pre data_dispatch_case ))
  **
  ((EX result_2,
  “ (xizi_insert_before_payload nodes_dispatch_case linklist_pre (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result_2 ) ”
  &&  (XiziLocalDLL.store_dll storeA_dispatch_case head_dispatch_case result_2 ))
  -*
  (EX result,
  “ (xizi_insert_before_payload nodes_member_case linklist_pre (DLL.Build_DL_Node (data_member_case) (linklist_node_pre)) result ) ”
  &&  (XiziLocalDLL.store_dll storeA_member_case head_member_case result )))
.

Module Type VC_Correct.

Include xizi_double_link_Strategy_Correct.

Axiom proof_of_DoubleLinkListInsertNodeBefore_entail_wit_1 : DoubleLinkListInsertNodeBefore_entail_wit_1.
Axiom proof_of_DoubleLinkListInsertNodeBefore_return_wit_1 : DoubleLinkListInsertNodeBefore_return_wit_1.
Axiom proof_of_DoubleLinkListInsertNodeBefore_return_wit_2 : DoubleLinkListInsertNodeBefore_return_wit_2.
Axiom proof_of_DoubleLinkListInsertNodeBefore_return_wit_3 : DoubleLinkListInsertNodeBefore_return_wit_3.
Axiom proof_of_DoubleLinkListInsertNodeBefore_return_wit_4 : DoubleLinkListInsertNodeBefore_return_wit_4.
Axiom proof_of_DoubleLinkListInsertNodeBefore_derive_sentinel_case_by_dispatch_case : DoubleLinkListInsertNodeBefore_derive_sentinel_case_by_dispatch_case.
Axiom proof_of_DoubleLinkListInsertNodeBefore_derive_member_case_by_dispatch_case : DoubleLinkListInsertNodeBefore_derive_member_case_by_dispatch_case.

End VC_Correct.
