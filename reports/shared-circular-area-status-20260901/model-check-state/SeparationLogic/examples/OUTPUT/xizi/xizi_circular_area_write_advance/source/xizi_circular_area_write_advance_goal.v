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
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (entry_data_length: Z) (entry_circular_area: Z) (PreH1 : (circular_area_pre = entry_circular_area)) (PreH2 : (data_length_pre = entry_data_length)) (PreH3 : (entry_circular_area = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaDivideWrData_safety_wit_2 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (circular_area_operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (entry_data_length: Z) (entry_circular_area: Z) (data_buffer: Z) (PreH1 : (circular_area_pre = entry_circular_area)) (PreH2 : (data_length_pre = entry_data_length)) (PreH3 : (entry_circular_area <> 0)) (PreH4 : (0 <= entry_data_length)) (PreH5 : (entry_data_length <= area_length)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (CircularAreaBackingResource entry_circular_area data_buffer readidx writeidx area_length b_status circular_area_operations logical physical )
  **  (GlobalStrings LitMap )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaDivideWrData_safety_wit_3 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (entry_data_length: Z) (entry_circular_area: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = entry_circular_area)) (PreH3 : (data_length_pre = entry_data_length)) (PreH4 : (entry_circular_area = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
|--
  “ False ”
.

Definition CircularAreaDivideWrData_safety_wit_4 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (circular_area_operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (entry_data_length: Z) (entry_circular_area: Z) (data_buffer: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = entry_circular_area)) (PreH3 : (data_length_pre = entry_data_length)) (PreH4 : (entry_circular_area <> 0)) (PreH5 : (0 <= entry_data_length)) (PreH6 : (entry_data_length <= area_length)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (CircularAreaBackingResource entry_circular_area data_buffer readidx writeidx area_length b_status circular_area_operations logical physical )
  **  (GlobalStrings LitMap )
|--
  “ False ”
.

Definition CircularAreaDivideWrData_safety_wit_5 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (entry_data_length: Z) (entry_circular_area: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = entry_circular_area)) (PreH3 : (data_length_pre = entry_data_length)) (PreH4 : (entry_circular_area = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaDivideWrData_safety_wit_6 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (circular_area_operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (entry_data_length: Z) (entry_circular_area: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = entry_circular_area)) (PreH3 : (data_length_pre = entry_data_length)) (PreH4 : (entry_circular_area <> 0)) (PreH5 : (0 <= entry_data_length)) (PreH6 : (entry_data_length <= area_length)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (CircularAreaBackingResource entry_circular_area data_buffer readidx writeidx area_length b_status circular_area_operations logical physical )
  **  (GlobalStrings LitMap )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaDivideWrData_safety_wit_7 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (circular_area_operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (entry_data_length: Z) (entry_circular_area: Z) (data_buffer: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (writeidx) (32)) + entry_data_length )) (32)) <= area_length)) (PreH2 : (entry_circular_area <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (0 <= entry_data_length)) (PreH5 : (entry_data_length <= area_length)) (PreH6 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> entry_circular_area)
  **  ((( &( "data_length" ) )) # UInt  |-> entry_data_length)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> circular_area_operations)
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (GlobalStrings LitMap )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaDivideWrData_safety_wit_8 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (circular_area_operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (entry_data_length: Z) (entry_circular_area: Z) (data_buffer: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (writeidx) (32)) + entry_data_length )) (32)) > area_length)) (PreH2 : (entry_circular_area <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (0 <= entry_data_length)) (PreH5 : (entry_data_length <= area_length)) (PreH6 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> entry_circular_area)
  **  ((( &( "data_length" ) )) # UInt  |-> entry_data_length)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> circular_area_operations)
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (GlobalStrings LitMap )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaDivideWrData_entail_wit_1 := 
(
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (circular_area_operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (entry_data_length: Z) (entry_circular_area: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = entry_circular_area)) (PreH3 : (data_length_pre = entry_data_length)) (PreH4 : (entry_circular_area <> 0)) (PreH5 : (0 <= entry_data_length)) (PreH6 : (entry_data_length <= area_length)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (CircularAreaBackingResource entry_circular_area data_buffer readidx writeidx area_length b_status circular_area_operations logical physical )
  **  (GlobalStrings LitMap )
|--
  “ (entry_circular_area <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (0 <= entry_data_length) ” 
  &&  “ (entry_data_length <= area_length) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> entry_circular_area)
  **  ((( &( "data_length" ) )) # UInt  |-> entry_data_length)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> circular_area_operations)
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (GlobalStrings LitMap )
) \/
(
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (circular_area_operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (entry_data_length: Z) (entry_circular_area: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = entry_circular_area)) (PreH3 : (data_length_pre = entry_data_length)) (PreH4 : (entry_circular_area <> 0)) (PreH5 : (0 <= entry_data_length)) (PreH6 : (entry_data_length <= area_length)) ,
  (CircularAreaBackingResource entry_circular_area data_buffer readidx writeidx area_length b_status circular_area_operations logical physical )
  **  (GlobalStrings LitMap )
|--
  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ” 
  &&  “ (data_buffer <> 0) ”
  &&  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> circular_area_operations)
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (GlobalStrings LitMap )
).

Definition CircularAreaDivideWrData_entail_wit_1_split_goal_1 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (circular_area_operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (entry_data_length: Z) (entry_circular_area: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = entry_circular_area)) (PreH3 : (data_length_pre = entry_data_length)) (PreH4 : (entry_circular_area <> 0)) (PreH5 : (0 <= entry_data_length)) (PreH6 : (entry_data_length <= area_length)) ,
  (CircularAreaBackingResource entry_circular_area data_buffer readidx writeidx area_length b_status circular_area_operations logical physical )
  **  (GlobalStrings LitMap )
|--
  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
.

Definition CircularAreaDivideWrData_entail_wit_1_split_goal_2 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (circular_area_operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (entry_data_length: Z) (entry_circular_area: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = entry_circular_area)) (PreH3 : (data_length_pre = entry_data_length)) (PreH4 : (entry_circular_area <> 0)) (PreH5 : (0 <= entry_data_length)) (PreH6 : (entry_data_length <= area_length)) ,
  (CircularAreaBackingResource entry_circular_area data_buffer readidx writeidx area_length b_status circular_area_operations logical physical )
  **  (GlobalStrings LitMap )
|--
  “ (data_buffer <> 0) ”
.

Definition CircularAreaDivideWrData_entail_wit_1_split_goal_spatial := 
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (circular_area_operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (entry_data_length: Z) (entry_circular_area: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = entry_circular_area)) (PreH3 : (data_length_pre = entry_data_length)) (PreH4 : (entry_circular_area <> 0)) (PreH5 : (0 <= entry_data_length)) (PreH6 : (entry_data_length <= area_length)) ,
  (CircularAreaBackingResource entry_circular_area data_buffer readidx writeidx area_length b_status circular_area_operations logical physical )
  **  (GlobalStrings LitMap )
|--
  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> circular_area_operations)
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (GlobalStrings LitMap )
.

Definition CircularAreaDivideWrData_return_wit_1 := 
(
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (circular_area_operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (entry_data_length: Z) (entry_circular_area: Z) (data_buffer: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (writeidx) (32)) + entry_data_length )) (32)) > area_length)) (PreH2 : (entry_circular_area <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (0 <= entry_data_length)) (PreH5 : (entry_data_length <= area_length)) (PreH6 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> circular_area_operations)
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (GlobalStrings LitMap )
|--
  “ (entry_circular_area <> 0) ” 
  &&  “ (0 <= entry_data_length) ” 
  &&  “ (entry_data_length <= area_length) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx entry_data_length area_length 1 ) ”
  &&  (CircularAreaBackingResource entry_circular_area data_buffer readidx writeidx area_length b_status circular_area_operations logical physical )
  **  (GlobalStrings LitMap )
) \/
(
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (circular_area_operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (entry_data_length: Z) (entry_circular_area: Z) (data_buffer: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : ((unsigned_last_nbits (((unsigned_last_nbits (writeidx) (32)) + entry_data_length )) (32)) > area_length)) (PreH6 : (entry_circular_area <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (0 <= entry_data_length)) (PreH9 : (entry_data_length <= area_length)) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> circular_area_operations)
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (GlobalStrings LitMap )
|--
  “ (CircularAreaDivideWrDataResult writeidx entry_data_length area_length 1 ) ”
  &&  (CircularAreaBackingResource entry_circular_area data_buffer readidx writeidx area_length b_status circular_area_operations logical physical )
  **  (GlobalStrings LitMap )
).

Definition CircularAreaDivideWrData_return_wit_1_split_goal_1 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (circular_area_operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (entry_data_length: Z) (entry_circular_area: Z) (data_buffer: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : ((unsigned_last_nbits (((unsigned_last_nbits (writeidx) (32)) + entry_data_length )) (32)) > area_length)) (PreH6 : (entry_circular_area <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (0 <= entry_data_length)) (PreH9 : (entry_data_length <= area_length)) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> circular_area_operations)
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (GlobalStrings LitMap )
|--
  “ (CircularAreaDivideWrDataResult writeidx entry_data_length area_length 1 ) ”
.

Definition CircularAreaDivideWrData_return_wit_1_split_goal_spatial := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (circular_area_operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (entry_data_length: Z) (entry_circular_area: Z) (data_buffer: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : ((unsigned_last_nbits (((unsigned_last_nbits (writeidx) (32)) + entry_data_length )) (32)) > area_length)) (PreH6 : (entry_circular_area <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (0 <= entry_data_length)) (PreH9 : (entry_data_length <= area_length)) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> circular_area_operations)
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (GlobalStrings LitMap )
|--
  (CircularAreaBackingResource entry_circular_area data_buffer readidx writeidx area_length b_status circular_area_operations logical physical )
  **  (GlobalStrings LitMap )
.

Definition CircularAreaDivideWrData_return_wit_2 := 
(
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (circular_area_operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (entry_data_length: Z) (entry_circular_area: Z) (data_buffer: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (writeidx) (32)) + entry_data_length )) (32)) <= area_length)) (PreH2 : (entry_circular_area <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (0 <= entry_data_length)) (PreH5 : (entry_data_length <= area_length)) (PreH6 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> circular_area_operations)
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (GlobalStrings LitMap )
|--
  “ (entry_circular_area <> 0) ” 
  &&  “ (0 <= entry_data_length) ” 
  &&  “ (entry_data_length <= area_length) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx entry_data_length area_length 0 ) ”
  &&  (CircularAreaBackingResource entry_circular_area data_buffer readidx writeidx area_length b_status circular_area_operations logical physical )
  **  (GlobalStrings LitMap )
) \/
(
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (circular_area_operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (entry_data_length: Z) (entry_circular_area: Z) (data_buffer: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : ((unsigned_last_nbits (((unsigned_last_nbits (writeidx) (32)) + entry_data_length )) (32)) <= area_length)) (PreH6 : (entry_circular_area <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (0 <= entry_data_length)) (PreH9 : (entry_data_length <= area_length)) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> circular_area_operations)
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (GlobalStrings LitMap )
|--
  “ (CircularAreaDivideWrDataResult writeidx entry_data_length area_length 0 ) ”
  &&  (CircularAreaBackingResource entry_circular_area data_buffer readidx writeidx area_length b_status circular_area_operations logical physical )
  **  (GlobalStrings LitMap )
).

Definition CircularAreaDivideWrData_return_wit_2_split_goal_1 := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (circular_area_operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (entry_data_length: Z) (entry_circular_area: Z) (data_buffer: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : ((unsigned_last_nbits (((unsigned_last_nbits (writeidx) (32)) + entry_data_length )) (32)) <= area_length)) (PreH6 : (entry_circular_area <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (0 <= entry_data_length)) (PreH9 : (entry_data_length <= area_length)) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> circular_area_operations)
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (GlobalStrings LitMap )
|--
  “ (CircularAreaDivideWrDataResult writeidx entry_data_length area_length 0 ) ”
.

Definition CircularAreaDivideWrData_return_wit_2_split_goal_spatial := 
forall (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (circular_area_operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (entry_data_length: Z) (entry_circular_area: Z) (data_buffer: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : ((unsigned_last_nbits (((unsigned_last_nbits (writeidx) (32)) + entry_data_length )) (32)) <= area_length)) (PreH6 : (entry_circular_area <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (0 <= entry_data_length)) (PreH9 : (entry_data_length <= area_length)) (PreH10 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> circular_area_operations)
  **  (UCharArray.mixed_full data_buffer area_length physical )
  **  (GlobalStrings LitMap )
|--
  (CircularAreaBackingResource entry_circular_area data_buffer readidx writeidx area_length b_status circular_area_operations logical physical )
  **  (GlobalStrings LitMap )
.

Definition CircularAreaDivideWrData_return_wit_3 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (entry_data_length: Z) (entry_circular_area: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = entry_circular_area)) (PreH3 : (data_length_pre = entry_data_length)) (PreH4 : (entry_circular_area = 0)) ,
  (GlobalStrings LitMap )
|--
  “ (entry_circular_area = 0) ” 
  &&  “ (1 = 1) ”
  &&  (GlobalStrings LitMap )
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
Axiom proof_of_CircularAreaDivideWrData_entail_wit_1 : CircularAreaDivideWrData_entail_wit_1.
Axiom proof_of_CircularAreaDivideWrData_return_wit_1 : CircularAreaDivideWrData_return_wit_1.
Axiom proof_of_CircularAreaDivideWrData_return_wit_2 : CircularAreaDivideWrData_return_wit_2.
Axiom proof_of_CircularAreaDivideWrData_return_wit_3 : CircularAreaDivideWrData_return_wit_3.

End VC_Correct.
