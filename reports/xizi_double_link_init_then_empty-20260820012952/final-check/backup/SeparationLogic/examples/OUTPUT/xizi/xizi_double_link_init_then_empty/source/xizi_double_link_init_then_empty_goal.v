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

(*----- Function xizi_double_link_init -----*)

Definition xizi_double_link_init_return_wit_1 := 
forall (linklist_head_pre: Z) (PreH1 : (linklist_head_pre <> 0)) ,
  ((&((linklist_head_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_head_pre)
  **  ((&((linklist_head_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_head_pre)
|--
  (xizi_dll linklist_head_pre (@nil Z) )
.

Definition xizi_double_link_init_partial_solve_wit_1 := 
forall (linklist_head_pre: Z) ,
  (xizi_dll_node linklist_head_pre )
|--
  “ (linklist_head_pre <> 0) ”
  &&  ((&((linklist_head_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
  **  ((&((linklist_head_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |->_)
.

(*----- Function xizi_double_link_empty -----*)

Definition xizi_double_link_empty_return_wit_1_nil_case := 
forall (linklist_pre: Z) (PreH1 : (linklist_pre <> 0)) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_pre)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_pre)
|--
  “ (1 = 1) ”
  &&  (xizi_dll linklist_pre (@nil Z) )
.

Definition xizi_double_link_empty_return_wit_2_general := 
(
forall (linklist_pre: Z) (nodes_general: (@list Z)) (first: Z) (last: Z) (PreH1 : (first <> linklist_pre)) (PreH2 : (linklist_pre <> 0)) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_dllseg first linklist_pre linklist_pre last nodes_general )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
|--
  “ (nodes_general <> (@nil Z)) ” 
  &&  “ (0 = 0) ”
  &&  (xizi_dll linklist_pre nodes_general )
) \/
(
forall (linklist_pre: Z) (nodes_general: (@list Z)) (first: Z) (last: Z) (next: Z) (l0: (@list Z)) (PreH1 : (nodes_general = (cons (first) (l0)))) (PreH2 : (first <> linklist_pre)) (PreH3 : (linklist_pre <> 0)) ,
  (xizi_dllseg next first linklist_pre last l0 )
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_pre)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
|--
  “ (nodes_general <> (@nil Z)) ”
  &&  (xizi_dllseg first linklist_pre linklist_pre last nodes_general )
).

Definition xizi_double_link_empty_return_wit_2_general_split_goal_1 := 
forall (linklist_pre: Z) (nodes_general: (@list Z)) (first: Z) (last: Z) (next: Z) (l0: (@list Z)) (PreH1 : (nodes_general = (cons (first) (l0)))) (PreH2 : (first <> linklist_pre)) (PreH3 : (linklist_pre <> 0)) ,
  (xizi_dllseg next first linklist_pre last l0 )
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_pre)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
|--
  “ (nodes_general <> (@nil Z)) ”
.

Definition xizi_double_link_empty_return_wit_2_general_split_goal_spatial := 
forall (linklist_pre: Z) (nodes_general: (@list Z)) (first: Z) (last: Z) (next: Z) (l0: (@list Z)) (PreH1 : (nodes_general = (cons (first) (l0)))) (PreH2 : (first <> linklist_pre)) (PreH3 : (linklist_pre <> 0)) ,
  (xizi_dllseg next first linklist_pre last l0 )
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_pre)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
|--
  (xizi_dllseg first linklist_pre linklist_pre last nodes_general )
.

Definition xizi_double_link_empty_return_wit_3_general := 
(
forall (linklist_pre: Z) (nodes_general: (@list Z)) (first: Z) (last: Z) (PreH1 : (first = linklist_pre)) (PreH2 : (linklist_pre <> 0)) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_dllseg first linklist_pre linklist_pre last nodes_general )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
|--
  “ (nodes_general = (@nil Z)) ” 
  &&  “ (1 = 1) ”
  &&  (xizi_dll linklist_pre nodes_general )
) \/
(
forall (linklist_pre: Z) (nodes_general: (@list Z)) (first: Z) (last: Z) (PreH1 : (first = linklist_pre)) (PreH2 : (linklist_pre <> 0)) ,
  (xizi_dllseg first linklist_pre linklist_pre last nodes_general )
|--
  “ (nodes_general = (@nil Z)) ”
  &&  (xizi_dllseg first linklist_pre linklist_pre last nodes_general )
).

Definition xizi_double_link_empty_return_wit_3_general_split_goal_1 := 
forall (linklist_pre: Z) (nodes_general: (@list Z)) (first: Z) (last: Z) (PreH1 : (first = linklist_pre)) (PreH2 : (linklist_pre <> 0)) ,
  (xizi_dllseg first linklist_pre linklist_pre last nodes_general )
|--
  “ (nodes_general = (@nil Z)) ”
.

Definition xizi_double_link_empty_return_wit_3_general_split_goal_spatial := 
forall (linklist_pre: Z) (nodes_general: (@list Z)) (first: Z) (last: Z) (PreH1 : (first = linklist_pre)) (PreH2 : (linklist_pre <> 0)) ,
  (xizi_dllseg first linklist_pre linklist_pre last nodes_general )
|--
  (xizi_dllseg first linklist_pre linklist_pre last nodes_general )
.

Definition xizi_double_link_empty_partial_solve_wit_1_nil_case := 
forall (linklist_pre: Z) ,
  (xizi_dll linklist_pre (@nil Z) )
|--
  “ (linklist_pre <> 0) ”
  &&  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_pre)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_pre)
.

Definition xizi_double_link_empty_partial_solve_wit_2_general := 
forall (linklist_pre: Z) (nodes_general: (@list Z)) ,
  (xizi_dll linklist_pre nodes_general )
|--
  EX (last: Z)  (first: Z) ,
  “ (linklist_pre <> 0) ”
  &&  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_dllseg first linklist_pre linklist_pre last nodes_general )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
.

(*----- Function xizi_double_link_init_then_empty -----*)

Definition xizi_double_link_init_then_empty_return_wit_1 := 
forall (linklist_head_pre: Z) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (linklist_head_pre <> 0)) (PreH3 : (linklist_head_pre <> 0)) ,
  (xizi_dll linklist_head_pre (@nil Z) )
|--
  “ (retval = 1) ”
  &&  (xizi_dll linklist_head_pre (@nil Z) )
.

Definition xizi_double_link_init_then_empty_partial_solve_wit_1 := 
forall (linklist_head_pre: Z) ,
  (xizi_dll_node linklist_head_pre )
|--
  “ (linklist_head_pre <> 0) ”
  &&  (xizi_dll_node linklist_head_pre )
.

Definition xizi_double_link_init_then_empty_partial_solve_wit_2 := 
forall (linklist_head_pre: Z) (PreH1 : (linklist_head_pre <> 0)) ,
  (xizi_dll linklist_head_pre (@nil Z) )
|--
  “ (linklist_head_pre <> 0) ” 
  &&  “ (linklist_head_pre <> 0) ”
  &&  (xizi_dll linklist_head_pre (@nil Z) )
.

Module Type VC_Correct.

Include xizi_double_link_Strategy_Correct.

Axiom proof_of_xizi_double_link_init_return_wit_1 : xizi_double_link_init_return_wit_1.
Axiom proof_of_xizi_double_link_init_partial_solve_wit_1 : xizi_double_link_init_partial_solve_wit_1.
Axiom proof_of_xizi_double_link_empty_return_wit_1_nil_case : xizi_double_link_empty_return_wit_1_nil_case.
Axiom proof_of_xizi_double_link_empty_return_wit_2_general : xizi_double_link_empty_return_wit_2_general.
Axiom proof_of_xizi_double_link_empty_return_wit_3_general : xizi_double_link_empty_return_wit_3_general.
Axiom proof_of_xizi_double_link_empty_partial_solve_wit_1_nil_case : xizi_double_link_empty_partial_solve_wit_1_nil_case.
Axiom proof_of_xizi_double_link_empty_partial_solve_wit_2_general : xizi_double_link_empty_partial_solve_wit_2_general.
Axiom proof_of_xizi_double_link_init_then_empty_return_wit_1 : xizi_double_link_init_then_empty_return_wit_1.
Axiom proof_of_xizi_double_link_init_then_empty_partial_solve_wit_1 : xizi_double_link_init_then_empty_partial_solve_wit_1.
Axiom proof_of_xizi_double_link_init_then_empty_partial_solve_wit_2 : xizi_double_link_init_then_empty_partial_solve_wit_2.

End VC_Correct.
