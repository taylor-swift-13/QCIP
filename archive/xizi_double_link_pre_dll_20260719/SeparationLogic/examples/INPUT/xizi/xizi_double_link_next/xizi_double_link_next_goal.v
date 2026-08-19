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
Require Import SimpleC.EE.INPUT.xizi.xizi_double_link_next.xizi_double_link_next_lib.
Local Open Scope sac.

(*----- Function xizi_double_link_next -----*)

Definition xizi_double_link_next_safety_wit_1 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (last: Z) (next: Z) (before: Z) (first: Z) (suffix: (@list Z)) (prefix: (@list Z)) (PreH1 : (next = linklist_pre)) (PreH2 : (linklist_pre <> 0)) (PreH3 : (linklist_node_pre <> 0)) (PreH4 : (xizi_dll_suffix linklist_pre next suffix )) ,
  ((( &( "linklist_node" ) )) # Ptr  |-> linklist_node_pre)
  **  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before)
  **  (xizi_dllseg first linklist_pre linklist_node_pre before prefix )
  **  (xizi_dllseg next linklist_node_pre linklist_pre last suffix )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_double_link_next_return_wit_1 := 
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (last: Z) (next: Z) (before: Z) (first: Z) (suffix: (@list Z)) (prefix: (@list Z)) (PreH1 : (next = linklist_pre)) (PreH2 : (linklist_pre <> 0)) (PreH3 : (linklist_node_pre <> 0)) (PreH4 : (xizi_dll_suffix linklist_pre next suffix )) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before)
  **  (xizi_dllseg first linklist_pre linklist_node_pre before prefix )
  **  (xizi_dllseg next linklist_node_pre linklist_pre last suffix )
|--
  “ (0 = (xizi_dll_next_result (suffix))) ” 
  &&  “ (xizi_dll_suffix linklist_pre next suffix ) ”
  &&  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before)
  **  (xizi_dllseg first linklist_pre linklist_node_pre before prefix )
  **  (xizi_dllseg next linklist_node_pre linklist_pre last suffix )
) \/
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (last: Z) (next: Z) (before: Z) (first: Z) (suffix: (@list Z)) (prefix: (@list Z)) (PreH1 : (next = linklist_pre)) (PreH2 : (linklist_pre <> 0)) (PreH3 : (linklist_node_pre <> 0)) (PreH4 : (xizi_dll_suffix linklist_pre next suffix )) ,
  (xizi_dllseg first linklist_pre linklist_node_pre before prefix )
  **  (xizi_dllseg next linklist_node_pre linklist_pre last suffix )
|--
  “ (0 = (xizi_dll_next_result (suffix))) ”
  &&  (xizi_dllseg first linklist_pre linklist_node_pre before prefix )
  **  (xizi_dllseg next linklist_node_pre linklist_pre last suffix )
).

Definition xizi_double_link_next_return_wit_1_split_goal_1 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (last: Z) (next: Z) (before: Z) (first: Z) (suffix: (@list Z)) (prefix: (@list Z)) (PreH1 : (next = linklist_pre)) (PreH2 : (linklist_pre <> 0)) (PreH3 : (linklist_node_pre <> 0)) (PreH4 : (xizi_dll_suffix linklist_pre next suffix )) ,
  (xizi_dllseg first linklist_pre linklist_node_pre before prefix )
  **  (xizi_dllseg next linklist_node_pre linklist_pre last suffix )
|--
  “ (0 = (xizi_dll_next_result (suffix))) ”
.

Definition xizi_double_link_next_return_wit_1_split_goal_spatial := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (last: Z) (next: Z) (before: Z) (first: Z) (suffix: (@list Z)) (prefix: (@list Z)) (PreH1 : (next = linklist_pre)) (PreH2 : (linklist_pre <> 0)) (PreH3 : (linklist_node_pre <> 0)) (PreH4 : (xizi_dll_suffix linklist_pre next suffix )) ,
  (xizi_dllseg first linklist_pre linklist_node_pre before prefix )
  **  (xizi_dllseg next linklist_node_pre linklist_pre last suffix )
