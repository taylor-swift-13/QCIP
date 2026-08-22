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
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsFull_safety_wit_2 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (p_head = data_buffer)) (PreH4 : (p_tail = (data_buffer + area_length ))) (PreH5 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ False ”
.

Definition CircularAreaIsFull_safety_wit_3 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (p_head = data_buffer)) (PreH4 : (p_tail = (data_buffer + area_length ))) (PreH5 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsFull_safety_wit_4 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (b_status <> 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (p_head = data_buffer)) (PreH6 : (p_tail = (data_buffer + area_length ))) (PreH7 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (store_stringLit (LitMap (("the circular area is full
"%string))) ("the circular area is full
"%string) )
  **  (GlobalStrings_missing LitMap (cons (("the circular area is full
"%string)) ((@nil string))) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsFull_safety_wit_5 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (b_status <> 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (p_head = data_buffer)) (PreH6 : (p_tail = (data_buffer + area_length ))) (PreH7 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (GlobalStrings LitMap )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaIsFull_safety_wit_6 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (readidx <> writeidx)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (p_head = data_buffer)) (PreH5 : (p_tail = (data_buffer + area_length ))) (PreH6 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsFull_safety_wit_7 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (b_status = 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (p_head = data_buffer)) (PreH6 : (p_tail = (data_buffer + area_length ))) (PreH7 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsFull_return_wit_1 := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (readidx <> writeidx)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (p_head = data_buffer)) (PreH5 : (p_tail = (data_buffer + area_length ))) (PreH6 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaIsFullResult readidx writeidx b_status 0 ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (readidx <> writeidx)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (p_head = data_buffer)) (PreH5 : (p_tail = (data_buffer + area_length ))) (PreH6 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (GlobalStrings LitMap )
|--
  “ (CircularAreaIsFullResult readidx writeidx b_status 0 ) ”
  &&  (GlobalStrings LitMap )
).

Definition CircularAreaIsFull_return_wit_1_split_goal_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (readidx <> writeidx)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (p_head = data_buffer)) (PreH5 : (p_tail = (data_buffer + area_length ))) (PreH6 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (GlobalStrings LitMap )
|--
  “ (CircularAreaIsFullResult readidx writeidx b_status 0 ) ”
.

Definition CircularAreaIsFull_return_wit_1_split_goal_spatial := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (readidx <> writeidx)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (p_head = data_buffer)) (PreH5 : (p_tail = (data_buffer + area_length ))) (PreH6 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
.

Definition CircularAreaIsFull_return_wit_2 := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (b_status = 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (p_head = data_buffer)) (PreH6 : (p_tail = (data_buffer + area_length ))) (PreH7 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaIsFullResult readidx writeidx b_status 0 ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (b_status = 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (p_head = data_buffer)) (PreH6 : (p_tail = (data_buffer + area_length ))) (PreH7 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (GlobalStrings LitMap )
|--
  “ (CircularAreaIsFullResult readidx writeidx b_status 0 ) ”
  &&  (GlobalStrings LitMap )
).

Definition CircularAreaIsFull_return_wit_2_split_goal_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (b_status = 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (p_head = data_buffer)) (PreH6 : (p_tail = (data_buffer + area_length ))) (PreH7 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (GlobalStrings LitMap )
|--
  “ (CircularAreaIsFullResult readidx writeidx b_status 0 ) ”
.

Definition CircularAreaIsFull_return_wit_2_split_goal_spatial := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (b_status = 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (p_head = data_buffer)) (PreH6 : (p_tail = (data_buffer + area_length ))) (PreH7 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
.

Definition CircularAreaIsFull_return_wit_3 := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (b_status <> 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (p_head = data_buffer)) (PreH6 : (p_tail = (data_buffer + area_length ))) (PreH7 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaIsFullResult readidx writeidx b_status 1 ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (b_status <> 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (p_head = data_buffer)) (PreH6 : (p_tail = (data_buffer + area_length ))) (PreH7 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (GlobalStrings LitMap )
|--
  “ (CircularAreaIsFullResult readidx writeidx b_status 1 ) ”
  &&  (GlobalStrings LitMap )
).

Definition CircularAreaIsFull_return_wit_3_split_goal_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (b_status <> 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (p_head = data_buffer)) (PreH6 : (p_tail = (data_buffer + area_length ))) (PreH7 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (GlobalStrings LitMap )
|--
  “ (CircularAreaIsFullResult readidx writeidx b_status 1 ) ”
.

Definition CircularAreaIsFull_return_wit_3_split_goal_spatial := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (b_status <> 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (p_head = data_buffer)) (PreH6 : (p_tail = (data_buffer + area_length ))) (PreH7 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
.

Definition CircularAreaIsFull_partial_solve_wit_1_pure := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (b_status <> 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (p_head = data_buffer)) (PreH6 : (p_tail = (data_buffer + area_length ))) (PreH7 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (store_stringLit (LitMap (("the circular area is full
"%string))) ("the circular area is full
"%string) )
  **  (GlobalStrings_missing LitMap (cons (("the circular area is full
"%string)) ((@nil string))) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (((LitMap (("the circular area is full
"%string))) + (0 * sizeof(CHAR))) = (LitMap (("the circular area is full
"%string)))) ”
) \/
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status <> 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (circular_area_pre <> 0)) (PreH9 : (p_head = data_buffer)) (PreH10 : (p_tail = (data_buffer + area_length ))) (PreH11 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (GlobalStrings LitMap )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (((LitMap (("the circular area is full
"%string))) + (0 * sizeof(CHAR))) = (LitMap (("the circular area is full
"%string)))) ”
).

Definition CircularAreaIsFull_partial_solve_wit_1_pure_split_goal_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (b_status <> 0)) (PreH6 : (readidx = writeidx)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (circular_area_pre <> 0)) (PreH9 : (p_head = data_buffer)) (PreH10 : (p_tail = (data_buffer + area_length ))) (PreH11 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (GlobalStrings LitMap )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (((LitMap (("the circular area is full
"%string))) + (0 * sizeof(CHAR))) = (LitMap (("the circular area is full
"%string)))) ”
.

Definition CircularAreaIsFull_partial_solve_wit_1_aux := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (b_status <> 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (p_head = data_buffer)) (PreH6 : (p_tail = (data_buffer + area_length ))) (PreH7 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (store_stringLit (LitMap (("the circular area is full
"%string))) ("the circular area is full
"%string) )
  **  (GlobalStrings_missing LitMap (cons (("the circular area is full
"%string)) ((@nil string))) )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (((LitMap (("the circular area is full
"%string))) + (0 * sizeof(CHAR))) = (LitMap (("the circular area is full
"%string)))) ” 
  &&  “ (b_status <> 0) ” 
  &&  “ (readidx = writeidx) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
.

Definition CircularAreaIsFull_partial_solve_wit_1 := CircularAreaIsFull_partial_solve_wit_1_pure -> CircularAreaIsFull_partial_solve_wit_1_aux.

(*----- Function CircularAreaGetDataLength -----*)

Definition CircularAreaGetDataLength_safety_wit_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (PreH1 : (circular_area_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaGetDataLength_safety_wit_2 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaGetDataLength_safety_wit_3 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
|--
  “ False ”
.

Definition CircularAreaGetDataLength_safety_wit_4 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (p_head = data_buffer)) (PreH4 : (p_tail = (data_buffer + area_length ))) (PreH5 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ False ”
.

Definition CircularAreaGetDataLength_safety_wit_5 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaGetDataLength_safety_wit_6 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (p_head = data_buffer)) (PreH4 : (p_tail = (data_buffer + area_length ))) (PreH5 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaGetDataLength_safety_wit_7 := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (PreH1 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (retval = 0)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  “ (area_length <> 0) ”
) \/
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (PreH1 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (retval = 0)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  “ (area_length <> 0) ”
).

Definition CircularAreaGetDataLength_safety_wit_7_split_goal_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (PreH1 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (retval = 0)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  “ (area_length <> 0) ”
.

Definition CircularAreaGetDataLength_safety_wit_8 := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (PreH1 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (retval = 0)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  “ ((writeidx - readidx ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (writeidx - readidx )) ”
) \/
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (PreH1 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (retval = 0)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  “ ((writeidx - readidx ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (writeidx - readidx )) ”
).

Definition CircularAreaGetDataLength_safety_wit_8_split_goal_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (PreH1 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (retval = 0)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  “ ((writeidx - readidx ) <= INT_MAX) ”
.

Definition CircularAreaGetDataLength_safety_wit_8_split_goal_2 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (PreH1 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (retval = 0)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  “ ((INT_MIN) <= (writeidx - readidx )) ”
.

Definition CircularAreaGetDataLength_return_wit_1 := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (PreH1 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (retval = 0)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (CircularAreaDataLengthResult readidx writeidx area_length b_status ((unsigned_last_nbits (((unsigned_last_nbits ((writeidx - readidx )) (32)) + area_length )) (32)) % ( area_length ) ) ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (PreH1 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (retval = 0)) ,
  (GlobalStrings LitMap )
|--
  “ (CircularAreaDataLengthResult readidx writeidx area_length b_status ((unsigned_last_nbits (((unsigned_last_nbits ((writeidx - readidx )) (32)) + area_length )) (32)) % ( area_length ) ) ) ”
  &&  (GlobalStrings LitMap )
).

Definition CircularAreaGetDataLength_return_wit_1_split_goal_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (PreH1 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (retval = 0)) ,
  (GlobalStrings LitMap )
|--
  “ (CircularAreaDataLengthResult readidx writeidx area_length b_status ((unsigned_last_nbits (((unsigned_last_nbits ((writeidx - readidx )) (32)) + area_length )) (32)) % ( area_length ) ) ) ”
.

Definition CircularAreaGetDataLength_return_wit_1_split_goal_spatial := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (PreH1 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (retval = 0)) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
.

Definition CircularAreaGetDataLength_return_wit_2 := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (PreH1 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (retval <> 0)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (CircularAreaDataLengthResult readidx writeidx area_length b_status area_length ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (PreH1 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (retval <> 0)) ,
  (GlobalStrings LitMap )
|--
  “ (CircularAreaDataLengthResult readidx writeidx area_length b_status area_length ) ”
  &&  (GlobalStrings LitMap )
).

Definition CircularAreaGetDataLength_return_wit_2_split_goal_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (PreH1 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (retval <> 0)) ,
  (GlobalStrings LitMap )
|--
  “ (CircularAreaDataLengthResult readidx writeidx area_length b_status area_length ) ”
.

Definition CircularAreaGetDataLength_return_wit_2_split_goal_spatial := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (PreH1 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (retval <> 0)) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
.

Definition CircularAreaGetDataLength_return_wit_3 := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = 0)) ,
  (GlobalStrings LitMap )
|--
  “ (circular_area_pre = 0) ” 
  &&  “ (CircularAreaErrorResult 1 ) ”
  &&  (GlobalStrings LitMap )
) \/
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = 0)) ,
  (GlobalStrings LitMap )
|--
  “ (CircularAreaErrorResult 1 ) ”
  &&  (GlobalStrings LitMap )
).

Definition CircularAreaGetDataLength_return_wit_3_split_goal_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = 0)) ,
  (GlobalStrings LitMap )
|--
  “ (CircularAreaErrorResult 1 ) ”
.

Definition CircularAreaGetDataLength_return_wit_3_split_goal_spatial := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = 0)) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
.

Definition CircularAreaGetDataLength_partial_solve_wit_1_pure := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (p_head = data_buffer)) (PreH4 : (p_tail = (data_buffer + area_length ))) (PreH5 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ”
.

Definition CircularAreaGetDataLength_partial_solve_wit_1_aux := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (p_head = data_buffer)) (PreH4 : (p_tail = (data_buffer + area_length ))) (PreH5 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
.

Definition CircularAreaGetDataLength_partial_solve_wit_1 := CircularAreaGetDataLength_partial_solve_wit_1_pure -> CircularAreaGetDataLength_partial_solve_wit_1_aux.

Module Type VC_Correct.


Axiom proof_of_CircularAreaIsFull_safety_wit_1 : CircularAreaIsFull_safety_wit_1.
Axiom proof_of_CircularAreaIsFull_safety_wit_2 : CircularAreaIsFull_safety_wit_2.
Axiom proof_of_CircularAreaIsFull_safety_wit_3 : CircularAreaIsFull_safety_wit_3.
Axiom proof_of_CircularAreaIsFull_safety_wit_4 : CircularAreaIsFull_safety_wit_4.
Axiom proof_of_CircularAreaIsFull_safety_wit_5 : CircularAreaIsFull_safety_wit_5.
Axiom proof_of_CircularAreaIsFull_safety_wit_6 : CircularAreaIsFull_safety_wit_6.
Axiom proof_of_CircularAreaIsFull_safety_wit_7 : CircularAreaIsFull_safety_wit_7.
Axiom proof_of_CircularAreaIsFull_return_wit_1 : CircularAreaIsFull_return_wit_1.
Axiom proof_of_CircularAreaIsFull_return_wit_2 : CircularAreaIsFull_return_wit_2.
Axiom proof_of_CircularAreaIsFull_return_wit_3 : CircularAreaIsFull_return_wit_3.
Axiom proof_of_CircularAreaIsFull_partial_solve_wit_1_pure : CircularAreaIsFull_partial_solve_wit_1_pure.
Axiom proof_of_CircularAreaIsFull_partial_solve_wit_1 : CircularAreaIsFull_partial_solve_wit_1.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_1 : CircularAreaGetDataLength_safety_wit_1.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_2 : CircularAreaGetDataLength_safety_wit_2.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_3 : CircularAreaGetDataLength_safety_wit_3.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_4 : CircularAreaGetDataLength_safety_wit_4.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_5 : CircularAreaGetDataLength_safety_wit_5.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_6 : CircularAreaGetDataLength_safety_wit_6.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_7 : CircularAreaGetDataLength_safety_wit_7.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_8 : CircularAreaGetDataLength_safety_wit_8.
Axiom proof_of_CircularAreaGetDataLength_return_wit_1 : CircularAreaGetDataLength_return_wit_1.
Axiom proof_of_CircularAreaGetDataLength_return_wit_2 : CircularAreaGetDataLength_return_wit_2.
Axiom proof_of_CircularAreaGetDataLength_return_wit_3 : CircularAreaGetDataLength_return_wit_3.
Axiom proof_of_CircularAreaGetDataLength_partial_solve_wit_1_pure : CircularAreaGetDataLength_partial_solve_wit_1_pure.
Axiom proof_of_CircularAreaGetDataLength_partial_solve_wit_1 : CircularAreaGetDataLength_partial_solve_wit_1.

End VC_Correct.
