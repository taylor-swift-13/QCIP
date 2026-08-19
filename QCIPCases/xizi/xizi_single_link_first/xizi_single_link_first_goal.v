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
Require Import xizi_single_link_strategy_goal.
Require Import xizi_single_link_strategy_proof.

(*----- Function xizi_single_link_first -----*)

Definition xizi_single_link_first_return_wit_1 := 
(
forall (linklist_pre: Z) (l: (@list Z)) (q: Z) (PreH1 : (linklist_pre <> 0)) ,
  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> q)
  **  (xizi_sll q l )
|--
  “ (q = (xizi_sll_first_value (l))) ”
  &&  (xizi_sll_head linklist_pre l )
) \/
(
forall (linklist_pre: Z) (l: (@list Z)) (q: Z) (PreH1 : (linklist_pre <> 0)) ,
  (xizi_sll q l )
|--
  “ (q = (xizi_sll_first_value (l))) ”
  &&  (xizi_sll q l )
).

Definition xizi_single_link_first_return_wit_1_split_goal_1 :=
forall (linklist_pre: Z) (l: (@list Z)) (q: Z) (PreH1 : (linklist_pre <> 0)) ,
  (xizi_sll q l )
|--
  “ (q = (xizi_sll_first_value (l))) ”
.

Definition xizi_single_link_first_return_wit_1_split_goal_spatial :=
forall (linklist_pre: Z) (l: (@list Z)) (q: Z) (PreH1 : (linklist_pre <> 0)) ,
  (xizi_sll q l )
|--
  (xizi_sll q l )
.

Definition xizi_single_link_first_partial_solve_wit_1 :=
forall (linklist_pre: Z) (l: (@list Z)) ,
  (xizi_sll_head linklist_pre l )
|--
  EX (q: Z) ,
  “ (linklist_pre <> 0) ”
  &&  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> q)
  **  (xizi_sll q l )
.

Module Type VC_Correct.

Include xizi_single_link_Strategy_Correct.

Axiom proof_of_xizi_single_link_first_return_wit_1 : xizi_single_link_first_return_wit_1.
Axiom proof_of_xizi_single_link_first_partial_solve_wit_1 : xizi_single_link_first_partial_solve_wit_1.

End VC_Correct.
