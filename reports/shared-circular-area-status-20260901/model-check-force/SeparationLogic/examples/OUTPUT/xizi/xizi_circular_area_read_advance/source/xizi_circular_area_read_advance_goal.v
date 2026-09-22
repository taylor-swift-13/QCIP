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
forall (data_length_pre: Z) (circular_area_pre: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (entry_data_length: Z) (entry_circular_area: Z) (PreH1 : (circular_area_pre = entry_circular_area)) (PreH2 : (data_length_pre = entry_data_length)) (PreH3 : (entry_circular_area <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (0 <= entry_data_length)) (PreH6 : (entry_data_length <= area_length)) (PreH7 : ((readidx + entry_data_length ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaDivideRdData_safety_wit_2 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (entry_data_length: Z) (entry_circular_area: Z) (PreH1 : (circular_area_pre = entry_circular_area)) (PreH2 : (data_length_pre = entry_data_length)) (PreH3 : (entry_circular_area = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaDivideRdData_safety_wit_3 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (entry_data_length: Z) (entry_circular_area: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = entry_circular_area)) (PreH3 : (data_length_pre = entry_data_length)) (PreH4 : (entry_circular_area <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (0 <= entry_data_length)) (PreH7 : (entry_data_length <= area_length)) (PreH8 : ((readidx + entry_data_length ) <= UINT_MAX)) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ False ”
.

Definition CircularAreaDivideRdData_safety_wit_4 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (entry_data_length: Z) (entry_circular_area: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = entry_circular_area)) (PreH3 : (data_length_pre = entry_data_length)) (PreH4 : (entry_circular_area = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
|--
  “ False ”
.

Definition CircularAreaDivideRdData_safety_wit_5 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (entry_data_length: Z) (entry_circular_area: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = entry_circular_area)) (PreH3 : (data_length_pre = entry_data_length)) (PreH4 : (entry_circular_area = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaDivideRdData_safety_wit_6 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (entry_data_length: Z) (entry_circular_area: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = entry_circular_area)) (PreH3 : (data_length_pre = entry_data_length)) (PreH4 : (entry_circular_area <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (0 <= entry_data_length)) (PreH7 : (entry_data_length <= area_length)) (PreH8 : ((readidx + entry_data_length ) <= UINT_MAX)) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaDivideRdData_safety_wit_7 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (entry_data_length: Z) (entry_circular_area: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + data_length_pre )) (32)) <= area_length)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = entry_circular_area)) (PreH4 : (data_length_pre = entry_data_length)) (PreH5 : (entry_circular_area <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : (0 <= entry_data_length)) (PreH8 : (entry_data_length <= area_length)) (PreH9 : ((readidx + entry_data_length ) <= UINT_MAX)) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaDivideRdData_safety_wit_8 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (entry_data_length: Z) (entry_circular_area: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + data_length_pre )) (32)) > area_length)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = entry_circular_area)) (PreH4 : (data_length_pre = entry_data_length)) (PreH5 : (entry_circular_area <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : (0 <= entry_data_length)) (PreH8 : (entry_data_length <= area_length)) (PreH9 : ((readidx + entry_data_length ) <= UINT_MAX)) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaDivideRdData_entail_wit_1 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (entry_data_length: Z) (entry_circular_area: Z) (PreH1 : (circular_area_pre = entry_circular_area)) (PreH2 : (data_length_pre = entry_data_length)) ,
  (CircularAreaDivideRdDataInput entry_circular_area data_buffer readidx writeidx area_length b_status operations entry_data_length logical physical )
|--
  (“ (circular_area_pre = entry_circular_area) ” 
  &&  “ (data_length_pre = entry_data_length) ” 
  &&  “ (entry_circular_area <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (0 <= entry_data_length) ” 
  &&  “ (entry_data_length <= area_length) ” 
  &&  “ ((readidx + entry_data_length ) <= UINT_MAX) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
  &&  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations))
  ||
  (“ (circular_area_pre = entry_circular_area) ” 
  &&  “ (data_length_pre = entry_data_length) ” 
  &&  “ (entry_circular_area = 0) ”
  &&  emp)
.

Definition CircularAreaDivideRdData_return_wit_1 := 
(
forall (data_length_pre: Z) (circular_area_pre: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (entry_data_length: Z) (entry_circular_area: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + data_length_pre )) (32)) > area_length)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = entry_circular_area)) (PreH4 : (data_length_pre = entry_data_length)) (PreH5 : (entry_circular_area <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : (0 <= entry_data_length)) (PreH8 : (entry_data_length <= area_length)) (PreH9 : ((readidx + entry_data_length ) <= UINT_MAX)) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (circular_area_pre = entry_circular_area) ” 
  &&  “ (data_length_pre = entry_data_length) ” 
  &&  “ (entry_circular_area <> 0) ” 
  &&  “ (0 <= entry_data_length) ” 
  &&  “ (entry_data_length <= area_length) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx entry_data_length area_length 1 ) ”
  &&  (CircularAreaBackingResource entry_circular_area data_buffer readidx writeidx area_length b_status operations logical physical )
) \/
(
forall (data_length_pre: Z) (circular_area_pre: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (entry_data_length: Z) (entry_circular_area: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + data_length_pre )) (32)) > area_length)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (circular_area_pre = entry_circular_area)) (PreH8 : (data_length_pre = entry_data_length)) (PreH9 : (entry_circular_area <> 0)) (PreH10 : (data_buffer <> 0)) (PreH11 : (0 <= entry_data_length)) (PreH12 : (entry_data_length <= area_length)) (PreH13 : ((readidx + entry_data_length ) <= UINT_MAX)) (PreH14 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaDivideRdDataResult readidx data_length_pre area_length 1 ) ”
  &&  (CircularAreaBackingResource entry_circular_area data_buffer readidx writeidx area_length b_status operations logical physical )
).

