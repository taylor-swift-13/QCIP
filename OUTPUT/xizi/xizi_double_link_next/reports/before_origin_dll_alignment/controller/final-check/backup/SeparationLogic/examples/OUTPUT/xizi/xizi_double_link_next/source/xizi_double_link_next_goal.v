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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next.source Require Import xizi_double_link_next_lib.
Local Open Scope sac.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_strategy_goal.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_strategy_proof.

(*----- Function DoubleLinkListGetNext -----*)

Definition DoubleLinkListGetNext_safety_wit_1 := 
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (storeA_dispatch_case: (Z -> (A -> Assertion))) (first: Z) (last: Z) (PreH1 : (first = linklist_pre)) (PreH2 : (linklist_node_pre = linklist_pre)) (PreH3 : ((xizi_double_link_next_dispatch_value (linklist_pre) ((XiziLocalDLL.ptrs (nodes_dispatch_case))) (linklist_node_pre)) = (xizi_double_link_first_value ((XiziLocalDLL.ptrs (nodes_dispatch_case)))))) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  ((( &( "linklist_node" ) )) # Ptr  |-> linklist_node_pre)
  **  (XiziLocalDLL.payloads storeA_dispatch_case nodes_dispatch_case )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (XiziLocalDLL.addr_dllseg first linklist_pre linklist_pre last (XiziLocalDLL.ptrs (nodes_dispatch_case)) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition DoubleLinkListGetNext_safety_wit_2 := 
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (storeA_dispatch_case: (Z -> (A -> Assertion))) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (last: Z) (node_next: Z) (node_prev: Z) (PreH1 : (node_next = linklist_pre)) (PreH2 : ((XiziLocalDLL.ptrs (nodes_dispatch_case)) = (app (nodes_before) ((cons (linklist_node_pre) (nodes_after)))))) (PreH3 : ~((In linklist_node_pre nodes_before ))) (PreH4 : ((xizi_double_link_next_dispatch_value (linklist_pre) ((XiziLocalDLL.ptrs (nodes_dispatch_case))) (linklist_node_pre)) = (xizi_double_link_first_value (nodes_after)))) (PreH5 : (linklist_node_pre <> linklist_pre)) ,
  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  ((( &( "linklist_node" ) )) # Ptr  |-> linklist_node_pre)
  **  (XiziLocalDLL.payloads storeA_dispatch_case nodes_dispatch_case )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (XiziLocalDLL.addr_dllseg first linklist_pre linklist_node_pre node_prev nodes_before )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev)
  **  (XiziLocalDLL.addr_dllseg node_next linklist_node_pre linklist_pre last nodes_after )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition DoubleLinkListGetNext_entail_wit_1 := 
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (storeA_dispatch_case: (Z -> (A -> Assertion))) (PreH1 : (xizi_double_link_next_anchor linklist_pre (XiziLocalDLL.ptrs (nodes_dispatch_case)) linklist_node_pre )) ,
  (XiziLocalDLL.store_dll storeA_dispatch_case linklist_pre nodes_dispatch_case )
|--
  (EX (node_next: Z)  (node_prev: Z)  (last: Z)  (first: Z)  (nodes_before: (@list Z))  (nodes_after: (@list Z)) ,
  “ ((XiziLocalDLL.ptrs (nodes_dispatch_case)) = (app (nodes_before) ((cons (linklist_node_pre) (nodes_after))))) ” 
  &&  “ ~((In linklist_node_pre nodes_before )) ” 
  &&  “ ((xizi_double_link_next_dispatch_value (linklist_pre) ((XiziLocalDLL.ptrs (nodes_dispatch_case))) (linklist_node_pre)) = (xizi_double_link_first_value (nodes_after))) ” 
  &&  “ (linklist_node_pre <> linklist_pre) ”
  &&  (XiziLocalDLL.payloads storeA_dispatch_case nodes_dispatch_case )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (XiziLocalDLL.addr_dllseg first linklist_pre linklist_node_pre node_prev nodes_before )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev)
  **  (XiziLocalDLL.addr_dllseg node_next linklist_node_pre linklist_pre last nodes_after ))
  ||
  (EX (last: Z)  (first: Z) ,
  “ (linklist_node_pre = linklist_pre) ” 
  &&  “ ((xizi_double_link_next_dispatch_value (linklist_pre) ((XiziLocalDLL.ptrs (nodes_dispatch_case))) (linklist_node_pre)) = (xizi_double_link_first_value ((XiziLocalDLL.ptrs (nodes_dispatch_case))))) ”
  &&  (XiziLocalDLL.payloads storeA_dispatch_case nodes_dispatch_case )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (XiziLocalDLL.addr_dllseg first linklist_pre linklist_pre last (XiziLocalDLL.ptrs (nodes_dispatch_case)) ))
.

Definition DoubleLinkListGetNext_return_wit_1 := 
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (storeA_dispatch_case: (Z -> (A -> Assertion))) (first: Z) (last: Z) (PreH1 : (first = linklist_pre)) (PreH2 : (linklist_node_pre = linklist_pre)) (PreH3 : ((xizi_double_link_next_dispatch_value (linklist_pre) ((XiziLocalDLL.ptrs (nodes_dispatch_case))) (linklist_node_pre)) = (xizi_double_link_first_value ((XiziLocalDLL.ptrs (nodes_dispatch_case)))))) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (XiziLocalDLL.payloads storeA_dispatch_case nodes_dispatch_case )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (XiziLocalDLL.addr_dllseg first linklist_pre linklist_pre last (XiziLocalDLL.ptrs (nodes_dispatch_case)) )
|--
  “ (0 = (xizi_double_link_next_dispatch_value (linklist_pre) ((XiziLocalDLL.ptrs (nodes_dispatch_case))) (linklist_node_pre))) ”
  &&  (XiziLocalDLL.store_dll storeA_dispatch_case linklist_pre nodes_dispatch_case )
) \/
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (storeA_dispatch_case: (Z -> (A -> Assertion))) (first: Z) (last: Z) (PreH1 : (first = linklist_pre)) (PreH2 : (linklist_node_pre = linklist_pre)) (PreH3 : ((xizi_double_link_next_dispatch_value (linklist_pre) ((XiziLocalDLL.ptrs (nodes_dispatch_case))) (linklist_node_pre)) = (xizi_double_link_first_value ((XiziLocalDLL.ptrs (nodes_dispatch_case)))))) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (XiziLocalDLL.payloads storeA_dispatch_case nodes_dispatch_case )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (XiziLocalDLL.addr_dllseg first linklist_pre linklist_pre last (XiziLocalDLL.ptrs (nodes_dispatch_case)) )
|--
  “ (0 = (xizi_double_link_next_dispatch_value (linklist_node_pre) ((XiziLocalDLL.ptrs (nodes_dispatch_case))) (linklist_node_pre))) ”
  &&  (XiziLocalDLL.store_dll storeA_dispatch_case linklist_pre nodes_dispatch_case )
).

