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
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_write.source Require Import xizi_circular_area_write_lib.
Local Open Scope sac.
From SimpleC.EE.QCP_demos_LLM Require Import char_array_strategy_goal.
From SimpleC.EE.QCP_demos_LLM Require Import char_array_strategy_proof.

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
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer_2: Z) (operations_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer_2 <> 0)) (PreH3 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
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
.

Definition CircularAreaIsFull_return_wit_1 := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer_2: Z) (operations_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : (readidx_2 <> writeidx_2)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (data_buffer_2 <> 0)) (PreH5 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
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
  EX (operations: Z)  (readidx: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (data_buffer: Z) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaStateFullResult state 0 ) ” 
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
forall (circular_area_pre: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : (readidx_2 <> writeidx_2)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (data_buffer_2 <> 0)) (PreH5 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  TT && emp 
|--
  “ (CircularAreaStateFullResult state 0 ) ”
  &&  emp
).

Definition CircularAreaIsFull_return_wit_1_split_goal_1 := 
forall (circular_area_pre: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : (readidx_2 <> writeidx_2)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (data_buffer_2 <> 0)) (PreH5 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  (CircularAreaStateFullResult state 0 )
.

Definition CircularAreaIsFull_return_wit_2 := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer_2: Z) (operations_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : (b_status_2 = 0)) (PreH2 : (readidx_2 = writeidx_2)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (data_buffer_2 <> 0)) (PreH6 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
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
  EX (operations: Z)  (readidx: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (data_buffer: Z) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaStateFullResult state 0 ) ” 
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
forall (circular_area_pre: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : (b_status_2 = 0)) (PreH2 : (readidx_2 = writeidx_2)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (data_buffer_2 <> 0)) (PreH6 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  TT && emp 
|--
  “ (CircularAreaStateFullResult state 0 ) ”
  &&  emp
).

Definition CircularAreaIsFull_return_wit_2_split_goal_1 := 
forall (circular_area_pre: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : (b_status_2 = 0)) (PreH2 : (readidx_2 = writeidx_2)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (data_buffer_2 <> 0)) (PreH6 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  (CircularAreaStateFullResult state 0 )
.

Definition CircularAreaIsFull_return_wit_3 := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer_2: Z) (operations_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : (b_status_2 <> 0)) (PreH2 : (readidx_2 = writeidx_2)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (data_buffer_2 <> 0)) (PreH6 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
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
  EX (operations: Z)  (readidx: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (data_buffer: Z) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaStateFullResult state 1 ) ” 
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
forall (circular_area_pre: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : (b_status_2 <> 0)) (PreH2 : (readidx_2 = writeidx_2)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (data_buffer_2 <> 0)) (PreH6 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  TT && emp 
|--
  “ (CircularAreaStateFullResult state 1 ) ”
  &&  emp
).

Definition CircularAreaIsFull_return_wit_3_split_goal_1 := 
forall (circular_area_pre: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : (b_status_2 <> 0)) (PreH2 : (readidx_2 = writeidx_2)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (data_buffer_2 <> 0)) (PreH6 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  (CircularAreaStateFullResult state 1 )
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

(*----- Function CircularAreaGetDataLength -----*)

Definition CircularAreaGetDataLength_safety_wit_1 := 
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

Definition CircularAreaGetDataLength_safety_wit_2 := 
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

Definition CircularAreaGetDataLength_safety_wit_3 := 
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
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (operations_2: Z) (readidx_3: Z) (writeidx_3: Z) (b_status_3: Z) (physical_3: (@list (@option Z))) (data_buffer_3: Z) (retval: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer_3 <> 0)) (PreH3 : (CircularAreaStateFullResult state retval )) (PreH4 : (CircularAreaLogicalState readidx_3 writeidx_3 (ca_capacity (state)) b_status_3 (ca_contents (state)) physical_3 )) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (data_buffer_2 <> 0)) (PreH8 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH9 : (retval <> 0)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer_3 (ca_capacity (state)) physical_3 )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_3)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_3)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_3)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_3)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_3 + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_3)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_2)
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
forall (circular_area_pre: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (readidx_3: Z) (writeidx_3: Z) (b_status_3: Z) (physical_3: (@list (@option Z))) (data_buffer_3: Z) (retval: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer_3 <> 0)) (PreH3 : (CircularAreaStateFullResult state retval )) (PreH4 : (CircularAreaLogicalState readidx_3 writeidx_3 (ca_capacity (state)) b_status_3 (ca_contents (state)) physical_3 )) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (data_buffer_2 <> 0)) (PreH8 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH9 : (retval <> 0)) ,
  TT && emp 
|--
  “ ((Zlength ((ca_contents (state)))) = (ca_capacity (state))) ”
  &&  emp
).

Definition CircularAreaGetDataLength_entail_wit_1_split_goal_1 := 
forall (circular_area_pre: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (readidx_3: Z) (writeidx_3: Z) (b_status_3: Z) (physical_3: (@list (@option Z))) (data_buffer_3: Z) (retval: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer_3 <> 0)) (PreH3 : (CircularAreaStateFullResult state retval )) (PreH4 : (CircularAreaLogicalState readidx_3 writeidx_3 (ca_capacity (state)) b_status_3 (ca_contents (state)) physical_3 )) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (data_buffer_2 <> 0)) (PreH8 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH9 : (retval <> 0)) ,
  ((Zlength ((ca_contents (state)))) = (ca_capacity (state)))
.

Definition CircularAreaGetDataLength_entail_wit_2 := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (operations_2: Z) (readidx_3: Z) (writeidx_3: Z) (b_status_3: Z) (physical_3: (@list (@option Z))) (data_buffer_3: Z) (retval: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer_3 <> 0)) (PreH3 : (CircularAreaStateFullResult state retval )) (PreH4 : (CircularAreaLogicalState readidx_3 writeidx_3 (ca_capacity (state)) b_status_3 (ca_contents (state)) physical_3 )) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (data_buffer_2 <> 0)) (PreH8 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH9 : (retval = 0)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer_3 (ca_capacity (state)) physical_3 )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_3)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_3)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_3)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_3)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_3 + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_3)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_2)
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
forall (circular_area_pre: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (readidx_3: Z) (writeidx_3: Z) (b_status_3: Z) (physical_3: (@list (@option Z))) (data_buffer_3: Z) (retval: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer_3 <> 0)) (PreH3 : (CircularAreaStateFullResult state retval )) (PreH4 : (CircularAreaLogicalState readidx_3 writeidx_3 (ca_capacity (state)) b_status_3 (ca_contents (state)) physical_3 )) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (data_buffer_2 <> 0)) (PreH8 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH9 : (retval = 0)) ,
  TT && emp 
|--
  “ ((Zlength ((ca_contents (state)))) < (ca_capacity (state))) ”
  &&  emp
).

Definition CircularAreaGetDataLength_entail_wit_2_split_goal_1 := 
forall (circular_area_pre: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (readidx_3: Z) (writeidx_3: Z) (b_status_3: Z) (physical_3: (@list (@option Z))) (data_buffer_3: Z) (retval: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer_3 <> 0)) (PreH3 : (CircularAreaStateFullResult state retval )) (PreH4 : (CircularAreaLogicalState readidx_3 writeidx_3 (ca_capacity (state)) b_status_3 (ca_contents (state)) physical_3 )) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (data_buffer_2 <> 0)) (PreH8 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH9 : (retval = 0)) ,
  ((Zlength ((ca_contents (state)))) < (ca_capacity (state)))
.

Definition CircularAreaGetDataLength_return_wit_1 := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer_2: Z) (operations_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer_2 <> 0)) (PreH3 : ((Zlength ((ca_contents (state)))) < (ca_capacity (state)))) (PreH4 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
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
  EX (operations: Z)  (readidx: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (data_buffer: Z) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaStateDataLengthResult state ((unsigned_last_nbits (((unsigned_last_nbits ((writeidx_2 - readidx_2 )) (32)) + (ca_capacity (state)) )) (32)) % ( (ca_capacity (state)) ) ) ) ” 
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
forall (circular_area_pre: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer_2 <> 0)) (PreH3 : ((Zlength ((ca_contents (state)))) < (ca_capacity (state)))) (PreH4 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  TT && emp 
|--
  “ (CircularAreaStateDataLengthResult state ((unsigned_last_nbits (((unsigned_last_nbits ((writeidx_2 - readidx_2 )) (32)) + (ca_capacity (state)) )) (32)) % ( (ca_capacity (state)) ) ) ) ”
  &&  emp
).

Definition CircularAreaGetDataLength_return_wit_1_split_goal_1 := 
forall (circular_area_pre: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer_2 <> 0)) (PreH3 : ((Zlength ((ca_contents (state)))) < (ca_capacity (state)))) (PreH4 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  (CircularAreaStateDataLengthResult state ((unsigned_last_nbits (((unsigned_last_nbits ((writeidx_2 - readidx_2 )) (32)) + (ca_capacity (state)) )) (32)) % ( (ca_capacity (state)) ) ) )
.

Definition CircularAreaGetDataLength_return_wit_2 := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer_2: Z) (operations_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer_2 <> 0)) (PreH3 : ((Zlength ((ca_contents (state)))) = (ca_capacity (state)))) (PreH4 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
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
  EX (operations: Z)  (readidx: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (data_buffer: Z) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaStateDataLengthResult state (ca_capacity (state)) ) ” 
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
forall (circular_area_pre: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer_2 <> 0)) (PreH3 : ((Zlength ((ca_contents (state)))) = (ca_capacity (state)))) (PreH4 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  TT && emp 
|--
  “ (CircularAreaStateDataLengthResult state (ca_capacity (state)) ) ”
  &&  emp
).

