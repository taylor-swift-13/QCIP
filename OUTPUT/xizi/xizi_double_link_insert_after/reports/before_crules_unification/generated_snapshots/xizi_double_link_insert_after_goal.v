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
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (head_dispatch_case: Z) (data_dispatch_case: A) (storeA_dispatch_case: (Z -> (A -> Assertion))) (PreH1 : (xizi_double_link_insert_after_anchor head_dispatch_case (xizi_insert_after_ptrs (nodes_dispatch_case)) linklist_pre )) ,
  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  (XiziLocalDLL.store_dll storeA_dispatch_case head_dispatch_case nodes_dispatch_case )
  **  (XiziLocalDLL.occupy_dll_node linklist_node_pre )
  **  (storeA_dispatch_case linklist_node_pre data_dispatch_case )
|--
  (EX (old_prev: Z)  (first: Z)  (nodes_before: (@list (@DLL.DL_Node A)))  (anchor_data: A)  (nodes_after: (@list (@DLL.DL_Node A)))  (detached_prev: Z)  (detached_next: Z) ,
  “ (nodes_dispatch_case = (app (nodes_before) ((cons ((DLL.Build_DL_Node (anchor_data) (linklist_pre))) (nodes_after))))) ” 
  &&  “ ~((In linklist_pre (xizi_insert_after_ptrs (nodes_before)) )) ” 
  &&  “ (xizi_insert_after_dispatch_payload head_dispatch_case nodes_dispatch_case linklist_pre (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) (app (nodes_before) ((cons ((DLL.Build_DL_Node (anchor_data) (linklist_pre))) ((cons ((DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre))) (nodes_after)))))) ) ” 
  &&  “ (nodes_after = (@nil (@DLL.DL_Node A))) ”
  &&  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> detached_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> detached_prev)
  **  (storeA_dispatch_case linklist_node_pre data_dispatch_case )
  **  (storeA_dispatch_case linklist_pre anchor_data )
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (XiziLocalDLL.dllseg storeA_dispatch_case first head_dispatch_case linklist_pre old_prev nodes_before )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> old_prev)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_pre))
  ||
  (EX (next_next: Z)  (old_prev: Z)  (last: Z)  (first: Z)  (next_data: A)  (old_next: Z)  (rest: (@list (@DLL.DL_Node A)))  (nodes_before: (@list (@DLL.DL_Node A)))  (anchor_data: A)  (nodes_after: (@list (@DLL.DL_Node A)))  (detached_prev: Z)  (detached_next: Z) ,
  “ (nodes_dispatch_case = (app (nodes_before) ((cons ((DLL.Build_DL_Node (anchor_data) (linklist_pre))) (nodes_after))))) ” 
  &&  “ ~((In linklist_pre (xizi_insert_after_ptrs (nodes_before)) )) ” 
  &&  “ (xizi_insert_after_dispatch_payload head_dispatch_case nodes_dispatch_case linklist_pre (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) (app (nodes_before) ((cons ((DLL.Build_DL_Node (anchor_data) (linklist_pre))) ((cons ((DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre))) (nodes_after)))))) ) ” 
  &&  “ (nodes_after = (cons ((DLL.Build_DL_Node (next_data) (old_next))) (rest))) ”
  &&  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> detached_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> detached_prev)
  **  (storeA_dispatch_case linklist_node_pre data_dispatch_case )
  **  (storeA_dispatch_case linklist_pre anchor_data )
  **  (storeA_dispatch_case old_next next_data )
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (XiziLocalDLL.dllseg storeA_dispatch_case first head_dispatch_case linklist_pre old_prev nodes_before )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> old_next)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> old_prev)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_next)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_pre)
  **  (XiziLocalDLL.dllseg storeA_dispatch_case next_next old_next head_dispatch_case last rest ))
  ||
  (EX (next_next: Z)  (last: Z)  (next_data_2: A)  (old_next: Z)  (rest_2: (@list (@DLL.DL_Node A)))  (detached_prev: Z)  (detached_next: Z) ,
  “ (head_dispatch_case = linklist_pre) ” 
  &&  “ (xizi_insert_after_dispatch_payload head_dispatch_case nodes_dispatch_case head_dispatch_case (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) (cons ((DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre))) (nodes_dispatch_case)) ) ” 
  &&  “ (nodes_dispatch_case = (cons ((DLL.Build_DL_Node (next_data_2) (old_next))) (rest_2))) ”
  &&  ((( &( "linklist" ) )) # Ptr  |-> head_dispatch_case)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> detached_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> detached_prev)
  **  (storeA_dispatch_case linklist_node_pre data_dispatch_case )
  **  (storeA_dispatch_case old_next next_data_2 )
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> old_next)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_next)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> head_dispatch_case)
  **  (XiziLocalDLL.dllseg storeA_dispatch_case next_next old_next head_dispatch_case last rest_2 ))
  ||
  (EX (old_next: Z)  (last: Z)  (first: Z)  (detached_prev: Z)  (detached_next: Z) ,
  “ (head_dispatch_case = linklist_pre) ” 
  &&  “ (xizi_insert_after_dispatch_payload head_dispatch_case nodes_dispatch_case head_dispatch_case (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) (cons ((DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre))) (nodes_dispatch_case)) ) ” 
  &&  “ (nodes_dispatch_case = (@nil (@DLL.DL_Node A))) ” 
  &&  “ (first = head_dispatch_case) ” 
  &&  “ (last = head_dispatch_case) ” 
  &&  “ (old_next = head_dispatch_case) ”
  &&  ((( &( "linklist" ) )) # Ptr  |-> head_dispatch_case)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> detached_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> detached_prev)
  **  (storeA_dispatch_case linklist_node_pre data_dispatch_case )
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> head_dispatch_case))
.

