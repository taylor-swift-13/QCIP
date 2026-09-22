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
Require Import SimpleC.EE.OUTPUT.xizi.xizi_circular_area_release.source.xizi_circular_area_release_lib.
Local Open Scope sac.

(*----- Function CircularAreaRelease -----*)

Definition CircularAreaRelease_safety_wit_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
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

Definition CircularAreaRelease_safety_wit_2 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
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

Definition CircularAreaRelease_safety_wit_3 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
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

Definition CircularAreaRelease_safety_wit_4 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRelease_safety_wit_5 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRelease_safety_wit_6 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRelease_entail_wit_1 := 
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
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) ,
  (GlobalStrings LitMap )
  **  (store_circular_area state circular_area_pre )
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

Definition CircularAreaRelease_return_wit_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
.

Definition CircularAreaRelease_partial_solve_wit_1_pure := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
|--
  “ (data_buffer = data_buffer) ” 
  &&  “ (data_buffer <> 0) ”
.

Definition CircularAreaRelease_partial_solve_wit_1_aux := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
|--
  “ (data_buffer = data_buffer) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  (UCharArray.mixed_full data_buffer (ca_capacity (state)) physical )
  **  (GlobalStrings LitMap )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
.

Definition CircularAreaRelease_partial_solve_wit_1 := CircularAreaRelease_partial_solve_wit_1_pure -> CircularAreaRelease_partial_solve_wit_1_aux.

Definition CircularAreaRelease_partial_solve_wit_2_pure := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (circular_area_pre = circular_area_pre) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (0 = 0) ” 
  &&  “ (0 = 0) ” 
  &&  “ (0 = 0) ” 
  &&  “ (0 = 0) ” 
  &&  “ (0 = 0) ” 
  &&  “ (0 = 0) ”
.

Definition CircularAreaRelease_partial_solve_wit_2_aux := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (state: circular_area_state) (data_buffer: Z) (operations: Z) (readidx: Z) (writeidx: Z) (b_status: Z) (physical: (@list (@option Z))) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical )) ,
  (GlobalStrings LitMap )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (circular_area_pre = circular_area_pre) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (0 = 0) ” 
  &&  “ (0 = 0) ” 
  &&  “ (0 = 0) ” 
  &&  “ (0 = 0) ” 
  &&  “ (0 = 0) ” 
  &&  “ (0 = 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx (ca_capacity (state)) b_status (ca_contents (state)) physical ) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
.

Definition CircularAreaRelease_partial_solve_wit_2 := CircularAreaRelease_partial_solve_wit_2_pure -> CircularAreaRelease_partial_solve_wit_2_aux.

Module Type VC_Correct.


Axiom proof_of_CircularAreaRelease_safety_wit_1 : CircularAreaRelease_safety_wit_1.
Axiom proof_of_CircularAreaRelease_safety_wit_2 : CircularAreaRelease_safety_wit_2.
Axiom proof_of_CircularAreaRelease_safety_wit_3 : CircularAreaRelease_safety_wit_3.
Axiom proof_of_CircularAreaRelease_safety_wit_4 : CircularAreaRelease_safety_wit_4.
Axiom proof_of_CircularAreaRelease_safety_wit_5 : CircularAreaRelease_safety_wit_5.
Axiom proof_of_CircularAreaRelease_safety_wit_6 : CircularAreaRelease_safety_wit_6.
Axiom proof_of_CircularAreaRelease_entail_wit_1 : CircularAreaRelease_entail_wit_1.
Axiom proof_of_CircularAreaRelease_return_wit_1 : CircularAreaRelease_return_wit_1.
Axiom proof_of_CircularAreaRelease_partial_solve_wit_1_pure : CircularAreaRelease_partial_solve_wit_1_pure.
Axiom proof_of_CircularAreaRelease_partial_solve_wit_1 : CircularAreaRelease_partial_solve_wit_1.
Axiom proof_of_CircularAreaRelease_partial_solve_wit_2_pure : CircularAreaRelease_partial_solve_wit_2_pure.
Axiom proof_of_CircularAreaRelease_partial_solve_wit_2 : CircularAreaRelease_partial_solve_wit_2.

End VC_Correct.