Definition CircularAreaGetDataLength_return_wit_2_split_goal_1 := 
forall (circular_area_pre: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer_2 <> 0)) (PreH3 : ((Zlength ((ca_contents (state)))) = (ca_capacity (state)))) (PreH4 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  (CircularAreaStateDataLengthResult state (ca_capacity (state)) )
.

Definition CircularAreaGetDataLength_partial_solve_wit_1_pure := 
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
  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
.

Definition CircularAreaGetDataLength_partial_solve_wit_1_aux := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
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
  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ” 
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

Definition CircularAreaGetDataLength_partial_solve_wit_1 := CircularAreaGetDataLength_partial_solve_wit_1_pure -> CircularAreaGetDataLength_partial_solve_wit_1_aux.

(*----- Function CircularAreaDivideWrData -----*)

Definition CircularAreaDivideWrData_safety_wit_1 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (0 <= data_length_pre)) (PreH4 : (data_length_pre <= ((ca_capacity (state)) - (Zlength ((ca_contents (state)))) ))) (PreH5 : ((writeidx + data_length_pre ) <= UINT_MAX)) (PreH6 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
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

Definition CircularAreaDivideWrData_safety_wit_2 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (0 <= data_length_pre)) (PreH5 : (data_length_pre <= ((ca_capacity (state)) - (Zlength ((ca_contents (state)))) ))) (PreH6 : ((writeidx + data_length_pre ) <= UINT_MAX)) (PreH7 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
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

Definition CircularAreaDivideWrData_safety_wit_3 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (0 <= data_length_pre)) (PreH5 : (data_length_pre <= ((ca_capacity (state)) - (Zlength ((ca_contents (state)))) ))) (PreH6 : ((writeidx + data_length_pre ) <= UINT_MAX)) (PreH7 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
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

Definition CircularAreaDivideWrData_safety_wit_4 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (writeidx) (32)) + data_length_pre )) (32)) <= (ca_capacity (state)))) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (0 <= data_length_pre)) (PreH6 : (data_length_pre <= ((ca_capacity (state)) - (Zlength ((ca_contents (state)))) ))) (PreH7 : ((writeidx + data_length_pre ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
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

Definition CircularAreaDivideWrData_safety_wit_5 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (writeidx) (32)) + data_length_pre )) (32)) > (ca_capacity (state)))) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (0 <= data_length_pre)) (PreH6 : (data_length_pre <= ((ca_capacity (state)) - (Zlength ((ca_contents (state)))) ))) (PreH7 : ((writeidx + data_length_pre ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
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

Definition CircularAreaDivideWrData_entail_wit_1 := 
(
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer_2: Z) (operations_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer_2 <> 0)) (PreH3 : (0 <= data_length_pre)) (PreH4 : (data_length_pre <= ((ca_capacity (state)) - (Zlength ((ca_contents (state)))) ))) (PreH5 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
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
  EX (operations: Z)  (readidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (writeidx: Z)  (data_buffer: Z) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= ((ca_capacity (state)) - (Zlength ((ca_contents (state)))) )) ” 
  &&  “ ((writeidx + data_length_pre ) <= UINT_MAX) ” 
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
forall (data_length_pre: Z) (circular_area_pre: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer_2 <> 0)) (PreH3 : (0 <= data_length_pre)) (PreH4 : (data_length_pre <= ((ca_capacity (state)) - (Zlength ((ca_contents (state)))) ))) (PreH5 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  TT && emp 
|--
  “ ((writeidx_2 + data_length_pre ) <= UINT_MAX) ”
  &&  emp
).

Definition CircularAreaDivideWrData_entail_wit_1_split_goal_1 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer_2 <> 0)) (PreH3 : (0 <= data_length_pre)) (PreH4 : (data_length_pre <= ((ca_capacity (state)) - (Zlength ((ca_contents (state)))) ))) (PreH5 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  ((writeidx_2 + data_length_pre ) <= UINT_MAX)
.

Definition CircularAreaDivideWrData_return_wit_1 := 
(
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer_2: Z) (operations_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (writeidx_2) (32)) + data_length_pre )) (32)) > (ca_capacity (state)))) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (data_buffer_2 <> 0)) (PreH5 : (0 <= data_length_pre)) (PreH6 : (data_length_pre <= ((ca_capacity (state)) - (Zlength ((ca_contents (state)))) ))) (PreH7 : ((writeidx_2 + data_length_pre ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
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
  EX (operations: Z)  (readidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (writeidx: Z)  (data_buffer: Z) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaStateDivideWrDataResult state data_length_pre 1 ) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx data_length_pre (ca_capacity (state)) 1 ) ” 
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
forall (data_length_pre: Z) (circular_area_pre: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (writeidx_2) (32)) + data_length_pre )) (32)) > (ca_capacity (state)))) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (data_buffer_2 <> 0)) (PreH5 : (0 <= data_length_pre)) (PreH6 : (data_length_pre <= ((ca_capacity (state)) - (Zlength ((ca_contents (state)))) ))) (PreH7 : ((writeidx_2 + data_length_pre ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  TT && emp 
|--
  “ (CircularAreaDivideWrDataResult writeidx_2 data_length_pre (ca_capacity (state)) 1 ) ” 
  &&  “ (CircularAreaStateDivideWrDataResult state data_length_pre 1 ) ”
  &&  emp
).

Definition CircularAreaDivideWrData_return_wit_1_split_goal_1 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (writeidx_2) (32)) + data_length_pre )) (32)) > (ca_capacity (state)))) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (data_buffer_2 <> 0)) (PreH5 : (0 <= data_length_pre)) (PreH6 : (data_length_pre <= ((ca_capacity (state)) - (Zlength ((ca_contents (state)))) ))) (PreH7 : ((writeidx_2 + data_length_pre ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  (CircularAreaDivideWrDataResult writeidx_2 data_length_pre (ca_capacity (state)) 1 )
.

Definition CircularAreaDivideWrData_return_wit_1_split_goal_2 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (writeidx_2) (32)) + data_length_pre )) (32)) > (ca_capacity (state)))) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (data_buffer_2 <> 0)) (PreH5 : (0 <= data_length_pre)) (PreH6 : (data_length_pre <= ((ca_capacity (state)) - (Zlength ((ca_contents (state)))) ))) (PreH7 : ((writeidx_2 + data_length_pre ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  (CircularAreaStateDivideWrDataResult state data_length_pre 1 )
.

Definition CircularAreaDivideWrData_return_wit_2 := 
(
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer_2: Z) (operations_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (writeidx_2) (32)) + data_length_pre )) (32)) <= (ca_capacity (state)))) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (data_buffer_2 <> 0)) (PreH5 : (0 <= data_length_pre)) (PreH6 : (data_length_pre <= ((ca_capacity (state)) - (Zlength ((ca_contents (state)))) ))) (PreH7 : ((writeidx_2 + data_length_pre ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
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
  EX (operations: Z)  (readidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (writeidx: Z)  (data_buffer: Z) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaStateDivideWrDataResult state data_length_pre 0 ) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx data_length_pre (ca_capacity (state)) 0 ) ” 
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
forall (data_length_pre: Z) (circular_area_pre: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (writeidx_2) (32)) + data_length_pre )) (32)) <= (ca_capacity (state)))) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (data_buffer_2 <> 0)) (PreH5 : (0 <= data_length_pre)) (PreH6 : (data_length_pre <= ((ca_capacity (state)) - (Zlength ((ca_contents (state)))) ))) (PreH7 : ((writeidx_2 + data_length_pre ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  TT && emp 
|--
  “ (CircularAreaDivideWrDataResult writeidx_2 data_length_pre (ca_capacity (state)) 0 ) ” 
  &&  “ (CircularAreaStateDivideWrDataResult state data_length_pre 0 ) ”
  &&  emp
).

Definition CircularAreaDivideWrData_return_wit_2_split_goal_1 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (writeidx_2) (32)) + data_length_pre )) (32)) <= (ca_capacity (state)))) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (data_buffer_2 <> 0)) (PreH5 : (0 <= data_length_pre)) (PreH6 : (data_length_pre <= ((ca_capacity (state)) - (Zlength ((ca_contents (state)))) ))) (PreH7 : ((writeidx_2 + data_length_pre ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  (CircularAreaDivideWrDataResult writeidx_2 data_length_pre (ca_capacity (state)) 0 )
.

Definition CircularAreaDivideWrData_return_wit_2_split_goal_2 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (writeidx_2) (32)) + data_length_pre )) (32)) <= (ca_capacity (state)))) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (data_buffer_2 <> 0)) (PreH5 : (0 <= data_length_pre)) (PreH6 : (data_length_pre <= ((ca_capacity (state)) - (Zlength ((ca_contents (state)))) ))) (PreH7 : ((writeidx_2 + data_length_pre ) <= UINT_MAX)) (PreH8 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  (CircularAreaStateDivideWrDataResult state data_length_pre 0 )
.

(*----- Function CircularAreaWrite -----*)

Definition CircularAreaWrite_safety_wit_1 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (b_force_pre = 0)) (PreH2 : (0 <= data_length_pre)) (PreH3 : (data_length_pre <= UINT_MAX)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (input_buffer_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_2 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (b_force_pre = 0)) (PreH2 : (0 <= data_length_pre)) (PreH3 : (data_length_pre <= UINT_MAX)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (input_buffer_pre <> 0)) (PreH6 : ((Zlength (input_contents)) = data_length_pre)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
  **  (UCharArray.full input_buffer_pre data_length_pre input_contents )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_3 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (PreH1 : (b_force_pre = 0)) (PreH2 : (0 <= data_length_pre)) (PreH3 : (data_length_pre <= UINT_MAX)) (PreH4 : (circular_area_pre = 0)) (PreH5 : (input_buffer_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_4 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (PreH1 : (b_force_pre = 0)) (PreH2 : (0 <= data_length_pre)) (PreH3 : (data_length_pre <= UINT_MAX)) (PreH4 : (circular_area_pre = 0)) (PreH5 : (input_buffer_pre <> 0)) (PreH6 : ((Zlength (input_contents)) = data_length_pre)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre data_length_pre input_contents )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_5 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (circular_area_pre = 0)) (PreH2 : (b_force_pre = 0)) (PreH3 : (0 <= data_length_pre)) (PreH4 : (data_length_pre <= UINT_MAX)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (input_buffer_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
|--
  “ False ”
.

Definition CircularAreaWrite_safety_wit_6 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (circular_area_pre = 0)) (PreH2 : (b_force_pre = 0)) (PreH3 : (0 <= data_length_pre)) (PreH4 : (data_length_pre <= UINT_MAX)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (input_buffer_pre <> 0)) (PreH7 : ((Zlength (input_contents)) = data_length_pre)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
  **  (UCharArray.full input_buffer_pre data_length_pre input_contents )
|--
  “ False ”
.

Definition CircularAreaWrite_safety_wit_7 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (b_force_pre = 0)) (PreH3 : (0 <= data_length_pre)) (PreH4 : (data_length_pre <= UINT_MAX)) (PreH5 : (circular_area_pre = 0)) (PreH6 : (input_buffer_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
|--
  “ False ”
.

Definition CircularAreaWrite_safety_wit_8 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (b_force_pre = 0)) (PreH3 : (0 <= data_length_pre)) (PreH4 : (data_length_pre <= UINT_MAX)) (PreH5 : (circular_area_pre = 0)) (PreH6 : (input_buffer_pre <> 0)) (PreH7 : ((Zlength (input_contents)) = data_length_pre)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre data_length_pre input_contents )
|--
  “ False ”
.

Definition CircularAreaWrite_safety_wit_9 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (PreH1 : (circular_area_pre = 0)) (PreH2 : (b_force_pre = 0)) (PreH3 : (0 <= data_length_pre)) (PreH4 : (data_length_pre <= UINT_MAX)) (PreH5 : (circular_area_pre = 0)) (PreH6 : (input_buffer_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaWrite_safety_wit_10 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (PreH1 : (circular_area_pre = 0)) (PreH2 : (b_force_pre = 0)) (PreH3 : (0 <= data_length_pre)) (PreH4 : (data_length_pre <= UINT_MAX)) (PreH5 : (circular_area_pre = 0)) (PreH6 : (input_buffer_pre <> 0)) (PreH7 : ((Zlength (input_contents)) = data_length_pre)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre data_length_pre input_contents )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaWrite_safety_wit_11 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (b_force_pre = 0)) (PreH3 : (0 <= data_length_pre)) (PreH4 : (data_length_pre <= UINT_MAX)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (input_buffer_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_12 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (b_force_pre = 0)) (PreH3 : (0 <= data_length_pre)) (PreH4 : (data_length_pre <= UINT_MAX)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (input_buffer_pre <> 0)) (PreH7 : ((Zlength (input_contents)) = data_length_pre)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
  **  (UCharArray.full input_buffer_pre data_length_pre input_contents )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_13 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (b_force_pre = 0)) (PreH3 : (0 <= data_length_pre)) (PreH4 : (data_length_pre <= UINT_MAX)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (input_buffer_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_14 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (b_force_pre = 0)) (PreH3 : (0 <= data_length_pre)) (PreH4 : (data_length_pre <= UINT_MAX)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (input_buffer_pre <> 0)) (PreH7 : ((Zlength (input_contents)) = data_length_pre)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
  **  (UCharArray.full input_buffer_pre data_length_pre input_contents )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_15 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (input_buffer_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (b_force_pre = 0)) (PreH4 : (0 <= data_length_pre)) (PreH5 : (data_length_pre <= UINT_MAX)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (input_buffer_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
|--
  “ False ”
.

Definition CircularAreaWrite_safety_wit_16 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (input_buffer_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (b_force_pre = 0)) (PreH4 : (0 <= data_length_pre)) (PreH5 : (data_length_pre <= UINT_MAX)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (input_buffer_pre <> 0)) (PreH8 : ((Zlength (input_contents)) = data_length_pre)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
  **  (UCharArray.full input_buffer_pre data_length_pre input_contents )
|--
  “ False ”
.

Definition CircularAreaWrite_safety_wit_17 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (input_buffer_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (b_force_pre = 0)) (PreH4 : (0 <= data_length_pre)) (PreH5 : (data_length_pre <= UINT_MAX)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (input_buffer_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaWrite_safety_wit_18 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (input_buffer_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (b_force_pre = 0)) (PreH4 : (0 <= data_length_pre)) (PreH5 : (data_length_pre <= UINT_MAX)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (input_buffer_pre <> 0)) (PreH8 : ((Zlength (input_contents)) = data_length_pre)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
  **  (UCharArray.full input_buffer_pre data_length_pre input_contents )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_19 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (0 <= data_length_pre)) (PreH2 : (data_length_pre <= UINT_MAX)) (PreH3 : (b_force_pre <= INT_MAX)) (PreH4 : (b_force_pre >= INT_MIN)) (PreH5 : (input_buffer_pre <> 0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (b_force_pre = 0)) (PreH8 : (0 <= data_length_pre)) (PreH9 : (data_length_pre <= UINT_MAX)) (PreH10 : (circular_area_pre <> 0)) (PreH11 : (input_buffer_pre <> 0)) (PreH12 : ((Zlength (input_contents)) = data_length_pre)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
  **  (UCharArray.full input_buffer_pre data_length_pre input_contents )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_20 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (data_length_pre <= 0)) (PreH2 : (0 <= data_length_pre)) (PreH3 : (data_length_pre <= UINT_MAX)) (PreH4 : (b_force_pre <= INT_MAX)) (PreH5 : (b_force_pre >= INT_MIN)) (PreH6 : (input_buffer_pre <> 0)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (b_force_pre = 0)) (PreH9 : (0 <= data_length_pre)) (PreH10 : (data_length_pre <= UINT_MAX)) (PreH11 : (circular_area_pre <> 0)) (PreH12 : (input_buffer_pre <> 0)) (PreH13 : ((Zlength (input_contents)) = data_length_pre)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
  **  (UCharArray.full input_buffer_pre data_length_pre input_contents )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaWrite_safety_wit_21 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (data_length_pre > 0)) (PreH2 : (0 <= data_length_pre)) (PreH3 : (data_length_pre <= UINT_MAX)) (PreH4 : (b_force_pre <= INT_MAX)) (PreH5 : (b_force_pre >= INT_MIN)) (PreH6 : (input_buffer_pre <> 0)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (b_force_pre = 0)) (PreH9 : (0 <= data_length_pre)) (PreH10 : (data_length_pre <= UINT_MAX)) (PreH11 : (circular_area_pre <> 0)) (PreH12 : (input_buffer_pre <> 0)) (PreH13 : ((Zlength (input_contents)) = data_length_pre)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
  **  (UCharArray.full input_buffer_pre data_length_pre input_contents )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_22 := 
forall (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (b_force: Z) (operations: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (data_buffer_2: Z) (retval: Z) (PreH1 : (b_force <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (data_buffer_2 <> 0)) (PreH5 : (CircularAreaStateFullResult state retval )) (PreH6 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (input_buffer_pre <> 0)) (PreH9 : ((Zlength (input_contents)) > 0)) (PreH10 : (data_length_pre = (Zlength (input_contents)))) (PreH11 : (b_force = 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer_2 (ca_capacity (state)) physical_2 )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_2 + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force)
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
|--
  “ False ”
.

Definition CircularAreaWrite_safety_wit_23 := 
forall (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (b_force: Z) (operations: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (data_buffer_2: Z) (retval: Z) (PreH1 : (b_force = 0)) (PreH2 : (retval <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (data_buffer_2 <> 0)) (PreH5 : (CircularAreaStateFullResult state retval )) (PreH6 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (input_buffer_pre <> 0)) (PreH9 : ((Zlength (input_contents)) > 0)) (PreH10 : (data_length_pre = (Zlength (input_contents)))) (PreH11 : (b_force = 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer_2 (ca_capacity (state)) physical_2 )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_2 + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force)
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaWrite_safety_wit_24 := 
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (b_force: Z) (data_length: Z) (write_data_length_addr_v: Z) (retval: Z) (PreH1 : (retval = (data_buffer + (writeidx * sizeof(UCHAR))))) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (input_buffer_pre <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : ((Zlength (input_contents)) > 0)) (PreH6 : (b_force = 0)) (PreH7 : (CircularAreaStateFullResult state 0 )) (PreH8 : (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length )) (PreH9 : (0 < data_length)) (PreH10 : (data_length <= (Zlength (input_contents)))) (PreH11 : (0 <= writeidx)) (PreH12 : ((writeidx + data_length ) <= (ca_capacity (state)))) (PreH13 : (CircularAreaStateDivideWrDataResult state data_length 0 )) (PreH14 : (CircularAreaDivideWrDataResult writeidx data_length (ca_capacity (state)) 0 )) (PreH15 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (UCharArray.mixed_seg data_buffer writeidx (writeidx + data_length ) (CircularAreaSomeBytes ((sublist (0) (data_length) (input_contents)))) )
  **  (UCharArray.seg input_buffer_pre 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (writeidx + data_length ) (ca_capacity (state)) (sublist ((writeidx + data_length )) ((ca_capacity (state))) (physical)) )
  **  (UCharArray.seg input_buffer_pre data_length (Zlength (input_contents)) (sublist (data_length) ((Zlength (input_contents))) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((ca_capacity (state)) <> 0) ”
.

Definition CircularAreaWrite_safety_wit_25 := 
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (b_force: Z) (data_length: Z) (write_len_down: Z) (write_len_up: Z) (write_data_length_addr_v: Z) (retval: Z) (PreH1 : (retval = data_buffer)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (input_buffer_pre <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : ((Zlength (input_contents)) > 0)) (PreH6 : (b_force = 0)) (PreH7 : (CircularAreaStateFullResult state 0 )) (PreH8 : (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length )) (PreH9 : (0 <= write_len_down)) (PreH10 : (write_len_down <= writeidx)) (PreH11 : (write_len_up = ((ca_capacity (state)) - writeidx ))) (PreH12 : (write_len_down = (data_length - write_len_up ))) (PreH13 : (CircularAreaStateDivideWrDataResult state data_length 1 )) (PreH14 : (CircularAreaDivideWrDataResult writeidx data_length (ca_capacity (state)) 1 )) (PreH15 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (UCharArray.mixed_seg data_buffer 0 write_len_down (CircularAreaSomeBytes ((sublist (write_len_up) (data_length) (input_contents)))) )
  **  (UCharArray.seg input_buffer_pre write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (UCharArray.mixed_seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx (ca_capacity (state)) (CircularAreaSomeBytes ((sublist (0) (write_len_up) (input_contents)))) )
  **  (UCharArray.seg input_buffer_pre 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_pre data_length (Zlength (input_contents)) (sublist (data_length) ((Zlength (input_contents))) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> (unsigned_last_nbits (write_len_down) (8)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaWrite_safety_wit_26 := 
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (b_force: Z) (data_length: Z) (write_data_length_addr_v: Z) (retval: Z) (PreH1 : (retval = (data_buffer + (writeidx * sizeof(UCHAR))))) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (input_buffer_pre <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : ((Zlength (input_contents)) > 0)) (PreH6 : (b_force = 0)) (PreH7 : (CircularAreaStateFullResult state 0 )) (PreH8 : (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length )) (PreH9 : (0 < data_length)) (PreH10 : (data_length <= (Zlength (input_contents)))) (PreH11 : (0 <= writeidx)) (PreH12 : ((writeidx + data_length ) <= (ca_capacity (state)))) (PreH13 : (CircularAreaStateDivideWrDataResult state data_length 0 )) (PreH14 : (CircularAreaDivideWrDataResult writeidx data_length (ca_capacity (state)) 0 )) (PreH15 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (UCharArray.mixed_seg data_buffer writeidx (writeidx + data_length ) (CircularAreaSomeBytes ((sublist (0) (data_length) (input_contents)))) )
  **  (UCharArray.seg input_buffer_pre 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (writeidx + data_length ) (ca_capacity (state)) (sublist ((writeidx + data_length )) ((ca_capacity (state))) (physical)) )
  **  (UCharArray.seg input_buffer_pre data_length (Zlength (input_contents)) (sublist (data_length) ((Zlength (input_contents))) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> (unsigned_last_nbits (((writeidx + data_length ) % ( (ca_capacity (state)) ) )) (8)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaWrite_safety_wit_27 := 
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (b_force: Z) (data_length: Z) (write_len_down: Z) (write_len_up: Z) (write_data_length_addr_v: Z) (retval: Z) (PreH1 : (retval = data_buffer)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (input_buffer_pre <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : ((Zlength (input_contents)) > 0)) (PreH6 : (b_force = 0)) (PreH7 : (CircularAreaStateFullResult state 0 )) (PreH8 : (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length )) (PreH9 : (0 <= write_len_down)) (PreH10 : (write_len_down <= writeidx)) (PreH11 : (write_len_up = ((ca_capacity (state)) - writeidx ))) (PreH12 : (write_len_down = (data_length - write_len_up ))) (PreH13 : (CircularAreaStateDivideWrDataResult state data_length 1 )) (PreH14 : (CircularAreaDivideWrDataResult writeidx data_length (ca_capacity (state)) 1 )) (PreH15 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) (PreH16 : (b_force <> 0)) ,
  (UCharArray.mixed_seg data_buffer 0 write_len_down (CircularAreaSomeBytes ((sublist (write_len_up) (data_length) (input_contents)))) )
  **  (UCharArray.seg input_buffer_pre write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (UCharArray.mixed_seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx (ca_capacity (state)) (CircularAreaSomeBytes ((sublist (0) (write_len_up) (input_contents)))) )
  **  (UCharArray.seg input_buffer_pre 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_pre data_length (Zlength (input_contents)) (sublist (data_length) ((Zlength (input_contents))) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> (unsigned_last_nbits (write_len_down) (8)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 1)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ False ”
.

Definition CircularAreaWrite_safety_wit_28 := 
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (b_force: Z) (data_length: Z) (write_data_length_addr_v: Z) (retval: Z) (PreH1 : (retval = (data_buffer + (writeidx * sizeof(UCHAR))))) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (input_buffer_pre <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : ((Zlength (input_contents)) > 0)) (PreH6 : (b_force = 0)) (PreH7 : (CircularAreaStateFullResult state 0 )) (PreH8 : (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length )) (PreH9 : (0 < data_length)) (PreH10 : (data_length <= (Zlength (input_contents)))) (PreH11 : (0 <= writeidx)) (PreH12 : ((writeidx + data_length ) <= (ca_capacity (state)))) (PreH13 : (CircularAreaStateDivideWrDataResult state data_length 0 )) (PreH14 : (CircularAreaDivideWrDataResult writeidx data_length (ca_capacity (state)) 0 )) (PreH15 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) (PreH16 : (b_force <> 0)) ,
  (UCharArray.mixed_seg data_buffer writeidx (writeidx + data_length ) (CircularAreaSomeBytes ((sublist (0) (data_length) (input_contents)))) )
  **  (UCharArray.seg input_buffer_pre 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (writeidx + data_length ) (ca_capacity (state)) (sublist ((writeidx + data_length )) ((ca_capacity (state))) (physical)) )
  **  (UCharArray.seg input_buffer_pre data_length (Zlength (input_contents)) (sublist (data_length) ((Zlength (input_contents))) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> (unsigned_last_nbits (((writeidx + data_length ) % ( (ca_capacity (state)) ) )) (8)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 1)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ False ”
.

Definition CircularAreaWrite_safety_wit_29 := 
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (b_force: Z) (data_length: Z) (write_len_down: Z) (write_len_up: Z) (write_data_length_addr_v: Z) (retval: Z) (PreH1 : (retval = data_buffer)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (input_buffer_pre <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : ((Zlength (input_contents)) > 0)) (PreH6 : (b_force = 0)) (PreH7 : (CircularAreaStateFullResult state 0 )) (PreH8 : (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length )) (PreH9 : (0 <= write_len_down)) (PreH10 : (write_len_down <= writeidx)) (PreH11 : (write_len_up = ((ca_capacity (state)) - writeidx ))) (PreH12 : (write_len_down = (data_length - write_len_up ))) (PreH13 : (CircularAreaStateDivideWrDataResult state data_length 1 )) (PreH14 : (CircularAreaDivideWrDataResult writeidx data_length (ca_capacity (state)) 1 )) (PreH15 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) (PreH16 : (b_force = 0)) ,
  (UCharArray.mixed_seg data_buffer 0 write_len_down (CircularAreaSomeBytes ((sublist (write_len_up) (data_length) (input_contents)))) )
  **  (UCharArray.seg input_buffer_pre write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (UCharArray.mixed_seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx (ca_capacity (state)) (CircularAreaSomeBytes ((sublist (0) (write_len_up) (input_contents)))) )
  **  (UCharArray.seg input_buffer_pre 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_pre data_length (Zlength (input_contents)) (sublist (data_length) ((Zlength (input_contents))) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> (unsigned_last_nbits (write_len_down) (8)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 1)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_30 := 
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (b_force: Z) (data_length: Z) (write_data_length_addr_v: Z) (retval: Z) (PreH1 : (retval = (data_buffer + (writeidx * sizeof(UCHAR))))) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (input_buffer_pre <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : ((Zlength (input_contents)) > 0)) (PreH6 : (b_force = 0)) (PreH7 : (CircularAreaStateFullResult state 0 )) (PreH8 : (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length )) (PreH9 : (0 < data_length)) (PreH10 : (data_length <= (Zlength (input_contents)))) (PreH11 : (0 <= writeidx)) (PreH12 : ((writeidx + data_length ) <= (ca_capacity (state)))) (PreH13 : (CircularAreaStateDivideWrDataResult state data_length 0 )) (PreH14 : (CircularAreaDivideWrDataResult writeidx data_length (ca_capacity (state)) 0 )) (PreH15 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) (PreH16 : (b_force = 0)) ,
  (UCharArray.mixed_seg data_buffer writeidx (writeidx + data_length ) (CircularAreaSomeBytes ((sublist (0) (data_length) (input_contents)))) )
  **  (UCharArray.seg input_buffer_pre 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (writeidx + data_length ) (ca_capacity (state)) (sublist ((writeidx + data_length )) ((ca_capacity (state))) (physical)) )
  **  (UCharArray.seg input_buffer_pre data_length (Zlength (input_contents)) (sublist (data_length) ((Zlength (input_contents))) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> (unsigned_last_nbits (((writeidx + data_length ) % ( (ca_capacity (state)) ) )) (8)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 1)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_entail_wit_1 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) ,
  (CircularAreaWriteInput state LitMap input_contents circular_area_pre input_buffer_pre data_length_pre b_force_pre )
|--
  (“ (b_force_pre = 0) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= UINT_MAX) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre = 0) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre ))
  ||
  (“ (b_force_pre = 0) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= UINT_MAX) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ ((Zlength (input_contents)) = data_length_pre) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
  **  (UCharArray.full input_buffer_pre data_length_pre input_contents ))
  ||
  (“ (b_force_pre = 0) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= UINT_MAX) ” 
  &&  “ (circular_area_pre = 0) ” 
  &&  “ (input_buffer_pre = 0) ”
  &&  (GlobalStrings LitMap ))
  ||
  (“ (b_force_pre = 0) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= UINT_MAX) ” 
  &&  “ (circular_area_pre = 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ ((Zlength (input_contents)) = data_length_pre) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre data_length_pre input_contents ))
.

Definition CircularAreaWrite_entail_wit_2 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (input_buffer_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (b_force_pre = 0)) (PreH4 : (0 <= data_length_pre)) (PreH5 : (data_length_pre <= UINT_MAX)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (input_buffer_pre <> 0)) (PreH8 : ((Zlength (input_contents)) = data_length_pre)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
  **  (UCharArray.full input_buffer_pre data_length_pre input_contents )
|--
  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= UINT_MAX) ” 
  &&  “ (b_force_pre <= INT_MAX) ” 
  &&  “ (b_force_pre >= INT_MIN) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (b_force_pre = 0) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= UINT_MAX) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ ((Zlength (input_contents)) = data_length_pre) ”
  &&  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
  **  (UCharArray.full input_buffer_pre data_length_pre input_contents )
.

Definition CircularAreaWrite_entail_wit_3 := 
(
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (data_length_pre > 0)) (PreH2 : (0 <= data_length_pre)) (PreH3 : (data_length_pre <= UINT_MAX)) (PreH4 : (b_force_pre <= INT_MAX)) (PreH5 : (b_force_pre >= INT_MIN)) (PreH6 : (input_buffer_pre <> 0)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (b_force_pre = 0)) (PreH9 : (0 <= data_length_pre)) (PreH10 : (data_length_pre <= UINT_MAX)) (PreH11 : (circular_area_pre <> 0)) (PreH12 : (input_buffer_pre <> 0)) (PreH13 : ((Zlength (input_contents)) = data_length_pre)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
  **  (UCharArray.full input_buffer_pre data_length_pre input_contents )
|--
  EX (operations: Z)  (readidx: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (data_buffer: Z) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ ((Zlength (input_contents)) > 0) ” 
  &&  “ (data_length_pre = (Zlength (input_contents))) ” 
  &&  “ (b_force_pre = 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
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
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (data_length_pre > 0)) (PreH2 : (0 <= data_length_pre)) (PreH3 : (data_length_pre <= UINT_MAX)) (PreH4 : (b_force_pre <= INT_MAX)) (PreH5 : (b_force_pre >= INT_MIN)) (PreH6 : (input_buffer_pre <> 0)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (b_force_pre = 0)) (PreH9 : (0 <= data_length_pre)) (PreH10 : (data_length_pre <= UINT_MAX)) (PreH11 : (circular_area_pre <> 0)) (PreH12 : (input_buffer_pre <> 0)) (PreH13 : ((Zlength (input_contents)) = data_length_pre)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
  **  (UCharArray.full input_buffer_pre data_length_pre input_contents )
|--
  EX (operations: Z)  (readidx: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (data_buffer: Z) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ ((Zlength (input_contents)) > 0) ” 
  &&  “ (data_length_pre = (Zlength (input_contents))) ” 
  &&  “ (b_force_pre = 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
).

Definition CircularAreaWrite_entail_wit_4 := 
forall (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (b_force: Z) (operations_2: Z) (readidx_3: Z) (writeidx_3: Z) (b_status_3: Z) (physical_3: (@list (@option Z))) (data_buffer_3: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (data_buffer_3 <> 0)) (PreH4 : (CircularAreaStateFullResult state retval )) (PreH5 : (CircularAreaLogicalState readidx_3 writeidx_3 (ca_capacity (state)) b_status_3 (ca_contents (state)) physical_3 )) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (input_buffer_pre <> 0)) (PreH8 : ((Zlength (input_contents)) > 0)) (PreH9 : (data_length_pre = (Zlength (input_contents)))) (PreH10 : (b_force = 0)) (PreH11 : (data_buffer_2 <> 0)) (PreH12 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer_3 (ca_capacity (state)) physical_3 )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_3)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_3)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_3)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_3)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_3 + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_3)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_2)
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
|--
  EX (operations: Z)  (readidx: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (data_buffer: Z) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ ((Zlength (input_contents)) > 0) ” 
  &&  “ (data_length_pre = (Zlength (input_contents))) ” 
  &&  “ (b_force = 0) ” 
  &&  “ (CircularAreaStateFullResult state 0 ) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
.

Definition CircularAreaWrite_entail_wit_5_1 := 
(
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (data_length: Z) (b_force: Z) (readidx_3: Z) (writeidx_3: Z) (b_status_3: Z) (physical_3: (@list (@option Z))) (data_buffer_3: Z) (retval: Z) (operations_2: Z) (readidx_4: Z) (b_status_4: Z) (physical_4: (@list (@option Z))) (writeidx_4: Z) (data_buffer_4: Z) (retval_2: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer_4 <> 0)) (PreH3 : (CircularAreaStateDivideWrDataResult state (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) retval_2 )) (PreH4 : (CircularAreaDivideWrDataResult writeidx_4 (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) (ca_capacity (state)) retval_2 )) (PreH5 : (CircularAreaLogicalState readidx_4 writeidx_4 (ca_capacity (state)) b_status_4 (ca_contents (state)) physical_4 )) (PreH6 : (data_length > (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)))) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (data_buffer_3 <> 0)) (PreH9 : (CircularAreaStateDataLengthResult state retval )) (PreH10 : (CircularAreaLogicalState readidx_3 writeidx_3 (ca_capacity (state)) b_status_3 (ca_contents (state)) physical_3 )) (PreH11 : (circular_area_pre <> 0)) (PreH12 : (input_buffer_pre <> 0)) (PreH13 : ((Zlength (input_contents)) > 0)) (PreH14 : (data_length = (Zlength (input_contents)))) (PreH15 : (b_force = 0)) (PreH16 : (CircularAreaStateFullResult state 0 )) (PreH17 : (data_buffer_2 <> 0)) (PreH18 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH19 : (retval_2 <> 0)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer_4 (ca_capacity (state)) physical_4 )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_4)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_4)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_4)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_4)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_4 + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_4)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_2)
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
|--
  EX (operations: Z)  (readidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (writeidx: Z)  (data_buffer: Z) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ ((Zlength (input_contents)) > 0) ” 
  &&  “ (b_force = 0) ” 
  &&  “ (CircularAreaStateFullResult state 0 ) ” 
  &&  “ (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) ) ” 
  &&  “ (0 < (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32))) ” 
  &&  “ ((unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) <= (Zlength (input_contents))) ” 
  &&  “ (CircularAreaStateDivideWrDataResult state (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) 1 ) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) (ca_capacity (state)) 1 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
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
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (data_length: Z) (b_force: Z) (readidx_3: Z) (writeidx_3: Z) (b_status_3: Z) (physical_3: (@list (@option Z))) (data_buffer_3: Z) (retval: Z) (readidx_4: Z) (b_status_4: Z) (physical_4: (@list (@option Z))) (writeidx_4: Z) (data_buffer_4: Z) (retval_2: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer_4 <> 0)) (PreH3 : (CircularAreaStateDivideWrDataResult state (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) retval_2 )) (PreH4 : (CircularAreaDivideWrDataResult writeidx_4 (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) (ca_capacity (state)) retval_2 )) (PreH5 : (CircularAreaLogicalState readidx_4 writeidx_4 (ca_capacity (state)) b_status_4 (ca_contents (state)) physical_4 )) (PreH6 : (data_length > (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)))) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (data_buffer_3 <> 0)) (PreH9 : (CircularAreaStateDataLengthResult state retval )) (PreH10 : (CircularAreaLogicalState readidx_3 writeidx_3 (ca_capacity (state)) b_status_3 (ca_contents (state)) physical_3 )) (PreH11 : (circular_area_pre <> 0)) (PreH12 : (input_buffer_pre <> 0)) (PreH13 : ((Zlength (input_contents)) > 0)) (PreH14 : (data_length = (Zlength (input_contents)))) (PreH15 : (b_force = 0)) (PreH16 : (CircularAreaStateFullResult state 0 )) (PreH17 : (data_buffer_2 <> 0)) (PreH18 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH19 : (retval_2 <> 0)) ,
  TT && emp 
|--
  “ (CircularAreaDivideWrDataResult writeidx_4 (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) (ca_capacity (state)) 1 ) ” 
  &&  “ (CircularAreaStateDivideWrDataResult state (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) 1 ) ” 
  &&  “ (0 < (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32))) ” 
  &&  “ (CircularAreaActualWriteLength (ca_capacity (state)) data_length (ca_contents (state)) (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) ) ”
  &&  emp
).

Definition CircularAreaWrite_entail_wit_5_1_split_goal_1 := 
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (data_length: Z) (b_force: Z) (readidx_3: Z) (writeidx_3: Z) (b_status_3: Z) (physical_3: (@list (@option Z))) (data_buffer_3: Z) (retval: Z) (readidx_4: Z) (b_status_4: Z) (physical_4: (@list (@option Z))) (writeidx_4: Z) (data_buffer_4: Z) (retval_2: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer_4 <> 0)) (PreH3 : (CircularAreaStateDivideWrDataResult state (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) retval_2 )) (PreH4 : (CircularAreaDivideWrDataResult writeidx_4 (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) (ca_capacity (state)) retval_2 )) (PreH5 : (CircularAreaLogicalState readidx_4 writeidx_4 (ca_capacity (state)) b_status_4 (ca_contents (state)) physical_4 )) (PreH6 : (data_length > (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)))) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (data_buffer_3 <> 0)) (PreH9 : (CircularAreaStateDataLengthResult state retval )) (PreH10 : (CircularAreaLogicalState readidx_3 writeidx_3 (ca_capacity (state)) b_status_3 (ca_contents (state)) physical_3 )) (PreH11 : (circular_area_pre <> 0)) (PreH12 : (input_buffer_pre <> 0)) (PreH13 : ((Zlength (input_contents)) > 0)) (PreH14 : (data_length = (Zlength (input_contents)))) (PreH15 : (b_force = 0)) (PreH16 : (CircularAreaStateFullResult state 0 )) (PreH17 : (data_buffer_2 <> 0)) (PreH18 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH19 : (retval_2 <> 0)) ,
  (CircularAreaDivideWrDataResult writeidx_4 (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) (ca_capacity (state)) 1 )
.

Definition CircularAreaWrite_entail_wit_5_1_split_goal_2 := 
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (data_length: Z) (b_force: Z) (readidx_3: Z) (writeidx_3: Z) (b_status_3: Z) (physical_3: (@list (@option Z))) (data_buffer_3: Z) (retval: Z) (readidx_4: Z) (b_status_4: Z) (physical_4: (@list (@option Z))) (writeidx_4: Z) (data_buffer_4: Z) (retval_2: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer_4 <> 0)) (PreH3 : (CircularAreaStateDivideWrDataResult state (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) retval_2 )) (PreH4 : (CircularAreaDivideWrDataResult writeidx_4 (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) (ca_capacity (state)) retval_2 )) (PreH5 : (CircularAreaLogicalState readidx_4 writeidx_4 (ca_capacity (state)) b_status_4 (ca_contents (state)) physical_4 )) (PreH6 : (data_length > (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)))) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (data_buffer_3 <> 0)) (PreH9 : (CircularAreaStateDataLengthResult state retval )) (PreH10 : (CircularAreaLogicalState readidx_3 writeidx_3 (ca_capacity (state)) b_status_3 (ca_contents (state)) physical_3 )) (PreH11 : (circular_area_pre <> 0)) (PreH12 : (input_buffer_pre <> 0)) (PreH13 : ((Zlength (input_contents)) > 0)) (PreH14 : (data_length = (Zlength (input_contents)))) (PreH15 : (b_force = 0)) (PreH16 : (CircularAreaStateFullResult state 0 )) (PreH17 : (data_buffer_2 <> 0)) (PreH18 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH19 : (retval_2 <> 0)) ,
  (CircularAreaStateDivideWrDataResult state (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) 1 )
.

Definition CircularAreaWrite_entail_wit_5_1_split_goal_3 := 
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (data_length: Z) (b_force: Z) (readidx_3: Z) (writeidx_3: Z) (b_status_3: Z) (physical_3: (@list (@option Z))) (data_buffer_3: Z) (retval: Z) (readidx_4: Z) (b_status_4: Z) (physical_4: (@list (@option Z))) (writeidx_4: Z) (data_buffer_4: Z) (retval_2: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer_4 <> 0)) (PreH3 : (CircularAreaStateDivideWrDataResult state (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) retval_2 )) (PreH4 : (CircularAreaDivideWrDataResult writeidx_4 (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) (ca_capacity (state)) retval_2 )) (PreH5 : (CircularAreaLogicalState readidx_4 writeidx_4 (ca_capacity (state)) b_status_4 (ca_contents (state)) physical_4 )) (PreH6 : (data_length > (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)))) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (data_buffer_3 <> 0)) (PreH9 : (CircularAreaStateDataLengthResult state retval )) (PreH10 : (CircularAreaLogicalState readidx_3 writeidx_3 (ca_capacity (state)) b_status_3 (ca_contents (state)) physical_3 )) (PreH11 : (circular_area_pre <> 0)) (PreH12 : (input_buffer_pre <> 0)) (PreH13 : ((Zlength (input_contents)) > 0)) (PreH14 : (data_length = (Zlength (input_contents)))) (PreH15 : (b_force = 0)) (PreH16 : (CircularAreaStateFullResult state 0 )) (PreH17 : (data_buffer_2 <> 0)) (PreH18 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH19 : (retval_2 <> 0)) ,
  (0 < (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)))
.

Definition CircularAreaWrite_entail_wit_5_1_split_goal_4 := 
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (data_length: Z) (b_force: Z) (readidx_3: Z) (writeidx_3: Z) (b_status_3: Z) (physical_3: (@list (@option Z))) (data_buffer_3: Z) (retval: Z) (readidx_4: Z) (b_status_4: Z) (physical_4: (@list (@option Z))) (writeidx_4: Z) (data_buffer_4: Z) (retval_2: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer_4 <> 0)) (PreH3 : (CircularAreaStateDivideWrDataResult state (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) retval_2 )) (PreH4 : (CircularAreaDivideWrDataResult writeidx_4 (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) (ca_capacity (state)) retval_2 )) (PreH5 : (CircularAreaLogicalState readidx_4 writeidx_4 (ca_capacity (state)) b_status_4 (ca_contents (state)) physical_4 )) (PreH6 : (data_length > (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)))) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (data_buffer_3 <> 0)) (PreH9 : (CircularAreaStateDataLengthResult state retval )) (PreH10 : (CircularAreaLogicalState readidx_3 writeidx_3 (ca_capacity (state)) b_status_3 (ca_contents (state)) physical_3 )) (PreH11 : (circular_area_pre <> 0)) (PreH12 : (input_buffer_pre <> 0)) (PreH13 : ((Zlength (input_contents)) > 0)) (PreH14 : (data_length = (Zlength (input_contents)))) (PreH15 : (b_force = 0)) (PreH16 : (CircularAreaStateFullResult state 0 )) (PreH17 : (data_buffer_2 <> 0)) (PreH18 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH19 : (retval_2 <> 0)) ,
  (CircularAreaActualWriteLength (ca_capacity (state)) data_length (ca_contents (state)) (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) )
.

Definition CircularAreaWrite_entail_wit_5_2 := 
(
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (data_length: Z) (b_force: Z) (readidx_3: Z) (writeidx_3: Z) (b_status_3: Z) (physical_3: (@list (@option Z))) (data_buffer_3: Z) (retval: Z) (operations_2: Z) (readidx_4: Z) (b_status_4: Z) (physical_4: (@list (@option Z))) (writeidx_4: Z) (data_buffer_4: Z) (retval_2: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer_4 <> 0)) (PreH3 : (CircularAreaStateDivideWrDataResult state data_length retval_2 )) (PreH4 : (CircularAreaDivideWrDataResult writeidx_4 data_length (ca_capacity (state)) retval_2 )) (PreH5 : (CircularAreaLogicalState readidx_4 writeidx_4 (ca_capacity (state)) b_status_4 (ca_contents (state)) physical_4 )) (PreH6 : (data_length <= (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)))) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (data_buffer_3 <> 0)) (PreH9 : (CircularAreaStateDataLengthResult state retval )) (PreH10 : (CircularAreaLogicalState readidx_3 writeidx_3 (ca_capacity (state)) b_status_3 (ca_contents (state)) physical_3 )) (PreH11 : (circular_area_pre <> 0)) (PreH12 : (input_buffer_pre <> 0)) (PreH13 : ((Zlength (input_contents)) > 0)) (PreH14 : (data_length = (Zlength (input_contents)))) (PreH15 : (b_force = 0)) (PreH16 : (CircularAreaStateFullResult state 0 )) (PreH17 : (data_buffer_2 <> 0)) (PreH18 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH19 : (retval_2 <> 0)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer_4 (ca_capacity (state)) physical_4 )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_4)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_4)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_4)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_4)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_4 + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_4)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_2)
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
|--
  EX (operations: Z)  (readidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (writeidx: Z)  (data_buffer: Z) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ ((Zlength (input_contents)) > 0) ” 
  &&  “ (b_force = 0) ” 
  &&  “ (CircularAreaStateFullResult state 0 ) ” 
  &&  “ (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length ) ” 
  &&  “ (0 < data_length) ” 
  &&  “ (data_length <= (Zlength (input_contents))) ” 
  &&  “ (CircularAreaStateDivideWrDataResult state data_length 1 ) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx data_length (ca_capacity (state)) 1 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
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
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (data_length: Z) (b_force: Z) (readidx_3: Z) (writeidx_3: Z) (b_status_3: Z) (physical_3: (@list (@option Z))) (data_buffer_3: Z) (retval: Z) (readidx_4: Z) (b_status_4: Z) (physical_4: (@list (@option Z))) (writeidx_4: Z) (data_buffer_4: Z) (retval_2: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer_4 <> 0)) (PreH3 : (CircularAreaStateDivideWrDataResult state data_length retval_2 )) (PreH4 : (CircularAreaDivideWrDataResult writeidx_4 data_length (ca_capacity (state)) retval_2 )) (PreH5 : (CircularAreaLogicalState readidx_4 writeidx_4 (ca_capacity (state)) b_status_4 (ca_contents (state)) physical_4 )) (PreH6 : (data_length <= (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)))) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (data_buffer_3 <> 0)) (PreH9 : (CircularAreaStateDataLengthResult state retval )) (PreH10 : (CircularAreaLogicalState readidx_3 writeidx_3 (ca_capacity (state)) b_status_3 (ca_contents (state)) physical_3 )) (PreH11 : (circular_area_pre <> 0)) (PreH12 : (input_buffer_pre <> 0)) (PreH13 : ((Zlength (input_contents)) > 0)) (PreH14 : (data_length = (Zlength (input_contents)))) (PreH15 : (b_force = 0)) (PreH16 : (CircularAreaStateFullResult state 0 )) (PreH17 : (data_buffer_2 <> 0)) (PreH18 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH19 : (retval_2 <> 0)) ,
  TT && emp 
