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
forall (head_pre: Z) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (head_pre <> 0)) (PreH3 : (head_pre <> 0)) ,
  (xizi_dll head_pre (@nil Z) )
|--
  “ (xizi_double_link_call_empty_result retval ) ”
  &&  (xizi_dll head_pre (@nil Z) )
) \/
(
forall (head_pre: Z) (retval: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (retval = 1)) (PreH3 : (head_pre <> 0)) (PreH4 : (head_pre <> 0)) ,
  TT && emp 
|--
  “ (xizi_double_link_call_empty_result retval ) ”
  &&  emp
).

Definition xizi_double_link_call_empty_after_init_return_wit_1_split_goal_1 := 
forall (head_pre: Z) (retval: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (retval = 1)) (PreH3 : (head_pre <> 0)) (PreH4 : (head_pre <> 0)) ,
  (xizi_double_link_call_empty_result retval )
.

Definition xizi_double_link_call_empty_after_init_partial_solve_wit_1 := 
forall (head_pre: Z) ,
  (xizi_dll_node head_pre )
|--
  “ (head_pre <> 0) ”
  &&  (xizi_dll_node head_pre )
.

Definition xizi_double_link_call_empty_after_init_partial_solve_wit_2 := 
forall (head_pre: Z) (PreH1 : (head_pre <> 0)) ,
  (xizi_dll head_pre (@nil Z) )
|--
  “ (head_pre <> 0) ” 
  &&  “ (head_pre <> 0) ”
  &&  (xizi_dll head_pre (@nil Z) )
.

(*----- Function xizi_double_link_call_empty_rec_after_init -----*)

Definition xizi_double_link_call_empty_rec_after_init_return_wit_1 := 
(
forall (head_pre: Z) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (head_pre <> 0)) (PreH3 : (head_pre <> 0)) ,
  (xizi_dll head_pre (@nil Z) )
|--
  “ (xizi_double_link_call_empty_result retval ) ”
  &&  (xizi_dll head_pre (@nil Z) )
) \/
(
forall (head_pre: Z) (retval: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (retval = 1)) (PreH3 : (head_pre <> 0)) (PreH4 : (head_pre <> 0)) ,
  TT && emp 
|--
  “ (xizi_double_link_call_empty_result retval ) ”
  &&  emp
).

Definition xizi_double_link_call_empty_rec_after_init_return_wit_1_split_goal_1 := 
forall (head_pre: Z) (retval: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (retval = 1)) (PreH3 : (head_pre <> 0)) (PreH4 : (head_pre <> 0)) ,
  (xizi_double_link_call_empty_result retval )
.

Definition xizi_double_link_call_empty_rec_after_init_partial_solve_wit_1 := 
forall (head_pre: Z) ,
  (xizi_dll_node head_pre )
|--
  “ (head_pre <> 0) ”
  &&  (xizi_dll_node head_pre )
.

Definition xizi_double_link_call_empty_rec_after_init_partial_solve_wit_2 := 
forall (head_pre: Z) (PreH1 : (head_pre <> 0)) ,
  (xizi_dll head_pre (@nil Z) )
|--
  “ (head_pre <> 0) ” 
  &&  “ (head_pre <> 0) ”
  &&  (xizi_dll head_pre (@nil Z) )
.

(*----- Function xizi_double_link_call_head_after_init -----*)

Definition xizi_double_link_call_head_after_init_return_wit_1 := 
(
forall (head_pre: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (head_pre <> 0)) (PreH3 : (head_pre <> 0)) ,
  (xizi_dll head_pre (@nil Z) )
|--
  “ (xizi_double_link_call_null_result retval ) ”
  &&  (xizi_dll head_pre (@nil Z) )
) \/
(
forall (head_pre: Z) (retval: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (retval = 0)) (PreH3 : (head_pre <> 0)) (PreH4 : (head_pre <> 0)) ,
  TT && emp 
|--
  “ (xizi_double_link_call_null_result retval ) ”
  &&  emp
).

Definition xizi_double_link_call_head_after_init_return_wit_1_split_goal_1 := 
forall (head_pre: Z) (retval: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (retval = 0)) (PreH3 : (head_pre <> 0)) (PreH4 : (head_pre <> 0)) ,
  (xizi_double_link_call_null_result retval )
.

Definition xizi_double_link_call_head_after_init_partial_solve_wit_1 := 
forall (head_pre: Z) ,
  (xizi_dll_node head_pre )
|--
  “ (head_pre <> 0) ”
  &&  (xizi_dll_node head_pre )
.

Definition xizi_double_link_call_head_after_init_partial_solve_wit_2 := 
forall (head_pre: Z) (PreH1 : (head_pre <> 0)) ,
  (xizi_dll head_pre (@nil Z) )
|--
  “ (head_pre <> 0) ” 
  &&  “ (head_pre <> 0) ”
  &&  (xizi_dll head_pre (@nil Z) )