Definition DoubleLinkListGetNext_return_wit_1_split_goal_1 := 
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (storeA_dispatch_case: (Z -> (A -> Assertion))) (first: Z) (last: Z) (PreH1 : (first = linklist_pre)) (PreH2 : (linklist_node_pre = linklist_pre)) (PreH3 : ((xizi_double_link_next_dispatch_value (linklist_pre) ((XiziLocalDLL.ptrs (nodes_dispatch_case))) (linklist_node_pre)) = (xizi_double_link_first_value ((XiziLocalDLL.ptrs (nodes_dispatch_case)))))) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (XiziLocalDLL.payloads storeA_dispatch_case nodes_dispatch_case )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (XiziLocalDLL.addr_dllseg first linklist_pre linklist_pre last (XiziLocalDLL.ptrs (nodes_dispatch_case)) )
|--
  “ (0 = (xizi_double_link_next_dispatch_value (linklist_node_pre) ((XiziLocalDLL.ptrs (nodes_dispatch_case))) (linklist_node_pre))) ”
.

Definition DoubleLinkListGetNext_return_wit_1_split_goal_spatial := 
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (storeA_dispatch_case: (Z -> (A -> Assertion))) (first: Z) (last: Z) (PreH1 : (first = linklist_pre)) (PreH2 : (linklist_node_pre = linklist_pre)) (PreH3 : ((xizi_double_link_next_dispatch_value (linklist_pre) ((XiziLocalDLL.ptrs (nodes_dispatch_case))) (linklist_node_pre)) = (xizi_double_link_first_value ((XiziLocalDLL.ptrs (nodes_dispatch_case)))))) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (XiziLocalDLL.payloads storeA_dispatch_case nodes_dispatch_case )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (XiziLocalDLL.addr_dllseg first linklist_pre linklist_pre last (XiziLocalDLL.ptrs (nodes_dispatch_case)) )
|--
  (XiziLocalDLL.store_dll storeA_dispatch_case linklist_pre nodes_dispatch_case )