|--
  “ (CircularAreaDivideWrDataResult writeidx_4 data_length (ca_capacity (state)) 1 ) ” 
  &&  “ (CircularAreaStateDivideWrDataResult state data_length 1 ) ” 
  &&  “ (CircularAreaActualWriteLength (ca_capacity (state)) data_length (ca_contents (state)) data_length ) ”
  &&  emp
).

Definition CircularAreaWrite_entail_wit_5_2_split_goal_1 := 
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (data_length: Z) (b_force: Z) (readidx_3: Z) (writeidx_3: Z) (b_status_3: Z) (physical_3: (@list (@option Z))) (data_buffer_3: Z) (retval: Z) (readidx_4: Z) (b_status_4: Z) (physical_4: (@list (@option Z))) (writeidx_4: Z) (data_buffer_4: Z) (retval_2: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer_4 <> 0)) (PreH3 : (CircularAreaStateDivideWrDataResult state data_length retval_2 )) (PreH4 : (CircularAreaDivideWrDataResult writeidx_4 data_length (ca_capacity (state)) retval_2 )) (PreH5 : (CircularAreaLogicalState readidx_4 writeidx_4 (ca_capacity (state)) b_status_4 (ca_contents (state)) physical_4 )) (PreH6 : (data_length <= (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)))) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (data_buffer_3 <> 0)) (PreH9 : (CircularAreaStateDataLengthResult state retval )) (PreH10 : (CircularAreaLogicalState readidx_3 writeidx_3 (ca_capacity (state)) b_status_3 (ca_contents (state)) physical_3 )) (PreH11 : (circular_area_pre <> 0)) (PreH12 : (input_buffer_pre <> 0)) (PreH13 : ((Zlength (input_contents)) > 0)) (PreH14 : (data_length = (Zlength (input_contents)))) (PreH15 : (b_force = 0)) (PreH16 : (CircularAreaStateFullResult state 0 )) (PreH17 : (data_buffer_2 <> 0)) (PreH18 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH19 : (retval_2 <> 0)) ,
  (CircularAreaDivideWrDataResult writeidx_4 data_length (ca_capacity (state)) 1 )
.

Definition CircularAreaWrite_entail_wit_5_2_split_goal_2 := 
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (data_length: Z) (b_force: Z) (readidx_3: Z) (writeidx_3: Z) (b_status_3: Z) (physical_3: (@list (@option Z))) (data_buffer_3: Z) (retval: Z) (readidx_4: Z) (b_status_4: Z) (physical_4: (@list (@option Z))) (writeidx_4: Z) (data_buffer_4: Z) (retval_2: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer_4 <> 0)) (PreH3 : (CircularAreaStateDivideWrDataResult state data_length retval_2 )) (PreH4 : (CircularAreaDivideWrDataResult writeidx_4 data_length (ca_capacity (state)) retval_2 )) (PreH5 : (CircularAreaLogicalState readidx_4 writeidx_4 (ca_capacity (state)) b_status_4 (ca_contents (state)) physical_4 )) (PreH6 : (data_length <= (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)))) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (data_buffer_3 <> 0)) (PreH9 : (CircularAreaStateDataLengthResult state retval )) (PreH10 : (CircularAreaLogicalState readidx_3 writeidx_3 (ca_capacity (state)) b_status_3 (ca_contents (state)) physical_3 )) (PreH11 : (circular_area_pre <> 0)) (PreH12 : (input_buffer_pre <> 0)) (PreH13 : ((Zlength (input_contents)) > 0)) (PreH14 : (data_length = (Zlength (input_contents)))) (PreH15 : (b_force = 0)) (PreH16 : (CircularAreaStateFullResult state 0 )) (PreH17 : (data_buffer_2 <> 0)) (PreH18 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH19 : (retval_2 <> 0)) ,
  (CircularAreaStateDivideWrDataResult state data_length 1 )
.

Definition CircularAreaWrite_entail_wit_5_2_split_goal_3 := 
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (data_length: Z) (b_force: Z) (readidx_3: Z) (writeidx_3: Z) (b_status_3: Z) (physical_3: (@list (@option Z))) (data_buffer_3: Z) (retval: Z) (readidx_4: Z) (b_status_4: Z) (physical_4: (@list (@option Z))) (writeidx_4: Z) (data_buffer_4: Z) (retval_2: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer_4 <> 0)) (PreH3 : (CircularAreaStateDivideWrDataResult state data_length retval_2 )) (PreH4 : (CircularAreaDivideWrDataResult writeidx_4 data_length (ca_capacity (state)) retval_2 )) (PreH5 : (CircularAreaLogicalState readidx_4 writeidx_4 (ca_capacity (state)) b_status_4 (ca_contents (state)) physical_4 )) (PreH6 : (data_length <= (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)))) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (data_buffer_3 <> 0)) (PreH9 : (CircularAreaStateDataLengthResult state retval )) (PreH10 : (CircularAreaLogicalState readidx_3 writeidx_3 (ca_capacity (state)) b_status_3 (ca_contents (state)) physical_3 )) (PreH11 : (circular_area_pre <> 0)) (PreH12 : (input_buffer_pre <> 0)) (PreH13 : ((Zlength (input_contents)) > 0)) (PreH14 : (data_length = (Zlength (input_contents)))) (PreH15 : (b_force = 0)) (PreH16 : (CircularAreaStateFullResult state 0 )) (PreH17 : (data_buffer_2 <> 0)) (PreH18 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH19 : (retval_2 <> 0)) ,
  (CircularAreaActualWriteLength (ca_capacity (state)) data_length (ca_contents (state)) data_length )
.

