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
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (entry_data_length: Z) (area_addr: Z) (state: circular_area_state) (PreH1 : (circular_area_pre = area_addr)) (PreH2 : (data_length_pre = entry_data_length)) (PreH3 : (area_addr <> 0)) (PreH4 : (0 <= entry_data_length)) (PreH5 : (entry_data_length <= (ca_capacity (state)))) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (store_circular_area state area_addr )
  **  (GlobalStrings LitMap )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaDivideWrData_safety_wit_2 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (entry_data_length: Z) (area_addr: Z) (PreH1 : (circular_area_pre = area_addr)) (PreH2 : (data_length_pre = entry_data_length)) (PreH3 : (area_addr = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaDivideWrData_safety_wit_3 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (entry_data_length: Z) (area_addr: Z) (state: circular_area_state) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = area_addr)) (PreH3 : (data_length_pre = entry_data_length)) (PreH4 : (area_addr <> 0)) (PreH5 : (0 <= entry_data_length)) (PreH6 : (entry_data_length <= (ca_capacity (state)))) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (store_circular_area state area_addr )
  **  (GlobalStrings LitMap )
|--
  “ False ”
.

Definition CircularAreaDivideWrData_safety_wit_4 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (entry_data_length: Z) (area_addr: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = area_addr)) (PreH3 : (data_length_pre = entry_data_length)) (PreH4 : (area_addr = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
|--
  “ False ”
.

Definition CircularAreaDivideWrData_safety_wit_5 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (entry_data_length: Z) (area_addr: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = area_addr)) (PreH3 : (data_length_pre = entry_data_length)) (PreH4 : (area_addr = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaDivideWrData_safety_wit_6 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (entry_data_length: Z) (area_addr: Z) (state: circular_area_state) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = area_addr)) (PreH3 : (data_length_pre = entry_data_length)) (PreH4 : (area_addr <> 0)) (PreH5 : (0 <= entry_data_length)) (PreH6 : (entry_data_length <= (ca_capacity (state)))) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (store_circular_area state area_addr )
  **  (GlobalStrings LitMap )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaDivideWrData_safety_wit_7 := 
forall (LitMap: (string -> Z)) (entry_data_length: Z) (area_addr: Z) (state: circular_area_state) (data_buffer: Z) (circular_area_operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (writeidx) (32)) + entry_data_length )) (32)) <= (ca_capacity (state)))) (PreH2 : (area_addr <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (0 <= entry_data_length)) (PreH5 : (entry_data_length <= (ca_capacity (state)))) (PreH6 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> area_addr)
  **  ((( &( "data_length" ) )) # UInt  |-> entry_data_length)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((area_addr)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((area_addr)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> circular_area_operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  (GlobalStrings LitMap )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaDivideWrData_safety_wit_8 := 
forall (LitMap: (string -> Z)) (entry_data_length: Z) (area_addr: Z) (state: circular_area_state) (data_buffer: Z) (circular_area_operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (writeidx) (32)) + entry_data_length )) (32)) > (ca_capacity (state)))) (PreH2 : (area_addr <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (0 <= entry_data_length)) (PreH5 : (entry_data_length <= (ca_capacity (state)))) (PreH6 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> area_addr)
  **  ((( &( "data_length" ) )) # UInt  |-> entry_data_length)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((area_addr)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((area_addr)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> circular_area_operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  (GlobalStrings LitMap )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaDivideWrData_entail_wit_1 := 
(
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (entry_data_length: Z) (area_addr: Z) (state: circular_area_state) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = area_addr)) (PreH3 : (data_length_pre = entry_data_length)) (PreH4 : (area_addr <> 0)) (PreH5 : (0 <= entry_data_length)) (PreH6 : (entry_data_length <= (ca_capacity (state)))) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (store_circular_area state area_addr )
  **  (GlobalStrings LitMap )
|--
  EX (circular_area_operations: Z)  (readidx: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (data_buffer: Z) ,
  “ (area_addr <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (0 <= entry_data_length) ” 
  &&  “ (entry_data_length <= (ca_capacity (state))) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> area_addr)
  **  ((( &( "data_length" ) )) # UInt  |-> entry_data_length)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((area_addr)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((area_addr)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> circular_area_operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  (GlobalStrings LitMap )
) \/
(
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (entry_data_length: Z) (area_addr: Z) (state: circular_area_state) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = area_addr)) (PreH3 : (data_length_pre = entry_data_length)) (PreH4 : (area_addr <> 0)) (PreH5 : (0 <= entry_data_length)) (PreH6 : (entry_data_length <= (ca_capacity (state)))) ,
  (store_circular_area state area_addr )
  **  (GlobalStrings LitMap )
|--
  EX (circular_area_operations: Z)  (readidx: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (data_buffer: Z) ,
  “ (data_length_pre = entry_data_length) ” 
  &&  “ (circular_area_pre = area_addr) ” 
  &&  “ (area_addr <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (0 <= entry_data_length) ” 
  &&  “ (entry_data_length <= (ca_capacity (state))) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  ((&((area_addr)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((area_addr)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((area_addr)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> circular_area_operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  (GlobalStrings LitMap )
).

Definition CircularAreaDivideWrData_return_wit_1 := 
(
forall (LitMap: (string -> Z)) (entry_data_length: Z) (area_addr: Z) (state: circular_area_state) (data_buffer_2: Z) (circular_area_operations_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (writeidx_2) (32)) + entry_data_length )) (32)) > (ca_capacity (state)))) (PreH2 : (area_addr <> 0)) (PreH3 : (data_buffer_2 <> 0)) (PreH4 : (0 <= entry_data_length)) (PreH5 : (entry_data_length <= (ca_capacity (state)))) (PreH6 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  ((&((area_addr)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_2)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_2)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_2)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_2)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_2 + (ca_capacity (state)) ))
  **  ((&((area_addr)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((area_addr)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_2)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> circular_area_operations_2)
  **  (UCharArray.mixed_full data_buffer_2 (ca_capacity (state)) physical_2 )
  **  (GlobalStrings LitMap )
|--
  EX (circular_area_operations: Z)  (readidx: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (data_buffer: Z) ,
  “ (area_addr <> 0) ” 
  &&  “ (0 <= entry_data_length) ” 
  &&  “ (entry_data_length <= (ca_capacity (state))) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx entry_data_length (ca_capacity (state)) 1 ) ”
  &&  ((&((area_addr)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((area_addr)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((area_addr)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> circular_area_operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  (GlobalStrings LitMap )
) \/
(
forall (entry_data_length: Z) (area_addr: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (writeidx_2) (32)) + entry_data_length )) (32)) > (ca_capacity (state)))) (PreH2 : (area_addr <> 0)) (PreH3 : (data_buffer_2 <> 0)) (PreH4 : (0 <= entry_data_length)) (PreH5 : (entry_data_length <= (ca_capacity (state)))) (PreH6 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  TT && emp 
|--
  “ (CircularAreaDivideWrDataResult writeidx_2 entry_data_length (ca_capacity (state)) 1 ) ”
  &&  emp
).

Definition CircularAreaDivideWrData_return_wit_1_split_goal_1 := 
forall (entry_data_length: Z) (area_addr: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (writeidx_2) (32)) + entry_data_length )) (32)) > (ca_capacity (state)))) (PreH2 : (area_addr <> 0)) (PreH3 : (data_buffer_2 <> 0)) (PreH4 : (0 <= entry_data_length)) (PreH5 : (entry_data_length <= (ca_capacity (state)))) (PreH6 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  (CircularAreaDivideWrDataResult writeidx_2 entry_data_length (ca_capacity (state)) 1 )
.

Definition CircularAreaDivideWrData_return_wit_2 := 
(
forall (LitMap: (string -> Z)) (entry_data_length: Z) (area_addr: Z) (state: circular_area_state) (data_buffer_2: Z) (circular_area_operations_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (writeidx_2) (32)) + entry_data_length )) (32)) <= (ca_capacity (state)))) (PreH2 : (area_addr <> 0)) (PreH3 : (data_buffer_2 <> 0)) (PreH4 : (0 <= entry_data_length)) (PreH5 : (entry_data_length <= (ca_capacity (state)))) (PreH6 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  ((&((area_addr)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_2)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_2)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_2)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_2)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_2 + (ca_capacity (state)) ))
  **  ((&((area_addr)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((area_addr)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_2)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> circular_area_operations_2)
  **  (UCharArray.mixed_full data_buffer_2 (ca_capacity (state)) physical_2 )
  **  (GlobalStrings LitMap )
|--
  EX (circular_area_operations: Z)  (readidx: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (data_buffer: Z) ,
  “ (area_addr <> 0) ” 
  &&  “ (0 <= entry_data_length) ” 
  &&  “ (entry_data_length <= (ca_capacity (state))) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx entry_data_length (ca_capacity (state)) 0 ) ”
  &&  ((&((area_addr)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((area_addr)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((area_addr)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((area_addr)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> circular_area_operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  (GlobalStrings LitMap )
) \/
(
forall (entry_data_length: Z) (area_addr: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (writeidx_2) (32)) + entry_data_length )) (32)) <= (ca_capacity (state)))) (PreH2 : (area_addr <> 0)) (PreH3 : (data_buffer_2 <> 0)) (PreH4 : (0 <= entry_data_length)) (PreH5 : (entry_data_length <= (ca_capacity (state)))) (PreH6 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  TT && emp 
|--
  “ (CircularAreaDivideWrDataResult writeidx_2 entry_data_length (ca_capacity (state)) 0 ) ”
  &&  emp
).

Definition CircularAreaDivideWrData_return_wit_2_split_goal_1 := 
forall (entry_data_length: Z) (area_addr: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (writeidx_2) (32)) + entry_data_length )) (32)) <= (ca_capacity (state)))) (PreH2 : (area_addr <> 0)) (PreH3 : (data_buffer_2 <> 0)) (PreH4 : (0 <= entry_data_length)) (PreH5 : (entry_data_length <= (ca_capacity (state)))) (PreH6 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  (CircularAreaDivideWrDataResult writeidx_2 entry_data_length (ca_capacity (state)) 0 )
.

Definition CircularAreaDivideWrData_return_wit_3 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (entry_data_length: Z) (area_addr: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = area_addr)) (PreH3 : (data_length_pre = entry_data_length)) (PreH4 : (area_addr = 0)) ,
  (GlobalStrings LitMap )
|--
  “ (area_addr = 0) ” 
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