.

Definition DoubleLinkListGetNext_return_wit_2 := 
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (storeA_dispatch_case: (Z -> (A -> Assertion))) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (last: Z) (node_next: Z) (node_prev: Z) (PreH1 : (node_next = linklist_pre)) (PreH2 : ((XiziLocalDLL.ptrs (nodes_dispatch_case)) = (app (nodes_before) ((cons (linklist_node_pre) (nodes_after)))))) (PreH3 : ~((In linklist_node_pre nodes_before ))) (PreH4 : ((xizi_double_link_next_dispatch_value (linklist_pre) ((XiziLocalDLL.ptrs (nodes_dispatch_case))) (linklist_node_pre)) = (xizi_double_link_first_value (nodes_after)))) (PreH5 : (linklist_node_pre <> linklist_pre)) ,
  (XiziLocalDLL.payloads storeA_dispatch_case nodes_dispatch_case )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (XiziLocalDLL.addr_dllseg first linklist_pre linklist_node_pre node_prev nodes_before )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev)
  **  (XiziLocalDLL.addr_dllseg node_next linklist_node_pre linklist_pre last nodes_after )
|--
  “ (0 = (xizi_double_link_next_dispatch_value (linklist_pre) ((XiziLocalDLL.ptrs (nodes_dispatch_case))) (linklist_node_pre))) ”
  &&  (XiziLocalDLL.store_dll storeA_dispatch_case linklist_pre nodes_dispatch_case )
) \/
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (storeA_dispatch_case: (Z -> (A -> Assertion))) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (last: Z) (node_next: Z) (node_prev: Z) (PreH1 : (node_next = linklist_pre)) (PreH2 : ((XiziLocalDLL.ptrs (nodes_dispatch_case)) = (app (nodes_before) ((cons (linklist_node_pre) (nodes_after)))))) (PreH3 : ~((In linklist_node_pre nodes_before ))) (PreH4 : ((xizi_double_link_next_dispatch_value (linklist_pre) ((XiziLocalDLL.ptrs (nodes_dispatch_case))) (linklist_node_pre)) = (xizi_double_link_first_value (nodes_after)))) (PreH5 : (linklist_node_pre <> linklist_pre)) ,
  (XiziLocalDLL.payloads storeA_dispatch_case nodes_dispatch_case )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (XiziLocalDLL.addr_dllseg first linklist_pre linklist_node_pre node_prev nodes_before )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev)
  **  (XiziLocalDLL.addr_dllseg node_next linklist_node_pre linklist_pre last nodes_after )
|--
  “ (0 = (xizi_double_link_next_dispatch_value (linklist_pre) ((XiziLocalDLL.ptrs (nodes_dispatch_case))) (linklist_node_pre))) ”
  &&  (XiziLocalDLL.store_dll storeA_dispatch_case linklist_pre nodes_dispatch_case )
).

Definition DoubleLinkListGetNext_return_wit_2_split_goal_1 := 
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (storeA_dispatch_case: (Z -> (A -> Assertion))) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (last: Z) (node_next: Z) (node_prev: Z) (PreH1 : (node_next = linklist_pre)) (PreH2 : ((XiziLocalDLL.ptrs (nodes_dispatch_case)) = (app (nodes_before) ((cons (linklist_node_pre) (nodes_after)))))) (PreH3 : ~((In linklist_node_pre nodes_before ))) (PreH4 : ((xizi_double_link_next_dispatch_value (linklist_pre) ((XiziLocalDLL.ptrs (nodes_dispatch_case))) (linklist_node_pre)) = (xizi_double_link_first_value (nodes_after)))) (PreH5 : (linklist_node_pre <> linklist_pre)) ,
  (XiziLocalDLL.payloads storeA_dispatch_case nodes_dispatch_case )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (XiziLocalDLL.addr_dllseg first linklist_pre linklist_node_pre node_prev nodes_before )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev)
  **  (XiziLocalDLL.addr_dllseg node_next linklist_node_pre linklist_pre last nodes_after )