Definition CircularAreaWrite_entail_wit_6 := 
(
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer_2: Z) (operations_2: Z) (readidx_2: Z) (writeidx: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (b_force: Z) (data_length: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (input_buffer_pre <> 0)) (PreH3 : (data_buffer_2 <> 0)) (PreH4 : ((Zlength (input_contents)) > 0)) (PreH5 : (b_force = 0)) (PreH6 : (CircularAreaStateFullResult state 0 )) (PreH7 : (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length )) (PreH8 : (0 < data_length)) (PreH9 : (data_length <= (Zlength (input_contents)))) (PreH10 : (CircularAreaStateDivideWrDataResult state data_length 1 )) (PreH11 : (CircularAreaDivideWrDataResult writeidx data_length (ca_capacity (state)) 1 )) (PreH12 : (CircularAreaLogicalState readidx_2 writeidx (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer_2 (ca_capacity (state)) physical_2 )
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_2 + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_2)
|--
  EX (operations: Z)  (readidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (writeidx_2: Z)  (data_buffer: Z) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ ((Zlength (input_contents)) > 0) ” 
  &&  “ (b_force = 0) ” 
  &&  “ (CircularAreaStateFullResult state 0 ) ” 
  &&  “ (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length ) ” 
  &&  “ (0 < data_length) ” 
  &&  “ (data_length <= (Zlength (input_contents))) ” 
  &&  “ (0 <= writeidx_2) ” 
  &&  “ (writeidx_2 < (ca_capacity (state))) ” 
  &&  “ ((unsigned_last_nbits (((ca_capacity (state)) - (unsigned_last_nbits (writeidx) (32)) )) (32)) = ((ca_capacity (state)) - writeidx_2 )) ” 
  &&  “ ((unsigned_last_nbits ((data_length - (unsigned_last_nbits (((ca_capacity (state)) - (unsigned_last_nbits (writeidx) (32)) )) (32)) )) (32)) = (data_length - (unsigned_last_nbits (((ca_capacity (state)) - (unsigned_last_nbits (writeidx) (32)) )) (32)) )) ” 
  &&  “ ((unsigned_last_nbits (((ca_capacity (state)) - (unsigned_last_nbits (writeidx) (32)) )) (32)) <= data_length) ” 
  &&  “ (CircularAreaStateDivideWrDataResult state data_length 1 ) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx_2 data_length (ca_capacity (state)) 1 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx_2 (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  (UCharArray.mixed_seg data_buffer 0 writeidx_2 (sublist (0) (writeidx_2) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx_2 (ca_capacity (state)) (sublist (writeidx_2) ((ca_capacity (state))) (physical)) )
  **  (UCharArray.seg input_buffer_pre 0 (unsigned_last_nbits (((ca_capacity (state)) - (unsigned_last_nbits (writeidx) (32)) )) (32)) (sublist (0) ((unsigned_last_nbits (((ca_capacity (state)) - (unsigned_last_nbits (writeidx) (32)) )) (32))) (input_contents)) )
  **  (UCharArray.seg input_buffer_pre (unsigned_last_nbits (((ca_capacity (state)) - (unsigned_last_nbits (writeidx) (32)) )) (32)) (Zlength (input_contents)) (sublist ((unsigned_last_nbits (((ca_capacity (state)) - (unsigned_last_nbits (writeidx) (32)) )) (32))) ((Zlength (input_contents))) (input_contents)) )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
) \/
(
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (b_force: Z) (data_length: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (input_buffer_pre <> 0)) (PreH3 : (data_buffer_2 <> 0)) (PreH4 : ((Zlength (input_contents)) > 0)) (PreH5 : (b_force = 0)) (PreH6 : (CircularAreaStateFullResult state 0 )) (PreH7 : (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length )) (PreH8 : (0 < data_length)) (PreH9 : (data_length <= (Zlength (input_contents)))) (PreH10 : (CircularAreaStateDivideWrDataResult state data_length 1 )) (PreH11 : (CircularAreaDivideWrDataResult writeidx data_length (ca_capacity (state)) 1 )) (PreH12 : (CircularAreaLogicalState readidx_2 writeidx (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer_2 (ca_capacity (state)) physical_2 )
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
|--
  EX (physical: (@list (@option Z))) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ (data_buffer_2 <> 0) ” 
  &&  “ ((Zlength (input_contents)) > 0) ” 
  &&  “ (b_force = 0) ” 
  &&  “ (CircularAreaStateFullResult state 0 ) ” 
  &&  “ (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length ) ” 
  &&  “ (0 < data_length) ” 
  &&  “ (data_length <= (Zlength (input_contents))) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ (writeidx < (ca_capacity (state))) ” 
  &&  “ ((unsigned_last_nbits (((ca_capacity (state)) - (unsigned_last_nbits (writeidx) (32)) )) (32)) = ((ca_capacity (state)) - writeidx )) ” 
  &&  “ ((unsigned_last_nbits ((data_length - (unsigned_last_nbits (((ca_capacity (state)) - (unsigned_last_nbits (writeidx) (32)) )) (32)) )) (32)) = (data_length - (unsigned_last_nbits (((ca_capacity (state)) - (unsigned_last_nbits (writeidx) (32)) )) (32)) )) ” 
  &&  “ ((unsigned_last_nbits (((ca_capacity (state)) - (unsigned_last_nbits (writeidx) (32)) )) (32)) <= data_length) ” 
  &&  “ (CircularAreaStateDivideWrDataResult state data_length 1 ) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx data_length (ca_capacity (state)) 1 ) ” 
  &&  “ (CircularAreaLogicalState readidx_2 writeidx (ca_capacity (state)) b_status_2 (ca_contents (state)) physical ) ”
  &&  (UCharArray.mixed_seg data_buffer_2 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer_2 writeidx (ca_capacity (state)) (sublist (writeidx) ((ca_capacity (state))) (physical)) )
  **  (UCharArray.seg input_buffer_pre 0 (unsigned_last_nbits (((ca_capacity (state)) - (unsigned_last_nbits (writeidx) (32)) )) (32)) (sublist (0) ((unsigned_last_nbits (((ca_capacity (state)) - (unsigned_last_nbits (writeidx) (32)) )) (32))) (input_contents)) )
  **  (UCharArray.seg input_buffer_pre (unsigned_last_nbits (((ca_capacity (state)) - (unsigned_last_nbits (writeidx) (32)) )) (32)) (Zlength (input_contents)) (sublist ((unsigned_last_nbits (((ca_capacity (state)) - (unsigned_last_nbits (writeidx) (32)) )) (32))) ((Zlength (input_contents))) (input_contents)) )
  **  (GlobalStrings LitMap )
).

Definition CircularAreaWrite_entail_wit_7 := 
(
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer_2: Z) (operations_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (b_force: Z) (data_length: Z) (write_len_up: Z) (write_len_down: Z) (retval: Z) (PreH1 : (retval = (data_buffer_2 + (writeidx_2 * sizeof(UCHAR))))) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (input_buffer_pre <> 0)) (PreH4 : (data_buffer_2 <> 0)) (PreH5 : ((Zlength (input_contents)) > 0)) (PreH6 : (b_force = 0)) (PreH7 : (CircularAreaStateFullResult state 0 )) (PreH8 : (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length )) (PreH9 : (0 < data_length)) (PreH10 : (data_length <= (Zlength (input_contents)))) (PreH11 : (0 <= writeidx_2)) (PreH12 : (writeidx_2 < (ca_capacity (state)))) (PreH13 : (write_len_up = ((ca_capacity (state)) - writeidx_2 ))) (PreH14 : (write_len_down = (data_length - write_len_up ))) (PreH15 : (write_len_up <= data_length)) (PreH16 : (CircularAreaStateDivideWrDataResult state data_length 1 )) (PreH17 : (CircularAreaDivideWrDataResult writeidx_2 data_length (ca_capacity (state)) 1 )) (PreH18 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  (UCharArray.mixed_seg data_buffer_2 writeidx_2 (ca_capacity (state)) (CircularAreaSomeBytes ((sublist (0) (write_len_up) (input_contents)))) )
  **  (UCharArray.seg input_buffer_pre 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.mixed_seg data_buffer_2 0 writeidx_2 (sublist (0) (writeidx_2) (physical_2)) )
  **  (UCharArray.seg input_buffer_pre write_len_up (Zlength (input_contents)) (sublist (write_len_up) ((Zlength (input_contents))) (input_contents)) )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_2 + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_2)
  **  (GlobalStrings LitMap )
|--
  EX (operations: Z)  (readidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (writeidx: Z)  (data_buffer: Z) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ ((Zlength (input_contents)) > 0) ” 
  &&  “ (b_force = 0) ” 
  &&  “ (CircularAreaStateFullResult state 0 ) ” 
  &&  “ (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length ) ” 
  &&  “ (0 <= write_len_down) ” 
  &&  “ (write_len_down <= writeidx) ” 
  &&  “ (write_len_up = ((ca_capacity (state)) - writeidx )) ” 
  &&  “ (write_len_down = (data_length - write_len_up )) ” 
  &&  “ (CircularAreaStateDivideWrDataResult state data_length 1 ) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx data_length (ca_capacity (state)) 1 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  (UCharArray.mixed_seg data_buffer 0 write_len_down (sublist (0) (write_len_down) (physical)) )
  **  (UCharArray.mixed_seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx (ca_capacity (state)) (CircularAreaSomeBytes ((sublist (0) (write_len_up) (input_contents)))) )
  **  (UCharArray.seg input_buffer_pre 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_pre write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_pre data_length (Zlength (input_contents)) (sublist (data_length) ((Zlength (input_contents))) (input_contents)) )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
) \/
(
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (b_force: Z) (data_length: Z) (write_len_up: Z) (write_len_down: Z) (retval: Z) (PreH1 : (retval = (data_buffer_2 + (writeidx_2 * sizeof(UCHAR))))) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (input_buffer_pre <> 0)) (PreH4 : (data_buffer_2 <> 0)) (PreH5 : ((Zlength (input_contents)) > 0)) (PreH6 : (b_force = 0)) (PreH7 : (CircularAreaStateFullResult state 0 )) (PreH8 : (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length )) (PreH9 : (0 < data_length)) (PreH10 : (data_length <= (Zlength (input_contents)))) (PreH11 : (0 <= writeidx_2)) (PreH12 : (writeidx_2 < (ca_capacity (state)))) (PreH13 : (write_len_up = ((ca_capacity (state)) - writeidx_2 ))) (PreH14 : (write_len_down = (data_length - write_len_up ))) (PreH15 : (write_len_up <= data_length)) (PreH16 : (CircularAreaStateDivideWrDataResult state data_length 1 )) (PreH17 : (CircularAreaDivideWrDataResult writeidx_2 data_length (ca_capacity (state)) 1 )) (PreH18 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
  (UCharArray.mixed_seg data_buffer_2 0 writeidx_2 (sublist (0) (writeidx_2) (physical_2)) )
  **  (GlobalStrings LitMap )
|--
  EX (physical: (@list (@option Z))) ,
  “ ((Zlength ((sublist (write_len_up) (data_length) (input_contents)))) = (data_length - write_len_up )) ” 
  &&  “ ((sublist (write_len_up) ((Zlength (input_contents))) (input_contents)) = (app ((sublist (write_len_up) (data_length) (input_contents))) ((sublist (data_length) ((Zlength (input_contents))) (input_contents))))) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ (data_buffer_2 <> 0) ” 
  &&  “ ((Zlength (input_contents)) > 0) ” 
  &&  “ (b_force = 0) ” 
  &&  “ (CircularAreaStateFullResult state 0 ) ” 
  &&  “ (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length ) ” 
  &&  “ (0 <= write_len_down) ” 
  &&  “ (write_len_down <= writeidx_2) ” 
  &&  “ (write_len_up = ((ca_capacity (state)) - writeidx_2 )) ” 
  &&  “ (write_len_down = (data_length - write_len_up )) ” 
  &&  “ (CircularAreaStateDivideWrDataResult state data_length 1 ) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx_2 data_length (ca_capacity (state)) 1 ) ” 
  &&  “ (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical ) ”
  &&  (UCharArray.mixed_seg data_buffer_2 0 write_len_down (sublist (0) (write_len_down) (physical)) )
  **  (UCharArray.mixed_seg data_buffer_2 write_len_down writeidx_2 (sublist (write_len_down) (writeidx_2) (physical)) )
  **  (GlobalStrings LitMap )
).

Definition CircularAreaWrite_entail_wit_8_1 := 
(
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (data_length: Z) (b_force: Z) (readidx_3: Z) (writeidx_3: Z) (b_status_3: Z) (physical_3: (@list (@option Z))) (data_buffer_3: Z) (retval: Z) (operations_2: Z) (readidx_4: Z) (b_status_4: Z) (physical_4: (@list (@option Z))) (writeidx_4: Z) (data_buffer_4: Z) (retval_2: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer_4 <> 0)) (PreH3 : (CircularAreaStateDivideWrDataResult state (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) retval_2 )) (PreH4 : (CircularAreaDivideWrDataResult writeidx_4 (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) (ca_capacity (state)) retval_2 )) (PreH5 : (CircularAreaLogicalState readidx_4 writeidx_4 (ca_capacity (state)) b_status_4 (ca_contents (state)) physical_4 )) (PreH6 : (data_length > (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)))) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (data_buffer_3 <> 0)) (PreH9 : (CircularAreaStateDataLengthResult state retval )) (PreH10 : (CircularAreaLogicalState readidx_3 writeidx_3 (ca_capacity (state)) b_status_3 (ca_contents (state)) physical_3 )) (PreH11 : (circular_area_pre <> 0)) (PreH12 : (input_buffer_pre <> 0)) (PreH13 : ((Zlength (input_contents)) > 0)) (PreH14 : (data_length = (Zlength (input_contents)))) (PreH15 : (b_force = 0)) (PreH16 : (CircularAreaStateFullResult state 0 )) (PreH17 : (data_buffer_2 <> 0)) (PreH18 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH19 : (retval_2 = 0)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer_4 (ca_capacity (state)) physical_4 )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_4)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_4)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_4)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_4)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_4 + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_4)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_2)
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
|--
  EX (operations: Z)  (readidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (writeidx: Z)  (data_buffer: Z) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ ((Zlength (input_contents)) > 0) ” 
  &&  “ (b_force = 0) ” 
  &&  “ (CircularAreaStateFullResult state 0 ) ” 
  &&  “ (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) ) ” 
  &&  “ (0 < (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32))) ” 
  &&  “ ((unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) <= (Zlength (input_contents))) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ ((writeidx + (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) ) <= (ca_capacity (state))) ” 
  &&  “ (CircularAreaStateDivideWrDataResult state (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) 0 ) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) (ca_capacity (state)) 0 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx (writeidx + (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) ) (sublist (writeidx) ((writeidx + (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) )) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (writeidx + (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) ) (ca_capacity (state)) (sublist ((writeidx + (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) )) ((ca_capacity (state))) (physical)) )
  **  (UCharArray.seg input_buffer_pre 0 (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) (sublist (0) ((unsigned_last_nbits (((ca_capacity (state)) - retval )) (32))) (input_contents)) )
  **  (UCharArray.seg input_buffer_pre (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) (Zlength (input_contents)) (sublist ((unsigned_last_nbits (((ca_capacity (state)) - retval )) (32))) ((Zlength (input_contents))) (input_contents)) )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
) \/
(
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (data_length: Z) (b_force: Z) (readidx_3: Z) (writeidx_3: Z) (b_status_3: Z) (physical_3: (@list (@option Z))) (data_buffer_3: Z) (retval: Z) (readidx_4: Z) (b_status_4: Z) (physical_4: (@list (@option Z))) (writeidx_4: Z) (data_buffer_4: Z) (retval_2: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer_4 <> 0)) (PreH3 : (CircularAreaStateDivideWrDataResult state (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) retval_2 )) (PreH4 : (CircularAreaDivideWrDataResult writeidx_4 (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) (ca_capacity (state)) retval_2 )) (PreH5 : (CircularAreaLogicalState readidx_4 writeidx_4 (ca_capacity (state)) b_status_4 (ca_contents (state)) physical_4 )) (PreH6 : (data_length > (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)))) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (data_buffer_3 <> 0)) (PreH9 : (CircularAreaStateDataLengthResult state retval )) (PreH10 : (CircularAreaLogicalState readidx_3 writeidx_3 (ca_capacity (state)) b_status_3 (ca_contents (state)) physical_3 )) (PreH11 : (circular_area_pre <> 0)) (PreH12 : (input_buffer_pre <> 0)) (PreH13 : ((Zlength (input_contents)) > 0)) (PreH14 : (data_length = (Zlength (input_contents)))) (PreH15 : (b_force = 0)) (PreH16 : (CircularAreaStateFullResult state 0 )) (PreH17 : (data_buffer_2 <> 0)) (PreH18 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH19 : (retval_2 = 0)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer_4 (ca_capacity (state)) physical_4 )
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
|--
  EX (physical: (@list (@option Z))) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ (data_buffer_4 <> 0) ” 
  &&  “ ((Zlength (input_contents)) > 0) ” 
  &&  “ (b_force = 0) ” 
  &&  “ (CircularAreaStateFullResult state 0 ) ” 
  &&  “ (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) ) ” 
  &&  “ (0 < (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32))) ” 
  &&  “ ((unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) <= (Zlength (input_contents))) ” 
  &&  “ (0 <= writeidx_4) ” 
  &&  “ ((writeidx_4 + (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) ) <= (ca_capacity (state))) ” 
  &&  “ (CircularAreaStateDivideWrDataResult state (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) 0 ) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx_4 (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) (ca_capacity (state)) 0 ) ” 
  &&  “ (CircularAreaLogicalState readidx_4 writeidx_4 (ca_capacity (state)) b_status_4 (ca_contents (state)) physical ) ”
  &&  (UCharArray.mixed_seg data_buffer_4 0 writeidx_4 (sublist (0) (writeidx_4) (physical)) )
  **  (UCharArray.mixed_seg data_buffer_4 writeidx_4 (writeidx_4 + (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) ) (sublist (writeidx_4) ((writeidx_4 + (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) )) (physical)) )
  **  (UCharArray.mixed_seg data_buffer_4 (writeidx_4 + (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) ) (ca_capacity (state)) (sublist ((writeidx_4 + (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) )) ((ca_capacity (state))) (physical)) )
  **  (UCharArray.seg input_buffer_pre 0 (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) (sublist (0) ((unsigned_last_nbits (((ca_capacity (state)) - retval )) (32))) (input_contents)) )
  **  (UCharArray.seg input_buffer_pre (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) (Zlength (input_contents)) (sublist ((unsigned_last_nbits (((ca_capacity (state)) - retval )) (32))) ((Zlength (input_contents))) (input_contents)) )
  **  (GlobalStrings LitMap )
).

Definition CircularAreaWrite_entail_wit_8_2 := 
(
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (data_length: Z) (b_force: Z) (readidx_3: Z) (writeidx_3: Z) (b_status_3: Z) (physical_3: (@list (@option Z))) (data_buffer_3: Z) (retval: Z) (operations_2: Z) (readidx_4: Z) (b_status_4: Z) (physical_4: (@list (@option Z))) (writeidx_4: Z) (data_buffer_4: Z) (retval_2: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer_4 <> 0)) (PreH3 : (CircularAreaStateDivideWrDataResult state data_length retval_2 )) (PreH4 : (CircularAreaDivideWrDataResult writeidx_4 data_length (ca_capacity (state)) retval_2 )) (PreH5 : (CircularAreaLogicalState readidx_4 writeidx_4 (ca_capacity (state)) b_status_4 (ca_contents (state)) physical_4 )) (PreH6 : (data_length <= (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)))) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (data_buffer_3 <> 0)) (PreH9 : (CircularAreaStateDataLengthResult state retval )) (PreH10 : (CircularAreaLogicalState readidx_3 writeidx_3 (ca_capacity (state)) b_status_3 (ca_contents (state)) physical_3 )) (PreH11 : (circular_area_pre <> 0)) (PreH12 : (input_buffer_pre <> 0)) (PreH13 : ((Zlength (input_contents)) > 0)) (PreH14 : (data_length = (Zlength (input_contents)))) (PreH15 : (b_force = 0)) (PreH16 : (CircularAreaStateFullResult state 0 )) (PreH17 : (data_buffer_2 <> 0)) (PreH18 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH19 : (retval_2 = 0)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer_4 (ca_capacity (state)) physical_4 )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_4)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_4)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_4)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_4)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_4 + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_4)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_2)
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
|--
  EX (operations: Z)  (readidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (writeidx: Z)  (data_buffer: Z) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ ((Zlength (input_contents)) > 0) ” 
  &&  “ (b_force = 0) ” 
  &&  “ (CircularAreaStateFullResult state 0 ) ” 
  &&  “ (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length ) ” 
  &&  “ (0 < data_length) ” 
  &&  “ (data_length <= (Zlength (input_contents))) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ ((writeidx + data_length ) <= (ca_capacity (state))) ” 
  &&  “ (CircularAreaStateDivideWrDataResult state data_length 0 ) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx data_length (ca_capacity (state)) 0 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx (writeidx + data_length ) (sublist (writeidx) ((writeidx + data_length )) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (writeidx + data_length ) (ca_capacity (state)) (sublist ((writeidx + data_length )) ((ca_capacity (state))) (physical)) )
  **  (UCharArray.seg input_buffer_pre 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_pre data_length (Zlength (input_contents)) (sublist (data_length) ((Zlength (input_contents))) (input_contents)) )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
) \/
(
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (data_length: Z) (b_force: Z) (readidx_3: Z) (writeidx_3: Z) (b_status_3: Z) (physical_3: (@list (@option Z))) (data_buffer_3: Z) (retval: Z) (readidx_4: Z) (b_status_4: Z) (physical_4: (@list (@option Z))) (writeidx_4: Z) (data_buffer_4: Z) (retval_2: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer_4 <> 0)) (PreH3 : (CircularAreaStateDivideWrDataResult state data_length retval_2 )) (PreH4 : (CircularAreaDivideWrDataResult writeidx_4 data_length (ca_capacity (state)) retval_2 )) (PreH5 : (CircularAreaLogicalState readidx_4 writeidx_4 (ca_capacity (state)) b_status_4 (ca_contents (state)) physical_4 )) (PreH6 : (data_length <= (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)))) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (data_buffer_3 <> 0)) (PreH9 : (CircularAreaStateDataLengthResult state retval )) (PreH10 : (CircularAreaLogicalState readidx_3 writeidx_3 (ca_capacity (state)) b_status_3 (ca_contents (state)) physical_3 )) (PreH11 : (circular_area_pre <> 0)) (PreH12 : (input_buffer_pre <> 0)) (PreH13 : ((Zlength (input_contents)) > 0)) (PreH14 : (data_length = (Zlength (input_contents)))) (PreH15 : (b_force = 0)) (PreH16 : (CircularAreaStateFullResult state 0 )) (PreH17 : (data_buffer_2 <> 0)) (PreH18 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH19 : (retval_2 = 0)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer_4 (ca_capacity (state)) physical_4 )
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
|--
  EX (physical: (@list (@option Z))) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ (data_buffer_4 <> 0) ” 
  &&  “ ((Zlength (input_contents)) > 0) ” 
  &&  “ (b_force = 0) ” 
  &&  “ (CircularAreaStateFullResult state 0 ) ” 
  &&  “ (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length ) ” 
  &&  “ (0 < data_length) ” 
  &&  “ (data_length <= (Zlength (input_contents))) ” 
  &&  “ (0 <= writeidx_4) ” 
  &&  “ ((writeidx_4 + data_length ) <= (ca_capacity (state))) ” 
  &&  “ (CircularAreaStateDivideWrDataResult state data_length 0 ) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx_4 data_length (ca_capacity (state)) 0 ) ” 
  &&  “ (CircularAreaLogicalState readidx_4 writeidx_4 (ca_capacity (state)) b_status_4 (ca_contents (state)) physical ) ”
  &&  (UCharArray.mixed_seg data_buffer_4 0 writeidx_4 (sublist (0) (writeidx_4) (physical)) )
  **  (UCharArray.mixed_seg data_buffer_4 writeidx_4 (writeidx_4 + data_length ) (sublist (writeidx_4) ((writeidx_4 + data_length )) (physical)) )
  **  (UCharArray.mixed_seg data_buffer_4 (writeidx_4 + data_length ) (ca_capacity (state)) (sublist ((writeidx_4 + data_length )) ((ca_capacity (state))) (physical)) )
  **  (UCharArray.seg input_buffer_pre 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_pre data_length (Zlength (input_contents)) (sublist (data_length) ((Zlength (input_contents))) (input_contents)) )
  **  (GlobalStrings LitMap )
).

