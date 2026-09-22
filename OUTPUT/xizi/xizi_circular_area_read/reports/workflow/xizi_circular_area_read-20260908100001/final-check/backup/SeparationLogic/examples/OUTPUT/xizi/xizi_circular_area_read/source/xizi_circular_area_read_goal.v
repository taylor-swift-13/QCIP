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
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_read.source Require Import xizi_circular_area_read_lib.
Local Open Scope sac.

(*----- Function CircularAreaIsFull -----*)

Definition CircularAreaIsFull_safety_wit_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsFull_safety_wit_2 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ False ”
.

Definition CircularAreaIsFull_safety_wit_3 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsFull_safety_wit_4 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (b_status <> 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (store_stringLit (LitMap (("the circular area is full
"%string))) ("the circular area is full
"%string) )
  **  (GlobalStrings_missing LitMap (cons (("the circular area is full
"%string)) ((@nil string))) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsFull_safety_wit_5 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (b_status <> 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaIsFull_safety_wit_6 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (readidx <> writeidx)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsFull_safety_wit_7 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (b_status = 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsFull_entail_wit_1 := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) ,
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
|--
  EX (operations: Z)  (readidx: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (data_buffer: Z) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) ,
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
|--
  EX (operations: Z)  (readidx: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (data_buffer: Z) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
).

Definition CircularAreaIsFull_return_wit_1 := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (readidx <> writeidx)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaStateFullResult state 0 ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
) \/
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (readidx <> writeidx)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaStateFullResult state 0 ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
).

Definition CircularAreaIsFull_return_wit_1_split_goal_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (readidx <> writeidx)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaStateFullResult state 0 ) ”
.

Definition CircularAreaIsFull_return_wit_1_split_goal_spatial := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (readidx <> writeidx)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
.

Definition CircularAreaIsFull_return_wit_2 := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (b_status = 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaStateFullResult state 0 ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
) \/
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status = 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (circular_area_pre <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaStateFullResult state 0 ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
).

Definition CircularAreaIsFull_return_wit_2_split_goal_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status = 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (circular_area_pre <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaStateFullResult state 0 ) ”
.

Definition CircularAreaIsFull_return_wit_2_split_goal_spatial := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status = 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (circular_area_pre <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
.

Definition CircularAreaIsFull_return_wit_3 := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (b_status <> 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaStateFullResult state 1 ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
) \/
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status <> 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (circular_area_pre <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaStateFullResult state 1 ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
).

Definition CircularAreaIsFull_return_wit_3_split_goal_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status <> 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (circular_area_pre <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaStateFullResult state 1 ) ”
.

Definition CircularAreaIsFull_return_wit_3_split_goal_spatial := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status <> 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (circular_area_pre <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
.

Definition CircularAreaIsFull_partial_solve_wit_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (b_status <> 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (store_stringLit (LitMap (("the circular area is full
"%string))) ("the circular area is full
"%string) )
  **  (GlobalStrings_missing LitMap (cons (("the circular area is full
"%string)) ((@nil string))) )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (b_status <> 0) ” 
  &&  “ (readidx = writeidx) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
.

(*----- Function CircularAreaIsEmpty -----*)

Definition CircularAreaIsEmpty_safety_wit_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsEmpty_safety_wit_2 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ False ”
.

Definition CircularAreaIsEmpty_safety_wit_3 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsEmpty_safety_wit_4 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (b_status = 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (store_stringLit (LitMap (("the circular area is empty
"%string))) ("the circular area is empty
"%string) )
  **  (GlobalStrings_missing LitMap (cons (("the circular area is empty
"%string)) ((@nil string))) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsEmpty_safety_wit_5 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (b_status = 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaIsEmpty_safety_wit_6 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (readidx <> writeidx)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsEmpty_safety_wit_7 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (b_status <> 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsEmpty_entail_wit_1 := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) ,
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
|--
  EX (operations: Z)  (readidx: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (data_buffer: Z) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) ,
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
|--
  EX (operations: Z)  (readidx: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (data_buffer: Z) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
).

Definition CircularAreaIsEmpty_return_wit_1 := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (readidx <> writeidx)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaStateEmptyResult state 0 ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
) \/
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (readidx <> writeidx)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaStateEmptyResult state 0 ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
).

Definition CircularAreaIsEmpty_return_wit_1_split_goal_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (readidx <> writeidx)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaStateEmptyResult state 0 ) ”
.

Definition CircularAreaIsEmpty_return_wit_1_split_goal_spatial := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (readidx <> writeidx)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
.

Definition CircularAreaIsEmpty_return_wit_2 := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (b_status <> 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaStateEmptyResult state 0 ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
) \/
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status <> 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (circular_area_pre <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaStateEmptyResult state 0 ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
).

Definition CircularAreaIsEmpty_return_wit_2_split_goal_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status <> 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (circular_area_pre <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaStateEmptyResult state 0 ) ”
.

Definition CircularAreaIsEmpty_return_wit_2_split_goal_spatial := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status <> 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (circular_area_pre <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
.

Definition CircularAreaIsEmpty_return_wit_3 := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (b_status = 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaStateEmptyResult state 1 ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
) \/
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status = 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (circular_area_pre <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaStateEmptyResult state 1 ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
).

Definition CircularAreaIsEmpty_return_wit_3_split_goal_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status = 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (circular_area_pre <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaStateEmptyResult state 1 ) ”
.

Definition CircularAreaIsEmpty_return_wit_3_split_goal_spatial := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status = 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (circular_area_pre <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
.

Definition CircularAreaIsEmpty_partial_solve_wit_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (b_status = 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (data_buffer <> 0)) (PreH6 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (store_stringLit (LitMap (("the circular area is empty
"%string))) ("the circular area is empty
"%string) )
  **  (GlobalStrings_missing LitMap (cons (("the circular area is empty
"%string)) ((@nil string))) )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (b_status = 0) ” 
  &&  “ (readidx = writeidx) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
.

(*----- Function CircularAreaGetDataLength -----*)

Definition CircularAreaGetDataLength_safety_wit_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaGetDataLength_safety_wit_2 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (circular_area_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaGetDataLength_safety_wit_3 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (circular_area_pre <> 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaGetDataLength_safety_wit_4 := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : ((Zlength ((ca_contents (state)))) < (ca_capacity (state)))) (PreH4 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((ca_capacity (state)) <> 0) ”
) \/
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : ((Zlength ((ca_contents (state)))) < (ca_capacity (state)))) (PreH4 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((ca_capacity (state)) <> 0) ”
).

Definition CircularAreaGetDataLength_safety_wit_4_split_goal_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : ((Zlength ((ca_contents (state)))) < (ca_capacity (state)))) (PreH4 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((ca_capacity (state)) <> 0) ”
.

Definition CircularAreaGetDataLength_safety_wit_5 := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : ((Zlength ((ca_contents (state)))) < (ca_capacity (state)))) (PreH4 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((writeidx - readidx ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (writeidx - readidx )) ”
) \/
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : ((Zlength ((ca_contents (state)))) < (ca_capacity (state)))) (PreH4 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((writeidx - readidx ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (writeidx - readidx )) ”
).

Definition CircularAreaGetDataLength_safety_wit_5_split_goal_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : ((Zlength ((ca_contents (state)))) < (ca_capacity (state)))) (PreH4 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((writeidx - readidx ) <= INT_MAX) ”
.

Definition CircularAreaGetDataLength_safety_wit_5_split_goal_2 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : ((Zlength ((ca_contents (state)))) < (ca_capacity (state)))) (PreH4 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((INT_MIN) <= (writeidx - readidx )) ”
.

Definition CircularAreaGetDataLength_entail_wit_1 := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (retval: Z) (PreH1 : (CircularAreaStateFullResult state retval )) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (retval <> 0)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
|--
  EX (operations: Z)  (readidx: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (data_buffer: Z) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ ((Zlength ((ca_contents (state)))) = (ca_capacity (state))) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (retval: Z) (PreH1 : (CircularAreaStateFullResult state retval )) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (retval <> 0)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
|--
  EX (operations: Z)  (readidx: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (data_buffer: Z) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ ((Zlength ((ca_contents (state)))) = (ca_capacity (state))) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
).

Definition CircularAreaGetDataLength_entail_wit_2 := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (retval: Z) (PreH1 : (CircularAreaStateFullResult state retval )) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (retval = 0)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
|--
  EX (operations: Z)  (readidx: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (data_buffer: Z) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ ((Zlength ((ca_contents (state)))) < (ca_capacity (state))) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (retval: Z) (PreH1 : (CircularAreaStateFullResult state retval )) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (retval = 0)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
|--
  EX (operations: Z)  (readidx: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (data_buffer: Z) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ ((Zlength ((ca_contents (state)))) < (ca_capacity (state))) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
).

Definition CircularAreaGetDataLength_return_wit_1 := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : ((Zlength ((ca_contents (state)))) < (ca_capacity (state)))) (PreH4 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaStateDataLengthResult state ((unsigned_last_nbits (((unsigned_last_nbits ((writeidx - readidx )) (32)) + (ca_capacity (state)) )) (32)) % ( (ca_capacity (state)) ) ) ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
) \/
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : ((Zlength ((ca_contents (state)))) < (ca_capacity (state)))) (PreH8 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaStateDataLengthResult state ((unsigned_last_nbits (((unsigned_last_nbits ((writeidx - readidx )) (32)) + (ca_capacity (state)) )) (32)) % ( (ca_capacity (state)) ) ) ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
).

Definition CircularAreaGetDataLength_return_wit_1_split_goal_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : ((Zlength ((ca_contents (state)))) < (ca_capacity (state)))) (PreH8 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaStateDataLengthResult state ((unsigned_last_nbits (((unsigned_last_nbits ((writeidx - readidx )) (32)) + (ca_capacity (state)) )) (32)) % ( (ca_capacity (state)) ) ) ) ”
.

Definition CircularAreaGetDataLength_return_wit_1_split_goal_spatial := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : ((Zlength ((ca_contents (state)))) < (ca_capacity (state)))) (PreH8 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
.

Definition CircularAreaGetDataLength_return_wit_2 := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : ((Zlength ((ca_contents (state)))) = (ca_capacity (state)))) (PreH4 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaStateDataLengthResult state (ca_capacity (state)) ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
) \/
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : ((Zlength ((ca_contents (state)))) = (ca_capacity (state)))) (PreH8 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaStateDataLengthResult state (ca_capacity (state)) ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
).

Definition CircularAreaGetDataLength_return_wit_2_split_goal_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : ((Zlength ((ca_contents (state)))) = (ca_capacity (state)))) (PreH8 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaStateDataLengthResult state (ca_capacity (state)) ) ”
.

Definition CircularAreaGetDataLength_return_wit_2_split_goal_spatial := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : ((Zlength ((ca_contents (state)))) = (ca_capacity (state)))) (PreH8 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
.

Definition CircularAreaGetDataLength_return_wit_3 := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (circular_area_pre = 0)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
|--
  “ (CircularAreaStateDataLengthResult state 1 ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
) \/
(
forall (circular_area_pre: Z) (state: circular_area_state) (PreH1 : (circular_area_pre = 0)) ,
  TT && emp 
|--
  “ (CircularAreaStateDataLengthResult state 1 ) ”
  &&  emp
).

Definition CircularAreaGetDataLength_return_wit_3_split_goal_1 := 
forall (circular_area_pre: Z) (state: circular_area_state) (PreH1 : (circular_area_pre = 0)) ,
  (CircularAreaStateDataLengthResult state 1 )
.

Definition CircularAreaGetDataLength_partial_solve_wit_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (circular_area_pre <> 0)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
|--
  “ (circular_area_pre <> 0) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
.

(*----- Function CircularAreaDivideRdData -----*)

Definition CircularAreaDivideRdData_safety_wit_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (d0: Z) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (0 <= d0)) (PreH4 : (d0 <= (Zlength ((ca_contents (state)))))) (PreH5 : ((readidx + d0 ) <= UINT_MAX)) (PreH6 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> d0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaDivideRdData_safety_wit_2 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (d0: Z) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (0 <= d0)) (PreH5 : (d0 <= (Zlength ((ca_contents (state)))))) (PreH6 : ((readidx + d0 ) <= UINT_MAX)) (PreH7 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> d0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ False ”
.

Definition CircularAreaDivideRdData_safety_wit_3 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (d0: Z) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (0 <= d0)) (PreH5 : (d0 <= (Zlength ((ca_contents (state)))))) (PreH6 : ((readidx + d0 ) <= UINT_MAX)) (PreH7 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> d0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaDivideRdData_safety_wit_4 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (d0: Z) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + d0 )) (32)) <= (ca_capacity (state)))) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (0 <= d0)) (PreH6 : (d0 <= (Zlength ((ca_contents (state)))))) (PreH7 : ((readidx + d0 ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> d0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaDivideRdData_safety_wit_5 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (d0: Z) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + d0 )) (32)) > (ca_capacity (state)))) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (0 <= d0)) (PreH6 : (d0 <= (Zlength ((ca_contents (state)))))) (PreH7 : ((readidx + d0 ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> d0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaDivideRdData_entail_wit_1 := 
(
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (d0: Z) (state: circular_area_state) (PreH1 : (data_length_pre = d0)) (PreH2 : (0 <= d0)) (PreH3 : (d0 <= (Zlength ((ca_contents (state)))))) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
|--
  EX (operations: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (readidx: Z)  (data_buffer: Z) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (0 <= d0) ” 
  &&  “ (d0 <= (Zlength ((ca_contents (state))))) ” 
  &&  “ ((readidx + d0 ) <= UINT_MAX) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  ((( &( "data_length" ) )) # UInt  |-> d0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (d0: Z) (state: circular_area_state) (PreH1 : (data_length_pre = d0)) (PreH2 : (0 <= d0)) (PreH3 : (d0 <= (Zlength ((ca_contents (state)))))) ,
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
|--
  EX (operations: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (readidx: Z)  (data_buffer: Z) ,
  “ (data_length_pre = d0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (0 <= d0) ” 
  &&  “ (d0 <= (Zlength ((ca_contents (state))))) ” 
  &&  “ ((readidx + d0 ) <= UINT_MAX) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
).

Definition CircularAreaDivideRdData_return_wit_1 := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (d0: Z) (state: circular_area_state) (data_buffer_2: Z) (operations_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx_2) (32)) + d0 )) (32)) > (ca_capacity (state)))) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (data_buffer_2 <> 0)) (PreH5 : (0 <= d0)) (PreH6 : (d0 <= (Zlength ((ca_contents (state)))))) (PreH7 : ((readidx_2 + d0 ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer_2 (ca_capacity (state)) physical_2 )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_2 + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_2)
|--
  EX (operations: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (readidx: Z)  (data_buffer: Z) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaStateDivideRdDataResult state d0 1 ) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx d0 (ca_capacity (state)) 1 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (circular_area_pre: Z) (d0: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx_2) (32)) + d0 )) (32)) > (ca_capacity (state)))) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (data_buffer_2 <> 0)) (PreH5 : (0 <= d0)) (PreH6 : (d0 <= (Zlength ((ca_contents (state)))))) (PreH7 : ((readidx_2 + d0 ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  TT && emp 
|--
  “ (CircularAreaDivideRdDataResult readidx_2 d0 (ca_capacity (state)) 1 ) ” 
  &&  “ (CircularAreaStateDivideRdDataResult state d0 1 ) ”
  &&  emp
).

Definition CircularAreaDivideRdData_return_wit_1_split_goal_1 := 
forall (circular_area_pre: Z) (d0: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx_2) (32)) + d0 )) (32)) > (ca_capacity (state)))) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (data_buffer_2 <> 0)) (PreH5 : (0 <= d0)) (PreH6 : (d0 <= (Zlength ((ca_contents (state)))))) (PreH7 : ((readidx_2 + d0 ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  (CircularAreaDivideRdDataResult readidx_2 d0 (ca_capacity (state)) 1 )
.

Definition CircularAreaDivideRdData_return_wit_1_split_goal_2 := 
forall (circular_area_pre: Z) (d0: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx_2) (32)) + d0 )) (32)) > (ca_capacity (state)))) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (data_buffer_2 <> 0)) (PreH5 : (0 <= d0)) (PreH6 : (d0 <= (Zlength ((ca_contents (state)))))) (PreH7 : ((readidx_2 + d0 ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  (CircularAreaStateDivideRdDataResult state d0 1 )
.

Definition CircularAreaDivideRdData_return_wit_2 := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (d0: Z) (state: circular_area_state) (data_buffer_2: Z) (operations_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx_2) (32)) + d0 )) (32)) <= (ca_capacity (state)))) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (data_buffer_2 <> 0)) (PreH5 : (0 <= d0)) (PreH6 : (d0 <= (Zlength ((ca_contents (state)))))) (PreH7 : ((readidx_2 + d0 ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer_2 (ca_capacity (state)) physical_2 )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_2 + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_2)
|--
  EX (operations: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (readidx: Z)  (data_buffer: Z) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaStateDivideRdDataResult state d0 0 ) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx d0 (ca_capacity (state)) 0 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (circular_area_pre: Z) (d0: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx_2) (32)) + d0 )) (32)) <= (ca_capacity (state)))) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (data_buffer_2 <> 0)) (PreH5 : (0 <= d0)) (PreH6 : (d0 <= (Zlength ((ca_contents (state)))))) (PreH7 : ((readidx_2 + d0 ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  TT && emp 
|--
  “ (CircularAreaDivideRdDataResult readidx_2 d0 (ca_capacity (state)) 0 ) ” 
  &&  “ (CircularAreaStateDivideRdDataResult state d0 0 ) ”
  &&  emp
).

Definition CircularAreaDivideRdData_return_wit_2_split_goal_1 := 
forall (circular_area_pre: Z) (d0: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx_2) (32)) + d0 )) (32)) <= (ca_capacity (state)))) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (data_buffer_2 <> 0)) (PreH5 : (0 <= d0)) (PreH6 : (d0 <= (Zlength ((ca_contents (state)))))) (PreH7 : ((readidx_2 + d0 ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  (CircularAreaDivideRdDataResult readidx_2 d0 (ca_capacity (state)) 0 )
.

Definition CircularAreaDivideRdData_return_wit_2_split_goal_2 := 
forall (circular_area_pre: Z) (d0: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx_2) (32)) + d0 )) (32)) <= (ca_capacity (state)))) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (data_buffer_2 <> 0)) (PreH5 : (0 <= d0)) (PreH6 : (d0 <= (Zlength ((ca_contents (state)))))) (PreH7 : ((readidx_2 + d0 ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  (CircularAreaStateDivideRdDataResult state d0 0 )
.

(*----- Function CircularAreaRead -----*)

Definition CircularAreaRead_safety_wit_1 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (LitMap: (string -> Z)) (PreH1 : (circular_area_pre = ca0)) (PreH2 : (output_buffer_pre = out0)) (PreH3 : (data_length_pre = requested)) (PreH4 : (0 <= requested)) (PreH5 : (requested <= UINT_MAX)) (PreH6 : (ca0 = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRead_safety_wit_2 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (circular_area_pre = ca0)) (PreH2 : (output_buffer_pre = out0)) (PreH3 : (data_length_pre = requested)) (PreH4 : (0 <= requested)) (PreH5 : (requested <= UINT_MAX)) (PreH6 : (ca0 <> 0)) (PreH7 : (out0 = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state ca0 )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRead_safety_wit_3 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (circular_area_pre = ca0)) (PreH2 : (output_buffer_pre = out0)) (PreH3 : (data_length_pre = requested)) (PreH4 : (0 <= requested)) (PreH5 : (requested <= UINT_MAX)) (PreH6 : (ca0 <> 0)) (PreH7 : (out0 <> 0)) (PreH8 : (requested <= output_capacity)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state ca0 )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRead_safety_wit_4 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (LitMap: (string -> Z)) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (output_buffer_pre = out0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (0 <= requested)) (PreH6 : (requested <= UINT_MAX)) (PreH7 : (ca0 = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
|--
  “ False ”
.

Definition CircularAreaRead_safety_wit_5 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (output_buffer_pre = out0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (0 <= requested)) (PreH6 : (requested <= UINT_MAX)) (PreH7 : (ca0 <> 0)) (PreH8 : (out0 = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state ca0 )
|--
  “ False ”
.

Definition CircularAreaRead_safety_wit_6 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (output_buffer_pre = out0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (0 <= requested)) (PreH6 : (requested <= UINT_MAX)) (PreH7 : (ca0 <> 0)) (PreH8 : (out0 <> 0)) (PreH9 : (requested <= output_capacity)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state ca0 )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ False ”
.

Definition CircularAreaRead_safety_wit_7 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (LitMap: (string -> Z)) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (output_buffer_pre = out0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (0 <= requested)) (PreH6 : (requested <= UINT_MAX)) (PreH7 : (ca0 = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaRead_safety_wit_8 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (output_buffer_pre = out0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (0 <= requested)) (PreH6 : (requested <= UINT_MAX)) (PreH7 : (ca0 <> 0)) (PreH8 : (out0 = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state ca0 )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRead_safety_wit_9 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (output_buffer_pre = out0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (0 <= requested)) (PreH6 : (requested <= UINT_MAX)) (PreH7 : (ca0 <> 0)) (PreH8 : (out0 <> 0)) (PreH9 : (requested <= output_capacity)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state ca0 )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRead_safety_wit_10 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (output_buffer_pre = out0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (0 <= requested)) (PreH6 : (requested <= UINT_MAX)) (PreH7 : (ca0 <> 0)) (PreH8 : (out0 = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state ca0 )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRead_safety_wit_11 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (output_buffer_pre = out0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (0 <= requested)) (PreH6 : (requested <= UINT_MAX)) (PreH7 : (ca0 <> 0)) (PreH8 : (out0 <> 0)) (PreH9 : (requested <= output_capacity)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state ca0 )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRead_safety_wit_12 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (output_buffer_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = ca0)) (PreH4 : (output_buffer_pre = out0)) (PreH5 : (data_length_pre = requested)) (PreH6 : (0 <= requested)) (PreH7 : (requested <= UINT_MAX)) (PreH8 : (ca0 <> 0)) (PreH9 : (out0 = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state ca0 )
|--
  “ False ”
.

Definition CircularAreaRead_safety_wit_13 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (output_buffer_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = ca0)) (PreH4 : (output_buffer_pre = out0)) (PreH5 : (data_length_pre = requested)) (PreH6 : (0 <= requested)) (PreH7 : (requested <= UINT_MAX)) (PreH8 : (ca0 <> 0)) (PreH9 : (out0 <> 0)) (PreH10 : (requested <= output_capacity)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state ca0 )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ False ”
.

Definition CircularAreaRead_safety_wit_14 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (output_buffer_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = ca0)) (PreH4 : (output_buffer_pre = out0)) (PreH5 : (data_length_pre = requested)) (PreH6 : (0 <= requested)) (PreH7 : (requested <= UINT_MAX)) (PreH8 : (ca0 <> 0)) (PreH9 : (out0 = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state ca0 )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaRead_safety_wit_15 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (output_buffer_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = ca0)) (PreH4 : (output_buffer_pre = out0)) (PreH5 : (data_length_pre = requested)) (PreH6 : (0 <= requested)) (PreH7 : (requested <= UINT_MAX)) (PreH8 : (ca0 <> 0)) (PreH9 : (out0 <> 0)) (PreH10 : (requested <= output_capacity)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state ca0 )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRead_safety_wit_16 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (0 <= data_length_pre)) (PreH2 : (data_length_pre <= UINT_MAX)) (PreH3 : (output_buffer_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (circular_area_pre = ca0)) (PreH6 : (output_buffer_pre = out0)) (PreH7 : (data_length_pre = requested)) (PreH8 : (0 <= requested)) (PreH9 : (requested <= UINT_MAX)) (PreH10 : (ca0 <> 0)) (PreH11 : (out0 <> 0)) (PreH12 : (requested <= output_capacity)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state ca0 )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRead_safety_wit_17 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (data_length_pre <= 0)) (PreH2 : (0 <= data_length_pre)) (PreH3 : (data_length_pre <= UINT_MAX)) (PreH4 : (output_buffer_pre <> 0)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre = ca0)) (PreH7 : (output_buffer_pre = out0)) (PreH8 : (data_length_pre = requested)) (PreH9 : (0 <= requested)) (PreH10 : (requested <= UINT_MAX)) (PreH11 : (ca0 <> 0)) (PreH12 : (out0 <> 0)) (PreH13 : (requested <= output_capacity)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state ca0 )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaRead_safety_wit_18 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (data_length_pre > 0)) (PreH2 : (0 <= data_length_pre)) (PreH3 : (data_length_pre <= UINT_MAX)) (PreH4 : (output_buffer_pre <> 0)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre = ca0)) (PreH7 : (output_buffer_pre = out0)) (PreH8 : (data_length_pre = requested)) (PreH9 : (0 <= requested)) (PreH10 : (requested <= UINT_MAX)) (PreH11 : (ca0 <> 0)) (PreH12 : (out0 <> 0)) (PreH13 : (requested <= output_capacity)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state ca0 )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRead_safety_wit_19 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (requested > 0)) (PreH4 : (requested <= output_capacity)) (PreH5 : (CircularAreaStateEmptyResult state 1 )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> requested)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state ca0 )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaRead_safety_wit_20 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (area_length: Z) (b_status: Z) (logical: (@list Z)) (physical: (@list (@option Z))) (data_length: Z) (retval: Z) (PreH1 : (retval = out0)) (PreH2 : (ca0 <> 0)) (PreH3 : (out0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (area_length = (ca_capacity (state)))) (PreH7 : (logical = (ca_contents (state)))) (PreH8 : (CircularAreaStateEmptyResult state 0 )) (PreH9 : (CircularAreaActualReadLength logical requested data_length )) (PreH10 : (0 < data_length)) (PreH11 : (data_length <= output_capacity)) (PreH12 : (0 <= readidx)) (PreH13 : ((readidx + data_length ) <= area_length)) (PreH14 : (CircularAreaDivideRdDataResult readidx data_length area_length 0 )) (PreH15 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH16 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH17 : (CircularAreaInitializedSlice physical readidx (readidx + data_length ) (sublist (0) (data_length) (logical)) )) ,
  (UCharArray.mixed_full out0 data_length (CircularAreaSomeBytes ((sublist (0) (data_length) ((ca_contents (state)))))) )
  **  (UCharArray.mixed_seg data_buffer readidx (readidx + data_length ) (CircularAreaSomeBytes ((sublist (0) (data_length) ((ca_contents (state)))))) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (readidx + data_length ) area_length (sublist ((readidx + data_length )) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
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

Definition CircularAreaRead_safety_wit_21 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (area_length: Z) (b_status: Z) (logical: (@list Z)) (physical: (@list (@option Z))) (data_length: Z) (read_len_down: Z) (read_len_up: Z) (retval: Z) (PreH1 : (retval = (out0 + (read_len_up * sizeof(UCHAR))))) (PreH2 : (ca0 <> 0)) (PreH3 : (out0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (area_length = (ca_capacity (state)))) (PreH7 : (logical = (ca_contents (state)))) (PreH8 : (CircularAreaStateEmptyResult state 0 )) (PreH9 : (CircularAreaActualReadLength logical requested data_length )) (PreH10 : (0 < data_length)) (PreH11 : (data_length <= output_capacity)) (PreH12 : (0 <= read_len_down)) (PreH13 : (read_len_down <= readidx)) (PreH14 : (read_len_up = (area_length - readidx ))) (PreH15 : (read_len_down = (data_length - read_len_up ))) (PreH16 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH17 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH18 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH19 : (CircularAreaInitializedSlice physical 0 read_len_down (sublist (read_len_up) (data_length) (logical)) )) ,
  (UCharArray.mixed_full (out0 + (read_len_up * sizeof(UCHAR))) read_len_down (CircularAreaSomeBytes ((sublist (read_len_up) (data_length) ((ca_contents (state)))))) )
  **  (UCharArray.mixed_seg data_buffer 0 read_len_down (CircularAreaSomeBytes ((sublist (read_len_up) (data_length) ((ca_contents (state)))))) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (sublist (readidx) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 read_len_up (CircularAreaSomeBytes ((sublist (0) (read_len_up) (logical)))) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> (unsigned_last_nbits (read_len_down) (8)))
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

Definition CircularAreaRead_safety_wit_22 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (area_length: Z) (b_status: Z) (logical: (@list Z)) (physical: (@list (@option Z))) (data_length: Z) (retval: Z) (PreH1 : (retval = out0)) (PreH2 : (ca0 <> 0)) (PreH3 : (out0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (area_length = (ca_capacity (state)))) (PreH7 : (logical = (ca_contents (state)))) (PreH8 : (CircularAreaStateEmptyResult state 0 )) (PreH9 : (CircularAreaActualReadLength logical requested data_length )) (PreH10 : (0 < data_length)) (PreH11 : (data_length <= output_capacity)) (PreH12 : (0 <= readidx)) (PreH13 : ((readidx + data_length ) <= area_length)) (PreH14 : (CircularAreaDivideRdDataResult readidx data_length area_length 0 )) (PreH15 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH16 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH17 : (CircularAreaInitializedSlice physical readidx (readidx + data_length ) (sublist (0) (data_length) (logical)) )) ,
  (UCharArray.mixed_full out0 data_length (CircularAreaSomeBytes ((sublist (0) (data_length) ((ca_contents (state)))))) )
  **  (UCharArray.mixed_seg data_buffer readidx (readidx + data_length ) (CircularAreaSomeBytes ((sublist (0) (data_length) ((ca_contents (state)))))) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (readidx + data_length ) area_length (sublist ((readidx + data_length )) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> (unsigned_last_nbits (((readidx + data_length ) % ( area_length ) )) (8)))
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

Definition CircularAreaRead_safety_wit_23 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (area_length: Z) (b_status: Z) (logical: (@list Z)) (physical: (@list (@option Z))) (data_length: Z) (read_len_down: Z) (read_len_up: Z) (retval: Z) (PreH1 : (retval = (out0 + (read_len_up * sizeof(UCHAR))))) (PreH2 : (ca0 <> 0)) (PreH3 : (out0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (area_length = (ca_capacity (state)))) (PreH7 : (logical = (ca_contents (state)))) (PreH8 : (CircularAreaStateEmptyResult state 0 )) (PreH9 : (CircularAreaActualReadLength logical requested data_length )) (PreH10 : (0 < data_length)) (PreH11 : (data_length <= output_capacity)) (PreH12 : (0 <= read_len_down)) (PreH13 : (read_len_down <= readidx)) (PreH14 : (read_len_up = (area_length - readidx ))) (PreH15 : (read_len_down = (data_length - read_len_up ))) (PreH16 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH17 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH18 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH19 : (CircularAreaInitializedSlice physical 0 read_len_down (sublist (read_len_up) (data_length) (logical)) )) ,
  (UCharArray.mixed_full (out0 + (read_len_up * sizeof(UCHAR))) read_len_down (CircularAreaSomeBytes ((sublist (read_len_up) (data_length) ((ca_contents (state)))))) )
  **  (UCharArray.mixed_seg data_buffer 0 read_len_down (CircularAreaSomeBytes ((sublist (read_len_up) (data_length) ((ca_contents (state)))))) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (sublist (readidx) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 read_len_up (CircularAreaSomeBytes ((sublist (0) (read_len_up) (logical)))) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> (unsigned_last_nbits (read_len_down) (8)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRead_safety_wit_24 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (area_length: Z) (b_status: Z) (logical: (@list Z)) (physical: (@list (@option Z))) (data_length: Z) (retval: Z) (PreH1 : (retval = out0)) (PreH2 : (ca0 <> 0)) (PreH3 : (out0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (area_length = (ca_capacity (state)))) (PreH7 : (logical = (ca_contents (state)))) (PreH8 : (CircularAreaStateEmptyResult state 0 )) (PreH9 : (CircularAreaActualReadLength logical requested data_length )) (PreH10 : (0 < data_length)) (PreH11 : (data_length <= output_capacity)) (PreH12 : (0 <= readidx)) (PreH13 : ((readidx + data_length ) <= area_length)) (PreH14 : (CircularAreaDivideRdDataResult readidx data_length area_length 0 )) (PreH15 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH16 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH17 : (CircularAreaInitializedSlice physical readidx (readidx + data_length ) (sublist (0) (data_length) (logical)) )) ,
  (UCharArray.mixed_full out0 data_length (CircularAreaSomeBytes ((sublist (0) (data_length) ((ca_contents (state)))))) )
  **  (UCharArray.mixed_seg data_buffer readidx (readidx + data_length ) (CircularAreaSomeBytes ((sublist (0) (data_length) ((ca_contents (state)))))) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (readidx + data_length ) area_length (sublist ((readidx + data_length )) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> (unsigned_last_nbits (((readidx + data_length ) % ( area_length ) )) (8)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRead_entail_wit_1 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (output_buffer_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = ca0)) (PreH4 : (output_buffer_pre = out0)) (PreH5 : (data_length_pre = requested)) (PreH6 : (0 <= requested)) (PreH7 : (requested <= UINT_MAX)) (PreH8 : (ca0 <> 0)) (PreH9 : (out0 <> 0)) (PreH10 : (requested <= output_capacity)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state ca0 )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= UINT_MAX) ” 
  &&  “ (output_buffer_pre <> 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre = ca0) ” 
  &&  “ (output_buffer_pre = out0) ” 
  &&  “ (data_length_pre = requested) ” 
  &&  “ (0 <= requested) ” 
  &&  “ (requested <= UINT_MAX) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (requested <= output_capacity) ”
  &&  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state ca0 )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
.

Definition CircularAreaRead_entail_wit_2 := 
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (retval: Z) (PreH1 : (CircularAreaStateEmptyResult state retval )) (PreH2 : (data_length_pre > 0)) (PreH3 : (0 <= data_length_pre)) (PreH4 : (data_length_pre <= UINT_MAX)) (PreH5 : (output_buffer_pre <> 0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (circular_area_pre = ca0)) (PreH8 : (output_buffer_pre = out0)) (PreH9 : (data_length_pre = requested)) (PreH10 : (0 <= requested)) (PreH11 : (requested <= UINT_MAX)) (PreH12 : (ca0 <> 0)) (PreH13 : (out0 <> 0)) (PreH14 : (requested <= output_capacity)) (PreH15 : (retval <> 0)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (requested <= output_capacity) ” 
  &&  “ (CircularAreaStateEmptyResult state 1 ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> requested)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state ca0 )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
) \/
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (retval: Z) (PreH1 : (CircularAreaStateEmptyResult state retval )) (PreH2 : (data_length_pre > 0)) (PreH3 : (0 <= data_length_pre)) (PreH4 : (data_length_pre <= UINT_MAX)) (PreH5 : (output_buffer_pre <> 0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (circular_area_pre = ca0)) (PreH8 : (output_buffer_pre = out0)) (PreH9 : (data_length_pre = requested)) (PreH10 : (0 <= requested)) (PreH11 : (requested <= UINT_MAX)) (PreH12 : (ca0 <> 0)) (PreH13 : (out0 <> 0)) (PreH14 : (requested <= output_capacity)) (PreH15 : (retval <> 0)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
|--
  “ (CircularAreaStateEmptyResult state 1 ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state ca0 )
).

Definition CircularAreaRead_entail_wit_2_split_goal_1 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (retval: Z) (PreH1 : (CircularAreaStateEmptyResult state retval )) (PreH2 : (data_length_pre > 0)) (PreH3 : (0 <= data_length_pre)) (PreH4 : (data_length_pre <= UINT_MAX)) (PreH5 : (output_buffer_pre <> 0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (circular_area_pre = ca0)) (PreH8 : (output_buffer_pre = out0)) (PreH9 : (data_length_pre = requested)) (PreH10 : (0 <= requested)) (PreH11 : (requested <= UINT_MAX)) (PreH12 : (ca0 <> 0)) (PreH13 : (out0 <> 0)) (PreH14 : (requested <= output_capacity)) (PreH15 : (retval <> 0)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
|--
  “ (CircularAreaStateEmptyResult state 1 ) ”
.

Definition CircularAreaRead_entail_wit_2_split_goal_spatial := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (retval: Z) (PreH1 : (CircularAreaStateEmptyResult state retval )) (PreH2 : (data_length_pre > 0)) (PreH3 : (0 <= data_length_pre)) (PreH4 : (data_length_pre <= UINT_MAX)) (PreH5 : (output_buffer_pre <> 0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (circular_area_pre = ca0)) (PreH8 : (output_buffer_pre = out0)) (PreH9 : (data_length_pre = requested)) (PreH10 : (0 <= requested)) (PreH11 : (requested <= UINT_MAX)) (PreH12 : (ca0 <> 0)) (PreH13 : (out0 <> 0)) (PreH14 : (requested <= output_capacity)) (PreH15 : (retval <> 0)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
|--
  (GlobalStrings LitMap )
  **  (store_circular_area state ca0 )
.

Definition CircularAreaRead_entail_wit_3_1 := 
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (retval_2: Z) (retval_3: Z) (retval: Z) (operations_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (readidx_2: Z) (data_buffer_2: Z) (retval_4: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer_2 <> 0)) (PreH3 : (CircularAreaStateDivideRdDataResult state retval retval_4 )) (PreH4 : (CircularAreaDivideRdDataResult readidx_2 retval (ca_capacity (state)) retval_4 )) (PreH5 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH6 : (CircularAreaStateDataLengthResult state retval )) (PreH7 : (data_length_pre > retval_3)) (PreH8 : (CircularAreaStateDataLengthResult state retval_3 )) (PreH9 : (CircularAreaStateEmptyResult state retval_2 )) (PreH10 : (data_length_pre > 0)) (PreH11 : (0 <= data_length_pre)) (PreH12 : (data_length_pre <= UINT_MAX)) (PreH13 : (output_buffer_pre <> 0)) (PreH14 : (circular_area_pre <> 0)) (PreH15 : (circular_area_pre = ca0)) (PreH16 : (output_buffer_pre = out0)) (PreH17 : (data_length_pre = requested)) (PreH18 : (0 <= requested)) (PreH19 : (requested <= UINT_MAX)) (PreH20 : (ca0 <> 0)) (PreH21 : (out0 <> 0)) (PreH22 : (requested <= output_capacity)) (PreH23 : (retval_2 = 0)) (PreH24 : (retval_4 <> 0)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer_2 (ca_capacity (state)) physical_2 )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_2 + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_2)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  EX (operations: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (readidx: Z)  (logical: (@list Z))  (area_length: Z)  (data_buffer: Z) ,
  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (area_length = (ca_capacity (state))) ” 
  &&  “ (logical = (ca_contents (state))) ” 
  &&  “ (CircularAreaStateEmptyResult state 0 ) ” 
  &&  “ (CircularAreaActualReadLength (ca_contents (state)) requested retval ) ” 
  &&  “ (0 < retval) ” 
  &&  “ (retval <= output_capacity) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx retval (ca_capacity (state)) 1 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_capacity: Z) (state: circular_area_state) (retval_2: Z) (retval_3: Z) (retval: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (readidx_2: Z) (data_buffer_2: Z) (retval_4: Z) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status_2 <= INT_MAX)) (PreH4 : (b_status_2 >= INT_MIN)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (data_buffer_2 <> 0)) (PreH7 : (CircularAreaStateDivideRdDataResult state retval retval_4 )) (PreH8 : (CircularAreaDivideRdDataResult readidx_2 retval (ca_capacity (state)) retval_4 )) (PreH9 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH10 : (CircularAreaStateDataLengthResult state retval )) (PreH11 : (data_length_pre > retval_3)) (PreH12 : (CircularAreaStateDataLengthResult state retval_3 )) (PreH13 : (CircularAreaStateEmptyResult state retval_2 )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (output_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = ca0)) (PreH20 : (output_buffer_pre = out0)) (PreH21 : (data_length_pre = requested)) (PreH22 : (0 <= requested)) (PreH23 : (requested <= UINT_MAX)) (PreH24 : (ca0 <> 0)) (PreH25 : (out0 <> 0)) (PreH26 : (requested <= output_capacity)) (PreH27 : (retval_2 = 0)) (PreH28 : (retval_4 <> 0)) ,
  TT && emp 
|--
  “ (CircularAreaDivideRdDataResult readidx_2 retval (ca_capacity (state)) 1 ) ” 
  &&  “ (retval <= output_capacity) ” 
  &&  “ (0 < retval) ” 
  &&  “ (CircularAreaActualReadLength (ca_contents (state)) data_length_pre retval ) ”
  &&  emp
).

Definition CircularAreaRead_entail_wit_3_1_split_goal_1 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_capacity: Z) (state: circular_area_state) (retval_2: Z) (retval_3: Z) (retval: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (readidx_2: Z) (data_buffer_2: Z) (retval_4: Z) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status_2 <= INT_MAX)) (PreH4 : (b_status_2 >= INT_MIN)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (data_buffer_2 <> 0)) (PreH7 : (CircularAreaStateDivideRdDataResult state retval retval_4 )) (PreH8 : (CircularAreaDivideRdDataResult readidx_2 retval (ca_capacity (state)) retval_4 )) (PreH9 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH10 : (CircularAreaStateDataLengthResult state retval )) (PreH11 : (data_length_pre > retval_3)) (PreH12 : (CircularAreaStateDataLengthResult state retval_3 )) (PreH13 : (CircularAreaStateEmptyResult state retval_2 )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (output_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = ca0)) (PreH20 : (output_buffer_pre = out0)) (PreH21 : (data_length_pre = requested)) (PreH22 : (0 <= requested)) (PreH23 : (requested <= UINT_MAX)) (PreH24 : (ca0 <> 0)) (PreH25 : (out0 <> 0)) (PreH26 : (requested <= output_capacity)) (PreH27 : (retval_2 = 0)) (PreH28 : (retval_4 <> 0)) ,
  (CircularAreaDivideRdDataResult readidx_2 retval (ca_capacity (state)) 1 )
.

Definition CircularAreaRead_entail_wit_3_1_split_goal_2 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_capacity: Z) (state: circular_area_state) (retval_2: Z) (retval_3: Z) (retval: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (readidx_2: Z) (data_buffer_2: Z) (retval_4: Z) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status_2 <= INT_MAX)) (PreH4 : (b_status_2 >= INT_MIN)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (data_buffer_2 <> 0)) (PreH7 : (CircularAreaStateDivideRdDataResult state retval retval_4 )) (PreH8 : (CircularAreaDivideRdDataResult readidx_2 retval (ca_capacity (state)) retval_4 )) (PreH9 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH10 : (CircularAreaStateDataLengthResult state retval )) (PreH11 : (data_length_pre > retval_3)) (PreH12 : (CircularAreaStateDataLengthResult state retval_3 )) (PreH13 : (CircularAreaStateEmptyResult state retval_2 )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (output_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = ca0)) (PreH20 : (output_buffer_pre = out0)) (PreH21 : (data_length_pre = requested)) (PreH22 : (0 <= requested)) (PreH23 : (requested <= UINT_MAX)) (PreH24 : (ca0 <> 0)) (PreH25 : (out0 <> 0)) (PreH26 : (requested <= output_capacity)) (PreH27 : (retval_2 = 0)) (PreH28 : (retval_4 <> 0)) ,
  (retval <= output_capacity)
.

Definition CircularAreaRead_entail_wit_3_1_split_goal_3 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_capacity: Z) (state: circular_area_state) (retval_2: Z) (retval_3: Z) (retval: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (readidx_2: Z) (data_buffer_2: Z) (retval_4: Z) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status_2 <= INT_MAX)) (PreH4 : (b_status_2 >= INT_MIN)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (data_buffer_2 <> 0)) (PreH7 : (CircularAreaStateDivideRdDataResult state retval retval_4 )) (PreH8 : (CircularAreaDivideRdDataResult readidx_2 retval (ca_capacity (state)) retval_4 )) (PreH9 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH10 : (CircularAreaStateDataLengthResult state retval )) (PreH11 : (data_length_pre > retval_3)) (PreH12 : (CircularAreaStateDataLengthResult state retval_3 )) (PreH13 : (CircularAreaStateEmptyResult state retval_2 )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (output_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = ca0)) (PreH20 : (output_buffer_pre = out0)) (PreH21 : (data_length_pre = requested)) (PreH22 : (0 <= requested)) (PreH23 : (requested <= UINT_MAX)) (PreH24 : (ca0 <> 0)) (PreH25 : (out0 <> 0)) (PreH26 : (requested <= output_capacity)) (PreH27 : (retval_2 = 0)) (PreH28 : (retval_4 <> 0)) ,
  (0 < retval)
.

Definition CircularAreaRead_entail_wit_3_1_split_goal_4 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_capacity: Z) (state: circular_area_state) (retval_2: Z) (retval_3: Z) (retval: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (readidx_2: Z) (data_buffer_2: Z) (retval_4: Z) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status_2 <= INT_MAX)) (PreH4 : (b_status_2 >= INT_MIN)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (data_buffer_2 <> 0)) (PreH7 : (CircularAreaStateDivideRdDataResult state retval retval_4 )) (PreH8 : (CircularAreaDivideRdDataResult readidx_2 retval (ca_capacity (state)) retval_4 )) (PreH9 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH10 : (CircularAreaStateDataLengthResult state retval )) (PreH11 : (data_length_pre > retval_3)) (PreH12 : (CircularAreaStateDataLengthResult state retval_3 )) (PreH13 : (CircularAreaStateEmptyResult state retval_2 )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (output_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = ca0)) (PreH20 : (output_buffer_pre = out0)) (PreH21 : (data_length_pre = requested)) (PreH22 : (0 <= requested)) (PreH23 : (requested <= UINT_MAX)) (PreH24 : (ca0 <> 0)) (PreH25 : (out0 <> 0)) (PreH26 : (requested <= output_capacity)) (PreH27 : (retval_2 = 0)) (PreH28 : (retval_4 <> 0)) ,
  (CircularAreaActualReadLength (ca_contents (state)) data_length_pre retval )
.

Definition CircularAreaRead_entail_wit_3_2 := 
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (retval: Z) (retval_2: Z) (operations_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (readidx_2: Z) (data_buffer_2: Z) (retval_3: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer_2 <> 0)) (PreH3 : (CircularAreaStateDivideRdDataResult state data_length_pre retval_3 )) (PreH4 : (CircularAreaDivideRdDataResult readidx_2 data_length_pre (ca_capacity (state)) retval_3 )) (PreH5 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH6 : (data_length_pre <= retval_2)) (PreH7 : (CircularAreaStateDataLengthResult state retval_2 )) (PreH8 : (CircularAreaStateEmptyResult state retval )) (PreH9 : (data_length_pre > 0)) (PreH10 : (0 <= data_length_pre)) (PreH11 : (data_length_pre <= UINT_MAX)) (PreH12 : (output_buffer_pre <> 0)) (PreH13 : (circular_area_pre <> 0)) (PreH14 : (circular_area_pre = ca0)) (PreH15 : (output_buffer_pre = out0)) (PreH16 : (data_length_pre = requested)) (PreH17 : (0 <= requested)) (PreH18 : (requested <= UINT_MAX)) (PreH19 : (ca0 <> 0)) (PreH20 : (out0 <> 0)) (PreH21 : (requested <= output_capacity)) (PreH22 : (retval = 0)) (PreH23 : (retval_3 <> 0)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer_2 (ca_capacity (state)) physical_2 )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_2 + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_2)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  EX (operations: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (readidx: Z)  (logical: (@list Z))  (area_length: Z)  (data_buffer: Z) ,
  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (area_length = (ca_capacity (state))) ” 
  &&  “ (logical = (ca_contents (state))) ” 
  &&  “ (CircularAreaStateEmptyResult state 0 ) ” 
  &&  “ (CircularAreaActualReadLength (ca_contents (state)) requested data_length_pre ) ” 
  &&  “ (0 < data_length_pre) ” 
  &&  “ (data_length_pre <= output_capacity) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx data_length_pre (ca_capacity (state)) 1 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_capacity: Z) (state: circular_area_state) (retval: Z) (retval_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (readidx_2: Z) (data_buffer_2: Z) (retval_3: Z) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status_2 <= INT_MAX)) (PreH4 : (b_status_2 >= INT_MIN)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (data_buffer_2 <> 0)) (PreH7 : (CircularAreaStateDivideRdDataResult state data_length_pre retval_3 )) (PreH8 : (CircularAreaDivideRdDataResult readidx_2 data_length_pre (ca_capacity (state)) retval_3 )) (PreH9 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH10 : (data_length_pre <= retval_2)) (PreH11 : (CircularAreaStateDataLengthResult state retval_2 )) (PreH12 : (CircularAreaStateEmptyResult state retval )) (PreH13 : (data_length_pre > 0)) (PreH14 : (0 <= data_length_pre)) (PreH15 : (data_length_pre <= UINT_MAX)) (PreH16 : (output_buffer_pre <> 0)) (PreH17 : (circular_area_pre <> 0)) (PreH18 : (circular_area_pre = ca0)) (PreH19 : (output_buffer_pre = out0)) (PreH20 : (data_length_pre = requested)) (PreH21 : (0 <= requested)) (PreH22 : (requested <= UINT_MAX)) (PreH23 : (ca0 <> 0)) (PreH24 : (out0 <> 0)) (PreH25 : (requested <= output_capacity)) (PreH26 : (retval = 0)) (PreH27 : (retval_3 <> 0)) ,
  TT && emp 
|--
  “ (CircularAreaDivideRdDataResult readidx_2 data_length_pre (ca_capacity (state)) 1 ) ” 
  &&  “ (CircularAreaActualReadLength (ca_contents (state)) data_length_pre data_length_pre ) ”
  &&  emp
).

Definition CircularAreaRead_entail_wit_3_2_split_goal_1 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_capacity: Z) (state: circular_area_state) (retval: Z) (retval_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (readidx_2: Z) (data_buffer_2: Z) (retval_3: Z) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status_2 <= INT_MAX)) (PreH4 : (b_status_2 >= INT_MIN)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (data_buffer_2 <> 0)) (PreH7 : (CircularAreaStateDivideRdDataResult state data_length_pre retval_3 )) (PreH8 : (CircularAreaDivideRdDataResult readidx_2 data_length_pre (ca_capacity (state)) retval_3 )) (PreH9 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH10 : (data_length_pre <= retval_2)) (PreH11 : (CircularAreaStateDataLengthResult state retval_2 )) (PreH12 : (CircularAreaStateEmptyResult state retval )) (PreH13 : (data_length_pre > 0)) (PreH14 : (0 <= data_length_pre)) (PreH15 : (data_length_pre <= UINT_MAX)) (PreH16 : (output_buffer_pre <> 0)) (PreH17 : (circular_area_pre <> 0)) (PreH18 : (circular_area_pre = ca0)) (PreH19 : (output_buffer_pre = out0)) (PreH20 : (data_length_pre = requested)) (PreH21 : (0 <= requested)) (PreH22 : (requested <= UINT_MAX)) (PreH23 : (ca0 <> 0)) (PreH24 : (out0 <> 0)) (PreH25 : (requested <= output_capacity)) (PreH26 : (retval = 0)) (PreH27 : (retval_3 <> 0)) ,
  (CircularAreaDivideRdDataResult readidx_2 data_length_pre (ca_capacity (state)) 1 )
.

Definition CircularAreaRead_entail_wit_3_2_split_goal_2 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_capacity: Z) (state: circular_area_state) (retval: Z) (retval_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (readidx_2: Z) (data_buffer_2: Z) (retval_3: Z) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status_2 <= INT_MAX)) (PreH4 : (b_status_2 >= INT_MIN)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (data_buffer_2 <> 0)) (PreH7 : (CircularAreaStateDivideRdDataResult state data_length_pre retval_3 )) (PreH8 : (CircularAreaDivideRdDataResult readidx_2 data_length_pre (ca_capacity (state)) retval_3 )) (PreH9 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH10 : (data_length_pre <= retval_2)) (PreH11 : (CircularAreaStateDataLengthResult state retval_2 )) (PreH12 : (CircularAreaStateEmptyResult state retval )) (PreH13 : (data_length_pre > 0)) (PreH14 : (0 <= data_length_pre)) (PreH15 : (data_length_pre <= UINT_MAX)) (PreH16 : (output_buffer_pre <> 0)) (PreH17 : (circular_area_pre <> 0)) (PreH18 : (circular_area_pre = ca0)) (PreH19 : (output_buffer_pre = out0)) (PreH20 : (data_length_pre = requested)) (PreH21 : (0 <= requested)) (PreH22 : (requested <= UINT_MAX)) (PreH23 : (ca0 <> 0)) (PreH24 : (out0 <> 0)) (PreH25 : (requested <= output_capacity)) (PreH26 : (retval = 0)) (PreH27 : (retval_3 <> 0)) ,
  (CircularAreaActualReadLength (ca_contents (state)) data_length_pre data_length_pre )
.

Definition CircularAreaRead_entail_wit_4 := 
(
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer_2: Z) (operations_2: Z) (readidx: Z) (writeidx_2: Z) (area_length_2: Z) (b_status_2: Z) (logical_2: (@list Z)) (physical_2: (@list (@option Z))) (data_length: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (data_buffer_2 <> 0)) (PreH4 : (requested > 0)) (PreH5 : (area_length_2 = (ca_capacity (state)))) (PreH6 : (logical_2 = (ca_contents (state)))) (PreH7 : (CircularAreaStateEmptyResult state 0 )) (PreH8 : (CircularAreaActualReadLength (ca_contents (state)) requested data_length )) (PreH9 : (0 < data_length)) (PreH10 : (data_length <= output_capacity)) (PreH11 : (CircularAreaDivideRdDataResult readidx data_length (ca_capacity (state)) 1 )) (PreH12 : (CircularAreaLogicalState readidx writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer_2 (ca_capacity (state)) physical_2 )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_2)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_2)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_2)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_2 + (ca_capacity (state)) ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_2)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_2)
|--
  EX (operations: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (readidx_2: Z)  (logical: (@list Z))  (area_length: Z)  (data_buffer: Z) ,
  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (area_length = (ca_capacity (state))) ” 
  &&  “ (logical = (ca_contents (state))) ” 
  &&  “ (CircularAreaStateEmptyResult state 0 ) ” 
  &&  “ (CircularAreaActualReadLength logical requested data_length ) ” 
  &&  “ (0 < data_length) ” 
  &&  “ (data_length <= output_capacity) ” 
  &&  “ (0 <= readidx_2) ” 
  &&  “ (readidx_2 < area_length) ” 
  &&  “ ((unsigned_last_nbits (((ca_capacity (state)) - (unsigned_last_nbits (readidx) (32)) )) (32)) = (area_length - readidx_2 )) ” 
  &&  “ ((unsigned_last_nbits ((data_length - (unsigned_last_nbits (((ca_capacity (state)) - (unsigned_last_nbits (readidx) (32)) )) (32)) )) (32)) = (data_length - (unsigned_last_nbits (((ca_capacity (state)) - (unsigned_last_nbits (readidx) (32)) )) (32)) )) ” 
  &&  “ ((unsigned_last_nbits (((ca_capacity (state)) - (unsigned_last_nbits (readidx) (32)) )) (32)) <= data_length) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx_2 data_length area_length 1 ) ” 
  &&  “ (CircularAreaLogicalState readidx_2 writeidx area_length b_status logical physical ) ” 
  &&  “ (CircularAreaLiveBytes readidx_2 area_length logical physical ) ” 
  &&  “ (CircularAreaInitializedSlice physical readidx_2 area_length (sublist (0) ((unsigned_last_nbits (((ca_capacity (state)) - (unsigned_last_nbits (readidx) (32)) )) (32))) (logical)) ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx_2 (sublist (0) (readidx_2) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx_2 area_length (CircularAreaSomeBytes ((sublist (0) ((unsigned_last_nbits (((ca_capacity (state)) - (unsigned_last_nbits (readidx) (32)) )) (32))) (logical)))) )
  **  (UCharArray.mixed_full out0 (unsigned_last_nbits (((ca_capacity (state)) - (unsigned_last_nbits (readidx) (32)) )) (32)) (sublist (0) ((unsigned_last_nbits (((ca_capacity (state)) - (unsigned_last_nbits (readidx) (32)) )) (32))) (output_before)) )
  **  (UCharArray.mixed_seg out0 (unsigned_last_nbits (((ca_capacity (state)) - (unsigned_last_nbits (readidx) (32)) )) (32)) output_capacity (sublist ((unsigned_last_nbits (((ca_capacity (state)) - (unsigned_last_nbits (readidx) (32)) )) (32))) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_2)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer_2: Z) (readidx: Z) (writeidx_2: Z) (area_length_2: Z) (b_status_2: Z) (logical_2: (@list Z)) (physical_2: (@list (@option Z))) (data_length: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (data_buffer_2 <> 0)) (PreH4 : (requested > 0)) (PreH5 : (area_length_2 = (ca_capacity (state)))) (PreH6 : (logical_2 = (ca_contents (state)))) (PreH7 : (CircularAreaStateEmptyResult state 0 )) (PreH8 : (CircularAreaActualReadLength (ca_contents (state)) requested data_length )) (PreH9 : (0 < data_length)) (PreH10 : (data_length <= output_capacity)) (PreH11 : (CircularAreaDivideRdDataResult readidx data_length (ca_capacity (state)) 1 )) (PreH12 : (CircularAreaLogicalState readidx writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer_2 (ca_capacity (state)) physical_2 )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  EX (physical: (@list (@option Z))) ,
  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (data_buffer_2 <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaStateEmptyResult state 0 ) ” 
  &&  “ (CircularAreaActualReadLength (ca_contents (state)) requested data_length ) ” 
  &&  “ (0 < data_length) ” 
  &&  “ (data_length <= output_capacity) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (readidx < (ca_capacity (state))) ” 
  &&  “ ((unsigned_last_nbits (((ca_capacity (state)) - (unsigned_last_nbits (readidx) (32)) )) (32)) = ((ca_capacity (state)) - readidx )) ” 
  &&  “ ((unsigned_last_nbits ((data_length - (unsigned_last_nbits (((ca_capacity (state)) - (unsigned_last_nbits (readidx) (32)) )) (32)) )) (32)) = (data_length - (unsigned_last_nbits (((ca_capacity (state)) - (unsigned_last_nbits (readidx) (32)) )) (32)) )) ” 
  &&  “ ((unsigned_last_nbits (((ca_capacity (state)) - (unsigned_last_nbits (readidx) (32)) )) (32)) <= data_length) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx data_length (ca_capacity (state)) 1 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical ) ” 
  &&  “ (CircularAreaLiveBytes readidx (ca_capacity (state)) (ca_contents (state)) physical ) ” 
  &&  “ (CircularAreaInitializedSlice physical readidx (ca_capacity (state)) (sublist (0) ((unsigned_last_nbits (((ca_capacity (state)) - (unsigned_last_nbits (readidx) (32)) )) (32))) ((ca_contents (state)))) ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer_2 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer_2 readidx (ca_capacity (state)) (CircularAreaSomeBytes ((sublist (0) ((unsigned_last_nbits (((ca_capacity (state)) - (unsigned_last_nbits (readidx) (32)) )) (32))) ((ca_contents (state)))))) )
  **  (UCharArray.mixed_full out0 (unsigned_last_nbits (((ca_capacity (state)) - (unsigned_last_nbits (readidx) (32)) )) (32)) (sublist (0) ((unsigned_last_nbits (((ca_capacity (state)) - (unsigned_last_nbits (readidx) (32)) )) (32))) (output_before)) )
  **  (UCharArray.mixed_seg out0 (unsigned_last_nbits (((ca_capacity (state)) - (unsigned_last_nbits (readidx) (32)) )) (32)) output_capacity (sublist ((unsigned_last_nbits (((ca_capacity (state)) - (unsigned_last_nbits (readidx) (32)) )) (32))) (output_capacity) (output_before)) )
).

