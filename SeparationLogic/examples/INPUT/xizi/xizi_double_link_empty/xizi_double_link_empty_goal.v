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
Require Import SimpleC.EE.INPUT.xizi.xizi_double_link_empty.xizi_double_link_empty_lib.
Local Open Scope sac.

(*----- Function xizi_double_link_empty -----*)

Definition xizi_double_link_empty_entail_wit_1 := 
(
forall (linklist_pre: Z) (head: Z) (l: (@list Z)) (PreH1 : (linklist_pre = head)) (PreH2 : (head <> 0)) ,
  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  (xizi_dll head l )
|--
  EX (last: Z)  (first: Z) ,
  ((( &( "linklist" ) )) # Ptr  |-> head)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first head head last l )
) \/
(
forall (linklist_pre: Z) (head: Z) (l: (@list Z)) (PreH1 : (linklist_pre = head)) (PreH2 : (head <> 0)) ,
  (xizi_dll head l )
|--
  EX (last: Z)  (first: Z) ,
  “ (linklist_pre = head) ”
  &&  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first head head last l )
).

Definition xizi_double_link_empty_return_wit_1 := 
(
forall (head: Z) (l: (@list Z)) (first: Z) (last: Z) (PreH1 : (first <> head)) ,
  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first head head last l )
|--
  “ ((l = (@nil Z)) -> (0 = 1)) ” 
  &&  “ ((l <> (@nil Z)) -> (0 = 0)) ”
  &&  (xizi_dll head l )
) \/
(
forall (head: Z) (l: (@list Z)) (first: Z) (last: Z) (PreH1 : (first <> head)) ,
  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first head head last l )
|--
  “ ((l = (@nil Z)) -> (0 = 1)) ”
  &&  (xizi_dll head l )
).

Definition xizi_double_link_empty_return_wit_1_split_goal_1 := 
forall (head: Z) (l: (@list Z)) (first: Z) (last: Z) (PreH1 : (first <> head)) ,
  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first head head last l )
|--
  “ ((l = (@nil Z)) -> (0 = 1)) ”
.

Definition xizi_double_link_empty_return_wit_1_split_goal_spatial := 
forall (head: Z) (l: (@list Z)) (first: Z) (last: Z) (PreH1 : (first <> head)) ,
  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first head head last l )
|--
  (xizi_dll head l )
.

Definition xizi_double_link_empty_return_wit_2 := 
(
forall (head: Z) (l: (@list Z)) (first: Z) (last: Z) (PreH1 : (first = head)) ,
  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first head head last l )
|--
  “ ((l = (@nil Z)) -> (1 = 1)) ” 
  &&  “ ((l <> (@nil Z)) -> (1 = 0)) ”
  &&  (xizi_dll head l )
) \/
(
forall (head: Z) (l: (@list Z)) (first: Z) (last: Z) (PreH1 : (first = head)) ,
  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first head head last l )
|--
  “ ((l <> (@nil Z)) -> (1 = 0)) ”
  &&  (xizi_dll head l )
).

Definition xizi_double_link_empty_return_wit_2_split_goal_1 := 
forall (head: Z) (l: (@list Z)) (first: Z) (last: Z) (PreH1 : (first = head)) ,
  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first head head last l )
|--
  “ ((l <> (@nil Z)) -> (1 = 0)) ”
.

Definition xizi_double_link_empty_return_wit_2_split_goal_spatial := 
forall (head: Z) (l: (@list Z)) (first: Z) (last: Z) (PreH1 : (first = head)) ,
  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first head head last l )
|--
  (xizi_dll head l )
.

Module Type VC_Correct.


Axiom proof_of_xizi_double_link_empty_entail_wit_1 : xizi_double_link_empty_entail_wit_1.
Axiom proof_of_xizi_double_link_empty_return_wit_1 : xizi_double_link_empty_return_wit_1.
Axiom proof_of_xizi_double_link_empty_return_wit_2 : xizi_double_link_empty_return_wit_2.

End VC_Correct.
