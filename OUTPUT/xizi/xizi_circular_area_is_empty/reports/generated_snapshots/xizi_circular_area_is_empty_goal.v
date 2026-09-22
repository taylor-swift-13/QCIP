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
Require Import SimpleC.EE.OUTPUT.xizi.xizi_circular_area_is_empty.source.xizi_circular_area_is_empty_lib.
Require Import QCIPLib.xizi.xizi_circular_area_common.xizi_circular_area_lib.
Local Open Scope sac.
From SimpleC.EE.QCP_demos_LLM Require Import char_array_strategy_goal.
From SimpleC.EE.QCP_demos_LLM Require Import char_array_strategy_proof.

(*----- Function CircularAreaIsEmpty -----*)

Definition CircularAreaIsEmpty_safety_wit_1 := 
forall (circular_area_pre: Z) (state: circular_area_state) (LitMap: (string -> Z)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area_or_null state circular_area_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsEmpty_safety_wit_2 := 
forall (circular_area_pre: Z) (state: circular_area_state) (LitMap: (string -> Z)) (PreH1 : (circular_area_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area_or_null state circular_area_pre )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaIsEmpty_safety_wit_3 := 
forall (circular_area_pre: Z) (state: circular_area_state) (LitMap: (string -> Z)) (PreH1 : (circular_area_pre <> 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (store_circular_area_or_null state circular_area_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsEmpty_safety_wit_4 := 
forall (circular_area_pre: Z) (state: circular_area_state) (LitMap: (string -> Z)) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (b_status = 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (store_stringLit (LitMap (("the circular area is empty
"%string))) ("the circular area is empty
"%string) )
  **  (GlobalStrings_missing LitMap (cons (("the circular area is empty
"%string)) ((@nil string))) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsEmpty_safety_wit_5 := 
forall (circular_area_pre: Z) (state: circular_area_state) (LitMap: (string -> Z)) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (b_status = 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaIsEmpty_safety_wit_6 := 
forall (circular_area_pre: Z) (state: circular_area_state) (LitMap: (string -> Z)) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (readidx <> writeidx)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsEmpty_safety_wit_7 := 
forall (circular_area_pre: Z) (state: circular_area_state) (LitMap: (string -> Z)) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (b_status <> 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsEmpty_entail_wit_1 := 
(
forall (circular_area_pre: Z) (state: circular_area_state) (LitMap: (string -> Z)) (PreH1 : (circular_area_pre <> 0)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area_or_null state circular_area_pre )
|--
  EX (operations: Z)  (readidx: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (data_buffer: Z) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  (GlobalStrings LitMap )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
) \/
(
forall (circular_area_pre: Z) (state: circular_area_state) (LitMap: (string -> Z)) (PreH1 : (circular_area_pre <> 0)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area_or_null state circular_area_pre )
|--
  EX (operations: Z)  (readidx: Z)  (writeidx: Z)  (b_status: Z)  (physical: (@list (@option Z)))  (data_buffer: Z) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  (GlobalStrings LitMap )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
).

Definition CircularAreaIsEmpty_return_wit_1 := 
(
forall (circular_area_pre: Z) (state: circular_area_state) (LitMap: (string -> Z)) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (readidx <> writeidx)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (data_buffer <> 0)) (PreH4 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (CircularAreaStateEmptyResult state 0 ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
) \/
(
forall (circular_area_pre: Z) (state: circular_area_state) (LitMap: (string -> Z)) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (readidx <> writeidx)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
|--
  “ (CircularAreaStateEmptyResult state 0 ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
).

Definition CircularAreaIsEmpty_return_wit_1_split_goal_1 := 
forall (circular_area_pre: Z) (state: circular_area_state) (LitMap: (string -> Z)) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (readidx <> writeidx)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
|--
  “ (CircularAreaStateEmptyResult state 0 ) ”
.

Definition CircularAreaIsEmpty_return_wit_1_split_goal_spatial := 
forall (circular_area_pre: Z) (state: circular_area_state) (LitMap: (string -> Z)) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (readidx <> writeidx)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (data_buffer <> 0)) (PreH8 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
|--
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
.

Definition CircularAreaIsEmpty_return_wit_2 := 
(
forall (circular_area_pre: Z) (state: circular_area_state) (LitMap: (string -> Z)) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (b_status <> 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (CircularAreaStateEmptyResult state 0 ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
) \/
(
forall (circular_area_pre: Z) (state: circular_area_state) (LitMap: (string -> Z)) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status <> 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
|--
  “ (CircularAreaStateEmptyResult state 0 ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
).

Definition CircularAreaIsEmpty_return_wit_2_split_goal_1 := 
forall (circular_area_pre: Z) (state: circular_area_state) (LitMap: (string -> Z)) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status <> 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
|--
  “ (CircularAreaStateEmptyResult state 0 ) ”
.

Definition CircularAreaIsEmpty_return_wit_2_split_goal_spatial := 
forall (circular_area_pre: Z) (state: circular_area_state) (LitMap: (string -> Z)) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status <> 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
|--
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
.

Definition CircularAreaIsEmpty_return_wit_3 := 
(
forall (circular_area_pre: Z) (state: circular_area_state) (LitMap: (string -> Z)) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (b_status = 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (CircularAreaStateEmptyResult state 1 ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
) \/
(
forall (circular_area_pre: Z) (state: circular_area_state) (LitMap: (string -> Z)) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status = 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
|--
  “ (CircularAreaStateEmptyResult state 1 ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
).

Definition CircularAreaIsEmpty_return_wit_3_split_goal_1 := 
forall (circular_area_pre: Z) (state: circular_area_state) (LitMap: (string -> Z)) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status = 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
|--
  “ (CircularAreaStateEmptyResult state 1 ) ”
.

Definition CircularAreaIsEmpty_return_wit_3_split_goal_spatial := 
forall (circular_area_pre: Z) (state: circular_area_state) (LitMap: (string -> Z)) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status = 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
|--
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
.

Definition CircularAreaIsEmpty_return_wit_4 := 
(
forall (circular_area_pre: Z) (state: circular_area_state) (LitMap: (string -> Z)) (PreH1 : (circular_area_pre = 0)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area_or_null state circular_area_pre )
|--
  “ (circular_area_pre = 0) ” 
  &&  “ (1 = 1) ”
  &&  (GlobalStrings LitMap )
) \/
(
forall (circular_area_pre: Z) (state: circular_area_state) (PreH1 : (circular_area_pre = 0)) ,
  (store_circular_area_or_null state circular_area_pre )
|--
  TT && emp 
).

Definition CircularAreaIsEmpty_return_wit_4_split_goal_spatial := 
forall (circular_area_pre: Z) (state: circular_area_state) (PreH1 : (circular_area_pre = 0)) ,
  (store_circular_area_or_null state circular_area_pre )
|--
  TT && emp 
.

Definition CircularAreaIsEmpty_partial_solve_wit_1_pure := 
(
forall (circular_area_pre: Z) (state: circular_area_state) (LitMap: (string -> Z)) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (b_status = 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (store_stringLit (LitMap (("the circular area is empty
"%string))) ("the circular area is empty
"%string) )
  **  (GlobalStrings_missing LitMap (cons (("the circular area is empty
"%string)) ((@nil string))) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
|--
  “ (((LitMap (("the circular area is empty
"%string))) + (0 * sizeof(CHAR))) = (LitMap (("the circular area is empty
"%string)))) ”
) \/
(
forall (circular_area_pre: Z) (state: circular_area_state) (LitMap: (string -> Z)) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status = 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
|--
  “ (((LitMap (("the circular area is empty
"%string))) + (0 * sizeof(CHAR))) = (LitMap (("the circular area is empty
"%string)))) ”
).

Definition CircularAreaIsEmpty_partial_solve_wit_1_pure_split_goal_1 := 
forall (circular_area_pre: Z) (state: circular_area_state) (LitMap: (string -> Z)) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : ((ca_capacity (state)) <= UINT_MAX)) (PreH2 : ((ca_capacity (state)) >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status = 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (data_buffer <> 0)) (PreH9 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
|--
  “ (((LitMap (("the circular area is empty
"%string))) + (0 * sizeof(CHAR))) = (LitMap (("the circular area is empty
"%string)))) ”
.

Definition CircularAreaIsEmpty_partial_solve_wit_1_aux := 
forall (circular_area_pre: Z) (state: circular_area_state) (LitMap: (string -> Z)) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (b_status = 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (data_buffer <> 0)) (PreH5 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (store_stringLit (LitMap (("the circular area is empty
"%string))) ("the circular area is empty
"%string) )
  **  (GlobalStrings_missing LitMap (cons (("the circular area is empty
"%string)) ((@nil string))) )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
|--
  “ (((LitMap (("the circular area is empty
"%string))) + (0 * sizeof(CHAR))) = (LitMap (("the circular area is empty
"%string)))) ” 
  &&  “ (b_status = 0) ” 
  &&  “ (readidx = writeidx) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  (GlobalStrings LitMap )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
.

Definition CircularAreaIsEmpty_partial_solve_wit_1 := CircularAreaIsEmpty_partial_solve_wit_1_pure -> CircularAreaIsEmpty_partial_solve_wit_1_aux.

Module Type VC_Correct.

Include char_array_Strategy_Correct.

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
Axiom proof_of_CircularAreaIsEmpty_return_wit_4 : CircularAreaIsEmpty_return_wit_4.
Axiom proof_of_CircularAreaIsEmpty_partial_solve_wit_1_pure : CircularAreaIsEmpty_partial_solve_wit_1_pure.
Axiom proof_of_CircularAreaIsEmpty_partial_solve_wit_1 : CircularAreaIsEmpty_partial_solve_wit_1.

End VC_Correct.
