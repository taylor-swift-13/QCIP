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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_callpoint_specs.source
      Require Import xizi_double_link_callpoint_specs_lib.
Local Open Scope sac.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_strategy_goal.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_strategy_proof.

(*----- Function xizi_double_link_call_empty_after_init -----*)

Definition xizi_double_link_call_empty_after_init_return_wit_1 := 
(
forall (A: Type) (head_pre: Z) (storeA: (Z -> (A -> Assertion))) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (head_pre <> 0)) ,
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
|--
  “ (xizi_double_link_call_empty_result retval ) ”
  &&  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
) \/
(
forall (head_pre: Z) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (head_pre <> 0)) ,
  TT && emp 
|--
  “ (xizi_double_link_call_empty_result 1 ) ”
  &&  emp
).

Definition xizi_double_link_call_empty_after_init_return_wit_1_split_goal_1 := 
forall (head_pre: Z) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (head_pre <> 0)) ,
  (xizi_double_link_call_empty_result 1 )
.

Definition xizi_double_link_call_empty_after_init_partial_solve_wit_1 := 
forall (head_pre: Z) ,
  (xizi_dll_node head_pre )
|--
  “ (head_pre <> 0) ”
  &&  (xizi_dll_node head_pre )
.

Definition xizi_double_link_call_empty_after_init_partial_solve_wit_2 := 
forall (A: Type) (head_pre: Z) (storeA: (Z -> (A -> Assertion))) (PreH1 : (head_pre <> 0)) ,
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
|--
  “ (head_pre <> 0) ”
  &&  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
.

(*----- Function xizi_double_link_call_empty_rec_after_init -----*)

Definition xizi_double_link_call_empty_rec_after_init_return_wit_1 := 
(
forall (A: Type) (head_pre: Z) (storeA: (Z -> (A -> Assertion))) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (head_pre <> 0)) ,
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
|--
  “ (xizi_double_link_call_empty_result retval ) ”
  &&  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
) \/
(
forall (head_pre: Z) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (head_pre <> 0)) ,
  TT && emp 
|--
  “ (xizi_double_link_call_empty_result 1 ) ”
  &&  emp
).

Definition xizi_double_link_call_empty_rec_after_init_return_wit_1_split_goal_1 := 
forall (head_pre: Z) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (head_pre <> 0)) ,
  (xizi_double_link_call_empty_result 1 )
.

Definition xizi_double_link_call_empty_rec_after_init_partial_solve_wit_1 := 
forall (head_pre: Z) ,
  (xizi_dll_node head_pre )
|--
  “ (head_pre <> 0) ”
  &&  (xizi_dll_node head_pre )
.

Definition xizi_double_link_call_empty_rec_after_init_partial_solve_wit_2 := 
forall (A: Type) (head_pre: Z) (storeA: (Z -> (A -> Assertion))) (PreH1 : (head_pre <> 0)) ,
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
|--
  “ (head_pre <> 0) ”
  &&  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
.

(*----- Function xizi_double_link_call_head_after_init -----*)

Definition xizi_double_link_call_head_after_init_return_wit_1 := 
(
forall (A: Type) (head_pre: Z) (storeA: (Z -> (A -> Assertion))) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (head_pre <> 0)) ,
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
|--
  “ (xizi_double_link_call_null_result retval ) ”
  &&  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
) \/
(
forall (head_pre: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (head_pre <> 0)) ,
  TT && emp 
|--
  “ (xizi_double_link_call_null_result 0 ) ”
  &&  emp
).

Definition xizi_double_link_call_head_after_init_return_wit_1_split_goal_1 := 
forall (head_pre: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (head_pre <> 0)) ,
  (xizi_double_link_call_null_result 0 )
.

Definition xizi_double_link_call_head_after_init_partial_solve_wit_1 := 
forall (head_pre: Z) ,
  (xizi_dll_node head_pre )
|--
  “ (head_pre <> 0) ”
  &&  (xizi_dll_node head_pre )
.

Definition xizi_double_link_call_head_after_init_partial_solve_wit_2 := 
forall (A: Type) (head_pre: Z) (storeA: (Z -> (A -> Assertion))) (PreH1 : (head_pre <> 0)) ,
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
|--
  “ (head_pre <> 0) ”
  &&  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
.

(*----- Function xizi_double_link_call_head_rec_after_init -----*)

Definition xizi_double_link_call_head_rec_after_init_return_wit_1 := 
(
forall (A: Type) (head_pre: Z) (storeA: (Z -> (A -> Assertion))) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (head_pre <> 0)) ,
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
|--
  “ (xizi_double_link_call_null_result retval ) ”
  &&  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
) \/
(
forall (head_pre: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (head_pre <> 0)) ,
  TT && emp 
|--
  “ (xizi_double_link_call_null_result 0 ) ”
  &&  emp
).

Definition xizi_double_link_call_head_rec_after_init_return_wit_1_split_goal_1 := 
forall (head_pre: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (head_pre <> 0)) ,
  (xizi_double_link_call_null_result 0 )
.

Definition xizi_double_link_call_head_rec_after_init_partial_solve_wit_1 := 
forall (head_pre: Z) ,
  (xizi_dll_node head_pre )
|--
  “ (head_pre <> 0) ”
  &&  (xizi_dll_node head_pre )
.

