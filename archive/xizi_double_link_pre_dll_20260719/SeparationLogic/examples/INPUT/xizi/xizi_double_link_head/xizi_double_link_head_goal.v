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
Require Import SimpleC.EE.INPUT.xizi.xizi_double_link_head.xizi_double_link_head_lib.
Local Open Scope sac.

(*----- Function xizi_double_link_head -----*)

Definition xizi_double_link_head_safety_wit_1 := 
forall (linklist_pre: Z) (last: Z) (first: Z) (nodes: (@list Z)) (PreH1 : (first = linklist_pre)) (PreH2 : (first = (xizi_dll_first_value (linklist_pre) (nodes)))) ,
  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first linklist_pre linklist_pre last nodes )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_double_link_head_return_wit_1 := 
(
forall (linklist_pre: Z) (last: Z) (first: Z) (nodes: (@list Z)) (PreH1 : (first = linklist_pre)) (PreH2 : (first = (xizi_dll_first_value (linklist_pre) (nodes)))) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first linklist_pre linklist_pre last nodes )
|--
  “ (0 = (xizi_dll_head_value (nodes))) ” 
  &&  “ (first = (xizi_dll_first_value (linklist_pre) (nodes))) ”
  &&  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first linklist_pre linklist_pre last nodes )
) \/
(
forall (linklist_pre: Z) (last: Z) (first: Z) (nodes: (@list Z)) (PreH1 : (first = linklist_pre)) (PreH2 : (first = (xizi_dll_first_value (linklist_pre) (nodes)))) ,
  (xizi_dllseg first linklist_pre linklist_pre last nodes )
|--
  “ (0 = (xizi_dll_head_value (nodes))) ”
  &&  (xizi_dllseg first linklist_pre linklist_pre last nodes )
).

Definition xizi_double_link_head_return_wit_1_split_goal_1 := 
forall (linklist_pre: Z) (last: Z) (first: Z) (nodes: (@list Z)) (PreH1 : (first = linklist_pre)) (PreH2 : (first = (xizi_dll_first_value (linklist_pre) (nodes)))) ,
  (xizi_dllseg first linklist_pre linklist_pre last nodes )
|--
  “ (0 = (xizi_dll_head_value (nodes))) ”
.

Definition xizi_double_link_head_return_wit_1_split_goal_spatial := 
forall (linklist_pre: Z) (last: Z) (first: Z) (nodes: (@list Z)) (PreH1 : (first = linklist_pre)) (PreH2 : (first = (xizi_dll_first_value (linklist_pre) (nodes)))) ,
  (xizi_dllseg first linklist_pre linklist_pre last nodes )
|--
  (xizi_dllseg first linklist_pre linklist_pre last nodes )
.

Definition xizi_double_link_head_return_wit_2 := 
(
forall (linklist_pre: Z) (last: Z) (first: Z) (nodes: (@list Z)) (PreH1 : (first <> linklist_pre)) (PreH2 : (first = (xizi_dll_first_value (linklist_pre) (nodes)))) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first linklist_pre linklist_pre last nodes )
|--
  “ (first = (xizi_dll_head_value (nodes))) ” 
  &&  “ (first = (xizi_dll_first_value (linklist_pre) (nodes))) ”
  &&  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first linklist_pre linklist_pre last nodes )
) \/
(
forall (linklist_pre: Z) (last: Z) (first: Z) (nodes: (@list Z)) (PreH1 : (first <> linklist_pre)) (PreH2 : (first = (xizi_dll_first_value (linklist_pre) (nodes)))) ,
  (xizi_dllseg first linklist_pre linklist_pre last nodes )
|--
  “ (first = (xizi_dll_head_value (nodes))) ”
  &&  (xizi_dllseg first linklist_pre linklist_pre last nodes )
).

Definition xizi_double_link_head_return_wit_2_split_goal_1 := 
forall (linklist_pre: Z) (last: Z) (first: Z) (nodes: (@list Z)) (PreH1 : (first <> linklist_pre)) (PreH2 : (first = (xizi_dll_first_value (linklist_pre) (nodes)))) ,
  (xizi_dllseg first linklist_pre linklist_pre last nodes )
|--
  “ (first = (xizi_dll_head_value (nodes))) ”
.

Definition xizi_double_link_head_return_wit_2_split_goal_spatial := 
forall (linklist_pre: Z) (last: Z) (first: Z) (nodes: (@list Z)) (PreH1 : (first <> linklist_pre)) (PreH2 : (first = (xizi_dll_first_value (linklist_pre) (nodes)))) ,
  (xizi_dllseg first linklist_pre linklist_pre last nodes )
|--
  (xizi_dllseg first linklist_pre linklist_pre last nodes )
.

Module Type VC_Correct.


Axiom proof_of_xizi_double_link_head_safety_wit_1 : xizi_double_link_head_safety_wit_1.
Axiom proof_of_xizi_double_link_head_return_wit_1 : xizi_double_link_head_return_wit_1.
Axiom proof_of_xizi_double_link_head_return_wit_2 : xizi_double_link_head_return_wit_2.

End VC_Correct.
