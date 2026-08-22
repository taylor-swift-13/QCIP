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

Definition CircularAreaIsFull_partial_solve_wit_1 := 
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
  “ (b_status <> 0) ” 
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

(*----- Function CircularAreaIsEmpty -----*)

Definition CircularAreaIsEmpty_safety_wit_1 := 
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

Definition CircularAreaIsEmpty_safety_wit_2 := 
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

Definition CircularAreaIsEmpty_safety_wit_3 := 
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

Definition CircularAreaIsEmpty_safety_wit_4 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (b_status = 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (p_head = data_buffer)) (PreH6 : (p_tail = (data_buffer + area_length ))) (PreH7 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (store_stringLit (LitMap (("the circular area is empty
"%string))) ("the circular area is empty
"%string) )
  **  (GlobalStrings_missing LitMap (cons (("the circular area is empty
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

Definition CircularAreaIsEmpty_safety_wit_5 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (b_status = 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (p_head = data_buffer)) (PreH6 : (p_tail = (data_buffer + area_length ))) (PreH7 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
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

Definition CircularAreaIsEmpty_safety_wit_6 := 
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

Definition CircularAreaIsEmpty_safety_wit_7 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (b_status <> 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (p_head = data_buffer)) (PreH6 : (p_tail = (data_buffer + area_length ))) (PreH7 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
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

Definition CircularAreaIsEmpty_return_wit_1 := 
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
  “ (CircularAreaEmptyResult readidx writeidx b_status 0 ) ” 
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
  “ (CircularAreaEmptyResult readidx writeidx b_status 0 ) ”
  &&  (GlobalStrings LitMap )
).

Definition CircularAreaIsEmpty_return_wit_1_split_goal_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (readidx <> writeidx)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (p_head = data_buffer)) (PreH5 : (p_tail = (data_buffer + area_length ))) (PreH6 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (GlobalStrings LitMap )
|--
  “ (CircularAreaEmptyResult readidx writeidx b_status 0 ) ”
.

Definition CircularAreaIsEmpty_return_wit_1_split_goal_spatial := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (readidx <> writeidx)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (p_head = data_buffer)) (PreH5 : (p_tail = (data_buffer + area_length ))) (PreH6 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
.

Definition CircularAreaIsEmpty_return_wit_2 := 
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
  “ (CircularAreaEmptyResult readidx writeidx b_status 0 ) ” 
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
  “ (CircularAreaEmptyResult readidx writeidx b_status 0 ) ”
  &&  (GlobalStrings LitMap )
).

Definition CircularAreaIsEmpty_return_wit_2_split_goal_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (b_status <> 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (p_head = data_buffer)) (PreH6 : (p_tail = (data_buffer + area_length ))) (PreH7 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (GlobalStrings LitMap )
|--
  “ (CircularAreaEmptyResult readidx writeidx b_status 0 ) ”
.

Definition CircularAreaIsEmpty_return_wit_2_split_goal_spatial := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (b_status <> 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (p_head = data_buffer)) (PreH6 : (p_tail = (data_buffer + area_length ))) (PreH7 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
.

Definition CircularAreaIsEmpty_return_wit_3 := 
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
  “ (CircularAreaEmptyResult readidx writeidx b_status 1 ) ” 
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
  “ (CircularAreaEmptyResult readidx writeidx b_status 1 ) ”
  &&  (GlobalStrings LitMap )
).

Definition CircularAreaIsEmpty_return_wit_3_split_goal_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (b_status = 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (p_head = data_buffer)) (PreH6 : (p_tail = (data_buffer + area_length ))) (PreH7 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (GlobalStrings LitMap )
|--
  “ (CircularAreaEmptyResult readidx writeidx b_status 1 ) ”
.

Definition CircularAreaIsEmpty_return_wit_3_split_goal_spatial := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (b_status = 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (p_head = data_buffer)) (PreH6 : (p_tail = (data_buffer + area_length ))) (PreH7 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
.

Definition CircularAreaIsEmpty_partial_solve_wit_1 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (b_status = 0)) (PreH2 : (readidx = writeidx)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (p_head = data_buffer)) (PreH6 : (p_tail = (data_buffer + area_length ))) (PreH7 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (store_stringLit (LitMap (("the circular area is empty
"%string))) ("the circular area is empty
"%string) )
  **  (GlobalStrings_missing LitMap (cons (("the circular area is empty
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
  “ (b_status = 0) ” 
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

(*----- Function CircularAreaGetDataLength -----*)

Definition CircularAreaGetDataLength_safety_wit_1 := 
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

Definition CircularAreaGetDataLength_safety_wit_2 := 
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

Definition CircularAreaGetDataLength_safety_wit_3 := 
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

Definition CircularAreaGetDataLength_safety_wit_4 := 
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

Definition CircularAreaGetDataLength_safety_wit_4_split_goal_1 := 
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

Definition CircularAreaGetDataLength_safety_wit_5 := 
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

Definition CircularAreaGetDataLength_safety_wit_5_split_goal_1 := 
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

Definition CircularAreaGetDataLength_safety_wit_5_split_goal_2 := 
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
  “ (CircularAreaDataLengthResult readidx writeidx area_length b_status ((unsigned_last_nbits (((unsigned_last_nbits ((writeidx - readidx )) (32)) + area_length )) (32)) % ( area_length ) ) ) ” 
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
  “ (CircularAreaDataLengthResult readidx writeidx area_length b_status area_length ) ” 
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

(*----- Function CircularAreaDivideRdData -----*)

Definition CircularAreaDivideRdData_safety_wit_1 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (0 <= data_length_pre)) (PreH3 : (data_length_pre <= area_length)) (PreH4 : ((readidx + data_length_pre ) <= UINT_MAX)) (PreH5 : (p_head = data_buffer)) (PreH6 : (p_tail = (data_buffer + area_length ))) (PreH7 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
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

Definition CircularAreaDivideRdData_safety_wit_2 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (0 <= data_length_pre)) (PreH4 : (data_length_pre <= area_length)) (PreH5 : ((readidx + data_length_pre ) <= UINT_MAX)) (PreH6 : (p_head = data_buffer)) (PreH7 : (p_tail = (data_buffer + area_length ))) (PreH8 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
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

Definition CircularAreaDivideRdData_safety_wit_3 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (0 <= data_length_pre)) (PreH4 : (data_length_pre <= area_length)) (PreH5 : ((readidx + data_length_pre ) <= UINT_MAX)) (PreH6 : (p_head = data_buffer)) (PreH7 : (p_tail = (data_buffer + area_length ))) (PreH8 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
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

Definition CircularAreaDivideRdData_safety_wit_4 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + data_length_pre )) (32)) <= area_length)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 <= data_length_pre)) (PreH5 : (data_length_pre <= area_length)) (PreH6 : ((readidx + data_length_pre ) <= UINT_MAX)) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
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

Definition CircularAreaDivideRdData_safety_wit_5 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + data_length_pre )) (32)) > area_length)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 <= data_length_pre)) (PreH5 : (data_length_pre <= area_length)) (PreH6 : ((readidx + data_length_pre ) <= UINT_MAX)) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
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
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaDivideRdData_return_wit_1 := 
(
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + data_length_pre )) (32)) > area_length)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 <= data_length_pre)) (PreH5 : (data_length_pre <= area_length)) (PreH6 : ((readidx + data_length_pre ) <= UINT_MAX)) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
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
  “ (CircularAreaDivideRdDataResult readidx data_length_pre area_length 1 ) ” 
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
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + data_length_pre )) (32)) > area_length)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 <= data_length_pre)) (PreH5 : (data_length_pre <= area_length)) (PreH6 : ((readidx + data_length_pre ) <= UINT_MAX)) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (GlobalStrings LitMap )
|--
  “ (CircularAreaDivideRdDataResult readidx data_length_pre area_length 1 ) ”
  &&  (GlobalStrings LitMap )
).

Definition CircularAreaDivideRdData_return_wit_1_split_goal_1 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + data_length_pre )) (32)) > area_length)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 <= data_length_pre)) (PreH5 : (data_length_pre <= area_length)) (PreH6 : ((readidx + data_length_pre ) <= UINT_MAX)) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (GlobalStrings LitMap )
|--
  “ (CircularAreaDivideRdDataResult readidx data_length_pre area_length 1 ) ”
.

Definition CircularAreaDivideRdData_return_wit_1_split_goal_spatial := 
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + data_length_pre )) (32)) > area_length)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 <= data_length_pre)) (PreH5 : (data_length_pre <= area_length)) (PreH6 : ((readidx + data_length_pre ) <= UINT_MAX)) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
.

Definition CircularAreaDivideRdData_return_wit_2 := 
(
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + data_length_pre )) (32)) <= area_length)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 <= data_length_pre)) (PreH5 : (data_length_pre <= area_length)) (PreH6 : ((readidx + data_length_pre ) <= UINT_MAX)) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
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
  “ (CircularAreaDivideRdDataResult readidx data_length_pre area_length 0 ) ” 
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
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + data_length_pre )) (32)) <= area_length)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 <= data_length_pre)) (PreH5 : (data_length_pre <= area_length)) (PreH6 : ((readidx + data_length_pre ) <= UINT_MAX)) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (GlobalStrings LitMap )
|--
  “ (CircularAreaDivideRdDataResult readidx data_length_pre area_length 0 ) ”
  &&  (GlobalStrings LitMap )
).

Definition CircularAreaDivideRdData_return_wit_2_split_goal_1 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + data_length_pre )) (32)) <= area_length)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 <= data_length_pre)) (PreH5 : (data_length_pre <= area_length)) (PreH6 : ((readidx + data_length_pre ) <= UINT_MAX)) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (GlobalStrings LitMap )
|--
  “ (CircularAreaDivideRdDataResult readidx data_length_pre area_length 0 ) ”
.

Definition CircularAreaDivideRdData_return_wit_2_split_goal_spatial := 
forall (data_length_pre: Z) (circular_area_pre: Z) (LitMap: (string -> Z)) (buffer_contents: (@list Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (readidx) (32)) + data_length_pre )) (32)) <= area_length)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 <= data_length_pre)) (PreH5 : (data_length_pre <= area_length)) (PreH6 : ((readidx + data_length_pre ) <= UINT_MAX)) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
.

(*----- Function CircularAreaRead -----*)

Definition CircularAreaRead_safety_wit_1 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (LitMap: (string -> Z)) (PreH1 : (circular_area_pre = ca0)) (PreH2 : (output_buffer_pre = out0)) (PreH3 : (data_length_pre = requested)) (PreH4 : (0 <= requested)) (PreH5 : (requested <= UINT_MAX)) (PreH6 : (ca0 = 0)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRead_safety_wit_2 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre = ca0)) (PreH2 : (output_buffer_pre = out0)) (PreH3 : (data_length_pre = requested)) (PreH4 : (0 <= requested)) (PreH5 : (requested <= UINT_MAX)) (PreH6 : (ca0 <> 0)) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (out0 = 0)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
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

