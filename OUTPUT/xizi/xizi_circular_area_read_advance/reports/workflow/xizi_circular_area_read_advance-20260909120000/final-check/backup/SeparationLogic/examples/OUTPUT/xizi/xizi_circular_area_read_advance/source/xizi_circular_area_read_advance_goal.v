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

Definition CircularAreaDivideRdData_safety_wit_1_state_spec := 
forall (data_length_pre: Z) (circular_area_pre: Z) (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (d0_state_spec: Z) (state_state_spec: circular_area_state) (PreH1 : (data_length_pre = d0_state_spec)) (PreH2 : (circular_area_pre = area_addr_state_spec)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 <= d0_state_spec)) (PreH5 : (d0_state_spec <= (Zlength ((ca_contents (state_state_spec)))))) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec circular_area_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaDivideRdData_safety_wit_2_null_spec := 
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap_null_spec: (string -> Z)) (PreH1 : (circular_area_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap_null_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaDivideRdData_safety_wit_3_state_spec := 
forall (data_length_pre: Z) (circular_area_pre: Z) (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (d0_state_spec: Z) (state_state_spec: circular_area_state) (PreH1 : (circular_area_pre = 0)) (PreH2 : (data_length_pre = d0_state_spec)) (PreH3 : (circular_area_pre = area_addr_state_spec)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (0 <= d0_state_spec)) (PreH6 : (d0_state_spec <= (Zlength ((ca_contents (state_state_spec)))))) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec circular_area_pre )
|--
  “ False ”
.

Definition CircularAreaDivideRdData_safety_wit_4_null_spec := 
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap_null_spec: (string -> Z)) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap_null_spec )
|--
  “ False ”
.