Definition DoubleLinkListInsertNodeAfter_return_wit_1 := 
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (head_dispatch_case: Z) (data_dispatch_case: A) (storeA_dispatch_case: (Z -> (A -> Assertion))) (first: Z) (last: Z) (old_next: Z) (PreH1 : (head_dispatch_case = linklist_pre)) (PreH2 : (xizi_insert_after_dispatch_payload head_dispatch_case nodes_dispatch_case head_dispatch_case (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) (cons ((DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre))) (nodes_dispatch_case)) )) (PreH3 : (nodes_dispatch_case = (@nil (@DLL.DL_Node A)))) (PreH4 : (first = head_dispatch_case)) (PreH5 : (last = head_dispatch_case)) (PreH6 : (old_next = head_dispatch_case)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> head_dispatch_case)
  **  (storeA_dispatch_case linklist_node_pre data_dispatch_case )
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
|--
  EX (result: (@list (@DLL.DL_Node A))) ,
  “ (xizi_insert_after_dispatch_payload head_dispatch_case nodes_dispatch_case linklist_pre (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ”
  &&  (XiziLocalDLL.store_dll storeA_dispatch_case head_dispatch_case result )
) \/
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (head_dispatch_case: Z) (data_dispatch_case: A) (storeA_dispatch_case: (Z -> (A -> Assertion))) (first: Z) (last: Z) (old_next: Z) (PreH1 : (head_dispatch_case = linklist_pre)) (PreH2 : (xizi_insert_after_dispatch_payload head_dispatch_case nodes_dispatch_case head_dispatch_case (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) (cons ((DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre))) (nodes_dispatch_case)) )) (PreH3 : (nodes_dispatch_case = (@nil (@DLL.DL_Node A)))) (PreH4 : (first = head_dispatch_case)) (PreH5 : (last = head_dispatch_case)) (PreH6 : (old_next = head_dispatch_case)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> head_dispatch_case)
  **  (storeA_dispatch_case linklist_node_pre data_dispatch_case )
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
|--
  EX (result: (@list (@DLL.DL_Node A))) ,
  “ (xizi_insert_after_dispatch_payload head_dispatch_case nodes_dispatch_case linklist_pre (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ”
  &&  (XiziLocalDLL.store_dll storeA_dispatch_case head_dispatch_case result )
).

Definition DoubleLinkListInsertNodeAfter_return_wit_2 := 
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (head_dispatch_case: Z) (data_dispatch_case: A) (storeA_dispatch_case: (Z -> (A -> Assertion))) (last: Z) (old_next: Z) (next_next: Z) (rest: (@list (@DLL.DL_Node A))) (next_data: A) (PreH1 : (head_dispatch_case = linklist_pre)) (PreH2 : (xizi_insert_after_dispatch_payload head_dispatch_case nodes_dispatch_case head_dispatch_case (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) (cons ((DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre))) (nodes_dispatch_case)) )) (PreH3 : (nodes_dispatch_case = (cons ((DLL.Build_DL_Node (next_data) (old_next))) (rest)))) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> old_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> head_dispatch_case)
  **  (storeA_dispatch_case linklist_node_pre data_dispatch_case )
  **  (storeA_dispatch_case old_next next_data )
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_next)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (XiziLocalDLL.dllseg storeA_dispatch_case next_next old_next head_dispatch_case last rest )
|--
  EX (result: (@list (@DLL.DL_Node A))) ,
  “ (xizi_insert_after_dispatch_payload head_dispatch_case nodes_dispatch_case linklist_pre (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ”
  &&  (XiziLocalDLL.store_dll storeA_dispatch_case head_dispatch_case result )
) \/
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (head_dispatch_case: Z) (data_dispatch_case: A) (storeA_dispatch_case: (Z -> (A -> Assertion))) (last: Z) (old_next: Z) (next_next: Z) (rest: (@list (@DLL.DL_Node A))) (next_data: A) (PreH1 : (head_dispatch_case = linklist_pre)) (PreH2 : (xizi_insert_after_dispatch_payload head_dispatch_case nodes_dispatch_case head_dispatch_case (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) (cons ((DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre))) (nodes_dispatch_case)) )) (PreH3 : (nodes_dispatch_case = (cons ((DLL.Build_DL_Node (next_data) (old_next))) (rest)))) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> old_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> head_dispatch_case)
  **  (storeA_dispatch_case linklist_node_pre data_dispatch_case )
  **  (storeA_dispatch_case old_next next_data )
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_next)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (XiziLocalDLL.dllseg storeA_dispatch_case next_next old_next head_dispatch_case last rest )
|--
  EX (result: (@list (@DLL.DL_Node A))) ,
  “ (xizi_insert_after_dispatch_payload head_dispatch_case nodes_dispatch_case linklist_pre (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ”
  &&  (XiziLocalDLL.store_dll storeA_dispatch_case head_dispatch_case result )
).

Definition DoubleLinkListInsertNodeAfter_return_wit_3 := 
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (head_dispatch_case: Z) (data_dispatch_case: A) (storeA_dispatch_case: (Z -> (A -> Assertion))) (first: Z) (last: Z) (old_next: Z) (old_prev: Z) (next_next: Z) (nodes_before: (@list (@DLL.DL_Node A))) (nodes_after: (@list (@DLL.DL_Node A))) (anchor_data: A) (rest: (@list (@DLL.DL_Node A))) (next_data: A) (PreH1 : (nodes_dispatch_case = (app (nodes_before) ((cons ((DLL.Build_DL_Node (anchor_data) (linklist_pre))) (nodes_after)))))) (PreH2 : ~((In linklist_pre (xizi_insert_after_ptrs (nodes_before)) ))) (PreH3 : (xizi_insert_after_dispatch_payload head_dispatch_case nodes_dispatch_case linklist_pre (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) (app (nodes_before) ((cons ((DLL.Build_DL_Node (anchor_data) (linklist_pre))) ((cons ((DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre))) (nodes_after)))))) )) (PreH4 : (nodes_after = (cons ((DLL.Build_DL_Node (next_data) (old_next))) (rest)))) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> old_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_pre)
  **  (storeA_dispatch_case linklist_node_pre data_dispatch_case )
  **  (storeA_dispatch_case linklist_pre anchor_data )
  **  (storeA_dispatch_case old_next next_data )
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (XiziLocalDLL.dllseg storeA_dispatch_case first head_dispatch_case linklist_pre old_prev nodes_before )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> old_prev)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_next)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (XiziLocalDLL.dllseg storeA_dispatch_case next_next old_next head_dispatch_case last rest )
|--
  EX (result: (@list (@DLL.DL_Node A))) ,
  “ (xizi_insert_after_dispatch_payload head_dispatch_case nodes_dispatch_case linklist_pre (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ”
  &&  (XiziLocalDLL.store_dll storeA_dispatch_case head_dispatch_case result )
) \/
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (head_dispatch_case: Z) (data_dispatch_case: A) (storeA_dispatch_case: (Z -> (A -> Assertion))) (first: Z) (last: Z) (old_next: Z) (old_prev: Z) (next_next: Z) (nodes_before: (@list (@DLL.DL_Node A))) (nodes_after: (@list (@DLL.DL_Node A))) (anchor_data: A) (rest: (@list (@DLL.DL_Node A))) (next_data: A) (PreH1 : (nodes_dispatch_case = (app (nodes_before) ((cons ((DLL.Build_DL_Node (anchor_data) (linklist_pre))) (nodes_after)))))) (PreH2 : ~((In linklist_pre (xizi_insert_after_ptrs (nodes_before)) ))) (PreH3 : (xizi_insert_after_dispatch_payload head_dispatch_case nodes_dispatch_case linklist_pre (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) (app (nodes_before) ((cons ((DLL.Build_DL_Node (anchor_data) (linklist_pre))) ((cons ((DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre))) (nodes_after)))))) )) (PreH4 : (nodes_after = (cons ((DLL.Build_DL_Node (next_data) (old_next))) (rest)))) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> old_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_pre)
  **  (storeA_dispatch_case linklist_node_pre data_dispatch_case )
  **  (storeA_dispatch_case linklist_pre anchor_data )
  **  (storeA_dispatch_case old_next next_data )
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (XiziLocalDLL.dllseg storeA_dispatch_case first head_dispatch_case linklist_pre old_prev nodes_before )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> old_prev)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_next)
  **  ((&((old_next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (XiziLocalDLL.dllseg storeA_dispatch_case next_next old_next head_dispatch_case last rest )
|--
  EX (result: (@list (@DLL.DL_Node A))) ,
  “ (xizi_insert_after_dispatch_payload head_dispatch_case nodes_dispatch_case linklist_pre (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ”
  &&  (XiziLocalDLL.store_dll storeA_dispatch_case head_dispatch_case result )
).

Definition DoubleLinkListInsertNodeAfter_return_wit_4 := 
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (head_dispatch_case: Z) (data_dispatch_case: A) (storeA_dispatch_case: (Z -> (A -> Assertion))) (first: Z) (old_prev: Z) (nodes_before: (@list (@DLL.DL_Node A))) (nodes_after: (@list (@DLL.DL_Node A))) (anchor_data: A) (PreH1 : (nodes_dispatch_case = (app (nodes_before) ((cons ((DLL.Build_DL_Node (anchor_data) (linklist_pre))) (nodes_after)))))) (PreH2 : ~((In linklist_pre (xizi_insert_after_ptrs (nodes_before)) ))) (PreH3 : (xizi_insert_after_dispatch_payload head_dispatch_case nodes_dispatch_case linklist_pre (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) (app (nodes_before) ((cons ((DLL.Build_DL_Node (anchor_data) (linklist_pre))) ((cons ((DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre))) (nodes_after)))))) )) (PreH4 : (nodes_after = (@nil (@DLL.DL_Node A)))) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_pre)
  **  (storeA_dispatch_case linklist_node_pre data_dispatch_case )
  **  (storeA_dispatch_case linklist_pre anchor_data )
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (XiziLocalDLL.dllseg storeA_dispatch_case first head_dispatch_case linklist_pre old_prev nodes_before )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> old_prev)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
|--
  EX (result: (@list (@DLL.DL_Node A))) ,
  “ (xizi_insert_after_dispatch_payload head_dispatch_case nodes_dispatch_case linklist_pre (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ”
  &&  (XiziLocalDLL.store_dll storeA_dispatch_case head_dispatch_case result )
) \/
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (head_dispatch_case: Z) (data_dispatch_case: A) (storeA_dispatch_case: (Z -> (A -> Assertion))) (first: Z) (old_prev: Z) (nodes_before: (@list (@DLL.DL_Node A))) (nodes_after: (@list (@DLL.DL_Node A))) (anchor_data: A) (PreH1 : (nodes_dispatch_case = (app (nodes_before) ((cons ((DLL.Build_DL_Node (anchor_data) (linklist_pre))) (nodes_after)))))) (PreH2 : ~((In linklist_pre (xizi_insert_after_ptrs (nodes_before)) ))) (PreH3 : (xizi_insert_after_dispatch_payload head_dispatch_case nodes_dispatch_case linklist_pre (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) (app (nodes_before) ((cons ((DLL.Build_DL_Node (anchor_data) (linklist_pre))) ((cons ((DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre))) (nodes_after)))))) )) (PreH4 : (nodes_after = (@nil (@DLL.DL_Node A)))) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_dispatch_case)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_pre)
  **  (storeA_dispatch_case linklist_node_pre data_dispatch_case )
  **  (storeA_dispatch_case linklist_pre anchor_data )
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (XiziLocalDLL.dllseg storeA_dispatch_case first head_dispatch_case linklist_pre old_prev nodes_before )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> old_prev)
  **  ((&((head_dispatch_case)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
|--
  EX (result: (@list (@DLL.DL_Node A))) ,
  “ (xizi_insert_after_dispatch_payload head_dispatch_case nodes_dispatch_case linklist_pre (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ”
  &&  (XiziLocalDLL.store_dll storeA_dispatch_case head_dispatch_case result )
).

Definition DoubleLinkListInsertNodeAfter_derive_sentinel_case_by_dispatch_case := 
forall (A: Type) ,
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_sentinel_case: (@list (@DLL.DL_Node A))) (data_sentinel_case: A) (storeA_sentinel_case: (Z -> (A -> Assertion))) ,
  (XiziLocalDLL.store_dll storeA_sentinel_case linklist_pre nodes_sentinel_case )
  **  (XiziLocalDLL.occupy_dll_node linklist_node_pre )
  **  (storeA_sentinel_case linklist_node_pre data_sentinel_case )
|--
EX (A: Type) ,
EX (storeA_dispatch_case: (Z -> (A -> Assertion))) (data_dispatch_case: A) (head_dispatch_case: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) ,
  (“ (xizi_double_link_insert_after_anchor head_dispatch_case (xizi_insert_after_ptrs (nodes_dispatch_case)) linklist_pre ) ”
  &&  (XiziLocalDLL.store_dll storeA_dispatch_case head_dispatch_case nodes_dispatch_case )
  **  (XiziLocalDLL.occupy_dll_node linklist_node_pre )
  **  (storeA_dispatch_case linklist_node_pre data_dispatch_case ))
  **
  ((EX result,
  “ (xizi_insert_after_dispatch_payload head_dispatch_case nodes_dispatch_case linklist_pre (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result ) ”
  &&  (XiziLocalDLL.store_dll storeA_dispatch_case head_dispatch_case result ))
  -*
  ((XiziLocalDLL.store_dll storeA_sentinel_case linklist_pre (cons ((DLL.Build_DL_Node (data_sentinel_case) (linklist_node_pre))) (nodes_sentinel_case)) )))
.

Definition DoubleLinkListInsertNodeAfter_derive_member_case_by_dispatch_case := 
forall (A: Type) ,
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_member_case: (@list (@DLL.DL_Node A))) (head_member_case: Z) (data_member_case: A) (storeA_member_case: (Z -> (A -> Assertion))) ,
  “ (In linklist_pre (xizi_insert_after_ptrs (nodes_member_case)) ) ”
  &&  (XiziLocalDLL.store_dll storeA_member_case head_member_case nodes_member_case )
  **  (XiziLocalDLL.occupy_dll_node linklist_node_pre )
  **  (storeA_member_case linklist_node_pre data_member_case )
|--
EX (A: Type) ,
EX (storeA_dispatch_case: (Z -> (A -> Assertion))) (data_dispatch_case: A) (head_dispatch_case: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) ,
  (“ (xizi_double_link_insert_after_anchor head_dispatch_case (xizi_insert_after_ptrs (nodes_dispatch_case)) linklist_pre ) ”
  &&  (XiziLocalDLL.store_dll storeA_dispatch_case head_dispatch_case nodes_dispatch_case )
  **  (XiziLocalDLL.occupy_dll_node linklist_node_pre )
  **  (storeA_dispatch_case linklist_node_pre data_dispatch_case ))
  **
  ((EX result_2,
  “ (xizi_insert_after_dispatch_payload head_dispatch_case nodes_dispatch_case linklist_pre (DLL.Build_DL_Node (data_dispatch_case) (linklist_node_pre)) result_2 ) ”
  &&  (XiziLocalDLL.store_dll storeA_dispatch_case head_dispatch_case result_2 ))
  -*
  (EX result,
  “ (xizi_insert_after_payload nodes_member_case linklist_pre (DLL.Build_DL_Node (data_member_case) (linklist_node_pre)) result ) ”
  &&  (XiziLocalDLL.store_dll storeA_member_case head_member_case result )))
.

Module Type VC_Correct.

Include xizi_double_link_Strategy_Correct.

Axiom proof_of_DoubleLinkListInsertNodeAfter_entail_wit_1 : DoubleLinkListInsertNodeAfter_entail_wit_1.
Axiom proof_of_DoubleLinkListInsertNodeAfter_return_wit_1 : DoubleLinkListInsertNodeAfter_return_wit_1.
Axiom proof_of_DoubleLinkListInsertNodeAfter_return_wit_2 : DoubleLinkListInsertNodeAfter_return_wit_2.
Axiom proof_of_DoubleLinkListInsertNodeAfter_return_wit_3 : DoubleLinkListInsertNodeAfter_return_wit_3.
Axiom proof_of_DoubleLinkListInsertNodeAfter_return_wit_4 : DoubleLinkListInsertNodeAfter_return_wit_4.
Axiom proof_of_DoubleLinkListInsertNodeAfter_derive_sentinel_case_by_dispatch_case : DoubleLinkListInsertNodeAfter_derive_sentinel_case_by_dispatch_case.
Axiom proof_of_DoubleLinkListInsertNodeAfter_derive_member_case_by_dispatch_case : DoubleLinkListInsertNodeAfter_derive_member_case_by_dispatch_case.

End VC_Correct.