Definition CircularAreaRead_safety_wit_3 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre = ca0)) (PreH2 : (output_buffer_pre = out0)) (PreH3 : (data_length_pre = requested)) (PreH4 : (0 <= requested)) (PreH5 : (requested <= UINT_MAX)) (PreH6 : (ca0 <> 0)) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (out0 <> 0)) (PreH11 : (requested <= output_capacity)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRead_safety_wit_4 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (LitMap: (string -> Z)) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (output_buffer_pre = out0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (0 <= requested)) (PreH6 : (requested <= UINT_MAX)) (PreH7 : (ca0 = 0)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
|--
  “ False ”
.

Definition CircularAreaRead_safety_wit_5 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (output_buffer_pre = out0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (0 <= requested)) (PreH6 : (requested <= UINT_MAX)) (PreH7 : (ca0 <> 0)) (PreH8 : (p_head = data_buffer)) (PreH9 : (p_tail = (data_buffer + area_length ))) (PreH10 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH11 : (out0 = 0)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
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

Definition CircularAreaRead_safety_wit_6 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (output_buffer_pre = out0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (0 <= requested)) (PreH6 : (requested <= UINT_MAX)) (PreH7 : (ca0 <> 0)) (PreH8 : (p_head = data_buffer)) (PreH9 : (p_tail = (data_buffer + area_length ))) (PreH10 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH11 : (out0 <> 0)) (PreH12 : (requested <= output_capacity)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ False ”
.

Definition CircularAreaRead_safety_wit_7 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (LitMap: (string -> Z)) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (output_buffer_pre = out0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (0 <= requested)) (PreH6 : (requested <= UINT_MAX)) (PreH7 : (ca0 = 0)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (GlobalStrings LitMap )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaRead_safety_wit_8 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (output_buffer_pre = out0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (0 <= requested)) (PreH6 : (requested <= UINT_MAX)) (PreH7 : (ca0 <> 0)) (PreH8 : (p_head = data_buffer)) (PreH9 : (p_tail = (data_buffer + area_length ))) (PreH10 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH11 : (out0 = 0)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
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

Definition CircularAreaRead_safety_wit_9 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (output_buffer_pre = out0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (0 <= requested)) (PreH6 : (requested <= UINT_MAX)) (PreH7 : (ca0 <> 0)) (PreH8 : (p_head = data_buffer)) (PreH9 : (p_tail = (data_buffer + area_length ))) (PreH10 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH11 : (out0 <> 0)) (PreH12 : (requested <= output_capacity)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRead_safety_wit_10 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (output_buffer_pre = out0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (0 <= requested)) (PreH6 : (requested <= UINT_MAX)) (PreH7 : (ca0 <> 0)) (PreH8 : (p_head = data_buffer)) (PreH9 : (p_tail = (data_buffer + area_length ))) (PreH10 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH11 : (out0 = 0)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
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

Definition CircularAreaRead_safety_wit_11 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (output_buffer_pre = out0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (0 <= requested)) (PreH6 : (requested <= UINT_MAX)) (PreH7 : (ca0 <> 0)) (PreH8 : (p_head = data_buffer)) (PreH9 : (p_tail = (data_buffer + area_length ))) (PreH10 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH11 : (out0 <> 0)) (PreH12 : (requested <= output_capacity)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRead_safety_wit_12 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (output_buffer_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = ca0)) (PreH4 : (output_buffer_pre = out0)) (PreH5 : (data_length_pre = requested)) (PreH6 : (0 <= requested)) (PreH7 : (requested <= UINT_MAX)) (PreH8 : (ca0 <> 0)) (PreH9 : (p_head = data_buffer)) (PreH10 : (p_tail = (data_buffer + area_length ))) (PreH11 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH12 : (out0 = 0)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
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

Definition CircularAreaRead_safety_wit_13 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (output_buffer_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = ca0)) (PreH4 : (output_buffer_pre = out0)) (PreH5 : (data_length_pre = requested)) (PreH6 : (0 <= requested)) (PreH7 : (requested <= UINT_MAX)) (PreH8 : (ca0 <> 0)) (PreH9 : (p_head = data_buffer)) (PreH10 : (p_tail = (data_buffer + area_length ))) (PreH11 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH12 : (out0 <> 0)) (PreH13 : (requested <= output_capacity)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ False ”
.

Definition CircularAreaRead_safety_wit_14 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (output_buffer_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = ca0)) (PreH4 : (output_buffer_pre = out0)) (PreH5 : (data_length_pre = requested)) (PreH6 : (0 <= requested)) (PreH7 : (requested <= UINT_MAX)) (PreH8 : (ca0 <> 0)) (PreH9 : (p_head = data_buffer)) (PreH10 : (p_tail = (data_buffer + area_length ))) (PreH11 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH12 : (out0 = 0)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
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
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaRead_safety_wit_15 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (output_buffer_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = ca0)) (PreH4 : (output_buffer_pre = out0)) (PreH5 : (data_length_pre = requested)) (PreH6 : (0 <= requested)) (PreH7 : (requested <= UINT_MAX)) (PreH8 : (ca0 <> 0)) (PreH9 : (p_head = data_buffer)) (PreH10 : (p_tail = (data_buffer + area_length ))) (PreH11 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH12 : (out0 <> 0)) (PreH13 : (requested <= output_capacity)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRead_safety_wit_16 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (0 <= data_length_pre)) (PreH2 : (data_length_pre <= UINT_MAX)) (PreH3 : (area_length <= UINT_MAX)) (PreH4 : (area_length >= 0)) (PreH5 : (b_status <= INT_MAX)) (PreH6 : (b_status >= INT_MIN)) (PreH7 : (output_buffer_pre <> 0)) (PreH8 : (circular_area_pre <> 0)) (PreH9 : (circular_area_pre = ca0)) (PreH10 : (output_buffer_pre = out0)) (PreH11 : (data_length_pre = requested)) (PreH12 : (0 <= requested)) (PreH13 : (requested <= UINT_MAX)) (PreH14 : (ca0 <> 0)) (PreH15 : (p_head = data_buffer)) (PreH16 : (p_tail = (data_buffer + area_length ))) (PreH17 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH18 : (out0 <> 0)) (PreH19 : (requested <= output_capacity)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRead_safety_wit_17 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (data_length_pre <= 0)) (PreH2 : (0 <= data_length_pre)) (PreH3 : (data_length_pre <= UINT_MAX)) (PreH4 : (area_length <= UINT_MAX)) (PreH5 : (area_length >= 0)) (PreH6 : (b_status <= INT_MAX)) (PreH7 : (b_status >= INT_MIN)) (PreH8 : (output_buffer_pre <> 0)) (PreH9 : (circular_area_pre <> 0)) (PreH10 : (circular_area_pre = ca0)) (PreH11 : (output_buffer_pre = out0)) (PreH12 : (data_length_pre = requested)) (PreH13 : (0 <= requested)) (PreH14 : (requested <= UINT_MAX)) (PreH15 : (ca0 <> 0)) (PreH16 : (p_head = data_buffer)) (PreH17 : (p_tail = (data_buffer + area_length ))) (PreH18 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH19 : (out0 <> 0)) (PreH20 : (requested <= output_capacity)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaRead_safety_wit_18 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (data_length_pre > 0)) (PreH2 : (0 <= data_length_pre)) (PreH3 : (data_length_pre <= UINT_MAX)) (PreH4 : (area_length <= UINT_MAX)) (PreH5 : (area_length >= 0)) (PreH6 : (b_status <= INT_MAX)) (PreH7 : (b_status >= INT_MIN)) (PreH8 : (output_buffer_pre <> 0)) (PreH9 : (circular_area_pre <> 0)) (PreH10 : (circular_area_pre = ca0)) (PreH11 : (output_buffer_pre = out0)) (PreH12 : (data_length_pre = requested)) (PreH13 : (0 <= requested)) (PreH14 : (requested <= UINT_MAX)) (PreH15 : (ca0 <> 0)) (PreH16 : (p_head = data_buffer)) (PreH17 : (p_tail = (data_buffer + area_length ))) (PreH18 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH19 : (out0 <> 0)) (PreH20 : (requested <= output_capacity)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRead_safety_wit_19 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (requested > 0)) (PreH4 : (requested <= output_capacity)) (PreH5 : (CircularAreaEmptyResult readidx writeidx b_status 1 )) (PreH6 : (p_head = data_buffer)) (PreH7 : (p_tail = (data_buffer + area_length ))) (PreH8 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> requested)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  (UCharArray.full out0 output_capacity output_before )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaRead_safety_wit_20 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (retval: Z) (PreH1 : (retval = out0)) (PreH2 : (ca0 <> 0)) (PreH3 : (out0 <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaEmptyResult readidx writeidx b_status 0 )) (PreH6 : (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length )) (PreH7 : (0 < data_length)) (PreH8 : (data_length <= output_capacity)) (PreH9 : (0 <= readidx)) (PreH10 : ((readidx + data_length ) <= area_length)) (PreH11 : (CircularAreaDivideRdDataResult readidx data_length area_length 0 )) (PreH12 : (p_head = data_buffer)) (PreH13 : (p_tail = (data_buffer + area_length ))) (PreH14 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (UCharArray.seg out0 0 data_length (sublist (readidx) ((readidx + data_length )) (buffer_contents)) )
  **  (UCharArray.seg data_buffer readidx (readidx + data_length ) (sublist (readidx) ((readidx + data_length )) (buffer_contents)) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 readidx (sublist (0) (readidx) (buffer_contents)) )
  **  (UCharArray.seg data_buffer (readidx + data_length ) area_length (sublist ((readidx + data_length )) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (area_length <> 0) ”
.

Definition CircularAreaRead_safety_wit_21 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_down: Z) (read_len_up: Z) (retval: Z) (PreH1 : (retval = (out0 + (read_len_up * sizeof(UCHAR))))) (PreH2 : (ca0 <> 0)) (PreH3 : (out0 <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaEmptyResult readidx writeidx b_status 0 )) (PreH6 : (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length )) (PreH7 : (0 < data_length)) (PreH8 : (data_length <= output_capacity)) (PreH9 : (0 <= read_len_down)) (PreH10 : (read_len_down <= readidx)) (PreH11 : (read_len_up = (area_length - readidx ))) (PreH12 : (read_len_down = (data_length - read_len_up ))) (PreH13 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH14 : (p_head = data_buffer)) (PreH15 : (p_tail = (data_buffer + area_length ))) (PreH16 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (UCharArray.seg out0 read_len_up data_length (sublist (0) (read_len_down) (buffer_contents)) )
  **  (UCharArray.seg data_buffer 0 read_len_down (sublist (0) (read_len_down) (buffer_contents)) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (buffer_contents)) )
  **  (UCharArray.seg data_buffer readidx area_length (sublist (readidx) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 0 read_len_up (sublist (readidx) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> (unsigned_last_nbits (read_len_down) (8)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRead_safety_wit_22 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (retval: Z) (PreH1 : (retval = out0)) (PreH2 : (ca0 <> 0)) (PreH3 : (out0 <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaEmptyResult readidx writeidx b_status 0 )) (PreH6 : (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length )) (PreH7 : (0 < data_length)) (PreH8 : (data_length <= output_capacity)) (PreH9 : (0 <= readidx)) (PreH10 : ((readidx + data_length ) <= area_length)) (PreH11 : (CircularAreaDivideRdDataResult readidx data_length area_length 0 )) (PreH12 : (p_head = data_buffer)) (PreH13 : (p_tail = (data_buffer + area_length ))) (PreH14 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (UCharArray.seg out0 0 data_length (sublist (readidx) ((readidx + data_length )) (buffer_contents)) )
  **  (UCharArray.seg data_buffer readidx (readidx + data_length ) (sublist (readidx) ((readidx + data_length )) (buffer_contents)) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 readidx (sublist (0) (readidx) (buffer_contents)) )
  **  (UCharArray.seg data_buffer (readidx + data_length ) area_length (sublist ((readidx + data_length )) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> (unsigned_last_nbits (((readidx + data_length ) % ( area_length ) )) (8)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRead_safety_wit_23 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_down: Z) (read_len_up: Z) (retval: Z) (PreH1 : (retval = (out0 + (read_len_up * sizeof(UCHAR))))) (PreH2 : (ca0 <> 0)) (PreH3 : (out0 <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaEmptyResult readidx writeidx b_status 0 )) (PreH6 : (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length )) (PreH7 : (0 < data_length)) (PreH8 : (data_length <= output_capacity)) (PreH9 : (0 <= read_len_down)) (PreH10 : (read_len_down <= readidx)) (PreH11 : (read_len_up = (area_length - readidx ))) (PreH12 : (read_len_down = (data_length - read_len_up ))) (PreH13 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH14 : (p_head = data_buffer)) (PreH15 : (p_tail = (data_buffer + area_length ))) (PreH16 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (UCharArray.seg out0 read_len_up data_length (sublist (0) (read_len_down) (buffer_contents)) )
  **  (UCharArray.seg data_buffer 0 read_len_down (sublist (0) (read_len_down) (buffer_contents)) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (buffer_contents)) )
  **  (UCharArray.seg data_buffer readidx area_length (sublist (readidx) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 0 read_len_up (sublist (readidx) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> (unsigned_last_nbits (read_len_down) (8)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRead_safety_wit_24 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (retval: Z) (PreH1 : (retval = out0)) (PreH2 : (ca0 <> 0)) (PreH3 : (out0 <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaEmptyResult readidx writeidx b_status 0 )) (PreH6 : (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length )) (PreH7 : (0 < data_length)) (PreH8 : (data_length <= output_capacity)) (PreH9 : (0 <= readidx)) (PreH10 : ((readidx + data_length ) <= area_length)) (PreH11 : (CircularAreaDivideRdDataResult readidx data_length area_length 0 )) (PreH12 : (p_head = data_buffer)) (PreH13 : (p_tail = (data_buffer + area_length ))) (PreH14 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (UCharArray.seg out0 0 data_length (sublist (readidx) ((readidx + data_length )) (buffer_contents)) )
  **  (UCharArray.seg data_buffer readidx (readidx + data_length ) (sublist (readidx) ((readidx + data_length )) (buffer_contents)) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 readidx (sublist (0) (readidx) (buffer_contents)) )
  **  (UCharArray.seg data_buffer (readidx + data_length ) area_length (sublist ((readidx + data_length )) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> (unsigned_last_nbits (((readidx + data_length ) % ( area_length ) )) (8)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRead_entail_wit_1 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (output_buffer_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = ca0)) (PreH4 : (output_buffer_pre = out0)) (PreH5 : (data_length_pre = requested)) (PreH6 : (0 <= requested)) (PreH7 : (requested <= UINT_MAX)) (PreH8 : (ca0 <> 0)) (PreH9 : (p_head = data_buffer)) (PreH10 : (p_tail = (data_buffer + area_length ))) (PreH11 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH12 : (out0 <> 0)) (PreH13 : (requested <= output_capacity)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= UINT_MAX) ” 
  &&  “ (area_length <= UINT_MAX) ” 
  &&  “ (area_length >= 0) ” 
  &&  “ (b_status <= INT_MAX) ” 
  &&  “ (b_status >= INT_MIN) ” 
  &&  “ (output_buffer_pre <> 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre = ca0) ” 
  &&  “ (output_buffer_pre = out0) ” 
  &&  “ (data_length_pre = requested) ” 
  &&  “ (0 <= requested) ” 
  &&  “ (requested <= UINT_MAX) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (requested <= output_capacity) ”
  &&  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
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
  **  (UCharArray.full out0 output_capacity output_before )
.

Definition CircularAreaRead_entail_wit_2 := 
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (PreH1 : (CircularAreaEmptyResult readidx writeidx b_status retval )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (data_length_pre > 0)) (PreH6 : (0 <= data_length_pre)) (PreH7 : (data_length_pre <= UINT_MAX)) (PreH8 : (area_length <= UINT_MAX)) (PreH9 : (area_length >= 0)) (PreH10 : (b_status <= INT_MAX)) (PreH11 : (b_status >= INT_MIN)) (PreH12 : (output_buffer_pre <> 0)) (PreH13 : (circular_area_pre <> 0)) (PreH14 : (circular_area_pre = ca0)) (PreH15 : (output_buffer_pre = out0)) (PreH16 : (data_length_pre = requested)) (PreH17 : (0 <= requested)) (PreH18 : (requested <= UINT_MAX)) (PreH19 : (ca0 <> 0)) (PreH20 : (p_head = data_buffer)) (PreH21 : (p_tail = (data_buffer + area_length ))) (PreH22 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH23 : (out0 <> 0)) (PreH24 : (requested <= output_capacity)) (PreH25 : (retval <> 0)) ,
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
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (requested <= output_capacity) ” 
  &&  “ (CircularAreaEmptyResult readidx writeidx b_status 1 ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> requested)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  (UCharArray.full out0 output_capacity output_before )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (PreH1 : (CircularAreaEmptyResult readidx writeidx b_status retval )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (data_length_pre > 0)) (PreH6 : (0 <= data_length_pre)) (PreH7 : (data_length_pre <= UINT_MAX)) (PreH8 : (area_length <= UINT_MAX)) (PreH9 : (area_length >= 0)) (PreH10 : (b_status <= INT_MAX)) (PreH11 : (b_status >= INT_MIN)) (PreH12 : (output_buffer_pre <> 0)) (PreH13 : (circular_area_pre <> 0)) (PreH14 : (circular_area_pre = ca0)) (PreH15 : (output_buffer_pre = out0)) (PreH16 : (data_length_pre = requested)) (PreH17 : (0 <= requested)) (PreH18 : (requested <= UINT_MAX)) (PreH19 : (ca0 <> 0)) (PreH20 : (p_head = data_buffer)) (PreH21 : (p_tail = (data_buffer + area_length ))) (PreH22 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH23 : (out0 <> 0)) (PreH24 : (requested <= output_capacity)) (PreH25 : (retval <> 0)) ,
  (GlobalStrings LitMap )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaEmptyResult readidx writeidx b_status 1 ) ”
  &&  (GlobalStrings LitMap )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
).

Definition CircularAreaRead_entail_wit_2_split_goal_1 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (PreH1 : (CircularAreaEmptyResult readidx writeidx b_status retval )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (data_length_pre > 0)) (PreH6 : (0 <= data_length_pre)) (PreH7 : (data_length_pre <= UINT_MAX)) (PreH8 : (area_length <= UINT_MAX)) (PreH9 : (area_length >= 0)) (PreH10 : (b_status <= INT_MAX)) (PreH11 : (b_status >= INT_MIN)) (PreH12 : (output_buffer_pre <> 0)) (PreH13 : (circular_area_pre <> 0)) (PreH14 : (circular_area_pre = ca0)) (PreH15 : (output_buffer_pre = out0)) (PreH16 : (data_length_pre = requested)) (PreH17 : (0 <= requested)) (PreH18 : (requested <= UINT_MAX)) (PreH19 : (ca0 <> 0)) (PreH20 : (p_head = data_buffer)) (PreH21 : (p_tail = (data_buffer + area_length ))) (PreH22 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH23 : (out0 <> 0)) (PreH24 : (requested <= output_capacity)) (PreH25 : (retval <> 0)) ,
  (GlobalStrings LitMap )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaEmptyResult readidx writeidx b_status 1 ) ”
.

Definition CircularAreaRead_entail_wit_2_split_goal_spatial := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (PreH1 : (CircularAreaEmptyResult readidx writeidx b_status retval )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (data_length_pre > 0)) (PreH6 : (0 <= data_length_pre)) (PreH7 : (data_length_pre <= UINT_MAX)) (PreH8 : (area_length <= UINT_MAX)) (PreH9 : (area_length >= 0)) (PreH10 : (b_status <= INT_MAX)) (PreH11 : (b_status >= INT_MIN)) (PreH12 : (output_buffer_pre <> 0)) (PreH13 : (circular_area_pre <> 0)) (PreH14 : (circular_area_pre = ca0)) (PreH15 : (output_buffer_pre = out0)) (PreH16 : (data_length_pre = requested)) (PreH17 : (0 <= requested)) (PreH18 : (requested <= UINT_MAX)) (PreH19 : (ca0 <> 0)) (PreH20 : (p_head = data_buffer)) (PreH21 : (p_tail = (data_buffer + area_length ))) (PreH22 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH23 : (out0 <> 0)) (PreH24 : (requested <= output_capacity)) (PreH25 : (retval <> 0)) ,
  (GlobalStrings LitMap )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  (GlobalStrings LitMap )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
.

Definition CircularAreaRead_entail_wit_3_1 := 
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx data_length_pre area_length retval_3 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (data_length_pre <= retval_2)) (PreH6 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (CircularAreaEmptyResult readidx writeidx b_status retval )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (area_length <= UINT_MAX)) (PreH18 : (area_length >= 0)) (PreH19 : (b_status <= INT_MAX)) (PreH20 : (b_status >= INT_MIN)) (PreH21 : (output_buffer_pre <> 0)) (PreH22 : (circular_area_pre <> 0)) (PreH23 : (circular_area_pre = ca0)) (PreH24 : (output_buffer_pre = out0)) (PreH25 : (data_length_pre = requested)) (PreH26 : (0 <= requested)) (PreH27 : (requested <= UINT_MAX)) (PreH28 : (ca0 <> 0)) (PreH29 : (p_head = data_buffer)) (PreH30 : (p_tail = (data_buffer + area_length ))) (PreH31 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH32 : (out0 <> 0)) (PreH33 : (requested <= output_capacity)) (PreH34 : (retval = 0)) (PreH35 : (retval_3 <> 0)) ,
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
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaEmptyResult readidx writeidx b_status 0 ) ” 
  &&  “ (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length_pre ) ” 
  &&  “ (0 < data_length_pre) ” 
  &&  “ (data_length_pre <= output_capacity) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (readidx < area_length) ” 
  &&  “ ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) = (area_length - readidx )) ” 
  &&  “ ((unsigned_last_nbits ((data_length_pre - (unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) )) (32)) = (data_length_pre - (unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) )) ” 
  &&  “ ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) <= data_length_pre) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx data_length_pre area_length 1 ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 readidx (sublist (0) (readidx) (buffer_contents)) )
  **  (UCharArray.seg data_buffer readidx area_length (sublist (readidx) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 0 (unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) (sublist (0) ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32))) (output_before)) )
  **  (UCharArray.seg out0 (unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) output_capacity (sublist ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32))) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx data_length_pre area_length retval_3 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (data_length_pre <= retval_2)) (PreH6 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (CircularAreaEmptyResult readidx writeidx b_status retval )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (area_length <= UINT_MAX)) (PreH18 : (area_length >= 0)) (PreH19 : (b_status <= INT_MAX)) (PreH20 : (b_status >= INT_MIN)) (PreH21 : (output_buffer_pre <> 0)) (PreH22 : (circular_area_pre <> 0)) (PreH23 : (circular_area_pre = ca0)) (PreH24 : (output_buffer_pre = out0)) (PreH25 : (data_length_pre = requested)) (PreH26 : (0 <= requested)) (PreH27 : (requested <= UINT_MAX)) (PreH28 : (ca0 <> 0)) (PreH29 : (p_head = data_buffer)) (PreH30 : (p_tail = (data_buffer + area_length ))) (PreH31 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH32 : (out0 <> 0)) (PreH33 : (requested <= output_capacity)) (PreH34 : (retval = 0)) (PreH35 : (retval_3 <> 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (CircularAreaDivideRdDataResult readidx data_length_pre area_length 1 ) ” 
  &&  “ ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) <= data_length_pre) ” 
  &&  “ ((unsigned_last_nbits ((data_length_pre - (unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) )) (32)) = (data_length_pre - (unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) )) ” 
  &&  “ ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) = (area_length - readidx )) ” 
  &&  “ (readidx < area_length) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length_pre ) ” 
  &&  “ (CircularAreaEmptyResult readidx writeidx b_status 0 ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 readidx (sublist (0) (readidx) (buffer_contents)) )
  **  (UCharArray.seg data_buffer readidx area_length (sublist (readidx) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 0 (unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) (sublist (0) ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32))) (output_before)) )
  **  (UCharArray.seg out0 (unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) output_capacity (sublist ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32))) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
).

Definition CircularAreaRead_entail_wit_3_1_split_goal_1 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx data_length_pre area_length retval_3 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (data_length_pre <= retval_2)) (PreH6 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (CircularAreaEmptyResult readidx writeidx b_status retval )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (area_length <= UINT_MAX)) (PreH18 : (area_length >= 0)) (PreH19 : (b_status <= INT_MAX)) (PreH20 : (b_status >= INT_MIN)) (PreH21 : (output_buffer_pre <> 0)) (PreH22 : (circular_area_pre <> 0)) (PreH23 : (circular_area_pre = ca0)) (PreH24 : (output_buffer_pre = out0)) (PreH25 : (data_length_pre = requested)) (PreH26 : (0 <= requested)) (PreH27 : (requested <= UINT_MAX)) (PreH28 : (ca0 <> 0)) (PreH29 : (p_head = data_buffer)) (PreH30 : (p_tail = (data_buffer + area_length ))) (PreH31 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH32 : (out0 <> 0)) (PreH33 : (requested <= output_capacity)) (PreH34 : (retval = 0)) (PreH35 : (retval_3 <> 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (CircularAreaDivideRdDataResult readidx data_length_pre area_length 1 ) ”
.

Definition CircularAreaRead_entail_wit_3_1_split_goal_2 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx data_length_pre area_length retval_3 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (data_length_pre <= retval_2)) (PreH6 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (CircularAreaEmptyResult readidx writeidx b_status retval )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (area_length <= UINT_MAX)) (PreH18 : (area_length >= 0)) (PreH19 : (b_status <= INT_MAX)) (PreH20 : (b_status >= INT_MIN)) (PreH21 : (output_buffer_pre <> 0)) (PreH22 : (circular_area_pre <> 0)) (PreH23 : (circular_area_pre = ca0)) (PreH24 : (output_buffer_pre = out0)) (PreH25 : (data_length_pre = requested)) (PreH26 : (0 <= requested)) (PreH27 : (requested <= UINT_MAX)) (PreH28 : (ca0 <> 0)) (PreH29 : (p_head = data_buffer)) (PreH30 : (p_tail = (data_buffer + area_length ))) (PreH31 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH32 : (out0 <> 0)) (PreH33 : (requested <= output_capacity)) (PreH34 : (retval = 0)) (PreH35 : (retval_3 <> 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) <= data_length_pre) ”
.

Definition CircularAreaRead_entail_wit_3_1_split_goal_3 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx data_length_pre area_length retval_3 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (data_length_pre <= retval_2)) (PreH6 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (CircularAreaEmptyResult readidx writeidx b_status retval )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (area_length <= UINT_MAX)) (PreH18 : (area_length >= 0)) (PreH19 : (b_status <= INT_MAX)) (PreH20 : (b_status >= INT_MIN)) (PreH21 : (output_buffer_pre <> 0)) (PreH22 : (circular_area_pre <> 0)) (PreH23 : (circular_area_pre = ca0)) (PreH24 : (output_buffer_pre = out0)) (PreH25 : (data_length_pre = requested)) (PreH26 : (0 <= requested)) (PreH27 : (requested <= UINT_MAX)) (PreH28 : (ca0 <> 0)) (PreH29 : (p_head = data_buffer)) (PreH30 : (p_tail = (data_buffer + area_length ))) (PreH31 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH32 : (out0 <> 0)) (PreH33 : (requested <= output_capacity)) (PreH34 : (retval = 0)) (PreH35 : (retval_3 <> 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ ((unsigned_last_nbits ((data_length_pre - (unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) )) (32)) = (data_length_pre - (unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) )) ”
.

Definition CircularAreaRead_entail_wit_3_1_split_goal_4 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx data_length_pre area_length retval_3 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (data_length_pre <= retval_2)) (PreH6 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (CircularAreaEmptyResult readidx writeidx b_status retval )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (area_length <= UINT_MAX)) (PreH18 : (area_length >= 0)) (PreH19 : (b_status <= INT_MAX)) (PreH20 : (b_status >= INT_MIN)) (PreH21 : (output_buffer_pre <> 0)) (PreH22 : (circular_area_pre <> 0)) (PreH23 : (circular_area_pre = ca0)) (PreH24 : (output_buffer_pre = out0)) (PreH25 : (data_length_pre = requested)) (PreH26 : (0 <= requested)) (PreH27 : (requested <= UINT_MAX)) (PreH28 : (ca0 <> 0)) (PreH29 : (p_head = data_buffer)) (PreH30 : (p_tail = (data_buffer + area_length ))) (PreH31 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH32 : (out0 <> 0)) (PreH33 : (requested <= output_capacity)) (PreH34 : (retval = 0)) (PreH35 : (retval_3 <> 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) = (area_length - readidx )) ”
.

Definition CircularAreaRead_entail_wit_3_1_split_goal_5 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx data_length_pre area_length retval_3 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (data_length_pre <= retval_2)) (PreH6 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (CircularAreaEmptyResult readidx writeidx b_status retval )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (area_length <= UINT_MAX)) (PreH18 : (area_length >= 0)) (PreH19 : (b_status <= INT_MAX)) (PreH20 : (b_status >= INT_MIN)) (PreH21 : (output_buffer_pre <> 0)) (PreH22 : (circular_area_pre <> 0)) (PreH23 : (circular_area_pre = ca0)) (PreH24 : (output_buffer_pre = out0)) (PreH25 : (data_length_pre = requested)) (PreH26 : (0 <= requested)) (PreH27 : (requested <= UINT_MAX)) (PreH28 : (ca0 <> 0)) (PreH29 : (p_head = data_buffer)) (PreH30 : (p_tail = (data_buffer + area_length ))) (PreH31 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH32 : (out0 <> 0)) (PreH33 : (requested <= output_capacity)) (PreH34 : (retval = 0)) (PreH35 : (retval_3 <> 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (readidx < area_length) ”
.

Definition CircularAreaRead_entail_wit_3_1_split_goal_6 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx data_length_pre area_length retval_3 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (data_length_pre <= retval_2)) (PreH6 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (CircularAreaEmptyResult readidx writeidx b_status retval )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (area_length <= UINT_MAX)) (PreH18 : (area_length >= 0)) (PreH19 : (b_status <= INT_MAX)) (PreH20 : (b_status >= INT_MIN)) (PreH21 : (output_buffer_pre <> 0)) (PreH22 : (circular_area_pre <> 0)) (PreH23 : (circular_area_pre = ca0)) (PreH24 : (output_buffer_pre = out0)) (PreH25 : (data_length_pre = requested)) (PreH26 : (0 <= requested)) (PreH27 : (requested <= UINT_MAX)) (PreH28 : (ca0 <> 0)) (PreH29 : (p_head = data_buffer)) (PreH30 : (p_tail = (data_buffer + area_length ))) (PreH31 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH32 : (out0 <> 0)) (PreH33 : (requested <= output_capacity)) (PreH34 : (retval = 0)) (PreH35 : (retval_3 <> 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (0 <= readidx) ”
.

Definition CircularAreaRead_entail_wit_3_1_split_goal_7 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx data_length_pre area_length retval_3 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (data_length_pre <= retval_2)) (PreH6 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (CircularAreaEmptyResult readidx writeidx b_status retval )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (area_length <= UINT_MAX)) (PreH18 : (area_length >= 0)) (PreH19 : (b_status <= INT_MAX)) (PreH20 : (b_status >= INT_MIN)) (PreH21 : (output_buffer_pre <> 0)) (PreH22 : (circular_area_pre <> 0)) (PreH23 : (circular_area_pre = ca0)) (PreH24 : (output_buffer_pre = out0)) (PreH25 : (data_length_pre = requested)) (PreH26 : (0 <= requested)) (PreH27 : (requested <= UINT_MAX)) (PreH28 : (ca0 <> 0)) (PreH29 : (p_head = data_buffer)) (PreH30 : (p_tail = (data_buffer + area_length ))) (PreH31 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH32 : (out0 <> 0)) (PreH33 : (requested <= output_capacity)) (PreH34 : (retval = 0)) (PreH35 : (retval_3 <> 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length_pre ) ”
.

Definition CircularAreaRead_entail_wit_3_1_split_goal_8 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx data_length_pre area_length retval_3 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (data_length_pre <= retval_2)) (PreH6 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (CircularAreaEmptyResult readidx writeidx b_status retval )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (area_length <= UINT_MAX)) (PreH18 : (area_length >= 0)) (PreH19 : (b_status <= INT_MAX)) (PreH20 : (b_status >= INT_MIN)) (PreH21 : (output_buffer_pre <> 0)) (PreH22 : (circular_area_pre <> 0)) (PreH23 : (circular_area_pre = ca0)) (PreH24 : (output_buffer_pre = out0)) (PreH25 : (data_length_pre = requested)) (PreH26 : (0 <= requested)) (PreH27 : (requested <= UINT_MAX)) (PreH28 : (ca0 <> 0)) (PreH29 : (p_head = data_buffer)) (PreH30 : (p_tail = (data_buffer + area_length ))) (PreH31 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH32 : (out0 <> 0)) (PreH33 : (requested <= output_capacity)) (PreH34 : (retval = 0)) (PreH35 : (retval_3 <> 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (CircularAreaEmptyResult readidx writeidx b_status 0 ) ”
.

Definition CircularAreaRead_entail_wit_3_1_split_goal_spatial := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx data_length_pre area_length retval_3 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (data_length_pre <= retval_2)) (PreH6 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (CircularAreaEmptyResult readidx writeidx b_status retval )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (area_length <= UINT_MAX)) (PreH18 : (area_length >= 0)) (PreH19 : (b_status <= INT_MAX)) (PreH20 : (b_status >= INT_MIN)) (PreH21 : (output_buffer_pre <> 0)) (PreH22 : (circular_area_pre <> 0)) (PreH23 : (circular_area_pre = ca0)) (PreH24 : (output_buffer_pre = out0)) (PreH25 : (data_length_pre = requested)) (PreH26 : (0 <= requested)) (PreH27 : (requested <= UINT_MAX)) (PreH28 : (ca0 <> 0)) (PreH29 : (p_head = data_buffer)) (PreH30 : (p_tail = (data_buffer + area_length ))) (PreH31 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH32 : (out0 <> 0)) (PreH33 : (requested <= output_capacity)) (PreH34 : (retval = 0)) (PreH35 : (retval_3 <> 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 readidx (sublist (0) (readidx) (buffer_contents)) )
  **  (UCharArray.seg data_buffer readidx area_length (sublist (readidx) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 0 (unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) (sublist (0) ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32))) (output_before)) )
  **  (UCharArray.seg out0 (unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) output_capacity (sublist ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32))) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
.

Definition CircularAreaRead_entail_wit_3_2 := 
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH6 : (p_head = data_buffer)) (PreH7 : (p_tail = (data_buffer + area_length ))) (PreH8 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH9 : (data_length_pre > retval_3)) (PreH10 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_3 )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (CircularAreaEmptyResult readidx writeidx b_status retval_2 )) (PreH15 : (p_head = data_buffer)) (PreH16 : (p_tail = (data_buffer + area_length ))) (PreH17 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH18 : (data_length_pre > 0)) (PreH19 : (0 <= data_length_pre)) (PreH20 : (data_length_pre <= UINT_MAX)) (PreH21 : (area_length <= UINT_MAX)) (PreH22 : (area_length >= 0)) (PreH23 : (b_status <= INT_MAX)) (PreH24 : (b_status >= INT_MIN)) (PreH25 : (output_buffer_pre <> 0)) (PreH26 : (circular_area_pre <> 0)) (PreH27 : (circular_area_pre = ca0)) (PreH28 : (output_buffer_pre = out0)) (PreH29 : (data_length_pre = requested)) (PreH30 : (0 <= requested)) (PreH31 : (requested <= UINT_MAX)) (PreH32 : (ca0 <> 0)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH36 : (out0 <> 0)) (PreH37 : (requested <= output_capacity)) (PreH38 : (retval_2 = 0)) (PreH39 : (retval_4 <> 0)) ,
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
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaEmptyResult readidx writeidx b_status 0 ) ” 
  &&  “ (CircularAreaActualReadLength readidx writeidx area_length b_status requested retval ) ” 
  &&  “ (0 < retval) ” 
  &&  “ (retval <= output_capacity) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (readidx < area_length) ” 
  &&  “ ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) = (area_length - readidx )) ” 
  &&  “ ((unsigned_last_nbits ((retval - (unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) )) (32)) = (retval - (unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) )) ” 
  &&  “ ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) <= retval) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx retval area_length 1 ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 readidx (sublist (0) (readidx) (buffer_contents)) )
  **  (UCharArray.seg data_buffer readidx area_length (sublist (readidx) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 0 (unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) (sublist (0) ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32))) (output_before)) )
  **  (UCharArray.seg out0 (unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) output_capacity (sublist ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32))) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH6 : (p_head = data_buffer)) (PreH7 : (p_tail = (data_buffer + area_length ))) (PreH8 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH9 : (data_length_pre > retval_3)) (PreH10 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_3 )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (CircularAreaEmptyResult readidx writeidx b_status retval_2 )) (PreH15 : (p_head = data_buffer)) (PreH16 : (p_tail = (data_buffer + area_length ))) (PreH17 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH18 : (data_length_pre > 0)) (PreH19 : (0 <= data_length_pre)) (PreH20 : (data_length_pre <= UINT_MAX)) (PreH21 : (area_length <= UINT_MAX)) (PreH22 : (area_length >= 0)) (PreH23 : (b_status <= INT_MAX)) (PreH24 : (b_status >= INT_MIN)) (PreH25 : (output_buffer_pre <> 0)) (PreH26 : (circular_area_pre <> 0)) (PreH27 : (circular_area_pre = ca0)) (PreH28 : (output_buffer_pre = out0)) (PreH29 : (data_length_pre = requested)) (PreH30 : (0 <= requested)) (PreH31 : (requested <= UINT_MAX)) (PreH32 : (ca0 <> 0)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH36 : (out0 <> 0)) (PreH37 : (requested <= output_capacity)) (PreH38 : (retval_2 = 0)) (PreH39 : (retval_4 <> 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (CircularAreaDivideRdDataResult readidx retval area_length 1 ) ” 
  &&  “ ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) <= retval) ” 
  &&  “ ((unsigned_last_nbits ((retval - (unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) )) (32)) = (retval - (unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) )) ” 
  &&  “ ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) = (area_length - readidx )) ” 
  &&  “ (readidx < area_length) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (retval <= output_capacity) ” 
  &&  “ (0 < retval) ” 
  &&  “ (CircularAreaActualReadLength readidx writeidx area_length b_status requested retval ) ” 
  &&  “ (CircularAreaEmptyResult readidx writeidx b_status 0 ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 readidx (sublist (0) (readidx) (buffer_contents)) )
  **  (UCharArray.seg data_buffer readidx area_length (sublist (readidx) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 0 (unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) (sublist (0) ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32))) (output_before)) )
  **  (UCharArray.seg out0 (unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) output_capacity (sublist ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32))) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
).

