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
Require Import MyTutorial.float_clamp_lib.
Local Open Scope sac.

(*----- Function float_clamp -----*)

Definition float_clamp_return_wit_1 := 
(
forall (hi_pre: fp32) (lo_pre: fp32) (x_pre: fp32) (PreH1 : (fp32_le x_pre hi_pre )) (PreH2 : (fp32_ge x_pre lo_pre )) (PreH3 : (clampFloatSafe x_pre lo_pre hi_pre )) ,
  TT && emp 
|--
  “ (clampFloatPost x_pre lo_pre hi_pre x_pre ) ”
  &&  emp
) \/
(
forall (hi_pre: fp32) (lo_pre: fp32) (x_pre: fp32) (PreH1 : (fp32_le x_pre hi_pre )) (PreH2 : (fp32_ge x_pre lo_pre )) (PreH3 : (clampFloatSafe x_pre lo_pre hi_pre )) ,
  TT && emp 
|--
  “ (clampFloatPost x_pre lo_pre hi_pre x_pre ) ”
  &&  emp
).

Definition float_clamp_return_wit_1_split_goal_1 := 
forall (hi_pre: fp32) (lo_pre: fp32) (x_pre: fp32) (PreH1 : (fp32_le x_pre hi_pre )) (PreH2 : (fp32_ge x_pre lo_pre )) (PreH3 : (clampFloatSafe x_pre lo_pre hi_pre )) ,
  (clampFloatPost x_pre lo_pre hi_pre x_pre )
.

Definition float_clamp_return_wit_2 := 
(
forall (hi_pre: fp32) (lo_pre: fp32) (x_pre: fp32) (PreH1 : (fp32_gt x_pre hi_pre )) (PreH2 : (fp32_ge x_pre lo_pre )) (PreH3 : (clampFloatSafe x_pre lo_pre hi_pre )) ,
  TT && emp 
|--
  “ (clampFloatPost x_pre lo_pre hi_pre hi_pre ) ”
  &&  emp
) \/
(
forall (hi_pre: fp32) (lo_pre: fp32) (x_pre: fp32) (PreH1 : (fp32_gt x_pre hi_pre )) (PreH2 : (fp32_ge x_pre lo_pre )) (PreH3 : (clampFloatSafe x_pre lo_pre hi_pre )) ,
  TT && emp 
|--
  “ (clampFloatPost x_pre lo_pre hi_pre hi_pre ) ”
  &&  emp
).

Definition float_clamp_return_wit_2_split_goal_1 := 
forall (hi_pre: fp32) (lo_pre: fp32) (x_pre: fp32) (PreH1 : (fp32_gt x_pre hi_pre )) (PreH2 : (fp32_ge x_pre lo_pre )) (PreH3 : (clampFloatSafe x_pre lo_pre hi_pre )) ,
  (clampFloatPost x_pre lo_pre hi_pre hi_pre )
.

Definition float_clamp_return_wit_3 := 
(
forall (hi_pre: fp32) (lo_pre: fp32) (x_pre: fp32) (PreH1 : (fp32_lt x_pre lo_pre )) (PreH2 : (clampFloatSafe x_pre lo_pre hi_pre )) ,
  TT && emp 
|--
  “ (clampFloatPost x_pre lo_pre hi_pre lo_pre ) ”
  &&  emp
) \/
(
forall (hi_pre: fp32) (lo_pre: fp32) (x_pre: fp32) (PreH1 : (fp32_lt x_pre lo_pre )) (PreH2 : (clampFloatSafe x_pre lo_pre hi_pre )) ,
  TT && emp 
|--
  “ (clampFloatPost x_pre lo_pre hi_pre lo_pre ) ”
  &&  emp
).

Definition float_clamp_return_wit_3_split_goal_1 := 
forall (hi_pre: fp32) (lo_pre: fp32) (x_pre: fp32) (PreH1 : (fp32_lt x_pre lo_pre )) (PreH2 : (clampFloatSafe x_pre lo_pre hi_pre )) ,
  (clampFloatPost x_pre lo_pre hi_pre lo_pre )
.

(*----- Function double_clamp -----*)