.

(*----- Function xizi_double_link_call_head_rec_after_init -----*)

Definition xizi_double_link_call_head_rec_after_init_return_wit_1 := 
(
forall (head_pre: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (head_pre <> 0)) (PreH3 : (head_pre <> 0)) ,
  (xizi_dll head_pre (@nil Z) )
|--
  “ (xizi_double_link_call_null_result retval ) ”
  &&  (xizi_dll head_pre (@nil Z) )
) \/
(
forall (head_pre: Z) (retval: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (retval = 0)) (PreH3 : (head_pre <> 0)) (PreH4 : (head_pre <> 0)) ,
  TT && emp 
|--
  “ (xizi_double_link_call_null_result retval ) ”
  &&  emp
).

Definition xizi_double_link_call_head_rec_after_init_return_wit_1_split_goal_1 := 
forall (head_pre: Z) (retval: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (retval = 0)) (PreH3 : (head_pre <> 0)) (PreH4 : (head_pre <> 0)) ,
  (xizi_double_link_call_null_result retval )
.

Definition xizi_double_link_call_head_rec_after_init_partial_solve_wit_1 := 
forall (head_pre: Z) ,
  (xizi_dll_node head_pre )
|--
  “ (head_pre <> 0) ”
  &&  (xizi_dll_node head_pre )
.

Definition xizi_double_link_call_head_rec_after_init_partial_solve_wit_2 := 
forall (head_pre: Z) (PreH1 : (head_pre <> 0)) ,
  (xizi_dll head_pre (@nil Z) )
|--
  “ (head_pre <> 0) ” 
  &&  “ (head_pre <> 0) ”
  &&  (xizi_dll head_pre (@nil Z) )
.

(*----- Function xizi_double_link_call_len_after_init -----*)

Definition xizi_double_link_call_len_after_init_return_wit_1 := 
(
forall (head_pre: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (head_pre <> 0)) (PreH3 : (head_pre <> 0)) ,
  (xizi_dll head_pre (@nil Z) )
|--
  “ (xizi_double_link_call_len_result retval ) ”
  &&  (xizi_dll head_pre (@nil Z) )
) \/
(
forall (head_pre: Z) (retval: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (retval = 0)) (PreH3 : (head_pre <> 0)) (PreH4 : (head_pre <> 0)) ,
  TT && emp 
|--
  “ (xizi_double_link_call_len_result retval ) ”
  &&  emp
).

Definition xizi_double_link_call_len_after_init_return_wit_1_split_goal_1 := 
forall (head_pre: Z) (retval: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (retval = 0)) (PreH3 : (head_pre <> 0)) (PreH4 : (head_pre <> 0)) ,
  (xizi_double_link_call_len_result retval )
.

Definition xizi_double_link_call_len_after_init_partial_solve_wit_1 := 
forall (head_pre: Z) ,
  (xizi_dll_node head_pre )
|--
  “ (head_pre <> 0) ”
  &&  (xizi_dll_node head_pre )
.

Definition xizi_double_link_call_len_after_init_partial_solve_wit_2 := 
forall (head_pre: Z) (PreH1 : (head_pre <> 0)) ,
  (xizi_dll head_pre (@nil Z) )
|--
  “ (head_pre <> 0) ” 
  &&  “ (head_pre <> 0) ”
  &&  (xizi_dll head_pre (@nil Z) )
.

(*----- Function xizi_double_link_call_next_after_init -----*)

Definition xizi_double_link_call_next_after_init_entail_wit_1 := 
forall (head_pre: Z) (PreH1 : (head_pre <> 0)) ,
  (xizi_dll head_pre (@nil Z) )
|--
  EX (nodes: (@list Z)) ,
  “ (nodes = (@nil Z)) ”
  &&  (xizi_dll head_pre nodes )
.

Definition xizi_double_link_call_next_after_init_return_wit_1 := 
(
forall (head_pre: Z) (nodes: (@list Z)) (retval: Z) (PreH1 : (retval = (xizi_double_link_first_value (nodes)))) (PreH2 : (head_pre <> 0)) (PreH3 : (nodes = (@nil Z))) ,
  (xizi_dll head_pre nodes )
|--
  “ (xizi_double_link_call_null_result retval ) ”
  &&  (xizi_dll head_pre (@nil Z) )
) \/
(
forall (head_pre: Z) (nodes: (@list Z)) (retval: Z) (first: Z) (last: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (retval = (xizi_double_link_first_value (nodes)))) (PreH3 : (head_pre <> 0)) (PreH4 : (nodes = (@nil Z))) ,
  (xizi_dllseg first head_pre head_pre last nodes )
|--
  “ (xizi_double_link_call_null_result retval ) ” 
  &&  “ (last = head_pre) ” 
  &&  “ (first = head_pre) ”
  &&  emp
).

