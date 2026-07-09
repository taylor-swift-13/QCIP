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

(*----- Function xizi_circular_area_read_advance -----*)

Definition xizi_circular_area_read_advance_safety_wit_1 := 
forall (area_length_pre: Z) (data_length_pre: Z) (readidx_pre: Z) (PreH1 : (0 < area_length_pre)) (PreH2 : (area_length_pre <= 1073741824)) (PreH3 : (0 <= readidx_pre)) (PreH4 : (readidx_pre < area_length_pre)) (PreH5 : (0 <= data_length_pre)) (PreH6 : (data_length_pre <= area_length_pre)) ,
  ((( &( "area_length" ) )) # Int  |-> area_length_pre)
  **  ((( &( "data_length" ) )) # Int  |-> data_length_pre)
  **  ((( &( "readidx" ) )) # Int  |-> readidx_pre)
|--
  “ ((readidx_pre + data_length_pre ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (readidx_pre + data_length_pre )) ”
.

Definition xizi_circular_area_read_advance_safety_wit_2 := 
forall (area_length_pre: Z) (data_length_pre: Z) (readidx_pre: Z) (PreH1 : ((readidx_pre + data_length_pre ) <= area_length_pre)) (PreH2 : (0 < area_length_pre)) (PreH3 : (area_length_pre <= 1073741824)) (PreH4 : (0 <= readidx_pre)) (PreH5 : (readidx_pre < area_length_pre)) (PreH6 : (0 <= data_length_pre)) (PreH7 : (data_length_pre <= area_length_pre)) ,
  ((( &( "area_length" ) )) # Int  |-> area_length_pre)
  **  ((( &( "data_length" ) )) # Int  |-> data_length_pre)
  **  ((( &( "readidx" ) )) # Int  |-> readidx_pre)
|--
  “ (((readidx_pre + data_length_pre ) <> (INT_MIN)) \/ (area_length_pre <> (-1))) ” 
  &&  “ (area_length_pre <> 0) ”
.

Definition xizi_circular_area_read_advance_safety_wit_3 := 
forall (area_length_pre: Z) (data_length_pre: Z) (readidx_pre: Z) (PreH1 : ((readidx_pre + data_length_pre ) <= area_length_pre)) (PreH2 : (0 < area_length_pre)) (PreH3 : (area_length_pre <= 1073741824)) (PreH4 : (0 <= readidx_pre)) (PreH5 : (readidx_pre < area_length_pre)) (PreH6 : (0 <= data_length_pre)) (PreH7 : (data_length_pre <= area_length_pre)) ,
  ((( &( "area_length" ) )) # Int  |-> area_length_pre)
  **  ((( &( "data_length" ) )) # Int  |-> data_length_pre)
  **  ((( &( "readidx" ) )) # Int  |-> readidx_pre)
|--
  “ ((readidx_pre + data_length_pre ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (readidx_pre + data_length_pre )) ”
.

Definition xizi_circular_area_read_advance_safety_wit_4 := 
forall (area_length_pre: Z) (data_length_pre: Z) (readidx_pre: Z) (PreH1 : ((readidx_pre + data_length_pre ) > area_length_pre)) (PreH2 : (0 < area_length_pre)) (PreH3 : (area_length_pre <= 1073741824)) (PreH4 : (0 <= readidx_pre)) (PreH5 : (readidx_pre < area_length_pre)) (PreH6 : (0 <= data_length_pre)) (PreH7 : (data_length_pre <= area_length_pre)) ,
  ((( &( "area_length" ) )) # Int  |-> area_length_pre)
  **  ((( &( "data_length" ) )) # Int  |-> data_length_pre)
  **  ((( &( "readidx" ) )) # Int  |-> readidx_pre)
|--
  “ ((data_length_pre - (area_length_pre - readidx_pre ) ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (data_length_pre - (area_length_pre - readidx_pre ) )) ”
.

Definition xizi_circular_area_read_advance_safety_wit_5 := 
forall (area_length_pre: Z) (data_length_pre: Z) (readidx_pre: Z) (PreH1 : ((readidx_pre + data_length_pre ) > area_length_pre)) (PreH2 : (0 < area_length_pre)) (PreH3 : (area_length_pre <= 1073741824)) (PreH4 : (0 <= readidx_pre)) (PreH5 : (readidx_pre < area_length_pre)) (PreH6 : (0 <= data_length_pre)) (PreH7 : (data_length_pre <= area_length_pre)) ,
  ((( &( "area_length" ) )) # Int  |-> area_length_pre)
  **  ((( &( "data_length" ) )) # Int  |-> data_length_pre)
  **  ((( &( "readidx" ) )) # Int  |-> readidx_pre)
|--
  “ ((area_length_pre - readidx_pre ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (area_length_pre - readidx_pre )) ”
.

Definition xizi_circular_area_read_advance_return_wit_1 := 
(
forall (area_length_pre: Z) (data_length_pre: Z) (readidx_pre: Z) (PreH1 : ((readidx_pre + data_length_pre ) > area_length_pre)) (PreH2 : (0 < area_length_pre)) (PreH3 : (area_length_pre <= 1073741824)) (PreH4 : (0 <= readidx_pre)) (PreH5 : (readidx_pre < area_length_pre)) (PreH6 : (0 <= data_length_pre)) (PreH7 : (data_length_pre <= area_length_pre)) ,
  TT && emp 
|--
  “ (0 <= (data_length_pre - (area_length_pre - readidx_pre ) )) ” 
  &&  “ ((data_length_pre - (area_length_pre - readidx_pre ) ) < area_length_pre) ” 
  &&  “ ((data_length_pre - (area_length_pre - readidx_pre ) ) = ((readidx_pre + data_length_pre ) % ( area_length_pre ) )) ”
  &&  emp
) \/
(
forall (area_length_pre: Z) (data_length_pre: Z) (readidx_pre: Z) (PreH1 : ((readidx_pre + data_length_pre ) > area_length_pre)) (PreH2 : (0 < area_length_pre)) (PreH3 : (area_length_pre <= 1073741824)) (PreH4 : (0 <= readidx_pre)) (PreH5 : (readidx_pre < area_length_pre)) (PreH6 : (0 <= data_length_pre)) (PreH7 : (data_length_pre <= area_length_pre)) ,
  TT && emp 
|--
  “ ((data_length_pre - (area_length_pre - readidx_pre ) ) = ((readidx_pre + data_length_pre ) % ( area_length_pre ) )) ”
  &&  emp
).

Definition xizi_circular_area_read_advance_return_wit_1_split_goal_1 := 
forall (area_length_pre: Z) (data_length_pre: Z) (readidx_pre: Z) (PreH1 : ((readidx_pre + data_length_pre ) > area_length_pre)) (PreH2 : (0 < area_length_pre)) (PreH3 : (area_length_pre <= 1073741824)) (PreH4 : (0 <= readidx_pre)) (PreH5 : (readidx_pre < area_length_pre)) (PreH6 : (0 <= data_length_pre)) (PreH7 : (data_length_pre <= area_length_pre)) ,
  TT && emp 
|--
  “ ((data_length_pre - (area_length_pre - readidx_pre ) ) = ((readidx_pre + data_length_pre ) % ( area_length_pre ) )) ”
.

Definition xizi_circular_area_read_advance_return_wit_2 := 
(
forall (area_length_pre: Z) (data_length_pre: Z) (readidx_pre: Z) (PreH1 : ((readidx_pre + data_length_pre ) <= area_length_pre)) (PreH2 : (0 < area_length_pre)) (PreH3 : (area_length_pre <= 1073741824)) (PreH4 : (0 <= readidx_pre)) (PreH5 : (readidx_pre < area_length_pre)) (PreH6 : (0 <= data_length_pre)) (PreH7 : (data_length_pre <= area_length_pre)) ,
  TT && emp 
|--
  “ (0 <= ((readidx_pre + data_length_pre ) % ( area_length_pre ) )) ” 
  &&  “ (((readidx_pre + data_length_pre ) % ( area_length_pre ) ) < area_length_pre) ” 
  &&  “ (((readidx_pre + data_length_pre ) % ( area_length_pre ) ) = ((readidx_pre + data_length_pre ) % ( area_length_pre ) )) ”
  &&  emp
) \/
(
forall (area_length_pre: Z) (data_length_pre: Z) (readidx_pre: Z) (PreH1 : ((readidx_pre + data_length_pre ) <= area_length_pre)) (PreH2 : (0 < area_length_pre)) (PreH3 : (area_length_pre <= 1073741824)) (PreH4 : (0 <= readidx_pre)) (PreH5 : (readidx_pre < area_length_pre)) (PreH6 : (0 <= data_length_pre)) (PreH7 : (data_length_pre <= area_length_pre)) ,
  TT && emp 
|--
  “ (((readidx_pre + data_length_pre ) % ( area_length_pre ) ) < area_length_pre) ” 
  &&  “ (0 <= ((readidx_pre + data_length_pre ) % ( area_length_pre ) )) ”
  &&  emp
).

Definition xizi_circular_area_read_advance_return_wit_2_split_goal_1 := 
forall (area_length_pre: Z) (data_length_pre: Z) (readidx_pre: Z) (PreH1 : ((readidx_pre + data_length_pre ) <= area_length_pre)) (PreH2 : (0 < area_length_pre)) (PreH3 : (area_length_pre <= 1073741824)) (PreH4 : (0 <= readidx_pre)) (PreH5 : (readidx_pre < area_length_pre)) (PreH6 : (0 <= data_length_pre)) (PreH7 : (data_length_pre <= area_length_pre)) ,
  TT && emp 
|--
  “ (((readidx_pre + data_length_pre ) % ( area_length_pre ) ) < area_length_pre) ”
.

Definition xizi_circular_area_read_advance_return_wit_2_split_goal_2 := 
forall (area_length_pre: Z) (data_length_pre: Z) (readidx_pre: Z) (PreH1 : ((readidx_pre + data_length_pre ) <= area_length_pre)) (PreH2 : (0 < area_length_pre)) (PreH3 : (area_length_pre <= 1073741824)) (PreH4 : (0 <= readidx_pre)) (PreH5 : (readidx_pre < area_length_pre)) (PreH6 : (0 <= data_length_pre)) (PreH7 : (data_length_pre <= area_length_pre)) ,
  TT && emp 
|--
  “ (0 <= ((readidx_pre + data_length_pre ) % ( area_length_pre ) )) ”
.

Module Type VC_Correct.


Axiom proof_of_xizi_circular_area_read_advance_safety_wit_1 : xizi_circular_area_read_advance_safety_wit_1.
Axiom proof_of_xizi_circular_area_read_advance_safety_wit_2 : xizi_circular_area_read_advance_safety_wit_2.
Axiom proof_of_xizi_circular_area_read_advance_safety_wit_3 : xizi_circular_area_read_advance_safety_wit_3.
Axiom proof_of_xizi_circular_area_read_advance_safety_wit_4 : xizi_circular_area_read_advance_safety_wit_4.
Axiom proof_of_xizi_circular_area_read_advance_safety_wit_5 : xizi_circular_area_read_advance_safety_wit_5.
Axiom proof_of_xizi_circular_area_read_advance_return_wit_1 : xizi_circular_area_read_advance_return_wit_1.
Axiom proof_of_xizi_circular_area_read_advance_return_wit_2 : xizi_circular_area_read_advance_return_wit_2.

End VC_Correct.
