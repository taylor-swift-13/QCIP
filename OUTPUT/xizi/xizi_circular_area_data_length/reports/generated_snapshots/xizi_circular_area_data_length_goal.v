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
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_data_length.source Require Import xizi_circular_area_data_length_lib.
Local Open Scope sac.

(*----- Function CircularAreaIsFull -----*)

Definition CircularAreaIsFull_safety_wit_1_state_spec := 
forall (circular_area_pre: Z) (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (PreH1 : (circular_area_pre = area_addr_state_spec)) (PreH2 : (circular_area_pre <> 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec circular_area_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsFull_safety_wit_2_null_spec := 
forall (circular_area_pre: Z) (LitMap_null_spec: (string -> Z)) (PreH1 : (circular_area_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap_null_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsFull_safety_wit_3_state_spec := 
forall (circular_area_pre: Z) (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = area_addr_state_spec)) (PreH3 : (circular_area_pre <> 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec circular_area_pre )
|--
  “ False ”
.

Definition CircularAreaIsFull_safety_wit_4_null_spec := 
forall (circular_area_pre: Z) (LitMap_null_spec: (string -> Z)) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap_null_spec )
|--
  “ False ”
.

Definition CircularAreaIsFull_safety_wit_5_null_spec := 
forall (circular_area_pre: Z) (LitMap_null_spec: (string -> Z)) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap_null_spec )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaIsFull_safety_wit_6_state_spec := 
forall (circular_area_pre: Z) (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = area_addr_state_spec)) (PreH3 : (circular_area_pre <> 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec circular_area_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsFull_safety_wit_7_state_spec := 
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (b_status <> 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (area_addr_state_spec <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
  (store_stringLit (LitMap_state_spec (("the circular area is full
"%string))) ("the circular area is full
"%string) )
  **  (GlobalStrings_missing LitMap_state_spec (cons (("the circular area is full
"%string)) ((@nil string))) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> area_addr_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsFull_safety_wit_8_state_spec := 
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (b_status <> 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (area_addr_state_spec <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((( &( "circular_area" ) )) # Ptr  |-> area_addr_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaIsFull_safety_wit_9_state_spec := 
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (readidx <> writeidx)) (PreH2 : (area_addr_state_spec <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> area_addr_state_spec)
  **  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsFull_safety_wit_10_state_spec := 
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (b_status = 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (area_addr_state_spec <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> area_addr_state_spec)
  **  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsFull_entail_wit_1_state_spec := 
(
forall (circular_area_pre: Z) (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = area_addr_state_spec)) (PreH3 : (circular_area_pre <> 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec circular_area_pre )
|--
  EX (operations: Z)  (readidx: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (data_buffer: Z) ,
  “ (area_addr_state_spec <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> area_addr_state_spec)
  **  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
) \/
(
forall (circular_area_pre: Z) (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = area_addr_state_spec)) (PreH3 : (circular_area_pre <> 0)) ,
  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec circular_area_pre )
|--
  EX (operations: Z)  (readidx: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (data_buffer: Z) ,
  “ (circular_area_pre = area_addr_state_spec) ” 
  &&  “ (area_addr_state_spec <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical ) ”
  &&  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
).

Definition CircularAreaIsFull_return_wit_1_state_spec := 
(
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (readidx <> writeidx)) (PreH2 : (area_addr_state_spec <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
|--
  “ (CircularAreaFullResult state_state_spec 0 ) ”
  &&  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec area_addr_state_spec )
) \/
(
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state_state_spec)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state_state_spec)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (readidx <> writeidx)) (PreH6 : (area_addr_state_spec <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
|--
  “ (CircularAreaFullResult state_state_spec 0 ) ”
  &&  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec area_addr_state_spec )
).

Definition CircularAreaIsFull_return_wit_1_state_spec_split_goal_1 := 
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state_state_spec)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state_state_spec)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (readidx <> writeidx)) (PreH6 : (area_addr_state_spec <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
|--
  “ (CircularAreaFullResult state_state_spec 0 ) ”
.

Definition CircularAreaIsFull_return_wit_1_state_spec_split_goal_spatial := 
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state_state_spec)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state_state_spec)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (readidx <> writeidx)) (PreH6 : (area_addr_state_spec <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
|--
  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec area_addr_state_spec )
.

Definition CircularAreaIsFull_return_wit_2_state_spec := 
(
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (b_status = 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (area_addr_state_spec <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
|--
  “ (CircularAreaFullResult state_state_spec 0 ) ”
  &&  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec area_addr_state_spec )
) \/
(
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state_state_spec)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state_state_spec)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status = 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (area_addr_state_spec <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
|--
  “ (CircularAreaFullResult state_state_spec 0 ) ”
  &&  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec area_addr_state_spec )
).

Definition CircularAreaIsFull_return_wit_2_state_spec_split_goal_1 := 
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state_state_spec)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state_state_spec)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status = 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (area_addr_state_spec <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
|--
  “ (CircularAreaFullResult state_state_spec 0 ) ”
.

Definition CircularAreaIsFull_return_wit_2_state_spec_split_goal_spatial := 
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state_state_spec)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state_state_spec)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status = 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (area_addr_state_spec <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
|--
  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec area_addr_state_spec )
.

Definition CircularAreaIsFull_return_wit_3_state_spec := 
(
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (b_status <> 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (area_addr_state_spec <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
|--
  “ (CircularAreaFullResult state_state_spec 1 ) ”
  &&  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec area_addr_state_spec )
) \/
(
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state_state_spec)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state_state_spec)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status <> 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (area_addr_state_spec <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
|--
  “ (CircularAreaFullResult state_state_spec 1 ) ”
  &&  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec area_addr_state_spec )
).

Definition CircularAreaIsFull_return_wit_3_state_spec_split_goal_1 := 
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state_state_spec)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state_state_spec)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status <> 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (area_addr_state_spec <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
|--
  “ (CircularAreaFullResult state_state_spec 1 ) ”
.

Definition CircularAreaIsFull_return_wit_3_state_spec_split_goal_spatial := 
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state_state_spec)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state_state_spec)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status <> 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (area_addr_state_spec <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
|--
  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec area_addr_state_spec )
.

Definition CircularAreaIsFull_return_wit_4_null_spec := 
(
forall (circular_area_pre: Z) (LitMap_null_spec: (string -> Z)) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = 0)) ,
  (GlobalStrings LitMap_null_spec )
|--
  “ (circular_area_pre = 0) ” 
  &&  “ (CircularAreaErrorResult 1 ) ”
  &&  (GlobalStrings LitMap_null_spec )
) \/
(
forall (circular_area_pre: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = 0)) ,
  TT && emp 
|--
  “ (CircularAreaErrorResult 1 ) ”
  &&  emp
).

Definition CircularAreaIsFull_return_wit_4_null_spec_split_goal_1 := 
forall (circular_area_pre: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = 0)) ,
  (CircularAreaErrorResult 1 )
.

Definition CircularAreaIsFull_partial_solve_wit_1_state_spec_pure := 
(
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (b_status <> 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (area_addr_state_spec <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
  (store_stringLit (LitMap_state_spec (("the circular area is full
"%string))) ("the circular area is full
"%string) )
  **  (GlobalStrings_missing LitMap_state_spec (cons (("the circular area is full
"%string)) ((@nil string))) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> area_addr_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
|--
  “ (((LitMap_state_spec (("the circular area is full
"%string))) + (0 * sizeof(CHAR))) = (LitMap_state_spec (("the circular area is full
"%string)))) ”
) \/
(
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state_state_spec)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state_state_spec)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status <> 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (area_addr_state_spec <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((( &( "circular_area" ) )) # Ptr  |-> area_addr_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
|--
  “ (((LitMap_state_spec (("the circular area is full
"%string))) + (0 * sizeof(CHAR))) = (LitMap_state_spec (("the circular area is full
"%string)))) ”
).

Definition CircularAreaIsFull_partial_solve_wit_1_state_spec_pure_split_goal_1 := 
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state_state_spec)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state_state_spec)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status <> 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (area_addr_state_spec <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((( &( "circular_area" ) )) # Ptr  |-> area_addr_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
|--
  “ (((LitMap_state_spec (("the circular area is full
"%string))) + (0 * sizeof(CHAR))) = (LitMap_state_spec (("the circular area is full
"%string)))) ”
.

Definition CircularAreaIsFull_partial_solve_wit_1_state_spec_aux := 
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (b_status <> 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (area_addr_state_spec <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
  (store_stringLit (LitMap_state_spec (("the circular area is full
"%string))) ("the circular area is full
"%string) )
  **  (GlobalStrings_missing LitMap_state_spec (cons (("the circular area is full
"%string)) ((@nil string))) )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
|--
  “ (((LitMap_state_spec (("the circular area is full
"%string))) + (0 * sizeof(CHAR))) = (LitMap_state_spec (("the circular area is full
"%string)))) ” 
  &&  “ (b_status <> 0) ” 
  &&  “ (readidx = writeidx) ” 
  &&  “ (area_addr_state_spec <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical ) ”
  &&  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
.

Definition CircularAreaIsFull_partial_solve_wit_1_state_spec := CircularAreaIsFull_partial_solve_wit_1_state_spec_pure -> CircularAreaIsFull_partial_solve_wit_1_state_spec_aux.

(*----- Function CircularAreaGetDataLength -----*)

Definition CircularAreaGetDataLength_safety_wit_1_null_spec := 
forall (circular_area_pre: Z) (LitMap_null_spec: (string -> Z)) (PreH1 : (circular_area_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap_null_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaGetDataLength_safety_wit_2_state_spec := 
forall (circular_area_pre: Z) (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (PreH1 : (circular_area_pre = area_addr_state_spec)) (PreH2 : (circular_area_pre <> 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec circular_area_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaGetDataLength_safety_wit_3_null_spec := 
forall (circular_area_pre: Z) (LitMap_null_spec: (string -> Z)) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap_null_spec )
|--
  “ False ”
.

Definition CircularAreaGetDataLength_safety_wit_4_state_spec := 
forall (circular_area_pre: Z) (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = area_addr_state_spec)) (PreH3 : (circular_area_pre <> 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec circular_area_pre )
|--
  “ False ”
.

Definition CircularAreaGetDataLength_safety_wit_5_null_spec := 
forall (circular_area_pre: Z) (LitMap_null_spec: (string -> Z)) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap_null_spec )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaGetDataLength_safety_wit_6_state_spec := 
forall (circular_area_pre: Z) (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = area_addr_state_spec)) (PreH3 : (circular_area_pre <> 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec circular_area_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaGetDataLength_safety_wit_7_state_spec := 
(
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (area_addr_state_spec <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : ((Zlength ((ca_contents (state_state_spec)))) < (ca_capacity (state_state_spec)))) (PreH4 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> area_addr_state_spec)
  **  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
|--
  “ ((ca_capacity (state_state_spec)) <> 0) ”
) \/
(
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (area_addr_state_spec <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : ((Zlength ((ca_contents (state_state_spec)))) < (ca_capacity (state_state_spec)))) (PreH4 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> area_addr_state_spec)
  **  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
|--
  “ ((ca_capacity (state_state_spec)) <> 0) ”
).

Definition CircularAreaGetDataLength_safety_wit_7_state_spec_split_goal_1 := 
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (area_addr_state_spec <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : ((Zlength ((ca_contents (state_state_spec)))) < (ca_capacity (state_state_spec)))) (PreH4 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> area_addr_state_spec)
  **  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
|--
  “ ((ca_capacity (state_state_spec)) <> 0) ”
.

Definition CircularAreaGetDataLength_safety_wit_8_state_spec := 
(
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (area_addr_state_spec <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : ((Zlength ((ca_contents (state_state_spec)))) < (ca_capacity (state_state_spec)))) (PreH4 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> area_addr_state_spec)
  **  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
|--
  “ ((writeidx - readidx ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (writeidx - readidx )) ”
) \/
(
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (area_addr_state_spec <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : ((Zlength ((ca_contents (state_state_spec)))) < (ca_capacity (state_state_spec)))) (PreH4 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> area_addr_state_spec)
  **  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
|--
  “ ((writeidx - readidx ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (writeidx - readidx )) ”
).

Definition CircularAreaGetDataLength_safety_wit_8_state_spec_split_goal_1 := 
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (area_addr_state_spec <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : ((Zlength ((ca_contents (state_state_spec)))) < (ca_capacity (state_state_spec)))) (PreH4 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> area_addr_state_spec)
  **  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
|--
  “ ((writeidx - readidx ) <= INT_MAX) ”
.

Definition CircularAreaGetDataLength_safety_wit_8_state_spec_split_goal_2 := 
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (area_addr_state_spec <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : ((Zlength ((ca_contents (state_state_spec)))) < (ca_capacity (state_state_spec)))) (PreH4 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> area_addr_state_spec)
  **  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
|--
  “ ((INT_MIN) <= (writeidx - readidx )) ”
.

Definition CircularAreaGetDataLength_entail_wit_1_state_spec := 
(
forall (circular_area_pre: Z) (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (retval: Z) (PreH1 : (CircularAreaFullResult state_state_spec retval )) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = area_addr_state_spec)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (retval <> 0)) ,
  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec circular_area_pre )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  EX (operations: Z)  (readidx: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (data_buffer: Z) ,
  “ (area_addr_state_spec <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ ((Zlength ((ca_contents (state_state_spec)))) = (ca_capacity (state_state_spec))) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> area_addr_state_spec)
  **  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
) \/
(
forall (circular_area_pre: Z) (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (retval: Z) (PreH1 : (CircularAreaFullResult state_state_spec retval )) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = area_addr_state_spec)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (retval <> 0)) ,
  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec circular_area_pre )
|--
  EX (operations: Z)  (readidx: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (data_buffer: Z) ,
  “ (circular_area_pre = area_addr_state_spec) ” 
  &&  “ (area_addr_state_spec <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ ((Zlength ((ca_contents (state_state_spec)))) = (ca_capacity (state_state_spec))) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical ) ”
  &&  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
).

Definition CircularAreaGetDataLength_entail_wit_2_state_spec := 
(
forall (circular_area_pre: Z) (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (retval: Z) (PreH1 : (CircularAreaFullResult state_state_spec retval )) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = area_addr_state_spec)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (retval = 0)) ,
  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec circular_area_pre )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  EX (operations: Z)  (readidx: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (data_buffer: Z) ,
  “ (area_addr_state_spec <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ ((Zlength ((ca_contents (state_state_spec)))) < (ca_capacity (state_state_spec))) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> area_addr_state_spec)
  **  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
) \/
(
forall (circular_area_pre: Z) (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (retval: Z) (PreH1 : (CircularAreaFullResult state_state_spec retval )) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = area_addr_state_spec)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (retval = 0)) ,
  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec circular_area_pre )
|--
  EX (operations: Z)  (readidx: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (data_buffer: Z) ,
  “ (circular_area_pre = area_addr_state_spec) ” 
  &&  “ (area_addr_state_spec <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ ((Zlength ((ca_contents (state_state_spec)))) < (ca_capacity (state_state_spec))) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical ) ”
  &&  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
).

Definition CircularAreaGetDataLength_return_wit_1_state_spec := 
(
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (area_addr_state_spec <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : ((Zlength ((ca_contents (state_state_spec)))) < (ca_capacity (state_state_spec)))) (PreH4 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
|--
  “ (CircularAreaDataLengthResult state_state_spec ((unsigned_last_nbits (((unsigned_last_nbits ((writeidx - readidx )) (32)) + (ca_capacity (state_state_spec)) )) (32)) % ( (ca_capacity (state_state_spec)) ) ) ) ”
  &&  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec area_addr_state_spec )
) \/
(
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state_state_spec)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state_state_spec)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (area_addr_state_spec <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : ((Zlength ((ca_contents (state_state_spec)))) < (ca_capacity (state_state_spec)))) (PreH8 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
|--
  “ (CircularAreaDataLengthResult state_state_spec ((unsigned_last_nbits (((unsigned_last_nbits ((writeidx - readidx )) (32)) + (ca_capacity (state_state_spec)) )) (32)) % ( (ca_capacity (state_state_spec)) ) ) ) ”
  &&  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec area_addr_state_spec )
).

Definition CircularAreaGetDataLength_return_wit_1_state_spec_split_goal_1 := 
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state_state_spec)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state_state_spec)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (area_addr_state_spec <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : ((Zlength ((ca_contents (state_state_spec)))) < (ca_capacity (state_state_spec)))) (PreH8 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
|--
  “ (CircularAreaDataLengthResult state_state_spec ((unsigned_last_nbits (((unsigned_last_nbits ((writeidx - readidx )) (32)) + (ca_capacity (state_state_spec)) )) (32)) % ( (ca_capacity (state_state_spec)) ) ) ) ”
.

Definition CircularAreaGetDataLength_return_wit_1_state_spec_split_goal_spatial := 
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state_state_spec)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state_state_spec)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (area_addr_state_spec <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : ((Zlength ((ca_contents (state_state_spec)))) < (ca_capacity (state_state_spec)))) (PreH8 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
|--
  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec area_addr_state_spec )
.

Definition CircularAreaGetDataLength_return_wit_2_state_spec := 
(
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (area_addr_state_spec <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : ((Zlength ((ca_contents (state_state_spec)))) = (ca_capacity (state_state_spec)))) (PreH4 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
|--
  “ (CircularAreaDataLengthResult state_state_spec (ca_capacity (state_state_spec)) ) ”
  &&  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec area_addr_state_spec )
) \/
(
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state_state_spec)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state_state_spec)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (area_addr_state_spec <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : ((Zlength ((ca_contents (state_state_spec)))) = (ca_capacity (state_state_spec)))) (PreH8 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
|--
  “ (CircularAreaDataLengthResult state_state_spec (ca_capacity (state_state_spec)) ) ”
  &&  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec area_addr_state_spec )
).

Definition CircularAreaGetDataLength_return_wit_2_state_spec_split_goal_1 := 
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state_state_spec)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state_state_spec)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (area_addr_state_spec <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : ((Zlength ((ca_contents (state_state_spec)))) = (ca_capacity (state_state_spec)))) (PreH8 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
|--
  “ (CircularAreaDataLengthResult state_state_spec (ca_capacity (state_state_spec)) ) ”
.

Definition CircularAreaGetDataLength_return_wit_2_state_spec_split_goal_spatial := 
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state_state_spec)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state_state_spec)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (area_addr_state_spec <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : ((Zlength ((ca_contents (state_state_spec)))) = (ca_capacity (state_state_spec)))) (PreH8 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state_state_spec)) ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state_state_spec)))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state_state_spec)) physical )
|--
  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec area_addr_state_spec )
.

Definition CircularAreaGetDataLength_return_wit_3_null_spec := 
(
forall (circular_area_pre: Z) (LitMap_null_spec: (string -> Z)) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = 0)) ,
  (GlobalStrings LitMap_null_spec )
|--
  “ (circular_area_pre = 0) ” 
  &&  “ (CircularAreaErrorResult 1 ) ”
  &&  (GlobalStrings LitMap_null_spec )
) \/
(
forall (circular_area_pre: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = 0)) ,
  TT && emp 
|--
  “ (CircularAreaErrorResult 1 ) ”
  &&  emp
).

Definition CircularAreaGetDataLength_return_wit_3_null_spec_split_goal_1 := 
forall (circular_area_pre: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = 0)) ,
  (CircularAreaErrorResult 1 )
.

Definition CircularAreaGetDataLength_partial_solve_wit_1_state_spec_pure := 
forall (circular_area_pre: Z) (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = area_addr_state_spec)) (PreH3 : (circular_area_pre <> 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec circular_area_pre )
|--
  “ (circular_area_pre = circular_area_pre) ” 
  &&  “ (circular_area_pre <> 0) ”
.

Definition CircularAreaGetDataLength_partial_solve_wit_1_state_spec_aux := 
forall (circular_area_pre: Z) (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = area_addr_state_spec)) (PreH3 : (circular_area_pre <> 0)) ,
  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec circular_area_pre )
|--
  “ (circular_area_pre = circular_area_pre) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre = area_addr_state_spec) ” 
  &&  “ (circular_area_pre <> 0) ”
  &&  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec circular_area_pre )
.

Definition CircularAreaGetDataLength_partial_solve_wit_1_state_spec := CircularAreaGetDataLength_partial_solve_wit_1_state_spec_pure -> CircularAreaGetDataLength_partial_solve_wit_1_state_spec_aux.

Module Type VC_Correct.


Axiom proof_of_CircularAreaIsFull_safety_wit_1_state_spec : CircularAreaIsFull_safety_wit_1_state_spec.
Axiom proof_of_CircularAreaIsFull_safety_wit_2_null_spec : CircularAreaIsFull_safety_wit_2_null_spec.
Axiom proof_of_CircularAreaIsFull_safety_wit_3_state_spec : CircularAreaIsFull_safety_wit_3_state_spec.
Axiom proof_of_CircularAreaIsFull_safety_wit_4_null_spec : CircularAreaIsFull_safety_wit_4_null_spec.
Axiom proof_of_CircularAreaIsFull_safety_wit_5_null_spec : CircularAreaIsFull_safety_wit_5_null_spec.
Axiom proof_of_CircularAreaIsFull_safety_wit_6_state_spec : CircularAreaIsFull_safety_wit_6_state_spec.
Axiom proof_of_CircularAreaIsFull_safety_wit_7_state_spec : CircularAreaIsFull_safety_wit_7_state_spec.
Axiom proof_of_CircularAreaIsFull_safety_wit_8_state_spec : CircularAreaIsFull_safety_wit_8_state_spec.
Axiom proof_of_CircularAreaIsFull_safety_wit_9_state_spec : CircularAreaIsFull_safety_wit_9_state_spec.
Axiom proof_of_CircularAreaIsFull_safety_wit_10_state_spec : CircularAreaIsFull_safety_wit_10_state_spec.
Axiom proof_of_CircularAreaIsFull_entail_wit_1_state_spec : CircularAreaIsFull_entail_wit_1_state_spec.
Axiom proof_of_CircularAreaIsFull_return_wit_1_state_spec : CircularAreaIsFull_return_wit_1_state_spec.
Axiom proof_of_CircularAreaIsFull_return_wit_2_state_spec : CircularAreaIsFull_return_wit_2_state_spec.
Axiom proof_of_CircularAreaIsFull_return_wit_3_state_spec : CircularAreaIsFull_return_wit_3_state_spec.
Axiom proof_of_CircularAreaIsFull_return_wit_4_null_spec : CircularAreaIsFull_return_wit_4_null_spec.
Axiom proof_of_CircularAreaIsFull_partial_solve_wit_1_state_spec_pure : CircularAreaIsFull_partial_solve_wit_1_state_spec_pure.
Axiom proof_of_CircularAreaIsFull_partial_solve_wit_1_state_spec : CircularAreaIsFull_partial_solve_wit_1_state_spec.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_1_null_spec : CircularAreaGetDataLength_safety_wit_1_null_spec.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_2_state_spec : CircularAreaGetDataLength_safety_wit_2_state_spec.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_3_null_spec : CircularAreaGetDataLength_safety_wit_3_null_spec.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_4_state_spec : CircularAreaGetDataLength_safety_wit_4_state_spec.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_5_null_spec : CircularAreaGetDataLength_safety_wit_5_null_spec.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_6_state_spec : CircularAreaGetDataLength_safety_wit_6_state_spec.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_7_state_spec : CircularAreaGetDataLength_safety_wit_7_state_spec.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_8_state_spec : CircularAreaGetDataLength_safety_wit_8_state_spec.
Axiom proof_of_CircularAreaGetDataLength_entail_wit_1_state_spec : CircularAreaGetDataLength_entail_wit_1_state_spec.
Axiom proof_of_CircularAreaGetDataLength_entail_wit_2_state_spec : CircularAreaGetDataLength_entail_wit_2_state_spec.
Axiom proof_of_CircularAreaGetDataLength_return_wit_1_state_spec : CircularAreaGetDataLength_return_wit_1_state_spec.
Axiom proof_of_CircularAreaGetDataLength_return_wit_2_state_spec : CircularAreaGetDataLength_return_wit_2_state_spec.
Axiom proof_of_CircularAreaGetDataLength_return_wit_3_null_spec : CircularAreaGetDataLength_return_wit_3_null_spec.
Axiom proof_of_CircularAreaGetDataLength_partial_solve_wit_1_state_spec_pure : CircularAreaGetDataLength_partial_solve_wit_1_state_spec_pure.
Axiom proof_of_CircularAreaGetDataLength_partial_solve_wit_1_state_spec : CircularAreaGetDataLength_partial_solve_wit_1_state_spec.

End VC_Correct.