Definition CircularAreaRead_entail_wit_3_2_split_goal_1 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH6 : (p_head = data_buffer)) (PreH7 : (p_tail = (data_buffer + area_length ))) (PreH8 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH9 : (data_length_pre > retval_3)) (PreH10 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_3 )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (CircularAreaEmptyResult readidx writeidx b_status retval_2 )) (PreH15 : (p_head = data_buffer)) (PreH16 : (p_tail = (data_buffer + area_length ))) (PreH17 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH18 : (data_length_pre > 0)) (PreH19 : (0 <= data_length_pre)) (PreH20 : (data_length_pre <= UINT_MAX)) (PreH21 : (area_length <= UINT_MAX)) (PreH22 : (area_length >= 0)) (PreH23 : (b_status <= INT_MAX)) (PreH24 : (b_status >= INT_MIN)) (PreH25 : (output_buffer_pre <> 0)) (PreH26 : (circular_area_pre <> 0)) (PreH27 : (circular_area_pre = ca0)) (PreH28 : (output_buffer_pre = out0)) (PreH29 : (data_length_pre = requested)) (PreH30 : (0 <= requested)) (PreH31 : (requested <= UINT_MAX)) (PreH32 : (ca0 <> 0)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH36 : (out0 <> 0)) (PreH37 : (requested <= output_capacity)) (PreH38 : (retval_2 = 0)) (PreH39 : (retval_4 <> 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (CircularAreaDivideRdDataResult readidx retval area_length 1 ) ”
.

Definition CircularAreaRead_entail_wit_3_2_split_goal_2 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH6 : (p_head = data_buffer)) (PreH7 : (p_tail = (data_buffer + area_length ))) (PreH8 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH9 : (data_length_pre > retval_3)) (PreH10 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_3 )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (CircularAreaEmptyResult readidx writeidx b_status retval_2 )) (PreH15 : (p_head = data_buffer)) (PreH16 : (p_tail = (data_buffer + area_length ))) (PreH17 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH18 : (data_length_pre > 0)) (PreH19 : (0 <= data_length_pre)) (PreH20 : (data_length_pre <= UINT_MAX)) (PreH21 : (area_length <= UINT_MAX)) (PreH22 : (area_length >= 0)) (PreH23 : (b_status <= INT_MAX)) (PreH24 : (b_status >= INT_MIN)) (PreH25 : (output_buffer_pre <> 0)) (PreH26 : (circular_area_pre <> 0)) (PreH27 : (circular_area_pre = ca0)) (PreH28 : (output_buffer_pre = out0)) (PreH29 : (data_length_pre = requested)) (PreH30 : (0 <= requested)) (PreH31 : (requested <= UINT_MAX)) (PreH32 : (ca0 <> 0)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH36 : (out0 <> 0)) (PreH37 : (requested <= output_capacity)) (PreH38 : (retval_2 = 0)) (PreH39 : (retval_4 <> 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) <= retval) ”
.

Definition CircularAreaRead_entail_wit_3_2_split_goal_3 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH6 : (p_head = data_buffer)) (PreH7 : (p_tail = (data_buffer + area_length ))) (PreH8 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH9 : (data_length_pre > retval_3)) (PreH10 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_3 )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (CircularAreaEmptyResult readidx writeidx b_status retval_2 )) (PreH15 : (p_head = data_buffer)) (PreH16 : (p_tail = (data_buffer + area_length ))) (PreH17 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH18 : (data_length_pre > 0)) (PreH19 : (0 <= data_length_pre)) (PreH20 : (data_length_pre <= UINT_MAX)) (PreH21 : (area_length <= UINT_MAX)) (PreH22 : (area_length >= 0)) (PreH23 : (b_status <= INT_MAX)) (PreH24 : (b_status >= INT_MIN)) (PreH25 : (output_buffer_pre <> 0)) (PreH26 : (circular_area_pre <> 0)) (PreH27 : (circular_area_pre = ca0)) (PreH28 : (output_buffer_pre = out0)) (PreH29 : (data_length_pre = requested)) (PreH30 : (0 <= requested)) (PreH31 : (requested <= UINT_MAX)) (PreH32 : (ca0 <> 0)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH36 : (out0 <> 0)) (PreH37 : (requested <= output_capacity)) (PreH38 : (retval_2 = 0)) (PreH39 : (retval_4 <> 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ ((unsigned_last_nbits ((retval - (unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) )) (32)) = (retval - (unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) )) ”
.

Definition CircularAreaRead_entail_wit_3_2_split_goal_4 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH6 : (p_head = data_buffer)) (PreH7 : (p_tail = (data_buffer + area_length ))) (PreH8 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH9 : (data_length_pre > retval_3)) (PreH10 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_3 )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (CircularAreaEmptyResult readidx writeidx b_status retval_2 )) (PreH15 : (p_head = data_buffer)) (PreH16 : (p_tail = (data_buffer + area_length ))) (PreH17 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH18 : (data_length_pre > 0)) (PreH19 : (0 <= data_length_pre)) (PreH20 : (data_length_pre <= UINT_MAX)) (PreH21 : (area_length <= UINT_MAX)) (PreH22 : (area_length >= 0)) (PreH23 : (b_status <= INT_MAX)) (PreH24 : (b_status >= INT_MIN)) (PreH25 : (output_buffer_pre <> 0)) (PreH26 : (circular_area_pre <> 0)) (PreH27 : (circular_area_pre = ca0)) (PreH28 : (output_buffer_pre = out0)) (PreH29 : (data_length_pre = requested)) (PreH30 : (0 <= requested)) (PreH31 : (requested <= UINT_MAX)) (PreH32 : (ca0 <> 0)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH36 : (out0 <> 0)) (PreH37 : (requested <= output_capacity)) (PreH38 : (retval_2 = 0)) (PreH39 : (retval_4 <> 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) = (area_length - readidx )) ”
.

Definition CircularAreaRead_entail_wit_3_2_split_goal_5 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH6 : (p_head = data_buffer)) (PreH7 : (p_tail = (data_buffer + area_length ))) (PreH8 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH9 : (data_length_pre > retval_3)) (PreH10 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_3 )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (CircularAreaEmptyResult readidx writeidx b_status retval_2 )) (PreH15 : (p_head = data_buffer)) (PreH16 : (p_tail = (data_buffer + area_length ))) (PreH17 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH18 : (data_length_pre > 0)) (PreH19 : (0 <= data_length_pre)) (PreH20 : (data_length_pre <= UINT_MAX)) (PreH21 : (area_length <= UINT_MAX)) (PreH22 : (area_length >= 0)) (PreH23 : (b_status <= INT_MAX)) (PreH24 : (b_status >= INT_MIN)) (PreH25 : (output_buffer_pre <> 0)) (PreH26 : (circular_area_pre <> 0)) (PreH27 : (circular_area_pre = ca0)) (PreH28 : (output_buffer_pre = out0)) (PreH29 : (data_length_pre = requested)) (PreH30 : (0 <= requested)) (PreH31 : (requested <= UINT_MAX)) (PreH32 : (ca0 <> 0)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH36 : (out0 <> 0)) (PreH37 : (requested <= output_capacity)) (PreH38 : (retval_2 = 0)) (PreH39 : (retval_4 <> 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (readidx < area_length) ”
.

Definition CircularAreaRead_entail_wit_3_2_split_goal_6 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH6 : (p_head = data_buffer)) (PreH7 : (p_tail = (data_buffer + area_length ))) (PreH8 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH9 : (data_length_pre > retval_3)) (PreH10 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_3 )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (CircularAreaEmptyResult readidx writeidx b_status retval_2 )) (PreH15 : (p_head = data_buffer)) (PreH16 : (p_tail = (data_buffer + area_length ))) (PreH17 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH18 : (data_length_pre > 0)) (PreH19 : (0 <= data_length_pre)) (PreH20 : (data_length_pre <= UINT_MAX)) (PreH21 : (area_length <= UINT_MAX)) (PreH22 : (area_length >= 0)) (PreH23 : (b_status <= INT_MAX)) (PreH24 : (b_status >= INT_MIN)) (PreH25 : (output_buffer_pre <> 0)) (PreH26 : (circular_area_pre <> 0)) (PreH27 : (circular_area_pre = ca0)) (PreH28 : (output_buffer_pre = out0)) (PreH29 : (data_length_pre = requested)) (PreH30 : (0 <= requested)) (PreH31 : (requested <= UINT_MAX)) (PreH32 : (ca0 <> 0)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH36 : (out0 <> 0)) (PreH37 : (requested <= output_capacity)) (PreH38 : (retval_2 = 0)) (PreH39 : (retval_4 <> 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (0 <= readidx) ”
.

Definition CircularAreaRead_entail_wit_3_2_split_goal_7 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH6 : (p_head = data_buffer)) (PreH7 : (p_tail = (data_buffer + area_length ))) (PreH8 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH9 : (data_length_pre > retval_3)) (PreH10 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_3 )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (CircularAreaEmptyResult readidx writeidx b_status retval_2 )) (PreH15 : (p_head = data_buffer)) (PreH16 : (p_tail = (data_buffer + area_length ))) (PreH17 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH18 : (data_length_pre > 0)) (PreH19 : (0 <= data_length_pre)) (PreH20 : (data_length_pre <= UINT_MAX)) (PreH21 : (area_length <= UINT_MAX)) (PreH22 : (area_length >= 0)) (PreH23 : (b_status <= INT_MAX)) (PreH24 : (b_status >= INT_MIN)) (PreH25 : (output_buffer_pre <> 0)) (PreH26 : (circular_area_pre <> 0)) (PreH27 : (circular_area_pre = ca0)) (PreH28 : (output_buffer_pre = out0)) (PreH29 : (data_length_pre = requested)) (PreH30 : (0 <= requested)) (PreH31 : (requested <= UINT_MAX)) (PreH32 : (ca0 <> 0)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH36 : (out0 <> 0)) (PreH37 : (requested <= output_capacity)) (PreH38 : (retval_2 = 0)) (PreH39 : (retval_4 <> 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (retval <= output_capacity) ”
.

Definition CircularAreaRead_entail_wit_3_2_split_goal_8 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH6 : (p_head = data_buffer)) (PreH7 : (p_tail = (data_buffer + area_length ))) (PreH8 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH9 : (data_length_pre > retval_3)) (PreH10 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_3 )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (CircularAreaEmptyResult readidx writeidx b_status retval_2 )) (PreH15 : (p_head = data_buffer)) (PreH16 : (p_tail = (data_buffer + area_length ))) (PreH17 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH18 : (data_length_pre > 0)) (PreH19 : (0 <= data_length_pre)) (PreH20 : (data_length_pre <= UINT_MAX)) (PreH21 : (area_length <= UINT_MAX)) (PreH22 : (area_length >= 0)) (PreH23 : (b_status <= INT_MAX)) (PreH24 : (b_status >= INT_MIN)) (PreH25 : (output_buffer_pre <> 0)) (PreH26 : (circular_area_pre <> 0)) (PreH27 : (circular_area_pre = ca0)) (PreH28 : (output_buffer_pre = out0)) (PreH29 : (data_length_pre = requested)) (PreH30 : (0 <= requested)) (PreH31 : (requested <= UINT_MAX)) (PreH32 : (ca0 <> 0)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH36 : (out0 <> 0)) (PreH37 : (requested <= output_capacity)) (PreH38 : (retval_2 = 0)) (PreH39 : (retval_4 <> 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (0 < retval) ”
.

Definition CircularAreaRead_entail_wit_3_2_split_goal_9 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH6 : (p_head = data_buffer)) (PreH7 : (p_tail = (data_buffer + area_length ))) (PreH8 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH9 : (data_length_pre > retval_3)) (PreH10 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_3 )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (CircularAreaEmptyResult readidx writeidx b_status retval_2 )) (PreH15 : (p_head = data_buffer)) (PreH16 : (p_tail = (data_buffer + area_length ))) (PreH17 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH18 : (data_length_pre > 0)) (PreH19 : (0 <= data_length_pre)) (PreH20 : (data_length_pre <= UINT_MAX)) (PreH21 : (area_length <= UINT_MAX)) (PreH22 : (area_length >= 0)) (PreH23 : (b_status <= INT_MAX)) (PreH24 : (b_status >= INT_MIN)) (PreH25 : (output_buffer_pre <> 0)) (PreH26 : (circular_area_pre <> 0)) (PreH27 : (circular_area_pre = ca0)) (PreH28 : (output_buffer_pre = out0)) (PreH29 : (data_length_pre = requested)) (PreH30 : (0 <= requested)) (PreH31 : (requested <= UINT_MAX)) (PreH32 : (ca0 <> 0)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH36 : (out0 <> 0)) (PreH37 : (requested <= output_capacity)) (PreH38 : (retval_2 = 0)) (PreH39 : (retval_4 <> 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (CircularAreaActualReadLength readidx writeidx area_length b_status requested retval ) ”
.

Definition CircularAreaRead_entail_wit_3_2_split_goal_10 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH6 : (p_head = data_buffer)) (PreH7 : (p_tail = (data_buffer + area_length ))) (PreH8 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH9 : (data_length_pre > retval_3)) (PreH10 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_3 )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (CircularAreaEmptyResult readidx writeidx b_status retval_2 )) (PreH15 : (p_head = data_buffer)) (PreH16 : (p_tail = (data_buffer + area_length ))) (PreH17 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH18 : (data_length_pre > 0)) (PreH19 : (0 <= data_length_pre)) (PreH20 : (data_length_pre <= UINT_MAX)) (PreH21 : (area_length <= UINT_MAX)) (PreH22 : (area_length >= 0)) (PreH23 : (b_status <= INT_MAX)) (PreH24 : (b_status >= INT_MIN)) (PreH25 : (output_buffer_pre <> 0)) (PreH26 : (circular_area_pre <> 0)) (PreH27 : (circular_area_pre = ca0)) (PreH28 : (output_buffer_pre = out0)) (PreH29 : (data_length_pre = requested)) (PreH30 : (0 <= requested)) (PreH31 : (requested <= UINT_MAX)) (PreH32 : (ca0 <> 0)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH36 : (out0 <> 0)) (PreH37 : (requested <= output_capacity)) (PreH38 : (retval_2 = 0)) (PreH39 : (retval_4 <> 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (CircularAreaEmptyResult readidx writeidx b_status 0 ) ”
.

Definition CircularAreaRead_entail_wit_3_2_split_goal_spatial := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH6 : (p_head = data_buffer)) (PreH7 : (p_tail = (data_buffer + area_length ))) (PreH8 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH9 : (data_length_pre > retval_3)) (PreH10 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_3 )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (CircularAreaEmptyResult readidx writeidx b_status retval_2 )) (PreH15 : (p_head = data_buffer)) (PreH16 : (p_tail = (data_buffer + area_length ))) (PreH17 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH18 : (data_length_pre > 0)) (PreH19 : (0 <= data_length_pre)) (PreH20 : (data_length_pre <= UINT_MAX)) (PreH21 : (area_length <= UINT_MAX)) (PreH22 : (area_length >= 0)) (PreH23 : (b_status <= INT_MAX)) (PreH24 : (b_status >= INT_MIN)) (PreH25 : (output_buffer_pre <> 0)) (PreH26 : (circular_area_pre <> 0)) (PreH27 : (circular_area_pre = ca0)) (PreH28 : (output_buffer_pre = out0)) (PreH29 : (data_length_pre = requested)) (PreH30 : (0 <= requested)) (PreH31 : (requested <= UINT_MAX)) (PreH32 : (ca0 <> 0)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH36 : (out0 <> 0)) (PreH37 : (requested <= output_capacity)) (PreH38 : (retval_2 = 0)) (PreH39 : (retval_4 <> 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 readidx (sublist (0) (readidx) (buffer_contents)) )
  **  (UCharArray.seg data_buffer readidx area_length (sublist (readidx) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 0 (unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) (sublist (0) ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32))) (output_before)) )
  **  (UCharArray.seg out0 (unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32)) output_capacity (sublist ((unsigned_last_nbits ((area_length - (unsigned_last_nbits (readidx) (32)) )) (32))) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
.

Definition CircularAreaRead_entail_wit_4 := 
(
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_up: Z) (read_len_down: Z) (retval: Z) (PreH1 : (retval = out0)) (PreH2 : (ca0 <> 0)) (PreH3 : (out0 <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaEmptyResult readidx writeidx b_status 0 )) (PreH6 : (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length )) (PreH7 : (0 < data_length)) (PreH8 : (data_length <= output_capacity)) (PreH9 : (0 <= readidx)) (PreH10 : (readidx < area_length)) (PreH11 : (read_len_up = (area_length - readidx ))) (PreH12 : (read_len_down = (data_length - read_len_up ))) (PreH13 : (read_len_up <= data_length)) (PreH14 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH15 : (p_head = data_buffer)) (PreH16 : (p_tail = (data_buffer + area_length ))) (PreH17 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (UCharArray.seg out0 0 read_len_up (sublist (readidx) (area_length) (buffer_contents)) )
  **  (UCharArray.seg data_buffer readidx area_length (sublist (readidx) (area_length) (buffer_contents)) )
  **  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 readidx (sublist (0) (readidx) (buffer_contents)) )
  **  (UCharArray.seg out0 read_len_up output_capacity (sublist (read_len_up) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaEmptyResult readidx writeidx b_status 0 ) ” 
  &&  “ (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length ) ” 
  &&  “ (0 < data_length) ” 
  &&  “ (data_length <= output_capacity) ” 
  &&  “ (0 <= read_len_down) ” 
  &&  “ (read_len_down <= readidx) ” 
  &&  “ (read_len_up = (area_length - readidx )) ” 
  &&  “ (read_len_down = (data_length - read_len_up )) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx data_length area_length 1 ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 read_len_down (sublist (0) (read_len_down) (buffer_contents)) )
  **  (UCharArray.seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (buffer_contents)) )
  **  (UCharArray.seg data_buffer readidx area_length (sublist (readidx) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 0 read_len_up (sublist (readidx) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 read_len_up data_length (sublist (read_len_up) (data_length) (output_before)) )
  **  (UCharArray.seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_up: Z) (read_len_down: Z) (retval: Z) (PreH1 : (retval = out0)) (PreH2 : (ca0 <> 0)) (PreH3 : (out0 <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaEmptyResult readidx writeidx b_status 0 )) (PreH6 : (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length )) (PreH7 : (0 < data_length)) (PreH8 : (data_length <= output_capacity)) (PreH9 : (0 <= readidx)) (PreH10 : (readidx < area_length)) (PreH11 : (read_len_up = (area_length - readidx ))) (PreH12 : (read_len_down = (data_length - read_len_up ))) (PreH13 : (read_len_up <= data_length)) (PreH14 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH15 : (p_head = data_buffer)) (PreH16 : (p_tail = (data_buffer + area_length ))) (PreH17 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 readidx (sublist (0) (readidx) (buffer_contents)) )
|--
  “ (read_len_down <= readidx) ” 
  &&  “ ((sublist (read_len_up) (output_capacity) (output_before)) = (app ((sublist (read_len_up) (data_length) (output_before))) ((sublist (data_length) (output_capacity) (output_before))))) ” 
  &&  “ ((Zlength ((sublist (read_len_up) (data_length) (output_before)))) = (data_length - read_len_up )) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 read_len_down (sublist (0) (read_len_down) (buffer_contents)) )
  **  (UCharArray.seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (buffer_contents)) )
).