|--
  “ (0 = (xizi_double_link_next_dispatch_value (linklist_pre) ((XiziLocalDLL.ptrs (nodes_dispatch_case))) (linklist_node_pre))) ”
.

Definition DoubleLinkListGetNext_return_wit_2_split_goal_spatial := 
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (storeA_dispatch_case: (Z -> (A -> Assertion))) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (last: Z) (node_next: Z) (node_prev: Z) (PreH1 : (node_next = linklist_pre)) (PreH2 : ((XiziLocalDLL.ptrs (nodes_dispatch_case)) = (app (nodes_before) ((cons (linklist_node_pre) (nodes_after)))))) (PreH3 : ~((In linklist_node_pre nodes_before ))) (PreH4 : ((xizi_double_link_next_dispatch_value (linklist_pre) ((XiziLocalDLL.ptrs (nodes_dispatch_case))) (linklist_node_pre)) = (xizi_double_link_first_value (nodes_after)))) (PreH5 : (linklist_node_pre <> linklist_pre)) ,
  (XiziLocalDLL.payloads storeA_dispatch_case nodes_dispatch_case )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (XiziLocalDLL.addr_dllseg first linklist_pre linklist_node_pre node_prev nodes_before )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev)
  **  (XiziLocalDLL.addr_dllseg node_next linklist_node_pre linklist_pre last nodes_after )
|--
  (XiziLocalDLL.store_dll storeA_dispatch_case linklist_pre nodes_dispatch_case )
.

Definition DoubleLinkListGetNext_return_wit_3 := 
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (storeA_dispatch_case: (Z -> (A -> Assertion))) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (last: Z) (node_next: Z) (node_prev: Z) (PreH1 : (node_next <> linklist_pre)) (PreH2 : ((XiziLocalDLL.ptrs (nodes_dispatch_case)) = (app (nodes_before) ((cons (linklist_node_pre) (nodes_after)))))) (PreH3 : ~((In linklist_node_pre nodes_before ))) (PreH4 : ((xizi_double_link_next_dispatch_value (linklist_pre) ((XiziLocalDLL.ptrs (nodes_dispatch_case))) (linklist_node_pre)) = (xizi_double_link_first_value (nodes_after)))) (PreH5 : (linklist_node_pre <> linklist_pre)) ,
  (XiziLocalDLL.payloads storeA_dispatch_case nodes_dispatch_case )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (XiziLocalDLL.addr_dllseg first linklist_pre linklist_node_pre node_prev nodes_before )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev)
  **  (XiziLocalDLL.addr_dllseg node_next linklist_node_pre linklist_pre last nodes_after )
|--
  “ (node_next = (xizi_double_link_next_dispatch_value (linklist_pre) ((XiziLocalDLL.ptrs (nodes_dispatch_case))) (linklist_node_pre))) ”
  &&  (XiziLocalDLL.store_dll storeA_dispatch_case linklist_pre nodes_dispatch_case )
) \/
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (storeA_dispatch_case: (Z -> (A -> Assertion))) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (last: Z) (node_next: Z) (node_prev: Z) (PreH1 : (node_next <> linklist_pre)) (PreH2 : ((XiziLocalDLL.ptrs (nodes_dispatch_case)) = (app (nodes_before) ((cons (linklist_node_pre) (nodes_after)))))) (PreH3 : ~((In linklist_node_pre nodes_before ))) (PreH4 : ((xizi_double_link_next_dispatch_value (linklist_pre) ((XiziLocalDLL.ptrs (nodes_dispatch_case))) (linklist_node_pre)) = (xizi_double_link_first_value (nodes_after)))) (PreH5 : (linklist_node_pre <> linklist_pre)) ,
  (XiziLocalDLL.payloads storeA_dispatch_case nodes_dispatch_case )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (XiziLocalDLL.addr_dllseg first linklist_pre linklist_node_pre node_prev nodes_before )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev)
  **  (XiziLocalDLL.addr_dllseg node_next linklist_node_pre linklist_pre last nodes_after )
|--
  “ (node_next = (xizi_double_link_next_dispatch_value (linklist_pre) ((XiziLocalDLL.ptrs (nodes_dispatch_case))) (linklist_node_pre))) ”
  &&  (XiziLocalDLL.store_dll storeA_dispatch_case linklist_pre nodes_dispatch_case )
).

