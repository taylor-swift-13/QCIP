Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Strings.String.
Require Import Coq.Strings.Ascii.
Require Import Coq.Lists.List.
Require Import Coq.Reals.Reals.
Require Import Coq.Classes.RelationClasses.
Require Import Coq.Classes.Morphisms.
Require Import Coq.micromega.Psatz.
Require Import Coq.Sorting.Permutation.
From AUXLib Require Import int_auto Axioms Feq Idents ListLib VMap.
Require Import SetsClass.SetsClass. Import SetsNotation.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope R_scope.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import MyTutorial.float_one_lib.
Local Open Scope sac.

(*----- Function return_one -----*)

Definition return_one_return_wit_1 := 
(
  TT && emp 
|--
  “ (returnOnePost (fp64_of_real (1.0)) ) ”
  &&  emp
) \/
(
  TT && emp 
|--
  “ (returnOnePost (fp64_of_real (1.0)) ) ”
  &&  emp
).

Definition return_one_return_wit_1_split_goal_1 := 
  (returnOnePost (fp64_of_real (1.0)) )
.

Module Type VC_Correct.


Axiom proof_of_return_one_return_wit_1 : return_one_return_wit_1.

End VC_Correct.
