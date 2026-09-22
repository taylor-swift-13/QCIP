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
Local Open Scope sac.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_strategy_goal.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_strategy_proof.

(*----- Function DoubleLinkListLenGet -----*)

Definition DoubleLinkListLenGet_safety_wit_1 := 
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@XiziStoreADLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) ,
  ((( &( "linklist_length" ) )) # UInt  |->_)
  **  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  (xizi_store_dll storeA_general linklist_pre nodes_general )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition DoubleLinkListLenGet_entail_wit_1 := 
(
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@XiziStoreADLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) ,
  (xizi_store_dll storeA_general linklist_pre nodes_general )
|--
  EX (last: Z)  (first: Z)  (done: (@list Z))  (todo: (@list Z)) ,
  “ ((xizi_dll_ptrs (nodes_general)) = (app (done) (todo))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (0 = (Zlength (done))) ” 
  &&  “ ((Zlength (nodes_general)) = ((Zlength (done)) + (Zlength (todo)) )) ” 
  &&  “ (done = (@nil Z)) ” 
  &&  “ (linklist_pre = linklist_pre) ”
  &&  (xizi_dll_payloads storeA_general nodes_general )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first linklist_pre linklist_pre last todo )
) \/
(
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@XiziStoreADLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) ,
  (xizi_store_dll storeA_general linklist_pre nodes_general )
|--
  EX (last: Z)  (first: Z)  (todo: (@list Z)) ,
  “ ((xizi_dll_ptrs (nodes_general)) = (app ((@nil Z)) (todo))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (0 = (Zlength ((@nil Z)))) ” 
  &&  “ ((Zlength (nodes_general)) = ((Zlength ((@nil Z))) + (Zlength (todo)) )) ”
  &&  (xizi_dll_payloads storeA_general nodes_general )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first linklist_pre linklist_pre last todo )
).