Definition DoubleLinkListGetNext_return_wit_3_split_goal_1 := 
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (storeA_dispatch_case: (Z -> (A -> Assertion))) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (last: Z) (node_next: Z) (node_prev: Z) (PreH1 : (node_next <> linklist_pre)) (PreH2 : ((XiziLocalDLL.ptrs (nodes_dispatch_case)) = (app (nodes_before) ((cons (linklist_node_pre) (nodes_after)))))) (PreH3 : ~((In linklist_node_pre nodes_before ))) (PreH4 : ((xizi_double_link_next_dispatch_value (linklist_pre) ((XiziLocalDLL.ptrs (nodes_dispatch_case))) (linklist_node_pre)) = (xizi_double_link_first_value (nodes_after)))) (PreH5 : (linklist_node_pre <> linklist_pre)) ,
  (XiziLocalDLL.payloads storeA_dispatch_case nodes_dispatch_case )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (XiziLocalDLL.addr_dllseg first linklist_pre linklist_node_pre node_prev nodes_before )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev)
  **  (XiziLocalDLL.addr_dllseg node_next linklist_node_pre linklist_pre last nodes_after )
|--
  “ (node_next = (xizi_double_link_next_dispatch_value (linklist_pre) ((XiziLocalDLL.ptrs (nodes_dispatch_case))) (linklist_node_pre))) ”
.

Definition DoubleLinkListGetNext_return_wit_3_split_goal_spatial := 
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (storeA_dispatch_case: (Z -> (A -> Assertion))) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (first: Z) (last: Z) (node_next: Z) (node_prev: Z) (PreH1 : (node_next <> linklist_pre)) (PreH2 : ((XiziLocalDLL.ptrs (nodes_dispatch_case)) = (app (nodes_before) ((cons (linklist_node_pre) (nodes_after)))))) (PreH3 : ~((In linklist_node_pre nodes_before ))) (PreH4 : ((xizi_double_link_next_dispatch_value (linklist_pre) ((XiziLocalDLL.ptrs (nodes_dispatch_case))) (linklist_node_pre)) = (xizi_double_link_first_value (nodes_after)))) (PreH5 : (linklist_node_pre <> linklist_pre)) ,
  (XiziLocalDLL.payloads storeA_dispatch_case nodes_dispatch_case )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (XiziLocalDLL.addr_dllseg first linklist_pre linklist_node_pre node_prev nodes_before )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev)
  **  (XiziLocalDLL.addr_dllseg node_next linklist_node_pre linklist_pre last nodes_after )
|--
  (XiziLocalDLL.store_dll storeA_dispatch_case linklist_pre nodes_dispatch_case )
.

Definition DoubleLinkListGetNext_return_wit_4 := 
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (storeA_dispatch_case: (Z -> (A -> Assertion))) (first: Z) (last: Z) (PreH1 : (first <> linklist_pre)) (PreH2 : (linklist_node_pre = linklist_pre)) (PreH3 : ((xizi_double_link_next_dispatch_value (linklist_pre) ((XiziLocalDLL.ptrs (nodes_dispatch_case))) (linklist_node_pre)) = (xizi_double_link_first_value ((XiziLocalDLL.ptrs (nodes_dispatch_case)))))) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (XiziLocalDLL.payloads storeA_dispatch_case nodes_dispatch_case )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (XiziLocalDLL.addr_dllseg first linklist_pre linklist_pre last (XiziLocalDLL.ptrs (nodes_dispatch_case)) )
|--
  “ (first = (xizi_double_link_next_dispatch_value (linklist_pre) ((XiziLocalDLL.ptrs (nodes_dispatch_case))) (linklist_node_pre))) ”
  &&  (XiziLocalDLL.store_dll storeA_dispatch_case linklist_pre nodes_dispatch_case )
) \/
(
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (storeA_dispatch_case: (Z -> (A -> Assertion))) (first: Z) (last: Z) (PreH1 : (first <> linklist_pre)) (PreH2 : (linklist_node_pre = linklist_pre)) (PreH3 : ((xizi_double_link_next_dispatch_value (linklist_pre) ((XiziLocalDLL.ptrs (nodes_dispatch_case))) (linklist_node_pre)) = (xizi_double_link_first_value ((XiziLocalDLL.ptrs (nodes_dispatch_case)))))) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (XiziLocalDLL.payloads storeA_dispatch_case nodes_dispatch_case )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (XiziLocalDLL.addr_dllseg first linklist_pre linklist_pre last (XiziLocalDLL.ptrs (nodes_dispatch_case)) )
|--
  “ (first = (xizi_double_link_next_dispatch_value (linklist_node_pre) ((XiziLocalDLL.ptrs (nodes_dispatch_case))) (linklist_node_pre))) ”
  &&  (XiziLocalDLL.store_dll storeA_dispatch_case linklist_pre nodes_dispatch_case )
).

