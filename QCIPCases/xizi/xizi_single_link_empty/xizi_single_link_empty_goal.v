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
From QCIPLib.xizi.xizi_single_link_common Require Import xizi_single_link_lib.
Local Open Scope sac.
From QCIPLib.xizi.xizi_single_link_common Require Import xizi_single_link_strategy_goal.
From QCIPLib.xizi.xizi_single_link_common Require Import xizi_single_link_strategy_proof.

(*----- Function xizi_single_link_empty -----*)

Definition xizi_single_link_empty_safety_wit_1 := 
forall (linklist_pre: Z) (l: (@list Z)) (first: Z) (PreH1 : (linklist_pre <> 0)) ,
  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_sll first l )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_single_link_empty_return_wit_1 := 
(
forall (linklist_pre: Z) (l: (@list Z)) (first: Z) (PreH1 : (first <> 0)) (PreH2 : (linklist_pre <> 0)) ,
  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_sll first l )
|--
  “ ((first = 0) -> (0 = 1)) ” 
  &&  “ ((first <> 0) -> (0 = 0)) ”
  &&  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_sll first l )
) \/
(
forall (linklist_pre: Z) (l: (@list Z)) (first: Z) (q: Z) (l0: (@list Z)) (PreH1 : (l = (cons (first) (l0)))) (PreH2 : (first <> 0)) (PreH3 : (linklist_pre <> 0)) ,
  (xizi_sll q l0 )
  **  ((&((first)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> q)
|--
  (xizi_sll first l )
).

Definition xizi_single_link_empty_return_wit_1_split_goal_spatial := 
forall (linklist_pre: Z) (l: (@list Z)) (first: Z) (q: Z) (l0: (@list Z)) (PreH1 : (l = (cons (first) (l0)))) (PreH2 : (first <> 0)) (PreH3 : (linklist_pre <> 0)) ,
  (xizi_sll q l0 )
  **  ((&((first)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> q)
|--
  (xizi_sll first l )
.

Definition xizi_single_link_empty_return_wit_2 := 
forall (linklist_pre: Z) (l: (@list Z)) (first: Z) (PreH1 : (first = 0)) (PreH2 : (linklist_pre <> 0)) ,
  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_sll first l )
|--
  “ ((first = 0) -> (1 = 1)) ” 
  &&  “ ((first <> 0) -> (1 = 0)) ”
  &&  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_sll first l )
.

Module Type VC_Correct.

Include xizi_single_link_Strategy_Correct.

Axiom proof_of_xizi_single_link_empty_safety_wit_1 : xizi_single_link_empty_safety_wit_1.
Axiom proof_of_xizi_single_link_empty_return_wit_1 : xizi_single_link_empty_return_wit_1.
Axiom proof_of_xizi_single_link_empty_return_wit_2 : xizi_single_link_empty_return_wit_2.

End VC_Correct.