Definition xizi_double_link_call_head_rec_after_init_partial_solve_wit_2 := 
forall (A: Type) (head_pre: Z) (storeA: (Z -> (A -> Assertion))) (PreH1 : (head_pre <> 0)) ,
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
|--
  “ (head_pre <> 0) ”
  &&  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
.

(*----- Function xizi_double_link_call_len_after_init -----*)

Definition xizi_double_link_call_len_after_init_return_wit_1 := 
(
forall (A: Type) (head_pre: Z) (storeA: (Z -> (A -> Assertion))) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (head_pre <> 0)) ,
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
|--
  “ (xizi_double_link_call_len_result retval ) ”
  &&  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
) \/
(
forall (head_pre: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (head_pre <> 0)) ,
  TT && emp 
|--
  “ (xizi_double_link_call_len_result 0 ) ”
  &&  emp
).

Definition xizi_double_link_call_len_after_init_return_wit_1_split_goal_1 := 
forall (head_pre: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (head_pre <> 0)) ,
  (xizi_double_link_call_len_result 0 )
.

Definition xizi_double_link_call_len_after_init_partial_solve_wit_1 := 
forall (head_pre: Z) ,
  (xizi_dll_node head_pre )
|--
  “ (head_pre <> 0) ”
  &&  (xizi_dll_node head_pre )
.

Definition xizi_double_link_call_len_after_init_partial_solve_wit_2 := 
forall (A: Type) (head_pre: Z) (storeA: (Z -> (A -> Assertion))) (PreH1 : (head_pre <> 0)) ,
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
|--
  “ (head_pre <> 0) ”
  &&  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
.

(*----- Function xizi_double_link_call_next_after_init -----*)

Definition xizi_double_link_call_next_after_init_entail_wit_1 := 
forall (A: Type) (head_pre: Z) (storeA: (Z -> (A -> Assertion))) (PreH1 : (head_pre <> 0)) ,
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
|--
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
.

Definition xizi_double_link_call_next_after_init_return_wit_1 := 
(
forall (A: Type) (head_pre: Z) (storeA: (Z -> (A -> Assertion))) (retval: Z) (PreH1 : (retval = (xizi_double_link_first_value ((xizi_dll_ptrs ((@nil (@XiziStoreADLL.DL_Node A)))))))) ,
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
|--
  “ (xizi_double_link_call_null_result retval ) ”
  &&  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
) \/
(
forall (A: Type) (retval: Z) (PreH1 : (retval = (xizi_double_link_first_value ((xizi_dll_ptrs ((@nil (@XiziStoreADLL.DL_Node A)))))))) ,
  TT && emp 
|--
  “ (xizi_double_link_call_null_result retval ) ”
  &&  emp
).

Definition xizi_double_link_call_next_after_init_return_wit_1_split_goal_1 := 
forall (A: Type) (retval: Z) (PreH1 : (retval = (xizi_double_link_first_value ((xizi_dll_ptrs ((@nil (@XiziStoreADLL.DL_Node A)))))))) ,
  (xizi_double_link_call_null_result retval )
.

Definition xizi_double_link_call_next_after_init_partial_solve_wit_1 := 
forall (head_pre: Z) ,
  (xizi_dll_node head_pre )
|--
  “ (head_pre <> 0) ”
  &&  (xizi_dll_node head_pre )
.