Definition DoubleLinkListLenGet_entail_wit_2_1 := 
(
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@XiziStoreADLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (next: Z) (prev_2: Z) (last_2: Z) (first_2: Z) (before_2: (@list Z)) (tmp_node: Z) (linklist_length: Z) (done_2: (@list Z)) (todo_2: (@list Z)) (PreH1 : (next <> linklist_pre)) (PreH2 : ((xizi_dll_ptrs (nodes_general)) = (app (done_2) (todo_2)))) (PreH3 : (linklist_pre <> 0)) (PreH4 : (linklist_length = (Zlength (done_2)))) (PreH5 : ((Zlength (nodes_general)) = ((Zlength (done_2)) + (Zlength (todo_2)) ))) (PreH6 : (done_2 = (app (before_2) ((cons (tmp_node) ((@nil Z))))))) (PreH7 : (tmp_node <> 0)) (PreH8 : (tmp_node <> linklist_pre)) ,
  (xizi_dll_payloads storeA_general nodes_general )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_2)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last_2)
  **  (xizi_dllseg first_2 linklist_pre tmp_node prev_2 before_2 )
  **  ((&((tmp_node)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((tmp_node)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev_2)
  **  (xizi_dllseg next tmp_node linklist_pre last_2 todo_2 )
|--
  EX (next_2: Z)  (prev: Z)  (last: Z)  (first: Z)  (before: (@list Z))  (done: (@list Z))  (todo: (@list Z)) ,
  “ ((xizi_dll_ptrs (nodes_general)) = (app (done) (todo))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ ((unsigned_last_nbits ((linklist_length + 1 )) (32)) = (Zlength (done))) ” 
  &&  “ ((Zlength (nodes_general)) = ((Zlength (done)) + (Zlength (todo)) )) ” 
  &&  “ (done = (app (before) ((cons (next) ((@nil Z)))))) ” 
  &&  “ (next <> 0) ” 
  &&  “ (next <> linklist_pre) ”
  &&  (xizi_dll_payloads storeA_general nodes_general )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first linklist_pre next prev before )
  **  ((&((next)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_2)
  **  ((&((next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  (xizi_dllseg next_2 next linklist_pre last todo )
) \/
(
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@XiziStoreADLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (next: Z) (prev_2: Z) (last_2: Z) (first_2: Z) (before_2: (@list Z)) (tmp_node: Z) (linklist_length: Z) (done_2: (@list Z)) (todo_2: (@list Z)) (next_3: Z) (l0: (@list Z)) (PreH1 : (todo_2 = (cons (next) (l0)))) (PreH2 : (next <> linklist_pre)) (PreH3 : ((xizi_dll_ptrs (nodes_general)) = (app (done_2) (todo_2)))) (PreH4 : (linklist_pre <> 0)) (PreH5 : (linklist_length = (Zlength (done_2)))) (PreH6 : ((Zlength (nodes_general)) = ((Zlength (done_2)) + (Zlength (todo_2)) ))) (PreH7 : (done_2 = (app (before_2) ((cons (tmp_node) ((@nil Z))))))) (PreH8 : (tmp_node <> 0)) (PreH9 : (tmp_node <> linklist_pre)) ,
  (xizi_dllseg next_3 next linklist_pre last_2 l0 )
  **  (xizi_dll_payloads storeA_general nodes_general )
  **  (xizi_dllseg first_2 linklist_pre tmp_node prev_2 before_2 )
  **  ((&((tmp_node)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((tmp_node)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev_2)
|--
  EX (before: (@list Z))  (todo: (@list Z)) ,
  “ ((xizi_dll_ptrs (nodes_general)) = (app ((app (before) ((cons (next) ((@nil Z)))))) (todo))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ ((unsigned_last_nbits ((linklist_length + 1 )) (32)) = (Zlength ((app (before) ((cons (next) ((@nil Z)))))))) ” 
  &&  “ ((Zlength (nodes_general)) = ((Zlength ((app (before) ((cons (next) ((@nil Z))))))) + (Zlength (todo)) )) ” 
  &&  “ (next <> 0) ” 
  &&  “ (next <> linklist_pre) ”
  &&  (xizi_dll_payloads storeA_general nodes_general )
  **  (xizi_dllseg first_2 linklist_pre next tmp_node before )
  **  (xizi_dllseg next_3 next linklist_pre last_2 todo )
).

Definition DoubleLinkListLenGet_entail_wit_2_2 := 
(
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@XiziStoreADLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (last_2: Z) (first_2: Z) (tmp_node: Z) (linklist_length: Z) (done_2: (@list Z)) (todo_2: (@list Z)) (PreH1 : (first_2 <> linklist_pre)) (PreH2 : ((xizi_dll_ptrs (nodes_general)) = (app (done_2) (todo_2)))) (PreH3 : (linklist_pre <> 0)) (PreH4 : (linklist_length = (Zlength (done_2)))) (PreH5 : ((Zlength (nodes_general)) = ((Zlength (done_2)) + (Zlength (todo_2)) ))) (PreH6 : (done_2 = (@nil Z))) (PreH7 : (tmp_node = linklist_pre)) ,
  ((&((tmp_node)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_2)
  **  (xizi_dll_payloads storeA_general nodes_general )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last_2)
  **  (xizi_dllseg first_2 linklist_pre linklist_pre last_2 todo_2 )
|--
  EX (next: Z)  (prev: Z)  (last: Z)  (first: Z)  (before: (@list Z))  (done: (@list Z))  (todo: (@list Z)) ,
  “ ((xizi_dll_ptrs (nodes_general)) = (app (done) (todo))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ ((unsigned_last_nbits ((linklist_length + 1 )) (32)) = (Zlength (done))) ” 
  &&  “ ((Zlength (nodes_general)) = ((Zlength (done)) + (Zlength (todo)) )) ” 
  &&  “ (done = (app (before) ((cons (first_2) ((@nil Z)))))) ” 
  &&  “ (first_2 <> 0) ” 
  &&  “ (first_2 <> linklist_pre) ”
  &&  (xizi_dll_payloads storeA_general nodes_general )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first linklist_pre first_2 prev before )
  **  ((&((first_2)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((first_2)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  (xizi_dllseg next first_2 linklist_pre last todo )
) \/
(
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@XiziStoreADLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (last_2: Z) (first_2: Z) (tmp_node: Z) (linklist_length: Z) (done_2: (@list Z)) (todo_2: (@list Z)) (next_2: Z) (l0: (@list Z)) (PreH1 : (todo_2 = (cons (first_2) (l0)))) (PreH2 : (first_2 <> linklist_pre)) (PreH3 : ((xizi_dll_ptrs (nodes_general)) = (app (done_2) (todo_2)))) (PreH4 : (linklist_pre <> 0)) (PreH5 : (linklist_length = (Zlength (done_2)))) (PreH6 : ((Zlength (nodes_general)) = ((Zlength (done_2)) + (Zlength (todo_2)) ))) (PreH7 : (done_2 = (@nil Z))) (PreH8 : (tmp_node = linklist_pre)) ,
  (xizi_dllseg next_2 first_2 linklist_pre last_2 l0 )
  **  ((&((tmp_node)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_2)
  **  (xizi_dll_payloads storeA_general nodes_general )
|--
  EX (first: Z)  (before: (@list Z))  (todo: (@list Z)) ,
  “ ((xizi_dll_ptrs (nodes_general)) = (app ((app (before) ((cons (first_2) ((@nil Z)))))) (todo))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ ((unsigned_last_nbits ((linklist_length + 1 )) (32)) = (Zlength ((app (before) ((cons (first_2) ((@nil Z)))))))) ” 
  &&  “ ((Zlength (nodes_general)) = ((Zlength ((app (before) ((cons (first_2) ((@nil Z))))))) + (Zlength (todo)) )) ” 
  &&  “ (first_2 <> 0) ” 
  &&  “ (first_2 <> linklist_pre) ”
  &&  (xizi_dll_payloads storeA_general nodes_general )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_dllseg first linklist_pre first_2 linklist_pre before )
  **  (xizi_dllseg next_2 first_2 linklist_pre last_2 todo )
).

Definition DoubleLinkListLenGet_return_wit_1 := 
(
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@XiziStoreADLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (next: Z) (prev: Z) (last: Z) (first: Z) (before: (@list Z)) (tmp_node: Z) (linklist_length: Z) (done: (@list Z)) (todo: (@list Z)) (PreH1 : (next = linklist_pre)) (PreH2 : ((xizi_dll_ptrs (nodes_general)) = (app (done) (todo)))) (PreH3 : (linklist_pre <> 0)) (PreH4 : (linklist_length = (Zlength (done)))) (PreH5 : ((Zlength (nodes_general)) = ((Zlength (done)) + (Zlength (todo)) ))) (PreH6 : (done = (app (before) ((cons (tmp_node) ((@nil Z))))))) (PreH7 : (tmp_node <> 0)) (PreH8 : (tmp_node <> linklist_pre)) ,
  (xizi_dll_payloads storeA_general nodes_general )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first linklist_pre tmp_node prev before )
  **  ((&((tmp_node)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((tmp_node)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  (xizi_dllseg next tmp_node linklist_pre last todo )
|--
  “ (linklist_length = (Zlength (nodes_general))) ”
  &&  (xizi_store_dll storeA_general linklist_pre nodes_general )
) \/
(
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@XiziStoreADLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (next: Z) (prev: Z) (last: Z) (first: Z) (before: (@list Z)) (tmp_node: Z) (linklist_length: Z) (done: (@list Z)) (todo: (@list Z)) (PreH1 : (next = linklist_pre)) (PreH2 : ((xizi_dll_ptrs (nodes_general)) = (app (done) (todo)))) (PreH3 : (linklist_pre <> 0)) (PreH4 : (linklist_length = (Zlength (done)))) (PreH5 : ((Zlength (nodes_general)) = ((Zlength (done)) + (Zlength (todo)) ))) (PreH6 : (done = (app (before) ((cons (tmp_node) ((@nil Z))))))) (PreH7 : (tmp_node <> 0)) (PreH8 : (tmp_node <> linklist_pre)) ,
  (xizi_dll_payloads storeA_general nodes_general )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first linklist_pre tmp_node prev before )
  **  ((&((tmp_node)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((tmp_node)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  (xizi_dllseg next tmp_node linklist_pre last todo )
|--
  “ (linklist_length = (Zlength (nodes_general))) ”
  &&  (xizi_store_dll storeA_general linklist_pre nodes_general )
).

Definition DoubleLinkListLenGet_return_wit_1_split_goal_1 := 
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@XiziStoreADLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (next: Z) (prev: Z) (last: Z) (first: Z) (before: (@list Z)) (tmp_node: Z) (linklist_length: Z) (done: (@list Z)) (todo: (@list Z)) (PreH1 : (next = linklist_pre)) (PreH2 : ((xizi_dll_ptrs (nodes_general)) = (app (done) (todo)))) (PreH3 : (linklist_pre <> 0)) (PreH4 : (linklist_length = (Zlength (done)))) (PreH5 : ((Zlength (nodes_general)) = ((Zlength (done)) + (Zlength (todo)) ))) (PreH6 : (done = (app (before) ((cons (tmp_node) ((@nil Z))))))) (PreH7 : (tmp_node <> 0)) (PreH8 : (tmp_node <> linklist_pre)) ,
  (xizi_dll_payloads storeA_general nodes_general )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first linklist_pre tmp_node prev before )
  **  ((&((tmp_node)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((tmp_node)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  (xizi_dllseg next tmp_node linklist_pre last todo )
|--
  “ (linklist_length = (Zlength (nodes_general))) ”
.

Definition DoubleLinkListLenGet_return_wit_1_split_goal_spatial := 
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@XiziStoreADLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (next: Z) (prev: Z) (last: Z) (first: Z) (before: (@list Z)) (tmp_node: Z) (linklist_length: Z) (done: (@list Z)) (todo: (@list Z)) (PreH1 : (next = linklist_pre)) (PreH2 : ((xizi_dll_ptrs (nodes_general)) = (app (done) (todo)))) (PreH3 : (linklist_pre <> 0)) (PreH4 : (linklist_length = (Zlength (done)))) (PreH5 : ((Zlength (nodes_general)) = ((Zlength (done)) + (Zlength (todo)) ))) (PreH6 : (done = (app (before) ((cons (tmp_node) ((@nil Z))))))) (PreH7 : (tmp_node <> 0)) (PreH8 : (tmp_node <> linklist_pre)) ,
  (xizi_dll_payloads storeA_general nodes_general )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first linklist_pre tmp_node prev before )
  **  ((&((tmp_node)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((tmp_node)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  (xizi_dllseg next tmp_node linklist_pre last todo )
|--
  (xizi_store_dll storeA_general linklist_pre nodes_general )
.

Definition DoubleLinkListLenGet_return_wit_2 := 
(
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@XiziStoreADLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (last: Z) (first: Z) (tmp_node: Z) (linklist_length: Z) (done: (@list Z)) (todo: (@list Z)) (PreH1 : (first = linklist_pre)) (PreH2 : ((xizi_dll_ptrs (nodes_general)) = (app (done) (todo)))) (PreH3 : (linklist_pre <> 0)) (PreH4 : (linklist_length = (Zlength (done)))) (PreH5 : ((Zlength (nodes_general)) = ((Zlength (done)) + (Zlength (todo)) ))) (PreH6 : (done = (@nil Z))) (PreH7 : (tmp_node = linklist_pre)) ,
  ((&((tmp_node)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_dll_payloads storeA_general nodes_general )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first linklist_pre linklist_pre last todo )
|--
  “ (linklist_length = (Zlength (nodes_general))) ”
  &&  (xizi_store_dll storeA_general linklist_pre nodes_general )
) \/
(
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@XiziStoreADLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (last: Z) (first: Z) (tmp_node: Z) (linklist_length: Z) (done: (@list Z)) (todo: (@list Z)) (PreH1 : (first = linklist_pre)) (PreH2 : ((xizi_dll_ptrs (nodes_general)) = (app (done) (todo)))) (PreH3 : (linklist_pre <> 0)) (PreH4 : (linklist_length = (Zlength (done)))) (PreH5 : ((Zlength (nodes_general)) = ((Zlength (done)) + (Zlength (todo)) ))) (PreH6 : (done = (@nil Z))) (PreH7 : (tmp_node = linklist_pre)) ,
  ((&((tmp_node)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_dll_payloads storeA_general nodes_general )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first linklist_pre linklist_pre last todo )
|--
  “ (linklist_length = (Zlength (nodes_general))) ”
  &&  (xizi_store_dll storeA_general linklist_pre nodes_general )
).

Definition DoubleLinkListLenGet_return_wit_2_split_goal_1 := 
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@XiziStoreADLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (last: Z) (first: Z) (tmp_node: Z) (linklist_length: Z) (done: (@list Z)) (todo: (@list Z)) (PreH1 : (first = linklist_pre)) (PreH2 : ((xizi_dll_ptrs (nodes_general)) = (app (done) (todo)))) (PreH3 : (linklist_pre <> 0)) (PreH4 : (linklist_length = (Zlength (done)))) (PreH5 : ((Zlength (nodes_general)) = ((Zlength (done)) + (Zlength (todo)) ))) (PreH6 : (done = (@nil Z))) (PreH7 : (tmp_node = linklist_pre)) ,
  ((&((tmp_node)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_dll_payloads storeA_general nodes_general )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first linklist_pre linklist_pre last todo )
|--
  “ (linklist_length = (Zlength (nodes_general))) ”
.

Definition DoubleLinkListLenGet_return_wit_2_split_goal_spatial := 
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@XiziStoreADLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (last: Z) (first: Z) (tmp_node: Z) (linklist_length: Z) (done: (@list Z)) (todo: (@list Z)) (PreH1 : (first = linklist_pre)) (PreH2 : ((xizi_dll_ptrs (nodes_general)) = (app (done) (todo)))) (PreH3 : (linklist_pre <> 0)) (PreH4 : (linklist_length = (Zlength (done)))) (PreH5 : ((Zlength (nodes_general)) = ((Zlength (done)) + (Zlength (todo)) ))) (PreH6 : (done = (@nil Z))) (PreH7 : (tmp_node = linklist_pre)) ,
  ((&((tmp_node)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_dll_payloads storeA_general nodes_general )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first linklist_pre linklist_pre last todo )
|--
  (xizi_store_dll storeA_general linklist_pre nodes_general )
.

Definition DoubleLinkListLenGet_partial_solve_wit_1 := 
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@XiziStoreADLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (last: Z) (first: Z) (tmp_node: Z) (linklist_length: Z) (done: (@list Z)) (todo: (@list Z)) (PreH1 : ((xizi_dll_ptrs (nodes_general)) = (app (done) (todo)))) (PreH2 : (linklist_pre <> 0)) (PreH3 : (linklist_length = (Zlength (done)))) (PreH4 : ((Zlength (nodes_general)) = ((Zlength (done)) + (Zlength (todo)) ))) (PreH5 : (done = (@nil Z))) (PreH6 : (tmp_node = linklist_pre)) ,
  (xizi_dll_payloads storeA_general nodes_general )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first linklist_pre linklist_pre last todo )
|--
  “ ((xizi_dll_ptrs (nodes_general)) = (app (done) (todo))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_length = (Zlength (done))) ” 
  &&  “ ((Zlength (nodes_general)) = ((Zlength (done)) + (Zlength (todo)) )) ” 
  &&  “ (done = (@nil Z)) ” 
  &&  “ (tmp_node = linklist_pre) ”
  &&  ((&((tmp_node)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_dll_payloads storeA_general nodes_general )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first linklist_pre linklist_pre last todo )
.

Definition DoubleLinkListLenGet_derive_nil_case_by_general := 
forall (A: Type) ,
forall (linklist_pre: Z) (storeA_nil_case: (Z -> (A -> Assertion))) ,
  (xizi_store_dll storeA_nil_case linklist_pre nil )
|--
EX (A: Type) ,
EX (storeA_general: (Z -> (A -> Assertion))) (nodes_general: (@list (@XiziStoreADLL.DL_Node A))) ,
  ((xizi_store_dll storeA_general linklist_pre nodes_general ))
  **
  ((EX retval_2,
  “ (retval_2 = (Zlength (nodes_general))) ”
  &&  (xizi_store_dll storeA_general linklist_pre nodes_general ))
  -*
  (EX retval,
  “ (retval = 0) ”
  &&  (xizi_store_dll storeA_nil_case linklist_pre nil )))
.

Module Type VC_Correct.

Include xizi_double_link_Strategy_Correct.

Axiom proof_of_DoubleLinkListLenGet_safety_wit_1 : DoubleLinkListLenGet_safety_wit_1.
Axiom proof_of_DoubleLinkListLenGet_entail_wit_1 : DoubleLinkListLenGet_entail_wit_1.
Axiom proof_of_DoubleLinkListLenGet_entail_wit_2_1 : DoubleLinkListLenGet_entail_wit_2_1.
Axiom proof_of_DoubleLinkListLenGet_entail_wit_2_2 : DoubleLinkListLenGet_entail_wit_2_2.
Axiom proof_of_DoubleLinkListLenGet_return_wit_1 : DoubleLinkListLenGet_return_wit_1.
Axiom proof_of_DoubleLinkListLenGet_return_wit_2 : DoubleLinkListLenGet_return_wit_2.
Axiom proof_of_DoubleLinkListLenGet_partial_solve_wit_1 : DoubleLinkListLenGet_partial_solve_wit_1.
Axiom proof_of_DoubleLinkListLenGet_derive_nil_case_by_general : DoubleLinkListLenGet_derive_nil_case_by_general.

End VC_Correct.