|--
  (xizi_dllseg first linklist_pre linklist_node_pre before prefix )
  **  (xizi_dllseg next linklist_node_pre linklist_pre last suffix )
.

Definition xizi_double_link_next_return_wit_2 := 
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (last: Z) (next: Z) (before: Z) (first: Z) (suffix: (@list Z)) (prefix: (@list Z)) (PreH1 : (next <> linklist_pre)) (PreH2 : (linklist_pre <> 0)) (PreH3 : (linklist_node_pre <> 0)) (PreH4 : (xizi_dll_suffix linklist_pre next suffix )) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before)
  **  (xizi_dllseg first linklist_pre linklist_node_pre before prefix )
  **  (xizi_dllseg next linklist_node_pre linklist_pre last suffix )
|--
  “ (next = (xizi_dll_next_result (suffix))) ” 
  &&  “ (xizi_dll_suffix linklist_pre next suffix ) ”
  &&  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> before)
  **  (xizi_dllseg first linklist_pre linklist_node_pre before prefix )
  **  (xizi_dllseg next linklist_node_pre linklist_pre last suffix )
) \/
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (last: Z) (next: Z) (before: Z) (first: Z) (suffix: (@list Z)) (prefix: (@list Z)) (PreH1 : (next <> linklist_pre)) (PreH2 : (linklist_pre <> 0)) (PreH3 : (linklist_node_pre <> 0)) (PreH4 : (xizi_dll_suffix linklist_pre next suffix )) ,
  (xizi_dllseg first linklist_pre linklist_node_pre before prefix )
  **  (xizi_dllseg next linklist_node_pre linklist_pre last suffix )
|--
  “ (next = (xizi_dll_next_result (suffix))) ”
  &&  (xizi_dllseg first linklist_pre linklist_node_pre before prefix )
  **  (xizi_dllseg next linklist_node_pre linklist_pre last suffix )
).

Definition xizi_double_link_next_return_wit_2_split_goal_1 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (last: Z) (next: Z) (before: Z) (first: Z) (suffix: (@list Z)) (prefix: (@list Z)) (PreH1 : (next <> linklist_pre)) (PreH2 : (linklist_pre <> 0)) (PreH3 : (linklist_node_pre <> 0)) (PreH4 : (xizi_dll_suffix linklist_pre next suffix )) ,
  (xizi_dllseg first linklist_pre linklist_node_pre before prefix )
  **  (xizi_dllseg next linklist_node_pre linklist_pre last suffix )
|--
  “ (next = (xizi_dll_next_result (suffix))) ”
.

Definition xizi_double_link_next_return_wit_2_split_goal_spatial := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (last: Z) (next: Z) (before: Z) (first: Z) (suffix: (@list Z)) (prefix: (@list Z)) (PreH1 : (next <> linklist_pre)) (PreH2 : (linklist_pre <> 0)) (PreH3 : (linklist_node_pre <> 0)) (PreH4 : (xizi_dll_suffix linklist_pre next suffix )) ,
  (xizi_dllseg first linklist_pre linklist_node_pre before prefix )
  **  (xizi_dllseg next linklist_node_pre linklist_pre last suffix )
|--
  (xizi_dllseg first linklist_pre linklist_node_pre before prefix )
  **  (xizi_dllseg next linklist_node_pre linklist_pre last suffix )
.

Module Type VC_Correct.


Axiom proof_of_xizi_double_link_next_safety_wit_1 : xizi_double_link_next_safety_wit_1.
Axiom proof_of_xizi_double_link_next_return_wit_1 : xizi_double_link_next_return_wit_1.
Axiom proof_of_xizi_double_link_next_return_wit_2 : xizi_double_link_next_return_wit_2.

End VC_Correct.