Definition double_clamp_return_wit_1 := 
(
forall (hi_pre: fp64) (lo_pre: fp64) (x_pre: fp64) (PreH1 : (fp64_le x_pre hi_pre )) (PreH2 : (fp64_ge x_pre lo_pre )) (PreH3 : (clampSafe x_pre lo_pre hi_pre )) ,
  TT && emp 
|--
  “ (clampPost x_pre lo_pre hi_pre x_pre ) ”
  &&  emp
) \/
(
forall (hi_pre: fp64) (lo_pre: fp64) (x_pre: fp64) (PreH1 : (fp64_le x_pre hi_pre )) (PreH2 : (fp64_ge x_pre lo_pre )) (PreH3 : (clampSafe x_pre lo_pre hi_pre )) ,
  TT && emp 
|--
  “ (clampPost x_pre lo_pre hi_pre x_pre ) ”
  &&  emp
).

Definition double_clamp_return_wit_1_split_goal_1 := 
forall (hi_pre: fp64) (lo_pre: fp64) (x_pre: fp64) (PreH1 : (fp64_le x_pre hi_pre )) (PreH2 : (fp64_ge x_pre lo_pre )) (PreH3 : (clampSafe x_pre lo_pre hi_pre )) ,
  (clampPost x_pre lo_pre hi_pre x_pre )
.

Definition double_clamp_return_wit_2 := 
(
forall (hi_pre: fp64) (lo_pre: fp64) (x_pre: fp64) (PreH1 : (fp64_gt x_pre hi_pre )) (PreH2 : (fp64_ge x_pre lo_pre )) (PreH3 : (clampSafe x_pre lo_pre hi_pre )) ,
  TT && emp 
|--
  “ (clampPost x_pre lo_pre hi_pre hi_pre ) ”
  &&  emp
) \/
(
forall (hi_pre: fp64) (lo_pre: fp64) (x_pre: fp64) (PreH1 : (fp64_gt x_pre hi_pre )) (PreH2 : (fp64_ge x_pre lo_pre )) (PreH3 : (clampSafe x_pre lo_pre hi_pre )) ,
  TT && emp 
|--
  “ (clampPost x_pre lo_pre hi_pre hi_pre ) ”
  &&  emp
).

Definition double_clamp_return_wit_2_split_goal_1 := 
forall (hi_pre: fp64) (lo_pre: fp64) (x_pre: fp64) (PreH1 : (fp64_gt x_pre hi_pre )) (PreH2 : (fp64_ge x_pre lo_pre )) (PreH3 : (clampSafe x_pre lo_pre hi_pre )) ,
  (clampPost x_pre lo_pre hi_pre hi_pre )
.

Definition double_clamp_return_wit_3 := 
(
forall (hi_pre: fp64) (lo_pre: fp64) (x_pre: fp64) (PreH1 : (fp64_lt x_pre lo_pre )) (PreH2 : (clampSafe x_pre lo_pre hi_pre )) ,
  TT && emp 
|--
  “ (clampPost x_pre lo_pre hi_pre lo_pre ) ”
  &&  emp
) \/
(
forall (hi_pre: fp64) (lo_pre: fp64) (x_pre: fp64) (PreH1 : (fp64_lt x_pre lo_pre )) (PreH2 : (clampSafe x_pre lo_pre hi_pre )) ,
  TT && emp 
|--
  “ (clampPost x_pre lo_pre hi_pre lo_pre ) ”
  &&  emp
).

Definition double_clamp_return_wit_3_split_goal_1 := 
forall (hi_pre: fp64) (lo_pre: fp64) (x_pre: fp64) (PreH1 : (fp64_lt x_pre lo_pre )) (PreH2 : (clampSafe x_pre lo_pre hi_pre )) ,
  (clampPost x_pre lo_pre hi_pre lo_pre )
.

Module Type VC_Correct.


Axiom proof_of_float_clamp_return_wit_1 : float_clamp_return_wit_1.
Axiom proof_of_float_clamp_return_wit_2 : float_clamp_return_wit_2.
Axiom proof_of_float_clamp_return_wit_3 : float_clamp_return_wit_3.
Axiom proof_of_double_clamp_return_wit_1 : double_clamp_return_wit_1.
Axiom proof_of_double_clamp_return_wit_2 : double_clamp_return_wit_2.
Axiom proof_of_double_clamp_return_wit_3 : double_clamp_return_wit_3.

End VC_Correct.
