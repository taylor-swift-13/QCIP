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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_remove_node.source Require Import xizi_double_link_remove_node_lib.
Local Open Scope sac.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_strategy_goal.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_strategy_proof.

(*----- Function DoubleLinkListRmNode -----*)

Definition DoubleLinkListRmNode_return_wit_1 := 
(
forall (linklist_node_pre: Z) (suffix_strong_spec: (@list Z)) (prefix_strong_spec: (@list Z)) (node_prev_strong_spec: Z) (node_next_strong_spec: Z) (head_strong_spec: Z) (dispatch_case_strong_spec: Z) (PreH1 : (dispatch_case_strong_spec = 0)) (PreH2 : (linklist_node_pre <> 0)) ,
  (xizi_dllseg_shift head_strong_spec node_prev_strong_spec prefix_strong_spec )
  **  ((&((node_prev_strong_spec)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next_strong_spec)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  ((&((node_next_strong_spec)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev_strong_spec)
  **  (xizi_dllseg_shift_rev node_next_strong_spec head_strong_spec suffix_strong_spec )
|--
  “ (dispatch_case_strong_spec = 0) ”
  &&  (xizi_dll head_strong_spec (app (prefix_strong_spec) (suffix_strong_spec)) )
  **  (xizi_dll linklist_node_pre (@nil Z) )
) \/
(
forall (linklist_node_pre: Z) (suffix_strong_spec: (@list Z)) (prefix_strong_spec: (@list Z)) (node_prev_strong_spec: Z) (node_next_strong_spec: Z) (head_strong_spec: Z) (dispatch_case_strong_spec: Z) (PreH1 : (dispatch_case_strong_spec = 0)) (PreH2 : (linklist_node_pre <> 0)) ,
  (xizi_dllseg_shift head_strong_spec node_prev_strong_spec prefix_strong_spec )
  **  ((&((node_prev_strong_spec)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next_strong_spec)
  **  ((&((node_next_strong_spec)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev_strong_spec)
  **  (xizi_dllseg_shift_rev node_next_strong_spec head_strong_spec suffix_strong_spec )
|--
  EX (last: Z)  (first: Z) ,
  “ (head_strong_spec <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ (dispatch_case_strong_spec = 0) ”
  &&  (xizi_dllseg first head_strong_spec head_strong_spec last (app (prefix_strong_spec) (suffix_strong_spec)) )
  **  ((&((head_strong_spec)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  ((&((head_strong_spec)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
).

Definition DoubleLinkListRmNode_return_wit_2 := 
forall (linklist_node_pre: Z) (dispatch_case_strong_spec: Z) (PreH1 : (dispatch_case_strong_spec = 1)) (PreH2 : (linklist_node_pre <> 0)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
|--
  “ (dispatch_case_strong_spec = 1) ”
  &&  (xizi_dll linklist_node_pre (@nil Z) )
.

Definition DoubleLinkListRmNode_derive_remove_self_loop_spec_by_strong_spec := 
forall (linklist_node_pre: Z) ,
  (xizi_dll linklist_node_pre nil )
|--
EX (dispatch_case_strong_spec: Z) (head_strong_spec: Z) (node_next_strong_spec: Z) (node_prev_strong_spec: Z) (prefix_strong_spec: (@list Z)) (suffix_strong_spec: (@list Z)) ,
  ((“ (dispatch_case_strong_spec = 0) ” 
  &&  “ (linklist_node_pre <> 0) ”
  &&  (xizi_dllseg_shift head_strong_spec node_prev_strong_spec prefix_strong_spec )
  **  ((&((node_prev_strong_spec)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next_strong_spec)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev_strong_spec)
  **  ((&((node_next_strong_spec)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg_shift_rev node_next_strong_spec head_strong_spec suffix_strong_spec ))
  ||
  (“ (dispatch_case_strong_spec = 1) ” 
  &&  “ (linklist_node_pre <> 0) ”
  &&  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)))
  **
  (((“ (dispatch_case_strong_spec = 0) ”
  &&  (xizi_dll head_strong_spec (app (prefix_strong_spec) (suffix_strong_spec)) )
  **  (xizi_dll linklist_node_pre nil ))
  ||
  (“ (dispatch_case_strong_spec = 1) ”
  &&  (xizi_dll linklist_node_pre nil )))
  -*
  ((xizi_dll linklist_node_pre nil )))
.

Definition DoubleLinkListRmNode_derive_remove_tail_spec_by_strong_spec := 
forall (linklist_node_pre: Z) (prefix_remove_tail_spec: (@list Z)) (head_remove_tail_spec: Z) ,
  (xizi_dll head_remove_tail_spec (app (prefix_remove_tail_spec) ((cons (linklist_node_pre) (nil)))) )
|--
EX (dispatch_case_strong_spec: Z) (head_strong_spec: Z) (node_next_strong_spec: Z) (node_prev_strong_spec: Z) (prefix_strong_spec: (@list Z)) (suffix_strong_spec: (@list Z)) ,
  ((“ (dispatch_case_strong_spec = 0) ” 
  &&  “ (linklist_node_pre <> 0) ”
  &&  (xizi_dllseg_shift head_strong_spec node_prev_strong_spec prefix_strong_spec )
  **  ((&((node_prev_strong_spec)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next_strong_spec)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev_strong_spec)
  **  ((&((node_next_strong_spec)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg_shift_rev node_next_strong_spec head_strong_spec suffix_strong_spec ))
  ||
  (“ (dispatch_case_strong_spec = 1) ” 
  &&  “ (linklist_node_pre <> 0) ”
  &&  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)))
  **
  (((“ (dispatch_case_strong_spec = 0) ”
  &&  (xizi_dll head_strong_spec (app (prefix_strong_spec) (suffix_strong_spec)) )
  **  (xizi_dll linklist_node_pre nil ))
  ||
  (“ (dispatch_case_strong_spec = 1) ”
  &&  (xizi_dll linklist_node_pre nil )))
  -*
  ((xizi_dll head_remove_tail_spec prefix_remove_tail_spec )
  **  (xizi_dll linklist_node_pre nil )))
.

Definition DoubleLinkListRmNode_derive_remove_front_spec_by_strong_spec := 
forall (linklist_node_pre: Z) (suffix_remove_front_spec: (@list Z)) (head_remove_front_spec: Z) ,
  (xizi_dll head_remove_front_spec (cons (linklist_node_pre) (suffix_remove_front_spec)) )
|--
EX (dispatch_case_strong_spec: Z) (head_strong_spec: Z) (node_next_strong_spec: Z) (node_prev_strong_spec: Z) (prefix_strong_spec: (@list Z)) (suffix_strong_spec: (@list Z)) ,
  ((“ (dispatch_case_strong_spec = 0) ” 
  &&  “ (linklist_node_pre <> 0) ”
  &&  (xizi_dllseg_shift head_strong_spec node_prev_strong_spec prefix_strong_spec )
  **  ((&((node_prev_strong_spec)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next_strong_spec)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev_strong_spec)
  **  ((&((node_next_strong_spec)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg_shift_rev node_next_strong_spec head_strong_spec suffix_strong_spec ))
  ||
  (“ (dispatch_case_strong_spec = 1) ” 
  &&  “ (linklist_node_pre <> 0) ”
  &&  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)))
  **
  (((“ (dispatch_case_strong_spec = 0) ”
  &&  (xizi_dll head_strong_spec (app (prefix_strong_spec) (suffix_strong_spec)) )
  **  (xizi_dll linklist_node_pre nil ))
  ||
  (“ (dispatch_case_strong_spec = 1) ”
  &&  (xizi_dll linklist_node_pre nil )))
  -*
  ((xizi_dll head_remove_front_spec suffix_remove_front_spec )
  **  (xizi_dll linklist_node_pre nil )))
.

Definition DoubleLinkListRmNode_derive_remove_member_spec_by_strong_spec := 
forall (linklist_node_pre: Z) (nodes_remove_member_spec: (@list Z)) (head_remove_member_spec: Z) ,
  “ (In linklist_node_pre nodes_remove_member_spec ) ”
  &&  (xizi_dll head_remove_member_spec nodes_remove_member_spec )
|--
EX (dispatch_case_strong_spec: Z) (head_strong_spec: Z) (node_next_strong_spec: Z) (node_prev_strong_spec: Z) (prefix_strong_spec: (@list Z)) (suffix_strong_spec: (@list Z)) ,
  ((“ (dispatch_case_strong_spec = 0) ” 
  &&  “ (linklist_node_pre <> 0) ”
  &&  (xizi_dllseg_shift head_strong_spec node_prev_strong_spec prefix_strong_spec )
  **  ((&((node_prev_strong_spec)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next_strong_spec)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev_strong_spec)
  **  ((&((node_next_strong_spec)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg_shift_rev node_next_strong_spec head_strong_spec suffix_strong_spec ))
  ||
  (“ (dispatch_case_strong_spec = 1) ” 
  &&  “ (linklist_node_pre <> 0) ”
  &&  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)))
  **
  (((“ (dispatch_case_strong_spec = 0) ”
  &&  (xizi_dll head_strong_spec (app (prefix_strong_spec) (suffix_strong_spec)) )
  **  (xizi_dll linklist_node_pre nil ))
  ||
  (“ (dispatch_case_strong_spec = 1) ”
  &&  (xizi_dll linklist_node_pre nil )))
  -*
  ((xizi_dll head_remove_member_spec (xizi_dll_remove_first (linklist_node_pre) (nodes_remove_member_spec)) )
  **  (xizi_dll linklist_node_pre nil )))
.

Module Type VC_Correct.

Include xizi_double_link_Strategy_Correct.

Axiom proof_of_DoubleLinkListRmNode_return_wit_1 : DoubleLinkListRmNode_return_wit_1.
Axiom proof_of_DoubleLinkListRmNode_return_wit_2 : DoubleLinkListRmNode_return_wit_2.
Axiom proof_of_DoubleLinkListRmNode_derive_remove_self_loop_spec_by_strong_spec : DoubleLinkListRmNode_derive_remove_self_loop_spec_by_strong_spec.
Axiom proof_of_DoubleLinkListRmNode_derive_remove_tail_spec_by_strong_spec : DoubleLinkListRmNode_derive_remove_tail_spec_by_strong_spec.
Axiom proof_of_DoubleLinkListRmNode_derive_remove_front_spec_by_strong_spec : DoubleLinkListRmNode_derive_remove_front_spec_by_strong_spec.
Axiom proof_of_DoubleLinkListRmNode_derive_remove_member_spec_by_strong_spec : DoubleLinkListRmNode_derive_remove_member_spec_by_strong_spec.

End VC_Correct.