Definition xizi_double_link_call_next_after_init_partial_solve_wit_2_pure := 
forall (A: Type) (head_pre: Z) (storeA: (Z -> (A -> Assertion))) ,
  ((( &( "head" ) )) # Ptr  |-> head_pre)
  **  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
|--
  “ (head_pre = head_pre) ”
.

Definition xizi_double_link_call_next_after_init_partial_solve_wit_2_aux := 
forall (A: Type) (head_pre: Z) (storeA: (Z -> (A -> Assertion))) ,
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
|--
  “ (head_pre = head_pre) ”
  &&  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
.

Definition xizi_double_link_call_next_after_init_partial_solve_wit_2 := xizi_double_link_call_next_after_init_partial_solve_wit_2_pure -> xizi_double_link_call_next_after_init_partial_solve_wit_2_aux.

(*----- Function xizi_double_link_call_next_rec_last_after_init -----*)

Definition xizi_double_link_call_next_rec_last_after_init_entail_wit_1 := 
forall (A: Type) (head_pre: Z) (storeA: (Z -> (A -> Assertion))) (PreH1 : (head_pre <> 0)) ,
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
|--
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
.

Definition xizi_double_link_call_next_rec_last_after_init_return_wit_1 := 
(
forall (A: Type) (head_pre: Z) (storeA: (Z -> (A -> Assertion))) (retval: Z) (PreH1 : (retval = (xizi_double_link_first_value ((xizi_dll_ptrs ((@nil (@XiziStoreADLL.DL_Node A)))))))) ,
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
|--
  “ (xizi_double_link_call_null_result retval ) ”
  &&  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
) \/
(
forall (A: Type) (retval: Z) (PreH1 : (retval = (xizi_double_link_first_value ((xizi_dll_ptrs ((@nil (@XiziStoreADLL.DL_Node A)))))))) ,
  TT && emp 
|--
  “ (xizi_double_link_call_null_result retval ) ”
  &&  emp
).

Definition xizi_double_link_call_next_rec_last_after_init_return_wit_1_split_goal_1 := 
forall (A: Type) (retval: Z) (PreH1 : (retval = (xizi_double_link_first_value ((xizi_dll_ptrs ((@nil (@XiziStoreADLL.DL_Node A)))))))) ,
  (xizi_double_link_call_null_result retval )
.

Definition xizi_double_link_call_next_rec_last_after_init_partial_solve_wit_1 := 
forall (head_pre: Z) ,
  (xizi_dll_node head_pre )
|--
  “ (head_pre <> 0) ”
  &&  (xizi_dll_node head_pre )
.

Definition xizi_double_link_call_next_rec_last_after_init_partial_solve_wit_2_pure := 
forall (A: Type) (head_pre: Z) (storeA: (Z -> (A -> Assertion))) ,
  ((( &( "head" ) )) # Ptr  |-> head_pre)
  **  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
|--
  “ (head_pre = head_pre) ”
.

Definition xizi_double_link_call_next_rec_last_after_init_partial_solve_wit_2_aux := 
forall (A: Type) (head_pre: Z) (storeA: (Z -> (A -> Assertion))) ,
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
|--
  “ (head_pre = head_pre) ”
  &&  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
.

Definition xizi_double_link_call_next_rec_last_after_init_partial_solve_wit_2 := xizi_double_link_call_next_rec_last_after_init_partial_solve_wit_2_pure -> xizi_double_link_call_next_rec_last_after_init_partial_solve_wit_2_aux.

(*----- Function xizi_double_link_call_next_rec_middle_after_init -----*)

Definition xizi_double_link_call_next_rec_middle_after_init_entail_wit_1 := 
forall (A: Type) (head_pre: Z) (storeA: (Z -> (A -> Assertion))) (PreH1 : (head_pre <> 0)) ,
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
|--
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
.

Definition xizi_double_link_call_next_rec_middle_after_init_return_wit_1 := 
(
forall (A: Type) (head_pre: Z) (storeA: (Z -> (A -> Assertion))) (retval: Z) (PreH1 : (retval = (xizi_double_link_first_value ((xizi_dll_ptrs ((@nil (@XiziStoreADLL.DL_Node A)))))))) ,
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
|--
  “ (xizi_double_link_call_null_result retval ) ”
  &&  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
) \/
(
forall (A: Type) (retval: Z) (PreH1 : (retval = (xizi_double_link_first_value ((xizi_dll_ptrs ((@nil (@XiziStoreADLL.DL_Node A)))))))) ,
  TT && emp 
|--
  “ (xizi_double_link_call_null_result retval ) ”
  &&  emp
).

Definition xizi_double_link_call_next_rec_middle_after_init_return_wit_1_split_goal_1 := 
forall (A: Type) (retval: Z) (PreH1 : (retval = (xizi_double_link_first_value ((xizi_dll_ptrs ((@nil (@XiziStoreADLL.DL_Node A)))))))) ,
  (xizi_double_link_call_null_result retval )
.

Definition xizi_double_link_call_next_rec_middle_after_init_partial_solve_wit_1 := 
forall (head_pre: Z) ,
  (xizi_dll_node head_pre )
|--
  “ (head_pre <> 0) ”
  &&  (xizi_dll_node head_pre )
.

Definition xizi_double_link_call_next_rec_middle_after_init_partial_solve_wit_2_pure := 
forall (A: Type) (head_pre: Z) (storeA: (Z -> (A -> Assertion))) ,
  ((( &( "head" ) )) # Ptr  |-> head_pre)
  **  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
|--
  “ (head_pre = head_pre) ”
.

Definition xizi_double_link_call_next_rec_middle_after_init_partial_solve_wit_2_aux := 
forall (A: Type) (head_pre: Z) (storeA: (Z -> (A -> Assertion))) ,
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
|--
  “ (head_pre = head_pre) ”
  &&  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
.

Definition xizi_double_link_call_next_rec_middle_after_init_partial_solve_wit_2 := xizi_double_link_call_next_rec_middle_after_init_partial_solve_wit_2_pure -> xizi_double_link_call_next_rec_middle_after_init_partial_solve_wit_2_aux.

(*----- Function xizi_double_link_call_insert_after_init -----*)

Definition xizi_double_link_call_insert_after_init_entail_wit_1 := 
forall (A: Type) (node_pre: Z) (head_pre: Z) (data: A) (storeA: (Z -> (A -> Assertion))) (PreH1 : (node_pre <> 0)) (PreH2 : (head_pre <> 0)) ,
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
  **  ((&((node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |->_)
  **  ((&((node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
  **  (storeA node_pre data )
|--
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
  **  (xizi_dll_node node_pre )
  **  (storeA node_pre data )
.

Definition xizi_double_link_call_insert_after_init_return_wit_1 := 
(
forall (A: Type) (node_pre: Z) (head_pre: Z) (data: A) (storeA: (Z -> (A -> Assertion))) (PreH1 : (node_pre <> 0)) ,
  (xizi_store_dll storeA head_pre (cons ((XiziStoreADLL.Build_DL_Node (data) (node_pre))) ((@nil (@XiziStoreADLL.DL_Node A)))) )
|--
  (xizi_store_dll storeA head_pre (xizi_double_link_singleton_nodes ((XiziStoreADLL.Build_DL_Node (data) (node_pre)))) )
) \/
(
forall (A: Type) (node_pre: Z) (head_pre: Z) (data: A) (storeA: (Z -> (A -> Assertion))) (PreH1 : (node_pre <> 0)) ,
  (xizi_store_dll storeA head_pre (cons ((XiziStoreADLL.Build_DL_Node (data) (node_pre))) ((@nil (@XiziStoreADLL.DL_Node A)))) )
|--
  (xizi_store_dll storeA head_pre (xizi_double_link_singleton_nodes ((XiziStoreADLL.Build_DL_Node (data) (node_pre)))) )
).

Definition xizi_double_link_call_insert_after_init_return_wit_1_split_goal_spatial := 
forall (A: Type) (node_pre: Z) (head_pre: Z) (data: A) (storeA: (Z -> (A -> Assertion))) (PreH1 : (node_pre <> 0)) ,
  (xizi_store_dll storeA head_pre (cons ((XiziStoreADLL.Build_DL_Node (data) (node_pre))) ((@nil (@XiziStoreADLL.DL_Node A)))) )
|--
  (xizi_store_dll storeA head_pre (xizi_double_link_singleton_nodes ((XiziStoreADLL.Build_DL_Node (data) (node_pre)))) )
.

Definition xizi_double_link_call_insert_after_init_partial_solve_wit_1 := 
forall (A: Type) (node_pre: Z) (head_pre: Z) (data: A) (storeA: (Z -> (A -> Assertion))) ,
  (xizi_dll_node head_pre )
  **  (xizi_dll_node node_pre )
  **  (storeA node_pre data )
|--
  “ (node_pre <> 0) ” 
  &&  “ (head_pre <> 0) ”
  &&  (xizi_dll_node head_pre )
  **  ((&((node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |->_)
  **  ((&((node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
  **  (storeA node_pre data )
.

Definition xizi_double_link_call_insert_after_init_partial_solve_wit_2 := 
forall (A: Type) (node_pre: Z) (head_pre: Z) (data: A) (storeA: (Z -> (A -> Assertion))) ,
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
  **  (xizi_dll_node node_pre )
  **  (storeA node_pre data )
|--
  “ (node_pre <> 0) ”
  &&  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
  **  (xizi_dll_node node_pre )
  **  (storeA node_pre data )
.

(*----- Function xizi_double_link_call_remove_front_singleton -----*)

Definition xizi_double_link_call_remove_front_singleton_entail_wit_1 := 
forall (A: Type) (node_pre: Z) (head_pre: Z) (data: A) (storeA: (Z -> (A -> Assertion))) (PreH1 : (node_pre <> 0)) (PreH2 : (head_pre <> 0)) ,
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
  **  ((&((node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |->_)
  **  ((&((node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
  **  (storeA node_pre data )
|--
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
  **  (xizi_dll_node node_pre )
  **  (storeA node_pre data )
.

Definition xizi_double_link_call_remove_front_singleton_entail_wit_2 := 
forall (A: Type) (node_pre: Z) (head_pre: Z) (data: A) (storeA: (Z -> (A -> Assertion))) (PreH1 : (node_pre <> 0)) ,
  (xizi_store_dll storeA head_pre (cons ((XiziStoreADLL.Build_DL_Node (data) (node_pre))) ((@nil (@XiziStoreADLL.DL_Node A)))) )
|--
  (xizi_store_dll storeA head_pre (cons ((XiziStoreADLL.Build_DL_Node (data) (node_pre))) ((@nil (@XiziStoreADLL.DL_Node A)))) )
.

Definition xizi_double_link_call_remove_front_singleton_return_wit_1 := 
(
forall (A: Type) (node_pre: Z) (head_pre: Z) (data: A) (storeA: (Z -> (A -> Assertion))) ,
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
  **  (xizi_dll node_pre (@nil Z) )
  **  (storeA node_pre (XiziStoreADLL.getData ((XiziStoreADLL.Build_DL_Node (data) (node_pre)))) )
|--
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
  **  (xizi_dll node_pre (@nil Z) )
  **  (storeA node_pre data )
) \/
(
forall (A: Type) (node_pre: Z) (head_pre: Z) (data: A) (storeA: (Z -> (A -> Assertion))) (PreH1 : (node_pre <> 0)) ,
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
  **  (storeA node_pre (XiziStoreADLL.getData ((XiziStoreADLL.Build_DL_Node (data) (node_pre)))) )
|--
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
  **  (storeA node_pre data )
).

Definition xizi_double_link_call_remove_front_singleton_return_wit_1_split_goal_spatial := 
forall (A: Type) (node_pre: Z) (head_pre: Z) (data: A) (storeA: (Z -> (A -> Assertion))) (PreH1 : (node_pre <> 0)) ,
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
  **  (storeA node_pre (XiziStoreADLL.getData ((XiziStoreADLL.Build_DL_Node (data) (node_pre)))) )
|--
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
  **  (storeA node_pre data )
.

Definition xizi_double_link_call_remove_front_singleton_partial_solve_wit_1 := 
forall (A: Type) (node_pre: Z) (head_pre: Z) (data: A) (storeA: (Z -> (A -> Assertion))) ,
  (xizi_dll_node head_pre )
  **  (xizi_dll_node node_pre )
  **  (storeA node_pre data )
|--
  “ (node_pre <> 0) ” 
  &&  “ (head_pre <> 0) ”
  &&  (xizi_dll_node head_pre )
  **  ((&((node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |->_)
  **  ((&((node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
  **  (storeA node_pre data )
.

Definition xizi_double_link_call_remove_front_singleton_partial_solve_wit_2 := 
forall (A: Type) (node_pre: Z) (head_pre: Z) (data: A) (storeA: (Z -> (A -> Assertion))) ,
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
  **  (xizi_dll_node node_pre )
  **  (storeA node_pre data )
|--
  “ (node_pre <> 0) ”
  &&  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
  **  (xizi_dll_node node_pre )
  **  (storeA node_pre data )
.

Definition xizi_double_link_call_remove_front_singleton_partial_solve_wit_3_pure := 
(
forall (A: Type) (node_pre: Z) (head_pre: Z) (data: A) (storeA: (Z -> (A -> Assertion))) ,
  ((( &( "head" ) )) # Ptr  |-> head_pre)
  **  ((( &( "node" ) )) # Ptr  |-> node_pre)
  **  (xizi_store_dll storeA head_pre (cons ((XiziStoreADLL.Build_DL_Node (data) (node_pre))) ((@nil (@XiziStoreADLL.DL_Node A)))) )
|--
  “ ((XiziStoreADLL.getPtr ((XiziStoreADLL.Build_DL_Node (data) (node_pre)))) = node_pre) ”
) \/
(
forall (A: Type) (node_pre: Z) (head_pre: Z) (data: A) (storeA: (Z -> (A -> Assertion))) ,
  ((( &( "head" ) )) # Ptr  |-> head_pre)
  **  ((( &( "node" ) )) # Ptr  |-> node_pre)
  **  (xizi_store_dll storeA head_pre (cons ((XiziStoreADLL.Build_DL_Node (data) (node_pre))) ((@nil (@XiziStoreADLL.DL_Node A)))) )
|--
  “ ((XiziStoreADLL.getPtr ((XiziStoreADLL.Build_DL_Node (data) (node_pre)))) = node_pre) ”
).

Definition xizi_double_link_call_remove_front_singleton_partial_solve_wit_3_pure_split_goal_1 := 
forall (A: Type) (node_pre: Z) (head_pre: Z) (data: A) (storeA: (Z -> (A -> Assertion))) ,
  ((( &( "head" ) )) # Ptr  |-> head_pre)
  **  ((( &( "node" ) )) # Ptr  |-> node_pre)
  **  (xizi_store_dll storeA head_pre (cons ((XiziStoreADLL.Build_DL_Node (data) (node_pre))) ((@nil (@XiziStoreADLL.DL_Node A)))) )
|--
  “ ((XiziStoreADLL.getPtr ((XiziStoreADLL.Build_DL_Node (data) (node_pre)))) = node_pre) ”
.

Definition xizi_double_link_call_remove_front_singleton_partial_solve_wit_3_aux := 
forall (A: Type) (node_pre: Z) (head_pre: Z) (data: A) (storeA: (Z -> (A -> Assertion))) ,
  (xizi_store_dll storeA head_pre (cons ((XiziStoreADLL.Build_DL_Node (data) (node_pre))) ((@nil (@XiziStoreADLL.DL_Node A)))) )
|--
  “ ((XiziStoreADLL.getPtr ((XiziStoreADLL.Build_DL_Node (data) (node_pre)))) = node_pre) ”
  &&  (xizi_store_dll storeA head_pre (cons ((XiziStoreADLL.Build_DL_Node (data) (node_pre))) ((@nil (@XiziStoreADLL.DL_Node A)))) )
.

Definition xizi_double_link_call_remove_front_singleton_partial_solve_wit_3 := xizi_double_link_call_remove_front_singleton_partial_solve_wit_3_pure -> xizi_double_link_call_remove_front_singleton_partial_solve_wit_3_aux.

(*----- Function xizi_double_link_call_remove_tail_singleton -----*)

Definition xizi_double_link_call_remove_tail_singleton_entail_wit_1 := 
forall (A: Type) (node_pre: Z) (head_pre: Z) (data: A) (storeA: (Z -> (A -> Assertion))) (PreH1 : (node_pre <> 0)) (PreH2 : (head_pre <> 0)) ,
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
  **  ((&((node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |->_)
  **  ((&((node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
  **  (storeA node_pre data )
|--
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
  **  (xizi_dll_node node_pre )
  **  (storeA node_pre data )
.

Definition xizi_double_link_call_remove_tail_singleton_entail_wit_2 := 
(
forall (A: Type) (node_pre: Z) (head_pre: Z) (data: A) (storeA: (Z -> (A -> Assertion))) (PreH1 : (node_pre <> 0)) ,
  (xizi_store_dll storeA head_pre (cons ((XiziStoreADLL.Build_DL_Node (data) (node_pre))) ((@nil (@XiziStoreADLL.DL_Node A)))) )
|--
  (xizi_store_dll storeA head_pre (app ((@nil (@XiziStoreADLL.DL_Node A))) ((cons ((XiziStoreADLL.Build_DL_Node (data) (node_pre))) ((@nil (@XiziStoreADLL.DL_Node A)))))) )
) \/
(
forall (A: Type) (node_pre: Z) (head_pre: Z) (data: A) (storeA: (Z -> (A -> Assertion))) (PreH1 : (node_pre <> 0)) ,
  (xizi_store_dll storeA head_pre (cons ((XiziStoreADLL.Build_DL_Node (data) (node_pre))) ((@nil (@XiziStoreADLL.DL_Node A)))) )
|--
  (xizi_store_dll storeA head_pre (app ((@nil (@XiziStoreADLL.DL_Node A))) ((cons ((XiziStoreADLL.Build_DL_Node (data) (node_pre))) ((@nil (@XiziStoreADLL.DL_Node A)))))) )
).

Definition xizi_double_link_call_remove_tail_singleton_entail_wit_2_split_goal_spatial := 
forall (A: Type) (node_pre: Z) (head_pre: Z) (data: A) (storeA: (Z -> (A -> Assertion))) (PreH1 : (node_pre <> 0)) ,
  (xizi_store_dll storeA head_pre (cons ((XiziStoreADLL.Build_DL_Node (data) (node_pre))) ((@nil (@XiziStoreADLL.DL_Node A)))) )
|--
  (xizi_store_dll storeA head_pre (app ((@nil (@XiziStoreADLL.DL_Node A))) ((cons ((XiziStoreADLL.Build_DL_Node (data) (node_pre))) ((@nil (@XiziStoreADLL.DL_Node A)))))) )
.

Definition xizi_double_link_call_remove_tail_singleton_return_wit_1 := 
(
forall (A: Type) (node_pre: Z) (head_pre: Z) (data: A) (storeA: (Z -> (A -> Assertion))) ,
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
  **  (xizi_dll node_pre (@nil Z) )
  **  (storeA node_pre (XiziStoreADLL.getData ((XiziStoreADLL.Build_DL_Node (data) (node_pre)))) )
|--
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
  **  (xizi_dll node_pre (@nil Z) )
  **  (storeA node_pre data )
) \/
(
forall (A: Type) (node_pre: Z) (head_pre: Z) (data: A) (storeA: (Z -> (A -> Assertion))) (PreH1 : (node_pre <> 0)) ,
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
  **  (storeA node_pre (XiziStoreADLL.getData ((XiziStoreADLL.Build_DL_Node (data) (node_pre)))) )
|--
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
  **  (storeA node_pre data )
).

Definition xizi_double_link_call_remove_tail_singleton_return_wit_1_split_goal_spatial := 
forall (A: Type) (node_pre: Z) (head_pre: Z) (data: A) (storeA: (Z -> (A -> Assertion))) (PreH1 : (node_pre <> 0)) ,
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
  **  (storeA node_pre (XiziStoreADLL.getData ((XiziStoreADLL.Build_DL_Node (data) (node_pre)))) )
|--
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
  **  (storeA node_pre data )
.

Definition xizi_double_link_call_remove_tail_singleton_partial_solve_wit_1 := 
forall (A: Type) (node_pre: Z) (head_pre: Z) (data: A) (storeA: (Z -> (A -> Assertion))) ,
  (xizi_dll_node head_pre )
  **  (xizi_dll_node node_pre )
  **  (storeA node_pre data )
|--
  “ (node_pre <> 0) ” 
  &&  “ (head_pre <> 0) ”
  &&  (xizi_dll_node head_pre )
  **  ((&((node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |->_)
  **  ((&((node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
  **  (storeA node_pre data )
.

Definition xizi_double_link_call_remove_tail_singleton_partial_solve_wit_2 := 
forall (A: Type) (node_pre: Z) (head_pre: Z) (data: A) (storeA: (Z -> (A -> Assertion))) ,
  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
  **  (xizi_dll_node node_pre )
  **  (storeA node_pre data )
|--
  “ (node_pre <> 0) ”
  &&  (xizi_store_dll storeA head_pre (@nil (@XiziStoreADLL.DL_Node A)) )
  **  (xizi_dll_node node_pre )
  **  (storeA node_pre data )
.

Definition xizi_double_link_call_remove_tail_singleton_partial_solve_wit_3_pure := 
(
forall (A: Type) (node_pre: Z) (head_pre: Z) (data: A) (storeA: (Z -> (A -> Assertion))) ,
  ((( &( "head" ) )) # Ptr  |-> head_pre)
  **  ((( &( "node" ) )) # Ptr  |-> node_pre)
  **  (xizi_store_dll storeA head_pre (app ((@nil (@XiziStoreADLL.DL_Node A))) ((cons ((XiziStoreADLL.Build_DL_Node (data) (node_pre))) ((@nil (@XiziStoreADLL.DL_Node A)))))) )
|--
  “ ((XiziStoreADLL.getPtr ((XiziStoreADLL.Build_DL_Node (data) (node_pre)))) = node_pre) ”
) \/
(
forall (A: Type) (node_pre: Z) (head_pre: Z) (data: A) (storeA: (Z -> (A -> Assertion))) ,
  ((( &( "head" ) )) # Ptr  |-> head_pre)
  **  ((( &( "node" ) )) # Ptr  |-> node_pre)
  **  (xizi_store_dll storeA head_pre (app ((@nil (@XiziStoreADLL.DL_Node A))) ((cons ((XiziStoreADLL.Build_DL_Node (data) (node_pre))) ((@nil (@XiziStoreADLL.DL_Node A)))))) )
|--
  “ ((XiziStoreADLL.getPtr ((XiziStoreADLL.Build_DL_Node (data) (node_pre)))) = node_pre) ”
).

Definition xizi_double_link_call_remove_tail_singleton_partial_solve_wit_3_pure_split_goal_1 := 
forall (A: Type) (node_pre: Z) (head_pre: Z) (data: A) (storeA: (Z -> (A -> Assertion))) ,
  ((( &( "head" ) )) # Ptr  |-> head_pre)
  **  ((( &( "node" ) )) # Ptr  |-> node_pre)
  **  (xizi_store_dll storeA head_pre (app ((@nil (@XiziStoreADLL.DL_Node A))) ((cons ((XiziStoreADLL.Build_DL_Node (data) (node_pre))) ((@nil (@XiziStoreADLL.DL_Node A)))))) )
|--
  “ ((XiziStoreADLL.getPtr ((XiziStoreADLL.Build_DL_Node (data) (node_pre)))) = node_pre) ”
.

Definition xizi_double_link_call_remove_tail_singleton_partial_solve_wit_3_aux := 
forall (A: Type) (node_pre: Z) (head_pre: Z) (data: A) (storeA: (Z -> (A -> Assertion))) ,
  (xizi_store_dll storeA head_pre (app ((@nil (@XiziStoreADLL.DL_Node A))) ((cons ((XiziStoreADLL.Build_DL_Node (data) (node_pre))) ((@nil (@XiziStoreADLL.DL_Node A)))))) )
|--
  “ ((XiziStoreADLL.getPtr ((XiziStoreADLL.Build_DL_Node (data) (node_pre)))) = node_pre) ”
  &&  (xizi_store_dll storeA head_pre (app ((@nil (@XiziStoreADLL.DL_Node A))) ((cons ((XiziStoreADLL.Build_DL_Node (data) (node_pre))) ((@nil (@XiziStoreADLL.DL_Node A)))))) )
.

Definition xizi_double_link_call_remove_tail_singleton_partial_solve_wit_3 := xizi_double_link_call_remove_tail_singleton_partial_solve_wit_3_pure -> xizi_double_link_call_remove_tail_singleton_partial_solve_wit_3_aux.

Module Type VC_Correct.

Include xizi_double_link_Strategy_Correct.

Axiom proof_of_xizi_double_link_call_empty_after_init_return_wit_1 : xizi_double_link_call_empty_after_init_return_wit_1.
Axiom proof_of_xizi_double_link_call_empty_after_init_partial_solve_wit_1 : xizi_double_link_call_empty_after_init_partial_solve_wit_1.
Axiom proof_of_xizi_double_link_call_empty_after_init_partial_solve_wit_2 : xizi_double_link_call_empty_after_init_partial_solve_wit_2.
Axiom proof_of_xizi_double_link_call_empty_rec_after_init_return_wit_1 : xizi_double_link_call_empty_rec_after_init_return_wit_1.
Axiom proof_of_xizi_double_link_call_empty_rec_after_init_partial_solve_wit_1 : xizi_double_link_call_empty_rec_after_init_partial_solve_wit_1.
Axiom proof_of_xizi_double_link_call_empty_rec_after_init_partial_solve_wit_2 : xizi_double_link_call_empty_rec_after_init_partial_solve_wit_2.
Axiom proof_of_xizi_double_link_call_head_after_init_return_wit_1 : xizi_double_link_call_head_after_init_return_wit_1.
Axiom proof_of_xizi_double_link_call_head_after_init_partial_solve_wit_1 : xizi_double_link_call_head_after_init_partial_solve_wit_1.
Axiom proof_of_xizi_double_link_call_head_after_init_partial_solve_wit_2 : xizi_double_link_call_head_after_init_partial_solve_wit_2.
Axiom proof_of_xizi_double_link_call_head_rec_after_init_return_wit_1 : xizi_double_link_call_head_rec_after_init_return_wit_1.
Axiom proof_of_xizi_double_link_call_head_rec_after_init_partial_solve_wit_1 : xizi_double_link_call_head_rec_after_init_partial_solve_wit_1.
Axiom proof_of_xizi_double_link_call_head_rec_after_init_partial_solve_wit_2 : xizi_double_link_call_head_rec_after_init_partial_solve_wit_2.
Axiom proof_of_xizi_double_link_call_len_after_init_return_wit_1 : xizi_double_link_call_len_after_init_return_wit_1.
Axiom proof_of_xizi_double_link_call_len_after_init_partial_solve_wit_1 : xizi_double_link_call_len_after_init_partial_solve_wit_1.
Axiom proof_of_xizi_double_link_call_len_after_init_partial_solve_wit_2 : xizi_double_link_call_len_after_init_partial_solve_wit_2.
Axiom proof_of_xizi_double_link_call_next_after_init_entail_wit_1 : xizi_double_link_call_next_after_init_entail_wit_1.
Axiom proof_of_xizi_double_link_call_next_after_init_return_wit_1 : xizi_double_link_call_next_after_init_return_wit_1.
Axiom proof_of_xizi_double_link_call_next_after_init_partial_solve_wit_1 : xizi_double_link_call_next_after_init_partial_solve_wit_1.
Axiom proof_of_xizi_double_link_call_next_after_init_partial_solve_wit_2_pure : xizi_double_link_call_next_after_init_partial_solve_wit_2_pure.
Axiom proof_of_xizi_double_link_call_next_after_init_partial_solve_wit_2 : xizi_double_link_call_next_after_init_partial_solve_wit_2.
Axiom proof_of_xizi_double_link_call_next_rec_last_after_init_entail_wit_1 : xizi_double_link_call_next_rec_last_after_init_entail_wit_1.
Axiom proof_of_xizi_double_link_call_next_rec_last_after_init_return_wit_1 : xizi_double_link_call_next_rec_last_after_init_return_wit_1.
Axiom proof_of_xizi_double_link_call_next_rec_last_after_init_partial_solve_wit_1 : xizi_double_link_call_next_rec_last_after_init_partial_solve_wit_1.
Axiom proof_of_xizi_double_link_call_next_rec_last_after_init_partial_solve_wit_2_pure : xizi_double_link_call_next_rec_last_after_init_partial_solve_wit_2_pure.
Axiom proof_of_xizi_double_link_call_next_rec_last_after_init_partial_solve_wit_2 : xizi_double_link_call_next_rec_last_after_init_partial_solve_wit_2.
Axiom proof_of_xizi_double_link_call_next_rec_middle_after_init_entail_wit_1 : xizi_double_link_call_next_rec_middle_after_init_entail_wit_1.
Axiom proof_of_xizi_double_link_call_next_rec_middle_after_init_return_wit_1 : xizi_double_link_call_next_rec_middle_after_init_return_wit_1.
Axiom proof_of_xizi_double_link_call_next_rec_middle_after_init_partial_solve_wit_1 : xizi_double_link_call_next_rec_middle_after_init_partial_solve_wit_1.
Axiom proof_of_xizi_double_link_call_next_rec_middle_after_init_partial_solve_wit_2_pure : xizi_double_link_call_next_rec_middle_after_init_partial_solve_wit_2_pure.
Axiom proof_of_xizi_double_link_call_next_rec_middle_after_init_partial_solve_wit_2 : xizi_double_link_call_next_rec_middle_after_init_partial_solve_wit_2.
Axiom proof_of_xizi_double_link_call_insert_after_init_entail_wit_1 : xizi_double_link_call_insert_after_init_entail_wit_1.
Axiom proof_of_xizi_double_link_call_insert_after_init_return_wit_1 : xizi_double_link_call_insert_after_init_return_wit_1.
Axiom proof_of_xizi_double_link_call_insert_after_init_partial_solve_wit_1 : xizi_double_link_call_insert_after_init_partial_solve_wit_1.
Axiom proof_of_xizi_double_link_call_insert_after_init_partial_solve_wit_2 : xizi_double_link_call_insert_after_init_partial_solve_wit_2.
Axiom proof_of_xizi_double_link_call_remove_front_singleton_entail_wit_1 : xizi_double_link_call_remove_front_singleton_entail_wit_1.
Axiom proof_of_xizi_double_link_call_remove_front_singleton_entail_wit_2 : xizi_double_link_call_remove_front_singleton_entail_wit_2.
Axiom proof_of_xizi_double_link_call_remove_front_singleton_return_wit_1 : xizi_double_link_call_remove_front_singleton_return_wit_1.
Axiom proof_of_xizi_double_link_call_remove_front_singleton_partial_solve_wit_1 : xizi_double_link_call_remove_front_singleton_partial_solve_wit_1.
Axiom proof_of_xizi_double_link_call_remove_front_singleton_partial_solve_wit_2 : xizi_double_link_call_remove_front_singleton_partial_solve_wit_2.
Axiom proof_of_xizi_double_link_call_remove_front_singleton_partial_solve_wit_3_pure : xizi_double_link_call_remove_front_singleton_partial_solve_wit_3_pure.
Axiom proof_of_xizi_double_link_call_remove_front_singleton_partial_solve_wit_3 : xizi_double_link_call_remove_front_singleton_partial_solve_wit_3.
Axiom proof_of_xizi_double_link_call_remove_tail_singleton_entail_wit_1 : xizi_double_link_call_remove_tail_singleton_entail_wit_1.
Axiom proof_of_xizi_double_link_call_remove_tail_singleton_entail_wit_2 : xizi_double_link_call_remove_tail_singleton_entail_wit_2.
Axiom proof_of_xizi_double_link_call_remove_tail_singleton_return_wit_1 : xizi_double_link_call_remove_tail_singleton_return_wit_1.
Axiom proof_of_xizi_double_link_call_remove_tail_singleton_partial_solve_wit_1 : xizi_double_link_call_remove_tail_singleton_partial_solve_wit_1.
Axiom proof_of_xizi_double_link_call_remove_tail_singleton_partial_solve_wit_2 : xizi_double_link_call_remove_tail_singleton_partial_solve_wit_2.
Axiom proof_of_xizi_double_link_call_remove_tail_singleton_partial_solve_wit_3_pure : xizi_double_link_call_remove_tail_singleton_partial_solve_wit_3_pure.
Axiom proof_of_xizi_double_link_call_remove_tail_singleton_partial_solve_wit_3 : xizi_double_link_call_remove_tail_singleton_partial_solve_wit_3.

End VC_Correct.
