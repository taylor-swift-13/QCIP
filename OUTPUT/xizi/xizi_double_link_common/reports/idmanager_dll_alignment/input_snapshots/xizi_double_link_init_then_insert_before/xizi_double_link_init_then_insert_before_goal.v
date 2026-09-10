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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_init_then_insert_before.source Require Import xizi_double_link_init_then_insert_before_lib.
Local Open Scope sac.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_strategy_goal.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_strategy_proof.

(*----- Function InitDoubleLinkList -----*)

Definition InitDoubleLinkList_return_wit_1 := 
(
forall (A: Type) (linklist_head_pre: Z) (storeA: (Z -> (A -> Assertion))) (PreH1 : (linklist_head_pre <> 0)) ,
  ((&((linklist_head_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_head_pre)
  **  ((&((linklist_head_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_head_pre)
|--
  (xizi_store_dll storeA linklist_head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
) \/
(
forall (A: Type) (linklist_head_pre: Z) (storeA: (Z -> (A -> Assertion))) (PreH1 : (linklist_head_pre <> 0)) ,
  ((&((linklist_head_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_head_pre)
  **  ((&((linklist_head_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_head_pre)
|--
  (xizi_store_dll storeA linklist_head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
).

Definition InitDoubleLinkList_return_wit_1_split_goal_spatial := 
forall (A: Type) (linklist_head_pre: Z) (storeA: (Z -> (A -> Assertion))) (PreH1 : (linklist_head_pre <> 0)) ,
  ((&((linklist_head_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_head_pre)
  **  ((&((linklist_head_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_head_pre)
|--
  (xizi_store_dll storeA linklist_head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
.

Definition InitDoubleLinkList_partial_solve_wit_1 := 
forall (linklist_head_pre: Z) ,
  (xizi_dll_node linklist_head_pre )
|--
  “ (linklist_head_pre <> 0) ”
  &&  ((&((linklist_head_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
  **  ((&((linklist_head_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |->_)
.

(*----- Function xizi_double_link_init_then_insert_before -----*)

Definition xizi_double_link_init_then_insert_before_entail_wit_1 := 
forall (A: Type) (linklist_node_pre: Z) (linklist_head_pre: Z) (data: A) (storeA: (Z -> (A -> Assertion))) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (linklist_head_pre <> 0)) ,
  (xizi_store_dll storeA linklist_head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |->_)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
  **  (storeA linklist_node_pre data )
|--
  EX (nodes: (@list (@XiziStoreADLL.DL_Node A))) ,
  “ (nodes = (@nil (@XiziStoreADLL.DL_Node A))) ”
  &&  (xizi_store_dll storeA linklist_head_pre nodes )
  **  (xizi_dll_node linklist_node_pre )
  **  (storeA linklist_node_pre data )
.

Definition xizi_double_link_init_then_insert_before_return_wit_1 := 
(
forall (A: Type) (linklist_node_pre: Z) (linklist_head_pre: Z) (data: A) (storeA: (Z -> (A -> Assertion))) (nodes: (@list (@XiziStoreADLL.DL_Node A))) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (nodes = (@nil (@XiziStoreADLL.DL_Node A)))) ,
  (xizi_store_dll storeA linklist_head_pre (app ((@nil (@XiziStoreADLL.DL_Node A))) ((cons ((XiziStoreADLL.Build_DL_Node (data) (linklist_node_pre))) ((@nil (@XiziStoreADLL.DL_Node A)))))) )
|--
  (xizi_store_dll storeA linklist_head_pre (cons ((XiziStoreADLL.Build_DL_Node (data) (linklist_node_pre))) ((@nil (@XiziStoreADLL.DL_Node A)))) )
) \/
(
forall (A: Type) (linklist_node_pre: Z) (linklist_head_pre: Z) (data: A) (storeA: (Z -> (A -> Assertion))) (nodes: (@list (@XiziStoreADLL.DL_Node A))) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (nodes = (@nil (@XiziStoreADLL.DL_Node A)))) ,
  (xizi_store_dll storeA linklist_head_pre (app ((@nil (@XiziStoreADLL.DL_Node A))) ((cons ((XiziStoreADLL.Build_DL_Node (data) (linklist_node_pre))) ((@nil (@XiziStoreADLL.DL_Node A)))))) )
|--
  (xizi_store_dll storeA linklist_head_pre (cons ((XiziStoreADLL.Build_DL_Node (data) (linklist_node_pre))) ((@nil (@XiziStoreADLL.DL_Node A)))) )
).

Definition xizi_double_link_init_then_insert_before_return_wit_1_split_goal_spatial := 
forall (A: Type) (linklist_node_pre: Z) (linklist_head_pre: Z) (data: A) (storeA: (Z -> (A -> Assertion))) (nodes: (@list (@XiziStoreADLL.DL_Node A))) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (nodes = (@nil (@XiziStoreADLL.DL_Node A)))) ,
  (xizi_store_dll storeA linklist_head_pre (app ((@nil (@XiziStoreADLL.DL_Node A))) ((cons ((XiziStoreADLL.Build_DL_Node (data) (linklist_node_pre))) ((@nil (@XiziStoreADLL.DL_Node A)))))) )
|--
  (xizi_store_dll storeA linklist_head_pre (cons ((XiziStoreADLL.Build_DL_Node (data) (linklist_node_pre))) ((@nil (@XiziStoreADLL.DL_Node A)))) )
.

Definition xizi_double_link_init_then_insert_before_partial_solve_wit_1 := 
forall (A: Type) (linklist_node_pre: Z) (linklist_head_pre: Z) (data: A) (storeA: (Z -> (A -> Assertion))) ,
  (xizi_dll_node linklist_head_pre )
  **  (xizi_dll_node linklist_node_pre )
  **  (storeA linklist_node_pre data )
|--
  “ (linklist_node_pre <> 0) ” 
  &&  “ (linklist_head_pre <> 0) ”
  &&  (xizi_dll_node linklist_head_pre )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |->_)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
  **  (storeA linklist_node_pre data )
.

Definition xizi_double_link_init_then_insert_before_partial_solve_wit_2 := 
forall (A: Type) (linklist_node_pre: Z) (linklist_head_pre: Z) (data: A) (storeA: (Z -> (A -> Assertion))) (nodes: (@list (@XiziStoreADLL.DL_Node A))) (PreH1 : (nodes = (@nil (@XiziStoreADLL.DL_Node A)))) ,
  (xizi_store_dll storeA linklist_head_pre nodes )
  **  (xizi_dll_node linklist_node_pre )
  **  (storeA linklist_node_pre data )
|--
  “ (linklist_node_pre <> 0) ” 
  &&  “ (nodes = (@nil (@XiziStoreADLL.DL_Node A))) ”
  &&  (xizi_store_dll storeA linklist_head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
  **  (xizi_dll_node linklist_node_pre )
  **  (storeA linklist_node_pre data )
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

Axiom proof_of_InitDoubleLinkList_return_wit_1 : InitDoubleLinkList_return_wit_1.
Axiom proof_of_InitDoubleLinkList_partial_solve_wit_1 : InitDoubleLinkList_partial_solve_wit_1.
Axiom proof_of_xizi_double_link_init_then_insert_before_entail_wit_1 : xizi_double_link_init_then_insert_before_entail_wit_1.
Axiom proof_of_xizi_double_link_init_then_insert_before_return_wit_1 : xizi_double_link_init_then_insert_before_return_wit_1.
Axiom proof_of_xizi_double_link_init_then_insert_before_partial_solve_wit_1 : xizi_double_link_init_then_insert_before_partial_solve_wit_1.
Axiom proof_of_xizi_double_link_init_then_insert_before_partial_solve_wit_2 : xizi_double_link_init_then_insert_before_partial_solve_wit_2.
Axiom proof_of_DoubleLinkListInsertNodeBefore_derive_sentinel_case_by_dispatch_case : DoubleLinkListInsertNodeBefore_derive_sentinel_case_by_dispatch_case.
Axiom proof_of_DoubleLinkListInsertNodeBefore_derive_member_case_by_dispatch_case : DoubleLinkListInsertNodeBefore_derive_member_case_by_dispatch_case.

End VC_Correct.
