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
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_read_advance.source Require Import xizi_circular_area_read_advance_lib.
Local Open Scope sac.

(*----- Function CircularAreaDivideRdData -----*)

Definition CircularAreaDivideRdData_safety_wit_1 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (PreH1 : (circular_area_pre = 0)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaDivideRdData_safety_wit_2 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (0 <= data_length_pre)) (PreH3 : (data_length_pre <= area_length)) (PreH4 : ((readidx + data_length_pre ) <= 4294967295)) (PreH5 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH6 : (p_head = data_buffer)) (PreH7 : (p_tail = (data_buffer + area_length ))) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaDivideRdData_safety_wit_3 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = 0)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  “ False ”
.

Definition CircularAreaDivideRdData_safety_wit_4 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (0 <= data_length_pre)) (PreH4 : (data_length_pre <= area_length)) (PreH5 : ((readidx + data_length_pre ) <= 4294967295)) (PreH6 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ False ”
.

Definition CircularAreaDivideRdData_safety_wit_5 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = 0)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaDivideRdData_safety_wit_6 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (0 <= data_length_pre)) (PreH4 : (data_length_pre <= area_length)) (PreH5 : ((readidx + data_length_pre ) <= 4294967295)) (PreH6 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaDivideRdData_safety_wit_7 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + data_length_pre )) (32)) <= area_length)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 <= data_length_pre)) (PreH5 : (data_length_pre <= area_length)) (PreH6 : ((readidx + data_length_pre ) <= 4294967295)) (PreH7 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH8 : (p_head = data_buffer)) (PreH9 : (p_tail = (data_buffer + area_length ))) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaDivideRdData_safety_wit_8 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + data_length_pre )) (32)) > area_length)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 <= data_length_pre)) (PreH5 : (data_length_pre <= area_length)) (PreH6 : ((readidx + data_length_pre ) <= 4294967295)) (PreH7 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH8 : (p_head = data_buffer)) (PreH9 : (p_tail = (data_buffer + area_length ))) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaDivideRdData_return_wit_1 := 
(
forall (data_length_pre: Z) (circular_area_pre: Z) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + data_length_pre )) (32)) > area_length)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 <= data_length_pre)) (PreH5 : (data_length_pre <= area_length)) (PreH6 : ((readidx + data_length_pre ) <= 4294967295)) (PreH7 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH8 : (p_head = data_buffer)) (PreH9 : (p_tail = (data_buffer + area_length ))) ,
  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= area_length) ” 
  &&  “ ((readidx + data_length_pre ) <= 4294967295) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx data_length_pre area_length 1 ) ”
  &&  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (data_length_pre: Z) (circular_area_pre: Z) (buffer_contents: (@list Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + data_length_pre )) (32)) > area_length)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 <= data_length_pre)) (PreH5 : (data_length_pre <= area_length)) (PreH6 : ((readidx + data_length_pre ) <= 4294967295)) (PreH7 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH8 : (p_head = data_buffer)) (PreH9 : (p_tail = (data_buffer + area_length ))) ,
  TT && emp 
|--
  “ (CircularAreaDivideRdDataResult readidx data_length_pre area_length 1 ) ”
  &&  emp
).

Definition CircularAreaDivideRdData_return_wit_1_split_goal_1 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (buffer_contents: (@list Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + data_length_pre )) (32)) > area_length)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 <= data_length_pre)) (PreH5 : (data_length_pre <= area_length)) (PreH6 : ((readidx + data_length_pre ) <= 4294967295)) (PreH7 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH8 : (p_head = data_buffer)) (PreH9 : (p_tail = (data_buffer + area_length ))) ,
  (CircularAreaDivideRdDataResult readidx data_length_pre area_length 1 )
.

Definition CircularAreaDivideRdData_return_wit_2 := 
(
forall (data_length_pre: Z) (circular_area_pre: Z) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + data_length_pre )) (32)) <= area_length)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 <= data_length_pre)) (PreH5 : (data_length_pre <= area_length)) (PreH6 : ((readidx + data_length_pre ) <= 4294967295)) (PreH7 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH8 : (p_head = data_buffer)) (PreH9 : (p_tail = (data_buffer + area_length ))) ,
  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= area_length) ” 
  &&  “ ((readidx + data_length_pre ) <= 4294967295) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx data_length_pre area_length 0 ) ”
  &&  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (data_length_pre: Z) (circular_area_pre: Z) (buffer_contents: (@list Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + data_length_pre )) (32)) <= area_length)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 <= data_length_pre)) (PreH5 : (data_length_pre <= area_length)) (PreH6 : ((readidx + data_length_pre ) <= 4294967295)) (PreH7 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH8 : (p_head = data_buffer)) (PreH9 : (p_tail = (data_buffer + area_length ))) ,
  TT && emp 
|--
  “ (CircularAreaDivideRdDataResult readidx data_length_pre area_length 0 ) ”
  &&  emp
).

Definition CircularAreaDivideRdData_return_wit_2_split_goal_1 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (buffer_contents: (@list Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + data_length_pre )) (32)) <= area_length)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 <= data_length_pre)) (PreH5 : (data_length_pre <= area_length)) (PreH6 : ((readidx + data_length_pre ) <= 4294967295)) (PreH7 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH8 : (p_head = data_buffer)) (PreH9 : (p_tail = (data_buffer + area_length ))) ,
  (CircularAreaDivideRdDataResult readidx data_length_pre area_length 0 )
.

Definition CircularAreaDivideRdData_return_wit_3 := 
forall (circular_area_pre: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = 0)) ,
  TT && emp 
|--
  “ (circular_area_pre = 0) ” 
  &&  “ (1 = 1) ”
  &&  emp
.

Module Type VC_Correct.


Axiom proof_of_CircularAreaDivideRdData_safety_wit_1 : CircularAreaDivideRdData_safety_wit_1.
Axiom proof_of_CircularAreaDivideRdData_safety_wit_2 : CircularAreaDivideRdData_safety_wit_2.
Axiom proof_of_CircularAreaDivideRdData_safety_wit_3 : CircularAreaDivideRdData_safety_wit_3.
Axiom proof_of_CircularAreaDivideRdData_safety_wit_4 : CircularAreaDivideRdData_safety_wit_4.
Axiom proof_of_CircularAreaDivideRdData_safety_wit_5 : CircularAreaDivideRdData_safety_wit_5.
Axiom proof_of_CircularAreaDivideRdData_safety_wit_6 : CircularAreaDivideRdData_safety_wit_6.
Axiom proof_of_CircularAreaDivideRdData_safety_wit_7 : CircularAreaDivideRdData_safety_wit_7.
Axiom proof_of_CircularAreaDivideRdData_safety_wit_8 : CircularAreaDivideRdData_safety_wit_8.
Axiom proof_of_CircularAreaDivideRdData_return_wit_1 : CircularAreaDivideRdData_return_wit_1.
Axiom proof_of_CircularAreaDivideRdData_return_wit_2 : CircularAreaDivideRdData_return_wit_2.
Axiom proof_of_CircularAreaDivideRdData_return_wit_3 : CircularAreaDivideRdData_return_wit_3.

End VC_Correct.
