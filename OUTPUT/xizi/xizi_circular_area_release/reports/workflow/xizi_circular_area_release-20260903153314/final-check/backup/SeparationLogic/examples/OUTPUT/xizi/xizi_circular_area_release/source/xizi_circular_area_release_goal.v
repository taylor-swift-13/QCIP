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
Require Import SimpleC.EE.OUTPUT.xizi.xizi_circular_area_release.source.xizi_circular_area_release_lib.
Local Open Scope sac.

(*----- Function CircularAreaRelease -----*)

Definition CircularAreaRelease_safety_wit_1 := 
forall (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (circular_area: Z) (circular_area_p_tail: Z) (PreH1 : (circular_area <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH4 : (circular_area_p_tail = (data_buffer + area_length ))) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> circular_area_p_tail)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer area_length physical )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRelease_safety_wit_2 := 
forall (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (circular_area: Z) (circular_area_p_tail: Z) (PreH1 : (circular_area <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH4 : (circular_area_p_tail = (data_buffer + area_length ))) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> circular_area_p_tail)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer area_length physical )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRelease_safety_wit_3 := 
forall (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (circular_area: Z) (circular_area_p_tail: Z) (PreH1 : (circular_area <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH4 : (circular_area_p_tail = (data_buffer + area_length ))) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> circular_area_p_tail)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer area_length physical )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRelease_safety_wit_4 := 
forall (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (circular_area: Z) (circular_area_p_tail: Z) (PreH1 : (circular_area <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH4 : (circular_area_p_tail = (data_buffer + area_length ))) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> circular_area_p_tail)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer area_length physical )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRelease_safety_wit_5 := 
forall (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (circular_area: Z) (circular_area_p_tail: Z) (PreH1 : (circular_area <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH4 : (circular_area_p_tail = (data_buffer + area_length ))) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer area_length physical )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRelease_safety_wit_6 := 
forall (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (circular_area: Z) (circular_area_p_tail: Z) (PreH1 : (circular_area <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH4 : (circular_area_p_tail = (data_buffer + area_length ))) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer area_length physical )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRelease_entail_wit_1 := 
(
forall (circular_area_pre: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) ,
  (CircularAreaBackingResource circular_area_pre data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  EX (circular_area_p_tail: Z) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ” 
  &&  “ (circular_area_p_tail = (data_buffer + area_length )) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> circular_area_p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer area_length physical )
) \/
(
forall (circular_area_pre: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) ,
  (CircularAreaBackingResource circular_area_pre data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (circular_area_pre <> 0) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer area_length physical )
).

Definition CircularAreaRelease_entail_wit_1_split_goal_1 := 
forall (circular_area_pre: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) ,
  (CircularAreaBackingResource circular_area_pre data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
.

Definition CircularAreaRelease_entail_wit_1_split_goal_2 := 
forall (circular_area_pre: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) ,
  (CircularAreaBackingResource circular_area_pre data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (data_buffer <> 0) ”
.

Definition CircularAreaRelease_entail_wit_1_split_goal_3 := 
forall (circular_area_pre: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) ,
  (CircularAreaBackingResource circular_area_pre data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (circular_area_pre <> 0) ”
.

Definition CircularAreaRelease_entail_wit_1_split_goal_spatial := 
forall (circular_area_pre: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) ,
  (CircularAreaBackingResource circular_area_pre data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer area_length physical )
.

Definition CircularAreaRelease_return_wit_1 := 
forall (physical: (@list (@option Z))) (logical: (@list Z)) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (circular_area: Z) (circular_area_p_tail: Z) (PreH1 : (circular_area <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH4 : (circular_area_p_tail = (data_buffer + area_length ))) ,
  TT && emp 
|--
  TT && emp 
.

Definition CircularAreaRelease_partial_solve_wit_1_pure := 
forall (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (circular_area: Z) (circular_area_p_tail: Z) (PreH1 : (circular_area <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH4 : (circular_area_p_tail = (data_buffer + area_length ))) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer area_length physical )
|--
  “ (data_buffer = data_buffer) ” 
  &&  “ (data_buffer <> 0) ”
.

Definition CircularAreaRelease_partial_solve_wit_1_aux := 
forall (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (circular_area: Z) (circular_area_p_tail: Z) (PreH1 : (circular_area <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH4 : (circular_area_p_tail = (data_buffer + area_length ))) ,
  ((&((circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer area_length physical )
|--
  “ (data_buffer = data_buffer) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (circular_area <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ” 
  &&  “ (circular_area_p_tail = (data_buffer + area_length )) ”
  &&  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
.

Definition CircularAreaRelease_partial_solve_wit_1 := CircularAreaRelease_partial_solve_wit_1_pure -> CircularAreaRelease_partial_solve_wit_1_aux.

Definition CircularAreaRelease_partial_solve_wit_2_pure := 
forall (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (circular_area: Z) (circular_area_p_tail: Z) (PreH1 : (circular_area <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH4 : (circular_area_p_tail = (data_buffer + area_length ))) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (circular_area = circular_area) ” 
  &&  “ (circular_area <> 0) ” 
  &&  “ (0 = 0) ” 
  &&  “ (0 = 0) ” 
  &&  “ (0 = 0) ” 
  &&  “ (0 = 0) ” 
  &&  “ (0 = 0) ” 
  &&  “ (0 = 0) ”
.

Definition CircularAreaRelease_partial_solve_wit_2_aux := 
forall (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (circular_area: Z) (circular_area_p_tail: Z) (PreH1 : (circular_area <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH4 : (circular_area_p_tail = (data_buffer + area_length ))) ,
  ((&((circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (circular_area = circular_area) ” 
  &&  “ (circular_area <> 0) ” 
  &&  “ (0 = 0) ” 
  &&  “ (0 = 0) ” 
  &&  “ (0 = 0) ” 
  &&  “ (0 = 0) ” 
  &&  “ (0 = 0) ” 
  &&  “ (0 = 0) ” 
  &&  “ (circular_area <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ” 
  &&  “ (circular_area_p_tail = (data_buffer + area_length )) ”
  &&  ((&((circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
.

Definition CircularAreaRelease_partial_solve_wit_2 := CircularAreaRelease_partial_solve_wit_2_pure -> CircularAreaRelease_partial_solve_wit_2_aux.

Module Type VC_Correct.


Axiom proof_of_CircularAreaRelease_safety_wit_1 : CircularAreaRelease_safety_wit_1.
Axiom proof_of_CircularAreaRelease_safety_wit_2 : CircularAreaRelease_safety_wit_2.
Axiom proof_of_CircularAreaRelease_safety_wit_3 : CircularAreaRelease_safety_wit_3.
Axiom proof_of_CircularAreaRelease_safety_wit_4 : CircularAreaRelease_safety_wit_4.
Axiom proof_of_CircularAreaRelease_safety_wit_5 : CircularAreaRelease_safety_wit_5.
Axiom proof_of_CircularAreaRelease_safety_wit_6 : CircularAreaRelease_safety_wit_6.
Axiom proof_of_CircularAreaRelease_entail_wit_1 : CircularAreaRelease_entail_wit_1.
Axiom proof_of_CircularAreaRelease_return_wit_1 : CircularAreaRelease_return_wit_1.
Axiom proof_of_CircularAreaRelease_partial_solve_wit_1_pure : CircularAreaRelease_partial_solve_wit_1_pure.
Axiom proof_of_CircularAreaRelease_partial_solve_wit_1 : CircularAreaRelease_partial_solve_wit_1.
Axiom proof_of_CircularAreaRelease_partial_solve_wit_2_pure : CircularAreaRelease_partial_solve_wit_2_pure.
Axiom proof_of_CircularAreaRelease_partial_solve_wit_2 : CircularAreaRelease_partial_solve_wit_2.

End VC_Correct.
