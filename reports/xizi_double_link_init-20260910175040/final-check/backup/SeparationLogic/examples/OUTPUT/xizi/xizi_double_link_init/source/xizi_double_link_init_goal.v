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

(*----- Function InitDoubleLinkList -----*)

Definition InitDoubleLinkList_entail_wit_1 := 
(
forall (linklist_head_pre: Z) ,
  (XiziLocalDLL.occupy_dll_node linklist_head_pre )
|--
  EX (next: Z)  (prev: Z) ,
  ((&((linklist_head_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&((linklist_head_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
) \/
(
forall (linklist_head_pre: Z) ,
  (XiziLocalDLL.occupy_dll_node linklist_head_pre )
|--
  EX (next: Z)  (prev: Z) ,
  ((&((linklist_head_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&((linklist_head_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
).

Definition InitDoubleLinkList_return_wit_1 := 
(
forall (A: Type) (linklist_head_pre: Z) (storeA: (Z -> (A -> Assertion))) ,
  ((&((linklist_head_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_head_pre)
  **  ((&((linklist_head_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_head_pre)
|--
  (XiziLocalDLL.store_dll storeA linklist_head_pre (@nil (@DLL.DL_Node A)) )
) \/
(
forall (A: Type) (linklist_head_pre: Z) (storeA: (Z -> (A -> Assertion))) ,
  ((&((linklist_head_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_head_pre)
  **  ((&((linklist_head_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_head_pre)
|--
  (XiziLocalDLL.store_dll storeA linklist_head_pre (@nil (@DLL.DL_Node A)) )
).

Definition InitDoubleLinkList_return_wit_1_split_goal_spatial := 
forall (A: Type) (linklist_head_pre: Z) (storeA: (Z -> (A -> Assertion))) ,
  ((&((linklist_head_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_head_pre)
  **  ((&((linklist_head_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_head_pre)
|--
  (XiziLocalDLL.store_dll storeA linklist_head_pre (@nil (@DLL.DL_Node A)) )
.

Module Type VC_Correct.

Include xizi_double_link_Strategy_Correct.

Axiom proof_of_InitDoubleLinkList_entail_wit_1 : InitDoubleLinkList_entail_wit_1.
Axiom proof_of_InitDoubleLinkList_return_wit_1 : InitDoubleLinkList_return_wit_1.

End VC_Correct.