Definition CircularAreaDivideRdData_safety_wit_5_null_spec := 
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap_null_spec: (string -> Z)) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap_null_spec )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaDivideRdData_safety_wit_6_state_spec := 
forall (data_length_pre: Z) (circular_area_pre: Z) (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (d0_state_spec: Z) (state_state_spec: circular_area_state) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_length_pre = d0_state_spec)) (PreH3 : (circular_area_pre = area_addr_state_spec)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (0 <= d0_state_spec)) (PreH6 : (d0_state_spec <= (Zlength ((ca_contents (state_state_spec)))))) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec circular_area_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaDivideRdData_safety_wit_7_state_spec := 
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (d0_state_spec: Z) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + d0_state_spec )) (32)) <= (ca_capacity (state_state_spec)))) (PreH2 : (area_addr_state_spec <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (0 <= d0_state_spec)) (PreH5 : (d0_state_spec <= (Zlength ((ca_contents (state_state_spec)))))) (PreH6 : ((readidx + d0_state_spec ) <= UINT_MAX)) (PreH7 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
  ((( &( "data_length" ) )) # UInt  |-> d0_state_spec)
  **  ((( &( "circular_area" ) )) # Ptr  |-> area_addr_state_spec)
  **  (GlobalStrings LitMap_state_spec )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaDivideRdData_safety_wit_8_state_spec := 
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (d0_state_spec: Z) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + d0_state_spec )) (32)) > (ca_capacity (state_state_spec)))) (PreH2 : (area_addr_state_spec <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (0 <= d0_state_spec)) (PreH5 : (d0_state_spec <= (Zlength ((ca_contents (state_state_spec)))))) (PreH6 : ((readidx + d0_state_spec ) <= UINT_MAX)) (PreH7 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
  ((( &( "data_length" ) )) # UInt  |-> d0_state_spec)
  **  ((( &( "circular_area" ) )) # Ptr  |-> area_addr_state_spec)
  **  (GlobalStrings LitMap_state_spec )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaDivideRdData_entail_wit_1_state_spec := 
(
forall (data_length_pre: Z) (circular_area_pre: Z) (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (d0_state_spec: Z) (state_state_spec: circular_area_state) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_length_pre = d0_state_spec)) (PreH3 : (circular_area_pre = area_addr_state_spec)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (0 <= d0_state_spec)) (PreH6 : (d0_state_spec <= (Zlength ((ca_contents (state_state_spec)))))) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec circular_area_pre )
|--
  EX (operations: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (readidx: Z)  (data_buffer: Z) ,
  “ (area_addr_state_spec <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (0 <= d0_state_spec) ” 
  &&  “ (d0_state_spec <= (Zlength ((ca_contents (state_state_spec))))) ” 
  &&  “ ((readidx + d0_state_spec ) <= UINT_MAX) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical ) ”
  &&  ((( &( "data_length" ) )) # UInt  |-> d0_state_spec)
  **  ((( &( "circular_area" ) )) # Ptr  |-> area_addr_state_spec)
  **  (GlobalStrings LitMap_state_spec )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (data_length_pre: Z) (circular_area_pre: Z) (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (d0_state_spec: Z) (state_state_spec: circular_area_state) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_length_pre = d0_state_spec)) (PreH3 : (circular_area_pre = area_addr_state_spec)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (0 <= d0_state_spec)) (PreH6 : (d0_state_spec <= (Zlength ((ca_contents (state_state_spec)))))) ,
  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec circular_area_pre )
|--
  EX (operations: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (readidx: Z)  (data_buffer: Z) ,
  “ (data_length_pre = d0_state_spec) ” 
  &&  “ (circular_area_pre = area_addr_state_spec) ” 
  &&  “ (area_addr_state_spec <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (0 <= d0_state_spec) ” 
  &&  “ (d0_state_spec <= (Zlength ((ca_contents (state_state_spec))))) ” 
  &&  “ ((readidx + d0_state_spec ) <= UINT_MAX) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical ) ”
  &&  (GlobalStrings LitMap_state_spec )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
).

Definition CircularAreaDivideRdData_return_wit_1_state_spec := 
(
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (d0_state_spec: Z) (state_state_spec: circular_area_state) (data_buffer_2: Z) (operations_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx_2) (32)) + d0_state_spec )) (32)) > (ca_capacity (state_state_spec)))) (PreH2 : (area_addr_state_spec <> 0)) (PreH3 : (data_buffer_2 <> 0)) (PreH4 : (0 <= d0_state_spec)) (PreH5 : (d0_state_spec <= (Zlength ((ca_contents (state_state_spec)))))) (PreH6 : ((readidx_2 + d0_state_spec ) <= UINT_MAX)) (PreH7 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state_state_spec)) b_status_2 (ca_contents (state_state_spec)) physical_2 )) ,
  (GlobalStrings LitMap_state_spec )
  **  (UCharArray.mixed_full data_buffer_2 (ca_capacity (state_state_spec)) physical_2 )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_2)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_2)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_2)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_2)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_2 + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_2)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_2)
|--
  EX (operations: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (readidx: Z)  (data_buffer: Z) ,
  “ (area_addr_state_spec <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaStateDivideRdDataResult state_state_spec d0_state_spec 1 ) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx d0_state_spec (ca_capacity (state_state_spec)) 1 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical ) ”
  &&  (GlobalStrings LitMap_state_spec )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (area_addr_state_spec: Z) (d0_state_spec: Z) (state_state_spec: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx_2) (32)) + d0_state_spec )) (32)) > (ca_capacity (state_state_spec)))) (PreH2 : (area_addr_state_spec <> 0)) (PreH3 : (data_buffer_2 <> 0)) (PreH4 : (0 <= d0_state_spec)) (PreH5 : (d0_state_spec <= (Zlength ((ca_contents (state_state_spec)))))) (PreH6 : ((readidx_2 + d0_state_spec ) <= UINT_MAX)) (PreH7 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state_state_spec)) b_status_2 (ca_contents (state_state_spec)) physical_2 )) ,
  TT && emp 
|--
  “ (CircularAreaDivideRdDataResult readidx_2 d0_state_spec (ca_capacity (state_state_spec)) 1 ) ” 
  &&  “ (CircularAreaStateDivideRdDataResult state_state_spec d0_state_spec 1 ) ”
  &&  emp
).

