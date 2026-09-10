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
forall (linklist_head_pre: Z) (PreH1 : (linklist_head_pre <> 0)) ,
  ((&((linklist_head_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_head_pre)
  **  ((&((linklist_head_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_head_pre)
|--
  (xizi_dll linklist_head_pre (@nil Z) )
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
forall (linklist_node_pre: Z) (linklist_head_pre: Z) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (linklist_head_pre <> 0)) ,
  (xizi_dll linklist_head_pre (@nil Z) )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |->_)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
|--
  EX (nodes: (@list Z)) ,
  “ (nodes = (@nil Z)) ”
  &&  (xizi_dll linklist_head_pre nodes )
  **  (xizi_dll_node linklist_node_pre )
.

Definition xizi_double_link_init_then_insert_before_return_wit_1 := 
(
forall (linklist_node_pre: Z) (linklist_head_pre: Z) (nodes: (@list Z)) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (linklist_head_pre <> 0)) (PreH3 : (nodes = (@nil Z))) ,
  (xizi_dll linklist_head_pre (app (nodes) ((cons (linklist_node_pre) ((@nil Z))))) )
|--
  (xizi_dll linklist_head_pre (cons (linklist_node_pre) ((@nil Z))) )
) \/
(
forall (linklist_node_pre: Z) (linklist_head_pre: Z) (nodes: (@list Z)) (first: Z) (last: Z) (PreH1 : (linklist_head_pre <> 0)) (PreH2 : (linklist_node_pre <> 0)) (PreH3 : (linklist_head_pre <> 0)) (PreH4 : (nodes = (@nil Z))) ,
  (xizi_dllseg first linklist_head_pre linklist_head_pre last (app (nodes) ((cons (linklist_node_pre) ((@nil Z))))) )
|--
  (xizi_dllseg first linklist_head_pre linklist_head_pre last (cons (linklist_node_pre) ((@nil Z))) )
).

Definition xizi_double_link_init_then_insert_before_return_wit_1_split_goal_spatial := 
forall (linklist_node_pre: Z) (linklist_head_pre: Z) (nodes: (@list Z)) (first: Z) (last: Z) (PreH1 : (linklist_head_pre <> 0)) (PreH2 : (linklist_node_pre <> 0)) (PreH3 : (linklist_head_pre <> 0)) (PreH4 : (nodes = (@nil Z))) ,
  (xizi_dllseg first linklist_head_pre linklist_head_pre last (app (nodes) ((cons (linklist_node_pre) ((@nil Z))))) )
|--
  (xizi_dllseg first linklist_head_pre linklist_head_pre last (cons (linklist_node_pre) ((@nil Z))) )
.

Definition xizi_double_link_init_then_insert_before_partial_solve_wit_1 := 
forall (linklist_node_pre: Z) (linklist_head_pre: Z) ,
  (xizi_dll_node linklist_head_pre )
  **  (xizi_dll_node linklist_node_pre )
|--
  “ (linklist_node_pre <> 0) ” 
  &&  “ (linklist_head_pre <> 0) ”
  &&  (xizi_dll_node linklist_head_pre )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |->_)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |->_)
.

Definition xizi_double_link_init_then_insert_before_partial_solve_wit_2 := 
forall (linklist_node_pre: Z) (linklist_head_pre: Z) (nodes: (@list Z)) (PreH1 : (nodes = (@nil Z))) ,
  (xizi_dll linklist_head_pre nodes )
  **  (xizi_dll_node linklist_node_pre )
|--
  “ (linklist_node_pre <> 0) ” 
  &&  “ (linklist_head_pre <> 0) ” 
  &&  “ (nodes = (@nil Z)) ”
  &&  (xizi_dll linklist_head_pre nodes )
  **  (xizi_dll_node linklist_node_pre )
.

Definition DoubleLinkListInsertNodeBefore_derive_sentinel_case_by_dispatch_case := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_sentinel_case: (@list Z)) ,
  (xizi_dll linklist_pre nodes_sentinel_case )
  **  (xizi_dll_node linklist_node_pre )
|--
EX (head_dispatch_case: Z) (nodes_dispatch_case: (@list Z)) ,
  (“ (xizi_double_link_insert_before_anchor head_dispatch_case nodes_dispatch_case linklist_pre ) ”
  &&  (xizi_dll head_dispatch_case nodes_dispatch_case )
  **  (xizi_dll_node linklist_node_pre ))
  **
  (((xizi_dll head_dispatch_case (xizi_double_link_insert_before_nodes (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) ))
  -*
  ((xizi_dll linklist_pre (app (nodes_sentinel_case) ((cons (linklist_node_pre) (nil)))) )))
.

Definition DoubleLinkListInsertNodeBefore_derive_member_case_by_dispatch_case := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_member_case: (@list Z)) (head_member_case: Z) ,
  “ (In linklist_pre nodes_member_case ) ”
  &&  (xizi_dll head_member_case nodes_member_case )
  **  (xizi_dll_node linklist_node_pre )
|--
EX (head_dispatch_case: Z) (nodes_dispatch_case: (@list Z)) ,
  (“ (xizi_double_link_insert_before_anchor head_dispatch_case nodes_dispatch_case linklist_pre ) ”
  &&  (xizi_dll head_dispatch_case nodes_dispatch_case )
  **  (xizi_dll_node linklist_node_pre ))
  **
  (((xizi_dll head_dispatch_case (xizi_double_link_insert_before_nodes (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) ))
  -*
  ((xizi_dll head_member_case (xizi_double_link_insert_before_nodes (nodes_member_case) (linklist_pre) (linklist_node_pre)) )))
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