Definition DoubleLinkListGetNext_return_wit_4_split_goal_1 := 
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (storeA_dispatch_case: (Z -> (A -> Assertion))) (first: Z) (last: Z) (PreH1 : (first <> linklist_pre)) (PreH2 : (linklist_node_pre = linklist_pre)) (PreH3 : ((xizi_double_link_next_dispatch_value (linklist_pre) ((XiziLocalDLL.ptrs (nodes_dispatch_case))) (linklist_node_pre)) = (xizi_double_link_first_value ((XiziLocalDLL.ptrs (nodes_dispatch_case)))))) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (XiziLocalDLL.payloads storeA_dispatch_case nodes_dispatch_case )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (XiziLocalDLL.addr_dllseg first linklist_pre linklist_pre last (XiziLocalDLL.ptrs (nodes_dispatch_case)) )
|--
  “ (first = (xizi_double_link_next_dispatch_value (linklist_node_pre) ((XiziLocalDLL.ptrs (nodes_dispatch_case))) (linklist_node_pre))) ”
.

Definition DoubleLinkListGetNext_return_wit_4_split_goal_spatial := 
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (storeA_dispatch_case: (Z -> (A -> Assertion))) (first: Z) (last: Z) (PreH1 : (first <> linklist_pre)) (PreH2 : (linklist_node_pre = linklist_pre)) (PreH3 : ((xizi_double_link_next_dispatch_value (linklist_pre) ((XiziLocalDLL.ptrs (nodes_dispatch_case))) (linklist_node_pre)) = (xizi_double_link_first_value ((XiziLocalDLL.ptrs (nodes_dispatch_case)))))) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (XiziLocalDLL.payloads storeA_dispatch_case nodes_dispatch_case )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (XiziLocalDLL.addr_dllseg first linklist_pre linklist_pre last (XiziLocalDLL.ptrs (nodes_dispatch_case)) )
|--
  (XiziLocalDLL.store_dll storeA_dispatch_case linklist_pre nodes_dispatch_case )
.

Definition DoubleLinkListGetNext_partial_solve_wit_1 := 
forall (A: Type) (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) (storeA_dispatch_case: (Z -> (A -> Assertion))) (first: Z) (last: Z) (PreH1 : (linklist_node_pre = linklist_pre)) (PreH2 : ((xizi_double_link_next_dispatch_value (linklist_pre) ((XiziLocalDLL.ptrs (nodes_dispatch_case))) (linklist_node_pre)) = (xizi_double_link_first_value ((XiziLocalDLL.ptrs (nodes_dispatch_case)))))) ,
  (XiziLocalDLL.payloads storeA_dispatch_case nodes_dispatch_case )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (XiziLocalDLL.addr_dllseg first linklist_pre linklist_pre last (XiziLocalDLL.ptrs (nodes_dispatch_case)) )
|--
  “ (linklist_node_pre = linklist_pre) ” 
  &&  “ ((xizi_double_link_next_dispatch_value (linklist_pre) ((XiziLocalDLL.ptrs (nodes_dispatch_case))) (linklist_node_pre)) = (xizi_double_link_first_value ((XiziLocalDLL.ptrs (nodes_dispatch_case))))) ”
  &&  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (XiziLocalDLL.payloads storeA_dispatch_case nodes_dispatch_case )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (XiziLocalDLL.addr_dllseg first linklist_pre linklist_pre last (XiziLocalDLL.ptrs (nodes_dispatch_case)) )
.

Definition DoubleLinkListGetNext_derive_sentinel_case_by_dispatch_case := 
forall (A: Type) ,
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_sentinel_case: (@list (@DLL.DL_Node A))) (storeA_sentinel_case: (Z -> (A -> Assertion))) ,
  “ (linklist_node_pre = linklist_pre) ”
  &&  (XiziLocalDLL.store_dll storeA_sentinel_case linklist_pre nodes_sentinel_case )
