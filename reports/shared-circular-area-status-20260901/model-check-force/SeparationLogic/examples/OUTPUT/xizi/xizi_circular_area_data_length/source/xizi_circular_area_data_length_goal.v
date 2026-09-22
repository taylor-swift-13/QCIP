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

Definition CircularAreaIsFull_safety_wit_1 := 
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (circular_area_pre = area_addr_state_spec)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource area_addr_state_spec data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsFull_safety_wit_2 := 
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = area_addr_state_spec)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource area_addr_state_spec data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaIsFull_safety_wit_3 := 
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = area_addr_state_spec)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource area_addr_state_spec data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsFull_safety_wit_4 := 
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (b_status_state_spec <> 0)) (PreH2 : (readidx_state_spec = writeidx_state_spec)) (PreH3 : (area_addr_state_spec = circular_area_pre)) (PreH4 : (area_addr_state_spec <> 0)) (PreH5 : (data_buffer_state_spec <> 0)) (PreH6 : (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec )) ,
  (store_stringLit (LitMap_state_spec (("the circular area is full
"%string))) ("the circular area is full
"%string) )
  **  (GlobalStrings_missing LitMap_state_spec (cons (("the circular area is full
"%string)) ((@nil string))) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> area_addr_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsFull_safety_wit_5 := 
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (b_status_state_spec <> 0)) (PreH2 : (readidx_state_spec = writeidx_state_spec)) (PreH3 : (area_addr_state_spec = circular_area_pre)) (PreH4 : (area_addr_state_spec <> 0)) (PreH5 : (data_buffer_state_spec <> 0)) (PreH6 : (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((( &( "circular_area" ) )) # Ptr  |-> area_addr_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaIsFull_safety_wit_6 := 
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (readidx_state_spec <> writeidx_state_spec)) (PreH2 : (area_addr_state_spec = circular_area_pre)) (PreH3 : (area_addr_state_spec <> 0)) (PreH4 : (data_buffer_state_spec <> 0)) (PreH5 : (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> area_addr_state_spec)
  **  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsFull_safety_wit_7 := 
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (b_status_state_spec = 0)) (PreH2 : (readidx_state_spec = writeidx_state_spec)) (PreH3 : (area_addr_state_spec = circular_area_pre)) (PreH4 : (area_addr_state_spec <> 0)) (PreH5 : (data_buffer_state_spec <> 0)) (PreH6 : (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> area_addr_state_spec)
  **  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsFull_entail_wit_1 := 
(
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = area_addr_state_spec)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource area_addr_state_spec data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
|--
  “ (area_addr_state_spec = circular_area_pre) ” 
  &&  “ (area_addr_state_spec <> 0) ” 
  &&  “ (data_buffer_state_spec <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> area_addr_state_spec)
  **  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
) \/
(
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = area_addr_state_spec)) ,
  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource area_addr_state_spec data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
|--
  “ (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec ) ” 
  &&  “ (data_buffer_state_spec <> 0) ”
  &&  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
).

Definition CircularAreaIsFull_entail_wit_1_split_goal_1 := 
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = area_addr_state_spec)) ,
  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource area_addr_state_spec data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
|--
  “ (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec ) ”
.

Definition CircularAreaIsFull_entail_wit_1_split_goal_2 := 
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = area_addr_state_spec)) ,
  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource area_addr_state_spec data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
|--
  “ (data_buffer_state_spec <> 0) ”
.

Definition CircularAreaIsFull_entail_wit_1_split_goal_spatial := 
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = area_addr_state_spec)) ,
  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource area_addr_state_spec data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
|--
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
.

Definition CircularAreaIsFull_return_wit_1 := 
(
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (readidx_state_spec <> writeidx_state_spec)) (PreH2 : (area_addr_state_spec = circular_area_pre)) (PreH3 : (area_addr_state_spec <> 0)) (PreH4 : (data_buffer_state_spec <> 0)) (PreH5 : (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
|--
  “ (CircularAreaFullResult area_length_state_spec logical_state_spec 0 ) ”
  &&  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource area_addr_state_spec data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
) \/
(
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (area_length_state_spec <= UINT_MAX)) (PreH2 : (area_length_state_spec >= 0)) (PreH3 : (b_status_state_spec <= INT_MAX)) (PreH4 : (b_status_state_spec >= INT_MIN)) (PreH5 : (readidx_state_spec <> writeidx_state_spec)) (PreH6 : (area_addr_state_spec = circular_area_pre)) (PreH7 : (area_addr_state_spec <> 0)) (PreH8 : (data_buffer_state_spec <> 0)) (PreH9 : (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
|--
  “ (CircularAreaFullResult area_length_state_spec logical_state_spec 0 ) ”
  &&  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource area_addr_state_spec data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
).

Definition CircularAreaIsFull_return_wit_1_split_goal_1 := 
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (area_length_state_spec <= UINT_MAX)) (PreH2 : (area_length_state_spec >= 0)) (PreH3 : (b_status_state_spec <= INT_MAX)) (PreH4 : (b_status_state_spec >= INT_MIN)) (PreH5 : (readidx_state_spec <> writeidx_state_spec)) (PreH6 : (area_addr_state_spec = circular_area_pre)) (PreH7 : (area_addr_state_spec <> 0)) (PreH8 : (data_buffer_state_spec <> 0)) (PreH9 : (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
|--
  “ (CircularAreaFullResult area_length_state_spec logical_state_spec 0 ) ”
.

Definition CircularAreaIsFull_return_wit_1_split_goal_spatial := 
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (area_length_state_spec <= UINT_MAX)) (PreH2 : (area_length_state_spec >= 0)) (PreH3 : (b_status_state_spec <= INT_MAX)) (PreH4 : (b_status_state_spec >= INT_MIN)) (PreH5 : (readidx_state_spec <> writeidx_state_spec)) (PreH6 : (area_addr_state_spec = circular_area_pre)) (PreH7 : (area_addr_state_spec <> 0)) (PreH8 : (data_buffer_state_spec <> 0)) (PreH9 : (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
|--
  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource area_addr_state_spec data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
.

Definition CircularAreaIsFull_return_wit_2 := 
(
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (b_status_state_spec = 0)) (PreH2 : (readidx_state_spec = writeidx_state_spec)) (PreH3 : (area_addr_state_spec = circular_area_pre)) (PreH4 : (area_addr_state_spec <> 0)) (PreH5 : (data_buffer_state_spec <> 0)) (PreH6 : (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
|--
  “ (CircularAreaFullResult area_length_state_spec logical_state_spec 0 ) ”
  &&  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource area_addr_state_spec data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
) \/
(
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (area_length_state_spec <= UINT_MAX)) (PreH2 : (area_length_state_spec >= 0)) (PreH3 : (b_status_state_spec <= INT_MAX)) (PreH4 : (b_status_state_spec >= INT_MIN)) (PreH5 : (b_status_state_spec = 0)) (PreH6 : (readidx_state_spec = writeidx_state_spec)) (PreH7 : (area_addr_state_spec = circular_area_pre)) (PreH8 : (area_addr_state_spec <> 0)) (PreH9 : (data_buffer_state_spec <> 0)) (PreH10 : (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
|--
  “ (CircularAreaFullResult area_length_state_spec logical_state_spec 0 ) ”
  &&  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource area_addr_state_spec data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
).

Definition CircularAreaIsFull_return_wit_2_split_goal_1 := 
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (area_length_state_spec <= UINT_MAX)) (PreH2 : (area_length_state_spec >= 0)) (PreH3 : (b_status_state_spec <= INT_MAX)) (PreH4 : (b_status_state_spec >= INT_MIN)) (PreH5 : (b_status_state_spec = 0)) (PreH6 : (readidx_state_spec = writeidx_state_spec)) (PreH7 : (area_addr_state_spec = circular_area_pre)) (PreH8 : (area_addr_state_spec <> 0)) (PreH9 : (data_buffer_state_spec <> 0)) (PreH10 : (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
|--
  “ (CircularAreaFullResult area_length_state_spec logical_state_spec 0 ) ”
.

Definition CircularAreaIsFull_return_wit_2_split_goal_spatial := 
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (area_length_state_spec <= UINT_MAX)) (PreH2 : (area_length_state_spec >= 0)) (PreH3 : (b_status_state_spec <= INT_MAX)) (PreH4 : (b_status_state_spec >= INT_MIN)) (PreH5 : (b_status_state_spec = 0)) (PreH6 : (readidx_state_spec = writeidx_state_spec)) (PreH7 : (area_addr_state_spec = circular_area_pre)) (PreH8 : (area_addr_state_spec <> 0)) (PreH9 : (data_buffer_state_spec <> 0)) (PreH10 : (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
|--
  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource area_addr_state_spec data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
.

Definition CircularAreaIsFull_return_wit_3 := 
(
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (b_status_state_spec <> 0)) (PreH2 : (readidx_state_spec = writeidx_state_spec)) (PreH3 : (area_addr_state_spec = circular_area_pre)) (PreH4 : (area_addr_state_spec <> 0)) (PreH5 : (data_buffer_state_spec <> 0)) (PreH6 : (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
|--
  “ (CircularAreaFullResult area_length_state_spec logical_state_spec 1 ) ”
  &&  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource area_addr_state_spec data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
) \/
(
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (area_length_state_spec <= UINT_MAX)) (PreH2 : (area_length_state_spec >= 0)) (PreH3 : (b_status_state_spec <= INT_MAX)) (PreH4 : (b_status_state_spec >= INT_MIN)) (PreH5 : (b_status_state_spec <> 0)) (PreH6 : (readidx_state_spec = writeidx_state_spec)) (PreH7 : (area_addr_state_spec = circular_area_pre)) (PreH8 : (area_addr_state_spec <> 0)) (PreH9 : (data_buffer_state_spec <> 0)) (PreH10 : (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
|--
  “ (CircularAreaFullResult area_length_state_spec logical_state_spec 1 ) ”
  &&  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource area_addr_state_spec data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
).

Definition CircularAreaIsFull_return_wit_3_split_goal_1 := 
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (area_length_state_spec <= UINT_MAX)) (PreH2 : (area_length_state_spec >= 0)) (PreH3 : (b_status_state_spec <= INT_MAX)) (PreH4 : (b_status_state_spec >= INT_MIN)) (PreH5 : (b_status_state_spec <> 0)) (PreH6 : (readidx_state_spec = writeidx_state_spec)) (PreH7 : (area_addr_state_spec = circular_area_pre)) (PreH8 : (area_addr_state_spec <> 0)) (PreH9 : (data_buffer_state_spec <> 0)) (PreH10 : (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
|--
  “ (CircularAreaFullResult area_length_state_spec logical_state_spec 1 ) ”
.

Definition CircularAreaIsFull_return_wit_3_split_goal_spatial := 
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (area_length_state_spec <= UINT_MAX)) (PreH2 : (area_length_state_spec >= 0)) (PreH3 : (b_status_state_spec <= INT_MAX)) (PreH4 : (b_status_state_spec >= INT_MIN)) (PreH5 : (b_status_state_spec <> 0)) (PreH6 : (readidx_state_spec = writeidx_state_spec)) (PreH7 : (area_addr_state_spec = circular_area_pre)) (PreH8 : (area_addr_state_spec <> 0)) (PreH9 : (data_buffer_state_spec <> 0)) (PreH10 : (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
|--
  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource area_addr_state_spec data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
.

Definition CircularAreaIsFull_return_wit_4 := 
(
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = area_addr_state_spec)) ,
  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource area_addr_state_spec data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
|--
  “ (CircularAreaFullResult area_length_state_spec logical_state_spec 1 ) ”
  &&  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource area_addr_state_spec data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
) \/
(
forall (circular_area_pre: Z) (logical_state_spec: (@list Z)) (area_length_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = area_addr_state_spec)) ,
  TT && emp 
|--
  “ (CircularAreaFullResult area_length_state_spec logical_state_spec 1 ) ”
  &&  emp
).

Definition CircularAreaIsFull_return_wit_4_split_goal_1 := 
forall (circular_area_pre: Z) (logical_state_spec: (@list Z)) (area_length_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = area_addr_state_spec)) ,
  (CircularAreaFullResult area_length_state_spec logical_state_spec 1 )
.

Definition CircularAreaIsFull_partial_solve_wit_1_pure := 
(
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (b_status_state_spec <> 0)) (PreH2 : (readidx_state_spec = writeidx_state_spec)) (PreH3 : (area_addr_state_spec = circular_area_pre)) (PreH4 : (area_addr_state_spec <> 0)) (PreH5 : (data_buffer_state_spec <> 0)) (PreH6 : (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec )) ,
  (store_stringLit (LitMap_state_spec (("the circular area is full
"%string))) ("the circular area is full
"%string) )
  **  (GlobalStrings_missing LitMap_state_spec (cons (("the circular area is full
"%string)) ((@nil string))) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> area_addr_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
|--
  “ (((LitMap_state_spec (("the circular area is full
"%string))) + (0 * sizeof(CHAR))) = (LitMap_state_spec (("the circular area is full
"%string)))) ”
) \/
(
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (area_length_state_spec <= UINT_MAX)) (PreH2 : (area_length_state_spec >= 0)) (PreH3 : (b_status_state_spec <= INT_MAX)) (PreH4 : (b_status_state_spec >= INT_MIN)) (PreH5 : (b_status_state_spec <> 0)) (PreH6 : (readidx_state_spec = writeidx_state_spec)) (PreH7 : (area_addr_state_spec = circular_area_pre)) (PreH8 : (area_addr_state_spec <> 0)) (PreH9 : (data_buffer_state_spec <> 0)) (PreH10 : (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((( &( "circular_area" ) )) # Ptr  |-> area_addr_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
|--
  “ (((LitMap_state_spec (("the circular area is full
"%string))) + (0 * sizeof(CHAR))) = (LitMap_state_spec (("the circular area is full
"%string)))) ”
).

Definition CircularAreaIsFull_partial_solve_wit_1_pure_split_goal_1 := 
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (area_length_state_spec <= UINT_MAX)) (PreH2 : (area_length_state_spec >= 0)) (PreH3 : (b_status_state_spec <= INT_MAX)) (PreH4 : (b_status_state_spec >= INT_MIN)) (PreH5 : (b_status_state_spec <> 0)) (PreH6 : (readidx_state_spec = writeidx_state_spec)) (PreH7 : (area_addr_state_spec = circular_area_pre)) (PreH8 : (area_addr_state_spec <> 0)) (PreH9 : (data_buffer_state_spec <> 0)) (PreH10 : (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((( &( "circular_area" ) )) # Ptr  |-> area_addr_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
|--
  “ (((LitMap_state_spec (("the circular area is full
"%string))) + (0 * sizeof(CHAR))) = (LitMap_state_spec (("the circular area is full
"%string)))) ”
.

Definition CircularAreaIsFull_partial_solve_wit_1_aux := 
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (b_status_state_spec <> 0)) (PreH2 : (readidx_state_spec = writeidx_state_spec)) (PreH3 : (area_addr_state_spec = circular_area_pre)) (PreH4 : (area_addr_state_spec <> 0)) (PreH5 : (data_buffer_state_spec <> 0)) (PreH6 : (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec )) ,
  (store_stringLit (LitMap_state_spec (("the circular area is full
"%string))) ("the circular area is full
"%string) )
  **  (GlobalStrings_missing LitMap_state_spec (cons (("the circular area is full
"%string)) ((@nil string))) )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
|--
  “ (((LitMap_state_spec (("the circular area is full
"%string))) + (0 * sizeof(CHAR))) = (LitMap_state_spec (("the circular area is full
"%string)))) ” 
  &&  “ (b_status_state_spec <> 0) ” 
  &&  “ (readidx_state_spec = writeidx_state_spec) ” 
  &&  “ (area_addr_state_spec = circular_area_pre) ” 
  &&  “ (area_addr_state_spec <> 0) ” 
  &&  “ (data_buffer_state_spec <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec ) ”
  &&  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
.

Definition CircularAreaIsFull_partial_solve_wit_1 := CircularAreaIsFull_partial_solve_wit_1_pure -> CircularAreaIsFull_partial_solve_wit_1_aux.

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
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (circular_area_pre = area_addr_state_spec)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource area_addr_state_spec data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
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

Definition CircularAreaGetDataLength_safety_wit_4_null_spec := 
forall (circular_area_pre: Z) (LitMap_null_spec: (string -> Z)) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap_null_spec )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaGetDataLength_safety_wit_5_state_spec := 
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = area_addr_state_spec)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource area_addr_state_spec data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaGetDataLength_safety_wit_6_state_spec := 
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = area_addr_state_spec)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource area_addr_state_spec data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaGetDataLength_safety_wit_7_state_spec := 
(
forall (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (area_addr_state_spec <> 0)) (PreH2 : (data_buffer_state_spec <> 0)) (PreH3 : ((Zlength (logical_state_spec)) < area_length_state_spec)) (PreH4 : (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> area_addr_state_spec)
  **  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
|--
  “ (area_length_state_spec <> 0) ”
) \/
(
forall (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (area_addr_state_spec <> 0)) (PreH2 : (data_buffer_state_spec <> 0)) (PreH3 : ((Zlength (logical_state_spec)) < area_length_state_spec)) (PreH4 : (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> area_addr_state_spec)
  **  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
|--
  “ (area_length_state_spec <> 0) ”
).

Definition CircularAreaGetDataLength_safety_wit_7_state_spec_split_goal_1 := 
forall (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (area_addr_state_spec <> 0)) (PreH2 : (data_buffer_state_spec <> 0)) (PreH3 : ((Zlength (logical_state_spec)) < area_length_state_spec)) (PreH4 : (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> area_addr_state_spec)
  **  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
|--
  “ (area_length_state_spec <> 0) ”
.

Definition CircularAreaGetDataLength_safety_wit_8_state_spec := 
(
forall (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (area_addr_state_spec <> 0)) (PreH2 : (data_buffer_state_spec <> 0)) (PreH3 : ((Zlength (logical_state_spec)) < area_length_state_spec)) (PreH4 : (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> area_addr_state_spec)
  **  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
|--
  “ ((writeidx_state_spec - readidx_state_spec ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (writeidx_state_spec - readidx_state_spec )) ”
) \/
(
forall (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (area_addr_state_spec <> 0)) (PreH2 : (data_buffer_state_spec <> 0)) (PreH3 : ((Zlength (logical_state_spec)) < area_length_state_spec)) (PreH4 : (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> area_addr_state_spec)
  **  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
|--
  “ ((writeidx_state_spec - readidx_state_spec ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (writeidx_state_spec - readidx_state_spec )) ”
).

Definition CircularAreaGetDataLength_safety_wit_8_state_spec_split_goal_1 := 
forall (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (area_addr_state_spec <> 0)) (PreH2 : (data_buffer_state_spec <> 0)) (PreH3 : ((Zlength (logical_state_spec)) < area_length_state_spec)) (PreH4 : (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> area_addr_state_spec)
  **  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
|--
  “ ((writeidx_state_spec - readidx_state_spec ) <= INT_MAX) ”
.

Definition CircularAreaGetDataLength_safety_wit_8_state_spec_split_goal_2 := 
forall (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (area_addr_state_spec <> 0)) (PreH2 : (data_buffer_state_spec <> 0)) (PreH3 : ((Zlength (logical_state_spec)) < area_length_state_spec)) (PreH4 : (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> area_addr_state_spec)
  **  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
|--
  “ ((INT_MIN) <= (writeidx_state_spec - readidx_state_spec )) ”
.

Definition CircularAreaGetDataLength_entail_wit_1_state_spec := 
(
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (retval: Z) (PreH1 : (CircularAreaFullResult area_length_state_spec logical_state_spec retval )) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = area_addr_state_spec)) (PreH4 : (retval <> 0)) ,
  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource circular_area_pre data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  “ (area_addr_state_spec <> 0) ” 
  &&  “ (data_buffer_state_spec <> 0) ” 
  &&  “ ((Zlength (logical_state_spec)) = area_length_state_spec) ” 
  &&  “ (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> area_addr_state_spec)
  **  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
) \/
(
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (retval: Z) (PreH1 : (CircularAreaFullResult area_length_state_spec logical_state_spec retval )) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = area_addr_state_spec)) (PreH4 : (retval <> 0)) ,
  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource circular_area_pre data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
|--
  “ (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec ) ” 
  &&  “ ((Zlength (logical_state_spec)) = area_length_state_spec) ” 
  &&  “ (data_buffer_state_spec <> 0) ”
  &&  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
).

Definition CircularAreaGetDataLength_entail_wit_1_state_spec_split_goal_1 := 
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (retval: Z) (PreH1 : (CircularAreaFullResult area_length_state_spec logical_state_spec retval )) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = area_addr_state_spec)) (PreH4 : (retval <> 0)) ,
  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource circular_area_pre data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
|--
  “ (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec ) ”
.

Definition CircularAreaGetDataLength_entail_wit_1_state_spec_split_goal_2 := 
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (retval: Z) (PreH1 : (CircularAreaFullResult area_length_state_spec logical_state_spec retval )) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = area_addr_state_spec)) (PreH4 : (retval <> 0)) ,
  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource circular_area_pre data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
|--
  “ ((Zlength (logical_state_spec)) = area_length_state_spec) ”
.

Definition CircularAreaGetDataLength_entail_wit_1_state_spec_split_goal_3 := 
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (retval: Z) (PreH1 : (CircularAreaFullResult area_length_state_spec logical_state_spec retval )) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = area_addr_state_spec)) (PreH4 : (retval <> 0)) ,
  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource circular_area_pre data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
|--
  “ (data_buffer_state_spec <> 0) ”
.

Definition CircularAreaGetDataLength_entail_wit_1_state_spec_split_goal_spatial := 
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (retval: Z) (PreH1 : (CircularAreaFullResult area_length_state_spec logical_state_spec retval )) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = area_addr_state_spec)) (PreH4 : (retval <> 0)) ,
  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource circular_area_pre data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
|--
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
.

Definition CircularAreaGetDataLength_entail_wit_2_state_spec := 
(
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (retval: Z) (PreH1 : (CircularAreaFullResult area_length_state_spec logical_state_spec retval )) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = area_addr_state_spec)) (PreH4 : (retval = 0)) ,
  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource circular_area_pre data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  “ (area_addr_state_spec <> 0) ” 
  &&  “ (data_buffer_state_spec <> 0) ” 
  &&  “ ((Zlength (logical_state_spec)) < area_length_state_spec) ” 
  &&  “ (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> area_addr_state_spec)
  **  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
) \/
(
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (retval: Z) (PreH1 : (CircularAreaFullResult area_length_state_spec logical_state_spec retval )) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = area_addr_state_spec)) (PreH4 : (retval = 0)) ,
  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource circular_area_pre data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
|--
  “ (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec ) ” 
  &&  “ ((Zlength (logical_state_spec)) < area_length_state_spec) ” 
  &&  “ (data_buffer_state_spec <> 0) ”
  &&  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
).

Definition CircularAreaGetDataLength_entail_wit_2_state_spec_split_goal_1 := 
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (retval: Z) (PreH1 : (CircularAreaFullResult area_length_state_spec logical_state_spec retval )) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = area_addr_state_spec)) (PreH4 : (retval = 0)) ,
  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource circular_area_pre data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
|--
  “ (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec ) ”
.

Definition CircularAreaGetDataLength_entail_wit_2_state_spec_split_goal_2 := 
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (retval: Z) (PreH1 : (CircularAreaFullResult area_length_state_spec logical_state_spec retval )) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = area_addr_state_spec)) (PreH4 : (retval = 0)) ,
  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource circular_area_pre data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
|--
  “ ((Zlength (logical_state_spec)) < area_length_state_spec) ”
.

Definition CircularAreaGetDataLength_entail_wit_2_state_spec_split_goal_3 := 
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (retval: Z) (PreH1 : (CircularAreaFullResult area_length_state_spec logical_state_spec retval )) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = area_addr_state_spec)) (PreH4 : (retval = 0)) ,
  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource circular_area_pre data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
|--
  “ (data_buffer_state_spec <> 0) ”
.

Definition CircularAreaGetDataLength_entail_wit_2_state_spec_split_goal_spatial := 
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (retval: Z) (PreH1 : (CircularAreaFullResult area_length_state_spec logical_state_spec retval )) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = area_addr_state_spec)) (PreH4 : (retval = 0)) ,
  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource circular_area_pre data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
|--
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
.

Definition CircularAreaGetDataLength_return_wit_1_state_spec := 
(
forall (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (area_addr_state_spec <> 0)) (PreH2 : (data_buffer_state_spec <> 0)) (PreH3 : ((Zlength (logical_state_spec)) < area_length_state_spec)) (PreH4 : (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
|--
  “ (CircularAreaDataLengthResult logical_state_spec ((unsigned_last_nbits (((unsigned_last_nbits ((writeidx_state_spec - readidx_state_spec )) (32)) + area_length_state_spec )) (32)) % ( area_length_state_spec ) ) ) ”
  &&  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource area_addr_state_spec data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
) \/
(
forall (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (area_length_state_spec <= UINT_MAX)) (PreH2 : (area_length_state_spec >= 0)) (PreH3 : (b_status_state_spec <= INT_MAX)) (PreH4 : (b_status_state_spec >= INT_MIN)) (PreH5 : (area_addr_state_spec <> 0)) (PreH6 : (data_buffer_state_spec <> 0)) (PreH7 : ((Zlength (logical_state_spec)) < area_length_state_spec)) (PreH8 : (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
|--
  “ (CircularAreaDataLengthResult logical_state_spec ((unsigned_last_nbits (((unsigned_last_nbits ((writeidx_state_spec - readidx_state_spec )) (32)) + area_length_state_spec )) (32)) % ( area_length_state_spec ) ) ) ”
  &&  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource area_addr_state_spec data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
).

Definition CircularAreaGetDataLength_return_wit_1_state_spec_split_goal_1 := 
forall (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (area_length_state_spec <= UINT_MAX)) (PreH2 : (area_length_state_spec >= 0)) (PreH3 : (b_status_state_spec <= INT_MAX)) (PreH4 : (b_status_state_spec >= INT_MIN)) (PreH5 : (area_addr_state_spec <> 0)) (PreH6 : (data_buffer_state_spec <> 0)) (PreH7 : ((Zlength (logical_state_spec)) < area_length_state_spec)) (PreH8 : (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
|--
  “ (CircularAreaDataLengthResult logical_state_spec ((unsigned_last_nbits (((unsigned_last_nbits ((writeidx_state_spec - readidx_state_spec )) (32)) + area_length_state_spec )) (32)) % ( area_length_state_spec ) ) ) ”
.

Definition CircularAreaGetDataLength_return_wit_1_state_spec_split_goal_spatial := 
forall (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (area_length_state_spec <= UINT_MAX)) (PreH2 : (area_length_state_spec >= 0)) (PreH3 : (b_status_state_spec <= INT_MAX)) (PreH4 : (b_status_state_spec >= INT_MIN)) (PreH5 : (area_addr_state_spec <> 0)) (PreH6 : (data_buffer_state_spec <> 0)) (PreH7 : ((Zlength (logical_state_spec)) < area_length_state_spec)) (PreH8 : (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
|--
  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource area_addr_state_spec data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
.

Definition CircularAreaGetDataLength_return_wit_2_state_spec := 
(
forall (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (area_addr_state_spec <> 0)) (PreH2 : (data_buffer_state_spec <> 0)) (PreH3 : ((Zlength (logical_state_spec)) = area_length_state_spec)) (PreH4 : (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
|--
  “ (CircularAreaDataLengthResult logical_state_spec area_length_state_spec ) ”
  &&  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource area_addr_state_spec data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
) \/
(
forall (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (area_length_state_spec <= UINT_MAX)) (PreH2 : (area_length_state_spec >= 0)) (PreH3 : (b_status_state_spec <= INT_MAX)) (PreH4 : (b_status_state_spec >= INT_MIN)) (PreH5 : (area_addr_state_spec <> 0)) (PreH6 : (data_buffer_state_spec <> 0)) (PreH7 : ((Zlength (logical_state_spec)) = area_length_state_spec)) (PreH8 : (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
|--
  “ (CircularAreaDataLengthResult logical_state_spec area_length_state_spec ) ”
  &&  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource area_addr_state_spec data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
).

Definition CircularAreaGetDataLength_return_wit_2_state_spec_split_goal_1 := 
forall (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (area_length_state_spec <= UINT_MAX)) (PreH2 : (area_length_state_spec >= 0)) (PreH3 : (b_status_state_spec <= INT_MAX)) (PreH4 : (b_status_state_spec >= INT_MIN)) (PreH5 : (area_addr_state_spec <> 0)) (PreH6 : (data_buffer_state_spec <> 0)) (PreH7 : ((Zlength (logical_state_spec)) = area_length_state_spec)) (PreH8 : (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
|--
  “ (CircularAreaDataLengthResult logical_state_spec area_length_state_spec ) ”
.

Definition CircularAreaGetDataLength_return_wit_2_state_spec_split_goal_spatial := 
forall (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (area_length_state_spec <= UINT_MAX)) (PreH2 : (area_length_state_spec >= 0)) (PreH3 : (b_status_state_spec <= INT_MAX)) (PreH4 : (b_status_state_spec >= INT_MIN)) (PreH5 : (area_addr_state_spec <> 0)) (PreH6 : (data_buffer_state_spec <> 0)) (PreH7 : ((Zlength (logical_state_spec)) = area_length_state_spec)) (PreH8 : (CircularAreaLogicalState readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec logical_state_spec physical_state_spec )) ,
  (GlobalStrings LitMap_state_spec )
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_state_spec + area_length_state_spec ))
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_state_spec)
  **  ((&((area_addr_state_spec)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_state_spec)
  **  (UCharArray.mixed_full data_buffer_state_spec area_length_state_spec physical_state_spec )
|--
  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource area_addr_state_spec data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
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

Definition CircularAreaGetDataLength_return_wit_4_state_spec := 
(
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = area_addr_state_spec)) ,
  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource area_addr_state_spec data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
|--
  “ (CircularAreaDataLengthResult logical_state_spec 1 ) ”
  &&  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource area_addr_state_spec data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
) \/
(
forall (circular_area_pre: Z) (logical_state_spec: (@list Z)) (area_addr_state_spec: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = area_addr_state_spec)) ,
  TT && emp 
|--
  “ (CircularAreaDataLengthResult logical_state_spec 1 ) ”
  &&  emp
).

Definition CircularAreaGetDataLength_return_wit_4_state_spec_split_goal_1 := 
forall (circular_area_pre: Z) (logical_state_spec: (@list Z)) (area_addr_state_spec: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = area_addr_state_spec)) ,
  (CircularAreaDataLengthResult logical_state_spec 1 )
.

Definition CircularAreaGetDataLength_partial_solve_wit_1_state_spec_pure := 
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = area_addr_state_spec)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource area_addr_state_spec data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
|--
  “ (circular_area_pre = circular_area_pre) ”
.

Definition CircularAreaGetDataLength_partial_solve_wit_1_state_spec_aux := 
forall (circular_area_pre: Z) (LitMap_state_spec: (string -> Z)) (physical_state_spec: (@list (@option Z))) (logical_state_spec: (@list Z)) (operations_state_spec: Z) (b_status_state_spec: Z) (area_length_state_spec: Z) (writeidx_state_spec: Z) (readidx_state_spec: Z) (data_buffer_state_spec: Z) (area_addr_state_spec: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = area_addr_state_spec)) ,
  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource area_addr_state_spec data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
|--
  “ (circular_area_pre = circular_area_pre) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre = area_addr_state_spec) ”
  &&  (GlobalStrings LitMap_state_spec )
  **  (CircularAreaBackingResource circular_area_pre data_buffer_state_spec readidx_state_spec writeidx_state_spec area_length_state_spec b_status_state_spec operations_state_spec logical_state_spec physical_state_spec )
.

Definition CircularAreaGetDataLength_partial_solve_wit_1_state_spec := CircularAreaGetDataLength_partial_solve_wit_1_state_spec_pure -> CircularAreaGetDataLength_partial_solve_wit_1_state_spec_aux.

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
Axiom proof_of_CircularAreaIsFull_return_wit_4 : CircularAreaIsFull_return_wit_4.
Axiom proof_of_CircularAreaIsFull_partial_solve_wit_1_pure : CircularAreaIsFull_partial_solve_wit_1_pure.
Axiom proof_of_CircularAreaIsFull_partial_solve_wit_1 : CircularAreaIsFull_partial_solve_wit_1.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_1_null_spec : CircularAreaGetDataLength_safety_wit_1_null_spec.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_2_state_spec : CircularAreaGetDataLength_safety_wit_2_state_spec.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_3_null_spec : CircularAreaGetDataLength_safety_wit_3_null_spec.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_4_null_spec : CircularAreaGetDataLength_safety_wit_4_null_spec.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_5_state_spec : CircularAreaGetDataLength_safety_wit_5_state_spec.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_6_state_spec : CircularAreaGetDataLength_safety_wit_6_state_spec.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_7_state_spec : CircularAreaGetDataLength_safety_wit_7_state_spec.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_8_state_spec : CircularAreaGetDataLength_safety_wit_8_state_spec.
Axiom proof_of_CircularAreaGetDataLength_entail_wit_1_state_spec : CircularAreaGetDataLength_entail_wit_1_state_spec.
Axiom proof_of_CircularAreaGetDataLength_entail_wit_2_state_spec : CircularAreaGetDataLength_entail_wit_2_state_spec.
Axiom proof_of_CircularAreaGetDataLength_return_wit_1_state_spec : CircularAreaGetDataLength_return_wit_1_state_spec.
Axiom proof_of_CircularAreaGetDataLength_return_wit_2_state_spec : CircularAreaGetDataLength_return_wit_2_state_spec.
Axiom proof_of_CircularAreaGetDataLength_return_wit_3_null_spec : CircularAreaGetDataLength_return_wit_3_null_spec.
Axiom proof_of_CircularAreaGetDataLength_return_wit_4_state_spec : CircularAreaGetDataLength_return_wit_4_state_spec.
Axiom proof_of_CircularAreaGetDataLength_partial_solve_wit_1_state_spec_pure : CircularAreaGetDataLength_partial_solve_wit_1_state_spec_pure.
Axiom proof_of_CircularAreaGetDataLength_partial_solve_wit_1_state_spec : CircularAreaGetDataLength_partial_solve_wit_1_state_spec.

End VC_Correct.
