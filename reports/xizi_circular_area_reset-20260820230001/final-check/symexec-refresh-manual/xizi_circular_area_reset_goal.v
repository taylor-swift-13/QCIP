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
Require Import
      SimpleC.EE.OUTPUT.xizi.xizi_circular_area_reset.source.xizi_circular_area_reset_lib.
Local Open Scope sac.

(*----- Function CircularAreaReset -----*)

Definition CircularAreaReset_safety_wit_1 := 
forall (circular_area_pre: Z) (buffer_contents: (@list Z)) (operations0: Z) (b_status0: Z) (area_length0: Z) (p_tail0: Z) (p_head0: Z) (writeidx0: Z) (readidx0: Z) (data_buffer0: Z) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations0)
  **  (UCharArray.full data_buffer0 area_length0 buffer_contents )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaReset_safety_wit_2 := 
forall (circular_area_pre: Z) (buffer_contents: (@list Z)) (operations0: Z) (b_status0: Z) (area_length0: Z) (p_tail0: Z) (p_head0: Z) (readidx0: Z) (data_buffer0: Z) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations0)
  **  (UCharArray.full data_buffer0 area_length0 buffer_contents )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaReset_safety_wit_3 := 
forall (circular_area_pre: Z) (buffer_contents: (@list Z)) (operations0: Z) (b_status0: Z) (area_length0: Z) (p_tail0: Z) (p_head0: Z) (data_buffer0: Z) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations0)
  **  (UCharArray.full data_buffer0 area_length0 buffer_contents )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaReset_return_wit_1 := 
(
forall (circular_area_pre: Z) (buffer_contents: (@list Z)) (operations0: Z) (area_length0: Z) (p_tail0: Z) (p_head0: Z) (data_buffer0: Z) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations0)
  **  (UCharArray.full data_buffer0 area_length0 buffer_contents )
|--
  EX (data_buffer1: Z)  (readidx1: Z)  (writeidx1: Z)  (p_head1: Z)  (p_tail1: Z)  (area_length1: Z)  (b_status1: Z)  (operations1: Z) ,
  “ (CircularAreaResetPost data_buffer0 p_head0 p_tail0 area_length0 operations0 data_buffer1 readidx1 writeidx1 p_head1 p_tail1 area_length1 b_status1 operations1 ) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer1)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx1)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx1)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head1)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail1)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length1)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status1)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations1)
  **  (UCharArray.full data_buffer1 area_length1 buffer_contents )
) \/
(
forall (operations0: Z) (area_length0: Z) (p_tail0: Z) (p_head0: Z) (data_buffer0: Z) ,
  TT && emp 
|--
  “ (CircularAreaResetPost data_buffer0 p_head0 p_tail0 area_length0 operations0 data_buffer0 0 0 p_head0 p_tail0 area_length0 0 operations0 ) ”
  &&  emp
).

Definition CircularAreaReset_return_wit_1_split_goal_1 := 
forall (operations0: Z) (area_length0: Z) (p_tail0: Z) (p_head0: Z) (data_buffer0: Z) ,
  (CircularAreaResetPost data_buffer0 p_head0 p_tail0 area_length0 operations0 data_buffer0 0 0 p_head0 p_tail0 area_length0 0 operations0 )
.

Module Type VC_Correct.


Axiom proof_of_CircularAreaReset_safety_wit_1 : CircularAreaReset_safety_wit_1.
Axiom proof_of_CircularAreaReset_safety_wit_2 : CircularAreaReset_safety_wit_2.
Axiom proof_of_CircularAreaReset_safety_wit_3 : CircularAreaReset_safety_wit_3.
Axiom proof_of_CircularAreaReset_return_wit_1 : CircularAreaReset_return_wit_1.

End VC_Correct.
