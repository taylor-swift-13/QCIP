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
Require Import xizi_circular_area_data_length_lib.
Local Open Scope sac.

(*----- Function CircularAreaIsFull -----*)

Definition CircularAreaIsFull_safety_wit_1 := 
forall (circular_area_pre: Z) (contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (0 < area_length)) (PreH3 : (area_length <= UINT_MAX)) (PreH4 : (0 <= readidx)) (PreH5 : (readidx <= 255)) (PreH6 : (0 <= writeidx)) (PreH7 : (writeidx <= 255)) (PreH8 : (readidx < area_length)) (PreH9 : (writeidx < area_length)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsFull_safety_wit_2 := 
forall (circular_area_pre: Z) (contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (0 < area_length)) (PreH4 : (area_length <= UINT_MAX)) (PreH5 : (0 <= readidx)) (PreH6 : (readidx <= 255)) (PreH7 : (0 <= writeidx)) (PreH8 : (writeidx <= 255)) (PreH9 : (readidx < area_length)) (PreH10 : (writeidx < area_length)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
|--
  “ False ”
.

Definition CircularAreaIsFull_safety_wit_3 := 
forall (circular_area_pre: Z) (contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (0 < area_length)) (PreH4 : (area_length <= UINT_MAX)) (PreH5 : (0 <= readidx)) (PreH6 : (readidx <= 255)) (PreH7 : (0 <= writeidx)) (PreH8 : (writeidx <= 255)) (PreH9 : (readidx < area_length)) (PreH10 : (writeidx < area_length)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsFull_safety_wit_4 := 
forall (circular_area_pre: Z) (contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (b_status <> 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (0 < area_length)) (PreH6 : (area_length <= UINT_MAX)) (PreH7 : (0 <= readidx)) (PreH8 : (readidx <= 255)) (PreH9 : (0 <= writeidx)) (PreH10 : (writeidx <= 255)) (PreH11 : (readidx < area_length)) (PreH12 : (writeidx < area_length)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaIsFull_safety_wit_5 := 
forall (circular_area_pre: Z) (contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (readidx <> writeidx)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 < area_length)) (PreH5 : (area_length <= UINT_MAX)) (PreH6 : (0 <= readidx)) (PreH7 : (readidx <= 255)) (PreH8 : (0 <= writeidx)) (PreH9 : (writeidx <= 255)) (PreH10 : (readidx < area_length)) (PreH11 : (writeidx < area_length)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsFull_safety_wit_6 := 
forall (circular_area_pre: Z) (contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (b_status = 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (0 < area_length)) (PreH6 : (area_length <= UINT_MAX)) (PreH7 : (0 <= readidx)) (PreH8 : (readidx <= 255)) (PreH9 : (0 <= writeidx)) (PreH10 : (writeidx <= 255)) (PreH11 : (readidx < area_length)) (PreH12 : (writeidx < area_length)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsFull_return_wit_1 := 
(
forall (circular_area_pre: Z) (contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (readidx <> writeidx)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 < area_length)) (PreH5 : (area_length <= UINT_MAX)) (PreH6 : (0 <= readidx)) (PreH7 : (readidx <= 255)) (PreH8 : (0 <= writeidx)) (PreH9 : (writeidx <= 255)) (PreH10 : (readidx < area_length)) (PreH11 : (writeidx < area_length)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
|--
  “ (CircularAreaIsFullResult readidx writeidx b_status 0 ) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
) \/
(
forall (circular_area_pre: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (PreH1 : (readidx <> writeidx)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 < area_length)) (PreH5 : (area_length <= UINT_MAX)) (PreH6 : (0 <= readidx)) (PreH7 : (readidx <= 255)) (PreH8 : (0 <= writeidx)) (PreH9 : (writeidx <= 255)) (PreH10 : (readidx < area_length)) (PreH11 : (writeidx < area_length)) ,
  TT && emp 
|--
  “ (CircularAreaIsFullResult readidx writeidx b_status 0 ) ”
  &&  emp
).

Definition CircularAreaIsFull_return_wit_1_split_goal_1 := 
forall (circular_area_pre: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (PreH1 : (readidx <> writeidx)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 < area_length)) (PreH5 : (area_length <= UINT_MAX)) (PreH6 : (0 <= readidx)) (PreH7 : (readidx <= 255)) (PreH8 : (0 <= writeidx)) (PreH9 : (writeidx <= 255)) (PreH10 : (readidx < area_length)) (PreH11 : (writeidx < area_length)) ,
  (CircularAreaIsFullResult readidx writeidx b_status 0 )
.

Definition CircularAreaIsFull_return_wit_2 := 
(
forall (circular_area_pre: Z) (contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (b_status = 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (0 < area_length)) (PreH6 : (area_length <= UINT_MAX)) (PreH7 : (0 <= readidx)) (PreH8 : (readidx <= 255)) (PreH9 : (0 <= writeidx)) (PreH10 : (writeidx <= 255)) (PreH11 : (readidx < area_length)) (PreH12 : (writeidx < area_length)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
|--
  “ (CircularAreaIsFullResult readidx writeidx b_status 0 ) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
) \/
(
forall (circular_area_pre: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (PreH1 : (b_status = 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (0 < area_length)) (PreH6 : (area_length <= UINT_MAX)) (PreH7 : (0 <= readidx)) (PreH8 : (readidx <= 255)) (PreH9 : (0 <= writeidx)) (PreH10 : (writeidx <= 255)) (PreH11 : (readidx < area_length)) (PreH12 : (writeidx < area_length)) ,
  TT && emp 
|--
  “ (CircularAreaIsFullResult readidx writeidx b_status 0 ) ”
  &&  emp
).

Definition CircularAreaIsFull_return_wit_2_split_goal_1 := 
forall (circular_area_pre: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (PreH1 : (b_status = 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (0 < area_length)) (PreH6 : (area_length <= UINT_MAX)) (PreH7 : (0 <= readidx)) (PreH8 : (readidx <= 255)) (PreH9 : (0 <= writeidx)) (PreH10 : (writeidx <= 255)) (PreH11 : (readidx < area_length)) (PreH12 : (writeidx < area_length)) ,
  (CircularAreaIsFullResult readidx writeidx b_status 0 )
.

Definition CircularAreaIsFull_return_wit_3 := 
(
forall (circular_area_pre: Z) (contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (b_status <> 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (0 < area_length)) (PreH6 : (area_length <= UINT_MAX)) (PreH7 : (0 <= readidx)) (PreH8 : (readidx <= 255)) (PreH9 : (0 <= writeidx)) (PreH10 : (writeidx <= 255)) (PreH11 : (readidx < area_length)) (PreH12 : (writeidx < area_length)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
|--
  “ (CircularAreaIsFullResult readidx writeidx b_status 1 ) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
) \/
(
forall (circular_area_pre: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (PreH1 : (b_status <> 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (0 < area_length)) (PreH6 : (area_length <= UINT_MAX)) (PreH7 : (0 <= readidx)) (PreH8 : (readidx <= 255)) (PreH9 : (0 <= writeidx)) (PreH10 : (writeidx <= 255)) (PreH11 : (readidx < area_length)) (PreH12 : (writeidx < area_length)) ,
  TT && emp 
|--
  “ (CircularAreaIsFullResult readidx writeidx b_status 1 ) ”
  &&  emp
).

Definition CircularAreaIsFull_return_wit_3_split_goal_1 := 
forall (circular_area_pre: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (PreH1 : (b_status <> 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (0 < area_length)) (PreH6 : (area_length <= UINT_MAX)) (PreH7 : (0 <= readidx)) (PreH8 : (readidx <= 255)) (PreH9 : (0 <= writeidx)) (PreH10 : (writeidx <= 255)) (PreH11 : (readidx < area_length)) (PreH12 : (writeidx < area_length)) ,
  (CircularAreaIsFullResult readidx writeidx b_status 1 )
.

(*----- Function CircularAreaGetDataLength -----*)

Definition CircularAreaGetDataLength_safety_wit_1 := 
forall (circular_area_pre: Z) (PreH1 : (circular_area_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaGetDataLength_safety_wit_2 := 
forall (circular_area_pre: Z) (contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (0 < area_length)) (PreH3 : (area_length <= UINT_MAX)) (PreH4 : (0 <= readidx)) (PreH5 : (readidx <= 255)) (PreH6 : (0 <= writeidx)) (PreH7 : (writeidx <= 255)) (PreH8 : (readidx < area_length)) (PreH9 : (writeidx < area_length)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaGetDataLength_safety_wit_3 := 
forall (circular_area_pre: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  “ False ”
.

Definition CircularAreaGetDataLength_safety_wit_4 := 
forall (circular_area_pre: Z) (contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (0 < area_length)) (PreH4 : (area_length <= UINT_MAX)) (PreH5 : (0 <= readidx)) (PreH6 : (readidx <= 255)) (PreH7 : (0 <= writeidx)) (PreH8 : (writeidx <= 255)) (PreH9 : (readidx < area_length)) (PreH10 : (writeidx < area_length)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
|--
  “ False ”
.

Definition CircularAreaGetDataLength_safety_wit_5 := 
forall (circular_area_pre: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  “ (1 <> (INT_MIN)) ”
.

Definition CircularAreaGetDataLength_safety_wit_6 := 
forall (circular_area_pre: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaGetDataLength_safety_wit_7 := 
forall (circular_area_pre: Z) (contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (0 < area_length)) (PreH4 : (area_length <= UINT_MAX)) (PreH5 : (0 <= readidx)) (PreH6 : (readidx <= 255)) (PreH7 : (0 <= writeidx)) (PreH8 : (writeidx <= 255)) (PreH9 : (readidx < area_length)) (PreH10 : (writeidx < area_length)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaGetDataLength_safety_wit_8 := 
forall (circular_area_pre: Z) (contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (PreH1 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 < area_length)) (PreH5 : (area_length <= UINT_MAX)) (PreH6 : (0 <= readidx)) (PreH7 : (readidx <= 255)) (PreH8 : (0 <= writeidx)) (PreH9 : (writeidx <= 255)) (PreH10 : (readidx < area_length)) (PreH11 : (writeidx < area_length)) (PreH12 : (retval = 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  “ (area_length <> 0) ”
.

Definition CircularAreaGetDataLength_safety_wit_9 := 
forall (circular_area_pre: Z) (contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (PreH1 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 < area_length)) (PreH5 : (area_length <= UINT_MAX)) (PreH6 : (0 <= readidx)) (PreH7 : (readidx <= 255)) (PreH8 : (0 <= writeidx)) (PreH9 : (writeidx <= 255)) (PreH10 : (readidx < area_length)) (PreH11 : (writeidx < area_length)) (PreH12 : (retval = 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  “ ((writeidx - readidx ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (writeidx - readidx )) ”
.

Definition CircularAreaGetDataLength_return_wit_1 := 
(
forall (circular_area_pre: Z) (contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (PreH1 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 < area_length)) (PreH5 : (area_length <= UINT_MAX)) (PreH6 : (0 <= readidx)) (PreH7 : (readidx <= 255)) (PreH8 : (0 <= writeidx)) (PreH9 : (writeidx <= 255)) (PreH10 : (readidx < area_length)) (PreH11 : (writeidx < area_length)) (PreH12 : (retval = 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (CircularAreaDataLengthResult readidx writeidx area_length b_status ((unsigned_last_nbits (((unsigned_last_nbits ((writeidx - readidx )) (32)) + area_length )) (32)) % ( area_length ) ) ) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
) \/
(
forall (circular_area_pre: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (retval: Z) (PreH1 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 < area_length)) (PreH5 : (area_length <= UINT_MAX)) (PreH6 : (0 <= readidx)) (PreH7 : (readidx <= 255)) (PreH8 : (0 <= writeidx)) (PreH9 : (writeidx <= 255)) (PreH10 : (readidx < area_length)) (PreH11 : (writeidx < area_length)) (PreH12 : (retval = 0)) ,
  TT && emp 
|--
  “ (CircularAreaDataLengthResult readidx writeidx area_length b_status ((unsigned_last_nbits (((unsigned_last_nbits ((writeidx - readidx )) (32)) + area_length )) (32)) % ( area_length ) ) ) ”
  &&  emp
).

Definition CircularAreaGetDataLength_return_wit_1_split_goal_1 := 
forall (circular_area_pre: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (retval: Z) (PreH1 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 < area_length)) (PreH5 : (area_length <= UINT_MAX)) (PreH6 : (0 <= readidx)) (PreH7 : (readidx <= 255)) (PreH8 : (0 <= writeidx)) (PreH9 : (writeidx <= 255)) (PreH10 : (readidx < area_length)) (PreH11 : (writeidx < area_length)) (PreH12 : (retval = 0)) ,
  (CircularAreaDataLengthResult readidx writeidx area_length b_status ((unsigned_last_nbits (((unsigned_last_nbits ((writeidx - readidx )) (32)) + area_length )) (32)) % ( area_length ) ) )
.

Definition CircularAreaGetDataLength_return_wit_2 := 
(
forall (circular_area_pre: Z) (contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (PreH1 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 < area_length)) (PreH5 : (area_length <= UINT_MAX)) (PreH6 : (0 <= readidx)) (PreH7 : (readidx <= 255)) (PreH8 : (0 <= writeidx)) (PreH9 : (writeidx <= 255)) (PreH10 : (readidx < area_length)) (PreH11 : (writeidx < area_length)) (PreH12 : (retval <> 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (CircularAreaDataLengthResult readidx writeidx area_length b_status area_length ) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
) \/
(
forall (circular_area_pre: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (retval: Z) (PreH1 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 < area_length)) (PreH5 : (area_length <= UINT_MAX)) (PreH6 : (0 <= readidx)) (PreH7 : (readidx <= 255)) (PreH8 : (0 <= writeidx)) (PreH9 : (writeidx <= 255)) (PreH10 : (readidx < area_length)) (PreH11 : (writeidx < area_length)) (PreH12 : (retval <> 0)) ,
  TT && emp 
|--
  “ (CircularAreaDataLengthResult readidx writeidx area_length b_status area_length ) ”
  &&  emp
).

Definition CircularAreaGetDataLength_return_wit_2_split_goal_1 := 
forall (circular_area_pre: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (retval: Z) (PreH1 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 < area_length)) (PreH5 : (area_length <= UINT_MAX)) (PreH6 : (0 <= readidx)) (PreH7 : (readidx <= 255)) (PreH8 : (0 <= writeidx)) (PreH9 : (writeidx <= 255)) (PreH10 : (readidx < area_length)) (PreH11 : (writeidx < area_length)) (PreH12 : (retval <> 0)) ,
  (CircularAreaDataLengthResult readidx writeidx area_length b_status area_length )
.

Definition CircularAreaGetDataLength_return_wit_3 := 
forall (circular_area_pre: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = 0)) ,
  TT && emp 
|--
  “ (circular_area_pre = 0) ” 
  &&  “ ((unsigned_last_nbits ((-1)) (32)) = UINT_MAX) ”
  &&  emp
.

Definition CircularAreaGetDataLength_partial_solve_wit_1_pure := 
forall (circular_area_pre: Z) (contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (0 < area_length)) (PreH4 : (area_length <= UINT_MAX)) (PreH5 : (0 <= readidx)) (PreH6 : (readidx <= 255)) (PreH7 : (0 <= writeidx)) (PreH8 : (writeidx <= 255)) (PreH9 : (readidx < area_length)) (PreH10 : (writeidx < area_length)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ (area_length <= UINT_MAX) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (readidx <= 255) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ (writeidx <= 255) ” 
  &&  “ (readidx < area_length) ” 
  &&  “ (writeidx < area_length) ”
.

Definition CircularAreaGetDataLength_partial_solve_wit_1_aux := 
forall (circular_area_pre: Z) (contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (0 < area_length)) (PreH4 : (area_length <= UINT_MAX)) (PreH5 : (0 <= readidx)) (PreH6 : (readidx <= 255)) (PreH7 : (0 <= writeidx)) (PreH8 : (writeidx <= 255)) (PreH9 : (readidx < area_length)) (PreH10 : (writeidx < area_length)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ (area_length <= UINT_MAX) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (readidx <= 255) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ (writeidx <= 255) ” 
  &&  “ (readidx < area_length) ” 
  &&  “ (writeidx < area_length) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ (area_length <= UINT_MAX) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (readidx <= 255) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ (writeidx <= 255) ” 
  &&  “ (readidx < area_length) ” 
  &&  “ (writeidx < area_length) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
.

Definition CircularAreaGetDataLength_partial_solve_wit_1 := CircularAreaGetDataLength_partial_solve_wit_1_pure -> CircularAreaGetDataLength_partial_solve_wit_1_aux.

Module Type VC_Correct.


Axiom proof_of_CircularAreaIsFull_safety_wit_1 : CircularAreaIsFull_safety_wit_1.
Axiom proof_of_CircularAreaIsFull_safety_wit_2 : CircularAreaIsFull_safety_wit_2.
Axiom proof_of_CircularAreaIsFull_safety_wit_3 : CircularAreaIsFull_safety_wit_3.
Axiom proof_of_CircularAreaIsFull_safety_wit_4 : CircularAreaIsFull_safety_wit_4.
Axiom proof_of_CircularAreaIsFull_safety_wit_5 : CircularAreaIsFull_safety_wit_5.
Axiom proof_of_CircularAreaIsFull_safety_wit_6 : CircularAreaIsFull_safety_wit_6.
Axiom proof_of_CircularAreaIsFull_return_wit_1 : CircularAreaIsFull_return_wit_1.
Axiom proof_of_CircularAreaIsFull_return_wit_2 : CircularAreaIsFull_return_wit_2.
Axiom proof_of_CircularAreaIsFull_return_wit_3 : CircularAreaIsFull_return_wit_3.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_1 : CircularAreaGetDataLength_safety_wit_1.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_2 : CircularAreaGetDataLength_safety_wit_2.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_3 : CircularAreaGetDataLength_safety_wit_3.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_4 : CircularAreaGetDataLength_safety_wit_4.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_5 : CircularAreaGetDataLength_safety_wit_5.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_6 : CircularAreaGetDataLength_safety_wit_6.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_7 : CircularAreaGetDataLength_safety_wit_7.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_8 : CircularAreaGetDataLength_safety_wit_8.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_9 : CircularAreaGetDataLength_safety_wit_9.
Axiom proof_of_CircularAreaGetDataLength_return_wit_1 : CircularAreaGetDataLength_return_wit_1.
Axiom proof_of_CircularAreaGetDataLength_return_wit_2 : CircularAreaGetDataLength_return_wit_2.
Axiom proof_of_CircularAreaGetDataLength_return_wit_3 : CircularAreaGetDataLength_return_wit_3.
Axiom proof_of_CircularAreaGetDataLength_partial_solve_wit_1_pure : CircularAreaGetDataLength_partial_solve_wit_1_pure.
Axiom proof_of_CircularAreaGetDataLength_partial_solve_wit_1 : CircularAreaGetDataLength_partial_solve_wit_1.

End VC_Correct.
