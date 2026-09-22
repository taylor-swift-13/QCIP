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
      SimpleC.EE.OUTPUT.xizi.xizi_circular_area_write_advance.source.xizi_circular_area_write_advance_lib.
Local Open Scope sac.

(*----- Function CircularAreaDivideWrData -----*)

Definition CircularAreaDivideWrData_safety_wit_1 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (PreH1 : (circular_area_pre = 0)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaDivideWrData_safety_wit_2 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (buffer_contents: (@list Z)) (circular_area_operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (0 < area_length)) (PreH3 : (area_length <= 256)) (PreH4 : (0 <= readidx)) (PreH5 : (readidx < area_length)) (PreH6 : (0 <= writeidx)) (PreH7 : (writeidx < area_length)) (PreH8 : (0 <= data_length_pre)) (PreH9 : (data_length_pre <= area_length)) (PreH10 : (p_head = data_buffer)) (PreH11 : (p_tail = (data_buffer + area_length ))) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> circular_area_operations)
  **  (UCharArray.full data_buffer area_length buffer_contents )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaDivideWrData_safety_wit_3 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = 0)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  “ False ”
.

Definition CircularAreaDivideWrData_safety_wit_4 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (buffer_contents: (@list Z)) (circular_area_operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (0 < area_length)) (PreH4 : (area_length <= 256)) (PreH5 : (0 <= readidx)) (PreH6 : (readidx < area_length)) (PreH7 : (0 <= writeidx)) (PreH8 : (writeidx < area_length)) (PreH9 : (0 <= data_length_pre)) (PreH10 : (data_length_pre <= area_length)) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> circular_area_operations)
  **  (UCharArray.full data_buffer area_length buffer_contents )
|--
  “ False ”
.

Definition CircularAreaDivideWrData_safety_wit_5 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = 0)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaDivideWrData_safety_wit_6 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (buffer_contents: (@list Z)) (circular_area_operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (0 < area_length)) (PreH4 : (area_length <= 256)) (PreH5 : (0 <= readidx)) (PreH6 : (readidx < area_length)) (PreH7 : (0 <= writeidx)) (PreH8 : (writeidx < area_length)) (PreH9 : (0 <= data_length_pre)) (PreH10 : (data_length_pre <= area_length)) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> circular_area_operations)
  **  (UCharArray.full data_buffer area_length buffer_contents )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaDivideWrData_safety_wit_7 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (buffer_contents: (@list Z)) (circular_area_operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : ((writeidx + data_length_pre ) <= area_length)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 < area_length)) (PreH5 : (area_length <= 256)) (PreH6 : (0 <= readidx)) (PreH7 : (readidx < area_length)) (PreH8 : (0 <= writeidx)) (PreH9 : (writeidx < area_length)) (PreH10 : (0 <= data_length_pre)) (PreH11 : (data_length_pre <= area_length)) (PreH12 : (p_head = data_buffer)) (PreH13 : (p_tail = (data_buffer + area_length ))) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> circular_area_operations)
  **  (UCharArray.full data_buffer area_length buffer_contents )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaDivideWrData_safety_wit_8 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (buffer_contents: (@list Z)) (circular_area_operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : ((writeidx + data_length_pre ) > area_length)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 < area_length)) (PreH5 : (area_length <= 256)) (PreH6 : (0 <= readidx)) (PreH7 : (readidx < area_length)) (PreH8 : (0 <= writeidx)) (PreH9 : (writeidx < area_length)) (PreH10 : (0 <= data_length_pre)) (PreH11 : (data_length_pre <= area_length)) (PreH12 : (p_head = data_buffer)) (PreH13 : (p_tail = (data_buffer + area_length ))) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> circular_area_operations)
  **  (UCharArray.full data_buffer area_length buffer_contents )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaDivideWrData_return_wit_1 := 
(
forall (data_length_pre: Z) (circular_area_pre: Z) (buffer_contents: (@list Z)) (circular_area_operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : ((writeidx + data_length_pre ) > area_length)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 < area_length)) (PreH5 : (area_length <= 256)) (PreH6 : (0 <= readidx)) (PreH7 : (readidx < area_length)) (PreH8 : (0 <= writeidx)) (PreH9 : (writeidx < area_length)) (PreH10 : (0 <= data_length_pre)) (PreH11 : (data_length_pre <= area_length)) (PreH12 : (p_head = data_buffer)) (PreH13 : (p_tail = (data_buffer + area_length ))) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> circular_area_operations)
  **  (UCharArray.full data_buffer area_length buffer_contents )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ (area_length <= 256) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (readidx < area_length) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ (writeidx < area_length) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= area_length) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx data_length_pre area_length 1 ) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> circular_area_operations)
  **  (UCharArray.full data_buffer area_length buffer_contents )
) \/
(
forall (data_length_pre: Z) (circular_area_pre: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : ((writeidx + data_length_pre ) > area_length)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 < area_length)) (PreH5 : (area_length <= 256)) (PreH6 : (0 <= readidx)) (PreH7 : (readidx < area_length)) (PreH8 : (0 <= writeidx)) (PreH9 : (writeidx < area_length)) (PreH10 : (0 <= data_length_pre)) (PreH11 : (data_length_pre <= area_length)) (PreH12 : (p_head = data_buffer)) (PreH13 : (p_tail = (data_buffer + area_length ))) ,
  TT && emp 