Definition CircularAreaDivideRdData_return_wit_1_split_goal_1 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (entry_data_length: Z) (entry_circular_area: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + data_length_pre )) (32)) > area_length)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (circular_area_pre = entry_circular_area)) (PreH8 : (data_length_pre = entry_data_length)) (PreH9 : (entry_circular_area <> 0)) (PreH10 : (data_buffer <> 0)) (PreH11 : (0 <= entry_data_length)) (PreH12 : (entry_data_length <= area_length)) (PreH13 : ((readidx + entry_data_length ) <= UINT_MAX)) (PreH14 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaDivideRdDataResult readidx data_length_pre area_length 1 ) ”
.

Definition CircularAreaDivideRdData_return_wit_1_split_goal_spatial := 
forall (data_length_pre: Z) (circular_area_pre: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (entry_data_length: Z) (entry_circular_area: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + data_length_pre )) (32)) > area_length)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (circular_area_pre = entry_circular_area)) (PreH8 : (data_length_pre = entry_data_length)) (PreH9 : (entry_circular_area <> 0)) (PreH10 : (data_buffer <> 0)) (PreH11 : (0 <= entry_data_length)) (PreH12 : (entry_data_length <= area_length)) (PreH13 : ((readidx + entry_data_length ) <= UINT_MAX)) (PreH14 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  (CircularAreaBackingResource entry_circular_area data_buffer readidx writeidx area_length b_status operations logical physical )
.

Definition CircularAreaDivideRdData_return_wit_2 := 
(
forall (data_length_pre: Z) (circular_area_pre: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (entry_data_length: Z) (entry_circular_area: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + data_length_pre )) (32)) <= area_length)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = entry_circular_area)) (PreH4 : (data_length_pre = entry_data_length)) (PreH5 : (entry_circular_area <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : (0 <= entry_data_length)) (PreH8 : (entry_data_length <= area_length)) (PreH9 : ((readidx + entry_data_length ) <= UINT_MAX)) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (circular_area_pre = entry_circular_area) ” 
  &&  “ (data_length_pre = entry_data_length) ” 
  &&  “ (entry_circular_area <> 0) ” 
  &&  “ (0 <= entry_data_length) ” 
  &&  “ (entry_data_length <= area_length) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx entry_data_length area_length 0 ) ”
  &&  (CircularAreaBackingResource entry_circular_area data_buffer readidx writeidx area_length b_status operations logical physical )
) \/
(
forall (data_length_pre: Z) (circular_area_pre: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (entry_data_length: Z) (entry_circular_area: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + data_length_pre )) (32)) <= area_length)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (circular_area_pre = entry_circular_area)) (PreH8 : (data_length_pre = entry_data_length)) (PreH9 : (entry_circular_area <> 0)) (PreH10 : (data_buffer <> 0)) (PreH11 : (0 <= entry_data_length)) (PreH12 : (entry_data_length <= area_length)) (PreH13 : ((readidx + entry_data_length ) <= UINT_MAX)) (PreH14 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaDivideRdDataResult readidx data_length_pre area_length 0 ) ”
  &&  (CircularAreaBackingResource entry_circular_area data_buffer readidx writeidx area_length b_status operations logical physical )
).

