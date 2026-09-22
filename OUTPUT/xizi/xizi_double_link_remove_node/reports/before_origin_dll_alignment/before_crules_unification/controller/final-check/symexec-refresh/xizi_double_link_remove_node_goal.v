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

Definition DoubleLinkListRmNode_entail_wit_1 := 
(
forall (A: Type) (linklist_node_pre: Z) (suffix_strong_spec: (@list (@DLL.DL_Node A))) (prefix_strong_spec: (@list (@DLL.DL_Node A))) (nodes_strong_spec: (@list (@DLL.DL_Node A))) (removed_strong_spec: (@DLL.DL_Node A)) (head_strong_spec: Z) (storeA_strong_spec: (Z -> (A -> Assertion))) (PreH1 : ((DLL.getPtr (removed_strong_spec)) = linklist_node_pre)) (PreH2 : (nodes_strong_spec = (app (prefix_strong_spec) ((cons (removed_strong_spec) (suffix_strong_spec)))))) ,
  (XiziLocalDLL.store_dll storeA_strong_spec head_strong_spec nodes_strong_spec )
|--
  EX (node_next: Z)  (node_prev: Z) ,
  (XiziLocalDLL.dllseg_shift storeA_strong_spec head_strong_spec node_prev prefix_strong_spec )
  **  ((&((node_prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev)
  **  ((&((node_next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (XiziLocalDLL.dllseg_shift_rev storeA_strong_spec node_next head_strong_spec suffix_strong_spec )
  **  (storeA_strong_spec linklist_node_pre (DLL.getData (removed_strong_spec)) )
) \/
(
forall (A: Type) (linklist_node_pre: Z) (suffix_strong_spec: (@list (@DLL.DL_Node A))) (prefix_strong_spec: (@list (@DLL.DL_Node A))) (nodes_strong_spec: (@list (@DLL.DL_Node A))) (removed_strong_spec: (@DLL.DL_Node A)) (head_strong_spec: Z) (storeA_strong_spec: (Z -> (A -> Assertion))) (PreH1 : ((DLL.getPtr (removed_strong_spec)) = linklist_node_pre)) (PreH2 : (nodes_strong_spec = (app (prefix_strong_spec) ((cons (removed_strong_spec) (suffix_strong_spec)))))) ,
  (XiziLocalDLL.store_dll storeA_strong_spec head_strong_spec nodes_strong_spec )
|--
  EX (node_next: Z)  (node_prev: Z) ,
  (XiziLocalDLL.dllseg_shift storeA_strong_spec head_strong_spec node_prev prefix_strong_spec )
  **  ((&((node_prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev)
  **  ((&((node_next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (XiziLocalDLL.dllseg_shift_rev storeA_strong_spec node_next head_strong_spec suffix_strong_spec )
  **  (storeA_strong_spec linklist_node_pre (DLL.getData (removed_strong_spec)) )
).

Definition DoubleLinkListRmNode_return_wit_1 := 
(
forall (A: Type) (linklist_node_pre: Z) (suffix_strong_spec: (@list (@DLL.DL_Node A))) (prefix_strong_spec: (@list (@DLL.DL_Node A))) (removed_strong_spec: (@DLL.DL_Node A)) (head_strong_spec: Z) (storeA_strong_spec: (Z -> (A -> Assertion))) (node_next: Z) (node_prev: Z) ,
  (XiziLocalDLL.dllseg_shift storeA_strong_spec head_strong_spec node_prev prefix_strong_spec )
  **  ((&((node_prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  ((&((node_next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev)
  **  (XiziLocalDLL.dllseg_shift_rev storeA_strong_spec node_next head_strong_spec suffix_strong_spec )
  **  (storeA_strong_spec linklist_node_pre (DLL.getData (removed_strong_spec)) )
|--
  (XiziLocalDLL.store_dll storeA_strong_spec head_strong_spec (app (prefix_strong_spec) (suffix_strong_spec)) )
  **  (XiziLocalDLL.store_dll storeA_strong_spec linklist_node_pre (@nil (@DLL.DL_Node A)) )
  **  (storeA_strong_spec linklist_node_pre (DLL.getData (removed_strong_spec)) )
) \/
(
forall (A: Type) (linklist_node_pre: Z) (suffix_strong_spec: (@list (@DLL.DL_Node A))) (prefix_strong_spec: (@list (@DLL.DL_Node A))) (removed_strong_spec: (@DLL.DL_Node A)) (head_strong_spec: Z) (storeA_strong_spec: (Z -> (A -> Assertion))) (node_next: Z) (node_prev: Z) ,
  (XiziLocalDLL.dllseg_shift storeA_strong_spec head_strong_spec node_prev prefix_strong_spec )
  **  ((&((node_prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  ((&((node_next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev)
  **  (XiziLocalDLL.dllseg_shift_rev storeA_strong_spec node_next head_strong_spec suffix_strong_spec )
  **  (storeA_strong_spec linklist_node_pre (DLL.getData (removed_strong_spec)) )
|--
  (XiziLocalDLL.store_dll storeA_strong_spec head_strong_spec (app (prefix_strong_spec) (suffix_strong_spec)) )
  **  (XiziLocalDLL.store_dll storeA_strong_spec linklist_node_pre (@nil (@DLL.DL_Node A)) )
  **  (storeA_strong_spec linklist_node_pre (DLL.getData (removed_strong_spec)) )
).

Definition DoubleLinkListRmNode_return_wit_1_split_goal_spatial := 
forall (A: Type) (linklist_node_pre: Z) (suffix_strong_spec: (@list (@DLL.DL_Node A))) (prefix_strong_spec: (@list (@DLL.DL_Node A))) (removed_strong_spec: (@DLL.DL_Node A)) (head_strong_spec: Z) (storeA_strong_spec: (Z -> (A -> Assertion))) (node_next: Z) (node_prev: Z) ,
  (XiziLocalDLL.dllseg_shift storeA_strong_spec head_strong_spec node_prev prefix_strong_spec )
  **  ((&((node_prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  ((&((node_next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev)
  **  (XiziLocalDLL.dllseg_shift_rev storeA_strong_spec node_next head_strong_spec suffix_strong_spec )
  **  (storeA_strong_spec linklist_node_pre (DLL.getData (removed_strong_spec)) )
|--
  (XiziLocalDLL.store_dll storeA_strong_spec head_strong_spec (app (prefix_strong_spec) (suffix_strong_spec)) )
  **  (XiziLocalDLL.store_dll storeA_strong_spec linklist_node_pre (@nil (@DLL.DL_Node A)) )
  **  (storeA_strong_spec linklist_node_pre (DLL.getData (removed_strong_spec)) )
.

Definition DoubleLinkListRmNode_derive_remove_tail_spec_by_strong_spec := 
forall (A: Type) ,
forall (linklist_node_pre: Z) (prefix_remove_tail_spec: (@list (@DLL.DL_Node A))) (removed_remove_tail_spec: (@DLL.DL_Node A)) (head_remove_tail_spec: Z) (storeA_remove_tail_spec: (Z -> (A -> Assertion))) ,
  “ ((DLL.getPtr (removed_remove_tail_spec)) = linklist_node_pre) ”
  &&  (XiziLocalDLL.store_dll storeA_remove_tail_spec head_remove_tail_spec (app (prefix_remove_tail_spec) ((cons (removed_remove_tail_spec) (nil)))) )
|--
EX (A: Type) ,
EX (storeA_strong_spec: (Z -> (A -> Assertion))) (head_strong_spec: Z) (removed_strong_spec: (@DLL.DL_Node A)) (nodes_strong_spec: (@list (@DLL.DL_Node A))) (prefix_strong_spec: (@list (@DLL.DL_Node A))) (suffix_strong_spec: (@list (@DLL.DL_Node A))) ,
  (“ ((DLL.getPtr (removed_strong_spec)) = linklist_node_pre) ” 
  &&  “ (nodes_strong_spec = (app (prefix_strong_spec) ((cons (removed_strong_spec) (suffix_strong_spec))))) ”
  &&  (XiziLocalDLL.store_dll storeA_strong_spec head_strong_spec nodes_strong_spec ))
  **
  (((XiziLocalDLL.store_dll storeA_strong_spec head_strong_spec (app (prefix_strong_spec) (suffix_strong_spec)) )
  **  (XiziLocalDLL.store_dll storeA_strong_spec linklist_node_pre nil )
  **  (storeA_strong_spec linklist_node_pre (DLL.getData (removed_strong_spec)) ))
  -*
  ((XiziLocalDLL.store_dll storeA_remove_tail_spec head_remove_tail_spec prefix_remove_tail_spec )
  **  (XiziLocalDLL.store_dll storeA_remove_tail_spec linklist_node_pre nil )
  **  (storeA_remove_tail_spec linklist_node_pre (DLL.getData (removed_remove_tail_spec)) )))
.

Definition DoubleLinkListRmNode_derive_remove_front_spec_by_strong_spec := 
forall (A: Type) ,
forall (linklist_node_pre: Z) (suffix_remove_front_spec: (@list (@DLL.DL_Node A))) (removed_remove_front_spec: (@DLL.DL_Node A)) (head_remove_front_spec: Z) (storeA_remove_front_spec: (Z -> (A -> Assertion))) ,
  “ ((DLL.getPtr (removed_remove_front_spec)) = linklist_node_pre) ”
  &&  (XiziLocalDLL.store_dll storeA_remove_front_spec head_remove_front_spec (cons (removed_remove_front_spec) (suffix_remove_front_spec)) )
|--
EX (A: Type) ,
EX (storeA_strong_spec: (Z -> (A -> Assertion))) (head_strong_spec: Z) (removed_strong_spec: (@DLL.DL_Node A)) (nodes_strong_spec: (@list (@DLL.DL_Node A))) (prefix_strong_spec: (@list (@DLL.DL_Node A))) (suffix_strong_spec: (@list (@DLL.DL_Node A))) ,
  (“ ((DLL.getPtr (removed_strong_spec)) = linklist_node_pre) ” 
  &&  “ (nodes_strong_spec = (app (prefix_strong_spec) ((cons (removed_strong_spec) (suffix_strong_spec))))) ”
  &&  (XiziLocalDLL.store_dll storeA_strong_spec head_strong_spec nodes_strong_spec ))
  **
  (((XiziLocalDLL.store_dll storeA_strong_spec head_strong_spec (app (prefix_strong_spec) (suffix_strong_spec)) )
  **  (XiziLocalDLL.store_dll storeA_strong_spec linklist_node_pre nil )
  **  (storeA_strong_spec linklist_node_pre (DLL.getData (removed_strong_spec)) ))
  -*
  ((XiziLocalDLL.store_dll storeA_remove_front_spec head_remove_front_spec suffix_remove_front_spec )
  **  (XiziLocalDLL.store_dll storeA_remove_front_spec linklist_node_pre nil )
  **  (storeA_remove_front_spec linklist_node_pre (DLL.getData (removed_remove_front_spec)) )))
.

Definition DoubleLinkListRmNode_derive_remove_member_spec_by_strong_spec := 
forall (A: Type) ,
forall (linklist_node_pre: Z) (nodes_remove_member_spec: (@list (@DLL.DL_Node A))) (head_remove_member_spec: Z) (storeA_remove_member_spec: (Z -> (A -> Assertion))) ,
  “ (In linklist_node_pre (xizi_dll_ptrs (nodes_remove_member_spec)) ) ”
  &&  (XiziLocalDLL.store_dll storeA_remove_member_spec head_remove_member_spec nodes_remove_member_spec )
|--
EX (A: Type) ,
EX (storeA_strong_spec: (Z -> (A -> Assertion))) (head_strong_spec: Z) (removed_strong_spec: (@DLL.DL_Node A)) (nodes_strong_spec: (@list (@DLL.DL_Node A))) (prefix_strong_spec: (@list (@DLL.DL_Node A))) (suffix_strong_spec: (@list (@DLL.DL_Node A))) ,
  (“ ((DLL.getPtr (removed_strong_spec)) = linklist_node_pre) ” 
  &&  “ (nodes_strong_spec = (app (prefix_strong_spec) ((cons (removed_strong_spec) (suffix_strong_spec))))) ”
  &&  (XiziLocalDLL.store_dll storeA_strong_spec head_strong_spec nodes_strong_spec ))
  **
  (((XiziLocalDLL.store_dll storeA_strong_spec head_strong_spec (app (prefix_strong_spec) (suffix_strong_spec)) )
  **  (XiziLocalDLL.store_dll storeA_strong_spec linklist_node_pre nil )
  **  (storeA_strong_spec linklist_node_pre (DLL.getData (removed_strong_spec)) ))
  -*
  (EX remaining removed,
  “ ((DLL.getPtr (removed)) = linklist_node_pre) ” 
  &&  “ (xizi_dll_remove_node_rel removed nodes_remove_member_spec remaining ) ”
  &&  (XiziLocalDLL.store_dll storeA_remove_member_spec head_remove_member_spec remaining )
  **  (XiziLocalDLL.store_dll storeA_remove_member_spec linklist_node_pre nil )
  **  (storeA_remove_member_spec linklist_node_pre (DLL.getData (removed)) )))
.

Module Type VC_Correct.

Include xizi_double_link_Strategy_Correct.

Axiom proof_of_DoubleLinkListRmNode_entail_wit_1 : DoubleLinkListRmNode_entail_wit_1.
Axiom proof_of_DoubleLinkListRmNode_return_wit_1 : DoubleLinkListRmNode_return_wit_1.
Axiom proof_of_DoubleLinkListRmNode_derive_remove_tail_spec_by_strong_spec : DoubleLinkListRmNode_derive_remove_tail_spec_by_strong_spec.
Axiom proof_of_DoubleLinkListRmNode_derive_remove_front_spec_by_strong_spec : DoubleLinkListRmNode_derive_remove_front_spec_by_strong_spec.
Axiom proof_of_DoubleLinkListRmNode_derive_remove_member_spec_by_strong_spec : DoubleLinkListRmNode_derive_remove_member_spec_by_strong_spec.

End VC_Correct.