|--
EX (A: Type) ,
EX (storeA_dispatch_case: (Z -> (A -> Assertion))) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) ,
  (“ (xizi_double_link_next_anchor linklist_pre (XiziLocalDLL.ptrs (nodes_dispatch_case)) linklist_node_pre ) ”
  &&  (XiziLocalDLL.store_dll storeA_dispatch_case linklist_pre nodes_dispatch_case ))
  **
  ((EX retval_2,
  “ (retval_2 = (xizi_double_link_next_dispatch_value (linklist_pre) ((XiziLocalDLL.ptrs (nodes_dispatch_case))) (linklist_node_pre))) ”
  &&  (XiziLocalDLL.store_dll storeA_dispatch_case linklist_pre nodes_dispatch_case ))
  -*
  (EX retval,
  “ (retval = (xizi_double_link_first_value ((XiziLocalDLL.ptrs (nodes_sentinel_case))))) ”
  &&  (XiziLocalDLL.store_dll storeA_sentinel_case linklist_pre nodes_sentinel_case )))
.

Definition DoubleLinkListGetNext_derive_member_case_by_dispatch_case := 
forall (A: Type) ,
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_member_case: (@list (@DLL.DL_Node A))) (storeA_member_case: (Z -> (A -> Assertion))) ,
  “ (In linklist_node_pre (XiziLocalDLL.ptrs (nodes_member_case)) ) ”
  &&  (XiziLocalDLL.store_dll storeA_member_case linklist_pre nodes_member_case )
|--
EX (A: Type) ,
EX (storeA_dispatch_case: (Z -> (A -> Assertion))) (nodes_dispatch_case: (@list (@DLL.DL_Node A))) ,
  (“ (xizi_double_link_next_anchor linklist_pre (XiziLocalDLL.ptrs (nodes_dispatch_case)) linklist_node_pre ) ”
  &&  (XiziLocalDLL.store_dll storeA_dispatch_case linklist_pre nodes_dispatch_case ))
  **
  ((EX retval_2,
  “ (retval_2 = (xizi_double_link_next_dispatch_value (linklist_pre) ((XiziLocalDLL.ptrs (nodes_dispatch_case))) (linklist_node_pre))) ”
  &&  (XiziLocalDLL.store_dll storeA_dispatch_case linklist_pre nodes_dispatch_case ))
  -*
  (EX retval,
  “ (retval = (xizi_double_link_next_value ((XiziLocalDLL.ptrs (nodes_member_case))) (linklist_node_pre))) ”
  &&  (XiziLocalDLL.store_dll storeA_member_case linklist_pre nodes_member_case )))
.

Module Type VC_Correct.

Include xizi_double_link_Strategy_Correct.

Axiom proof_of_DoubleLinkListGetNext_safety_wit_1 : DoubleLinkListGetNext_safety_wit_1.
Axiom proof_of_DoubleLinkListGetNext_safety_wit_2 : DoubleLinkListGetNext_safety_wit_2.
Axiom proof_of_DoubleLinkListGetNext_entail_wit_1 : DoubleLinkListGetNext_entail_wit_1.
Axiom proof_of_DoubleLinkListGetNext_return_wit_1 : DoubleLinkListGetNext_return_wit_1.
Axiom proof_of_DoubleLinkListGetNext_return_wit_2 : DoubleLinkListGetNext_return_wit_2.
Axiom proof_of_DoubleLinkListGetNext_return_wit_3 : DoubleLinkListGetNext_return_wit_3.
Axiom proof_of_DoubleLinkListGetNext_return_wit_4 : DoubleLinkListGetNext_return_wit_4.
Axiom proof_of_DoubleLinkListGetNext_partial_solve_wit_1 : DoubleLinkListGetNext_partial_solve_wit_1.
Axiom proof_of_DoubleLinkListGetNext_derive_sentinel_case_by_dispatch_case : DoubleLinkListGetNext_derive_sentinel_case_by_dispatch_case.
Axiom proof_of_DoubleLinkListGetNext_derive_member_case_by_dispatch_case : DoubleLinkListGetNext_derive_member_case_by_dispatch_case.

End VC_Correct.
