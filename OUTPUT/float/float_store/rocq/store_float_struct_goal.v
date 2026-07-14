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

(*----- Function write_struct_float -----*)

Definition write_struct_float_return_wit_1 := 
(
forall (x_pre: fp32) (record_pre: Z) ,
  ((&((record_pre)  # "FloatRecord" ->ₛ "value")) # Float  |-> x_pre)
|--
  (store_float &((record_pre)  # "FloatRecord" ->ₛ "value") x_pre )
) \/
(
forall (x_pre: fp32) (record_pre: Z) ,
  ((&((record_pre)  # "FloatRecord" ->ₛ "value")) # Float  |-> x_pre)
|--
  (store_float &((record_pre)  # "FloatRecord" ->ₛ "value") x_pre )
).

Definition write_struct_float_return_wit_1_split_goal_spatial := 
forall (x_pre: fp32) (record_pre: Z) ,
  ((&((record_pre)  # "FloatRecord" ->ₛ "value")) # Float  |-> x_pre)
|--
  (store_float &((record_pre)  # "FloatRecord" ->ₛ "value") x_pre )
.

Module Type VC_Correct.


Axiom proof_of_write_struct_float_return_wit_1 : write_struct_float_return_wit_1.

End VC_Correct.
