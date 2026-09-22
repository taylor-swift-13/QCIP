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
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_read.source Require Import xizi_circular_area_read_lib.
Local Open Scope sac.

(*----- Function CircularAreaIsFull -----*)

Definition CircularAreaIsFull_safety_wit_1 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsFull_safety_wit_2 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (ca0 = 0)) (PreH2 : (ca0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ False ”
.

Definition CircularAreaIsFull_safety_wit_3 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (ca0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsFull_safety_wit_4 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (b_status <> 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (ca0 <> 0)) (PreH4 : (ca0 <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (store_stringLit (LitMap (("the circular area is full
"%string))) ("the circular area is full
"%string) )
  **  (GlobalStrings_missing LitMap (cons (("the circular area is full
"%string)) ((@nil string))) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsFull_safety_wit_5 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (b_status <> 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (ca0 <> 0)) (PreH4 : (ca0 <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaIsFull_safety_wit_6 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (readidx <> writeidx)) (PreH2 : (ca0 <> 0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsFull_safety_wit_7 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (b_status = 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (ca0 <> 0)) (PreH4 : (ca0 <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsFull_entail_wit_1 := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (circular_area_pre = ca0)) (PreH2 : (ca0 <> 0)) (PreH3 : (data_buffer <> 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (circular_area_pre = ca0)) (PreH2 : (ca0 <> 0)) (PreH3 : (data_buffer <> 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
).

Definition CircularAreaIsFull_entail_wit_1_split_goal_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (circular_area_pre = ca0)) (PreH2 : (ca0 <> 0)) (PreH3 : (data_buffer <> 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
.

Definition CircularAreaIsFull_entail_wit_1_split_goal_spatial := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (circular_area_pre = ca0)) (PreH2 : (ca0 <> 0)) (PreH3 : (data_buffer <> 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
.

Definition CircularAreaIsFull_return_wit_1 := 
(
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (readidx <> writeidx)) (PreH2 : (ca0 <> 0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaFullResult area_length logical 0 ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
) \/
(
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (readidx <> writeidx)) (PreH6 : (ca0 <> 0)) (PreH7 : (ca0 <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaFullResult area_length logical 0 ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
).

Definition CircularAreaIsFull_return_wit_1_split_goal_1 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (readidx <> writeidx)) (PreH6 : (ca0 <> 0)) (PreH7 : (ca0 <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaFullResult area_length logical 0 ) ”
.

Definition CircularAreaIsFull_return_wit_1_split_goal_spatial := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (readidx <> writeidx)) (PreH6 : (ca0 <> 0)) (PreH7 : (ca0 <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
.

Definition CircularAreaIsFull_return_wit_2 := 
(
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (b_status = 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (ca0 <> 0)) (PreH4 : (ca0 <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaFullResult area_length logical 0 ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
) \/
(
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status = 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (ca0 <> 0)) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaFullResult area_length logical 0 ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
).

Definition CircularAreaIsFull_return_wit_2_split_goal_1 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status = 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (ca0 <> 0)) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaFullResult area_length logical 0 ) ”
.

Definition CircularAreaIsFull_return_wit_2_split_goal_spatial := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status = 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (ca0 <> 0)) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
.

Definition CircularAreaIsFull_return_wit_3 := 
(
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (b_status <> 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (ca0 <> 0)) (PreH4 : (ca0 <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaFullResult area_length logical 1 ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
) \/
(
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status <> 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (ca0 <> 0)) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaFullResult area_length logical 1 ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
).

Definition CircularAreaIsFull_return_wit_3_split_goal_1 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status <> 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (ca0 <> 0)) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaFullResult area_length logical 1 ) ”
.

Definition CircularAreaIsFull_return_wit_3_split_goal_spatial := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status <> 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (ca0 <> 0)) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
.

Definition CircularAreaIsFull_partial_solve_wit_1 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (b_status <> 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (ca0 <> 0)) (PreH4 : (ca0 <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (store_stringLit (LitMap (("the circular area is full
"%string))) ("the circular area is full
"%string) )
  **  (GlobalStrings_missing LitMap (cons (("the circular area is full
"%string)) ((@nil string))) )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (b_status <> 0) ” 
  &&  “ (readidx = writeidx) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
.

(*----- Function CircularAreaIsEmpty -----*)

Definition CircularAreaIsEmpty_safety_wit_1 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsEmpty_safety_wit_2 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (ca0 = 0)) (PreH2 : (ca0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ False ”
.

Definition CircularAreaIsEmpty_safety_wit_3 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (ca0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsEmpty_safety_wit_4 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (b_status = 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (ca0 <> 0)) (PreH4 : (ca0 <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (store_stringLit (LitMap (("the circular area is empty
"%string))) ("the circular area is empty
"%string) )
  **  (GlobalStrings_missing LitMap (cons (("the circular area is empty
"%string)) ((@nil string))) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsEmpty_safety_wit_5 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (b_status = 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (ca0 <> 0)) (PreH4 : (ca0 <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaIsEmpty_safety_wit_6 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (readidx <> writeidx)) (PreH2 : (ca0 <> 0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsEmpty_safety_wit_7 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (b_status <> 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (ca0 <> 0)) (PreH4 : (ca0 <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsEmpty_entail_wit_1 := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (circular_area_pre = ca0)) (PreH2 : (ca0 <> 0)) (PreH3 : (data_buffer <> 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (circular_area_pre = ca0)) (PreH2 : (ca0 <> 0)) (PreH3 : (data_buffer <> 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
).

Definition CircularAreaIsEmpty_entail_wit_1_split_goal_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (circular_area_pre = ca0)) (PreH2 : (ca0 <> 0)) (PreH3 : (data_buffer <> 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
.

Definition CircularAreaIsEmpty_entail_wit_1_split_goal_spatial := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (circular_area_pre = ca0)) (PreH2 : (ca0 <> 0)) (PreH3 : (data_buffer <> 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
.

Definition CircularAreaIsEmpty_return_wit_1 := 
(
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (readidx <> writeidx)) (PreH2 : (ca0 <> 0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaEmptyResult logical 0 ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
) \/
(
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (readidx <> writeidx)) (PreH6 : (ca0 <> 0)) (PreH7 : (ca0 <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaEmptyResult logical 0 ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
).

Definition CircularAreaIsEmpty_return_wit_1_split_goal_1 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (readidx <> writeidx)) (PreH6 : (ca0 <> 0)) (PreH7 : (ca0 <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaEmptyResult logical 0 ) ”
.

Definition CircularAreaIsEmpty_return_wit_1_split_goal_spatial := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (readidx <> writeidx)) (PreH6 : (ca0 <> 0)) (PreH7 : (ca0 <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
.

Definition CircularAreaIsEmpty_return_wit_2 := 
(
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (b_status <> 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (ca0 <> 0)) (PreH4 : (ca0 <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaEmptyResult logical 0 ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
) \/
(
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status <> 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (ca0 <> 0)) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaEmptyResult logical 0 ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
).

Definition CircularAreaIsEmpty_return_wit_2_split_goal_1 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status <> 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (ca0 <> 0)) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaEmptyResult logical 0 ) ”
.

Definition CircularAreaIsEmpty_return_wit_2_split_goal_spatial := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status <> 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (ca0 <> 0)) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
.

Definition CircularAreaIsEmpty_return_wit_3 := 
(
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (b_status = 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (ca0 <> 0)) (PreH4 : (ca0 <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaEmptyResult logical 1 ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
) \/
(
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status = 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (ca0 <> 0)) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaEmptyResult logical 1 ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
).

Definition CircularAreaIsEmpty_return_wit_3_split_goal_1 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status = 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (ca0 <> 0)) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaEmptyResult logical 1 ) ”
.

Definition CircularAreaIsEmpty_return_wit_3_split_goal_spatial := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status = 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (ca0 <> 0)) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
.

Definition CircularAreaIsEmpty_partial_solve_wit_1 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (b_status = 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (ca0 <> 0)) (PreH4 : (ca0 <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (store_stringLit (LitMap (("the circular area is empty
"%string))) ("the circular area is empty
"%string) )
  **  (GlobalStrings_missing LitMap (cons (("the circular area is empty
"%string)) ((@nil string))) )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (b_status = 0) ” 
  &&  “ (readidx = writeidx) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
.

(*----- Function CircularAreaGetDataLength -----*)

Definition CircularAreaGetDataLength_safety_wit_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (circular_area_pre = ca0)) (PreH2 : (ca0 <> 0)) (PreH3 : (data_buffer <> 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaGetDataLength_safety_wit_2 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ False ”
.

Definition CircularAreaGetDataLength_safety_wit_3 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaGetDataLength_safety_wit_4 := 
(
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : ((Zlength (logical)) < area_length)) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (area_length <> 0) ”
) \/
(
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : ((Zlength (logical)) < area_length)) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (area_length <> 0) ”
).

Definition CircularAreaGetDataLength_safety_wit_4_split_goal_1 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : ((Zlength (logical)) < area_length)) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (area_length <> 0) ”
.

Definition CircularAreaGetDataLength_safety_wit_5 := 
(
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : ((Zlength (logical)) < area_length)) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((writeidx - readidx ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (writeidx - readidx )) ”
) \/
(
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : ((Zlength (logical)) < area_length)) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((writeidx - readidx ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (writeidx - readidx )) ”
).

Definition CircularAreaGetDataLength_safety_wit_5_split_goal_1 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : ((Zlength (logical)) < area_length)) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((writeidx - readidx ) <= INT_MAX) ”
.

Definition CircularAreaGetDataLength_safety_wit_5_split_goal_2 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : ((Zlength (logical)) < area_length)) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((INT_MIN) <= (writeidx - readidx )) ”
.

Definition CircularAreaGetDataLength_entail_wit_1 := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (retval: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaFullResult area_length logical retval )) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (circular_area_pre = ca0)) (PreH6 : (ca0 <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (retval <> 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ ((Zlength (logical)) = area_length) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (retval: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaFullResult area_length logical retval )) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (circular_area_pre = ca0)) (PreH6 : (ca0 <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (retval <> 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ” 
  &&  “ ((Zlength (logical)) = area_length) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
).

Definition CircularAreaGetDataLength_entail_wit_1_split_goal_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (retval: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaFullResult area_length logical retval )) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (circular_area_pre = ca0)) (PreH6 : (ca0 <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (retval <> 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
.

Definition CircularAreaGetDataLength_entail_wit_1_split_goal_2 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (retval: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaFullResult area_length logical retval )) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (circular_area_pre = ca0)) (PreH6 : (ca0 <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (retval <> 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ ((Zlength (logical)) = area_length) ”
.

Definition CircularAreaGetDataLength_entail_wit_1_split_goal_spatial := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (retval: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaFullResult area_length logical retval )) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (circular_area_pre = ca0)) (PreH6 : (ca0 <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (retval <> 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
.

Definition CircularAreaGetDataLength_entail_wit_2 := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (retval: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaFullResult area_length logical retval )) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (circular_area_pre = ca0)) (PreH6 : (ca0 <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (retval = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ ((Zlength (logical)) < area_length) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (retval: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaFullResult area_length logical retval )) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (circular_area_pre = ca0)) (PreH6 : (ca0 <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (retval = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ” 
  &&  “ ((Zlength (logical)) < area_length) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
).

Definition CircularAreaGetDataLength_entail_wit_2_split_goal_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (retval: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaFullResult area_length logical retval )) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (circular_area_pre = ca0)) (PreH6 : (ca0 <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (retval = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
.

Definition CircularAreaGetDataLength_entail_wit_2_split_goal_2 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (retval: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaFullResult area_length logical retval )) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (circular_area_pre = ca0)) (PreH6 : (ca0 <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (retval = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ ((Zlength (logical)) < area_length) ”
.

Definition CircularAreaGetDataLength_entail_wit_2_split_goal_spatial := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (retval: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaFullResult area_length logical retval )) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (circular_area_pre = ca0)) (PreH6 : (ca0 <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (retval = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
.

Definition CircularAreaGetDataLength_return_wit_1 := 
(
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : ((Zlength (logical)) < area_length)) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaDataLengthResult logical ((unsigned_last_nbits (((unsigned_last_nbits ((writeidx - readidx )) (32)) + area_length )) (32)) % ( area_length ) ) ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
) \/
(
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (ca0 <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : ((Zlength (logical)) < area_length)) (PreH8 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaDataLengthResult logical ((unsigned_last_nbits (((unsigned_last_nbits ((writeidx - readidx )) (32)) + area_length )) (32)) % ( area_length ) ) ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
).

Definition CircularAreaGetDataLength_return_wit_1_split_goal_1 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (ca0 <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : ((Zlength (logical)) < area_length)) (PreH8 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaDataLengthResult logical ((unsigned_last_nbits (((unsigned_last_nbits ((writeidx - readidx )) (32)) + area_length )) (32)) % ( area_length ) ) ) ”
.

Definition CircularAreaGetDataLength_return_wit_1_split_goal_spatial := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (ca0 <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : ((Zlength (logical)) < area_length)) (PreH8 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
.

Definition CircularAreaGetDataLength_return_wit_2 := 
(
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : ((Zlength (logical)) = area_length)) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaDataLengthResult logical area_length ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
) \/
(
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (ca0 <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : ((Zlength (logical)) = area_length)) (PreH8 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaDataLengthResult logical area_length ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
).

Definition CircularAreaGetDataLength_return_wit_2_split_goal_1 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (ca0 <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : ((Zlength (logical)) = area_length)) (PreH8 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaDataLengthResult logical area_length ) ”
.

Definition CircularAreaGetDataLength_return_wit_2_split_goal_spatial := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (ca0 <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : ((Zlength (logical)) = area_length)) (PreH8 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
.

Definition CircularAreaGetDataLength_partial_solve_wit_1_pure := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (circular_area_pre = ca0) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ”
.

Definition CircularAreaGetDataLength_partial_solve_wit_1_aux := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (circular_area_pre = ca0) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre = ca0) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
.

Definition CircularAreaGetDataLength_partial_solve_wit_1 := CircularAreaGetDataLength_partial_solve_wit_1_pure -> CircularAreaGetDataLength_partial_solve_wit_1_aux.

(*----- Function CircularAreaDivideRdData -----*)

Definition CircularAreaDivideRdData_safety_wit_1 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (d0: Z) (ca0: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (0 <= d0)) (PreH4 : (d0 <= area_length)) (PreH5 : ((readidx + d0 ) <= UINT_MAX)) (PreH6 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "data_length" ) )) # UInt  |-> d0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaDivideRdData_safety_wit_2 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (d0: Z) (ca0: Z) (PreH1 : (ca0 = 0)) (PreH2 : (ca0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (0 <= d0)) (PreH5 : (d0 <= area_length)) (PreH6 : ((readidx + d0 ) <= UINT_MAX)) (PreH7 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "data_length" ) )) # UInt  |-> d0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ False ”
.

Definition CircularAreaDivideRdData_safety_wit_3 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (d0: Z) (ca0: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (ca0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (0 <= d0)) (PreH5 : (d0 <= area_length)) (PreH6 : ((readidx + d0 ) <= UINT_MAX)) (PreH7 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "data_length" ) )) # UInt  |-> d0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaDivideRdData_safety_wit_4 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (d0: Z) (ca0: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + d0 )) (32)) <= area_length)) (PreH2 : (ca0 <> 0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (0 <= d0)) (PreH6 : (d0 <= area_length)) (PreH7 : ((readidx + d0 ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "data_length" ) )) # UInt  |-> d0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaDivideRdData_safety_wit_5 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (d0: Z) (ca0: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + d0 )) (32)) > area_length)) (PreH2 : (ca0 <> 0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (0 <= d0)) (PreH6 : (d0 <= area_length)) (PreH7 : ((readidx + d0 ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "data_length" ) )) # UInt  |-> d0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaDivideRdData_entail_wit_1 := 
(
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (d0: Z) (ca0: Z) (PreH1 : (circular_area_pre = ca0)) (PreH2 : (data_length_pre = d0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (0 <= d0)) (PreH6 : (d0 <= area_length)) (PreH7 : ((readidx + d0 ) <= UINT_MAX)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (0 <= d0) ” 
  &&  “ (d0 <= area_length) ” 
  &&  “ ((readidx + d0 ) <= UINT_MAX) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "data_length" ) )) # UInt  |-> d0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (d0: Z) (ca0: Z) (PreH1 : (circular_area_pre = ca0)) (PreH2 : (data_length_pre = d0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (0 <= d0)) (PreH6 : (d0 <= area_length)) (PreH7 : ((readidx + d0 ) <= UINT_MAX)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
).

Definition CircularAreaDivideRdData_entail_wit_1_split_goal_1 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (d0: Z) (ca0: Z) (PreH1 : (circular_area_pre = ca0)) (PreH2 : (data_length_pre = d0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (0 <= d0)) (PreH6 : (d0 <= area_length)) (PreH7 : ((readidx + d0 ) <= UINT_MAX)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
.

Definition CircularAreaDivideRdData_entail_wit_1_split_goal_spatial := 
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (d0: Z) (ca0: Z) (PreH1 : (circular_area_pre = ca0)) (PreH2 : (data_length_pre = d0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (0 <= d0)) (PreH6 : (d0 <= area_length)) (PreH7 : ((readidx + d0 ) <= UINT_MAX)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
.

Definition CircularAreaDivideRdData_return_wit_1 := 
(
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (d0: Z) (ca0: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + d0 )) (32)) > area_length)) (PreH2 : (ca0 <> 0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (0 <= d0)) (PreH6 : (d0 <= area_length)) (PreH7 : ((readidx + d0 ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx d0 area_length 1 ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
) \/
(
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (d0: Z) (ca0: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + d0 )) (32)) > area_length)) (PreH6 : (ca0 <> 0)) (PreH7 : (ca0 <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (0 <= d0)) (PreH10 : (d0 <= area_length)) (PreH11 : ((readidx + d0 ) <= UINT_MAX)) (PreH12 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaDivideRdDataResult readidx d0 area_length 1 ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
).

Definition CircularAreaDivideRdData_return_wit_1_split_goal_1 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (d0: Z) (ca0: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + d0 )) (32)) > area_length)) (PreH6 : (ca0 <> 0)) (PreH7 : (ca0 <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (0 <= d0)) (PreH10 : (d0 <= area_length)) (PreH11 : ((readidx + d0 ) <= UINT_MAX)) (PreH12 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaDivideRdDataResult readidx d0 area_length 1 ) ”
.

Definition CircularAreaDivideRdData_return_wit_1_split_goal_spatial := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (d0: Z) (ca0: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + d0 )) (32)) > area_length)) (PreH6 : (ca0 <> 0)) (PreH7 : (ca0 <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (0 <= d0)) (PreH10 : (d0 <= area_length)) (PreH11 : ((readidx + d0 ) <= UINT_MAX)) (PreH12 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
.

Definition CircularAreaDivideRdData_return_wit_2 := 
(
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (d0: Z) (ca0: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + d0 )) (32)) <= area_length)) (PreH2 : (ca0 <> 0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (0 <= d0)) (PreH6 : (d0 <= area_length)) (PreH7 : ((readidx + d0 ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx d0 area_length 0 ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
) \/
(
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (d0: Z) (ca0: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + d0 )) (32)) <= area_length)) (PreH6 : (ca0 <> 0)) (PreH7 : (ca0 <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (0 <= d0)) (PreH10 : (d0 <= area_length)) (PreH11 : ((readidx + d0 ) <= UINT_MAX)) (PreH12 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaDivideRdDataResult readidx d0 area_length 0 ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
).

Definition CircularAreaDivideRdData_return_wit_2_split_goal_1 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (d0: Z) (ca0: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + d0 )) (32)) <= area_length)) (PreH6 : (ca0 <> 0)) (PreH7 : (ca0 <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (0 <= d0)) (PreH10 : (d0 <= area_length)) (PreH11 : ((readidx + d0 ) <= UINT_MAX)) (PreH12 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaDivideRdDataResult readidx d0 area_length 0 ) ”
.

Definition CircularAreaDivideRdData_return_wit_2_split_goal_spatial := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (d0: Z) (ca0: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + d0 )) (32)) <= area_length)) (PreH6 : (ca0 <> 0)) (PreH7 : (ca0 <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (0 <= d0)) (PreH10 : (d0 <= area_length)) (PreH11 : ((readidx + d0 ) <= UINT_MAX)) (PreH12 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
.

(*----- Function CircularAreaRead -----*)

Definition CircularAreaRead_safety_wit_1 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (LitMap: (string -> Z)) (PreH1 : (circular_area_pre = ca0)) (PreH2 : (output_buffer_pre = out0)) (PreH3 : (data_length_pre = requested)) (PreH4 : (0 <= requested)) (PreH5 : (requested <= UINT_MAX)) (PreH6 : (ca0 = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRead_safety_wit_2 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre = ca0)) (PreH2 : (output_buffer_pre = out0)) (PreH3 : (data_length_pre = requested)) (PreH4 : (0 <= requested)) (PreH5 : (requested <= UINT_MAX)) (PreH6 : (ca0 <> 0)) (PreH7 : (out0 = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRead_safety_wit_3 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre = ca0)) (PreH2 : (output_buffer_pre = out0)) (PreH3 : (data_length_pre = requested)) (PreH4 : (0 <= requested)) (PreH5 : (requested <= UINT_MAX)) (PreH6 : (ca0 <> 0)) (PreH7 : (out0 <> 0)) (PreH8 : (requested <= output_capacity)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRead_safety_wit_4 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (LitMap: (string -> Z)) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (output_buffer_pre = out0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (0 <= requested)) (PreH6 : (requested <= UINT_MAX)) (PreH7 : (ca0 = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
|--
  “ False ”
.

Definition CircularAreaRead_safety_wit_5 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (output_buffer_pre = out0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (0 <= requested)) (PreH6 : (requested <= UINT_MAX)) (PreH7 : (ca0 <> 0)) (PreH8 : (out0 = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ False ”
.

Definition CircularAreaRead_safety_wit_6 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (output_buffer_pre = out0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (0 <= requested)) (PreH6 : (requested <= UINT_MAX)) (PreH7 : (ca0 <> 0)) (PreH8 : (out0 <> 0)) (PreH9 : (requested <= output_capacity)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ False ”
.

Definition CircularAreaRead_safety_wit_7 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (LitMap: (string -> Z)) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (output_buffer_pre = out0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (0 <= requested)) (PreH6 : (requested <= UINT_MAX)) (PreH7 : (ca0 = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaRead_safety_wit_8 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (output_buffer_pre = out0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (0 <= requested)) (PreH6 : (requested <= UINT_MAX)) (PreH7 : (ca0 <> 0)) (PreH8 : (out0 = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRead_safety_wit_9 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (output_buffer_pre = out0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (0 <= requested)) (PreH6 : (requested <= UINT_MAX)) (PreH7 : (ca0 <> 0)) (PreH8 : (out0 <> 0)) (PreH9 : (requested <= output_capacity)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRead_safety_wit_10 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (output_buffer_pre = out0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (0 <= requested)) (PreH6 : (requested <= UINT_MAX)) (PreH7 : (ca0 <> 0)) (PreH8 : (out0 = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRead_safety_wit_11 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (output_buffer_pre = out0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (0 <= requested)) (PreH6 : (requested <= UINT_MAX)) (PreH7 : (ca0 <> 0)) (PreH8 : (out0 <> 0)) (PreH9 : (requested <= output_capacity)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRead_safety_wit_12 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (output_buffer_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = ca0)) (PreH4 : (output_buffer_pre = out0)) (PreH5 : (data_length_pre = requested)) (PreH6 : (0 <= requested)) (PreH7 : (requested <= UINT_MAX)) (PreH8 : (ca0 <> 0)) (PreH9 : (out0 = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ False ”
.

Definition CircularAreaRead_safety_wit_13 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (output_buffer_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = ca0)) (PreH4 : (output_buffer_pre = out0)) (PreH5 : (data_length_pre = requested)) (PreH6 : (0 <= requested)) (PreH7 : (requested <= UINT_MAX)) (PreH8 : (ca0 <> 0)) (PreH9 : (out0 <> 0)) (PreH10 : (requested <= output_capacity)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ False ”
.

Definition CircularAreaRead_safety_wit_14 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (output_buffer_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = ca0)) (PreH4 : (output_buffer_pre = out0)) (PreH5 : (data_length_pre = requested)) (PreH6 : (0 <= requested)) (PreH7 : (requested <= UINT_MAX)) (PreH8 : (ca0 <> 0)) (PreH9 : (out0 = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaRead_safety_wit_15 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (output_buffer_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = ca0)) (PreH4 : (output_buffer_pre = out0)) (PreH5 : (data_length_pre = requested)) (PreH6 : (0 <= requested)) (PreH7 : (requested <= UINT_MAX)) (PreH8 : (ca0 <> 0)) (PreH9 : (out0 <> 0)) (PreH10 : (requested <= output_capacity)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRead_safety_wit_16 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (0 <= data_length_pre)) (PreH2 : (data_length_pre <= UINT_MAX)) (PreH3 : (output_buffer_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (circular_area_pre = ca0)) (PreH6 : (output_buffer_pre = out0)) (PreH7 : (data_length_pre = requested)) (PreH8 : (0 <= requested)) (PreH9 : (requested <= UINT_MAX)) (PreH10 : (ca0 <> 0)) (PreH11 : (out0 <> 0)) (PreH12 : (requested <= output_capacity)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRead_safety_wit_17 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (data_length_pre <= 0)) (PreH2 : (0 <= data_length_pre)) (PreH3 : (data_length_pre <= UINT_MAX)) (PreH4 : (output_buffer_pre <> 0)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre = ca0)) (PreH7 : (output_buffer_pre = out0)) (PreH8 : (data_length_pre = requested)) (PreH9 : (0 <= requested)) (PreH10 : (requested <= UINT_MAX)) (PreH11 : (ca0 <> 0)) (PreH12 : (out0 <> 0)) (PreH13 : (requested <= output_capacity)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaRead_safety_wit_18 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (data_length_pre > 0)) (PreH2 : (0 <= data_length_pre)) (PreH3 : (data_length_pre <= UINT_MAX)) (PreH4 : (output_buffer_pre <> 0)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre = ca0)) (PreH7 : (output_buffer_pre = out0)) (PreH8 : (data_length_pre = requested)) (PreH9 : (0 <= requested)) (PreH10 : (requested <= UINT_MAX)) (PreH11 : (ca0 <> 0)) (PreH12 : (out0 <> 0)) (PreH13 : (requested <= output_capacity)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRead_safety_wit_19 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (requested > 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested <= output_capacity)) (PreH6 : (CircularAreaEmptyResult logical 1 )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> requested)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaRead_safety_wit_20 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (retval: Z) (PreH1 : (retval = out0)) (PreH2 : (ca0 <> 0)) (PreH3 : (out0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (CircularAreaEmptyResult logical 0 )) (PreH7 : (CircularAreaActualReadLength logical requested data_length )) (PreH8 : (0 < data_length)) (PreH9 : (data_length <= output_capacity)) (PreH10 : (0 <= readidx)) (PreH11 : ((readidx + data_length ) <= area_length)) (PreH12 : (CircularAreaDivideRdDataResult readidx data_length area_length 0 )) (PreH13 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH14 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH15 : (CircularAreaInitializedSlice physical readidx (readidx + data_length ) (sublist (0) (data_length) (logical)) )) ,
  (UCharArray.mixed_seg out0 0 data_length (CircularAreaSomeBytes ((sublist (0) (data_length) (logical)))) )
  **  (UCharArray.mixed_seg data_buffer readidx (readidx + data_length ) (sublist (readidx) ((readidx + data_length )) (physical)) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (readidx + data_length ) area_length (sublist ((readidx + data_length )) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (area_length <> 0) ”
.

Definition CircularAreaRead_safety_wit_21 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_down: Z) (read_len_up: Z) (retval: Z) (PreH1 : (retval = (out0 + (read_len_up * sizeof(UCHAR))))) (PreH2 : (ca0 <> 0)) (PreH3 : (out0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (CircularAreaEmptyResult logical 0 )) (PreH7 : (CircularAreaActualReadLength logical requested data_length )) (PreH8 : (0 < data_length)) (PreH9 : (data_length <= output_capacity)) (PreH10 : (0 <= read_len_down)) (PreH11 : (read_len_down <= readidx)) (PreH12 : (read_len_up = (area_length - readidx ))) (PreH13 : (read_len_down = (data_length - read_len_up ))) (PreH14 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH15 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH16 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH17 : (CircularAreaInitializedSlice physical 0 read_len_down (sublist (read_len_up) (data_length) (logical)) )) ,
  (UCharArray.mixed_seg out0 read_len_up data_length (CircularAreaSomeBytes ((sublist (read_len_up) (data_length) (logical)))) )
  **  (UCharArray.mixed_seg data_buffer 0 read_len_down (sublist (0) (read_len_down) (physical)) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (sublist (readidx) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 read_len_up (CircularAreaSomeBytes ((sublist (0) (read_len_up) (logical)))) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> (unsigned_last_nbits (read_len_down) (8)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRead_safety_wit_22 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (retval: Z) (PreH1 : (retval = out0)) (PreH2 : (ca0 <> 0)) (PreH3 : (out0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (CircularAreaEmptyResult logical 0 )) (PreH7 : (CircularAreaActualReadLength logical requested data_length )) (PreH8 : (0 < data_length)) (PreH9 : (data_length <= output_capacity)) (PreH10 : (0 <= readidx)) (PreH11 : ((readidx + data_length ) <= area_length)) (PreH12 : (CircularAreaDivideRdDataResult readidx data_length area_length 0 )) (PreH13 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH14 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH15 : (CircularAreaInitializedSlice physical readidx (readidx + data_length ) (sublist (0) (data_length) (logical)) )) ,
  (UCharArray.mixed_seg out0 0 data_length (CircularAreaSomeBytes ((sublist (0) (data_length) (logical)))) )
  **  (UCharArray.mixed_seg data_buffer readidx (readidx + data_length ) (sublist (readidx) ((readidx + data_length )) (physical)) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (readidx + data_length ) area_length (sublist ((readidx + data_length )) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> (unsigned_last_nbits (((readidx + data_length ) % ( area_length ) )) (8)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRead_safety_wit_23 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_down: Z) (read_len_up: Z) (retval: Z) (PreH1 : (retval = (out0 + (read_len_up * sizeof(UCHAR))))) (PreH2 : (ca0 <> 0)) (PreH3 : (out0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (CircularAreaEmptyResult logical 0 )) (PreH7 : (CircularAreaActualReadLength logical requested data_length )) (PreH8 : (0 < data_length)) (PreH9 : (data_length <= output_capacity)) (PreH10 : (0 <= read_len_down)) (PreH11 : (read_len_down <= readidx)) (PreH12 : (read_len_up = (area_length - readidx ))) (PreH13 : (read_len_down = (data_length - read_len_up ))) (PreH14 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH15 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH16 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH17 : (CircularAreaInitializedSlice physical 0 read_len_down (sublist (read_len_up) (data_length) (logical)) )) ,
  (UCharArray.mixed_seg out0 read_len_up data_length (CircularAreaSomeBytes ((sublist (read_len_up) (data_length) (logical)))) )
  **  (UCharArray.mixed_seg data_buffer 0 read_len_down (sublist (0) (read_len_down) (physical)) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (sublist (readidx) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 read_len_up (CircularAreaSomeBytes ((sublist (0) (read_len_up) (logical)))) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> (unsigned_last_nbits (read_len_down) (8)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRead_safety_wit_24 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (retval: Z) (PreH1 : (retval = out0)) (PreH2 : (ca0 <> 0)) (PreH3 : (out0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (CircularAreaEmptyResult logical 0 )) (PreH7 : (CircularAreaActualReadLength logical requested data_length )) (PreH8 : (0 < data_length)) (PreH9 : (data_length <= output_capacity)) (PreH10 : (0 <= readidx)) (PreH11 : ((readidx + data_length ) <= area_length)) (PreH12 : (CircularAreaDivideRdDataResult readidx data_length area_length 0 )) (PreH13 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH14 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH15 : (CircularAreaInitializedSlice physical readidx (readidx + data_length ) (sublist (0) (data_length) (logical)) )) ,
  (UCharArray.mixed_seg out0 0 data_length (CircularAreaSomeBytes ((sublist (0) (data_length) (logical)))) )
  **  (UCharArray.mixed_seg data_buffer readidx (readidx + data_length ) (sublist (readidx) ((readidx + data_length )) (physical)) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (readidx + data_length ) area_length (sublist ((readidx + data_length )) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> (unsigned_last_nbits (((readidx + data_length ) % ( area_length ) )) (8)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRead_entail_wit_1 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (output_buffer_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = ca0)) (PreH4 : (output_buffer_pre = out0)) (PreH5 : (data_length_pre = requested)) (PreH6 : (0 <= requested)) (PreH7 : (requested <= UINT_MAX)) (PreH8 : (ca0 <> 0)) (PreH9 : (out0 <> 0)) (PreH10 : (requested <= output_capacity)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= UINT_MAX) ” 
  &&  “ (output_buffer_pre <> 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre = ca0) ” 
  &&  “ (output_buffer_pre = out0) ” 
  &&  “ (data_length_pre = requested) ” 
  &&  “ (0 <= requested) ” 
  &&  “ (requested <= UINT_MAX) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (requested <= output_capacity) ”
  &&  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
.

Definition CircularAreaRead_entail_wit_2 := 
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaEmptyResult logical retval )) (PreH4 : (data_length_pre > 0)) (PreH5 : (0 <= data_length_pre)) (PreH6 : (data_length_pre <= UINT_MAX)) (PreH7 : (output_buffer_pre <> 0)) (PreH8 : (circular_area_pre <> 0)) (PreH9 : (circular_area_pre = ca0)) (PreH10 : (output_buffer_pre = out0)) (PreH11 : (data_length_pre = requested)) (PreH12 : (0 <= requested)) (PreH13 : (requested <= UINT_MAX)) (PreH14 : (ca0 <> 0)) (PreH15 : (out0 <> 0)) (PreH16 : (requested <= output_capacity)) (PreH17 : (retval <> 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested <= output_capacity) ” 
  &&  “ (CircularAreaEmptyResult logical 1 ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> requested)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
) \/
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_capacity: Z) (logical: (@list Z)) (data_buffer: Z) (retval: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaEmptyResult logical retval )) (PreH4 : (data_length_pre > 0)) (PreH5 : (0 <= data_length_pre)) (PreH6 : (data_length_pre <= UINT_MAX)) (PreH7 : (output_buffer_pre <> 0)) (PreH8 : (circular_area_pre <> 0)) (PreH9 : (circular_area_pre = ca0)) (PreH10 : (output_buffer_pre = out0)) (PreH11 : (data_length_pre = requested)) (PreH12 : (0 <= requested)) (PreH13 : (requested <= UINT_MAX)) (PreH14 : (ca0 <> 0)) (PreH15 : (out0 <> 0)) (PreH16 : (requested <= output_capacity)) (PreH17 : (retval <> 0)) ,
  TT && emp 
|--
  “ (CircularAreaEmptyResult logical 1 ) ”
  &&  emp
).

Definition CircularAreaRead_entail_wit_2_split_goal_1 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_capacity: Z) (logical: (@list Z)) (data_buffer: Z) (retval: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaEmptyResult logical retval )) (PreH4 : (data_length_pre > 0)) (PreH5 : (0 <= data_length_pre)) (PreH6 : (data_length_pre <= UINT_MAX)) (PreH7 : (output_buffer_pre <> 0)) (PreH8 : (circular_area_pre <> 0)) (PreH9 : (circular_area_pre = ca0)) (PreH10 : (output_buffer_pre = out0)) (PreH11 : (data_length_pre = requested)) (PreH12 : (0 <= requested)) (PreH13 : (requested <= UINT_MAX)) (PreH14 : (ca0 <> 0)) (PreH15 : (out0 <> 0)) (PreH16 : (requested <= output_capacity)) (PreH17 : (retval <> 0)) ,
  (CircularAreaEmptyResult logical 1 )
.

Definition CircularAreaRead_entail_wit_3_1 := 
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH4 : (ca0 <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaDataLengthResult logical retval )) (PreH7 : (data_length_pre > retval_3)) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaDataLengthResult logical retval_3 )) (PreH11 : (ca0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (CircularAreaEmptyResult logical retval_2 )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (output_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = ca0)) (PreH20 : (output_buffer_pre = out0)) (PreH21 : (data_length_pre = requested)) (PreH22 : (0 <= requested)) (PreH23 : (requested <= UINT_MAX)) (PreH24 : (ca0 <> 0)) (PreH25 : (out0 <> 0)) (PreH26 : (requested <= output_capacity)) (PreH27 : (retval_2 = 0)) (PreH28 : (retval_4 <> 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaEmptyResult logical 0 ) ” 
  &&  “ (CircularAreaActualReadLength logical requested retval ) ” 
  &&  “ (0 < retval) ” 
  &&  “ (retval <= output_capacity) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx retval area_length 1 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH4 : (ca0 <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaDataLengthResult logical retval )) (PreH7 : (data_length_pre > retval_3)) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaDataLengthResult logical retval_3 )) (PreH11 : (ca0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (CircularAreaEmptyResult logical retval_2 )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (output_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = ca0)) (PreH20 : (output_buffer_pre = out0)) (PreH21 : (data_length_pre = requested)) (PreH22 : (0 <= requested)) (PreH23 : (requested <= UINT_MAX)) (PreH24 : (ca0 <> 0)) (PreH25 : (out0 <> 0)) (PreH26 : (requested <= output_capacity)) (PreH27 : (retval_2 = 0)) (PreH28 : (retval_4 <> 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx retval area_length 1 ) ” 
  &&  “ (retval <= output_capacity) ” 
  &&  “ (0 < retval) ” 
  &&  “ (CircularAreaActualReadLength logical data_length_pre retval ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
).

Definition CircularAreaRead_entail_wit_3_1_split_goal_1 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH4 : (ca0 <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaDataLengthResult logical retval )) (PreH7 : (data_length_pre > retval_3)) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaDataLengthResult logical retval_3 )) (PreH11 : (ca0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (CircularAreaEmptyResult logical retval_2 )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (output_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = ca0)) (PreH20 : (output_buffer_pre = out0)) (PreH21 : (data_length_pre = requested)) (PreH22 : (0 <= requested)) (PreH23 : (requested <= UINT_MAX)) (PreH24 : (ca0 <> 0)) (PreH25 : (out0 <> 0)) (PreH26 : (requested <= output_capacity)) (PreH27 : (retval_2 = 0)) (PreH28 : (retval_4 <> 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
.

Definition CircularAreaRead_entail_wit_3_1_split_goal_2 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH4 : (ca0 <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaDataLengthResult logical retval )) (PreH7 : (data_length_pre > retval_3)) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaDataLengthResult logical retval_3 )) (PreH11 : (ca0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (CircularAreaEmptyResult logical retval_2 )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (output_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = ca0)) (PreH20 : (output_buffer_pre = out0)) (PreH21 : (data_length_pre = requested)) (PreH22 : (0 <= requested)) (PreH23 : (requested <= UINT_MAX)) (PreH24 : (ca0 <> 0)) (PreH25 : (out0 <> 0)) (PreH26 : (requested <= output_capacity)) (PreH27 : (retval_2 = 0)) (PreH28 : (retval_4 <> 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (CircularAreaDivideRdDataResult readidx retval area_length 1 ) ”
.

Definition CircularAreaRead_entail_wit_3_1_split_goal_3 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH4 : (ca0 <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaDataLengthResult logical retval )) (PreH7 : (data_length_pre > retval_3)) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaDataLengthResult logical retval_3 )) (PreH11 : (ca0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (CircularAreaEmptyResult logical retval_2 )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (output_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = ca0)) (PreH20 : (output_buffer_pre = out0)) (PreH21 : (data_length_pre = requested)) (PreH22 : (0 <= requested)) (PreH23 : (requested <= UINT_MAX)) (PreH24 : (ca0 <> 0)) (PreH25 : (out0 <> 0)) (PreH26 : (requested <= output_capacity)) (PreH27 : (retval_2 = 0)) (PreH28 : (retval_4 <> 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (retval <= output_capacity) ”
.

Definition CircularAreaRead_entail_wit_3_1_split_goal_4 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH4 : (ca0 <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaDataLengthResult logical retval )) (PreH7 : (data_length_pre > retval_3)) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaDataLengthResult logical retval_3 )) (PreH11 : (ca0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (CircularAreaEmptyResult logical retval_2 )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (output_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = ca0)) (PreH20 : (output_buffer_pre = out0)) (PreH21 : (data_length_pre = requested)) (PreH22 : (0 <= requested)) (PreH23 : (requested <= UINT_MAX)) (PreH24 : (ca0 <> 0)) (PreH25 : (out0 <> 0)) (PreH26 : (requested <= output_capacity)) (PreH27 : (retval_2 = 0)) (PreH28 : (retval_4 <> 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (0 < retval) ”
.

Definition CircularAreaRead_entail_wit_3_1_split_goal_5 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH4 : (ca0 <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaDataLengthResult logical retval )) (PreH7 : (data_length_pre > retval_3)) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaDataLengthResult logical retval_3 )) (PreH11 : (ca0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (CircularAreaEmptyResult logical retval_2 )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (output_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = ca0)) (PreH20 : (output_buffer_pre = out0)) (PreH21 : (data_length_pre = requested)) (PreH22 : (0 <= requested)) (PreH23 : (requested <= UINT_MAX)) (PreH24 : (ca0 <> 0)) (PreH25 : (out0 <> 0)) (PreH26 : (requested <= output_capacity)) (PreH27 : (retval_2 = 0)) (PreH28 : (retval_4 <> 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (CircularAreaActualReadLength logical data_length_pre retval ) ”
.

Definition CircularAreaRead_entail_wit_3_1_split_goal_spatial := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH4 : (ca0 <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaDataLengthResult logical retval )) (PreH7 : (data_length_pre > retval_3)) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaDataLengthResult logical retval_3 )) (PreH11 : (ca0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (CircularAreaEmptyResult logical retval_2 )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (output_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = ca0)) (PreH20 : (output_buffer_pre = out0)) (PreH21 : (data_length_pre = requested)) (PreH22 : (0 <= requested)) (PreH23 : (requested <= UINT_MAX)) (PreH24 : (ca0 <> 0)) (PreH25 : (out0 <> 0)) (PreH26 : (requested <= output_capacity)) (PreH27 : (retval_2 = 0)) (PreH28 : (retval_4 <> 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
.

Definition CircularAreaRead_entail_wit_3_2 := 
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideRdDataResult readidx data_length_pre area_length retval_3 )) (PreH4 : (data_length_pre <= retval_2)) (PreH5 : (ca0 <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : (CircularAreaDataLengthResult logical retval_2 )) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaEmptyResult logical retval )) (PreH11 : (data_length_pre > 0)) (PreH12 : (0 <= data_length_pre)) (PreH13 : (data_length_pre <= UINT_MAX)) (PreH14 : (output_buffer_pre <> 0)) (PreH15 : (circular_area_pre <> 0)) (PreH16 : (circular_area_pre = ca0)) (PreH17 : (output_buffer_pre = out0)) (PreH18 : (data_length_pre = requested)) (PreH19 : (0 <= requested)) (PreH20 : (requested <= UINT_MAX)) (PreH21 : (ca0 <> 0)) (PreH22 : (out0 <> 0)) (PreH23 : (requested <= output_capacity)) (PreH24 : (retval = 0)) (PreH25 : (retval_3 <> 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaEmptyResult logical 0 ) ” 
  &&  “ (CircularAreaActualReadLength logical requested data_length_pre ) ” 
  &&  “ (0 < data_length_pre) ” 
  &&  “ (data_length_pre <= output_capacity) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx data_length_pre area_length 1 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideRdDataResult readidx data_length_pre area_length retval_3 )) (PreH4 : (data_length_pre <= retval_2)) (PreH5 : (ca0 <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : (CircularAreaDataLengthResult logical retval_2 )) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaEmptyResult logical retval )) (PreH11 : (data_length_pre > 0)) (PreH12 : (0 <= data_length_pre)) (PreH13 : (data_length_pre <= UINT_MAX)) (PreH14 : (output_buffer_pre <> 0)) (PreH15 : (circular_area_pre <> 0)) (PreH16 : (circular_area_pre = ca0)) (PreH17 : (output_buffer_pre = out0)) (PreH18 : (data_length_pre = requested)) (PreH19 : (0 <= requested)) (PreH20 : (requested <= UINT_MAX)) (PreH21 : (ca0 <> 0)) (PreH22 : (out0 <> 0)) (PreH23 : (requested <= output_capacity)) (PreH24 : (retval = 0)) (PreH25 : (retval_3 <> 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx data_length_pre area_length 1 ) ” 
  &&  “ (CircularAreaActualReadLength logical data_length_pre data_length_pre ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
).

Definition CircularAreaRead_entail_wit_3_2_split_goal_1 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideRdDataResult readidx data_length_pre area_length retval_3 )) (PreH4 : (data_length_pre <= retval_2)) (PreH5 : (ca0 <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : (CircularAreaDataLengthResult logical retval_2 )) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaEmptyResult logical retval )) (PreH11 : (data_length_pre > 0)) (PreH12 : (0 <= data_length_pre)) (PreH13 : (data_length_pre <= UINT_MAX)) (PreH14 : (output_buffer_pre <> 0)) (PreH15 : (circular_area_pre <> 0)) (PreH16 : (circular_area_pre = ca0)) (PreH17 : (output_buffer_pre = out0)) (PreH18 : (data_length_pre = requested)) (PreH19 : (0 <= requested)) (PreH20 : (requested <= UINT_MAX)) (PreH21 : (ca0 <> 0)) (PreH22 : (out0 <> 0)) (PreH23 : (requested <= output_capacity)) (PreH24 : (retval = 0)) (PreH25 : (retval_3 <> 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
.

Definition CircularAreaRead_entail_wit_3_2_split_goal_2 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideRdDataResult readidx data_length_pre area_length retval_3 )) (PreH4 : (data_length_pre <= retval_2)) (PreH5 : (ca0 <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : (CircularAreaDataLengthResult logical retval_2 )) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaEmptyResult logical retval )) (PreH11 : (data_length_pre > 0)) (PreH12 : (0 <= data_length_pre)) (PreH13 : (data_length_pre <= UINT_MAX)) (PreH14 : (output_buffer_pre <> 0)) (PreH15 : (circular_area_pre <> 0)) (PreH16 : (circular_area_pre = ca0)) (PreH17 : (output_buffer_pre = out0)) (PreH18 : (data_length_pre = requested)) (PreH19 : (0 <= requested)) (PreH20 : (requested <= UINT_MAX)) (PreH21 : (ca0 <> 0)) (PreH22 : (out0 <> 0)) (PreH23 : (requested <= output_capacity)) (PreH24 : (retval = 0)) (PreH25 : (retval_3 <> 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (CircularAreaDivideRdDataResult readidx data_length_pre area_length 1 ) ”
.

Definition CircularAreaRead_entail_wit_3_2_split_goal_3 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideRdDataResult readidx data_length_pre area_length retval_3 )) (PreH4 : (data_length_pre <= retval_2)) (PreH5 : (ca0 <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : (CircularAreaDataLengthResult logical retval_2 )) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaEmptyResult logical retval )) (PreH11 : (data_length_pre > 0)) (PreH12 : (0 <= data_length_pre)) (PreH13 : (data_length_pre <= UINT_MAX)) (PreH14 : (output_buffer_pre <> 0)) (PreH15 : (circular_area_pre <> 0)) (PreH16 : (circular_area_pre = ca0)) (PreH17 : (output_buffer_pre = out0)) (PreH18 : (data_length_pre = requested)) (PreH19 : (0 <= requested)) (PreH20 : (requested <= UINT_MAX)) (PreH21 : (ca0 <> 0)) (PreH22 : (out0 <> 0)) (PreH23 : (requested <= output_capacity)) (PreH24 : (retval = 0)) (PreH25 : (retval_3 <> 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (CircularAreaActualReadLength logical data_length_pre data_length_pre ) ”
.

Definition CircularAreaRead_entail_wit_3_2_split_goal_spatial := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideRdDataResult readidx data_length_pre area_length retval_3 )) (PreH4 : (data_length_pre <= retval_2)) (PreH5 : (ca0 <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : (CircularAreaDataLengthResult logical retval_2 )) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaEmptyResult logical retval )) (PreH11 : (data_length_pre > 0)) (PreH12 : (0 <= data_length_pre)) (PreH13 : (data_length_pre <= UINT_MAX)) (PreH14 : (output_buffer_pre <> 0)) (PreH15 : (circular_area_pre <> 0)) (PreH16 : (circular_area_pre = ca0)) (PreH17 : (output_buffer_pre = out0)) (PreH18 : (data_length_pre = requested)) (PreH19 : (0 <= requested)) (PreH20 : (requested <= UINT_MAX)) (PreH21 : (ca0 <> 0)) (PreH22 : (out0 <> 0)) (PreH23 : (requested <= output_capacity)) (PreH24 : (retval = 0)) (PreH25 : (retval_3 <> 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
.

Definition CircularAreaRead_entail_wit_4 := 
(
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaEmptyResult logical 0 )) (PreH6 : (CircularAreaActualReadLength logical requested data_length )) (PreH7 : (0 < data_length)) (PreH8 : (data_length <= output_capacity)) (PreH9 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaEmptyResult logical 0 ) ” 
  &&  “ (CircularAreaActualReadLength logical requested data_length ) ” 
  &&  “ (0 < data_length) ” 
  &&  “ (data_length <= output_capacity) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (readidx < area_length) ” 
  &&  “ ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) = (area_length - readidx )) ” 
  &&  “ ((unsigned_last_nbits ((data_length - (unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) )) (32)) = (data_length - (unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) )) ” 
  &&  “ ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) <= data_length) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx data_length area_length 1 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ” 
  &&  “ (CircularAreaLiveBytes readidx area_length logical physical ) ” 
  &&  “ (CircularAreaInitializedSlice physical readidx area_length (sublist (0) ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32))) (logical)) ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (sublist (readidx) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 (unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) (sublist (0) ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32))) (output_before)) )
  **  (UCharArray.mixed_seg out0 (unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) output_capacity (sublist ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32))) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaEmptyResult logical 0 )) (PreH6 : (CircularAreaActualReadLength logical requested data_length )) (PreH7 : (0 < data_length)) (PreH8 : (data_length <= output_capacity)) (PreH9 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (CircularAreaInitializedSlice physical readidx area_length (sublist (0) ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32))) (logical)) ) ” 
  &&  “ (CircularAreaLiveBytes readidx area_length logical physical ) ” 
  &&  “ ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) <= data_length) ” 
  &&  “ ((unsigned_last_nbits ((data_length - (unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) )) (32)) = (data_length - (unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) )) ” 
  &&  “ ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) = (area_length - readidx )) ” 
  &&  “ (readidx < area_length) ” 
  &&  “ (0 <= readidx) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (sublist (readidx) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 (unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) (sublist (0) ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32))) (output_before)) )
  **  (UCharArray.mixed_seg out0 (unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) output_capacity (sublist ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32))) (output_capacity) (output_before)) )
).

Definition CircularAreaRead_entail_wit_4_split_goal_1 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaEmptyResult logical 0 )) (PreH6 : (CircularAreaActualReadLength logical requested data_length )) (PreH7 : (0 < data_length)) (PreH8 : (data_length <= output_capacity)) (PreH9 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (CircularAreaInitializedSlice physical readidx area_length (sublist (0) ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32))) (logical)) ) ”
.

Definition CircularAreaRead_entail_wit_4_split_goal_2 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaEmptyResult logical 0 )) (PreH6 : (CircularAreaActualReadLength logical requested data_length )) (PreH7 : (0 < data_length)) (PreH8 : (data_length <= output_capacity)) (PreH9 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (CircularAreaLiveBytes readidx area_length logical physical ) ”
.

Definition CircularAreaRead_entail_wit_4_split_goal_3 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaEmptyResult logical 0 )) (PreH6 : (CircularAreaActualReadLength logical requested data_length )) (PreH7 : (0 < data_length)) (PreH8 : (data_length <= output_capacity)) (PreH9 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) <= data_length) ”
.

Definition CircularAreaRead_entail_wit_4_split_goal_4 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaEmptyResult logical 0 )) (PreH6 : (CircularAreaActualReadLength logical requested data_length )) (PreH7 : (0 < data_length)) (PreH8 : (data_length <= output_capacity)) (PreH9 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ ((unsigned_last_nbits ((data_length - (unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) )) (32)) = (data_length - (unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) )) ”
.

Definition CircularAreaRead_entail_wit_4_split_goal_5 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaEmptyResult logical 0 )) (PreH6 : (CircularAreaActualReadLength logical requested data_length )) (PreH7 : (0 < data_length)) (PreH8 : (data_length <= output_capacity)) (PreH9 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) = (area_length - readidx )) ”
.

Definition CircularAreaRead_entail_wit_4_split_goal_6 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaEmptyResult logical 0 )) (PreH6 : (CircularAreaActualReadLength logical requested data_length )) (PreH7 : (0 < data_length)) (PreH8 : (data_length <= output_capacity)) (PreH9 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (readidx < area_length) ”
.

Definition CircularAreaRead_entail_wit_4_split_goal_7 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaEmptyResult logical 0 )) (PreH6 : (CircularAreaActualReadLength logical requested data_length )) (PreH7 : (0 < data_length)) (PreH8 : (data_length <= output_capacity)) (PreH9 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (0 <= readidx) ”
.

Definition CircularAreaRead_entail_wit_4_split_goal_spatial := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaEmptyResult logical 0 )) (PreH6 : (CircularAreaActualReadLength logical requested data_length )) (PreH7 : (0 < data_length)) (PreH8 : (data_length <= output_capacity)) (PreH9 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (sublist (readidx) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 (unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) (sublist (0) ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32))) (output_before)) )
  **  (UCharArray.mixed_seg out0 (unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) output_capacity (sublist ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32))) (output_capacity) (output_before)) )
.

Definition CircularAreaRead_entail_wit_5 := 
(
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_up: Z) (read_len_down: Z) (retval: Z) (PreH1 : (retval = out0)) (PreH2 : (ca0 <> 0)) (PreH3 : (out0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (CircularAreaEmptyResult logical 0 )) (PreH7 : (CircularAreaActualReadLength logical requested data_length )) (PreH8 : (0 < data_length)) (PreH9 : (data_length <= output_capacity)) (PreH10 : (0 <= readidx)) (PreH11 : (readidx < area_length)) (PreH12 : (read_len_up = (area_length - readidx ))) (PreH13 : (read_len_down = (data_length - read_len_up ))) (PreH14 : (read_len_up <= data_length)) (PreH15 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH16 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH17 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH18 : (CircularAreaInitializedSlice physical readidx area_length (sublist (0) (read_len_up) (logical)) )) ,
  (UCharArray.mixed_seg out0 0 read_len_up (CircularAreaSomeBytes ((sublist (0) (read_len_up) (logical)))) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (sublist (readidx) (area_length) (physical)) )
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg out0 read_len_up output_capacity (sublist (read_len_up) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaEmptyResult logical 0 ) ” 
  &&  “ (CircularAreaActualReadLength logical requested data_length ) ” 
  &&  “ (0 < data_length) ” 
  &&  “ (data_length <= output_capacity) ” 
  &&  “ (0 <= read_len_down) ” 
  &&  “ (read_len_down <= readidx) ” 
  &&  “ (read_len_up = (area_length - readidx )) ” 
  &&  “ (read_len_down = (data_length - read_len_up )) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx data_length area_length 1 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ” 
  &&  “ (CircularAreaLiveBytes readidx area_length logical physical ) ” 
  &&  “ (CircularAreaInitializedSlice physical 0 read_len_down (sublist (read_len_up) (data_length) (logical)) ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 read_len_down (sublist (0) (read_len_down) (physical)) )
  **  (UCharArray.mixed_seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (sublist (readidx) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 read_len_up (CircularAreaSomeBytes ((sublist (0) (read_len_up) (logical)))) )
  **  (UCharArray.mixed_seg out0 read_len_up data_length (sublist (read_len_up) (data_length) (output_before)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_up: Z) (read_len_down: Z) (retval: Z) (PreH1 : (retval = out0)) (PreH2 : (ca0 <> 0)) (PreH3 : (out0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (CircularAreaEmptyResult logical 0 )) (PreH7 : (CircularAreaActualReadLength logical requested data_length )) (PreH8 : (0 < data_length)) (PreH9 : (data_length <= output_capacity)) (PreH10 : (0 <= readidx)) (PreH11 : (readidx < area_length)) (PreH12 : (read_len_up = (area_length - readidx ))) (PreH13 : (read_len_down = (data_length - read_len_up ))) (PreH14 : (read_len_up <= data_length)) (PreH15 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH16 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH17 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH18 : (CircularAreaInitializedSlice physical readidx area_length (sublist (0) (read_len_up) (logical)) )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
|--
  “ (CircularAreaInitializedSlice physical 0 (data_length - read_len_up ) (sublist ((area_length - readidx )) (data_length) (logical)) ) ” 
  &&  “ ((data_length - read_len_up ) <= readidx) ” 
  &&  “ ((sublist ((area_length - readidx )) (output_capacity) (output_before)) = (app ((sublist ((area_length - readidx )) (data_length) (output_before))) ((sublist (data_length) (output_capacity) (output_before))))) ” 
  &&  “ ((Zlength ((sublist ((area_length - readidx )) (data_length) (output_before)))) = (data_length - (area_length - readidx ) )) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 read_len_down (sublist (0) (read_len_down) (physical)) )
  **  (UCharArray.mixed_seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (physical)) )
).

Definition CircularAreaRead_entail_wit_5_split_goal_1 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_up: Z) (read_len_down: Z) (retval: Z) (PreH1 : (retval = out0)) (PreH2 : (ca0 <> 0)) (PreH3 : (out0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (CircularAreaEmptyResult logical 0 )) (PreH7 : (CircularAreaActualReadLength logical requested data_length )) (PreH8 : (0 < data_length)) (PreH9 : (data_length <= output_capacity)) (PreH10 : (0 <= readidx)) (PreH11 : (readidx < area_length)) (PreH12 : (read_len_up = (area_length - readidx ))) (PreH13 : (read_len_down = (data_length - read_len_up ))) (PreH14 : (read_len_up <= data_length)) (PreH15 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH16 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH17 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH18 : (CircularAreaInitializedSlice physical readidx area_length (sublist (0) (read_len_up) (logical)) )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
|--
  “ (CircularAreaInitializedSlice physical 0 (data_length - read_len_up ) (sublist ((area_length - readidx )) (data_length) (logical)) ) ”
.

Definition CircularAreaRead_entail_wit_5_split_goal_2 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_up: Z) (read_len_down: Z) (retval: Z) (PreH1 : (retval = out0)) (PreH2 : (ca0 <> 0)) (PreH3 : (out0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (CircularAreaEmptyResult logical 0 )) (PreH7 : (CircularAreaActualReadLength logical requested data_length )) (PreH8 : (0 < data_length)) (PreH9 : (data_length <= output_capacity)) (PreH10 : (0 <= readidx)) (PreH11 : (readidx < area_length)) (PreH12 : (read_len_up = (area_length - readidx ))) (PreH13 : (read_len_down = (data_length - read_len_up ))) (PreH14 : (read_len_up <= data_length)) (PreH15 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH16 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH17 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH18 : (CircularAreaInitializedSlice physical readidx area_length (sublist (0) (read_len_up) (logical)) )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
|--
  “ ((data_length - read_len_up ) <= readidx) ”
.

Definition CircularAreaRead_entail_wit_5_split_goal_3 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_up: Z) (read_len_down: Z) (retval: Z) (PreH1 : (retval = out0)) (PreH2 : (ca0 <> 0)) (PreH3 : (out0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (CircularAreaEmptyResult logical 0 )) (PreH7 : (CircularAreaActualReadLength logical requested data_length )) (PreH8 : (0 < data_length)) (PreH9 : (data_length <= output_capacity)) (PreH10 : (0 <= readidx)) (PreH11 : (readidx < area_length)) (PreH12 : (read_len_up = (area_length - readidx ))) (PreH13 : (read_len_down = (data_length - read_len_up ))) (PreH14 : (read_len_up <= data_length)) (PreH15 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH16 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH17 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH18 : (CircularAreaInitializedSlice physical readidx area_length (sublist (0) (read_len_up) (logical)) )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
|--
  “ ((sublist ((area_length - readidx )) (output_capacity) (output_before)) = (app ((sublist ((area_length - readidx )) (data_length) (output_before))) ((sublist (data_length) (output_capacity) (output_before))))) ”
.

Definition CircularAreaRead_entail_wit_5_split_goal_4 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_up: Z) (read_len_down: Z) (retval: Z) (PreH1 : (retval = out0)) (PreH2 : (ca0 <> 0)) (PreH3 : (out0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (CircularAreaEmptyResult logical 0 )) (PreH7 : (CircularAreaActualReadLength logical requested data_length )) (PreH8 : (0 < data_length)) (PreH9 : (data_length <= output_capacity)) (PreH10 : (0 <= readidx)) (PreH11 : (readidx < area_length)) (PreH12 : (read_len_up = (area_length - readidx ))) (PreH13 : (read_len_down = (data_length - read_len_up ))) (PreH14 : (read_len_up <= data_length)) (PreH15 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH16 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH17 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH18 : (CircularAreaInitializedSlice physical readidx area_length (sublist (0) (read_len_up) (logical)) )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
|--
  “ ((Zlength ((sublist ((area_length - readidx )) (data_length) (output_before)))) = (data_length - (area_length - readidx ) )) ”
.

Definition CircularAreaRead_entail_wit_5_split_goal_spatial := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_up: Z) (read_len_down: Z) (retval: Z) (PreH1 : (retval = out0)) (PreH2 : (ca0 <> 0)) (PreH3 : (out0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (CircularAreaEmptyResult logical 0 )) (PreH7 : (CircularAreaActualReadLength logical requested data_length )) (PreH8 : (0 < data_length)) (PreH9 : (data_length <= output_capacity)) (PreH10 : (0 <= readidx)) (PreH11 : (readidx < area_length)) (PreH12 : (read_len_up = (area_length - readidx ))) (PreH13 : (read_len_down = (data_length - read_len_up ))) (PreH14 : (read_len_up <= data_length)) (PreH15 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH16 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH17 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH18 : (CircularAreaInitializedSlice physical readidx area_length (sublist (0) (read_len_up) (logical)) )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
|--
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 read_len_down (sublist (0) (read_len_down) (physical)) )
  **  (UCharArray.mixed_seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (physical)) )
.

Definition CircularAreaRead_entail_wit_6_1 := 
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH4 : (ca0 <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaDataLengthResult logical retval )) (PreH7 : (data_length_pre > retval_3)) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaDataLengthResult logical retval_3 )) (PreH11 : (ca0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (CircularAreaEmptyResult logical retval_2 )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (output_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = ca0)) (PreH20 : (output_buffer_pre = out0)) (PreH21 : (data_length_pre = requested)) (PreH22 : (0 <= requested)) (PreH23 : (requested <= UINT_MAX)) (PreH24 : (ca0 <> 0)) (PreH25 : (out0 <> 0)) (PreH26 : (requested <= output_capacity)) (PreH27 : (retval_2 = 0)) (PreH28 : (retval_4 = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaEmptyResult logical 0 ) ” 
  &&  “ (CircularAreaActualReadLength logical requested retval ) ” 
  &&  “ (0 < retval) ” 
  &&  “ (retval <= output_capacity) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ ((readidx + retval ) <= area_length) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx retval area_length 0 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ” 
  &&  “ (CircularAreaLiveBytes readidx area_length logical physical ) ” 
  &&  “ (CircularAreaInitializedSlice physical readidx (readidx + retval ) (sublist (0) (retval) (logical)) ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx (readidx + retval ) (sublist (readidx) ((readidx + retval )) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (readidx + retval ) area_length (sublist ((readidx + retval )) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 retval (sublist (0) (retval) (output_before)) )
  **  (UCharArray.mixed_seg out0 retval output_capacity (sublist (retval) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH4 : (ca0 <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaDataLengthResult logical retval )) (PreH7 : (data_length_pre > retval_3)) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaDataLengthResult logical retval_3 )) (PreH11 : (ca0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (CircularAreaEmptyResult logical retval_2 )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (output_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = ca0)) (PreH20 : (output_buffer_pre = out0)) (PreH21 : (data_length_pre = requested)) (PreH22 : (0 <= requested)) (PreH23 : (requested <= UINT_MAX)) (PreH24 : (ca0 <> 0)) (PreH25 : (out0 <> 0)) (PreH26 : (requested <= output_capacity)) (PreH27 : (retval_2 = 0)) (PreH28 : (retval_4 = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (CircularAreaInitializedSlice physical readidx (readidx + retval ) (sublist (0) (retval) (logical)) ) ” 
  &&  “ (CircularAreaLiveBytes readidx area_length logical physical ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ” 
  &&  “ ((readidx + retval ) <= area_length) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (retval <= output_capacity) ” 
  &&  “ (0 < retval) ” 
  &&  “ (CircularAreaActualReadLength logical data_length_pre retval ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx (readidx + retval ) (sublist (readidx) ((readidx + retval )) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (readidx + retval ) area_length (sublist ((readidx + retval )) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 retval (sublist (0) (retval) (output_before)) )
  **  (UCharArray.mixed_seg out0 retval output_capacity (sublist (retval) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
).

Definition CircularAreaRead_entail_wit_6_1_split_goal_1 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH4 : (ca0 <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaDataLengthResult logical retval )) (PreH7 : (data_length_pre > retval_3)) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaDataLengthResult logical retval_3 )) (PreH11 : (ca0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (CircularAreaEmptyResult logical retval_2 )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (output_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = ca0)) (PreH20 : (output_buffer_pre = out0)) (PreH21 : (data_length_pre = requested)) (PreH22 : (0 <= requested)) (PreH23 : (requested <= UINT_MAX)) (PreH24 : (ca0 <> 0)) (PreH25 : (out0 <> 0)) (PreH26 : (requested <= output_capacity)) (PreH27 : (retval_2 = 0)) (PreH28 : (retval_4 = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (CircularAreaInitializedSlice physical readidx (readidx + retval ) (sublist (0) (retval) (logical)) ) ”
.

Definition CircularAreaRead_entail_wit_6_1_split_goal_2 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH4 : (ca0 <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaDataLengthResult logical retval )) (PreH7 : (data_length_pre > retval_3)) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaDataLengthResult logical retval_3 )) (PreH11 : (ca0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (CircularAreaEmptyResult logical retval_2 )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (output_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = ca0)) (PreH20 : (output_buffer_pre = out0)) (PreH21 : (data_length_pre = requested)) (PreH22 : (0 <= requested)) (PreH23 : (requested <= UINT_MAX)) (PreH24 : (ca0 <> 0)) (PreH25 : (out0 <> 0)) (PreH26 : (requested <= output_capacity)) (PreH27 : (retval_2 = 0)) (PreH28 : (retval_4 = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (CircularAreaLiveBytes readidx area_length logical physical ) ”
.

Definition CircularAreaRead_entail_wit_6_1_split_goal_3 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH4 : (ca0 <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaDataLengthResult logical retval )) (PreH7 : (data_length_pre > retval_3)) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaDataLengthResult logical retval_3 )) (PreH11 : (ca0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (CircularAreaEmptyResult logical retval_2 )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (output_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = ca0)) (PreH20 : (output_buffer_pre = out0)) (PreH21 : (data_length_pre = requested)) (PreH22 : (0 <= requested)) (PreH23 : (requested <= UINT_MAX)) (PreH24 : (ca0 <> 0)) (PreH25 : (out0 <> 0)) (PreH26 : (requested <= output_capacity)) (PreH27 : (retval_2 = 0)) (PreH28 : (retval_4 = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
.

Definition CircularAreaRead_entail_wit_6_1_split_goal_4 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH4 : (ca0 <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaDataLengthResult logical retval )) (PreH7 : (data_length_pre > retval_3)) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaDataLengthResult logical retval_3 )) (PreH11 : (ca0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (CircularAreaEmptyResult logical retval_2 )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (output_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = ca0)) (PreH20 : (output_buffer_pre = out0)) (PreH21 : (data_length_pre = requested)) (PreH22 : (0 <= requested)) (PreH23 : (requested <= UINT_MAX)) (PreH24 : (ca0 <> 0)) (PreH25 : (out0 <> 0)) (PreH26 : (requested <= output_capacity)) (PreH27 : (retval_2 = 0)) (PreH28 : (retval_4 = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ ((readidx + retval ) <= area_length) ”
.

Definition CircularAreaRead_entail_wit_6_1_split_goal_5 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH4 : (ca0 <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaDataLengthResult logical retval )) (PreH7 : (data_length_pre > retval_3)) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaDataLengthResult logical retval_3 )) (PreH11 : (ca0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (CircularAreaEmptyResult logical retval_2 )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (output_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = ca0)) (PreH20 : (output_buffer_pre = out0)) (PreH21 : (data_length_pre = requested)) (PreH22 : (0 <= requested)) (PreH23 : (requested <= UINT_MAX)) (PreH24 : (ca0 <> 0)) (PreH25 : (out0 <> 0)) (PreH26 : (requested <= output_capacity)) (PreH27 : (retval_2 = 0)) (PreH28 : (retval_4 = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (0 <= readidx) ”
.

Definition CircularAreaRead_entail_wit_6_1_split_goal_6 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH4 : (ca0 <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaDataLengthResult logical retval )) (PreH7 : (data_length_pre > retval_3)) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaDataLengthResult logical retval_3 )) (PreH11 : (ca0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (CircularAreaEmptyResult logical retval_2 )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (output_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = ca0)) (PreH20 : (output_buffer_pre = out0)) (PreH21 : (data_length_pre = requested)) (PreH22 : (0 <= requested)) (PreH23 : (requested <= UINT_MAX)) (PreH24 : (ca0 <> 0)) (PreH25 : (out0 <> 0)) (PreH26 : (requested <= output_capacity)) (PreH27 : (retval_2 = 0)) (PreH28 : (retval_4 = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (retval <= output_capacity) ”
.

Definition CircularAreaRead_entail_wit_6_1_split_goal_7 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH4 : (ca0 <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaDataLengthResult logical retval )) (PreH7 : (data_length_pre > retval_3)) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaDataLengthResult logical retval_3 )) (PreH11 : (ca0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (CircularAreaEmptyResult logical retval_2 )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (output_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = ca0)) (PreH20 : (output_buffer_pre = out0)) (PreH21 : (data_length_pre = requested)) (PreH22 : (0 <= requested)) (PreH23 : (requested <= UINT_MAX)) (PreH24 : (ca0 <> 0)) (PreH25 : (out0 <> 0)) (PreH26 : (requested <= output_capacity)) (PreH27 : (retval_2 = 0)) (PreH28 : (retval_4 = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (0 < retval) ”
.

Definition CircularAreaRead_entail_wit_6_1_split_goal_8 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH4 : (ca0 <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaDataLengthResult logical retval )) (PreH7 : (data_length_pre > retval_3)) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaDataLengthResult logical retval_3 )) (PreH11 : (ca0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (CircularAreaEmptyResult logical retval_2 )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (output_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = ca0)) (PreH20 : (output_buffer_pre = out0)) (PreH21 : (data_length_pre = requested)) (PreH22 : (0 <= requested)) (PreH23 : (requested <= UINT_MAX)) (PreH24 : (ca0 <> 0)) (PreH25 : (out0 <> 0)) (PreH26 : (requested <= output_capacity)) (PreH27 : (retval_2 = 0)) (PreH28 : (retval_4 = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (CircularAreaActualReadLength logical data_length_pre retval ) ”
.

Definition CircularAreaRead_entail_wit_6_1_split_goal_spatial := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH4 : (ca0 <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaDataLengthResult logical retval )) (PreH7 : (data_length_pre > retval_3)) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaDataLengthResult logical retval_3 )) (PreH11 : (ca0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (CircularAreaEmptyResult logical retval_2 )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (output_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = ca0)) (PreH20 : (output_buffer_pre = out0)) (PreH21 : (data_length_pre = requested)) (PreH22 : (0 <= requested)) (PreH23 : (requested <= UINT_MAX)) (PreH24 : (ca0 <> 0)) (PreH25 : (out0 <> 0)) (PreH26 : (requested <= output_capacity)) (PreH27 : (retval_2 = 0)) (PreH28 : (retval_4 = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx (readidx + retval ) (sublist (readidx) ((readidx + retval )) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (readidx + retval ) area_length (sublist ((readidx + retval )) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 retval (sublist (0) (retval) (output_before)) )
  **  (UCharArray.mixed_seg out0 retval output_capacity (sublist (retval) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
.

Definition CircularAreaRead_entail_wit_6_2 := 
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideRdDataResult readidx data_length_pre area_length retval_3 )) (PreH4 : (data_length_pre <= retval_2)) (PreH5 : (ca0 <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : (CircularAreaDataLengthResult logical retval_2 )) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaEmptyResult logical retval )) (PreH11 : (data_length_pre > 0)) (PreH12 : (0 <= data_length_pre)) (PreH13 : (data_length_pre <= UINT_MAX)) (PreH14 : (output_buffer_pre <> 0)) (PreH15 : (circular_area_pre <> 0)) (PreH16 : (circular_area_pre = ca0)) (PreH17 : (output_buffer_pre = out0)) (PreH18 : (data_length_pre = requested)) (PreH19 : (0 <= requested)) (PreH20 : (requested <= UINT_MAX)) (PreH21 : (ca0 <> 0)) (PreH22 : (out0 <> 0)) (PreH23 : (requested <= output_capacity)) (PreH24 : (retval = 0)) (PreH25 : (retval_3 = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaEmptyResult logical 0 ) ” 
  &&  “ (CircularAreaActualReadLength logical requested data_length_pre ) ” 
  &&  “ (0 < data_length_pre) ” 
  &&  “ (data_length_pre <= output_capacity) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ ((readidx + data_length_pre ) <= area_length) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx data_length_pre area_length 0 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ” 
  &&  “ (CircularAreaLiveBytes readidx area_length logical physical ) ” 
  &&  “ (CircularAreaInitializedSlice physical readidx (readidx + data_length_pre ) (sublist (0) (data_length_pre) (logical)) ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx (readidx + data_length_pre ) (sublist (readidx) ((readidx + data_length_pre )) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (readidx + data_length_pre ) area_length (sublist ((readidx + data_length_pre )) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 data_length_pre (sublist (0) (data_length_pre) (output_before)) )
  **  (UCharArray.mixed_seg out0 data_length_pre output_capacity (sublist (data_length_pre) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideRdDataResult readidx data_length_pre area_length retval_3 )) (PreH4 : (data_length_pre <= retval_2)) (PreH5 : (ca0 <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : (CircularAreaDataLengthResult logical retval_2 )) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaEmptyResult logical retval )) (PreH11 : (data_length_pre > 0)) (PreH12 : (0 <= data_length_pre)) (PreH13 : (data_length_pre <= UINT_MAX)) (PreH14 : (output_buffer_pre <> 0)) (PreH15 : (circular_area_pre <> 0)) (PreH16 : (circular_area_pre = ca0)) (PreH17 : (output_buffer_pre = out0)) (PreH18 : (data_length_pre = requested)) (PreH19 : (0 <= requested)) (PreH20 : (requested <= UINT_MAX)) (PreH21 : (ca0 <> 0)) (PreH22 : (out0 <> 0)) (PreH23 : (requested <= output_capacity)) (PreH24 : (retval = 0)) (PreH25 : (retval_3 = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (CircularAreaInitializedSlice physical readidx (readidx + data_length_pre ) (sublist (0) (data_length_pre) (logical)) ) ” 
  &&  “ (CircularAreaLiveBytes readidx area_length logical physical ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ” 
  &&  “ ((readidx + data_length_pre ) <= area_length) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (CircularAreaActualReadLength logical data_length_pre data_length_pre ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx (readidx + data_length_pre ) (sublist (readidx) ((readidx + data_length_pre )) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (readidx + data_length_pre ) area_length (sublist ((readidx + data_length_pre )) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 data_length_pre (sublist (0) (data_length_pre) (output_before)) )
  **  (UCharArray.mixed_seg out0 data_length_pre output_capacity (sublist (data_length_pre) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
).

Definition CircularAreaRead_entail_wit_6_2_split_goal_1 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideRdDataResult readidx data_length_pre area_length retval_3 )) (PreH4 : (data_length_pre <= retval_2)) (PreH5 : (ca0 <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : (CircularAreaDataLengthResult logical retval_2 )) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaEmptyResult logical retval )) (PreH11 : (data_length_pre > 0)) (PreH12 : (0 <= data_length_pre)) (PreH13 : (data_length_pre <= UINT_MAX)) (PreH14 : (output_buffer_pre <> 0)) (PreH15 : (circular_area_pre <> 0)) (PreH16 : (circular_area_pre = ca0)) (PreH17 : (output_buffer_pre = out0)) (PreH18 : (data_length_pre = requested)) (PreH19 : (0 <= requested)) (PreH20 : (requested <= UINT_MAX)) (PreH21 : (ca0 <> 0)) (PreH22 : (out0 <> 0)) (PreH23 : (requested <= output_capacity)) (PreH24 : (retval = 0)) (PreH25 : (retval_3 = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (CircularAreaInitializedSlice physical readidx (readidx + data_length_pre ) (sublist (0) (data_length_pre) (logical)) ) ”
.

Definition CircularAreaRead_entail_wit_6_2_split_goal_2 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideRdDataResult readidx data_length_pre area_length retval_3 )) (PreH4 : (data_length_pre <= retval_2)) (PreH5 : (ca0 <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : (CircularAreaDataLengthResult logical retval_2 )) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaEmptyResult logical retval )) (PreH11 : (data_length_pre > 0)) (PreH12 : (0 <= data_length_pre)) (PreH13 : (data_length_pre <= UINT_MAX)) (PreH14 : (output_buffer_pre <> 0)) (PreH15 : (circular_area_pre <> 0)) (PreH16 : (circular_area_pre = ca0)) (PreH17 : (output_buffer_pre = out0)) (PreH18 : (data_length_pre = requested)) (PreH19 : (0 <= requested)) (PreH20 : (requested <= UINT_MAX)) (PreH21 : (ca0 <> 0)) (PreH22 : (out0 <> 0)) (PreH23 : (requested <= output_capacity)) (PreH24 : (retval = 0)) (PreH25 : (retval_3 = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (CircularAreaLiveBytes readidx area_length logical physical ) ”
.

Definition CircularAreaRead_entail_wit_6_2_split_goal_3 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideRdDataResult readidx data_length_pre area_length retval_3 )) (PreH4 : (data_length_pre <= retval_2)) (PreH5 : (ca0 <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : (CircularAreaDataLengthResult logical retval_2 )) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaEmptyResult logical retval )) (PreH11 : (data_length_pre > 0)) (PreH12 : (0 <= data_length_pre)) (PreH13 : (data_length_pre <= UINT_MAX)) (PreH14 : (output_buffer_pre <> 0)) (PreH15 : (circular_area_pre <> 0)) (PreH16 : (circular_area_pre = ca0)) (PreH17 : (output_buffer_pre = out0)) (PreH18 : (data_length_pre = requested)) (PreH19 : (0 <= requested)) (PreH20 : (requested <= UINT_MAX)) (PreH21 : (ca0 <> 0)) (PreH22 : (out0 <> 0)) (PreH23 : (requested <= output_capacity)) (PreH24 : (retval = 0)) (PreH25 : (retval_3 = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
.

Definition CircularAreaRead_entail_wit_6_2_split_goal_4 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideRdDataResult readidx data_length_pre area_length retval_3 )) (PreH4 : (data_length_pre <= retval_2)) (PreH5 : (ca0 <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : (CircularAreaDataLengthResult logical retval_2 )) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaEmptyResult logical retval )) (PreH11 : (data_length_pre > 0)) (PreH12 : (0 <= data_length_pre)) (PreH13 : (data_length_pre <= UINT_MAX)) (PreH14 : (output_buffer_pre <> 0)) (PreH15 : (circular_area_pre <> 0)) (PreH16 : (circular_area_pre = ca0)) (PreH17 : (output_buffer_pre = out0)) (PreH18 : (data_length_pre = requested)) (PreH19 : (0 <= requested)) (PreH20 : (requested <= UINT_MAX)) (PreH21 : (ca0 <> 0)) (PreH22 : (out0 <> 0)) (PreH23 : (requested <= output_capacity)) (PreH24 : (retval = 0)) (PreH25 : (retval_3 = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ ((readidx + data_length_pre ) <= area_length) ”
.

Definition CircularAreaRead_entail_wit_6_2_split_goal_5 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideRdDataResult readidx data_length_pre area_length retval_3 )) (PreH4 : (data_length_pre <= retval_2)) (PreH5 : (ca0 <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : (CircularAreaDataLengthResult logical retval_2 )) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaEmptyResult logical retval )) (PreH11 : (data_length_pre > 0)) (PreH12 : (0 <= data_length_pre)) (PreH13 : (data_length_pre <= UINT_MAX)) (PreH14 : (output_buffer_pre <> 0)) (PreH15 : (circular_area_pre <> 0)) (PreH16 : (circular_area_pre = ca0)) (PreH17 : (output_buffer_pre = out0)) (PreH18 : (data_length_pre = requested)) (PreH19 : (0 <= requested)) (PreH20 : (requested <= UINT_MAX)) (PreH21 : (ca0 <> 0)) (PreH22 : (out0 <> 0)) (PreH23 : (requested <= output_capacity)) (PreH24 : (retval = 0)) (PreH25 : (retval_3 = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (0 <= readidx) ”
.

Definition CircularAreaRead_entail_wit_6_2_split_goal_6 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideRdDataResult readidx data_length_pre area_length retval_3 )) (PreH4 : (data_length_pre <= retval_2)) (PreH5 : (ca0 <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : (CircularAreaDataLengthResult logical retval_2 )) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaEmptyResult logical retval )) (PreH11 : (data_length_pre > 0)) (PreH12 : (0 <= data_length_pre)) (PreH13 : (data_length_pre <= UINT_MAX)) (PreH14 : (output_buffer_pre <> 0)) (PreH15 : (circular_area_pre <> 0)) (PreH16 : (circular_area_pre = ca0)) (PreH17 : (output_buffer_pre = out0)) (PreH18 : (data_length_pre = requested)) (PreH19 : (0 <= requested)) (PreH20 : (requested <= UINT_MAX)) (PreH21 : (ca0 <> 0)) (PreH22 : (out0 <> 0)) (PreH23 : (requested <= output_capacity)) (PreH24 : (retval = 0)) (PreH25 : (retval_3 = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (CircularAreaActualReadLength logical data_length_pre data_length_pre ) ”
.

Definition CircularAreaRead_entail_wit_6_2_split_goal_spatial := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideRdDataResult readidx data_length_pre area_length retval_3 )) (PreH4 : (data_length_pre <= retval_2)) (PreH5 : (ca0 <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : (CircularAreaDataLengthResult logical retval_2 )) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaEmptyResult logical retval )) (PreH11 : (data_length_pre > 0)) (PreH12 : (0 <= data_length_pre)) (PreH13 : (data_length_pre <= UINT_MAX)) (PreH14 : (output_buffer_pre <> 0)) (PreH15 : (circular_area_pre <> 0)) (PreH16 : (circular_area_pre = ca0)) (PreH17 : (output_buffer_pre = out0)) (PreH18 : (data_length_pre = requested)) (PreH19 : (0 <= requested)) (PreH20 : (requested <= UINT_MAX)) (PreH21 : (ca0 <> 0)) (PreH22 : (out0 <> 0)) (PreH23 : (requested <= output_capacity)) (PreH24 : (retval = 0)) (PreH25 : (retval_3 = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx (readidx + data_length_pre ) (sublist (readidx) ((readidx + data_length_pre )) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (readidx + data_length_pre ) area_length (sublist ((readidx + data_length_pre )) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 data_length_pre (sublist (0) (data_length_pre) (output_before)) )
  **  (UCharArray.mixed_seg out0 data_length_pre output_capacity (sublist (data_length_pre) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
.

Definition CircularAreaRead_return_wit_1 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_down: Z) (read_len_up: Z) (retval: Z) (PreH1 : (retval = (out0 + (read_len_up * sizeof(UCHAR))))) (PreH2 : (ca0 <> 0)) (PreH3 : (out0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (CircularAreaEmptyResult logical 0 )) (PreH7 : (CircularAreaActualReadLength logical requested data_length )) (PreH8 : (0 < data_length)) (PreH9 : (data_length <= output_capacity)) (PreH10 : (0 <= read_len_down)) (PreH11 : (read_len_down <= readidx)) (PreH12 : (read_len_up = (area_length - readidx ))) (PreH13 : (read_len_down = (data_length - read_len_up ))) (PreH14 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH15 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH16 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH17 : (CircularAreaInitializedSlice physical 0 read_len_down (sublist (read_len_up) (data_length) (logical)) )) ,
  (UCharArray.mixed_seg out0 read_len_up data_length (CircularAreaSomeBytes ((sublist (read_len_up) (data_length) (logical)))) )
  **  (UCharArray.mixed_seg data_buffer 0 read_len_down (sublist (0) (read_len_down) (physical)) )
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (sublist (readidx) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 read_len_up (CircularAreaSomeBytes ((sublist (0) (read_len_up) (logical)))) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> (unsigned_last_nbits (read_len_down) (8)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  (EX (actual: Z)  (new_readidx: Z)  (bytes: (@list Z))  (logical_after: (@list Z))  (output_after: (@list (@option Z))) ,
  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (0 = 0) ” 
  &&  “ (CircularAreaEmptyResult logical 0 ) ” 
  &&  “ (CircularAreaReadSuccess readidx area_length requested output_capacity logical output_before actual new_readidx bytes logical_after output_after ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer new_readidx writeidx area_length 0 operations logical_after physical )
  **  (UCharArray.mixed_full out0 output_capacity output_after ))
  ||
  (“ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (CircularAreaEmptyResult logical 1 ) ” 
  &&  “ (CircularAreaErrorResult 0 ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before ))
.

Definition CircularAreaRead_return_wit_2 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (retval: Z) (PreH1 : (retval = out0)) (PreH2 : (ca0 <> 0)) (PreH3 : (out0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (CircularAreaEmptyResult logical 0 )) (PreH7 : (CircularAreaActualReadLength logical requested data_length )) (PreH8 : (0 < data_length)) (PreH9 : (data_length <= output_capacity)) (PreH10 : (0 <= readidx)) (PreH11 : ((readidx + data_length ) <= area_length)) (PreH12 : (CircularAreaDivideRdDataResult readidx data_length area_length 0 )) (PreH13 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH14 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH15 : (CircularAreaInitializedSlice physical readidx (readidx + data_length ) (sublist (0) (data_length) (logical)) )) ,
  (UCharArray.mixed_seg out0 0 data_length (CircularAreaSomeBytes ((sublist (0) (data_length) (logical)))) )
  **  (UCharArray.mixed_seg data_buffer readidx (readidx + data_length ) (sublist (readidx) ((readidx + data_length )) (physical)) )
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (readidx + data_length ) area_length (sublist ((readidx + data_length )) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> (unsigned_last_nbits (((readidx + data_length ) % ( area_length ) )) (8)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  (EX (actual: Z)  (new_readidx: Z)  (bytes: (@list Z))  (logical_after: (@list Z))  (output_after: (@list (@option Z))) ,
  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (0 = 0) ” 
  &&  “ (CircularAreaEmptyResult logical 0 ) ” 
  &&  “ (CircularAreaReadSuccess readidx area_length requested output_capacity logical output_before actual new_readidx bytes logical_after output_after ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer new_readidx writeidx area_length 0 operations logical_after physical )
  **  (UCharArray.mixed_full out0 output_capacity output_after ))
  ||
  (“ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (CircularAreaEmptyResult logical 1 ) ” 
  &&  “ (CircularAreaErrorResult 0 ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before ))
.

Definition CircularAreaRead_return_wit_3 := 
(
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (requested > 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested <= output_capacity)) (PreH6 : (CircularAreaEmptyResult logical 1 )) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (CircularAreaEmptyResult logical 1 ) ” 
  &&  “ (CircularAreaErrorResult 1 ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
) \/
(
forall (requested: Z) (out0: Z) (ca0: Z) (output_capacity: Z) (logical: (@list Z)) (data_buffer: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (requested > 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested <= output_capacity)) (PreH6 : (CircularAreaEmptyResult logical 1 )) ,
  TT && emp 
|--
  “ (CircularAreaErrorResult 1 ) ”
  &&  emp
).

Definition CircularAreaRead_return_wit_3_split_goal_1 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_capacity: Z) (logical: (@list Z)) (data_buffer: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (requested > 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested <= output_capacity)) (PreH6 : (CircularAreaEmptyResult logical 1 )) ,
  (CircularAreaErrorResult 1 )
.

Definition CircularAreaRead_return_wit_4 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (data_length_pre <= 0)) (PreH2 : (0 <= data_length_pre)) (PreH3 : (data_length_pre <= UINT_MAX)) (PreH4 : (output_buffer_pre <> 0)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre = ca0)) (PreH7 : (output_buffer_pre = out0)) (PreH8 : (data_length_pre = requested)) (PreH9 : (0 <= requested)) (PreH10 : (requested <= UINT_MAX)) (PreH11 : (ca0 <> 0)) (PreH12 : (out0 <> 0)) (PreH13 : (requested <= output_capacity)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  (“ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (requested = 0) ” 
  &&  “ (CircularAreaErrorResult 1 ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before ))
  ||
  (“ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (CircularAreaEmptyResult logical 1 ) ” 
  &&  “ (CircularAreaErrorResult 1 ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before ))
.

Definition CircularAreaRead_return_wit_5 := 
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (output_buffer_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = ca0)) (PreH4 : (output_buffer_pre = out0)) (PreH5 : (data_length_pre = requested)) (PreH6 : (0 <= requested)) (PreH7 : (requested <= UINT_MAX)) (PreH8 : (ca0 <> 0)) (PreH9 : (out0 = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (ca0 <> 0) ” 
  &&  “ (out0 = 0) ” 
  &&  “ (CircularAreaErrorResult 1 ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
) \/
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (PreH1 : (output_buffer_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = ca0)) (PreH4 : (output_buffer_pre = out0)) (PreH5 : (data_length_pre = requested)) (PreH6 : (0 <= requested)) (PreH7 : (requested <= UINT_MAX)) (PreH8 : (ca0 <> 0)) (PreH9 : (out0 = 0)) ,
  TT && emp 
|--
  “ (CircularAreaErrorResult 1 ) ”
  &&  emp
).

Definition CircularAreaRead_return_wit_5_split_goal_1 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (PreH1 : (output_buffer_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = ca0)) (PreH4 : (output_buffer_pre = out0)) (PreH5 : (data_length_pre = requested)) (PreH6 : (0 <= requested)) (PreH7 : (requested <= UINT_MAX)) (PreH8 : (ca0 <> 0)) (PreH9 : (out0 = 0)) ,
  (CircularAreaErrorResult 1 )
.

Definition CircularAreaRead_return_wit_6 := 
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (LitMap: (string -> Z)) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (output_buffer_pre = out0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (0 <= requested)) (PreH6 : (requested <= UINT_MAX)) (PreH7 : (ca0 = 0)) ,
  (GlobalStrings LitMap )
|--
  “ (ca0 = 0) ” 
  &&  “ (CircularAreaErrorResult 1 ) ”
  &&  (GlobalStrings LitMap )
) \/
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (output_buffer_pre = out0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (0 <= requested)) (PreH6 : (requested <= UINT_MAX)) (PreH7 : (ca0 = 0)) ,
  TT && emp 
|--
  “ (CircularAreaErrorResult 1 ) ”
  &&  emp
).

Definition CircularAreaRead_return_wit_6_split_goal_1 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (output_buffer_pre = out0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (0 <= requested)) (PreH6 : (requested <= UINT_MAX)) (PreH7 : (ca0 = 0)) ,
  (CircularAreaErrorResult 1 )
.

Definition CircularAreaRead_partial_solve_wit_1_pure := 
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (data_length_pre > 0)) (PreH2 : (0 <= data_length_pre)) (PreH3 : (data_length_pre <= UINT_MAX)) (PreH4 : (output_buffer_pre <> 0)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre = ca0)) (PreH7 : (output_buffer_pre = out0)) (PreH8 : (data_length_pre = requested)) (PreH9 : (0 <= requested)) (PreH10 : (requested <= UINT_MAX)) (PreH11 : (ca0 <> 0)) (PreH12 : (out0 <> 0)) (PreH13 : (requested <= output_capacity)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (circular_area_pre = ca0) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ”
) \/
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (data_length_pre >= 0)) (PreH2 : (data_length_pre > 0)) (PreH3 : (0 <= data_length_pre)) (PreH4 : (data_length_pre <= UINT_MAX)) (PreH5 : (output_buffer_pre <> 0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (circular_area_pre = ca0)) (PreH8 : (output_buffer_pre = out0)) (PreH9 : (data_length_pre = requested)) (PreH10 : (0 <= requested)) (PreH11 : (requested <= UINT_MAX)) (PreH12 : (ca0 <> 0)) (PreH13 : (out0 <> 0)) (PreH14 : (requested <= output_capacity)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (data_buffer <> 0) ”
).

Definition CircularAreaRead_partial_solve_wit_1_pure_split_goal_1 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (data_length_pre >= 0)) (PreH2 : (data_length_pre > 0)) (PreH3 : (0 <= data_length_pre)) (PreH4 : (data_length_pre <= UINT_MAX)) (PreH5 : (output_buffer_pre <> 0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (circular_area_pre = ca0)) (PreH8 : (output_buffer_pre = out0)) (PreH9 : (data_length_pre = requested)) (PreH10 : (0 <= requested)) (PreH11 : (requested <= UINT_MAX)) (PreH12 : (ca0 <> 0)) (PreH13 : (out0 <> 0)) (PreH14 : (requested <= output_capacity)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (data_buffer <> 0) ”
.

Definition CircularAreaRead_partial_solve_wit_1_aux := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (data_length_pre > 0)) (PreH2 : (0 <= data_length_pre)) (PreH3 : (data_length_pre <= UINT_MAX)) (PreH4 : (output_buffer_pre <> 0)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre = ca0)) (PreH7 : (output_buffer_pre = out0)) (PreH8 : (data_length_pre = requested)) (PreH9 : (0 <= requested)) (PreH10 : (requested <= UINT_MAX)) (PreH11 : (ca0 <> 0)) (PreH12 : (out0 <> 0)) (PreH13 : (requested <= output_capacity)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (circular_area_pre = ca0) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (data_length_pre > 0) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= UINT_MAX) ” 
  &&  “ (output_buffer_pre <> 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre = ca0) ” 
  &&  “ (output_buffer_pre = out0) ” 
  &&  “ (data_length_pre = requested) ” 
  &&  “ (0 <= requested) ” 
  &&  “ (requested <= UINT_MAX) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (requested <= output_capacity) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
.

Definition CircularAreaRead_partial_solve_wit_1 := CircularAreaRead_partial_solve_wit_1_pure -> CircularAreaRead_partial_solve_wit_1_aux.

Definition CircularAreaRead_partial_solve_wit_2_pure := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaEmptyResult logical retval )) (PreH4 : (data_length_pre > 0)) (PreH5 : (0 <= data_length_pre)) (PreH6 : (data_length_pre <= UINT_MAX)) (PreH7 : (output_buffer_pre <> 0)) (PreH8 : (circular_area_pre <> 0)) (PreH9 : (circular_area_pre = ca0)) (PreH10 : (output_buffer_pre = out0)) (PreH11 : (data_length_pre = requested)) (PreH12 : (0 <= requested)) (PreH13 : (requested <= UINT_MAX)) (PreH14 : (ca0 <> 0)) (PreH15 : (out0 <> 0)) (PreH16 : (requested <= output_capacity)) (PreH17 : (retval = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (circular_area_pre = ca0) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ”
.

Definition CircularAreaRead_partial_solve_wit_2_aux := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaEmptyResult logical retval )) (PreH4 : (data_length_pre > 0)) (PreH5 : (0 <= data_length_pre)) (PreH6 : (data_length_pre <= UINT_MAX)) (PreH7 : (output_buffer_pre <> 0)) (PreH8 : (circular_area_pre <> 0)) (PreH9 : (circular_area_pre = ca0)) (PreH10 : (output_buffer_pre = out0)) (PreH11 : (data_length_pre = requested)) (PreH12 : (0 <= requested)) (PreH13 : (requested <= UINT_MAX)) (PreH14 : (ca0 <> 0)) (PreH15 : (out0 <> 0)) (PreH16 : (requested <= output_capacity)) (PreH17 : (retval = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (circular_area_pre = ca0) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaEmptyResult logical retval ) ” 
  &&  “ (data_length_pre > 0) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= UINT_MAX) ” 
  &&  “ (output_buffer_pre <> 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre = ca0) ” 
  &&  “ (output_buffer_pre = out0) ” 
  &&  “ (data_length_pre = requested) ” 
  &&  “ (0 <= requested) ” 
  &&  “ (requested <= UINT_MAX) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (requested <= output_capacity) ” 
  &&  “ (retval = 0) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
.

Definition CircularAreaRead_partial_solve_wit_2 := CircularAreaRead_partial_solve_wit_2_pure -> CircularAreaRead_partial_solve_wit_2_aux.

Definition CircularAreaRead_partial_solve_wit_3_pure := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (PreH1 : (data_length_pre > retval_2)) (PreH2 : (ca0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (CircularAreaDataLengthResult logical retval_2 )) (PreH5 : (ca0 <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : (CircularAreaEmptyResult logical retval )) (PreH8 : (data_length_pre > 0)) (PreH9 : (0 <= data_length_pre)) (PreH10 : (data_length_pre <= UINT_MAX)) (PreH11 : (output_buffer_pre <> 0)) (PreH12 : (circular_area_pre <> 0)) (PreH13 : (circular_area_pre = ca0)) (PreH14 : (output_buffer_pre = out0)) (PreH15 : (data_length_pre = requested)) (PreH16 : (0 <= requested)) (PreH17 : (requested <= UINT_MAX)) (PreH18 : (ca0 <> 0)) (PreH19 : (out0 <> 0)) (PreH20 : (requested <= output_capacity)) (PreH21 : (retval = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (circular_area_pre = ca0) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ”
.

Definition CircularAreaRead_partial_solve_wit_3_aux := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (PreH1 : (data_length_pre > retval_2)) (PreH2 : (ca0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (CircularAreaDataLengthResult logical retval_2 )) (PreH5 : (ca0 <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : (CircularAreaEmptyResult logical retval )) (PreH8 : (data_length_pre > 0)) (PreH9 : (0 <= data_length_pre)) (PreH10 : (data_length_pre <= UINT_MAX)) (PreH11 : (output_buffer_pre <> 0)) (PreH12 : (circular_area_pre <> 0)) (PreH13 : (circular_area_pre = ca0)) (PreH14 : (output_buffer_pre = out0)) (PreH15 : (data_length_pre = requested)) (PreH16 : (0 <= requested)) (PreH17 : (requested <= UINT_MAX)) (PreH18 : (ca0 <> 0)) (PreH19 : (out0 <> 0)) (PreH20 : (requested <= output_capacity)) (PreH21 : (retval = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (circular_area_pre = ca0) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (data_length_pre > retval_2) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaDataLengthResult logical retval_2 ) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaEmptyResult logical retval ) ” 
  &&  “ (data_length_pre > 0) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= UINT_MAX) ” 
  &&  “ (output_buffer_pre <> 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre = ca0) ” 
  &&  “ (output_buffer_pre = out0) ” 
  &&  “ (data_length_pre = requested) ” 
  &&  “ (0 <= requested) ” 
  &&  “ (requested <= UINT_MAX) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (requested <= output_capacity) ” 
  &&  “ (retval = 0) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
.

Definition CircularAreaRead_partial_solve_wit_3 := CircularAreaRead_partial_solve_wit_3_pure -> CircularAreaRead_partial_solve_wit_3_aux.

Definition CircularAreaRead_partial_solve_wit_4_pure := 
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDataLengthResult logical retval )) (PreH4 : (data_length_pre > retval_3)) (PreH5 : (ca0 <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : (CircularAreaDataLengthResult logical retval_3 )) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaEmptyResult logical retval_2 )) (PreH11 : (data_length_pre > 0)) (PreH12 : (0 <= data_length_pre)) (PreH13 : (data_length_pre <= UINT_MAX)) (PreH14 : (output_buffer_pre <> 0)) (PreH15 : (circular_area_pre <> 0)) (PreH16 : (circular_area_pre = ca0)) (PreH17 : (output_buffer_pre = out0)) (PreH18 : (data_length_pre = requested)) (PreH19 : (0 <= requested)) (PreH20 : (requested <= UINT_MAX)) (PreH21 : (ca0 <> 0)) (PreH22 : (out0 <> 0)) (PreH23 : (requested <= output_capacity)) (PreH24 : (retval_2 = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  ((( &( "data_length" ) )) # UInt  |-> retval)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (circular_area_pre = ca0) ” 
  &&  “ (retval = retval) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ ((readidx + retval ) <= UINT_MAX) ” 
  &&  “ (retval <= area_length) ” 
  &&  “ (0 <= retval) ”
) \/
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (retval <= UINT_MAX)) (PreH2 : (retval >= 0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaDataLengthResult logical retval )) (PreH6 : (data_length_pre > retval_3)) (PreH7 : (ca0 <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaDataLengthResult logical retval_3 )) (PreH10 : (ca0 <> 0)) (PreH11 : (data_buffer <> 0)) (PreH12 : (CircularAreaEmptyResult logical retval_2 )) (PreH13 : (data_length_pre > 0)) (PreH14 : (0 <= data_length_pre)) (PreH15 : (data_length_pre <= UINT_MAX)) (PreH16 : (output_buffer_pre <> 0)) (PreH17 : (circular_area_pre <> 0)) (PreH18 : (circular_area_pre = ca0)) (PreH19 : (output_buffer_pre = out0)) (PreH20 : (data_length_pre = requested)) (PreH21 : (0 <= requested)) (PreH22 : (requested <= UINT_MAX)) (PreH23 : (ca0 <> 0)) (PreH24 : (out0 <> 0)) (PreH25 : (requested <= output_capacity)) (PreH26 : (retval_2 = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  ((( &( "data_length" ) )) # UInt  |-> retval)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (retval <= area_length) ” 
  &&  “ ((readidx + retval ) <= UINT_MAX) ”
).

Definition CircularAreaRead_partial_solve_wit_4_pure_split_goal_1 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (retval <= UINT_MAX)) (PreH2 : (retval >= 0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaDataLengthResult logical retval )) (PreH6 : (data_length_pre > retval_3)) (PreH7 : (ca0 <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaDataLengthResult logical retval_3 )) (PreH10 : (ca0 <> 0)) (PreH11 : (data_buffer <> 0)) (PreH12 : (CircularAreaEmptyResult logical retval_2 )) (PreH13 : (data_length_pre > 0)) (PreH14 : (0 <= data_length_pre)) (PreH15 : (data_length_pre <= UINT_MAX)) (PreH16 : (output_buffer_pre <> 0)) (PreH17 : (circular_area_pre <> 0)) (PreH18 : (circular_area_pre = ca0)) (PreH19 : (output_buffer_pre = out0)) (PreH20 : (data_length_pre = requested)) (PreH21 : (0 <= requested)) (PreH22 : (requested <= UINT_MAX)) (PreH23 : (ca0 <> 0)) (PreH24 : (out0 <> 0)) (PreH25 : (requested <= output_capacity)) (PreH26 : (retval_2 = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  ((( &( "data_length" ) )) # UInt  |-> retval)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (retval <= area_length) ”
.

Definition CircularAreaRead_partial_solve_wit_4_pure_split_goal_2 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (retval <= UINT_MAX)) (PreH2 : (retval >= 0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaDataLengthResult logical retval )) (PreH6 : (data_length_pre > retval_3)) (PreH7 : (ca0 <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaDataLengthResult logical retval_3 )) (PreH10 : (ca0 <> 0)) (PreH11 : (data_buffer <> 0)) (PreH12 : (CircularAreaEmptyResult logical retval_2 )) (PreH13 : (data_length_pre > 0)) (PreH14 : (0 <= data_length_pre)) (PreH15 : (data_length_pre <= UINT_MAX)) (PreH16 : (output_buffer_pre <> 0)) (PreH17 : (circular_area_pre <> 0)) (PreH18 : (circular_area_pre = ca0)) (PreH19 : (output_buffer_pre = out0)) (PreH20 : (data_length_pre = requested)) (PreH21 : (0 <= requested)) (PreH22 : (requested <= UINT_MAX)) (PreH23 : (ca0 <> 0)) (PreH24 : (out0 <> 0)) (PreH25 : (requested <= output_capacity)) (PreH26 : (retval_2 = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  ((( &( "data_length" ) )) # UInt  |-> retval)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ ((readidx + retval ) <= UINT_MAX) ”
.

Definition CircularAreaRead_partial_solve_wit_4_aux := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDataLengthResult logical retval )) (PreH4 : (data_length_pre > retval_3)) (PreH5 : (ca0 <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : (CircularAreaDataLengthResult logical retval_3 )) (PreH8 : (ca0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaEmptyResult logical retval_2 )) (PreH11 : (data_length_pre > 0)) (PreH12 : (0 <= data_length_pre)) (PreH13 : (data_length_pre <= UINT_MAX)) (PreH14 : (output_buffer_pre <> 0)) (PreH15 : (circular_area_pre <> 0)) (PreH16 : (circular_area_pre = ca0)) (PreH17 : (output_buffer_pre = out0)) (PreH18 : (data_length_pre = requested)) (PreH19 : (0 <= requested)) (PreH20 : (requested <= UINT_MAX)) (PreH21 : (ca0 <> 0)) (PreH22 : (out0 <> 0)) (PreH23 : (requested <= output_capacity)) (PreH24 : (retval_2 = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (circular_area_pre = ca0) ” 
  &&  “ (retval = retval) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ ((readidx + retval ) <= UINT_MAX) ” 
  &&  “ (retval <= area_length) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaDataLengthResult logical retval ) ” 
  &&  “ (data_length_pre > retval_3) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaDataLengthResult logical retval_3 ) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaEmptyResult logical retval_2 ) ” 
  &&  “ (data_length_pre > 0) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= UINT_MAX) ” 
  &&  “ (output_buffer_pre <> 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre = ca0) ” 
  &&  “ (output_buffer_pre = out0) ” 
  &&  “ (data_length_pre = requested) ” 
  &&  “ (0 <= requested) ” 
  &&  “ (requested <= UINT_MAX) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (requested <= output_capacity) ” 
  &&  “ (retval_2 = 0) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
.

Definition CircularAreaRead_partial_solve_wit_4 := CircularAreaRead_partial_solve_wit_4_pure -> CircularAreaRead_partial_solve_wit_4_aux.

Definition CircularAreaRead_partial_solve_wit_5_pure := 
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (PreH1 : (data_length_pre <= retval_2)) (PreH2 : (ca0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (CircularAreaDataLengthResult logical retval_2 )) (PreH5 : (ca0 <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : (CircularAreaEmptyResult logical retval )) (PreH8 : (data_length_pre > 0)) (PreH9 : (0 <= data_length_pre)) (PreH10 : (data_length_pre <= UINT_MAX)) (PreH11 : (output_buffer_pre <> 0)) (PreH12 : (circular_area_pre <> 0)) (PreH13 : (circular_area_pre = ca0)) (PreH14 : (output_buffer_pre = out0)) (PreH15 : (data_length_pre = requested)) (PreH16 : (0 <= requested)) (PreH17 : (requested <= UINT_MAX)) (PreH18 : (ca0 <> 0)) (PreH19 : (out0 <> 0)) (PreH20 : (requested <= output_capacity)) (PreH21 : (retval = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (circular_area_pre = ca0) ” 
  &&  “ (data_length_pre = data_length_pre) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ ((readidx + data_length_pre ) <= UINT_MAX) ” 
  &&  “ (data_length_pre <= area_length) ”
) \/
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (PreH1 : (data_length_pre >= 0)) (PreH2 : (data_length_pre <= retval_2)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaDataLengthResult logical retval_2 )) (PreH6 : (ca0 <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (CircularAreaEmptyResult logical retval )) (PreH9 : (data_length_pre > 0)) (PreH10 : (0 <= data_length_pre)) (PreH11 : (data_length_pre <= UINT_MAX)) (PreH12 : (output_buffer_pre <> 0)) (PreH13 : (circular_area_pre <> 0)) (PreH14 : (circular_area_pre = ca0)) (PreH15 : (output_buffer_pre = out0)) (PreH16 : (data_length_pre = requested)) (PreH17 : (0 <= requested)) (PreH18 : (requested <= UINT_MAX)) (PreH19 : (ca0 <> 0)) (PreH20 : (out0 <> 0)) (PreH21 : (requested <= output_capacity)) (PreH22 : (retval = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (data_length_pre <= area_length) ” 
  &&  “ ((readidx + data_length_pre ) <= UINT_MAX) ”
).

Definition CircularAreaRead_partial_solve_wit_5_pure_split_goal_1 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (PreH1 : (data_length_pre >= 0)) (PreH2 : (data_length_pre <= retval_2)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaDataLengthResult logical retval_2 )) (PreH6 : (ca0 <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (CircularAreaEmptyResult logical retval )) (PreH9 : (data_length_pre > 0)) (PreH10 : (0 <= data_length_pre)) (PreH11 : (data_length_pre <= UINT_MAX)) (PreH12 : (output_buffer_pre <> 0)) (PreH13 : (circular_area_pre <> 0)) (PreH14 : (circular_area_pre = ca0)) (PreH15 : (output_buffer_pre = out0)) (PreH16 : (data_length_pre = requested)) (PreH17 : (0 <= requested)) (PreH18 : (requested <= UINT_MAX)) (PreH19 : (ca0 <> 0)) (PreH20 : (out0 <> 0)) (PreH21 : (requested <= output_capacity)) (PreH22 : (retval = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (data_length_pre <= area_length) ”
.

Definition CircularAreaRead_partial_solve_wit_5_pure_split_goal_2 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (PreH1 : (data_length_pre >= 0)) (PreH2 : (data_length_pre <= retval_2)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaDataLengthResult logical retval_2 )) (PreH6 : (ca0 <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (CircularAreaEmptyResult logical retval )) (PreH9 : (data_length_pre > 0)) (PreH10 : (0 <= data_length_pre)) (PreH11 : (data_length_pre <= UINT_MAX)) (PreH12 : (output_buffer_pre <> 0)) (PreH13 : (circular_area_pre <> 0)) (PreH14 : (circular_area_pre = ca0)) (PreH15 : (output_buffer_pre = out0)) (PreH16 : (data_length_pre = requested)) (PreH17 : (0 <= requested)) (PreH18 : (requested <= UINT_MAX)) (PreH19 : (ca0 <> 0)) (PreH20 : (out0 <> 0)) (PreH21 : (requested <= output_capacity)) (PreH22 : (retval = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ ((readidx + data_length_pre ) <= UINT_MAX) ”
.

Definition CircularAreaRead_partial_solve_wit_5_aux := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (PreH1 : (data_length_pre <= retval_2)) (PreH2 : (ca0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (CircularAreaDataLengthResult logical retval_2 )) (PreH5 : (ca0 <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : (CircularAreaEmptyResult logical retval )) (PreH8 : (data_length_pre > 0)) (PreH9 : (0 <= data_length_pre)) (PreH10 : (data_length_pre <= UINT_MAX)) (PreH11 : (output_buffer_pre <> 0)) (PreH12 : (circular_area_pre <> 0)) (PreH13 : (circular_area_pre = ca0)) (PreH14 : (output_buffer_pre = out0)) (PreH15 : (data_length_pre = requested)) (PreH16 : (0 <= requested)) (PreH17 : (requested <= UINT_MAX)) (PreH18 : (ca0 <> 0)) (PreH19 : (out0 <> 0)) (PreH20 : (requested <= output_capacity)) (PreH21 : (retval = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (circular_area_pre = ca0) ” 
  &&  “ (data_length_pre = data_length_pre) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ ((readidx + data_length_pre ) <= UINT_MAX) ” 
  &&  “ (data_length_pre <= area_length) ” 
  &&  “ (data_length_pre <= retval_2) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaDataLengthResult logical retval_2 ) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaEmptyResult logical retval ) ” 
  &&  “ (data_length_pre > 0) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= UINT_MAX) ” 
  &&  “ (output_buffer_pre <> 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre = ca0) ” 
  &&  “ (output_buffer_pre = out0) ” 
  &&  “ (data_length_pre = requested) ” 
  &&  “ (0 <= requested) ” 
  &&  “ (requested <= UINT_MAX) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (requested <= output_capacity) ” 
  &&  “ (retval = 0) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
.

Definition CircularAreaRead_partial_solve_wit_5 := CircularAreaRead_partial_solve_wit_5_pure -> CircularAreaRead_partial_solve_wit_5_aux.

Definition CircularAreaRead_partial_solve_wit_6_pure := 
(
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_up: Z) (read_len_down: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaEmptyResult logical 0 )) (PreH6 : (CircularAreaActualReadLength logical requested data_length )) (PreH7 : (0 < data_length)) (PreH8 : (data_length <= output_capacity)) (PreH9 : (0 <= readidx)) (PreH10 : (readidx < area_length)) (PreH11 : (read_len_up = (area_length - readidx ))) (PreH12 : (read_len_down = (data_length - read_len_up ))) (PreH13 : (read_len_up <= data_length)) (PreH14 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH15 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH16 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH17 : (CircularAreaInitializedSlice physical readidx area_length (sublist (0) (read_len_up) (logical)) )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "read_len_up" ) )) # UInt  |-> read_len_up)
  **  ((( &( "read_len_down" ) )) # UInt  |-> read_len_down)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (sublist (readidx) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 read_len_up (sublist (0) (read_len_up) (output_before)) )
  **  (UCharArray.mixed_seg out0 read_len_up output_capacity (sublist (read_len_up) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (out0 = (out0 + 0 )) ” 
  &&  “ ((data_buffer + (readidx * sizeof(UCHAR))) = (data_buffer + readidx )) ” 
  &&  “ (read_len_up = (read_len_up - 0 )) ” 
  &&  “ (read_len_up = (area_length - readidx )) ” 
  &&  “ ((Zlength ((sublist (0) (read_len_up) (output_before)))) = (read_len_up - 0 )) ” 
  &&  “ ((Zlength ((sublist (0) (read_len_up) (logical)))) = (area_length - readidx )) ” 
  &&  “ (CircularAreaInitializedSlice physical readidx area_length (sublist (0) (read_len_up) (logical)) ) ” 
  &&  “ ((Zlength ((sublist (0) ((area_length - readidx )) (logical)))) = (area_length - readidx )) ” 
  &&  “ ((Zlength ((sublist (0) ((area_length - readidx )) (output_before)))) = ((area_length - readidx ) - 0 )) ”
) \/
(
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_up: Z) (read_len_down: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (read_len_down <= UINT_MAX)) (PreH3 : (read_len_up <= UINT_MAX)) (PreH4 : (data_length <= UINT_MAX)) (PreH5 : (area_length >= 0)) (PreH6 : (read_len_down >= 0)) (PreH7 : (read_len_up >= 0)) (PreH8 : (data_length >= 0)) (PreH9 : (b_status <= INT_MAX)) (PreH10 : (b_status >= INT_MIN)) (PreH11 : (ca0 <> 0)) (PreH12 : (out0 <> 0)) (PreH13 : (data_buffer <> 0)) (PreH14 : (requested > 0)) (PreH15 : (CircularAreaEmptyResult logical 0 )) (PreH16 : (CircularAreaActualReadLength logical requested data_length )) (PreH17 : (0 < data_length)) (PreH18 : (data_length <= output_capacity)) (PreH19 : (0 <= readidx)) (PreH20 : (readidx < area_length)) (PreH21 : (read_len_up = (area_length - readidx ))) (PreH22 : (read_len_down = (data_length - read_len_up ))) (PreH23 : (read_len_up <= data_length)) (PreH24 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH25 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH26 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH27 : (CircularAreaInitializedSlice physical readidx area_length (sublist (0) (read_len_up) (logical)) )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "read_len_up" ) )) # UInt  |-> read_len_up)
  **  ((( &( "read_len_down" ) )) # UInt  |-> read_len_down)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (sublist (readidx) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 read_len_up (sublist (0) (read_len_up) (output_before)) )
  **  (UCharArray.mixed_seg out0 read_len_up output_capacity (sublist (read_len_up) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((Zlength ((sublist (0) ((area_length - readidx )) (output_before)))) = ((area_length - readidx ) - 0 )) ” 
  &&  “ ((Zlength ((sublist (0) ((area_length - readidx )) (logical)))) = (area_length - readidx )) ” 
  &&  “ ((Zlength ((sublist (0) ((area_length - readidx )) (logical)))) = (area_length - readidx )) ” 
  &&  “ ((Zlength ((sublist (0) ((area_length - readidx )) (output_before)))) = ((area_length - readidx ) - 0 )) ”
).

Definition CircularAreaRead_partial_solve_wit_6_pure_split_goal_1 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_up: Z) (read_len_down: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (read_len_down <= UINT_MAX)) (PreH3 : (read_len_up <= UINT_MAX)) (PreH4 : (data_length <= UINT_MAX)) (PreH5 : (area_length >= 0)) (PreH6 : (read_len_down >= 0)) (PreH7 : (read_len_up >= 0)) (PreH8 : (data_length >= 0)) (PreH9 : (b_status <= INT_MAX)) (PreH10 : (b_status >= INT_MIN)) (PreH11 : (ca0 <> 0)) (PreH12 : (out0 <> 0)) (PreH13 : (data_buffer <> 0)) (PreH14 : (requested > 0)) (PreH15 : (CircularAreaEmptyResult logical 0 )) (PreH16 : (CircularAreaActualReadLength logical requested data_length )) (PreH17 : (0 < data_length)) (PreH18 : (data_length <= output_capacity)) (PreH19 : (0 <= readidx)) (PreH20 : (readidx < area_length)) (PreH21 : (read_len_up = (area_length - readidx ))) (PreH22 : (read_len_down = (data_length - read_len_up ))) (PreH23 : (read_len_up <= data_length)) (PreH24 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH25 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH26 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH27 : (CircularAreaInitializedSlice physical readidx area_length (sublist (0) (read_len_up) (logical)) )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "read_len_up" ) )) # UInt  |-> read_len_up)
  **  ((( &( "read_len_down" ) )) # UInt  |-> read_len_down)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (sublist (readidx) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 read_len_up (sublist (0) (read_len_up) (output_before)) )
  **  (UCharArray.mixed_seg out0 read_len_up output_capacity (sublist (read_len_up) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((Zlength ((sublist (0) ((area_length - readidx )) (output_before)))) = ((area_length - readidx ) - 0 )) ”
.

Definition CircularAreaRead_partial_solve_wit_6_pure_split_goal_2 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_up: Z) (read_len_down: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (read_len_down <= UINT_MAX)) (PreH3 : (read_len_up <= UINT_MAX)) (PreH4 : (data_length <= UINT_MAX)) (PreH5 : (area_length >= 0)) (PreH6 : (read_len_down >= 0)) (PreH7 : (read_len_up >= 0)) (PreH8 : (data_length >= 0)) (PreH9 : (b_status <= INT_MAX)) (PreH10 : (b_status >= INT_MIN)) (PreH11 : (ca0 <> 0)) (PreH12 : (out0 <> 0)) (PreH13 : (data_buffer <> 0)) (PreH14 : (requested > 0)) (PreH15 : (CircularAreaEmptyResult logical 0 )) (PreH16 : (CircularAreaActualReadLength logical requested data_length )) (PreH17 : (0 < data_length)) (PreH18 : (data_length <= output_capacity)) (PreH19 : (0 <= readidx)) (PreH20 : (readidx < area_length)) (PreH21 : (read_len_up = (area_length - readidx ))) (PreH22 : (read_len_down = (data_length - read_len_up ))) (PreH23 : (read_len_up <= data_length)) (PreH24 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH25 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH26 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH27 : (CircularAreaInitializedSlice physical readidx area_length (sublist (0) (read_len_up) (logical)) )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "read_len_up" ) )) # UInt  |-> read_len_up)
  **  ((( &( "read_len_down" ) )) # UInt  |-> read_len_down)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (sublist (readidx) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 read_len_up (sublist (0) (read_len_up) (output_before)) )
  **  (UCharArray.mixed_seg out0 read_len_up output_capacity (sublist (read_len_up) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((Zlength ((sublist (0) ((area_length - readidx )) (logical)))) = (area_length - readidx )) ”
.

Definition CircularAreaRead_partial_solve_wit_6_pure_split_goal_3 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_up: Z) (read_len_down: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (read_len_down <= UINT_MAX)) (PreH3 : (read_len_up <= UINT_MAX)) (PreH4 : (data_length <= UINT_MAX)) (PreH5 : (area_length >= 0)) (PreH6 : (read_len_down >= 0)) (PreH7 : (read_len_up >= 0)) (PreH8 : (data_length >= 0)) (PreH9 : (b_status <= INT_MAX)) (PreH10 : (b_status >= INT_MIN)) (PreH11 : (ca0 <> 0)) (PreH12 : (out0 <> 0)) (PreH13 : (data_buffer <> 0)) (PreH14 : (requested > 0)) (PreH15 : (CircularAreaEmptyResult logical 0 )) (PreH16 : (CircularAreaActualReadLength logical requested data_length )) (PreH17 : (0 < data_length)) (PreH18 : (data_length <= output_capacity)) (PreH19 : (0 <= readidx)) (PreH20 : (readidx < area_length)) (PreH21 : (read_len_up = (area_length - readidx ))) (PreH22 : (read_len_down = (data_length - read_len_up ))) (PreH23 : (read_len_up <= data_length)) (PreH24 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH25 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH26 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH27 : (CircularAreaInitializedSlice physical readidx area_length (sublist (0) (read_len_up) (logical)) )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "read_len_up" ) )) # UInt  |-> read_len_up)
  **  ((( &( "read_len_down" ) )) # UInt  |-> read_len_down)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (sublist (readidx) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 read_len_up (sublist (0) (read_len_up) (output_before)) )
  **  (UCharArray.mixed_seg out0 read_len_up output_capacity (sublist (read_len_up) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((Zlength ((sublist (0) ((area_length - readidx )) (logical)))) = (area_length - readidx )) ”
.

Definition CircularAreaRead_partial_solve_wit_6_pure_split_goal_4 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_up: Z) (read_len_down: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (read_len_down <= UINT_MAX)) (PreH3 : (read_len_up <= UINT_MAX)) (PreH4 : (data_length <= UINT_MAX)) (PreH5 : (area_length >= 0)) (PreH6 : (read_len_down >= 0)) (PreH7 : (read_len_up >= 0)) (PreH8 : (data_length >= 0)) (PreH9 : (b_status <= INT_MAX)) (PreH10 : (b_status >= INT_MIN)) (PreH11 : (ca0 <> 0)) (PreH12 : (out0 <> 0)) (PreH13 : (data_buffer <> 0)) (PreH14 : (requested > 0)) (PreH15 : (CircularAreaEmptyResult logical 0 )) (PreH16 : (CircularAreaActualReadLength logical requested data_length )) (PreH17 : (0 < data_length)) (PreH18 : (data_length <= output_capacity)) (PreH19 : (0 <= readidx)) (PreH20 : (readidx < area_length)) (PreH21 : (read_len_up = (area_length - readidx ))) (PreH22 : (read_len_down = (data_length - read_len_up ))) (PreH23 : (read_len_up <= data_length)) (PreH24 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH25 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH26 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH27 : (CircularAreaInitializedSlice physical readidx area_length (sublist (0) (read_len_up) (logical)) )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "read_len_up" ) )) # UInt  |-> read_len_up)
  **  ((( &( "read_len_down" ) )) # UInt  |-> read_len_down)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (sublist (readidx) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 read_len_up (sublist (0) (read_len_up) (output_before)) )
  **  (UCharArray.mixed_seg out0 read_len_up output_capacity (sublist (read_len_up) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((Zlength ((sublist (0) ((area_length - readidx )) (output_before)))) = ((area_length - readidx ) - 0 )) ”
.

Definition CircularAreaRead_partial_solve_wit_6_aux := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_up: Z) (read_len_down: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaEmptyResult logical 0 )) (PreH6 : (CircularAreaActualReadLength logical requested data_length )) (PreH7 : (0 < data_length)) (PreH8 : (data_length <= output_capacity)) (PreH9 : (0 <= readidx)) (PreH10 : (readidx < area_length)) (PreH11 : (read_len_up = (area_length - readidx ))) (PreH12 : (read_len_down = (data_length - read_len_up ))) (PreH13 : (read_len_up <= data_length)) (PreH14 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH15 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH16 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH17 : (CircularAreaInitializedSlice physical readidx area_length (sublist (0) (read_len_up) (logical)) )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (sublist (readidx) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 read_len_up (sublist (0) (read_len_up) (output_before)) )
  **  (UCharArray.mixed_seg out0 read_len_up output_capacity (sublist (read_len_up) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (out0 = (out0 + 0 )) ” 
  &&  “ ((data_buffer + (readidx * sizeof(UCHAR))) = (data_buffer + readidx )) ” 
  &&  “ (read_len_up = (read_len_up - 0 )) ” 
  &&  “ (read_len_up = (area_length - readidx )) ” 
  &&  “ ((Zlength ((sublist (0) (read_len_up) (output_before)))) = (read_len_up - 0 )) ” 
  &&  “ ((Zlength ((sublist (0) (read_len_up) (logical)))) = (area_length - readidx )) ” 
  &&  “ (CircularAreaInitializedSlice physical readidx area_length (sublist (0) (read_len_up) (logical)) ) ” 
  &&  “ ((Zlength ((sublist (0) ((area_length - readidx )) (logical)))) = (area_length - readidx )) ” 
  &&  “ ((Zlength ((sublist (0) ((area_length - readidx )) (output_before)))) = ((area_length - readidx ) - 0 )) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaEmptyResult logical 0 ) ” 
  &&  “ (CircularAreaActualReadLength logical requested data_length ) ” 
  &&  “ (0 < data_length) ” 
  &&  “ (data_length <= output_capacity) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (readidx < area_length) ” 
  &&  “ (read_len_up = (area_length - readidx )) ” 
  &&  “ (read_len_down = (data_length - read_len_up )) ” 
  &&  “ (read_len_up <= data_length) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx data_length area_length 1 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ” 
  &&  “ (CircularAreaLiveBytes readidx area_length logical physical ) ” 
  &&  “ (CircularAreaInitializedSlice physical readidx area_length (sublist (0) (read_len_up) (logical)) ) ”
  &&  (UCharArray.mixed_seg out0 0 read_len_up (sublist (0) (read_len_up) (output_before)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (sublist (readidx) (area_length) (physical)) )
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg out0 read_len_up output_capacity (sublist (read_len_up) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
.

Definition CircularAreaRead_partial_solve_wit_6 := CircularAreaRead_partial_solve_wit_6_pure -> CircularAreaRead_partial_solve_wit_6_aux.

Definition CircularAreaRead_partial_solve_wit_7_pure := 
(
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_down: Z) (read_len_up: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaEmptyResult logical 0 )) (PreH6 : (CircularAreaActualReadLength logical requested data_length )) (PreH7 : (0 < data_length)) (PreH8 : (data_length <= output_capacity)) (PreH9 : (0 <= read_len_down)) (PreH10 : (read_len_down <= readidx)) (PreH11 : (read_len_up = (area_length - readidx ))) (PreH12 : (read_len_down = (data_length - read_len_up ))) (PreH13 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH14 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH15 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH16 : (CircularAreaInitializedSlice physical 0 read_len_down (sublist (read_len_up) (data_length) (logical)) )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "read_len_down" ) )) # UInt  |-> read_len_down)
  **  ((( &( "read_len_up" ) )) # UInt  |-> read_len_up)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 read_len_down (sublist (0) (read_len_down) (physical)) )
  **  (UCharArray.mixed_seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (sublist (readidx) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 read_len_up (CircularAreaSomeBytes ((sublist (0) (read_len_up) (logical)))) )
  **  (UCharArray.mixed_seg out0 read_len_up data_length (sublist (read_len_up) (data_length) (output_before)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((out0 + (read_len_up * sizeof(UCHAR))) = (out0 + read_len_up )) ” 
  &&  “ (data_buffer = (data_buffer + 0 )) ” 
  &&  “ (read_len_down = (data_length - read_len_up )) ” 
  &&  “ (read_len_down = (read_len_down - 0 )) ” 
  &&  “ ((Zlength ((sublist (read_len_up) (data_length) (output_before)))) = (data_length - read_len_up )) ” 
  &&  “ ((Zlength ((sublist (read_len_up) (data_length) (logical)))) = (read_len_down - 0 )) ” 
  &&  “ (CircularAreaInitializedSlice physical 0 read_len_down (sublist (read_len_up) (data_length) (logical)) ) ” 
  &&  “ ((Zlength ((sublist ((area_length - readidx )) (data_length) (logical)))) = ((data_length - read_len_up ) - 0 )) ” 
  &&  “ ((Zlength ((sublist ((area_length - readidx )) (data_length) (output_before)))) = (data_length - (area_length - readidx ) )) ”
) \/
(
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_down: Z) (read_len_up: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (read_len_up <= UINT_MAX)) (PreH3 : (read_len_down <= UINT_MAX)) (PreH4 : (data_length <= UINT_MAX)) (PreH5 : (area_length >= 0)) (PreH6 : (read_len_up >= 0)) (PreH7 : (read_len_down >= 0)) (PreH8 : (data_length >= 0)) (PreH9 : (b_status <= INT_MAX)) (PreH10 : (b_status >= INT_MIN)) (PreH11 : (ca0 <> 0)) (PreH12 : (out0 <> 0)) (PreH13 : (data_buffer <> 0)) (PreH14 : (requested > 0)) (PreH15 : (CircularAreaEmptyResult logical 0 )) (PreH16 : (CircularAreaActualReadLength logical requested data_length )) (PreH17 : (0 < data_length)) (PreH18 : (data_length <= output_capacity)) (PreH19 : (0 <= read_len_down)) (PreH20 : (read_len_down <= readidx)) (PreH21 : (read_len_up = (area_length - readidx ))) (PreH22 : (read_len_down = (data_length - read_len_up ))) (PreH23 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH24 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH25 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH26 : (CircularAreaInitializedSlice physical 0 read_len_down (sublist (read_len_up) (data_length) (logical)) )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "read_len_down" ) )) # UInt  |-> read_len_down)
  **  ((( &( "read_len_up" ) )) # UInt  |-> read_len_up)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 read_len_down (sublist (0) (read_len_down) (physical)) )
  **  (UCharArray.mixed_seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (sublist (readidx) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 read_len_up (CircularAreaSomeBytes ((sublist (0) (read_len_up) (logical)))) )
  **  (UCharArray.mixed_seg out0 read_len_up data_length (sublist (read_len_up) (data_length) (output_before)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((Zlength ((sublist ((area_length - readidx )) (data_length) (output_before)))) = (data_length - (area_length - readidx ) )) ” 
  &&  “ ((Zlength ((sublist ((area_length - readidx )) (data_length) (logical)))) = ((data_length - (area_length - readidx ) ) - 0 )) ” 
  &&  “ ((Zlength ((sublist ((area_length - readidx )) (data_length) (logical)))) = ((data_length - read_len_up ) - 0 )) ” 
  &&  “ ((Zlength ((sublist ((area_length - readidx )) (data_length) (output_before)))) = (data_length - (area_length - readidx ) )) ”
).

Definition CircularAreaRead_partial_solve_wit_7_pure_split_goal_1 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_down: Z) (read_len_up: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (read_len_up <= UINT_MAX)) (PreH3 : (read_len_down <= UINT_MAX)) (PreH4 : (data_length <= UINT_MAX)) (PreH5 : (area_length >= 0)) (PreH6 : (read_len_up >= 0)) (PreH7 : (read_len_down >= 0)) (PreH8 : (data_length >= 0)) (PreH9 : (b_status <= INT_MAX)) (PreH10 : (b_status >= INT_MIN)) (PreH11 : (ca0 <> 0)) (PreH12 : (out0 <> 0)) (PreH13 : (data_buffer <> 0)) (PreH14 : (requested > 0)) (PreH15 : (CircularAreaEmptyResult logical 0 )) (PreH16 : (CircularAreaActualReadLength logical requested data_length )) (PreH17 : (0 < data_length)) (PreH18 : (data_length <= output_capacity)) (PreH19 : (0 <= read_len_down)) (PreH20 : (read_len_down <= readidx)) (PreH21 : (read_len_up = (area_length - readidx ))) (PreH22 : (read_len_down = (data_length - read_len_up ))) (PreH23 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH24 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH25 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH26 : (CircularAreaInitializedSlice physical 0 read_len_down (sublist (read_len_up) (data_length) (logical)) )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "read_len_down" ) )) # UInt  |-> read_len_down)
  **  ((( &( "read_len_up" ) )) # UInt  |-> read_len_up)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 read_len_down (sublist (0) (read_len_down) (physical)) )
  **  (UCharArray.mixed_seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (sublist (readidx) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 read_len_up (CircularAreaSomeBytes ((sublist (0) (read_len_up) (logical)))) )
  **  (UCharArray.mixed_seg out0 read_len_up data_length (sublist (read_len_up) (data_length) (output_before)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((Zlength ((sublist ((area_length - readidx )) (data_length) (output_before)))) = (data_length - (area_length - readidx ) )) ”
.

Definition CircularAreaRead_partial_solve_wit_7_pure_split_goal_2 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_down: Z) (read_len_up: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (read_len_up <= UINT_MAX)) (PreH3 : (read_len_down <= UINT_MAX)) (PreH4 : (data_length <= UINT_MAX)) (PreH5 : (area_length >= 0)) (PreH6 : (read_len_up >= 0)) (PreH7 : (read_len_down >= 0)) (PreH8 : (data_length >= 0)) (PreH9 : (b_status <= INT_MAX)) (PreH10 : (b_status >= INT_MIN)) (PreH11 : (ca0 <> 0)) (PreH12 : (out0 <> 0)) (PreH13 : (data_buffer <> 0)) (PreH14 : (requested > 0)) (PreH15 : (CircularAreaEmptyResult logical 0 )) (PreH16 : (CircularAreaActualReadLength logical requested data_length )) (PreH17 : (0 < data_length)) (PreH18 : (data_length <= output_capacity)) (PreH19 : (0 <= read_len_down)) (PreH20 : (read_len_down <= readidx)) (PreH21 : (read_len_up = (area_length - readidx ))) (PreH22 : (read_len_down = (data_length - read_len_up ))) (PreH23 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH24 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH25 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH26 : (CircularAreaInitializedSlice physical 0 read_len_down (sublist (read_len_up) (data_length) (logical)) )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "read_len_down" ) )) # UInt  |-> read_len_down)
  **  ((( &( "read_len_up" ) )) # UInt  |-> read_len_up)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 read_len_down (sublist (0) (read_len_down) (physical)) )
  **  (UCharArray.mixed_seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (sublist (readidx) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 read_len_up (CircularAreaSomeBytes ((sublist (0) (read_len_up) (logical)))) )
  **  (UCharArray.mixed_seg out0 read_len_up data_length (sublist (read_len_up) (data_length) (output_before)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((Zlength ((sublist ((area_length - readidx )) (data_length) (logical)))) = ((data_length - (area_length - readidx ) ) - 0 )) ”
.

Definition CircularAreaRead_partial_solve_wit_7_pure_split_goal_3 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_down: Z) (read_len_up: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (read_len_up <= UINT_MAX)) (PreH3 : (read_len_down <= UINT_MAX)) (PreH4 : (data_length <= UINT_MAX)) (PreH5 : (area_length >= 0)) (PreH6 : (read_len_up >= 0)) (PreH7 : (read_len_down >= 0)) (PreH8 : (data_length >= 0)) (PreH9 : (b_status <= INT_MAX)) (PreH10 : (b_status >= INT_MIN)) (PreH11 : (ca0 <> 0)) (PreH12 : (out0 <> 0)) (PreH13 : (data_buffer <> 0)) (PreH14 : (requested > 0)) (PreH15 : (CircularAreaEmptyResult logical 0 )) (PreH16 : (CircularAreaActualReadLength logical requested data_length )) (PreH17 : (0 < data_length)) (PreH18 : (data_length <= output_capacity)) (PreH19 : (0 <= read_len_down)) (PreH20 : (read_len_down <= readidx)) (PreH21 : (read_len_up = (area_length - readidx ))) (PreH22 : (read_len_down = (data_length - read_len_up ))) (PreH23 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH24 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH25 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH26 : (CircularAreaInitializedSlice physical 0 read_len_down (sublist (read_len_up) (data_length) (logical)) )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "read_len_down" ) )) # UInt  |-> read_len_down)
  **  ((( &( "read_len_up" ) )) # UInt  |-> read_len_up)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 read_len_down (sublist (0) (read_len_down) (physical)) )
  **  (UCharArray.mixed_seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (sublist (readidx) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 read_len_up (CircularAreaSomeBytes ((sublist (0) (read_len_up) (logical)))) )
  **  (UCharArray.mixed_seg out0 read_len_up data_length (sublist (read_len_up) (data_length) (output_before)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((Zlength ((sublist ((area_length - readidx )) (data_length) (logical)))) = ((data_length - read_len_up ) - 0 )) ”
.

Definition CircularAreaRead_partial_solve_wit_7_pure_split_goal_4 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_down: Z) (read_len_up: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (read_len_up <= UINT_MAX)) (PreH3 : (read_len_down <= UINT_MAX)) (PreH4 : (data_length <= UINT_MAX)) (PreH5 : (area_length >= 0)) (PreH6 : (read_len_up >= 0)) (PreH7 : (read_len_down >= 0)) (PreH8 : (data_length >= 0)) (PreH9 : (b_status <= INT_MAX)) (PreH10 : (b_status >= INT_MIN)) (PreH11 : (ca0 <> 0)) (PreH12 : (out0 <> 0)) (PreH13 : (data_buffer <> 0)) (PreH14 : (requested > 0)) (PreH15 : (CircularAreaEmptyResult logical 0 )) (PreH16 : (CircularAreaActualReadLength logical requested data_length )) (PreH17 : (0 < data_length)) (PreH18 : (data_length <= output_capacity)) (PreH19 : (0 <= read_len_down)) (PreH20 : (read_len_down <= readidx)) (PreH21 : (read_len_up = (area_length - readidx ))) (PreH22 : (read_len_down = (data_length - read_len_up ))) (PreH23 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH24 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH25 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH26 : (CircularAreaInitializedSlice physical 0 read_len_down (sublist (read_len_up) (data_length) (logical)) )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "read_len_down" ) )) # UInt  |-> read_len_down)
  **  ((( &( "read_len_up" ) )) # UInt  |-> read_len_up)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 read_len_down (sublist (0) (read_len_down) (physical)) )
  **  (UCharArray.mixed_seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (sublist (readidx) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 read_len_up (CircularAreaSomeBytes ((sublist (0) (read_len_up) (logical)))) )
  **  (UCharArray.mixed_seg out0 read_len_up data_length (sublist (read_len_up) (data_length) (output_before)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((Zlength ((sublist ((area_length - readidx )) (data_length) (output_before)))) = (data_length - (area_length - readidx ) )) ”
.

Definition CircularAreaRead_partial_solve_wit_7_aux := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_down: Z) (read_len_up: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaEmptyResult logical 0 )) (PreH6 : (CircularAreaActualReadLength logical requested data_length )) (PreH7 : (0 < data_length)) (PreH8 : (data_length <= output_capacity)) (PreH9 : (0 <= read_len_down)) (PreH10 : (read_len_down <= readidx)) (PreH11 : (read_len_up = (area_length - readidx ))) (PreH12 : (read_len_down = (data_length - read_len_up ))) (PreH13 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH14 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH15 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH16 : (CircularAreaInitializedSlice physical 0 read_len_down (sublist (read_len_up) (data_length) (logical)) )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 read_len_down (sublist (0) (read_len_down) (physical)) )
  **  (UCharArray.mixed_seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (sublist (readidx) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 read_len_up (CircularAreaSomeBytes ((sublist (0) (read_len_up) (logical)))) )
  **  (UCharArray.mixed_seg out0 read_len_up data_length (sublist (read_len_up) (data_length) (output_before)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((out0 + (read_len_up * sizeof(UCHAR))) = (out0 + read_len_up )) ” 
  &&  “ (data_buffer = (data_buffer + 0 )) ” 
  &&  “ (read_len_down = (data_length - read_len_up )) ” 
  &&  “ (read_len_down = (read_len_down - 0 )) ” 
  &&  “ ((Zlength ((sublist (read_len_up) (data_length) (output_before)))) = (data_length - read_len_up )) ” 
  &&  “ ((Zlength ((sublist (read_len_up) (data_length) (logical)))) = (read_len_down - 0 )) ” 
  &&  “ (CircularAreaInitializedSlice physical 0 read_len_down (sublist (read_len_up) (data_length) (logical)) ) ” 
  &&  “ ((Zlength ((sublist ((area_length - readidx )) (data_length) (logical)))) = ((data_length - read_len_up ) - 0 )) ” 
  &&  “ ((Zlength ((sublist ((area_length - readidx )) (data_length) (output_before)))) = (data_length - (area_length - readidx ) )) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaEmptyResult logical 0 ) ” 
  &&  “ (CircularAreaActualReadLength logical requested data_length ) ” 
  &&  “ (0 < data_length) ” 
  &&  “ (data_length <= output_capacity) ” 
  &&  “ (0 <= read_len_down) ” 
  &&  “ (read_len_down <= readidx) ” 
  &&  “ (read_len_up = (area_length - readidx )) ” 
  &&  “ (read_len_down = (data_length - read_len_up )) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx data_length area_length 1 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ” 
  &&  “ (CircularAreaLiveBytes readidx area_length logical physical ) ” 
  &&  “ (CircularAreaInitializedSlice physical 0 read_len_down (sublist (read_len_up) (data_length) (logical)) ) ”
  &&  (UCharArray.mixed_seg out0 read_len_up data_length (sublist (read_len_up) (data_length) (output_before)) )
  **  (UCharArray.mixed_seg data_buffer 0 read_len_down (sublist (0) (read_len_down) (physical)) )
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (sublist (readidx) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 read_len_up (CircularAreaSomeBytes ((sublist (0) (read_len_up) (logical)))) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
.

Definition CircularAreaRead_partial_solve_wit_7 := CircularAreaRead_partial_solve_wit_7_pure -> CircularAreaRead_partial_solve_wit_7_aux.

Definition CircularAreaRead_partial_solve_wit_8_pure := 
(
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaEmptyResult logical 0 )) (PreH6 : (CircularAreaActualReadLength logical requested data_length )) (PreH7 : (0 < data_length)) (PreH8 : (data_length <= output_capacity)) (PreH9 : (0 <= readidx)) (PreH10 : ((readidx + data_length ) <= area_length)) (PreH11 : (CircularAreaDivideRdDataResult readidx data_length area_length 0 )) (PreH12 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH13 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH14 : (CircularAreaInitializedSlice physical readidx (readidx + data_length ) (sublist (0) (data_length) (logical)) )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx (readidx + data_length ) (sublist (readidx) ((readidx + data_length )) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (readidx + data_length ) area_length (sublist ((readidx + data_length )) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 data_length (sublist (0) (data_length) (output_before)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (out0 = (out0 + 0 )) ” 
  &&  “ ((data_buffer + (readidx * sizeof(UCHAR))) = (data_buffer + readidx )) ” 
  &&  “ (data_length = (data_length - 0 )) ” 
  &&  “ (data_length = ((readidx + data_length ) - readidx )) ” 
  &&  “ (CircularAreaInitializedSlice physical readidx (readidx + data_length ) (sublist (0) (data_length) (logical)) ) ” 
  &&  “ ((Zlength ((sublist (0) (data_length) (logical)))) = ((readidx + data_length ) - readidx )) ” 
  &&  “ ((Zlength ((sublist (0) (data_length) (output_before)))) = (data_length - 0 )) ”
) \/
(
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (data_length <= UINT_MAX)) (PreH3 : (area_length >= 0)) (PreH4 : (data_length >= 0)) (PreH5 : (b_status <= INT_MAX)) (PreH6 : (b_status >= INT_MIN)) (PreH7 : (ca0 <> 0)) (PreH8 : (out0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (requested > 0)) (PreH11 : (CircularAreaEmptyResult logical 0 )) (PreH12 : (CircularAreaActualReadLength logical requested data_length )) (PreH13 : (0 < data_length)) (PreH14 : (data_length <= output_capacity)) (PreH15 : (0 <= readidx)) (PreH16 : ((readidx + data_length ) <= area_length)) (PreH17 : (CircularAreaDivideRdDataResult readidx data_length area_length 0 )) (PreH18 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH19 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH20 : (CircularAreaInitializedSlice physical readidx (readidx + data_length ) (sublist (0) (data_length) (logical)) )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx (readidx + data_length ) (sublist (readidx) ((readidx + data_length )) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (readidx + data_length ) area_length (sublist ((readidx + data_length )) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 data_length (sublist (0) (data_length) (output_before)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((Zlength ((sublist (0) (data_length) (output_before)))) = (data_length - 0 )) ” 
  &&  “ ((Zlength ((sublist (0) (data_length) (logical)))) = ((readidx + data_length ) - readidx )) ”
).

Definition CircularAreaRead_partial_solve_wit_8_pure_split_goal_1 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (data_length <= UINT_MAX)) (PreH3 : (area_length >= 0)) (PreH4 : (data_length >= 0)) (PreH5 : (b_status <= INT_MAX)) (PreH6 : (b_status >= INT_MIN)) (PreH7 : (ca0 <> 0)) (PreH8 : (out0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (requested > 0)) (PreH11 : (CircularAreaEmptyResult logical 0 )) (PreH12 : (CircularAreaActualReadLength logical requested data_length )) (PreH13 : (0 < data_length)) (PreH14 : (data_length <= output_capacity)) (PreH15 : (0 <= readidx)) (PreH16 : ((readidx + data_length ) <= area_length)) (PreH17 : (CircularAreaDivideRdDataResult readidx data_length area_length 0 )) (PreH18 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH19 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH20 : (CircularAreaInitializedSlice physical readidx (readidx + data_length ) (sublist (0) (data_length) (logical)) )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx (readidx + data_length ) (sublist (readidx) ((readidx + data_length )) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (readidx + data_length ) area_length (sublist ((readidx + data_length )) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 data_length (sublist (0) (data_length) (output_before)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((Zlength ((sublist (0) (data_length) (output_before)))) = (data_length - 0 )) ”
.

Definition CircularAreaRead_partial_solve_wit_8_pure_split_goal_2 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (data_length <= UINT_MAX)) (PreH3 : (area_length >= 0)) (PreH4 : (data_length >= 0)) (PreH5 : (b_status <= INT_MAX)) (PreH6 : (b_status >= INT_MIN)) (PreH7 : (ca0 <> 0)) (PreH8 : (out0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (requested > 0)) (PreH11 : (CircularAreaEmptyResult logical 0 )) (PreH12 : (CircularAreaActualReadLength logical requested data_length )) (PreH13 : (0 < data_length)) (PreH14 : (data_length <= output_capacity)) (PreH15 : (0 <= readidx)) (PreH16 : ((readidx + data_length ) <= area_length)) (PreH17 : (CircularAreaDivideRdDataResult readidx data_length area_length 0 )) (PreH18 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH19 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH20 : (CircularAreaInitializedSlice physical readidx (readidx + data_length ) (sublist (0) (data_length) (logical)) )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx (readidx + data_length ) (sublist (readidx) ((readidx + data_length )) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (readidx + data_length ) area_length (sublist ((readidx + data_length )) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 data_length (sublist (0) (data_length) (output_before)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((Zlength ((sublist (0) (data_length) (logical)))) = ((readidx + data_length ) - readidx )) ”
.

Definition CircularAreaRead_partial_solve_wit_8_aux := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaEmptyResult logical 0 )) (PreH6 : (CircularAreaActualReadLength logical requested data_length )) (PreH7 : (0 < data_length)) (PreH8 : (data_length <= output_capacity)) (PreH9 : (0 <= readidx)) (PreH10 : ((readidx + data_length ) <= area_length)) (PreH11 : (CircularAreaDivideRdDataResult readidx data_length area_length 0 )) (PreH12 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH13 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH14 : (CircularAreaInitializedSlice physical readidx (readidx + data_length ) (sublist (0) (data_length) (logical)) )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx (readidx + data_length ) (sublist (readidx) ((readidx + data_length )) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (readidx + data_length ) area_length (sublist ((readidx + data_length )) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 data_length (sublist (0) (data_length) (output_before)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (out0 = (out0 + 0 )) ” 
  &&  “ ((data_buffer + (readidx * sizeof(UCHAR))) = (data_buffer + readidx )) ” 
  &&  “ (data_length = (data_length - 0 )) ” 
  &&  “ (data_length = ((readidx + data_length ) - readidx )) ” 
  &&  “ (CircularAreaInitializedSlice physical readidx (readidx + data_length ) (sublist (0) (data_length) (logical)) ) ” 
  &&  “ ((Zlength ((sublist (0) (data_length) (logical)))) = ((readidx + data_length ) - readidx )) ” 
  &&  “ ((Zlength ((sublist (0) (data_length) (output_before)))) = (data_length - 0 )) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaEmptyResult logical 0 ) ” 
  &&  “ (CircularAreaActualReadLength logical requested data_length ) ” 
  &&  “ (0 < data_length) ” 
  &&  “ (data_length <= output_capacity) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ ((readidx + data_length ) <= area_length) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx data_length area_length 0 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ” 
  &&  “ (CircularAreaLiveBytes readidx area_length logical physical ) ” 
  &&  “ (CircularAreaInitializedSlice physical readidx (readidx + data_length ) (sublist (0) (data_length) (logical)) ) ”
  &&  (UCharArray.mixed_seg out0 0 data_length (sublist (0) (data_length) (output_before)) )
  **  (UCharArray.mixed_seg data_buffer readidx (readidx + data_length ) (sublist (readidx) ((readidx + data_length )) (physical)) )
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (readidx + data_length ) area_length (sublist ((readidx + data_length )) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
.

Definition CircularAreaRead_partial_solve_wit_8 := CircularAreaRead_partial_solve_wit_8_pure -> CircularAreaRead_partial_solve_wit_8_aux.

Module Type VC_Correct.


Axiom proof_of_CircularAreaIsFull_safety_wit_1 : CircularAreaIsFull_safety_wit_1.
Axiom proof_of_CircularAreaIsFull_safety_wit_2 : CircularAreaIsFull_safety_wit_2.
Axiom proof_of_CircularAreaIsFull_safety_wit_3 : CircularAreaIsFull_safety_wit_3.
Axiom proof_of_CircularAreaIsFull_safety_wit_4 : CircularAreaIsFull_safety_wit_4.
Axiom proof_of_CircularAreaIsFull_safety_wit_5 : CircularAreaIsFull_safety_wit_5.
Axiom proof_of_CircularAreaIsFull_safety_wit_6 : CircularAreaIsFull_safety_wit_6.
Axiom proof_of_CircularAreaIsFull_safety_wit_7 : CircularAreaIsFull_safety_wit_7.
Axiom proof_of_CircularAreaIsFull_entail_wit_1 : CircularAreaIsFull_entail_wit_1.
Axiom proof_of_CircularAreaIsFull_return_wit_1 : CircularAreaIsFull_return_wit_1.
Axiom proof_of_CircularAreaIsFull_return_wit_2 : CircularAreaIsFull_return_wit_2.
Axiom proof_of_CircularAreaIsFull_return_wit_3 : CircularAreaIsFull_return_wit_3.
Axiom proof_of_CircularAreaIsFull_partial_solve_wit_1 : CircularAreaIsFull_partial_solve_wit_1.
Axiom proof_of_CircularAreaIsEmpty_safety_wit_1 : CircularAreaIsEmpty_safety_wit_1.
Axiom proof_of_CircularAreaIsEmpty_safety_wit_2 : CircularAreaIsEmpty_safety_wit_2.
Axiom proof_of_CircularAreaIsEmpty_safety_wit_3 : CircularAreaIsEmpty_safety_wit_3.
Axiom proof_of_CircularAreaIsEmpty_safety_wit_4 : CircularAreaIsEmpty_safety_wit_4.
Axiom proof_of_CircularAreaIsEmpty_safety_wit_5 : CircularAreaIsEmpty_safety_wit_5.
Axiom proof_of_CircularAreaIsEmpty_safety_wit_6 : CircularAreaIsEmpty_safety_wit_6.
Axiom proof_of_CircularAreaIsEmpty_safety_wit_7 : CircularAreaIsEmpty_safety_wit_7.
Axiom proof_of_CircularAreaIsEmpty_entail_wit_1 : CircularAreaIsEmpty_entail_wit_1.
Axiom proof_of_CircularAreaIsEmpty_return_wit_1 : CircularAreaIsEmpty_return_wit_1.
Axiom proof_of_CircularAreaIsEmpty_return_wit_2 : CircularAreaIsEmpty_return_wit_2.
Axiom proof_of_CircularAreaIsEmpty_return_wit_3 : CircularAreaIsEmpty_return_wit_3.
Axiom proof_of_CircularAreaIsEmpty_partial_solve_wit_1 : CircularAreaIsEmpty_partial_solve_wit_1.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_1 : CircularAreaGetDataLength_safety_wit_1.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_2 : CircularAreaGetDataLength_safety_wit_2.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_3 : CircularAreaGetDataLength_safety_wit_3.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_4 : CircularAreaGetDataLength_safety_wit_4.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_5 : CircularAreaGetDataLength_safety_wit_5.
Axiom proof_of_CircularAreaGetDataLength_entail_wit_1 : CircularAreaGetDataLength_entail_wit_1.
Axiom proof_of_CircularAreaGetDataLength_entail_wit_2 : CircularAreaGetDataLength_entail_wit_2.
Axiom proof_of_CircularAreaGetDataLength_return_wit_1 : CircularAreaGetDataLength_return_wit_1.
Axiom proof_of_CircularAreaGetDataLength_return_wit_2 : CircularAreaGetDataLength_return_wit_2.
Axiom proof_of_CircularAreaGetDataLength_partial_solve_wit_1_pure : CircularAreaGetDataLength_partial_solve_wit_1_pure.
Axiom proof_of_CircularAreaGetDataLength_partial_solve_wit_1 : CircularAreaGetDataLength_partial_solve_wit_1.
Axiom proof_of_CircularAreaDivideRdData_safety_wit_1 : CircularAreaDivideRdData_safety_wit_1.
Axiom proof_of_CircularAreaDivideRdData_safety_wit_2 : CircularAreaDivideRdData_safety_wit_2.
Axiom proof_of_CircularAreaDivideRdData_safety_wit_3 : CircularAreaDivideRdData_safety_wit_3.
Axiom proof_of_CircularAreaDivideRdData_safety_wit_4 : CircularAreaDivideRdData_safety_wit_4.
Axiom proof_of_CircularAreaDivideRdData_safety_wit_5 : CircularAreaDivideRdData_safety_wit_5.
Axiom proof_of_CircularAreaDivideRdData_entail_wit_1 : CircularAreaDivideRdData_entail_wit_1.
Axiom proof_of_CircularAreaDivideRdData_return_wit_1 : CircularAreaDivideRdData_return_wit_1.
Axiom proof_of_CircularAreaDivideRdData_return_wit_2 : CircularAreaDivideRdData_return_wit_2.
Axiom proof_of_CircularAreaRead_safety_wit_1 : CircularAreaRead_safety_wit_1.
Axiom proof_of_CircularAreaRead_safety_wit_2 : CircularAreaRead_safety_wit_2.
Axiom proof_of_CircularAreaRead_safety_wit_3 : CircularAreaRead_safety_wit_3.
Axiom proof_of_CircularAreaRead_safety_wit_4 : CircularAreaRead_safety_wit_4.
Axiom proof_of_CircularAreaRead_safety_wit_5 : CircularAreaRead_safety_wit_5.
Axiom proof_of_CircularAreaRead_safety_wit_6 : CircularAreaRead_safety_wit_6.
Axiom proof_of_CircularAreaRead_safety_wit_7 : CircularAreaRead_safety_wit_7.
Axiom proof_of_CircularAreaRead_safety_wit_8 : CircularAreaRead_safety_wit_8.
Axiom proof_of_CircularAreaRead_safety_wit_9 : CircularAreaRead_safety_wit_9.
Axiom proof_of_CircularAreaRead_safety_wit_10 : CircularAreaRead_safety_wit_10.
Axiom proof_of_CircularAreaRead_safety_wit_11 : CircularAreaRead_safety_wit_11.
Axiom proof_of_CircularAreaRead_safety_wit_12 : CircularAreaRead_safety_wit_12.
Axiom proof_of_CircularAreaRead_safety_wit_13 : CircularAreaRead_safety_wit_13.
Axiom proof_of_CircularAreaRead_safety_wit_14 : CircularAreaRead_safety_wit_14.
Axiom proof_of_CircularAreaRead_safety_wit_15 : CircularAreaRead_safety_wit_15.
Axiom proof_of_CircularAreaRead_safety_wit_16 : CircularAreaRead_safety_wit_16.
Axiom proof_of_CircularAreaRead_safety_wit_17 : CircularAreaRead_safety_wit_17.
Axiom proof_of_CircularAreaRead_safety_wit_18 : CircularAreaRead_safety_wit_18.
Axiom proof_of_CircularAreaRead_safety_wit_19 : CircularAreaRead_safety_wit_19.
Axiom proof_of_CircularAreaRead_safety_wit_20 : CircularAreaRead_safety_wit_20.
Axiom proof_of_CircularAreaRead_safety_wit_21 : CircularAreaRead_safety_wit_21.
Axiom proof_of_CircularAreaRead_safety_wit_22 : CircularAreaRead_safety_wit_22.
Axiom proof_of_CircularAreaRead_safety_wit_23 : CircularAreaRead_safety_wit_23.
Axiom proof_of_CircularAreaRead_safety_wit_24 : CircularAreaRead_safety_wit_24.
Axiom proof_of_CircularAreaRead_entail_wit_1 : CircularAreaRead_entail_wit_1.
Axiom proof_of_CircularAreaRead_entail_wit_2 : CircularAreaRead_entail_wit_2.
Axiom proof_of_CircularAreaRead_entail_wit_3_1 : CircularAreaRead_entail_wit_3_1.
Axiom proof_of_CircularAreaRead_entail_wit_3_2 : CircularAreaRead_entail_wit_3_2.
Axiom proof_of_CircularAreaRead_entail_wit_4 : CircularAreaRead_entail_wit_4.
Axiom proof_of_CircularAreaRead_entail_wit_5 : CircularAreaRead_entail_wit_5.
Axiom proof_of_CircularAreaRead_entail_wit_6_1 : CircularAreaRead_entail_wit_6_1.
Axiom proof_of_CircularAreaRead_entail_wit_6_2 : CircularAreaRead_entail_wit_6_2.
Axiom proof_of_CircularAreaRead_return_wit_1 : CircularAreaRead_return_wit_1.
Axiom proof_of_CircularAreaRead_return_wit_2 : CircularAreaRead_return_wit_2.
Axiom proof_of_CircularAreaRead_return_wit_3 : CircularAreaRead_return_wit_3.
Axiom proof_of_CircularAreaRead_return_wit_4 : CircularAreaRead_return_wit_4.
Axiom proof_of_CircularAreaRead_return_wit_5 : CircularAreaRead_return_wit_5.
Axiom proof_of_CircularAreaRead_return_wit_6 : CircularAreaRead_return_wit_6.
Axiom proof_of_CircularAreaRead_partial_solve_wit_1_pure : CircularAreaRead_partial_solve_wit_1_pure.
Axiom proof_of_CircularAreaRead_partial_solve_wit_1 : CircularAreaRead_partial_solve_wit_1.
Axiom proof_of_CircularAreaRead_partial_solve_wit_2_pure : CircularAreaRead_partial_solve_wit_2_pure.
Axiom proof_of_CircularAreaRead_partial_solve_wit_2 : CircularAreaRead_partial_solve_wit_2.
Axiom proof_of_CircularAreaRead_partial_solve_wit_3_pure : CircularAreaRead_partial_solve_wit_3_pure.
Axiom proof_of_CircularAreaRead_partial_solve_wit_3 : CircularAreaRead_partial_solve_wit_3.
Axiom proof_of_CircularAreaRead_partial_solve_wit_4_pure : CircularAreaRead_partial_solve_wit_4_pure.
Axiom proof_of_CircularAreaRead_partial_solve_wit_4 : CircularAreaRead_partial_solve_wit_4.
Axiom proof_of_CircularAreaRead_partial_solve_wit_5_pure : CircularAreaRead_partial_solve_wit_5_pure.
Axiom proof_of_CircularAreaRead_partial_solve_wit_5 : CircularAreaRead_partial_solve_wit_5.
Axiom proof_of_CircularAreaRead_partial_solve_wit_6_pure : CircularAreaRead_partial_solve_wit_6_pure.
Axiom proof_of_CircularAreaRead_partial_solve_wit_6 : CircularAreaRead_partial_solve_wit_6.
Axiom proof_of_CircularAreaRead_partial_solve_wit_7_pure : CircularAreaRead_partial_solve_wit_7_pure.
Axiom proof_of_CircularAreaRead_partial_solve_wit_7 : CircularAreaRead_partial_solve_wit_7.
Axiom proof_of_CircularAreaRead_partial_solve_wit_8_pure : CircularAreaRead_partial_solve_wit_8_pure.
Axiom proof_of_CircularAreaRead_partial_solve_wit_8 : CircularAreaRead_partial_solve_wit_8.

End VC_Correct.