Definition CircularAreaRead_entail_wit_5 := 
(
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer_2: Z) (operations_2: Z) (readidx_2: Z) (writeidx_2: Z) (area_length_2: Z) (b_status_2: Z) (logical_2: (@list Z)) (physical_2: (@list (@option Z))) (data_length: Z) (read_len_up: Z) (read_len_down: Z) (retval: Z) (PreH1 : (retval = out0)) (PreH2 : (ca0 <> 0)) (PreH3 : (out0 <> 0)) (PreH4 : (data_buffer_2 <> 0)) (PreH5 : (requested > 0)) (PreH6 : (area_length_2 = (ca_capacity (state)))) (PreH7 : (logical_2 = (ca_contents (state)))) (PreH8 : (CircularAreaStateEmptyResult state 0 )) (PreH9 : (CircularAreaActualReadLength logical_2 requested data_length )) (PreH10 : (0 < data_length)) (PreH11 : (data_length <= output_capacity)) (PreH12 : (0 <= readidx_2)) (PreH13 : (readidx_2 < area_length_2)) (PreH14 : (read_len_up = (area_length_2 - readidx_2 ))) (PreH15 : (read_len_down = (data_length - read_len_up ))) (PreH16 : (read_len_up <= data_length)) (PreH17 : (CircularAreaDivideRdDataResult readidx_2 data_length area_length_2 1 )) (PreH18 : (CircularAreaLogicalState readidx_2 writeidx_2 area_length_2 b_status_2 logical_2 physical_2 )) (PreH19 : (CircularAreaLiveBytes readidx_2 area_length_2 logical_2 physical_2 )) (PreH20 : (CircularAreaInitializedSlice physical_2 readidx_2 area_length_2 (sublist (0) (read_len_up) (logical_2)) )) ,
  (UCharArray.mixed_full out0 read_len_up (CircularAreaSomeBytes ((sublist (0) (read_len_up) ((ca_contents (state)))))) )
  **  (UCharArray.mixed_seg data_buffer_2 readidx_2 area_length_2 (CircularAreaSomeBytes ((sublist (0) (read_len_up) ((ca_contents (state)))))) )
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer_2 0 readidx_2 (sublist (0) (readidx_2) (physical_2)) )
  **  (UCharArray.mixed_seg out0 read_len_up output_capacity (sublist (read_len_up) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_2)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_2)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_2)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_2)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_2 + area_length_2 ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_2)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_2)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_2)
