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

(*----- Function xizi_double_link_empty -----*)

Definition xizi_double_link_empty_return_wit_1 := 
forall (linklist_pre: Z) (last: Z) (first: Z) (PreH1 : (first <> linklist_pre)) (PreH2 : (linklist_pre <> 0)) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
|--
  “ ((first = linklist_pre) -> (0 = 1)) ” 
  &&  “ ((first <> linklist_pre) -> (0 = 0)) ”
  &&  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
.

Definition xizi_double_link_empty_return_wit_2 := 
forall (linklist_pre: Z) (last: Z) (first: Z) (PreH1 : (first = linklist_pre)) (PreH2 : (linklist_pre <> 0)) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
|--
  “ ((first = linklist_pre) -> (1 = 1)) ” 
  &&  “ ((first <> linklist_pre) -> (1 = 0)) ”
  &&  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
.

Module Type VC_Correct.


Axiom proof_of_xizi_double_link_empty_return_wit_1 : xizi_double_link_empty_return_wit_1.
Axiom proof_of_xizi_double_link_empty_return_wit_2 : xizi_double_link_empty_return_wit_2.

End VC_Correct.