Definition CircularAreaRead_entail_wit_4_split_goal_1 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_up: Z) (read_len_down: Z) (retval: Z) (PreH1 : (retval = out0)) (PreH2 : (ca0 <> 0)) (PreH3 : (out0 <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaEmptyResult readidx writeidx b_status 0 )) (PreH6 : (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length )) (PreH7 : (0 < data_length)) (PreH8 : (data_length <= output_capacity)) (PreH9 : (0 <= readidx)) (PreH10 : (readidx < area_length)) (PreH11 : (read_len_up = (area_length - readidx ))) (PreH12 : (read_len_down = (data_length - read_len_up ))) (PreH13 : (read_len_up <= data_length)) (PreH14 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH15 : (p_head = data_buffer)) (PreH16 : (p_tail = (data_buffer + area_length ))) (PreH17 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 readidx (sublist (0) (readidx) (buffer_contents)) )
|--
  “ (read_len_down <= readidx) ”
.

Definition CircularAreaRead_entail_wit_4_split_goal_2 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_up: Z) (read_len_down: Z) (retval: Z) (PreH1 : (retval = out0)) (PreH2 : (ca0 <> 0)) (PreH3 : (out0 <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaEmptyResult readidx writeidx b_status 0 )) (PreH6 : (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length )) (PreH7 : (0 < data_length)) (PreH8 : (data_length <= output_capacity)) (PreH9 : (0 <= readidx)) (PreH10 : (readidx < area_length)) (PreH11 : (read_len_up = (area_length - readidx ))) (PreH12 : (read_len_down = (data_length - read_len_up ))) (PreH13 : (read_len_up <= data_length)) (PreH14 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH15 : (p_head = data_buffer)) (PreH16 : (p_tail = (data_buffer + area_length ))) (PreH17 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 readidx (sublist (0) (readidx) (buffer_contents)) )
|--
  “ ((sublist (read_len_up) (output_capacity) (output_before)) = (app ((sublist (read_len_up) (data_length) (output_before))) ((sublist (data_length) (output_capacity) (output_before))))) ”
.

Definition CircularAreaRead_entail_wit_4_split_goal_3 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_up: Z) (read_len_down: Z) (retval: Z) (PreH1 : (retval = out0)) (PreH2 : (ca0 <> 0)) (PreH3 : (out0 <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaEmptyResult readidx writeidx b_status 0 )) (PreH6 : (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length )) (PreH7 : (0 < data_length)) (PreH8 : (data_length <= output_capacity)) (PreH9 : (0 <= readidx)) (PreH10 : (readidx < area_length)) (PreH11 : (read_len_up = (area_length - readidx ))) (PreH12 : (read_len_down = (data_length - read_len_up ))) (PreH13 : (read_len_up <= data_length)) (PreH14 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH15 : (p_head = data_buffer)) (PreH16 : (p_tail = (data_buffer + area_length ))) (PreH17 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 readidx (sublist (0) (readidx) (buffer_contents)) )
|--
  “ ((Zlength ((sublist (read_len_up) (data_length) (output_before)))) = (data_length - read_len_up )) ”
.

Definition CircularAreaRead_entail_wit_4_split_goal_spatial := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_up: Z) (read_len_down: Z) (retval: Z) (PreH1 : (retval = out0)) (PreH2 : (ca0 <> 0)) (PreH3 : (out0 <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaEmptyResult readidx writeidx b_status 0 )) (PreH6 : (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length )) (PreH7 : (0 < data_length)) (PreH8 : (data_length <= output_capacity)) (PreH9 : (0 <= readidx)) (PreH10 : (readidx < area_length)) (PreH11 : (read_len_up = (area_length - readidx ))) (PreH12 : (read_len_down = (data_length - read_len_up ))) (PreH13 : (read_len_up <= data_length)) (PreH14 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH15 : (p_head = data_buffer)) (PreH16 : (p_tail = (data_buffer + area_length ))) (PreH17 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 readidx (sublist (0) (readidx) (buffer_contents)) )
|--
  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 read_len_down (sublist (0) (read_len_down) (buffer_contents)) )
  **  (UCharArray.seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (buffer_contents)) )
.