|--
  EX (operations: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (readidx: Z)  (logical: (@list Z))  (area_length: Z)  (data_buffer: Z) ,
  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (area_length = (ca_capacity (state))) ” 
  &&  “ (logical = (ca_contents (state))) ” 
  &&  “ (CircularAreaStateEmptyResult state 0 ) ” 
  &&  “ (CircularAreaActualReadLength logical requested data_length ) ” 
  &&  “ (0 < data_length) ” 
  &&  “ (data_length <= output_capacity) ” 
  &&  “ (0 <= read_len_down) ” 
  &&  “ (read_len_down <= readidx) ” 
  &&  “ (read_len_up = (area_length - readidx )) ” 
  &&  “ (read_len_down = (data_length - read_len_up )) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx data_length area_length 1 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ” 
  &&  “ (CircularAreaLiveBytes readidx area_length logical physical ) ” 
  &&  “ (CircularAreaInitializedSlice physical 0 read_len_down (sublist (read_len_up) (data_length) (logical)) ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 read_len_down (CircularAreaSomeBytes ((sublist (read_len_up) (data_length) (logical)))) )
  **  (UCharArray.mixed_seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (sublist (readidx) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 read_len_up (CircularAreaSomeBytes ((sublist (0) (read_len_up) (logical)))) )
  **  (UCharArray.mixed_full (out0 + (read_len_up * sizeof(UCHAR))) read_len_down (sublist (read_len_up) (data_length) (output_before)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
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
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (area_length_2: Z) (b_status_2: Z) (logical_2: (@list Z)) (physical_2: (@list (@option Z))) (data_length: Z) (read_len_up: Z) (read_len_down: Z) (retval: Z) (PreH1 : (retval = out0)) (PreH2 : (ca0 <> 0)) (PreH3 : (out0 <> 0)) (PreH4 : (data_buffer_2 <> 0)) (PreH5 : (requested > 0)) (PreH6 : (area_length_2 = (ca_capacity (state)))) (PreH7 : (logical_2 = (ca_contents (state)))) (PreH8 : (CircularAreaStateEmptyResult state 0 )) (PreH9 : (CircularAreaActualReadLength logical_2 requested data_length )) (PreH10 : (0 < data_length)) (PreH11 : (data_length <= output_capacity)) (PreH12 : (0 <= readidx_2)) (PreH13 : (readidx_2 < area_length_2)) (PreH14 : (read_len_up = (area_length_2 - readidx_2 ))) (PreH15 : (read_len_down = (data_length - read_len_up ))) (PreH16 : (read_len_up <= data_length)) (PreH17 : (CircularAreaDivideRdDataResult readidx_2 data_length area_length_2 1 )) (PreH18 : (CircularAreaLogicalState readidx_2 writeidx_2 area_length_2 b_status_2 logical_2 physical_2 )) (PreH19 : (CircularAreaLiveBytes readidx_2 area_length_2 logical_2 physical_2 )) (PreH20 : (CircularAreaInitializedSlice physical_2 readidx_2 area_length_2 (sublist (0) (read_len_up) (logical_2)) )) ,
  (UCharArray.mixed_full out0 read_len_up (CircularAreaSomeBytes ((sublist (0) (read_len_up) ((ca_contents (state)))))) )
  **  (UCharArray.mixed_seg data_buffer_2 readidx_2 area_length_2 (CircularAreaSomeBytes ((sublist (0) (read_len_up) ((ca_contents (state)))))) )
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer_2 0 readidx_2 (sublist (0) (readidx_2) (physical_2)) )
  **  (UCharArray.mixed_seg out0 read_len_up output_capacity (sublist (read_len_up) (output_capacity) (output_before)) )
|--
  EX (physical: (@list (@option Z))) ,
  “ ((data_buffer_2 + area_length_2 ) = (data_buffer_2 + (ca_capacity (state)) )) ” 
  &&  “ (area_length_2 = (ca_capacity (state))) ” 
  &&  “ ((data_buffer_2 + area_length_2 ) = (data_buffer_2 + (ca_capacity (state)) )) ” 
  &&  “ (area_length_2 = (ca_capacity (state))) ” 
  &&  “ ((data_buffer_2 + area_length_2 ) = (data_buffer_2 + (ca_capacity (state)) )) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (data_buffer_2 <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaStateEmptyResult state 0 ) ” 
  &&  “ (CircularAreaActualReadLength (ca_contents (state)) requested data_length ) ” 
  &&  “ (0 < data_length) ” 
  &&  “ (data_length <= output_capacity) ” 
  &&  “ (0 <= read_len_down) ” 
  &&  “ (read_len_down <= readidx_2) ” 
  &&  “ (read_len_up = ((ca_capacity (state)) - readidx_2 )) ” 
  &&  “ (read_len_down = (data_length - read_len_up )) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx_2 data_length (ca_capacity (state)) 1 ) ” 
  &&  “ (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical ) ” 
  &&  “ (CircularAreaLiveBytes readidx_2 (ca_capacity (state)) (ca_contents (state)) physical ) ” 
  &&  “ (CircularAreaInitializedSlice physical 0 read_len_down (sublist (read_len_up) (data_length) ((ca_contents (state)))) ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer_2 0 read_len_down (CircularAreaSomeBytes ((sublist (read_len_up) (data_length) ((ca_contents (state)))))) )
  **  (UCharArray.mixed_seg data_buffer_2 read_len_down readidx_2 (sublist (read_len_down) (readidx_2) (physical)) )
  **  (UCharArray.mixed_seg data_buffer_2 readidx_2 (ca_capacity (state)) (sublist (readidx_2) ((ca_capacity (state))) (physical)) )
  **  (UCharArray.mixed_seg out0 0 read_len_up (CircularAreaSomeBytes ((sublist (0) (read_len_up) ((ca_contents (state)))))) )
  **  (UCharArray.mixed_full (out0 + (read_len_up * sizeof(UCHAR))) read_len_down (sublist (read_len_up) (data_length) (output_before)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
).

Definition CircularAreaRead_entail_wit_6_1 := 
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (retval_2: Z) (retval_3: Z) (retval: Z) (operations_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (readidx_2: Z) (data_buffer_2: Z) (retval_4: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer_2 <> 0)) (PreH3 : (CircularAreaStateDivideRdDataResult state retval retval_4 )) (PreH4 : (CircularAreaDivideRdDataResult readidx_2 retval (ca_capacity (state)) retval_4 )) (PreH5 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH6 : (CircularAreaStateDataLengthResult state retval )) (PreH7 : (data_length_pre > retval_3)) (PreH8 : (CircularAreaStateDataLengthResult state retval_3 )) (PreH9 : (CircularAreaStateEmptyResult state retval_2 )) (PreH10 : (data_length_pre > 0)) (PreH11 : (0 <= data_length_pre)) (PreH12 : (data_length_pre <= UINT_MAX)) (PreH13 : (output_buffer_pre <> 0)) (PreH14 : (circular_area_pre <> 0)) (PreH15 : (circular_area_pre = ca0)) (PreH16 : (output_buffer_pre = out0)) (PreH17 : (data_length_pre = requested)) (PreH18 : (0 <= requested)) (PreH19 : (requested <= UINT_MAX)) (PreH20 : (ca0 <> 0)) (PreH21 : (out0 <> 0)) (PreH22 : (requested <= output_capacity)) (PreH23 : (retval_2 = 0)) (PreH24 : (retval_4 = 0)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer_2 (ca_capacity (state)) physical_2 )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_2 + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_2)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  EX (operations: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (readidx: Z)  (logical: (@list Z))  (area_length: Z)  (data_buffer: Z) ,
  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (area_length = (ca_capacity (state))) ” 
  &&  “ (logical = (ca_contents (state))) ” 
  &&  “ (CircularAreaStateEmptyResult state 0 ) ” 
  &&  “ (CircularAreaActualReadLength logical requested retval ) ” 
  &&  “ (0 < retval) ” 
  &&  “ (retval <= output_capacity) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ ((readidx + retval ) <= area_length) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx retval area_length 0 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ” 
  &&  “ (CircularAreaLiveBytes readidx area_length logical physical ) ” 
  &&  “ (CircularAreaInitializedSlice physical readidx (readidx + retval ) (sublist (0) (retval) (logical)) ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx (readidx + retval ) (CircularAreaSomeBytes ((sublist (0) (retval) (logical)))) )
  **  (UCharArray.mixed_seg data_buffer (readidx + retval ) area_length (sublist ((readidx + retval )) (area_length) (physical)) )
  **  (UCharArray.mixed_full out0 retval (sublist (0) (retval) (output_before)) )
  **  (UCharArray.mixed_seg out0 retval output_capacity (sublist (retval) (output_capacity) (output_before)) )
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
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (retval_2: Z) (retval_3: Z) (retval: Z) (operations_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (readidx_2: Z) (data_buffer_2: Z) (retval_4: Z) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status_2 <= INT_MAX)) (PreH4 : (b_status_2 >= INT_MIN)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (data_buffer_2 <> 0)) (PreH7 : (CircularAreaStateDivideRdDataResult state retval retval_4 )) (PreH8 : (CircularAreaDivideRdDataResult readidx_2 retval (ca_capacity (state)) retval_4 )) (PreH9 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH10 : (CircularAreaStateDataLengthResult state retval )) (PreH11 : (data_length_pre > retval_3)) (PreH12 : (CircularAreaStateDataLengthResult state retval_3 )) (PreH13 : (CircularAreaStateEmptyResult state retval_2 )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (output_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = ca0)) (PreH20 : (output_buffer_pre = out0)) (PreH21 : (data_length_pre = requested)) (PreH22 : (0 <= requested)) (PreH23 : (requested <= UINT_MAX)) (PreH24 : (ca0 <> 0)) (PreH25 : (out0 <> 0)) (PreH26 : (requested <= output_capacity)) (PreH27 : (retval_2 = 0)) (PreH28 : (retval_4 = 0)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer_2 (ca_capacity (state)) physical_2 )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_2 + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_2)
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  EX (operations: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (readidx: Z)  (data_buffer: Z) ,
  “ (output_buffer_pre = out0) ” 
  &&  “ (circular_area_pre = ca0) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaStateEmptyResult state 0 ) ” 
  &&  “ (CircularAreaActualReadLength (ca_contents (state)) requested retval ) ” 
  &&  “ (0 < retval) ” 
  &&  “ (retval <= output_capacity) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ ((readidx + retval ) <= (ca_capacity (state))) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx retval (ca_capacity (state)) 0 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ” 
  &&  “ (CircularAreaLiveBytes readidx (ca_capacity (state)) (ca_contents (state)) physical ) ” 
  &&  “ (CircularAreaInitializedSlice physical readidx (readidx + retval ) (sublist (0) (retval) ((ca_contents (state)))) ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx (readidx + retval ) (CircularAreaSomeBytes ((sublist (0) (retval) ((ca_contents (state)))))) )
  **  (UCharArray.mixed_seg data_buffer (readidx + retval ) (ca_capacity (state)) (sublist ((readidx + retval )) ((ca_capacity (state))) (physical)) )
  **  (UCharArray.mixed_full out0 retval (sublist (0) (retval) (output_before)) )
  **  (UCharArray.mixed_seg out0 retval output_capacity (sublist (retval) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
).

Definition CircularAreaRead_entail_wit_6_2 := 
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (retval: Z) (retval_2: Z) (operations_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (readidx_2: Z) (data_buffer_2: Z) (retval_3: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer_2 <> 0)) (PreH3 : (CircularAreaStateDivideRdDataResult state data_length_pre retval_3 )) (PreH4 : (CircularAreaDivideRdDataResult readidx_2 data_length_pre (ca_capacity (state)) retval_3 )) (PreH5 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH6 : (data_length_pre <= retval_2)) (PreH7 : (CircularAreaStateDataLengthResult state retval_2 )) (PreH8 : (CircularAreaStateEmptyResult state retval )) (PreH9 : (data_length_pre > 0)) (PreH10 : (0 <= data_length_pre)) (PreH11 : (data_length_pre <= UINT_MAX)) (PreH12 : (output_buffer_pre <> 0)) (PreH13 : (circular_area_pre <> 0)) (PreH14 : (circular_area_pre = ca0)) (PreH15 : (output_buffer_pre = out0)) (PreH16 : (data_length_pre = requested)) (PreH17 : (0 <= requested)) (PreH18 : (requested <= UINT_MAX)) (PreH19 : (ca0 <> 0)) (PreH20 : (out0 <> 0)) (PreH21 : (requested <= output_capacity)) (PreH22 : (retval = 0)) (PreH23 : (retval_3 = 0)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer_2 (ca_capacity (state)) physical_2 )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_2 + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_2)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  EX (operations: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (readidx: Z)  (logical: (@list Z))  (area_length: Z)  (data_buffer: Z) ,
  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (area_length = (ca_capacity (state))) ” 
  &&  “ (logical = (ca_contents (state))) ” 
  &&  “ (CircularAreaStateEmptyResult state 0 ) ” 
  &&  “ (CircularAreaActualReadLength logical requested data_length_pre ) ” 
  &&  “ (0 < data_length_pre) ” 
  &&  “ (data_length_pre <= output_capacity) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ ((readidx + data_length_pre ) <= area_length) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx data_length_pre area_length 0 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ” 
  &&  “ (CircularAreaLiveBytes readidx area_length logical physical ) ” 
  &&  “ (CircularAreaInitializedSlice physical readidx (readidx + data_length_pre ) (sublist (0) (data_length_pre) (logical)) ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx (readidx + data_length_pre ) (CircularAreaSomeBytes ((sublist (0) (data_length_pre) (logical)))) )
  **  (UCharArray.mixed_seg data_buffer (readidx + data_length_pre ) area_length (sublist ((readidx + data_length_pre )) (area_length) (physical)) )
  **  (UCharArray.mixed_full out0 data_length_pre (sublist (0) (data_length_pre) (output_before)) )
  **  (UCharArray.mixed_seg out0 data_length_pre output_capacity (sublist (data_length_pre) (output_capacity) (output_before)) )
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
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (retval: Z) (retval_2: Z) (operations_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (readidx_2: Z) (data_buffer_2: Z) (retval_3: Z) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status_2 <= INT_MAX)) (PreH4 : (b_status_2 >= INT_MIN)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (data_buffer_2 <> 0)) (PreH7 : (CircularAreaStateDivideRdDataResult state data_length_pre retval_3 )) (PreH8 : (CircularAreaDivideRdDataResult readidx_2 data_length_pre (ca_capacity (state)) retval_3 )) (PreH9 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH10 : (data_length_pre <= retval_2)) (PreH11 : (CircularAreaStateDataLengthResult state retval_2 )) (PreH12 : (CircularAreaStateEmptyResult state retval )) (PreH13 : (data_length_pre > 0)) (PreH14 : (0 <= data_length_pre)) (PreH15 : (data_length_pre <= UINT_MAX)) (PreH16 : (output_buffer_pre <> 0)) (PreH17 : (circular_area_pre <> 0)) (PreH18 : (circular_area_pre = ca0)) (PreH19 : (output_buffer_pre = out0)) (PreH20 : (data_length_pre = requested)) (PreH21 : (0 <= requested)) (PreH22 : (requested <= UINT_MAX)) (PreH23 : (ca0 <> 0)) (PreH24 : (out0 <> 0)) (PreH25 : (requested <= output_capacity)) (PreH26 : (retval = 0)) (PreH27 : (retval_3 = 0)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer_2 (ca_capacity (state)) physical_2 )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_2 + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_2)
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  EX (operations: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (readidx: Z)  (data_buffer: Z) ,
  “ (output_buffer_pre = out0) ” 
  &&  “ (circular_area_pre = ca0) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaStateEmptyResult state 0 ) ” 
  &&  “ (CircularAreaActualReadLength (ca_contents (state)) requested data_length_pre ) ” 
  &&  “ (0 < data_length_pre) ” 
  &&  “ (data_length_pre <= output_capacity) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ ((readidx + data_length_pre ) <= (ca_capacity (state))) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx data_length_pre (ca_capacity (state)) 0 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ” 
  &&  “ (CircularAreaLiveBytes readidx (ca_capacity (state)) (ca_contents (state)) physical ) ” 
  &&  “ (CircularAreaInitializedSlice physical readidx (readidx + data_length_pre ) (sublist (0) (data_length_pre) ((ca_contents (state)))) ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx (readidx + data_length_pre ) (CircularAreaSomeBytes ((sublist (0) (data_length_pre) ((ca_contents (state)))))) )
  **  (UCharArray.mixed_seg data_buffer (readidx + data_length_pre ) (ca_capacity (state)) (sublist ((readidx + data_length_pre )) ((ca_capacity (state))) (physical)) )
  **  (UCharArray.mixed_full out0 data_length_pre (sublist (0) (data_length_pre) (output_before)) )
  **  (UCharArray.mixed_seg out0 data_length_pre output_capacity (sublist (data_length_pre) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
).

Definition CircularAreaRead_return_wit_1 := 
(
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (area_length: Z) (b_status: Z) (logical: (@list Z)) (physical: (@list (@option Z))) (data_length: Z) (read_len_down: Z) (read_len_up: Z) (retval: Z) (PreH1 : (retval = (out0 + (read_len_up * sizeof(UCHAR))))) (PreH2 : (ca0 <> 0)) (PreH3 : (out0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (area_length = (ca_capacity (state)))) (PreH7 : (logical = (ca_contents (state)))) (PreH8 : (CircularAreaStateEmptyResult state 0 )) (PreH9 : (CircularAreaActualReadLength logical requested data_length )) (PreH10 : (0 < data_length)) (PreH11 : (data_length <= output_capacity)) (PreH12 : (0 <= read_len_down)) (PreH13 : (read_len_down <= readidx)) (PreH14 : (read_len_up = (area_length - readidx ))) (PreH15 : (read_len_down = (data_length - read_len_up ))) (PreH16 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH17 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH18 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH19 : (CircularAreaInitializedSlice physical 0 read_len_down (sublist (read_len_up) (data_length) (logical)) )) ,
  (UCharArray.mixed_full (out0 + (read_len_up * sizeof(UCHAR))) read_len_down (CircularAreaSomeBytes ((sublist (read_len_up) (data_length) ((ca_contents (state)))))) )
  **  (UCharArray.mixed_seg data_buffer 0 read_len_down (CircularAreaSomeBytes ((sublist (read_len_up) (data_length) ((ca_contents (state)))))) )
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (sublist (readidx) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 read_len_up (CircularAreaSomeBytes ((sublist (0) (read_len_up) (logical)))) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> (unsigned_last_nbits (read_len_down) (8)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  EX (state_after: circular_area_state)  (output_after: (@list (@option Z))) ,
  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (CircularAreaReadResult state requested output_capacity output_before 0 state_after output_after ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state_after ca0 )
  **  (UCharArray.mixed_full out0 output_capacity output_after )
) \/
(
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (area_length: Z) (b_status: Z) (logical: (@list Z)) (physical: (@list (@option Z))) (data_length: Z) (read_len_down: Z) (read_len_up: Z) (retval: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (0 <= INT_MAX)) (PreH4 : (0 >= INT_MIN)) (PreH5 : (retval = (out0 + (read_len_up * sizeof(UCHAR))))) (PreH6 : (ca0 <> 0)) (PreH7 : (out0 <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (requested > 0)) (PreH10 : (area_length = (ca_capacity (state)))) (PreH11 : (logical = (ca_contents (state)))) (PreH12 : (CircularAreaStateEmptyResult state 0 )) (PreH13 : (CircularAreaActualReadLength logical requested data_length )) (PreH14 : (0 < data_length)) (PreH15 : (data_length <= output_capacity)) (PreH16 : (0 <= read_len_down)) (PreH17 : (read_len_down <= readidx)) (PreH18 : (read_len_up = (area_length - readidx ))) (PreH19 : (read_len_down = (data_length - read_len_up ))) (PreH20 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH21 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH22 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH23 : (CircularAreaInitializedSlice physical 0 read_len_down (sublist (read_len_up) (data_length) (logical)) )) ,
  (UCharArray.mixed_full (out0 + (read_len_up * sizeof(UCHAR))) read_len_down (CircularAreaSomeBytes ((sublist (read_len_up) (data_length) ((ca_contents (state)))))) )
  **  (UCharArray.mixed_seg data_buffer 0 read_len_down (CircularAreaSomeBytes ((sublist (read_len_up) (data_length) ((ca_contents (state)))))) )
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (sublist (readidx) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 read_len_up (CircularAreaSomeBytes ((sublist (0) (read_len_up) (logical)))) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> (unsigned_last_nbits (read_len_down) (8)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  EX (state_after: circular_area_state)  (output_after: (@list (@option Z))) ,
  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (CircularAreaReadResult state requested output_capacity output_before 0 state_after output_after ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state_after ca0 )
  **  (UCharArray.mixed_full out0 output_capacity output_after )
).

Definition CircularAreaRead_return_wit_2 := 
(
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (area_length: Z) (b_status: Z) (logical: (@list Z)) (physical: (@list (@option Z))) (data_length: Z) (retval: Z) (PreH1 : (retval = out0)) (PreH2 : (ca0 <> 0)) (PreH3 : (out0 <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (requested > 0)) (PreH6 : (area_length = (ca_capacity (state)))) (PreH7 : (logical = (ca_contents (state)))) (PreH8 : (CircularAreaStateEmptyResult state 0 )) (PreH9 : (CircularAreaActualReadLength logical requested data_length )) (PreH10 : (0 < data_length)) (PreH11 : (data_length <= output_capacity)) (PreH12 : (0 <= readidx)) (PreH13 : ((readidx + data_length ) <= area_length)) (PreH14 : (CircularAreaDivideRdDataResult readidx data_length area_length 0 )) (PreH15 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH16 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH17 : (CircularAreaInitializedSlice physical readidx (readidx + data_length ) (sublist (0) (data_length) (logical)) )) ,
  (UCharArray.mixed_full out0 data_length (CircularAreaSomeBytes ((sublist (0) (data_length) ((ca_contents (state)))))) )
  **  (UCharArray.mixed_seg data_buffer readidx (readidx + data_length ) (CircularAreaSomeBytes ((sublist (0) (data_length) ((ca_contents (state)))))) )
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (readidx + data_length ) area_length (sublist ((readidx + data_length )) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> (unsigned_last_nbits (((readidx + data_length ) % ( area_length ) )) (8)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  EX (state_after: circular_area_state)  (output_after: (@list (@option Z))) ,
  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (CircularAreaReadResult state requested output_capacity output_before 0 state_after output_after ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state_after ca0 )
  **  (UCharArray.mixed_full out0 output_capacity output_after )
) \/
(
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (area_length: Z) (b_status: Z) (logical: (@list Z)) (physical: (@list (@option Z))) (data_length: Z) (retval: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (0 <= INT_MAX)) (PreH4 : (0 >= INT_MIN)) (PreH5 : (retval = out0)) (PreH6 : (ca0 <> 0)) (PreH7 : (out0 <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (requested > 0)) (PreH10 : (area_length = (ca_capacity (state)))) (PreH11 : (logical = (ca_contents (state)))) (PreH12 : (CircularAreaStateEmptyResult state 0 )) (PreH13 : (CircularAreaActualReadLength logical requested data_length )) (PreH14 : (0 < data_length)) (PreH15 : (data_length <= output_capacity)) (PreH16 : (0 <= readidx)) (PreH17 : ((readidx + data_length ) <= area_length)) (PreH18 : (CircularAreaDivideRdDataResult readidx data_length area_length 0 )) (PreH19 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH20 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH21 : (CircularAreaInitializedSlice physical readidx (readidx + data_length ) (sublist (0) (data_length) (logical)) )) ,
  (UCharArray.mixed_full out0 data_length (CircularAreaSomeBytes ((sublist (0) (data_length) ((ca_contents (state)))))) )
  **  (UCharArray.mixed_seg data_buffer readidx (readidx + data_length ) (CircularAreaSomeBytes ((sublist (0) (data_length) ((ca_contents (state)))))) )
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (readidx + data_length ) area_length (sublist ((readidx + data_length )) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> (unsigned_last_nbits (((readidx + data_length ) % ( area_length ) )) (8)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  EX (state_after: circular_area_state)  (output_after: (@list (@option Z))) ,
  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (CircularAreaReadResult state requested output_capacity output_before 0 state_after output_after ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state_after ca0 )
  **  (UCharArray.mixed_full out0 output_capacity output_after )
).

Definition CircularAreaRead_return_wit_3 := 
(
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (requested > 0)) (PreH4 : (requested <= output_capacity)) (PreH5 : (CircularAreaStateEmptyResult state 1 )) ,
  (GlobalStrings LitMap )
  **  (store_circular_area state ca0 )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  EX (state_after: circular_area_state)  (output_after: (@list (@option Z))) ,
  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (CircularAreaReadResult state requested output_capacity output_before 1 state_after output_after ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state_after ca0 )
  **  (UCharArray.mixed_full out0 output_capacity output_after )
) \/
(
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (state: circular_area_state) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (requested > 0)) (PreH4 : (requested <= output_capacity)) (PreH5 : (CircularAreaStateEmptyResult state 1 )) ,
  TT && emp 
|--
  “ (CircularAreaReadResult state requested output_capacity output_before 1 state output_before ) ”
  &&  emp
).

Definition CircularAreaRead_return_wit_3_split_goal_1 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (state: circular_area_state) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (requested > 0)) (PreH4 : (requested <= output_capacity)) (PreH5 : (CircularAreaStateEmptyResult state 1 )) ,
  (CircularAreaReadResult state requested output_capacity output_before 1 state output_before )
.

Definition CircularAreaRead_return_wit_4 := 
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (data_length_pre <= 0)) (PreH2 : (0 <= data_length_pre)) (PreH3 : (data_length_pre <= UINT_MAX)) (PreH4 : (output_buffer_pre <> 0)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre = ca0)) (PreH7 : (output_buffer_pre = out0)) (PreH8 : (data_length_pre = requested)) (PreH9 : (0 <= requested)) (PreH10 : (requested <= UINT_MAX)) (PreH11 : (ca0 <> 0)) (PreH12 : (out0 <> 0)) (PreH13 : (requested <= output_capacity)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area state ca0 )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  EX (state_after: circular_area_state)  (output_after: (@list (@option Z))) ,
  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (CircularAreaReadResult state requested output_capacity output_before 1 state_after output_after ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state_after ca0 )
  **  (UCharArray.mixed_full out0 output_capacity output_after )
) \/
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (state: circular_area_state) (PreH1 : (data_length_pre <= 0)) (PreH2 : (0 <= data_length_pre)) (PreH3 : (data_length_pre <= UINT_MAX)) (PreH4 : (output_buffer_pre <> 0)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre = ca0)) (PreH7 : (output_buffer_pre = out0)) (PreH8 : (data_length_pre = requested)) (PreH9 : (0 <= requested)) (PreH10 : (requested <= UINT_MAX)) (PreH11 : (ca0 <> 0)) (PreH12 : (out0 <> 0)) (PreH13 : (requested <= output_capacity)) ,
  TT && emp 
|--
  “ (CircularAreaReadResult state data_length_pre output_capacity output_before 1 state output_before ) ”
  &&  emp
).

Definition CircularAreaRead_return_wit_4_split_goal_1 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (state: circular_area_state) (PreH1 : (data_length_pre <= 0)) (PreH2 : (0 <= data_length_pre)) (PreH3 : (data_length_pre <= UINT_MAX)) (PreH4 : (output_buffer_pre <> 0)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre = ca0)) (PreH7 : (output_buffer_pre = out0)) (PreH8 : (data_length_pre = requested)) (PreH9 : (0 <= requested)) (PreH10 : (requested <= UINT_MAX)) (PreH11 : (ca0 <> 0)) (PreH12 : (out0 <> 0)) (PreH13 : (requested <= output_capacity)) ,
  (CircularAreaReadResult state data_length_pre output_capacity output_before 1 state output_before )
.

Definition CircularAreaRead_return_wit_5 := 
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (output_buffer_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = ca0)) (PreH4 : (output_buffer_pre = out0)) (PreH5 : (data_length_pre = requested)) (PreH6 : (0 <= requested)) (PreH7 : (requested <= UINT_MAX)) (PreH8 : (ca0 <> 0)) (PreH9 : (out0 = 0)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area state ca0 )
|--
  “ (ca0 <> 0) ” 
  &&  “ (out0 = 0) ” 
  &&  “ (CircularAreaErrorResult 1 ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state ca0 )
) \/
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (PreH1 : (output_buffer_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = ca0)) (PreH4 : (output_buffer_pre = out0)) (PreH5 : (data_length_pre = requested)) (PreH6 : (0 <= requested)) (PreH7 : (requested <= UINT_MAX)) (PreH8 : (ca0 <> 0)) (PreH9 : (out0 = 0)) ,
  TT && emp 
|--
  “ (CircularAreaErrorResult 1 ) ”
  &&  emp
).

Definition CircularAreaRead_return_wit_5_split_goal_1 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (PreH1 : (output_buffer_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = ca0)) (PreH4 : (output_buffer_pre = out0)) (PreH5 : (data_length_pre = requested)) (PreH6 : (0 <= requested)) (PreH7 : (requested <= UINT_MAX)) (PreH8 : (ca0 <> 0)) (PreH9 : (out0 = 0)) ,
  (CircularAreaErrorResult 1 )
.

Definition CircularAreaRead_return_wit_6 := 
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (LitMap: (string -> Z)) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (output_buffer_pre = out0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (0 <= requested)) (PreH6 : (requested <= UINT_MAX)) (PreH7 : (ca0 = 0)) ,
  (GlobalStrings LitMap )
|--
  “ (ca0 = 0) ” 
  &&  “ (CircularAreaErrorResult 1 ) ”
  &&  (GlobalStrings LitMap )
) \/
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (output_buffer_pre = out0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (0 <= requested)) (PreH6 : (requested <= UINT_MAX)) (PreH7 : (ca0 = 0)) ,
  TT && emp 