|--
  “ (CircularAreaDivideWrDataResult writeidx data_length_pre area_length 1 ) ”
  &&  emp
).

Definition CircularAreaDivideWrData_return_wit_1_split_goal_1 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : ((writeidx + data_length_pre ) > area_length)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 < area_length)) (PreH5 : (area_length <= 256)) (PreH6 : (0 <= readidx)) (PreH7 : (readidx < area_length)) (PreH8 : (0 <= writeidx)) (PreH9 : (writeidx < area_length)) (PreH10 : (0 <= data_length_pre)) (PreH11 : (data_length_pre <= area_length)) (PreH12 : (p_head = data_buffer)) (PreH13 : (p_tail = (data_buffer + area_length ))) ,
  (CircularAreaDivideWrDataResult writeidx data_length_pre area_length 1 )
.

Definition CircularAreaDivideWrData_return_wit_2 := 
(
forall (data_length_pre: Z) (circular_area_pre: Z) (buffer_contents: (@list Z)) (circular_area_operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : ((writeidx + data_length_pre ) <= area_length)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 < area_length)) (PreH5 : (area_length <= 256)) (PreH6 : (0 <= readidx)) (PreH7 : (readidx < area_length)) (PreH8 : (0 <= writeidx)) (PreH9 : (writeidx < area_length)) (PreH10 : (0 <= data_length_pre)) (PreH11 : (data_length_pre <= area_length)) (PreH12 : (p_head = data_buffer)) (PreH13 : (p_tail = (data_buffer + area_length ))) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> circular_area_operations)
  **  (UCharArray.full data_buffer area_length buffer_contents )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ (area_length <= 256) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (readidx < area_length) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ (writeidx < area_length) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= area_length) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx data_length_pre area_length 0 ) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> circular_area_operations)
  **  (UCharArray.full data_buffer area_length buffer_contents )
) \/
(
forall (data_length_pre: Z) (circular_area_pre: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : ((writeidx + data_length_pre ) <= area_length)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 < area_length)) (PreH5 : (area_length <= 256)) (PreH6 : (0 <= readidx)) (PreH7 : (readidx < area_length)) (PreH8 : (0 <= writeidx)) (PreH9 : (writeidx < area_length)) (PreH10 : (0 <= data_length_pre)) (PreH11 : (data_length_pre <= area_length)) (PreH12 : (p_head = data_buffer)) (PreH13 : (p_tail = (data_buffer + area_length ))) ,
  TT && emp 
|--
  “ (CircularAreaDivideWrDataResult writeidx data_length_pre area_length 0 ) ”
  &&  emp
).

Definition CircularAreaDivideWrData_return_wit_2_split_goal_1 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : ((writeidx + data_length_pre ) <= area_length)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 < area_length)) (PreH5 : (area_length <= 256)) (PreH6 : (0 <= readidx)) (PreH7 : (readidx < area_length)) (PreH8 : (0 <= writeidx)) (PreH9 : (writeidx < area_length)) (PreH10 : (0 <= data_length_pre)) (PreH11 : (data_length_pre <= area_length)) (PreH12 : (p_head = data_buffer)) (PreH13 : (p_tail = (data_buffer + area_length ))) ,
  (CircularAreaDivideWrDataResult writeidx data_length_pre area_length 0 )
.

Definition CircularAreaDivideWrData_return_wit_3 := 
forall (circular_area_pre: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = 0)) ,
  TT && emp 
|--
  “ (circular_area_pre = 0) ” 
  &&  “ (1 = 1) ”
  &&  emp
.

Module Type VC_Correct.


Axiom proof_of_CircularAreaDivideWrData_safety_wit_1 : CircularAreaDivideWrData_safety_wit_1.
Axiom proof_of_CircularAreaDivideWrData_safety_wit_2 : CircularAreaDivideWrData_safety_wit_2.
Axiom proof_of_CircularAreaDivideWrData_safety_wit_3 : CircularAreaDivideWrData_safety_wit_3.
Axiom proof_of_CircularAreaDivideWrData_safety_wit_4 : CircularAreaDivideWrData_safety_wit_4.
Axiom proof_of_CircularAreaDivideWrData_safety_wit_5 : CircularAreaDivideWrData_safety_wit_5.
Axiom proof_of_CircularAreaDivideWrData_safety_wit_6 : CircularAreaDivideWrData_safety_wit_6.
Axiom proof_of_CircularAreaDivideWrData_safety_wit_7 : CircularAreaDivideWrData_safety_wit_7.
Axiom proof_of_CircularAreaDivideWrData_safety_wit_8 : CircularAreaDivideWrData_safety_wit_8.
Axiom proof_of_CircularAreaDivideWrData_return_wit_1 : CircularAreaDivideWrData_return_wit_1.
Axiom proof_of_CircularAreaDivideWrData_return_wit_2 : CircularAreaDivideWrData_return_wit_2.
Axiom proof_of_CircularAreaDivideWrData_return_wit_3 : CircularAreaDivideWrData_return_wit_3.

End VC_Correct.