Definition xizi_double_link_call_next_after_init_return_wit_1_split_goal_1 := 
forall (head_pre: Z) (nodes: (@list Z)) (retval: Z) (first: Z) (last: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (retval = (xizi_double_link_first_value (nodes)))) (PreH3 : (head_pre <> 0)) (PreH4 : (nodes = (@nil Z))) ,
  (xizi_dllseg first head_pre head_pre last nodes )
|--
  “ (xizi_double_link_call_null_result retval ) ”
.

Definition xizi_double_link_call_next_after_init_return_wit_1_split_goal_2 := 
forall (head_pre: Z) (nodes: (@list Z)) (retval: Z) (first: Z) (last: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (retval = (xizi_double_link_first_value (nodes)))) (PreH3 : (head_pre <> 0)) (PreH4 : (nodes = (@nil Z))) ,
  (xizi_dllseg first head_pre head_pre last nodes )
|--
  “ (last = head_pre) ”
.

Definition xizi_double_link_call_next_after_init_return_wit_1_split_goal_3 := 
forall (head_pre: Z) (nodes: (@list Z)) (retval: Z) (first: Z) (last: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (retval = (xizi_double_link_first_value (nodes)))) (PreH3 : (head_pre <> 0)) (PreH4 : (nodes = (@nil Z))) ,
  (xizi_dllseg first head_pre head_pre last nodes )
|--
  “ (first = head_pre) ”
.

Definition xizi_double_link_call_next_after_init_return_wit_1_split_goal_spatial := 
forall (head_pre: Z) (nodes: (@list Z)) (retval: Z) (first: Z) (last: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (retval = (xizi_double_link_first_value (nodes)))) (PreH3 : (head_pre <> 0)) (PreH4 : (nodes = (@nil Z))) ,
  (xizi_dllseg first head_pre head_pre last nodes )
|--
  TT && emp 
.

Definition xizi_double_link_call_next_after_init_partial_solve_wit_1 := 
forall (head_pre: Z) ,
  (xizi_dll_node head_pre )
|--
  “ (head_pre <> 0) ”
  &&  (xizi_dll_node head_pre )
.