Definition CircularAreaDivideRdData_return_wit_1_state_spec_split_goal_1 := 
forall (area_addr_state_spec: Z) (d0_state_spec: Z) (state_state_spec: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx_2) (32)) + d0_state_spec )) (32)) > (ca_capacity (state_state_spec)))) (PreH2 : (area_addr_state_spec <> 0)) (PreH3 : (data_buffer_2 <> 0)) (PreH4 : (0 <= d0_state_spec)) (PreH5 : (d0_state_spec <= (Zlength ((ca_contents (state_state_spec)))))) (PreH6 : ((readidx_2 + d0_state_spec ) <= UINT_MAX)) (PreH7 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state_state_spec)) b_status_2 (ca_contents (state_state_spec)) physical_2 )) ,
  (CircularAreaDivideRdDataResult readidx_2 d0_state_spec (ca_capacity (state_state_spec)) 1 )
.

Definition CircularAreaDivideRdData_return_wit_1_state_spec_split_goal_2 := 
forall (area_addr_state_spec: Z) (d0_state_spec: Z) (state_state_spec: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx_2) (32)) + d0_state_spec )) (32)) > (ca_capacity (state_state_spec)))) (PreH2 : (area_addr_state_spec <> 0)) (PreH3 : (data_buffer_2 <> 0)) (PreH4 : (0 <= d0_state_spec)) (PreH5 : (d0_state_spec <= (Zlength ((ca_contents (state_state_spec)))))) (PreH6 : ((readidx_2 + d0_state_spec ) <= UINT_MAX)) (PreH7 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state_state_spec)) b_status_2 (ca_contents (state_state_spec)) physical_2 )) ,
  (CircularAreaStateDivideRdDataResult state_state_spec d0_state_spec 1 )
.

Definition CircularAreaDivideRdData_return_wit_2_state_spec := 
(
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (d0_state_spec: Z) (state_state_spec: circular_area_state) (data_buffer_2: Z) (operations_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx_2) (32)) + d0_state_spec )) (32)) <= (ca_capacity (state_state_spec)))) (PreH2 : (area_addr_state_spec <> 0)) (PreH3 : (data_buffer_2 <> 0)) (PreH4 : (0 <= d0_state_spec)) (PreH5 : (d0_state_spec <= (Zlength ((ca_contents (state_state_spec)))))) (PreH6 : ((readidx_2 + d0_state_spec ) <= UINT_MAX)) (PreH7 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state_state_spec)) b_status_2 (ca_contents (state_state_spec)) physical_2 )) ,
  (GlobalStrings LitMap_state_spec )
  **  (UCharArray.mixed_full data_buffer_2 (ca_capacity (state_state_spec)) physical_2 )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_2)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_2)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_2)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_2)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_2 + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_2)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_2)
|--
  EX (operations: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (readidx: Z)  (data_buffer: Z) ,
  “ (area_addr_state_spec <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaStateDivideRdDataResult state_state_spec d0_state_spec 0 ) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx d0_state_spec (ca_capacity (state_state_spec)) 0 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical ) ”
  &&  (GlobalStrings LitMap_state_spec )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (area_addr_state_spec: Z) (d0_state_spec: Z) (state_state_spec: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx_2) (32)) + d0_state_spec )) (32)) <= (ca_capacity (state_state_spec)))) (PreH2 : (area_addr_state_spec <> 0)) (PreH3 : (data_buffer_2 <> 0)) (PreH4 : (0 <= d0_state_spec)) (PreH5 : (d0_state_spec <= (Zlength ((ca_contents (state_state_spec)))))) (PreH6 : ((readidx_2 + d0_state_spec ) <= UINT_MAX)) (PreH7 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state_state_spec)) b_status_2 (ca_contents (state_state_spec)) physical_2 )) ,
  TT && emp 
|--
  “ (CircularAreaDivideRdDataResult readidx_2 d0_state_spec (ca_capacity (state_state_spec)) 0 ) ” 
  &&  “ (CircularAreaStateDivideRdDataResult state_state_spec d0_state_spec 0 ) ”
  &&  emp
).

