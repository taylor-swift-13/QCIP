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
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_max_length.source Require Import xizi_circular_area_max_length_lib.
Local Open Scope sac.

(*----- Function CircularAreaGetMaxLength -----*)

Definition CircularAreaGetMaxLength_safety_wit_1_state_spec := 
forall (circular_area_pre: Z) (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (PreH1 : (circular_area_pre = area_addr_state_spec)) (PreH2 : (circular_area_pre <> 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec circular_area_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaGetMaxLength_safety_wit_2_null_spec := 
forall (circular_area_pre: Z) (LitMap_null_spec: (string -> Z)) (PreH1 : (circular_area_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap_null_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaGetMaxLength_safety_wit_3_state_spec := 
forall (circular_area_pre: Z) (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = area_addr_state_spec)) (PreH3 : (circular_area_pre <> 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec circular_area_pre )
|--
  “ False ”
.

Definition CircularAreaGetMaxLength_safety_wit_4_null_spec := 
forall (circular_area_pre: Z) (LitMap_null_spec: (string -> Z)) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap_null_spec )
|--
  “ False ”
.

Definition CircularAreaGetMaxLength_safety_wit_5_null_spec := 
forall (circular_area_pre: Z) (LitMap_null_spec: (string -> Z)) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap_null_spec )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaGetMaxLength_safety_wit_6_state_spec := 
forall (circular_area_pre: Z) (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = area_addr_state_spec)) (PreH3 : (circular_area_pre <> 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec circular_area_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaGetMaxLength_entail_wit_1_state_spec := 
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

Definition CircularAreaGetMaxLength_return_wit_1_state_spec := 
(
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (area_addr_state_spec <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
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
  “ ((ca_capacity (state_state_spec)) = (ca_capacity (state_state_spec))) ”
  &&  (GlobalStrings LitMap_state_spec )
  **  (store_circular_area state_state_spec area_addr_state_spec )
) \/
(
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state_state_spec)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state_state_spec)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (area_addr_state_spec <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
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
).

Definition CircularAreaGetMaxLength_return_wit_1_state_spec_split_goal_spatial := 
forall (area_addr_state_spec: Z) (LitMap_state_spec: (string -> Z)) (state_state_spec: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state_state_spec)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state_state_spec)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (area_addr_state_spec <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state_state_spec)) b_status (ca_contents (state_state_spec)) physical )) ,
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

Definition CircularAreaGetMaxLength_return_wit_2_null_spec := 
forall (circular_area_pre: Z) (LitMap_null_spec: (string -> Z)) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = 0)) ,
  (GlobalStrings LitMap_null_spec )
|--
  “ (circular_area_pre = 0) ” 
  &&  “ (1 = 1) ”
  &&  (GlobalStrings LitMap_null_spec )
.

Module Type VC_Correct.


Axiom proof_of_CircularAreaGetMaxLength_safety_wit_1_state_spec : CircularAreaGetMaxLength_safety_wit_1_state_spec.
Axiom proof_of_CircularAreaGetMaxLength_safety_wit_2_null_spec : CircularAreaGetMaxLength_safety_wit_2_null_spec.
Axiom proof_of_CircularAreaGetMaxLength_safety_wit_3_state_spec : CircularAreaGetMaxLength_safety_wit_3_state_spec.
Axiom proof_of_CircularAreaGetMaxLength_safety_wit_4_null_spec : CircularAreaGetMaxLength_safety_wit_4_null_spec.
Axiom proof_of_CircularAreaGetMaxLength_safety_wit_5_null_spec : CircularAreaGetMaxLength_safety_wit_5_null_spec.
Axiom proof_of_CircularAreaGetMaxLength_safety_wit_6_state_spec : CircularAreaGetMaxLength_safety_wit_6_state_spec.
Axiom proof_of_CircularAreaGetMaxLength_entail_wit_1_state_spec : CircularAreaGetMaxLength_entail_wit_1_state_spec.
Axiom proof_of_CircularAreaGetMaxLength_return_wit_1_state_spec : CircularAreaGetMaxLength_return_wit_1_state_spec.
Axiom proof_of_CircularAreaGetMaxLength_return_wit_2_null_spec : CircularAreaGetMaxLength_return_wit_2_null_spec.

End VC_Correct.