Definition CircularAreaWrite_return_wit_1 := 
(
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (b_force: Z) (data_length: Z) (write_len_down: Z) (write_len_up: Z) (retval: Z) (PreH1 : (retval = data_buffer)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (input_buffer_pre <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : ((Zlength (input_contents)) > 0)) (PreH6 : (b_force = 0)) (PreH7 : (CircularAreaStateFullResult state 0 )) (PreH8 : (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length )) (PreH9 : (0 <= write_len_down)) (PreH10 : (write_len_down <= writeidx)) (PreH11 : (write_len_up = ((ca_capacity (state)) - writeidx ))) (PreH12 : (write_len_down = (data_length - write_len_up ))) (PreH13 : (CircularAreaStateDivideWrDataResult state data_length 1 )) (PreH14 : (CircularAreaDivideWrDataResult writeidx data_length (ca_capacity (state)) 1 )) (PreH15 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) (PreH16 : (b_force = 0)) ,
  (UCharArray.mixed_seg data_buffer 0 write_len_down (CircularAreaSomeBytes ((sublist (write_len_up) (data_length) (input_contents)))) )
  **  (UCharArray.seg input_buffer_pre write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.mixed_seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx (ca_capacity (state)) (CircularAreaSomeBytes ((sublist (0) (write_len_up) (input_contents)))) )
  **  (UCharArray.seg input_buffer_pre 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_pre data_length (Zlength (input_contents)) (sublist (data_length) ((Zlength (input_contents))) (input_contents)) )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> (unsigned_last_nbits (write_len_down) (8)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 1)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  EX (state_after: circular_area_state) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ (CircularAreaWriteResult state (Zlength (input_contents)) input_contents 0 state_after ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state_after circular_area_pre )
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
) \/
(
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (b_force: Z) (data_length: Z) (write_len_down: Z) (write_len_up: Z) (retval: Z) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (1 <= INT_MAX)) (PreH4 : (1 >= INT_MIN)) (PreH5 : (retval = data_buffer)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (input_buffer_pre <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : ((Zlength (input_contents)) > 0)) (PreH10 : (b_force = 0)) (PreH11 : (CircularAreaStateFullResult state 0 )) (PreH12 : (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length )) (PreH13 : (0 <= write_len_down)) (PreH14 : (write_len_down <= writeidx)) (PreH15 : (write_len_up = ((ca_capacity (state)) - writeidx ))) (PreH16 : (write_len_down = (data_length - write_len_up ))) (PreH17 : (CircularAreaStateDivideWrDataResult state data_length 1 )) (PreH18 : (CircularAreaDivideWrDataResult writeidx data_length (ca_capacity (state)) 1 )) (PreH19 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) (PreH20 : (b_force = 0)) ,
  (UCharArray.mixed_seg data_buffer 0 write_len_down (CircularAreaSomeBytes ((sublist (write_len_up) (data_length) (input_contents)))) )
  **  (UCharArray.seg input_buffer_pre write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.mixed_seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx (ca_capacity (state)) (CircularAreaSomeBytes ((sublist (0) (write_len_up) (input_contents)))) )
  **  (UCharArray.seg input_buffer_pre 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_pre data_length (Zlength (input_contents)) (sublist (data_length) ((Zlength (input_contents))) (input_contents)) )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> (unsigned_last_nbits (write_len_down) (8)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 1)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  EX (state_after: circular_area_state) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ (CircularAreaWriteResult state (Zlength (input_contents)) input_contents 0 state_after ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state_after circular_area_pre )
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
).

Definition CircularAreaWrite_return_wit_2 := 
(
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (b_force: Z) (data_length: Z) (retval: Z) (PreH1 : (retval = (data_buffer + (writeidx * sizeof(UCHAR))))) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (input_buffer_pre <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : ((Zlength (input_contents)) > 0)) (PreH6 : (b_force = 0)) (PreH7 : (CircularAreaStateFullResult state 0 )) (PreH8 : (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length )) (PreH9 : (0 < data_length)) (PreH10 : (data_length <= (Zlength (input_contents)))) (PreH11 : (0 <= writeidx)) (PreH12 : ((writeidx + data_length ) <= (ca_capacity (state)))) (PreH13 : (CircularAreaStateDivideWrDataResult state data_length 0 )) (PreH14 : (CircularAreaDivideWrDataResult writeidx data_length (ca_capacity (state)) 0 )) (PreH15 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) (PreH16 : (b_force = 0)) ,
  (UCharArray.mixed_seg data_buffer writeidx (writeidx + data_length ) (CircularAreaSomeBytes ((sublist (0) (data_length) (input_contents)))) )
  **  (UCharArray.seg input_buffer_pre 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (writeidx + data_length ) (ca_capacity (state)) (sublist ((writeidx + data_length )) ((ca_capacity (state))) (physical)) )
  **  (UCharArray.seg input_buffer_pre data_length (Zlength (input_contents)) (sublist (data_length) ((Zlength (input_contents))) (input_contents)) )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> (unsigned_last_nbits (((writeidx + data_length ) % ( (ca_capacity (state)) ) )) (8)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 1)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  EX (state_after: circular_area_state) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ (CircularAreaWriteResult state (Zlength (input_contents)) input_contents 0 state_after ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state_after circular_area_pre )
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
) \/
(
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (b_force: Z) (data_length: Z) (retval: Z) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (1 <= INT_MAX)) (PreH4 : (1 >= INT_MIN)) (PreH5 : (retval = (data_buffer + (writeidx * sizeof(UCHAR))))) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (input_buffer_pre <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : ((Zlength (input_contents)) > 0)) (PreH10 : (b_force = 0)) (PreH11 : (CircularAreaStateFullResult state 0 )) (PreH12 : (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length )) (PreH13 : (0 < data_length)) (PreH14 : (data_length <= (Zlength (input_contents)))) (PreH15 : (0 <= writeidx)) (PreH16 : ((writeidx + data_length ) <= (ca_capacity (state)))) (PreH17 : (CircularAreaStateDivideWrDataResult state data_length 0 )) (PreH18 : (CircularAreaDivideWrDataResult writeidx data_length (ca_capacity (state)) 0 )) (PreH19 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) (PreH20 : (b_force = 0)) ,
  (UCharArray.mixed_seg data_buffer writeidx (writeidx + data_length ) (CircularAreaSomeBytes ((sublist (0) (data_length) (input_contents)))) )
  **  (UCharArray.seg input_buffer_pre 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (writeidx + data_length ) (ca_capacity (state)) (sublist ((writeidx + data_length )) ((ca_capacity (state))) (physical)) )
  **  (UCharArray.seg input_buffer_pre data_length (Zlength (input_contents)) (sublist (data_length) ((Zlength (input_contents))) (input_contents)) )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> (unsigned_last_nbits (((writeidx + data_length ) % ( (ca_capacity (state)) ) )) (8)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 1)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  EX (state_after: circular_area_state) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ (CircularAreaWriteResult state (Zlength (input_contents)) input_contents 0 state_after ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state_after circular_area_pre )
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
).

