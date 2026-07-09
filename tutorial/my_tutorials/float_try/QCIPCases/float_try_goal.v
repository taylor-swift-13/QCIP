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
From MyTutorial Require Import float_try_lib.
Local Open Scope sac.

(*----- Function lerp_positive -----*)

Definition lerp_positive_safety_wit_1 := 
(
forall (t_pre: fp64) (b_pre: fp64) (a_pre: fp64) ,
  ((( &( "r" ) )) # Ptr  |->_)
  **  ((( &( "t" ) )) # Ptr  |-> t_pre)
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
|--
  “ (fp64_isFinite (fp64_add (a_pre) ((fp64_mul (t_pre) ((fp64_sub (b_pre) (a_pre)))))) ) ”
) \/
(
forall (t_pre: fp64) (b_pre: fp64) (a_pre: fp64) ,
  ((( &( "r" ) )) # Ptr  |->_)
  **  ((( &( "t" ) )) # Ptr  |-> t_pre)
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
|--
  “ (fp64_isFinite (fp64_add (a_pre) ((fp64_mul (t_pre) ((fp64_sub (b_pre) (a_pre)))))) ) ”
).

Definition lerp_positive_safety_wit_1_split_goal_1 := 
forall (t_pre: fp64) (b_pre: fp64) (a_pre: fp64) ,
  ((( &( "r" ) )) # Ptr  |->_)
  **  ((( &( "t" ) )) # Ptr  |-> t_pre)
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
|--
  “ (fp64_isFinite (fp64_add (a_pre) ((fp64_mul (t_pre) ((fp64_sub (b_pre) (a_pre)))))) ) ”
.

Definition lerp_positive_safety_wit_2 := 
(
forall (t_pre: fp64) (b_pre: fp64) (a_pre: fp64) ,
  ((( &( "r" ) )) # Ptr  |->_)
  **  ((( &( "t" ) )) # Ptr  |-> t_pre)
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
|--
  “ (fp64_isFinite (fp64_mul (t_pre) ((fp64_sub (b_pre) (a_pre)))) ) ”
) \/
(
forall (t_pre: fp64) (b_pre: fp64) (a_pre: fp64) ,
  ((( &( "r" ) )) # Ptr  |->_)
  **  ((( &( "t" ) )) # Ptr  |-> t_pre)
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
|--
  “ (fp64_isFinite (fp64_mul (t_pre) ((fp64_sub (b_pre) (a_pre)))) ) ”
).

Definition lerp_positive_safety_wit_2_split_goal_1 := 
forall (t_pre: fp64) (b_pre: fp64) (a_pre: fp64) ,
  ((( &( "r" ) )) # Ptr  |->_)
  **  ((( &( "t" ) )) # Ptr  |-> t_pre)
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
|--
  “ (fp64_isFinite (fp64_mul (t_pre) ((fp64_sub (b_pre) (a_pre)))) ) ”
.

Definition lerp_positive_safety_wit_3 := 
(
forall (t_pre: fp64) (b_pre: fp64) (a_pre: fp64) ,
  ((( &( "r" ) )) # Ptr  |->_)
  **  ((( &( "t" ) )) # Ptr  |-> t_pre)
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
|--
  “ (fp64_isFinite (fp64_sub (b_pre) (a_pre)) ) ”
) \/
(
forall (t_pre: fp64) (b_pre: fp64) (a_pre: fp64) ,
  ((( &( "r" ) )) # Ptr  |->_)
  **  ((( &( "t" ) )) # Ptr  |-> t_pre)
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
|--
  “ (fp64_isFinite (fp64_sub (b_pre) (a_pre)) ) ”
).

Definition lerp_positive_safety_wit_3_split_goal_1 := 
forall (t_pre: fp64) (b_pre: fp64) (a_pre: fp64) ,
  ((( &( "r" ) )) # Ptr  |->_)
  **  ((( &( "t" ) )) # Ptr  |-> t_pre)
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
|--
  “ (fp64_isFinite (fp64_sub (b_pre) (a_pre)) ) ”
.

Definition lerp_positive_safety_wit_4 := 
(
forall (t_pre: fp64) (b_pre: fp64) (a_pre: fp64) ,
  ((( &( "r" ) )) # Ptr  |-> (fp64_add (a_pre) ((fp64_mul (t_pre) ((fp64_sub (b_pre) (a_pre)))))))
  **  ((( &( "t" ) )) # Ptr  |-> t_pre)
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
|--
  “ (fp64_isFinite (fp64_add (a_pre) ((fp64_mul (t_pre) ((fp64_sub (b_pre) (a_pre)))))) ) ” 
  &&  “ (fp64_isFinite (fp64_from_Z 0) ) ”
) \/
(
forall (t_pre: fp64) (b_pre: fp64) (a_pre: fp64) ,
  ((( &( "r" ) )) # Ptr  |-> (fp64_add (a_pre) ((fp64_mul (t_pre) ((fp64_sub (b_pre) (a_pre)))))))
  **  ((( &( "t" ) )) # Ptr  |-> t_pre)
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
|--
  “ (fp64_isFinite (fp64_add (a_pre) ((fp64_mul (t_pre) ((fp64_sub (b_pre) (a_pre)))))) ) ” 
  &&  “ (fp64_isFinite (fp64_from_Z 0) ) ”
).

Definition lerp_positive_safety_wit_4_split_goal_1 := 
forall (t_pre: fp64) (b_pre: fp64) (a_pre: fp64) ,
  ((( &( "r" ) )) # Ptr  |-> (fp64_add (a_pre) ((fp64_mul (t_pre) ((fp64_sub (b_pre) (a_pre)))))))
  **  ((( &( "t" ) )) # Ptr  |-> t_pre)
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
|--
  “ (fp64_isFinite (fp64_add (a_pre) ((fp64_mul (t_pre) ((fp64_sub (b_pre) (a_pre)))))) ) ”
.

Definition lerp_positive_safety_wit_4_split_goal_2 := 
forall (t_pre: fp64) (b_pre: fp64) (a_pre: fp64) ,
  ((( &( "r" ) )) # Ptr  |-> (fp64_add (a_pre) ((fp64_mul (t_pre) ((fp64_sub (b_pre) (a_pre)))))))
  **  ((( &( "t" ) )) # Ptr  |-> t_pre)
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
|--
  “ (fp64_isFinite (fp64_from_Z 0) ) ”
.

Definition lerp_positive_return_wit_1 := 
(
forall (t_pre: fp64) (b_pre: fp64) (a_pre: fp64) (PreH1 : (fp64_LE (fp64_add (a_pre) ((fp64_mul (t_pre) ((fp64_sub (b_pre) (a_pre)))))) (fp64_from_Z 0) )) ,
  TT && emp 
|--
  “ (lerpPositivePost a_pre b_pre t_pre 0 ) ”
  &&  emp
) \/
(
forall (t_pre: fp64) (b_pre: fp64) (a_pre: fp64) (PreH1 : (fp64_LE (fp64_add (a_pre) ((fp64_mul (t_pre) ((fp64_sub (b_pre) (a_pre)))))) (fp64_from_Z 0) )) ,
  TT && emp 
|--
  “ (lerpPositivePost a_pre b_pre t_pre 0 ) ”
  &&  emp
).

Definition lerp_positive_return_wit_1_split_goal_1 := 
forall (t_pre: fp64) (b_pre: fp64) (a_pre: fp64) (PreH1 : (fp64_LE (fp64_add (a_pre) ((fp64_mul (t_pre) ((fp64_sub (b_pre) (a_pre)))))) (fp64_from_Z 0) )) ,
  TT && emp 
|--
  “ (lerpPositivePost a_pre b_pre t_pre 0 ) ”
.

Definition lerp_positive_return_wit_2 := 
(
forall (t_pre: fp64) (b_pre: fp64) (a_pre: fp64) (PreH1 : (fp64_GT (fp64_add (a_pre) ((fp64_mul (t_pre) ((fp64_sub (b_pre) (a_pre)))))) (fp64_from_Z 0) )) ,
  TT && emp 
|--
  “ (lerpPositivePost a_pre b_pre t_pre 1 ) ”
  &&  emp
) \/
(
forall (t_pre: fp64) (b_pre: fp64) (a_pre: fp64) (PreH1 : (fp64_GT (fp64_add (a_pre) ((fp64_mul (t_pre) ((fp64_sub (b_pre) (a_pre)))))) (fp64_from_Z 0) )) ,
  TT && emp 
|--
  “ (lerpPositivePost a_pre b_pre t_pre 1 ) ”
  &&  emp
).

Definition lerp_positive_return_wit_2_split_goal_1 := 
forall (t_pre: fp64) (b_pre: fp64) (a_pre: fp64) (PreH1 : (fp64_GT (fp64_add (a_pre) ((fp64_mul (t_pre) ((fp64_sub (b_pre) (a_pre)))))) (fp64_from_Z 0) )) ,
  TT && emp 
|--
  “ (lerpPositivePost a_pre b_pre t_pre 1 ) ”
.

Module Type VC_Correct.


Axiom proof_of_lerp_positive_safety_wit_1 : lerp_positive_safety_wit_1.
Axiom proof_of_lerp_positive_safety_wit_2 : lerp_positive_safety_wit_2.
Axiom proof_of_lerp_positive_safety_wit_3 : lerp_positive_safety_wit_3.
Axiom proof_of_lerp_positive_safety_wit_4 : lerp_positive_safety_wit_4.
Axiom proof_of_lerp_positive_return_wit_1 : lerp_positive_return_wit_1.
Axiom proof_of_lerp_positive_return_wit_2 : lerp_positive_return_wit_2.

End VC_Correct.