|--
  “ (CircularAreaErrorResult 1 ) ”
  &&  emp
).

Definition CircularAreaRead_return_wit_6_split_goal_1 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (output_buffer_pre = out0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (0 <= requested)) (PreH6 : (requested <= UINT_MAX)) (PreH7 : (ca0 = 0)) ,
  (CircularAreaErrorResult 1 )
.

Definition CircularAreaRead_partial_solve_wit_1 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (data_length_pre > 0)) (PreH2 : (0 <= data_length_pre)) (PreH3 : (data_length_pre <= UINT_MAX)) (PreH4 : (output_buffer_pre <> 0)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre = ca0)) (PreH7 : (output_buffer_pre = out0)) (PreH8 : (data_length_pre = requested)) (PreH9 : (0 <= requested)) (PreH10 : (requested <= UINT_MAX)) (PreH11 : (ca0 <> 0)) (PreH12 : (out0 <> 0)) (PreH13 : (requested <= output_capacity)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area state ca0 )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (data_length_pre > 0) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= UINT_MAX) ” 
  &&  “ (output_buffer_pre <> 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre = ca0) ” 
  &&  “ (output_buffer_pre = out0) ” 
  &&  “ (data_length_pre = requested) ” 
  &&  “ (0 <= requested) ” 
  &&  “ (requested <= UINT_MAX) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (requested <= output_capacity) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
