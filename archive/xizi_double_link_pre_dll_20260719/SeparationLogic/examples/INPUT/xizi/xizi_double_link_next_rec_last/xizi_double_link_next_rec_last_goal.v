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
Require Import
      SimpleC.EE.INPUT.xizi.xizi_double_link_next_rec_last.xizi_double_link_next_rec_last_lib.
Local Open Scope sac.

(*----- Function xizi_double_link_next_rec_last -----*)

Definition xizi_double_link_next_rec_last_safety_wit_1 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (prefix: (@list Z)) (first: Z) (prev: Z) (PreH1 : (linklist_pre <> 0)) (PreH2 : (linklist_node_pre <> linklist_pre)) ,
  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  ((( &( "linklist_node" ) )) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg first linklist_node_pre linklist_pre prev prefix )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_pre)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_double_link_next_rec_last_entail_wit_1 := 
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (prefix: (@list Z)) ,
  (xizi_dll_last linklist_pre linklist_node_pre prefix )
|--
  EX (prev: Z)  (first: Z) ,
  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_node_pre <> linklist_pre) ”
  &&  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg first linklist_node_pre linklist_pre prev prefix )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_pre)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
) \/
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (prefix: (@list Z)) ,
  (xizi_dll_last linklist_pre linklist_node_pre prefix )
|--
  EX (prev: Z)  (first: Z) ,
  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_node_pre <> linklist_pre) ”
  &&  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg first linklist_node_pre linklist_pre prev prefix )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_pre)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
).

Definition xizi_double_link_next_rec_last_return_wit_1 := 
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (prefix: (@list Z)) (first: Z) (prev: Z) (PreH1 : (linklist_pre <> 0)) (PreH2 : (linklist_node_pre <> linklist_pre)) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg first linklist_node_pre linklist_pre prev prefix )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_pre)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
|--
  “ (0 = 0) ”
  &&  (xizi_dll_last linklist_pre linklist_node_pre prefix )
) \/
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (prefix: (@list Z)) (first: Z) (prev: Z) (PreH1 : (linklist_pre <> 0)) (PreH2 : (linklist_node_pre <> linklist_pre)) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg first linklist_node_pre linklist_pre prev prefix )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_pre)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
|--
  (xizi_dll_last linklist_pre linklist_node_pre prefix )
).

Definition xizi_double_link_next_rec_last_return_wit_1_split_goal_spatial := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (prefix: (@list Z)) (first: Z) (prev: Z) (PreH1 : (linklist_pre <> 0)) (PreH2 : (linklist_node_pre <> linklist_pre)) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg first linklist_node_pre linklist_pre prev prefix )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_pre)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
|--
  (xizi_dll_last linklist_pre linklist_node_pre prefix )
.

Module Type VC_Correct.


Axiom proof_of_xizi_double_link_next_rec_last_safety_wit_1 : xizi_double_link_next_rec_last_safety_wit_1.
Axiom proof_of_xizi_double_link_next_rec_last_entail_wit_1 : xizi_double_link_next_rec_last_entail_wit_1.
Axiom proof_of_xizi_double_link_next_rec_last_return_wit_1 : xizi_double_link_next_rec_last_return_wit_1.

End VC_Correct.
