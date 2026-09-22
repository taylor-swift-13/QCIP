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
      SimpleC.EE.OUTPUT.xizi.xizi_circular_area_write.source.xizi_circular_area_write_lib.
Local Open Scope sac.
From SimpleC.EE.QCP_demos_LLM Require Import char_array_strategy_goal.
From SimpleC.EE.QCP_demos_LLM Require Import char_array_strategy_proof.

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
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (circular_area_pre = ca0)) (PreH2 : (ca0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
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
) \/
(
forall (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (readidx <> writeidx)) (PreH2 : (ca0 <> 0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  TT && emp 
|--
  “ (CircularAreaFullResult area_length logical 0 ) ”
  &&  emp
).

Definition CircularAreaIsFull_return_wit_1_split_goal_1 := 
forall (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (readidx <> writeidx)) (PreH2 : (ca0 <> 0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (CircularAreaFullResult area_length logical 0 )
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
) \/
(
forall (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (b_status = 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (ca0 <> 0)) (PreH4 : (ca0 <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  TT && emp 
|--
  “ (CircularAreaFullResult area_length logical 0 ) ”
  &&  emp
).

Definition CircularAreaIsFull_return_wit_2_split_goal_1 := 
forall (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (b_status = 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (ca0 <> 0)) (PreH4 : (ca0 <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (CircularAreaFullResult area_length logical 0 )
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
) \/
(
forall (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (b_status <> 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (ca0 <> 0)) (PreH4 : (ca0 <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  TT && emp 
|--
  “ (CircularAreaFullResult area_length logical 1 ) ”
  &&  emp
).

Definition CircularAreaIsFull_return_wit_3_split_goal_1 := 
forall (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (b_status <> 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (ca0 <> 0)) (PreH4 : (ca0 <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (CircularAreaFullResult area_length logical 1 )
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

(*----- Function CircularAreaGetDataLength -----*)

Definition CircularAreaGetDataLength_safety_wit_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (circular_area_pre = ca0)) (PreH2 : (ca0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
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

Definition CircularAreaGetDataLength_safety_wit_2 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
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

Definition CircularAreaGetDataLength_safety_wit_3 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
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
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (retval: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaFullResult area_length logical retval )) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre = ca0)) (PreH7 : (ca0 <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH10 : (retval <> 0)) ,
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
forall (circular_area_pre: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (retval: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaFullResult area_length logical retval )) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre = ca0)) (PreH7 : (ca0 <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH10 : (retval <> 0)) ,
  TT && emp 
|--
  “ ((Zlength (logical)) = area_length) ”
  &&  emp
).

Definition CircularAreaGetDataLength_entail_wit_1_split_goal_1 := 
forall (circular_area_pre: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (retval: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaFullResult area_length logical retval )) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre = ca0)) (PreH7 : (ca0 <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH10 : (retval <> 0)) ,
  ((Zlength (logical)) = area_length)
.

Definition CircularAreaGetDataLength_entail_wit_2 := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (retval: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaFullResult area_length logical retval )) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre = ca0)) (PreH7 : (ca0 <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH10 : (retval = 0)) ,
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
forall (circular_area_pre: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (retval: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaFullResult area_length logical retval )) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre = ca0)) (PreH7 : (ca0 <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH10 : (retval = 0)) ,
  TT && emp 
|--
  “ ((Zlength (logical)) < area_length) ”
  &&  emp
).

Definition CircularAreaGetDataLength_entail_wit_2_split_goal_1 := 
forall (circular_area_pre: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (retval: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaFullResult area_length logical retval )) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre = ca0)) (PreH7 : (ca0 <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH10 : (retval = 0)) ,
  ((Zlength (logical)) < area_length)
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
) \/
(
forall (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : ((Zlength (logical)) < area_length)) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  TT && emp 
|--
  “ (CircularAreaDataLengthResult logical ((unsigned_last_nbits (((unsigned_last_nbits ((writeidx - readidx )) (32)) + area_length )) (32)) % ( area_length ) ) ) ”
  &&  emp
).

Definition CircularAreaGetDataLength_return_wit_1_split_goal_1 := 
forall (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : ((Zlength (logical)) < area_length)) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (CircularAreaDataLengthResult logical ((unsigned_last_nbits (((unsigned_last_nbits ((writeidx - readidx )) (32)) + area_length )) (32)) % ( area_length ) ) )
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
) \/
(
forall (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : ((Zlength (logical)) = area_length)) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  TT && emp 
|--
  “ (CircularAreaDataLengthResult logical area_length ) ”
  &&  emp
).

Definition CircularAreaGetDataLength_return_wit_2_split_goal_1 := 
forall (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : ((Zlength (logical)) = area_length)) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (CircularAreaDataLengthResult logical area_length )
.

Definition CircularAreaGetDataLength_partial_solve_wit_1_pure := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
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
  “ (circular_area_pre = ca0) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
.

Definition CircularAreaGetDataLength_partial_solve_wit_1_aux := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (ca0: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
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
  “ (circular_area_pre = ca0) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre = ca0) ” 
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

Definition CircularAreaGetDataLength_partial_solve_wit_1 := CircularAreaGetDataLength_partial_solve_wit_1_pure -> CircularAreaGetDataLength_partial_solve_wit_1_aux.

(*----- Function CircularAreaDivideWrData -----*)

Definition CircularAreaDivideWrData_safety_wit_1 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (d0: Z) (ca0: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (0 <= d0)) (PreH4 : (d0 <= area_length)) (PreH5 : ((writeidx + d0 ) <= UINT_MAX)) (PreH6 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
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

Definition CircularAreaDivideWrData_safety_wit_2 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (d0: Z) (ca0: Z) (PreH1 : (ca0 = 0)) (PreH2 : (ca0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (0 <= d0)) (PreH5 : (d0 <= area_length)) (PreH6 : ((writeidx + d0 ) <= UINT_MAX)) (PreH7 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
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

Definition CircularAreaDivideWrData_safety_wit_3 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (d0: Z) (ca0: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (ca0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (0 <= d0)) (PreH5 : (d0 <= area_length)) (PreH6 : ((writeidx + d0 ) <= UINT_MAX)) (PreH7 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
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

Definition CircularAreaDivideWrData_safety_wit_4 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (d0: Z) (ca0: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (writeidx) (32)) + d0 )) (32)) <= area_length)) (PreH2 : (ca0 <> 0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (0 <= d0)) (PreH6 : (d0 <= area_length)) (PreH7 : ((writeidx + d0 ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
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

Definition CircularAreaDivideWrData_safety_wit_5 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (d0: Z) (ca0: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (writeidx) (32)) + d0 )) (32)) > area_length)) (PreH2 : (ca0 <> 0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (0 <= d0)) (PreH6 : (d0 <= area_length)) (PreH7 : ((writeidx + d0 ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
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

Definition CircularAreaDivideWrData_entail_wit_1 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (d0: Z) (ca0: Z) (PreH1 : (circular_area_pre = ca0)) (PreH2 : (data_length_pre = d0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (0 <= d0)) (PreH6 : (d0 <= area_length)) (PreH7 : ((writeidx + d0 ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
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
  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (0 <= d0) ” 
  &&  “ (d0 <= area_length) ” 
  &&  “ ((writeidx + d0 ) <= UINT_MAX) ” 
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
.

Definition CircularAreaDivideWrData_return_wit_1 := 
(
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (d0: Z) (ca0: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (writeidx) (32)) + d0 )) (32)) > area_length)) (PreH2 : (ca0 <> 0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (0 <= d0)) (PreH6 : (d0 <= area_length)) (PreH7 : ((writeidx + d0 ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
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
  &&  “ (CircularAreaDivideWrDataResult writeidx d0 area_length 1 ) ” 
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
) \/
(
forall (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (d0: Z) (ca0: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (writeidx) (32)) + d0 )) (32)) > area_length)) (PreH2 : (ca0 <> 0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (0 <= d0)) (PreH6 : (d0 <= area_length)) (PreH7 : ((writeidx + d0 ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  TT && emp 
|--
  “ (CircularAreaDivideWrDataResult writeidx d0 area_length 1 ) ”
  &&  emp
).

Definition CircularAreaDivideWrData_return_wit_1_split_goal_1 := 
forall (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (d0: Z) (ca0: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (writeidx) (32)) + d0 )) (32)) > area_length)) (PreH2 : (ca0 <> 0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (0 <= d0)) (PreH6 : (d0 <= area_length)) (PreH7 : ((writeidx + d0 ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (CircularAreaDivideWrDataResult writeidx d0 area_length 1 )
.

Definition CircularAreaDivideWrData_return_wit_2 := 
(
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (d0: Z) (ca0: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (writeidx) (32)) + d0 )) (32)) <= area_length)) (PreH2 : (ca0 <> 0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (0 <= d0)) (PreH6 : (d0 <= area_length)) (PreH7 : ((writeidx + d0 ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
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
  &&  “ (CircularAreaDivideWrDataResult writeidx d0 area_length 0 ) ” 
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
) \/
(
forall (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (d0: Z) (ca0: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (writeidx) (32)) + d0 )) (32)) <= area_length)) (PreH2 : (ca0 <> 0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (0 <= d0)) (PreH6 : (d0 <= area_length)) (PreH7 : ((writeidx + d0 ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  TT && emp 
|--
  “ (CircularAreaDivideWrDataResult writeidx d0 area_length 0 ) ”
  &&  emp
).

Definition CircularAreaDivideWrData_return_wit_2_split_goal_1 := 
forall (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (d0: Z) (ca0: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (writeidx) (32)) + d0 )) (32)) <= area_length)) (PreH2 : (ca0 <> 0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (0 <= d0)) (PreH6 : (d0 <= area_length)) (PreH7 : ((writeidx + d0 ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (CircularAreaDivideWrDataResult writeidx d0 area_length 0 )
.

(*----- Function CircularAreaWrite -----*)

Definition CircularAreaWrite_safety_wit_1 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (force0: Z) (requested: Z) (in0: Z) (ca0: Z) (PreH1 : (circular_area_pre = ca0)) (PreH2 : (input_buffer_pre = in0)) (PreH3 : (data_length_pre = requested)) (PreH4 : (b_force_pre = force0)) (PreH5 : (0 <= requested)) (PreH6 : (requested <= UINT_MAX)) (PreH7 : (ca0 = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_2 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (PreH1 : (circular_area_pre = ca0)) (PreH2 : (input_buffer_pre = in0)) (PreH3 : (data_length_pre = requested)) (PreH4 : (b_force_pre = force0)) (PreH5 : (0 <= requested)) (PreH6 : (requested <= UINT_MAX)) (PreH7 : (ca0 <> 0)) (PreH8 : (in0 = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_3 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (PreH1 : (circular_area_pre = ca0)) (PreH2 : (input_buffer_pre = in0)) (PreH3 : (data_length_pre = requested)) (PreH4 : (b_force_pre = force0)) (PreH5 : (0 <= requested)) (PreH6 : (requested <= UINT_MAX)) (PreH7 : (ca0 <> 0)) (PreH8 : (in0 <> 0)) (PreH9 : ((Zlength (input_contents)) = requested)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.full in0 requested input_contents )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_4 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (force0: Z) (requested: Z) (in0: Z) (ca0: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (input_buffer_pre = in0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (b_force_pre = force0)) (PreH6 : (0 <= requested)) (PreH7 : (requested <= UINT_MAX)) (PreH8 : (ca0 = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
|--
  “ False ”
.

Definition CircularAreaWrite_safety_wit_5 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (input_buffer_pre = in0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (b_force_pre = force0)) (PreH6 : (0 <= requested)) (PreH7 : (requested <= UINT_MAX)) (PreH8 : (ca0 <> 0)) (PreH9 : (in0 = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ False ”
.

Definition CircularAreaWrite_safety_wit_6 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (input_buffer_pre = in0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (b_force_pre = force0)) (PreH6 : (0 <= requested)) (PreH7 : (requested <= UINT_MAX)) (PreH8 : (ca0 <> 0)) (PreH9 : (in0 <> 0)) (PreH10 : ((Zlength (input_contents)) = requested)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.full in0 requested input_contents )
|--
  “ False ”
.

Definition CircularAreaWrite_safety_wit_7 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (force0: Z) (requested: Z) (in0: Z) (ca0: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (input_buffer_pre = in0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (b_force_pre = force0)) (PreH6 : (0 <= requested)) (PreH7 : (requested <= UINT_MAX)) (PreH8 : (ca0 = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaWrite_safety_wit_8 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (input_buffer_pre = in0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (b_force_pre = force0)) (PreH6 : (0 <= requested)) (PreH7 : (requested <= UINT_MAX)) (PreH8 : (ca0 <> 0)) (PreH9 : (in0 = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_9 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (input_buffer_pre = in0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (b_force_pre = force0)) (PreH6 : (0 <= requested)) (PreH7 : (requested <= UINT_MAX)) (PreH8 : (ca0 <> 0)) (PreH9 : (in0 <> 0)) (PreH10 : ((Zlength (input_contents)) = requested)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.full in0 requested input_contents )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_10 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (input_buffer_pre = in0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (b_force_pre = force0)) (PreH6 : (0 <= requested)) (PreH7 : (requested <= UINT_MAX)) (PreH8 : (ca0 <> 0)) (PreH9 : (in0 = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_11 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (input_buffer_pre = in0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (b_force_pre = force0)) (PreH6 : (0 <= requested)) (PreH7 : (requested <= UINT_MAX)) (PreH8 : (ca0 <> 0)) (PreH9 : (in0 <> 0)) (PreH10 : ((Zlength (input_contents)) = requested)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.full in0 requested input_contents )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_12 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (PreH1 : (input_buffer_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = ca0)) (PreH4 : (input_buffer_pre = in0)) (PreH5 : (data_length_pre = requested)) (PreH6 : (b_force_pre = force0)) (PreH7 : (0 <= requested)) (PreH8 : (requested <= UINT_MAX)) (PreH9 : (ca0 <> 0)) (PreH10 : (in0 = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ False ”
.

Definition CircularAreaWrite_safety_wit_13 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (PreH1 : (input_buffer_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = ca0)) (PreH4 : (input_buffer_pre = in0)) (PreH5 : (data_length_pre = requested)) (PreH6 : (b_force_pre = force0)) (PreH7 : (0 <= requested)) (PreH8 : (requested <= UINT_MAX)) (PreH9 : (ca0 <> 0)) (PreH10 : (in0 <> 0)) (PreH11 : ((Zlength (input_contents)) = requested)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.full in0 requested input_contents )
|--
  “ False ”
.

Definition CircularAreaWrite_safety_wit_14 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (PreH1 : (input_buffer_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = ca0)) (PreH4 : (input_buffer_pre = in0)) (PreH5 : (data_length_pre = requested)) (PreH6 : (b_force_pre = force0)) (PreH7 : (0 <= requested)) (PreH8 : (requested <= UINT_MAX)) (PreH9 : (ca0 <> 0)) (PreH10 : (in0 = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaWrite_safety_wit_15 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (PreH1 : (input_buffer_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = ca0)) (PreH4 : (input_buffer_pre = in0)) (PreH5 : (data_length_pre = requested)) (PreH6 : (b_force_pre = force0)) (PreH7 : (0 <= requested)) (PreH8 : (requested <= UINT_MAX)) (PreH9 : (ca0 <> 0)) (PreH10 : (in0 <> 0)) (PreH11 : ((Zlength (input_contents)) = requested)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.full in0 requested input_contents )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_16 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (PreH1 : (input_buffer_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = ca0)) (PreH4 : (input_buffer_pre = in0)) (PreH5 : (data_length_pre = requested)) (PreH6 : (b_force_pre = force0)) (PreH7 : (0 <= requested)) (PreH8 : (requested <= UINT_MAX)) (PreH9 : (ca0 <> 0)) (PreH10 : (in0 <> 0)) (PreH11 : ((Zlength (input_contents)) = requested)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.full in0 requested input_contents )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_17 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (PreH1 : (data_length_pre <= 0)) (PreH2 : (input_buffer_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre = ca0)) (PreH5 : (input_buffer_pre = in0)) (PreH6 : (data_length_pre = requested)) (PreH7 : (b_force_pre = force0)) (PreH8 : (0 <= requested)) (PreH9 : (requested <= UINT_MAX)) (PreH10 : (ca0 <> 0)) (PreH11 : (in0 <> 0)) (PreH12 : ((Zlength (input_contents)) = requested)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.full in0 requested input_contents )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaWrite_safety_wit_18 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (PreH1 : (data_length_pre > 0)) (PreH2 : (input_buffer_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre = ca0)) (PreH5 : (input_buffer_pre = in0)) (PreH6 : (data_length_pre = requested)) (PreH7 : (b_force_pre = force0)) (PreH8 : (0 <= requested)) (PreH9 : (requested <= UINT_MAX)) (PreH10 : (ca0 <> 0)) (PreH11 : (in0 <> 0)) (PreH12 : ((Zlength (input_contents)) = requested)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.full in0 requested input_contents )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_19 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (retval: Z) (PreH1 : (force0 = 0)) (PreH2 : (retval <> 0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaFullResult area_length logical retval )) (PreH6 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH7 : (ca0 <> 0)) (PreH8 : (in0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (requested > 0)) (PreH11 : ((Zlength (input_contents)) = requested)) (PreH12 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
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
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> in0)
  **  ((( &( "data_length" ) )) # UInt  |-> requested)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  (UCharArray.full in0 requested input_contents )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaWrite_safety_wit_20 := 
(
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (write_data_length_addr_v: Z) (retval: Z) (PreH1 : (retval = (data_buffer + (writeidx * sizeof(UCHAR))))) (PreH2 : (ca0 <> 0)) (PreH3 : (in0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH7 : ((Zlength (input_contents)) = requested)) (PreH8 : (0 <= data_length)) (PreH9 : (data_length <= requested)) (PreH10 : (0 <= writeidx)) (PreH11 : ((writeidx + data_length ) <= area_length)) (PreH12 : (CircularAreaDivideWrDataResult writeidx data_length area_length 0 )) (PreH13 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (UCharArray.mixed_seg data_buffer writeidx (writeidx + data_length ) (CircularAreaSomeBytes ((sublist (0) (data_length) (input_contents)))) )
  **  (UCharArray.seg in0 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> in0)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (writeidx + data_length ) area_length (sublist ((writeidx + data_length )) (area_length) (physical)) )
  **  (UCharArray.seg in0 data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ (area_length <> 0) ”
) \/
(
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (write_data_length_addr_v: Z) (retval: Z) (PreH1 : (retval = (data_buffer + (writeidx * sizeof(UCHAR))))) (PreH2 : (ca0 <> 0)) (PreH3 : (in0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH7 : ((Zlength (input_contents)) = requested)) (PreH8 : (0 <= data_length)) (PreH9 : (data_length <= requested)) (PreH10 : (0 <= writeidx)) (PreH11 : ((writeidx + data_length ) <= area_length)) (PreH12 : (CircularAreaDivideWrDataResult writeidx data_length area_length 0 )) (PreH13 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (UCharArray.mixed_seg data_buffer writeidx (writeidx + data_length ) (CircularAreaSomeBytes ((sublist (0) (data_length) (input_contents)))) )
  **  (UCharArray.seg in0 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> in0)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (writeidx + data_length ) area_length (sublist ((writeidx + data_length )) (area_length) (physical)) )
  **  (UCharArray.seg in0 data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ (area_length <> 0) ”
).

Definition CircularAreaWrite_safety_wit_20_split_goal_1 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (write_data_length_addr_v: Z) (retval: Z) (PreH1 : (retval = (data_buffer + (writeidx * sizeof(UCHAR))))) (PreH2 : (ca0 <> 0)) (PreH3 : (in0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH7 : ((Zlength (input_contents)) = requested)) (PreH8 : (0 <= data_length)) (PreH9 : (data_length <= requested)) (PreH10 : (0 <= writeidx)) (PreH11 : ((writeidx + data_length ) <= area_length)) (PreH12 : (CircularAreaDivideWrDataResult writeidx data_length area_length 0 )) (PreH13 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (UCharArray.mixed_seg data_buffer writeidx (writeidx + data_length ) (CircularAreaSomeBytes ((sublist (0) (data_length) (input_contents)))) )
  **  (UCharArray.seg in0 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> in0)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (writeidx + data_length ) area_length (sublist ((writeidx + data_length )) (area_length) (physical)) )
  **  (UCharArray.seg in0 data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ (area_length <> 0) ”
.

Definition CircularAreaWrite_safety_wit_21 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (write_len_down: Z) (write_len_up: Z) (write_data_length_addr_v: Z) (retval: Z) (PreH1 : (retval = data_buffer)) (PreH2 : (ca0 <> 0)) (PreH3 : (in0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH7 : ((Zlength (input_contents)) = requested)) (PreH8 : (0 <= write_len_down)) (PreH9 : (write_len_down <= writeidx)) (PreH10 : (write_len_up = (area_length - writeidx ))) (PreH11 : (write_len_down = (data_length - write_len_up ))) (PreH12 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH13 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (UCharArray.mixed_seg data_buffer 0 write_len_down (CircularAreaSomeBytes ((sublist (write_len_up) (data_length) (input_contents)))) )
  **  (UCharArray.seg in0 write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> in0)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (UCharArray.mixed_seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx area_length (CircularAreaSomeBytes ((sublist (0) (write_len_up) (input_contents)))) )
  **  (UCharArray.seg in0 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg in0 data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> (unsigned_last_nbits (write_len_down) (8)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaWrite_safety_wit_22 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (write_data_length_addr_v: Z) (retval: Z) (PreH1 : (retval = (data_buffer + (writeidx * sizeof(UCHAR))))) (PreH2 : (ca0 <> 0)) (PreH3 : (in0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH7 : ((Zlength (input_contents)) = requested)) (PreH8 : (0 <= data_length)) (PreH9 : (data_length <= requested)) (PreH10 : (0 <= writeidx)) (PreH11 : ((writeidx + data_length ) <= area_length)) (PreH12 : (CircularAreaDivideWrDataResult writeidx data_length area_length 0 )) (PreH13 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (UCharArray.mixed_seg data_buffer writeidx (writeidx + data_length ) (CircularAreaSomeBytes ((sublist (0) (data_length) (input_contents)))) )
  **  (UCharArray.seg in0 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> in0)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (writeidx + data_length ) area_length (sublist ((writeidx + data_length )) (area_length) (physical)) )
  **  (UCharArray.seg in0 data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> (unsigned_last_nbits (((writeidx + data_length ) % ( area_length ) )) (8)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaWrite_safety_wit_23 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (write_len_down: Z) (write_len_up: Z) (write_data_length_addr_v: Z) (retval: Z) (PreH1 : (retval = data_buffer)) (PreH2 : (ca0 <> 0)) (PreH3 : (in0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH7 : ((Zlength (input_contents)) = requested)) (PreH8 : (0 <= write_len_down)) (PreH9 : (write_len_down <= writeidx)) (PreH10 : (write_len_up = (area_length - writeidx ))) (PreH11 : (write_len_down = (data_length - write_len_up ))) (PreH12 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH13 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH14 : (force0 <> 0)) ,
  (UCharArray.mixed_seg data_buffer 0 write_len_down (CircularAreaSomeBytes ((sublist (write_len_up) (data_length) (input_contents)))) )
  **  (UCharArray.seg in0 write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> in0)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (UCharArray.mixed_seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx area_length (CircularAreaSomeBytes ((sublist (0) (write_len_up) (input_contents)))) )
  **  (UCharArray.seg in0 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg in0 data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> (unsigned_last_nbits (write_len_down) (8)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> (unsigned_last_nbits (write_len_down) (8)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 1)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_24 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (write_data_length_addr_v: Z) (retval: Z) (PreH1 : (retval = (data_buffer + (writeidx * sizeof(UCHAR))))) (PreH2 : (ca0 <> 0)) (PreH3 : (in0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH7 : ((Zlength (input_contents)) = requested)) (PreH8 : (0 <= data_length)) (PreH9 : (data_length <= requested)) (PreH10 : (0 <= writeidx)) (PreH11 : ((writeidx + data_length ) <= area_length)) (PreH12 : (CircularAreaDivideWrDataResult writeidx data_length area_length 0 )) (PreH13 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH14 : (force0 <> 0)) ,
  (UCharArray.mixed_seg data_buffer writeidx (writeidx + data_length ) (CircularAreaSomeBytes ((sublist (0) (data_length) (input_contents)))) )
  **  (UCharArray.seg in0 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> in0)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (writeidx + data_length ) area_length (sublist ((writeidx + data_length )) (area_length) (physical)) )
  **  (UCharArray.seg in0 data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> (unsigned_last_nbits (((writeidx + data_length ) % ( area_length ) )) (8)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> (unsigned_last_nbits (((writeidx + data_length ) % ( area_length ) )) (8)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 1)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_25 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (write_len_down: Z) (write_len_up: Z) (write_data_length_addr_v: Z) (retval: Z) (PreH1 : (retval = data_buffer)) (PreH2 : (ca0 <> 0)) (PreH3 : (in0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH7 : ((Zlength (input_contents)) = requested)) (PreH8 : (0 <= write_len_down)) (PreH9 : (write_len_down <= writeidx)) (PreH10 : (write_len_up = (area_length - writeidx ))) (PreH11 : (write_len_down = (data_length - write_len_up ))) (PreH12 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH13 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH14 : (force0 = 0)) ,
  (UCharArray.mixed_seg data_buffer 0 write_len_down (CircularAreaSomeBytes ((sublist (write_len_up) (data_length) (input_contents)))) )
  **  (UCharArray.seg in0 write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> in0)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (UCharArray.mixed_seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx area_length (CircularAreaSomeBytes ((sublist (0) (write_len_up) (input_contents)))) )
  **  (UCharArray.seg in0 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg in0 data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> (unsigned_last_nbits (write_len_down) (8)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 1)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_26 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (write_data_length_addr_v: Z) (retval: Z) (PreH1 : (retval = (data_buffer + (writeidx * sizeof(UCHAR))))) (PreH2 : (ca0 <> 0)) (PreH3 : (in0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH7 : ((Zlength (input_contents)) = requested)) (PreH8 : (0 <= data_length)) (PreH9 : (data_length <= requested)) (PreH10 : (0 <= writeidx)) (PreH11 : ((writeidx + data_length ) <= area_length)) (PreH12 : (CircularAreaDivideWrDataResult writeidx data_length area_length 0 )) (PreH13 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH14 : (force0 = 0)) ,
  (UCharArray.mixed_seg data_buffer writeidx (writeidx + data_length ) (CircularAreaSomeBytes ((sublist (0) (data_length) (input_contents)))) )
  **  (UCharArray.seg in0 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> in0)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (writeidx + data_length ) area_length (sublist ((writeidx + data_length )) (area_length) (physical)) )
  **  (UCharArray.seg in0 data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> (unsigned_last_nbits (((writeidx + data_length ) % ( area_length ) )) (8)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 1)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_entail_wit_1 := 
(
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (PreH1 : (data_length_pre > 0)) (PreH2 : (input_buffer_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre = ca0)) (PreH5 : (input_buffer_pre = in0)) (PreH6 : (data_length_pre = requested)) (PreH7 : (b_force_pre = force0)) (PreH8 : (0 <= requested)) (PreH9 : (requested <= UINT_MAX)) (PreH10 : (ca0 <> 0)) (PreH11 : (in0 <> 0)) (PreH12 : ((Zlength (input_contents)) = requested)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.full in0 requested input_contents )
|--
  “ (ca0 <> 0) ” 
  &&  “ (in0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ ((Zlength (input_contents)) = requested) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> in0)
  **  ((( &( "data_length" ) )) # UInt  |-> requested)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.full in0 requested input_contents )
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
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (PreH1 : (data_length_pre > 0)) (PreH2 : (input_buffer_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre = ca0)) (PreH5 : (input_buffer_pre = in0)) (PreH6 : (data_length_pre = requested)) (PreH7 : (b_force_pre = force0)) (PreH8 : (0 <= requested)) (PreH9 : (requested <= UINT_MAX)) (PreH10 : (ca0 <> 0)) (PreH11 : (in0 <> 0)) (PreH12 : ((Zlength (input_contents)) = requested)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ” 
  &&  “ (data_buffer <> 0) ”
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

Definition CircularAreaWrite_entail_wit_1_split_goal_1 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (PreH1 : (data_length_pre > 0)) (PreH2 : (input_buffer_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre = ca0)) (PreH5 : (input_buffer_pre = in0)) (PreH6 : (data_length_pre = requested)) (PreH7 : (b_force_pre = force0)) (PreH8 : (0 <= requested)) (PreH9 : (requested <= UINT_MAX)) (PreH10 : (ca0 <> 0)) (PreH11 : (in0 <> 0)) (PreH12 : ((Zlength (input_contents)) = requested)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
.

Definition CircularAreaWrite_entail_wit_1_split_goal_2 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (PreH1 : (data_length_pre > 0)) (PreH2 : (input_buffer_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre = ca0)) (PreH5 : (input_buffer_pre = in0)) (PreH6 : (data_length_pre = requested)) (PreH7 : (b_force_pre = force0)) (PreH8 : (0 <= requested)) (PreH9 : (requested <= UINT_MAX)) (PreH10 : (ca0 <> 0)) (PreH11 : (in0 <> 0)) (PreH12 : ((Zlength (input_contents)) = requested)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (data_buffer <> 0) ”
.

Definition CircularAreaWrite_entail_wit_1_split_goal_spatial := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (PreH1 : (data_length_pre > 0)) (PreH2 : (input_buffer_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre = ca0)) (PreH5 : (input_buffer_pre = in0)) (PreH6 : (data_length_pre = requested)) (PreH7 : (b_force_pre = force0)) (PreH8 : (0 <= requested)) (PreH9 : (requested <= UINT_MAX)) (PreH10 : (ca0 <> 0)) (PreH11 : (in0 <> 0)) (PreH12 : ((Zlength (input_contents)) = requested)) ,
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

Definition CircularAreaWrite_entail_wit_2_1 := 
(
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (ca0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (CircularAreaFullResult area_length logical retval )) (PreH5 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH6 : (ca0 <> 0)) (PreH7 : (in0 <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (requested > 0)) (PreH10 : ((Zlength (input_contents)) = requested)) (PreH11 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
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
  **  (UCharArray.full in0 requested input_contents )
|--
  EX (full_result: Z) ,
  “ (ca0 <> 0) ” 
  &&  “ (in0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaFullResult area_length logical full_result ) ” 
  &&  “ ~(((full_result <> 0) /\ (force0 = 0))) ” 
  &&  “ ((force0 = 0) -> ((Zlength (logical)) < area_length)) ” 
  &&  “ ((Zlength (input_contents)) = requested) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.full in0 requested input_contents )
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
forall (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (ca0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (CircularAreaFullResult area_length logical retval )) (PreH5 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH6 : (ca0 <> 0)) (PreH7 : (in0 <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (requested > 0)) (PreH10 : ((Zlength (input_contents)) = requested)) (PreH11 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  TT && emp 
|--
  EX (full_result: Z) ,
  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaFullResult area_length logical full_result ) ” 
  &&  “ ~(((full_result <> 0) /\ (force0 = 0))) ” 
  &&  “ ((force0 = 0) -> ((Zlength (logical)) < area_length)) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
  &&  emp
).

Definition CircularAreaWrite_entail_wit_2_2 := 
(
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (retval: Z) (PreH1 : (force0 <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaFullResult area_length logical retval )) (PreH6 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH7 : (ca0 <> 0)) (PreH8 : (in0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (requested > 0)) (PreH11 : ((Zlength (input_contents)) = requested)) (PreH12 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
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
  **  (UCharArray.full in0 requested input_contents )
|--
  EX (full_result: Z) ,
  “ (ca0 <> 0) ” 
  &&  “ (in0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaFullResult area_length logical full_result ) ” 
  &&  “ ~(((full_result <> 0) /\ (force0 = 0))) ” 
  &&  “ ((force0 = 0) -> ((Zlength (logical)) < area_length)) ” 
  &&  “ ((Zlength (input_contents)) = requested) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.full in0 requested input_contents )
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
forall (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (retval: Z) (PreH1 : (force0 <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaFullResult area_length logical retval )) (PreH6 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH7 : (ca0 <> 0)) (PreH8 : (in0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (requested > 0)) (PreH11 : ((Zlength (input_contents)) = requested)) (PreH12 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  TT && emp 
|--
  EX (full_result: Z) ,
  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaFullResult area_length logical full_result ) ” 
  &&  “ ~(((full_result <> 0) /\ (force0 = 0))) ” 
  &&  “ ((force0 = 0) -> ((Zlength (logical)) < area_length)) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
  &&  emp
).

Definition CircularAreaWrite_entail_wit_3_1 := 
(
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (full_result: Z) (retval: Z) (retval_2: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideWrDataResult writeidx (unsigned_last_nbits ((area_length - retval )) (32)) area_length retval_2 )) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH5 : (requested > (unsigned_last_nbits ((area_length - retval )) (32)))) (PreH6 : (ca0 <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (CircularAreaDataLengthResult logical retval )) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH10 : (ca0 <> 0)) (PreH11 : (in0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (requested > 0)) (PreH14 : (CircularAreaFullResult area_length logical full_result )) (PreH15 : ~(((full_result <> 0) /\ (force0 = 0)))) (PreH16 : ((force0 = 0) -> ((Zlength (logical)) < area_length))) (PreH17 : ((Zlength (input_contents)) = requested)) (PreH18 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH19 : (retval_2 <> 0)) ,
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
  **  (UCharArray.full in0 requested input_contents )
|--
  “ (ca0 <> 0) ” 
  &&  “ (in0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaWriteLengthReady area_length requested logical (unsigned_last_nbits ((area_length - retval )) (32)) force0 ) ” 
  &&  “ ((Zlength (input_contents)) = requested) ” 
  &&  “ (0 <= (unsigned_last_nbits ((area_length - retval )) (32))) ” 
  &&  “ ((unsigned_last_nbits ((area_length - retval )) (32)) <= requested) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx (unsigned_last_nbits ((area_length - retval )) (32)) area_length 1 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.full in0 requested input_contents )
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
forall (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (full_result: Z) (retval: Z) (retval_2: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideWrDataResult writeidx (unsigned_last_nbits ((area_length - retval )) (32)) area_length retval_2 )) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH5 : (requested > (unsigned_last_nbits ((area_length - retval )) (32)))) (PreH6 : (ca0 <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (CircularAreaDataLengthResult logical retval )) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH10 : (ca0 <> 0)) (PreH11 : (in0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (requested > 0)) (PreH14 : (CircularAreaFullResult area_length logical full_result )) (PreH15 : ~(((full_result <> 0) /\ (force0 = 0)))) (PreH16 : ((force0 = 0) -> ((Zlength (logical)) < area_length))) (PreH17 : ((Zlength (input_contents)) = requested)) (PreH18 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH19 : (retval_2 <> 0)) ,
  TT && emp 
|--
  “ (CircularAreaDivideWrDataResult writeidx (unsigned_last_nbits ((area_length - retval )) (32)) area_length 1 ) ” 
  &&  “ (0 <= (unsigned_last_nbits ((area_length - retval )) (32))) ” 
  &&  “ (CircularAreaWriteLengthReady area_length requested logical (unsigned_last_nbits ((area_length - retval )) (32)) force0 ) ”
  &&  emp
).

Definition CircularAreaWrite_entail_wit_3_1_split_goal_1 := 
forall (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (full_result: Z) (retval: Z) (retval_2: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideWrDataResult writeidx (unsigned_last_nbits ((area_length - retval )) (32)) area_length retval_2 )) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH5 : (requested > (unsigned_last_nbits ((area_length - retval )) (32)))) (PreH6 : (ca0 <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (CircularAreaDataLengthResult logical retval )) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH10 : (ca0 <> 0)) (PreH11 : (in0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (requested > 0)) (PreH14 : (CircularAreaFullResult area_length logical full_result )) (PreH15 : ~(((full_result <> 0) /\ (force0 = 0)))) (PreH16 : ((force0 = 0) -> ((Zlength (logical)) < area_length))) (PreH17 : ((Zlength (input_contents)) = requested)) (PreH18 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH19 : (retval_2 <> 0)) ,
  (CircularAreaDivideWrDataResult writeidx (unsigned_last_nbits ((area_length - retval )) (32)) area_length 1 )
.

Definition CircularAreaWrite_entail_wit_3_1_split_goal_2 := 
forall (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (full_result: Z) (retval: Z) (retval_2: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideWrDataResult writeidx (unsigned_last_nbits ((area_length - retval )) (32)) area_length retval_2 )) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH5 : (requested > (unsigned_last_nbits ((area_length - retval )) (32)))) (PreH6 : (ca0 <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (CircularAreaDataLengthResult logical retval )) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH10 : (ca0 <> 0)) (PreH11 : (in0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (requested > 0)) (PreH14 : (CircularAreaFullResult area_length logical full_result )) (PreH15 : ~(((full_result <> 0) /\ (force0 = 0)))) (PreH16 : ((force0 = 0) -> ((Zlength (logical)) < area_length))) (PreH17 : ((Zlength (input_contents)) = requested)) (PreH18 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH19 : (retval_2 <> 0)) ,
  (0 <= (unsigned_last_nbits ((area_length - retval )) (32)))
.

Definition CircularAreaWrite_entail_wit_3_1_split_goal_3 := 
forall (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (full_result: Z) (retval: Z) (retval_2: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideWrDataResult writeidx (unsigned_last_nbits ((area_length - retval )) (32)) area_length retval_2 )) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH5 : (requested > (unsigned_last_nbits ((area_length - retval )) (32)))) (PreH6 : (ca0 <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (CircularAreaDataLengthResult logical retval )) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH10 : (ca0 <> 0)) (PreH11 : (in0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (requested > 0)) (PreH14 : (CircularAreaFullResult area_length logical full_result )) (PreH15 : ~(((full_result <> 0) /\ (force0 = 0)))) (PreH16 : ((force0 = 0) -> ((Zlength (logical)) < area_length))) (PreH17 : ((Zlength (input_contents)) = requested)) (PreH18 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH19 : (retval_2 <> 0)) ,
  (CircularAreaWriteLengthReady area_length requested logical (unsigned_last_nbits ((area_length - retval )) (32)) force0 )
.

Definition CircularAreaWrite_entail_wit_3_2 := 
(
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (full_result: Z) (retval: Z) (retval_2: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideWrDataResult writeidx requested area_length retval_2 )) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH5 : (requested <= (unsigned_last_nbits ((area_length - retval )) (32)))) (PreH6 : (ca0 <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (CircularAreaDataLengthResult logical retval )) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH10 : (ca0 <> 0)) (PreH11 : (in0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (requested > 0)) (PreH14 : (CircularAreaFullResult area_length logical full_result )) (PreH15 : ~(((full_result <> 0) /\ (force0 = 0)))) (PreH16 : ((force0 = 0) -> ((Zlength (logical)) < area_length))) (PreH17 : ((Zlength (input_contents)) = requested)) (PreH18 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH19 : (retval_2 <> 0)) ,
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
  **  (UCharArray.full in0 requested input_contents )
|--
  “ (ca0 <> 0) ” 
  &&  “ (in0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaWriteLengthReady area_length requested logical requested force0 ) ” 
  &&  “ ((Zlength (input_contents)) = requested) ” 
  &&  “ (0 <= requested) ” 
  &&  “ (requested <= requested) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx requested area_length 1 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.full in0 requested input_contents )
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
forall (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (full_result: Z) (retval: Z) (retval_2: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideWrDataResult writeidx requested area_length retval_2 )) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH5 : (requested <= (unsigned_last_nbits ((area_length - retval )) (32)))) (PreH6 : (ca0 <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (CircularAreaDataLengthResult logical retval )) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH10 : (ca0 <> 0)) (PreH11 : (in0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (requested > 0)) (PreH14 : (CircularAreaFullResult area_length logical full_result )) (PreH15 : ~(((full_result <> 0) /\ (force0 = 0)))) (PreH16 : ((force0 = 0) -> ((Zlength (logical)) < area_length))) (PreH17 : ((Zlength (input_contents)) = requested)) (PreH18 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH19 : (retval_2 <> 0)) ,
  TT && emp 
|--
  “ (CircularAreaDivideWrDataResult writeidx requested area_length 1 ) ” 
  &&  “ (CircularAreaWriteLengthReady area_length requested logical requested force0 ) ”
  &&  emp
).

Definition CircularAreaWrite_entail_wit_3_2_split_goal_1 := 
forall (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (full_result: Z) (retval: Z) (retval_2: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideWrDataResult writeidx requested area_length retval_2 )) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH5 : (requested <= (unsigned_last_nbits ((area_length - retval )) (32)))) (PreH6 : (ca0 <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (CircularAreaDataLengthResult logical retval )) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH10 : (ca0 <> 0)) (PreH11 : (in0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (requested > 0)) (PreH14 : (CircularAreaFullResult area_length logical full_result )) (PreH15 : ~(((full_result <> 0) /\ (force0 = 0)))) (PreH16 : ((force0 = 0) -> ((Zlength (logical)) < area_length))) (PreH17 : ((Zlength (input_contents)) = requested)) (PreH18 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH19 : (retval_2 <> 0)) ,
  (CircularAreaDivideWrDataResult writeidx requested area_length 1 )
.

Definition CircularAreaWrite_entail_wit_3_2_split_goal_2 := 
forall (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (full_result: Z) (retval: Z) (retval_2: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideWrDataResult writeidx requested area_length retval_2 )) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH5 : (requested <= (unsigned_last_nbits ((area_length - retval )) (32)))) (PreH6 : (ca0 <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (CircularAreaDataLengthResult logical retval )) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH10 : (ca0 <> 0)) (PreH11 : (in0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (requested > 0)) (PreH14 : (CircularAreaFullResult area_length logical full_result )) (PreH15 : ~(((full_result <> 0) /\ (force0 = 0)))) (PreH16 : ((force0 = 0) -> ((Zlength (logical)) < area_length))) (PreH17 : ((Zlength (input_contents)) = requested)) (PreH18 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH19 : (retval_2 <> 0)) ,
  (CircularAreaWriteLengthReady area_length requested logical requested force0 )
.

Definition CircularAreaWrite_entail_wit_4 := 
(
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (in0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH6 : ((Zlength (input_contents)) = requested)) (PreH7 : (0 <= data_length)) (PreH8 : (data_length <= requested)) (PreH9 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.full in0 requested input_contents )
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
  &&  “ (in0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaWriteLengthReady area_length requested logical data_length force0 ) ” 
  &&  “ ((Zlength (input_contents)) = requested) ” 
  &&  “ (0 <= data_length) ” 
  &&  “ (data_length <= requested) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ (writeidx < area_length) ” 
  &&  “ ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (writeidx) (32)) )) (32)) = (area_length - writeidx )) ” 
  &&  “ ((unsigned_last_nbits ((data_length - (unsigned_last_nbits ((area_length - (unsigned_last_nbits (writeidx) (32)) )) (32)) )) (32)) = (data_length - (unsigned_last_nbits ((area_length - (unsigned_last_nbits (writeidx) (32)) )) (32)) )) ” 
  &&  “ ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (writeidx) (32)) )) (32)) <= data_length) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx data_length area_length 1 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
  &&  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx area_length (sublist (writeidx) (area_length) (physical)) )
  **  (UCharArray.seg in0 0 (unsigned_last_nbits ((area_length - (unsigned_last_nbits (writeidx) (32)) )) (32)) (sublist (0) ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (writeidx) (32)) )) (32))) (input_contents)) )
  **  (UCharArray.seg in0 (unsigned_last_nbits ((area_length - (unsigned_last_nbits (writeidx) (32)) )) (32)) requested (sublist ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (writeidx) (32)) )) (32))) (requested) (input_contents)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
) \/
(
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (in0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH6 : ((Zlength (input_contents)) = requested)) (PreH7 : (0 <= data_length)) (PreH8 : (data_length <= requested)) (PreH9 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.full in0 requested input_contents )
|--
  “ ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (writeidx) (32)) )) (32)) <= data_length) ” 
  &&  “ ((unsigned_last_nbits ((data_length - (unsigned_last_nbits ((area_length - (unsigned_last_nbits (writeidx) (32)) )) (32)) )) (32)) = (data_length - (unsigned_last_nbits ((area_length - (unsigned_last_nbits (writeidx) (32)) )) (32)) )) ” 
  &&  “ ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (writeidx) (32)) )) (32)) = (area_length - writeidx )) ” 
  &&  “ (writeidx < area_length) ” 
  &&  “ (0 <= writeidx) ”
  &&  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx area_length (sublist (writeidx) (area_length) (physical)) )
  **  (UCharArray.seg in0 0 (unsigned_last_nbits ((area_length - (unsigned_last_nbits (writeidx) (32)) )) (32)) (sublist (0) ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (writeidx) (32)) )) (32))) (input_contents)) )
  **  (UCharArray.seg in0 (unsigned_last_nbits ((area_length - (unsigned_last_nbits (writeidx) (32)) )) (32)) requested (sublist ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (writeidx) (32)) )) (32))) (requested) (input_contents)) )
  **  (GlobalStrings LitMap )
).

Definition CircularAreaWrite_entail_wit_4_split_goal_1 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (in0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH6 : ((Zlength (input_contents)) = requested)) (PreH7 : (0 <= data_length)) (PreH8 : (data_length <= requested)) (PreH9 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.full in0 requested input_contents )
|--
  “ ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (writeidx) (32)) )) (32)) <= data_length) ”
.

Definition CircularAreaWrite_entail_wit_4_split_goal_2 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (in0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH6 : ((Zlength (input_contents)) = requested)) (PreH7 : (0 <= data_length)) (PreH8 : (data_length <= requested)) (PreH9 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.full in0 requested input_contents )
|--
  “ ((unsigned_last_nbits ((data_length - (unsigned_last_nbits ((area_length - (unsigned_last_nbits (writeidx) (32)) )) (32)) )) (32)) = (data_length - (unsigned_last_nbits ((area_length - (unsigned_last_nbits (writeidx) (32)) )) (32)) )) ”
.

Definition CircularAreaWrite_entail_wit_4_split_goal_3 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (in0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH6 : ((Zlength (input_contents)) = requested)) (PreH7 : (0 <= data_length)) (PreH8 : (data_length <= requested)) (PreH9 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.full in0 requested input_contents )
|--
  “ ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (writeidx) (32)) )) (32)) = (area_length - writeidx )) ”
.

Definition CircularAreaWrite_entail_wit_4_split_goal_4 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (in0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH6 : ((Zlength (input_contents)) = requested)) (PreH7 : (0 <= data_length)) (PreH8 : (data_length <= requested)) (PreH9 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.full in0 requested input_contents )
|--
  “ (writeidx < area_length) ”
.

Definition CircularAreaWrite_entail_wit_4_split_goal_5 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (in0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH6 : ((Zlength (input_contents)) = requested)) (PreH7 : (0 <= data_length)) (PreH8 : (data_length <= requested)) (PreH9 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.full in0 requested input_contents )
|--
  “ (0 <= writeidx) ”
.

Definition CircularAreaWrite_entail_wit_4_split_goal_spatial := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (in0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH6 : ((Zlength (input_contents)) = requested)) (PreH7 : (0 <= data_length)) (PreH8 : (data_length <= requested)) (PreH9 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.full in0 requested input_contents )
|--
  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx area_length (sublist (writeidx) (area_length) (physical)) )
  **  (UCharArray.seg in0 0 (unsigned_last_nbits ((area_length - (unsigned_last_nbits (writeidx) (32)) )) (32)) (sublist (0) ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (writeidx) (32)) )) (32))) (input_contents)) )
  **  (UCharArray.seg in0 (unsigned_last_nbits ((area_length - (unsigned_last_nbits (writeidx) (32)) )) (32)) requested (sublist ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (writeidx) (32)) )) (32))) (requested) (input_contents)) )
  **  (GlobalStrings LitMap )