Definition CircularAreaDivideRdData_return_wit_2_state_spec_split_goal_1 := 
forall (area_addr_state_spec: Z) (d0_state_spec: Z) (state_state_spec: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx_2) (32)) + d0_state_spec )) (32)) <= (ca_capacity (state_state_spec)))) (PreH2 : (area_addr_state_spec <> 0)) (PreH3 : (data_buffer_2 <> 0)) (PreH4 : (0 <= d0_state_spec)) (PreH5 : (d0_state_spec <= (Zlength ((ca_contents (state_state_spec)))))) (PreH6 : ((readidx_2 + d0_state_spec ) <= UINT_MAX)) (PreH7 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state_state_spec)) b_status_2 (ca_contents (state_state_spec)) physical_2 )) ,
  (CircularAreaDivideRdDataResult readidx_2 d0_state_spec (ca_capacity (state_state_spec)) 0 )
.

Definition CircularAreaDivideRdData_return_wit_2_state_spec_split_goal_2 := 
forall (area_addr_state_spec: Z) (d0_state_spec: Z) (state_state_spec: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx_2) (32)) + d0_state_spec )) (32)) <= (ca_capacity (state_state_spec)))) (PreH2 : (area_addr_state_spec <> 0)) (PreH3 : (data_buffer_2 <> 0)) (PreH4 : (0 <= d0_state_spec)) (PreH5 : (d0_state_spec <= (Zlength ((ca_contents (state_state_spec)))))) (PreH6 : ((readidx_2 + d0_state_spec ) <= UINT_MAX)) (PreH7 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state_state_spec)) b_status_2 (ca_contents (state_state_spec)) physical_2 )) ,
  (CircularAreaStateDivideRdDataResult state_state_spec d0_state_spec 0 )
.

Definition CircularAreaDivideRdData_return_wit_3_null_spec := 
forall (circular_area_pre: Z) (LitMap_null_spec: (string -> Z)) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = 0)) ,
  (GlobalStrings LitMap_null_spec )
|--
  “ (circular_area_pre = 0) ” 
  &&  “ (1 = 1) ”
  &&  (GlobalStrings LitMap_null_spec )
.

Module Type VC_Correct.


Axiom proof_of_CircularAreaDivideRdData_safety_wit_1_state_spec : CircularAreaDivideRdData_safety_wit_1_state_spec.
Axiom proof_of_CircularAreaDivideRdData_safety_wit_2_null_spec : CircularAreaDivideRdData_safety_wit_2_null_spec.
Axiom proof_of_CircularAreaDivideRdData_safety_wit_3_state_spec : CircularAreaDivideRdData_safety_wit_3_state_spec.
Axiom proof_of_CircularAreaDivideRdData_safety_wit_4_null_spec : CircularAreaDivideRdData_safety_wit_4_null_spec.
Axiom proof_of_CircularAreaDivideRdData_safety_wit_5_null_spec : CircularAreaDivideRdData_safety_wit_5_null_spec.
Axiom proof_of_CircularAreaDivideRdData_safety_wit_6_state_spec : CircularAreaDivideRdData_safety_wit_6_state_spec.
Axiom proof_of_CircularAreaDivideRdData_safety_wit_7_state_spec : CircularAreaDivideRdData_safety_wit_7_state_spec.
Axiom proof_of_CircularAreaDivideRdData_safety_wit_8_state_spec : CircularAreaDivideRdData_safety_wit_8_state_spec.
Axiom proof_of_CircularAreaDivideRdData_entail_wit_1_state_spec : CircularAreaDivideRdData_entail_wit_1_state_spec.
Axiom proof_of_CircularAreaDivideRdData_return_wit_1_state_spec : CircularAreaDivideRdData_return_wit_1_state_spec.
Axiom proof_of_CircularAreaDivideRdData_return_wit_2_state_spec : CircularAreaDivideRdData_return_wit_2_state_spec.
Axiom proof_of_CircularAreaDivideRdData_return_wit_3_null_spec : CircularAreaDivideRdData_return_wit_3_null_spec.

End VC_Correct.
