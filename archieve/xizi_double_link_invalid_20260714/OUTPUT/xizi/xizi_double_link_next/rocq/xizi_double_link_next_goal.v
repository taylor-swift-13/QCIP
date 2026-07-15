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

(*----- Function xizi_double_link_next -----*)

Definition xizi_double_link_next_safety_wit_1 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (next: Z) (PreH1 : (next = linklist_pre)) (PreH2 : (linklist_pre <> 0)) (PreH3 : (linklist_node_pre <> 0)) ,
  ((( &( "linklist_node" ) )) # Ptr  |-> linklist_node_pre)
  **  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_double_link_next_return_wit_1 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (next: Z) (PreH1 : (next = linklist_pre)) (PreH2 : (linklist_pre <> 0)) (PreH3 : (linklist_node_pre <> 0)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
|--
  “ ((next = linklist_pre) -> (0 = 0)) ” 
  &&  “ ((next <> linklist_pre) -> (0 = next)) ”
  &&  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
.

Definition xizi_double_link_next_return_wit_2 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (next: Z) (PreH1 : (next <> linklist_pre)) (PreH2 : (linklist_pre <> 0)) (PreH3 : (linklist_node_pre <> 0)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
|--
  “ ((next = linklist_pre) -> (next = 0)) ” 
  &&  “ ((next <> linklist_pre) -> (next = next)) ”
  &&  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
.

Module Type VC_Correct.


Axiom proof_of_xizi_double_link_next_safety_wit_1 : xizi_double_link_next_safety_wit_1.
Axiom proof_of_xizi_double_link_next_return_wit_1 : xizi_double_link_next_return_wit_1.
Axiom proof_of_xizi_double_link_next_return_wit_2 : xizi_double_link_next_return_wit_2.

End VC_Correct.
