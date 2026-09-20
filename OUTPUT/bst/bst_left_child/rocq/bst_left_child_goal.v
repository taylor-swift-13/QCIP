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
Require Import SimpleC.EE.QCP_demos_LLM.bst_lib_1.
Require Import SimpleC.EE.QCP_demos_LLM.bst_left_child_lib.
Local Open Scope sac.

(*----- Function bst_left_child -----*)

Definition bst_left_child_return_wit_1 := 
(
forall (root_pre: Z) (g: G) (PreH1 : (bst_gvalid g )) (PreH2 : (bst_vvalid g root_pre )) (PreH3 : (root_pre <> 0)) ,
  ((&((root_pre)  # "tree" ->ₛ "left")) # Ptr  |-> (ptr_of ((bst_left (g) (root_pre)))))
|--
  “ (bst_left_child_result (ptr_of ((bst_left (g) (root_pre)))) (ptr_of ((bst_left (g) (root_pre)))) ) ”
  &&  ((&((root_pre)  # "tree" ->ₛ "left")) # Ptr  |-> (ptr_of ((bst_left (g) (root_pre)))))
) \/
(
forall (root_pre: Z) (g: G) (PreH1 : (bst_gvalid g )) (PreH2 : (bst_vvalid g root_pre )) (PreH3 : (root_pre <> 0)) ,
  TT && emp 
|--
  “ (bst_left_child_result (ptr_of ((bst_left (g) (root_pre)))) (ptr_of ((bst_left (g) (root_pre)))) ) ”
  &&  emp
).

Definition bst_left_child_return_wit_1_split_goal_1 := 
forall (root_pre: Z) (g: G) (PreH1 : (bst_gvalid g )) (PreH2 : (bst_vvalid g root_pre )) (PreH3 : (root_pre <> 0)) ,
  (bst_left_child_result (ptr_of ((bst_left (g) (root_pre)))) (ptr_of ((bst_left (g) (root_pre)))) )
.

Module Type VC_Correct.


Axiom proof_of_bst_left_child_return_wit_1 : bst_left_child_return_wit_1.

End VC_Correct.