Definition CircularAreaDivideRdData_return_wit_2_split_goal_1 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (entry_data_length: Z) (entry_circular_area: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + data_length_pre )) (32)) <= area_length)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (circular_area_pre = entry_circular_area)) (PreH8 : (data_length_pre = entry_data_length)) (PreH9 : (entry_circular_area <> 0)) (PreH10 : (data_buffer <> 0)) (PreH11 : (0 <= entry_data_length)) (PreH12 : (entry_data_length <= area_length)) (PreH13 : ((readidx + entry_data_length ) <= UINT_MAX)) (PreH14 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaDivideRdDataResult readidx data_length_pre area_length 0 ) ”
.

Definition CircularAreaDivideRdData_return_wit_2_split_goal_spatial := 
forall (data_length_pre: Z) (circular_area_pre: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (entry_data_length: Z) (entry_circular_area: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + data_length_pre )) (32)) <= area_length)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (circular_area_pre = entry_circular_area)) (PreH8 : (data_length_pre = entry_data_length)) (PreH9 : (entry_circular_area <> 0)) (PreH10 : (data_buffer <> 0)) (PreH11 : (0 <= entry_data_length)) (PreH12 : (entry_data_length <= area_length)) (PreH13 : ((readidx + entry_data_length ) <= UINT_MAX)) (PreH14 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  (CircularAreaBackingResource entry_circular_area data_buffer readidx writeidx area_length b_status operations logical physical )
.

Definition CircularAreaDivideRdData_return_wit_3 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (entry_data_length: Z) (entry_circular_area: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = entry_circular_area)) (PreH3 : (data_length_pre = entry_data_length)) (PreH4 : (entry_circular_area = 0)) ,
  TT && emp 
|--
  “ (circular_area_pre = entry_circular_area) ” 
  &&  “ (data_length_pre = entry_data_length) ” 
  &&  “ (entry_circular_area = 0) ” 
  &&  “ (1 = 1) ”
  &&  emp
.

Definition CircularAreaDivideRdData_partial_solve_wit_1 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (entry_data_length: Z) (entry_circular_area: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = entry_circular_area)) (PreH3 : (data_length_pre = entry_data_length)) (PreH4 : (entry_circular_area <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (0 <= entry_data_length)) (PreH7 : (entry_data_length <= area_length)) (PreH8 : ((readidx + entry_data_length ) <= UINT_MAX)) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre = entry_circular_area) ” 
  &&  “ (data_length_pre = entry_data_length) ” 
  &&  “ (entry_circular_area <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (0 <= entry_data_length) ” 
  &&  “ (entry_data_length <= area_length) ” 
  &&  “ ((readidx + entry_data_length ) <= UINT_MAX) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
.

Definition CircularAreaDivideRdData_partial_solve_wit_2 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (entry_data_length: Z) (entry_circular_area: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = entry_circular_area)) (PreH3 : (data_length_pre = entry_data_length)) (PreH4 : (entry_circular_area <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (0 <= entry_data_length)) (PreH7 : (entry_data_length <= area_length)) (PreH8 : ((readidx + entry_data_length ) <= UINT_MAX)) (PreH9 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre = entry_circular_area) ” 
  &&  “ (data_length_pre = entry_data_length) ” 
  &&  “ (entry_circular_area <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (0 <= entry_data_length) ” 
  &&  “ (entry_data_length <= area_length) ” 
  &&  “ ((readidx + entry_data_length ) <= UINT_MAX) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
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
Axiom proof_of_CircularAreaDivideRdData_entail_wit_1 : CircularAreaDivideRdData_entail_wit_1.
Axiom proof_of_CircularAreaDivideRdData_return_wit_1 : CircularAreaDivideRdData_return_wit_1.
Axiom proof_of_CircularAreaDivideRdData_return_wit_2 : CircularAreaDivideRdData_return_wit_2.
Axiom proof_of_CircularAreaDivideRdData_return_wit_3 : CircularAreaDivideRdData_return_wit_3.
Axiom proof_of_CircularAreaDivideRdData_partial_solve_wit_1 : CircularAreaDivideRdData_partial_solve_wit_1.
Axiom proof_of_CircularAreaDivideRdData_partial_solve_wit_2 : CircularAreaDivideRdData_partial_solve_wit_2.

End VC_Correct.
