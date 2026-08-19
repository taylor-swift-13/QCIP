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
      SimpleC.EE.INPUT.xizi.xizi_double_link_remove_node.xizi_double_link_remove_node_lib.
Local Open Scope sac.

(*----- Function xizi_double_link_remove_node -----*)

Definition xizi_double_link_remove_node_return_wit_1 := 
forall (linklist_node_pre: Z) (nodes: (@list Z)) (prev: Z) (next: Z) (PreH1 : (linklist_node_pre <> 0)) (PreH2 : (next <> linklist_node_pre)) (PreH3 : (prev <> linklist_node_pre)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  ((&((next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_dll_open next prev nodes )
|--
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  ((&((next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&((prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_dll_open next prev nodes )
.

Module Type VC_Correct.


Axiom proof_of_xizi_double_link_remove_node_return_wit_1 : xizi_double_link_remove_node_return_wit_1.

End VC_Correct.