.

Definition CircularAreaRead_partial_solve_wit_2 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (retval: Z) (PreH1 : (CircularAreaStateEmptyResult state retval )) (PreH2 : (data_length_pre > 0)) (PreH3 : (0 <= data_length_pre)) (PreH4 : (data_length_pre <= UINT_MAX)) (PreH5 : (output_buffer_pre <> 0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (circular_area_pre = ca0)) (PreH8 : (output_buffer_pre = out0)) (PreH9 : (data_length_pre = requested)) (PreH10 : (0 <= requested)) (PreH11 : (requested <= UINT_MAX)) (PreH12 : (ca0 <> 0)) (PreH13 : (out0 <> 0)) (PreH14 : (requested <= output_capacity)) (PreH15 : (retval = 0)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (CircularAreaStateEmptyResult state retval ) ” 
  &&  “ (data_length_pre > 0) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= UINT_MAX) ” 
  &&  “ (output_buffer_pre <> 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre = ca0) ” 
  &&  “ (output_buffer_pre = out0) ” 
  &&  “ (data_length_pre = requested) ” 
  &&  “ (0 <= requested) ” 
  &&  “ (requested <= UINT_MAX) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (requested <= output_capacity) ” 
  &&  “ (retval = 0) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
.

Definition CircularAreaRead_partial_solve_wit_3 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (retval: Z) (retval_2: Z) (PreH1 : (data_length_pre > retval_2)) (PreH2 : (CircularAreaStateDataLengthResult state retval_2 )) (PreH3 : (CircularAreaStateEmptyResult state retval )) (PreH4 : (data_length_pre > 0)) (PreH5 : (0 <= data_length_pre)) (PreH6 : (data_length_pre <= UINT_MAX)) (PreH7 : (output_buffer_pre <> 0)) (PreH8 : (circular_area_pre <> 0)) (PreH9 : (circular_area_pre = ca0)) (PreH10 : (output_buffer_pre = out0)) (PreH11 : (data_length_pre = requested)) (PreH12 : (0 <= requested)) (PreH13 : (requested <= UINT_MAX)) (PreH14 : (ca0 <> 0)) (PreH15 : (out0 <> 0)) (PreH16 : (requested <= output_capacity)) (PreH17 : (retval = 0)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (data_length_pre > retval_2) ” 
  &&  “ (CircularAreaStateDataLengthResult state retval_2 ) ” 
  &&  “ (CircularAreaStateEmptyResult state retval ) ” 
  &&  “ (data_length_pre > 0) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= UINT_MAX) ” 
  &&  “ (output_buffer_pre <> 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre = ca0) ” 
  &&  “ (output_buffer_pre = out0) ” 
  &&  “ (data_length_pre = requested) ” 
  &&  “ (0 <= requested) ” 
  &&  “ (requested <= UINT_MAX) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (requested <= output_capacity) ” 
  &&  “ (retval = 0) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
.

Definition CircularAreaRead_partial_solve_wit_4_pure := 
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (CircularAreaStateDataLengthResult state retval )) (PreH2 : (data_length_pre > retval_3)) (PreH3 : (CircularAreaStateDataLengthResult state retval_3 )) (PreH4 : (CircularAreaStateEmptyResult state retval_2 )) (PreH5 : (data_length_pre > 0)) (PreH6 : (0 <= data_length_pre)) (PreH7 : (data_length_pre <= UINT_MAX)) (PreH8 : (output_buffer_pre <> 0)) (PreH9 : (circular_area_pre <> 0)) (PreH10 : (circular_area_pre = ca0)) (PreH11 : (output_buffer_pre = out0)) (PreH12 : (data_length_pre = requested)) (PreH13 : (0 <= requested)) (PreH14 : (requested <= UINT_MAX)) (PreH15 : (ca0 <> 0)) (PreH16 : (out0 <> 0)) (PreH17 : (requested <= output_capacity)) (PreH18 : (retval_2 = 0)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
  **  ((( &( "data_length" ) )) # UInt  |-> retval)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (retval = retval) ” 
  &&  “ (retval <= (Zlength ((ca_contents (state))))) ” 
  &&  “ (0 <= retval) ”
) \/
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (retval <= UINT_MAX)) (PreH2 : (retval >= 0)) (PreH3 : (CircularAreaStateDataLengthResult state retval )) (PreH4 : (data_length_pre > retval_3)) (PreH5 : (CircularAreaStateDataLengthResult state retval_3 )) (PreH6 : (CircularAreaStateEmptyResult state retval_2 )) (PreH7 : (data_length_pre > 0)) (PreH8 : (0 <= data_length_pre)) (PreH9 : (data_length_pre <= UINT_MAX)) (PreH10 : (output_buffer_pre <> 0)) (PreH11 : (circular_area_pre <> 0)) (PreH12 : (circular_area_pre = ca0)) (PreH13 : (output_buffer_pre = out0)) (PreH14 : (data_length_pre = requested)) (PreH15 : (0 <= requested)) (PreH16 : (requested <= UINT_MAX)) (PreH17 : (ca0 <> 0)) (PreH18 : (out0 <> 0)) (PreH19 : (requested <= output_capacity)) (PreH20 : (retval_2 = 0)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
  **  ((( &( "data_length" ) )) # UInt  |-> retval)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (retval <= (Zlength ((ca_contents (state))))) ”
).

Definition CircularAreaRead_partial_solve_wit_4_pure_split_goal_1 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (retval <= UINT_MAX)) (PreH2 : (retval >= 0)) (PreH3 : (CircularAreaStateDataLengthResult state retval )) (PreH4 : (data_length_pre > retval_3)) (PreH5 : (CircularAreaStateDataLengthResult state retval_3 )) (PreH6 : (CircularAreaStateEmptyResult state retval_2 )) (PreH7 : (data_length_pre > 0)) (PreH8 : (0 <= data_length_pre)) (PreH9 : (data_length_pre <= UINT_MAX)) (PreH10 : (output_buffer_pre <> 0)) (PreH11 : (circular_area_pre <> 0)) (PreH12 : (circular_area_pre = ca0)) (PreH13 : (output_buffer_pre = out0)) (PreH14 : (data_length_pre = requested)) (PreH15 : (0 <= requested)) (PreH16 : (requested <= UINT_MAX)) (PreH17 : (ca0 <> 0)) (PreH18 : (out0 <> 0)) (PreH19 : (requested <= output_capacity)) (PreH20 : (retval_2 = 0)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
  **  ((( &( "data_length" ) )) # UInt  |-> retval)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (retval <= (Zlength ((ca_contents (state))))) ”
.

Definition CircularAreaRead_partial_solve_wit_4_aux := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (CircularAreaStateDataLengthResult state retval )) (PreH2 : (data_length_pre > retval_3)) (PreH3 : (CircularAreaStateDataLengthResult state retval_3 )) (PreH4 : (CircularAreaStateEmptyResult state retval_2 )) (PreH5 : (data_length_pre > 0)) (PreH6 : (0 <= data_length_pre)) (PreH7 : (data_length_pre <= UINT_MAX)) (PreH8 : (output_buffer_pre <> 0)) (PreH9 : (circular_area_pre <> 0)) (PreH10 : (circular_area_pre = ca0)) (PreH11 : (output_buffer_pre = out0)) (PreH12 : (data_length_pre = requested)) (PreH13 : (0 <= requested)) (PreH14 : (requested <= UINT_MAX)) (PreH15 : (ca0 <> 0)) (PreH16 : (out0 <> 0)) (PreH17 : (requested <= output_capacity)) (PreH18 : (retval_2 = 0)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (retval = retval) ” 
  &&  “ (retval <= (Zlength ((ca_contents (state))))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (CircularAreaStateDataLengthResult state retval ) ” 
  &&  “ (data_length_pre > retval_3) ” 
  &&  “ (CircularAreaStateDataLengthResult state retval_3 ) ” 
  &&  “ (CircularAreaStateEmptyResult state retval_2 ) ” 
  &&  “ (data_length_pre > 0) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= UINT_MAX) ” 
  &&  “ (output_buffer_pre <> 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre = ca0) ” 
  &&  “ (output_buffer_pre = out0) ” 
  &&  “ (data_length_pre = requested) ” 
  &&  “ (0 <= requested) ” 
  &&  “ (requested <= UINT_MAX) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (requested <= output_capacity) ” 
  &&  “ (retval_2 = 0) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
.

Definition CircularAreaRead_partial_solve_wit_4 := CircularAreaRead_partial_solve_wit_4_pure -> CircularAreaRead_partial_solve_wit_4_aux.

Definition CircularAreaRead_partial_solve_wit_5_pure := 
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (retval: Z) (retval_2: Z) (PreH1 : (data_length_pre <= retval_2)) (PreH2 : (CircularAreaStateDataLengthResult state retval_2 )) (PreH3 : (CircularAreaStateEmptyResult state retval )) (PreH4 : (data_length_pre > 0)) (PreH5 : (0 <= data_length_pre)) (PreH6 : (data_length_pre <= UINT_MAX)) (PreH7 : (output_buffer_pre <> 0)) (PreH8 : (circular_area_pre <> 0)) (PreH9 : (circular_area_pre = ca0)) (PreH10 : (output_buffer_pre = out0)) (PreH11 : (data_length_pre = requested)) (PreH12 : (0 <= requested)) (PreH13 : (requested <= UINT_MAX)) (PreH14 : (ca0 <> 0)) (PreH15 : (out0 <> 0)) (PreH16 : (requested <= output_capacity)) (PreH17 : (retval = 0)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (data_length_pre = data_length_pre) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= (Zlength ((ca_contents (state))))) ”
) \/
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (retval: Z) (retval_2: Z) (PreH1 : (data_length_pre >= 0)) (PreH2 : (data_length_pre <= retval_2)) (PreH3 : (CircularAreaStateDataLengthResult state retval_2 )) (PreH4 : (CircularAreaStateEmptyResult state retval )) (PreH5 : (data_length_pre > 0)) (PreH6 : (0 <= data_length_pre)) (PreH7 : (data_length_pre <= UINT_MAX)) (PreH8 : (output_buffer_pre <> 0)) (PreH9 : (circular_area_pre <> 0)) (PreH10 : (circular_area_pre = ca0)) (PreH11 : (output_buffer_pre = out0)) (PreH12 : (data_length_pre = requested)) (PreH13 : (0 <= requested)) (PreH14 : (requested <= UINT_MAX)) (PreH15 : (ca0 <> 0)) (PreH16 : (out0 <> 0)) (PreH17 : (requested <= output_capacity)) (PreH18 : (retval = 0)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (data_length_pre <= (Zlength ((ca_contents (state))))) ”
).

Definition CircularAreaRead_partial_solve_wit_5_pure_split_goal_1 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (retval: Z) (retval_2: Z) (PreH1 : (data_length_pre >= 0)) (PreH2 : (data_length_pre <= retval_2)) (PreH3 : (CircularAreaStateDataLengthResult state retval_2 )) (PreH4 : (CircularAreaStateEmptyResult state retval )) (PreH5 : (data_length_pre > 0)) (PreH6 : (0 <= data_length_pre)) (PreH7 : (data_length_pre <= UINT_MAX)) (PreH8 : (output_buffer_pre <> 0)) (PreH9 : (circular_area_pre <> 0)) (PreH10 : (circular_area_pre = ca0)) (PreH11 : (output_buffer_pre = out0)) (PreH12 : (data_length_pre = requested)) (PreH13 : (0 <= requested)) (PreH14 : (requested <= UINT_MAX)) (PreH15 : (ca0 <> 0)) (PreH16 : (out0 <> 0)) (PreH17 : (requested <= output_capacity)) (PreH18 : (retval = 0)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (data_length_pre <= (Zlength ((ca_contents (state))))) ”
.

Definition CircularAreaRead_partial_solve_wit_5_aux := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (retval: Z) (retval_2: Z) (PreH1 : (data_length_pre <= retval_2)) (PreH2 : (CircularAreaStateDataLengthResult state retval_2 )) (PreH3 : (CircularAreaStateEmptyResult state retval )) (PreH4 : (data_length_pre > 0)) (PreH5 : (0 <= data_length_pre)) (PreH6 : (data_length_pre <= UINT_MAX)) (PreH7 : (output_buffer_pre <> 0)) (PreH8 : (circular_area_pre <> 0)) (PreH9 : (circular_area_pre = ca0)) (PreH10 : (output_buffer_pre = out0)) (PreH11 : (data_length_pre = requested)) (PreH12 : (0 <= requested)) (PreH13 : (requested <= UINT_MAX)) (PreH14 : (ca0 <> 0)) (PreH15 : (out0 <> 0)) (PreH16 : (requested <= output_capacity)) (PreH17 : (retval = 0)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
|--
  “ (data_length_pre = data_length_pre) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= (Zlength ((ca_contents (state))))) ” 
  &&  “ (data_length_pre <= retval_2) ” 
  &&  “ (CircularAreaStateDataLengthResult state retval_2 ) ” 
  &&  “ (CircularAreaStateEmptyResult state retval ) ” 
  &&  “ (data_length_pre > 0) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= UINT_MAX) ” 
  &&  “ (output_buffer_pre <> 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre = ca0) ” 
  &&  “ (output_buffer_pre = out0) ” 
  &&  “ (data_length_pre = requested) ” 
  &&  “ (0 <= requested) ” 
  &&  “ (requested <= UINT_MAX) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (requested <= output_capacity) ” 
  &&  “ (retval = 0) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
  **  (UCharArray.mixed_full out0 output_capacity output_before )
.

Definition CircularAreaRead_partial_solve_wit_5 := CircularAreaRead_partial_solve_wit_5_pure -> CircularAreaRead_partial_solve_wit_5_aux.

Definition CircularAreaRead_partial_solve_wit_6_pure := 
(
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (area_length: Z) (b_status: Z) (logical: (@list Z)) (physical: (@list (@option Z))) (data_length: Z) (read_len_up: Z) (read_len_down: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (area_length = (ca_capacity (state)))) (PreH6 : (logical = (ca_contents (state)))) (PreH7 : (CircularAreaStateEmptyResult state 0 )) (PreH8 : (CircularAreaActualReadLength logical requested data_length )) (PreH9 : (0 < data_length)) (PreH10 : (data_length <= output_capacity)) (PreH11 : (0 <= readidx)) (PreH12 : (readidx < area_length)) (PreH13 : (read_len_up = (area_length - readidx ))) (PreH14 : (read_len_down = (data_length - read_len_up ))) (PreH15 : (read_len_up <= data_length)) (PreH16 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH17 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH18 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH19 : (CircularAreaInitializedSlice physical readidx area_length (sublist (0) (read_len_up) (logical)) )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "read_len_up" ) )) # UInt  |-> read_len_up)
  **  ((( &( "read_len_down" ) )) # UInt  |-> read_len_down)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (CircularAreaSomeBytes ((sublist (0) (read_len_up) (logical)))) )
  **  (UCharArray.mixed_full out0 read_len_up (sublist (0) (read_len_up) (output_before)) )
  **  (UCharArray.mixed_seg out0 read_len_up output_capacity (sublist (read_len_up) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((data_buffer + (readidx * sizeof(UCHAR))) = (data_buffer + readidx )) ” 
  &&  “ (read_len_up = (area_length - readidx )) ” 
  &&  “ ((Zlength ((sublist (0) (read_len_up) (output_before)))) = read_len_up) ” 
  &&  “ ((Zlength ((sublist (0) (read_len_up) ((ca_contents (state)))))) = read_len_up) ” 
  &&  “ ((Zlength ((sublist (0) ((area_length - readidx )) (logical)))) = (area_length - readidx )) ” 
  &&  “ ((Zlength ((sublist (0) ((area_length - readidx )) (output_before)))) = (area_length - readidx )) ”
) \/
(
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (area_length: Z) (b_status: Z) (logical: (@list Z)) (physical: (@list (@option Z))) (data_length: Z) (read_len_up: Z) (read_len_down: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (read_len_down <= UINT_MAX)) (PreH3 : (read_len_up <= UINT_MAX)) (PreH4 : (data_length <= UINT_MAX)) (PreH5 : (area_length >= 0)) (PreH6 : (read_len_down >= 0)) (PreH7 : (read_len_up >= 0)) (PreH8 : (data_length >= 0)) (PreH9 : (b_status <= INT_MAX)) (PreH10 : (b_status >= INT_MIN)) (PreH11 : (ca0 <> 0)) (PreH12 : (out0 <> 0)) (PreH13 : (data_buffer <> 0)) (PreH14 : (requested > 0)) (PreH15 : (area_length = (ca_capacity (state)))) (PreH16 : (logical = (ca_contents (state)))) (PreH17 : (CircularAreaStateEmptyResult state 0 )) (PreH18 : (CircularAreaActualReadLength logical requested data_length )) (PreH19 : (0 < data_length)) (PreH20 : (data_length <= output_capacity)) (PreH21 : (0 <= readidx)) (PreH22 : (readidx < area_length)) (PreH23 : (read_len_up = (area_length - readidx ))) (PreH24 : (read_len_down = (data_length - read_len_up ))) (PreH25 : (read_len_up <= data_length)) (PreH26 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH27 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH28 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH29 : (CircularAreaInitializedSlice physical readidx area_length (sublist (0) (read_len_up) (logical)) )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "read_len_up" ) )) # UInt  |-> read_len_up)
  **  ((( &( "read_len_down" ) )) # UInt  |-> read_len_down)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (CircularAreaSomeBytes ((sublist (0) (read_len_up) (logical)))) )
  **  (UCharArray.mixed_full out0 read_len_up (sublist (0) (read_len_up) (output_before)) )
  **  (UCharArray.mixed_seg out0 read_len_up output_capacity (sublist (read_len_up) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((Zlength ((sublist (0) ((area_length - readidx )) (output_before)))) = (area_length - readidx )) ” 
  &&  “ ((Zlength ((sublist (0) ((area_length - readidx )) (logical)))) = (area_length - readidx )) ” 
  &&  “ ((Zlength ((sublist (0) ((area_length - readidx )) (logical)))) = (area_length - readidx )) ” 
  &&  “ ((Zlength ((sublist (0) ((area_length - readidx )) (output_before)))) = (area_length - readidx )) ”
).

Definition CircularAreaRead_partial_solve_wit_6_pure_split_goal_1 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (area_length: Z) (b_status: Z) (logical: (@list Z)) (physical: (@list (@option Z))) (data_length: Z) (read_len_up: Z) (read_len_down: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (read_len_down <= UINT_MAX)) (PreH3 : (read_len_up <= UINT_MAX)) (PreH4 : (data_length <= UINT_MAX)) (PreH5 : (area_length >= 0)) (PreH6 : (read_len_down >= 0)) (PreH7 : (read_len_up >= 0)) (PreH8 : (data_length >= 0)) (PreH9 : (b_status <= INT_MAX)) (PreH10 : (b_status >= INT_MIN)) (PreH11 : (ca0 <> 0)) (PreH12 : (out0 <> 0)) (PreH13 : (data_buffer <> 0)) (PreH14 : (requested > 0)) (PreH15 : (area_length = (ca_capacity (state)))) (PreH16 : (logical = (ca_contents (state)))) (PreH17 : (CircularAreaStateEmptyResult state 0 )) (PreH18 : (CircularAreaActualReadLength logical requested data_length )) (PreH19 : (0 < data_length)) (PreH20 : (data_length <= output_capacity)) (PreH21 : (0 <= readidx)) (PreH22 : (readidx < area_length)) (PreH23 : (read_len_up = (area_length - readidx ))) (PreH24 : (read_len_down = (data_length - read_len_up ))) (PreH25 : (read_len_up <= data_length)) (PreH26 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH27 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH28 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH29 : (CircularAreaInitializedSlice physical readidx area_length (sublist (0) (read_len_up) (logical)) )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "read_len_up" ) )) # UInt  |-> read_len_up)
  **  ((( &( "read_len_down" ) )) # UInt  |-> read_len_down)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (CircularAreaSomeBytes ((sublist (0) (read_len_up) (logical)))) )
  **  (UCharArray.mixed_full out0 read_len_up (sublist (0) (read_len_up) (output_before)) )
  **  (UCharArray.mixed_seg out0 read_len_up output_capacity (sublist (read_len_up) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((Zlength ((sublist (0) ((area_length - readidx )) (output_before)))) = (area_length - readidx )) ”
.

Definition CircularAreaRead_partial_solve_wit_6_pure_split_goal_2 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (area_length: Z) (b_status: Z) (logical: (@list Z)) (physical: (@list (@option Z))) (data_length: Z) (read_len_up: Z) (read_len_down: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (read_len_down <= UINT_MAX)) (PreH3 : (read_len_up <= UINT_MAX)) (PreH4 : (data_length <= UINT_MAX)) (PreH5 : (area_length >= 0)) (PreH6 : (read_len_down >= 0)) (PreH7 : (read_len_up >= 0)) (PreH8 : (data_length >= 0)) (PreH9 : (b_status <= INT_MAX)) (PreH10 : (b_status >= INT_MIN)) (PreH11 : (ca0 <> 0)) (PreH12 : (out0 <> 0)) (PreH13 : (data_buffer <> 0)) (PreH14 : (requested > 0)) (PreH15 : (area_length = (ca_capacity (state)))) (PreH16 : (logical = (ca_contents (state)))) (PreH17 : (CircularAreaStateEmptyResult state 0 )) (PreH18 : (CircularAreaActualReadLength logical requested data_length )) (PreH19 : (0 < data_length)) (PreH20 : (data_length <= output_capacity)) (PreH21 : (0 <= readidx)) (PreH22 : (readidx < area_length)) (PreH23 : (read_len_up = (area_length - readidx ))) (PreH24 : (read_len_down = (data_length - read_len_up ))) (PreH25 : (read_len_up <= data_length)) (PreH26 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH27 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH28 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH29 : (CircularAreaInitializedSlice physical readidx area_length (sublist (0) (read_len_up) (logical)) )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "read_len_up" ) )) # UInt  |-> read_len_up)
  **  ((( &( "read_len_down" ) )) # UInt  |-> read_len_down)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (CircularAreaSomeBytes ((sublist (0) (read_len_up) (logical)))) )
  **  (UCharArray.mixed_full out0 read_len_up (sublist (0) (read_len_up) (output_before)) )
  **  (UCharArray.mixed_seg out0 read_len_up output_capacity (sublist (read_len_up) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((Zlength ((sublist (0) ((area_length - readidx )) (logical)))) = (area_length - readidx )) ”
.

Definition CircularAreaRead_partial_solve_wit_6_pure_split_goal_3 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (area_length: Z) (b_status: Z) (logical: (@list Z)) (physical: (@list (@option Z))) (data_length: Z) (read_len_up: Z) (read_len_down: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (read_len_down <= UINT_MAX)) (PreH3 : (read_len_up <= UINT_MAX)) (PreH4 : (data_length <= UINT_MAX)) (PreH5 : (area_length >= 0)) (PreH6 : (read_len_down >= 0)) (PreH7 : (read_len_up >= 0)) (PreH8 : (data_length >= 0)) (PreH9 : (b_status <= INT_MAX)) (PreH10 : (b_status >= INT_MIN)) (PreH11 : (ca0 <> 0)) (PreH12 : (out0 <> 0)) (PreH13 : (data_buffer <> 0)) (PreH14 : (requested > 0)) (PreH15 : (area_length = (ca_capacity (state)))) (PreH16 : (logical = (ca_contents (state)))) (PreH17 : (CircularAreaStateEmptyResult state 0 )) (PreH18 : (CircularAreaActualReadLength logical requested data_length )) (PreH19 : (0 < data_length)) (PreH20 : (data_length <= output_capacity)) (PreH21 : (0 <= readidx)) (PreH22 : (readidx < area_length)) (PreH23 : (read_len_up = (area_length - readidx ))) (PreH24 : (read_len_down = (data_length - read_len_up ))) (PreH25 : (read_len_up <= data_length)) (PreH26 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH27 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH28 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH29 : (CircularAreaInitializedSlice physical readidx area_length (sublist (0) (read_len_up) (logical)) )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "read_len_up" ) )) # UInt  |-> read_len_up)
  **  ((( &( "read_len_down" ) )) # UInt  |-> read_len_down)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (CircularAreaSomeBytes ((sublist (0) (read_len_up) (logical)))) )
  **  (UCharArray.mixed_full out0 read_len_up (sublist (0) (read_len_up) (output_before)) )
  **  (UCharArray.mixed_seg out0 read_len_up output_capacity (sublist (read_len_up) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((Zlength ((sublist (0) ((area_length - readidx )) (logical)))) = (area_length - readidx )) ”
.

Definition CircularAreaRead_partial_solve_wit_6_pure_split_goal_4 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (area_length: Z) (b_status: Z) (logical: (@list Z)) (physical: (@list (@option Z))) (data_length: Z) (read_len_up: Z) (read_len_down: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (read_len_down <= UINT_MAX)) (PreH3 : (read_len_up <= UINT_MAX)) (PreH4 : (data_length <= UINT_MAX)) (PreH5 : (area_length >= 0)) (PreH6 : (read_len_down >= 0)) (PreH7 : (read_len_up >= 0)) (PreH8 : (data_length >= 0)) (PreH9 : (b_status <= INT_MAX)) (PreH10 : (b_status >= INT_MIN)) (PreH11 : (ca0 <> 0)) (PreH12 : (out0 <> 0)) (PreH13 : (data_buffer <> 0)) (PreH14 : (requested > 0)) (PreH15 : (area_length = (ca_capacity (state)))) (PreH16 : (logical = (ca_contents (state)))) (PreH17 : (CircularAreaStateEmptyResult state 0 )) (PreH18 : (CircularAreaActualReadLength logical requested data_length )) (PreH19 : (0 < data_length)) (PreH20 : (data_length <= output_capacity)) (PreH21 : (0 <= readidx)) (PreH22 : (readidx < area_length)) (PreH23 : (read_len_up = (area_length - readidx ))) (PreH24 : (read_len_down = (data_length - read_len_up ))) (PreH25 : (read_len_up <= data_length)) (PreH26 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH27 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH28 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH29 : (CircularAreaInitializedSlice physical readidx area_length (sublist (0) (read_len_up) (logical)) )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "read_len_up" ) )) # UInt  |-> read_len_up)
  **  ((( &( "read_len_down" ) )) # UInt  |-> read_len_down)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (CircularAreaSomeBytes ((sublist (0) (read_len_up) (logical)))) )
  **  (UCharArray.mixed_full out0 read_len_up (sublist (0) (read_len_up) (output_before)) )
  **  (UCharArray.mixed_seg out0 read_len_up output_capacity (sublist (read_len_up) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((Zlength ((sublist (0) ((area_length - readidx )) (output_before)))) = (area_length - readidx )) ”
.

Definition CircularAreaRead_partial_solve_wit_6_aux := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (area_length: Z) (b_status: Z) (logical: (@list Z)) (physical: (@list (@option Z))) (data_length: Z) (read_len_up: Z) (read_len_down: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (area_length = (ca_capacity (state)))) (PreH6 : (logical = (ca_contents (state)))) (PreH7 : (CircularAreaStateEmptyResult state 0 )) (PreH8 : (CircularAreaActualReadLength logical requested data_length )) (PreH9 : (0 < data_length)) (PreH10 : (data_length <= output_capacity)) (PreH11 : (0 <= readidx)) (PreH12 : (readidx < area_length)) (PreH13 : (read_len_up = (area_length - readidx ))) (PreH14 : (read_len_down = (data_length - read_len_up ))) (PreH15 : (read_len_up <= data_length)) (PreH16 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH17 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH18 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH19 : (CircularAreaInitializedSlice physical readidx area_length (sublist (0) (read_len_up) (logical)) )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (CircularAreaSomeBytes ((sublist (0) (read_len_up) (logical)))) )
  **  (UCharArray.mixed_full out0 read_len_up (sublist (0) (read_len_up) (output_before)) )
  **  (UCharArray.mixed_seg out0 read_len_up output_capacity (sublist (read_len_up) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((data_buffer + (readidx * sizeof(UCHAR))) = (data_buffer + readidx )) ” 
  &&  “ (read_len_up = (area_length - readidx )) ” 
  &&  “ ((Zlength ((sublist (0) (read_len_up) (output_before)))) = read_len_up) ” 
  &&  “ ((Zlength ((sublist (0) (read_len_up) ((ca_contents (state)))))) = read_len_up) ” 
  &&  “ ((Zlength ((sublist (0) ((area_length - readidx )) (logical)))) = (area_length - readidx )) ” 
  &&  “ ((Zlength ((sublist (0) ((area_length - readidx )) (output_before)))) = (area_length - readidx )) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (area_length = (ca_capacity (state))) ” 
  &&  “ (logical = (ca_contents (state))) ” 
  &&  “ (CircularAreaStateEmptyResult state 0 ) ” 
  &&  “ (CircularAreaActualReadLength logical requested data_length ) ” 
  &&  “ (0 < data_length) ” 
  &&  “ (data_length <= output_capacity) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (readidx < area_length) ” 
  &&  “ (read_len_up = (area_length - readidx )) ” 
  &&  “ (read_len_down = (data_length - read_len_up )) ” 
  &&  “ (read_len_up <= data_length) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx data_length area_length 1 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ” 
  &&  “ (CircularAreaLiveBytes readidx area_length logical physical ) ” 
  &&  “ (CircularAreaInitializedSlice physical readidx area_length (sublist (0) (read_len_up) (logical)) ) ”
  &&  (UCharArray.mixed_full out0 read_len_up (sublist (0) (read_len_up) (output_before)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (CircularAreaSomeBytes ((sublist (0) (read_len_up) ((ca_contents (state)))))) )
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg out0 read_len_up output_capacity (sublist (read_len_up) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
.

Definition CircularAreaRead_partial_solve_wit_6 := CircularAreaRead_partial_solve_wit_6_pure -> CircularAreaRead_partial_solve_wit_6_aux.

Definition CircularAreaRead_partial_solve_wit_7_pure := 
(
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (area_length: Z) (b_status: Z) (logical: (@list Z)) (physical: (@list (@option Z))) (data_length: Z) (read_len_down: Z) (read_len_up: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (area_length = (ca_capacity (state)))) (PreH6 : (logical = (ca_contents (state)))) (PreH7 : (CircularAreaStateEmptyResult state 0 )) (PreH8 : (CircularAreaActualReadLength logical requested data_length )) (PreH9 : (0 < data_length)) (PreH10 : (data_length <= output_capacity)) (PreH11 : (0 <= read_len_down)) (PreH12 : (read_len_down <= readidx)) (PreH13 : (read_len_up = (area_length - readidx ))) (PreH14 : (read_len_down = (data_length - read_len_up ))) (PreH15 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH16 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH17 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH18 : (CircularAreaInitializedSlice physical 0 read_len_down (sublist (read_len_up) (data_length) (logical)) )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "read_len_down" ) )) # UInt  |-> read_len_down)
  **  ((( &( "read_len_up" ) )) # UInt  |-> read_len_up)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 read_len_down (CircularAreaSomeBytes ((sublist (read_len_up) (data_length) (logical)))) )
  **  (UCharArray.mixed_seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (sublist (readidx) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 read_len_up (CircularAreaSomeBytes ((sublist (0) (read_len_up) (logical)))) )
  **  (UCharArray.mixed_full (out0 + (read_len_up * sizeof(UCHAR))) read_len_down (sublist (read_len_up) (data_length) (output_before)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (data_buffer = (data_buffer + 0 )) ” 
  &&  “ (read_len_down = (read_len_down - 0 )) ” 
  &&  “ ((Zlength ((sublist (read_len_up) (data_length) (output_before)))) = read_len_down) ” 
  &&  “ ((Zlength ((sublist (read_len_up) (data_length) ((ca_contents (state)))))) = read_len_down) ” 
  &&  “ ((Zlength ((sublist ((area_length - readidx )) (data_length) (logical)))) = (data_length - read_len_up )) ” 
  &&  “ ((Zlength ((sublist ((area_length - readidx )) (data_length) (output_before)))) = (data_length - read_len_up )) ”
) \/
(
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (area_length: Z) (b_status: Z) (logical: (@list Z)) (physical: (@list (@option Z))) (data_length: Z) (read_len_down: Z) (read_len_up: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (read_len_up <= UINT_MAX)) (PreH3 : (read_len_down <= UINT_MAX)) (PreH4 : (data_length <= UINT_MAX)) (PreH5 : (area_length >= 0)) (PreH6 : (read_len_up >= 0)) (PreH7 : (read_len_down >= 0)) (PreH8 : (data_length >= 0)) (PreH9 : (b_status <= INT_MAX)) (PreH10 : (b_status >= INT_MIN)) (PreH11 : (ca0 <> 0)) (PreH12 : (out0 <> 0)) (PreH13 : (data_buffer <> 0)) (PreH14 : (requested > 0)) (PreH15 : (area_length = (ca_capacity (state)))) (PreH16 : (logical = (ca_contents (state)))) (PreH17 : (CircularAreaStateEmptyResult state 0 )) (PreH18 : (CircularAreaActualReadLength logical requested data_length )) (PreH19 : (0 < data_length)) (PreH20 : (data_length <= output_capacity)) (PreH21 : (0 <= read_len_down)) (PreH22 : (read_len_down <= readidx)) (PreH23 : (read_len_up = (area_length - readidx ))) (PreH24 : (read_len_down = (data_length - read_len_up ))) (PreH25 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH26 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH27 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH28 : (CircularAreaInitializedSlice physical 0 read_len_down (sublist (read_len_up) (data_length) (logical)) )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "read_len_down" ) )) # UInt  |-> read_len_down)
  **  ((( &( "read_len_up" ) )) # UInt  |-> read_len_up)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 read_len_down (CircularAreaSomeBytes ((sublist (read_len_up) (data_length) (logical)))) )
  **  (UCharArray.mixed_seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (sublist (readidx) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 read_len_up (CircularAreaSomeBytes ((sublist (0) (read_len_up) (logical)))) )
  **  (UCharArray.mixed_full (out0 + (read_len_up * sizeof(UCHAR))) read_len_down (sublist (read_len_up) (data_length) (output_before)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((Zlength ((sublist ((area_length - readidx )) (data_length) (output_before)))) = (data_length - (area_length - readidx ) )) ” 
  &&  “ ((Zlength ((sublist ((area_length - readidx )) (data_length) (logical)))) = (data_length - (area_length - readidx ) )) ” 
  &&  “ ((Zlength ((sublist ((area_length - readidx )) (data_length) (logical)))) = (data_length - read_len_up )) ” 
  &&  “ ((Zlength ((sublist ((area_length - readidx )) (data_length) (output_before)))) = (data_length - read_len_up )) ”
).

Definition CircularAreaRead_partial_solve_wit_7_pure_split_goal_1 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (area_length: Z) (b_status: Z) (logical: (@list Z)) (physical: (@list (@option Z))) (data_length: Z) (read_len_down: Z) (read_len_up: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (read_len_up <= UINT_MAX)) (PreH3 : (read_len_down <= UINT_MAX)) (PreH4 : (data_length <= UINT_MAX)) (PreH5 : (area_length >= 0)) (PreH6 : (read_len_up >= 0)) (PreH7 : (read_len_down >= 0)) (PreH8 : (data_length >= 0)) (PreH9 : (b_status <= INT_MAX)) (PreH10 : (b_status >= INT_MIN)) (PreH11 : (ca0 <> 0)) (PreH12 : (out0 <> 0)) (PreH13 : (data_buffer <> 0)) (PreH14 : (requested > 0)) (PreH15 : (area_length = (ca_capacity (state)))) (PreH16 : (logical = (ca_contents (state)))) (PreH17 : (CircularAreaStateEmptyResult state 0 )) (PreH18 : (CircularAreaActualReadLength logical requested data_length )) (PreH19 : (0 < data_length)) (PreH20 : (data_length <= output_capacity)) (PreH21 : (0 <= read_len_down)) (PreH22 : (read_len_down <= readidx)) (PreH23 : (read_len_up = (area_length - readidx ))) (PreH24 : (read_len_down = (data_length - read_len_up ))) (PreH25 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH26 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH27 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH28 : (CircularAreaInitializedSlice physical 0 read_len_down (sublist (read_len_up) (data_length) (logical)) )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "read_len_down" ) )) # UInt  |-> read_len_down)
  **  ((( &( "read_len_up" ) )) # UInt  |-> read_len_up)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 read_len_down (CircularAreaSomeBytes ((sublist (read_len_up) (data_length) (logical)))) )
  **  (UCharArray.mixed_seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (sublist (readidx) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 read_len_up (CircularAreaSomeBytes ((sublist (0) (read_len_up) (logical)))) )
  **  (UCharArray.mixed_full (out0 + (read_len_up * sizeof(UCHAR))) read_len_down (sublist (read_len_up) (data_length) (output_before)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((Zlength ((sublist ((area_length - readidx )) (data_length) (output_before)))) = (data_length - (area_length - readidx ) )) ”
.

Definition CircularAreaRead_partial_solve_wit_7_pure_split_goal_2 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (area_length: Z) (b_status: Z) (logical: (@list Z)) (physical: (@list (@option Z))) (data_length: Z) (read_len_down: Z) (read_len_up: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (read_len_up <= UINT_MAX)) (PreH3 : (read_len_down <= UINT_MAX)) (PreH4 : (data_length <= UINT_MAX)) (PreH5 : (area_length >= 0)) (PreH6 : (read_len_up >= 0)) (PreH7 : (read_len_down >= 0)) (PreH8 : (data_length >= 0)) (PreH9 : (b_status <= INT_MAX)) (PreH10 : (b_status >= INT_MIN)) (PreH11 : (ca0 <> 0)) (PreH12 : (out0 <> 0)) (PreH13 : (data_buffer <> 0)) (PreH14 : (requested > 0)) (PreH15 : (area_length = (ca_capacity (state)))) (PreH16 : (logical = (ca_contents (state)))) (PreH17 : (CircularAreaStateEmptyResult state 0 )) (PreH18 : (CircularAreaActualReadLength logical requested data_length )) (PreH19 : (0 < data_length)) (PreH20 : (data_length <= output_capacity)) (PreH21 : (0 <= read_len_down)) (PreH22 : (read_len_down <= readidx)) (PreH23 : (read_len_up = (area_length - readidx ))) (PreH24 : (read_len_down = (data_length - read_len_up ))) (PreH25 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH26 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH27 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH28 : (CircularAreaInitializedSlice physical 0 read_len_down (sublist (read_len_up) (data_length) (logical)) )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "read_len_down" ) )) # UInt  |-> read_len_down)
  **  ((( &( "read_len_up" ) )) # UInt  |-> read_len_up)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 read_len_down (CircularAreaSomeBytes ((sublist (read_len_up) (data_length) (logical)))) )
  **  (UCharArray.mixed_seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (sublist (readidx) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 read_len_up (CircularAreaSomeBytes ((sublist (0) (read_len_up) (logical)))) )
  **  (UCharArray.mixed_full (out0 + (read_len_up * sizeof(UCHAR))) read_len_down (sublist (read_len_up) (data_length) (output_before)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((Zlength ((sublist ((area_length - readidx )) (data_length) (logical)))) = (data_length - (area_length - readidx ) )) ”
.

Definition CircularAreaRead_partial_solve_wit_7_pure_split_goal_3 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (area_length: Z) (b_status: Z) (logical: (@list Z)) (physical: (@list (@option Z))) (data_length: Z) (read_len_down: Z) (read_len_up: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (read_len_up <= UINT_MAX)) (PreH3 : (read_len_down <= UINT_MAX)) (PreH4 : (data_length <= UINT_MAX)) (PreH5 : (area_length >= 0)) (PreH6 : (read_len_up >= 0)) (PreH7 : (read_len_down >= 0)) (PreH8 : (data_length >= 0)) (PreH9 : (b_status <= INT_MAX)) (PreH10 : (b_status >= INT_MIN)) (PreH11 : (ca0 <> 0)) (PreH12 : (out0 <> 0)) (PreH13 : (data_buffer <> 0)) (PreH14 : (requested > 0)) (PreH15 : (area_length = (ca_capacity (state)))) (PreH16 : (logical = (ca_contents (state)))) (PreH17 : (CircularAreaStateEmptyResult state 0 )) (PreH18 : (CircularAreaActualReadLength logical requested data_length )) (PreH19 : (0 < data_length)) (PreH20 : (data_length <= output_capacity)) (PreH21 : (0 <= read_len_down)) (PreH22 : (read_len_down <= readidx)) (PreH23 : (read_len_up = (area_length - readidx ))) (PreH24 : (read_len_down = (data_length - read_len_up ))) (PreH25 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH26 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH27 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH28 : (CircularAreaInitializedSlice physical 0 read_len_down (sublist (read_len_up) (data_length) (logical)) )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "read_len_down" ) )) # UInt  |-> read_len_down)
  **  ((( &( "read_len_up" ) )) # UInt  |-> read_len_up)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 read_len_down (CircularAreaSomeBytes ((sublist (read_len_up) (data_length) (logical)))) )
  **  (UCharArray.mixed_seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (sublist (readidx) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 read_len_up (CircularAreaSomeBytes ((sublist (0) (read_len_up) (logical)))) )
  **  (UCharArray.mixed_full (out0 + (read_len_up * sizeof(UCHAR))) read_len_down (sublist (read_len_up) (data_length) (output_before)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((Zlength ((sublist ((area_length - readidx )) (data_length) (logical)))) = (data_length - read_len_up )) ”
.

Definition CircularAreaRead_partial_solve_wit_7_pure_split_goal_4 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (area_length: Z) (b_status: Z) (logical: (@list Z)) (physical: (@list (@option Z))) (data_length: Z) (read_len_down: Z) (read_len_up: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (read_len_up <= UINT_MAX)) (PreH3 : (read_len_down <= UINT_MAX)) (PreH4 : (data_length <= UINT_MAX)) (PreH5 : (area_length >= 0)) (PreH6 : (read_len_up >= 0)) (PreH7 : (read_len_down >= 0)) (PreH8 : (data_length >= 0)) (PreH9 : (b_status <= INT_MAX)) (PreH10 : (b_status >= INT_MIN)) (PreH11 : (ca0 <> 0)) (PreH12 : (out0 <> 0)) (PreH13 : (data_buffer <> 0)) (PreH14 : (requested > 0)) (PreH15 : (area_length = (ca_capacity (state)))) (PreH16 : (logical = (ca_contents (state)))) (PreH17 : (CircularAreaStateEmptyResult state 0 )) (PreH18 : (CircularAreaActualReadLength logical requested data_length )) (PreH19 : (0 < data_length)) (PreH20 : (data_length <= output_capacity)) (PreH21 : (0 <= read_len_down)) (PreH22 : (read_len_down <= readidx)) (PreH23 : (read_len_up = (area_length - readidx ))) (PreH24 : (read_len_down = (data_length - read_len_up ))) (PreH25 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH26 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH27 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH28 : (CircularAreaInitializedSlice physical 0 read_len_down (sublist (read_len_up) (data_length) (logical)) )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "read_len_down" ) )) # UInt  |-> read_len_down)
  **  ((( &( "read_len_up" ) )) # UInt  |-> read_len_up)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 read_len_down (CircularAreaSomeBytes ((sublist (read_len_up) (data_length) (logical)))) )
  **  (UCharArray.mixed_seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (sublist (readidx) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 read_len_up (CircularAreaSomeBytes ((sublist (0) (read_len_up) (logical)))) )
  **  (UCharArray.mixed_full (out0 + (read_len_up * sizeof(UCHAR))) read_len_down (sublist (read_len_up) (data_length) (output_before)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((Zlength ((sublist ((area_length - readidx )) (data_length) (output_before)))) = (data_length - read_len_up )) ”
.

Definition CircularAreaRead_partial_solve_wit_7_aux := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (area_length: Z) (b_status: Z) (logical: (@list Z)) (physical: (@list (@option Z))) (data_length: Z) (read_len_down: Z) (read_len_up: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (area_length = (ca_capacity (state)))) (PreH6 : (logical = (ca_contents (state)))) (PreH7 : (CircularAreaStateEmptyResult state 0 )) (PreH8 : (CircularAreaActualReadLength logical requested data_length )) (PreH9 : (0 < data_length)) (PreH10 : (data_length <= output_capacity)) (PreH11 : (0 <= read_len_down)) (PreH12 : (read_len_down <= readidx)) (PreH13 : (read_len_up = (area_length - readidx ))) (PreH14 : (read_len_down = (data_length - read_len_up ))) (PreH15 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH16 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH17 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH18 : (CircularAreaInitializedSlice physical 0 read_len_down (sublist (read_len_up) (data_length) (logical)) )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 read_len_down (CircularAreaSomeBytes ((sublist (read_len_up) (data_length) (logical)))) )
  **  (UCharArray.mixed_seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (sublist (readidx) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 read_len_up (CircularAreaSomeBytes ((sublist (0) (read_len_up) (logical)))) )
  **  (UCharArray.mixed_full (out0 + (read_len_up * sizeof(UCHAR))) read_len_down (sublist (read_len_up) (data_length) (output_before)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (data_buffer = (data_buffer + 0 )) ” 
  &&  “ (read_len_down = (read_len_down - 0 )) ” 
  &&  “ ((Zlength ((sublist (read_len_up) (data_length) (output_before)))) = read_len_down) ” 
  &&  “ ((Zlength ((sublist (read_len_up) (data_length) ((ca_contents (state)))))) = read_len_down) ” 
  &&  “ ((Zlength ((sublist ((area_length - readidx )) (data_length) (logical)))) = (data_length - read_len_up )) ” 
  &&  “ ((Zlength ((sublist ((area_length - readidx )) (data_length) (output_before)))) = (data_length - read_len_up )) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (area_length = (ca_capacity (state))) ” 
  &&  “ (logical = (ca_contents (state))) ” 
  &&  “ (CircularAreaStateEmptyResult state 0 ) ” 
  &&  “ (CircularAreaActualReadLength logical requested data_length ) ” 
  &&  “ (0 < data_length) ” 
  &&  “ (data_length <= output_capacity) ” 
  &&  “ (0 <= read_len_down) ” 
  &&  “ (read_len_down <= readidx) ” 
  &&  “ (read_len_up = (area_length - readidx )) ” 
  &&  “ (read_len_down = (data_length - read_len_up )) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx data_length area_length 1 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ” 
  &&  “ (CircularAreaLiveBytes readidx area_length logical physical ) ” 
  &&  “ (CircularAreaInitializedSlice physical 0 read_len_down (sublist (read_len_up) (data_length) (logical)) ) ”
  &&  (UCharArray.mixed_full (out0 + (read_len_up * sizeof(UCHAR))) read_len_down (sublist (read_len_up) (data_length) (output_before)) )
  **  (UCharArray.mixed_seg data_buffer 0 read_len_down (CircularAreaSomeBytes ((sublist (read_len_up) (data_length) ((ca_contents (state)))))) )
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx area_length (sublist (readidx) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 0 read_len_up (CircularAreaSomeBytes ((sublist (0) (read_len_up) (logical)))) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
.

Definition CircularAreaRead_partial_solve_wit_7 := CircularAreaRead_partial_solve_wit_7_pure -> CircularAreaRead_partial_solve_wit_7_aux.

Definition CircularAreaRead_partial_solve_wit_8_pure := 
(
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (area_length: Z) (b_status: Z) (logical: (@list Z)) (physical: (@list (@option Z))) (data_length: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (area_length = (ca_capacity (state)))) (PreH6 : (logical = (ca_contents (state)))) (PreH7 : (CircularAreaStateEmptyResult state 0 )) (PreH8 : (CircularAreaActualReadLength logical requested data_length )) (PreH9 : (0 < data_length)) (PreH10 : (data_length <= output_capacity)) (PreH11 : (0 <= readidx)) (PreH12 : ((readidx + data_length ) <= area_length)) (PreH13 : (CircularAreaDivideRdDataResult readidx data_length area_length 0 )) (PreH14 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH15 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH16 : (CircularAreaInitializedSlice physical readidx (readidx + data_length ) (sublist (0) (data_length) (logical)) )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx (readidx + data_length ) (CircularAreaSomeBytes ((sublist (0) (data_length) (logical)))) )
  **  (UCharArray.mixed_seg data_buffer (readidx + data_length ) area_length (sublist ((readidx + data_length )) (area_length) (physical)) )
  **  (UCharArray.mixed_full out0 data_length (sublist (0) (data_length) (output_before)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((data_buffer + (readidx * sizeof(UCHAR))) = (data_buffer + readidx )) ” 
  &&  “ (data_length = ((readidx + data_length ) - readidx )) ” 
  &&  “ ((Zlength ((sublist (0) (data_length) ((ca_contents (state)))))) = data_length) ” 
  &&  “ ((Zlength ((sublist (0) (data_length) (logical)))) = data_length) ” 
  &&  “ ((Zlength ((sublist (0) (data_length) (output_before)))) = data_length) ”
) \/
(
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (area_length: Z) (b_status: Z) (logical: (@list Z)) (physical: (@list (@option Z))) (data_length: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (data_length <= UINT_MAX)) (PreH3 : (area_length >= 0)) (PreH4 : (data_length >= 0)) (PreH5 : (b_status <= INT_MAX)) (PreH6 : (b_status >= INT_MIN)) (PreH7 : (ca0 <> 0)) (PreH8 : (out0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (requested > 0)) (PreH11 : (area_length = (ca_capacity (state)))) (PreH12 : (logical = (ca_contents (state)))) (PreH13 : (CircularAreaStateEmptyResult state 0 )) (PreH14 : (CircularAreaActualReadLength logical requested data_length )) (PreH15 : (0 < data_length)) (PreH16 : (data_length <= output_capacity)) (PreH17 : (0 <= readidx)) (PreH18 : ((readidx + data_length ) <= area_length)) (PreH19 : (CircularAreaDivideRdDataResult readidx data_length area_length 0 )) (PreH20 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH21 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH22 : (CircularAreaInitializedSlice physical readidx (readidx + data_length ) (sublist (0) (data_length) (logical)) )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx (readidx + data_length ) (CircularAreaSomeBytes ((sublist (0) (data_length) (logical)))) )
  **  (UCharArray.mixed_seg data_buffer (readidx + data_length ) area_length (sublist ((readidx + data_length )) (area_length) (physical)) )
  **  (UCharArray.mixed_full out0 data_length (sublist (0) (data_length) (output_before)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((Zlength ((sublist (0) (data_length) (output_before)))) = data_length) ” 
  &&  “ ((Zlength ((sublist (0) (data_length) (logical)))) = data_length) ” 
  &&  “ ((Zlength ((sublist (0) (data_length) (logical)))) = data_length) ”
).

Definition CircularAreaRead_partial_solve_wit_8_pure_split_goal_1 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (area_length: Z) (b_status: Z) (logical: (@list Z)) (physical: (@list (@option Z))) (data_length: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (data_length <= UINT_MAX)) (PreH3 : (area_length >= 0)) (PreH4 : (data_length >= 0)) (PreH5 : (b_status <= INT_MAX)) (PreH6 : (b_status >= INT_MIN)) (PreH7 : (ca0 <> 0)) (PreH8 : (out0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (requested > 0)) (PreH11 : (area_length = (ca_capacity (state)))) (PreH12 : (logical = (ca_contents (state)))) (PreH13 : (CircularAreaStateEmptyResult state 0 )) (PreH14 : (CircularAreaActualReadLength logical requested data_length )) (PreH15 : (0 < data_length)) (PreH16 : (data_length <= output_capacity)) (PreH17 : (0 <= readidx)) (PreH18 : ((readidx + data_length ) <= area_length)) (PreH19 : (CircularAreaDivideRdDataResult readidx data_length area_length 0 )) (PreH20 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH21 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH22 : (CircularAreaInitializedSlice physical readidx (readidx + data_length ) (sublist (0) (data_length) (logical)) )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx (readidx + data_length ) (CircularAreaSomeBytes ((sublist (0) (data_length) (logical)))) )
  **  (UCharArray.mixed_seg data_buffer (readidx + data_length ) area_length (sublist ((readidx + data_length )) (area_length) (physical)) )
  **  (UCharArray.mixed_full out0 data_length (sublist (0) (data_length) (output_before)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((Zlength ((sublist (0) (data_length) (output_before)))) = data_length) ”
.

Definition CircularAreaRead_partial_solve_wit_8_pure_split_goal_2 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (area_length: Z) (b_status: Z) (logical: (@list Z)) (physical: (@list (@option Z))) (data_length: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (data_length <= UINT_MAX)) (PreH3 : (area_length >= 0)) (PreH4 : (data_length >= 0)) (PreH5 : (b_status <= INT_MAX)) (PreH6 : (b_status >= INT_MIN)) (PreH7 : (ca0 <> 0)) (PreH8 : (out0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (requested > 0)) (PreH11 : (area_length = (ca_capacity (state)))) (PreH12 : (logical = (ca_contents (state)))) (PreH13 : (CircularAreaStateEmptyResult state 0 )) (PreH14 : (CircularAreaActualReadLength logical requested data_length )) (PreH15 : (0 < data_length)) (PreH16 : (data_length <= output_capacity)) (PreH17 : (0 <= readidx)) (PreH18 : ((readidx + data_length ) <= area_length)) (PreH19 : (CircularAreaDivideRdDataResult readidx data_length area_length 0 )) (PreH20 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH21 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH22 : (CircularAreaInitializedSlice physical readidx (readidx + data_length ) (sublist (0) (data_length) (logical)) )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx (readidx + data_length ) (CircularAreaSomeBytes ((sublist (0) (data_length) (logical)))) )
  **  (UCharArray.mixed_seg data_buffer (readidx + data_length ) area_length (sublist ((readidx + data_length )) (area_length) (physical)) )
  **  (UCharArray.mixed_full out0 data_length (sublist (0) (data_length) (output_before)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((Zlength ((sublist (0) (data_length) (logical)))) = data_length) ”
.

Definition CircularAreaRead_partial_solve_wit_8_pure_split_goal_3 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (area_length: Z) (b_status: Z) (logical: (@list Z)) (physical: (@list (@option Z))) (data_length: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (data_length <= UINT_MAX)) (PreH3 : (area_length >= 0)) (PreH4 : (data_length >= 0)) (PreH5 : (b_status <= INT_MAX)) (PreH6 : (b_status >= INT_MIN)) (PreH7 : (ca0 <> 0)) (PreH8 : (out0 <> 0)) (PreH9 : (data_buffer <> 0)) (PreH10 : (requested > 0)) (PreH11 : (area_length = (ca_capacity (state)))) (PreH12 : (logical = (ca_contents (state)))) (PreH13 : (CircularAreaStateEmptyResult state 0 )) (PreH14 : (CircularAreaActualReadLength logical requested data_length )) (PreH15 : (0 < data_length)) (PreH16 : (data_length <= output_capacity)) (PreH17 : (0 <= readidx)) (PreH18 : ((readidx + data_length ) <= area_length)) (PreH19 : (CircularAreaDivideRdDataResult readidx data_length area_length 0 )) (PreH20 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH21 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH22 : (CircularAreaInitializedSlice physical readidx (readidx + data_length ) (sublist (0) (data_length) (logical)) )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx (readidx + data_length ) (CircularAreaSomeBytes ((sublist (0) (data_length) (logical)))) )
  **  (UCharArray.mixed_seg data_buffer (readidx + data_length ) area_length (sublist ((readidx + data_length )) (area_length) (physical)) )
  **  (UCharArray.mixed_full out0 data_length (sublist (0) (data_length) (output_before)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((Zlength ((sublist (0) (data_length) (logical)))) = data_length) ”
.

Definition CircularAreaRead_partial_solve_wit_8_aux := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list (@option Z))) (output_capacity: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (area_length: Z) (b_status: Z) (logical: (@list Z)) (physical: (@list (@option Z))) (data_length: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (requested > 0)) (PreH5 : (area_length = (ca_capacity (state)))) (PreH6 : (logical = (ca_contents (state)))) (PreH7 : (CircularAreaStateEmptyResult state 0 )) (PreH8 : (CircularAreaActualReadLength logical requested data_length )) (PreH9 : (0 < data_length)) (PreH10 : (data_length <= output_capacity)) (PreH11 : (0 <= readidx)) (PreH12 : ((readidx + data_length ) <= area_length)) (PreH13 : (CircularAreaDivideRdDataResult readidx data_length area_length 0 )) (PreH14 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) (PreH15 : (CircularAreaLiveBytes readidx area_length logical physical )) (PreH16 : (CircularAreaInitializedSlice physical readidx (readidx + data_length ) (sublist (0) (data_length) (logical)) )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer readidx (readidx + data_length ) (CircularAreaSomeBytes ((sublist (0) (data_length) (logical)))) )
  **  (UCharArray.mixed_seg data_buffer (readidx + data_length ) area_length (sublist ((readidx + data_length )) (area_length) (physical)) )
  **  (UCharArray.mixed_full out0 data_length (sublist (0) (data_length) (output_before)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((data_buffer + (readidx * sizeof(UCHAR))) = (data_buffer + readidx )) ” 
  &&  “ (data_length = ((readidx + data_length ) - readidx )) ” 
  &&  “ ((Zlength ((sublist (0) (data_length) ((ca_contents (state)))))) = data_length) ” 
  &&  “ ((Zlength ((sublist (0) (data_length) (logical)))) = data_length) ” 
  &&  “ ((Zlength ((sublist (0) (data_length) (output_before)))) = data_length) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (area_length = (ca_capacity (state))) ” 
  &&  “ (logical = (ca_contents (state))) ” 
  &&  “ (CircularAreaStateEmptyResult state 0 ) ” 
  &&  “ (CircularAreaActualReadLength logical requested data_length ) ” 
  &&  “ (0 < data_length) ” 
  &&  “ (data_length <= output_capacity) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ ((readidx + data_length ) <= area_length) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx data_length area_length 0 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ” 
  &&  “ (CircularAreaLiveBytes readidx area_length logical physical ) ” 
  &&  “ (CircularAreaInitializedSlice physical readidx (readidx + data_length ) (sublist (0) (data_length) (logical)) ) ”
  &&  (UCharArray.mixed_full out0 data_length (sublist (0) (data_length) (output_before)) )
  **  (UCharArray.mixed_seg data_buffer readidx (readidx + data_length ) (CircularAreaSomeBytes ((sublist (0) (data_length) ((ca_contents (state)))))) )
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_seg data_buffer 0 readidx (sublist (0) (readidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (readidx + data_length ) area_length (sublist ((readidx + data_length )) (area_length) (physical)) )
  **  (UCharArray.mixed_seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
.

Definition CircularAreaRead_partial_solve_wit_8 := CircularAreaRead_partial_solve_wit_8_pure -> CircularAreaRead_partial_solve_wit_8_aux.

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
Axiom proof_of_CircularAreaIsFull_partial_solve_wit_1 : CircularAreaIsFull_partial_solve_wit_1.
Axiom proof_of_CircularAreaIsEmpty_safety_wit_1 : CircularAreaIsEmpty_safety_wit_1.
Axiom proof_of_CircularAreaIsEmpty_safety_wit_2 : CircularAreaIsEmpty_safety_wit_2.
Axiom proof_of_CircularAreaIsEmpty_safety_wit_3 : CircularAreaIsEmpty_safety_wit_3.
Axiom proof_of_CircularAreaIsEmpty_safety_wit_4 : CircularAreaIsEmpty_safety_wit_4.
Axiom proof_of_CircularAreaIsEmpty_safety_wit_5 : CircularAreaIsEmpty_safety_wit_5.
Axiom proof_of_CircularAreaIsEmpty_safety_wit_6 : CircularAreaIsEmpty_safety_wit_6.
Axiom proof_of_CircularAreaIsEmpty_safety_wit_7 : CircularAreaIsEmpty_safety_wit_7.
Axiom proof_of_CircularAreaIsEmpty_entail_wit_1 : CircularAreaIsEmpty_entail_wit_1.
Axiom proof_of_CircularAreaIsEmpty_return_wit_1 : CircularAreaIsEmpty_return_wit_1.
Axiom proof_of_CircularAreaIsEmpty_return_wit_2 : CircularAreaIsEmpty_return_wit_2.
Axiom proof_of_CircularAreaIsEmpty_return_wit_3 : CircularAreaIsEmpty_return_wit_3.
Axiom proof_of_CircularAreaIsEmpty_partial_solve_wit_1 : CircularAreaIsEmpty_partial_solve_wit_1.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_1 : CircularAreaGetDataLength_safety_wit_1.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_2 : CircularAreaGetDataLength_safety_wit_2.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_3 : CircularAreaGetDataLength_safety_wit_3.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_4 : CircularAreaGetDataLength_safety_wit_4.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_5 : CircularAreaGetDataLength_safety_wit_5.
Axiom proof_of_CircularAreaGetDataLength_entail_wit_1 : CircularAreaGetDataLength_entail_wit_1.
Axiom proof_of_CircularAreaGetDataLength_entail_wit_2 : CircularAreaGetDataLength_entail_wit_2.
Axiom proof_of_CircularAreaGetDataLength_return_wit_1 : CircularAreaGetDataLength_return_wit_1.
Axiom proof_of_CircularAreaGetDataLength_return_wit_2 : CircularAreaGetDataLength_return_wit_2.
Axiom proof_of_CircularAreaGetDataLength_return_wit_3 : CircularAreaGetDataLength_return_wit_3.
Axiom proof_of_CircularAreaGetDataLength_partial_solve_wit_1 : CircularAreaGetDataLength_partial_solve_wit_1.
Axiom proof_of_CircularAreaDivideRdData_safety_wit_1 : CircularAreaDivideRdData_safety_wit_1.
Axiom proof_of_CircularAreaDivideRdData_safety_wit_2 : CircularAreaDivideRdData_safety_wit_2.
Axiom proof_of_CircularAreaDivideRdData_safety_wit_3 : CircularAreaDivideRdData_safety_wit_3.
Axiom proof_of_CircularAreaDivideRdData_safety_wit_4 : CircularAreaDivideRdData_safety_wit_4.
Axiom proof_of_CircularAreaDivideRdData_safety_wit_5 : CircularAreaDivideRdData_safety_wit_5.
Axiom proof_of_CircularAreaDivideRdData_entail_wit_1 : CircularAreaDivideRdData_entail_wit_1.
Axiom proof_of_CircularAreaDivideRdData_return_wit_1 : CircularAreaDivideRdData_return_wit_1.
Axiom proof_of_CircularAreaDivideRdData_return_wit_2 : CircularAreaDivideRdData_return_wit_2.
Axiom proof_of_CircularAreaRead_safety_wit_1 : CircularAreaRead_safety_wit_1.
Axiom proof_of_CircularAreaRead_safety_wit_2 : CircularAreaRead_safety_wit_2.
Axiom proof_of_CircularAreaRead_safety_wit_3 : CircularAreaRead_safety_wit_3.
Axiom proof_of_CircularAreaRead_safety_wit_4 : CircularAreaRead_safety_wit_4.
Axiom proof_of_CircularAreaRead_safety_wit_5 : CircularAreaRead_safety_wit_5.
Axiom proof_of_CircularAreaRead_safety_wit_6 : CircularAreaRead_safety_wit_6.
Axiom proof_of_CircularAreaRead_safety_wit_7 : CircularAreaRead_safety_wit_7.
Axiom proof_of_CircularAreaRead_safety_wit_8 : CircularAreaRead_safety_wit_8.
Axiom proof_of_CircularAreaRead_safety_wit_9 : CircularAreaRead_safety_wit_9.
Axiom proof_of_CircularAreaRead_safety_wit_10 : CircularAreaRead_safety_wit_10.
Axiom proof_of_CircularAreaRead_safety_wit_11 : CircularAreaRead_safety_wit_11.
Axiom proof_of_CircularAreaRead_safety_wit_12 : CircularAreaRead_safety_wit_12.
Axiom proof_of_CircularAreaRead_safety_wit_13 : CircularAreaRead_safety_wit_13.
Axiom proof_of_CircularAreaRead_safety_wit_14 : CircularAreaRead_safety_wit_14.
Axiom proof_of_CircularAreaRead_safety_wit_15 : CircularAreaRead_safety_wit_15.
Axiom proof_of_CircularAreaRead_safety_wit_16 : CircularAreaRead_safety_wit_16.
Axiom proof_of_CircularAreaRead_safety_wit_17 : CircularAreaRead_safety_wit_17.
Axiom proof_of_CircularAreaRead_safety_wit_18 : CircularAreaRead_safety_wit_18.
Axiom proof_of_CircularAreaRead_safety_wit_19 : CircularAreaRead_safety_wit_19.
Axiom proof_of_CircularAreaRead_safety_wit_20 : CircularAreaRead_safety_wit_20.
Axiom proof_of_CircularAreaRead_safety_wit_21 : CircularAreaRead_safety_wit_21.
Axiom proof_of_CircularAreaRead_safety_wit_22 : CircularAreaRead_safety_wit_22.
Axiom proof_of_CircularAreaRead_safety_wit_23 : CircularAreaRead_safety_wit_23.
Axiom proof_of_CircularAreaRead_safety_wit_24 : CircularAreaRead_safety_wit_24.
Axiom proof_of_CircularAreaRead_entail_wit_1 : CircularAreaRead_entail_wit_1.
Axiom proof_of_CircularAreaRead_entail_wit_2 : CircularAreaRead_entail_wit_2.
Axiom proof_of_CircularAreaRead_entail_wit_3_1 : CircularAreaRead_entail_wit_3_1.
Axiom proof_of_CircularAreaRead_entail_wit_3_2 : CircularAreaRead_entail_wit_3_2.
Axiom proof_of_CircularAreaRead_entail_wit_4 : CircularAreaRead_entail_wit_4.
Axiom proof_of_CircularAreaRead_entail_wit_5 : CircularAreaRead_entail_wit_5.
Axiom proof_of_CircularAreaRead_entail_wit_6_1 : CircularAreaRead_entail_wit_6_1.
Axiom proof_of_CircularAreaRead_entail_wit_6_2 : CircularAreaRead_entail_wit_6_2.
Axiom proof_of_CircularAreaRead_return_wit_1 : CircularAreaRead_return_wit_1.
Axiom proof_of_CircularAreaRead_return_wit_2 : CircularAreaRead_return_wit_2.
Axiom proof_of_CircularAreaRead_return_wit_3 : CircularAreaRead_return_wit_3.
Axiom proof_of_CircularAreaRead_return_wit_4 : CircularAreaRead_return_wit_4.
Axiom proof_of_CircularAreaRead_return_wit_5 : CircularAreaRead_return_wit_5.
Axiom proof_of_CircularAreaRead_return_wit_6 : CircularAreaRead_return_wit_6.
Axiom proof_of_CircularAreaRead_partial_solve_wit_1 : CircularAreaRead_partial_solve_wit_1.
Axiom proof_of_CircularAreaRead_partial_solve_wit_2 : CircularAreaRead_partial_solve_wit_2.
Axiom proof_of_CircularAreaRead_partial_solve_wit_3 : CircularAreaRead_partial_solve_wit_3.
Axiom proof_of_CircularAreaRead_partial_solve_wit_4_pure : CircularAreaRead_partial_solve_wit_4_pure.
Axiom proof_of_CircularAreaRead_partial_solve_wit_4 : CircularAreaRead_partial_solve_wit_4.
Axiom proof_of_CircularAreaRead_partial_solve_wit_5_pure : CircularAreaRead_partial_solve_wit_5_pure.
Axiom proof_of_CircularAreaRead_partial_solve_wit_5 : CircularAreaRead_partial_solve_wit_5.
Axiom proof_of_CircularAreaRead_partial_solve_wit_6_pure : CircularAreaRead_partial_solve_wit_6_pure.
Axiom proof_of_CircularAreaRead_partial_solve_wit_6 : CircularAreaRead_partial_solve_wit_6.
Axiom proof_of_CircularAreaRead_partial_solve_wit_7_pure : CircularAreaRead_partial_solve_wit_7_pure.
Axiom proof_of_CircularAreaRead_partial_solve_wit_7 : CircularAreaRead_partial_solve_wit_7.
Axiom proof_of_CircularAreaRead_partial_solve_wit_8_pure : CircularAreaRead_partial_solve_wit_8_pure.
Axiom proof_of_CircularAreaRead_partial_solve_wit_8 : CircularAreaRead_partial_solve_wit_8.

End VC_Correct.
