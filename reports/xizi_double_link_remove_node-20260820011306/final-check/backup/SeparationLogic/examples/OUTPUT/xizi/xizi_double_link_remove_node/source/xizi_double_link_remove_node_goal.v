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

(*----- Function xizi_double_link_remove_node -----*)

Definition xizi_double_link_remove_node_entail_wit_1 := 
(
forall (linklist_node_pre: Z) (suffix_strong_spec: (@list Z)) (prefix_strong_spec: (@list Z)) (nodes_strong_spec: (@list Z)) (head_strong_spec: Z) (PreH1 : (nodes_strong_spec = (app (prefix_strong_spec) ((cons (linklist_node_pre) (suffix_strong_spec)))))) ,
  (xizi_dll head_strong_spec nodes_strong_spec )
|--
  EX (node_next: Z)  (node_prev: Z) ,
  “ (linklist_node_pre <> 0) ”
  &&  (xizi_dllseg_shift head_strong_spec node_prev prefix_strong_spec )
  **  ((&((node_prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev)
  **  ((&((node_next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg_shift_rev node_next head_strong_spec suffix_strong_spec )
) \/
(
forall (linklist_node_pre: Z) (suffix_strong_spec: (@list Z)) (prefix_strong_spec: (@list Z)) (nodes_strong_spec: (@list Z)) (head_strong_spec: Z) (first: Z) (last: Z) (PreH1 : (head_strong_spec <> 0)) (PreH2 : (nodes_strong_spec = (app (prefix_strong_spec) ((cons (linklist_node_pre) (suffix_strong_spec)))))) ,
  (xizi_dllseg first head_strong_spec head_strong_spec last nodes_strong_spec )
  **  ((&((head_strong_spec)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  ((&((head_strong_spec)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
|--
  EX (node_next: Z)  (node_prev: Z) ,
  “ (linklist_node_pre <> 0) ”
  &&  (xizi_dllseg_shift head_strong_spec node_prev prefix_strong_spec )
  **  ((&((node_prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev)
  **  ((&((node_next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg_shift_rev node_next head_strong_spec suffix_strong_spec )
).

Definition xizi_double_link_remove_node_return_wit_1 := 
(
forall (linklist_node_pre: Z) (suffix_strong_spec: (@list Z)) (prefix_strong_spec: (@list Z)) (head_strong_spec: Z) (node_next: Z) (node_prev: Z) (PreH1 : (linklist_node_pre <> 0)) ,
  (xizi_dllseg_shift head_strong_spec node_prev prefix_strong_spec )
  **  ((&((node_prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  ((&((node_next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev)
  **  (xizi_dllseg_shift_rev node_next head_strong_spec suffix_strong_spec )
|--
  (xizi_dll head_strong_spec (app (prefix_strong_spec) (suffix_strong_spec)) )
  **  (xizi_dll linklist_node_pre (@nil Z) )
) \/
(
forall (linklist_node_pre: Z) (suffix_strong_spec: (@list Z)) (prefix_strong_spec: (@list Z)) (head_strong_spec: Z) (node_next: Z) (node_prev: Z) (PreH1 : (linklist_node_pre <> 0)) ,
  (xizi_dllseg_shift head_strong_spec node_prev prefix_strong_spec )
  **  ((&((node_prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  ((&((node_next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev)
  **  (xizi_dllseg_shift_rev node_next head_strong_spec suffix_strong_spec )
|--
  EX (last: Z)  (first: Z) ,
  “ (head_strong_spec <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ”
  &&  (xizi_dllseg first head_strong_spec head_strong_spec last (app (prefix_strong_spec) (suffix_strong_spec)) )
  **  ((&((head_strong_spec)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  ((&((head_strong_spec)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
).

Definition xizi_double_link_remove_node_derive_remove_tail_spec_by_strong_spec := 
forall (linklist_node_pre: Z) (prefix_remove_tail_spec: (@list Z)) (head_remove_tail_spec: Z) ,
  (xizi_dll head_remove_tail_spec (app (prefix_remove_tail_spec) ((cons (linklist_node_pre) (nil)))) )
|--
EX (head_strong_spec: Z) (nodes_strong_spec: (@list Z)) (prefix_strong_spec: (@list Z)) (suffix_strong_spec: (@list Z)) ,
  (“ (nodes_strong_spec = (app (prefix_strong_spec) ((cons (linklist_node_pre) (suffix_strong_spec))))) ”
  &&  (xizi_dll head_strong_spec nodes_strong_spec ))
  **
  (((xizi_dll head_strong_spec (app (prefix_strong_spec) (suffix_strong_spec)) )
  **  (xizi_dll linklist_node_pre nil ))
  -*
  ((xizi_dll head_remove_tail_spec prefix_remove_tail_spec )
  **  (xizi_dll linklist_node_pre nil )))
.

Definition xizi_double_link_remove_node_derive_remove_front_spec_by_strong_spec := 
forall (linklist_node_pre: Z) (suffix_remove_front_spec: (@list Z)) (head_remove_front_spec: Z) ,
  (xizi_dll head_remove_front_spec (cons (linklist_node_pre) (suffix_remove_front_spec)) )
|--
EX (head_strong_spec: Z) (nodes_strong_spec: (@list Z)) (prefix_strong_spec: (@list Z)) (suffix_strong_spec: (@list Z)) ,
  (“ (nodes_strong_spec = (app (prefix_strong_spec) ((cons (linklist_node_pre) (suffix_strong_spec))))) ”
  &&  (xizi_dll head_strong_spec nodes_strong_spec ))
  **
  (((xizi_dll head_strong_spec (app (prefix_strong_spec) (suffix_strong_spec)) )
  **  (xizi_dll linklist_node_pre nil ))
  -*
  ((xizi_dll head_remove_front_spec suffix_remove_front_spec )
  **  (xizi_dll linklist_node_pre nil )))
.

Definition xizi_double_link_remove_node_derive_remove_member_spec_by_strong_spec := 
forall (linklist_node_pre: Z) (nodes_remove_member_spec: (@list Z)) (head_remove_member_spec: Z) ,
  “ (In linklist_node_pre nodes_remove_member_spec ) ”
  &&  (xizi_dll head_remove_member_spec nodes_remove_member_spec )
|--
EX (head_strong_spec: Z) (nodes_strong_spec: (@list Z)) (prefix_strong_spec: (@list Z)) (suffix_strong_spec: (@list Z)) ,
  (“ (nodes_strong_spec = (app (prefix_strong_spec) ((cons (linklist_node_pre) (suffix_strong_spec))))) ”
  &&  (xizi_dll head_strong_spec nodes_strong_spec ))
  **
  (((xizi_dll head_strong_spec (app (prefix_strong_spec) (suffix_strong_spec)) )
  **  (xizi_dll linklist_node_pre nil ))
  -*
  ((xizi_dll head_remove_member_spec (xizi_dll_remove_first (linklist_node_pre) (nodes_remove_member_spec)) )
  **  (xizi_dll linklist_node_pre nil )))
.

Module Type VC_Correct.

Include xizi_double_link_Strategy_Correct.

Axiom proof_of_xizi_double_link_remove_node_entail_wit_1 : xizi_double_link_remove_node_entail_wit_1.
Axiom proof_of_xizi_double_link_remove_node_return_wit_1 : xizi_double_link_remove_node_return_wit_1.
Axiom proof_of_xizi_double_link_remove_node_derive_remove_tail_spec_by_strong_spec : xizi_double_link_remove_node_derive_remove_tail_spec_by_strong_spec.
Axiom proof_of_xizi_double_link_remove_node_derive_remove_front_spec_by_strong_spec : xizi_double_link_remove_node_derive_remove_front_spec_by_strong_spec.
Axiom proof_of_xizi_double_link_remove_node_derive_remove_member_spec_by_strong_spec : xizi_double_link_remove_node_derive_remove_member_spec_by_strong_spec.

End VC_Correct.
