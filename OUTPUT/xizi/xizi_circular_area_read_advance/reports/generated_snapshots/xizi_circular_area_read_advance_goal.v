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
forall (data_length_pre: Z) (circular_area_pre: Z) (area_addr: Z) (LitMap: (string -> Z)) (state: circular_area_state) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (CircularAreaDivideRdDataInput state LitMap circular_area_pre data_length_pre area_addr )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaDivideRdData_safety_wit_2 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (area_addr: Z) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (circular_area_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (CircularAreaDivideRdDataInput state LitMap circular_area_pre data_length_pre area_addr )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaDivideRdData_safety_wit_3 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (area_addr: Z) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (circular_area_pre <> 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (CircularAreaDivideRdDataInput state LitMap circular_area_pre data_length_pre area_addr )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaDivideRdData_safety_wit_4 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (area_addr: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + data_length_pre )) (32)) <= (ca_capacity (state)))) (PreH2 : (area_addr = circular_area_pre)) (PreH3 : (area_addr <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (0 <= data_length_pre)) (PreH6 : (data_length_pre <= (Zlength ((ca_contents (state)))))) (PreH7 : ((readidx + data_length_pre ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> area_addr)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((area_addr)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((area_addr)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((area_addr)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaDivideRdData_safety_wit_5 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (area_addr: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + data_length_pre )) (32)) > (ca_capacity (state)))) (PreH2 : (area_addr = circular_area_pre)) (PreH3 : (area_addr <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (0 <= data_length_pre)) (PreH6 : (data_length_pre <= (Zlength ((ca_contents (state)))))) (PreH7 : ((readidx + data_length_pre ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> area_addr)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((area_addr)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((area_addr)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((area_addr)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaDivideRdData_entail_wit_1 := 
(
forall (data_length_pre: Z) (circular_area_pre: Z) (area_addr: Z) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (circular_area_pre <> 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (CircularAreaDivideRdDataInput state LitMap circular_area_pre data_length_pre area_addr )
|--
  EX (operations: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (readidx: Z)  (data_buffer: Z) ,
  “ (area_addr = circular_area_pre) ” 
  &&  “ (area_addr <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= (Zlength ((ca_contents (state))))) ” 
  &&  “ ((readidx + data_length_pre ) <= UINT_MAX) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> area_addr)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((area_addr)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((area_addr)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((area_addr)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (data_length_pre: Z) (circular_area_pre: Z) (area_addr: Z) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (circular_area_pre <> 0)) ,
  (CircularAreaDivideRdDataInput state LitMap circular_area_pre data_length_pre area_addr )
|--
  EX (operations: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (readidx: Z)  (data_buffer: Z) ,
  “ (circular_area_pre = area_addr) ” 
  &&  “ (area_addr = circular_area_pre) ” 
  &&  “ (area_addr <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= (Zlength ((ca_contents (state))))) ” 
  &&  “ ((readidx + data_length_pre ) <= UINT_MAX) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((area_addr)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((area_addr)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((area_addr)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
).

Definition CircularAreaDivideRdData_return_wit_1 := 
(
forall (data_length_pre: Z) (circular_area_pre: Z) (area_addr: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer_2: Z) (operations_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx_2) (32)) + data_length_pre )) (32)) > (ca_capacity (state)))) (PreH2 : (area_addr = circular_area_pre)) (PreH3 : (area_addr <> 0)) (PreH4 : (data_buffer_2 <> 0)) (PreH5 : (0 <= data_length_pre)) (PreH6 : (data_length_pre <= (Zlength ((ca_contents (state)))))) (PreH7 : ((readidx_2 + data_length_pre ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer_2 (ca_capacity (state)) physical_2 )
  **  ((&((area_addr)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_2)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_2)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_2)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_2)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_2 + (ca_capacity (state)) ))
  **  ((&((area_addr)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((area_addr)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_2)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_2)
|--
  EX (operations: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (readidx: Z)  (data_buffer: Z) ,
  “ (area_addr <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaStateDivideRdDataResult state data_length_pre 1 ) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx data_length_pre (ca_capacity (state)) 1 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((area_addr)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((area_addr)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((area_addr)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (data_length_pre: Z) (circular_area_pre: Z) (area_addr: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx_2) (32)) + data_length_pre )) (32)) > (ca_capacity (state)))) (PreH2 : (area_addr = circular_area_pre)) (PreH3 : (area_addr <> 0)) (PreH4 : (data_buffer_2 <> 0)) (PreH5 : (0 <= data_length_pre)) (PreH6 : (data_length_pre <= (Zlength ((ca_contents (state)))))) (PreH7 : ((readidx_2 + data_length_pre ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  TT && emp 
|--
  “ (CircularAreaDivideRdDataResult readidx_2 data_length_pre (ca_capacity (state)) 1 ) ” 
  &&  “ (CircularAreaStateDivideRdDataResult state data_length_pre 1 ) ”
  &&  emp
).

Definition CircularAreaDivideRdData_return_wit_1_split_goal_1 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (area_addr: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx_2) (32)) + data_length_pre )) (32)) > (ca_capacity (state)))) (PreH2 : (area_addr = circular_area_pre)) (PreH3 : (area_addr <> 0)) (PreH4 : (data_buffer_2 <> 0)) (PreH5 : (0 <= data_length_pre)) (PreH6 : (data_length_pre <= (Zlength ((ca_contents (state)))))) (PreH7 : ((readidx_2 + data_length_pre ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  (CircularAreaDivideRdDataResult readidx_2 data_length_pre (ca_capacity (state)) 1 )
.

Definition CircularAreaDivideRdData_return_wit_1_split_goal_2 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (area_addr: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx_2) (32)) + data_length_pre )) (32)) > (ca_capacity (state)))) (PreH2 : (area_addr = circular_area_pre)) (PreH3 : (area_addr <> 0)) (PreH4 : (data_buffer_2 <> 0)) (PreH5 : (0 <= data_length_pre)) (PreH6 : (data_length_pre <= (Zlength ((ca_contents (state)))))) (PreH7 : ((readidx_2 + data_length_pre ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  (CircularAreaStateDivideRdDataResult state data_length_pre 1 )
.

Definition CircularAreaDivideRdData_return_wit_2 := 
(
forall (data_length_pre: Z) (circular_area_pre: Z) (area_addr: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer_2: Z) (operations_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx_2) (32)) + data_length_pre )) (32)) <= (ca_capacity (state)))) (PreH2 : (area_addr = circular_area_pre)) (PreH3 : (area_addr <> 0)) (PreH4 : (data_buffer_2 <> 0)) (PreH5 : (0 <= data_length_pre)) (PreH6 : (data_length_pre <= (Zlength ((ca_contents (state)))))) (PreH7 : ((readidx_2 + data_length_pre ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer_2 (ca_capacity (state)) physical_2 )
  **  ((&((area_addr)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_2)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_2)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_2)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_2)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_2 + (ca_capacity (state)) ))
  **  ((&((area_addr)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((area_addr)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_2)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_2)
|--
  EX (operations: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (readidx: Z)  (data_buffer: Z) ,
  “ (area_addr <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaStateDivideRdDataResult state data_length_pre 0 ) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx data_length_pre (ca_capacity (state)) 0 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((area_addr)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((area_addr)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((area_addr)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (data_length_pre: Z) (circular_area_pre: Z) (area_addr: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx_2) (32)) + data_length_pre )) (32)) <= (ca_capacity (state)))) (PreH2 : (area_addr = circular_area_pre)) (PreH3 : (area_addr <> 0)) (PreH4 : (data_buffer_2 <> 0)) (PreH5 : (0 <= data_length_pre)) (PreH6 : (data_length_pre <= (Zlength ((ca_contents (state)))))) (PreH7 : ((readidx_2 + data_length_pre ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  TT && emp 
|--
  “ (CircularAreaDivideRdDataResult readidx_2 data_length_pre (ca_capacity (state)) 0 ) ” 
  &&  “ (CircularAreaStateDivideRdDataResult state data_length_pre 0 ) ”
  &&  emp
).

Definition CircularAreaDivideRdData_return_wit_2_split_goal_1 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (area_addr: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx_2) (32)) + data_length_pre )) (32)) <= (ca_capacity (state)))) (PreH2 : (area_addr = circular_area_pre)) (PreH3 : (area_addr <> 0)) (PreH4 : (data_buffer_2 <> 0)) (PreH5 : (0 <= data_length_pre)) (PreH6 : (data_length_pre <= (Zlength ((ca_contents (state)))))) (PreH7 : ((readidx_2 + data_length_pre ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  (CircularAreaDivideRdDataResult readidx_2 data_length_pre (ca_capacity (state)) 0 )
.

Definition CircularAreaDivideRdData_return_wit_2_split_goal_2 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (area_addr: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx_2) (32)) + data_length_pre )) (32)) <= (ca_capacity (state)))) (PreH2 : (area_addr = circular_area_pre)) (PreH3 : (area_addr <> 0)) (PreH4 : (data_buffer_2 <> 0)) (PreH5 : (0 <= data_length_pre)) (PreH6 : (data_length_pre <= (Zlength ((ca_contents (state)))))) (PreH7 : ((readidx_2 + data_length_pre ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  (CircularAreaStateDivideRdDataResult state data_length_pre 0 )
.

Definition CircularAreaDivideRdData_return_wit_3 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (area_addr: Z) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (circular_area_pre = 0)) ,
  (CircularAreaDivideRdDataInput state LitMap circular_area_pre data_length_pre area_addr )
|--
  (EX (operations: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (readidx: Z)  (data_buffer: Z) ,
  “ (area_addr <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaStateDivideRdDataResult state data_length_pre 1 ) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx data_length_pre (ca_capacity (state)) 1 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((area_addr)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((area_addr)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((area_addr)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations))
  ||
  (“ (circular_area_pre = 0) ” 
  &&  “ (1 = 1) ”
  &&  (GlobalStrings LitMap ))
.

Module Type VC_Correct.


Axiom proof_of_CircularAreaDivideRdData_safety_wit_1 : CircularAreaDivideRdData_safety_wit_1.
Axiom proof_of_CircularAreaDivideRdData_safety_wit_2 : CircularAreaDivideRdData_safety_wit_2.
Axiom proof_of_CircularAreaDivideRdData_safety_wit_3 : CircularAreaDivideRdData_safety_wit_3.
Axiom proof_of_CircularAreaDivideRdData_safety_wit_4 : CircularAreaDivideRdData_safety_wit_4.
Axiom proof_of_CircularAreaDivideRdData_safety_wit_5 : CircularAreaDivideRdData_safety_wit_5.
Axiom proof_of_CircularAreaDivideRdData_entail_wit_1 : CircularAreaDivideRdData_entail_wit_1.
Axiom proof_of_CircularAreaDivideRdData_return_wit_1 : CircularAreaDivideRdData_return_wit_1.
Axiom proof_of_CircularAreaDivideRdData_return_wit_2 : CircularAreaDivideRdData_return_wit_2.
Axiom proof_of_CircularAreaDivideRdData_return_wit_3 : CircularAreaDivideRdData_return_wit_3.

End VC_Correct.