Definition CircularAreaWrite_return_wit_3 := 
(
forall (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (b_force: Z) (operations: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (data_buffer_2: Z) (retval: Z) (PreH1 : (b_force = 0)) (PreH2 : (retval <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (data_buffer_2 <> 0)) (PreH5 : (CircularAreaStateFullResult state retval )) (PreH6 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (input_buffer_pre <> 0)) (PreH9 : ((Zlength (input_contents)) > 0)) (PreH10 : (data_length_pre = (Zlength (input_contents)))) (PreH11 : (b_force = 0)) (PreH12 : (data_buffer <> 0)) (PreH13 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer_2 (ca_capacity (state)) physical_2 )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_2 + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
|--
  EX (state_after: circular_area_state) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ (CircularAreaWriteResult state (Zlength (input_contents)) input_contents 1 state_after ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state_after circular_area_pre )
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
) \/
(
forall (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (b_force: Z) (operations: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (data_buffer_2: Z) (retval: Z) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status_2 <= INT_MAX)) (PreH4 : (b_status_2 >= INT_MIN)) (PreH5 : (b_force = 0)) (PreH6 : (retval <> 0)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (data_buffer_2 <> 0)) (PreH9 : (CircularAreaStateFullResult state retval )) (PreH10 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) (PreH11 : (circular_area_pre <> 0)) (PreH12 : (input_buffer_pre <> 0)) (PreH13 : ((Zlength (input_contents)) > 0)) (PreH14 : (data_length_pre = (Zlength (input_contents)))) (PreH15 : (b_force = 0)) (PreH16 : (data_buffer <> 0)) (PreH17 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer_2 (ca_capacity (state)) physical_2 )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer_2 + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  EX (state_after: circular_area_state) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ (CircularAreaWriteResult state (Zlength (input_contents)) input_contents 1 state_after ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state_after circular_area_pre )
).

Definition CircularAreaWrite_return_wit_4 := 
(
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (data_length_pre <= 0)) (PreH2 : (0 <= data_length_pre)) (PreH3 : (data_length_pre <= UINT_MAX)) (PreH4 : (b_force_pre <= INT_MAX)) (PreH5 : (b_force_pre >= INT_MIN)) (PreH6 : (input_buffer_pre <> 0)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (b_force_pre = 0)) (PreH9 : (0 <= data_length_pre)) (PreH10 : (data_length_pre <= UINT_MAX)) (PreH11 : (circular_area_pre <> 0)) (PreH12 : (input_buffer_pre <> 0)) (PreH13 : ((Zlength (input_contents)) = data_length_pre)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
  **  (UCharArray.full input_buffer_pre data_length_pre input_contents )
|--
  EX (state_after: circular_area_state) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ (CircularAreaWriteResult state (Zlength (input_contents)) input_contents 1 state_after ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state_after circular_area_pre )
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
) \/
(
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (state: circular_area_state) (PreH1 : (data_length_pre <= 0)) (PreH2 : (0 <= data_length_pre)) (PreH3 : (data_length_pre <= UINT_MAX)) (PreH4 : (b_force_pre <= INT_MAX)) (PreH5 : (b_force_pre >= INT_MIN)) (PreH6 : (input_buffer_pre <> 0)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (b_force_pre = 0)) (PreH9 : (0 <= data_length_pre)) (PreH10 : (data_length_pre <= UINT_MAX)) (PreH11 : (circular_area_pre <> 0)) (PreH12 : (input_buffer_pre <> 0)) (PreH13 : ((Zlength (input_contents)) = data_length_pre)) ,
  (UCharArray.full input_buffer_pre data_length_pre input_contents )
|--
  “ (CircularAreaWriteResult state data_length_pre input_contents 1 state ) ” 
  &&  “ (input_contents = (@nil Z)) ”
  &&  emp
).

Definition CircularAreaWrite_return_wit_4_split_goal_1 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (state: circular_area_state) (PreH1 : (data_length_pre <= 0)) (PreH2 : (0 <= data_length_pre)) (PreH3 : (data_length_pre <= UINT_MAX)) (PreH4 : (b_force_pre <= INT_MAX)) (PreH5 : (b_force_pre >= INT_MIN)) (PreH6 : (input_buffer_pre <> 0)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (b_force_pre = 0)) (PreH9 : (0 <= data_length_pre)) (PreH10 : (data_length_pre <= UINT_MAX)) (PreH11 : (circular_area_pre <> 0)) (PreH12 : (input_buffer_pre <> 0)) (PreH13 : ((Zlength (input_contents)) = data_length_pre)) ,
  (UCharArray.full input_buffer_pre data_length_pre input_contents )
|--
  “ (CircularAreaWriteResult state data_length_pre input_contents 1 state ) ”
.

Definition CircularAreaWrite_return_wit_4_split_goal_2 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (PreH1 : (data_length_pre <= 0)) (PreH2 : (0 <= data_length_pre)) (PreH3 : (data_length_pre <= UINT_MAX)) (PreH4 : (b_force_pre <= INT_MAX)) (PreH5 : (b_force_pre >= INT_MIN)) (PreH6 : (input_buffer_pre <> 0)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (b_force_pre = 0)) (PreH9 : (0 <= data_length_pre)) (PreH10 : (data_length_pre <= UINT_MAX)) (PreH11 : (circular_area_pre <> 0)) (PreH12 : (input_buffer_pre <> 0)) (PreH13 : ((Zlength (input_contents)) = data_length_pre)) ,
  (UCharArray.full input_buffer_pre data_length_pre input_contents )
|--
  “ (input_contents = (@nil Z)) ”
.

Definition CircularAreaWrite_return_wit_4_split_goal_spatial := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (PreH1 : (data_length_pre <= 0)) (PreH2 : (0 <= data_length_pre)) (PreH3 : (data_length_pre <= UINT_MAX)) (PreH4 : (b_force_pre <= INT_MAX)) (PreH5 : (b_force_pre >= INT_MIN)) (PreH6 : (input_buffer_pre <> 0)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (b_force_pre = 0)) (PreH9 : (0 <= data_length_pre)) (PreH10 : (data_length_pre <= UINT_MAX)) (PreH11 : (circular_area_pre <> 0)) (PreH12 : (input_buffer_pre <> 0)) (PreH13 : ((Zlength (input_contents)) = data_length_pre)) ,
  (UCharArray.full input_buffer_pre data_length_pre input_contents )
|--
  TT && emp 
.

Definition CircularAreaWrite_return_wit_5 := 
(
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (PreH1 : (input_buffer_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (b_force_pre = 0)) (PreH4 : (0 <= data_length_pre)) (PreH5 : (data_length_pre <= UINT_MAX)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (input_buffer_pre = 0)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre = 0) ” 
  &&  “ (CircularAreaErrorResult 1 ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
) \/
(
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (PreH1 : (input_buffer_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (b_force_pre = 0)) (PreH4 : (0 <= data_length_pre)) (PreH5 : (data_length_pre <= UINT_MAX)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (input_buffer_pre = 0)) ,
  TT && emp 
|--
  “ (CircularAreaErrorResult 1 ) ”
  &&  emp
).

Definition CircularAreaWrite_return_wit_5_split_goal_1 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (PreH1 : (input_buffer_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (b_force_pre = 0)) (PreH4 : (0 <= data_length_pre)) (PreH5 : (data_length_pre <= UINT_MAX)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (input_buffer_pre = 0)) ,
  (CircularAreaErrorResult 1 )
.

Definition CircularAreaWrite_return_wit_6 := 
(
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (PreH1 : (circular_area_pre = 0)) (PreH2 : (b_force_pre = 0)) (PreH3 : (0 <= data_length_pre)) (PreH4 : (data_length_pre <= UINT_MAX)) (PreH5 : (circular_area_pre = 0)) (PreH6 : (input_buffer_pre = 0)) ,
  (GlobalStrings LitMap )
|--
  “ (circular_area_pre = 0) ” 
  &&  “ (CircularAreaErrorResult 1 ) ” 
  &&  “ (input_buffer_pre = 0) ”
  &&  (GlobalStrings LitMap )
) \/
(
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (b_force_pre = 0)) (PreH3 : (0 <= data_length_pre)) (PreH4 : (data_length_pre <= UINT_MAX)) (PreH5 : (circular_area_pre = 0)) (PreH6 : (input_buffer_pre = 0)) ,
  TT && emp 
|--
  “ (CircularAreaErrorResult 1 ) ”
  &&  emp
).

Definition CircularAreaWrite_return_wit_6_split_goal_1 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (b_force_pre = 0)) (PreH3 : (0 <= data_length_pre)) (PreH4 : (data_length_pre <= UINT_MAX)) (PreH5 : (circular_area_pre = 0)) (PreH6 : (input_buffer_pre = 0)) ,
  (CircularAreaErrorResult 1 )
.

Definition CircularAreaWrite_return_wit_7 := 
(
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (PreH1 : (circular_area_pre = 0)) (PreH2 : (b_force_pre = 0)) (PreH3 : (0 <= data_length_pre)) (PreH4 : (data_length_pre <= UINT_MAX)) (PreH5 : (circular_area_pre = 0)) (PreH6 : (input_buffer_pre <> 0)) (PreH7 : ((Zlength (input_contents)) = data_length_pre)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre data_length_pre input_contents )
|--
  “ (circular_area_pre = 0) ” 
  &&  “ (CircularAreaErrorResult 1 ) ” 
  &&  “ (input_buffer_pre <> 0) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
) \/
(
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (PreH1 : (circular_area_pre = 0)) (PreH2 : (b_force_pre = 0)) (PreH3 : (0 <= data_length_pre)) (PreH4 : (data_length_pre <= UINT_MAX)) (PreH5 : (circular_area_pre = 0)) (PreH6 : (input_buffer_pre <> 0)) (PreH7 : ((Zlength (input_contents)) = data_length_pre)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre data_length_pre input_contents )
|--
  “ (CircularAreaErrorResult 1 ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
).

Definition CircularAreaWrite_return_wit_7_split_goal_1 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (PreH1 : (circular_area_pre = 0)) (PreH2 : (b_force_pre = 0)) (PreH3 : (0 <= data_length_pre)) (PreH4 : (data_length_pre <= UINT_MAX)) (PreH5 : (circular_area_pre = 0)) (PreH6 : (input_buffer_pre <> 0)) (PreH7 : ((Zlength (input_contents)) = data_length_pre)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre data_length_pre input_contents )
|--
  “ (CircularAreaErrorResult 1 ) ”
.

Definition CircularAreaWrite_return_wit_7_split_goal_spatial := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (PreH1 : (circular_area_pre = 0)) (PreH2 : (b_force_pre = 0)) (PreH3 : (0 <= data_length_pre)) (PreH4 : (data_length_pre <= UINT_MAX)) (PreH5 : (circular_area_pre = 0)) (PreH6 : (input_buffer_pre <> 0)) (PreH7 : ((Zlength (input_contents)) = data_length_pre)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre data_length_pre input_contents )
|--
  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
.

Definition CircularAreaWrite_partial_solve_wit_1_pure := 
forall (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (b_force: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (input_buffer_pre <> 0)) (PreH3 : ((Zlength (input_contents)) > 0)) (PreH4 : (data_length_pre = (Zlength (input_contents)))) (PreH5 : (b_force = 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
.

Definition CircularAreaWrite_partial_solve_wit_1_aux := 
forall (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (b_force: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (input_buffer_pre <> 0)) (PreH3 : ((Zlength (input_contents)) > 0)) (PreH4 : (data_length_pre = (Zlength (input_contents)))) (PreH5 : (b_force = 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ ((Zlength (input_contents)) > 0) ” 
  &&  “ (data_length_pre = (Zlength (input_contents))) ” 
  &&  “ (b_force = 0) ” 
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
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
.

Definition CircularAreaWrite_partial_solve_wit_1 := CircularAreaWrite_partial_solve_wit_1_pure -> CircularAreaWrite_partial_solve_wit_1_aux.

Definition CircularAreaWrite_partial_solve_wit_2_pure := 
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (data_length: Z) (b_force: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (input_buffer_pre <> 0)) (PreH3 : ((Zlength (input_contents)) > 0)) (PreH4 : (data_length = (Zlength (input_contents)))) (PreH5 : (b_force = 0)) (PreH6 : (CircularAreaStateFullResult state 0 )) (PreH7 : (data_buffer <> 0)) (PreH8 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "write_data_length" ) )) # UInt  |->_)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "b_force" ) )) # Int  |-> b_force)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
.

Definition CircularAreaWrite_partial_solve_wit_2_aux := 
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (data_length: Z) (b_force: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (input_buffer_pre <> 0)) (PreH3 : ((Zlength (input_contents)) > 0)) (PreH4 : (data_length = (Zlength (input_contents)))) (PreH5 : (b_force = 0)) (PreH6 : (CircularAreaStateFullResult state 0 )) (PreH7 : (data_buffer <> 0)) (PreH8 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ ((Zlength (input_contents)) > 0) ” 
  &&  “ (data_length = (Zlength (input_contents))) ” 
  &&  “ (b_force = 0) ” 
  &&  “ (CircularAreaStateFullResult state 0 ) ” 
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
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
.

Definition CircularAreaWrite_partial_solve_wit_2 := CircularAreaWrite_partial_solve_wit_2_pure -> CircularAreaWrite_partial_solve_wit_2_aux.

Definition CircularAreaWrite_partial_solve_wit_3_pure := 
(
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (data_length: Z) (b_force: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (data_buffer: Z) (retval: Z) (PreH1 : (data_length > (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)))) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (CircularAreaStateDataLengthResult state retval )) (PreH5 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (input_buffer_pre <> 0)) (PreH8 : ((Zlength (input_contents)) > 0)) (PreH9 : (data_length = (Zlength (input_contents)))) (PreH10 : (b_force = 0)) (PreH11 : (CircularAreaStateFullResult state 0 )) (PreH12 : (data_buffer_2 <> 0)) (PreH13 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
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
  **  ((( &( "write_data_length" ) )) # UInt  |-> (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)))
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)))
  **  ((( &( "b_force" ) )) # Int  |-> b_force)
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ” 
  &&  “ ((unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) <= ((ca_capacity (state)) - (Zlength ((ca_contents (state)))) )) ” 
  &&  “ (0 <= (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32))) ”
) \/
(
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (data_length: Z) (b_force: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (data_buffer: Z) (retval: Z) (PreH1 : ((unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) <= UINT_MAX)) (PreH3 : ((unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) >= 0)) (PreH4 : ((ca_capacity (state)) >= 0)) (PreH5 : (b_force <= INT_MAX)) (PreH6 : (b_status <= INT_MAX)) (PreH7 : (b_force >= INT_MIN)) (PreH8 : (b_status >= INT_MIN)) (PreH9 : (data_length > (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)))) (PreH10 : (circular_area_pre <> 0)) (PreH11 : (data_buffer <> 0)) (PreH12 : (CircularAreaStateDataLengthResult state retval )) (PreH13 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) (PreH14 : (circular_area_pre <> 0)) (PreH15 : (input_buffer_pre <> 0)) (PreH16 : ((Zlength (input_contents)) > 0)) (PreH17 : (data_length = (Zlength (input_contents)))) (PreH18 : (b_force = 0)) (PreH19 : (CircularAreaStateFullResult state 0 )) (PreH20 : (data_buffer_2 <> 0)) (PreH21 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
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
  **  ((( &( "write_data_length" ) )) # UInt  |-> (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)))
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)))
  **  ((( &( "b_force" ) )) # Int  |-> b_force)
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
|--
  “ ((unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) <= ((ca_capacity (state)) - (Zlength ((ca_contents (state)))) )) ”
).

Definition CircularAreaWrite_partial_solve_wit_3_pure_split_goal_1 := 
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (data_length: Z) (b_force: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (data_buffer: Z) (retval: Z) (PreH1 : ((unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) <= UINT_MAX)) (PreH3 : ((unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) >= 0)) (PreH4 : ((ca_capacity (state)) >= 0)) (PreH5 : (b_force <= INT_MAX)) (PreH6 : (b_status <= INT_MAX)) (PreH7 : (b_force >= INT_MIN)) (PreH8 : (b_status >= INT_MIN)) (PreH9 : (data_length > (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)))) (PreH10 : (circular_area_pre <> 0)) (PreH11 : (data_buffer <> 0)) (PreH12 : (CircularAreaStateDataLengthResult state retval )) (PreH13 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) (PreH14 : (circular_area_pre <> 0)) (PreH15 : (input_buffer_pre <> 0)) (PreH16 : ((Zlength (input_contents)) > 0)) (PreH17 : (data_length = (Zlength (input_contents)))) (PreH18 : (b_force = 0)) (PreH19 : (CircularAreaStateFullResult state 0 )) (PreH20 : (data_buffer_2 <> 0)) (PreH21 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
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
  **  ((( &( "write_data_length" ) )) # UInt  |-> (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)))
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)))
  **  ((( &( "b_force" ) )) # Int  |-> b_force)
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
|--
  “ ((unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) <= ((ca_capacity (state)) - (Zlength ((ca_contents (state)))) )) ”
.

Definition CircularAreaWrite_partial_solve_wit_3_aux := 
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (data_length: Z) (b_force: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (data_buffer: Z) (retval: Z) (PreH1 : (data_length > (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)))) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (CircularAreaStateDataLengthResult state retval )) (PreH5 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (input_buffer_pre <> 0)) (PreH8 : ((Zlength (input_contents)) > 0)) (PreH9 : (data_length = (Zlength (input_contents)))) (PreH10 : (b_force = 0)) (PreH11 : (CircularAreaStateFullResult state 0 )) (PreH12 : (data_buffer_2 <> 0)) (PreH13 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
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
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ” 
  &&  “ ((unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) <= ((ca_capacity (state)) - (Zlength ((ca_contents (state)))) )) ” 
  &&  “ (0 <= (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32))) ” 
  &&  “ (data_length > (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32))) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaStateDataLengthResult state retval ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ ((Zlength (input_contents)) > 0) ” 
  &&  “ (data_length = (Zlength (input_contents))) ” 
  &&  “ (b_force = 0) ” 
  &&  “ (CircularAreaStateFullResult state 0 ) ” 
  &&  “ (data_buffer_2 <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 ) ”
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
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
.

Definition CircularAreaWrite_partial_solve_wit_3 := CircularAreaWrite_partial_solve_wit_3_pure -> CircularAreaWrite_partial_solve_wit_3_aux.

Definition CircularAreaWrite_partial_solve_wit_4_pure := 
(
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (data_length: Z) (b_force: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (data_buffer: Z) (retval: Z) (PreH1 : (data_length <= (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)))) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (CircularAreaStateDataLengthResult state retval )) (PreH5 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (input_buffer_pre <> 0)) (PreH8 : ((Zlength (input_contents)) > 0)) (PreH9 : (data_length = (Zlength (input_contents)))) (PreH10 : (b_force = 0)) (PreH11 : (CircularAreaStateFullResult state 0 )) (PreH12 : (data_buffer_2 <> 0)) (PreH13 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
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
  **  ((( &( "write_data_length" ) )) # UInt  |-> (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)))
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "b_force" ) )) # Int  |-> b_force)
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (0 <= data_length) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ” 
  &&  “ (data_length <= ((ca_capacity (state)) - (Zlength ((ca_contents (state)))) )) ”
) \/
(
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (data_length: Z) (b_force: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (data_buffer: Z) (retval: Z) (PreH1 : (data_length <= UINT_MAX)) (PreH2 : ((unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) <= UINT_MAX)) (PreH3 : ((ca_capacity (state)) <= UINT_MAX)) (PreH4 : (data_length >= 0)) (PreH5 : ((unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) >= 0)) (PreH6 : ((ca_capacity (state)) >= 0)) (PreH7 : (b_force <= INT_MAX)) (PreH8 : (b_status <= INT_MAX)) (PreH9 : (b_force >= INT_MIN)) (PreH10 : (b_status >= INT_MIN)) (PreH11 : (data_length <= (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)))) (PreH12 : (circular_area_pre <> 0)) (PreH13 : (data_buffer <> 0)) (PreH14 : (CircularAreaStateDataLengthResult state retval )) (PreH15 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) (PreH16 : (circular_area_pre <> 0)) (PreH17 : (input_buffer_pre <> 0)) (PreH18 : ((Zlength (input_contents)) > 0)) (PreH19 : (data_length = (Zlength (input_contents)))) (PreH20 : (b_force = 0)) (PreH21 : (CircularAreaStateFullResult state 0 )) (PreH22 : (data_buffer_2 <> 0)) (PreH23 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
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
  **  ((( &( "write_data_length" ) )) # UInt  |-> (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)))
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "b_force" ) )) # Int  |-> b_force)
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
|--
  “ (data_length <= ((ca_capacity (state)) - (Zlength ((ca_contents (state)))) )) ”
).

Definition CircularAreaWrite_partial_solve_wit_4_pure_split_goal_1 := 
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (data_length: Z) (b_force: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (data_buffer: Z) (retval: Z) (PreH1 : (data_length <= UINT_MAX)) (PreH2 : ((unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) <= UINT_MAX)) (PreH3 : ((ca_capacity (state)) <= UINT_MAX)) (PreH4 : (data_length >= 0)) (PreH5 : ((unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)) >= 0)) (PreH6 : ((ca_capacity (state)) >= 0)) (PreH7 : (b_force <= INT_MAX)) (PreH8 : (b_status <= INT_MAX)) (PreH9 : (b_force >= INT_MIN)) (PreH10 : (b_status >= INT_MIN)) (PreH11 : (data_length <= (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)))) (PreH12 : (circular_area_pre <> 0)) (PreH13 : (data_buffer <> 0)) (PreH14 : (CircularAreaStateDataLengthResult state retval )) (PreH15 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) (PreH16 : (circular_area_pre <> 0)) (PreH17 : (input_buffer_pre <> 0)) (PreH18 : ((Zlength (input_contents)) > 0)) (PreH19 : (data_length = (Zlength (input_contents)))) (PreH20 : (b_force = 0)) (PreH21 : (CircularAreaStateFullResult state 0 )) (PreH22 : (data_buffer_2 <> 0)) (PreH23 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
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
  **  ((( &( "write_data_length" ) )) # UInt  |-> (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)))
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "b_force" ) )) # Int  |-> b_force)
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
|--
  “ (data_length <= ((ca_capacity (state)) - (Zlength ((ca_contents (state)))) )) ”
.

Definition CircularAreaWrite_partial_solve_wit_4_aux := 
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer_2: Z) (readidx_2: Z) (writeidx_2: Z) (b_status_2: Z) (physical_2: (@list (@option Z))) (data_length: Z) (b_force: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (data_buffer: Z) (retval: Z) (PreH1 : (data_length <= (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32)))) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (CircularAreaStateDataLengthResult state retval )) (PreH5 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (input_buffer_pre <> 0)) (PreH8 : ((Zlength (input_contents)) > 0)) (PreH9 : (data_length = (Zlength (input_contents)))) (PreH10 : (b_force = 0)) (PreH11 : (CircularAreaStateFullResult state 0 )) (PreH12 : (data_buffer_2 <> 0)) (PreH13 : (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 )) ,
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
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (0 <= data_length) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ” 
  &&  “ (data_length <= ((ca_capacity (state)) - (Zlength ((ca_contents (state)))) )) ” 
  &&  “ (data_length <= (unsigned_last_nbits (((ca_capacity (state)) - retval )) (32))) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaStateDataLengthResult state retval ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ ((Zlength (input_contents)) > 0) ” 
  &&  “ (data_length = (Zlength (input_contents))) ” 
  &&  “ (b_force = 0) ” 
  &&  “ (CircularAreaStateFullResult state 0 ) ” 
  &&  “ (data_buffer_2 <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx_2 writeidx_2 (ca_capacity (state)) b_status_2 (ca_contents (state)) physical_2 ) ”
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
  **  (UCharArray.full input_buffer_pre (Zlength (input_contents)) input_contents )
.

Definition CircularAreaWrite_partial_solve_wit_4 := CircularAreaWrite_partial_solve_wit_4_pure -> CircularAreaWrite_partial_solve_wit_4_aux.