.

Definition CircularAreaWrite_entail_wit_5 := 
(
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (write_len_up: Z) (write_len_down: Z) (retval: Z) (PreH1 : (retval = (data_buffer + (writeidx * sizeof(UCHAR))))) (PreH2 : (ca0 <> 0)) (PreH3 : (in0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH7 : ((Zlength (input_contents)) = requested)) (PreH8 : (0 <= data_length)) (PreH9 : (data_length <= requested)) (PreH10 : (0 <= writeidx)) (PreH11 : (writeidx < area_length)) (PreH12 : (write_len_up = (area_length - writeidx ))) (PreH13 : (write_len_down = (data_length - write_len_up ))) (PreH14 : (write_len_up <= data_length)) (PreH15 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH16 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (UCharArray.mixed_seg data_buffer writeidx area_length (CircularAreaSomeBytes ((sublist (0) (write_len_up) (input_contents)))) )
  **  (UCharArray.seg in0 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.seg in0 write_len_up requested (sublist (write_len_up) (requested) (input_contents)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ (ca0 <> 0) ” 
  &&  “ (in0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaWriteLengthReady area_length requested logical data_length force0 ) ” 
  &&  “ ((Zlength (input_contents)) = requested) ” 
  &&  “ (0 <= write_len_down) ” 
  &&  “ (write_len_down <= writeidx) ” 
  &&  “ (write_len_up = (area_length - writeidx )) ” 
  &&  “ (write_len_down = (data_length - write_len_up )) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx data_length area_length 1 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
  &&  (UCharArray.mixed_seg data_buffer 0 write_len_down (sublist (0) (write_len_down) (physical)) )
  **  (UCharArray.mixed_seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx area_length (CircularAreaSomeBytes ((sublist (0) (write_len_up) (input_contents)))) )
  **  (UCharArray.seg in0 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg in0 write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.seg in0 data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
) \/
(
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (write_len_up: Z) (write_len_down: Z) (retval: Z) (PreH1 : (retval = (data_buffer + (writeidx * sizeof(UCHAR))))) (PreH2 : (ca0 <> 0)) (PreH3 : (in0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH7 : ((Zlength (input_contents)) = requested)) (PreH8 : (0 <= data_length)) (PreH9 : (data_length <= requested)) (PreH10 : (0 <= writeidx)) (PreH11 : (writeidx < area_length)) (PreH12 : (write_len_up = (area_length - writeidx ))) (PreH13 : (write_len_down = (data_length - write_len_up ))) (PreH14 : (write_len_up <= data_length)) (PreH15 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH16 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (GlobalStrings LitMap )
|--
  “ ((data_length - write_len_up ) <= writeidx) ” 
  &&  “ ((sublist ((area_length - writeidx )) (requested) (input_contents)) = (app ((sublist ((area_length - writeidx )) (data_length) (input_contents))) ((sublist (data_length) (requested) (input_contents))))) ” 
  &&  “ ((Zlength ((sublist ((area_length - writeidx )) (data_length) (input_contents)))) = (data_length - (area_length - writeidx ) )) ”
  &&  (UCharArray.mixed_seg data_buffer 0 write_len_down (sublist (0) (write_len_down) (physical)) )
  **  (UCharArray.mixed_seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (physical)) )
  **  (GlobalStrings LitMap )
).

Definition CircularAreaWrite_entail_wit_5_split_goal_1 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (write_len_up: Z) (write_len_down: Z) (retval: Z) (PreH1 : (retval = (data_buffer + (writeidx * sizeof(UCHAR))))) (PreH2 : (ca0 <> 0)) (PreH3 : (in0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH7 : ((Zlength (input_contents)) = requested)) (PreH8 : (0 <= data_length)) (PreH9 : (data_length <= requested)) (PreH10 : (0 <= writeidx)) (PreH11 : (writeidx < area_length)) (PreH12 : (write_len_up = (area_length - writeidx ))) (PreH13 : (write_len_down = (data_length - write_len_up ))) (PreH14 : (write_len_up <= data_length)) (PreH15 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH16 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (GlobalStrings LitMap )
|--
  “ ((data_length - write_len_up ) <= writeidx) ”
.

Definition CircularAreaWrite_entail_wit_5_split_goal_2 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (write_len_up: Z) (write_len_down: Z) (retval: Z) (PreH1 : (retval = (data_buffer + (writeidx * sizeof(UCHAR))))) (PreH2 : (ca0 <> 0)) (PreH3 : (in0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH7 : ((Zlength (input_contents)) = requested)) (PreH8 : (0 <= data_length)) (PreH9 : (data_length <= requested)) (PreH10 : (0 <= writeidx)) (PreH11 : (writeidx < area_length)) (PreH12 : (write_len_up = (area_length - writeidx ))) (PreH13 : (write_len_down = (data_length - write_len_up ))) (PreH14 : (write_len_up <= data_length)) (PreH15 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH16 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (GlobalStrings LitMap )
|--
  “ ((sublist ((area_length - writeidx )) (requested) (input_contents)) = (app ((sublist ((area_length - writeidx )) (data_length) (input_contents))) ((sublist (data_length) (requested) (input_contents))))) ”
.

Definition CircularAreaWrite_entail_wit_5_split_goal_3 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (write_len_up: Z) (write_len_down: Z) (retval: Z) (PreH1 : (retval = (data_buffer + (writeidx * sizeof(UCHAR))))) (PreH2 : (ca0 <> 0)) (PreH3 : (in0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH7 : ((Zlength (input_contents)) = requested)) (PreH8 : (0 <= data_length)) (PreH9 : (data_length <= requested)) (PreH10 : (0 <= writeidx)) (PreH11 : (writeidx < area_length)) (PreH12 : (write_len_up = (area_length - writeidx ))) (PreH13 : (write_len_down = (data_length - write_len_up ))) (PreH14 : (write_len_up <= data_length)) (PreH15 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH16 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (GlobalStrings LitMap )
|--
  “ ((Zlength ((sublist ((area_length - writeidx )) (data_length) (input_contents)))) = (data_length - (area_length - writeidx ) )) ”
.

Definition CircularAreaWrite_entail_wit_5_split_goal_spatial := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (write_len_up: Z) (write_len_down: Z) (retval: Z) (PreH1 : (retval = (data_buffer + (writeidx * sizeof(UCHAR))))) (PreH2 : (ca0 <> 0)) (PreH3 : (in0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH7 : ((Zlength (input_contents)) = requested)) (PreH8 : (0 <= data_length)) (PreH9 : (data_length <= requested)) (PreH10 : (0 <= writeidx)) (PreH11 : (writeidx < area_length)) (PreH12 : (write_len_up = (area_length - writeidx ))) (PreH13 : (write_len_down = (data_length - write_len_up ))) (PreH14 : (write_len_up <= data_length)) (PreH15 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH16 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (GlobalStrings LitMap )
|--
  (UCharArray.mixed_seg data_buffer 0 write_len_down (sublist (0) (write_len_down) (physical)) )
  **  (UCharArray.mixed_seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (physical)) )
  **  (GlobalStrings LitMap )
.

Definition CircularAreaWrite_entail_wit_6_1 := 
(
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (full_result: Z) (retval: Z) (retval_2: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideWrDataResult writeidx (unsigned_last_nbits ((area_length - retval )) (32)) area_length retval_2 )) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH5 : (requested > (unsigned_last_nbits ((area_length - retval )) (32)))) (PreH6 : (ca0 <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (CircularAreaDataLengthResult logical retval )) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH10 : (ca0 <> 0)) (PreH11 : (in0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (requested > 0)) (PreH14 : (CircularAreaFullResult area_length logical full_result )) (PreH15 : ~(((full_result <> 0) /\ (force0 = 0)))) (PreH16 : ((force0 = 0) -> ((Zlength (logical)) < area_length))) (PreH17 : ((Zlength (input_contents)) = requested)) (PreH18 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH19 : (retval_2 = 0)) ,
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
  **  (UCharArray.full in0 requested input_contents )
|--
  “ (ca0 <> 0) ” 
  &&  “ (in0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaWriteLengthReady area_length requested logical (unsigned_last_nbits ((area_length - retval )) (32)) force0 ) ” 
  &&  “ ((Zlength (input_contents)) = requested) ” 
  &&  “ (0 <= (unsigned_last_nbits ((area_length - retval )) (32))) ” 
  &&  “ ((unsigned_last_nbits ((area_length - retval )) (32)) <= requested) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ ((writeidx + (unsigned_last_nbits ((area_length - retval )) (32)) ) <= area_length) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx (unsigned_last_nbits ((area_length - retval )) (32)) area_length 0 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
  &&  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx (writeidx + (unsigned_last_nbits ((area_length - retval )) (32)) ) (sublist (writeidx) ((writeidx + (unsigned_last_nbits ((area_length - retval )) (32)) )) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (writeidx + (unsigned_last_nbits ((area_length - retval )) (32)) ) area_length (sublist ((writeidx + (unsigned_last_nbits ((area_length - retval )) (32)) )) (area_length) (physical)) )
  **  (UCharArray.seg in0 0 (unsigned_last_nbits ((area_length - retval )) (32)) (sublist (0) ((unsigned_last_nbits ((area_length - retval )) (32))) (input_contents)) )
  **  (UCharArray.seg in0 (unsigned_last_nbits ((area_length - retval )) (32)) requested (sublist ((unsigned_last_nbits ((area_length - retval )) (32))) (requested) (input_contents)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
) \/
(
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (full_result: Z) (retval: Z) (retval_2: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideWrDataResult writeidx (unsigned_last_nbits ((area_length - retval )) (32)) area_length retval_2 )) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH5 : (requested > (unsigned_last_nbits ((area_length - retval )) (32)))) (PreH6 : (ca0 <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (CircularAreaDataLengthResult logical retval )) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH10 : (ca0 <> 0)) (PreH11 : (in0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (requested > 0)) (PreH14 : (CircularAreaFullResult area_length logical full_result )) (PreH15 : ~(((full_result <> 0) /\ (force0 = 0)))) (PreH16 : ((force0 = 0) -> ((Zlength (logical)) < area_length))) (PreH17 : ((Zlength (input_contents)) = requested)) (PreH18 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH19 : (retval_2 = 0)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.full in0 requested input_contents )
|--
  “ ((writeidx + (unsigned_last_nbits ((area_length - retval )) (32)) ) <= area_length) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ (0 <= (unsigned_last_nbits ((area_length - retval )) (32))) ” 
  &&  “ (CircularAreaWriteLengthReady area_length requested logical (unsigned_last_nbits ((area_length - retval )) (32)) force0 ) ”
  &&  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx (writeidx + (unsigned_last_nbits ((area_length - retval )) (32)) ) (sublist (writeidx) ((writeidx + (unsigned_last_nbits ((area_length - retval )) (32)) )) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (writeidx + (unsigned_last_nbits ((area_length - retval )) (32)) ) area_length (sublist ((writeidx + (unsigned_last_nbits ((area_length - retval )) (32)) )) (area_length) (physical)) )
  **  (UCharArray.seg in0 0 (unsigned_last_nbits ((area_length - retval )) (32)) (sublist (0) ((unsigned_last_nbits ((area_length - retval )) (32))) (input_contents)) )
  **  (UCharArray.seg in0 (unsigned_last_nbits ((area_length - retval )) (32)) requested (sublist ((unsigned_last_nbits ((area_length - retval )) (32))) (requested) (input_contents)) )
  **  (GlobalStrings LitMap )
).

Definition CircularAreaWrite_entail_wit_6_1_split_goal_1 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (full_result: Z) (retval: Z) (retval_2: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideWrDataResult writeidx (unsigned_last_nbits ((area_length - retval )) (32)) area_length retval_2 )) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH5 : (requested > (unsigned_last_nbits ((area_length - retval )) (32)))) (PreH6 : (ca0 <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (CircularAreaDataLengthResult logical retval )) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH10 : (ca0 <> 0)) (PreH11 : (in0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (requested > 0)) (PreH14 : (CircularAreaFullResult area_length logical full_result )) (PreH15 : ~(((full_result <> 0) /\ (force0 = 0)))) (PreH16 : ((force0 = 0) -> ((Zlength (logical)) < area_length))) (PreH17 : ((Zlength (input_contents)) = requested)) (PreH18 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH19 : (retval_2 = 0)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.full in0 requested input_contents )
|--
  “ ((writeidx + (unsigned_last_nbits ((area_length - retval )) (32)) ) <= area_length) ”
.

Definition CircularAreaWrite_entail_wit_6_1_split_goal_2 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (full_result: Z) (retval: Z) (retval_2: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideWrDataResult writeidx (unsigned_last_nbits ((area_length - retval )) (32)) area_length retval_2 )) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH5 : (requested > (unsigned_last_nbits ((area_length - retval )) (32)))) (PreH6 : (ca0 <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (CircularAreaDataLengthResult logical retval )) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH10 : (ca0 <> 0)) (PreH11 : (in0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (requested > 0)) (PreH14 : (CircularAreaFullResult area_length logical full_result )) (PreH15 : ~(((full_result <> 0) /\ (force0 = 0)))) (PreH16 : ((force0 = 0) -> ((Zlength (logical)) < area_length))) (PreH17 : ((Zlength (input_contents)) = requested)) (PreH18 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH19 : (retval_2 = 0)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.full in0 requested input_contents )
|--
  “ (0 <= writeidx) ”
.

Definition CircularAreaWrite_entail_wit_6_1_split_goal_3 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (full_result: Z) (retval: Z) (retval_2: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideWrDataResult writeidx (unsigned_last_nbits ((area_length - retval )) (32)) area_length retval_2 )) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH5 : (requested > (unsigned_last_nbits ((area_length - retval )) (32)))) (PreH6 : (ca0 <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (CircularAreaDataLengthResult logical retval )) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH10 : (ca0 <> 0)) (PreH11 : (in0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (requested > 0)) (PreH14 : (CircularAreaFullResult area_length logical full_result )) (PreH15 : ~(((full_result <> 0) /\ (force0 = 0)))) (PreH16 : ((force0 = 0) -> ((Zlength (logical)) < area_length))) (PreH17 : ((Zlength (input_contents)) = requested)) (PreH18 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH19 : (retval_2 = 0)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.full in0 requested input_contents )
|--
  “ (0 <= (unsigned_last_nbits ((area_length - retval )) (32))) ”
.

Definition CircularAreaWrite_entail_wit_6_1_split_goal_4 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (full_result: Z) (retval: Z) (retval_2: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideWrDataResult writeidx (unsigned_last_nbits ((area_length - retval )) (32)) area_length retval_2 )) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH5 : (requested > (unsigned_last_nbits ((area_length - retval )) (32)))) (PreH6 : (ca0 <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (CircularAreaDataLengthResult logical retval )) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH10 : (ca0 <> 0)) (PreH11 : (in0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (requested > 0)) (PreH14 : (CircularAreaFullResult area_length logical full_result )) (PreH15 : ~(((full_result <> 0) /\ (force0 = 0)))) (PreH16 : ((force0 = 0) -> ((Zlength (logical)) < area_length))) (PreH17 : ((Zlength (input_contents)) = requested)) (PreH18 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH19 : (retval_2 = 0)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.full in0 requested input_contents )
|--
  “ (CircularAreaWriteLengthReady area_length requested logical (unsigned_last_nbits ((area_length - retval )) (32)) force0 ) ”
.

Definition CircularAreaWrite_entail_wit_6_1_split_goal_spatial := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (full_result: Z) (retval: Z) (retval_2: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideWrDataResult writeidx (unsigned_last_nbits ((area_length - retval )) (32)) area_length retval_2 )) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH5 : (requested > (unsigned_last_nbits ((area_length - retval )) (32)))) (PreH6 : (ca0 <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (CircularAreaDataLengthResult logical retval )) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH10 : (ca0 <> 0)) (PreH11 : (in0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (requested > 0)) (PreH14 : (CircularAreaFullResult area_length logical full_result )) (PreH15 : ~(((full_result <> 0) /\ (force0 = 0)))) (PreH16 : ((force0 = 0) -> ((Zlength (logical)) < area_length))) (PreH17 : ((Zlength (input_contents)) = requested)) (PreH18 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH19 : (retval_2 = 0)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.full in0 requested input_contents )
|--
  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx (writeidx + (unsigned_last_nbits ((area_length - retval )) (32)) ) (sublist (writeidx) ((writeidx + (unsigned_last_nbits ((area_length - retval )) (32)) )) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (writeidx + (unsigned_last_nbits ((area_length - retval )) (32)) ) area_length (sublist ((writeidx + (unsigned_last_nbits ((area_length - retval )) (32)) )) (area_length) (physical)) )
  **  (UCharArray.seg in0 0 (unsigned_last_nbits ((area_length - retval )) (32)) (sublist (0) ((unsigned_last_nbits ((area_length - retval )) (32))) (input_contents)) )
  **  (UCharArray.seg in0 (unsigned_last_nbits ((area_length - retval )) (32)) requested (sublist ((unsigned_last_nbits ((area_length - retval )) (32))) (requested) (input_contents)) )
  **  (GlobalStrings LitMap )
.

Definition CircularAreaWrite_entail_wit_6_2 := 
(
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (full_result: Z) (retval: Z) (retval_2: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideWrDataResult writeidx requested area_length retval_2 )) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH5 : (requested <= (unsigned_last_nbits ((area_length - retval )) (32)))) (PreH6 : (ca0 <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (CircularAreaDataLengthResult logical retval )) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH10 : (ca0 <> 0)) (PreH11 : (in0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (requested > 0)) (PreH14 : (CircularAreaFullResult area_length logical full_result )) (PreH15 : ~(((full_result <> 0) /\ (force0 = 0)))) (PreH16 : ((force0 = 0) -> ((Zlength (logical)) < area_length))) (PreH17 : ((Zlength (input_contents)) = requested)) (PreH18 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH19 : (retval_2 = 0)) ,
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
  **  (UCharArray.full in0 requested input_contents )
|--
  “ (ca0 <> 0) ” 
  &&  “ (in0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaWriteLengthReady area_length requested logical requested force0 ) ” 
  &&  “ ((Zlength (input_contents)) = requested) ” 
  &&  “ (0 <= requested) ” 
  &&  “ (requested <= requested) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ ((writeidx + requested ) <= area_length) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx requested area_length 0 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
  &&  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx (writeidx + requested ) (sublist (writeidx) ((writeidx + requested )) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (writeidx + requested ) area_length (sublist ((writeidx + requested )) (area_length) (physical)) )
  **  (UCharArray.seg in0 0 requested (sublist (0) (requested) (input_contents)) )
  **  (UCharArray.seg in0 requested requested (sublist (requested) (requested) (input_contents)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
) \/
(
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (full_result: Z) (retval: Z) (retval_2: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideWrDataResult writeidx requested area_length retval_2 )) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH5 : (requested <= (unsigned_last_nbits ((area_length - retval )) (32)))) (PreH6 : (ca0 <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (CircularAreaDataLengthResult logical retval )) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH10 : (ca0 <> 0)) (PreH11 : (in0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (requested > 0)) (PreH14 : (CircularAreaFullResult area_length logical full_result )) (PreH15 : ~(((full_result <> 0) /\ (force0 = 0)))) (PreH16 : ((force0 = 0) -> ((Zlength (logical)) < area_length))) (PreH17 : ((Zlength (input_contents)) = requested)) (PreH18 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH19 : (retval_2 = 0)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.full in0 requested input_contents )
|--
  “ ((writeidx + requested ) <= area_length) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ (CircularAreaWriteLengthReady area_length requested logical requested force0 ) ” 
  &&  “ ((sublist (requested) (requested) (input_contents)) = (@nil Z)) ”
  &&  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx (writeidx + requested ) (sublist (writeidx) ((writeidx + requested )) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (writeidx + requested ) area_length (sublist ((writeidx + requested )) (area_length) (physical)) )
  **  (UCharArray.seg in0 0 requested (sublist (0) (requested) (input_contents)) )
  **  (GlobalStrings LitMap )
).

Definition CircularAreaWrite_entail_wit_6_2_split_goal_1 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (full_result: Z) (retval: Z) (retval_2: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideWrDataResult writeidx requested area_length retval_2 )) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH5 : (requested <= (unsigned_last_nbits ((area_length - retval )) (32)))) (PreH6 : (ca0 <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (CircularAreaDataLengthResult logical retval )) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH10 : (ca0 <> 0)) (PreH11 : (in0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (requested > 0)) (PreH14 : (CircularAreaFullResult area_length logical full_result )) (PreH15 : ~(((full_result <> 0) /\ (force0 = 0)))) (PreH16 : ((force0 = 0) -> ((Zlength (logical)) < area_length))) (PreH17 : ((Zlength (input_contents)) = requested)) (PreH18 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH19 : (retval_2 = 0)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.full in0 requested input_contents )
|--
  “ ((writeidx + requested ) <= area_length) ”
.

Definition CircularAreaWrite_entail_wit_6_2_split_goal_2 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (full_result: Z) (retval: Z) (retval_2: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideWrDataResult writeidx requested area_length retval_2 )) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH5 : (requested <= (unsigned_last_nbits ((area_length - retval )) (32)))) (PreH6 : (ca0 <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (CircularAreaDataLengthResult logical retval )) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH10 : (ca0 <> 0)) (PreH11 : (in0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (requested > 0)) (PreH14 : (CircularAreaFullResult area_length logical full_result )) (PreH15 : ~(((full_result <> 0) /\ (force0 = 0)))) (PreH16 : ((force0 = 0) -> ((Zlength (logical)) < area_length))) (PreH17 : ((Zlength (input_contents)) = requested)) (PreH18 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH19 : (retval_2 = 0)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.full in0 requested input_contents )
|--
  “ (0 <= writeidx) ”
.

Definition CircularAreaWrite_entail_wit_6_2_split_goal_3 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (full_result: Z) (retval: Z) (retval_2: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideWrDataResult writeidx requested area_length retval_2 )) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH5 : (requested <= (unsigned_last_nbits ((area_length - retval )) (32)))) (PreH6 : (ca0 <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (CircularAreaDataLengthResult logical retval )) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH10 : (ca0 <> 0)) (PreH11 : (in0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (requested > 0)) (PreH14 : (CircularAreaFullResult area_length logical full_result )) (PreH15 : ~(((full_result <> 0) /\ (force0 = 0)))) (PreH16 : ((force0 = 0) -> ((Zlength (logical)) < area_length))) (PreH17 : ((Zlength (input_contents)) = requested)) (PreH18 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH19 : (retval_2 = 0)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.full in0 requested input_contents )
|--
  “ (CircularAreaWriteLengthReady area_length requested logical requested force0 ) ”
.

Definition CircularAreaWrite_entail_wit_6_2_split_goal_4 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (full_result: Z) (retval: Z) (retval_2: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideWrDataResult writeidx requested area_length retval_2 )) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH5 : (requested <= (unsigned_last_nbits ((area_length - retval )) (32)))) (PreH6 : (ca0 <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (CircularAreaDataLengthResult logical retval )) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH10 : (ca0 <> 0)) (PreH11 : (in0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (requested > 0)) (PreH14 : (CircularAreaFullResult area_length logical full_result )) (PreH15 : ~(((full_result <> 0) /\ (force0 = 0)))) (PreH16 : ((force0 = 0) -> ((Zlength (logical)) < area_length))) (PreH17 : ((Zlength (input_contents)) = requested)) (PreH18 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH19 : (retval_2 = 0)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.full in0 requested input_contents )
|--
  “ ((sublist (requested) (requested) (input_contents)) = (@nil Z)) ”
.

Definition CircularAreaWrite_entail_wit_6_2_split_goal_spatial := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (full_result: Z) (retval: Z) (retval_2: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaDivideWrDataResult writeidx requested area_length retval_2 )) (PreH4 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH5 : (requested <= (unsigned_last_nbits ((area_length - retval )) (32)))) (PreH6 : (ca0 <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (CircularAreaDataLengthResult logical retval )) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH10 : (ca0 <> 0)) (PreH11 : (in0 <> 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (requested > 0)) (PreH14 : (CircularAreaFullResult area_length logical full_result )) (PreH15 : ~(((full_result <> 0) /\ (force0 = 0)))) (PreH16 : ((force0 = 0) -> ((Zlength (logical)) < area_length))) (PreH17 : ((Zlength (input_contents)) = requested)) (PreH18 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH19 : (retval_2 = 0)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.full in0 requested input_contents )
|--
  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx (writeidx + requested ) (sublist (writeidx) ((writeidx + requested )) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (writeidx + requested ) area_length (sublist ((writeidx + requested )) (area_length) (physical)) )
  **  (UCharArray.seg in0 0 requested (sublist (0) (requested) (input_contents)) )
  **  (GlobalStrings LitMap )
.

Definition CircularAreaWrite_return_wit_1 := 
(
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (write_len_down: Z) (write_len_up: Z) (retval: Z) (PreH1 : (retval = data_buffer)) (PreH2 : (ca0 <> 0)) (PreH3 : (in0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH7 : ((Zlength (input_contents)) = requested)) (PreH8 : (0 <= write_len_down)) (PreH9 : (write_len_down <= writeidx)) (PreH10 : (write_len_up = (area_length - writeidx ))) (PreH11 : (write_len_down = (data_length - write_len_up ))) (PreH12 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH13 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH14 : (force0 <> 0)) ,
  (UCharArray.mixed_seg data_buffer 0 write_len_down (CircularAreaSomeBytes ((sublist (write_len_up) (data_length) (input_contents)))) )
  **  (UCharArray.seg in0 write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.mixed_seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx area_length (CircularAreaSomeBytes ((sublist (0) (write_len_up) (input_contents)))) )
  **  (UCharArray.seg in0 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg in0 data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> (unsigned_last_nbits (write_len_down) (8)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> (unsigned_last_nbits (write_len_down) (8)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 1)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  EX (actual: Z)  (new_writeidx: Z)  (physical_after: (@list (@option Z))) ,
  “ (ca0 <> 0) ” 
  &&  “ (in0 <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (force0 <> 0) ” 
  &&  “ (CircularAreaForceWriteEffect area_length writeidx requested actual new_writeidx logical input_contents physical physical_after ) ” 
  &&  “ (0 = 0) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaForceWriteResource ca0 data_buffer new_writeidx area_length operations physical_after )
  **  (UCharArray.full in0 requested input_contents )
) \/
(
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (write_len_down: Z) (write_len_up: Z) (retval: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (1 <= INT_MAX)) (PreH4 : (1 >= INT_MIN)) (PreH5 : (retval = data_buffer)) (PreH6 : (ca0 <> 0)) (PreH7 : (in0 <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (requested > 0)) (PreH10 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH11 : ((Zlength (input_contents)) = requested)) (PreH12 : (0 <= write_len_down)) (PreH13 : (write_len_down <= writeidx)) (PreH14 : (write_len_up = (area_length - writeidx ))) (PreH15 : (write_len_down = (data_length - write_len_up ))) (PreH16 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH17 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH18 : (force0 <> 0)) ,
  (UCharArray.mixed_seg data_buffer 0 write_len_down (CircularAreaSomeBytes ((sublist (write_len_up) (data_length) (input_contents)))) )
  **  (UCharArray.seg in0 write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.mixed_seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx area_length (CircularAreaSomeBytes ((sublist (0) (write_len_up) (input_contents)))) )
  **  (UCharArray.seg in0 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg in0 data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> (unsigned_last_nbits (write_len_down) (8)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> (unsigned_last_nbits (write_len_down) (8)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 1)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  EX (actual: Z)  (new_writeidx: Z)  (physical_after: (@list (@option Z))) ,
  “ (ca0 <> 0) ” 
  &&  “ (in0 <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (force0 <> 0) ” 
  &&  “ (CircularAreaForceWriteEffect area_length writeidx requested actual new_writeidx logical input_contents physical physical_after ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaForceWriteResource ca0 data_buffer new_writeidx area_length operations physical_after )
  **  (UCharArray.full in0 requested input_contents )
).

Definition CircularAreaWrite_return_wit_2 := 
(
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (retval: Z) (PreH1 : (retval = (data_buffer + (writeidx * sizeof(UCHAR))))) (PreH2 : (ca0 <> 0)) (PreH3 : (in0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH7 : ((Zlength (input_contents)) = requested)) (PreH8 : (0 <= data_length)) (PreH9 : (data_length <= requested)) (PreH10 : (0 <= writeidx)) (PreH11 : ((writeidx + data_length ) <= area_length)) (PreH12 : (CircularAreaDivideWrDataResult writeidx data_length area_length 0 )) (PreH13 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH14 : (force0 <> 0)) ,
  (UCharArray.mixed_seg data_buffer writeidx (writeidx + data_length ) (CircularAreaSomeBytes ((sublist (0) (data_length) (input_contents)))) )
  **  (UCharArray.seg in0 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (writeidx + data_length ) area_length (sublist ((writeidx + data_length )) (area_length) (physical)) )
  **  (UCharArray.seg in0 data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> (unsigned_last_nbits (((writeidx + data_length ) % ( area_length ) )) (8)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> (unsigned_last_nbits (((writeidx + data_length ) % ( area_length ) )) (8)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 1)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  EX (actual: Z)  (new_writeidx: Z)  (physical_after: (@list (@option Z))) ,
  “ (ca0 <> 0) ” 
  &&  “ (in0 <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (force0 <> 0) ” 
  &&  “ (CircularAreaForceWriteEffect area_length writeidx requested actual new_writeidx logical input_contents physical physical_after ) ” 
  &&  “ (0 = 0) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaForceWriteResource ca0 data_buffer new_writeidx area_length operations physical_after )
  **  (UCharArray.full in0 requested input_contents )
) \/
(
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (retval: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (1 <= INT_MAX)) (PreH4 : (1 >= INT_MIN)) (PreH5 : (retval = (data_buffer + (writeidx * sizeof(UCHAR))))) (PreH6 : (ca0 <> 0)) (PreH7 : (in0 <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (requested > 0)) (PreH10 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH11 : ((Zlength (input_contents)) = requested)) (PreH12 : (0 <= data_length)) (PreH13 : (data_length <= requested)) (PreH14 : (0 <= writeidx)) (PreH15 : ((writeidx + data_length ) <= area_length)) (PreH16 : (CircularAreaDivideWrDataResult writeidx data_length area_length 0 )) (PreH17 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH18 : (force0 <> 0)) ,
  (UCharArray.mixed_seg data_buffer writeidx (writeidx + data_length ) (CircularAreaSomeBytes ((sublist (0) (data_length) (input_contents)))) )
  **  (UCharArray.seg in0 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (writeidx + data_length ) area_length (sublist ((writeidx + data_length )) (area_length) (physical)) )
  **  (UCharArray.seg in0 data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> (unsigned_last_nbits (((writeidx + data_length ) % ( area_length ) )) (8)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> (unsigned_last_nbits (((writeidx + data_length ) % ( area_length ) )) (8)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 1)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  EX (actual: Z)  (new_writeidx: Z)  (physical_after: (@list (@option Z))) ,
  “ (ca0 <> 0) ” 
  &&  “ (in0 <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (force0 <> 0) ” 
  &&  “ (CircularAreaForceWriteEffect area_length writeidx requested actual new_writeidx logical input_contents physical physical_after ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaForceWriteResource ca0 data_buffer new_writeidx area_length operations physical_after )
  **  (UCharArray.full in0 requested input_contents )
).

Definition CircularAreaWrite_return_wit_3 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (write_len_down: Z) (write_len_up: Z) (retval: Z) (PreH1 : (retval = data_buffer)) (PreH2 : (ca0 <> 0)) (PreH3 : (in0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH7 : ((Zlength (input_contents)) = requested)) (PreH8 : (0 <= write_len_down)) (PreH9 : (write_len_down <= writeidx)) (PreH10 : (write_len_up = (area_length - writeidx ))) (PreH11 : (write_len_down = (data_length - write_len_up ))) (PreH12 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH13 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH14 : (force0 = 0)) ,
  (UCharArray.mixed_seg data_buffer 0 write_len_down (CircularAreaSomeBytes ((sublist (write_len_up) (data_length) (input_contents)))) )
  **  (UCharArray.seg in0 write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.mixed_seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx area_length (CircularAreaSomeBytes ((sublist (0) (write_len_up) (input_contents)))) )
  **  (UCharArray.seg in0 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg in0 data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> (unsigned_last_nbits (write_len_down) (8)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 1)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  (EX (actual_2: Z)  (new_writeidx_2: Z)  (logical_after: (@list Z))  (physical_after_2: (@list (@option Z))) ,
  “ (ca0 <> 0) ” 
  &&  “ (in0 <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (force0 = 0) ” 
  &&  “ (CircularAreaWriteSuccess area_length writeidx requested actual_2 new_writeidx_2 logical input_contents logical_after physical physical_after_2 ) ” 
  &&  “ (0 = 0) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx new_writeidx_2 area_length 1 operations logical_after physical_after_2 )
  **  (UCharArray.full in0 requested input_contents ))
  ||
  (“ (ca0 <> 0) ” 
  &&  “ (in0 <> 0) ” 
  &&  “ (force0 = 0) ” 
  &&  “ ((Zlength (logical)) = area_length) ” 
  &&  “ (CircularAreaErrorResult 0 ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.full in0 requested input_contents ))
.

Definition CircularAreaWrite_return_wit_4 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (retval: Z) (PreH1 : (retval = (data_buffer + (writeidx * sizeof(UCHAR))))) (PreH2 : (ca0 <> 0)) (PreH3 : (in0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH7 : ((Zlength (input_contents)) = requested)) (PreH8 : (0 <= data_length)) (PreH9 : (data_length <= requested)) (PreH10 : (0 <= writeidx)) (PreH11 : ((writeidx + data_length ) <= area_length)) (PreH12 : (CircularAreaDivideWrDataResult writeidx data_length area_length 0 )) (PreH13 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH14 : (force0 = 0)) ,
  (UCharArray.mixed_seg data_buffer writeidx (writeidx + data_length ) (CircularAreaSomeBytes ((sublist (0) (data_length) (input_contents)))) )
  **  (UCharArray.seg in0 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (writeidx + data_length ) area_length (sublist ((writeidx + data_length )) (area_length) (physical)) )
  **  (UCharArray.seg in0 data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> (unsigned_last_nbits (((writeidx + data_length ) % ( area_length ) )) (8)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 1)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  (EX (actual_2: Z)  (new_writeidx_2: Z)  (logical_after: (@list Z))  (physical_after_2: (@list (@option Z))) ,
  “ (ca0 <> 0) ” 
  &&  “ (in0 <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (force0 = 0) ” 
  &&  “ (CircularAreaWriteSuccess area_length writeidx requested actual_2 new_writeidx_2 logical input_contents logical_after physical physical_after_2 ) ” 
  &&  “ (0 = 0) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx new_writeidx_2 area_length 1 operations logical_after physical_after_2 )
  **  (UCharArray.full in0 requested input_contents ))
  ||
  (“ (ca0 <> 0) ” 
  &&  “ (in0 <> 0) ” 
  &&  “ (force0 = 0) ” 
  &&  “ ((Zlength (logical)) = area_length) ” 
  &&  “ (CircularAreaErrorResult 0 ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.full in0 requested input_contents ))
.

Definition CircularAreaWrite_return_wit_5 := 
(
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (retval: Z) (PreH1 : (force0 = 0)) (PreH2 : (retval <> 0)) (PreH3 : (ca0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaFullResult area_length logical retval )) (PreH6 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH7 : (ca0 <> 0)) (PreH8 : (in0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (requested > 0)) (PreH11 : ((Zlength (input_contents)) = requested)) (PreH12 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
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
  **  (UCharArray.full in0 requested input_contents )
|--
  “ (ca0 <> 0) ” 
  &&  “ (in0 <> 0) ” 
  &&  “ (force0 = 0) ” 
  &&  “ ((Zlength (logical)) = area_length) ” 
  &&  “ (CircularAreaErrorResult 1 ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.full in0 requested input_contents )
) \/
(
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (retval: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (force0 = 0)) (PreH6 : (retval <> 0)) (PreH7 : (ca0 <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaFullResult area_length logical retval )) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH11 : (ca0 <> 0)) (PreH12 : (in0 <> 0)) (PreH13 : (data_buffer <> 0)) (PreH14 : (requested > 0)) (PreH15 : ((Zlength (input_contents)) = requested)) (PreH16 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
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
  “ (CircularAreaErrorResult 1 ) ” 
  &&  “ ((Zlength (logical)) = area_length) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
).

Definition CircularAreaWrite_return_wit_5_split_goal_1 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (retval: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (force0 = 0)) (PreH6 : (retval <> 0)) (PreH7 : (ca0 <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaFullResult area_length logical retval )) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH11 : (ca0 <> 0)) (PreH12 : (in0 <> 0)) (PreH13 : (data_buffer <> 0)) (PreH14 : (requested > 0)) (PreH15 : ((Zlength (input_contents)) = requested)) (PreH16 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
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
  “ (CircularAreaErrorResult 1 ) ”
.

Definition CircularAreaWrite_return_wit_5_split_goal_2 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (retval: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (force0 = 0)) (PreH6 : (retval <> 0)) (PreH7 : (ca0 <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaFullResult area_length logical retval )) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH11 : (ca0 <> 0)) (PreH12 : (in0 <> 0)) (PreH13 : (data_buffer <> 0)) (PreH14 : (requested > 0)) (PreH15 : ((Zlength (input_contents)) = requested)) (PreH16 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
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
  “ ((Zlength (logical)) = area_length) ”
.

Definition CircularAreaWrite_return_wit_5_split_goal_spatial := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (retval: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (force0 = 0)) (PreH6 : (retval <> 0)) (PreH7 : (ca0 <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaFullResult area_length logical retval )) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH11 : (ca0 <> 0)) (PreH12 : (in0 <> 0)) (PreH13 : (data_buffer <> 0)) (PreH14 : (requested > 0)) (PreH15 : ((Zlength (input_contents)) = requested)) (PreH16 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
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

Definition CircularAreaWrite_return_wit_6 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (PreH1 : (data_length_pre <= 0)) (PreH2 : (input_buffer_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre = ca0)) (PreH5 : (input_buffer_pre = in0)) (PreH6 : (data_length_pre = requested)) (PreH7 : (b_force_pre = force0)) (PreH8 : (0 <= requested)) (PreH9 : (requested <= UINT_MAX)) (PreH10 : (ca0 <> 0)) (PreH11 : (in0 <> 0)) (PreH12 : ((Zlength (input_contents)) = requested)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.full in0 requested input_contents )
|--
  (“ (ca0 <> 0) ” 
  &&  “ (in0 <> 0) ” 
  &&  “ (requested = 0) ” 
  &&  “ (CircularAreaErrorResult 1 ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.full in0 requested input_contents ))
  ||
  (“ (ca0 <> 0) ” 
  &&  “ (in0 <> 0) ” 
  &&  “ (force0 = 0) ” 
  &&  “ ((Zlength (logical)) = area_length) ” 
  &&  “ (CircularAreaErrorResult 1 ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
  **  (UCharArray.full in0 requested input_contents ))
.

Definition CircularAreaWrite_return_wit_7 := 
(
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (PreH1 : (input_buffer_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = ca0)) (PreH4 : (input_buffer_pre = in0)) (PreH5 : (data_length_pre = requested)) (PreH6 : (b_force_pre = force0)) (PreH7 : (0 <= requested)) (PreH8 : (requested <= UINT_MAX)) (PreH9 : (ca0 <> 0)) (PreH10 : (in0 = 0)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (ca0 <> 0) ” 
  &&  “ (in0 = 0) ” 
  &&  “ (CircularAreaErrorResult 1 ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource ca0 data_buffer readidx writeidx area_length b_status operations logical physical )
) \/
(
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (force0: Z) (requested: Z) (in0: Z) (ca0: Z) (PreH1 : (input_buffer_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = ca0)) (PreH4 : (input_buffer_pre = in0)) (PreH5 : (data_length_pre = requested)) (PreH6 : (b_force_pre = force0)) (PreH7 : (0 <= requested)) (PreH8 : (requested <= UINT_MAX)) (PreH9 : (ca0 <> 0)) (PreH10 : (in0 = 0)) ,
  TT && emp 
|--
  “ (CircularAreaErrorResult 1 ) ”
  &&  emp
).

Definition CircularAreaWrite_return_wit_7_split_goal_1 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (force0: Z) (requested: Z) (in0: Z) (ca0: Z) (PreH1 : (input_buffer_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = ca0)) (PreH4 : (input_buffer_pre = in0)) (PreH5 : (data_length_pre = requested)) (PreH6 : (b_force_pre = force0)) (PreH7 : (0 <= requested)) (PreH8 : (requested <= UINT_MAX)) (PreH9 : (ca0 <> 0)) (PreH10 : (in0 = 0)) ,
  (CircularAreaErrorResult 1 )
.

Definition CircularAreaWrite_return_wit_8 := 
(
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (force0: Z) (requested: Z) (in0: Z) (ca0: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (input_buffer_pre = in0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (b_force_pre = force0)) (PreH6 : (0 <= requested)) (PreH7 : (requested <= UINT_MAX)) (PreH8 : (ca0 = 0)) ,
  (GlobalStrings LitMap )
|--
  “ (ca0 = 0) ” 
  &&  “ (CircularAreaErrorResult 1 ) ”
  &&  (GlobalStrings LitMap )
) \/
(
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (force0: Z) (requested: Z) (in0: Z) (ca0: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (input_buffer_pre = in0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (b_force_pre = force0)) (PreH6 : (0 <= requested)) (PreH7 : (requested <= UINT_MAX)) (PreH8 : (ca0 = 0)) ,
  TT && emp 
|--
  “ (CircularAreaErrorResult 1 ) ”
  &&  emp
).

Definition CircularAreaWrite_return_wit_8_split_goal_1 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (force0: Z) (requested: Z) (in0: Z) (ca0: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (input_buffer_pre = in0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (b_force_pre = force0)) (PreH6 : (0 <= requested)) (PreH7 : (requested <= UINT_MAX)) (PreH8 : (ca0 = 0)) ,
  (CircularAreaErrorResult 1 )
.

Definition CircularAreaWrite_partial_solve_wit_1_pure := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (in0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : ((Zlength (input_contents)) = requested)) (PreH6 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> in0)
  **  ((( &( "data_length" ) )) # UInt  |-> requested)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.full in0 requested input_contents )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (ca0 = ca0) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
.

Definition CircularAreaWrite_partial_solve_wit_1_aux := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (in0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : ((Zlength (input_contents)) = requested)) (PreH6 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.full in0 requested input_contents )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (ca0 = ca0) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (in0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ ((Zlength (input_contents)) = requested) ” 
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
  **  (UCharArray.full in0 requested input_contents )
.

Definition CircularAreaWrite_partial_solve_wit_1 := CircularAreaWrite_partial_solve_wit_1_pure -> CircularAreaWrite_partial_solve_wit_1_aux.

Definition CircularAreaWrite_partial_solve_wit_2_pure := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (full_result: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (in0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaFullResult area_length logical full_result )) (PreH6 : ~(((full_result <> 0) /\ (force0 = 0)))) (PreH7 : ((force0 = 0) -> ((Zlength (logical)) < area_length))) (PreH8 : ((Zlength (input_contents)) = requested)) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "write_data_length" ) )) # UInt  |->_)
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> in0)
  **  ((( &( "data_length" ) )) # UInt  |-> requested)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.full in0 requested input_contents )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (ca0 = ca0) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
.

Definition CircularAreaWrite_partial_solve_wit_2_aux := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (full_result: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (in0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaFullResult area_length logical full_result )) (PreH6 : ~(((full_result <> 0) /\ (force0 = 0)))) (PreH7 : ((force0 = 0) -> ((Zlength (logical)) < area_length))) (PreH8 : ((Zlength (input_contents)) = requested)) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (UCharArray.full in0 requested input_contents )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (ca0 = ca0) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (in0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaFullResult area_length logical full_result ) ” 
  &&  “ ~(((full_result <> 0) /\ (force0 = 0))) ” 
  &&  “ ((force0 = 0) -> ((Zlength (logical)) < area_length)) ” 
  &&  “ ((Zlength (input_contents)) = requested) ” 
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
  **  (UCharArray.full in0 requested input_contents )
.

Definition CircularAreaWrite_partial_solve_wit_2 := CircularAreaWrite_partial_solve_wit_2_pure -> CircularAreaWrite_partial_solve_wit_2_aux.

Definition CircularAreaWrite_partial_solve_wit_3_pure := 
(
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (full_result: Z) (retval: Z) (PreH1 : (requested > (unsigned_last_nbits ((area_length - retval )) (32)))) (PreH2 : (ca0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (CircularAreaDataLengthResult logical retval )) (PreH5 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH6 : (ca0 <> 0)) (PreH7 : (in0 <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (requested > 0)) (PreH10 : (CircularAreaFullResult area_length logical full_result )) (PreH11 : ~(((full_result <> 0) /\ (force0 = 0)))) (PreH12 : ((force0 = 0) -> ((Zlength (logical)) < area_length))) (PreH13 : ((Zlength (input_contents)) = requested)) (PreH14 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
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
  **  ((( &( "write_data_length" ) )) # UInt  |-> (unsigned_last_nbits ((area_length - retval )) (32)))
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> in0)
  **  ((( &( "data_length" ) )) # UInt  |-> (unsigned_last_nbits ((area_length - retval )) (32)))
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  (UCharArray.full in0 requested input_contents )
|--
  “ (ca0 = ca0) ” 
  &&  “ ((unsigned_last_nbits ((area_length - retval )) (32)) = (unsigned_last_nbits ((area_length - retval )) (32))) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ” 
  &&  “ ((writeidx + (unsigned_last_nbits ((area_length - retval )) (32)) ) <= UINT_MAX) ” 
  &&  “ ((unsigned_last_nbits ((area_length - retval )) (32)) <= area_length) ” 
  &&  “ (0 <= (unsigned_last_nbits ((area_length - retval )) (32))) ”
) \/
(
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (full_result: Z) (retval: Z) (PreH1 : ((unsigned_last_nbits ((area_length - retval )) (32)) <= UINT_MAX)) (PreH2 : (area_length <= UINT_MAX)) (PreH3 : ((unsigned_last_nbits ((area_length - retval )) (32)) >= 0)) (PreH4 : (area_length >= 0)) (PreH5 : (force0 <= INT_MAX)) (PreH6 : (b_status <= INT_MAX)) (PreH7 : (force0 >= INT_MIN)) (PreH8 : (b_status >= INT_MIN)) (PreH9 : (requested > (unsigned_last_nbits ((area_length - retval )) (32)))) (PreH10 : (ca0 <> 0)) (PreH11 : (data_buffer <> 0)) (PreH12 : (CircularAreaDataLengthResult logical retval )) (PreH13 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH14 : (ca0 <> 0)) (PreH15 : (in0 <> 0)) (PreH16 : (data_buffer <> 0)) (PreH17 : (requested > 0)) (PreH18 : (CircularAreaFullResult area_length logical full_result )) (PreH19 : ~(((full_result <> 0) /\ (force0 = 0)))) (PreH20 : ((force0 = 0) -> ((Zlength (logical)) < area_length))) (PreH21 : ((Zlength (input_contents)) = requested)) (PreH22 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
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
  **  ((( &( "write_data_length" ) )) # UInt  |-> (unsigned_last_nbits ((area_length - retval )) (32)))
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> in0)
  **  ((( &( "data_length" ) )) # UInt  |-> (unsigned_last_nbits ((area_length - retval )) (32)))
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  (UCharArray.full in0 requested input_contents )
|--
  “ ((unsigned_last_nbits ((area_length - retval )) (32)) <= area_length) ” 
  &&  “ ((writeidx + (unsigned_last_nbits ((area_length - retval )) (32)) ) <= UINT_MAX) ”
).

Definition CircularAreaWrite_partial_solve_wit_3_pure_split_goal_1 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (full_result: Z) (retval: Z) (PreH1 : ((unsigned_last_nbits ((area_length - retval )) (32)) <= UINT_MAX)) (PreH2 : (area_length <= UINT_MAX)) (PreH3 : ((unsigned_last_nbits ((area_length - retval )) (32)) >= 0)) (PreH4 : (area_length >= 0)) (PreH5 : (force0 <= INT_MAX)) (PreH6 : (b_status <= INT_MAX)) (PreH7 : (force0 >= INT_MIN)) (PreH8 : (b_status >= INT_MIN)) (PreH9 : (requested > (unsigned_last_nbits ((area_length - retval )) (32)))) (PreH10 : (ca0 <> 0)) (PreH11 : (data_buffer <> 0)) (PreH12 : (CircularAreaDataLengthResult logical retval )) (PreH13 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH14 : (ca0 <> 0)) (PreH15 : (in0 <> 0)) (PreH16 : (data_buffer <> 0)) (PreH17 : (requested > 0)) (PreH18 : (CircularAreaFullResult area_length logical full_result )) (PreH19 : ~(((full_result <> 0) /\ (force0 = 0)))) (PreH20 : ((force0 = 0) -> ((Zlength (logical)) < area_length))) (PreH21 : ((Zlength (input_contents)) = requested)) (PreH22 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
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
  **  ((( &( "write_data_length" ) )) # UInt  |-> (unsigned_last_nbits ((area_length - retval )) (32)))
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> in0)
  **  ((( &( "data_length" ) )) # UInt  |-> (unsigned_last_nbits ((area_length - retval )) (32)))
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  (UCharArray.full in0 requested input_contents )
|--
  “ ((unsigned_last_nbits ((area_length - retval )) (32)) <= area_length) ”
.

Definition CircularAreaWrite_partial_solve_wit_3_pure_split_goal_2 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (full_result: Z) (retval: Z) (PreH1 : ((unsigned_last_nbits ((area_length - retval )) (32)) <= UINT_MAX)) (PreH2 : (area_length <= UINT_MAX)) (PreH3 : ((unsigned_last_nbits ((area_length - retval )) (32)) >= 0)) (PreH4 : (area_length >= 0)) (PreH5 : (force0 <= INT_MAX)) (PreH6 : (b_status <= INT_MAX)) (PreH7 : (force0 >= INT_MIN)) (PreH8 : (b_status >= INT_MIN)) (PreH9 : (requested > (unsigned_last_nbits ((area_length - retval )) (32)))) (PreH10 : (ca0 <> 0)) (PreH11 : (data_buffer <> 0)) (PreH12 : (CircularAreaDataLengthResult logical retval )) (PreH13 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH14 : (ca0 <> 0)) (PreH15 : (in0 <> 0)) (PreH16 : (data_buffer <> 0)) (PreH17 : (requested > 0)) (PreH18 : (CircularAreaFullResult area_length logical full_result )) (PreH19 : ~(((full_result <> 0) /\ (force0 = 0)))) (PreH20 : ((force0 = 0) -> ((Zlength (logical)) < area_length))) (PreH21 : ((Zlength (input_contents)) = requested)) (PreH22 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
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
  **  ((( &( "write_data_length" ) )) # UInt  |-> (unsigned_last_nbits ((area_length - retval )) (32)))
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> in0)
  **  ((( &( "data_length" ) )) # UInt  |-> (unsigned_last_nbits ((area_length - retval )) (32)))
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  (UCharArray.full in0 requested input_contents )
|--
  “ ((writeidx + (unsigned_last_nbits ((area_length - retval )) (32)) ) <= UINT_MAX) ”
.

Definition CircularAreaWrite_partial_solve_wit_3_aux := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (full_result: Z) (retval: Z) (PreH1 : (requested > (unsigned_last_nbits ((area_length - retval )) (32)))) (PreH2 : (ca0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (CircularAreaDataLengthResult logical retval )) (PreH5 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH6 : (ca0 <> 0)) (PreH7 : (in0 <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (requested > 0)) (PreH10 : (CircularAreaFullResult area_length logical full_result )) (PreH11 : ~(((full_result <> 0) /\ (force0 = 0)))) (PreH12 : ((force0 = 0) -> ((Zlength (logical)) < area_length))) (PreH13 : ((Zlength (input_contents)) = requested)) (PreH14 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
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
  **  (UCharArray.full in0 requested input_contents )
|--
  “ (ca0 = ca0) ” 
  &&  “ ((unsigned_last_nbits ((area_length - retval )) (32)) = (unsigned_last_nbits ((area_length - retval )) (32))) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ” 
  &&  “ ((writeidx + (unsigned_last_nbits ((area_length - retval )) (32)) ) <= UINT_MAX) ” 
  &&  “ ((unsigned_last_nbits ((area_length - retval )) (32)) <= area_length) ” 
  &&  “ (0 <= (unsigned_last_nbits ((area_length - retval )) (32))) ” 
  &&  “ (requested > (unsigned_last_nbits ((area_length - retval )) (32))) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaDataLengthResult logical retval ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (in0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaFullResult area_length logical full_result ) ” 
  &&  “ ~(((full_result <> 0) /\ (force0 = 0))) ” 
  &&  “ ((force0 = 0) -> ((Zlength (logical)) < area_length)) ” 
  &&  “ ((Zlength (input_contents)) = requested) ” 
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
  **  (UCharArray.full in0 requested input_contents )
.

Definition CircularAreaWrite_partial_solve_wit_3 := CircularAreaWrite_partial_solve_wit_3_pure -> CircularAreaWrite_partial_solve_wit_3_aux.

Definition CircularAreaWrite_partial_solve_wit_4_pure := 
(
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (full_result: Z) (retval: Z) (PreH1 : (requested <= (unsigned_last_nbits ((area_length - retval )) (32)))) (PreH2 : (ca0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (CircularAreaDataLengthResult logical retval )) (PreH5 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH6 : (ca0 <> 0)) (PreH7 : (in0 <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (requested > 0)) (PreH10 : (CircularAreaFullResult area_length logical full_result )) (PreH11 : ~(((full_result <> 0) /\ (force0 = 0)))) (PreH12 : ((force0 = 0) -> ((Zlength (logical)) < area_length))) (PreH13 : ((Zlength (input_contents)) = requested)) (PreH14 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
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
  **  ((( &( "write_data_length" ) )) # UInt  |-> (unsigned_last_nbits ((area_length - retval )) (32)))
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> in0)
  **  ((( &( "data_length" ) )) # UInt  |-> requested)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  (UCharArray.full in0 requested input_contents )
|--
  “ (ca0 = ca0) ” 
  &&  “ (requested = requested) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (0 <= requested) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ” 
  &&  “ ((writeidx + requested ) <= UINT_MAX) ” 
  &&  “ (requested <= area_length) ”
) \/
(
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (full_result: Z) (retval: Z) (PreH1 : (requested <= UINT_MAX)) (PreH2 : ((unsigned_last_nbits ((area_length - retval )) (32)) <= UINT_MAX)) (PreH3 : (area_length <= UINT_MAX)) (PreH4 : (requested >= 0)) (PreH5 : ((unsigned_last_nbits ((area_length - retval )) (32)) >= 0)) (PreH6 : (area_length >= 0)) (PreH7 : (force0 <= INT_MAX)) (PreH8 : (b_status <= INT_MAX)) (PreH9 : (force0 >= INT_MIN)) (PreH10 : (b_status >= INT_MIN)) (PreH11 : (requested <= (unsigned_last_nbits ((area_length - retval )) (32)))) (PreH12 : (ca0 <> 0)) (PreH13 : (data_buffer <> 0)) (PreH14 : (CircularAreaDataLengthResult logical retval )) (PreH15 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH16 : (ca0 <> 0)) (PreH17 : (in0 <> 0)) (PreH18 : (data_buffer <> 0)) (PreH19 : (requested > 0)) (PreH20 : (CircularAreaFullResult area_length logical full_result )) (PreH21 : ~(((full_result <> 0) /\ (force0 = 0)))) (PreH22 : ((force0 = 0) -> ((Zlength (logical)) < area_length))) (PreH23 : ((Zlength (input_contents)) = requested)) (PreH24 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
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
  **  ((( &( "write_data_length" ) )) # UInt  |-> (unsigned_last_nbits ((area_length - retval )) (32)))
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> in0)
  **  ((( &( "data_length" ) )) # UInt  |-> requested)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  (UCharArray.full in0 requested input_contents )
|--
  “ (requested <= area_length) ” 
  &&  “ ((writeidx + requested ) <= UINT_MAX) ”
).

Definition CircularAreaWrite_partial_solve_wit_4_pure_split_goal_1 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (full_result: Z) (retval: Z) (PreH1 : (requested <= UINT_MAX)) (PreH2 : ((unsigned_last_nbits ((area_length - retval )) (32)) <= UINT_MAX)) (PreH3 : (area_length <= UINT_MAX)) (PreH4 : (requested >= 0)) (PreH5 : ((unsigned_last_nbits ((area_length - retval )) (32)) >= 0)) (PreH6 : (area_length >= 0)) (PreH7 : (force0 <= INT_MAX)) (PreH8 : (b_status <= INT_MAX)) (PreH9 : (force0 >= INT_MIN)) (PreH10 : (b_status >= INT_MIN)) (PreH11 : (requested <= (unsigned_last_nbits ((area_length - retval )) (32)))) (PreH12 : (ca0 <> 0)) (PreH13 : (data_buffer <> 0)) (PreH14 : (CircularAreaDataLengthResult logical retval )) (PreH15 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH16 : (ca0 <> 0)) (PreH17 : (in0 <> 0)) (PreH18 : (data_buffer <> 0)) (PreH19 : (requested > 0)) (PreH20 : (CircularAreaFullResult area_length logical full_result )) (PreH21 : ~(((full_result <> 0) /\ (force0 = 0)))) (PreH22 : ((force0 = 0) -> ((Zlength (logical)) < area_length))) (PreH23 : ((Zlength (input_contents)) = requested)) (PreH24 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
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
  **  ((( &( "write_data_length" ) )) # UInt  |-> (unsigned_last_nbits ((area_length - retval )) (32)))
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> in0)
  **  ((( &( "data_length" ) )) # UInt  |-> requested)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  (UCharArray.full in0 requested input_contents )
|--
  “ (requested <= area_length) ”
.

Definition CircularAreaWrite_partial_solve_wit_4_pure_split_goal_2 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (full_result: Z) (retval: Z) (PreH1 : (requested <= UINT_MAX)) (PreH2 : ((unsigned_last_nbits ((area_length - retval )) (32)) <= UINT_MAX)) (PreH3 : (area_length <= UINT_MAX)) (PreH4 : (requested >= 0)) (PreH5 : ((unsigned_last_nbits ((area_length - retval )) (32)) >= 0)) (PreH6 : (area_length >= 0)) (PreH7 : (force0 <= INT_MAX)) (PreH8 : (b_status <= INT_MAX)) (PreH9 : (force0 >= INT_MIN)) (PreH10 : (b_status >= INT_MIN)) (PreH11 : (requested <= (unsigned_last_nbits ((area_length - retval )) (32)))) (PreH12 : (ca0 <> 0)) (PreH13 : (data_buffer <> 0)) (PreH14 : (CircularAreaDataLengthResult logical retval )) (PreH15 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH16 : (ca0 <> 0)) (PreH17 : (in0 <> 0)) (PreH18 : (data_buffer <> 0)) (PreH19 : (requested > 0)) (PreH20 : (CircularAreaFullResult area_length logical full_result )) (PreH21 : ~(((full_result <> 0) /\ (force0 = 0)))) (PreH22 : ((force0 = 0) -> ((Zlength (logical)) < area_length))) (PreH23 : ((Zlength (input_contents)) = requested)) (PreH24 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
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
  **  ((( &( "write_data_length" ) )) # UInt  |-> (unsigned_last_nbits ((area_length - retval )) (32)))
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> in0)
  **  ((( &( "data_length" ) )) # UInt  |-> requested)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  (UCharArray.full in0 requested input_contents )
|--
  “ ((writeidx + requested ) <= UINT_MAX) ”
.

Definition CircularAreaWrite_partial_solve_wit_4_aux := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (full_result: Z) (retval: Z) (PreH1 : (requested <= (unsigned_last_nbits ((area_length - retval )) (32)))) (PreH2 : (ca0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (CircularAreaDataLengthResult logical retval )) (PreH5 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH6 : (ca0 <> 0)) (PreH7 : (in0 <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (requested > 0)) (PreH10 : (CircularAreaFullResult area_length logical full_result )) (PreH11 : ~(((full_result <> 0) /\ (force0 = 0)))) (PreH12 : ((force0 = 0) -> ((Zlength (logical)) < area_length))) (PreH13 : ((Zlength (input_contents)) = requested)) (PreH14 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
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
  **  (UCharArray.full in0 requested input_contents )
|--
  “ (ca0 = ca0) ” 
  &&  “ (requested = requested) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (0 <= requested) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ” 
  &&  “ ((writeidx + requested ) <= UINT_MAX) ” 
  &&  “ (requested <= area_length) ” 
  &&  “ (requested <= (unsigned_last_nbits ((area_length - retval )) (32))) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaDataLengthResult logical retval ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (in0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaFullResult area_length logical full_result ) ” 
  &&  “ ~(((full_result <> 0) /\ (force0 = 0))) ” 
  &&  “ ((force0 = 0) -> ((Zlength (logical)) < area_length)) ” 
  &&  “ ((Zlength (input_contents)) = requested) ” 
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
  **  (UCharArray.full in0 requested input_contents )
.

Definition CircularAreaWrite_partial_solve_wit_4 := CircularAreaWrite_partial_solve_wit_4_pure -> CircularAreaWrite_partial_solve_wit_4_aux.

Definition CircularAreaWrite_partial_solve_wit_5_pure := 
(
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (write_len_up: Z) (write_len_down: Z) (write_data_length_addr_v: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (in0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH6 : ((Zlength (input_contents)) = requested)) (PreH7 : (0 <= data_length)) (PreH8 : (data_length <= requested)) (PreH9 : (0 <= writeidx)) (PreH10 : (writeidx < area_length)) (PreH11 : (write_len_up = (area_length - writeidx ))) (PreH12 : (write_len_down = (data_length - write_len_up ))) (PreH13 : (write_len_up <= data_length)) (PreH14 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH15 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> in0)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "write_len_up" ) )) # UInt  |-> write_len_up)
  **  ((( &( "write_len_down" ) )) # UInt  |-> write_len_down)
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx area_length (sublist (writeidx) (area_length) (physical)) )
  **  (UCharArray.seg in0 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg in0 write_len_up requested (sublist (write_len_up) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((data_buffer + (writeidx * sizeof(UCHAR))) = (data_buffer + writeidx )) ” 
  &&  “ (in0 = (in0 + 0 )) ” 
  &&  “ (write_len_up = (area_length - writeidx )) ” 
  &&  “ (write_len_up = (write_len_up - 0 )) ” 
  &&  “ ((Zlength ((sublist (0) (write_len_up) (input_contents)))) = (write_len_up - 0 )) ” 
  &&  “ ((Zlength ((sublist (0) ((area_length - writeidx )) (input_contents)))) = ((area_length - writeidx ) - 0 )) ” 
  &&  “ ((Zlength ((sublist (writeidx) (area_length) (physical)))) = (area_length - writeidx )) ”
) \/
(
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (write_len_up: Z) (write_len_down: Z) (write_data_length_addr_v: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (write_data_length_addr_v <= UINT_MAX)) (PreH3 : (write_len_down <= UINT_MAX)) (PreH4 : (write_len_up <= UINT_MAX)) (PreH5 : (data_length <= UINT_MAX)) (PreH6 : (area_length >= 0)) (PreH7 : (write_data_length_addr_v >= 0)) (PreH8 : (write_len_down >= 0)) (PreH9 : (write_len_up >= 0)) (PreH10 : (data_length >= 0)) (PreH11 : (b_status <= INT_MAX)) (PreH12 : (force0 <= INT_MAX)) (PreH13 : (b_status >= INT_MIN)) (PreH14 : (force0 >= INT_MIN)) (PreH15 : (ca0 <> 0)) (PreH16 : (in0 <> 0)) (PreH17 : (data_buffer <> 0)) (PreH18 : (requested > 0)) (PreH19 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH20 : ((Zlength (input_contents)) = requested)) (PreH21 : (0 <= data_length)) (PreH22 : (data_length <= requested)) (PreH23 : (0 <= writeidx)) (PreH24 : (writeidx < area_length)) (PreH25 : (write_len_up = (area_length - writeidx ))) (PreH26 : (write_len_down = (data_length - write_len_up ))) (PreH27 : (write_len_up <= data_length)) (PreH28 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH29 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> in0)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "write_len_up" ) )) # UInt  |-> write_len_up)
  **  ((( &( "write_len_down" ) )) # UInt  |-> write_len_down)
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx area_length (sublist (writeidx) (area_length) (physical)) )
  **  (UCharArray.seg in0 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg in0 write_len_up requested (sublist (write_len_up) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((Zlength ((sublist (writeidx) (area_length) (physical)))) = (area_length - writeidx )) ” 
  &&  “ ((Zlength ((sublist (0) ((area_length - writeidx )) (input_contents)))) = ((area_length - writeidx ) - 0 )) ” 
  &&  “ ((Zlength ((sublist (0) ((area_length - writeidx )) (input_contents)))) = ((area_length - writeidx ) - 0 )) ”
).

Definition CircularAreaWrite_partial_solve_wit_5_pure_split_goal_1 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (write_len_up: Z) (write_len_down: Z) (write_data_length_addr_v: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (write_data_length_addr_v <= UINT_MAX)) (PreH3 : (write_len_down <= UINT_MAX)) (PreH4 : (write_len_up <= UINT_MAX)) (PreH5 : (data_length <= UINT_MAX)) (PreH6 : (area_length >= 0)) (PreH7 : (write_data_length_addr_v >= 0)) (PreH8 : (write_len_down >= 0)) (PreH9 : (write_len_up >= 0)) (PreH10 : (data_length >= 0)) (PreH11 : (b_status <= INT_MAX)) (PreH12 : (force0 <= INT_MAX)) (PreH13 : (b_status >= INT_MIN)) (PreH14 : (force0 >= INT_MIN)) (PreH15 : (ca0 <> 0)) (PreH16 : (in0 <> 0)) (PreH17 : (data_buffer <> 0)) (PreH18 : (requested > 0)) (PreH19 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH20 : ((Zlength (input_contents)) = requested)) (PreH21 : (0 <= data_length)) (PreH22 : (data_length <= requested)) (PreH23 : (0 <= writeidx)) (PreH24 : (writeidx < area_length)) (PreH25 : (write_len_up = (area_length - writeidx ))) (PreH26 : (write_len_down = (data_length - write_len_up ))) (PreH27 : (write_len_up <= data_length)) (PreH28 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH29 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> in0)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "write_len_up" ) )) # UInt  |-> write_len_up)
  **  ((( &( "write_len_down" ) )) # UInt  |-> write_len_down)
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx area_length (sublist (writeidx) (area_length) (physical)) )
  **  (UCharArray.seg in0 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg in0 write_len_up requested (sublist (write_len_up) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((Zlength ((sublist (writeidx) (area_length) (physical)))) = (area_length - writeidx )) ”
.

Definition CircularAreaWrite_partial_solve_wit_5_pure_split_goal_2 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (write_len_up: Z) (write_len_down: Z) (write_data_length_addr_v: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (write_data_length_addr_v <= UINT_MAX)) (PreH3 : (write_len_down <= UINT_MAX)) (PreH4 : (write_len_up <= UINT_MAX)) (PreH5 : (data_length <= UINT_MAX)) (PreH6 : (area_length >= 0)) (PreH7 : (write_data_length_addr_v >= 0)) (PreH8 : (write_len_down >= 0)) (PreH9 : (write_len_up >= 0)) (PreH10 : (data_length >= 0)) (PreH11 : (b_status <= INT_MAX)) (PreH12 : (force0 <= INT_MAX)) (PreH13 : (b_status >= INT_MIN)) (PreH14 : (force0 >= INT_MIN)) (PreH15 : (ca0 <> 0)) (PreH16 : (in0 <> 0)) (PreH17 : (data_buffer <> 0)) (PreH18 : (requested > 0)) (PreH19 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH20 : ((Zlength (input_contents)) = requested)) (PreH21 : (0 <= data_length)) (PreH22 : (data_length <= requested)) (PreH23 : (0 <= writeidx)) (PreH24 : (writeidx < area_length)) (PreH25 : (write_len_up = (area_length - writeidx ))) (PreH26 : (write_len_down = (data_length - write_len_up ))) (PreH27 : (write_len_up <= data_length)) (PreH28 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH29 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> in0)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "write_len_up" ) )) # UInt  |-> write_len_up)
  **  ((( &( "write_len_down" ) )) # UInt  |-> write_len_down)
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx area_length (sublist (writeidx) (area_length) (physical)) )
  **  (UCharArray.seg in0 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg in0 write_len_up requested (sublist (write_len_up) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((Zlength ((sublist (0) ((area_length - writeidx )) (input_contents)))) = ((area_length - writeidx ) - 0 )) ”
.

Definition CircularAreaWrite_partial_solve_wit_5_pure_split_goal_3 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (write_len_up: Z) (write_len_down: Z) (write_data_length_addr_v: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (write_data_length_addr_v <= UINT_MAX)) (PreH3 : (write_len_down <= UINT_MAX)) (PreH4 : (write_len_up <= UINT_MAX)) (PreH5 : (data_length <= UINT_MAX)) (PreH6 : (area_length >= 0)) (PreH7 : (write_data_length_addr_v >= 0)) (PreH8 : (write_len_down >= 0)) (PreH9 : (write_len_up >= 0)) (PreH10 : (data_length >= 0)) (PreH11 : (b_status <= INT_MAX)) (PreH12 : (force0 <= INT_MAX)) (PreH13 : (b_status >= INT_MIN)) (PreH14 : (force0 >= INT_MIN)) (PreH15 : (ca0 <> 0)) (PreH16 : (in0 <> 0)) (PreH17 : (data_buffer <> 0)) (PreH18 : (requested > 0)) (PreH19 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH20 : ((Zlength (input_contents)) = requested)) (PreH21 : (0 <= data_length)) (PreH22 : (data_length <= requested)) (PreH23 : (0 <= writeidx)) (PreH24 : (writeidx < area_length)) (PreH25 : (write_len_up = (area_length - writeidx ))) (PreH26 : (write_len_down = (data_length - write_len_up ))) (PreH27 : (write_len_up <= data_length)) (PreH28 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH29 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> in0)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "write_len_up" ) )) # UInt  |-> write_len_up)
  **  ((( &( "write_len_down" ) )) # UInt  |-> write_len_down)
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx area_length (sublist (writeidx) (area_length) (physical)) )
  **  (UCharArray.seg in0 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg in0 write_len_up requested (sublist (write_len_up) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((Zlength ((sublist (0) ((area_length - writeidx )) (input_contents)))) = ((area_length - writeidx ) - 0 )) ”
.

Definition CircularAreaWrite_partial_solve_wit_5_aux := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (write_len_up: Z) (write_len_down: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (in0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH6 : ((Zlength (input_contents)) = requested)) (PreH7 : (0 <= data_length)) (PreH8 : (data_length <= requested)) (PreH9 : (0 <= writeidx)) (PreH10 : (writeidx < area_length)) (PreH11 : (write_len_up = (area_length - writeidx ))) (PreH12 : (write_len_down = (data_length - write_len_up ))) (PreH13 : (write_len_up <= data_length)) (PreH14 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH15 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx area_length (sublist (writeidx) (area_length) (physical)) )
  **  (UCharArray.seg in0 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg in0 write_len_up requested (sublist (write_len_up) (requested) (input_contents)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((data_buffer + (writeidx * sizeof(UCHAR))) = (data_buffer + writeidx )) ” 
  &&  “ (in0 = (in0 + 0 )) ” 
  &&  “ (write_len_up = (area_length - writeidx )) ” 
  &&  “ (write_len_up = (write_len_up - 0 )) ” 
  &&  “ ((Zlength ((sublist (0) (write_len_up) (input_contents)))) = (write_len_up - 0 )) ” 
  &&  “ ((Zlength ((sublist (0) ((area_length - writeidx )) (input_contents)))) = ((area_length - writeidx ) - 0 )) ” 
  &&  “ ((Zlength ((sublist (writeidx) (area_length) (physical)))) = (area_length - writeidx )) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (in0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaWriteLengthReady area_length requested logical data_length force0 ) ” 
  &&  “ ((Zlength (input_contents)) = requested) ” 
  &&  “ (0 <= data_length) ” 
  &&  “ (data_length <= requested) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ (writeidx < area_length) ” 
  &&  “ (write_len_up = (area_length - writeidx )) ” 
  &&  “ (write_len_down = (data_length - write_len_up )) ” 
  &&  “ (write_len_up <= data_length) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx data_length area_length 1 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
  &&  (UCharArray.mixed_seg data_buffer writeidx area_length (sublist (writeidx) (area_length) (physical)) )
  **  (UCharArray.seg in0 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.seg in0 write_len_up requested (sublist (write_len_up) (requested) (input_contents)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
.

Definition CircularAreaWrite_partial_solve_wit_5 := CircularAreaWrite_partial_solve_wit_5_pure -> CircularAreaWrite_partial_solve_wit_5_aux.

Definition CircularAreaWrite_partial_solve_wit_6_pure := 
(
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (write_len_down: Z) (write_len_up: Z) (write_data_length_addr_v: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (in0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH6 : ((Zlength (input_contents)) = requested)) (PreH7 : (0 <= write_len_down)) (PreH8 : (write_len_down <= writeidx)) (PreH9 : (write_len_up = (area_length - writeidx ))) (PreH10 : (write_len_down = (data_length - write_len_up ))) (PreH11 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH12 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> in0)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "write_len_down" ) )) # UInt  |-> write_len_down)
  **  ((( &( "write_len_up" ) )) # UInt  |-> write_len_up)
  **  (UCharArray.mixed_seg data_buffer 0 write_len_down (sublist (0) (write_len_down) (physical)) )
  **  (UCharArray.mixed_seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx area_length (CircularAreaSomeBytes ((sublist (0) (write_len_up) (input_contents)))) )
  **  (UCharArray.seg in0 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg in0 write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.seg in0 data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ (data_buffer = (data_buffer + 0 )) ” 
  &&  “ ((in0 + (write_len_up * sizeof(UCHAR))) = (in0 + write_len_up )) ” 
  &&  “ (write_len_down = (write_len_down - 0 )) ” 
  &&  “ (write_len_down = (data_length - write_len_up )) ” 
  &&  “ ((Zlength ((sublist (0) (write_len_down) (physical)))) = (write_len_down - 0 )) ” 
  &&  “ ((Zlength ((sublist (write_len_up) (data_length) (input_contents)))) = (data_length - write_len_up )) ” 
  &&  “ ((Zlength ((sublist ((area_length - writeidx )) (data_length) (input_contents)))) = (data_length - (area_length - writeidx ) )) ” 
  &&  “ ((Zlength ((sublist (0) ((data_length - write_len_up )) (physical)))) = ((data_length - write_len_up ) - 0 )) ”
) \/
(
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (write_len_down: Z) (write_len_up: Z) (write_data_length_addr_v: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (write_data_length_addr_v <= UINT_MAX)) (PreH3 : (write_len_up <= UINT_MAX)) (PreH4 : (write_len_down <= UINT_MAX)) (PreH5 : (data_length <= UINT_MAX)) (PreH6 : (area_length >= 0)) (PreH7 : (write_data_length_addr_v >= 0)) (PreH8 : (write_len_up >= 0)) (PreH9 : (write_len_down >= 0)) (PreH10 : (data_length >= 0)) (PreH11 : (b_status <= INT_MAX)) (PreH12 : (force0 <= INT_MAX)) (PreH13 : (b_status >= INT_MIN)) (PreH14 : (force0 >= INT_MIN)) (PreH15 : (ca0 <> 0)) (PreH16 : (in0 <> 0)) (PreH17 : (data_buffer <> 0)) (PreH18 : (requested > 0)) (PreH19 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH20 : ((Zlength (input_contents)) = requested)) (PreH21 : (0 <= write_len_down)) (PreH22 : (write_len_down <= writeidx)) (PreH23 : (write_len_up = (area_length - writeidx ))) (PreH24 : (write_len_down = (data_length - write_len_up ))) (PreH25 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH26 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> in0)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "write_len_down" ) )) # UInt  |-> write_len_down)
  **  ((( &( "write_len_up" ) )) # UInt  |-> write_len_up)
  **  (UCharArray.mixed_seg data_buffer 0 write_len_down (sublist (0) (write_len_down) (physical)) )
  **  (UCharArray.mixed_seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx area_length (CircularAreaSomeBytes ((sublist (0) (write_len_up) (input_contents)))) )
  **  (UCharArray.seg in0 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg in0 write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.seg in0 data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((Zlength ((sublist (0) ((data_length - (area_length - writeidx ) )) (physical)))) = ((data_length - (area_length - writeidx ) ) - 0 )) ” 
  &&  “ ((Zlength ((sublist ((area_length - writeidx )) (data_length) (input_contents)))) = (data_length - (area_length - writeidx ) )) ” 
  &&  “ ((Zlength ((sublist ((area_length - writeidx )) (data_length) (input_contents)))) = (data_length - (area_length - writeidx ) )) ” 
  &&  “ ((Zlength ((sublist (0) ((data_length - write_len_up )) (physical)))) = ((data_length - write_len_up ) - 0 )) ”
).

Definition CircularAreaWrite_partial_solve_wit_6_pure_split_goal_1 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (write_len_down: Z) (write_len_up: Z) (write_data_length_addr_v: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (write_data_length_addr_v <= UINT_MAX)) (PreH3 : (write_len_up <= UINT_MAX)) (PreH4 : (write_len_down <= UINT_MAX)) (PreH5 : (data_length <= UINT_MAX)) (PreH6 : (area_length >= 0)) (PreH7 : (write_data_length_addr_v >= 0)) (PreH8 : (write_len_up >= 0)) (PreH9 : (write_len_down >= 0)) (PreH10 : (data_length >= 0)) (PreH11 : (b_status <= INT_MAX)) (PreH12 : (force0 <= INT_MAX)) (PreH13 : (b_status >= INT_MIN)) (PreH14 : (force0 >= INT_MIN)) (PreH15 : (ca0 <> 0)) (PreH16 : (in0 <> 0)) (PreH17 : (data_buffer <> 0)) (PreH18 : (requested > 0)) (PreH19 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH20 : ((Zlength (input_contents)) = requested)) (PreH21 : (0 <= write_len_down)) (PreH22 : (write_len_down <= writeidx)) (PreH23 : (write_len_up = (area_length - writeidx ))) (PreH24 : (write_len_down = (data_length - write_len_up ))) (PreH25 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH26 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> in0)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "write_len_down" ) )) # UInt  |-> write_len_down)
  **  ((( &( "write_len_up" ) )) # UInt  |-> write_len_up)
  **  (UCharArray.mixed_seg data_buffer 0 write_len_down (sublist (0) (write_len_down) (physical)) )
  **  (UCharArray.mixed_seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx area_length (CircularAreaSomeBytes ((sublist (0) (write_len_up) (input_contents)))) )
  **  (UCharArray.seg in0 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg in0 write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.seg in0 data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((Zlength ((sublist (0) ((data_length - (area_length - writeidx ) )) (physical)))) = ((data_length - (area_length - writeidx ) ) - 0 )) ”
.

Definition CircularAreaWrite_partial_solve_wit_6_pure_split_goal_2 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (write_len_down: Z) (write_len_up: Z) (write_data_length_addr_v: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (write_data_length_addr_v <= UINT_MAX)) (PreH3 : (write_len_up <= UINT_MAX)) (PreH4 : (write_len_down <= UINT_MAX)) (PreH5 : (data_length <= UINT_MAX)) (PreH6 : (area_length >= 0)) (PreH7 : (write_data_length_addr_v >= 0)) (PreH8 : (write_len_up >= 0)) (PreH9 : (write_len_down >= 0)) (PreH10 : (data_length >= 0)) (PreH11 : (b_status <= INT_MAX)) (PreH12 : (force0 <= INT_MAX)) (PreH13 : (b_status >= INT_MIN)) (PreH14 : (force0 >= INT_MIN)) (PreH15 : (ca0 <> 0)) (PreH16 : (in0 <> 0)) (PreH17 : (data_buffer <> 0)) (PreH18 : (requested > 0)) (PreH19 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH20 : ((Zlength (input_contents)) = requested)) (PreH21 : (0 <= write_len_down)) (PreH22 : (write_len_down <= writeidx)) (PreH23 : (write_len_up = (area_length - writeidx ))) (PreH24 : (write_len_down = (data_length - write_len_up ))) (PreH25 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH26 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> in0)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "write_len_down" ) )) # UInt  |-> write_len_down)
  **  ((( &( "write_len_up" ) )) # UInt  |-> write_len_up)
  **  (UCharArray.mixed_seg data_buffer 0 write_len_down (sublist (0) (write_len_down) (physical)) )
  **  (UCharArray.mixed_seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx area_length (CircularAreaSomeBytes ((sublist (0) (write_len_up) (input_contents)))) )
  **  (UCharArray.seg in0 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg in0 write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.seg in0 data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((Zlength ((sublist ((area_length - writeidx )) (data_length) (input_contents)))) = (data_length - (area_length - writeidx ) )) ”
.

Definition CircularAreaWrite_partial_solve_wit_6_pure_split_goal_3 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (write_len_down: Z) (write_len_up: Z) (write_data_length_addr_v: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (write_data_length_addr_v <= UINT_MAX)) (PreH3 : (write_len_up <= UINT_MAX)) (PreH4 : (write_len_down <= UINT_MAX)) (PreH5 : (data_length <= UINT_MAX)) (PreH6 : (area_length >= 0)) (PreH7 : (write_data_length_addr_v >= 0)) (PreH8 : (write_len_up >= 0)) (PreH9 : (write_len_down >= 0)) (PreH10 : (data_length >= 0)) (PreH11 : (b_status <= INT_MAX)) (PreH12 : (force0 <= INT_MAX)) (PreH13 : (b_status >= INT_MIN)) (PreH14 : (force0 >= INT_MIN)) (PreH15 : (ca0 <> 0)) (PreH16 : (in0 <> 0)) (PreH17 : (data_buffer <> 0)) (PreH18 : (requested > 0)) (PreH19 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH20 : ((Zlength (input_contents)) = requested)) (PreH21 : (0 <= write_len_down)) (PreH22 : (write_len_down <= writeidx)) (PreH23 : (write_len_up = (area_length - writeidx ))) (PreH24 : (write_len_down = (data_length - write_len_up ))) (PreH25 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH26 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> in0)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "write_len_down" ) )) # UInt  |-> write_len_down)
  **  ((( &( "write_len_up" ) )) # UInt  |-> write_len_up)
  **  (UCharArray.mixed_seg data_buffer 0 write_len_down (sublist (0) (write_len_down) (physical)) )
  **  (UCharArray.mixed_seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx area_length (CircularAreaSomeBytes ((sublist (0) (write_len_up) (input_contents)))) )
  **  (UCharArray.seg in0 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg in0 write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.seg in0 data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((Zlength ((sublist ((area_length - writeidx )) (data_length) (input_contents)))) = (data_length - (area_length - writeidx ) )) ”
.

Definition CircularAreaWrite_partial_solve_wit_6_pure_split_goal_4 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (write_len_down: Z) (write_len_up: Z) (write_data_length_addr_v: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (write_data_length_addr_v <= UINT_MAX)) (PreH3 : (write_len_up <= UINT_MAX)) (PreH4 : (write_len_down <= UINT_MAX)) (PreH5 : (data_length <= UINT_MAX)) (PreH6 : (area_length >= 0)) (PreH7 : (write_data_length_addr_v >= 0)) (PreH8 : (write_len_up >= 0)) (PreH9 : (write_len_down >= 0)) (PreH10 : (data_length >= 0)) (PreH11 : (b_status <= INT_MAX)) (PreH12 : (force0 <= INT_MAX)) (PreH13 : (b_status >= INT_MIN)) (PreH14 : (force0 >= INT_MIN)) (PreH15 : (ca0 <> 0)) (PreH16 : (in0 <> 0)) (PreH17 : (data_buffer <> 0)) (PreH18 : (requested > 0)) (PreH19 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH20 : ((Zlength (input_contents)) = requested)) (PreH21 : (0 <= write_len_down)) (PreH22 : (write_len_down <= writeidx)) (PreH23 : (write_len_up = (area_length - writeidx ))) (PreH24 : (write_len_down = (data_length - write_len_up ))) (PreH25 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH26 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> in0)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "write_len_down" ) )) # UInt  |-> write_len_down)
  **  ((( &( "write_len_up" ) )) # UInt  |-> write_len_up)
  **  (UCharArray.mixed_seg data_buffer 0 write_len_down (sublist (0) (write_len_down) (physical)) )
  **  (UCharArray.mixed_seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx area_length (CircularAreaSomeBytes ((sublist (0) (write_len_up) (input_contents)))) )
  **  (UCharArray.seg in0 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg in0 write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.seg in0 data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((Zlength ((sublist (0) ((data_length - write_len_up )) (physical)))) = ((data_length - write_len_up ) - 0 )) ”
.

Definition CircularAreaWrite_partial_solve_wit_6_aux := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (write_len_down: Z) (write_len_up: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (in0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH6 : ((Zlength (input_contents)) = requested)) (PreH7 : (0 <= write_len_down)) (PreH8 : (write_len_down <= writeidx)) (PreH9 : (write_len_up = (area_length - writeidx ))) (PreH10 : (write_len_down = (data_length - write_len_up ))) (PreH11 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH12 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (UCharArray.mixed_seg data_buffer 0 write_len_down (sublist (0) (write_len_down) (physical)) )
  **  (UCharArray.mixed_seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx area_length (CircularAreaSomeBytes ((sublist (0) (write_len_up) (input_contents)))) )
  **  (UCharArray.seg in0 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg in0 write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.seg in0 data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ (data_buffer = (data_buffer + 0 )) ” 
  &&  “ ((in0 + (write_len_up * sizeof(UCHAR))) = (in0 + write_len_up )) ” 
  &&  “ (write_len_down = (write_len_down - 0 )) ” 
  &&  “ (write_len_down = (data_length - write_len_up )) ” 
  &&  “ ((Zlength ((sublist (0) (write_len_down) (physical)))) = (write_len_down - 0 )) ” 
  &&  “ ((Zlength ((sublist (write_len_up) (data_length) (input_contents)))) = (data_length - write_len_up )) ” 
  &&  “ ((Zlength ((sublist ((area_length - writeidx )) (data_length) (input_contents)))) = (data_length - (area_length - writeidx ) )) ” 
  &&  “ ((Zlength ((sublist (0) ((data_length - write_len_up )) (physical)))) = ((data_length - write_len_up ) - 0 )) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (in0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaWriteLengthReady area_length requested logical data_length force0 ) ” 
  &&  “ ((Zlength (input_contents)) = requested) ” 
  &&  “ (0 <= write_len_down) ” 
  &&  “ (write_len_down <= writeidx) ” 
  &&  “ (write_len_up = (area_length - writeidx )) ” 
  &&  “ (write_len_down = (data_length - write_len_up )) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx data_length area_length 1 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
  &&  (UCharArray.mixed_seg data_buffer 0 write_len_down (sublist (0) (write_len_down) (physical)) )
  **  (UCharArray.seg in0 write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.mixed_seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx area_length (CircularAreaSomeBytes ((sublist (0) (write_len_up) (input_contents)))) )
  **  (UCharArray.seg in0 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg in0 data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
.

Definition CircularAreaWrite_partial_solve_wit_6 := CircularAreaWrite_partial_solve_wit_6_pure -> CircularAreaWrite_partial_solve_wit_6_aux.

Definition CircularAreaWrite_partial_solve_wit_7_pure := 
(
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (write_data_length_addr_v: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (in0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH6 : ((Zlength (input_contents)) = requested)) (PreH7 : (0 <= data_length)) (PreH8 : (data_length <= requested)) (PreH9 : (0 <= writeidx)) (PreH10 : ((writeidx + data_length ) <= area_length)) (PreH11 : (CircularAreaDivideWrDataResult writeidx data_length area_length 0 )) (PreH12 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> in0)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx (writeidx + data_length ) (sublist (writeidx) ((writeidx + data_length )) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (writeidx + data_length ) area_length (sublist ((writeidx + data_length )) (area_length) (physical)) )
  **  (UCharArray.seg in0 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  (UCharArray.seg in0 data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((data_buffer + (writeidx * sizeof(UCHAR))) = (data_buffer + writeidx )) ” 
  &&  “ (in0 = (in0 + 0 )) ” 
  &&  “ (data_length = ((writeidx + data_length ) - writeidx )) ” 
  &&  “ (data_length = (data_length - 0 )) ” 
  &&  “ ((Zlength ((sublist (0) (data_length) (input_contents)))) = (data_length - 0 )) ” 
  &&  “ ((Zlength ((sublist (writeidx) ((writeidx + data_length )) (physical)))) = ((writeidx + data_length ) - writeidx )) ”
) \/
(
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (write_data_length_addr_v: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (write_data_length_addr_v <= UINT_MAX)) (PreH3 : (data_length <= UINT_MAX)) (PreH4 : (area_length >= 0)) (PreH5 : (write_data_length_addr_v >= 0)) (PreH6 : (data_length >= 0)) (PreH7 : (b_status <= INT_MAX)) (PreH8 : (force0 <= INT_MAX)) (PreH9 : (b_status >= INT_MIN)) (PreH10 : (force0 >= INT_MIN)) (PreH11 : (ca0 <> 0)) (PreH12 : (in0 <> 0)) (PreH13 : (data_buffer <> 0)) (PreH14 : (requested > 0)) (PreH15 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH16 : ((Zlength (input_contents)) = requested)) (PreH17 : (0 <= data_length)) (PreH18 : (data_length <= requested)) (PreH19 : (0 <= writeidx)) (PreH20 : ((writeidx + data_length ) <= area_length)) (PreH21 : (CircularAreaDivideWrDataResult writeidx data_length area_length 0 )) (PreH22 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> in0)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx (writeidx + data_length ) (sublist (writeidx) ((writeidx + data_length )) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (writeidx + data_length ) area_length (sublist ((writeidx + data_length )) (area_length) (physical)) )
  **  (UCharArray.seg in0 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  (UCharArray.seg in0 data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((Zlength ((sublist (writeidx) ((writeidx + data_length )) (physical)))) = ((writeidx + data_length ) - writeidx )) ” 
  &&  “ ((Zlength ((sublist (0) (data_length) (input_contents)))) = (data_length - 0 )) ”
).

Definition CircularAreaWrite_partial_solve_wit_7_pure_split_goal_1 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (write_data_length_addr_v: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (write_data_length_addr_v <= UINT_MAX)) (PreH3 : (data_length <= UINT_MAX)) (PreH4 : (area_length >= 0)) (PreH5 : (write_data_length_addr_v >= 0)) (PreH6 : (data_length >= 0)) (PreH7 : (b_status <= INT_MAX)) (PreH8 : (force0 <= INT_MAX)) (PreH9 : (b_status >= INT_MIN)) (PreH10 : (force0 >= INT_MIN)) (PreH11 : (ca0 <> 0)) (PreH12 : (in0 <> 0)) (PreH13 : (data_buffer <> 0)) (PreH14 : (requested > 0)) (PreH15 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH16 : ((Zlength (input_contents)) = requested)) (PreH17 : (0 <= data_length)) (PreH18 : (data_length <= requested)) (PreH19 : (0 <= writeidx)) (PreH20 : ((writeidx + data_length ) <= area_length)) (PreH21 : (CircularAreaDivideWrDataResult writeidx data_length area_length 0 )) (PreH22 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> in0)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx (writeidx + data_length ) (sublist (writeidx) ((writeidx + data_length )) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (writeidx + data_length ) area_length (sublist ((writeidx + data_length )) (area_length) (physical)) )
  **  (UCharArray.seg in0 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  (UCharArray.seg in0 data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((Zlength ((sublist (writeidx) ((writeidx + data_length )) (physical)))) = ((writeidx + data_length ) - writeidx )) ”
.

Definition CircularAreaWrite_partial_solve_wit_7_pure_split_goal_2 := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (write_data_length_addr_v: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (write_data_length_addr_v <= UINT_MAX)) (PreH3 : (data_length <= UINT_MAX)) (PreH4 : (area_length >= 0)) (PreH5 : (write_data_length_addr_v >= 0)) (PreH6 : (data_length >= 0)) (PreH7 : (b_status <= INT_MAX)) (PreH8 : (force0 <= INT_MAX)) (PreH9 : (b_status >= INT_MIN)) (PreH10 : (force0 >= INT_MIN)) (PreH11 : (ca0 <> 0)) (PreH12 : (in0 <> 0)) (PreH13 : (data_buffer <> 0)) (PreH14 : (requested > 0)) (PreH15 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH16 : ((Zlength (input_contents)) = requested)) (PreH17 : (0 <= data_length)) (PreH18 : (data_length <= requested)) (PreH19 : (0 <= writeidx)) (PreH20 : ((writeidx + data_length ) <= area_length)) (PreH21 : (CircularAreaDivideWrDataResult writeidx data_length area_length 0 )) (PreH22 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> in0)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx (writeidx + data_length ) (sublist (writeidx) ((writeidx + data_length )) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (writeidx + data_length ) area_length (sublist ((writeidx + data_length )) (area_length) (physical)) )
  **  (UCharArray.seg in0 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  (UCharArray.seg in0 data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((Zlength ((sublist (0) (data_length) (input_contents)))) = (data_length - 0 )) ”
.

Definition CircularAreaWrite_partial_solve_wit_7_aux := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (force0: Z) (requested: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (in0: Z) (ca0: Z) (data_length: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (in0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaWriteLengthReady area_length requested logical data_length force0 )) (PreH6 : ((Zlength (input_contents)) = requested)) (PreH7 : (0 <= data_length)) (PreH8 : (data_length <= requested)) (PreH9 : (0 <= writeidx)) (PreH10 : ((writeidx + data_length ) <= area_length)) (PreH11 : (CircularAreaDivideWrDataResult writeidx data_length area_length 0 )) (PreH12 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx (writeidx + data_length ) (sublist (writeidx) ((writeidx + data_length )) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (writeidx + data_length ) area_length (sublist ((writeidx + data_length )) (area_length) (physical)) )
  **  (UCharArray.seg in0 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  (UCharArray.seg in0 data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((data_buffer + (writeidx * sizeof(UCHAR))) = (data_buffer + writeidx )) ” 
  &&  “ (in0 = (in0 + 0 )) ” 
  &&  “ (data_length = ((writeidx + data_length ) - writeidx )) ” 
  &&  “ (data_length = (data_length - 0 )) ” 
  &&  “ ((Zlength ((sublist (0) (data_length) (input_contents)))) = (data_length - 0 )) ” 
  &&  “ ((Zlength ((sublist (writeidx) ((writeidx + data_length )) (physical)))) = ((writeidx + data_length ) - writeidx )) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (in0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaWriteLengthReady area_length requested logical data_length force0 ) ” 
  &&  “ ((Zlength (input_contents)) = requested) ” 
  &&  “ (0 <= data_length) ” 
  &&  “ (data_length <= requested) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ ((writeidx + data_length ) <= area_length) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx data_length area_length 0 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
  &&  (UCharArray.mixed_seg data_buffer writeidx (writeidx + data_length ) (sublist (writeidx) ((writeidx + data_length )) (physical)) )
  **  (UCharArray.seg in0 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (writeidx + data_length ) area_length (sublist ((writeidx + data_length )) (area_length) (physical)) )
  **  (UCharArray.seg in0 data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
.

Definition CircularAreaWrite_partial_solve_wit_7 := CircularAreaWrite_partial_solve_wit_7_pure -> CircularAreaWrite_partial_solve_wit_7_aux.

Module Type VC_Correct.

Include char_array_Strategy_Correct.

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
Axiom proof_of_CircularAreaDivideWrData_safety_wit_1 : CircularAreaDivideWrData_safety_wit_1.
Axiom proof_of_CircularAreaDivideWrData_safety_wit_2 : CircularAreaDivideWrData_safety_wit_2.
Axiom proof_of_CircularAreaDivideWrData_safety_wit_3 : CircularAreaDivideWrData_safety_wit_3.
Axiom proof_of_CircularAreaDivideWrData_safety_wit_4 : CircularAreaDivideWrData_safety_wit_4.
Axiom proof_of_CircularAreaDivideWrData_safety_wit_5 : CircularAreaDivideWrData_safety_wit_5.
Axiom proof_of_CircularAreaDivideWrData_entail_wit_1 : CircularAreaDivideWrData_entail_wit_1.
Axiom proof_of_CircularAreaDivideWrData_return_wit_1 : CircularAreaDivideWrData_return_wit_1.
Axiom proof_of_CircularAreaDivideWrData_return_wit_2 : CircularAreaDivideWrData_return_wit_2.
Axiom proof_of_CircularAreaWrite_safety_wit_1 : CircularAreaWrite_safety_wit_1.
Axiom proof_of_CircularAreaWrite_safety_wit_2 : CircularAreaWrite_safety_wit_2.
Axiom proof_of_CircularAreaWrite_safety_wit_3 : CircularAreaWrite_safety_wit_3.
Axiom proof_of_CircularAreaWrite_safety_wit_4 : CircularAreaWrite_safety_wit_4.
Axiom proof_of_CircularAreaWrite_safety_wit_5 : CircularAreaWrite_safety_wit_5.
Axiom proof_of_CircularAreaWrite_safety_wit_6 : CircularAreaWrite_safety_wit_6.
Axiom proof_of_CircularAreaWrite_safety_wit_7 : CircularAreaWrite_safety_wit_7.
Axiom proof_of_CircularAreaWrite_safety_wit_8 : CircularAreaWrite_safety_wit_8.
Axiom proof_of_CircularAreaWrite_safety_wit_9 : CircularAreaWrite_safety_wit_9.
Axiom proof_of_CircularAreaWrite_safety_wit_10 : CircularAreaWrite_safety_wit_10.
Axiom proof_of_CircularAreaWrite_safety_wit_11 : CircularAreaWrite_safety_wit_11.
Axiom proof_of_CircularAreaWrite_safety_wit_12 : CircularAreaWrite_safety_wit_12.
Axiom proof_of_CircularAreaWrite_safety_wit_13 : CircularAreaWrite_safety_wit_13.
Axiom proof_of_CircularAreaWrite_safety_wit_14 : CircularAreaWrite_safety_wit_14.
Axiom proof_of_CircularAreaWrite_safety_wit_15 : CircularAreaWrite_safety_wit_15.
Axiom proof_of_CircularAreaWrite_safety_wit_16 : CircularAreaWrite_safety_wit_16.
Axiom proof_of_CircularAreaWrite_safety_wit_17 : CircularAreaWrite_safety_wit_17.
Axiom proof_of_CircularAreaWrite_safety_wit_18 : CircularAreaWrite_safety_wit_18.
Axiom proof_of_CircularAreaWrite_safety_wit_19 : CircularAreaWrite_safety_wit_19.
Axiom proof_of_CircularAreaWrite_safety_wit_20 : CircularAreaWrite_safety_wit_20.
Axiom proof_of_CircularAreaWrite_safety_wit_21 : CircularAreaWrite_safety_wit_21.
Axiom proof_of_CircularAreaWrite_safety_wit_22 : CircularAreaWrite_safety_wit_22.
Axiom proof_of_CircularAreaWrite_safety_wit_23 : CircularAreaWrite_safety_wit_23.
Axiom proof_of_CircularAreaWrite_safety_wit_24 : CircularAreaWrite_safety_wit_24.
Axiom proof_of_CircularAreaWrite_safety_wit_25 : CircularAreaWrite_safety_wit_25.
Axiom proof_of_CircularAreaWrite_safety_wit_26 : CircularAreaWrite_safety_wit_26.
Axiom proof_of_CircularAreaWrite_entail_wit_1 : CircularAreaWrite_entail_wit_1.
Axiom proof_of_CircularAreaWrite_entail_wit_2_1 : CircularAreaWrite_entail_wit_2_1.
Axiom proof_of_CircularAreaWrite_entail_wit_2_2 : CircularAreaWrite_entail_wit_2_2.
Axiom proof_of_CircularAreaWrite_entail_wit_3_1 : CircularAreaWrite_entail_wit_3_1.
Axiom proof_of_CircularAreaWrite_entail_wit_3_2 : CircularAreaWrite_entail_wit_3_2.
Axiom proof_of_CircularAreaWrite_entail_wit_4 : CircularAreaWrite_entail_wit_4.
Axiom proof_of_CircularAreaWrite_entail_wit_5 : CircularAreaWrite_entail_wit_5.
Axiom proof_of_CircularAreaWrite_entail_wit_6_1 : CircularAreaWrite_entail_wit_6_1.
Axiom proof_of_CircularAreaWrite_entail_wit_6_2 : CircularAreaWrite_entail_wit_6_2.
Axiom proof_of_CircularAreaWrite_return_wit_1 : CircularAreaWrite_return_wit_1.
Axiom proof_of_CircularAreaWrite_return_wit_2 : CircularAreaWrite_return_wit_2.
Axiom proof_of_CircularAreaWrite_return_wit_3 : CircularAreaWrite_return_wit_3.
Axiom proof_of_CircularAreaWrite_return_wit_4 : CircularAreaWrite_return_wit_4.
Axiom proof_of_CircularAreaWrite_return_wit_5 : CircularAreaWrite_return_wit_5.
Axiom proof_of_CircularAreaWrite_return_wit_6 : CircularAreaWrite_return_wit_6.
Axiom proof_of_CircularAreaWrite_return_wit_7 : CircularAreaWrite_return_wit_7.
Axiom proof_of_CircularAreaWrite_return_wit_8 : CircularAreaWrite_return_wit_8.
Axiom proof_of_CircularAreaWrite_partial_solve_wit_1_pure : CircularAreaWrite_partial_solve_wit_1_pure.
Axiom proof_of_CircularAreaWrite_partial_solve_wit_1 : CircularAreaWrite_partial_solve_wit_1.
Axiom proof_of_CircularAreaWrite_partial_solve_wit_2_pure : CircularAreaWrite_partial_solve_wit_2_pure.
Axiom proof_of_CircularAreaWrite_partial_solve_wit_2 : CircularAreaWrite_partial_solve_wit_2.
Axiom proof_of_CircularAreaWrite_partial_solve_wit_3_pure : CircularAreaWrite_partial_solve_wit_3_pure.
Axiom proof_of_CircularAreaWrite_partial_solve_wit_3 : CircularAreaWrite_partial_solve_wit_3.
Axiom proof_of_CircularAreaWrite_partial_solve_wit_4_pure : CircularAreaWrite_partial_solve_wit_4_pure.
Axiom proof_of_CircularAreaWrite_partial_solve_wit_4 : CircularAreaWrite_partial_solve_wit_4.
Axiom proof_of_CircularAreaWrite_partial_solve_wit_5_pure : CircularAreaWrite_partial_solve_wit_5_pure.
Axiom proof_of_CircularAreaWrite_partial_solve_wit_5 : CircularAreaWrite_partial_solve_wit_5.
Axiom proof_of_CircularAreaWrite_partial_solve_wit_6_pure : CircularAreaWrite_partial_solve_wit_6_pure.
Axiom proof_of_CircularAreaWrite_partial_solve_wit_6 : CircularAreaWrite_partial_solve_wit_6.
Axiom proof_of_CircularAreaWrite_partial_solve_wit_7_pure : CircularAreaWrite_partial_solve_wit_7_pure.
Axiom proof_of_CircularAreaWrite_partial_solve_wit_7 : CircularAreaWrite_partial_solve_wit_7.

End VC_Correct.