Definition CircularAreaRead_entail_wit_5_1 := 
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx data_length_pre area_length retval_3 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (data_length_pre <= retval_2)) (PreH6 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (CircularAreaEmptyResult readidx writeidx b_status retval )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (area_length <= UINT_MAX)) (PreH18 : (area_length >= 0)) (PreH19 : (b_status <= INT_MAX)) (PreH20 : (b_status >= INT_MIN)) (PreH21 : (output_buffer_pre <> 0)) (PreH22 : (circular_area_pre <> 0)) (PreH23 : (circular_area_pre = ca0)) (PreH24 : (output_buffer_pre = out0)) (PreH25 : (data_length_pre = requested)) (PreH26 : (0 <= requested)) (PreH27 : (requested <= UINT_MAX)) (PreH28 : (ca0 <> 0)) (PreH29 : (p_head = data_buffer)) (PreH30 : (p_tail = (data_buffer + area_length ))) (PreH31 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH32 : (out0 <> 0)) (PreH33 : (requested <= output_capacity)) (PreH34 : (retval = 0)) (PreH35 : (retval_3 = 0)) ,
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
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaEmptyResult readidx writeidx b_status 0 ) ” 
  &&  “ (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length_pre ) ” 
  &&  “ (0 < data_length_pre) ” 
  &&  “ (data_length_pre <= output_capacity) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ ((readidx + data_length_pre ) <= area_length) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx data_length_pre area_length 0 ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 readidx (sublist (0) (readidx) (buffer_contents)) )
  **  (UCharArray.seg data_buffer readidx (readidx + data_length_pre ) (sublist (readidx) ((readidx + data_length_pre )) (buffer_contents)) )
  **  (UCharArray.seg data_buffer (readidx + data_length_pre ) area_length (sublist ((readidx + data_length_pre )) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 0 data_length_pre (sublist (0) (data_length_pre) (output_before)) )
  **  (UCharArray.seg out0 data_length_pre output_capacity (sublist (data_length_pre) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx data_length_pre area_length retval_3 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (data_length_pre <= retval_2)) (PreH6 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (CircularAreaEmptyResult readidx writeidx b_status retval )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (area_length <= UINT_MAX)) (PreH18 : (area_length >= 0)) (PreH19 : (b_status <= INT_MAX)) (PreH20 : (b_status >= INT_MIN)) (PreH21 : (output_buffer_pre <> 0)) (PreH22 : (circular_area_pre <> 0)) (PreH23 : (circular_area_pre = ca0)) (PreH24 : (output_buffer_pre = out0)) (PreH25 : (data_length_pre = requested)) (PreH26 : (0 <= requested)) (PreH27 : (requested <= UINT_MAX)) (PreH28 : (ca0 <> 0)) (PreH29 : (p_head = data_buffer)) (PreH30 : (p_tail = (data_buffer + area_length ))) (PreH31 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH32 : (out0 <> 0)) (PreH33 : (requested <= output_capacity)) (PreH34 : (retval = 0)) (PreH35 : (retval_3 = 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (CircularAreaDivideRdDataResult readidx data_length_pre area_length 0 ) ” 
  &&  “ ((readidx + data_length_pre ) <= area_length) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length_pre ) ” 
  &&  “ (CircularAreaEmptyResult readidx writeidx b_status 0 ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 readidx (sublist (0) (readidx) (buffer_contents)) )
  **  (UCharArray.seg data_buffer readidx (readidx + data_length_pre ) (sublist (readidx) ((readidx + data_length_pre )) (buffer_contents)) )
  **  (UCharArray.seg data_buffer (readidx + data_length_pre ) area_length (sublist ((readidx + data_length_pre )) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 0 data_length_pre (sublist (0) (data_length_pre) (output_before)) )
  **  (UCharArray.seg out0 data_length_pre output_capacity (sublist (data_length_pre) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
).

Definition CircularAreaRead_entail_wit_5_1_split_goal_1 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx data_length_pre area_length retval_3 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (data_length_pre <= retval_2)) (PreH6 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (CircularAreaEmptyResult readidx writeidx b_status retval )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (area_length <= UINT_MAX)) (PreH18 : (area_length >= 0)) (PreH19 : (b_status <= INT_MAX)) (PreH20 : (b_status >= INT_MIN)) (PreH21 : (output_buffer_pre <> 0)) (PreH22 : (circular_area_pre <> 0)) (PreH23 : (circular_area_pre = ca0)) (PreH24 : (output_buffer_pre = out0)) (PreH25 : (data_length_pre = requested)) (PreH26 : (0 <= requested)) (PreH27 : (requested <= UINT_MAX)) (PreH28 : (ca0 <> 0)) (PreH29 : (p_head = data_buffer)) (PreH30 : (p_tail = (data_buffer + area_length ))) (PreH31 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH32 : (out0 <> 0)) (PreH33 : (requested <= output_capacity)) (PreH34 : (retval = 0)) (PreH35 : (retval_3 = 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (CircularAreaDivideRdDataResult readidx data_length_pre area_length 0 ) ”
.

Definition CircularAreaRead_entail_wit_5_1_split_goal_2 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx data_length_pre area_length retval_3 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (data_length_pre <= retval_2)) (PreH6 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (CircularAreaEmptyResult readidx writeidx b_status retval )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (area_length <= UINT_MAX)) (PreH18 : (area_length >= 0)) (PreH19 : (b_status <= INT_MAX)) (PreH20 : (b_status >= INT_MIN)) (PreH21 : (output_buffer_pre <> 0)) (PreH22 : (circular_area_pre <> 0)) (PreH23 : (circular_area_pre = ca0)) (PreH24 : (output_buffer_pre = out0)) (PreH25 : (data_length_pre = requested)) (PreH26 : (0 <= requested)) (PreH27 : (requested <= UINT_MAX)) (PreH28 : (ca0 <> 0)) (PreH29 : (p_head = data_buffer)) (PreH30 : (p_tail = (data_buffer + area_length ))) (PreH31 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH32 : (out0 <> 0)) (PreH33 : (requested <= output_capacity)) (PreH34 : (retval = 0)) (PreH35 : (retval_3 = 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ ((readidx + data_length_pre ) <= area_length) ”
.

Definition CircularAreaRead_entail_wit_5_1_split_goal_3 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx data_length_pre area_length retval_3 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (data_length_pre <= retval_2)) (PreH6 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (CircularAreaEmptyResult readidx writeidx b_status retval )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (area_length <= UINT_MAX)) (PreH18 : (area_length >= 0)) (PreH19 : (b_status <= INT_MAX)) (PreH20 : (b_status >= INT_MIN)) (PreH21 : (output_buffer_pre <> 0)) (PreH22 : (circular_area_pre <> 0)) (PreH23 : (circular_area_pre = ca0)) (PreH24 : (output_buffer_pre = out0)) (PreH25 : (data_length_pre = requested)) (PreH26 : (0 <= requested)) (PreH27 : (requested <= UINT_MAX)) (PreH28 : (ca0 <> 0)) (PreH29 : (p_head = data_buffer)) (PreH30 : (p_tail = (data_buffer + area_length ))) (PreH31 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH32 : (out0 <> 0)) (PreH33 : (requested <= output_capacity)) (PreH34 : (retval = 0)) (PreH35 : (retval_3 = 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (0 <= readidx) ”
.

Definition CircularAreaRead_entail_wit_5_1_split_goal_4 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx data_length_pre area_length retval_3 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (data_length_pre <= retval_2)) (PreH6 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (CircularAreaEmptyResult readidx writeidx b_status retval )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (area_length <= UINT_MAX)) (PreH18 : (area_length >= 0)) (PreH19 : (b_status <= INT_MAX)) (PreH20 : (b_status >= INT_MIN)) (PreH21 : (output_buffer_pre <> 0)) (PreH22 : (circular_area_pre <> 0)) (PreH23 : (circular_area_pre = ca0)) (PreH24 : (output_buffer_pre = out0)) (PreH25 : (data_length_pre = requested)) (PreH26 : (0 <= requested)) (PreH27 : (requested <= UINT_MAX)) (PreH28 : (ca0 <> 0)) (PreH29 : (p_head = data_buffer)) (PreH30 : (p_tail = (data_buffer + area_length ))) (PreH31 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH32 : (out0 <> 0)) (PreH33 : (requested <= output_capacity)) (PreH34 : (retval = 0)) (PreH35 : (retval_3 = 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length_pre ) ”
.

Definition CircularAreaRead_entail_wit_5_1_split_goal_5 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx data_length_pre area_length retval_3 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (data_length_pre <= retval_2)) (PreH6 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (CircularAreaEmptyResult readidx writeidx b_status retval )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (area_length <= UINT_MAX)) (PreH18 : (area_length >= 0)) (PreH19 : (b_status <= INT_MAX)) (PreH20 : (b_status >= INT_MIN)) (PreH21 : (output_buffer_pre <> 0)) (PreH22 : (circular_area_pre <> 0)) (PreH23 : (circular_area_pre = ca0)) (PreH24 : (output_buffer_pre = out0)) (PreH25 : (data_length_pre = requested)) (PreH26 : (0 <= requested)) (PreH27 : (requested <= UINT_MAX)) (PreH28 : (ca0 <> 0)) (PreH29 : (p_head = data_buffer)) (PreH30 : (p_tail = (data_buffer + area_length ))) (PreH31 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH32 : (out0 <> 0)) (PreH33 : (requested <= output_capacity)) (PreH34 : (retval = 0)) (PreH35 : (retval_3 = 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (CircularAreaEmptyResult readidx writeidx b_status 0 ) ”
.

Definition CircularAreaRead_entail_wit_5_1_split_goal_spatial := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx data_length_pre area_length retval_3 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (data_length_pre <= retval_2)) (PreH6 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (CircularAreaEmptyResult readidx writeidx b_status retval )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (area_length <= UINT_MAX)) (PreH18 : (area_length >= 0)) (PreH19 : (b_status <= INT_MAX)) (PreH20 : (b_status >= INT_MIN)) (PreH21 : (output_buffer_pre <> 0)) (PreH22 : (circular_area_pre <> 0)) (PreH23 : (circular_area_pre = ca0)) (PreH24 : (output_buffer_pre = out0)) (PreH25 : (data_length_pre = requested)) (PreH26 : (0 <= requested)) (PreH27 : (requested <= UINT_MAX)) (PreH28 : (ca0 <> 0)) (PreH29 : (p_head = data_buffer)) (PreH30 : (p_tail = (data_buffer + area_length ))) (PreH31 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH32 : (out0 <> 0)) (PreH33 : (requested <= output_capacity)) (PreH34 : (retval = 0)) (PreH35 : (retval_3 = 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 readidx (sublist (0) (readidx) (buffer_contents)) )
  **  (UCharArray.seg data_buffer readidx (readidx + data_length_pre ) (sublist (readidx) ((readidx + data_length_pre )) (buffer_contents)) )
  **  (UCharArray.seg data_buffer (readidx + data_length_pre ) area_length (sublist ((readidx + data_length_pre )) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 0 data_length_pre (sublist (0) (data_length_pre) (output_before)) )
  **  (UCharArray.seg out0 data_length_pre output_capacity (sublist (data_length_pre) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
.

Definition CircularAreaRead_entail_wit_5_2 := 
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH6 : (p_head = data_buffer)) (PreH7 : (p_tail = (data_buffer + area_length ))) (PreH8 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH9 : (data_length_pre > retval_3)) (PreH10 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_3 )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (CircularAreaEmptyResult readidx writeidx b_status retval_2 )) (PreH15 : (p_head = data_buffer)) (PreH16 : (p_tail = (data_buffer + area_length ))) (PreH17 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH18 : (data_length_pre > 0)) (PreH19 : (0 <= data_length_pre)) (PreH20 : (data_length_pre <= UINT_MAX)) (PreH21 : (area_length <= UINT_MAX)) (PreH22 : (area_length >= 0)) (PreH23 : (b_status <= INT_MAX)) (PreH24 : (b_status >= INT_MIN)) (PreH25 : (output_buffer_pre <> 0)) (PreH26 : (circular_area_pre <> 0)) (PreH27 : (circular_area_pre = ca0)) (PreH28 : (output_buffer_pre = out0)) (PreH29 : (data_length_pre = requested)) (PreH30 : (0 <= requested)) (PreH31 : (requested <= UINT_MAX)) (PreH32 : (ca0 <> 0)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH36 : (out0 <> 0)) (PreH37 : (requested <= output_capacity)) (PreH38 : (retval_2 = 0)) (PreH39 : (retval_4 = 0)) ,
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
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaEmptyResult readidx writeidx b_status 0 ) ” 
  &&  “ (CircularAreaActualReadLength readidx writeidx area_length b_status requested retval ) ” 
  &&  “ (0 < retval) ” 
  &&  “ (retval <= output_capacity) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ ((readidx + retval ) <= area_length) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx retval area_length 0 ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 readidx (sublist (0) (readidx) (buffer_contents)) )
  **  (UCharArray.seg data_buffer readidx (readidx + retval ) (sublist (readidx) ((readidx + retval )) (buffer_contents)) )
  **  (UCharArray.seg data_buffer (readidx + retval ) area_length (sublist ((readidx + retval )) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 0 retval (sublist (0) (retval) (output_before)) )
  **  (UCharArray.seg out0 retval output_capacity (sublist (retval) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH6 : (p_head = data_buffer)) (PreH7 : (p_tail = (data_buffer + area_length ))) (PreH8 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH9 : (data_length_pre > retval_3)) (PreH10 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_3 )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (CircularAreaEmptyResult readidx writeidx b_status retval_2 )) (PreH15 : (p_head = data_buffer)) (PreH16 : (p_tail = (data_buffer + area_length ))) (PreH17 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH18 : (data_length_pre > 0)) (PreH19 : (0 <= data_length_pre)) (PreH20 : (data_length_pre <= UINT_MAX)) (PreH21 : (area_length <= UINT_MAX)) (PreH22 : (area_length >= 0)) (PreH23 : (b_status <= INT_MAX)) (PreH24 : (b_status >= INT_MIN)) (PreH25 : (output_buffer_pre <> 0)) (PreH26 : (circular_area_pre <> 0)) (PreH27 : (circular_area_pre = ca0)) (PreH28 : (output_buffer_pre = out0)) (PreH29 : (data_length_pre = requested)) (PreH30 : (0 <= requested)) (PreH31 : (requested <= UINT_MAX)) (PreH32 : (ca0 <> 0)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH36 : (out0 <> 0)) (PreH37 : (requested <= output_capacity)) (PreH38 : (retval_2 = 0)) (PreH39 : (retval_4 = 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (CircularAreaDivideRdDataResult readidx retval area_length 0 ) ” 
  &&  “ ((readidx + retval ) <= area_length) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (retval <= output_capacity) ” 
  &&  “ (0 < retval) ” 
  &&  “ (CircularAreaActualReadLength readidx writeidx area_length b_status requested retval ) ” 
  &&  “ (CircularAreaEmptyResult readidx writeidx b_status 0 ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 readidx (sublist (0) (readidx) (buffer_contents)) )
  **  (UCharArray.seg data_buffer readidx (readidx + retval ) (sublist (readidx) ((readidx + retval )) (buffer_contents)) )
  **  (UCharArray.seg data_buffer (readidx + retval ) area_length (sublist ((readidx + retval )) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 0 retval (sublist (0) (retval) (output_before)) )
  **  (UCharArray.seg out0 retval output_capacity (sublist (retval) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
).

Definition CircularAreaRead_entail_wit_5_2_split_goal_1 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH6 : (p_head = data_buffer)) (PreH7 : (p_tail = (data_buffer + area_length ))) (PreH8 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH9 : (data_length_pre > retval_3)) (PreH10 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_3 )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (CircularAreaEmptyResult readidx writeidx b_status retval_2 )) (PreH15 : (p_head = data_buffer)) (PreH16 : (p_tail = (data_buffer + area_length ))) (PreH17 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH18 : (data_length_pre > 0)) (PreH19 : (0 <= data_length_pre)) (PreH20 : (data_length_pre <= UINT_MAX)) (PreH21 : (area_length <= UINT_MAX)) (PreH22 : (area_length >= 0)) (PreH23 : (b_status <= INT_MAX)) (PreH24 : (b_status >= INT_MIN)) (PreH25 : (output_buffer_pre <> 0)) (PreH26 : (circular_area_pre <> 0)) (PreH27 : (circular_area_pre = ca0)) (PreH28 : (output_buffer_pre = out0)) (PreH29 : (data_length_pre = requested)) (PreH30 : (0 <= requested)) (PreH31 : (requested <= UINT_MAX)) (PreH32 : (ca0 <> 0)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH36 : (out0 <> 0)) (PreH37 : (requested <= output_capacity)) (PreH38 : (retval_2 = 0)) (PreH39 : (retval_4 = 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (CircularAreaDivideRdDataResult readidx retval area_length 0 ) ”
.

Definition CircularAreaRead_entail_wit_5_2_split_goal_2 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH6 : (p_head = data_buffer)) (PreH7 : (p_tail = (data_buffer + area_length ))) (PreH8 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH9 : (data_length_pre > retval_3)) (PreH10 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_3 )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (CircularAreaEmptyResult readidx writeidx b_status retval_2 )) (PreH15 : (p_head = data_buffer)) (PreH16 : (p_tail = (data_buffer + area_length ))) (PreH17 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH18 : (data_length_pre > 0)) (PreH19 : (0 <= data_length_pre)) (PreH20 : (data_length_pre <= UINT_MAX)) (PreH21 : (area_length <= UINT_MAX)) (PreH22 : (area_length >= 0)) (PreH23 : (b_status <= INT_MAX)) (PreH24 : (b_status >= INT_MIN)) (PreH25 : (output_buffer_pre <> 0)) (PreH26 : (circular_area_pre <> 0)) (PreH27 : (circular_area_pre = ca0)) (PreH28 : (output_buffer_pre = out0)) (PreH29 : (data_length_pre = requested)) (PreH30 : (0 <= requested)) (PreH31 : (requested <= UINT_MAX)) (PreH32 : (ca0 <> 0)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH36 : (out0 <> 0)) (PreH37 : (requested <= output_capacity)) (PreH38 : (retval_2 = 0)) (PreH39 : (retval_4 = 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ ((readidx + retval ) <= area_length) ”
.

Definition CircularAreaRead_entail_wit_5_2_split_goal_3 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH6 : (p_head = data_buffer)) (PreH7 : (p_tail = (data_buffer + area_length ))) (PreH8 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH9 : (data_length_pre > retval_3)) (PreH10 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_3 )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (CircularAreaEmptyResult readidx writeidx b_status retval_2 )) (PreH15 : (p_head = data_buffer)) (PreH16 : (p_tail = (data_buffer + area_length ))) (PreH17 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH18 : (data_length_pre > 0)) (PreH19 : (0 <= data_length_pre)) (PreH20 : (data_length_pre <= UINT_MAX)) (PreH21 : (area_length <= UINT_MAX)) (PreH22 : (area_length >= 0)) (PreH23 : (b_status <= INT_MAX)) (PreH24 : (b_status >= INT_MIN)) (PreH25 : (output_buffer_pre <> 0)) (PreH26 : (circular_area_pre <> 0)) (PreH27 : (circular_area_pre = ca0)) (PreH28 : (output_buffer_pre = out0)) (PreH29 : (data_length_pre = requested)) (PreH30 : (0 <= requested)) (PreH31 : (requested <= UINT_MAX)) (PreH32 : (ca0 <> 0)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH36 : (out0 <> 0)) (PreH37 : (requested <= output_capacity)) (PreH38 : (retval_2 = 0)) (PreH39 : (retval_4 = 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (0 <= readidx) ”
.

Definition CircularAreaRead_entail_wit_5_2_split_goal_4 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH6 : (p_head = data_buffer)) (PreH7 : (p_tail = (data_buffer + area_length ))) (PreH8 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH9 : (data_length_pre > retval_3)) (PreH10 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_3 )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (CircularAreaEmptyResult readidx writeidx b_status retval_2 )) (PreH15 : (p_head = data_buffer)) (PreH16 : (p_tail = (data_buffer + area_length ))) (PreH17 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH18 : (data_length_pre > 0)) (PreH19 : (0 <= data_length_pre)) (PreH20 : (data_length_pre <= UINT_MAX)) (PreH21 : (area_length <= UINT_MAX)) (PreH22 : (area_length >= 0)) (PreH23 : (b_status <= INT_MAX)) (PreH24 : (b_status >= INT_MIN)) (PreH25 : (output_buffer_pre <> 0)) (PreH26 : (circular_area_pre <> 0)) (PreH27 : (circular_area_pre = ca0)) (PreH28 : (output_buffer_pre = out0)) (PreH29 : (data_length_pre = requested)) (PreH30 : (0 <= requested)) (PreH31 : (requested <= UINT_MAX)) (PreH32 : (ca0 <> 0)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH36 : (out0 <> 0)) (PreH37 : (requested <= output_capacity)) (PreH38 : (retval_2 = 0)) (PreH39 : (retval_4 = 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (retval <= output_capacity) ”
.

Definition CircularAreaRead_entail_wit_5_2_split_goal_5 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH6 : (p_head = data_buffer)) (PreH7 : (p_tail = (data_buffer + area_length ))) (PreH8 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH9 : (data_length_pre > retval_3)) (PreH10 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_3 )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (CircularAreaEmptyResult readidx writeidx b_status retval_2 )) (PreH15 : (p_head = data_buffer)) (PreH16 : (p_tail = (data_buffer + area_length ))) (PreH17 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH18 : (data_length_pre > 0)) (PreH19 : (0 <= data_length_pre)) (PreH20 : (data_length_pre <= UINT_MAX)) (PreH21 : (area_length <= UINT_MAX)) (PreH22 : (area_length >= 0)) (PreH23 : (b_status <= INT_MAX)) (PreH24 : (b_status >= INT_MIN)) (PreH25 : (output_buffer_pre <> 0)) (PreH26 : (circular_area_pre <> 0)) (PreH27 : (circular_area_pre = ca0)) (PreH28 : (output_buffer_pre = out0)) (PreH29 : (data_length_pre = requested)) (PreH30 : (0 <= requested)) (PreH31 : (requested <= UINT_MAX)) (PreH32 : (ca0 <> 0)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH36 : (out0 <> 0)) (PreH37 : (requested <= output_capacity)) (PreH38 : (retval_2 = 0)) (PreH39 : (retval_4 = 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (0 < retval) ”
.

Definition CircularAreaRead_entail_wit_5_2_split_goal_6 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH6 : (p_head = data_buffer)) (PreH7 : (p_tail = (data_buffer + area_length ))) (PreH8 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH9 : (data_length_pre > retval_3)) (PreH10 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_3 )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (CircularAreaEmptyResult readidx writeidx b_status retval_2 )) (PreH15 : (p_head = data_buffer)) (PreH16 : (p_tail = (data_buffer + area_length ))) (PreH17 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH18 : (data_length_pre > 0)) (PreH19 : (0 <= data_length_pre)) (PreH20 : (data_length_pre <= UINT_MAX)) (PreH21 : (area_length <= UINT_MAX)) (PreH22 : (area_length >= 0)) (PreH23 : (b_status <= INT_MAX)) (PreH24 : (b_status >= INT_MIN)) (PreH25 : (output_buffer_pre <> 0)) (PreH26 : (circular_area_pre <> 0)) (PreH27 : (circular_area_pre = ca0)) (PreH28 : (output_buffer_pre = out0)) (PreH29 : (data_length_pre = requested)) (PreH30 : (0 <= requested)) (PreH31 : (requested <= UINT_MAX)) (PreH32 : (ca0 <> 0)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH36 : (out0 <> 0)) (PreH37 : (requested <= output_capacity)) (PreH38 : (retval_2 = 0)) (PreH39 : (retval_4 = 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (CircularAreaActualReadLength readidx writeidx area_length b_status requested retval ) ”
.

Definition CircularAreaRead_entail_wit_5_2_split_goal_7 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH6 : (p_head = data_buffer)) (PreH7 : (p_tail = (data_buffer + area_length ))) (PreH8 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH9 : (data_length_pre > retval_3)) (PreH10 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_3 )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (CircularAreaEmptyResult readidx writeidx b_status retval_2 )) (PreH15 : (p_head = data_buffer)) (PreH16 : (p_tail = (data_buffer + area_length ))) (PreH17 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH18 : (data_length_pre > 0)) (PreH19 : (0 <= data_length_pre)) (PreH20 : (data_length_pre <= UINT_MAX)) (PreH21 : (area_length <= UINT_MAX)) (PreH22 : (area_length >= 0)) (PreH23 : (b_status <= INT_MAX)) (PreH24 : (b_status >= INT_MIN)) (PreH25 : (output_buffer_pre <> 0)) (PreH26 : (circular_area_pre <> 0)) (PreH27 : (circular_area_pre = ca0)) (PreH28 : (output_buffer_pre = out0)) (PreH29 : (data_length_pre = requested)) (PreH30 : (0 <= requested)) (PreH31 : (requested <= UINT_MAX)) (PreH32 : (ca0 <> 0)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH36 : (out0 <> 0)) (PreH37 : (requested <= output_capacity)) (PreH38 : (retval_2 = 0)) (PreH39 : (retval_4 = 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (CircularAreaEmptyResult readidx writeidx b_status 0 ) ”
.

Definition CircularAreaRead_entail_wit_5_2_split_goal_spatial := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (retval_4: Z) (PreH1 : (CircularAreaDivideRdDataResult readidx retval area_length retval_4 )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH6 : (p_head = data_buffer)) (PreH7 : (p_tail = (data_buffer + area_length ))) (PreH8 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH9 : (data_length_pre > retval_3)) (PreH10 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_3 )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (CircularAreaEmptyResult readidx writeidx b_status retval_2 )) (PreH15 : (p_head = data_buffer)) (PreH16 : (p_tail = (data_buffer + area_length ))) (PreH17 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH18 : (data_length_pre > 0)) (PreH19 : (0 <= data_length_pre)) (PreH20 : (data_length_pre <= UINT_MAX)) (PreH21 : (area_length <= UINT_MAX)) (PreH22 : (area_length >= 0)) (PreH23 : (b_status <= INT_MAX)) (PreH24 : (b_status >= INT_MIN)) (PreH25 : (output_buffer_pre <> 0)) (PreH26 : (circular_area_pre <> 0)) (PreH27 : (circular_area_pre = ca0)) (PreH28 : (output_buffer_pre = out0)) (PreH29 : (data_length_pre = requested)) (PreH30 : (0 <= requested)) (PreH31 : (requested <= UINT_MAX)) (PreH32 : (ca0 <> 0)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH36 : (out0 <> 0)) (PreH37 : (requested <= output_capacity)) (PreH38 : (retval_2 = 0)) (PreH39 : (retval_4 = 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 readidx (sublist (0) (readidx) (buffer_contents)) )
  **  (UCharArray.seg data_buffer readidx (readidx + retval ) (sublist (readidx) ((readidx + retval )) (buffer_contents)) )
  **  (UCharArray.seg data_buffer (readidx + retval ) area_length (sublist ((readidx + retval )) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 0 retval (sublist (0) (retval) (output_before)) )
  **  (UCharArray.seg out0 retval output_capacity (sublist (retval) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
.

Definition CircularAreaRead_return_wit_1 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_down: Z) (read_len_up: Z) (retval: Z) (PreH1 : (retval = (out0 + (read_len_up * sizeof(UCHAR))))) (PreH2 : (ca0 <> 0)) (PreH3 : (out0 <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaEmptyResult readidx writeidx b_status 0 )) (PreH6 : (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length )) (PreH7 : (0 < data_length)) (PreH8 : (data_length <= output_capacity)) (PreH9 : (0 <= read_len_down)) (PreH10 : (read_len_down <= readidx)) (PreH11 : (read_len_up = (area_length - readidx ))) (PreH12 : (read_len_down = (data_length - read_len_up ))) (PreH13 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH14 : (p_head = data_buffer)) (PreH15 : (p_tail = (data_buffer + area_length ))) (PreH16 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (UCharArray.seg out0 read_len_up data_length (sublist (0) (read_len_down) (buffer_contents)) )
  **  (UCharArray.seg data_buffer 0 read_len_down (sublist (0) (read_len_down) (buffer_contents)) )
  **  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (buffer_contents)) )
  **  (UCharArray.seg data_buffer readidx area_length (sublist (readidx) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 0 read_len_up (sublist (readidx) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> (unsigned_last_nbits (read_len_down) (8)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  (EX (actual: Z)  (new_readidx: Z)  (bytes: (@list Z))  (output_after: (@list Z)) ,
  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaEmptyResult readidx writeidx b_status 0 ) ” 
  &&  “ (CircularAreaReadSuccess readidx writeidx area_length b_status requested output_capacity buffer_contents output_before actual new_readidx bytes output_after ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  (UCharArray.full out0 output_capacity output_after )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> new_readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations))
  ||
  (“ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (CircularAreaEmptyResult readidx writeidx b_status 1 ) ” 
  &&  “ (CircularAreaErrorResult 0 ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  (UCharArray.full out0 output_capacity output_before )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations))
.

Definition CircularAreaRead_return_wit_2 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (retval: Z) (PreH1 : (retval = out0)) (PreH2 : (ca0 <> 0)) (PreH3 : (out0 <> 0)) (PreH4 : (requested > 0)) (PreH5 : (CircularAreaEmptyResult readidx writeidx b_status 0 )) (PreH6 : (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length )) (PreH7 : (0 < data_length)) (PreH8 : (data_length <= output_capacity)) (PreH9 : (0 <= readidx)) (PreH10 : ((readidx + data_length ) <= area_length)) (PreH11 : (CircularAreaDivideRdDataResult readidx data_length area_length 0 )) (PreH12 : (p_head = data_buffer)) (PreH13 : (p_tail = (data_buffer + area_length ))) (PreH14 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (UCharArray.seg out0 0 data_length (sublist (readidx) ((readidx + data_length )) (buffer_contents)) )
  **  (UCharArray.seg data_buffer readidx (readidx + data_length ) (sublist (readidx) ((readidx + data_length )) (buffer_contents)) )
  **  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 readidx (sublist (0) (readidx) (buffer_contents)) )
  **  (UCharArray.seg data_buffer (readidx + data_length ) area_length (sublist ((readidx + data_length )) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> (unsigned_last_nbits (((readidx + data_length ) % ( area_length ) )) (8)))
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  (EX (actual: Z)  (new_readidx: Z)  (bytes: (@list Z))  (output_after: (@list Z)) ,
  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaEmptyResult readidx writeidx b_status 0 ) ” 
  &&  “ (CircularAreaReadSuccess readidx writeidx area_length b_status requested output_capacity buffer_contents output_before actual new_readidx bytes output_after ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  (UCharArray.full out0 output_capacity output_after )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> new_readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations))
  ||
  (“ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (CircularAreaEmptyResult readidx writeidx b_status 1 ) ” 
  &&  “ (CircularAreaErrorResult 0 ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  (UCharArray.full out0 output_capacity output_before )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations))
.

Definition CircularAreaRead_return_wit_3 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (requested > 0)) (PreH4 : (requested <= output_capacity)) (PreH5 : (CircularAreaEmptyResult readidx writeidx b_status 1 )) (PreH6 : (p_head = data_buffer)) (PreH7 : (p_tail = (data_buffer + area_length ))) (PreH8 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  (UCharArray.full out0 output_capacity output_before )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  (EX (actual: Z)  (new_readidx: Z)  (bytes: (@list Z))  (output_after: (@list Z)) ,
  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaEmptyResult readidx writeidx b_status 0 ) ” 
  &&  “ (CircularAreaReadSuccess readidx writeidx area_length b_status requested output_capacity buffer_contents output_before actual new_readidx bytes output_after ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  (UCharArray.full out0 output_capacity output_after )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> new_readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations))
  ||
  (“ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (CircularAreaEmptyResult readidx writeidx b_status 1 ) ” 
  &&  “ (CircularAreaErrorResult 1 ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  (UCharArray.full out0 output_capacity output_before )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations))
.

Definition CircularAreaRead_return_wit_4 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (data_length_pre <= 0)) (PreH2 : (0 <= data_length_pre)) (PreH3 : (data_length_pre <= UINT_MAX)) (PreH4 : (area_length <= UINT_MAX)) (PreH5 : (area_length >= 0)) (PreH6 : (b_status <= INT_MAX)) (PreH7 : (b_status >= INT_MIN)) (PreH8 : (output_buffer_pre <> 0)) (PreH9 : (circular_area_pre <> 0)) (PreH10 : (circular_area_pre = ca0)) (PreH11 : (output_buffer_pre = out0)) (PreH12 : (data_length_pre = requested)) (PreH13 : (0 <= requested)) (PreH14 : (requested <= UINT_MAX)) (PreH15 : (ca0 <> 0)) (PreH16 : (p_head = data_buffer)) (PreH17 : (p_tail = (data_buffer + area_length ))) (PreH18 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH19 : (out0 <> 0)) (PreH20 : (requested <= output_capacity)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  (“ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (CircularAreaEmptyResult readidx writeidx b_status 1 ) ” 
  &&  “ (CircularAreaErrorResult 1 ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  (UCharArray.full out0 output_capacity output_before )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations))
  ||
  (“ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (requested = 0) ” 
  &&  “ (CircularAreaErrorResult 1 ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  (UCharArray.full out0 output_capacity output_before )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations))
.

Definition CircularAreaRead_return_wit_5 := 
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (output_buffer_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = ca0)) (PreH4 : (output_buffer_pre = out0)) (PreH5 : (data_length_pre = requested)) (PreH6 : (0 <= requested)) (PreH7 : (requested <= UINT_MAX)) (PreH8 : (ca0 <> 0)) (PreH9 : (p_head = data_buffer)) (PreH10 : (p_tail = (data_buffer + area_length ))) (PreH11 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH12 : (out0 = 0)) ,
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
  “ (ca0 <> 0) ” 
  &&  “ (out0 = 0) ” 
  &&  “ (CircularAreaErrorResult 1 ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.full data_buffer area_length buffer_contents )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
) \/
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (output_buffer_pre = 0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (circular_area_pre = ca0)) (PreH8 : (output_buffer_pre = out0)) (PreH9 : (data_length_pre = requested)) (PreH10 : (0 <= requested)) (PreH11 : (requested <= UINT_MAX)) (PreH12 : (ca0 <> 0)) (PreH13 : (p_head = data_buffer)) (PreH14 : (p_tail = (data_buffer + area_length ))) (PreH15 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH16 : (out0 = 0)) ,
  (GlobalStrings LitMap )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaErrorResult 1 ) ”
  &&  (GlobalStrings LitMap )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
).

Definition CircularAreaRead_return_wit_5_split_goal_1 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (output_buffer_pre = 0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (circular_area_pre = ca0)) (PreH8 : (output_buffer_pre = out0)) (PreH9 : (data_length_pre = requested)) (PreH10 : (0 <= requested)) (PreH11 : (requested <= UINT_MAX)) (PreH12 : (ca0 <> 0)) (PreH13 : (p_head = data_buffer)) (PreH14 : (p_tail = (data_buffer + area_length ))) (PreH15 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH16 : (out0 = 0)) ,
  (GlobalStrings LitMap )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (CircularAreaErrorResult 1 ) ”
.

Definition CircularAreaRead_return_wit_5_split_goal_spatial := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (output_buffer_pre = 0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (circular_area_pre = ca0)) (PreH8 : (output_buffer_pre = out0)) (PreH9 : (data_length_pre = requested)) (PreH10 : (0 <= requested)) (PreH11 : (requested <= UINT_MAX)) (PreH12 : (ca0 <> 0)) (PreH13 : (p_head = data_buffer)) (PreH14 : (p_tail = (data_buffer + area_length ))) (PreH15 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH16 : (out0 = 0)) ,
  (GlobalStrings LitMap )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  (GlobalStrings LitMap )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
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
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (LitMap: (string -> Z)) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (output_buffer_pre = out0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (0 <= requested)) (PreH6 : (requested <= UINT_MAX)) (PreH7 : (ca0 = 0)) ,
  (GlobalStrings LitMap )
|--
  “ (CircularAreaErrorResult 1 ) ”
  &&  (GlobalStrings LitMap )
).

Definition CircularAreaRead_return_wit_6_split_goal_1 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (LitMap: (string -> Z)) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (output_buffer_pre = out0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (0 <= requested)) (PreH6 : (requested <= UINT_MAX)) (PreH7 : (ca0 = 0)) ,
  (GlobalStrings LitMap )
|--
  “ (CircularAreaErrorResult 1 ) ”
.

Definition CircularAreaRead_return_wit_6_split_goal_spatial := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (LitMap: (string -> Z)) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = ca0)) (PreH3 : (output_buffer_pre = out0)) (PreH4 : (data_length_pre = requested)) (PreH5 : (0 <= requested)) (PreH6 : (requested <= UINT_MAX)) (PreH7 : (ca0 = 0)) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
.

Definition CircularAreaRead_partial_solve_wit_1_pure := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (data_length_pre > 0)) (PreH2 : (0 <= data_length_pre)) (PreH3 : (data_length_pre <= UINT_MAX)) (PreH4 : (area_length <= UINT_MAX)) (PreH5 : (area_length >= 0)) (PreH6 : (b_status <= INT_MAX)) (PreH7 : (b_status >= INT_MIN)) (PreH8 : (output_buffer_pre <> 0)) (PreH9 : (circular_area_pre <> 0)) (PreH10 : (circular_area_pre = ca0)) (PreH11 : (output_buffer_pre = out0)) (PreH12 : (data_length_pre = requested)) (PreH13 : (0 <= requested)) (PreH14 : (requested <= UINT_MAX)) (PreH15 : (ca0 <> 0)) (PreH16 : (p_head = data_buffer)) (PreH17 : (p_tail = (data_buffer + area_length ))) (PreH18 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH19 : (out0 <> 0)) (PreH20 : (requested <= output_capacity)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ”
.

Definition CircularAreaRead_partial_solve_wit_1_aux := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (data_length_pre > 0)) (PreH2 : (0 <= data_length_pre)) (PreH3 : (data_length_pre <= UINT_MAX)) (PreH4 : (area_length <= UINT_MAX)) (PreH5 : (area_length >= 0)) (PreH6 : (b_status <= INT_MAX)) (PreH7 : (b_status >= INT_MIN)) (PreH8 : (output_buffer_pre <> 0)) (PreH9 : (circular_area_pre <> 0)) (PreH10 : (circular_area_pre = ca0)) (PreH11 : (output_buffer_pre = out0)) (PreH12 : (data_length_pre = requested)) (PreH13 : (0 <= requested)) (PreH14 : (requested <= UINT_MAX)) (PreH15 : (ca0 <> 0)) (PreH16 : (p_head = data_buffer)) (PreH17 : (p_tail = (data_buffer + area_length ))) (PreH18 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH19 : (out0 <> 0)) (PreH20 : (requested <= output_capacity)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ” 
  &&  “ (data_length_pre > 0) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= UINT_MAX) ” 
  &&  “ (area_length <= UINT_MAX) ” 
  &&  “ (area_length >= 0) ” 
  &&  “ (b_status <= INT_MAX) ” 
  &&  “ (b_status >= INT_MIN) ” 
  &&  “ (output_buffer_pre <> 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre = ca0) ” 
  &&  “ (output_buffer_pre = out0) ” 
  &&  “ (data_length_pre = requested) ” 
  &&  “ (0 <= requested) ” 
  &&  “ (requested <= UINT_MAX) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (requested <= output_capacity) ”
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
  **  (UCharArray.full out0 output_capacity output_before )
.

Definition CircularAreaRead_partial_solve_wit_1 := CircularAreaRead_partial_solve_wit_1_pure -> CircularAreaRead_partial_solve_wit_1_aux.

Definition CircularAreaRead_partial_solve_wit_2_pure := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (PreH1 : (CircularAreaEmptyResult readidx writeidx b_status retval )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (data_length_pre > 0)) (PreH6 : (0 <= data_length_pre)) (PreH7 : (data_length_pre <= UINT_MAX)) (PreH8 : (area_length <= UINT_MAX)) (PreH9 : (area_length >= 0)) (PreH10 : (b_status <= INT_MAX)) (PreH11 : (b_status >= INT_MIN)) (PreH12 : (output_buffer_pre <> 0)) (PreH13 : (circular_area_pre <> 0)) (PreH14 : (circular_area_pre = ca0)) (PreH15 : (output_buffer_pre = out0)) (PreH16 : (data_length_pre = requested)) (PreH17 : (0 <= requested)) (PreH18 : (requested <= UINT_MAX)) (PreH19 : (ca0 <> 0)) (PreH20 : (p_head = data_buffer)) (PreH21 : (p_tail = (data_buffer + area_length ))) (PreH22 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH23 : (out0 <> 0)) (PreH24 : (requested <= output_capacity)) (PreH25 : (retval = 0)) ,
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
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ”
.

Definition CircularAreaRead_partial_solve_wit_2_aux := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (PreH1 : (CircularAreaEmptyResult readidx writeidx b_status retval )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (data_length_pre > 0)) (PreH6 : (0 <= data_length_pre)) (PreH7 : (data_length_pre <= UINT_MAX)) (PreH8 : (area_length <= UINT_MAX)) (PreH9 : (area_length >= 0)) (PreH10 : (b_status <= INT_MAX)) (PreH11 : (b_status >= INT_MIN)) (PreH12 : (output_buffer_pre <> 0)) (PreH13 : (circular_area_pre <> 0)) (PreH14 : (circular_area_pre = ca0)) (PreH15 : (output_buffer_pre = out0)) (PreH16 : (data_length_pre = requested)) (PreH17 : (0 <= requested)) (PreH18 : (requested <= UINT_MAX)) (PreH19 : (ca0 <> 0)) (PreH20 : (p_head = data_buffer)) (PreH21 : (p_tail = (data_buffer + area_length ))) (PreH22 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH23 : (out0 <> 0)) (PreH24 : (requested <= output_capacity)) (PreH25 : (retval = 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ” 
  &&  “ (CircularAreaEmptyResult readidx writeidx b_status retval ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ” 
  &&  “ (data_length_pre > 0) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= UINT_MAX) ” 
  &&  “ (area_length <= UINT_MAX) ” 
  &&  “ (area_length >= 0) ” 
  &&  “ (b_status <= INT_MAX) ” 
  &&  “ (b_status >= INT_MIN) ” 
  &&  “ (output_buffer_pre <> 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre = ca0) ” 
  &&  “ (output_buffer_pre = out0) ” 
  &&  “ (data_length_pre = requested) ” 
  &&  “ (0 <= requested) ” 
  &&  “ (requested <= UINT_MAX) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (requested <= output_capacity) ” 
  &&  “ (retval = 0) ”
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
  **  (UCharArray.full out0 output_capacity output_before )
.

Definition CircularAreaRead_partial_solve_wit_2 := CircularAreaRead_partial_solve_wit_2_pure -> CircularAreaRead_partial_solve_wit_2_aux.

Definition CircularAreaRead_partial_solve_wit_3_pure := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (PreH1 : (data_length_pre > retval_2)) (PreH2 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH3 : (p_head = data_buffer)) (PreH4 : (p_tail = (data_buffer + area_length ))) (PreH5 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH6 : (CircularAreaEmptyResult readidx writeidx b_status retval )) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (data_length_pre > 0)) (PreH11 : (0 <= data_length_pre)) (PreH12 : (data_length_pre <= UINT_MAX)) (PreH13 : (area_length <= UINT_MAX)) (PreH14 : (area_length >= 0)) (PreH15 : (b_status <= INT_MAX)) (PreH16 : (b_status >= INT_MIN)) (PreH17 : (output_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = ca0)) (PreH20 : (output_buffer_pre = out0)) (PreH21 : (data_length_pre = requested)) (PreH22 : (0 <= requested)) (PreH23 : (requested <= UINT_MAX)) (PreH24 : (ca0 <> 0)) (PreH25 : (p_head = data_buffer)) (PreH26 : (p_tail = (data_buffer + area_length ))) (PreH27 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH28 : (out0 <> 0)) (PreH29 : (requested <= output_capacity)) (PreH30 : (retval = 0)) ,
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
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ”
.

Definition CircularAreaRead_partial_solve_wit_3_aux := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (PreH1 : (data_length_pre > retval_2)) (PreH2 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH3 : (p_head = data_buffer)) (PreH4 : (p_tail = (data_buffer + area_length ))) (PreH5 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH6 : (CircularAreaEmptyResult readidx writeidx b_status retval )) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (data_length_pre > 0)) (PreH11 : (0 <= data_length_pre)) (PreH12 : (data_length_pre <= UINT_MAX)) (PreH13 : (area_length <= UINT_MAX)) (PreH14 : (area_length >= 0)) (PreH15 : (b_status <= INT_MAX)) (PreH16 : (b_status >= INT_MIN)) (PreH17 : (output_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = ca0)) (PreH20 : (output_buffer_pre = out0)) (PreH21 : (data_length_pre = requested)) (PreH22 : (0 <= requested)) (PreH23 : (requested <= UINT_MAX)) (PreH24 : (ca0 <> 0)) (PreH25 : (p_head = data_buffer)) (PreH26 : (p_tail = (data_buffer + area_length ))) (PreH27 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH28 : (out0 <> 0)) (PreH29 : (requested <= output_capacity)) (PreH30 : (retval = 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ” 
  &&  “ (data_length_pre > retval_2) ” 
  &&  “ (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ” 
  &&  “ (CircularAreaEmptyResult readidx writeidx b_status retval ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ” 
  &&  “ (data_length_pre > 0) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= UINT_MAX) ” 
  &&  “ (area_length <= UINT_MAX) ” 
  &&  “ (area_length >= 0) ” 
  &&  “ (b_status <= INT_MAX) ” 
  &&  “ (b_status >= INT_MIN) ” 
  &&  “ (output_buffer_pre <> 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre = ca0) ” 
  &&  “ (output_buffer_pre = out0) ” 
  &&  “ (data_length_pre = requested) ” 
  &&  “ (0 <= requested) ” 
  &&  “ (requested <= UINT_MAX) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (requested <= output_capacity) ” 
  &&  “ (retval = 0) ”
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
  **  (UCharArray.full out0 output_capacity output_before )
.

Definition CircularAreaRead_partial_solve_wit_3 := CircularAreaRead_partial_solve_wit_3_pure -> CircularAreaRead_partial_solve_wit_3_aux.

Definition CircularAreaRead_partial_solve_wit_4_pure := 
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (data_length_pre > retval_3)) (PreH6 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_3 )) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (CircularAreaEmptyResult readidx writeidx b_status retval_2 )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (area_length <= UINT_MAX)) (PreH18 : (area_length >= 0)) (PreH19 : (b_status <= INT_MAX)) (PreH20 : (b_status >= INT_MIN)) (PreH21 : (output_buffer_pre <> 0)) (PreH22 : (circular_area_pre <> 0)) (PreH23 : (circular_area_pre = ca0)) (PreH24 : (output_buffer_pre = out0)) (PreH25 : (data_length_pre = requested)) (PreH26 : (0 <= requested)) (PreH27 : (requested <= UINT_MAX)) (PreH28 : (ca0 <> 0)) (PreH29 : (p_head = data_buffer)) (PreH30 : (p_tail = (data_buffer + area_length ))) (PreH31 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH32 : (out0 <> 0)) (PreH33 : (requested <= output_capacity)) (PreH34 : (retval_2 = 0)) ,
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
  **  ((( &( "data_length" ) )) # UInt  |-> retval)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ” 
  &&  “ ((readidx + retval ) <= UINT_MAX) ” 
  &&  “ (retval <= area_length) ” 
  &&  “ (0 <= retval) ”
) \/
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (retval <= UINT_MAX)) (PreH2 : (retval >= 0)) (PreH3 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH4 : (p_head = data_buffer)) (PreH5 : (p_tail = (data_buffer + area_length ))) (PreH6 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH7 : (data_length_pre > retval_3)) (PreH8 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_3 )) (PreH9 : (p_head = data_buffer)) (PreH10 : (p_tail = (data_buffer + area_length ))) (PreH11 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH12 : (CircularAreaEmptyResult readidx writeidx b_status retval_2 )) (PreH13 : (p_head = data_buffer)) (PreH14 : (p_tail = (data_buffer + area_length ))) (PreH15 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH16 : (data_length_pre > 0)) (PreH17 : (0 <= data_length_pre)) (PreH18 : (data_length_pre <= UINT_MAX)) (PreH19 : (area_length <= UINT_MAX)) (PreH20 : (area_length >= 0)) (PreH21 : (b_status <= INT_MAX)) (PreH22 : (b_status >= INT_MIN)) (PreH23 : (output_buffer_pre <> 0)) (PreH24 : (circular_area_pre <> 0)) (PreH25 : (circular_area_pre = ca0)) (PreH26 : (output_buffer_pre = out0)) (PreH27 : (data_length_pre = requested)) (PreH28 : (0 <= requested)) (PreH29 : (requested <= UINT_MAX)) (PreH30 : (ca0 <> 0)) (PreH31 : (p_head = data_buffer)) (PreH32 : (p_tail = (data_buffer + area_length ))) (PreH33 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH34 : (out0 <> 0)) (PreH35 : (requested <= output_capacity)) (PreH36 : (retval_2 = 0)) ,
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
  **  ((( &( "data_length" ) )) # UInt  |-> retval)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (retval <= area_length) ” 
  &&  “ ((readidx + retval ) <= UINT_MAX) ”
).

Definition CircularAreaRead_partial_solve_wit_4_pure_split_goal_1 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (retval <= UINT_MAX)) (PreH2 : (retval >= 0)) (PreH3 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH4 : (p_head = data_buffer)) (PreH5 : (p_tail = (data_buffer + area_length ))) (PreH6 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH7 : (data_length_pre > retval_3)) (PreH8 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_3 )) (PreH9 : (p_head = data_buffer)) (PreH10 : (p_tail = (data_buffer + area_length ))) (PreH11 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH12 : (CircularAreaEmptyResult readidx writeidx b_status retval_2 )) (PreH13 : (p_head = data_buffer)) (PreH14 : (p_tail = (data_buffer + area_length ))) (PreH15 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH16 : (data_length_pre > 0)) (PreH17 : (0 <= data_length_pre)) (PreH18 : (data_length_pre <= UINT_MAX)) (PreH19 : (area_length <= UINT_MAX)) (PreH20 : (area_length >= 0)) (PreH21 : (b_status <= INT_MAX)) (PreH22 : (b_status >= INT_MIN)) (PreH23 : (output_buffer_pre <> 0)) (PreH24 : (circular_area_pre <> 0)) (PreH25 : (circular_area_pre = ca0)) (PreH26 : (output_buffer_pre = out0)) (PreH27 : (data_length_pre = requested)) (PreH28 : (0 <= requested)) (PreH29 : (requested <= UINT_MAX)) (PreH30 : (ca0 <> 0)) (PreH31 : (p_head = data_buffer)) (PreH32 : (p_tail = (data_buffer + area_length ))) (PreH33 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH34 : (out0 <> 0)) (PreH35 : (requested <= output_capacity)) (PreH36 : (retval_2 = 0)) ,
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
  **  ((( &( "data_length" ) )) # UInt  |-> retval)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (retval <= area_length) ”
.

Definition CircularAreaRead_partial_solve_wit_4_pure_split_goal_2 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (retval <= UINT_MAX)) (PreH2 : (retval >= 0)) (PreH3 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH4 : (p_head = data_buffer)) (PreH5 : (p_tail = (data_buffer + area_length ))) (PreH6 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH7 : (data_length_pre > retval_3)) (PreH8 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_3 )) (PreH9 : (p_head = data_buffer)) (PreH10 : (p_tail = (data_buffer + area_length ))) (PreH11 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH12 : (CircularAreaEmptyResult readidx writeidx b_status retval_2 )) (PreH13 : (p_head = data_buffer)) (PreH14 : (p_tail = (data_buffer + area_length ))) (PreH15 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH16 : (data_length_pre > 0)) (PreH17 : (0 <= data_length_pre)) (PreH18 : (data_length_pre <= UINT_MAX)) (PreH19 : (area_length <= UINT_MAX)) (PreH20 : (area_length >= 0)) (PreH21 : (b_status <= INT_MAX)) (PreH22 : (b_status >= INT_MIN)) (PreH23 : (output_buffer_pre <> 0)) (PreH24 : (circular_area_pre <> 0)) (PreH25 : (circular_area_pre = ca0)) (PreH26 : (output_buffer_pre = out0)) (PreH27 : (data_length_pre = requested)) (PreH28 : (0 <= requested)) (PreH29 : (requested <= UINT_MAX)) (PreH30 : (ca0 <> 0)) (PreH31 : (p_head = data_buffer)) (PreH32 : (p_tail = (data_buffer + area_length ))) (PreH33 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH34 : (out0 <> 0)) (PreH35 : (requested <= output_capacity)) (PreH36 : (retval_2 = 0)) ,
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
  **  ((( &( "data_length" ) )) # UInt  |-> retval)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ ((readidx + retval ) <= UINT_MAX) ”
.

Definition CircularAreaRead_partial_solve_wit_4_aux := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH2 : (p_head = data_buffer)) (PreH3 : (p_tail = (data_buffer + area_length ))) (PreH4 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH5 : (data_length_pre > retval_3)) (PreH6 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_3 )) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (CircularAreaEmptyResult readidx writeidx b_status retval_2 )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH14 : (data_length_pre > 0)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= UINT_MAX)) (PreH17 : (area_length <= UINT_MAX)) (PreH18 : (area_length >= 0)) (PreH19 : (b_status <= INT_MAX)) (PreH20 : (b_status >= INT_MIN)) (PreH21 : (output_buffer_pre <> 0)) (PreH22 : (circular_area_pre <> 0)) (PreH23 : (circular_area_pre = ca0)) (PreH24 : (output_buffer_pre = out0)) (PreH25 : (data_length_pre = requested)) (PreH26 : (0 <= requested)) (PreH27 : (requested <= UINT_MAX)) (PreH28 : (ca0 <> 0)) (PreH29 : (p_head = data_buffer)) (PreH30 : (p_tail = (data_buffer + area_length ))) (PreH31 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH32 : (out0 <> 0)) (PreH33 : (requested <= output_capacity)) (PreH34 : (retval_2 = 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ” 
  &&  “ ((readidx + retval ) <= UINT_MAX) ” 
  &&  “ (retval <= area_length) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (CircularAreaDataLengthResult readidx writeidx area_length b_status retval ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ” 
  &&  “ (data_length_pre > retval_3) ” 
  &&  “ (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_3 ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ” 
  &&  “ (CircularAreaEmptyResult readidx writeidx b_status retval_2 ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ” 
  &&  “ (data_length_pre > 0) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= UINT_MAX) ” 
  &&  “ (area_length <= UINT_MAX) ” 
  &&  “ (area_length >= 0) ” 
  &&  “ (b_status <= INT_MAX) ” 
  &&  “ (b_status >= INT_MIN) ” 
  &&  “ (output_buffer_pre <> 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre = ca0) ” 
  &&  “ (output_buffer_pre = out0) ” 
  &&  “ (data_length_pre = requested) ” 
  &&  “ (0 <= requested) ” 
  &&  “ (requested <= UINT_MAX) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (requested <= output_capacity) ” 
  &&  “ (retval_2 = 0) ”
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
  **  (UCharArray.full out0 output_capacity output_before )
.

Definition CircularAreaRead_partial_solve_wit_4 := CircularAreaRead_partial_solve_wit_4_pure -> CircularAreaRead_partial_solve_wit_4_aux.

Definition CircularAreaRead_partial_solve_wit_5_pure := 
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (PreH1 : (data_length_pre <= retval_2)) (PreH2 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH3 : (p_head = data_buffer)) (PreH4 : (p_tail = (data_buffer + area_length ))) (PreH5 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH6 : (CircularAreaEmptyResult readidx writeidx b_status retval )) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (data_length_pre > 0)) (PreH11 : (0 <= data_length_pre)) (PreH12 : (data_length_pre <= UINT_MAX)) (PreH13 : (area_length <= UINT_MAX)) (PreH14 : (area_length >= 0)) (PreH15 : (b_status <= INT_MAX)) (PreH16 : (b_status >= INT_MIN)) (PreH17 : (output_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = ca0)) (PreH20 : (output_buffer_pre = out0)) (PreH21 : (data_length_pre = requested)) (PreH22 : (0 <= requested)) (PreH23 : (requested <= UINT_MAX)) (PreH24 : (ca0 <> 0)) (PreH25 : (p_head = data_buffer)) (PreH26 : (p_tail = (data_buffer + area_length ))) (PreH27 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH28 : (out0 <> 0)) (PreH29 : (requested <= output_capacity)) (PreH30 : (retval = 0)) ,
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
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= area_length) ” 
  &&  “ ((readidx + data_length_pre ) <= UINT_MAX) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ” 
  &&  “ ((readidx + requested ) <= UINT_MAX) ” 
  &&  “ (requested <= area_length) ”
) \/
(
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (PreH1 : (data_length_pre >= 0)) (PreH2 : (data_length_pre <= retval_2)) (PreH3 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH4 : (p_head = data_buffer)) (PreH5 : (p_tail = (data_buffer + area_length ))) (PreH6 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH7 : (CircularAreaEmptyResult readidx writeidx b_status retval )) (PreH8 : (p_head = data_buffer)) (PreH9 : (p_tail = (data_buffer + area_length ))) (PreH10 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH11 : (data_length_pre > 0)) (PreH12 : (0 <= data_length_pre)) (PreH13 : (data_length_pre <= UINT_MAX)) (PreH14 : (area_length <= UINT_MAX)) (PreH15 : (area_length >= 0)) (PreH16 : (b_status <= INT_MAX)) (PreH17 : (b_status >= INT_MIN)) (PreH18 : (output_buffer_pre <> 0)) (PreH19 : (circular_area_pre <> 0)) (PreH20 : (circular_area_pre = ca0)) (PreH21 : (output_buffer_pre = out0)) (PreH22 : (data_length_pre = requested)) (PreH23 : (0 <= requested)) (PreH24 : (requested <= UINT_MAX)) (PreH25 : (ca0 <> 0)) (PreH26 : (p_head = data_buffer)) (PreH27 : (p_tail = (data_buffer + area_length ))) (PreH28 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH29 : (out0 <> 0)) (PreH30 : (requested <= output_capacity)) (PreH31 : (retval = 0)) ,
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
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (requested <= area_length) ” 
  &&  “ ((readidx + requested ) <= UINT_MAX) ” 
  &&  “ ((readidx + data_length_pre ) <= UINT_MAX) ” 
  &&  “ (data_length_pre <= area_length) ”
).

Definition CircularAreaRead_partial_solve_wit_5_pure_split_goal_1 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (PreH1 : (data_length_pre >= 0)) (PreH2 : (data_length_pre <= retval_2)) (PreH3 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH4 : (p_head = data_buffer)) (PreH5 : (p_tail = (data_buffer + area_length ))) (PreH6 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH7 : (CircularAreaEmptyResult readidx writeidx b_status retval )) (PreH8 : (p_head = data_buffer)) (PreH9 : (p_tail = (data_buffer + area_length ))) (PreH10 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH11 : (data_length_pre > 0)) (PreH12 : (0 <= data_length_pre)) (PreH13 : (data_length_pre <= UINT_MAX)) (PreH14 : (area_length <= UINT_MAX)) (PreH15 : (area_length >= 0)) (PreH16 : (b_status <= INT_MAX)) (PreH17 : (b_status >= INT_MIN)) (PreH18 : (output_buffer_pre <> 0)) (PreH19 : (circular_area_pre <> 0)) (PreH20 : (circular_area_pre = ca0)) (PreH21 : (output_buffer_pre = out0)) (PreH22 : (data_length_pre = requested)) (PreH23 : (0 <= requested)) (PreH24 : (requested <= UINT_MAX)) (PreH25 : (ca0 <> 0)) (PreH26 : (p_head = data_buffer)) (PreH27 : (p_tail = (data_buffer + area_length ))) (PreH28 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH29 : (out0 <> 0)) (PreH30 : (requested <= output_capacity)) (PreH31 : (retval = 0)) ,
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
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (requested <= area_length) ”
.

Definition CircularAreaRead_partial_solve_wit_5_pure_split_goal_2 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (PreH1 : (data_length_pre >= 0)) (PreH2 : (data_length_pre <= retval_2)) (PreH3 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH4 : (p_head = data_buffer)) (PreH5 : (p_tail = (data_buffer + area_length ))) (PreH6 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH7 : (CircularAreaEmptyResult readidx writeidx b_status retval )) (PreH8 : (p_head = data_buffer)) (PreH9 : (p_tail = (data_buffer + area_length ))) (PreH10 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH11 : (data_length_pre > 0)) (PreH12 : (0 <= data_length_pre)) (PreH13 : (data_length_pre <= UINT_MAX)) (PreH14 : (area_length <= UINT_MAX)) (PreH15 : (area_length >= 0)) (PreH16 : (b_status <= INT_MAX)) (PreH17 : (b_status >= INT_MIN)) (PreH18 : (output_buffer_pre <> 0)) (PreH19 : (circular_area_pre <> 0)) (PreH20 : (circular_area_pre = ca0)) (PreH21 : (output_buffer_pre = out0)) (PreH22 : (data_length_pre = requested)) (PreH23 : (0 <= requested)) (PreH24 : (requested <= UINT_MAX)) (PreH25 : (ca0 <> 0)) (PreH26 : (p_head = data_buffer)) (PreH27 : (p_tail = (data_buffer + area_length ))) (PreH28 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH29 : (out0 <> 0)) (PreH30 : (requested <= output_capacity)) (PreH31 : (retval = 0)) ,
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
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ ((readidx + requested ) <= UINT_MAX) ”
.

Definition CircularAreaRead_partial_solve_wit_5_pure_split_goal_3 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (PreH1 : (data_length_pre >= 0)) (PreH2 : (data_length_pre <= retval_2)) (PreH3 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH4 : (p_head = data_buffer)) (PreH5 : (p_tail = (data_buffer + area_length ))) (PreH6 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH7 : (CircularAreaEmptyResult readidx writeidx b_status retval )) (PreH8 : (p_head = data_buffer)) (PreH9 : (p_tail = (data_buffer + area_length ))) (PreH10 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH11 : (data_length_pre > 0)) (PreH12 : (0 <= data_length_pre)) (PreH13 : (data_length_pre <= UINT_MAX)) (PreH14 : (area_length <= UINT_MAX)) (PreH15 : (area_length >= 0)) (PreH16 : (b_status <= INT_MAX)) (PreH17 : (b_status >= INT_MIN)) (PreH18 : (output_buffer_pre <> 0)) (PreH19 : (circular_area_pre <> 0)) (PreH20 : (circular_area_pre = ca0)) (PreH21 : (output_buffer_pre = out0)) (PreH22 : (data_length_pre = requested)) (PreH23 : (0 <= requested)) (PreH24 : (requested <= UINT_MAX)) (PreH25 : (ca0 <> 0)) (PreH26 : (p_head = data_buffer)) (PreH27 : (p_tail = (data_buffer + area_length ))) (PreH28 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH29 : (out0 <> 0)) (PreH30 : (requested <= output_capacity)) (PreH31 : (retval = 0)) ,
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
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ ((readidx + data_length_pre ) <= UINT_MAX) ”
.

Definition CircularAreaRead_partial_solve_wit_5_pure_split_goal_4 := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (PreH1 : (data_length_pre >= 0)) (PreH2 : (data_length_pre <= retval_2)) (PreH3 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH4 : (p_head = data_buffer)) (PreH5 : (p_tail = (data_buffer + area_length ))) (PreH6 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH7 : (CircularAreaEmptyResult readidx writeidx b_status retval )) (PreH8 : (p_head = data_buffer)) (PreH9 : (p_tail = (data_buffer + area_length ))) (PreH10 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH11 : (data_length_pre > 0)) (PreH12 : (0 <= data_length_pre)) (PreH13 : (data_length_pre <= UINT_MAX)) (PreH14 : (area_length <= UINT_MAX)) (PreH15 : (area_length >= 0)) (PreH16 : (b_status <= INT_MAX)) (PreH17 : (b_status >= INT_MIN)) (PreH18 : (output_buffer_pre <> 0)) (PreH19 : (circular_area_pre <> 0)) (PreH20 : (circular_area_pre = ca0)) (PreH21 : (output_buffer_pre = out0)) (PreH22 : (data_length_pre = requested)) (PreH23 : (0 <= requested)) (PreH24 : (requested <= UINT_MAX)) (PreH25 : (ca0 <> 0)) (PreH26 : (p_head = data_buffer)) (PreH27 : (p_tail = (data_buffer + area_length ))) (PreH28 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH29 : (out0 <> 0)) (PreH30 : (requested <= output_capacity)) (PreH31 : (retval = 0)) ,
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
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (data_length_pre <= area_length) ”
.

Definition CircularAreaRead_partial_solve_wit_5_aux := 
forall (data_length_pre: Z) (output_buffer_pre: Z) (circular_area_pre: Z) (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (PreH1 : (data_length_pre <= retval_2)) (PreH2 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH3 : (p_head = data_buffer)) (PreH4 : (p_tail = (data_buffer + area_length ))) (PreH5 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH6 : (CircularAreaEmptyResult readidx writeidx b_status retval )) (PreH7 : (p_head = data_buffer)) (PreH8 : (p_tail = (data_buffer + area_length ))) (PreH9 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH10 : (data_length_pre > 0)) (PreH11 : (0 <= data_length_pre)) (PreH12 : (data_length_pre <= UINT_MAX)) (PreH13 : (area_length <= UINT_MAX)) (PreH14 : (area_length >= 0)) (PreH15 : (b_status <= INT_MAX)) (PreH16 : (b_status >= INT_MIN)) (PreH17 : (output_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = ca0)) (PreH20 : (output_buffer_pre = out0)) (PreH21 : (data_length_pre = requested)) (PreH22 : (0 <= requested)) (PreH23 : (requested <= UINT_MAX)) (PreH24 : (ca0 <> 0)) (PreH25 : (p_head = data_buffer)) (PreH26 : (p_tail = (data_buffer + area_length ))) (PreH27 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) (PreH28 : (out0 <> 0)) (PreH29 : (requested <= output_capacity)) (PreH30 : (retval = 0)) ,
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
  **  (UCharArray.full out0 output_capacity output_before )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= area_length) ” 
  &&  “ ((readidx + data_length_pre ) <= UINT_MAX) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ” 
  &&  “ ((readidx + requested ) <= UINT_MAX) ” 
  &&  “ (requested <= area_length) ” 
  &&  “ (data_length_pre <= retval_2) ” 
  &&  “ (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ” 
  &&  “ (CircularAreaEmptyResult readidx writeidx b_status retval ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ” 
  &&  “ (data_length_pre > 0) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= UINT_MAX) ” 
  &&  “ (area_length <= UINT_MAX) ” 
  &&  “ (area_length >= 0) ” 
  &&  “ (b_status <= INT_MAX) ” 
  &&  “ (b_status >= INT_MIN) ” 
  &&  “ (output_buffer_pre <> 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre = ca0) ” 
  &&  “ (output_buffer_pre = out0) ” 
  &&  “ (data_length_pre = requested) ” 
  &&  “ (0 <= requested) ” 
  &&  “ (requested <= UINT_MAX) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (requested <= output_capacity) ” 
  &&  “ (retval = 0) ”
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
  **  (UCharArray.full out0 output_capacity output_before )
.

Definition CircularAreaRead_partial_solve_wit_5 := CircularAreaRead_partial_solve_wit_5_pure -> CircularAreaRead_partial_solve_wit_5_aux.

Definition CircularAreaRead_partial_solve_wit_6_pure := 
(
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_up: Z) (read_len_down: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (requested > 0)) (PreH4 : (CircularAreaEmptyResult readidx writeidx b_status 0 )) (PreH5 : (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length )) (PreH6 : (0 < data_length)) (PreH7 : (data_length <= output_capacity)) (PreH8 : (0 <= readidx)) (PreH9 : (readidx < area_length)) (PreH10 : (read_len_up = (area_length - readidx ))) (PreH11 : (read_len_down = (data_length - read_len_up ))) (PreH12 : (read_len_up <= data_length)) (PreH13 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH14 : (p_head = data_buffer)) (PreH15 : (p_tail = (data_buffer + area_length ))) (PreH16 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "read_len_up" ) )) # UInt  |-> read_len_up)
  **  ((( &( "read_len_down" ) )) # UInt  |-> read_len_down)
  **  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 readidx (sublist (0) (readidx) (buffer_contents)) )
  **  (UCharArray.seg data_buffer readidx area_length (sublist (readidx) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 0 read_len_up (sublist (0) (read_len_up) (output_before)) )
  **  (UCharArray.seg out0 read_len_up output_capacity (sublist (read_len_up) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (out0 = (out0 + 0 )) ” 
  &&  “ ((data_buffer + (readidx * sizeof(UCHAR))) = (data_buffer + readidx )) ” 
  &&  “ (read_len_up = (read_len_up - 0 )) ” 
  &&  “ (read_len_up = (area_length - readidx )) ” 
  &&  “ ((Zlength ((sublist (readidx) (area_length) (buffer_contents)))) = (area_length - readidx )) ” 
  &&  “ ((Zlength ((sublist (0) (read_len_up) (output_before)))) = (read_len_up - 0 )) ”
) \/
(
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_up: Z) (read_len_down: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (read_len_down <= UINT_MAX)) (PreH3 : (read_len_up <= UINT_MAX)) (PreH4 : (data_length <= UINT_MAX)) (PreH5 : (area_length >= 0)) (PreH6 : (read_len_down >= 0)) (PreH7 : (read_len_up >= 0)) (PreH8 : (data_length >= 0)) (PreH9 : (b_status <= INT_MAX)) (PreH10 : (b_status >= INT_MIN)) (PreH11 : (ca0 <> 0)) (PreH12 : (out0 <> 0)) (PreH13 : (requested > 0)) (PreH14 : (CircularAreaEmptyResult readidx writeidx b_status 0 )) (PreH15 : (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length )) (PreH16 : (0 < data_length)) (PreH17 : (data_length <= output_capacity)) (PreH18 : (0 <= readidx)) (PreH19 : (readidx < area_length)) (PreH20 : (read_len_up = (area_length - readidx ))) (PreH21 : (read_len_down = (data_length - read_len_up ))) (PreH22 : (read_len_up <= data_length)) (PreH23 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH24 : (p_head = data_buffer)) (PreH25 : (p_tail = (data_buffer + area_length ))) (PreH26 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "read_len_up" ) )) # UInt  |-> read_len_up)
  **  ((( &( "read_len_down" ) )) # UInt  |-> read_len_down)
  **  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 readidx (sublist (0) (readidx) (buffer_contents)) )
  **  (UCharArray.seg data_buffer readidx area_length (sublist (readidx) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 0 read_len_up (sublist (0) (read_len_up) (output_before)) )
  **  (UCharArray.seg out0 read_len_up output_capacity (sublist (read_len_up) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((Zlength ((sublist (0) (read_len_up) (output_before)))) = (read_len_up - 0 )) ” 
  &&  “ ((Zlength ((sublist (readidx) (area_length) (buffer_contents)))) = (area_length - readidx )) ”
).

Definition CircularAreaRead_partial_solve_wit_6_pure_split_goal_1 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_up: Z) (read_len_down: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (read_len_down <= UINT_MAX)) (PreH3 : (read_len_up <= UINT_MAX)) (PreH4 : (data_length <= UINT_MAX)) (PreH5 : (area_length >= 0)) (PreH6 : (read_len_down >= 0)) (PreH7 : (read_len_up >= 0)) (PreH8 : (data_length >= 0)) (PreH9 : (b_status <= INT_MAX)) (PreH10 : (b_status >= INT_MIN)) (PreH11 : (ca0 <> 0)) (PreH12 : (out0 <> 0)) (PreH13 : (requested > 0)) (PreH14 : (CircularAreaEmptyResult readidx writeidx b_status 0 )) (PreH15 : (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length )) (PreH16 : (0 < data_length)) (PreH17 : (data_length <= output_capacity)) (PreH18 : (0 <= readidx)) (PreH19 : (readidx < area_length)) (PreH20 : (read_len_up = (area_length - readidx ))) (PreH21 : (read_len_down = (data_length - read_len_up ))) (PreH22 : (read_len_up <= data_length)) (PreH23 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH24 : (p_head = data_buffer)) (PreH25 : (p_tail = (data_buffer + area_length ))) (PreH26 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "read_len_up" ) )) # UInt  |-> read_len_up)
  **  ((( &( "read_len_down" ) )) # UInt  |-> read_len_down)
  **  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 readidx (sublist (0) (readidx) (buffer_contents)) )
  **  (UCharArray.seg data_buffer readidx area_length (sublist (readidx) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 0 read_len_up (sublist (0) (read_len_up) (output_before)) )
  **  (UCharArray.seg out0 read_len_up output_capacity (sublist (read_len_up) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((Zlength ((sublist (0) (read_len_up) (output_before)))) = (read_len_up - 0 )) ”
.

Definition CircularAreaRead_partial_solve_wit_6_pure_split_goal_2 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_up: Z) (read_len_down: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (read_len_down <= UINT_MAX)) (PreH3 : (read_len_up <= UINT_MAX)) (PreH4 : (data_length <= UINT_MAX)) (PreH5 : (area_length >= 0)) (PreH6 : (read_len_down >= 0)) (PreH7 : (read_len_up >= 0)) (PreH8 : (data_length >= 0)) (PreH9 : (b_status <= INT_MAX)) (PreH10 : (b_status >= INT_MIN)) (PreH11 : (ca0 <> 0)) (PreH12 : (out0 <> 0)) (PreH13 : (requested > 0)) (PreH14 : (CircularAreaEmptyResult readidx writeidx b_status 0 )) (PreH15 : (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length )) (PreH16 : (0 < data_length)) (PreH17 : (data_length <= output_capacity)) (PreH18 : (0 <= readidx)) (PreH19 : (readidx < area_length)) (PreH20 : (read_len_up = (area_length - readidx ))) (PreH21 : (read_len_down = (data_length - read_len_up ))) (PreH22 : (read_len_up <= data_length)) (PreH23 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH24 : (p_head = data_buffer)) (PreH25 : (p_tail = (data_buffer + area_length ))) (PreH26 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "read_len_up" ) )) # UInt  |-> read_len_up)
  **  ((( &( "read_len_down" ) )) # UInt  |-> read_len_down)
  **  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 readidx (sublist (0) (readidx) (buffer_contents)) )
  **  (UCharArray.seg data_buffer readidx area_length (sublist (readidx) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 0 read_len_up (sublist (0) (read_len_up) (output_before)) )
  **  (UCharArray.seg out0 read_len_up output_capacity (sublist (read_len_up) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((Zlength ((sublist (readidx) (area_length) (buffer_contents)))) = (area_length - readidx )) ”
.

Definition CircularAreaRead_partial_solve_wit_6_aux := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_up: Z) (read_len_down: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (requested > 0)) (PreH4 : (CircularAreaEmptyResult readidx writeidx b_status 0 )) (PreH5 : (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length )) (PreH6 : (0 < data_length)) (PreH7 : (data_length <= output_capacity)) (PreH8 : (0 <= readidx)) (PreH9 : (readidx < area_length)) (PreH10 : (read_len_up = (area_length - readidx ))) (PreH11 : (read_len_down = (data_length - read_len_up ))) (PreH12 : (read_len_up <= data_length)) (PreH13 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH14 : (p_head = data_buffer)) (PreH15 : (p_tail = (data_buffer + area_length ))) (PreH16 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 readidx (sublist (0) (readidx) (buffer_contents)) )
  **  (UCharArray.seg data_buffer readidx area_length (sublist (readidx) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 0 read_len_up (sublist (0) (read_len_up) (output_before)) )
  **  (UCharArray.seg out0 read_len_up output_capacity (sublist (read_len_up) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (out0 = (out0 + 0 )) ” 
  &&  “ ((data_buffer + (readidx * sizeof(UCHAR))) = (data_buffer + readidx )) ” 
  &&  “ (read_len_up = (read_len_up - 0 )) ” 
  &&  “ (read_len_up = (area_length - readidx )) ” 
  &&  “ ((Zlength ((sublist (readidx) (area_length) (buffer_contents)))) = (area_length - readidx )) ” 
  &&  “ ((Zlength ((sublist (0) (read_len_up) (output_before)))) = (read_len_up - 0 )) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaEmptyResult readidx writeidx b_status 0 ) ” 
  &&  “ (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length ) ” 
  &&  “ (0 < data_length) ” 
  &&  “ (data_length <= output_capacity) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (readidx < area_length) ” 
  &&  “ (read_len_up = (area_length - readidx )) ” 
  &&  “ (read_len_down = (data_length - read_len_up )) ” 
  &&  “ (read_len_up <= data_length) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx data_length area_length 1 ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ”
  &&  (UCharArray.seg out0 0 read_len_up (sublist (0) (read_len_up) (output_before)) )
  **  (UCharArray.seg data_buffer readidx area_length (sublist (readidx) (area_length) (buffer_contents)) )
  **  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 readidx (sublist (0) (readidx) (buffer_contents)) )
  **  (UCharArray.seg out0 read_len_up output_capacity (sublist (read_len_up) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
.

Definition CircularAreaRead_partial_solve_wit_6 := CircularAreaRead_partial_solve_wit_6_pure -> CircularAreaRead_partial_solve_wit_6_aux.

Definition CircularAreaRead_partial_solve_wit_7_pure := 
(
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_down: Z) (read_len_up: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (requested > 0)) (PreH4 : (CircularAreaEmptyResult readidx writeidx b_status 0 )) (PreH5 : (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length )) (PreH6 : (0 < data_length)) (PreH7 : (data_length <= output_capacity)) (PreH8 : (0 <= read_len_down)) (PreH9 : (read_len_down <= readidx)) (PreH10 : (read_len_up = (area_length - readidx ))) (PreH11 : (read_len_down = (data_length - read_len_up ))) (PreH12 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH13 : (p_head = data_buffer)) (PreH14 : (p_tail = (data_buffer + area_length ))) (PreH15 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "read_len_down" ) )) # UInt  |-> read_len_down)
  **  ((( &( "read_len_up" ) )) # UInt  |-> read_len_up)
  **  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 read_len_down (sublist (0) (read_len_down) (buffer_contents)) )
  **  (UCharArray.seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (buffer_contents)) )
  **  (UCharArray.seg data_buffer readidx area_length (sublist (readidx) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 0 read_len_up (sublist (readidx) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 read_len_up data_length (sublist (read_len_up) (data_length) (output_before)) )
  **  (UCharArray.seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((out0 + (read_len_up * sizeof(UCHAR))) = (out0 + read_len_up )) ” 
  &&  “ (p_head = (data_buffer + 0 )) ” 
  &&  “ (read_len_down = (data_length - read_len_up )) ” 
  &&  “ (read_len_down = (read_len_down - 0 )) ” 
  &&  “ ((Zlength ((sublist (0) (read_len_down) (buffer_contents)))) = (read_len_down - 0 )) ” 
  &&  “ ((Zlength ((sublist (read_len_up) (data_length) (output_before)))) = (data_length - read_len_up )) ”
) \/
(
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_down: Z) (read_len_up: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (read_len_up <= UINT_MAX)) (PreH3 : (read_len_down <= UINT_MAX)) (PreH4 : (data_length <= UINT_MAX)) (PreH5 : (area_length >= 0)) (PreH6 : (read_len_up >= 0)) (PreH7 : (read_len_down >= 0)) (PreH8 : (data_length >= 0)) (PreH9 : (b_status <= INT_MAX)) (PreH10 : (b_status >= INT_MIN)) (PreH11 : (ca0 <> 0)) (PreH12 : (out0 <> 0)) (PreH13 : (requested > 0)) (PreH14 : (CircularAreaEmptyResult readidx writeidx b_status 0 )) (PreH15 : (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length )) (PreH16 : (0 < data_length)) (PreH17 : (data_length <= output_capacity)) (PreH18 : (0 <= read_len_down)) (PreH19 : (read_len_down <= readidx)) (PreH20 : (read_len_up = (area_length - readidx ))) (PreH21 : (read_len_down = (data_length - read_len_up ))) (PreH22 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH23 : (p_head = data_buffer)) (PreH24 : (p_tail = (data_buffer + area_length ))) (PreH25 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "read_len_down" ) )) # UInt  |-> read_len_down)
  **  ((( &( "read_len_up" ) )) # UInt  |-> read_len_up)
  **  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 read_len_down (sublist (0) (read_len_down) (buffer_contents)) )
  **  (UCharArray.seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (buffer_contents)) )
  **  (UCharArray.seg data_buffer readidx area_length (sublist (readidx) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 0 read_len_up (sublist (readidx) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 read_len_up data_length (sublist (read_len_up) (data_length) (output_before)) )
  **  (UCharArray.seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((Zlength ((sublist (read_len_up) (data_length) (output_before)))) = (data_length - read_len_up )) ” 
  &&  “ ((Zlength ((sublist (0) (read_len_down) (buffer_contents)))) = (read_len_down - 0 )) ”
).

Definition CircularAreaRead_partial_solve_wit_7_pure_split_goal_1 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_down: Z) (read_len_up: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (read_len_up <= UINT_MAX)) (PreH3 : (read_len_down <= UINT_MAX)) (PreH4 : (data_length <= UINT_MAX)) (PreH5 : (area_length >= 0)) (PreH6 : (read_len_up >= 0)) (PreH7 : (read_len_down >= 0)) (PreH8 : (data_length >= 0)) (PreH9 : (b_status <= INT_MAX)) (PreH10 : (b_status >= INT_MIN)) (PreH11 : (ca0 <> 0)) (PreH12 : (out0 <> 0)) (PreH13 : (requested > 0)) (PreH14 : (CircularAreaEmptyResult readidx writeidx b_status 0 )) (PreH15 : (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length )) (PreH16 : (0 < data_length)) (PreH17 : (data_length <= output_capacity)) (PreH18 : (0 <= read_len_down)) (PreH19 : (read_len_down <= readidx)) (PreH20 : (read_len_up = (area_length - readidx ))) (PreH21 : (read_len_down = (data_length - read_len_up ))) (PreH22 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH23 : (p_head = data_buffer)) (PreH24 : (p_tail = (data_buffer + area_length ))) (PreH25 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "read_len_down" ) )) # UInt  |-> read_len_down)
  **  ((( &( "read_len_up" ) )) # UInt  |-> read_len_up)
  **  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 read_len_down (sublist (0) (read_len_down) (buffer_contents)) )
  **  (UCharArray.seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (buffer_contents)) )
  **  (UCharArray.seg data_buffer readidx area_length (sublist (readidx) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 0 read_len_up (sublist (readidx) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 read_len_up data_length (sublist (read_len_up) (data_length) (output_before)) )
  **  (UCharArray.seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((Zlength ((sublist (read_len_up) (data_length) (output_before)))) = (data_length - read_len_up )) ”
.

Definition CircularAreaRead_partial_solve_wit_7_pure_split_goal_2 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_down: Z) (read_len_up: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (read_len_up <= UINT_MAX)) (PreH3 : (read_len_down <= UINT_MAX)) (PreH4 : (data_length <= UINT_MAX)) (PreH5 : (area_length >= 0)) (PreH6 : (read_len_up >= 0)) (PreH7 : (read_len_down >= 0)) (PreH8 : (data_length >= 0)) (PreH9 : (b_status <= INT_MAX)) (PreH10 : (b_status >= INT_MIN)) (PreH11 : (ca0 <> 0)) (PreH12 : (out0 <> 0)) (PreH13 : (requested > 0)) (PreH14 : (CircularAreaEmptyResult readidx writeidx b_status 0 )) (PreH15 : (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length )) (PreH16 : (0 < data_length)) (PreH17 : (data_length <= output_capacity)) (PreH18 : (0 <= read_len_down)) (PreH19 : (read_len_down <= readidx)) (PreH20 : (read_len_up = (area_length - readidx ))) (PreH21 : (read_len_down = (data_length - read_len_up ))) (PreH22 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH23 : (p_head = data_buffer)) (PreH24 : (p_tail = (data_buffer + area_length ))) (PreH25 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "read_len_down" ) )) # UInt  |-> read_len_down)
  **  ((( &( "read_len_up" ) )) # UInt  |-> read_len_up)
  **  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 read_len_down (sublist (0) (read_len_down) (buffer_contents)) )
  **  (UCharArray.seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (buffer_contents)) )
  **  (UCharArray.seg data_buffer readidx area_length (sublist (readidx) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 0 read_len_up (sublist (readidx) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 read_len_up data_length (sublist (read_len_up) (data_length) (output_before)) )
  **  (UCharArray.seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((Zlength ((sublist (0) (read_len_down) (buffer_contents)))) = (read_len_down - 0 )) ”
.

Definition CircularAreaRead_partial_solve_wit_7_aux := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (read_len_down: Z) (read_len_up: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (requested > 0)) (PreH4 : (CircularAreaEmptyResult readidx writeidx b_status 0 )) (PreH5 : (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length )) (PreH6 : (0 < data_length)) (PreH7 : (data_length <= output_capacity)) (PreH8 : (0 <= read_len_down)) (PreH9 : (read_len_down <= readidx)) (PreH10 : (read_len_up = (area_length - readidx ))) (PreH11 : (read_len_down = (data_length - read_len_up ))) (PreH12 : (CircularAreaDivideRdDataResult readidx data_length area_length 1 )) (PreH13 : (p_head = data_buffer)) (PreH14 : (p_tail = (data_buffer + area_length ))) (PreH15 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 read_len_down (sublist (0) (read_len_down) (buffer_contents)) )
  **  (UCharArray.seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (buffer_contents)) )
  **  (UCharArray.seg data_buffer readidx area_length (sublist (readidx) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 0 read_len_up (sublist (readidx) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 read_len_up data_length (sublist (read_len_up) (data_length) (output_before)) )
  **  (UCharArray.seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((out0 + (read_len_up * sizeof(UCHAR))) = (out0 + read_len_up )) ” 
  &&  “ (p_head = (data_buffer + 0 )) ” 
  &&  “ (read_len_down = (data_length - read_len_up )) ” 
  &&  “ (read_len_down = (read_len_down - 0 )) ” 
  &&  “ ((Zlength ((sublist (0) (read_len_down) (buffer_contents)))) = (read_len_down - 0 )) ” 
  &&  “ ((Zlength ((sublist (read_len_up) (data_length) (output_before)))) = (data_length - read_len_up )) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaEmptyResult readidx writeidx b_status 0 ) ” 
  &&  “ (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length ) ” 
  &&  “ (0 < data_length) ” 
  &&  “ (data_length <= output_capacity) ” 
  &&  “ (0 <= read_len_down) ” 
  &&  “ (read_len_down <= readidx) ” 
  &&  “ (read_len_up = (area_length - readidx )) ” 
  &&  “ (read_len_down = (data_length - read_len_up )) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx data_length area_length 1 ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ”
  &&  (UCharArray.seg out0 read_len_up data_length (sublist (read_len_up) (data_length) (output_before)) )
  **  (UCharArray.seg data_buffer 0 read_len_down (sublist (0) (read_len_down) (buffer_contents)) )
  **  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer read_len_down readidx (sublist (read_len_down) (readidx) (buffer_contents)) )
  **  (UCharArray.seg data_buffer readidx area_length (sublist (readidx) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 0 read_len_up (sublist (readidx) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
.

Definition CircularAreaRead_partial_solve_wit_7 := CircularAreaRead_partial_solve_wit_7_pure -> CircularAreaRead_partial_solve_wit_7_aux.

Definition CircularAreaRead_partial_solve_wit_8_pure := 
(
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (requested > 0)) (PreH4 : (CircularAreaEmptyResult readidx writeidx b_status 0 )) (PreH5 : (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length )) (PreH6 : (0 < data_length)) (PreH7 : (data_length <= output_capacity)) (PreH8 : (0 <= readidx)) (PreH9 : ((readidx + data_length ) <= area_length)) (PreH10 : (CircularAreaDivideRdDataResult readidx data_length area_length 0 )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 readidx (sublist (0) (readidx) (buffer_contents)) )
  **  (UCharArray.seg data_buffer readidx (readidx + data_length ) (sublist (readidx) ((readidx + data_length )) (buffer_contents)) )
  **  (UCharArray.seg data_buffer (readidx + data_length ) area_length (sublist ((readidx + data_length )) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 0 data_length (sublist (0) (data_length) (output_before)) )
  **  (UCharArray.seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (out0 = (out0 + 0 )) ” 
  &&  “ ((data_buffer + (readidx * sizeof(UCHAR))) = (data_buffer + readidx )) ” 
  &&  “ (data_length = (data_length - 0 )) ” 
  &&  “ (data_length = ((readidx + data_length ) - readidx )) ” 
  &&  “ ((Zlength ((sublist (readidx) ((readidx + data_length )) (buffer_contents)))) = ((readidx + data_length ) - readidx )) ” 
  &&  “ ((Zlength ((sublist (0) (data_length) (output_before)))) = (data_length - 0 )) ”
) \/
(
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (data_length <= UINT_MAX)) (PreH3 : (area_length >= 0)) (PreH4 : (data_length >= 0)) (PreH5 : (b_status <= INT_MAX)) (PreH6 : (b_status >= INT_MIN)) (PreH7 : (ca0 <> 0)) (PreH8 : (out0 <> 0)) (PreH9 : (requested > 0)) (PreH10 : (CircularAreaEmptyResult readidx writeidx b_status 0 )) (PreH11 : (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length )) (PreH12 : (0 < data_length)) (PreH13 : (data_length <= output_capacity)) (PreH14 : (0 <= readidx)) (PreH15 : ((readidx + data_length ) <= area_length)) (PreH16 : (CircularAreaDivideRdDataResult readidx data_length area_length 0 )) (PreH17 : (p_head = data_buffer)) (PreH18 : (p_tail = (data_buffer + area_length ))) (PreH19 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 readidx (sublist (0) (readidx) (buffer_contents)) )
  **  (UCharArray.seg data_buffer readidx (readidx + data_length ) (sublist (readidx) ((readidx + data_length )) (buffer_contents)) )
  **  (UCharArray.seg data_buffer (readidx + data_length ) area_length (sublist ((readidx + data_length )) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 0 data_length (sublist (0) (data_length) (output_before)) )
  **  (UCharArray.seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((Zlength ((sublist (0) (data_length) (output_before)))) = (data_length - 0 )) ” 
  &&  “ ((Zlength ((sublist (readidx) ((readidx + data_length )) (buffer_contents)))) = ((readidx + data_length ) - readidx )) ”
).

Definition CircularAreaRead_partial_solve_wit_8_pure_split_goal_1 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (data_length <= UINT_MAX)) (PreH3 : (area_length >= 0)) (PreH4 : (data_length >= 0)) (PreH5 : (b_status <= INT_MAX)) (PreH6 : (b_status >= INT_MIN)) (PreH7 : (ca0 <> 0)) (PreH8 : (out0 <> 0)) (PreH9 : (requested > 0)) (PreH10 : (CircularAreaEmptyResult readidx writeidx b_status 0 )) (PreH11 : (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length )) (PreH12 : (0 < data_length)) (PreH13 : (data_length <= output_capacity)) (PreH14 : (0 <= readidx)) (PreH15 : ((readidx + data_length ) <= area_length)) (PreH16 : (CircularAreaDivideRdDataResult readidx data_length area_length 0 )) (PreH17 : (p_head = data_buffer)) (PreH18 : (p_tail = (data_buffer + area_length ))) (PreH19 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 readidx (sublist (0) (readidx) (buffer_contents)) )
  **  (UCharArray.seg data_buffer readidx (readidx + data_length ) (sublist (readidx) ((readidx + data_length )) (buffer_contents)) )
  **  (UCharArray.seg data_buffer (readidx + data_length ) area_length (sublist ((readidx + data_length )) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 0 data_length (sublist (0) (data_length) (output_before)) )
  **  (UCharArray.seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((Zlength ((sublist (0) (data_length) (output_before)))) = (data_length - 0 )) ”
.

Definition CircularAreaRead_partial_solve_wit_8_pure_split_goal_2 := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (data_length <= UINT_MAX)) (PreH3 : (area_length >= 0)) (PreH4 : (data_length >= 0)) (PreH5 : (b_status <= INT_MAX)) (PreH6 : (b_status >= INT_MIN)) (PreH7 : (ca0 <> 0)) (PreH8 : (out0 <> 0)) (PreH9 : (requested > 0)) (PreH10 : (CircularAreaEmptyResult readidx writeidx b_status 0 )) (PreH11 : (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length )) (PreH12 : (0 < data_length)) (PreH13 : (data_length <= output_capacity)) (PreH14 : (0 <= readidx)) (PreH15 : ((readidx + data_length ) <= area_length)) (PreH16 : (CircularAreaDivideRdDataResult readidx data_length area_length 0 )) (PreH17 : (p_head = data_buffer)) (PreH18 : (p_tail = (data_buffer + area_length ))) (PreH19 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> ca0)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> out0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 readidx (sublist (0) (readidx) (buffer_contents)) )
  **  (UCharArray.seg data_buffer readidx (readidx + data_length ) (sublist (readidx) ((readidx + data_length )) (buffer_contents)) )
  **  (UCharArray.seg data_buffer (readidx + data_length ) area_length (sublist ((readidx + data_length )) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 0 data_length (sublist (0) (data_length) (output_before)) )
  **  (UCharArray.seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ ((Zlength ((sublist (readidx) ((readidx + data_length )) (buffer_contents)))) = ((readidx + data_length ) - readidx )) ”
.

Definition CircularAreaRead_partial_solve_wit_8_aux := 
forall (requested: Z) (out0: Z) (ca0: Z) (output_before: (@list Z)) (output_capacity: Z) (buffer_contents: (@list Z)) (LitMap: (string -> Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (PreH1 : (ca0 <> 0)) (PreH2 : (out0 <> 0)) (PreH3 : (requested > 0)) (PreH4 : (CircularAreaEmptyResult readidx writeidx b_status 0 )) (PreH5 : (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length )) (PreH6 : (0 < data_length)) (PreH7 : (data_length <= output_capacity)) (PreH8 : (0 <= readidx)) (PreH9 : ((readidx + data_length ) <= area_length)) (PreH10 : (CircularAreaDivideRdDataResult readidx data_length area_length 0 )) (PreH11 : (p_head = data_buffer)) (PreH12 : (p_tail = (data_buffer + area_length ))) (PreH13 : (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 readidx (sublist (0) (readidx) (buffer_contents)) )
  **  (UCharArray.seg data_buffer readidx (readidx + data_length ) (sublist (readidx) ((readidx + data_length )) (buffer_contents)) )
  **  (UCharArray.seg data_buffer (readidx + data_length ) area_length (sublist ((readidx + data_length )) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 0 data_length (sublist (0) (data_length) (output_before)) )
  **  (UCharArray.seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((ca0)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((ca0)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((ca0)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
|--
  “ (out0 = (out0 + 0 )) ” 
  &&  “ ((data_buffer + (readidx * sizeof(UCHAR))) = (data_buffer + readidx )) ” 
  &&  “ (data_length = (data_length - 0 )) ” 
  &&  “ (data_length = ((readidx + data_length ) - readidx )) ” 
  &&  “ ((Zlength ((sublist (readidx) ((readidx + data_length )) (buffer_contents)))) = ((readidx + data_length ) - readidx )) ” 
  &&  “ ((Zlength ((sublist (0) (data_length) (output_before)))) = (data_length - 0 )) ” 
  &&  “ (ca0 <> 0) ” 
  &&  “ (out0 <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (CircularAreaEmptyResult readidx writeidx b_status 0 ) ” 
  &&  “ (CircularAreaActualReadLength readidx writeidx area_length b_status requested data_length ) ” 
  &&  “ (0 < data_length) ” 
  &&  “ (data_length <= output_capacity) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ ((readidx + data_length ) <= area_length) ” 
  &&  “ (CircularAreaDivideRdDataResult readidx data_length area_length 0 ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status buffer_contents ) ”
  &&  (UCharArray.seg out0 0 data_length (sublist (0) (data_length) (output_before)) )
  **  (UCharArray.seg data_buffer readidx (readidx + data_length ) (sublist (readidx) ((readidx + data_length )) (buffer_contents)) )
  **  (GlobalStrings LitMap )
  **  (UCharArray.seg data_buffer 0 readidx (sublist (0) (readidx) (buffer_contents)) )
  **  (UCharArray.seg data_buffer (readidx + data_length ) area_length (sublist ((readidx + data_length )) (area_length) (buffer_contents)) )
  **  (UCharArray.seg out0 data_length output_capacity (sublist (data_length) (output_capacity) (output_before)) )
  **  ((&((ca0)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((ca0)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((ca0)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
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
Axiom proof_of_CircularAreaIsEmpty_return_wit_1 : CircularAreaIsEmpty_return_wit_1.
Axiom proof_of_CircularAreaIsEmpty_return_wit_2 : CircularAreaIsEmpty_return_wit_2.
Axiom proof_of_CircularAreaIsEmpty_return_wit_3 : CircularAreaIsEmpty_return_wit_3.
Axiom proof_of_CircularAreaIsEmpty_partial_solve_wit_1 : CircularAreaIsEmpty_partial_solve_wit_1.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_1 : CircularAreaGetDataLength_safety_wit_1.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_2 : CircularAreaGetDataLength_safety_wit_2.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_3 : CircularAreaGetDataLength_safety_wit_3.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_4 : CircularAreaGetDataLength_safety_wit_4.
Axiom proof_of_CircularAreaGetDataLength_safety_wit_5 : CircularAreaGetDataLength_safety_wit_5.
Axiom proof_of_CircularAreaGetDataLength_return_wit_1 : CircularAreaGetDataLength_return_wit_1.
Axiom proof_of_CircularAreaGetDataLength_return_wit_2 : CircularAreaGetDataLength_return_wit_2.
Axiom proof_of_CircularAreaGetDataLength_partial_solve_wit_1_pure : CircularAreaGetDataLength_partial_solve_wit_1_pure.
Axiom proof_of_CircularAreaGetDataLength_partial_solve_wit_1 : CircularAreaGetDataLength_partial_solve_wit_1.
Axiom proof_of_CircularAreaDivideRdData_safety_wit_1 : CircularAreaDivideRdData_safety_wit_1.
Axiom proof_of_CircularAreaDivideRdData_safety_wit_2 : CircularAreaDivideRdData_safety_wit_2.
Axiom proof_of_CircularAreaDivideRdData_safety_wit_3 : CircularAreaDivideRdData_safety_wit_3.
Axiom proof_of_CircularAreaDivideRdData_safety_wit_4 : CircularAreaDivideRdData_safety_wit_4.
Axiom proof_of_CircularAreaDivideRdData_safety_wit_5 : CircularAreaDivideRdData_safety_wit_5.
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
Axiom proof_of_CircularAreaRead_entail_wit_5_1 : CircularAreaRead_entail_wit_5_1.
Axiom proof_of_CircularAreaRead_entail_wit_5_2 : CircularAreaRead_entail_wit_5_2.
Axiom proof_of_CircularAreaRead_return_wit_1 : CircularAreaRead_return_wit_1.
Axiom proof_of_CircularAreaRead_return_wit_2 : CircularAreaRead_return_wit_2.
Axiom proof_of_CircularAreaRead_return_wit_3 : CircularAreaRead_return_wit_3.
Axiom proof_of_CircularAreaRead_return_wit_4 : CircularAreaRead_return_wit_4.
Axiom proof_of_CircularAreaRead_return_wit_5 : CircularAreaRead_return_wit_5.
Axiom proof_of_CircularAreaRead_return_wit_6 : CircularAreaRead_return_wit_6.
Axiom proof_of_CircularAreaRead_partial_solve_wit_1_pure : CircularAreaRead_partial_solve_wit_1_pure.
Axiom proof_of_CircularAreaRead_partial_solve_wit_1 : CircularAreaRead_partial_solve_wit_1.
Axiom proof_of_CircularAreaRead_partial_solve_wit_2_pure : CircularAreaRead_partial_solve_wit_2_pure.
Axiom proof_of_CircularAreaRead_partial_solve_wit_2 : CircularAreaRead_partial_solve_wit_2.
Axiom proof_of_CircularAreaRead_partial_solve_wit_3_pure : CircularAreaRead_partial_solve_wit_3_pure.
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