Definition xizi_double_link_call_next_after_init_partial_solve_wit_2_pure := 
forall (head_pre: Z) (nodes: (@list Z)) (PreH1 : (nodes = (@nil Z))) ,
  ((( &( "head" ) )) # Ptr  |-> head_pre)
  **  (xizi_dll head_pre nodes )
|--
  “ (head_pre = head_pre) ”
.

Definition xizi_double_link_call_next_after_init_partial_solve_wit_2_aux := 
forall (head_pre: Z) (nodes: (@list Z)) (PreH1 : (nodes = (@nil Z))) ,
  (xizi_dll head_pre nodes )
|--
  “ (head_pre = head_pre) ” 
  &&  “ (head_pre <> 0) ” 
  &&  “ (nodes = (@nil Z)) ”
  &&  (xizi_dll head_pre nodes )
.

Definition xizi_double_link_call_next_after_init_partial_solve_wit_2 := xizi_double_link_call_next_after_init_partial_solve_wit_2_pure -> xizi_double_link_call_next_after_init_partial_solve_wit_2_aux.

(*----- Function xizi_double_link_call_next_rec_last_after_init -----*)

Definition xizi_double_link_call_next_rec_last_after_init_entail_wit_1 := 
forall (head_pre: Z) (PreH1 : (head_pre <> 0)) ,
  (xizi_dll head_pre (@nil Z) )
|--
  EX (nodes: (@list Z)) ,
  “ (nodes = (@nil Z)) ”
  &&  (xizi_dll head_pre nodes )
.

Definition xizi_double_link_call_next_rec_last_after_init_return_wit_1 := 
(
forall (head_pre: Z) (nodes: (@list Z)) (retval: Z) (PreH1 : (retval = (xizi_double_link_first_value (nodes)))) (PreH2 : (head_pre <> 0)) (PreH3 : (nodes = (@nil Z))) ,
  (xizi_dll head_pre nodes )
|--
  “ (xizi_double_link_call_null_result retval ) ”
  &&  (xizi_dll head_pre (@nil Z) )
) \/
(
forall (head_pre: Z) (nodes: (@list Z)) (retval: Z) (first: Z) (last: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (retval = (xizi_double_link_first_value (nodes)))) (PreH3 : (head_pre <> 0)) (PreH4 : (nodes = (@nil Z))) ,
  (xizi_dllseg first head_pre head_pre last nodes )
|--
  “ (xizi_double_link_call_null_result retval ) ” 
  &&  “ (last = head_pre) ” 
  &&  “ (first = head_pre) ”
  &&  emp
).

Definition xizi_double_link_call_next_rec_last_after_init_return_wit_1_split_goal_1 := 
forall (head_pre: Z) (nodes: (@list Z)) (retval: Z) (first: Z) (last: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (retval = (xizi_double_link_first_value (nodes)))) (PreH3 : (head_pre <> 0)) (PreH4 : (nodes = (@nil Z))) ,
  (xizi_dllseg first head_pre head_pre last nodes )
|--
  “ (xizi_double_link_call_null_result retval ) ”
.

Definition xizi_double_link_call_next_rec_last_after_init_return_wit_1_split_goal_2 := 
forall (head_pre: Z) (nodes: (@list Z)) (retval: Z) (first: Z) (last: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (retval = (xizi_double_link_first_value (nodes)))) (PreH3 : (head_pre <> 0)) (PreH4 : (nodes = (@nil Z))) ,
  (xizi_dllseg first head_pre head_pre last nodes )
|--
  “ (last = head_pre) ”
.

Definition xizi_double_link_call_next_rec_last_after_init_return_wit_1_split_goal_3 := 
forall (head_pre: Z) (nodes: (@list Z)) (retval: Z) (first: Z) (last: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (retval = (xizi_double_link_first_value (nodes)))) (PreH3 : (head_pre <> 0)) (PreH4 : (nodes = (@nil Z))) ,
  (xizi_dllseg first head_pre head_pre last nodes )
|--
  “ (first = head_pre) ”
.

Definition xizi_double_link_call_next_rec_last_after_init_return_wit_1_split_goal_spatial := 
forall (head_pre: Z) (nodes: (@list Z)) (retval: Z) (first: Z) (last: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (retval = (xizi_double_link_first_value (nodes)))) (PreH3 : (head_pre <> 0)) (PreH4 : (nodes = (@nil Z))) ,
  (xizi_dllseg first head_pre head_pre last nodes )
|--
  TT && emp 
.

Definition xizi_double_link_call_next_rec_last_after_init_partial_solve_wit_1 := 
forall (head_pre: Z) ,
  (xizi_dll_node head_pre )
|--
  “ (head_pre <> 0) ”
  &&  (xizi_dll_node head_pre )
.

Definition xizi_double_link_call_next_rec_last_after_init_partial_solve_wit_2_pure := 
forall (head_pre: Z) (nodes: (@list Z)) (PreH1 : (nodes = (@nil Z))) ,
  ((( &( "head" ) )) # Ptr  |-> head_pre)
  **  (xizi_dll head_pre nodes )
|--
  “ (head_pre = head_pre) ”
.

Definition xizi_double_link_call_next_rec_last_after_init_partial_solve_wit_2_aux := 
forall (head_pre: Z) (nodes: (@list Z)) (PreH1 : (nodes = (@nil Z))) ,
  (xizi_dll head_pre nodes )
|--
  “ (head_pre = head_pre) ” 
  &&  “ (head_pre <> 0) ” 
  &&  “ (nodes = (@nil Z)) ”
  &&  (xizi_dll head_pre nodes )
.

Definition xizi_double_link_call_next_rec_last_after_init_partial_solve_wit_2 := xizi_double_link_call_next_rec_last_after_init_partial_solve_wit_2_pure -> xizi_double_link_call_next_rec_last_after_init_partial_solve_wit_2_aux.

(*----- Function xizi_double_link_call_next_rec_middle_after_init -----*)

Definition xizi_double_link_call_next_rec_middle_after_init_entail_wit_1 := 
forall (head_pre: Z) (PreH1 : (head_pre <> 0)) ,
  (xizi_dll head_pre (@nil Z) )
|--
  EX (nodes: (@list Z)) ,
  “ (nodes = (@nil Z)) ”
  &&  (xizi_dll head_pre nodes )
.

Definition xizi_double_link_call_next_rec_middle_after_init_return_wit_1 := 
(
forall (head_pre: Z) (nodes: (@list Z)) (retval: Z) (PreH1 : (retval = (xizi_double_link_first_value (nodes)))) (PreH2 : (head_pre <> 0)) (PreH3 : (nodes = (@nil Z))) ,
  (xizi_dll head_pre nodes )
|--
  “ (xizi_double_link_call_null_result retval ) ”
  &&  (xizi_dll head_pre (@nil Z) )
) \/
(
forall (head_pre: Z) (nodes: (@list Z)) (retval: Z) (first: Z) (last: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (retval = (xizi_double_link_first_value (nodes)))) (PreH3 : (head_pre <> 0)) (PreH4 : (nodes = (@nil Z))) ,
  (xizi_dllseg first head_pre head_pre last nodes )
|--
  “ (xizi_double_link_call_null_result retval ) ” 
  &&  “ (last = head_pre) ” 
  &&  “ (first = head_pre) ”
  &&  emp
).

Definition xizi_double_link_call_next_rec_middle_after_init_return_wit_1_split_goal_1 := 
forall (head_pre: Z) (nodes: (@list Z)) (retval: Z) (first: Z) (last: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (retval = (xizi_double_link_first_value (nodes)))) (PreH3 : (head_pre <> 0)) (PreH4 : (nodes = (@nil Z))) ,
  (xizi_dllseg first head_pre head_pre last nodes )
|--
  “ (xizi_double_link_call_null_result retval ) ”
.

Definition xizi_double_link_call_next_rec_middle_after_init_return_wit_1_split_goal_2 := 
forall (head_pre: Z) (nodes: (@list Z)) (retval: Z) (first: Z) (last: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (retval = (xizi_double_link_first_value (nodes)))) (PreH3 : (head_pre <> 0)) (PreH4 : (nodes = (@nil Z))) ,
  (xizi_dllseg first head_pre head_pre last nodes )
|--
  “ (last = head_pre) ”
.

Definition xizi_double_link_call_next_rec_middle_after_init_return_wit_1_split_goal_3 := 
forall (head_pre: Z) (nodes: (@list Z)) (retval: Z) (first: Z) (last: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (retval = (xizi_double_link_first_value (nodes)))) (PreH3 : (head_pre <> 0)) (PreH4 : (nodes = (@nil Z))) ,
  (xizi_dllseg first head_pre head_pre last nodes )
|--
  “ (first = head_pre) ”
.

Definition xizi_double_link_call_next_rec_middle_after_init_return_wit_1_split_goal_spatial := 
forall (head_pre: Z) (nodes: (@list Z)) (retval: Z) (first: Z) (last: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (retval = (xizi_double_link_first_value (nodes)))) (PreH3 : (head_pre <> 0)) (PreH4 : (nodes = (@nil Z))) ,
  (xizi_dllseg first head_pre head_pre last nodes )
|--
  TT && emp 
.

Definition xizi_double_link_call_next_rec_middle_after_init_partial_solve_wit_1 := 
forall (head_pre: Z) ,
  (xizi_dll_node head_pre )
|--
  “ (head_pre <> 0) ”
  &&  (xizi_dll_node head_pre )
.

Definition xizi_double_link_call_next_rec_middle_after_init_partial_solve_wit_2_pure := 
forall (head_pre: Z) (nodes: (@list Z)) (PreH1 : (nodes = (@nil Z))) ,
  ((( &( "head" ) )) # Ptr  |-> head_pre)
  **  (xizi_dll head_pre nodes )
|--
  “ (head_pre = head_pre) ”
.

Definition xizi_double_link_call_next_rec_middle_after_init_partial_solve_wit_2_aux := 
forall (head_pre: Z) (nodes: (@list Z)) (PreH1 : (nodes = (@nil Z))) ,
  (xizi_dll head_pre nodes )
|--
  “ (head_pre = head_pre) ” 
  &&  “ (head_pre <> 0) ” 
  &&  “ (nodes = (@nil Z)) ”
  &&  (xizi_dll head_pre nodes )
.

Definition xizi_double_link_call_next_rec_middle_after_init_partial_solve_wit_2 := xizi_double_link_call_next_rec_middle_after_init_partial_solve_wit_2_pure -> xizi_double_link_call_next_rec_middle_after_init_partial_solve_wit_2_aux.

(*----- Function xizi_double_link_call_insert_after_init -----*)

Definition xizi_double_link_call_insert_after_init_entail_wit_1 := 
forall (node_pre: Z) (head_pre: Z) (PreH1 : (node_pre <> 0)) (PreH2 : (head_pre <> 0)) ,
  (xizi_dll head_pre (@nil Z) )
  **  ((&((node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |->_)
  **  ((&((node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
|--
  EX (nodes: (@list Z)) ,
  “ (nodes = (@nil Z)) ”
  &&  (xizi_dll head_pre nodes )
  **  (xizi_dll_node node_pre )
.

Definition xizi_double_link_call_insert_after_init_return_wit_1 := 
(
forall (node_pre: Z) (head_pre: Z) (nodes: (@list Z)) (PreH1 : (node_pre <> 0)) (PreH2 : (head_pre <> 0)) (PreH3 : (nodes = (@nil Z))) ,
  (xizi_dll head_pre (cons (node_pre) (nodes)) )
|--
  (xizi_dll head_pre (xizi_double_link_singleton_nodes (node_pre)) )
) \/
(
forall (node_pre: Z) (head_pre: Z) (nodes: (@list Z)) (first: Z) (last: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (node_pre <> 0)) (PreH3 : (head_pre <> 0)) (PreH4 : (nodes = (@nil Z))) ,
  (xizi_dllseg first head_pre head_pre last (cons (node_pre) (nodes)) )
|--
  (xizi_dllseg first head_pre head_pre last (xizi_double_link_singleton_nodes (node_pre)) )
).

Definition xizi_double_link_call_insert_after_init_return_wit_1_split_goal_spatial := 
forall (node_pre: Z) (head_pre: Z) (nodes: (@list Z)) (first: Z) (last: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (node_pre <> 0)) (PreH3 : (head_pre <> 0)) (PreH4 : (nodes = (@nil Z))) ,
  (xizi_dllseg first head_pre head_pre last (cons (node_pre) (nodes)) )
|--
  (xizi_dllseg first head_pre head_pre last (xizi_double_link_singleton_nodes (node_pre)) )
.

Definition xizi_double_link_call_insert_after_init_partial_solve_wit_1 := 
forall (node_pre: Z) (head_pre: Z) ,
  (xizi_dll_node head_pre )
  **  (xizi_dll_node node_pre )
|--
  “ (node_pre <> 0) ” 
  &&  “ (head_pre <> 0) ”
  &&  (xizi_dll_node head_pre )
  **  ((&((node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |->_)
  **  ((&((node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
.

Definition xizi_double_link_call_insert_after_init_partial_solve_wit_2 := 
forall (node_pre: Z) (head_pre: Z) (nodes: (@list Z)) (PreH1 : (nodes = (@nil Z))) ,
  (xizi_dll head_pre nodes )
  **  (xizi_dll_node node_pre )
|--
  “ (node_pre <> 0) ” 
  &&  “ (head_pre <> 0) ” 
  &&  “ (nodes = (@nil Z)) ”
  &&  (xizi_dll head_pre nodes )
  **  (xizi_dll_node node_pre )
.

(*----- Function xizi_double_link_call_remove_front_singleton -----*)

Definition xizi_double_link_call_remove_front_singleton_entail_wit_1 := 
forall (node_pre: Z) (head_pre: Z) (PreH1 : (node_pre <> 0)) (PreH2 : (head_pre <> 0)) ,
  (xizi_dll head_pre (@nil Z) )
  **  ((&((node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |->_)
  **  ((&((node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
|--
  EX (nodes: (@list Z)) ,
  “ (nodes = (@nil Z)) ”
  &&  (xizi_dll head_pre nodes )
  **  (xizi_dll_node node_pre )
.

Definition xizi_double_link_call_remove_front_singleton_entail_wit_2 := 
(
forall (node_pre: Z) (head_pre: Z) (nodes: (@list Z)) (PreH1 : (node_pre <> 0)) (PreH2 : (head_pre <> 0)) (PreH3 : (nodes = (@nil Z))) ,
  (xizi_dll head_pre (cons (node_pre) (nodes)) )
|--
  EX (suffix: (@list Z)) ,
  “ (suffix = (@nil Z)) ”
  &&  (xizi_dll head_pre (cons (node_pre) (suffix)) )
) \/
(
forall (node_pre: Z) (head_pre: Z) (nodes: (@list Z)) (first: Z) (last: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (node_pre <> 0)) (PreH3 : (head_pre <> 0)) (PreH4 : (nodes = (@nil Z))) ,
  (xizi_dllseg first head_pre head_pre last (cons (node_pre) (nodes)) )
|--
  (xizi_dllseg first head_pre head_pre last (cons (node_pre) ((@nil Z))) )
).

Definition xizi_double_link_call_remove_front_singleton_entail_wit_2_split_goal_spatial := 
forall (node_pre: Z) (head_pre: Z) (nodes: (@list Z)) (first: Z) (last: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (node_pre <> 0)) (PreH3 : (head_pre <> 0)) (PreH4 : (nodes = (@nil Z))) ,
  (xizi_dllseg first head_pre head_pre last (cons (node_pre) (nodes)) )
|--
  (xizi_dllseg first head_pre head_pre last (cons (node_pre) ((@nil Z))) )
.

Definition xizi_double_link_call_remove_front_singleton_return_wit_1 := 
(
forall (node_pre: Z) (head_pre: Z) (suffix: (@list Z)) (PreH1 : (head_pre <> 0)) (PreH2 : (suffix = (@nil Z))) ,
  (xizi_dll head_pre suffix )
  **  (xizi_dll node_pre (@nil Z) )
|--
  (xizi_dll head_pre (@nil Z) )
  **  (xizi_dll node_pre (@nil Z) )
) \/
(
forall (node_pre: Z) (head_pre: Z) (suffix: (@list Z)) (first: Z) (last: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (node_pre <> 0)) (PreH3 : (head_pre <> 0)) (PreH4 : (suffix = (@nil Z))) ,
  (xizi_dllseg first head_pre head_pre last suffix )
|--
  “ (last = head_pre) ” 
  &&  “ (first = head_pre) ”
  &&  emp
).

Definition xizi_double_link_call_remove_front_singleton_return_wit_1_split_goal_1 := 
forall (node_pre: Z) (head_pre: Z) (suffix: (@list Z)) (first: Z) (last: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (node_pre <> 0)) (PreH3 : (head_pre <> 0)) (PreH4 : (suffix = (@nil Z))) ,
  (xizi_dllseg first head_pre head_pre last suffix )
|--
  “ (last = head_pre) ”
.

Definition xizi_double_link_call_remove_front_singleton_return_wit_1_split_goal_2 := 
forall (node_pre: Z) (head_pre: Z) (suffix: (@list Z)) (first: Z) (last: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (node_pre <> 0)) (PreH3 : (head_pre <> 0)) (PreH4 : (suffix = (@nil Z))) ,
  (xizi_dllseg first head_pre head_pre last suffix )
|--
  “ (first = head_pre) ”
.

Definition xizi_double_link_call_remove_front_singleton_return_wit_1_split_goal_spatial := 
forall (node_pre: Z) (head_pre: Z) (suffix: (@list Z)) (first: Z) (last: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (node_pre <> 0)) (PreH3 : (head_pre <> 0)) (PreH4 : (suffix = (@nil Z))) ,
  (xizi_dllseg first head_pre head_pre last suffix )
|--
  TT && emp 
.

Definition xizi_double_link_call_remove_front_singleton_partial_solve_wit_1 := 
forall (node_pre: Z) (head_pre: Z) ,
  (xizi_dll_node head_pre )
  **  (xizi_dll_node node_pre )
|--
  “ (node_pre <> 0) ” 
  &&  “ (head_pre <> 0) ”
  &&  (xizi_dll_node head_pre )
  **  ((&((node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |->_)
  **  ((&((node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
.

Definition xizi_double_link_call_remove_front_singleton_partial_solve_wit_2 := 
forall (node_pre: Z) (head_pre: Z) (nodes: (@list Z)) (PreH1 : (nodes = (@nil Z))) ,
  (xizi_dll head_pre nodes )
  **  (xizi_dll_node node_pre )
|--
  “ (node_pre <> 0) ” 
  &&  “ (head_pre <> 0) ” 
  &&  “ (nodes = (@nil Z)) ”
  &&  (xizi_dll head_pre nodes )
  **  (xizi_dll_node node_pre )
.

Definition xizi_double_link_call_remove_front_singleton_partial_solve_wit_3 := 
forall (node_pre: Z) (head_pre: Z) (suffix: (@list Z)) (PreH1 : (suffix = (@nil Z))) ,
  (xizi_dll head_pre (cons (node_pre) (suffix)) )
|--
  “ (head_pre <> 0) ” 
  &&  “ (suffix = (@nil Z)) ”
  &&  (xizi_dll head_pre (cons (node_pre) (suffix)) )
.

(*----- Function xizi_double_link_call_remove_tail_singleton -----*)

Definition xizi_double_link_call_remove_tail_singleton_entail_wit_1 := 
forall (node_pre: Z) (head_pre: Z) (PreH1 : (node_pre <> 0)) (PreH2 : (head_pre <> 0)) ,
  (xizi_dll head_pre (@nil Z) )
  **  ((&((node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |->_)
  **  ((&((node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
|--
  EX (nodes: (@list Z)) ,
  “ (nodes = (@nil Z)) ”
  &&  (xizi_dll head_pre nodes )
  **  (xizi_dll_node node_pre )
.

Definition xizi_double_link_call_remove_tail_singleton_entail_wit_2 := 
(
forall (node_pre: Z) (head_pre: Z) (nodes: (@list Z)) (PreH1 : (node_pre <> 0)) (PreH2 : (head_pre <> 0)) (PreH3 : (nodes = (@nil Z))) ,
  (xizi_dll head_pre (cons (node_pre) (nodes)) )
|--
  EX (prefix: (@list Z)) ,
  “ (prefix = (@nil Z)) ”
  &&  (xizi_dll head_pre (app (prefix) ((cons (node_pre) ((@nil Z))))) )
) \/
(
forall (node_pre: Z) (head_pre: Z) (nodes: (@list Z)) (first: Z) (last: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (node_pre <> 0)) (PreH3 : (head_pre <> 0)) (PreH4 : (nodes = (@nil Z))) ,
  (xizi_dllseg first head_pre head_pre last (cons (node_pre) (nodes)) )
|--
  (xizi_dllseg first head_pre head_pre last (app ((@nil Z)) ((cons (node_pre) ((@nil Z))))) )
).

Definition xizi_double_link_call_remove_tail_singleton_entail_wit_2_split_goal_spatial := 
forall (node_pre: Z) (head_pre: Z) (nodes: (@list Z)) (first: Z) (last: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (node_pre <> 0)) (PreH3 : (head_pre <> 0)) (PreH4 : (nodes = (@nil Z))) ,
  (xizi_dllseg first head_pre head_pre last (cons (node_pre) (nodes)) )
|--
  (xizi_dllseg first head_pre head_pre last (app ((@nil Z)) ((cons (node_pre) ((@nil Z))))) )
.

Definition xizi_double_link_call_remove_tail_singleton_return_wit_1 := 
(
forall (node_pre: Z) (head_pre: Z) (prefix: (@list Z)) (PreH1 : (head_pre <> 0)) (PreH2 : (prefix = (@nil Z))) ,
  (xizi_dll head_pre prefix )
  **  (xizi_dll node_pre (@nil Z) )
|--
  (xizi_dll head_pre (@nil Z) )
  **  (xizi_dll node_pre (@nil Z) )
) \/
(
forall (node_pre: Z) (head_pre: Z) (prefix: (@list Z)) (first: Z) (last: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (node_pre <> 0)) (PreH3 : (head_pre <> 0)) (PreH4 : (prefix = (@nil Z))) ,
  (xizi_dllseg first head_pre head_pre last prefix )
|--
  “ (last = head_pre) ” 
  &&  “ (first = head_pre) ”
  &&  emp
).

Definition xizi_double_link_call_remove_tail_singleton_return_wit_1_split_goal_1 := 
forall (node_pre: Z) (head_pre: Z) (prefix: (@list Z)) (first: Z) (last: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (node_pre <> 0)) (PreH3 : (head_pre <> 0)) (PreH4 : (prefix = (@nil Z))) ,
  (xizi_dllseg first head_pre head_pre last prefix )
|--
  “ (last = head_pre) ”
.

Definition xizi_double_link_call_remove_tail_singleton_return_wit_1_split_goal_2 := 
forall (node_pre: Z) (head_pre: Z) (prefix: (@list Z)) (first: Z) (last: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (node_pre <> 0)) (PreH3 : (head_pre <> 0)) (PreH4 : (prefix = (@nil Z))) ,
  (xizi_dllseg first head_pre head_pre last prefix )
|--
  “ (first = head_pre) ”
.

Definition xizi_double_link_call_remove_tail_singleton_return_wit_1_split_goal_spatial := 
forall (node_pre: Z) (head_pre: Z) (prefix: (@list Z)) (first: Z) (last: Z) (PreH1 : (head_pre <> 0)) (PreH2 : (node_pre <> 0)) (PreH3 : (head_pre <> 0)) (PreH4 : (prefix = (@nil Z))) ,
  (xizi_dllseg first head_pre head_pre last prefix )
|--
  TT && emp 
.

Definition xizi_double_link_call_remove_tail_singleton_partial_solve_wit_1 := 
forall (node_pre: Z) (head_pre: Z) ,
  (xizi_dll_node head_pre )
  **  (xizi_dll_node node_pre )
|--
  “ (node_pre <> 0) ” 
  &&  “ (head_pre <> 0) ”
  &&  (xizi_dll_node head_pre )
  **  ((&((node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |->_)
  **  ((&((node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
.

Definition xizi_double_link_call_remove_tail_singleton_partial_solve_wit_2 := 
forall (node_pre: Z) (head_pre: Z) (nodes: (@list Z)) (PreH1 : (nodes = (@nil Z))) ,
  (xizi_dll head_pre nodes )
  **  (xizi_dll_node node_pre )
|--
  “ (node_pre <> 0) ” 
  &&  “ (head_pre <> 0) ” 
  &&  “ (nodes = (@nil Z)) ”
  &&  (xizi_dll head_pre nodes )
  **  (xizi_dll_node node_pre )
.

Definition xizi_double_link_call_remove_tail_singleton_partial_solve_wit_3 := 
forall (node_pre: Z) (head_pre: Z) (prefix: (@list Z)) (PreH1 : (prefix = (@nil Z))) ,
  (xizi_dll head_pre (app (prefix) ((cons (node_pre) ((@nil Z))))) )
|--
  “ (head_pre <> 0) ” 
  &&  “ (prefix = (@nil Z)) ”
  &&  (xizi_dll head_pre (app (prefix) ((cons (node_pre) ((@nil Z))))) )
.

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
Axiom proof_of_xizi_double_link_call_remove_front_singleton_partial_solve_wit_3 : xizi_double_link_call_remove_front_singleton_partial_solve_wit_3.
Axiom proof_of_xizi_double_link_call_remove_tail_singleton_entail_wit_1 : xizi_double_link_call_remove_tail_singleton_entail_wit_1.
Axiom proof_of_xizi_double_link_call_remove_tail_singleton_entail_wit_2 : xizi_double_link_call_remove_tail_singleton_entail_wit_2.
Axiom proof_of_xizi_double_link_call_remove_tail_singleton_return_wit_1 : xizi_double_link_call_remove_tail_singleton_return_wit_1.
Axiom proof_of_xizi_double_link_call_remove_tail_singleton_partial_solve_wit_1 : xizi_double_link_call_remove_tail_singleton_partial_solve_wit_1.
Axiom proof_of_xizi_double_link_call_remove_tail_singleton_partial_solve_wit_2 : xizi_double_link_call_remove_tail_singleton_partial_solve_wit_2.
Axiom proof_of_xizi_double_link_call_remove_tail_singleton_partial_solve_wit_3 : xizi_double_link_call_remove_tail_singleton_partial_solve_wit_3.

End VC_Correct.