Definition CircularAreaWrite_partial_solve_wit_5_pure := 
(
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (b_force: Z) (data_length: Z) (write_len_up: Z) (write_len_down: Z) (write_data_length_addr_v: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (input_buffer_pre <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : ((Zlength (input_contents)) > 0)) (PreH5 : (b_force = 0)) (PreH6 : (CircularAreaStateFullResult state 0 )) (PreH7 : (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length )) (PreH8 : (0 < data_length)) (PreH9 : (data_length <= (Zlength (input_contents)))) (PreH10 : (0 <= writeidx)) (PreH11 : (writeidx < (ca_capacity (state)))) (PreH12 : (write_len_up = ((ca_capacity (state)) - writeidx ))) (PreH13 : (write_len_down = (data_length - write_len_up ))) (PreH14 : (write_len_up <= data_length)) (PreH15 : (CircularAreaStateDivideWrDataResult state data_length 1 )) (PreH16 : (CircularAreaDivideWrDataResult writeidx data_length (ca_capacity (state)) 1 )) (PreH17 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "write_len_up" ) )) # UInt  |-> write_len_up)
  **  ((( &( "write_len_down" ) )) # UInt  |-> write_len_down)
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx (ca_capacity (state)) (sublist (writeidx) ((ca_capacity (state))) (physical)) )
  **  (UCharArray.seg input_buffer_pre 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_pre write_len_up (Zlength (input_contents)) (sublist (write_len_up) ((Zlength (input_contents))) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((data_buffer + (writeidx * sizeof(UCHAR))) = (data_buffer + writeidx )) ” 
  &&  “ (input_buffer_pre = (input_buffer_pre + 0 )) ” 
  &&  “ (write_len_up = ((ca_capacity (state)) - writeidx )) ” 
  &&  “ (write_len_up = (write_len_up - 0 )) ” 
  &&  “ ((Zlength ((sublist (writeidx) ((ca_capacity (state))) (physical)))) = ((ca_capacity (state)) - writeidx )) ” 
  &&  “ ((Zlength ((sublist (0) (write_len_up) (input_contents)))) = (write_len_up - 0 )) ” 
  &&  “ ((Zlength ((sublist (writeidx) ((ca_capacity (state))) (physical)))) = write_len_up) ”
) \/
(
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (b_force: Z) (data_length: Z) (write_len_up: Z) (write_len_down: Z) (write_data_length_addr_v: Z) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : (write_data_length_addr_v <= UINT_MAX)) (PreH3 : (write_len_down <= UINT_MAX)) (PreH4 : (write_len_up <= UINT_MAX)) (PreH5 : (data_length <= UINT_MAX)) (PreH6 : ((ca_capacity (state)) >= 0)) (PreH7 : (write_data_length_addr_v >= 0)) (PreH8 : (write_len_down >= 0)) (PreH9 : (write_len_up >= 0)) (PreH10 : (data_length >= 0)) (PreH11 : (b_status <= INT_MAX)) (PreH12 : (b_force <= INT_MAX)) (PreH13 : (b_status >= INT_MIN)) (PreH14 : (b_force >= INT_MIN)) (PreH15 : (circular_area_pre <> 0)) (PreH16 : (input_buffer_pre <> 0)) (PreH17 : (data_buffer <> 0)) (PreH18 : ((Zlength (input_contents)) > 0)) (PreH19 : (b_force = 0)) (PreH20 : (CircularAreaStateFullResult state 0 )) (PreH21 : (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length )) (PreH22 : (0 < data_length)) (PreH23 : (data_length <= (Zlength (input_contents)))) (PreH24 : (0 <= writeidx)) (PreH25 : (writeidx < (ca_capacity (state)))) (PreH26 : (write_len_up = ((ca_capacity (state)) - writeidx ))) (PreH27 : (write_len_down = (data_length - write_len_up ))) (PreH28 : (write_len_up <= data_length)) (PreH29 : (CircularAreaStateDivideWrDataResult state data_length 1 )) (PreH30 : (CircularAreaDivideWrDataResult writeidx data_length (ca_capacity (state)) 1 )) (PreH31 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "write_len_up" ) )) # UInt  |-> write_len_up)
  **  ((( &( "write_len_down" ) )) # UInt  |-> write_len_down)
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx (ca_capacity (state)) (sublist (writeidx) ((ca_capacity (state))) (physical)) )
  **  (UCharArray.seg input_buffer_pre 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_pre write_len_up (Zlength (input_contents)) (sublist (write_len_up) ((Zlength (input_contents))) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((Zlength ((sublist (writeidx) ((ca_capacity (state))) (physical)))) = write_len_up) ” 
  &&  “ ((Zlength ((sublist (0) (write_len_up) (input_contents)))) = (write_len_up - 0 )) ” 
  &&  “ ((Zlength ((sublist (writeidx) ((ca_capacity (state))) (physical)))) = write_len_up) ”
).

Definition CircularAreaWrite_partial_solve_wit_5_pure_split_goal_1 := 
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (b_force: Z) (data_length: Z) (write_len_up: Z) (write_len_down: Z) (write_data_length_addr_v: Z) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : (write_data_length_addr_v <= UINT_MAX)) (PreH3 : (write_len_down <= UINT_MAX)) (PreH4 : (write_len_up <= UINT_MAX)) (PreH5 : (data_length <= UINT_MAX)) (PreH6 : ((ca_capacity (state)) >= 0)) (PreH7 : (write_data_length_addr_v >= 0)) (PreH8 : (write_len_down >= 0)) (PreH9 : (write_len_up >= 0)) (PreH10 : (data_length >= 0)) (PreH11 : (b_status <= INT_MAX)) (PreH12 : (b_force <= INT_MAX)) (PreH13 : (b_status >= INT_MIN)) (PreH14 : (b_force >= INT_MIN)) (PreH15 : (circular_area_pre <> 0)) (PreH16 : (input_buffer_pre <> 0)) (PreH17 : (data_buffer <> 0)) (PreH18 : ((Zlength (input_contents)) > 0)) (PreH19 : (b_force = 0)) (PreH20 : (CircularAreaStateFullResult state 0 )) (PreH21 : (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length )) (PreH22 : (0 < data_length)) (PreH23 : (data_length <= (Zlength (input_contents)))) (PreH24 : (0 <= writeidx)) (PreH25 : (writeidx < (ca_capacity (state)))) (PreH26 : (write_len_up = ((ca_capacity (state)) - writeidx ))) (PreH27 : (write_len_down = (data_length - write_len_up ))) (PreH28 : (write_len_up <= data_length)) (PreH29 : (CircularAreaStateDivideWrDataResult state data_length 1 )) (PreH30 : (CircularAreaDivideWrDataResult writeidx data_length (ca_capacity (state)) 1 )) (PreH31 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "write_len_up" ) )) # UInt  |-> write_len_up)
  **  ((( &( "write_len_down" ) )) # UInt  |-> write_len_down)
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx (ca_capacity (state)) (sublist (writeidx) ((ca_capacity (state))) (physical)) )
  **  (UCharArray.seg input_buffer_pre 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_pre write_len_up (Zlength (input_contents)) (sublist (write_len_up) ((Zlength (input_contents))) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((Zlength ((sublist (writeidx) ((ca_capacity (state))) (physical)))) = write_len_up) ”
.

Definition CircularAreaWrite_partial_solve_wit_5_pure_split_goal_2 := 
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (b_force: Z) (data_length: Z) (write_len_up: Z) (write_len_down: Z) (write_data_length_addr_v: Z) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : (write_data_length_addr_v <= UINT_MAX)) (PreH3 : (write_len_down <= UINT_MAX)) (PreH4 : (write_len_up <= UINT_MAX)) (PreH5 : (data_length <= UINT_MAX)) (PreH6 : ((ca_capacity (state)) >= 0)) (PreH7 : (write_data_length_addr_v >= 0)) (PreH8 : (write_len_down >= 0)) (PreH9 : (write_len_up >= 0)) (PreH10 : (data_length >= 0)) (PreH11 : (b_status <= INT_MAX)) (PreH12 : (b_force <= INT_MAX)) (PreH13 : (b_status >= INT_MIN)) (PreH14 : (b_force >= INT_MIN)) (PreH15 : (circular_area_pre <> 0)) (PreH16 : (input_buffer_pre <> 0)) (PreH17 : (data_buffer <> 0)) (PreH18 : ((Zlength (input_contents)) > 0)) (PreH19 : (b_force = 0)) (PreH20 : (CircularAreaStateFullResult state 0 )) (PreH21 : (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length )) (PreH22 : (0 < data_length)) (PreH23 : (data_length <= (Zlength (input_contents)))) (PreH24 : (0 <= writeidx)) (PreH25 : (writeidx < (ca_capacity (state)))) (PreH26 : (write_len_up = ((ca_capacity (state)) - writeidx ))) (PreH27 : (write_len_down = (data_length - write_len_up ))) (PreH28 : (write_len_up <= data_length)) (PreH29 : (CircularAreaStateDivideWrDataResult state data_length 1 )) (PreH30 : (CircularAreaDivideWrDataResult writeidx data_length (ca_capacity (state)) 1 )) (PreH31 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "write_len_up" ) )) # UInt  |-> write_len_up)
  **  ((( &( "write_len_down" ) )) # UInt  |-> write_len_down)
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx (ca_capacity (state)) (sublist (writeidx) ((ca_capacity (state))) (physical)) )
  **  (UCharArray.seg input_buffer_pre 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_pre write_len_up (Zlength (input_contents)) (sublist (write_len_up) ((Zlength (input_contents))) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((Zlength ((sublist (0) (write_len_up) (input_contents)))) = (write_len_up - 0 )) ”
.

Definition CircularAreaWrite_partial_solve_wit_5_pure_split_goal_3 := 
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (b_force: Z) (data_length: Z) (write_len_up: Z) (write_len_down: Z) (write_data_length_addr_v: Z) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : (write_data_length_addr_v <= UINT_MAX)) (PreH3 : (write_len_down <= UINT_MAX)) (PreH4 : (write_len_up <= UINT_MAX)) (PreH5 : (data_length <= UINT_MAX)) (PreH6 : ((ca_capacity (state)) >= 0)) (PreH7 : (write_data_length_addr_v >= 0)) (PreH8 : (write_len_down >= 0)) (PreH9 : (write_len_up >= 0)) (PreH10 : (data_length >= 0)) (PreH11 : (b_status <= INT_MAX)) (PreH12 : (b_force <= INT_MAX)) (PreH13 : (b_status >= INT_MIN)) (PreH14 : (b_force >= INT_MIN)) (PreH15 : (circular_area_pre <> 0)) (PreH16 : (input_buffer_pre <> 0)) (PreH17 : (data_buffer <> 0)) (PreH18 : ((Zlength (input_contents)) > 0)) (PreH19 : (b_force = 0)) (PreH20 : (CircularAreaStateFullResult state 0 )) (PreH21 : (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length )) (PreH22 : (0 < data_length)) (PreH23 : (data_length <= (Zlength (input_contents)))) (PreH24 : (0 <= writeidx)) (PreH25 : (writeidx < (ca_capacity (state)))) (PreH26 : (write_len_up = ((ca_capacity (state)) - writeidx ))) (PreH27 : (write_len_down = (data_length - write_len_up ))) (PreH28 : (write_len_up <= data_length)) (PreH29 : (CircularAreaStateDivideWrDataResult state data_length 1 )) (PreH30 : (CircularAreaDivideWrDataResult writeidx data_length (ca_capacity (state)) 1 )) (PreH31 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "write_len_up" ) )) # UInt  |-> write_len_up)
  **  ((( &( "write_len_down" ) )) # UInt  |-> write_len_down)
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx (ca_capacity (state)) (sublist (writeidx) ((ca_capacity (state))) (physical)) )
  **  (UCharArray.seg input_buffer_pre 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_pre write_len_up (Zlength (input_contents)) (sublist (write_len_up) ((Zlength (input_contents))) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((Zlength ((sublist (writeidx) ((ca_capacity (state))) (physical)))) = write_len_up) ”
.

Definition CircularAreaWrite_partial_solve_wit_5_aux := 
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (b_force: Z) (data_length: Z) (write_len_up: Z) (write_len_down: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (input_buffer_pre <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : ((Zlength (input_contents)) > 0)) (PreH5 : (b_force = 0)) (PreH6 : (CircularAreaStateFullResult state 0 )) (PreH7 : (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length )) (PreH8 : (0 < data_length)) (PreH9 : (data_length <= (Zlength (input_contents)))) (PreH10 : (0 <= writeidx)) (PreH11 : (writeidx < (ca_capacity (state)))) (PreH12 : (write_len_up = ((ca_capacity (state)) - writeidx ))) (PreH13 : (write_len_down = (data_length - write_len_up ))) (PreH14 : (write_len_up <= data_length)) (PreH15 : (CircularAreaStateDivideWrDataResult state data_length 1 )) (PreH16 : (CircularAreaDivideWrDataResult writeidx data_length (ca_capacity (state)) 1 )) (PreH17 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx (ca_capacity (state)) (sublist (writeidx) ((ca_capacity (state))) (physical)) )
  **  (UCharArray.seg input_buffer_pre 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_pre write_len_up (Zlength (input_contents)) (sublist (write_len_up) ((Zlength (input_contents))) (input_contents)) )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((data_buffer + (writeidx * sizeof(UCHAR))) = (data_buffer + writeidx )) ” 
  &&  “ (input_buffer_pre = (input_buffer_pre + 0 )) ” 
  &&  “ (write_len_up = ((ca_capacity (state)) - writeidx )) ” 
  &&  “ (write_len_up = (write_len_up - 0 )) ” 
  &&  “ ((Zlength ((sublist (writeidx) ((ca_capacity (state))) (physical)))) = ((ca_capacity (state)) - writeidx )) ” 
  &&  “ ((Zlength ((sublist (0) (write_len_up) (input_contents)))) = (write_len_up - 0 )) ” 
  &&  “ ((Zlength ((sublist (writeidx) ((ca_capacity (state))) (physical)))) = write_len_up) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ ((Zlength (input_contents)) > 0) ” 
  &&  “ (b_force = 0) ” 
  &&  “ (CircularAreaStateFullResult state 0 ) ” 
  &&  “ (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length ) ” 
  &&  “ (0 < data_length) ” 
  &&  “ (data_length <= (Zlength (input_contents))) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ (writeidx < (ca_capacity (state))) ” 
  &&  “ (write_len_up = ((ca_capacity (state)) - writeidx )) ” 
  &&  “ (write_len_down = (data_length - write_len_up )) ” 
  &&  “ (write_len_up <= data_length) ” 
  &&  “ (CircularAreaStateDivideWrDataResult state data_length 1 ) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx data_length (ca_capacity (state)) 1 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  (UCharArray.mixed_seg data_buffer writeidx (ca_capacity (state)) (sublist (writeidx) ((ca_capacity (state))) (physical)) )
  **  (UCharArray.seg input_buffer_pre 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.seg input_buffer_pre write_len_up (Zlength (input_contents)) (sublist (write_len_up) ((Zlength (input_contents))) (input_contents)) )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
.

Definition CircularAreaWrite_partial_solve_wit_5 := CircularAreaWrite_partial_solve_wit_5_pure -> CircularAreaWrite_partial_solve_wit_5_aux.

Definition CircularAreaWrite_partial_solve_wit_6_pure := 
(
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (b_force: Z) (data_length: Z) (write_len_down: Z) (write_len_up: Z) (write_data_length_addr_v: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (input_buffer_pre <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : ((Zlength (input_contents)) > 0)) (PreH5 : (b_force = 0)) (PreH6 : (CircularAreaStateFullResult state 0 )) (PreH7 : (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length )) (PreH8 : (0 <= write_len_down)) (PreH9 : (write_len_down <= writeidx)) (PreH10 : (write_len_up = ((ca_capacity (state)) - writeidx ))) (PreH11 : (write_len_down = (data_length - write_len_up ))) (PreH12 : (CircularAreaStateDivideWrDataResult state data_length 1 )) (PreH13 : (CircularAreaDivideWrDataResult writeidx data_length (ca_capacity (state)) 1 )) (PreH14 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "write_len_down" ) )) # UInt  |-> write_len_down)
  **  ((( &( "write_len_up" ) )) # UInt  |-> write_len_up)
  **  (UCharArray.mixed_seg data_buffer 0 write_len_down (sublist (0) (write_len_down) (physical)) )
  **  (UCharArray.mixed_seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx (ca_capacity (state)) (CircularAreaSomeBytes ((sublist (0) (write_len_up) (input_contents)))) )
  **  (UCharArray.seg input_buffer_pre 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_pre write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_pre data_length (Zlength (input_contents)) (sublist (data_length) ((Zlength (input_contents))) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ (data_buffer = (data_buffer + 0 )) ” 
  &&  “ ((input_buffer_pre + (write_len_up * sizeof(UCHAR))) = (input_buffer_pre + write_len_up )) ” 
  &&  “ (write_len_down = (write_len_down - 0 )) ” 
  &&  “ (write_len_down = (data_length - write_len_up )) ” 
  &&  “ ((Zlength ((sublist (0) (write_len_down) (physical)))) = (write_len_down - 0 )) ” 
  &&  “ ((Zlength ((sublist (write_len_up) (data_length) (input_contents)))) = (data_length - write_len_up )) ” 
  &&  “ ((Zlength ((sublist (0) ((data_length - write_len_up )) (physical)))) = ((data_length - write_len_up ) - 0 )) ”
) \/
(
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (b_force: Z) (data_length: Z) (write_len_down: Z) (write_len_up: Z) (write_data_length_addr_v: Z) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : (write_data_length_addr_v <= UINT_MAX)) (PreH3 : (write_len_up <= UINT_MAX)) (PreH4 : (write_len_down <= UINT_MAX)) (PreH5 : (data_length <= UINT_MAX)) (PreH6 : ((ca_capacity (state)) >= 0)) (PreH7 : (write_data_length_addr_v >= 0)) (PreH8 : (write_len_up >= 0)) (PreH9 : (write_len_down >= 0)) (PreH10 : (data_length >= 0)) (PreH11 : (b_status <= INT_MAX)) (PreH12 : (b_force <= INT_MAX)) (PreH13 : (b_status >= INT_MIN)) (PreH14 : (b_force >= INT_MIN)) (PreH15 : (circular_area_pre <> 0)) (PreH16 : (input_buffer_pre <> 0)) (PreH17 : (data_buffer <> 0)) (PreH18 : ((Zlength (input_contents)) > 0)) (PreH19 : (b_force = 0)) (PreH20 : (CircularAreaStateFullResult state 0 )) (PreH21 : (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length )) (PreH22 : (0 <= write_len_down)) (PreH23 : (write_len_down <= writeidx)) (PreH24 : (write_len_up = ((ca_capacity (state)) - writeidx ))) (PreH25 : (write_len_down = (data_length - write_len_up ))) (PreH26 : (CircularAreaStateDivideWrDataResult state data_length 1 )) (PreH27 : (CircularAreaDivideWrDataResult writeidx data_length (ca_capacity (state)) 1 )) (PreH28 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "write_len_down" ) )) # UInt  |-> write_len_down)
  **  ((( &( "write_len_up" ) )) # UInt  |-> write_len_up)
  **  (UCharArray.mixed_seg data_buffer 0 write_len_down (sublist (0) (write_len_down) (physical)) )
  **  (UCharArray.mixed_seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx (ca_capacity (state)) (CircularAreaSomeBytes ((sublist (0) (write_len_up) (input_contents)))) )
  **  (UCharArray.seg input_buffer_pre 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_pre write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_pre data_length (Zlength (input_contents)) (sublist (data_length) ((Zlength (input_contents))) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((Zlength ((sublist (0) ((data_length - write_len_up )) (physical)))) = ((data_length - write_len_up ) - 0 )) ” 
  &&  “ ((Zlength ((sublist (write_len_up) (data_length) (input_contents)))) = (data_length - write_len_up )) ” 
  &&  “ ((Zlength ((sublist (0) ((data_length - write_len_up )) (physical)))) = ((data_length - write_len_up ) - 0 )) ”
).

Definition CircularAreaWrite_partial_solve_wit_6_pure_split_goal_1 := 
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (b_force: Z) (data_length: Z) (write_len_down: Z) (write_len_up: Z) (write_data_length_addr_v: Z) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : (write_data_length_addr_v <= UINT_MAX)) (PreH3 : (write_len_up <= UINT_MAX)) (PreH4 : (write_len_down <= UINT_MAX)) (PreH5 : (data_length <= UINT_MAX)) (PreH6 : ((ca_capacity (state)) >= 0)) (PreH7 : (write_data_length_addr_v >= 0)) (PreH8 : (write_len_up >= 0)) (PreH9 : (write_len_down >= 0)) (PreH10 : (data_length >= 0)) (PreH11 : (b_status <= INT_MAX)) (PreH12 : (b_force <= INT_MAX)) (PreH13 : (b_status >= INT_MIN)) (PreH14 : (b_force >= INT_MIN)) (PreH15 : (circular_area_pre <> 0)) (PreH16 : (input_buffer_pre <> 0)) (PreH17 : (data_buffer <> 0)) (PreH18 : ((Zlength (input_contents)) > 0)) (PreH19 : (b_force = 0)) (PreH20 : (CircularAreaStateFullResult state 0 )) (PreH21 : (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length )) (PreH22 : (0 <= write_len_down)) (PreH23 : (write_len_down <= writeidx)) (PreH24 : (write_len_up = ((ca_capacity (state)) - writeidx ))) (PreH25 : (write_len_down = (data_length - write_len_up ))) (PreH26 : (CircularAreaStateDivideWrDataResult state data_length 1 )) (PreH27 : (CircularAreaDivideWrDataResult writeidx data_length (ca_capacity (state)) 1 )) (PreH28 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "write_len_down" ) )) # UInt  |-> write_len_down)
  **  ((( &( "write_len_up" ) )) # UInt  |-> write_len_up)
  **  (UCharArray.mixed_seg data_buffer 0 write_len_down (sublist (0) (write_len_down) (physical)) )
  **  (UCharArray.mixed_seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx (ca_capacity (state)) (CircularAreaSomeBytes ((sublist (0) (write_len_up) (input_contents)))) )
  **  (UCharArray.seg input_buffer_pre 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_pre write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_pre data_length (Zlength (input_contents)) (sublist (data_length) ((Zlength (input_contents))) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((Zlength ((sublist (0) ((data_length - write_len_up )) (physical)))) = ((data_length - write_len_up ) - 0 )) ”
.

Definition CircularAreaWrite_partial_solve_wit_6_pure_split_goal_2 := 
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (b_force: Z) (data_length: Z) (write_len_down: Z) (write_len_up: Z) (write_data_length_addr_v: Z) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : (write_data_length_addr_v <= UINT_MAX)) (PreH3 : (write_len_up <= UINT_MAX)) (PreH4 : (write_len_down <= UINT_MAX)) (PreH5 : (data_length <= UINT_MAX)) (PreH6 : ((ca_capacity (state)) >= 0)) (PreH7 : (write_data_length_addr_v >= 0)) (PreH8 : (write_len_up >= 0)) (PreH9 : (write_len_down >= 0)) (PreH10 : (data_length >= 0)) (PreH11 : (b_status <= INT_MAX)) (PreH12 : (b_force <= INT_MAX)) (PreH13 : (b_status >= INT_MIN)) (PreH14 : (b_force >= INT_MIN)) (PreH15 : (circular_area_pre <> 0)) (PreH16 : (input_buffer_pre <> 0)) (PreH17 : (data_buffer <> 0)) (PreH18 : ((Zlength (input_contents)) > 0)) (PreH19 : (b_force = 0)) (PreH20 : (CircularAreaStateFullResult state 0 )) (PreH21 : (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length )) (PreH22 : (0 <= write_len_down)) (PreH23 : (write_len_down <= writeidx)) (PreH24 : (write_len_up = ((ca_capacity (state)) - writeidx ))) (PreH25 : (write_len_down = (data_length - write_len_up ))) (PreH26 : (CircularAreaStateDivideWrDataResult state data_length 1 )) (PreH27 : (CircularAreaDivideWrDataResult writeidx data_length (ca_capacity (state)) 1 )) (PreH28 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "write_len_down" ) )) # UInt  |-> write_len_down)
  **  ((( &( "write_len_up" ) )) # UInt  |-> write_len_up)
  **  (UCharArray.mixed_seg data_buffer 0 write_len_down (sublist (0) (write_len_down) (physical)) )
  **  (UCharArray.mixed_seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx (ca_capacity (state)) (CircularAreaSomeBytes ((sublist (0) (write_len_up) (input_contents)))) )
  **  (UCharArray.seg input_buffer_pre 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_pre write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_pre data_length (Zlength (input_contents)) (sublist (data_length) ((Zlength (input_contents))) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((Zlength ((sublist (write_len_up) (data_length) (input_contents)))) = (data_length - write_len_up )) ”
.

Definition CircularAreaWrite_partial_solve_wit_6_pure_split_goal_3 := 
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (b_force: Z) (data_length: Z) (write_len_down: Z) (write_len_up: Z) (write_data_length_addr_v: Z) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : (write_data_length_addr_v <= UINT_MAX)) (PreH3 : (write_len_up <= UINT_MAX)) (PreH4 : (write_len_down <= UINT_MAX)) (PreH5 : (data_length <= UINT_MAX)) (PreH6 : ((ca_capacity (state)) >= 0)) (PreH7 : (write_data_length_addr_v >= 0)) (PreH8 : (write_len_up >= 0)) (PreH9 : (write_len_down >= 0)) (PreH10 : (data_length >= 0)) (PreH11 : (b_status <= INT_MAX)) (PreH12 : (b_force <= INT_MAX)) (PreH13 : (b_status >= INT_MIN)) (PreH14 : (b_force >= INT_MIN)) (PreH15 : (circular_area_pre <> 0)) (PreH16 : (input_buffer_pre <> 0)) (PreH17 : (data_buffer <> 0)) (PreH18 : ((Zlength (input_contents)) > 0)) (PreH19 : (b_force = 0)) (PreH20 : (CircularAreaStateFullResult state 0 )) (PreH21 : (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length )) (PreH22 : (0 <= write_len_down)) (PreH23 : (write_len_down <= writeidx)) (PreH24 : (write_len_up = ((ca_capacity (state)) - writeidx ))) (PreH25 : (write_len_down = (data_length - write_len_up ))) (PreH26 : (CircularAreaStateDivideWrDataResult state data_length 1 )) (PreH27 : (CircularAreaDivideWrDataResult writeidx data_length (ca_capacity (state)) 1 )) (PreH28 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "write_len_down" ) )) # UInt  |-> write_len_down)
  **  ((( &( "write_len_up" ) )) # UInt  |-> write_len_up)
  **  (UCharArray.mixed_seg data_buffer 0 write_len_down (sublist (0) (write_len_down) (physical)) )
  **  (UCharArray.mixed_seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx (ca_capacity (state)) (CircularAreaSomeBytes ((sublist (0) (write_len_up) (input_contents)))) )
  **  (UCharArray.seg input_buffer_pre 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_pre write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_pre data_length (Zlength (input_contents)) (sublist (data_length) ((Zlength (input_contents))) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((Zlength ((sublist (0) ((data_length - write_len_up )) (physical)))) = ((data_length - write_len_up ) - 0 )) ”
.

Definition CircularAreaWrite_partial_solve_wit_6_aux := 
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (b_force: Z) (data_length: Z) (write_len_down: Z) (write_len_up: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (input_buffer_pre <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : ((Zlength (input_contents)) > 0)) (PreH5 : (b_force = 0)) (PreH6 : (CircularAreaStateFullResult state 0 )) (PreH7 : (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length )) (PreH8 : (0 <= write_len_down)) (PreH9 : (write_len_down <= writeidx)) (PreH10 : (write_len_up = ((ca_capacity (state)) - writeidx ))) (PreH11 : (write_len_down = (data_length - write_len_up ))) (PreH12 : (CircularAreaStateDivideWrDataResult state data_length 1 )) (PreH13 : (CircularAreaDivideWrDataResult writeidx data_length (ca_capacity (state)) 1 )) (PreH14 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (UCharArray.mixed_seg data_buffer 0 write_len_down (sublist (0) (write_len_down) (physical)) )
  **  (UCharArray.mixed_seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx (ca_capacity (state)) (CircularAreaSomeBytes ((sublist (0) (write_len_up) (input_contents)))) )
  **  (UCharArray.seg input_buffer_pre 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_pre write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_pre data_length (Zlength (input_contents)) (sublist (data_length) ((Zlength (input_contents))) (input_contents)) )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ (data_buffer = (data_buffer + 0 )) ” 
  &&  “ ((input_buffer_pre + (write_len_up * sizeof(UCHAR))) = (input_buffer_pre + write_len_up )) ” 
  &&  “ (write_len_down = (write_len_down - 0 )) ” 
  &&  “ (write_len_down = (data_length - write_len_up )) ” 
  &&  “ ((Zlength ((sublist (0) (write_len_down) (physical)))) = (write_len_down - 0 )) ” 
  &&  “ ((Zlength ((sublist (write_len_up) (data_length) (input_contents)))) = (data_length - write_len_up )) ” 
  &&  “ ((Zlength ((sublist (0) ((data_length - write_len_up )) (physical)))) = ((data_length - write_len_up ) - 0 )) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ ((Zlength (input_contents)) > 0) ” 
  &&  “ (b_force = 0) ” 
  &&  “ (CircularAreaStateFullResult state 0 ) ” 
  &&  “ (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length ) ” 
  &&  “ (0 <= write_len_down) ” 
  &&  “ (write_len_down <= writeidx) ” 
  &&  “ (write_len_up = ((ca_capacity (state)) - writeidx )) ” 
  &&  “ (write_len_down = (data_length - write_len_up )) ” 
  &&  “ (CircularAreaStateDivideWrDataResult state data_length 1 ) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx data_length (ca_capacity (state)) 1 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  (UCharArray.mixed_seg data_buffer 0 write_len_down (sublist (0) (write_len_down) (physical)) )
  **  (UCharArray.seg input_buffer_pre write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.mixed_seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx (ca_capacity (state)) (CircularAreaSomeBytes ((sublist (0) (write_len_up) (input_contents)))) )
  **  (UCharArray.seg input_buffer_pre 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_pre data_length (Zlength (input_contents)) (sublist (data_length) ((Zlength (input_contents))) (input_contents)) )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
.

Definition CircularAreaWrite_partial_solve_wit_6 := CircularAreaWrite_partial_solve_wit_6_pure -> CircularAreaWrite_partial_solve_wit_6_aux.

Definition CircularAreaWrite_partial_solve_wit_7_pure := 
(
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (b_force: Z) (data_length: Z) (write_data_length_addr_v: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (input_buffer_pre <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : ((Zlength (input_contents)) > 0)) (PreH5 : (b_force = 0)) (PreH6 : (CircularAreaStateFullResult state 0 )) (PreH7 : (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length )) (PreH8 : (0 < data_length)) (PreH9 : (data_length <= (Zlength (input_contents)))) (PreH10 : (0 <= writeidx)) (PreH11 : ((writeidx + data_length ) <= (ca_capacity (state)))) (PreH12 : (CircularAreaStateDivideWrDataResult state data_length 0 )) (PreH13 : (CircularAreaDivideWrDataResult writeidx data_length (ca_capacity (state)) 0 )) (PreH14 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx (writeidx + data_length ) (sublist (writeidx) ((writeidx + data_length )) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (writeidx + data_length ) (ca_capacity (state)) (sublist ((writeidx + data_length )) ((ca_capacity (state))) (physical)) )
  **  (UCharArray.seg input_buffer_pre 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_pre data_length (Zlength (input_contents)) (sublist (data_length) ((Zlength (input_contents))) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((data_buffer + (writeidx * sizeof(UCHAR))) = (data_buffer + writeidx )) ” 
  &&  “ (input_buffer_pre = (input_buffer_pre + 0 )) ” 
  &&  “ (data_length = ((writeidx + data_length ) - writeidx )) ” 
  &&  “ (data_length = (data_length - 0 )) ” 
  &&  “ ((Zlength ((sublist (0) (data_length) (input_contents)))) = (data_length - 0 )) ” 
  &&  “ ((Zlength ((sublist (writeidx) ((writeidx + data_length )) (physical)))) = ((writeidx + data_length ) - writeidx )) ”
) \/
(
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (b_force: Z) (data_length: Z) (write_data_length_addr_v: Z) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : (write_data_length_addr_v <= UINT_MAX)) (PreH3 : (data_length <= UINT_MAX)) (PreH4 : ((ca_capacity (state)) >= 0)) (PreH5 : (write_data_length_addr_v >= 0)) (PreH6 : (data_length >= 0)) (PreH7 : (b_status <= INT_MAX)) (PreH8 : (b_force <= INT_MAX)) (PreH9 : (b_status >= INT_MIN)) (PreH10 : (b_force >= INT_MIN)) (PreH11 : (circular_area_pre <> 0)) (PreH12 : (input_buffer_pre <> 0)) (PreH13 : (data_buffer <> 0)) (PreH14 : ((Zlength (input_contents)) > 0)) (PreH15 : (b_force = 0)) (PreH16 : (CircularAreaStateFullResult state 0 )) (PreH17 : (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length )) (PreH18 : (0 < data_length)) (PreH19 : (data_length <= (Zlength (input_contents)))) (PreH20 : (0 <= writeidx)) (PreH21 : ((writeidx + data_length ) <= (ca_capacity (state)))) (PreH22 : (CircularAreaStateDivideWrDataResult state data_length 0 )) (PreH23 : (CircularAreaDivideWrDataResult writeidx data_length (ca_capacity (state)) 0 )) (PreH24 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx (writeidx + data_length ) (sublist (writeidx) ((writeidx + data_length )) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (writeidx + data_length ) (ca_capacity (state)) (sublist ((writeidx + data_length )) ((ca_capacity (state))) (physical)) )
  **  (UCharArray.seg input_buffer_pre 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_pre data_length (Zlength (input_contents)) (sublist (data_length) ((Zlength (input_contents))) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((Zlength ((sublist (writeidx) ((writeidx + data_length )) (physical)))) = ((writeidx + data_length ) - writeidx )) ” 
  &&  “ ((Zlength ((sublist (0) (data_length) (input_contents)))) = (data_length - 0 )) ”
).

Definition CircularAreaWrite_partial_solve_wit_7_pure_split_goal_1 := 
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (b_force: Z) (data_length: Z) (write_data_length_addr_v: Z) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : (write_data_length_addr_v <= UINT_MAX)) (PreH3 : (data_length <= UINT_MAX)) (PreH4 : ((ca_capacity (state)) >= 0)) (PreH5 : (write_data_length_addr_v >= 0)) (PreH6 : (data_length >= 0)) (PreH7 : (b_status <= INT_MAX)) (PreH8 : (b_force <= INT_MAX)) (PreH9 : (b_status >= INT_MIN)) (PreH10 : (b_force >= INT_MIN)) (PreH11 : (circular_area_pre <> 0)) (PreH12 : (input_buffer_pre <> 0)) (PreH13 : (data_buffer <> 0)) (PreH14 : ((Zlength (input_contents)) > 0)) (PreH15 : (b_force = 0)) (PreH16 : (CircularAreaStateFullResult state 0 )) (PreH17 : (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length )) (PreH18 : (0 < data_length)) (PreH19 : (data_length <= (Zlength (input_contents)))) (PreH20 : (0 <= writeidx)) (PreH21 : ((writeidx + data_length ) <= (ca_capacity (state)))) (PreH22 : (CircularAreaStateDivideWrDataResult state data_length 0 )) (PreH23 : (CircularAreaDivideWrDataResult writeidx data_length (ca_capacity (state)) 0 )) (PreH24 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx (writeidx + data_length ) (sublist (writeidx) ((writeidx + data_length )) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (writeidx + data_length ) (ca_capacity (state)) (sublist ((writeidx + data_length )) ((ca_capacity (state))) (physical)) )
  **  (UCharArray.seg input_buffer_pre 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_pre data_length (Zlength (input_contents)) (sublist (data_length) ((Zlength (input_contents))) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((Zlength ((sublist (writeidx) ((writeidx + data_length )) (physical)))) = ((writeidx + data_length ) - writeidx )) ”
.

Definition CircularAreaWrite_partial_solve_wit_7_pure_split_goal_2 := 
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (b_force: Z) (data_length: Z) (write_data_length_addr_v: Z) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : (write_data_length_addr_v <= UINT_MAX)) (PreH3 : (data_length <= UINT_MAX)) (PreH4 : ((ca_capacity (state)) >= 0)) (PreH5 : (write_data_length_addr_v >= 0)) (PreH6 : (data_length >= 0)) (PreH7 : (b_status <= INT_MAX)) (PreH8 : (b_force <= INT_MAX)) (PreH9 : (b_status >= INT_MIN)) (PreH10 : (b_force >= INT_MIN)) (PreH11 : (circular_area_pre <> 0)) (PreH12 : (input_buffer_pre <> 0)) (PreH13 : (data_buffer <> 0)) (PreH14 : ((Zlength (input_contents)) > 0)) (PreH15 : (b_force = 0)) (PreH16 : (CircularAreaStateFullResult state 0 )) (PreH17 : (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length )) (PreH18 : (0 < data_length)) (PreH19 : (data_length <= (Zlength (input_contents)))) (PreH20 : (0 <= writeidx)) (PreH21 : ((writeidx + data_length ) <= (ca_capacity (state)))) (PreH22 : (CircularAreaStateDivideWrDataResult state data_length 0 )) (PreH23 : (CircularAreaDivideWrDataResult writeidx data_length (ca_capacity (state)) 0 )) (PreH24 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "b_force" ) )) # Int  |-> b_force)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx (writeidx + data_length ) (sublist (writeidx) ((writeidx + data_length )) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (writeidx + data_length ) (ca_capacity (state)) (sublist ((writeidx + data_length )) ((ca_capacity (state))) (physical)) )
  **  (UCharArray.seg input_buffer_pre 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_pre data_length (Zlength (input_contents)) (sublist (data_length) ((Zlength (input_contents))) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((Zlength ((sublist (0) (data_length) (input_contents)))) = (data_length - 0 )) ”
.

Definition CircularAreaWrite_partial_solve_wit_7_aux := 
forall (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (b_force: Z) (data_length: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (input_buffer_pre <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : ((Zlength (input_contents)) > 0)) (PreH5 : (b_force = 0)) (PreH6 : (CircularAreaStateFullResult state 0 )) (PreH7 : (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length )) (PreH8 : (0 < data_length)) (PreH9 : (data_length <= (Zlength (input_contents)))) (PreH10 : (0 <= writeidx)) (PreH11 : ((writeidx + data_length ) <= (ca_capacity (state)))) (PreH12 : (CircularAreaStateDivideWrDataResult state data_length 0 )) (PreH13 : (CircularAreaDivideWrDataResult writeidx data_length (ca_capacity (state)) 0 )) (PreH14 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer writeidx (writeidx + data_length ) (sublist (writeidx) ((writeidx + data_length )) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (writeidx + data_length ) (ca_capacity (state)) (sublist ((writeidx + data_length )) ((ca_capacity (state))) (physical)) )
  **  (UCharArray.seg input_buffer_pre 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_pre data_length (Zlength (input_contents)) (sublist (data_length) ((Zlength (input_contents))) (input_contents)) )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((data_buffer + (writeidx * sizeof(UCHAR))) = (data_buffer + writeidx )) ” 
  &&  “ (input_buffer_pre = (input_buffer_pre + 0 )) ” 
  &&  “ (data_length = ((writeidx + data_length ) - writeidx )) ” 
  &&  “ (data_length = (data_length - 0 )) ” 
  &&  “ ((Zlength ((sublist (0) (data_length) (input_contents)))) = (data_length - 0 )) ” 
  &&  “ ((Zlength ((sublist (writeidx) ((writeidx + data_length )) (physical)))) = ((writeidx + data_length ) - writeidx )) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ ((Zlength (input_contents)) > 0) ” 
  &&  “ (b_force = 0) ” 
  &&  “ (CircularAreaStateFullResult state 0 ) ” 
  &&  “ (CircularAreaActualWriteLength (ca_capacity (state)) (Zlength (input_contents)) (ca_contents (state)) data_length ) ” 
  &&  “ (0 < data_length) ” 
  &&  “ (data_length <= (Zlength (input_contents))) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ ((writeidx + data_length ) <= (ca_capacity (state))) ” 
  &&  “ (CircularAreaStateDivideWrDataResult state data_length 0 ) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx data_length (ca_capacity (state)) 0 ) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  (UCharArray.mixed_seg data_buffer writeidx (writeidx + data_length ) (sublist (writeidx) ((writeidx + data_length )) (physical)) )
  **  (UCharArray.seg input_buffer_pre 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  (UCharArray.mixed_seg data_buffer 0 writeidx (sublist (0) (writeidx) (physical)) )
  **  (UCharArray.mixed_seg data_buffer (writeidx + data_length ) (ca_capacity (state)) (sublist ((writeidx + data_length )) ((ca_capacity (state))) (physical)) )
  **  (UCharArray.seg input_buffer_pre data_length (Zlength (input_contents)) (sublist (data_length) ((Zlength (input_contents))) (input_contents)) )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
.

Definition CircularAreaWrite_partial_solve_wit_7 := CircularAreaWrite_partial_solve_wit_7_pure -> CircularAreaWrite_partial_solve_wit_7_aux.

Module Type VC_Correct.

Include char_array_Strategy_Correct.

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
Axiom proof_of_CircularAreaGetDataLength_safety_wit_1 : CircularAreaGetDataLength_safety_wit_1.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_2 : CircularAreaGetDataLength_safety_wit_2.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_3 : CircularAreaGetDataLength_safety_wit_3.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_4 : CircularAreaGetDataLength_safety_wit_4.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_5 : CircularAreaGetDataLength_safety_wit_5.
Axiom proof_of_CircularAreaGetDataLength_entail_wit_1 : CircularAreaGetDataLength_entail_wit_1.
Axiom proof_of_CircularAreaGetDataLength_entail_wit_2 : CircularAreaGetDataLength_entail_wit_2.
Axiom proof_of_CircularAreaGetDataLength_return_wit_1 : CircularAreaGetDataLength_return_wit_1.
Axiom proof_of_CircularAreaGetDataLength_return_wit_2 : CircularAreaGetDataLength_return_wit_2.
Axiom proof_of_CircularAreaGetDataLength_partial_solve_wit_1_pure : CircularAreaGetDataLength_partial_solve_wit_1_pure.
Axiom proof_of_CircularAreaGetDataLength_partial_solve_wit_1 : CircularAreaGetDataLength_partial_solve_wit_1.
Axiom proof_of_CircularAreaDivideWrData_safety_wit_1 : CircularAreaDivideWrData_safety_wit_1.
Axiom proof_of_CircularAreaDivideWrData_safety_wit_2 : CircularAreaDivideWrData_safety_wit_2.
Axiom proof_of_CircularAreaDivideWrData_safety_wit_3 : CircularAreaDivideWrData_safety_wit_3.
Axiom proof_of_CircularAreaDivideWrData_safety_wit_4 : CircularAreaDivideWrData_safety_wit_4.
Axiom proof_of_CircularAreaDivideWrData_safety_wit_5 : CircularAreaDivideWrData_safety_wit_5.
Axiom proof_of_CircularAreaDivideWrData_entail_wit_1 : CircularAreaDivideWrData_entail_wit_1.
Axiom proof_of_CircularAreaDivideWrData_return_wit_1 : CircularAreaDivideWrData_return_wit_1.
Axiom proof_of_CircularAreaDivideWrData_return_wit_2 : CircularAreaDivideWrData_return_wit_2.
Axiom proof_of_CircularAreaWrite_safety_wit_1 : CircularAreaWrite_safety_wit_1.
Axiom proof_of_CircularAreaWrite_safety_wit_2 : CircularAreaWrite_safety_wit_2.
Axiom proof_of_CircularAreaWrite_safety_wit_3 : CircularAreaWrite_safety_wit_3.
Axiom proof_of_CircularAreaWrite_safety_wit_4 : CircularAreaWrite_safety_wit_4.
Axiom proof_of_CircularAreaWrite_safety_wit_5 : CircularAreaWrite_safety_wit_5.
Axiom proof_of_CircularAreaWrite_safety_wit_6 : CircularAreaWrite_safety_wit_6.
Axiom proof_of_CircularAreaWrite_safety_wit_7 : CircularAreaWrite_safety_wit_7.
Axiom proof_of_CircularAreaWrite_safety_wit_8 : CircularAreaWrite_safety_wit_8.
Axiom proof_of_CircularAreaWrite_safety_wit_9 : CircularAreaWrite_safety_wit_9.
Axiom proof_of_CircularAreaWrite_safety_wit_10 : CircularAreaWrite_safety_wit_10.
Axiom proof_of_CircularAreaWrite_safety_wit_11 : CircularAreaWrite_safety_wit_11.
Axiom proof_of_CircularAreaWrite_safety_wit_12 : CircularAreaWrite_safety_wit_12.
Axiom proof_of_CircularAreaWrite_safety_wit_13 : CircularAreaWrite_safety_wit_13.
Axiom proof_of_CircularAreaWrite_safety_wit_14 : CircularAreaWrite_safety_wit_14.
Axiom proof_of_CircularAreaWrite_safety_wit_15 : CircularAreaWrite_safety_wit_15.
Axiom proof_of_CircularAreaWrite_safety_wit_16 : CircularAreaWrite_safety_wit_16.
Axiom proof_of_CircularAreaWrite_safety_wit_17 : CircularAreaWrite_safety_wit_17.
Axiom proof_of_CircularAreaWrite_safety_wit_18 : CircularAreaWrite_safety_wit_18.
Axiom proof_of_CircularAreaWrite_safety_wit_19 : CircularAreaWrite_safety_wit_19.
Axiom proof_of_CircularAreaWrite_safety_wit_20 : CircularAreaWrite_safety_wit_20.
Axiom proof_of_CircularAreaWrite_safety_wit_21 : CircularAreaWrite_safety_wit_21.
Axiom proof_of_CircularAreaWrite_safety_wit_22 : CircularAreaWrite_safety_wit_22.
Axiom proof_of_CircularAreaWrite_safety_wit_23 : CircularAreaWrite_safety_wit_23.
Axiom proof_of_CircularAreaWrite_safety_wit_24 : CircularAreaWrite_safety_wit_24.
Axiom proof_of_CircularAreaWrite_safety_wit_25 : CircularAreaWrite_safety_wit_25.
Axiom proof_of_CircularAreaWrite_safety_wit_26 : CircularAreaWrite_safety_wit_26.
Axiom proof_of_CircularAreaWrite_safety_wit_27 : CircularAreaWrite_safety_wit_27.
Axiom proof_of_CircularAreaWrite_safety_wit_28 : CircularAreaWrite_safety_wit_28.
Axiom proof_of_CircularAreaWrite_safety_wit_29 : CircularAreaWrite_safety_wit_29.
Axiom proof_of_CircularAreaWrite_safety_wit_30 : CircularAreaWrite_safety_wit_30.
Axiom proof_of_CircularAreaWrite_entail_wit_1 : CircularAreaWrite_entail_wit_1.
Axiom proof_of_CircularAreaWrite_entail_wit_2 : CircularAreaWrite_entail_wit_2.
Axiom proof_of_CircularAreaWrite_entail_wit_3 : CircularAreaWrite_entail_wit_3.
Axiom proof_of_CircularAreaWrite_entail_wit_4 : CircularAreaWrite_entail_wit_4.
Axiom proof_of_CircularAreaWrite_entail_wit_5_1 : CircularAreaWrite_entail_wit_5_1.
Axiom proof_of_CircularAreaWrite_entail_wit_5_2 : CircularAreaWrite_entail_wit_5_2.
Axiom proof_of_CircularAreaWrite_entail_wit_6 : CircularAreaWrite_entail_wit_6.
Axiom proof_of_CircularAreaWrite_entail_wit_7 : CircularAreaWrite_entail_wit_7.
Axiom proof_of_CircularAreaWrite_entail_wit_8_1 : CircularAreaWrite_entail_wit_8_1.
Axiom proof_of_CircularAreaWrite_entail_wit_8_2 : CircularAreaWrite_entail_wit_8_2.
Axiom proof_of_CircularAreaWrite_return_wit_1 : CircularAreaWrite_return_wit_1.
Axiom proof_of_CircularAreaWrite_return_wit_2 : CircularAreaWrite_return_wit_2.
Axiom proof_of_CircularAreaWrite_return_wit_3 : CircularAreaWrite_return_wit_3.
Axiom proof_of_CircularAreaWrite_return_wit_4 : CircularAreaWrite_return_wit_4.
Axiom proof_of_CircularAreaWrite_return_wit_5 : CircularAreaWrite_return_wit_5.
Axiom proof_of_CircularAreaWrite_return_wit_6 : CircularAreaWrite_return_wit_6.
Axiom proof_of_CircularAreaWrite_return_wit_7 : CircularAreaWrite_return_wit_7.
Axiom proof_of_CircularAreaWrite_partial_solve_wit_1_pure : CircularAreaWrite_partial_solve_wit_1_pure.
Axiom proof_of_CircularAreaWrite_partial_solve_wit_1 : CircularAreaWrite_partial_solve_wit_1.
Axiom proof_of_CircularAreaWrite_partial_solve_wit_2_pure : CircularAreaWrite_partial_solve_wit_2_pure.
Axiom proof_of_CircularAreaWrite_partial_solve_wit_2 : CircularAreaWrite_partial_solve_wit_2.
Axiom proof_of_CircularAreaWrite_partial_solve_wit_3_pure : CircularAreaWrite_partial_solve_wit_3_pure.
Axiom proof_of_CircularAreaWrite_partial_solve_wit_3 : CircularAreaWrite_partial_solve_wit_3.
Axiom proof_of_CircularAreaWrite_partial_solve_wit_4_pure : CircularAreaWrite_partial_solve_wit_4_pure.
Axiom proof_of_CircularAreaWrite_partial_solve_wit_4 : CircularAreaWrite_partial_solve_wit_4.
Axiom proof_of_CircularAreaWrite_partial_solve_wit_5_pure : CircularAreaWrite_partial_solve_wit_5_pure.
Axiom proof_of_CircularAreaWrite_partial_solve_wit_5 : CircularAreaWrite_partial_solve_wit_5.
Axiom proof_of_CircularAreaWrite_partial_solve_wit_6_pure : CircularAreaWrite_partial_solve_wit_6_pure.
Axiom proof_of_CircularAreaWrite_partial_solve_wit_6 : CircularAreaWrite_partial_solve_wit_6.
Axiom proof_of_CircularAreaWrite_partial_solve_wit_7_pure : CircularAreaWrite_partial_solve_wit_7_pure.
Axiom proof_of_CircularAreaWrite_partial_solve_wit_7 : CircularAreaWrite_partial_solve_wit_7.

End VC_Correct.
