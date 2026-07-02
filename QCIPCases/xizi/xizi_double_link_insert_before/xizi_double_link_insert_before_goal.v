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
Local Open Scope sac.

(*----- Function xizi_double_link_insert_before -----*)

Definition xizi_double_link_insert_before_return_wit_1 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (old_prev: Z) (PreH1 : (linklist_pre <> 0)) (PreH2 : (linklist_node_pre <> 0)) (PreH3 : (old_prev <> 0)) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  ((&((old_prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_pre)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> old_prev)
|--
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  ((&((old_prev)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> old_prev)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> linklist_pre)
.

Module Type VC_Correct.


Axiom proof_of_xizi_double_link_insert_before_return_wit_1 : xizi_double_link_insert_before_return_wit_1.

End VC_Correct.
