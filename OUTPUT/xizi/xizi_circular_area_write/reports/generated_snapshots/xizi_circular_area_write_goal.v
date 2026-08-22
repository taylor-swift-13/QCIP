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
      SimpleC.EE.OUTPUT.xizi.xizi_circular_area_write.source.xizi_circular_area_write_lib.
Local Open Scope sac.
From SimpleC.EE.QCP_demos_LLM Require Import char_array_strategy_goal.
From SimpleC.EE.QCP_demos_LLM Require Import char_array_strategy_proof.

(*----- Function CircularAreaIsFull -----*)

Definition CircularAreaIsFull_safety_wit_1 := 
forall (circular_area_pre: Z) (PreH1 : (circular_area_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsFull_safety_wit_2 := 
forall (circular_area_pre: Z) (contents_circular_area_is_full_body: (@list Z)) (operations_circular_area_is_full_body: Z) (LitMap_circular_area_is_full_body: (string -> Z)) (b_status_circular_area_is_full_body: Z) (area_length_circular_area_is_full_body: Z) (p_tail_circular_area_is_full_body: Z) (p_head_circular_area_is_full_body: Z) (writeidx_circular_area_is_full_body: Z) (readidx_circular_area_is_full_body: Z) (data_buffer_circular_area_is_full_body: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (0 < area_length_circular_area_is_full_body)) (PreH3 : (area_length_circular_area_is_full_body <= 256)) (PreH4 : (0 <= readidx_circular_area_is_full_body)) (PreH5 : (readidx_circular_area_is_full_body <= 255)) (PreH6 : (readidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH7 : (0 <= writeidx_circular_area_is_full_body)) (PreH8 : (writeidx_circular_area_is_full_body <= 255)) (PreH9 : (writeidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH10 : (p_head_circular_area_is_full_body = data_buffer_circular_area_is_full_body)) (PreH11 : (p_tail_circular_area_is_full_body = (data_buffer_circular_area_is_full_body + area_length_circular_area_is_full_body ))) (PreH12 : ((Zlength (contents_circular_area_is_full_body)) = area_length_circular_area_is_full_body)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_is_full_body)
  **  (UCharArray.full data_buffer_circular_area_is_full_body area_length_circular_area_is_full_body contents_circular_area_is_full_body )
  **  (GlobalStrings LitMap_circular_area_is_full_body )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsFull_safety_wit_3 := 
forall (circular_area_pre: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  “ False ”
.

Definition CircularAreaIsFull_safety_wit_4 := 
forall (circular_area_pre: Z) (contents_circular_area_is_full_body: (@list Z)) (operations_circular_area_is_full_body: Z) (LitMap_circular_area_is_full_body: (string -> Z)) (b_status_circular_area_is_full_body: Z) (area_length_circular_area_is_full_body: Z) (p_tail_circular_area_is_full_body: Z) (p_head_circular_area_is_full_body: Z) (writeidx_circular_area_is_full_body: Z) (readidx_circular_area_is_full_body: Z) (data_buffer_circular_area_is_full_body: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (0 < area_length_circular_area_is_full_body)) (PreH4 : (area_length_circular_area_is_full_body <= 256)) (PreH5 : (0 <= readidx_circular_area_is_full_body)) (PreH6 : (readidx_circular_area_is_full_body <= 255)) (PreH7 : (readidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH8 : (0 <= writeidx_circular_area_is_full_body)) (PreH9 : (writeidx_circular_area_is_full_body <= 255)) (PreH10 : (writeidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH11 : (p_head_circular_area_is_full_body = data_buffer_circular_area_is_full_body)) (PreH12 : (p_tail_circular_area_is_full_body = (data_buffer_circular_area_is_full_body + area_length_circular_area_is_full_body ))) (PreH13 : ((Zlength (contents_circular_area_is_full_body)) = area_length_circular_area_is_full_body)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_is_full_body)
  **  (UCharArray.full data_buffer_circular_area_is_full_body area_length_circular_area_is_full_body contents_circular_area_is_full_body )
  **  (GlobalStrings LitMap_circular_area_is_full_body )
|--
  “ False ”
.

Definition CircularAreaIsFull_safety_wit_5 := 
forall (circular_area_pre: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaIsFull_safety_wit_6 := 
forall (circular_area_pre: Z) (contents_circular_area_is_full_body: (@list Z)) (operations_circular_area_is_full_body: Z) (LitMap_circular_area_is_full_body: (string -> Z)) (b_status_circular_area_is_full_body: Z) (area_length_circular_area_is_full_body: Z) (p_tail_circular_area_is_full_body: Z) (p_head_circular_area_is_full_body: Z) (writeidx_circular_area_is_full_body: Z) (readidx_circular_area_is_full_body: Z) (data_buffer_circular_area_is_full_body: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (0 < area_length_circular_area_is_full_body)) (PreH4 : (area_length_circular_area_is_full_body <= 256)) (PreH5 : (0 <= readidx_circular_area_is_full_body)) (PreH6 : (readidx_circular_area_is_full_body <= 255)) (PreH7 : (readidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH8 : (0 <= writeidx_circular_area_is_full_body)) (PreH9 : (writeidx_circular_area_is_full_body <= 255)) (PreH10 : (writeidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH11 : (p_head_circular_area_is_full_body = data_buffer_circular_area_is_full_body)) (PreH12 : (p_tail_circular_area_is_full_body = (data_buffer_circular_area_is_full_body + area_length_circular_area_is_full_body ))) (PreH13 : ((Zlength (contents_circular_area_is_full_body)) = area_length_circular_area_is_full_body)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_is_full_body)
  **  (UCharArray.full data_buffer_circular_area_is_full_body area_length_circular_area_is_full_body contents_circular_area_is_full_body )
  **  (GlobalStrings LitMap_circular_area_is_full_body )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsFull_safety_wit_7 := 
forall (circular_area_pre: Z) (contents_circular_area_is_full_body: (@list Z)) (operations_circular_area_is_full_body: Z) (LitMap_circular_area_is_full_body: (string -> Z)) (b_status_circular_area_is_full_body: Z) (area_length_circular_area_is_full_body: Z) (p_tail_circular_area_is_full_body: Z) (p_head_circular_area_is_full_body: Z) (writeidx_circular_area_is_full_body: Z) (readidx_circular_area_is_full_body: Z) (data_buffer_circular_area_is_full_body: Z) (PreH1 : (b_status_circular_area_is_full_body <> 0)) (PreH2 : (readidx_circular_area_is_full_body = writeidx_circular_area_is_full_body)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (0 < area_length_circular_area_is_full_body)) (PreH6 : (area_length_circular_area_is_full_body <= 256)) (PreH7 : (0 <= readidx_circular_area_is_full_body)) (PreH8 : (readidx_circular_area_is_full_body <= 255)) (PreH9 : (readidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH10 : (0 <= writeidx_circular_area_is_full_body)) (PreH11 : (writeidx_circular_area_is_full_body <= 255)) (PreH12 : (writeidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH13 : (p_head_circular_area_is_full_body = data_buffer_circular_area_is_full_body)) (PreH14 : (p_tail_circular_area_is_full_body = (data_buffer_circular_area_is_full_body + area_length_circular_area_is_full_body ))) (PreH15 : ((Zlength (contents_circular_area_is_full_body)) = area_length_circular_area_is_full_body)) ,
  (store_stringLit (LitMap_circular_area_is_full_body (("the circular area is full
"%string))) ("the circular area is full
"%string) )
  **  (GlobalStrings_missing LitMap_circular_area_is_full_body (cons (("the circular area is full
"%string)) ((@nil string))) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_is_full_body)
  **  (UCharArray.full data_buffer_circular_area_is_full_body area_length_circular_area_is_full_body contents_circular_area_is_full_body )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsFull_safety_wit_8 := 
forall (circular_area_pre: Z) (contents_circular_area_is_full_body: (@list Z)) (operations_circular_area_is_full_body: Z) (LitMap_circular_area_is_full_body: (string -> Z)) (b_status_circular_area_is_full_body: Z) (area_length_circular_area_is_full_body: Z) (p_tail_circular_area_is_full_body: Z) (p_head_circular_area_is_full_body: Z) (writeidx_circular_area_is_full_body: Z) (readidx_circular_area_is_full_body: Z) (data_buffer_circular_area_is_full_body: Z) (PreH1 : (b_status_circular_area_is_full_body <> 0)) (PreH2 : (readidx_circular_area_is_full_body = writeidx_circular_area_is_full_body)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (0 < area_length_circular_area_is_full_body)) (PreH6 : (area_length_circular_area_is_full_body <= 256)) (PreH7 : (0 <= readidx_circular_area_is_full_body)) (PreH8 : (readidx_circular_area_is_full_body <= 255)) (PreH9 : (readidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH10 : (0 <= writeidx_circular_area_is_full_body)) (PreH11 : (writeidx_circular_area_is_full_body <= 255)) (PreH12 : (writeidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH13 : (p_head_circular_area_is_full_body = data_buffer_circular_area_is_full_body)) (PreH14 : (p_tail_circular_area_is_full_body = (data_buffer_circular_area_is_full_body + area_length_circular_area_is_full_body ))) (PreH15 : ((Zlength (contents_circular_area_is_full_body)) = area_length_circular_area_is_full_body)) ,
  (GlobalStrings LitMap_circular_area_is_full_body )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_is_full_body)
  **  (UCharArray.full data_buffer_circular_area_is_full_body area_length_circular_area_is_full_body contents_circular_area_is_full_body )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaIsFull_safety_wit_9 := 
forall (circular_area_pre: Z) (contents_circular_area_is_full_body: (@list Z)) (operations_circular_area_is_full_body: Z) (LitMap_circular_area_is_full_body: (string -> Z)) (b_status_circular_area_is_full_body: Z) (area_length_circular_area_is_full_body: Z) (p_tail_circular_area_is_full_body: Z) (p_head_circular_area_is_full_body: Z) (writeidx_circular_area_is_full_body: Z) (readidx_circular_area_is_full_body: Z) (data_buffer_circular_area_is_full_body: Z) (PreH1 : (readidx_circular_area_is_full_body <> writeidx_circular_area_is_full_body)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 < area_length_circular_area_is_full_body)) (PreH5 : (area_length_circular_area_is_full_body <= 256)) (PreH6 : (0 <= readidx_circular_area_is_full_body)) (PreH7 : (readidx_circular_area_is_full_body <= 255)) (PreH8 : (readidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH9 : (0 <= writeidx_circular_area_is_full_body)) (PreH10 : (writeidx_circular_area_is_full_body <= 255)) (PreH11 : (writeidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH12 : (p_head_circular_area_is_full_body = data_buffer_circular_area_is_full_body)) (PreH13 : (p_tail_circular_area_is_full_body = (data_buffer_circular_area_is_full_body + area_length_circular_area_is_full_body ))) (PreH14 : ((Zlength (contents_circular_area_is_full_body)) = area_length_circular_area_is_full_body)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_is_full_body)
  **  (UCharArray.full data_buffer_circular_area_is_full_body area_length_circular_area_is_full_body contents_circular_area_is_full_body )
  **  (GlobalStrings LitMap_circular_area_is_full_body )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsFull_safety_wit_10 := 
forall (circular_area_pre: Z) (contents_circular_area_is_full_body: (@list Z)) (operations_circular_area_is_full_body: Z) (LitMap_circular_area_is_full_body: (string -> Z)) (b_status_circular_area_is_full_body: Z) (area_length_circular_area_is_full_body: Z) (p_tail_circular_area_is_full_body: Z) (p_head_circular_area_is_full_body: Z) (writeidx_circular_area_is_full_body: Z) (readidx_circular_area_is_full_body: Z) (data_buffer_circular_area_is_full_body: Z) (PreH1 : (b_status_circular_area_is_full_body = 0)) (PreH2 : (readidx_circular_area_is_full_body = writeidx_circular_area_is_full_body)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (0 < area_length_circular_area_is_full_body)) (PreH6 : (area_length_circular_area_is_full_body <= 256)) (PreH7 : (0 <= readidx_circular_area_is_full_body)) (PreH8 : (readidx_circular_area_is_full_body <= 255)) (PreH9 : (readidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH10 : (0 <= writeidx_circular_area_is_full_body)) (PreH11 : (writeidx_circular_area_is_full_body <= 255)) (PreH12 : (writeidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH13 : (p_head_circular_area_is_full_body = data_buffer_circular_area_is_full_body)) (PreH14 : (p_tail_circular_area_is_full_body = (data_buffer_circular_area_is_full_body + area_length_circular_area_is_full_body ))) (PreH15 : ((Zlength (contents_circular_area_is_full_body)) = area_length_circular_area_is_full_body)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_is_full_body)
  **  (UCharArray.full data_buffer_circular_area_is_full_body area_length_circular_area_is_full_body contents_circular_area_is_full_body )
  **  (GlobalStrings LitMap_circular_area_is_full_body )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaIsFull_return_wit_1 := 
(
forall (circular_area_pre: Z) (contents_circular_area_is_full_body: (@list Z)) (operations_circular_area_is_full_body: Z) (LitMap_circular_area_is_full_body: (string -> Z)) (b_status_circular_area_is_full_body: Z) (area_length_circular_area_is_full_body: Z) (p_tail_circular_area_is_full_body: Z) (p_head_circular_area_is_full_body: Z) (writeidx_circular_area_is_full_body: Z) (readidx_circular_area_is_full_body: Z) (data_buffer_circular_area_is_full_body: Z) (PreH1 : (readidx_circular_area_is_full_body <> writeidx_circular_area_is_full_body)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 < area_length_circular_area_is_full_body)) (PreH5 : (area_length_circular_area_is_full_body <= 256)) (PreH6 : (0 <= readidx_circular_area_is_full_body)) (PreH7 : (readidx_circular_area_is_full_body <= 255)) (PreH8 : (readidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH9 : (0 <= writeidx_circular_area_is_full_body)) (PreH10 : (writeidx_circular_area_is_full_body <= 255)) (PreH11 : (writeidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH12 : (p_head_circular_area_is_full_body = data_buffer_circular_area_is_full_body)) (PreH13 : (p_tail_circular_area_is_full_body = (data_buffer_circular_area_is_full_body + area_length_circular_area_is_full_body ))) (PreH14 : ((Zlength (contents_circular_area_is_full_body)) = area_length_circular_area_is_full_body)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_is_full_body)
  **  (UCharArray.full data_buffer_circular_area_is_full_body area_length_circular_area_is_full_body contents_circular_area_is_full_body )
  **  (GlobalStrings LitMap_circular_area_is_full_body )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (CircularAreaIsFullResult readidx_circular_area_is_full_body writeidx_circular_area_is_full_body b_status_circular_area_is_full_body 0 ) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= 1) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_is_full_body)
  **  (UCharArray.full data_buffer_circular_area_is_full_body area_length_circular_area_is_full_body contents_circular_area_is_full_body )
  **  (GlobalStrings LitMap_circular_area_is_full_body )
) \/
(
forall (circular_area_pre: Z) (contents_circular_area_is_full_body: (@list Z)) (LitMap_circular_area_is_full_body: (string -> Z)) (b_status_circular_area_is_full_body: Z) (area_length_circular_area_is_full_body: Z) (p_tail_circular_area_is_full_body: Z) (p_head_circular_area_is_full_body: Z) (writeidx_circular_area_is_full_body: Z) (readidx_circular_area_is_full_body: Z) (data_buffer_circular_area_is_full_body: Z) (PreH1 : (readidx_circular_area_is_full_body <> writeidx_circular_area_is_full_body)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 < area_length_circular_area_is_full_body)) (PreH5 : (area_length_circular_area_is_full_body <= 256)) (PreH6 : (0 <= readidx_circular_area_is_full_body)) (PreH7 : (readidx_circular_area_is_full_body <= 255)) (PreH8 : (readidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH9 : (0 <= writeidx_circular_area_is_full_body)) (PreH10 : (writeidx_circular_area_is_full_body <= 255)) (PreH11 : (writeidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH12 : (p_head_circular_area_is_full_body = data_buffer_circular_area_is_full_body)) (PreH13 : (p_tail_circular_area_is_full_body = (data_buffer_circular_area_is_full_body + area_length_circular_area_is_full_body ))) (PreH14 : ((Zlength (contents_circular_area_is_full_body)) = area_length_circular_area_is_full_body)) ,
  (GlobalStrings LitMap_circular_area_is_full_body )
|--
  “ (CircularAreaIsFullResult readidx_circular_area_is_full_body writeidx_circular_area_is_full_body b_status_circular_area_is_full_body 0 ) ”
  &&  (GlobalStrings LitMap_circular_area_is_full_body )
).

Definition CircularAreaIsFull_return_wit_1_split_goal_1 := 
forall (circular_area_pre: Z) (contents_circular_area_is_full_body: (@list Z)) (LitMap_circular_area_is_full_body: (string -> Z)) (b_status_circular_area_is_full_body: Z) (area_length_circular_area_is_full_body: Z) (p_tail_circular_area_is_full_body: Z) (p_head_circular_area_is_full_body: Z) (writeidx_circular_area_is_full_body: Z) (readidx_circular_area_is_full_body: Z) (data_buffer_circular_area_is_full_body: Z) (PreH1 : (readidx_circular_area_is_full_body <> writeidx_circular_area_is_full_body)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 < area_length_circular_area_is_full_body)) (PreH5 : (area_length_circular_area_is_full_body <= 256)) (PreH6 : (0 <= readidx_circular_area_is_full_body)) (PreH7 : (readidx_circular_area_is_full_body <= 255)) (PreH8 : (readidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH9 : (0 <= writeidx_circular_area_is_full_body)) (PreH10 : (writeidx_circular_area_is_full_body <= 255)) (PreH11 : (writeidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH12 : (p_head_circular_area_is_full_body = data_buffer_circular_area_is_full_body)) (PreH13 : (p_tail_circular_area_is_full_body = (data_buffer_circular_area_is_full_body + area_length_circular_area_is_full_body ))) (PreH14 : ((Zlength (contents_circular_area_is_full_body)) = area_length_circular_area_is_full_body)) ,
  (GlobalStrings LitMap_circular_area_is_full_body )
|--
  “ (CircularAreaIsFullResult readidx_circular_area_is_full_body writeidx_circular_area_is_full_body b_status_circular_area_is_full_body 0 ) ”
.

Definition CircularAreaIsFull_return_wit_1_split_goal_spatial := 
forall (circular_area_pre: Z) (contents_circular_area_is_full_body: (@list Z)) (LitMap_circular_area_is_full_body: (string -> Z)) (area_length_circular_area_is_full_body: Z) (p_tail_circular_area_is_full_body: Z) (p_head_circular_area_is_full_body: Z) (writeidx_circular_area_is_full_body: Z) (readidx_circular_area_is_full_body: Z) (data_buffer_circular_area_is_full_body: Z) (PreH1 : (readidx_circular_area_is_full_body <> writeidx_circular_area_is_full_body)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 < area_length_circular_area_is_full_body)) (PreH5 : (area_length_circular_area_is_full_body <= 256)) (PreH6 : (0 <= readidx_circular_area_is_full_body)) (PreH7 : (readidx_circular_area_is_full_body <= 255)) (PreH8 : (readidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH9 : (0 <= writeidx_circular_area_is_full_body)) (PreH10 : (writeidx_circular_area_is_full_body <= 255)) (PreH11 : (writeidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH12 : (p_head_circular_area_is_full_body = data_buffer_circular_area_is_full_body)) (PreH13 : (p_tail_circular_area_is_full_body = (data_buffer_circular_area_is_full_body + area_length_circular_area_is_full_body ))) (PreH14 : ((Zlength (contents_circular_area_is_full_body)) = area_length_circular_area_is_full_body)) ,
  (GlobalStrings LitMap_circular_area_is_full_body )
|--
  (GlobalStrings LitMap_circular_area_is_full_body )
.

Definition CircularAreaIsFull_return_wit_2 := 
(
forall (circular_area_pre: Z) (contents_circular_area_is_full_body: (@list Z)) (operations_circular_area_is_full_body: Z) (LitMap_circular_area_is_full_body: (string -> Z)) (b_status_circular_area_is_full_body: Z) (area_length_circular_area_is_full_body: Z) (p_tail_circular_area_is_full_body: Z) (p_head_circular_area_is_full_body: Z) (writeidx_circular_area_is_full_body: Z) (readidx_circular_area_is_full_body: Z) (data_buffer_circular_area_is_full_body: Z) (PreH1 : (b_status_circular_area_is_full_body = 0)) (PreH2 : (readidx_circular_area_is_full_body = writeidx_circular_area_is_full_body)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (0 < area_length_circular_area_is_full_body)) (PreH6 : (area_length_circular_area_is_full_body <= 256)) (PreH7 : (0 <= readidx_circular_area_is_full_body)) (PreH8 : (readidx_circular_area_is_full_body <= 255)) (PreH9 : (readidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH10 : (0 <= writeidx_circular_area_is_full_body)) (PreH11 : (writeidx_circular_area_is_full_body <= 255)) (PreH12 : (writeidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH13 : (p_head_circular_area_is_full_body = data_buffer_circular_area_is_full_body)) (PreH14 : (p_tail_circular_area_is_full_body = (data_buffer_circular_area_is_full_body + area_length_circular_area_is_full_body ))) (PreH15 : ((Zlength (contents_circular_area_is_full_body)) = area_length_circular_area_is_full_body)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_is_full_body)
  **  (UCharArray.full data_buffer_circular_area_is_full_body area_length_circular_area_is_full_body contents_circular_area_is_full_body )
  **  (GlobalStrings LitMap_circular_area_is_full_body )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (CircularAreaIsFullResult readidx_circular_area_is_full_body writeidx_circular_area_is_full_body b_status_circular_area_is_full_body 0 ) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= 1) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_is_full_body)
  **  (UCharArray.full data_buffer_circular_area_is_full_body area_length_circular_area_is_full_body contents_circular_area_is_full_body )
  **  (GlobalStrings LitMap_circular_area_is_full_body )
) \/
(
forall (circular_area_pre: Z) (contents_circular_area_is_full_body: (@list Z)) (LitMap_circular_area_is_full_body: (string -> Z)) (b_status_circular_area_is_full_body: Z) (area_length_circular_area_is_full_body: Z) (p_tail_circular_area_is_full_body: Z) (p_head_circular_area_is_full_body: Z) (writeidx_circular_area_is_full_body: Z) (readidx_circular_area_is_full_body: Z) (data_buffer_circular_area_is_full_body: Z) (PreH1 : (b_status_circular_area_is_full_body = 0)) (PreH2 : (readidx_circular_area_is_full_body = writeidx_circular_area_is_full_body)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (0 < area_length_circular_area_is_full_body)) (PreH6 : (area_length_circular_area_is_full_body <= 256)) (PreH7 : (0 <= readidx_circular_area_is_full_body)) (PreH8 : (readidx_circular_area_is_full_body <= 255)) (PreH9 : (readidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH10 : (0 <= writeidx_circular_area_is_full_body)) (PreH11 : (writeidx_circular_area_is_full_body <= 255)) (PreH12 : (writeidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH13 : (p_head_circular_area_is_full_body = data_buffer_circular_area_is_full_body)) (PreH14 : (p_tail_circular_area_is_full_body = (data_buffer_circular_area_is_full_body + area_length_circular_area_is_full_body ))) (PreH15 : ((Zlength (contents_circular_area_is_full_body)) = area_length_circular_area_is_full_body)) ,
  (GlobalStrings LitMap_circular_area_is_full_body )
|--
  “ (CircularAreaIsFullResult readidx_circular_area_is_full_body writeidx_circular_area_is_full_body b_status_circular_area_is_full_body 0 ) ”
  &&  (GlobalStrings LitMap_circular_area_is_full_body )
).

Definition CircularAreaIsFull_return_wit_2_split_goal_1 := 
forall (circular_area_pre: Z) (contents_circular_area_is_full_body: (@list Z)) (LitMap_circular_area_is_full_body: (string -> Z)) (b_status_circular_area_is_full_body: Z) (area_length_circular_area_is_full_body: Z) (p_tail_circular_area_is_full_body: Z) (p_head_circular_area_is_full_body: Z) (writeidx_circular_area_is_full_body: Z) (readidx_circular_area_is_full_body: Z) (data_buffer_circular_area_is_full_body: Z) (PreH1 : (b_status_circular_area_is_full_body = 0)) (PreH2 : (readidx_circular_area_is_full_body = writeidx_circular_area_is_full_body)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (0 < area_length_circular_area_is_full_body)) (PreH6 : (area_length_circular_area_is_full_body <= 256)) (PreH7 : (0 <= readidx_circular_area_is_full_body)) (PreH8 : (readidx_circular_area_is_full_body <= 255)) (PreH9 : (readidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH10 : (0 <= writeidx_circular_area_is_full_body)) (PreH11 : (writeidx_circular_area_is_full_body <= 255)) (PreH12 : (writeidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH13 : (p_head_circular_area_is_full_body = data_buffer_circular_area_is_full_body)) (PreH14 : (p_tail_circular_area_is_full_body = (data_buffer_circular_area_is_full_body + area_length_circular_area_is_full_body ))) (PreH15 : ((Zlength (contents_circular_area_is_full_body)) = area_length_circular_area_is_full_body)) ,
  (GlobalStrings LitMap_circular_area_is_full_body )
|--
  “ (CircularAreaIsFullResult readidx_circular_area_is_full_body writeidx_circular_area_is_full_body b_status_circular_area_is_full_body 0 ) ”
.

Definition CircularAreaIsFull_return_wit_2_split_goal_spatial := 
forall (circular_area_pre: Z) (contents_circular_area_is_full_body: (@list Z)) (LitMap_circular_area_is_full_body: (string -> Z)) (b_status_circular_area_is_full_body: Z) (area_length_circular_area_is_full_body: Z) (p_tail_circular_area_is_full_body: Z) (p_head_circular_area_is_full_body: Z) (writeidx_circular_area_is_full_body: Z) (readidx_circular_area_is_full_body: Z) (data_buffer_circular_area_is_full_body: Z) (PreH1 : (b_status_circular_area_is_full_body = 0)) (PreH2 : (readidx_circular_area_is_full_body = writeidx_circular_area_is_full_body)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (0 < area_length_circular_area_is_full_body)) (PreH6 : (area_length_circular_area_is_full_body <= 256)) (PreH7 : (0 <= readidx_circular_area_is_full_body)) (PreH8 : (readidx_circular_area_is_full_body <= 255)) (PreH9 : (readidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH10 : (0 <= writeidx_circular_area_is_full_body)) (PreH11 : (writeidx_circular_area_is_full_body <= 255)) (PreH12 : (writeidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH13 : (p_head_circular_area_is_full_body = data_buffer_circular_area_is_full_body)) (PreH14 : (p_tail_circular_area_is_full_body = (data_buffer_circular_area_is_full_body + area_length_circular_area_is_full_body ))) (PreH15 : ((Zlength (contents_circular_area_is_full_body)) = area_length_circular_area_is_full_body)) ,
  (GlobalStrings LitMap_circular_area_is_full_body )
|--
  (GlobalStrings LitMap_circular_area_is_full_body )
.

Definition CircularAreaIsFull_return_wit_3 := 
(
forall (circular_area_pre: Z) (contents_circular_area_is_full_body: (@list Z)) (operations_circular_area_is_full_body: Z) (LitMap_circular_area_is_full_body: (string -> Z)) (b_status_circular_area_is_full_body: Z) (area_length_circular_area_is_full_body: Z) (p_tail_circular_area_is_full_body: Z) (p_head_circular_area_is_full_body: Z) (writeidx_circular_area_is_full_body: Z) (readidx_circular_area_is_full_body: Z) (data_buffer_circular_area_is_full_body: Z) (PreH1 : (b_status_circular_area_is_full_body <> 0)) (PreH2 : (readidx_circular_area_is_full_body = writeidx_circular_area_is_full_body)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (0 < area_length_circular_area_is_full_body)) (PreH6 : (area_length_circular_area_is_full_body <= 256)) (PreH7 : (0 <= readidx_circular_area_is_full_body)) (PreH8 : (readidx_circular_area_is_full_body <= 255)) (PreH9 : (readidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH10 : (0 <= writeidx_circular_area_is_full_body)) (PreH11 : (writeidx_circular_area_is_full_body <= 255)) (PreH12 : (writeidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH13 : (p_head_circular_area_is_full_body = data_buffer_circular_area_is_full_body)) (PreH14 : (p_tail_circular_area_is_full_body = (data_buffer_circular_area_is_full_body + area_length_circular_area_is_full_body ))) (PreH15 : ((Zlength (contents_circular_area_is_full_body)) = area_length_circular_area_is_full_body)) ,
  (GlobalStrings LitMap_circular_area_is_full_body )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_is_full_body)
  **  (UCharArray.full data_buffer_circular_area_is_full_body area_length_circular_area_is_full_body contents_circular_area_is_full_body )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (CircularAreaIsFullResult readidx_circular_area_is_full_body writeidx_circular_area_is_full_body b_status_circular_area_is_full_body 1 ) ” 
  &&  “ (0 <= 1) ” 
  &&  “ (1 <= 1) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_is_full_body)
  **  (UCharArray.full data_buffer_circular_area_is_full_body area_length_circular_area_is_full_body contents_circular_area_is_full_body )
  **  (GlobalStrings LitMap_circular_area_is_full_body )
) \/
(
forall (circular_area_pre: Z) (contents_circular_area_is_full_body: (@list Z)) (LitMap_circular_area_is_full_body: (string -> Z)) (b_status_circular_area_is_full_body: Z) (area_length_circular_area_is_full_body: Z) (p_tail_circular_area_is_full_body: Z) (p_head_circular_area_is_full_body: Z) (writeidx_circular_area_is_full_body: Z) (readidx_circular_area_is_full_body: Z) (data_buffer_circular_area_is_full_body: Z) (PreH1 : (b_status_circular_area_is_full_body <> 0)) (PreH2 : (readidx_circular_area_is_full_body = writeidx_circular_area_is_full_body)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (0 < area_length_circular_area_is_full_body)) (PreH6 : (area_length_circular_area_is_full_body <= 256)) (PreH7 : (0 <= readidx_circular_area_is_full_body)) (PreH8 : (readidx_circular_area_is_full_body <= 255)) (PreH9 : (readidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH10 : (0 <= writeidx_circular_area_is_full_body)) (PreH11 : (writeidx_circular_area_is_full_body <= 255)) (PreH12 : (writeidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH13 : (p_head_circular_area_is_full_body = data_buffer_circular_area_is_full_body)) (PreH14 : (p_tail_circular_area_is_full_body = (data_buffer_circular_area_is_full_body + area_length_circular_area_is_full_body ))) (PreH15 : ((Zlength (contents_circular_area_is_full_body)) = area_length_circular_area_is_full_body)) ,
  (GlobalStrings LitMap_circular_area_is_full_body )
|--
  “ (CircularAreaIsFullResult readidx_circular_area_is_full_body writeidx_circular_area_is_full_body b_status_circular_area_is_full_body 1 ) ”
  &&  (GlobalStrings LitMap_circular_area_is_full_body )
).

Definition CircularAreaIsFull_return_wit_3_split_goal_1 := 
forall (circular_area_pre: Z) (contents_circular_area_is_full_body: (@list Z)) (LitMap_circular_area_is_full_body: (string -> Z)) (b_status_circular_area_is_full_body: Z) (area_length_circular_area_is_full_body: Z) (p_tail_circular_area_is_full_body: Z) (p_head_circular_area_is_full_body: Z) (writeidx_circular_area_is_full_body: Z) (readidx_circular_area_is_full_body: Z) (data_buffer_circular_area_is_full_body: Z) (PreH1 : (b_status_circular_area_is_full_body <> 0)) (PreH2 : (readidx_circular_area_is_full_body = writeidx_circular_area_is_full_body)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (0 < area_length_circular_area_is_full_body)) (PreH6 : (area_length_circular_area_is_full_body <= 256)) (PreH7 : (0 <= readidx_circular_area_is_full_body)) (PreH8 : (readidx_circular_area_is_full_body <= 255)) (PreH9 : (readidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH10 : (0 <= writeidx_circular_area_is_full_body)) (PreH11 : (writeidx_circular_area_is_full_body <= 255)) (PreH12 : (writeidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH13 : (p_head_circular_area_is_full_body = data_buffer_circular_area_is_full_body)) (PreH14 : (p_tail_circular_area_is_full_body = (data_buffer_circular_area_is_full_body + area_length_circular_area_is_full_body ))) (PreH15 : ((Zlength (contents_circular_area_is_full_body)) = area_length_circular_area_is_full_body)) ,
  (GlobalStrings LitMap_circular_area_is_full_body )
|--
  “ (CircularAreaIsFullResult readidx_circular_area_is_full_body writeidx_circular_area_is_full_body b_status_circular_area_is_full_body 1 ) ”
.

Definition CircularAreaIsFull_return_wit_3_split_goal_spatial := 
forall (circular_area_pre: Z) (contents_circular_area_is_full_body: (@list Z)) (LitMap_circular_area_is_full_body: (string -> Z)) (b_status_circular_area_is_full_body: Z) (area_length_circular_area_is_full_body: Z) (p_tail_circular_area_is_full_body: Z) (p_head_circular_area_is_full_body: Z) (writeidx_circular_area_is_full_body: Z) (readidx_circular_area_is_full_body: Z) (data_buffer_circular_area_is_full_body: Z) (PreH1 : (b_status_circular_area_is_full_body <> 0)) (PreH2 : (readidx_circular_area_is_full_body = writeidx_circular_area_is_full_body)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (0 < area_length_circular_area_is_full_body)) (PreH6 : (area_length_circular_area_is_full_body <= 256)) (PreH7 : (0 <= readidx_circular_area_is_full_body)) (PreH8 : (readidx_circular_area_is_full_body <= 255)) (PreH9 : (readidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH10 : (0 <= writeidx_circular_area_is_full_body)) (PreH11 : (writeidx_circular_area_is_full_body <= 255)) (PreH12 : (writeidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH13 : (p_head_circular_area_is_full_body = data_buffer_circular_area_is_full_body)) (PreH14 : (p_tail_circular_area_is_full_body = (data_buffer_circular_area_is_full_body + area_length_circular_area_is_full_body ))) (PreH15 : ((Zlength (contents_circular_area_is_full_body)) = area_length_circular_area_is_full_body)) ,
  (GlobalStrings LitMap_circular_area_is_full_body )
|--
  (GlobalStrings LitMap_circular_area_is_full_body )
.

Definition CircularAreaIsFull_return_wit_4 := 
forall (circular_area_pre: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = 0)) ,
  TT && emp 
|--
  “ (circular_area_pre = 0) ” 
  &&  “ (1 = 1) ”
  &&  emp
.

Definition CircularAreaIsFull_partial_solve_wit_1 := 
forall (circular_area_pre: Z) (contents_circular_area_is_full_body: (@list Z)) (operations_circular_area_is_full_body: Z) (LitMap_circular_area_is_full_body: (string -> Z)) (b_status_circular_area_is_full_body: Z) (area_length_circular_area_is_full_body: Z) (p_tail_circular_area_is_full_body: Z) (p_head_circular_area_is_full_body: Z) (writeidx_circular_area_is_full_body: Z) (readidx_circular_area_is_full_body: Z) (data_buffer_circular_area_is_full_body: Z) (PreH1 : (b_status_circular_area_is_full_body <> 0)) (PreH2 : (readidx_circular_area_is_full_body = writeidx_circular_area_is_full_body)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (0 < area_length_circular_area_is_full_body)) (PreH6 : (area_length_circular_area_is_full_body <= 256)) (PreH7 : (0 <= readidx_circular_area_is_full_body)) (PreH8 : (readidx_circular_area_is_full_body <= 255)) (PreH9 : (readidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH10 : (0 <= writeidx_circular_area_is_full_body)) (PreH11 : (writeidx_circular_area_is_full_body <= 255)) (PreH12 : (writeidx_circular_area_is_full_body < area_length_circular_area_is_full_body)) (PreH13 : (p_head_circular_area_is_full_body = data_buffer_circular_area_is_full_body)) (PreH14 : (p_tail_circular_area_is_full_body = (data_buffer_circular_area_is_full_body + area_length_circular_area_is_full_body ))) (PreH15 : ((Zlength (contents_circular_area_is_full_body)) = area_length_circular_area_is_full_body)) ,
  (store_stringLit (LitMap_circular_area_is_full_body (("the circular area is full
"%string))) ("the circular area is full
"%string) )
  **  (GlobalStrings_missing LitMap_circular_area_is_full_body (cons (("the circular area is full
"%string)) ((@nil string))) )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_is_full_body)
  **  (UCharArray.full data_buffer_circular_area_is_full_body area_length_circular_area_is_full_body contents_circular_area_is_full_body )
|--
  “ (b_status_circular_area_is_full_body <> 0) ” 
  &&  “ (readidx_circular_area_is_full_body = writeidx_circular_area_is_full_body) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (0 < area_length_circular_area_is_full_body) ” 
  &&  “ (area_length_circular_area_is_full_body <= 256) ” 
  &&  “ (0 <= readidx_circular_area_is_full_body) ” 
  &&  “ (readidx_circular_area_is_full_body <= 255) ” 
  &&  “ (readidx_circular_area_is_full_body < area_length_circular_area_is_full_body) ” 
  &&  “ (0 <= writeidx_circular_area_is_full_body) ” 
  &&  “ (writeidx_circular_area_is_full_body <= 255) ” 
  &&  “ (writeidx_circular_area_is_full_body < area_length_circular_area_is_full_body) ” 
  &&  “ (p_head_circular_area_is_full_body = data_buffer_circular_area_is_full_body) ” 
  &&  “ (p_tail_circular_area_is_full_body = (data_buffer_circular_area_is_full_body + area_length_circular_area_is_full_body )) ” 
  &&  “ ((Zlength (contents_circular_area_is_full_body)) = area_length_circular_area_is_full_body) ”
  &&  (GlobalStrings LitMap_circular_area_is_full_body )
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_is_full_body)
  **  (UCharArray.full data_buffer_circular_area_is_full_body area_length_circular_area_is_full_body contents_circular_area_is_full_body )
.

(*----- Function CircularAreaGetDataLength -----*)

Definition CircularAreaGetDataLength_safety_wit_1 := 
forall (circular_area_pre: Z) (PreH1 : (circular_area_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaGetDataLength_safety_wit_2 := 
forall (circular_area_pre: Z) (contents_circular_area_data_length_body: (@list Z)) (operations_circular_area_data_length_body: Z) (LitMap_circular_area_data_length_body: (string -> Z)) (b_status_circular_area_data_length_body: Z) (area_length_circular_area_data_length_body: Z) (p_tail_circular_area_data_length_body: Z) (p_head_circular_area_data_length_body: Z) (writeidx_circular_area_data_length_body: Z) (readidx_circular_area_data_length_body: Z) (data_buffer_circular_area_data_length_body: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (0 < area_length_circular_area_data_length_body)) (PreH3 : (area_length_circular_area_data_length_body <= 256)) (PreH4 : (0 <= readidx_circular_area_data_length_body)) (PreH5 : (readidx_circular_area_data_length_body <= 255)) (PreH6 : (readidx_circular_area_data_length_body < area_length_circular_area_data_length_body)) (PreH7 : (0 <= writeidx_circular_area_data_length_body)) (PreH8 : (writeidx_circular_area_data_length_body <= 255)) (PreH9 : (writeidx_circular_area_data_length_body < area_length_circular_area_data_length_body)) (PreH10 : (p_head_circular_area_data_length_body = data_buffer_circular_area_data_length_body)) (PreH11 : (p_tail_circular_area_data_length_body = (data_buffer_circular_area_data_length_body + area_length_circular_area_data_length_body ))) (PreH12 : ((Zlength (contents_circular_area_data_length_body)) = area_length_circular_area_data_length_body)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_data_length_body)
  **  (UCharArray.full data_buffer_circular_area_data_length_body area_length_circular_area_data_length_body contents_circular_area_data_length_body )
  **  (GlobalStrings LitMap_circular_area_data_length_body )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaGetDataLength_safety_wit_3 := 
forall (circular_area_pre: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  “ False ”
.

Definition CircularAreaGetDataLength_safety_wit_4 := 
forall (circular_area_pre: Z) (contents_circular_area_data_length_body: (@list Z)) (operations_circular_area_data_length_body: Z) (LitMap_circular_area_data_length_body: (string -> Z)) (b_status_circular_area_data_length_body: Z) (area_length_circular_area_data_length_body: Z) (p_tail_circular_area_data_length_body: Z) (p_head_circular_area_data_length_body: Z) (writeidx_circular_area_data_length_body: Z) (readidx_circular_area_data_length_body: Z) (data_buffer_circular_area_data_length_body: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (0 < area_length_circular_area_data_length_body)) (PreH4 : (area_length_circular_area_data_length_body <= 256)) (PreH5 : (0 <= readidx_circular_area_data_length_body)) (PreH6 : (readidx_circular_area_data_length_body <= 255)) (PreH7 : (readidx_circular_area_data_length_body < area_length_circular_area_data_length_body)) (PreH8 : (0 <= writeidx_circular_area_data_length_body)) (PreH9 : (writeidx_circular_area_data_length_body <= 255)) (PreH10 : (writeidx_circular_area_data_length_body < area_length_circular_area_data_length_body)) (PreH11 : (p_head_circular_area_data_length_body = data_buffer_circular_area_data_length_body)) (PreH12 : (p_tail_circular_area_data_length_body = (data_buffer_circular_area_data_length_body + area_length_circular_area_data_length_body ))) (PreH13 : ((Zlength (contents_circular_area_data_length_body)) = area_length_circular_area_data_length_body)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_data_length_body)
  **  (UCharArray.full data_buffer_circular_area_data_length_body area_length_circular_area_data_length_body contents_circular_area_data_length_body )
  **  (GlobalStrings LitMap_circular_area_data_length_body )
|--
  “ False ”
.

Definition CircularAreaGetDataLength_safety_wit_5 := 
forall (circular_area_pre: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaGetDataLength_safety_wit_6 := 
forall (circular_area_pre: Z) (contents_circular_area_data_length_body: (@list Z)) (operations_circular_area_data_length_body: Z) (LitMap_circular_area_data_length_body: (string -> Z)) (b_status_circular_area_data_length_body: Z) (area_length_circular_area_data_length_body: Z) (p_tail_circular_area_data_length_body: Z) (p_head_circular_area_data_length_body: Z) (writeidx_circular_area_data_length_body: Z) (readidx_circular_area_data_length_body: Z) (data_buffer_circular_area_data_length_body: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (0 < area_length_circular_area_data_length_body)) (PreH4 : (area_length_circular_area_data_length_body <= 256)) (PreH5 : (0 <= readidx_circular_area_data_length_body)) (PreH6 : (readidx_circular_area_data_length_body <= 255)) (PreH7 : (readidx_circular_area_data_length_body < area_length_circular_area_data_length_body)) (PreH8 : (0 <= writeidx_circular_area_data_length_body)) (PreH9 : (writeidx_circular_area_data_length_body <= 255)) (PreH10 : (writeidx_circular_area_data_length_body < area_length_circular_area_data_length_body)) (PreH11 : (p_head_circular_area_data_length_body = data_buffer_circular_area_data_length_body)) (PreH12 : (p_tail_circular_area_data_length_body = (data_buffer_circular_area_data_length_body + area_length_circular_area_data_length_body ))) (PreH13 : ((Zlength (contents_circular_area_data_length_body)) = area_length_circular_area_data_length_body)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_data_length_body)
  **  (UCharArray.full data_buffer_circular_area_data_length_body area_length_circular_area_data_length_body contents_circular_area_data_length_body )
  **  (GlobalStrings LitMap_circular_area_data_length_body )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaGetDataLength_safety_wit_7 := 
forall (circular_area_pre: Z) (contents_circular_area_data_length_body: (@list Z)) (operations_circular_area_data_length_body: Z) (LitMap_circular_area_data_length_body: (string -> Z)) (b_status_circular_area_data_length_body: Z) (area_length_circular_area_data_length_body: Z) (p_tail_circular_area_data_length_body: Z) (p_head_circular_area_data_length_body: Z) (writeidx_circular_area_data_length_body: Z) (readidx_circular_area_data_length_body: Z) (data_buffer_circular_area_data_length_body: Z) (retval: Z) (PreH1 : (CircularAreaIsFullResult readidx_circular_area_data_length_body writeidx_circular_area_data_length_body b_status_circular_area_data_length_body retval )) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 1)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (0 < area_length_circular_area_data_length_body)) (PreH7 : (area_length_circular_area_data_length_body <= 256)) (PreH8 : (0 <= readidx_circular_area_data_length_body)) (PreH9 : (readidx_circular_area_data_length_body <= 255)) (PreH10 : (readidx_circular_area_data_length_body < area_length_circular_area_data_length_body)) (PreH11 : (0 <= writeidx_circular_area_data_length_body)) (PreH12 : (writeidx_circular_area_data_length_body <= 255)) (PreH13 : (writeidx_circular_area_data_length_body < area_length_circular_area_data_length_body)) (PreH14 : (p_head_circular_area_data_length_body = data_buffer_circular_area_data_length_body)) (PreH15 : (p_tail_circular_area_data_length_body = (data_buffer_circular_area_data_length_body + area_length_circular_area_data_length_body ))) (PreH16 : ((Zlength (contents_circular_area_data_length_body)) = area_length_circular_area_data_length_body)) (PreH17 : (retval = 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head_circular_area_data_length_body + area_length_circular_area_data_length_body ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_data_length_body)
  **  (UCharArray.full p_head_circular_area_data_length_body area_length_circular_area_data_length_body contents_circular_area_data_length_body )
  **  (GlobalStrings LitMap_circular_area_data_length_body )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  “ (area_length_circular_area_data_length_body <> 0) ”
.

Definition CircularAreaGetDataLength_safety_wit_8 := 
forall (circular_area_pre: Z) (contents_circular_area_data_length_body: (@list Z)) (operations_circular_area_data_length_body: Z) (LitMap_circular_area_data_length_body: (string -> Z)) (b_status_circular_area_data_length_body: Z) (area_length_circular_area_data_length_body: Z) (p_tail_circular_area_data_length_body: Z) (p_head_circular_area_data_length_body: Z) (writeidx_circular_area_data_length_body: Z) (readidx_circular_area_data_length_body: Z) (data_buffer_circular_area_data_length_body: Z) (retval: Z) (PreH1 : (CircularAreaIsFullResult readidx_circular_area_data_length_body writeidx_circular_area_data_length_body b_status_circular_area_data_length_body retval )) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 1)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (0 < area_length_circular_area_data_length_body)) (PreH7 : (area_length_circular_area_data_length_body <= 256)) (PreH8 : (0 <= readidx_circular_area_data_length_body)) (PreH9 : (readidx_circular_area_data_length_body <= 255)) (PreH10 : (readidx_circular_area_data_length_body < area_length_circular_area_data_length_body)) (PreH11 : (0 <= writeidx_circular_area_data_length_body)) (PreH12 : (writeidx_circular_area_data_length_body <= 255)) (PreH13 : (writeidx_circular_area_data_length_body < area_length_circular_area_data_length_body)) (PreH14 : (p_head_circular_area_data_length_body = data_buffer_circular_area_data_length_body)) (PreH15 : (p_tail_circular_area_data_length_body = (data_buffer_circular_area_data_length_body + area_length_circular_area_data_length_body ))) (PreH16 : ((Zlength (contents_circular_area_data_length_body)) = area_length_circular_area_data_length_body)) (PreH17 : (retval = 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head_circular_area_data_length_body + area_length_circular_area_data_length_body ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_data_length_body)
  **  (UCharArray.full p_head_circular_area_data_length_body area_length_circular_area_data_length_body contents_circular_area_data_length_body )
  **  (GlobalStrings LitMap_circular_area_data_length_body )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  “ ((writeidx_circular_area_data_length_body - readidx_circular_area_data_length_body ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (writeidx_circular_area_data_length_body - readidx_circular_area_data_length_body )) ”
.

Definition CircularAreaGetDataLength_return_wit_1 := 
(
forall (circular_area_pre: Z) (contents_circular_area_data_length_body: (@list Z)) (operations_circular_area_data_length_body: Z) (LitMap_circular_area_data_length_body: (string -> Z)) (b_status_circular_area_data_length_body: Z) (area_length_circular_area_data_length_body: Z) (p_tail_circular_area_data_length_body: Z) (p_head_circular_area_data_length_body: Z) (writeidx_circular_area_data_length_body: Z) (readidx_circular_area_data_length_body: Z) (data_buffer_circular_area_data_length_body: Z) (retval: Z) (PreH1 : (CircularAreaIsFullResult readidx_circular_area_data_length_body writeidx_circular_area_data_length_body b_status_circular_area_data_length_body retval )) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 1)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (0 < area_length_circular_area_data_length_body)) (PreH7 : (area_length_circular_area_data_length_body <= 256)) (PreH8 : (0 <= readidx_circular_area_data_length_body)) (PreH9 : (readidx_circular_area_data_length_body <= 255)) (PreH10 : (readidx_circular_area_data_length_body < area_length_circular_area_data_length_body)) (PreH11 : (0 <= writeidx_circular_area_data_length_body)) (PreH12 : (writeidx_circular_area_data_length_body <= 255)) (PreH13 : (writeidx_circular_area_data_length_body < area_length_circular_area_data_length_body)) (PreH14 : (p_head_circular_area_data_length_body = data_buffer_circular_area_data_length_body)) (PreH15 : (p_tail_circular_area_data_length_body = (data_buffer_circular_area_data_length_body + area_length_circular_area_data_length_body ))) (PreH16 : ((Zlength (contents_circular_area_data_length_body)) = area_length_circular_area_data_length_body)) (PreH17 : (retval = 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head_circular_area_data_length_body + area_length_circular_area_data_length_body ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_data_length_body)
  **  (UCharArray.full p_head_circular_area_data_length_body area_length_circular_area_data_length_body contents_circular_area_data_length_body )
  **  (GlobalStrings LitMap_circular_area_data_length_body )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (CircularAreaDataLengthResult readidx_circular_area_data_length_body writeidx_circular_area_data_length_body area_length_circular_area_data_length_body b_status_circular_area_data_length_body ((unsigned_last_nbits (((unsigned_last_nbits ((writeidx_circular_area_data_length_body - readidx_circular_area_data_length_body )) (32)) + area_length_circular_area_data_length_body )) (32)) % ( area_length_circular_area_data_length_body ) ) ) ” 
  &&  “ (0 <= ((unsigned_last_nbits (((unsigned_last_nbits ((writeidx_circular_area_data_length_body - readidx_circular_area_data_length_body )) (32)) + area_length_circular_area_data_length_body )) (32)) % ( area_length_circular_area_data_length_body ) )) ” 
  &&  “ (((unsigned_last_nbits (((unsigned_last_nbits ((writeidx_circular_area_data_length_body - readidx_circular_area_data_length_body )) (32)) + area_length_circular_area_data_length_body )) (32)) % ( area_length_circular_area_data_length_body ) ) <= area_length_circular_area_data_length_body) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_data_length_body)
  **  (UCharArray.full data_buffer_circular_area_data_length_body area_length_circular_area_data_length_body contents_circular_area_data_length_body )
  **  (GlobalStrings LitMap_circular_area_data_length_body )
) \/
(
forall (circular_area_pre: Z) (contents_circular_area_data_length_body: (@list Z)) (LitMap_circular_area_data_length_body: (string -> Z)) (b_status_circular_area_data_length_body: Z) (area_length_circular_area_data_length_body: Z) (p_tail_circular_area_data_length_body: Z) (p_head_circular_area_data_length_body: Z) (writeidx_circular_area_data_length_body: Z) (readidx_circular_area_data_length_body: Z) (data_buffer_circular_area_data_length_body: Z) (retval: Z) (PreH1 : (CircularAreaIsFullResult readidx_circular_area_data_length_body writeidx_circular_area_data_length_body b_status_circular_area_data_length_body retval )) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 1)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (0 < area_length_circular_area_data_length_body)) (PreH7 : (area_length_circular_area_data_length_body <= 256)) (PreH8 : (0 <= readidx_circular_area_data_length_body)) (PreH9 : (readidx_circular_area_data_length_body <= 255)) (PreH10 : (readidx_circular_area_data_length_body < area_length_circular_area_data_length_body)) (PreH11 : (0 <= writeidx_circular_area_data_length_body)) (PreH12 : (writeidx_circular_area_data_length_body <= 255)) (PreH13 : (writeidx_circular_area_data_length_body < area_length_circular_area_data_length_body)) (PreH14 : (p_head_circular_area_data_length_body = data_buffer_circular_area_data_length_body)) (PreH15 : (p_tail_circular_area_data_length_body = (data_buffer_circular_area_data_length_body + area_length_circular_area_data_length_body ))) (PreH16 : ((Zlength (contents_circular_area_data_length_body)) = area_length_circular_area_data_length_body)) (PreH17 : (retval = 0)) ,
  (UCharArray.full p_head_circular_area_data_length_body area_length_circular_area_data_length_body contents_circular_area_data_length_body )
  **  (GlobalStrings LitMap_circular_area_data_length_body )
|--
  “ (((unsigned_last_nbits (((unsigned_last_nbits ((writeidx_circular_area_data_length_body - readidx_circular_area_data_length_body )) (32)) + area_length_circular_area_data_length_body )) (32)) % ( area_length_circular_area_data_length_body ) ) <= area_length_circular_area_data_length_body) ” 
  &&  “ (0 <= ((unsigned_last_nbits (((unsigned_last_nbits ((writeidx_circular_area_data_length_body - readidx_circular_area_data_length_body )) (32)) + area_length_circular_area_data_length_body )) (32)) % ( area_length_circular_area_data_length_body ) )) ” 
  &&  “ (CircularAreaDataLengthResult readidx_circular_area_data_length_body writeidx_circular_area_data_length_body area_length_circular_area_data_length_body b_status_circular_area_data_length_body ((unsigned_last_nbits (((unsigned_last_nbits ((writeidx_circular_area_data_length_body - readidx_circular_area_data_length_body )) (32)) + area_length_circular_area_data_length_body )) (32)) % ( area_length_circular_area_data_length_body ) ) ) ”
  &&  (UCharArray.full data_buffer_circular_area_data_length_body area_length_circular_area_data_length_body contents_circular_area_data_length_body )
  **  (GlobalStrings LitMap_circular_area_data_length_body )
).

Definition CircularAreaGetDataLength_return_wit_1_split_goal_1 := 
forall (circular_area_pre: Z) (contents_circular_area_data_length_body: (@list Z)) (LitMap_circular_area_data_length_body: (string -> Z)) (b_status_circular_area_data_length_body: Z) (area_length_circular_area_data_length_body: Z) (p_tail_circular_area_data_length_body: Z) (p_head_circular_area_data_length_body: Z) (writeidx_circular_area_data_length_body: Z) (readidx_circular_area_data_length_body: Z) (data_buffer_circular_area_data_length_body: Z) (retval: Z) (PreH1 : (CircularAreaIsFullResult readidx_circular_area_data_length_body writeidx_circular_area_data_length_body b_status_circular_area_data_length_body retval )) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 1)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (0 < area_length_circular_area_data_length_body)) (PreH7 : (area_length_circular_area_data_length_body <= 256)) (PreH8 : (0 <= readidx_circular_area_data_length_body)) (PreH9 : (readidx_circular_area_data_length_body <= 255)) (PreH10 : (readidx_circular_area_data_length_body < area_length_circular_area_data_length_body)) (PreH11 : (0 <= writeidx_circular_area_data_length_body)) (PreH12 : (writeidx_circular_area_data_length_body <= 255)) (PreH13 : (writeidx_circular_area_data_length_body < area_length_circular_area_data_length_body)) (PreH14 : (p_head_circular_area_data_length_body = data_buffer_circular_area_data_length_body)) (PreH15 : (p_tail_circular_area_data_length_body = (data_buffer_circular_area_data_length_body + area_length_circular_area_data_length_body ))) (PreH16 : ((Zlength (contents_circular_area_data_length_body)) = area_length_circular_area_data_length_body)) (PreH17 : (retval = 0)) ,
  (UCharArray.full p_head_circular_area_data_length_body area_length_circular_area_data_length_body contents_circular_area_data_length_body )
  **  (GlobalStrings LitMap_circular_area_data_length_body )
|--
  “ (((unsigned_last_nbits (((unsigned_last_nbits ((writeidx_circular_area_data_length_body - readidx_circular_area_data_length_body )) (32)) + area_length_circular_area_data_length_body )) (32)) % ( area_length_circular_area_data_length_body ) ) <= area_length_circular_area_data_length_body) ”
.

Definition CircularAreaGetDataLength_return_wit_1_split_goal_2 := 
forall (circular_area_pre: Z) (contents_circular_area_data_length_body: (@list Z)) (LitMap_circular_area_data_length_body: (string -> Z)) (b_status_circular_area_data_length_body: Z) (area_length_circular_area_data_length_body: Z) (p_tail_circular_area_data_length_body: Z) (p_head_circular_area_data_length_body: Z) (writeidx_circular_area_data_length_body: Z) (readidx_circular_area_data_length_body: Z) (data_buffer_circular_area_data_length_body: Z) (retval: Z) (PreH1 : (CircularAreaIsFullResult readidx_circular_area_data_length_body writeidx_circular_area_data_length_body b_status_circular_area_data_length_body retval )) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 1)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (0 < area_length_circular_area_data_length_body)) (PreH7 : (area_length_circular_area_data_length_body <= 256)) (PreH8 : (0 <= readidx_circular_area_data_length_body)) (PreH9 : (readidx_circular_area_data_length_body <= 255)) (PreH10 : (readidx_circular_area_data_length_body < area_length_circular_area_data_length_body)) (PreH11 : (0 <= writeidx_circular_area_data_length_body)) (PreH12 : (writeidx_circular_area_data_length_body <= 255)) (PreH13 : (writeidx_circular_area_data_length_body < area_length_circular_area_data_length_body)) (PreH14 : (p_head_circular_area_data_length_body = data_buffer_circular_area_data_length_body)) (PreH15 : (p_tail_circular_area_data_length_body = (data_buffer_circular_area_data_length_body + area_length_circular_area_data_length_body ))) (PreH16 : ((Zlength (contents_circular_area_data_length_body)) = area_length_circular_area_data_length_body)) (PreH17 : (retval = 0)) ,
  (UCharArray.full p_head_circular_area_data_length_body area_length_circular_area_data_length_body contents_circular_area_data_length_body )
  **  (GlobalStrings LitMap_circular_area_data_length_body )
|--
  “ (0 <= ((unsigned_last_nbits (((unsigned_last_nbits ((writeidx_circular_area_data_length_body - readidx_circular_area_data_length_body )) (32)) + area_length_circular_area_data_length_body )) (32)) % ( area_length_circular_area_data_length_body ) )) ”
.

Definition CircularAreaGetDataLength_return_wit_1_split_goal_3 := 
forall (circular_area_pre: Z) (contents_circular_area_data_length_body: (@list Z)) (LitMap_circular_area_data_length_body: (string -> Z)) (b_status_circular_area_data_length_body: Z) (area_length_circular_area_data_length_body: Z) (p_tail_circular_area_data_length_body: Z) (p_head_circular_area_data_length_body: Z) (writeidx_circular_area_data_length_body: Z) (readidx_circular_area_data_length_body: Z) (data_buffer_circular_area_data_length_body: Z) (retval: Z) (PreH1 : (CircularAreaIsFullResult readidx_circular_area_data_length_body writeidx_circular_area_data_length_body b_status_circular_area_data_length_body retval )) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 1)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (0 < area_length_circular_area_data_length_body)) (PreH7 : (area_length_circular_area_data_length_body <= 256)) (PreH8 : (0 <= readidx_circular_area_data_length_body)) (PreH9 : (readidx_circular_area_data_length_body <= 255)) (PreH10 : (readidx_circular_area_data_length_body < area_length_circular_area_data_length_body)) (PreH11 : (0 <= writeidx_circular_area_data_length_body)) (PreH12 : (writeidx_circular_area_data_length_body <= 255)) (PreH13 : (writeidx_circular_area_data_length_body < area_length_circular_area_data_length_body)) (PreH14 : (p_head_circular_area_data_length_body = data_buffer_circular_area_data_length_body)) (PreH15 : (p_tail_circular_area_data_length_body = (data_buffer_circular_area_data_length_body + area_length_circular_area_data_length_body ))) (PreH16 : ((Zlength (contents_circular_area_data_length_body)) = area_length_circular_area_data_length_body)) (PreH17 : (retval = 0)) ,
  (UCharArray.full p_head_circular_area_data_length_body area_length_circular_area_data_length_body contents_circular_area_data_length_body )
  **  (GlobalStrings LitMap_circular_area_data_length_body )
|--
  “ (CircularAreaDataLengthResult readidx_circular_area_data_length_body writeidx_circular_area_data_length_body area_length_circular_area_data_length_body b_status_circular_area_data_length_body ((unsigned_last_nbits (((unsigned_last_nbits ((writeidx_circular_area_data_length_body - readidx_circular_area_data_length_body )) (32)) + area_length_circular_area_data_length_body )) (32)) % ( area_length_circular_area_data_length_body ) ) ) ”
.

Definition CircularAreaGetDataLength_return_wit_1_split_goal_spatial := 
forall (circular_area_pre: Z) (contents_circular_area_data_length_body: (@list Z)) (LitMap_circular_area_data_length_body: (string -> Z)) (b_status_circular_area_data_length_body: Z) (area_length_circular_area_data_length_body: Z) (p_tail_circular_area_data_length_body: Z) (p_head_circular_area_data_length_body: Z) (writeidx_circular_area_data_length_body: Z) (readidx_circular_area_data_length_body: Z) (data_buffer_circular_area_data_length_body: Z) (retval: Z) (PreH1 : (CircularAreaIsFullResult readidx_circular_area_data_length_body writeidx_circular_area_data_length_body b_status_circular_area_data_length_body retval )) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 1)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (0 < area_length_circular_area_data_length_body)) (PreH7 : (area_length_circular_area_data_length_body <= 256)) (PreH8 : (0 <= readidx_circular_area_data_length_body)) (PreH9 : (readidx_circular_area_data_length_body <= 255)) (PreH10 : (readidx_circular_area_data_length_body < area_length_circular_area_data_length_body)) (PreH11 : (0 <= writeidx_circular_area_data_length_body)) (PreH12 : (writeidx_circular_area_data_length_body <= 255)) (PreH13 : (writeidx_circular_area_data_length_body < area_length_circular_area_data_length_body)) (PreH14 : (p_head_circular_area_data_length_body = data_buffer_circular_area_data_length_body)) (PreH15 : (p_tail_circular_area_data_length_body = (data_buffer_circular_area_data_length_body + area_length_circular_area_data_length_body ))) (PreH16 : ((Zlength (contents_circular_area_data_length_body)) = area_length_circular_area_data_length_body)) (PreH17 : (retval = 0)) ,
  (UCharArray.full p_head_circular_area_data_length_body area_length_circular_area_data_length_body contents_circular_area_data_length_body )
  **  (GlobalStrings LitMap_circular_area_data_length_body )
|--
  (UCharArray.full data_buffer_circular_area_data_length_body area_length_circular_area_data_length_body contents_circular_area_data_length_body )
  **  (GlobalStrings LitMap_circular_area_data_length_body )
.

Definition CircularAreaGetDataLength_return_wit_2 := 
(
forall (circular_area_pre: Z) (contents_circular_area_data_length_body: (@list Z)) (operations_circular_area_data_length_body: Z) (LitMap_circular_area_data_length_body: (string -> Z)) (b_status_circular_area_data_length_body: Z) (area_length_circular_area_data_length_body: Z) (p_tail_circular_area_data_length_body: Z) (p_head_circular_area_data_length_body: Z) (writeidx_circular_area_data_length_body: Z) (readidx_circular_area_data_length_body: Z) (data_buffer_circular_area_data_length_body: Z) (retval: Z) (PreH1 : (CircularAreaIsFullResult readidx_circular_area_data_length_body writeidx_circular_area_data_length_body b_status_circular_area_data_length_body retval )) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 1)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (0 < area_length_circular_area_data_length_body)) (PreH7 : (area_length_circular_area_data_length_body <= 256)) (PreH8 : (0 <= readidx_circular_area_data_length_body)) (PreH9 : (readidx_circular_area_data_length_body <= 255)) (PreH10 : (readidx_circular_area_data_length_body < area_length_circular_area_data_length_body)) (PreH11 : (0 <= writeidx_circular_area_data_length_body)) (PreH12 : (writeidx_circular_area_data_length_body <= 255)) (PreH13 : (writeidx_circular_area_data_length_body < area_length_circular_area_data_length_body)) (PreH14 : (p_head_circular_area_data_length_body = data_buffer_circular_area_data_length_body)) (PreH15 : (p_tail_circular_area_data_length_body = (data_buffer_circular_area_data_length_body + area_length_circular_area_data_length_body ))) (PreH16 : ((Zlength (contents_circular_area_data_length_body)) = area_length_circular_area_data_length_body)) (PreH17 : (retval <> 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head_circular_area_data_length_body + area_length_circular_area_data_length_body ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_data_length_body)
  **  (UCharArray.full p_head_circular_area_data_length_body area_length_circular_area_data_length_body contents_circular_area_data_length_body )
  **  (GlobalStrings LitMap_circular_area_data_length_body )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (CircularAreaDataLengthResult readidx_circular_area_data_length_body writeidx_circular_area_data_length_body area_length_circular_area_data_length_body b_status_circular_area_data_length_body area_length_circular_area_data_length_body ) ” 
  &&  “ (0 <= area_length_circular_area_data_length_body) ” 
  &&  “ (area_length_circular_area_data_length_body <= area_length_circular_area_data_length_body) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_data_length_body)
  **  (UCharArray.full data_buffer_circular_area_data_length_body area_length_circular_area_data_length_body contents_circular_area_data_length_body )
  **  (GlobalStrings LitMap_circular_area_data_length_body )
) \/
(
forall (circular_area_pre: Z) (contents_circular_area_data_length_body: (@list Z)) (LitMap_circular_area_data_length_body: (string -> Z)) (b_status_circular_area_data_length_body: Z) (area_length_circular_area_data_length_body: Z) (p_tail_circular_area_data_length_body: Z) (p_head_circular_area_data_length_body: Z) (writeidx_circular_area_data_length_body: Z) (readidx_circular_area_data_length_body: Z) (data_buffer_circular_area_data_length_body: Z) (retval: Z) (PreH1 : (CircularAreaIsFullResult readidx_circular_area_data_length_body writeidx_circular_area_data_length_body b_status_circular_area_data_length_body retval )) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 1)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (0 < area_length_circular_area_data_length_body)) (PreH7 : (area_length_circular_area_data_length_body <= 256)) (PreH8 : (0 <= readidx_circular_area_data_length_body)) (PreH9 : (readidx_circular_area_data_length_body <= 255)) (PreH10 : (readidx_circular_area_data_length_body < area_length_circular_area_data_length_body)) (PreH11 : (0 <= writeidx_circular_area_data_length_body)) (PreH12 : (writeidx_circular_area_data_length_body <= 255)) (PreH13 : (writeidx_circular_area_data_length_body < area_length_circular_area_data_length_body)) (PreH14 : (p_head_circular_area_data_length_body = data_buffer_circular_area_data_length_body)) (PreH15 : (p_tail_circular_area_data_length_body = (data_buffer_circular_area_data_length_body + area_length_circular_area_data_length_body ))) (PreH16 : ((Zlength (contents_circular_area_data_length_body)) = area_length_circular_area_data_length_body)) (PreH17 : (retval <> 0)) ,
  (UCharArray.full p_head_circular_area_data_length_body area_length_circular_area_data_length_body contents_circular_area_data_length_body )
  **  (GlobalStrings LitMap_circular_area_data_length_body )
|--
  “ (CircularAreaDataLengthResult readidx_circular_area_data_length_body writeidx_circular_area_data_length_body area_length_circular_area_data_length_body b_status_circular_area_data_length_body area_length_circular_area_data_length_body ) ”
  &&  (UCharArray.full data_buffer_circular_area_data_length_body area_length_circular_area_data_length_body contents_circular_area_data_length_body )
  **  (GlobalStrings LitMap_circular_area_data_length_body )
).

Definition CircularAreaGetDataLength_return_wit_2_split_goal_1 := 
forall (circular_area_pre: Z) (contents_circular_area_data_length_body: (@list Z)) (LitMap_circular_area_data_length_body: (string -> Z)) (b_status_circular_area_data_length_body: Z) (area_length_circular_area_data_length_body: Z) (p_tail_circular_area_data_length_body: Z) (p_head_circular_area_data_length_body: Z) (writeidx_circular_area_data_length_body: Z) (readidx_circular_area_data_length_body: Z) (data_buffer_circular_area_data_length_body: Z) (retval: Z) (PreH1 : (CircularAreaIsFullResult readidx_circular_area_data_length_body writeidx_circular_area_data_length_body b_status_circular_area_data_length_body retval )) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 1)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (0 < area_length_circular_area_data_length_body)) (PreH7 : (area_length_circular_area_data_length_body <= 256)) (PreH8 : (0 <= readidx_circular_area_data_length_body)) (PreH9 : (readidx_circular_area_data_length_body <= 255)) (PreH10 : (readidx_circular_area_data_length_body < area_length_circular_area_data_length_body)) (PreH11 : (0 <= writeidx_circular_area_data_length_body)) (PreH12 : (writeidx_circular_area_data_length_body <= 255)) (PreH13 : (writeidx_circular_area_data_length_body < area_length_circular_area_data_length_body)) (PreH14 : (p_head_circular_area_data_length_body = data_buffer_circular_area_data_length_body)) (PreH15 : (p_tail_circular_area_data_length_body = (data_buffer_circular_area_data_length_body + area_length_circular_area_data_length_body ))) (PreH16 : ((Zlength (contents_circular_area_data_length_body)) = area_length_circular_area_data_length_body)) (PreH17 : (retval <> 0)) ,
  (UCharArray.full p_head_circular_area_data_length_body area_length_circular_area_data_length_body contents_circular_area_data_length_body )
  **  (GlobalStrings LitMap_circular_area_data_length_body )
|--
  “ (CircularAreaDataLengthResult readidx_circular_area_data_length_body writeidx_circular_area_data_length_body area_length_circular_area_data_length_body b_status_circular_area_data_length_body area_length_circular_area_data_length_body ) ”
.

Definition CircularAreaGetDataLength_return_wit_2_split_goal_spatial := 
forall (circular_area_pre: Z) (contents_circular_area_data_length_body: (@list Z)) (LitMap_circular_area_data_length_body: (string -> Z)) (b_status_circular_area_data_length_body: Z) (area_length_circular_area_data_length_body: Z) (p_tail_circular_area_data_length_body: Z) (p_head_circular_area_data_length_body: Z) (writeidx_circular_area_data_length_body: Z) (readidx_circular_area_data_length_body: Z) (data_buffer_circular_area_data_length_body: Z) (retval: Z) (PreH1 : (CircularAreaIsFullResult readidx_circular_area_data_length_body writeidx_circular_area_data_length_body b_status_circular_area_data_length_body retval )) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 1)) (PreH4 : (circular_area_pre <> 0)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (0 < area_length_circular_area_data_length_body)) (PreH7 : (area_length_circular_area_data_length_body <= 256)) (PreH8 : (0 <= readidx_circular_area_data_length_body)) (PreH9 : (readidx_circular_area_data_length_body <= 255)) (PreH10 : (readidx_circular_area_data_length_body < area_length_circular_area_data_length_body)) (PreH11 : (0 <= writeidx_circular_area_data_length_body)) (PreH12 : (writeidx_circular_area_data_length_body <= 255)) (PreH13 : (writeidx_circular_area_data_length_body < area_length_circular_area_data_length_body)) (PreH14 : (p_head_circular_area_data_length_body = data_buffer_circular_area_data_length_body)) (PreH15 : (p_tail_circular_area_data_length_body = (data_buffer_circular_area_data_length_body + area_length_circular_area_data_length_body ))) (PreH16 : ((Zlength (contents_circular_area_data_length_body)) = area_length_circular_area_data_length_body)) (PreH17 : (retval <> 0)) ,
  (UCharArray.full p_head_circular_area_data_length_body area_length_circular_area_data_length_body contents_circular_area_data_length_body )
  **  (GlobalStrings LitMap_circular_area_data_length_body )
|--
  (UCharArray.full data_buffer_circular_area_data_length_body area_length_circular_area_data_length_body contents_circular_area_data_length_body )
  **  (GlobalStrings LitMap_circular_area_data_length_body )
.

Definition CircularAreaGetDataLength_return_wit_3 := 
forall (circular_area_pre: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = 0)) ,
  TT && emp 
|--
  “ (circular_area_pre = 0) ” 
  &&  “ (1 = 1) ”
  &&  emp
.

Definition CircularAreaGetDataLength_partial_solve_wit_1_pure := 
forall (circular_area_pre: Z) (contents_circular_area_data_length_body: (@list Z)) (operations_circular_area_data_length_body: Z) (LitMap_circular_area_data_length_body: (string -> Z)) (b_status_circular_area_data_length_body: Z) (area_length_circular_area_data_length_body: Z) (p_tail_circular_area_data_length_body: Z) (p_head_circular_area_data_length_body: Z) (writeidx_circular_area_data_length_body: Z) (readidx_circular_area_data_length_body: Z) (data_buffer_circular_area_data_length_body: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (0 < area_length_circular_area_data_length_body)) (PreH4 : (area_length_circular_area_data_length_body <= 256)) (PreH5 : (0 <= readidx_circular_area_data_length_body)) (PreH6 : (readidx_circular_area_data_length_body <= 255)) (PreH7 : (readidx_circular_area_data_length_body < area_length_circular_area_data_length_body)) (PreH8 : (0 <= writeidx_circular_area_data_length_body)) (PreH9 : (writeidx_circular_area_data_length_body <= 255)) (PreH10 : (writeidx_circular_area_data_length_body < area_length_circular_area_data_length_body)) (PreH11 : (p_head_circular_area_data_length_body = data_buffer_circular_area_data_length_body)) (PreH12 : (p_tail_circular_area_data_length_body = (data_buffer_circular_area_data_length_body + area_length_circular_area_data_length_body ))) (PreH13 : ((Zlength (contents_circular_area_data_length_body)) = area_length_circular_area_data_length_body)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_data_length_body)
  **  (UCharArray.full data_buffer_circular_area_data_length_body area_length_circular_area_data_length_body contents_circular_area_data_length_body )
  **  (GlobalStrings LitMap_circular_area_data_length_body )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (0 < area_length_circular_area_data_length_body) ” 
  &&  “ (area_length_circular_area_data_length_body <= 256) ” 
  &&  “ (0 <= readidx_circular_area_data_length_body) ” 
  &&  “ (readidx_circular_area_data_length_body <= 255) ” 
  &&  “ (readidx_circular_area_data_length_body < area_length_circular_area_data_length_body) ” 
  &&  “ (0 <= writeidx_circular_area_data_length_body) ” 
  &&  “ (writeidx_circular_area_data_length_body <= 255) ” 
  &&  “ (writeidx_circular_area_data_length_body < area_length_circular_area_data_length_body) ” 
  &&  “ (p_head_circular_area_data_length_body = p_head_circular_area_data_length_body) ” 
  &&  “ ((p_head_circular_area_data_length_body + area_length_circular_area_data_length_body ) = (p_head_circular_area_data_length_body + area_length_circular_area_data_length_body )) ” 
  &&  “ ((Zlength (contents_circular_area_data_length_body)) = area_length_circular_area_data_length_body) ”
.

Definition CircularAreaGetDataLength_partial_solve_wit_1_aux := 
forall (circular_area_pre: Z) (contents_circular_area_data_length_body: (@list Z)) (operations_circular_area_data_length_body: Z) (LitMap_circular_area_data_length_body: (string -> Z)) (b_status_circular_area_data_length_body: Z) (area_length_circular_area_data_length_body: Z) (p_tail_circular_area_data_length_body: Z) (p_head_circular_area_data_length_body: Z) (writeidx_circular_area_data_length_body: Z) (readidx_circular_area_data_length_body: Z) (data_buffer_circular_area_data_length_body: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (0 < area_length_circular_area_data_length_body)) (PreH4 : (area_length_circular_area_data_length_body <= 256)) (PreH5 : (0 <= readidx_circular_area_data_length_body)) (PreH6 : (readidx_circular_area_data_length_body <= 255)) (PreH7 : (readidx_circular_area_data_length_body < area_length_circular_area_data_length_body)) (PreH8 : (0 <= writeidx_circular_area_data_length_body)) (PreH9 : (writeidx_circular_area_data_length_body <= 255)) (PreH10 : (writeidx_circular_area_data_length_body < area_length_circular_area_data_length_body)) (PreH11 : (p_head_circular_area_data_length_body = data_buffer_circular_area_data_length_body)) (PreH12 : (p_tail_circular_area_data_length_body = (data_buffer_circular_area_data_length_body + area_length_circular_area_data_length_body ))) (PreH13 : ((Zlength (contents_circular_area_data_length_body)) = area_length_circular_area_data_length_body)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_data_length_body)
  **  (UCharArray.full data_buffer_circular_area_data_length_body area_length_circular_area_data_length_body contents_circular_area_data_length_body )
  **  (GlobalStrings LitMap_circular_area_data_length_body )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (0 < area_length_circular_area_data_length_body) ” 
  &&  “ (area_length_circular_area_data_length_body <= 256) ” 
  &&  “ (0 <= readidx_circular_area_data_length_body) ” 
  &&  “ (readidx_circular_area_data_length_body <= 255) ” 
  &&  “ (readidx_circular_area_data_length_body < area_length_circular_area_data_length_body) ” 
  &&  “ (0 <= writeidx_circular_area_data_length_body) ” 
  &&  “ (writeidx_circular_area_data_length_body <= 255) ” 
  &&  “ (writeidx_circular_area_data_length_body < area_length_circular_area_data_length_body) ” 
  &&  “ (p_head_circular_area_data_length_body = p_head_circular_area_data_length_body) ” 
  &&  “ ((p_head_circular_area_data_length_body + area_length_circular_area_data_length_body ) = (p_head_circular_area_data_length_body + area_length_circular_area_data_length_body )) ” 
  &&  “ ((Zlength (contents_circular_area_data_length_body)) = area_length_circular_area_data_length_body) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (0 < area_length_circular_area_data_length_body) ” 
  &&  “ (area_length_circular_area_data_length_body <= 256) ” 
  &&  “ (0 <= readidx_circular_area_data_length_body) ” 
  &&  “ (readidx_circular_area_data_length_body <= 255) ” 
  &&  “ (readidx_circular_area_data_length_body < area_length_circular_area_data_length_body) ” 
  &&  “ (0 <= writeidx_circular_area_data_length_body) ” 
  &&  “ (writeidx_circular_area_data_length_body <= 255) ” 
  &&  “ (writeidx_circular_area_data_length_body < area_length_circular_area_data_length_body) ” 
  &&  “ (p_head_circular_area_data_length_body = data_buffer_circular_area_data_length_body) ” 
  &&  “ (p_tail_circular_area_data_length_body = (data_buffer_circular_area_data_length_body + area_length_circular_area_data_length_body )) ” 
  &&  “ ((Zlength (contents_circular_area_data_length_body)) = area_length_circular_area_data_length_body) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head_circular_area_data_length_body + area_length_circular_area_data_length_body ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_data_length_body)
  **  (UCharArray.full p_head_circular_area_data_length_body area_length_circular_area_data_length_body contents_circular_area_data_length_body )
  **  (GlobalStrings LitMap_circular_area_data_length_body )
.

Definition CircularAreaGetDataLength_partial_solve_wit_1 := CircularAreaGetDataLength_partial_solve_wit_1_pure -> CircularAreaGetDataLength_partial_solve_wit_1_aux.

(*----- Function CircularAreaDivideWrData -----*)

Definition CircularAreaDivideWrData_safety_wit_1 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (contents_circular_area_divide_wr_data_callable: (@list Z)) (operations_circular_area_divide_wr_data_callable: Z) (b_status_circular_area_divide_wr_data_callable: Z) (area_length_circular_area_divide_wr_data_callable: Z) (p_tail_circular_area_divide_wr_data_callable: Z) (p_head_circular_area_divide_wr_data_callable: Z) (writeidx_circular_area_divide_wr_data_callable: Z) (readidx_circular_area_divide_wr_data_callable: Z) (data_buffer_circular_area_divide_wr_data_callable: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (0 < area_length_circular_area_divide_wr_data_callable)) (PreH3 : (area_length_circular_area_divide_wr_data_callable <= 256)) (PreH4 : (0 <= readidx_circular_area_divide_wr_data_callable)) (PreH5 : (readidx_circular_area_divide_wr_data_callable <= 255)) (PreH6 : (readidx_circular_area_divide_wr_data_callable < area_length_circular_area_divide_wr_data_callable)) (PreH7 : (0 <= writeidx_circular_area_divide_wr_data_callable)) (PreH8 : (writeidx_circular_area_divide_wr_data_callable <= 255)) (PreH9 : (writeidx_circular_area_divide_wr_data_callable < area_length_circular_area_divide_wr_data_callable)) (PreH10 : (p_head_circular_area_divide_wr_data_callable = data_buffer_circular_area_divide_wr_data_callable)) (PreH11 : (p_tail_circular_area_divide_wr_data_callable = (data_buffer_circular_area_divide_wr_data_callable + area_length_circular_area_divide_wr_data_callable ))) (PreH12 : ((Zlength (contents_circular_area_divide_wr_data_callable)) = area_length_circular_area_divide_wr_data_callable)) (PreH13 : (0 <= data_length_pre)) (PreH14 : (data_length_pre <= area_length_circular_area_divide_wr_data_callable)) (PreH15 : ((writeidx_circular_area_divide_wr_data_callable + data_length_pre ) <= 4294967295)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_divide_wr_data_callable)
  **  (UCharArray.full data_buffer_circular_area_divide_wr_data_callable area_length_circular_area_divide_wr_data_callable contents_circular_area_divide_wr_data_callable )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaDivideWrData_safety_wit_2 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (contents_circular_area_divide_wr_data_callable: (@list Z)) (operations_circular_area_divide_wr_data_callable: Z) (b_status_circular_area_divide_wr_data_callable: Z) (area_length_circular_area_divide_wr_data_callable: Z) (p_tail_circular_area_divide_wr_data_callable: Z) (p_head_circular_area_divide_wr_data_callable: Z) (writeidx_circular_area_divide_wr_data_callable: Z) (readidx_circular_area_divide_wr_data_callable: Z) (data_buffer_circular_area_divide_wr_data_callable: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (0 < area_length_circular_area_divide_wr_data_callable)) (PreH4 : (area_length_circular_area_divide_wr_data_callable <= 256)) (PreH5 : (0 <= readidx_circular_area_divide_wr_data_callable)) (PreH6 : (readidx_circular_area_divide_wr_data_callable <= 255)) (PreH7 : (readidx_circular_area_divide_wr_data_callable < area_length_circular_area_divide_wr_data_callable)) (PreH8 : (0 <= writeidx_circular_area_divide_wr_data_callable)) (PreH9 : (writeidx_circular_area_divide_wr_data_callable <= 255)) (PreH10 : (writeidx_circular_area_divide_wr_data_callable < area_length_circular_area_divide_wr_data_callable)) (PreH11 : (p_head_circular_area_divide_wr_data_callable = data_buffer_circular_area_divide_wr_data_callable)) (PreH12 : (p_tail_circular_area_divide_wr_data_callable = (data_buffer_circular_area_divide_wr_data_callable + area_length_circular_area_divide_wr_data_callable ))) (PreH13 : ((Zlength (contents_circular_area_divide_wr_data_callable)) = area_length_circular_area_divide_wr_data_callable)) (PreH14 : (0 <= data_length_pre)) (PreH15 : (data_length_pre <= area_length_circular_area_divide_wr_data_callable)) (PreH16 : ((writeidx_circular_area_divide_wr_data_callable + data_length_pre ) <= 4294967295)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_divide_wr_data_callable)
  **  (UCharArray.full data_buffer_circular_area_divide_wr_data_callable area_length_circular_area_divide_wr_data_callable contents_circular_area_divide_wr_data_callable )
|--
  “ False ”
.

Definition CircularAreaDivideWrData_safety_wit_3 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (contents_circular_area_divide_wr_data_callable: (@list Z)) (operations_circular_area_divide_wr_data_callable: Z) (b_status_circular_area_divide_wr_data_callable: Z) (area_length_circular_area_divide_wr_data_callable: Z) (p_tail_circular_area_divide_wr_data_callable: Z) (p_head_circular_area_divide_wr_data_callable: Z) (writeidx_circular_area_divide_wr_data_callable: Z) (readidx_circular_area_divide_wr_data_callable: Z) (data_buffer_circular_area_divide_wr_data_callable: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (0 < area_length_circular_area_divide_wr_data_callable)) (PreH4 : (area_length_circular_area_divide_wr_data_callable <= 256)) (PreH5 : (0 <= readidx_circular_area_divide_wr_data_callable)) (PreH6 : (readidx_circular_area_divide_wr_data_callable <= 255)) (PreH7 : (readidx_circular_area_divide_wr_data_callable < area_length_circular_area_divide_wr_data_callable)) (PreH8 : (0 <= writeidx_circular_area_divide_wr_data_callable)) (PreH9 : (writeidx_circular_area_divide_wr_data_callable <= 255)) (PreH10 : (writeidx_circular_area_divide_wr_data_callable < area_length_circular_area_divide_wr_data_callable)) (PreH11 : (p_head_circular_area_divide_wr_data_callable = data_buffer_circular_area_divide_wr_data_callable)) (PreH12 : (p_tail_circular_area_divide_wr_data_callable = (data_buffer_circular_area_divide_wr_data_callable + area_length_circular_area_divide_wr_data_callable ))) (PreH13 : ((Zlength (contents_circular_area_divide_wr_data_callable)) = area_length_circular_area_divide_wr_data_callable)) (PreH14 : (0 <= data_length_pre)) (PreH15 : (data_length_pre <= area_length_circular_area_divide_wr_data_callable)) (PreH16 : ((writeidx_circular_area_divide_wr_data_callable + data_length_pre ) <= 4294967295)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_divide_wr_data_callable)
  **  (UCharArray.full data_buffer_circular_area_divide_wr_data_callable area_length_circular_area_divide_wr_data_callable contents_circular_area_divide_wr_data_callable )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaDivideWrData_safety_wit_4 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (contents_circular_area_divide_wr_data_callable: (@list Z)) (operations_circular_area_divide_wr_data_callable: Z) (b_status_circular_area_divide_wr_data_callable: Z) (area_length_circular_area_divide_wr_data_callable: Z) (p_tail_circular_area_divide_wr_data_callable: Z) (p_head_circular_area_divide_wr_data_callable: Z) (writeidx_circular_area_divide_wr_data_callable: Z) (readidx_circular_area_divide_wr_data_callable: Z) (data_buffer_circular_area_divide_wr_data_callable: Z) (PreH1 : ((writeidx_circular_area_divide_wr_data_callable + data_length_pre ) <= area_length_circular_area_divide_wr_data_callable)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 < area_length_circular_area_divide_wr_data_callable)) (PreH5 : (area_length_circular_area_divide_wr_data_callable <= 256)) (PreH6 : (0 <= readidx_circular_area_divide_wr_data_callable)) (PreH7 : (readidx_circular_area_divide_wr_data_callable <= 255)) (PreH8 : (readidx_circular_area_divide_wr_data_callable < area_length_circular_area_divide_wr_data_callable)) (PreH9 : (0 <= writeidx_circular_area_divide_wr_data_callable)) (PreH10 : (writeidx_circular_area_divide_wr_data_callable <= 255)) (PreH11 : (writeidx_circular_area_divide_wr_data_callable < area_length_circular_area_divide_wr_data_callable)) (PreH12 : (p_head_circular_area_divide_wr_data_callable = data_buffer_circular_area_divide_wr_data_callable)) (PreH13 : (p_tail_circular_area_divide_wr_data_callable = (data_buffer_circular_area_divide_wr_data_callable + area_length_circular_area_divide_wr_data_callable ))) (PreH14 : ((Zlength (contents_circular_area_divide_wr_data_callable)) = area_length_circular_area_divide_wr_data_callable)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= area_length_circular_area_divide_wr_data_callable)) (PreH17 : ((writeidx_circular_area_divide_wr_data_callable + data_length_pre ) <= 4294967295)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_divide_wr_data_callable)
  **  (UCharArray.full data_buffer_circular_area_divide_wr_data_callable area_length_circular_area_divide_wr_data_callable contents_circular_area_divide_wr_data_callable )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaDivideWrData_safety_wit_5 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (contents_circular_area_divide_wr_data_callable: (@list Z)) (operations_circular_area_divide_wr_data_callable: Z) (b_status_circular_area_divide_wr_data_callable: Z) (area_length_circular_area_divide_wr_data_callable: Z) (p_tail_circular_area_divide_wr_data_callable: Z) (p_head_circular_area_divide_wr_data_callable: Z) (writeidx_circular_area_divide_wr_data_callable: Z) (readidx_circular_area_divide_wr_data_callable: Z) (data_buffer_circular_area_divide_wr_data_callable: Z) (PreH1 : ((writeidx_circular_area_divide_wr_data_callable + data_length_pre ) > area_length_circular_area_divide_wr_data_callable)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 < area_length_circular_area_divide_wr_data_callable)) (PreH5 : (area_length_circular_area_divide_wr_data_callable <= 256)) (PreH6 : (0 <= readidx_circular_area_divide_wr_data_callable)) (PreH7 : (readidx_circular_area_divide_wr_data_callable <= 255)) (PreH8 : (readidx_circular_area_divide_wr_data_callable < area_length_circular_area_divide_wr_data_callable)) (PreH9 : (0 <= writeidx_circular_area_divide_wr_data_callable)) (PreH10 : (writeidx_circular_area_divide_wr_data_callable <= 255)) (PreH11 : (writeidx_circular_area_divide_wr_data_callable < area_length_circular_area_divide_wr_data_callable)) (PreH12 : (p_head_circular_area_divide_wr_data_callable = data_buffer_circular_area_divide_wr_data_callable)) (PreH13 : (p_tail_circular_area_divide_wr_data_callable = (data_buffer_circular_area_divide_wr_data_callable + area_length_circular_area_divide_wr_data_callable ))) (PreH14 : ((Zlength (contents_circular_area_divide_wr_data_callable)) = area_length_circular_area_divide_wr_data_callable)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= area_length_circular_area_divide_wr_data_callable)) (PreH17 : ((writeidx_circular_area_divide_wr_data_callable + data_length_pre ) <= 4294967295)) ,
  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_divide_wr_data_callable)
  **  (UCharArray.full data_buffer_circular_area_divide_wr_data_callable area_length_circular_area_divide_wr_data_callable contents_circular_area_divide_wr_data_callable )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaDivideWrData_return_wit_1 := 
(
forall (data_length_pre: Z) (circular_area_pre: Z) (contents_circular_area_divide_wr_data_callable: (@list Z)) (operations_circular_area_divide_wr_data_callable: Z) (b_status_circular_area_divide_wr_data_callable: Z) (area_length_circular_area_divide_wr_data_callable: Z) (p_tail_circular_area_divide_wr_data_callable: Z) (p_head_circular_area_divide_wr_data_callable: Z) (writeidx_circular_area_divide_wr_data_callable: Z) (readidx_circular_area_divide_wr_data_callable: Z) (data_buffer_circular_area_divide_wr_data_callable: Z) (PreH1 : ((writeidx_circular_area_divide_wr_data_callable + data_length_pre ) > area_length_circular_area_divide_wr_data_callable)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 < area_length_circular_area_divide_wr_data_callable)) (PreH5 : (area_length_circular_area_divide_wr_data_callable <= 256)) (PreH6 : (0 <= readidx_circular_area_divide_wr_data_callable)) (PreH7 : (readidx_circular_area_divide_wr_data_callable <= 255)) (PreH8 : (readidx_circular_area_divide_wr_data_callable < area_length_circular_area_divide_wr_data_callable)) (PreH9 : (0 <= writeidx_circular_area_divide_wr_data_callable)) (PreH10 : (writeidx_circular_area_divide_wr_data_callable <= 255)) (PreH11 : (writeidx_circular_area_divide_wr_data_callable < area_length_circular_area_divide_wr_data_callable)) (PreH12 : (p_head_circular_area_divide_wr_data_callable = data_buffer_circular_area_divide_wr_data_callable)) (PreH13 : (p_tail_circular_area_divide_wr_data_callable = (data_buffer_circular_area_divide_wr_data_callable + area_length_circular_area_divide_wr_data_callable ))) (PreH14 : ((Zlength (contents_circular_area_divide_wr_data_callable)) = area_length_circular_area_divide_wr_data_callable)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= area_length_circular_area_divide_wr_data_callable)) (PreH17 : ((writeidx_circular_area_divide_wr_data_callable + data_length_pre ) <= 4294967295)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_divide_wr_data_callable)
  **  (UCharArray.full data_buffer_circular_area_divide_wr_data_callable area_length_circular_area_divide_wr_data_callable contents_circular_area_divide_wr_data_callable )
|--
  “ (CircularAreaDivideWrDataResult writeidx_circular_area_divide_wr_data_callable data_length_pre area_length_circular_area_divide_wr_data_callable 1 ) ” 
  &&  “ (0 <= 1) ” 
  &&  “ (1 <= 1) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_divide_wr_data_callable)
  **  (UCharArray.full data_buffer_circular_area_divide_wr_data_callable area_length_circular_area_divide_wr_data_callable contents_circular_area_divide_wr_data_callable )
) \/
(
forall (data_length_pre: Z) (circular_area_pre: Z) (contents_circular_area_divide_wr_data_callable: (@list Z)) (area_length_circular_area_divide_wr_data_callable: Z) (p_tail_circular_area_divide_wr_data_callable: Z) (p_head_circular_area_divide_wr_data_callable: Z) (writeidx_circular_area_divide_wr_data_callable: Z) (readidx_circular_area_divide_wr_data_callable: Z) (data_buffer_circular_area_divide_wr_data_callable: Z) (PreH1 : ((writeidx_circular_area_divide_wr_data_callable + data_length_pre ) > area_length_circular_area_divide_wr_data_callable)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 < area_length_circular_area_divide_wr_data_callable)) (PreH5 : (area_length_circular_area_divide_wr_data_callable <= 256)) (PreH6 : (0 <= readidx_circular_area_divide_wr_data_callable)) (PreH7 : (readidx_circular_area_divide_wr_data_callable <= 255)) (PreH8 : (readidx_circular_area_divide_wr_data_callable < area_length_circular_area_divide_wr_data_callable)) (PreH9 : (0 <= writeidx_circular_area_divide_wr_data_callable)) (PreH10 : (writeidx_circular_area_divide_wr_data_callable <= 255)) (PreH11 : (writeidx_circular_area_divide_wr_data_callable < area_length_circular_area_divide_wr_data_callable)) (PreH12 : (p_head_circular_area_divide_wr_data_callable = data_buffer_circular_area_divide_wr_data_callable)) (PreH13 : (p_tail_circular_area_divide_wr_data_callable = (data_buffer_circular_area_divide_wr_data_callable + area_length_circular_area_divide_wr_data_callable ))) (PreH14 : ((Zlength (contents_circular_area_divide_wr_data_callable)) = area_length_circular_area_divide_wr_data_callable)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= area_length_circular_area_divide_wr_data_callable)) (PreH17 : ((writeidx_circular_area_divide_wr_data_callable + data_length_pre ) <= 4294967295)) ,
  TT && emp 
|--
  “ (CircularAreaDivideWrDataResult writeidx_circular_area_divide_wr_data_callable data_length_pre area_length_circular_area_divide_wr_data_callable 1 ) ”
  &&  emp
).

Definition CircularAreaDivideWrData_return_wit_1_split_goal_1 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (contents_circular_area_divide_wr_data_callable: (@list Z)) (area_length_circular_area_divide_wr_data_callable: Z) (p_tail_circular_area_divide_wr_data_callable: Z) (p_head_circular_area_divide_wr_data_callable: Z) (writeidx_circular_area_divide_wr_data_callable: Z) (readidx_circular_area_divide_wr_data_callable: Z) (data_buffer_circular_area_divide_wr_data_callable: Z) (PreH1 : ((writeidx_circular_area_divide_wr_data_callable + data_length_pre ) > area_length_circular_area_divide_wr_data_callable)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 < area_length_circular_area_divide_wr_data_callable)) (PreH5 : (area_length_circular_area_divide_wr_data_callable <= 256)) (PreH6 : (0 <= readidx_circular_area_divide_wr_data_callable)) (PreH7 : (readidx_circular_area_divide_wr_data_callable <= 255)) (PreH8 : (readidx_circular_area_divide_wr_data_callable < area_length_circular_area_divide_wr_data_callable)) (PreH9 : (0 <= writeidx_circular_area_divide_wr_data_callable)) (PreH10 : (writeidx_circular_area_divide_wr_data_callable <= 255)) (PreH11 : (writeidx_circular_area_divide_wr_data_callable < area_length_circular_area_divide_wr_data_callable)) (PreH12 : (p_head_circular_area_divide_wr_data_callable = data_buffer_circular_area_divide_wr_data_callable)) (PreH13 : (p_tail_circular_area_divide_wr_data_callable = (data_buffer_circular_area_divide_wr_data_callable + area_length_circular_area_divide_wr_data_callable ))) (PreH14 : ((Zlength (contents_circular_area_divide_wr_data_callable)) = area_length_circular_area_divide_wr_data_callable)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= area_length_circular_area_divide_wr_data_callable)) (PreH17 : ((writeidx_circular_area_divide_wr_data_callable + data_length_pre ) <= 4294967295)) ,
  (CircularAreaDivideWrDataResult writeidx_circular_area_divide_wr_data_callable data_length_pre area_length_circular_area_divide_wr_data_callable 1 )
.

Definition CircularAreaDivideWrData_return_wit_2 := 
(
forall (data_length_pre: Z) (circular_area_pre: Z) (contents_circular_area_divide_wr_data_callable: (@list Z)) (operations_circular_area_divide_wr_data_callable: Z) (b_status_circular_area_divide_wr_data_callable: Z) (area_length_circular_area_divide_wr_data_callable: Z) (p_tail_circular_area_divide_wr_data_callable: Z) (p_head_circular_area_divide_wr_data_callable: Z) (writeidx_circular_area_divide_wr_data_callable: Z) (readidx_circular_area_divide_wr_data_callable: Z) (data_buffer_circular_area_divide_wr_data_callable: Z) (PreH1 : ((writeidx_circular_area_divide_wr_data_callable + data_length_pre ) <= area_length_circular_area_divide_wr_data_callable)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 < area_length_circular_area_divide_wr_data_callable)) (PreH5 : (area_length_circular_area_divide_wr_data_callable <= 256)) (PreH6 : (0 <= readidx_circular_area_divide_wr_data_callable)) (PreH7 : (readidx_circular_area_divide_wr_data_callable <= 255)) (PreH8 : (readidx_circular_area_divide_wr_data_callable < area_length_circular_area_divide_wr_data_callable)) (PreH9 : (0 <= writeidx_circular_area_divide_wr_data_callable)) (PreH10 : (writeidx_circular_area_divide_wr_data_callable <= 255)) (PreH11 : (writeidx_circular_area_divide_wr_data_callable < area_length_circular_area_divide_wr_data_callable)) (PreH12 : (p_head_circular_area_divide_wr_data_callable = data_buffer_circular_area_divide_wr_data_callable)) (PreH13 : (p_tail_circular_area_divide_wr_data_callable = (data_buffer_circular_area_divide_wr_data_callable + area_length_circular_area_divide_wr_data_callable ))) (PreH14 : ((Zlength (contents_circular_area_divide_wr_data_callable)) = area_length_circular_area_divide_wr_data_callable)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= area_length_circular_area_divide_wr_data_callable)) (PreH17 : ((writeidx_circular_area_divide_wr_data_callable + data_length_pre ) <= 4294967295)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_divide_wr_data_callable)
  **  (UCharArray.full data_buffer_circular_area_divide_wr_data_callable area_length_circular_area_divide_wr_data_callable contents_circular_area_divide_wr_data_callable )
|--
  “ (CircularAreaDivideWrDataResult writeidx_circular_area_divide_wr_data_callable data_length_pre area_length_circular_area_divide_wr_data_callable 0 ) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= 1) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_divide_wr_data_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_divide_wr_data_callable)
  **  (UCharArray.full data_buffer_circular_area_divide_wr_data_callable area_length_circular_area_divide_wr_data_callable contents_circular_area_divide_wr_data_callable )
) \/
(
forall (data_length_pre: Z) (circular_area_pre: Z) (contents_circular_area_divide_wr_data_callable: (@list Z)) (area_length_circular_area_divide_wr_data_callable: Z) (p_tail_circular_area_divide_wr_data_callable: Z) (p_head_circular_area_divide_wr_data_callable: Z) (writeidx_circular_area_divide_wr_data_callable: Z) (readidx_circular_area_divide_wr_data_callable: Z) (data_buffer_circular_area_divide_wr_data_callable: Z) (PreH1 : ((writeidx_circular_area_divide_wr_data_callable + data_length_pre ) <= area_length_circular_area_divide_wr_data_callable)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 < area_length_circular_area_divide_wr_data_callable)) (PreH5 : (area_length_circular_area_divide_wr_data_callable <= 256)) (PreH6 : (0 <= readidx_circular_area_divide_wr_data_callable)) (PreH7 : (readidx_circular_area_divide_wr_data_callable <= 255)) (PreH8 : (readidx_circular_area_divide_wr_data_callable < area_length_circular_area_divide_wr_data_callable)) (PreH9 : (0 <= writeidx_circular_area_divide_wr_data_callable)) (PreH10 : (writeidx_circular_area_divide_wr_data_callable <= 255)) (PreH11 : (writeidx_circular_area_divide_wr_data_callable < area_length_circular_area_divide_wr_data_callable)) (PreH12 : (p_head_circular_area_divide_wr_data_callable = data_buffer_circular_area_divide_wr_data_callable)) (PreH13 : (p_tail_circular_area_divide_wr_data_callable = (data_buffer_circular_area_divide_wr_data_callable + area_length_circular_area_divide_wr_data_callable ))) (PreH14 : ((Zlength (contents_circular_area_divide_wr_data_callable)) = area_length_circular_area_divide_wr_data_callable)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= area_length_circular_area_divide_wr_data_callable)) (PreH17 : ((writeidx_circular_area_divide_wr_data_callable + data_length_pre ) <= 4294967295)) ,
  TT && emp 
|--
  “ (CircularAreaDivideWrDataResult writeidx_circular_area_divide_wr_data_callable data_length_pre area_length_circular_area_divide_wr_data_callable 0 ) ”
  &&  emp
).

Definition CircularAreaDivideWrData_return_wit_2_split_goal_1 := 
forall (data_length_pre: Z) (circular_area_pre: Z) (contents_circular_area_divide_wr_data_callable: (@list Z)) (area_length_circular_area_divide_wr_data_callable: Z) (p_tail_circular_area_divide_wr_data_callable: Z) (p_head_circular_area_divide_wr_data_callable: Z) (writeidx_circular_area_divide_wr_data_callable: Z) (readidx_circular_area_divide_wr_data_callable: Z) (data_buffer_circular_area_divide_wr_data_callable: Z) (PreH1 : ((writeidx_circular_area_divide_wr_data_callable + data_length_pre ) <= area_length_circular_area_divide_wr_data_callable)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (0 < area_length_circular_area_divide_wr_data_callable)) (PreH5 : (area_length_circular_area_divide_wr_data_callable <= 256)) (PreH6 : (0 <= readidx_circular_area_divide_wr_data_callable)) (PreH7 : (readidx_circular_area_divide_wr_data_callable <= 255)) (PreH8 : (readidx_circular_area_divide_wr_data_callable < area_length_circular_area_divide_wr_data_callable)) (PreH9 : (0 <= writeidx_circular_area_divide_wr_data_callable)) (PreH10 : (writeidx_circular_area_divide_wr_data_callable <= 255)) (PreH11 : (writeidx_circular_area_divide_wr_data_callable < area_length_circular_area_divide_wr_data_callable)) (PreH12 : (p_head_circular_area_divide_wr_data_callable = data_buffer_circular_area_divide_wr_data_callable)) (PreH13 : (p_tail_circular_area_divide_wr_data_callable = (data_buffer_circular_area_divide_wr_data_callable + area_length_circular_area_divide_wr_data_callable ))) (PreH14 : ((Zlength (contents_circular_area_divide_wr_data_callable)) = area_length_circular_area_divide_wr_data_callable)) (PreH15 : (0 <= data_length_pre)) (PreH16 : (data_length_pre <= area_length_circular_area_divide_wr_data_callable)) (PreH17 : ((writeidx_circular_area_divide_wr_data_callable + data_length_pre ) <= 4294967295)) ,
  (CircularAreaDivideWrDataResult writeidx_circular_area_divide_wr_data_callable data_length_pre area_length_circular_area_divide_wr_data_callable 0 )
.

(*----- Function CircularAreaWrite -----*)

Definition CircularAreaWrite_safety_wit_1 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre = circular_area_entry)) (PreH2 : (input_buffer_pre = input_buffer_entry)) (PreH3 : (data_length_pre = requested)) (PreH4 : (b_force_pre = force0)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (input_buffer_pre <> 0)) (PreH7 : (0 < area_length)) (PreH8 : (area_length <= 256)) (PreH9 : (0 <= readidx)) (PreH10 : (readidx <= 255)) (PreH11 : (readidx < area_length)) (PreH12 : (0 <= writeidx)) (PreH13 : (writeidx <= 255)) (PreH14 : (writeidx < area_length)) (PreH15 : (p_head = data_buffer)) (PreH16 : (p_tail = (data_buffer + area_length ))) (PreH17 : ((Zlength (contents)) = area_length)) (PreH18 : ((Zlength (input_contents)) = requested)) ,
  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
  **  (UCharArray.full input_buffer_pre requested input_contents )
  **  (GlobalStrings LitMap )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_2 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre = circular_area_entry)) (PreH2 : (input_buffer_pre = input_buffer_entry)) (PreH3 : (data_length_pre = requested)) (PreH4 : (b_force_pre = force0)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (input_buffer_pre = 0)) (PreH7 : (0 < area_length)) (PreH8 : (area_length <= 256)) (PreH9 : (0 <= readidx)) (PreH10 : (readidx <= 255)) (PreH11 : (readidx < area_length)) (PreH12 : (0 <= writeidx)) (PreH13 : (writeidx <= 255)) (PreH14 : (writeidx < area_length)) (PreH15 : (p_head = data_buffer)) (PreH16 : (p_tail = (data_buffer + area_length ))) (PreH17 : ((Zlength (contents)) = area_length)) ,
  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_3 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (PreH1 : (circular_area_pre = circular_area_entry)) (PreH2 : (input_buffer_pre = input_buffer_entry)) (PreH3 : (data_length_pre = requested)) (PreH4 : (b_force_pre = force0)) (PreH5 : (circular_area_pre = 0)) ,
  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_4 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = circular_area_entry)) (PreH3 : (input_buffer_pre = input_buffer_entry)) (PreH4 : (data_length_pre = requested)) (PreH5 : (b_force_pre = force0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (input_buffer_pre <> 0)) (PreH8 : (0 < area_length)) (PreH9 : (area_length <= 256)) (PreH10 : (0 <= readidx)) (PreH11 : (readidx <= 255)) (PreH12 : (readidx < area_length)) (PreH13 : (0 <= writeidx)) (PreH14 : (writeidx <= 255)) (PreH15 : (writeidx < area_length)) (PreH16 : (p_head = data_buffer)) (PreH17 : (p_tail = (data_buffer + area_length ))) (PreH18 : ((Zlength (contents)) = area_length)) (PreH19 : ((Zlength (input_contents)) = requested)) ,
  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
  **  (UCharArray.full input_buffer_pre requested input_contents )
  **  (GlobalStrings LitMap )
|--
  “ False ”
.

Definition CircularAreaWrite_safety_wit_5 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = circular_area_entry)) (PreH3 : (input_buffer_pre = input_buffer_entry)) (PreH4 : (data_length_pre = requested)) (PreH5 : (b_force_pre = force0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (input_buffer_pre = 0)) (PreH8 : (0 < area_length)) (PreH9 : (area_length <= 256)) (PreH10 : (0 <= readidx)) (PreH11 : (readidx <= 255)) (PreH12 : (readidx < area_length)) (PreH13 : (0 <= writeidx)) (PreH14 : (writeidx <= 255)) (PreH15 : (writeidx < area_length)) (PreH16 : (p_head = data_buffer)) (PreH17 : (p_tail = (data_buffer + area_length ))) (PreH18 : ((Zlength (contents)) = area_length)) ,
  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
|--
  “ False ”
.

Definition CircularAreaWrite_safety_wit_6 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = circular_area_entry)) (PreH3 : (input_buffer_pre = input_buffer_entry)) (PreH4 : (data_length_pre = requested)) (PreH5 : (b_force_pre = force0)) (PreH6 : (circular_area_pre = 0)) ,
  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  “ False ”
.

Definition CircularAreaWrite_safety_wit_7 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = circular_area_entry)) (PreH3 : (input_buffer_pre = input_buffer_entry)) (PreH4 : (data_length_pre = requested)) (PreH5 : (b_force_pre = force0)) (PreH6 : (circular_area_pre = 0)) ,
  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaWrite_safety_wit_8 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = circular_area_entry)) (PreH3 : (input_buffer_pre = input_buffer_entry)) (PreH4 : (data_length_pre = requested)) (PreH5 : (b_force_pre = force0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (input_buffer_pre <> 0)) (PreH8 : (0 < area_length)) (PreH9 : (area_length <= 256)) (PreH10 : (0 <= readidx)) (PreH11 : (readidx <= 255)) (PreH12 : (readidx < area_length)) (PreH13 : (0 <= writeidx)) (PreH14 : (writeidx <= 255)) (PreH15 : (writeidx < area_length)) (PreH16 : (p_head = data_buffer)) (PreH17 : (p_tail = (data_buffer + area_length ))) (PreH18 : ((Zlength (contents)) = area_length)) (PreH19 : ((Zlength (input_contents)) = requested)) ,
  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
  **  (UCharArray.full input_buffer_pre requested input_contents )
  **  (GlobalStrings LitMap )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_9 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = circular_area_entry)) (PreH3 : (input_buffer_pre = input_buffer_entry)) (PreH4 : (data_length_pre = requested)) (PreH5 : (b_force_pre = force0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (input_buffer_pre = 0)) (PreH8 : (0 < area_length)) (PreH9 : (area_length <= 256)) (PreH10 : (0 <= readidx)) (PreH11 : (readidx <= 255)) (PreH12 : (readidx < area_length)) (PreH13 : (0 <= writeidx)) (PreH14 : (writeidx <= 255)) (PreH15 : (writeidx < area_length)) (PreH16 : (p_head = data_buffer)) (PreH17 : (p_tail = (data_buffer + area_length ))) (PreH18 : ((Zlength (contents)) = area_length)) ,
  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_10 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = circular_area_entry)) (PreH3 : (input_buffer_pre = input_buffer_entry)) (PreH4 : (data_length_pre = requested)) (PreH5 : (b_force_pre = force0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (input_buffer_pre <> 0)) (PreH8 : (0 < area_length)) (PreH9 : (area_length <= 256)) (PreH10 : (0 <= readidx)) (PreH11 : (readidx <= 255)) (PreH12 : (readidx < area_length)) (PreH13 : (0 <= writeidx)) (PreH14 : (writeidx <= 255)) (PreH15 : (writeidx < area_length)) (PreH16 : (p_head = data_buffer)) (PreH17 : (p_tail = (data_buffer + area_length ))) (PreH18 : ((Zlength (contents)) = area_length)) (PreH19 : ((Zlength (input_contents)) = requested)) ,
  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
  **  (UCharArray.full input_buffer_pre requested input_contents )
  **  (GlobalStrings LitMap )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_11 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = circular_area_entry)) (PreH3 : (input_buffer_pre = input_buffer_entry)) (PreH4 : (data_length_pre = requested)) (PreH5 : (b_force_pre = force0)) (PreH6 : (circular_area_pre <> 0)) (PreH7 : (input_buffer_pre = 0)) (PreH8 : (0 < area_length)) (PreH9 : (area_length <= 256)) (PreH10 : (0 <= readidx)) (PreH11 : (readidx <= 255)) (PreH12 : (readidx < area_length)) (PreH13 : (0 <= writeidx)) (PreH14 : (writeidx <= 255)) (PreH15 : (writeidx < area_length)) (PreH16 : (p_head = data_buffer)) (PreH17 : (p_tail = (data_buffer + area_length ))) (PreH18 : ((Zlength (contents)) = area_length)) ,
  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_12 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (input_buffer_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = circular_area_entry)) (PreH4 : (input_buffer_pre = input_buffer_entry)) (PreH5 : (data_length_pre = requested)) (PreH6 : (b_force_pre = force0)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (input_buffer_pre <> 0)) (PreH9 : (0 < area_length)) (PreH10 : (area_length <= 256)) (PreH11 : (0 <= readidx)) (PreH12 : (readidx <= 255)) (PreH13 : (readidx < area_length)) (PreH14 : (0 <= writeidx)) (PreH15 : (writeidx <= 255)) (PreH16 : (writeidx < area_length)) (PreH17 : (p_head = data_buffer)) (PreH18 : (p_tail = (data_buffer + area_length ))) (PreH19 : ((Zlength (contents)) = area_length)) (PreH20 : ((Zlength (input_contents)) = requested)) ,
  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
  **  (UCharArray.full input_buffer_pre requested input_contents )
  **  (GlobalStrings LitMap )
|--
  “ False ”
.

Definition CircularAreaWrite_safety_wit_13 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (input_buffer_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = circular_area_entry)) (PreH4 : (input_buffer_pre = input_buffer_entry)) (PreH5 : (data_length_pre = requested)) (PreH6 : (b_force_pre = force0)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (input_buffer_pre = 0)) (PreH9 : (0 < area_length)) (PreH10 : (area_length <= 256)) (PreH11 : (0 <= readidx)) (PreH12 : (readidx <= 255)) (PreH13 : (readidx < area_length)) (PreH14 : (0 <= writeidx)) (PreH15 : (writeidx <= 255)) (PreH16 : (writeidx < area_length)) (PreH17 : (p_head = data_buffer)) (PreH18 : (p_tail = (data_buffer + area_length ))) (PreH19 : ((Zlength (contents)) = area_length)) ,
  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
|--
  “ False ”
.

Definition CircularAreaWrite_safety_wit_14 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (input_buffer_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = circular_area_entry)) (PreH4 : (input_buffer_pre = input_buffer_entry)) (PreH5 : (data_length_pre = requested)) (PreH6 : (b_force_pre = force0)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (input_buffer_pre = 0)) (PreH9 : (0 < area_length)) (PreH10 : (area_length <= 256)) (PreH11 : (0 <= readidx)) (PreH12 : (readidx <= 255)) (PreH13 : (readidx < area_length)) (PreH14 : (0 <= writeidx)) (PreH15 : (writeidx <= 255)) (PreH16 : (writeidx < area_length)) (PreH17 : (p_head = data_buffer)) (PreH18 : (p_tail = (data_buffer + area_length ))) (PreH19 : ((Zlength (contents)) = area_length)) ,
  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaWrite_safety_wit_15 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (input_buffer_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = circular_area_entry)) (PreH4 : (input_buffer_pre = input_buffer_entry)) (PreH5 : (data_length_pre = requested)) (PreH6 : (b_force_pre = force0)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (input_buffer_pre <> 0)) (PreH9 : (0 < area_length)) (PreH10 : (area_length <= 256)) (PreH11 : (0 <= readidx)) (PreH12 : (readidx <= 255)) (PreH13 : (readidx < area_length)) (PreH14 : (0 <= writeidx)) (PreH15 : (writeidx <= 255)) (PreH16 : (writeidx < area_length)) (PreH17 : (p_head = data_buffer)) (PreH18 : (p_tail = (data_buffer + area_length ))) (PreH19 : ((Zlength (contents)) = area_length)) (PreH20 : ((Zlength (input_contents)) = requested)) ,
  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
  **  (UCharArray.full input_buffer_pre requested input_contents )
  **  (GlobalStrings LitMap )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_16 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (input_buffer_pre <> 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = circular_area_entry)) (PreH4 : (input_buffer_pre = input_buffer_entry)) (PreH5 : (data_length_pre = requested)) (PreH6 : (b_force_pre = force0)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (input_buffer_pre <> 0)) (PreH9 : (0 < area_length)) (PreH10 : (area_length <= 256)) (PreH11 : (0 <= readidx)) (PreH12 : (readidx <= 255)) (PreH13 : (readidx < area_length)) (PreH14 : (0 <= writeidx)) (PreH15 : (writeidx <= 255)) (PreH16 : (writeidx < area_length)) (PreH17 : (p_head = data_buffer)) (PreH18 : (p_tail = (data_buffer + area_length ))) (PreH19 : ((Zlength (contents)) = area_length)) (PreH20 : ((Zlength (input_contents)) = requested)) ,
  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
  **  (UCharArray.full input_buffer_pre requested input_contents )
  **  (GlobalStrings LitMap )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_17 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (data_length_pre <= 0)) (PreH2 : (input_buffer_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre = circular_area_entry)) (PreH5 : (input_buffer_pre = input_buffer_entry)) (PreH6 : (data_length_pre = requested)) (PreH7 : (b_force_pre = force0)) (PreH8 : (circular_area_pre <> 0)) (PreH9 : (input_buffer_pre <> 0)) (PreH10 : (0 < area_length)) (PreH11 : (area_length <= 256)) (PreH12 : (0 <= readidx)) (PreH13 : (readidx <= 255)) (PreH14 : (readidx < area_length)) (PreH15 : (0 <= writeidx)) (PreH16 : (writeidx <= 255)) (PreH17 : (writeidx < area_length)) (PreH18 : (p_head = data_buffer)) (PreH19 : (p_tail = (data_buffer + area_length ))) (PreH20 : ((Zlength (contents)) = area_length)) (PreH21 : ((Zlength (input_contents)) = requested)) ,
  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
  **  (UCharArray.full input_buffer_pre requested input_contents )
  **  (GlobalStrings LitMap )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaWrite_safety_wit_18 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (data_length_pre > 0)) (PreH2 : (input_buffer_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre = circular_area_entry)) (PreH5 : (input_buffer_pre = input_buffer_entry)) (PreH6 : (data_length_pre = requested)) (PreH7 : (b_force_pre = force0)) (PreH8 : (circular_area_pre <> 0)) (PreH9 : (input_buffer_pre <> 0)) (PreH10 : (0 < area_length)) (PreH11 : (area_length <= 256)) (PreH12 : (0 <= readidx)) (PreH13 : (readidx <= 255)) (PreH14 : (readidx < area_length)) (PreH15 : (0 <= writeidx)) (PreH16 : (writeidx <= 255)) (PreH17 : (writeidx < area_length)) (PreH18 : (p_head = data_buffer)) (PreH19 : (p_tail = (data_buffer + area_length ))) (PreH20 : ((Zlength (contents)) = area_length)) (PreH21 : ((Zlength (input_contents)) = requested)) ,
  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
  **  (UCharArray.full input_buffer_pre requested input_contents )
  **  (GlobalStrings LitMap )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_19 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (PreH1 : (b_force_pre = 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH4 : (0 <= retval)) (PreH5 : (retval <= 1)) (PreH6 : (data_length_pre > 0)) (PreH7 : (input_buffer_pre <> 0)) (PreH8 : (circular_area_pre <> 0)) (PreH9 : (circular_area_pre = circular_area_entry)) (PreH10 : (input_buffer_pre = input_buffer_entry)) (PreH11 : (data_length_pre = requested)) (PreH12 : (b_force_pre = force0)) (PreH13 : (circular_area_pre <> 0)) (PreH14 : (input_buffer_pre <> 0)) (PreH15 : (0 < area_length)) (PreH16 : (area_length <= 256)) (PreH17 : (0 <= readidx)) (PreH18 : (readidx <= 255)) (PreH19 : (readidx < area_length)) (PreH20 : (0 <= writeidx)) (PreH21 : (writeidx <= 255)) (PreH22 : (writeidx < area_length)) (PreH23 : (p_head = data_buffer)) (PreH24 : (p_tail = (data_buffer + area_length ))) (PreH25 : ((Zlength (contents)) = area_length)) (PreH26 : ((Zlength (input_contents)) = requested)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaWrite_safety_wit_20 := 
forall (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (write_data_length_addr_v: Z) (retval: Z) (PreH1 : (retval = (data_buffer + (writeidx * sizeof(UCHAR))))) (PreH2 : (circular_area_entry <> 0)) (PreH3 : (input_buffer_entry <> 0)) (PreH4 : (requested > 0)) (PreH5 : (0 < area_length)) (PreH6 : ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0)))) (PreH7 : (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length )) (PreH8 : ((Zlength (input_contents)) = requested)) (PreH9 : (0 <= data_length)) (PreH10 : (data_length <= requested)) (PreH11 : (0 <= writeidx)) (PreH12 : ((writeidx + data_length ) <= area_length)) (PreH13 : (CircularAreaDivideWrDataResult writeidx data_length area_length 0 )) (PreH14 : (p_head = data_buffer)) (PreH15 : (p_tail = (data_buffer + area_length ))) (PreH16 : (CircularAreaDescriptorState readidx writeidx area_length b_status contents )) ,
  (UCharArray.seg data_buffer writeidx (writeidx + data_length ) (sublist (0) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_entry)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_entry)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer (writeidx + data_length ) area_length (sublist ((writeidx + data_length )) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ (area_length <> 0) ”
.

Definition CircularAreaWrite_safety_wit_21 := 
forall (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (write_len_down: Z) (write_len_up: Z) (write_data_length_addr_v: Z) (retval: Z) (PreH1 : (retval = p_head)) (PreH2 : (circular_area_entry <> 0)) (PreH3 : (input_buffer_entry <> 0)) (PreH4 : (requested > 0)) (PreH5 : (0 < area_length)) (PreH6 : ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0)))) (PreH7 : (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length )) (PreH8 : ((Zlength (input_contents)) = requested)) (PreH9 : (0 <= write_len_down)) (PreH10 : (write_len_down <= writeidx)) (PreH11 : (write_len_up = (area_length - writeidx ))) (PreH12 : (write_len_down = (data_length - write_len_up ))) (PreH13 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH14 : (p_head = data_buffer)) (PreH15 : (p_tail = (data_buffer + area_length ))) (PreH16 : (CircularAreaDescriptorState readidx writeidx area_length b_status contents )) ,
  (UCharArray.seg data_buffer 0 write_len_down (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_entry)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_entry)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (UCharArray.seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx area_length (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> (unsigned_last_nbits (write_len_down) (8)))
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaWrite_safety_wit_22 := 
forall (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (write_data_length_addr_v: Z) (retval: Z) (PreH1 : (retval = (data_buffer + (writeidx * sizeof(UCHAR))))) (PreH2 : (circular_area_entry <> 0)) (PreH3 : (input_buffer_entry <> 0)) (PreH4 : (requested > 0)) (PreH5 : (0 < area_length)) (PreH6 : ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0)))) (PreH7 : (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length )) (PreH8 : ((Zlength (input_contents)) = requested)) (PreH9 : (0 <= data_length)) (PreH10 : (data_length <= requested)) (PreH11 : (0 <= writeidx)) (PreH12 : ((writeidx + data_length ) <= area_length)) (PreH13 : (CircularAreaDivideWrDataResult writeidx data_length area_length 0 )) (PreH14 : (p_head = data_buffer)) (PreH15 : (p_tail = (data_buffer + area_length ))) (PreH16 : (CircularAreaDescriptorState readidx writeidx area_length b_status contents )) ,
  (UCharArray.seg data_buffer writeidx (writeidx + data_length ) (sublist (0) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_entry)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_entry)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer (writeidx + data_length ) area_length (sublist ((writeidx + data_length )) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> (unsigned_last_nbits (((writeidx + data_length ) % ( area_length ) )) (8)))
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaWrite_safety_wit_23 := 
forall (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (write_len_down: Z) (write_len_up: Z) (write_data_length_addr_v: Z) (retval: Z) (PreH1 : (retval = p_head)) (PreH2 : (circular_area_entry <> 0)) (PreH3 : (input_buffer_entry <> 0)) (PreH4 : (requested > 0)) (PreH5 : (0 < area_length)) (PreH6 : ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0)))) (PreH7 : (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length )) (PreH8 : ((Zlength (input_contents)) = requested)) (PreH9 : (0 <= write_len_down)) (PreH10 : (write_len_down <= writeidx)) (PreH11 : (write_len_up = (area_length - writeidx ))) (PreH12 : (write_len_down = (data_length - write_len_up ))) (PreH13 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH14 : (p_head = data_buffer)) (PreH15 : (p_tail = (data_buffer + area_length ))) (PreH16 : (CircularAreaDescriptorState readidx writeidx area_length b_status contents )) (PreH17 : (force0 <> 0)) ,
  (UCharArray.seg data_buffer 0 write_len_down (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_entry)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_entry)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (UCharArray.seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx area_length (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> (unsigned_last_nbits (write_len_down) (8)))
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> (unsigned_last_nbits (write_len_down) (8)))
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 1)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_24 := 
forall (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (write_data_length_addr_v: Z) (retval: Z) (PreH1 : (retval = (data_buffer + (writeidx * sizeof(UCHAR))))) (PreH2 : (circular_area_entry <> 0)) (PreH3 : (input_buffer_entry <> 0)) (PreH4 : (requested > 0)) (PreH5 : (0 < area_length)) (PreH6 : ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0)))) (PreH7 : (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length )) (PreH8 : ((Zlength (input_contents)) = requested)) (PreH9 : (0 <= data_length)) (PreH10 : (data_length <= requested)) (PreH11 : (0 <= writeidx)) (PreH12 : ((writeidx + data_length ) <= area_length)) (PreH13 : (CircularAreaDivideWrDataResult writeidx data_length area_length 0 )) (PreH14 : (p_head = data_buffer)) (PreH15 : (p_tail = (data_buffer + area_length ))) (PreH16 : (CircularAreaDescriptorState readidx writeidx area_length b_status contents )) (PreH17 : (force0 <> 0)) ,
  (UCharArray.seg data_buffer writeidx (writeidx + data_length ) (sublist (0) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_entry)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_entry)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer (writeidx + data_length ) area_length (sublist ((writeidx + data_length )) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> (unsigned_last_nbits (((writeidx + data_length ) % ( area_length ) )) (8)))
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> (unsigned_last_nbits (((writeidx + data_length ) % ( area_length ) )) (8)))
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 1)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_25 := 
forall (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (write_len_down: Z) (write_len_up: Z) (write_data_length_addr_v: Z) (retval: Z) (PreH1 : (retval = p_head)) (PreH2 : (circular_area_entry <> 0)) (PreH3 : (input_buffer_entry <> 0)) (PreH4 : (requested > 0)) (PreH5 : (0 < area_length)) (PreH6 : ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0)))) (PreH7 : (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length )) (PreH8 : ((Zlength (input_contents)) = requested)) (PreH9 : (0 <= write_len_down)) (PreH10 : (write_len_down <= writeidx)) (PreH11 : (write_len_up = (area_length - writeidx ))) (PreH12 : (write_len_down = (data_length - write_len_up ))) (PreH13 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH14 : (p_head = data_buffer)) (PreH15 : (p_tail = (data_buffer + area_length ))) (PreH16 : (CircularAreaDescriptorState readidx writeidx area_length b_status contents )) (PreH17 : (force0 = 0)) ,
  (UCharArray.seg data_buffer 0 write_len_down (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_entry)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_entry)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (UCharArray.seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx area_length (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> (unsigned_last_nbits (write_len_down) (8)))
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 1)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_safety_wit_26 := 
forall (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (write_data_length_addr_v: Z) (retval: Z) (PreH1 : (retval = (data_buffer + (writeidx * sizeof(UCHAR))))) (PreH2 : (circular_area_entry <> 0)) (PreH3 : (input_buffer_entry <> 0)) (PreH4 : (requested > 0)) (PreH5 : (0 < area_length)) (PreH6 : ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0)))) (PreH7 : (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length )) (PreH8 : ((Zlength (input_contents)) = requested)) (PreH9 : (0 <= data_length)) (PreH10 : (data_length <= requested)) (PreH11 : (0 <= writeidx)) (PreH12 : ((writeidx + data_length ) <= area_length)) (PreH13 : (CircularAreaDivideWrDataResult writeidx data_length area_length 0 )) (PreH14 : (p_head = data_buffer)) (PreH15 : (p_tail = (data_buffer + area_length ))) (PreH16 : (CircularAreaDescriptorState readidx writeidx area_length b_status contents )) (PreH17 : (force0 = 0)) ,
  (UCharArray.seg data_buffer writeidx (writeidx + data_length ) (sublist (0) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_entry)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_entry)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer (writeidx + data_length ) area_length (sublist ((writeidx + data_length )) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> (unsigned_last_nbits (((writeidx + data_length ) % ( area_length ) )) (8)))
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 1)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaWrite_entail_wit_1_1 := 
(
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (CircularAreaDivideWrDataResult writeidx data_length_pre area_length retval_3 )) (PreH2 : (0 <= retval_3)) (PreH3 : (retval_3 <= 1)) (PreH4 : (data_length_pre <= (area_length - retval_2 ))) (PreH5 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH6 : (0 <= retval_2)) (PreH7 : (retval_2 <= area_length)) (PreH8 : (b_force_pre <> 0)) (PreH9 : (retval <> 0)) (PreH10 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH11 : (0 <= retval)) (PreH12 : (retval <= 1)) (PreH13 : (data_length_pre > 0)) (PreH14 : (input_buffer_pre <> 0)) (PreH15 : (circular_area_pre <> 0)) (PreH16 : (circular_area_pre = circular_area_entry)) (PreH17 : (input_buffer_pre = input_buffer_entry)) (PreH18 : (data_length_pre = requested)) (PreH19 : (b_force_pre = force0)) (PreH20 : (circular_area_pre <> 0)) (PreH21 : (input_buffer_pre <> 0)) (PreH22 : (0 < area_length)) (PreH23 : (area_length <= 256)) (PreH24 : (0 <= readidx)) (PreH25 : (readidx <= 255)) (PreH26 : (readidx < area_length)) (PreH27 : (0 <= writeidx)) (PreH28 : (writeidx <= 255)) (PreH29 : (writeidx < area_length)) (PreH30 : (p_head = data_buffer)) (PreH31 : (p_tail = (data_buffer + area_length ))) (PreH32 : ((Zlength (contents)) = area_length)) (PreH33 : ((Zlength (input_contents)) = requested)) (PreH34 : (retval_3 <> 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (circular_area_entry <> 0) ” 
  &&  “ (input_buffer_entry <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0))) ” 
  &&  “ (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length_pre ) ” 
  &&  “ ((Zlength (input_contents)) = requested) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= requested) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ (writeidx < area_length) ” 
  &&  “ ((area_length - writeidx ) = (area_length - writeidx )) ” 
  &&  “ ((unsigned_last_nbits ((data_length_pre - (area_length - writeidx ) )) (32)) = (data_length_pre - (area_length - writeidx ) )) ” 
  &&  “ ((area_length - writeidx ) <= data_length_pre) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx data_length_pre area_length 1 ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status contents ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_entry)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_entry)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx area_length (sublist (writeidx) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry 0 (area_length - writeidx ) (sublist (0) ((area_length - writeidx )) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry (area_length - writeidx ) requested (sublist ((area_length - writeidx )) (requested) (input_contents)) )
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
) \/
(
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx data_length_pre area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre <= (area_length - retval_2 ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH10 : (0 <= retval_2)) (PreH11 : (retval_2 <= area_length)) (PreH12 : (b_force_pre <> 0)) (PreH13 : (retval <> 0)) (PreH14 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH15 : (0 <= retval)) (PreH16 : (retval <= 1)) (PreH17 : (data_length_pre > 0)) (PreH18 : (input_buffer_pre <> 0)) (PreH19 : (circular_area_pre <> 0)) (PreH20 : (circular_area_pre = circular_area_entry)) (PreH21 : (input_buffer_pre = input_buffer_entry)) (PreH22 : (data_length_pre = requested)) (PreH23 : (b_force_pre = force0)) (PreH24 : (circular_area_pre <> 0)) (PreH25 : (input_buffer_pre <> 0)) (PreH26 : (0 < area_length)) (PreH27 : (area_length <= 256)) (PreH28 : (0 <= readidx)) (PreH29 : (readidx <= 255)) (PreH30 : (readidx < area_length)) (PreH31 : (0 <= writeidx)) (PreH32 : (writeidx <= 255)) (PreH33 : (writeidx < area_length)) (PreH34 : (p_head = data_buffer)) (PreH35 : (p_tail = (data_buffer + area_length ))) (PreH36 : ((Zlength (contents)) = area_length)) (PreH37 : ((Zlength (input_contents)) = requested)) (PreH38 : (retval_3 <> 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (CircularAreaDescriptorState readidx writeidx area_length b_status contents ) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx data_length_pre area_length 1 ) ” 
  &&  “ ((area_length - writeidx ) <= data_length_pre) ” 
  &&  “ ((unsigned_last_nbits ((data_length_pre - (area_length - writeidx ) )) (32)) = (data_length_pre - (area_length - writeidx ) )) ” 
  &&  “ (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length_pre ) ”
  &&  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx area_length (sublist (writeidx) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry 0 (area_length - writeidx ) (sublist (0) ((area_length - writeidx )) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry (area_length - writeidx ) requested (sublist ((area_length - writeidx )) (requested) (input_contents)) )
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
).

Definition CircularAreaWrite_entail_wit_1_1_split_goal_1 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx data_length_pre area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre <= (area_length - retval_2 ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH10 : (0 <= retval_2)) (PreH11 : (retval_2 <= area_length)) (PreH12 : (b_force_pre <> 0)) (PreH13 : (retval <> 0)) (PreH14 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH15 : (0 <= retval)) (PreH16 : (retval <= 1)) (PreH17 : (data_length_pre > 0)) (PreH18 : (input_buffer_pre <> 0)) (PreH19 : (circular_area_pre <> 0)) (PreH20 : (circular_area_pre = circular_area_entry)) (PreH21 : (input_buffer_pre = input_buffer_entry)) (PreH22 : (data_length_pre = requested)) (PreH23 : (b_force_pre = force0)) (PreH24 : (circular_area_pre <> 0)) (PreH25 : (input_buffer_pre <> 0)) (PreH26 : (0 < area_length)) (PreH27 : (area_length <= 256)) (PreH28 : (0 <= readidx)) (PreH29 : (readidx <= 255)) (PreH30 : (readidx < area_length)) (PreH31 : (0 <= writeidx)) (PreH32 : (writeidx <= 255)) (PreH33 : (writeidx < area_length)) (PreH34 : (p_head = data_buffer)) (PreH35 : (p_tail = (data_buffer + area_length ))) (PreH36 : ((Zlength (contents)) = area_length)) (PreH37 : ((Zlength (input_contents)) = requested)) (PreH38 : (retval_3 <> 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (CircularAreaDescriptorState readidx writeidx area_length b_status contents ) ”
.

Definition CircularAreaWrite_entail_wit_1_1_split_goal_2 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx data_length_pre area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre <= (area_length - retval_2 ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH10 : (0 <= retval_2)) (PreH11 : (retval_2 <= area_length)) (PreH12 : (b_force_pre <> 0)) (PreH13 : (retval <> 0)) (PreH14 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH15 : (0 <= retval)) (PreH16 : (retval <= 1)) (PreH17 : (data_length_pre > 0)) (PreH18 : (input_buffer_pre <> 0)) (PreH19 : (circular_area_pre <> 0)) (PreH20 : (circular_area_pre = circular_area_entry)) (PreH21 : (input_buffer_pre = input_buffer_entry)) (PreH22 : (data_length_pre = requested)) (PreH23 : (b_force_pre = force0)) (PreH24 : (circular_area_pre <> 0)) (PreH25 : (input_buffer_pre <> 0)) (PreH26 : (0 < area_length)) (PreH27 : (area_length <= 256)) (PreH28 : (0 <= readidx)) (PreH29 : (readidx <= 255)) (PreH30 : (readidx < area_length)) (PreH31 : (0 <= writeidx)) (PreH32 : (writeidx <= 255)) (PreH33 : (writeidx < area_length)) (PreH34 : (p_head = data_buffer)) (PreH35 : (p_tail = (data_buffer + area_length ))) (PreH36 : ((Zlength (contents)) = area_length)) (PreH37 : ((Zlength (input_contents)) = requested)) (PreH38 : (retval_3 <> 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (CircularAreaDivideWrDataResult writeidx data_length_pre area_length 1 ) ”
.

Definition CircularAreaWrite_entail_wit_1_1_split_goal_3 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx data_length_pre area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre <= (area_length - retval_2 ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH10 : (0 <= retval_2)) (PreH11 : (retval_2 <= area_length)) (PreH12 : (b_force_pre <> 0)) (PreH13 : (retval <> 0)) (PreH14 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH15 : (0 <= retval)) (PreH16 : (retval <= 1)) (PreH17 : (data_length_pre > 0)) (PreH18 : (input_buffer_pre <> 0)) (PreH19 : (circular_area_pre <> 0)) (PreH20 : (circular_area_pre = circular_area_entry)) (PreH21 : (input_buffer_pre = input_buffer_entry)) (PreH22 : (data_length_pre = requested)) (PreH23 : (b_force_pre = force0)) (PreH24 : (circular_area_pre <> 0)) (PreH25 : (input_buffer_pre <> 0)) (PreH26 : (0 < area_length)) (PreH27 : (area_length <= 256)) (PreH28 : (0 <= readidx)) (PreH29 : (readidx <= 255)) (PreH30 : (readidx < area_length)) (PreH31 : (0 <= writeidx)) (PreH32 : (writeidx <= 255)) (PreH33 : (writeidx < area_length)) (PreH34 : (p_head = data_buffer)) (PreH35 : (p_tail = (data_buffer + area_length ))) (PreH36 : ((Zlength (contents)) = area_length)) (PreH37 : ((Zlength (input_contents)) = requested)) (PreH38 : (retval_3 <> 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ ((area_length - writeidx ) <= data_length_pre) ”
.

Definition CircularAreaWrite_entail_wit_1_1_split_goal_4 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx data_length_pre area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre <= (area_length - retval_2 ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH10 : (0 <= retval_2)) (PreH11 : (retval_2 <= area_length)) (PreH12 : (b_force_pre <> 0)) (PreH13 : (retval <> 0)) (PreH14 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH15 : (0 <= retval)) (PreH16 : (retval <= 1)) (PreH17 : (data_length_pre > 0)) (PreH18 : (input_buffer_pre <> 0)) (PreH19 : (circular_area_pre <> 0)) (PreH20 : (circular_area_pre = circular_area_entry)) (PreH21 : (input_buffer_pre = input_buffer_entry)) (PreH22 : (data_length_pre = requested)) (PreH23 : (b_force_pre = force0)) (PreH24 : (circular_area_pre <> 0)) (PreH25 : (input_buffer_pre <> 0)) (PreH26 : (0 < area_length)) (PreH27 : (area_length <= 256)) (PreH28 : (0 <= readidx)) (PreH29 : (readidx <= 255)) (PreH30 : (readidx < area_length)) (PreH31 : (0 <= writeidx)) (PreH32 : (writeidx <= 255)) (PreH33 : (writeidx < area_length)) (PreH34 : (p_head = data_buffer)) (PreH35 : (p_tail = (data_buffer + area_length ))) (PreH36 : ((Zlength (contents)) = area_length)) (PreH37 : ((Zlength (input_contents)) = requested)) (PreH38 : (retval_3 <> 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ ((unsigned_last_nbits ((data_length_pre - (area_length - writeidx ) )) (32)) = (data_length_pre - (area_length - writeidx ) )) ”
.

Definition CircularAreaWrite_entail_wit_1_1_split_goal_5 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx data_length_pre area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre <= (area_length - retval_2 ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH10 : (0 <= retval_2)) (PreH11 : (retval_2 <= area_length)) (PreH12 : (b_force_pre <> 0)) (PreH13 : (retval <> 0)) (PreH14 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH15 : (0 <= retval)) (PreH16 : (retval <= 1)) (PreH17 : (data_length_pre > 0)) (PreH18 : (input_buffer_pre <> 0)) (PreH19 : (circular_area_pre <> 0)) (PreH20 : (circular_area_pre = circular_area_entry)) (PreH21 : (input_buffer_pre = input_buffer_entry)) (PreH22 : (data_length_pre = requested)) (PreH23 : (b_force_pre = force0)) (PreH24 : (circular_area_pre <> 0)) (PreH25 : (input_buffer_pre <> 0)) (PreH26 : (0 < area_length)) (PreH27 : (area_length <= 256)) (PreH28 : (0 <= readidx)) (PreH29 : (readidx <= 255)) (PreH30 : (readidx < area_length)) (PreH31 : (0 <= writeidx)) (PreH32 : (writeidx <= 255)) (PreH33 : (writeidx < area_length)) (PreH34 : (p_head = data_buffer)) (PreH35 : (p_tail = (data_buffer + area_length ))) (PreH36 : ((Zlength (contents)) = area_length)) (PreH37 : ((Zlength (input_contents)) = requested)) (PreH38 : (retval_3 <> 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length_pre ) ”
.

Definition CircularAreaWrite_entail_wit_1_1_split_goal_spatial := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx data_length_pre area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre <= (area_length - retval_2 ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH10 : (0 <= retval_2)) (PreH11 : (retval_2 <= area_length)) (PreH12 : (b_force_pre <> 0)) (PreH13 : (retval <> 0)) (PreH14 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH15 : (0 <= retval)) (PreH16 : (retval <= 1)) (PreH17 : (data_length_pre > 0)) (PreH18 : (input_buffer_pre <> 0)) (PreH19 : (circular_area_pre <> 0)) (PreH20 : (circular_area_pre = circular_area_entry)) (PreH21 : (input_buffer_pre = input_buffer_entry)) (PreH22 : (data_length_pre = requested)) (PreH23 : (b_force_pre = force0)) (PreH24 : (circular_area_pre <> 0)) (PreH25 : (input_buffer_pre <> 0)) (PreH26 : (0 < area_length)) (PreH27 : (area_length <= 256)) (PreH28 : (0 <= readidx)) (PreH29 : (readidx <= 255)) (PreH30 : (readidx < area_length)) (PreH31 : (0 <= writeidx)) (PreH32 : (writeidx <= 255)) (PreH33 : (writeidx < area_length)) (PreH34 : (p_head = data_buffer)) (PreH35 : (p_tail = (data_buffer + area_length ))) (PreH36 : ((Zlength (contents)) = area_length)) (PreH37 : ((Zlength (input_contents)) = requested)) (PreH38 : (retval_3 <> 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx area_length (sublist (writeidx) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry 0 (area_length - writeidx ) (sublist (0) ((area_length - writeidx )) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry (area_length - writeidx ) requested (sublist ((area_length - writeidx )) (requested) (input_contents)) )
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
.

Definition CircularAreaWrite_entail_wit_1_2 := 
(
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval: Z) (retval_3: Z) (PreH1 : (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length retval_3 )) (PreH2 : (0 <= retval_3)) (PreH3 : (retval_3 <= 1)) (PreH4 : (data_length_pre > (area_length - retval ))) (PreH5 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH6 : (0 <= retval)) (PreH7 : (retval <= area_length)) (PreH8 : (b_force_pre <> 0)) (PreH9 : (retval_2 <> 0)) (PreH10 : (CircularAreaIsFullResult readidx writeidx b_status retval_2 )) (PreH11 : (0 <= retval_2)) (PreH12 : (retval_2 <= 1)) (PreH13 : (data_length_pre > 0)) (PreH14 : (input_buffer_pre <> 0)) (PreH15 : (circular_area_pre <> 0)) (PreH16 : (circular_area_pre = circular_area_entry)) (PreH17 : (input_buffer_pre = input_buffer_entry)) (PreH18 : (data_length_pre = requested)) (PreH19 : (b_force_pre = force0)) (PreH20 : (circular_area_pre <> 0)) (PreH21 : (input_buffer_pre <> 0)) (PreH22 : (0 < area_length)) (PreH23 : (area_length <= 256)) (PreH24 : (0 <= readidx)) (PreH25 : (readidx <= 255)) (PreH26 : (readidx < area_length)) (PreH27 : (0 <= writeidx)) (PreH28 : (writeidx <= 255)) (PreH29 : (writeidx < area_length)) (PreH30 : (p_head = data_buffer)) (PreH31 : (p_tail = (data_buffer + area_length ))) (PreH32 : ((Zlength (contents)) = area_length)) (PreH33 : ((Zlength (input_contents)) = requested)) (PreH34 : (retval_3 <> 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (circular_area_entry <> 0) ” 
  &&  “ (input_buffer_entry <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0))) ” 
  &&  “ (CircularAreaActualWriteLength readidx writeidx area_length b_status requested (area_length - retval ) ) ” 
  &&  “ ((Zlength (input_contents)) = requested) ” 
  &&  “ (0 <= (area_length - retval )) ” 
  &&  “ ((area_length - retval ) <= requested) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ (writeidx < area_length) ” 
  &&  “ ((area_length - writeidx ) = (area_length - writeidx )) ” 
  &&  “ ((unsigned_last_nbits (((area_length - retval ) - (area_length - writeidx ) )) (32)) = ((area_length - retval ) - (area_length - writeidx ) )) ” 
  &&  “ ((area_length - writeidx ) <= (area_length - retval )) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length 1 ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status contents ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_entry)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_entry)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx area_length (sublist (writeidx) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry 0 (area_length - writeidx ) (sublist (0) ((area_length - writeidx )) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry (area_length - writeidx ) requested (sublist ((area_length - writeidx )) (requested) (input_contents)) )
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
) \/
(
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre > (area_length - retval ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH10 : (0 <= retval)) (PreH11 : (retval <= area_length)) (PreH12 : (b_force_pre <> 0)) (PreH13 : (retval_2 <> 0)) (PreH14 : (CircularAreaIsFullResult readidx writeidx b_status retval_2 )) (PreH15 : (0 <= retval_2)) (PreH16 : (retval_2 <= 1)) (PreH17 : (data_length_pre > 0)) (PreH18 : (input_buffer_pre <> 0)) (PreH19 : (circular_area_pre <> 0)) (PreH20 : (circular_area_pre = circular_area_entry)) (PreH21 : (input_buffer_pre = input_buffer_entry)) (PreH22 : (data_length_pre = requested)) (PreH23 : (b_force_pre = force0)) (PreH24 : (circular_area_pre <> 0)) (PreH25 : (input_buffer_pre <> 0)) (PreH26 : (0 < area_length)) (PreH27 : (area_length <= 256)) (PreH28 : (0 <= readidx)) (PreH29 : (readidx <= 255)) (PreH30 : (readidx < area_length)) (PreH31 : (0 <= writeidx)) (PreH32 : (writeidx <= 255)) (PreH33 : (writeidx < area_length)) (PreH34 : (p_head = data_buffer)) (PreH35 : (p_tail = (data_buffer + area_length ))) (PreH36 : ((Zlength (contents)) = area_length)) (PreH37 : ((Zlength (input_contents)) = requested)) (PreH38 : (retval_3 <> 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (CircularAreaDescriptorState readidx writeidx area_length b_status contents ) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length 1 ) ” 
  &&  “ ((area_length - writeidx ) <= (area_length - retval )) ” 
  &&  “ ((unsigned_last_nbits (((area_length - retval ) - (area_length - writeidx ) )) (32)) = ((area_length - retval ) - (area_length - writeidx ) )) ” 
  &&  “ (CircularAreaActualWriteLength readidx writeidx area_length b_status requested (area_length - retval ) ) ”
  &&  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx area_length (sublist (writeidx) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry 0 (area_length - writeidx ) (sublist (0) ((area_length - writeidx )) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry (area_length - writeidx ) requested (sublist ((area_length - writeidx )) (requested) (input_contents)) )
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
).

Definition CircularAreaWrite_entail_wit_1_2_split_goal_1 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre > (area_length - retval ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH10 : (0 <= retval)) (PreH11 : (retval <= area_length)) (PreH12 : (b_force_pre <> 0)) (PreH13 : (retval_2 <> 0)) (PreH14 : (CircularAreaIsFullResult readidx writeidx b_status retval_2 )) (PreH15 : (0 <= retval_2)) (PreH16 : (retval_2 <= 1)) (PreH17 : (data_length_pre > 0)) (PreH18 : (input_buffer_pre <> 0)) (PreH19 : (circular_area_pre <> 0)) (PreH20 : (circular_area_pre = circular_area_entry)) (PreH21 : (input_buffer_pre = input_buffer_entry)) (PreH22 : (data_length_pre = requested)) (PreH23 : (b_force_pre = force0)) (PreH24 : (circular_area_pre <> 0)) (PreH25 : (input_buffer_pre <> 0)) (PreH26 : (0 < area_length)) (PreH27 : (area_length <= 256)) (PreH28 : (0 <= readidx)) (PreH29 : (readidx <= 255)) (PreH30 : (readidx < area_length)) (PreH31 : (0 <= writeidx)) (PreH32 : (writeidx <= 255)) (PreH33 : (writeidx < area_length)) (PreH34 : (p_head = data_buffer)) (PreH35 : (p_tail = (data_buffer + area_length ))) (PreH36 : ((Zlength (contents)) = area_length)) (PreH37 : ((Zlength (input_contents)) = requested)) (PreH38 : (retval_3 <> 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (CircularAreaDescriptorState readidx writeidx area_length b_status contents ) ”
.

Definition CircularAreaWrite_entail_wit_1_2_split_goal_2 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre > (area_length - retval ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH10 : (0 <= retval)) (PreH11 : (retval <= area_length)) (PreH12 : (b_force_pre <> 0)) (PreH13 : (retval_2 <> 0)) (PreH14 : (CircularAreaIsFullResult readidx writeidx b_status retval_2 )) (PreH15 : (0 <= retval_2)) (PreH16 : (retval_2 <= 1)) (PreH17 : (data_length_pre > 0)) (PreH18 : (input_buffer_pre <> 0)) (PreH19 : (circular_area_pre <> 0)) (PreH20 : (circular_area_pre = circular_area_entry)) (PreH21 : (input_buffer_pre = input_buffer_entry)) (PreH22 : (data_length_pre = requested)) (PreH23 : (b_force_pre = force0)) (PreH24 : (circular_area_pre <> 0)) (PreH25 : (input_buffer_pre <> 0)) (PreH26 : (0 < area_length)) (PreH27 : (area_length <= 256)) (PreH28 : (0 <= readidx)) (PreH29 : (readidx <= 255)) (PreH30 : (readidx < area_length)) (PreH31 : (0 <= writeidx)) (PreH32 : (writeidx <= 255)) (PreH33 : (writeidx < area_length)) (PreH34 : (p_head = data_buffer)) (PreH35 : (p_tail = (data_buffer + area_length ))) (PreH36 : ((Zlength (contents)) = area_length)) (PreH37 : ((Zlength (input_contents)) = requested)) (PreH38 : (retval_3 <> 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length 1 ) ”
.

Definition CircularAreaWrite_entail_wit_1_2_split_goal_3 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre > (area_length - retval ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH10 : (0 <= retval)) (PreH11 : (retval <= area_length)) (PreH12 : (b_force_pre <> 0)) (PreH13 : (retval_2 <> 0)) (PreH14 : (CircularAreaIsFullResult readidx writeidx b_status retval_2 )) (PreH15 : (0 <= retval_2)) (PreH16 : (retval_2 <= 1)) (PreH17 : (data_length_pre > 0)) (PreH18 : (input_buffer_pre <> 0)) (PreH19 : (circular_area_pre <> 0)) (PreH20 : (circular_area_pre = circular_area_entry)) (PreH21 : (input_buffer_pre = input_buffer_entry)) (PreH22 : (data_length_pre = requested)) (PreH23 : (b_force_pre = force0)) (PreH24 : (circular_area_pre <> 0)) (PreH25 : (input_buffer_pre <> 0)) (PreH26 : (0 < area_length)) (PreH27 : (area_length <= 256)) (PreH28 : (0 <= readidx)) (PreH29 : (readidx <= 255)) (PreH30 : (readidx < area_length)) (PreH31 : (0 <= writeidx)) (PreH32 : (writeidx <= 255)) (PreH33 : (writeidx < area_length)) (PreH34 : (p_head = data_buffer)) (PreH35 : (p_tail = (data_buffer + area_length ))) (PreH36 : ((Zlength (contents)) = area_length)) (PreH37 : ((Zlength (input_contents)) = requested)) (PreH38 : (retval_3 <> 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ ((area_length - writeidx ) <= (area_length - retval )) ”
.

Definition CircularAreaWrite_entail_wit_1_2_split_goal_4 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre > (area_length - retval ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH10 : (0 <= retval)) (PreH11 : (retval <= area_length)) (PreH12 : (b_force_pre <> 0)) (PreH13 : (retval_2 <> 0)) (PreH14 : (CircularAreaIsFullResult readidx writeidx b_status retval_2 )) (PreH15 : (0 <= retval_2)) (PreH16 : (retval_2 <= 1)) (PreH17 : (data_length_pre > 0)) (PreH18 : (input_buffer_pre <> 0)) (PreH19 : (circular_area_pre <> 0)) (PreH20 : (circular_area_pre = circular_area_entry)) (PreH21 : (input_buffer_pre = input_buffer_entry)) (PreH22 : (data_length_pre = requested)) (PreH23 : (b_force_pre = force0)) (PreH24 : (circular_area_pre <> 0)) (PreH25 : (input_buffer_pre <> 0)) (PreH26 : (0 < area_length)) (PreH27 : (area_length <= 256)) (PreH28 : (0 <= readidx)) (PreH29 : (readidx <= 255)) (PreH30 : (readidx < area_length)) (PreH31 : (0 <= writeidx)) (PreH32 : (writeidx <= 255)) (PreH33 : (writeidx < area_length)) (PreH34 : (p_head = data_buffer)) (PreH35 : (p_tail = (data_buffer + area_length ))) (PreH36 : ((Zlength (contents)) = area_length)) (PreH37 : ((Zlength (input_contents)) = requested)) (PreH38 : (retval_3 <> 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ ((unsigned_last_nbits (((area_length - retval ) - (area_length - writeidx ) )) (32)) = ((area_length - retval ) - (area_length - writeidx ) )) ”
.

Definition CircularAreaWrite_entail_wit_1_2_split_goal_5 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre > (area_length - retval ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH10 : (0 <= retval)) (PreH11 : (retval <= area_length)) (PreH12 : (b_force_pre <> 0)) (PreH13 : (retval_2 <> 0)) (PreH14 : (CircularAreaIsFullResult readidx writeidx b_status retval_2 )) (PreH15 : (0 <= retval_2)) (PreH16 : (retval_2 <= 1)) (PreH17 : (data_length_pre > 0)) (PreH18 : (input_buffer_pre <> 0)) (PreH19 : (circular_area_pre <> 0)) (PreH20 : (circular_area_pre = circular_area_entry)) (PreH21 : (input_buffer_pre = input_buffer_entry)) (PreH22 : (data_length_pre = requested)) (PreH23 : (b_force_pre = force0)) (PreH24 : (circular_area_pre <> 0)) (PreH25 : (input_buffer_pre <> 0)) (PreH26 : (0 < area_length)) (PreH27 : (area_length <= 256)) (PreH28 : (0 <= readidx)) (PreH29 : (readidx <= 255)) (PreH30 : (readidx < area_length)) (PreH31 : (0 <= writeidx)) (PreH32 : (writeidx <= 255)) (PreH33 : (writeidx < area_length)) (PreH34 : (p_head = data_buffer)) (PreH35 : (p_tail = (data_buffer + area_length ))) (PreH36 : ((Zlength (contents)) = area_length)) (PreH37 : ((Zlength (input_contents)) = requested)) (PreH38 : (retval_3 <> 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (CircularAreaActualWriteLength readidx writeidx area_length b_status requested (area_length - retval ) ) ”
.

Definition CircularAreaWrite_entail_wit_1_2_split_goal_spatial := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre > (area_length - retval ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH10 : (0 <= retval)) (PreH11 : (retval <= area_length)) (PreH12 : (b_force_pre <> 0)) (PreH13 : (retval_2 <> 0)) (PreH14 : (CircularAreaIsFullResult readidx writeidx b_status retval_2 )) (PreH15 : (0 <= retval_2)) (PreH16 : (retval_2 <= 1)) (PreH17 : (data_length_pre > 0)) (PreH18 : (input_buffer_pre <> 0)) (PreH19 : (circular_area_pre <> 0)) (PreH20 : (circular_area_pre = circular_area_entry)) (PreH21 : (input_buffer_pre = input_buffer_entry)) (PreH22 : (data_length_pre = requested)) (PreH23 : (b_force_pre = force0)) (PreH24 : (circular_area_pre <> 0)) (PreH25 : (input_buffer_pre <> 0)) (PreH26 : (0 < area_length)) (PreH27 : (area_length <= 256)) (PreH28 : (0 <= readidx)) (PreH29 : (readidx <= 255)) (PreH30 : (readidx < area_length)) (PreH31 : (0 <= writeidx)) (PreH32 : (writeidx <= 255)) (PreH33 : (writeidx < area_length)) (PreH34 : (p_head = data_buffer)) (PreH35 : (p_tail = (data_buffer + area_length ))) (PreH36 : ((Zlength (contents)) = area_length)) (PreH37 : ((Zlength (input_contents)) = requested)) (PreH38 : (retval_3 <> 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx area_length (sublist (writeidx) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry 0 (area_length - writeidx ) (sublist (0) ((area_length - writeidx )) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry (area_length - writeidx ) requested (sublist ((area_length - writeidx )) (requested) (input_contents)) )
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
.

Definition CircularAreaWrite_entail_wit_1_3 := 
(
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (CircularAreaDivideWrDataResult writeidx data_length_pre area_length retval_3 )) (PreH2 : (0 <= retval_3)) (PreH3 : (retval_3 <= 1)) (PreH4 : (data_length_pre <= (area_length - retval_2 ))) (PreH5 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH6 : (0 <= retval_2)) (PreH7 : (retval_2 <= area_length)) (PreH8 : (retval = 0)) (PreH9 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH10 : (0 <= retval)) (PreH11 : (retval <= 1)) (PreH12 : (data_length_pre > 0)) (PreH13 : (input_buffer_pre <> 0)) (PreH14 : (circular_area_pre <> 0)) (PreH15 : (circular_area_pre = circular_area_entry)) (PreH16 : (input_buffer_pre = input_buffer_entry)) (PreH17 : (data_length_pre = requested)) (PreH18 : (b_force_pre = force0)) (PreH19 : (circular_area_pre <> 0)) (PreH20 : (input_buffer_pre <> 0)) (PreH21 : (0 < area_length)) (PreH22 : (area_length <= 256)) (PreH23 : (0 <= readidx)) (PreH24 : (readidx <= 255)) (PreH25 : (readidx < area_length)) (PreH26 : (0 <= writeidx)) (PreH27 : (writeidx <= 255)) (PreH28 : (writeidx < area_length)) (PreH29 : (p_head = data_buffer)) (PreH30 : (p_tail = (data_buffer + area_length ))) (PreH31 : ((Zlength (contents)) = area_length)) (PreH32 : ((Zlength (input_contents)) = requested)) (PreH33 : (retval_3 <> 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (circular_area_entry <> 0) ” 
  &&  “ (input_buffer_entry <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0))) ” 
  &&  “ (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length_pre ) ” 
  &&  “ ((Zlength (input_contents)) = requested) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= requested) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ (writeidx < area_length) ” 
  &&  “ ((area_length - writeidx ) = (area_length - writeidx )) ” 
  &&  “ ((unsigned_last_nbits ((data_length_pre - (area_length - writeidx ) )) (32)) = (data_length_pre - (area_length - writeidx ) )) ” 
  &&  “ ((area_length - writeidx ) <= data_length_pre) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx data_length_pre area_length 1 ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status contents ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_entry)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_entry)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx area_length (sublist (writeidx) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry 0 (area_length - writeidx ) (sublist (0) ((area_length - writeidx )) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry (area_length - writeidx ) requested (sublist ((area_length - writeidx )) (requested) (input_contents)) )
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
) \/
(
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx data_length_pre area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre <= (area_length - retval_2 ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH10 : (0 <= retval_2)) (PreH11 : (retval_2 <= area_length)) (PreH12 : (retval = 0)) (PreH13 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH14 : (0 <= retval)) (PreH15 : (retval <= 1)) (PreH16 : (data_length_pre > 0)) (PreH17 : (input_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = circular_area_entry)) (PreH20 : (input_buffer_pre = input_buffer_entry)) (PreH21 : (data_length_pre = requested)) (PreH22 : (b_force_pre = force0)) (PreH23 : (circular_area_pre <> 0)) (PreH24 : (input_buffer_pre <> 0)) (PreH25 : (0 < area_length)) (PreH26 : (area_length <= 256)) (PreH27 : (0 <= readidx)) (PreH28 : (readidx <= 255)) (PreH29 : (readidx < area_length)) (PreH30 : (0 <= writeidx)) (PreH31 : (writeidx <= 255)) (PreH32 : (writeidx < area_length)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : ((Zlength (contents)) = area_length)) (PreH36 : ((Zlength (input_contents)) = requested)) (PreH37 : (retval_3 <> 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (CircularAreaDescriptorState readidx writeidx area_length b_status contents ) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx data_length_pre area_length 1 ) ” 
  &&  “ ((area_length - writeidx ) <= data_length_pre) ” 
  &&  “ ((unsigned_last_nbits ((data_length_pre - (area_length - writeidx ) )) (32)) = (data_length_pre - (area_length - writeidx ) )) ” 
  &&  “ (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length_pre ) ” 
  &&  “ ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0))) ”
  &&  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx area_length (sublist (writeidx) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry 0 (area_length - writeidx ) (sublist (0) ((area_length - writeidx )) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry (area_length - writeidx ) requested (sublist ((area_length - writeidx )) (requested) (input_contents)) )
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
).

Definition CircularAreaWrite_entail_wit_1_3_split_goal_1 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx data_length_pre area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre <= (area_length - retval_2 ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH10 : (0 <= retval_2)) (PreH11 : (retval_2 <= area_length)) (PreH12 : (retval = 0)) (PreH13 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH14 : (0 <= retval)) (PreH15 : (retval <= 1)) (PreH16 : (data_length_pre > 0)) (PreH17 : (input_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = circular_area_entry)) (PreH20 : (input_buffer_pre = input_buffer_entry)) (PreH21 : (data_length_pre = requested)) (PreH22 : (b_force_pre = force0)) (PreH23 : (circular_area_pre <> 0)) (PreH24 : (input_buffer_pre <> 0)) (PreH25 : (0 < area_length)) (PreH26 : (area_length <= 256)) (PreH27 : (0 <= readidx)) (PreH28 : (readidx <= 255)) (PreH29 : (readidx < area_length)) (PreH30 : (0 <= writeidx)) (PreH31 : (writeidx <= 255)) (PreH32 : (writeidx < area_length)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : ((Zlength (contents)) = area_length)) (PreH36 : ((Zlength (input_contents)) = requested)) (PreH37 : (retval_3 <> 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (CircularAreaDescriptorState readidx writeidx area_length b_status contents ) ”
.

Definition CircularAreaWrite_entail_wit_1_3_split_goal_2 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx data_length_pre area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre <= (area_length - retval_2 ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH10 : (0 <= retval_2)) (PreH11 : (retval_2 <= area_length)) (PreH12 : (retval = 0)) (PreH13 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH14 : (0 <= retval)) (PreH15 : (retval <= 1)) (PreH16 : (data_length_pre > 0)) (PreH17 : (input_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = circular_area_entry)) (PreH20 : (input_buffer_pre = input_buffer_entry)) (PreH21 : (data_length_pre = requested)) (PreH22 : (b_force_pre = force0)) (PreH23 : (circular_area_pre <> 0)) (PreH24 : (input_buffer_pre <> 0)) (PreH25 : (0 < area_length)) (PreH26 : (area_length <= 256)) (PreH27 : (0 <= readidx)) (PreH28 : (readidx <= 255)) (PreH29 : (readidx < area_length)) (PreH30 : (0 <= writeidx)) (PreH31 : (writeidx <= 255)) (PreH32 : (writeidx < area_length)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : ((Zlength (contents)) = area_length)) (PreH36 : ((Zlength (input_contents)) = requested)) (PreH37 : (retval_3 <> 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (CircularAreaDivideWrDataResult writeidx data_length_pre area_length 1 ) ”
.

Definition CircularAreaWrite_entail_wit_1_3_split_goal_3 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx data_length_pre area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre <= (area_length - retval_2 ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH10 : (0 <= retval_2)) (PreH11 : (retval_2 <= area_length)) (PreH12 : (retval = 0)) (PreH13 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH14 : (0 <= retval)) (PreH15 : (retval <= 1)) (PreH16 : (data_length_pre > 0)) (PreH17 : (input_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = circular_area_entry)) (PreH20 : (input_buffer_pre = input_buffer_entry)) (PreH21 : (data_length_pre = requested)) (PreH22 : (b_force_pre = force0)) (PreH23 : (circular_area_pre <> 0)) (PreH24 : (input_buffer_pre <> 0)) (PreH25 : (0 < area_length)) (PreH26 : (area_length <= 256)) (PreH27 : (0 <= readidx)) (PreH28 : (readidx <= 255)) (PreH29 : (readidx < area_length)) (PreH30 : (0 <= writeidx)) (PreH31 : (writeidx <= 255)) (PreH32 : (writeidx < area_length)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : ((Zlength (contents)) = area_length)) (PreH36 : ((Zlength (input_contents)) = requested)) (PreH37 : (retval_3 <> 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ ((area_length - writeidx ) <= data_length_pre) ”
.

Definition CircularAreaWrite_entail_wit_1_3_split_goal_4 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx data_length_pre area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre <= (area_length - retval_2 ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH10 : (0 <= retval_2)) (PreH11 : (retval_2 <= area_length)) (PreH12 : (retval = 0)) (PreH13 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH14 : (0 <= retval)) (PreH15 : (retval <= 1)) (PreH16 : (data_length_pre > 0)) (PreH17 : (input_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = circular_area_entry)) (PreH20 : (input_buffer_pre = input_buffer_entry)) (PreH21 : (data_length_pre = requested)) (PreH22 : (b_force_pre = force0)) (PreH23 : (circular_area_pre <> 0)) (PreH24 : (input_buffer_pre <> 0)) (PreH25 : (0 < area_length)) (PreH26 : (area_length <= 256)) (PreH27 : (0 <= readidx)) (PreH28 : (readidx <= 255)) (PreH29 : (readidx < area_length)) (PreH30 : (0 <= writeidx)) (PreH31 : (writeidx <= 255)) (PreH32 : (writeidx < area_length)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : ((Zlength (contents)) = area_length)) (PreH36 : ((Zlength (input_contents)) = requested)) (PreH37 : (retval_3 <> 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ ((unsigned_last_nbits ((data_length_pre - (area_length - writeidx ) )) (32)) = (data_length_pre - (area_length - writeidx ) )) ”
.

Definition CircularAreaWrite_entail_wit_1_3_split_goal_5 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx data_length_pre area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre <= (area_length - retval_2 ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH10 : (0 <= retval_2)) (PreH11 : (retval_2 <= area_length)) (PreH12 : (retval = 0)) (PreH13 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH14 : (0 <= retval)) (PreH15 : (retval <= 1)) (PreH16 : (data_length_pre > 0)) (PreH17 : (input_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = circular_area_entry)) (PreH20 : (input_buffer_pre = input_buffer_entry)) (PreH21 : (data_length_pre = requested)) (PreH22 : (b_force_pre = force0)) (PreH23 : (circular_area_pre <> 0)) (PreH24 : (input_buffer_pre <> 0)) (PreH25 : (0 < area_length)) (PreH26 : (area_length <= 256)) (PreH27 : (0 <= readidx)) (PreH28 : (readidx <= 255)) (PreH29 : (readidx < area_length)) (PreH30 : (0 <= writeidx)) (PreH31 : (writeidx <= 255)) (PreH32 : (writeidx < area_length)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : ((Zlength (contents)) = area_length)) (PreH36 : ((Zlength (input_contents)) = requested)) (PreH37 : (retval_3 <> 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length_pre ) ”
.

Definition CircularAreaWrite_entail_wit_1_3_split_goal_6 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx data_length_pre area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre <= (area_length - retval_2 ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH10 : (0 <= retval_2)) (PreH11 : (retval_2 <= area_length)) (PreH12 : (retval = 0)) (PreH13 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH14 : (0 <= retval)) (PreH15 : (retval <= 1)) (PreH16 : (data_length_pre > 0)) (PreH17 : (input_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = circular_area_entry)) (PreH20 : (input_buffer_pre = input_buffer_entry)) (PreH21 : (data_length_pre = requested)) (PreH22 : (b_force_pre = force0)) (PreH23 : (circular_area_pre <> 0)) (PreH24 : (input_buffer_pre <> 0)) (PreH25 : (0 < area_length)) (PreH26 : (area_length <= 256)) (PreH27 : (0 <= readidx)) (PreH28 : (readidx <= 255)) (PreH29 : (readidx < area_length)) (PreH30 : (0 <= writeidx)) (PreH31 : (writeidx <= 255)) (PreH32 : (writeidx < area_length)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : ((Zlength (contents)) = area_length)) (PreH36 : ((Zlength (input_contents)) = requested)) (PreH37 : (retval_3 <> 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0))) ”
.

Definition CircularAreaWrite_entail_wit_1_3_split_goal_spatial := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx data_length_pre area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre <= (area_length - retval_2 ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH10 : (0 <= retval_2)) (PreH11 : (retval_2 <= area_length)) (PreH12 : (retval = 0)) (PreH13 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH14 : (0 <= retval)) (PreH15 : (retval <= 1)) (PreH16 : (data_length_pre > 0)) (PreH17 : (input_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = circular_area_entry)) (PreH20 : (input_buffer_pre = input_buffer_entry)) (PreH21 : (data_length_pre = requested)) (PreH22 : (b_force_pre = force0)) (PreH23 : (circular_area_pre <> 0)) (PreH24 : (input_buffer_pre <> 0)) (PreH25 : (0 < area_length)) (PreH26 : (area_length <= 256)) (PreH27 : (0 <= readidx)) (PreH28 : (readidx <= 255)) (PreH29 : (readidx < area_length)) (PreH30 : (0 <= writeidx)) (PreH31 : (writeidx <= 255)) (PreH32 : (writeidx < area_length)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : ((Zlength (contents)) = area_length)) (PreH36 : ((Zlength (input_contents)) = requested)) (PreH37 : (retval_3 <> 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx area_length (sublist (writeidx) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry 0 (area_length - writeidx ) (sublist (0) ((area_length - writeidx )) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry (area_length - writeidx ) requested (sublist ((area_length - writeidx )) (requested) (input_contents)) )
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
.

Definition CircularAreaWrite_entail_wit_1_4 := 
(
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval: Z) (retval_3: Z) (PreH1 : (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length retval_3 )) (PreH2 : (0 <= retval_3)) (PreH3 : (retval_3 <= 1)) (PreH4 : (data_length_pre > (area_length - retval ))) (PreH5 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH6 : (0 <= retval)) (PreH7 : (retval <= area_length)) (PreH8 : (retval_2 = 0)) (PreH9 : (CircularAreaIsFullResult readidx writeidx b_status retval_2 )) (PreH10 : (0 <= retval_2)) (PreH11 : (retval_2 <= 1)) (PreH12 : (data_length_pre > 0)) (PreH13 : (input_buffer_pre <> 0)) (PreH14 : (circular_area_pre <> 0)) (PreH15 : (circular_area_pre = circular_area_entry)) (PreH16 : (input_buffer_pre = input_buffer_entry)) (PreH17 : (data_length_pre = requested)) (PreH18 : (b_force_pre = force0)) (PreH19 : (circular_area_pre <> 0)) (PreH20 : (input_buffer_pre <> 0)) (PreH21 : (0 < area_length)) (PreH22 : (area_length <= 256)) (PreH23 : (0 <= readidx)) (PreH24 : (readidx <= 255)) (PreH25 : (readidx < area_length)) (PreH26 : (0 <= writeidx)) (PreH27 : (writeidx <= 255)) (PreH28 : (writeidx < area_length)) (PreH29 : (p_head = data_buffer)) (PreH30 : (p_tail = (data_buffer + area_length ))) (PreH31 : ((Zlength (contents)) = area_length)) (PreH32 : ((Zlength (input_contents)) = requested)) (PreH33 : (retval_3 <> 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (circular_area_entry <> 0) ” 
  &&  “ (input_buffer_entry <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0))) ” 
  &&  “ (CircularAreaActualWriteLength readidx writeidx area_length b_status requested (area_length - retval ) ) ” 
  &&  “ ((Zlength (input_contents)) = requested) ” 
  &&  “ (0 <= (area_length - retval )) ” 
  &&  “ ((area_length - retval ) <= requested) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ (writeidx < area_length) ” 
  &&  “ ((area_length - writeidx ) = (area_length - writeidx )) ” 
  &&  “ ((unsigned_last_nbits (((area_length - retval ) - (area_length - writeidx ) )) (32)) = ((area_length - retval ) - (area_length - writeidx ) )) ” 
  &&  “ ((area_length - writeidx ) <= (area_length - retval )) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length 1 ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status contents ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_entry)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_entry)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx area_length (sublist (writeidx) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry 0 (area_length - writeidx ) (sublist (0) ((area_length - writeidx )) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry (area_length - writeidx ) requested (sublist ((area_length - writeidx )) (requested) (input_contents)) )
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
) \/
(
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre > (area_length - retval ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH10 : (0 <= retval)) (PreH11 : (retval <= area_length)) (PreH12 : (retval_2 = 0)) (PreH13 : (CircularAreaIsFullResult readidx writeidx b_status retval_2 )) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 1)) (PreH16 : (data_length_pre > 0)) (PreH17 : (input_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = circular_area_entry)) (PreH20 : (input_buffer_pre = input_buffer_entry)) (PreH21 : (data_length_pre = requested)) (PreH22 : (b_force_pre = force0)) (PreH23 : (circular_area_pre <> 0)) (PreH24 : (input_buffer_pre <> 0)) (PreH25 : (0 < area_length)) (PreH26 : (area_length <= 256)) (PreH27 : (0 <= readidx)) (PreH28 : (readidx <= 255)) (PreH29 : (readidx < area_length)) (PreH30 : (0 <= writeidx)) (PreH31 : (writeidx <= 255)) (PreH32 : (writeidx < area_length)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : ((Zlength (contents)) = area_length)) (PreH36 : ((Zlength (input_contents)) = requested)) (PreH37 : (retval_3 <> 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (CircularAreaDescriptorState readidx writeidx area_length b_status contents ) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length 1 ) ” 
  &&  “ ((area_length - writeidx ) <= (area_length - retval )) ” 
  &&  “ ((unsigned_last_nbits (((area_length - retval ) - (area_length - writeidx ) )) (32)) = ((area_length - retval ) - (area_length - writeidx ) )) ” 
  &&  “ (CircularAreaActualWriteLength readidx writeidx area_length b_status requested (area_length - retval ) ) ” 
  &&  “ ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0))) ”
  &&  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx area_length (sublist (writeidx) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry 0 (area_length - writeidx ) (sublist (0) ((area_length - writeidx )) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry (area_length - writeidx ) requested (sublist ((area_length - writeidx )) (requested) (input_contents)) )
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
).

Definition CircularAreaWrite_entail_wit_1_4_split_goal_1 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre > (area_length - retval ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH10 : (0 <= retval)) (PreH11 : (retval <= area_length)) (PreH12 : (retval_2 = 0)) (PreH13 : (CircularAreaIsFullResult readidx writeidx b_status retval_2 )) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 1)) (PreH16 : (data_length_pre > 0)) (PreH17 : (input_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = circular_area_entry)) (PreH20 : (input_buffer_pre = input_buffer_entry)) (PreH21 : (data_length_pre = requested)) (PreH22 : (b_force_pre = force0)) (PreH23 : (circular_area_pre <> 0)) (PreH24 : (input_buffer_pre <> 0)) (PreH25 : (0 < area_length)) (PreH26 : (area_length <= 256)) (PreH27 : (0 <= readidx)) (PreH28 : (readidx <= 255)) (PreH29 : (readidx < area_length)) (PreH30 : (0 <= writeidx)) (PreH31 : (writeidx <= 255)) (PreH32 : (writeidx < area_length)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : ((Zlength (contents)) = area_length)) (PreH36 : ((Zlength (input_contents)) = requested)) (PreH37 : (retval_3 <> 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (CircularAreaDescriptorState readidx writeidx area_length b_status contents ) ”
.

Definition CircularAreaWrite_entail_wit_1_4_split_goal_2 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre > (area_length - retval ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH10 : (0 <= retval)) (PreH11 : (retval <= area_length)) (PreH12 : (retval_2 = 0)) (PreH13 : (CircularAreaIsFullResult readidx writeidx b_status retval_2 )) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 1)) (PreH16 : (data_length_pre > 0)) (PreH17 : (input_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = circular_area_entry)) (PreH20 : (input_buffer_pre = input_buffer_entry)) (PreH21 : (data_length_pre = requested)) (PreH22 : (b_force_pre = force0)) (PreH23 : (circular_area_pre <> 0)) (PreH24 : (input_buffer_pre <> 0)) (PreH25 : (0 < area_length)) (PreH26 : (area_length <= 256)) (PreH27 : (0 <= readidx)) (PreH28 : (readidx <= 255)) (PreH29 : (readidx < area_length)) (PreH30 : (0 <= writeidx)) (PreH31 : (writeidx <= 255)) (PreH32 : (writeidx < area_length)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : ((Zlength (contents)) = area_length)) (PreH36 : ((Zlength (input_contents)) = requested)) (PreH37 : (retval_3 <> 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length 1 ) ”
.

Definition CircularAreaWrite_entail_wit_1_4_split_goal_3 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre > (area_length - retval ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH10 : (0 <= retval)) (PreH11 : (retval <= area_length)) (PreH12 : (retval_2 = 0)) (PreH13 : (CircularAreaIsFullResult readidx writeidx b_status retval_2 )) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 1)) (PreH16 : (data_length_pre > 0)) (PreH17 : (input_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = circular_area_entry)) (PreH20 : (input_buffer_pre = input_buffer_entry)) (PreH21 : (data_length_pre = requested)) (PreH22 : (b_force_pre = force0)) (PreH23 : (circular_area_pre <> 0)) (PreH24 : (input_buffer_pre <> 0)) (PreH25 : (0 < area_length)) (PreH26 : (area_length <= 256)) (PreH27 : (0 <= readidx)) (PreH28 : (readidx <= 255)) (PreH29 : (readidx < area_length)) (PreH30 : (0 <= writeidx)) (PreH31 : (writeidx <= 255)) (PreH32 : (writeidx < area_length)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : ((Zlength (contents)) = area_length)) (PreH36 : ((Zlength (input_contents)) = requested)) (PreH37 : (retval_3 <> 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ ((area_length - writeidx ) <= (area_length - retval )) ”
.

Definition CircularAreaWrite_entail_wit_1_4_split_goal_4 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre > (area_length - retval ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH10 : (0 <= retval)) (PreH11 : (retval <= area_length)) (PreH12 : (retval_2 = 0)) (PreH13 : (CircularAreaIsFullResult readidx writeidx b_status retval_2 )) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 1)) (PreH16 : (data_length_pre > 0)) (PreH17 : (input_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = circular_area_entry)) (PreH20 : (input_buffer_pre = input_buffer_entry)) (PreH21 : (data_length_pre = requested)) (PreH22 : (b_force_pre = force0)) (PreH23 : (circular_area_pre <> 0)) (PreH24 : (input_buffer_pre <> 0)) (PreH25 : (0 < area_length)) (PreH26 : (area_length <= 256)) (PreH27 : (0 <= readidx)) (PreH28 : (readidx <= 255)) (PreH29 : (readidx < area_length)) (PreH30 : (0 <= writeidx)) (PreH31 : (writeidx <= 255)) (PreH32 : (writeidx < area_length)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : ((Zlength (contents)) = area_length)) (PreH36 : ((Zlength (input_contents)) = requested)) (PreH37 : (retval_3 <> 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ ((unsigned_last_nbits (((area_length - retval ) - (area_length - writeidx ) )) (32)) = ((area_length - retval ) - (area_length - writeidx ) )) ”
.

Definition CircularAreaWrite_entail_wit_1_4_split_goal_5 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre > (area_length - retval ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH10 : (0 <= retval)) (PreH11 : (retval <= area_length)) (PreH12 : (retval_2 = 0)) (PreH13 : (CircularAreaIsFullResult readidx writeidx b_status retval_2 )) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 1)) (PreH16 : (data_length_pre > 0)) (PreH17 : (input_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = circular_area_entry)) (PreH20 : (input_buffer_pre = input_buffer_entry)) (PreH21 : (data_length_pre = requested)) (PreH22 : (b_force_pre = force0)) (PreH23 : (circular_area_pre <> 0)) (PreH24 : (input_buffer_pre <> 0)) (PreH25 : (0 < area_length)) (PreH26 : (area_length <= 256)) (PreH27 : (0 <= readidx)) (PreH28 : (readidx <= 255)) (PreH29 : (readidx < area_length)) (PreH30 : (0 <= writeidx)) (PreH31 : (writeidx <= 255)) (PreH32 : (writeidx < area_length)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : ((Zlength (contents)) = area_length)) (PreH36 : ((Zlength (input_contents)) = requested)) (PreH37 : (retval_3 <> 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (CircularAreaActualWriteLength readidx writeidx area_length b_status requested (area_length - retval ) ) ”
.

Definition CircularAreaWrite_entail_wit_1_4_split_goal_6 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre > (area_length - retval ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH10 : (0 <= retval)) (PreH11 : (retval <= area_length)) (PreH12 : (retval_2 = 0)) (PreH13 : (CircularAreaIsFullResult readidx writeidx b_status retval_2 )) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 1)) (PreH16 : (data_length_pre > 0)) (PreH17 : (input_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = circular_area_entry)) (PreH20 : (input_buffer_pre = input_buffer_entry)) (PreH21 : (data_length_pre = requested)) (PreH22 : (b_force_pre = force0)) (PreH23 : (circular_area_pre <> 0)) (PreH24 : (input_buffer_pre <> 0)) (PreH25 : (0 < area_length)) (PreH26 : (area_length <= 256)) (PreH27 : (0 <= readidx)) (PreH28 : (readidx <= 255)) (PreH29 : (readidx < area_length)) (PreH30 : (0 <= writeidx)) (PreH31 : (writeidx <= 255)) (PreH32 : (writeidx < area_length)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : ((Zlength (contents)) = area_length)) (PreH36 : ((Zlength (input_contents)) = requested)) (PreH37 : (retval_3 <> 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0))) ”
.

Definition CircularAreaWrite_entail_wit_1_4_split_goal_spatial := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre > (area_length - retval ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH10 : (0 <= retval)) (PreH11 : (retval <= area_length)) (PreH12 : (retval_2 = 0)) (PreH13 : (CircularAreaIsFullResult readidx writeidx b_status retval_2 )) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 1)) (PreH16 : (data_length_pre > 0)) (PreH17 : (input_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = circular_area_entry)) (PreH20 : (input_buffer_pre = input_buffer_entry)) (PreH21 : (data_length_pre = requested)) (PreH22 : (b_force_pre = force0)) (PreH23 : (circular_area_pre <> 0)) (PreH24 : (input_buffer_pre <> 0)) (PreH25 : (0 < area_length)) (PreH26 : (area_length <= 256)) (PreH27 : (0 <= readidx)) (PreH28 : (readidx <= 255)) (PreH29 : (readidx < area_length)) (PreH30 : (0 <= writeidx)) (PreH31 : (writeidx <= 255)) (PreH32 : (writeidx < area_length)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : ((Zlength (contents)) = area_length)) (PreH36 : ((Zlength (input_contents)) = requested)) (PreH37 : (retval_3 <> 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx area_length (sublist (writeidx) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry 0 (area_length - writeidx ) (sublist (0) ((area_length - writeidx )) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry (area_length - writeidx ) requested (sublist ((area_length - writeidx )) (requested) (input_contents)) )
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
.

Definition CircularAreaWrite_entail_wit_2 := 
(
forall (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (write_len_up: Z) (write_len_down: Z) (retval: Z) (PreH1 : (retval = (data_buffer + (writeidx * sizeof(UCHAR))))) (PreH2 : (circular_area_entry <> 0)) (PreH3 : (input_buffer_entry <> 0)) (PreH4 : (requested > 0)) (PreH5 : (0 < area_length)) (PreH6 : ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0)))) (PreH7 : (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length )) (PreH8 : ((Zlength (input_contents)) = requested)) (PreH9 : (0 <= data_length)) (PreH10 : (data_length <= requested)) (PreH11 : (0 <= writeidx)) (PreH12 : (writeidx < area_length)) (PreH13 : (write_len_up = (area_length - writeidx ))) (PreH14 : (write_len_down = (data_length - write_len_up ))) (PreH15 : (write_len_up <= data_length)) (PreH16 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH17 : (p_head = data_buffer)) (PreH18 : (p_tail = (data_buffer + area_length ))) (PreH19 : (CircularAreaDescriptorState readidx writeidx area_length b_status contents )) ,
  (UCharArray.seg data_buffer writeidx area_length (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg input_buffer_entry write_len_up requested (sublist (write_len_up) (requested) (input_contents)) )
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ (circular_area_entry <> 0) ” 
  &&  “ (input_buffer_entry <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0))) ” 
  &&  “ (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length ) ” 
  &&  “ ((Zlength (input_contents)) = requested) ” 
  &&  “ (0 <= write_len_down) ” 
  &&  “ (write_len_down <= writeidx) ” 
  &&  “ (write_len_up = (area_length - writeidx )) ” 
  &&  “ (write_len_down = (data_length - write_len_up )) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx data_length area_length 1 ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status contents ) ”
  &&  (UCharArray.seg data_buffer 0 write_len_down (sublist (0) (write_len_down) (contents)) )
  **  (UCharArray.seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx area_length (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
) \/
(
forall (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (write_len_up: Z) (write_len_down: Z) (retval: Z) (PreH1 : (retval = (data_buffer + (writeidx * sizeof(UCHAR))))) (PreH2 : (circular_area_entry <> 0)) (PreH3 : (input_buffer_entry <> 0)) (PreH4 : (requested > 0)) (PreH5 : (0 < area_length)) (PreH6 : ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0)))) (PreH7 : (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length )) (PreH8 : ((Zlength (input_contents)) = requested)) (PreH9 : (0 <= data_length)) (PreH10 : (data_length <= requested)) (PreH11 : (0 <= writeidx)) (PreH12 : (writeidx < area_length)) (PreH13 : (write_len_up = (area_length - writeidx ))) (PreH14 : (write_len_down = (data_length - write_len_up ))) (PreH15 : (write_len_up <= data_length)) (PreH16 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH17 : (p_head = data_buffer)) (PreH18 : (p_tail = (data_buffer + area_length ))) (PreH19 : (CircularAreaDescriptorState readidx writeidx area_length b_status contents )) ,
  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (GlobalStrings LitMap )
|--
  “ (write_len_down <= writeidx) ” 
  &&  “ ((sublist (write_len_up) (requested) (input_contents)) = (app ((sublist (write_len_up) (data_length) (input_contents))) ((sublist (data_length) (requested) (input_contents))))) ” 
  &&  “ ((Zlength ((sublist (write_len_up) (data_length) (input_contents)))) = (data_length - write_len_up )) ”
  &&  (UCharArray.seg data_buffer 0 write_len_down (sublist (0) (write_len_down) (contents)) )
  **  (UCharArray.seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (contents)) )
  **  (GlobalStrings LitMap )
).

Definition CircularAreaWrite_entail_wit_2_split_goal_1 := 
forall (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (write_len_up: Z) (write_len_down: Z) (retval: Z) (PreH1 : (retval = (data_buffer + (writeidx * sizeof(UCHAR))))) (PreH2 : (circular_area_entry <> 0)) (PreH3 : (input_buffer_entry <> 0)) (PreH4 : (requested > 0)) (PreH5 : (0 < area_length)) (PreH6 : ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0)))) (PreH7 : (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length )) (PreH8 : ((Zlength (input_contents)) = requested)) (PreH9 : (0 <= data_length)) (PreH10 : (data_length <= requested)) (PreH11 : (0 <= writeidx)) (PreH12 : (writeidx < area_length)) (PreH13 : (write_len_up = (area_length - writeidx ))) (PreH14 : (write_len_down = (data_length - write_len_up ))) (PreH15 : (write_len_up <= data_length)) (PreH16 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH17 : (p_head = data_buffer)) (PreH18 : (p_tail = (data_buffer + area_length ))) (PreH19 : (CircularAreaDescriptorState readidx writeidx area_length b_status contents )) ,
  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (GlobalStrings LitMap )
|--
  “ (write_len_down <= writeidx) ”
.

Definition CircularAreaWrite_entail_wit_2_split_goal_2 := 
forall (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (write_len_up: Z) (write_len_down: Z) (retval: Z) (PreH1 : (retval = (data_buffer + (writeidx * sizeof(UCHAR))))) (PreH2 : (circular_area_entry <> 0)) (PreH3 : (input_buffer_entry <> 0)) (PreH4 : (requested > 0)) (PreH5 : (0 < area_length)) (PreH6 : ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0)))) (PreH7 : (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length )) (PreH8 : ((Zlength (input_contents)) = requested)) (PreH9 : (0 <= data_length)) (PreH10 : (data_length <= requested)) (PreH11 : (0 <= writeidx)) (PreH12 : (writeidx < area_length)) (PreH13 : (write_len_up = (area_length - writeidx ))) (PreH14 : (write_len_down = (data_length - write_len_up ))) (PreH15 : (write_len_up <= data_length)) (PreH16 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH17 : (p_head = data_buffer)) (PreH18 : (p_tail = (data_buffer + area_length ))) (PreH19 : (CircularAreaDescriptorState readidx writeidx area_length b_status contents )) ,
  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (GlobalStrings LitMap )
|--
  “ ((sublist (write_len_up) (requested) (input_contents)) = (app ((sublist (write_len_up) (data_length) (input_contents))) ((sublist (data_length) (requested) (input_contents))))) ”
.

Definition CircularAreaWrite_entail_wit_2_split_goal_3 := 
forall (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (write_len_up: Z) (write_len_down: Z) (retval: Z) (PreH1 : (retval = (data_buffer + (writeidx * sizeof(UCHAR))))) (PreH2 : (circular_area_entry <> 0)) (PreH3 : (input_buffer_entry <> 0)) (PreH4 : (requested > 0)) (PreH5 : (0 < area_length)) (PreH6 : ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0)))) (PreH7 : (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length )) (PreH8 : ((Zlength (input_contents)) = requested)) (PreH9 : (0 <= data_length)) (PreH10 : (data_length <= requested)) (PreH11 : (0 <= writeidx)) (PreH12 : (writeidx < area_length)) (PreH13 : (write_len_up = (area_length - writeidx ))) (PreH14 : (write_len_down = (data_length - write_len_up ))) (PreH15 : (write_len_up <= data_length)) (PreH16 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH17 : (p_head = data_buffer)) (PreH18 : (p_tail = (data_buffer + area_length ))) (PreH19 : (CircularAreaDescriptorState readidx writeidx area_length b_status contents )) ,
  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (GlobalStrings LitMap )
|--
  “ ((Zlength ((sublist (write_len_up) (data_length) (input_contents)))) = (data_length - write_len_up )) ”
.

Definition CircularAreaWrite_entail_wit_2_split_goal_spatial := 
forall (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (write_len_up: Z) (write_len_down: Z) (retval: Z) (PreH1 : (retval = (data_buffer + (writeidx * sizeof(UCHAR))))) (PreH2 : (circular_area_entry <> 0)) (PreH3 : (input_buffer_entry <> 0)) (PreH4 : (requested > 0)) (PreH5 : (0 < area_length)) (PreH6 : ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0)))) (PreH7 : (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length )) (PreH8 : ((Zlength (input_contents)) = requested)) (PreH9 : (0 <= data_length)) (PreH10 : (data_length <= requested)) (PreH11 : (0 <= writeidx)) (PreH12 : (writeidx < area_length)) (PreH13 : (write_len_up = (area_length - writeidx ))) (PreH14 : (write_len_down = (data_length - write_len_up ))) (PreH15 : (write_len_up <= data_length)) (PreH16 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH17 : (p_head = data_buffer)) (PreH18 : (p_tail = (data_buffer + area_length ))) (PreH19 : (CircularAreaDescriptorState readidx writeidx area_length b_status contents )) ,
  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (GlobalStrings LitMap )
|--
  (UCharArray.seg data_buffer 0 write_len_down (sublist (0) (write_len_down) (contents)) )
  **  (UCharArray.seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (contents)) )
  **  (GlobalStrings LitMap )
.

Definition CircularAreaWrite_entail_wit_3_1 := 
(
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (CircularAreaDivideWrDataResult writeidx data_length_pre area_length retval_3 )) (PreH2 : (0 <= retval_3)) (PreH3 : (retval_3 <= 1)) (PreH4 : (data_length_pre <= (area_length - retval_2 ))) (PreH5 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH6 : (0 <= retval_2)) (PreH7 : (retval_2 <= area_length)) (PreH8 : (b_force_pre <> 0)) (PreH9 : (retval <> 0)) (PreH10 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH11 : (0 <= retval)) (PreH12 : (retval <= 1)) (PreH13 : (data_length_pre > 0)) (PreH14 : (input_buffer_pre <> 0)) (PreH15 : (circular_area_pre <> 0)) (PreH16 : (circular_area_pre = circular_area_entry)) (PreH17 : (input_buffer_pre = input_buffer_entry)) (PreH18 : (data_length_pre = requested)) (PreH19 : (b_force_pre = force0)) (PreH20 : (circular_area_pre <> 0)) (PreH21 : (input_buffer_pre <> 0)) (PreH22 : (0 < area_length)) (PreH23 : (area_length <= 256)) (PreH24 : (0 <= readidx)) (PreH25 : (readidx <= 255)) (PreH26 : (readidx < area_length)) (PreH27 : (0 <= writeidx)) (PreH28 : (writeidx <= 255)) (PreH29 : (writeidx < area_length)) (PreH30 : (p_head = data_buffer)) (PreH31 : (p_tail = (data_buffer + area_length ))) (PreH32 : ((Zlength (contents)) = area_length)) (PreH33 : ((Zlength (input_contents)) = requested)) (PreH34 : (retval_3 = 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (circular_area_entry <> 0) ” 
  &&  “ (input_buffer_entry <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0))) ” 
  &&  “ (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length_pre ) ” 
  &&  “ ((Zlength (input_contents)) = requested) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= requested) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ ((writeidx + data_length_pre ) <= area_length) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx data_length_pre area_length 0 ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status contents ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_entry)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_entry)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx (writeidx + data_length_pre ) (sublist (writeidx) ((writeidx + data_length_pre )) (contents)) )
  **  (UCharArray.seg data_buffer (writeidx + data_length_pre ) area_length (sublist ((writeidx + data_length_pre )) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry 0 data_length_pre (sublist (0) (data_length_pre) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry data_length_pre requested (sublist (data_length_pre) (requested) (input_contents)) )
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
) \/
(
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx data_length_pre area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre <= (area_length - retval_2 ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH10 : (0 <= retval_2)) (PreH11 : (retval_2 <= area_length)) (PreH12 : (b_force_pre <> 0)) (PreH13 : (retval <> 0)) (PreH14 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH15 : (0 <= retval)) (PreH16 : (retval <= 1)) (PreH17 : (data_length_pre > 0)) (PreH18 : (input_buffer_pre <> 0)) (PreH19 : (circular_area_pre <> 0)) (PreH20 : (circular_area_pre = circular_area_entry)) (PreH21 : (input_buffer_pre = input_buffer_entry)) (PreH22 : (data_length_pre = requested)) (PreH23 : (b_force_pre = force0)) (PreH24 : (circular_area_pre <> 0)) (PreH25 : (input_buffer_pre <> 0)) (PreH26 : (0 < area_length)) (PreH27 : (area_length <= 256)) (PreH28 : (0 <= readidx)) (PreH29 : (readidx <= 255)) (PreH30 : (readidx < area_length)) (PreH31 : (0 <= writeidx)) (PreH32 : (writeidx <= 255)) (PreH33 : (writeidx < area_length)) (PreH34 : (p_head = data_buffer)) (PreH35 : (p_tail = (data_buffer + area_length ))) (PreH36 : ((Zlength (contents)) = area_length)) (PreH37 : ((Zlength (input_contents)) = requested)) (PreH38 : (retval_3 = 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (CircularAreaDescriptorState readidx writeidx area_length b_status contents ) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx data_length_pre area_length 0 ) ” 
  &&  “ ((writeidx + data_length_pre ) <= area_length) ” 
  &&  “ (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length_pre ) ”
  &&  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx (writeidx + data_length_pre ) (sublist (writeidx) ((writeidx + data_length_pre )) (contents)) )
  **  (UCharArray.seg data_buffer (writeidx + data_length_pre ) area_length (sublist ((writeidx + data_length_pre )) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry 0 data_length_pre (sublist (0) (data_length_pre) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry data_length_pre requested (sublist (data_length_pre) (requested) (input_contents)) )
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
).

Definition CircularAreaWrite_entail_wit_3_1_split_goal_1 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx data_length_pre area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre <= (area_length - retval_2 ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH10 : (0 <= retval_2)) (PreH11 : (retval_2 <= area_length)) (PreH12 : (b_force_pre <> 0)) (PreH13 : (retval <> 0)) (PreH14 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH15 : (0 <= retval)) (PreH16 : (retval <= 1)) (PreH17 : (data_length_pre > 0)) (PreH18 : (input_buffer_pre <> 0)) (PreH19 : (circular_area_pre <> 0)) (PreH20 : (circular_area_pre = circular_area_entry)) (PreH21 : (input_buffer_pre = input_buffer_entry)) (PreH22 : (data_length_pre = requested)) (PreH23 : (b_force_pre = force0)) (PreH24 : (circular_area_pre <> 0)) (PreH25 : (input_buffer_pre <> 0)) (PreH26 : (0 < area_length)) (PreH27 : (area_length <= 256)) (PreH28 : (0 <= readidx)) (PreH29 : (readidx <= 255)) (PreH30 : (readidx < area_length)) (PreH31 : (0 <= writeidx)) (PreH32 : (writeidx <= 255)) (PreH33 : (writeidx < area_length)) (PreH34 : (p_head = data_buffer)) (PreH35 : (p_tail = (data_buffer + area_length ))) (PreH36 : ((Zlength (contents)) = area_length)) (PreH37 : ((Zlength (input_contents)) = requested)) (PreH38 : (retval_3 = 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (CircularAreaDescriptorState readidx writeidx area_length b_status contents ) ”
.

Definition CircularAreaWrite_entail_wit_3_1_split_goal_2 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx data_length_pre area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre <= (area_length - retval_2 ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH10 : (0 <= retval_2)) (PreH11 : (retval_2 <= area_length)) (PreH12 : (b_force_pre <> 0)) (PreH13 : (retval <> 0)) (PreH14 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH15 : (0 <= retval)) (PreH16 : (retval <= 1)) (PreH17 : (data_length_pre > 0)) (PreH18 : (input_buffer_pre <> 0)) (PreH19 : (circular_area_pre <> 0)) (PreH20 : (circular_area_pre = circular_area_entry)) (PreH21 : (input_buffer_pre = input_buffer_entry)) (PreH22 : (data_length_pre = requested)) (PreH23 : (b_force_pre = force0)) (PreH24 : (circular_area_pre <> 0)) (PreH25 : (input_buffer_pre <> 0)) (PreH26 : (0 < area_length)) (PreH27 : (area_length <= 256)) (PreH28 : (0 <= readidx)) (PreH29 : (readidx <= 255)) (PreH30 : (readidx < area_length)) (PreH31 : (0 <= writeidx)) (PreH32 : (writeidx <= 255)) (PreH33 : (writeidx < area_length)) (PreH34 : (p_head = data_buffer)) (PreH35 : (p_tail = (data_buffer + area_length ))) (PreH36 : ((Zlength (contents)) = area_length)) (PreH37 : ((Zlength (input_contents)) = requested)) (PreH38 : (retval_3 = 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (CircularAreaDivideWrDataResult writeidx data_length_pre area_length 0 ) ”
.

Definition CircularAreaWrite_entail_wit_3_1_split_goal_3 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx data_length_pre area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre <= (area_length - retval_2 ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH10 : (0 <= retval_2)) (PreH11 : (retval_2 <= area_length)) (PreH12 : (b_force_pre <> 0)) (PreH13 : (retval <> 0)) (PreH14 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH15 : (0 <= retval)) (PreH16 : (retval <= 1)) (PreH17 : (data_length_pre > 0)) (PreH18 : (input_buffer_pre <> 0)) (PreH19 : (circular_area_pre <> 0)) (PreH20 : (circular_area_pre = circular_area_entry)) (PreH21 : (input_buffer_pre = input_buffer_entry)) (PreH22 : (data_length_pre = requested)) (PreH23 : (b_force_pre = force0)) (PreH24 : (circular_area_pre <> 0)) (PreH25 : (input_buffer_pre <> 0)) (PreH26 : (0 < area_length)) (PreH27 : (area_length <= 256)) (PreH28 : (0 <= readidx)) (PreH29 : (readidx <= 255)) (PreH30 : (readidx < area_length)) (PreH31 : (0 <= writeidx)) (PreH32 : (writeidx <= 255)) (PreH33 : (writeidx < area_length)) (PreH34 : (p_head = data_buffer)) (PreH35 : (p_tail = (data_buffer + area_length ))) (PreH36 : ((Zlength (contents)) = area_length)) (PreH37 : ((Zlength (input_contents)) = requested)) (PreH38 : (retval_3 = 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ ((writeidx + data_length_pre ) <= area_length) ”
.

Definition CircularAreaWrite_entail_wit_3_1_split_goal_4 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx data_length_pre area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre <= (area_length - retval_2 ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH10 : (0 <= retval_2)) (PreH11 : (retval_2 <= area_length)) (PreH12 : (b_force_pre <> 0)) (PreH13 : (retval <> 0)) (PreH14 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH15 : (0 <= retval)) (PreH16 : (retval <= 1)) (PreH17 : (data_length_pre > 0)) (PreH18 : (input_buffer_pre <> 0)) (PreH19 : (circular_area_pre <> 0)) (PreH20 : (circular_area_pre = circular_area_entry)) (PreH21 : (input_buffer_pre = input_buffer_entry)) (PreH22 : (data_length_pre = requested)) (PreH23 : (b_force_pre = force0)) (PreH24 : (circular_area_pre <> 0)) (PreH25 : (input_buffer_pre <> 0)) (PreH26 : (0 < area_length)) (PreH27 : (area_length <= 256)) (PreH28 : (0 <= readidx)) (PreH29 : (readidx <= 255)) (PreH30 : (readidx < area_length)) (PreH31 : (0 <= writeidx)) (PreH32 : (writeidx <= 255)) (PreH33 : (writeidx < area_length)) (PreH34 : (p_head = data_buffer)) (PreH35 : (p_tail = (data_buffer + area_length ))) (PreH36 : ((Zlength (contents)) = area_length)) (PreH37 : ((Zlength (input_contents)) = requested)) (PreH38 : (retval_3 = 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length_pre ) ”
.

Definition CircularAreaWrite_entail_wit_3_1_split_goal_spatial := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx data_length_pre area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre <= (area_length - retval_2 ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH10 : (0 <= retval_2)) (PreH11 : (retval_2 <= area_length)) (PreH12 : (b_force_pre <> 0)) (PreH13 : (retval <> 0)) (PreH14 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH15 : (0 <= retval)) (PreH16 : (retval <= 1)) (PreH17 : (data_length_pre > 0)) (PreH18 : (input_buffer_pre <> 0)) (PreH19 : (circular_area_pre <> 0)) (PreH20 : (circular_area_pre = circular_area_entry)) (PreH21 : (input_buffer_pre = input_buffer_entry)) (PreH22 : (data_length_pre = requested)) (PreH23 : (b_force_pre = force0)) (PreH24 : (circular_area_pre <> 0)) (PreH25 : (input_buffer_pre <> 0)) (PreH26 : (0 < area_length)) (PreH27 : (area_length <= 256)) (PreH28 : (0 <= readidx)) (PreH29 : (readidx <= 255)) (PreH30 : (readidx < area_length)) (PreH31 : (0 <= writeidx)) (PreH32 : (writeidx <= 255)) (PreH33 : (writeidx < area_length)) (PreH34 : (p_head = data_buffer)) (PreH35 : (p_tail = (data_buffer + area_length ))) (PreH36 : ((Zlength (contents)) = area_length)) (PreH37 : ((Zlength (input_contents)) = requested)) (PreH38 : (retval_3 = 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx (writeidx + data_length_pre ) (sublist (writeidx) ((writeidx + data_length_pre )) (contents)) )
  **  (UCharArray.seg data_buffer (writeidx + data_length_pre ) area_length (sublist ((writeidx + data_length_pre )) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry 0 data_length_pre (sublist (0) (data_length_pre) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry data_length_pre requested (sublist (data_length_pre) (requested) (input_contents)) )
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
.

Definition CircularAreaWrite_entail_wit_3_2 := 
(
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval: Z) (retval_3: Z) (PreH1 : (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length retval_3 )) (PreH2 : (0 <= retval_3)) (PreH3 : (retval_3 <= 1)) (PreH4 : (data_length_pre > (area_length - retval ))) (PreH5 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH6 : (0 <= retval)) (PreH7 : (retval <= area_length)) (PreH8 : (b_force_pre <> 0)) (PreH9 : (retval_2 <> 0)) (PreH10 : (CircularAreaIsFullResult readidx writeidx b_status retval_2 )) (PreH11 : (0 <= retval_2)) (PreH12 : (retval_2 <= 1)) (PreH13 : (data_length_pre > 0)) (PreH14 : (input_buffer_pre <> 0)) (PreH15 : (circular_area_pre <> 0)) (PreH16 : (circular_area_pre = circular_area_entry)) (PreH17 : (input_buffer_pre = input_buffer_entry)) (PreH18 : (data_length_pre = requested)) (PreH19 : (b_force_pre = force0)) (PreH20 : (circular_area_pre <> 0)) (PreH21 : (input_buffer_pre <> 0)) (PreH22 : (0 < area_length)) (PreH23 : (area_length <= 256)) (PreH24 : (0 <= readidx)) (PreH25 : (readidx <= 255)) (PreH26 : (readidx < area_length)) (PreH27 : (0 <= writeidx)) (PreH28 : (writeidx <= 255)) (PreH29 : (writeidx < area_length)) (PreH30 : (p_head = data_buffer)) (PreH31 : (p_tail = (data_buffer + area_length ))) (PreH32 : ((Zlength (contents)) = area_length)) (PreH33 : ((Zlength (input_contents)) = requested)) (PreH34 : (retval_3 = 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (circular_area_entry <> 0) ” 
  &&  “ (input_buffer_entry <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0))) ” 
  &&  “ (CircularAreaActualWriteLength readidx writeidx area_length b_status requested (area_length - retval ) ) ” 
  &&  “ ((Zlength (input_contents)) = requested) ” 
  &&  “ (0 <= (area_length - retval )) ” 
  &&  “ ((area_length - retval ) <= requested) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ ((writeidx + (area_length - retval ) ) <= area_length) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length 0 ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status contents ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_entry)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_entry)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx (writeidx + (area_length - retval ) ) (sublist (writeidx) ((writeidx + (area_length - retval ) )) (contents)) )
  **  (UCharArray.seg data_buffer (writeidx + (area_length - retval ) ) area_length (sublist ((writeidx + (area_length - retval ) )) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry 0 (area_length - retval ) (sublist (0) ((area_length - retval )) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry (area_length - retval ) requested (sublist ((area_length - retval )) (requested) (input_contents)) )
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
) \/
(
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre > (area_length - retval ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH10 : (0 <= retval)) (PreH11 : (retval <= area_length)) (PreH12 : (b_force_pre <> 0)) (PreH13 : (retval_2 <> 0)) (PreH14 : (CircularAreaIsFullResult readidx writeidx b_status retval_2 )) (PreH15 : (0 <= retval_2)) (PreH16 : (retval_2 <= 1)) (PreH17 : (data_length_pre > 0)) (PreH18 : (input_buffer_pre <> 0)) (PreH19 : (circular_area_pre <> 0)) (PreH20 : (circular_area_pre = circular_area_entry)) (PreH21 : (input_buffer_pre = input_buffer_entry)) (PreH22 : (data_length_pre = requested)) (PreH23 : (b_force_pre = force0)) (PreH24 : (circular_area_pre <> 0)) (PreH25 : (input_buffer_pre <> 0)) (PreH26 : (0 < area_length)) (PreH27 : (area_length <= 256)) (PreH28 : (0 <= readidx)) (PreH29 : (readidx <= 255)) (PreH30 : (readidx < area_length)) (PreH31 : (0 <= writeidx)) (PreH32 : (writeidx <= 255)) (PreH33 : (writeidx < area_length)) (PreH34 : (p_head = data_buffer)) (PreH35 : (p_tail = (data_buffer + area_length ))) (PreH36 : ((Zlength (contents)) = area_length)) (PreH37 : ((Zlength (input_contents)) = requested)) (PreH38 : (retval_3 = 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (CircularAreaDescriptorState readidx writeidx area_length b_status contents ) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length 0 ) ” 
  &&  “ ((writeidx + (area_length - retval ) ) <= area_length) ” 
  &&  “ (CircularAreaActualWriteLength readidx writeidx area_length b_status requested (area_length - retval ) ) ”
  &&  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx (writeidx + (area_length - retval ) ) (sublist (writeidx) ((writeidx + (area_length - retval ) )) (contents)) )
  **  (UCharArray.seg data_buffer (writeidx + (area_length - retval ) ) area_length (sublist ((writeidx + (area_length - retval ) )) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry 0 (area_length - retval ) (sublist (0) ((area_length - retval )) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry (area_length - retval ) requested (sublist ((area_length - retval )) (requested) (input_contents)) )
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
).

Definition CircularAreaWrite_entail_wit_3_2_split_goal_1 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre > (area_length - retval ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH10 : (0 <= retval)) (PreH11 : (retval <= area_length)) (PreH12 : (b_force_pre <> 0)) (PreH13 : (retval_2 <> 0)) (PreH14 : (CircularAreaIsFullResult readidx writeidx b_status retval_2 )) (PreH15 : (0 <= retval_2)) (PreH16 : (retval_2 <= 1)) (PreH17 : (data_length_pre > 0)) (PreH18 : (input_buffer_pre <> 0)) (PreH19 : (circular_area_pre <> 0)) (PreH20 : (circular_area_pre = circular_area_entry)) (PreH21 : (input_buffer_pre = input_buffer_entry)) (PreH22 : (data_length_pre = requested)) (PreH23 : (b_force_pre = force0)) (PreH24 : (circular_area_pre <> 0)) (PreH25 : (input_buffer_pre <> 0)) (PreH26 : (0 < area_length)) (PreH27 : (area_length <= 256)) (PreH28 : (0 <= readidx)) (PreH29 : (readidx <= 255)) (PreH30 : (readidx < area_length)) (PreH31 : (0 <= writeidx)) (PreH32 : (writeidx <= 255)) (PreH33 : (writeidx < area_length)) (PreH34 : (p_head = data_buffer)) (PreH35 : (p_tail = (data_buffer + area_length ))) (PreH36 : ((Zlength (contents)) = area_length)) (PreH37 : ((Zlength (input_contents)) = requested)) (PreH38 : (retval_3 = 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (CircularAreaDescriptorState readidx writeidx area_length b_status contents ) ”
.

Definition CircularAreaWrite_entail_wit_3_2_split_goal_2 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre > (area_length - retval ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH10 : (0 <= retval)) (PreH11 : (retval <= area_length)) (PreH12 : (b_force_pre <> 0)) (PreH13 : (retval_2 <> 0)) (PreH14 : (CircularAreaIsFullResult readidx writeidx b_status retval_2 )) (PreH15 : (0 <= retval_2)) (PreH16 : (retval_2 <= 1)) (PreH17 : (data_length_pre > 0)) (PreH18 : (input_buffer_pre <> 0)) (PreH19 : (circular_area_pre <> 0)) (PreH20 : (circular_area_pre = circular_area_entry)) (PreH21 : (input_buffer_pre = input_buffer_entry)) (PreH22 : (data_length_pre = requested)) (PreH23 : (b_force_pre = force0)) (PreH24 : (circular_area_pre <> 0)) (PreH25 : (input_buffer_pre <> 0)) (PreH26 : (0 < area_length)) (PreH27 : (area_length <= 256)) (PreH28 : (0 <= readidx)) (PreH29 : (readidx <= 255)) (PreH30 : (readidx < area_length)) (PreH31 : (0 <= writeidx)) (PreH32 : (writeidx <= 255)) (PreH33 : (writeidx < area_length)) (PreH34 : (p_head = data_buffer)) (PreH35 : (p_tail = (data_buffer + area_length ))) (PreH36 : ((Zlength (contents)) = area_length)) (PreH37 : ((Zlength (input_contents)) = requested)) (PreH38 : (retval_3 = 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length 0 ) ”
.

Definition CircularAreaWrite_entail_wit_3_2_split_goal_3 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre > (area_length - retval ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH10 : (0 <= retval)) (PreH11 : (retval <= area_length)) (PreH12 : (b_force_pre <> 0)) (PreH13 : (retval_2 <> 0)) (PreH14 : (CircularAreaIsFullResult readidx writeidx b_status retval_2 )) (PreH15 : (0 <= retval_2)) (PreH16 : (retval_2 <= 1)) (PreH17 : (data_length_pre > 0)) (PreH18 : (input_buffer_pre <> 0)) (PreH19 : (circular_area_pre <> 0)) (PreH20 : (circular_area_pre = circular_area_entry)) (PreH21 : (input_buffer_pre = input_buffer_entry)) (PreH22 : (data_length_pre = requested)) (PreH23 : (b_force_pre = force0)) (PreH24 : (circular_area_pre <> 0)) (PreH25 : (input_buffer_pre <> 0)) (PreH26 : (0 < area_length)) (PreH27 : (area_length <= 256)) (PreH28 : (0 <= readidx)) (PreH29 : (readidx <= 255)) (PreH30 : (readidx < area_length)) (PreH31 : (0 <= writeidx)) (PreH32 : (writeidx <= 255)) (PreH33 : (writeidx < area_length)) (PreH34 : (p_head = data_buffer)) (PreH35 : (p_tail = (data_buffer + area_length ))) (PreH36 : ((Zlength (contents)) = area_length)) (PreH37 : ((Zlength (input_contents)) = requested)) (PreH38 : (retval_3 = 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ ((writeidx + (area_length - retval ) ) <= area_length) ”
.

Definition CircularAreaWrite_entail_wit_3_2_split_goal_4 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre > (area_length - retval ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH10 : (0 <= retval)) (PreH11 : (retval <= area_length)) (PreH12 : (b_force_pre <> 0)) (PreH13 : (retval_2 <> 0)) (PreH14 : (CircularAreaIsFullResult readidx writeidx b_status retval_2 )) (PreH15 : (0 <= retval_2)) (PreH16 : (retval_2 <= 1)) (PreH17 : (data_length_pre > 0)) (PreH18 : (input_buffer_pre <> 0)) (PreH19 : (circular_area_pre <> 0)) (PreH20 : (circular_area_pre = circular_area_entry)) (PreH21 : (input_buffer_pre = input_buffer_entry)) (PreH22 : (data_length_pre = requested)) (PreH23 : (b_force_pre = force0)) (PreH24 : (circular_area_pre <> 0)) (PreH25 : (input_buffer_pre <> 0)) (PreH26 : (0 < area_length)) (PreH27 : (area_length <= 256)) (PreH28 : (0 <= readidx)) (PreH29 : (readidx <= 255)) (PreH30 : (readidx < area_length)) (PreH31 : (0 <= writeidx)) (PreH32 : (writeidx <= 255)) (PreH33 : (writeidx < area_length)) (PreH34 : (p_head = data_buffer)) (PreH35 : (p_tail = (data_buffer + area_length ))) (PreH36 : ((Zlength (contents)) = area_length)) (PreH37 : ((Zlength (input_contents)) = requested)) (PreH38 : (retval_3 = 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (CircularAreaActualWriteLength readidx writeidx area_length b_status requested (area_length - retval ) ) ”
.

Definition CircularAreaWrite_entail_wit_3_2_split_goal_spatial := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre > (area_length - retval ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH10 : (0 <= retval)) (PreH11 : (retval <= area_length)) (PreH12 : (b_force_pre <> 0)) (PreH13 : (retval_2 <> 0)) (PreH14 : (CircularAreaIsFullResult readidx writeidx b_status retval_2 )) (PreH15 : (0 <= retval_2)) (PreH16 : (retval_2 <= 1)) (PreH17 : (data_length_pre > 0)) (PreH18 : (input_buffer_pre <> 0)) (PreH19 : (circular_area_pre <> 0)) (PreH20 : (circular_area_pre = circular_area_entry)) (PreH21 : (input_buffer_pre = input_buffer_entry)) (PreH22 : (data_length_pre = requested)) (PreH23 : (b_force_pre = force0)) (PreH24 : (circular_area_pre <> 0)) (PreH25 : (input_buffer_pre <> 0)) (PreH26 : (0 < area_length)) (PreH27 : (area_length <= 256)) (PreH28 : (0 <= readidx)) (PreH29 : (readidx <= 255)) (PreH30 : (readidx < area_length)) (PreH31 : (0 <= writeidx)) (PreH32 : (writeidx <= 255)) (PreH33 : (writeidx < area_length)) (PreH34 : (p_head = data_buffer)) (PreH35 : (p_tail = (data_buffer + area_length ))) (PreH36 : ((Zlength (contents)) = area_length)) (PreH37 : ((Zlength (input_contents)) = requested)) (PreH38 : (retval_3 = 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx (writeidx + (area_length - retval ) ) (sublist (writeidx) ((writeidx + (area_length - retval ) )) (contents)) )
  **  (UCharArray.seg data_buffer (writeidx + (area_length - retval ) ) area_length (sublist ((writeidx + (area_length - retval ) )) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry 0 (area_length - retval ) (sublist (0) ((area_length - retval )) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry (area_length - retval ) requested (sublist ((area_length - retval )) (requested) (input_contents)) )
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
.

Definition CircularAreaWrite_entail_wit_3_3 := 
(
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (CircularAreaDivideWrDataResult writeidx data_length_pre area_length retval_3 )) (PreH2 : (0 <= retval_3)) (PreH3 : (retval_3 <= 1)) (PreH4 : (data_length_pre <= (area_length - retval_2 ))) (PreH5 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH6 : (0 <= retval_2)) (PreH7 : (retval_2 <= area_length)) (PreH8 : (retval = 0)) (PreH9 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH10 : (0 <= retval)) (PreH11 : (retval <= 1)) (PreH12 : (data_length_pre > 0)) (PreH13 : (input_buffer_pre <> 0)) (PreH14 : (circular_area_pre <> 0)) (PreH15 : (circular_area_pre = circular_area_entry)) (PreH16 : (input_buffer_pre = input_buffer_entry)) (PreH17 : (data_length_pre = requested)) (PreH18 : (b_force_pre = force0)) (PreH19 : (circular_area_pre <> 0)) (PreH20 : (input_buffer_pre <> 0)) (PreH21 : (0 < area_length)) (PreH22 : (area_length <= 256)) (PreH23 : (0 <= readidx)) (PreH24 : (readidx <= 255)) (PreH25 : (readidx < area_length)) (PreH26 : (0 <= writeidx)) (PreH27 : (writeidx <= 255)) (PreH28 : (writeidx < area_length)) (PreH29 : (p_head = data_buffer)) (PreH30 : (p_tail = (data_buffer + area_length ))) (PreH31 : ((Zlength (contents)) = area_length)) (PreH32 : ((Zlength (input_contents)) = requested)) (PreH33 : (retval_3 = 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (circular_area_entry <> 0) ” 
  &&  “ (input_buffer_entry <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0))) ” 
  &&  “ (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length_pre ) ” 
  &&  “ ((Zlength (input_contents)) = requested) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= requested) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ ((writeidx + data_length_pre ) <= area_length) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx data_length_pre area_length 0 ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status contents ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_entry)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_entry)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx (writeidx + data_length_pre ) (sublist (writeidx) ((writeidx + data_length_pre )) (contents)) )
  **  (UCharArray.seg data_buffer (writeidx + data_length_pre ) area_length (sublist ((writeidx + data_length_pre )) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry 0 data_length_pre (sublist (0) (data_length_pre) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry data_length_pre requested (sublist (data_length_pre) (requested) (input_contents)) )
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
) \/
(
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx data_length_pre area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre <= (area_length - retval_2 ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH10 : (0 <= retval_2)) (PreH11 : (retval_2 <= area_length)) (PreH12 : (retval = 0)) (PreH13 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH14 : (0 <= retval)) (PreH15 : (retval <= 1)) (PreH16 : (data_length_pre > 0)) (PreH17 : (input_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = circular_area_entry)) (PreH20 : (input_buffer_pre = input_buffer_entry)) (PreH21 : (data_length_pre = requested)) (PreH22 : (b_force_pre = force0)) (PreH23 : (circular_area_pre <> 0)) (PreH24 : (input_buffer_pre <> 0)) (PreH25 : (0 < area_length)) (PreH26 : (area_length <= 256)) (PreH27 : (0 <= readidx)) (PreH28 : (readidx <= 255)) (PreH29 : (readidx < area_length)) (PreH30 : (0 <= writeidx)) (PreH31 : (writeidx <= 255)) (PreH32 : (writeidx < area_length)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : ((Zlength (contents)) = area_length)) (PreH36 : ((Zlength (input_contents)) = requested)) (PreH37 : (retval_3 = 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (CircularAreaDescriptorState readidx writeidx area_length b_status contents ) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx data_length_pre area_length 0 ) ” 
  &&  “ ((writeidx + data_length_pre ) <= area_length) ” 
  &&  “ (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length_pre ) ” 
  &&  “ ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0))) ”
  &&  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx (writeidx + data_length_pre ) (sublist (writeidx) ((writeidx + data_length_pre )) (contents)) )
  **  (UCharArray.seg data_buffer (writeidx + data_length_pre ) area_length (sublist ((writeidx + data_length_pre )) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry 0 data_length_pre (sublist (0) (data_length_pre) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry data_length_pre requested (sublist (data_length_pre) (requested) (input_contents)) )
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
).

Definition CircularAreaWrite_entail_wit_3_3_split_goal_1 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx data_length_pre area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre <= (area_length - retval_2 ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH10 : (0 <= retval_2)) (PreH11 : (retval_2 <= area_length)) (PreH12 : (retval = 0)) (PreH13 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH14 : (0 <= retval)) (PreH15 : (retval <= 1)) (PreH16 : (data_length_pre > 0)) (PreH17 : (input_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = circular_area_entry)) (PreH20 : (input_buffer_pre = input_buffer_entry)) (PreH21 : (data_length_pre = requested)) (PreH22 : (b_force_pre = force0)) (PreH23 : (circular_area_pre <> 0)) (PreH24 : (input_buffer_pre <> 0)) (PreH25 : (0 < area_length)) (PreH26 : (area_length <= 256)) (PreH27 : (0 <= readidx)) (PreH28 : (readidx <= 255)) (PreH29 : (readidx < area_length)) (PreH30 : (0 <= writeidx)) (PreH31 : (writeidx <= 255)) (PreH32 : (writeidx < area_length)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : ((Zlength (contents)) = area_length)) (PreH36 : ((Zlength (input_contents)) = requested)) (PreH37 : (retval_3 = 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (CircularAreaDescriptorState readidx writeidx area_length b_status contents ) ”
.

Definition CircularAreaWrite_entail_wit_3_3_split_goal_2 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx data_length_pre area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre <= (area_length - retval_2 ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH10 : (0 <= retval_2)) (PreH11 : (retval_2 <= area_length)) (PreH12 : (retval = 0)) (PreH13 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH14 : (0 <= retval)) (PreH15 : (retval <= 1)) (PreH16 : (data_length_pre > 0)) (PreH17 : (input_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = circular_area_entry)) (PreH20 : (input_buffer_pre = input_buffer_entry)) (PreH21 : (data_length_pre = requested)) (PreH22 : (b_force_pre = force0)) (PreH23 : (circular_area_pre <> 0)) (PreH24 : (input_buffer_pre <> 0)) (PreH25 : (0 < area_length)) (PreH26 : (area_length <= 256)) (PreH27 : (0 <= readidx)) (PreH28 : (readidx <= 255)) (PreH29 : (readidx < area_length)) (PreH30 : (0 <= writeidx)) (PreH31 : (writeidx <= 255)) (PreH32 : (writeidx < area_length)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : ((Zlength (contents)) = area_length)) (PreH36 : ((Zlength (input_contents)) = requested)) (PreH37 : (retval_3 = 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (CircularAreaDivideWrDataResult writeidx data_length_pre area_length 0 ) ”
.

Definition CircularAreaWrite_entail_wit_3_3_split_goal_3 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx data_length_pre area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre <= (area_length - retval_2 ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH10 : (0 <= retval_2)) (PreH11 : (retval_2 <= area_length)) (PreH12 : (retval = 0)) (PreH13 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH14 : (0 <= retval)) (PreH15 : (retval <= 1)) (PreH16 : (data_length_pre > 0)) (PreH17 : (input_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = circular_area_entry)) (PreH20 : (input_buffer_pre = input_buffer_entry)) (PreH21 : (data_length_pre = requested)) (PreH22 : (b_force_pre = force0)) (PreH23 : (circular_area_pre <> 0)) (PreH24 : (input_buffer_pre <> 0)) (PreH25 : (0 < area_length)) (PreH26 : (area_length <= 256)) (PreH27 : (0 <= readidx)) (PreH28 : (readidx <= 255)) (PreH29 : (readidx < area_length)) (PreH30 : (0 <= writeidx)) (PreH31 : (writeidx <= 255)) (PreH32 : (writeidx < area_length)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : ((Zlength (contents)) = area_length)) (PreH36 : ((Zlength (input_contents)) = requested)) (PreH37 : (retval_3 = 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ ((writeidx + data_length_pre ) <= area_length) ”
.

Definition CircularAreaWrite_entail_wit_3_3_split_goal_4 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx data_length_pre area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre <= (area_length - retval_2 ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH10 : (0 <= retval_2)) (PreH11 : (retval_2 <= area_length)) (PreH12 : (retval = 0)) (PreH13 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH14 : (0 <= retval)) (PreH15 : (retval <= 1)) (PreH16 : (data_length_pre > 0)) (PreH17 : (input_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = circular_area_entry)) (PreH20 : (input_buffer_pre = input_buffer_entry)) (PreH21 : (data_length_pre = requested)) (PreH22 : (b_force_pre = force0)) (PreH23 : (circular_area_pre <> 0)) (PreH24 : (input_buffer_pre <> 0)) (PreH25 : (0 < area_length)) (PreH26 : (area_length <= 256)) (PreH27 : (0 <= readidx)) (PreH28 : (readidx <= 255)) (PreH29 : (readidx < area_length)) (PreH30 : (0 <= writeidx)) (PreH31 : (writeidx <= 255)) (PreH32 : (writeidx < area_length)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : ((Zlength (contents)) = area_length)) (PreH36 : ((Zlength (input_contents)) = requested)) (PreH37 : (retval_3 = 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length_pre ) ”
.

Definition CircularAreaWrite_entail_wit_3_3_split_goal_5 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx data_length_pre area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre <= (area_length - retval_2 ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH10 : (0 <= retval_2)) (PreH11 : (retval_2 <= area_length)) (PreH12 : (retval = 0)) (PreH13 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH14 : (0 <= retval)) (PreH15 : (retval <= 1)) (PreH16 : (data_length_pre > 0)) (PreH17 : (input_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = circular_area_entry)) (PreH20 : (input_buffer_pre = input_buffer_entry)) (PreH21 : (data_length_pre = requested)) (PreH22 : (b_force_pre = force0)) (PreH23 : (circular_area_pre <> 0)) (PreH24 : (input_buffer_pre <> 0)) (PreH25 : (0 < area_length)) (PreH26 : (area_length <= 256)) (PreH27 : (0 <= readidx)) (PreH28 : (readidx <= 255)) (PreH29 : (readidx < area_length)) (PreH30 : (0 <= writeidx)) (PreH31 : (writeidx <= 255)) (PreH32 : (writeidx < area_length)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : ((Zlength (contents)) = area_length)) (PreH36 : ((Zlength (input_contents)) = requested)) (PreH37 : (retval_3 = 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0))) ”
.

Definition CircularAreaWrite_entail_wit_3_3_split_goal_spatial := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx data_length_pre area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre <= (area_length - retval_2 ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH10 : (0 <= retval_2)) (PreH11 : (retval_2 <= area_length)) (PreH12 : (retval = 0)) (PreH13 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH14 : (0 <= retval)) (PreH15 : (retval <= 1)) (PreH16 : (data_length_pre > 0)) (PreH17 : (input_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = circular_area_entry)) (PreH20 : (input_buffer_pre = input_buffer_entry)) (PreH21 : (data_length_pre = requested)) (PreH22 : (b_force_pre = force0)) (PreH23 : (circular_area_pre <> 0)) (PreH24 : (input_buffer_pre <> 0)) (PreH25 : (0 < area_length)) (PreH26 : (area_length <= 256)) (PreH27 : (0 <= readidx)) (PreH28 : (readidx <= 255)) (PreH29 : (readidx < area_length)) (PreH30 : (0 <= writeidx)) (PreH31 : (writeidx <= 255)) (PreH32 : (writeidx < area_length)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : ((Zlength (contents)) = area_length)) (PreH36 : ((Zlength (input_contents)) = requested)) (PreH37 : (retval_3 = 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx (writeidx + data_length_pre ) (sublist (writeidx) ((writeidx + data_length_pre )) (contents)) )
  **  (UCharArray.seg data_buffer (writeidx + data_length_pre ) area_length (sublist ((writeidx + data_length_pre )) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry 0 data_length_pre (sublist (0) (data_length_pre) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry data_length_pre requested (sublist (data_length_pre) (requested) (input_contents)) )
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
.

Definition CircularAreaWrite_entail_wit_3_4 := 
(
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval: Z) (retval_3: Z) (PreH1 : (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length retval_3 )) (PreH2 : (0 <= retval_3)) (PreH3 : (retval_3 <= 1)) (PreH4 : (data_length_pre > (area_length - retval ))) (PreH5 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH6 : (0 <= retval)) (PreH7 : (retval <= area_length)) (PreH8 : (retval_2 = 0)) (PreH9 : (CircularAreaIsFullResult readidx writeidx b_status retval_2 )) (PreH10 : (0 <= retval_2)) (PreH11 : (retval_2 <= 1)) (PreH12 : (data_length_pre > 0)) (PreH13 : (input_buffer_pre <> 0)) (PreH14 : (circular_area_pre <> 0)) (PreH15 : (circular_area_pre = circular_area_entry)) (PreH16 : (input_buffer_pre = input_buffer_entry)) (PreH17 : (data_length_pre = requested)) (PreH18 : (b_force_pre = force0)) (PreH19 : (circular_area_pre <> 0)) (PreH20 : (input_buffer_pre <> 0)) (PreH21 : (0 < area_length)) (PreH22 : (area_length <= 256)) (PreH23 : (0 <= readidx)) (PreH24 : (readidx <= 255)) (PreH25 : (readidx < area_length)) (PreH26 : (0 <= writeidx)) (PreH27 : (writeidx <= 255)) (PreH28 : (writeidx < area_length)) (PreH29 : (p_head = data_buffer)) (PreH30 : (p_tail = (data_buffer + area_length ))) (PreH31 : ((Zlength (contents)) = area_length)) (PreH32 : ((Zlength (input_contents)) = requested)) (PreH33 : (retval_3 = 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (circular_area_entry <> 0) ” 
  &&  “ (input_buffer_entry <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0))) ” 
  &&  “ (CircularAreaActualWriteLength readidx writeidx area_length b_status requested (area_length - retval ) ) ” 
  &&  “ ((Zlength (input_contents)) = requested) ” 
  &&  “ (0 <= (area_length - retval )) ” 
  &&  “ ((area_length - retval ) <= requested) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ ((writeidx + (area_length - retval ) ) <= area_length) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length 0 ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status contents ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_entry)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_entry)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx (writeidx + (area_length - retval ) ) (sublist (writeidx) ((writeidx + (area_length - retval ) )) (contents)) )
  **  (UCharArray.seg data_buffer (writeidx + (area_length - retval ) ) area_length (sublist ((writeidx + (area_length - retval ) )) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry 0 (area_length - retval ) (sublist (0) ((area_length - retval )) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry (area_length - retval ) requested (sublist ((area_length - retval )) (requested) (input_contents)) )
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
) \/
(
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre > (area_length - retval ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH10 : (0 <= retval)) (PreH11 : (retval <= area_length)) (PreH12 : (retval_2 = 0)) (PreH13 : (CircularAreaIsFullResult readidx writeidx b_status retval_2 )) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 1)) (PreH16 : (data_length_pre > 0)) (PreH17 : (input_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = circular_area_entry)) (PreH20 : (input_buffer_pre = input_buffer_entry)) (PreH21 : (data_length_pre = requested)) (PreH22 : (b_force_pre = force0)) (PreH23 : (circular_area_pre <> 0)) (PreH24 : (input_buffer_pre <> 0)) (PreH25 : (0 < area_length)) (PreH26 : (area_length <= 256)) (PreH27 : (0 <= readidx)) (PreH28 : (readidx <= 255)) (PreH29 : (readidx < area_length)) (PreH30 : (0 <= writeidx)) (PreH31 : (writeidx <= 255)) (PreH32 : (writeidx < area_length)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : ((Zlength (contents)) = area_length)) (PreH36 : ((Zlength (input_contents)) = requested)) (PreH37 : (retval_3 = 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (CircularAreaDescriptorState readidx writeidx area_length b_status contents ) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length 0 ) ” 
  &&  “ ((writeidx + (area_length - retval ) ) <= area_length) ” 
  &&  “ (CircularAreaActualWriteLength readidx writeidx area_length b_status requested (area_length - retval ) ) ” 
  &&  “ ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0))) ”
  &&  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx (writeidx + (area_length - retval ) ) (sublist (writeidx) ((writeidx + (area_length - retval ) )) (contents)) )
  **  (UCharArray.seg data_buffer (writeidx + (area_length - retval ) ) area_length (sublist ((writeidx + (area_length - retval ) )) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry 0 (area_length - retval ) (sublist (0) ((area_length - retval )) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry (area_length - retval ) requested (sublist ((area_length - retval )) (requested) (input_contents)) )
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
).

Definition CircularAreaWrite_entail_wit_3_4_split_goal_1 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre > (area_length - retval ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH10 : (0 <= retval)) (PreH11 : (retval <= area_length)) (PreH12 : (retval_2 = 0)) (PreH13 : (CircularAreaIsFullResult readidx writeidx b_status retval_2 )) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 1)) (PreH16 : (data_length_pre > 0)) (PreH17 : (input_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = circular_area_entry)) (PreH20 : (input_buffer_pre = input_buffer_entry)) (PreH21 : (data_length_pre = requested)) (PreH22 : (b_force_pre = force0)) (PreH23 : (circular_area_pre <> 0)) (PreH24 : (input_buffer_pre <> 0)) (PreH25 : (0 < area_length)) (PreH26 : (area_length <= 256)) (PreH27 : (0 <= readidx)) (PreH28 : (readidx <= 255)) (PreH29 : (readidx < area_length)) (PreH30 : (0 <= writeidx)) (PreH31 : (writeidx <= 255)) (PreH32 : (writeidx < area_length)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : ((Zlength (contents)) = area_length)) (PreH36 : ((Zlength (input_contents)) = requested)) (PreH37 : (retval_3 = 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (CircularAreaDescriptorState readidx writeidx area_length b_status contents ) ”
.

Definition CircularAreaWrite_entail_wit_3_4_split_goal_2 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre > (area_length - retval ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH10 : (0 <= retval)) (PreH11 : (retval <= area_length)) (PreH12 : (retval_2 = 0)) (PreH13 : (CircularAreaIsFullResult readidx writeidx b_status retval_2 )) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 1)) (PreH16 : (data_length_pre > 0)) (PreH17 : (input_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = circular_area_entry)) (PreH20 : (input_buffer_pre = input_buffer_entry)) (PreH21 : (data_length_pre = requested)) (PreH22 : (b_force_pre = force0)) (PreH23 : (circular_area_pre <> 0)) (PreH24 : (input_buffer_pre <> 0)) (PreH25 : (0 < area_length)) (PreH26 : (area_length <= 256)) (PreH27 : (0 <= readidx)) (PreH28 : (readidx <= 255)) (PreH29 : (readidx < area_length)) (PreH30 : (0 <= writeidx)) (PreH31 : (writeidx <= 255)) (PreH32 : (writeidx < area_length)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : ((Zlength (contents)) = area_length)) (PreH36 : ((Zlength (input_contents)) = requested)) (PreH37 : (retval_3 = 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length 0 ) ”
.

Definition CircularAreaWrite_entail_wit_3_4_split_goal_3 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre > (area_length - retval ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH10 : (0 <= retval)) (PreH11 : (retval <= area_length)) (PreH12 : (retval_2 = 0)) (PreH13 : (CircularAreaIsFullResult readidx writeidx b_status retval_2 )) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 1)) (PreH16 : (data_length_pre > 0)) (PreH17 : (input_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = circular_area_entry)) (PreH20 : (input_buffer_pre = input_buffer_entry)) (PreH21 : (data_length_pre = requested)) (PreH22 : (b_force_pre = force0)) (PreH23 : (circular_area_pre <> 0)) (PreH24 : (input_buffer_pre <> 0)) (PreH25 : (0 < area_length)) (PreH26 : (area_length <= 256)) (PreH27 : (0 <= readidx)) (PreH28 : (readidx <= 255)) (PreH29 : (readidx < area_length)) (PreH30 : (0 <= writeidx)) (PreH31 : (writeidx <= 255)) (PreH32 : (writeidx < area_length)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : ((Zlength (contents)) = area_length)) (PreH36 : ((Zlength (input_contents)) = requested)) (PreH37 : (retval_3 = 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ ((writeidx + (area_length - retval ) ) <= area_length) ”
.

Definition CircularAreaWrite_entail_wit_3_4_split_goal_4 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre > (area_length - retval ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH10 : (0 <= retval)) (PreH11 : (retval <= area_length)) (PreH12 : (retval_2 = 0)) (PreH13 : (CircularAreaIsFullResult readidx writeidx b_status retval_2 )) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 1)) (PreH16 : (data_length_pre > 0)) (PreH17 : (input_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = circular_area_entry)) (PreH20 : (input_buffer_pre = input_buffer_entry)) (PreH21 : (data_length_pre = requested)) (PreH22 : (b_force_pre = force0)) (PreH23 : (circular_area_pre <> 0)) (PreH24 : (input_buffer_pre <> 0)) (PreH25 : (0 < area_length)) (PreH26 : (area_length <= 256)) (PreH27 : (0 <= readidx)) (PreH28 : (readidx <= 255)) (PreH29 : (readidx < area_length)) (PreH30 : (0 <= writeidx)) (PreH31 : (writeidx <= 255)) (PreH32 : (writeidx < area_length)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : ((Zlength (contents)) = area_length)) (PreH36 : ((Zlength (input_contents)) = requested)) (PreH37 : (retval_3 = 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (CircularAreaActualWriteLength readidx writeidx area_length b_status requested (area_length - retval ) ) ”
.

Definition CircularAreaWrite_entail_wit_3_4_split_goal_5 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre > (area_length - retval ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH10 : (0 <= retval)) (PreH11 : (retval <= area_length)) (PreH12 : (retval_2 = 0)) (PreH13 : (CircularAreaIsFullResult readidx writeidx b_status retval_2 )) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 1)) (PreH16 : (data_length_pre > 0)) (PreH17 : (input_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = circular_area_entry)) (PreH20 : (input_buffer_pre = input_buffer_entry)) (PreH21 : (data_length_pre = requested)) (PreH22 : (b_force_pre = force0)) (PreH23 : (circular_area_pre <> 0)) (PreH24 : (input_buffer_pre <> 0)) (PreH25 : (0 < area_length)) (PreH26 : (area_length <= 256)) (PreH27 : (0 <= readidx)) (PreH28 : (readidx <= 255)) (PreH29 : (readidx < area_length)) (PreH30 : (0 <= writeidx)) (PreH31 : (writeidx <= 255)) (PreH32 : (writeidx < area_length)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : ((Zlength (contents)) = area_length)) (PreH36 : ((Zlength (input_contents)) = requested)) (PreH37 : (retval_3 = 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0))) ”
.

Definition CircularAreaWrite_entail_wit_3_4_split_goal_spatial := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval: Z) (retval_3: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (CircularAreaDivideWrDataResult writeidx (area_length - retval ) area_length retval_3 )) (PreH6 : (0 <= retval_3)) (PreH7 : (retval_3 <= 1)) (PreH8 : (data_length_pre > (area_length - retval ))) (PreH9 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH10 : (0 <= retval)) (PreH11 : (retval <= area_length)) (PreH12 : (retval_2 = 0)) (PreH13 : (CircularAreaIsFullResult readidx writeidx b_status retval_2 )) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 1)) (PreH16 : (data_length_pre > 0)) (PreH17 : (input_buffer_pre <> 0)) (PreH18 : (circular_area_pre <> 0)) (PreH19 : (circular_area_pre = circular_area_entry)) (PreH20 : (input_buffer_pre = input_buffer_entry)) (PreH21 : (data_length_pre = requested)) (PreH22 : (b_force_pre = force0)) (PreH23 : (circular_area_pre <> 0)) (PreH24 : (input_buffer_pre <> 0)) (PreH25 : (0 < area_length)) (PreH26 : (area_length <= 256)) (PreH27 : (0 <= readidx)) (PreH28 : (readidx <= 255)) (PreH29 : (readidx < area_length)) (PreH30 : (0 <= writeidx)) (PreH31 : (writeidx <= 255)) (PreH32 : (writeidx < area_length)) (PreH33 : (p_head = data_buffer)) (PreH34 : (p_tail = (data_buffer + area_length ))) (PreH35 : ((Zlength (contents)) = area_length)) (PreH36 : ((Zlength (input_contents)) = requested)) (PreH37 : (retval_3 = 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx (writeidx + (area_length - retval ) ) (sublist (writeidx) ((writeidx + (area_length - retval ) )) (contents)) )
  **  (UCharArray.seg data_buffer (writeidx + (area_length - retval ) ) area_length (sublist ((writeidx + (area_length - retval ) )) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry 0 (area_length - retval ) (sublist (0) ((area_length - retval )) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry (area_length - retval ) requested (sublist ((area_length - retval )) (requested) (input_contents)) )
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
.

Definition CircularAreaWrite_return_wit_1 := 
(
forall (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (write_len_down: Z) (write_len_up: Z) (retval: Z) (PreH1 : (retval = p_head)) (PreH2 : (circular_area_entry <> 0)) (PreH3 : (input_buffer_entry <> 0)) (PreH4 : (requested > 0)) (PreH5 : (0 < area_length)) (PreH6 : ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0)))) (PreH7 : (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length )) (PreH8 : ((Zlength (input_contents)) = requested)) (PreH9 : (0 <= write_len_down)) (PreH10 : (write_len_down <= writeidx)) (PreH11 : (write_len_up = (area_length - writeidx ))) (PreH12 : (write_len_down = (data_length - write_len_up ))) (PreH13 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH14 : (p_head = data_buffer)) (PreH15 : (p_tail = (data_buffer + area_length ))) (PreH16 : (CircularAreaDescriptorState readidx writeidx area_length b_status contents )) (PreH17 : (force0 <> 0)) ,
  (UCharArray.seg data_buffer 0 write_len_down (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx area_length (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> (unsigned_last_nbits (write_len_down) (8)))
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> (unsigned_last_nbits (write_len_down) (8)))
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 1)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  EX (contents_after: (@list Z))  (readidx_after: Z)  (writeidx_after: Z)  (status_after: Z) ,
  “ (circular_area_entry <> 0) ” 
  &&  “ (input_buffer_entry <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0))) ” 
  &&  “ (CircularAreaWriteSuccess readidx writeidx area_length b_status requested force0 input_contents contents contents_after readidx_after writeidx_after status_after 0 ) ”
  &&  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_after)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_after)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> status_after)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents_after )
  **  (UCharArray.full input_buffer_entry requested input_contents )
  **  (GlobalStrings LitMap )
) \/
(
forall (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (write_len_down: Z) (write_len_up: Z) (retval: Z) (PreH1 : (retval = p_head)) (PreH2 : (circular_area_entry <> 0)) (PreH3 : (input_buffer_entry <> 0)) (PreH4 : (requested > 0)) (PreH5 : (0 < area_length)) (PreH6 : ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0)))) (PreH7 : (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length )) (PreH8 : ((Zlength (input_contents)) = requested)) (PreH9 : (0 <= write_len_down)) (PreH10 : (write_len_down <= writeidx)) (PreH11 : (write_len_up = (area_length - writeidx ))) (PreH12 : (write_len_down = (data_length - write_len_up ))) (PreH13 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH14 : (p_head = data_buffer)) (PreH15 : (p_tail = (data_buffer + area_length ))) (PreH16 : (CircularAreaDescriptorState readidx writeidx area_length b_status contents )) (PreH17 : (force0 <> 0)) ,
  (UCharArray.seg data_buffer 0 write_len_down (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx area_length (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  (GlobalStrings LitMap )
|--
  EX (contents_after: (@list Z)) ,
  “ (circular_area_entry <> 0) ” 
  &&  “ (input_buffer_entry <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0))) ” 
  &&  “ (CircularAreaWriteSuccess readidx writeidx area_length b_status requested force0 input_contents contents contents_after (unsigned_last_nbits (write_len_down) (8)) (unsigned_last_nbits (write_len_down) (8)) 1 0 ) ”
  &&  (UCharArray.full data_buffer area_length contents_after )
  **  (UCharArray.full input_buffer_entry requested input_contents )
  **  (GlobalStrings LitMap )
).

Definition CircularAreaWrite_return_wit_2 := 
(
forall (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (retval: Z) (PreH1 : (retval = (data_buffer + (writeidx * sizeof(UCHAR))))) (PreH2 : (circular_area_entry <> 0)) (PreH3 : (input_buffer_entry <> 0)) (PreH4 : (requested > 0)) (PreH5 : (0 < area_length)) (PreH6 : ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0)))) (PreH7 : (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length )) (PreH8 : ((Zlength (input_contents)) = requested)) (PreH9 : (0 <= data_length)) (PreH10 : (data_length <= requested)) (PreH11 : (0 <= writeidx)) (PreH12 : ((writeidx + data_length ) <= area_length)) (PreH13 : (CircularAreaDivideWrDataResult writeidx data_length area_length 0 )) (PreH14 : (p_head = data_buffer)) (PreH15 : (p_tail = (data_buffer + area_length ))) (PreH16 : (CircularAreaDescriptorState readidx writeidx area_length b_status contents )) (PreH17 : (force0 <> 0)) ,
  (UCharArray.seg data_buffer writeidx (writeidx + data_length ) (sublist (0) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer (writeidx + data_length ) area_length (sublist ((writeidx + data_length )) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> (unsigned_last_nbits (((writeidx + data_length ) % ( area_length ) )) (8)))
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> (unsigned_last_nbits (((writeidx + data_length ) % ( area_length ) )) (8)))
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 1)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  EX (contents_after: (@list Z))  (readidx_after: Z)  (writeidx_after: Z)  (status_after: Z) ,
  “ (circular_area_entry <> 0) ” 
  &&  “ (input_buffer_entry <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0))) ” 
  &&  “ (CircularAreaWriteSuccess readidx writeidx area_length b_status requested force0 input_contents contents contents_after readidx_after writeidx_after status_after 0 ) ”
  &&  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_after)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_after)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> status_after)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents_after )
  **  (UCharArray.full input_buffer_entry requested input_contents )
  **  (GlobalStrings LitMap )
) \/
(
forall (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (retval: Z) (PreH1 : (retval = (data_buffer + (writeidx * sizeof(UCHAR))))) (PreH2 : (circular_area_entry <> 0)) (PreH3 : (input_buffer_entry <> 0)) (PreH4 : (requested > 0)) (PreH5 : (0 < area_length)) (PreH6 : ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0)))) (PreH7 : (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length )) (PreH8 : ((Zlength (input_contents)) = requested)) (PreH9 : (0 <= data_length)) (PreH10 : (data_length <= requested)) (PreH11 : (0 <= writeidx)) (PreH12 : ((writeidx + data_length ) <= area_length)) (PreH13 : (CircularAreaDivideWrDataResult writeidx data_length area_length 0 )) (PreH14 : (p_head = data_buffer)) (PreH15 : (p_tail = (data_buffer + area_length ))) (PreH16 : (CircularAreaDescriptorState readidx writeidx area_length b_status contents )) (PreH17 : (force0 <> 0)) ,
  (UCharArray.seg data_buffer writeidx (writeidx + data_length ) (sublist (0) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer (writeidx + data_length ) area_length (sublist ((writeidx + data_length )) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  (GlobalStrings LitMap )
|--
  EX (contents_after: (@list Z)) ,
  “ (circular_area_entry <> 0) ” 
  &&  “ (input_buffer_entry <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0))) ” 
  &&  “ (CircularAreaWriteSuccess readidx writeidx area_length b_status requested force0 input_contents contents contents_after (unsigned_last_nbits (((writeidx + data_length ) % ( area_length ) )) (8)) (unsigned_last_nbits (((writeidx + data_length ) % ( area_length ) )) (8)) 1 0 ) ”
  &&  (UCharArray.full data_buffer area_length contents_after )
  **  (UCharArray.full input_buffer_entry requested input_contents )
  **  (GlobalStrings LitMap )
).

Definition CircularAreaWrite_return_wit_3 := 
(
forall (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (write_len_down: Z) (write_len_up: Z) (retval: Z) (PreH1 : (retval = p_head)) (PreH2 : (circular_area_entry <> 0)) (PreH3 : (input_buffer_entry <> 0)) (PreH4 : (requested > 0)) (PreH5 : (0 < area_length)) (PreH6 : ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0)))) (PreH7 : (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length )) (PreH8 : ((Zlength (input_contents)) = requested)) (PreH9 : (0 <= write_len_down)) (PreH10 : (write_len_down <= writeidx)) (PreH11 : (write_len_up = (area_length - writeidx ))) (PreH12 : (write_len_down = (data_length - write_len_up ))) (PreH13 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH14 : (p_head = data_buffer)) (PreH15 : (p_tail = (data_buffer + area_length ))) (PreH16 : (CircularAreaDescriptorState readidx writeidx area_length b_status contents )) (PreH17 : (force0 = 0)) ,
  (UCharArray.seg data_buffer 0 write_len_down (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx area_length (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> (unsigned_last_nbits (write_len_down) (8)))
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 1)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  EX (contents_after: (@list Z))  (readidx_after: Z)  (writeidx_after: Z)  (status_after: Z) ,
  “ (circular_area_entry <> 0) ” 
  &&  “ (input_buffer_entry <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0))) ” 
  &&  “ (CircularAreaWriteSuccess readidx writeidx area_length b_status requested force0 input_contents contents contents_after readidx_after writeidx_after status_after 0 ) ”
  &&  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_after)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_after)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> status_after)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents_after )
  **  (UCharArray.full input_buffer_entry requested input_contents )
  **  (GlobalStrings LitMap )
) \/
(
forall (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (write_len_down: Z) (write_len_up: Z) (retval: Z) (PreH1 : (retval = p_head)) (PreH2 : (circular_area_entry <> 0)) (PreH3 : (input_buffer_entry <> 0)) (PreH4 : (requested > 0)) (PreH5 : (0 < area_length)) (PreH6 : ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0)))) (PreH7 : (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length )) (PreH8 : ((Zlength (input_contents)) = requested)) (PreH9 : (0 <= write_len_down)) (PreH10 : (write_len_down <= writeidx)) (PreH11 : (write_len_up = (area_length - writeidx ))) (PreH12 : (write_len_down = (data_length - write_len_up ))) (PreH13 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH14 : (p_head = data_buffer)) (PreH15 : (p_tail = (data_buffer + area_length ))) (PreH16 : (CircularAreaDescriptorState readidx writeidx area_length b_status contents )) (PreH17 : (force0 = 0)) ,
  (UCharArray.seg data_buffer 0 write_len_down (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx area_length (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  (GlobalStrings LitMap )
|--
  EX (contents_after: (@list Z)) ,
  “ (circular_area_entry <> 0) ” 
  &&  “ (input_buffer_entry <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0))) ” 
  &&  “ (CircularAreaWriteSuccess readidx writeidx area_length b_status requested force0 input_contents contents contents_after readidx (unsigned_last_nbits (write_len_down) (8)) 1 0 ) ”
  &&  (UCharArray.full data_buffer area_length contents_after )
  **  (UCharArray.full input_buffer_entry requested input_contents )
  **  (GlobalStrings LitMap )
).

Definition CircularAreaWrite_return_wit_4 := 
(
forall (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (retval: Z) (PreH1 : (retval = (data_buffer + (writeidx * sizeof(UCHAR))))) (PreH2 : (circular_area_entry <> 0)) (PreH3 : (input_buffer_entry <> 0)) (PreH4 : (requested > 0)) (PreH5 : (0 < area_length)) (PreH6 : ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0)))) (PreH7 : (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length )) (PreH8 : ((Zlength (input_contents)) = requested)) (PreH9 : (0 <= data_length)) (PreH10 : (data_length <= requested)) (PreH11 : (0 <= writeidx)) (PreH12 : ((writeidx + data_length ) <= area_length)) (PreH13 : (CircularAreaDivideWrDataResult writeidx data_length area_length 0 )) (PreH14 : (p_head = data_buffer)) (PreH15 : (p_tail = (data_buffer + area_length ))) (PreH16 : (CircularAreaDescriptorState readidx writeidx area_length b_status contents )) (PreH17 : (force0 = 0)) ,
  (UCharArray.seg data_buffer writeidx (writeidx + data_length ) (sublist (0) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer (writeidx + data_length ) area_length (sublist ((writeidx + data_length )) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> (unsigned_last_nbits (((writeidx + data_length ) % ( area_length ) )) (8)))
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 1)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  EX (contents_after: (@list Z))  (readidx_after: Z)  (writeidx_after: Z)  (status_after: Z) ,
  “ (circular_area_entry <> 0) ” 
  &&  “ (input_buffer_entry <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0))) ” 
  &&  “ (CircularAreaWriteSuccess readidx writeidx area_length b_status requested force0 input_contents contents contents_after readidx_after writeidx_after status_after 0 ) ”
  &&  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_after)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_after)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> status_after)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents_after )
  **  (UCharArray.full input_buffer_entry requested input_contents )
  **  (GlobalStrings LitMap )
) \/
(
forall (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (retval: Z) (PreH1 : (retval = (data_buffer + (writeidx * sizeof(UCHAR))))) (PreH2 : (circular_area_entry <> 0)) (PreH3 : (input_buffer_entry <> 0)) (PreH4 : (requested > 0)) (PreH5 : (0 < area_length)) (PreH6 : ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0)))) (PreH7 : (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length )) (PreH8 : ((Zlength (input_contents)) = requested)) (PreH9 : (0 <= data_length)) (PreH10 : (data_length <= requested)) (PreH11 : (0 <= writeidx)) (PreH12 : ((writeidx + data_length ) <= area_length)) (PreH13 : (CircularAreaDivideWrDataResult writeidx data_length area_length 0 )) (PreH14 : (p_head = data_buffer)) (PreH15 : (p_tail = (data_buffer + area_length ))) (PreH16 : (CircularAreaDescriptorState readidx writeidx area_length b_status contents )) (PreH17 : (force0 = 0)) ,
  (UCharArray.seg data_buffer writeidx (writeidx + data_length ) (sublist (0) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer (writeidx + data_length ) area_length (sublist ((writeidx + data_length )) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  (GlobalStrings LitMap )
|--
  EX (contents_after: (@list Z)) ,
  “ (circular_area_entry <> 0) ” 
  &&  “ (input_buffer_entry <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0))) ” 
  &&  “ (CircularAreaWriteSuccess readidx writeidx area_length b_status requested force0 input_contents contents contents_after readidx (unsigned_last_nbits (((writeidx + data_length ) % ( area_length ) )) (8)) 1 0 ) ”
  &&  (UCharArray.full data_buffer area_length contents_after )
  **  (UCharArray.full input_buffer_entry requested input_contents )
  **  (GlobalStrings LitMap )
).

Definition CircularAreaWrite_return_wit_5 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (PreH1 : (b_force_pre = 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH4 : (0 <= retval)) (PreH5 : (retval <= 1)) (PreH6 : (data_length_pre > 0)) (PreH7 : (input_buffer_pre <> 0)) (PreH8 : (circular_area_pre <> 0)) (PreH9 : (circular_area_pre = circular_area_entry)) (PreH10 : (input_buffer_pre = input_buffer_entry)) (PreH11 : (data_length_pre = requested)) (PreH12 : (b_force_pre = force0)) (PreH13 : (circular_area_pre <> 0)) (PreH14 : (input_buffer_pre <> 0)) (PreH15 : (0 < area_length)) (PreH16 : (area_length <= 256)) (PreH17 : (0 <= readidx)) (PreH18 : (readidx <= 255)) (PreH19 : (readidx < area_length)) (PreH20 : (0 <= writeidx)) (PreH21 : (writeidx <= 255)) (PreH22 : (writeidx < area_length)) (PreH23 : (p_head = data_buffer)) (PreH24 : (p_tail = (data_buffer + area_length ))) (PreH25 : ((Zlength (contents)) = area_length)) (PreH26 : ((Zlength (input_contents)) = requested)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  (“ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (readidx = writeidx) ” 
  &&  “ (b_status <> 0) ” 
  &&  “ (force0 = 0) ” 
  &&  “ (1 = 1) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
  **  (UCharArray.full input_buffer_pre requested input_contents )
  **  (GlobalStrings LitMap ))
  ||
  (EX (contents_after: (@list Z))  (readidx_after: Z)  (writeidx_after: Z)  (status_after: Z) ,
  “ (circular_area_entry <> 0) ” 
  &&  “ (input_buffer_entry <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0))) ” 
  &&  “ (CircularAreaWriteSuccess readidx writeidx area_length b_status requested force0 input_contents contents contents_after readidx_after writeidx_after status_after 1 ) ”
  &&  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_after)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_after)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> status_after)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents_after )
  **  (UCharArray.full input_buffer_entry requested input_contents )
  **  (GlobalStrings LitMap ))
.

Definition CircularAreaWrite_return_wit_6 := 
(
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (data_length_pre <= 0)) (PreH2 : (input_buffer_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre = circular_area_entry)) (PreH5 : (input_buffer_pre = input_buffer_entry)) (PreH6 : (data_length_pre = requested)) (PreH7 : (b_force_pre = force0)) (PreH8 : (circular_area_pre <> 0)) (PreH9 : (input_buffer_pre <> 0)) (PreH10 : (0 < area_length)) (PreH11 : (area_length <= 256)) (PreH12 : (0 <= readidx)) (PreH13 : (readidx <= 255)) (PreH14 : (readidx < area_length)) (PreH15 : (0 <= writeidx)) (PreH16 : (writeidx <= 255)) (PreH17 : (writeidx < area_length)) (PreH18 : (p_head = data_buffer)) (PreH19 : (p_tail = (data_buffer + area_length ))) (PreH20 : ((Zlength (contents)) = area_length)) (PreH21 : ((Zlength (input_contents)) = requested)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
  **  (UCharArray.full input_buffer_pre requested input_contents )
  **  (GlobalStrings LitMap )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ (requested = 0) ” 
  &&  “ (1 = 1) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
  **  (UCharArray.full input_buffer_pre requested input_contents )
  **  (GlobalStrings LitMap )
) \/
(
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (LitMap: (string -> Z)) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (data_length_pre <= 0)) (PreH2 : (input_buffer_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre = circular_area_entry)) (PreH5 : (input_buffer_pre = input_buffer_entry)) (PreH6 : (data_length_pre = requested)) (PreH7 : (b_force_pre = force0)) (PreH8 : (circular_area_pre <> 0)) (PreH9 : (input_buffer_pre <> 0)) (PreH10 : (0 < area_length)) (PreH11 : (area_length <= 256)) (PreH12 : (0 <= readidx)) (PreH13 : (readidx <= 255)) (PreH14 : (readidx < area_length)) (PreH15 : (0 <= writeidx)) (PreH16 : (writeidx <= 255)) (PreH17 : (writeidx < area_length)) (PreH18 : (p_head = data_buffer)) (PreH19 : (p_tail = (data_buffer + area_length ))) (PreH20 : ((Zlength (contents)) = area_length)) (PreH21 : ((Zlength (input_contents)) = requested)) ,
  (GlobalStrings LitMap )
|--
  “ (requested = 0) ”
  &&  (GlobalStrings LitMap )
).

Definition CircularAreaWrite_return_wit_6_split_goal_1 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (LitMap: (string -> Z)) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (data_length_pre <= 0)) (PreH2 : (input_buffer_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre = circular_area_entry)) (PreH5 : (input_buffer_pre = input_buffer_entry)) (PreH6 : (data_length_pre = requested)) (PreH7 : (b_force_pre = force0)) (PreH8 : (circular_area_pre <> 0)) (PreH9 : (input_buffer_pre <> 0)) (PreH10 : (0 < area_length)) (PreH11 : (area_length <= 256)) (PreH12 : (0 <= readidx)) (PreH13 : (readidx <= 255)) (PreH14 : (readidx < area_length)) (PreH15 : (0 <= writeidx)) (PreH16 : (writeidx <= 255)) (PreH17 : (writeidx < area_length)) (PreH18 : (p_head = data_buffer)) (PreH19 : (p_tail = (data_buffer + area_length ))) (PreH20 : ((Zlength (contents)) = area_length)) (PreH21 : ((Zlength (input_contents)) = requested)) ,
  (GlobalStrings LitMap )
|--
  “ (requested = 0) ”
.

Definition CircularAreaWrite_return_wit_6_split_goal_spatial := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (LitMap: (string -> Z)) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (data_length_pre <= 0)) (PreH2 : (input_buffer_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre = circular_area_entry)) (PreH5 : (input_buffer_pre = input_buffer_entry)) (PreH6 : (data_length_pre = requested)) (PreH7 : (b_force_pre = force0)) (PreH8 : (circular_area_pre <> 0)) (PreH9 : (input_buffer_pre <> 0)) (PreH10 : (0 < area_length)) (PreH11 : (area_length <= 256)) (PreH12 : (0 <= readidx)) (PreH13 : (readidx <= 255)) (PreH14 : (readidx < area_length)) (PreH15 : (0 <= writeidx)) (PreH16 : (writeidx <= 255)) (PreH17 : (writeidx < area_length)) (PreH18 : (p_head = data_buffer)) (PreH19 : (p_tail = (data_buffer + area_length ))) (PreH20 : ((Zlength (contents)) = area_length)) (PreH21 : ((Zlength (input_contents)) = requested)) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
.

Definition CircularAreaWrite_return_wit_7 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (input_buffer_pre = 0)) (PreH2 : (circular_area_pre <> 0)) (PreH3 : (circular_area_pre = circular_area_entry)) (PreH4 : (input_buffer_pre = input_buffer_entry)) (PreH5 : (data_length_pre = requested)) (PreH6 : (b_force_pre = force0)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (input_buffer_pre = 0)) (PreH9 : (0 < area_length)) (PreH10 : (area_length <= 256)) (PreH11 : (0 <= readidx)) (PreH12 : (readidx <= 255)) (PreH13 : (readidx < area_length)) (PreH14 : (0 <= writeidx)) (PreH15 : (writeidx <= 255)) (PreH16 : (writeidx < area_length)) (PreH17 : (p_head = data_buffer)) (PreH18 : (p_tail = (data_buffer + area_length ))) (PreH19 : ((Zlength (contents)) = area_length)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre = 0) ” 
  &&  “ (1 = 1) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
.

Definition CircularAreaWrite_return_wit_8 := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = circular_area_entry)) (PreH3 : (input_buffer_pre = input_buffer_entry)) (PreH4 : (data_length_pre = requested)) (PreH5 : (b_force_pre = force0)) (PreH6 : (circular_area_pre = 0)) ,
  TT && emp 
|--
  “ (circular_area_pre = 0) ” 
  &&  “ (1 = 1) ”
  &&  emp
.

Definition CircularAreaWrite_partial_solve_wit_1_pure := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (data_length_pre > 0)) (PreH2 : (input_buffer_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre = circular_area_entry)) (PreH5 : (input_buffer_pre = input_buffer_entry)) (PreH6 : (data_length_pre = requested)) (PreH7 : (b_force_pre = force0)) (PreH8 : (circular_area_pre <> 0)) (PreH9 : (input_buffer_pre <> 0)) (PreH10 : (0 < area_length)) (PreH11 : (area_length <= 256)) (PreH12 : (0 <= readidx)) (PreH13 : (readidx <= 255)) (PreH14 : (readidx < area_length)) (PreH15 : (0 <= writeidx)) (PreH16 : (writeidx <= 255)) (PreH17 : (writeidx < area_length)) (PreH18 : (p_head = data_buffer)) (PreH19 : (p_tail = (data_buffer + area_length ))) (PreH20 : ((Zlength (contents)) = area_length)) (PreH21 : ((Zlength (input_contents)) = requested)) ,
  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
  **  (UCharArray.full input_buffer_pre requested input_contents )
  **  (GlobalStrings LitMap )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ (area_length <= 256) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (readidx <= 255) ” 
  &&  “ (readidx < area_length) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ (writeidx <= 255) ” 
  &&  “ (writeidx < area_length) ” 
  &&  “ (p_head = p_head) ” 
  &&  “ ((p_head + area_length ) = (p_head + area_length )) ” 
  &&  “ ((Zlength (contents)) = area_length) ”
.

Definition CircularAreaWrite_partial_solve_wit_1_aux := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (data_length_pre > 0)) (PreH2 : (input_buffer_pre <> 0)) (PreH3 : (circular_area_pre <> 0)) (PreH4 : (circular_area_pre = circular_area_entry)) (PreH5 : (input_buffer_pre = input_buffer_entry)) (PreH6 : (data_length_pre = requested)) (PreH7 : (b_force_pre = force0)) (PreH8 : (circular_area_pre <> 0)) (PreH9 : (input_buffer_pre <> 0)) (PreH10 : (0 < area_length)) (PreH11 : (area_length <= 256)) (PreH12 : (0 <= readidx)) (PreH13 : (readidx <= 255)) (PreH14 : (readidx < area_length)) (PreH15 : (0 <= writeidx)) (PreH16 : (writeidx <= 255)) (PreH17 : (writeidx < area_length)) (PreH18 : (p_head = data_buffer)) (PreH19 : (p_tail = (data_buffer + area_length ))) (PreH20 : ((Zlength (contents)) = area_length)) (PreH21 : ((Zlength (input_contents)) = requested)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
  **  (UCharArray.full input_buffer_pre requested input_contents )
  **  (GlobalStrings LitMap )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ (area_length <= 256) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (readidx <= 255) ” 
  &&  “ (readidx < area_length) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ (writeidx <= 255) ” 
  &&  “ (writeidx < area_length) ” 
  &&  “ (p_head = p_head) ” 
  &&  “ ((p_head + area_length ) = (p_head + area_length )) ” 
  &&  “ ((Zlength (contents)) = area_length) ” 
  &&  “ (data_length_pre > 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre = circular_area_entry) ” 
  &&  “ (input_buffer_pre = input_buffer_entry) ” 
  &&  “ (data_length_pre = requested) ” 
  &&  “ (b_force_pre = force0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ (area_length <= 256) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (readidx <= 255) ” 
  &&  “ (readidx < area_length) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ (writeidx <= 255) ” 
  &&  “ (writeidx < area_length) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ ((Zlength (contents)) = area_length) ” 
  &&  “ ((Zlength (input_contents)) = requested) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
.

Definition CircularAreaWrite_partial_solve_wit_1 := CircularAreaWrite_partial_solve_wit_1_pure -> CircularAreaWrite_partial_solve_wit_1_aux.

Definition CircularAreaWrite_partial_solve_wit_2_pure := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH3 : (0 <= retval)) (PreH4 : (retval <= 1)) (PreH5 : (data_length_pre > 0)) (PreH6 : (input_buffer_pre <> 0)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (circular_area_pre = circular_area_entry)) (PreH9 : (input_buffer_pre = input_buffer_entry)) (PreH10 : (data_length_pre = requested)) (PreH11 : (b_force_pre = force0)) (PreH12 : (circular_area_pre <> 0)) (PreH13 : (input_buffer_pre <> 0)) (PreH14 : (0 < area_length)) (PreH15 : (area_length <= 256)) (PreH16 : (0 <= readidx)) (PreH17 : (readidx <= 255)) (PreH18 : (readidx < area_length)) (PreH19 : (0 <= writeidx)) (PreH20 : (writeidx <= 255)) (PreH21 : (writeidx < area_length)) (PreH22 : (p_head = data_buffer)) (PreH23 : (p_tail = (data_buffer + area_length ))) (PreH24 : ((Zlength (contents)) = area_length)) (PreH25 : ((Zlength (input_contents)) = requested)) ,
  ((( &( "write_data_length" ) )) # UInt  |->_)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ (area_length <= 256) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (readidx <= 255) ” 
  &&  “ (readidx < area_length) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ (writeidx <= 255) ” 
  &&  “ (writeidx < area_length) ” 
  &&  “ (p_head = p_head) ” 
  &&  “ ((p_head + area_length ) = (p_head + area_length )) ” 
  &&  “ ((Zlength (contents)) = area_length) ”
.

Definition CircularAreaWrite_partial_solve_wit_2_aux := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH3 : (0 <= retval)) (PreH4 : (retval <= 1)) (PreH5 : (data_length_pre > 0)) (PreH6 : (input_buffer_pre <> 0)) (PreH7 : (circular_area_pre <> 0)) (PreH8 : (circular_area_pre = circular_area_entry)) (PreH9 : (input_buffer_pre = input_buffer_entry)) (PreH10 : (data_length_pre = requested)) (PreH11 : (b_force_pre = force0)) (PreH12 : (circular_area_pre <> 0)) (PreH13 : (input_buffer_pre <> 0)) (PreH14 : (0 < area_length)) (PreH15 : (area_length <= 256)) (PreH16 : (0 <= readidx)) (PreH17 : (readidx <= 255)) (PreH18 : (readidx < area_length)) (PreH19 : (0 <= writeidx)) (PreH20 : (writeidx <= 255)) (PreH21 : (writeidx < area_length)) (PreH22 : (p_head = data_buffer)) (PreH23 : (p_tail = (data_buffer + area_length ))) (PreH24 : ((Zlength (contents)) = area_length)) (PreH25 : ((Zlength (input_contents)) = requested)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ (area_length <= 256) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (readidx <= 255) ” 
  &&  “ (readidx < area_length) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ (writeidx <= 255) ” 
  &&  “ (writeidx < area_length) ” 
  &&  “ (p_head = p_head) ” 
  &&  “ ((p_head + area_length ) = (p_head + area_length )) ” 
  &&  “ ((Zlength (contents)) = area_length) ” 
  &&  “ (retval = 0) ” 
  &&  “ (CircularAreaIsFullResult readidx writeidx b_status retval ) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 1) ” 
  &&  “ (data_length_pre > 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre = circular_area_entry) ” 
  &&  “ (input_buffer_pre = input_buffer_entry) ” 
  &&  “ (data_length_pre = requested) ” 
  &&  “ (b_force_pre = force0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ (area_length <= 256) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (readidx <= 255) ” 
  &&  “ (readidx < area_length) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ (writeidx <= 255) ” 
  &&  “ (writeidx < area_length) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ ((Zlength (contents)) = area_length) ” 
  &&  “ ((Zlength (input_contents)) = requested) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
.

Definition CircularAreaWrite_partial_solve_wit_2 := CircularAreaWrite_partial_solve_wit_2_pure -> CircularAreaWrite_partial_solve_wit_2_aux.

Definition CircularAreaWrite_partial_solve_wit_3_pure := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (PreH1 : (b_force_pre <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH4 : (0 <= retval)) (PreH5 : (retval <= 1)) (PreH6 : (data_length_pre > 0)) (PreH7 : (input_buffer_pre <> 0)) (PreH8 : (circular_area_pre <> 0)) (PreH9 : (circular_area_pre = circular_area_entry)) (PreH10 : (input_buffer_pre = input_buffer_entry)) (PreH11 : (data_length_pre = requested)) (PreH12 : (b_force_pre = force0)) (PreH13 : (circular_area_pre <> 0)) (PreH14 : (input_buffer_pre <> 0)) (PreH15 : (0 < area_length)) (PreH16 : (area_length <= 256)) (PreH17 : (0 <= readidx)) (PreH18 : (readidx <= 255)) (PreH19 : (readidx < area_length)) (PreH20 : (0 <= writeidx)) (PreH21 : (writeidx <= 255)) (PreH22 : (writeidx < area_length)) (PreH23 : (p_head = data_buffer)) (PreH24 : (p_tail = (data_buffer + area_length ))) (PreH25 : ((Zlength (contents)) = area_length)) (PreH26 : ((Zlength (input_contents)) = requested)) ,
  ((( &( "write_data_length" ) )) # UInt  |->_)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ (area_length <= 256) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (readidx <= 255) ” 
  &&  “ (readidx < area_length) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ (writeidx <= 255) ” 
  &&  “ (writeidx < area_length) ” 
  &&  “ (p_head = p_head) ” 
  &&  “ ((p_head + area_length ) = (p_head + area_length )) ” 
  &&  “ ((Zlength (contents)) = area_length) ”
.

Definition CircularAreaWrite_partial_solve_wit_3_aux := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (PreH1 : (b_force_pre <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH4 : (0 <= retval)) (PreH5 : (retval <= 1)) (PreH6 : (data_length_pre > 0)) (PreH7 : (input_buffer_pre <> 0)) (PreH8 : (circular_area_pre <> 0)) (PreH9 : (circular_area_pre = circular_area_entry)) (PreH10 : (input_buffer_pre = input_buffer_entry)) (PreH11 : (data_length_pre = requested)) (PreH12 : (b_force_pre = force0)) (PreH13 : (circular_area_pre <> 0)) (PreH14 : (input_buffer_pre <> 0)) (PreH15 : (0 < area_length)) (PreH16 : (area_length <= 256)) (PreH17 : (0 <= readidx)) (PreH18 : (readidx <= 255)) (PreH19 : (readidx < area_length)) (PreH20 : (0 <= writeidx)) (PreH21 : (writeidx <= 255)) (PreH22 : (writeidx < area_length)) (PreH23 : (p_head = data_buffer)) (PreH24 : (p_tail = (data_buffer + area_length ))) (PreH25 : ((Zlength (contents)) = area_length)) (PreH26 : ((Zlength (input_contents)) = requested)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ (area_length <= 256) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (readidx <= 255) ” 
  &&  “ (readidx < area_length) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ (writeidx <= 255) ” 
  &&  “ (writeidx < area_length) ” 
  &&  “ (p_head = p_head) ” 
  &&  “ ((p_head + area_length ) = (p_head + area_length )) ” 
  &&  “ ((Zlength (contents)) = area_length) ” 
  &&  “ (b_force_pre <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (CircularAreaIsFullResult readidx writeidx b_status retval ) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 1) ” 
  &&  “ (data_length_pre > 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre = circular_area_entry) ” 
  &&  “ (input_buffer_pre = input_buffer_entry) ” 
  &&  “ (data_length_pre = requested) ” 
  &&  “ (b_force_pre = force0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ (area_length <= 256) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (readidx <= 255) ” 
  &&  “ (readidx < area_length) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ (writeidx <= 255) ” 
  &&  “ (writeidx < area_length) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ ((Zlength (contents)) = area_length) ” 
  &&  “ ((Zlength (input_contents)) = requested) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
.

Definition CircularAreaWrite_partial_solve_wit_3 := CircularAreaWrite_partial_solve_wit_3_pure -> CircularAreaWrite_partial_solve_wit_3_aux.

Definition CircularAreaWrite_partial_solve_wit_4_pure := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval: Z) (PreH1 : (data_length_pre > (area_length - retval ))) (PreH2 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH3 : (0 <= retval)) (PreH4 : (retval <= area_length)) (PreH5 : (retval_2 = 0)) (PreH6 : (CircularAreaIsFullResult readidx writeidx b_status retval_2 )) (PreH7 : (0 <= retval_2)) (PreH8 : (retval_2 <= 1)) (PreH9 : (data_length_pre > 0)) (PreH10 : (input_buffer_pre <> 0)) (PreH11 : (circular_area_pre <> 0)) (PreH12 : (circular_area_pre = circular_area_entry)) (PreH13 : (input_buffer_pre = input_buffer_entry)) (PreH14 : (data_length_pre = requested)) (PreH15 : (b_force_pre = force0)) (PreH16 : (circular_area_pre <> 0)) (PreH17 : (input_buffer_pre <> 0)) (PreH18 : (0 < area_length)) (PreH19 : (area_length <= 256)) (PreH20 : (0 <= readidx)) (PreH21 : (readidx <= 255)) (PreH22 : (readidx < area_length)) (PreH23 : (0 <= writeidx)) (PreH24 : (writeidx <= 255)) (PreH25 : (writeidx < area_length)) (PreH26 : (p_head = data_buffer)) (PreH27 : (p_tail = (data_buffer + area_length ))) (PreH28 : ((Zlength (contents)) = area_length)) (PreH29 : ((Zlength (input_contents)) = requested)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  ((( &( "write_data_length" ) )) # UInt  |-> (area_length - retval ))
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> (area_length - retval ))
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ (area_length <= 256) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (readidx <= 255) ” 
  &&  “ (readidx < area_length) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ (writeidx <= 255) ” 
  &&  “ (writeidx < area_length) ” 
  &&  “ (p_head = p_head) ” 
  &&  “ ((p_head + area_length ) = (p_head + area_length )) ” 
  &&  “ ((Zlength (contents)) = area_length) ” 
  &&  “ (0 <= (area_length - retval )) ” 
  &&  “ ((area_length - retval ) <= area_length) ” 
  &&  “ ((writeidx + (area_length - retval ) ) <= 4294967295) ”
.

Definition CircularAreaWrite_partial_solve_wit_4_aux := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval: Z) (PreH1 : (data_length_pre > (area_length - retval ))) (PreH2 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH3 : (0 <= retval)) (PreH4 : (retval <= area_length)) (PreH5 : (retval_2 = 0)) (PreH6 : (CircularAreaIsFullResult readidx writeidx b_status retval_2 )) (PreH7 : (0 <= retval_2)) (PreH8 : (retval_2 <= 1)) (PreH9 : (data_length_pre > 0)) (PreH10 : (input_buffer_pre <> 0)) (PreH11 : (circular_area_pre <> 0)) (PreH12 : (circular_area_pre = circular_area_entry)) (PreH13 : (input_buffer_pre = input_buffer_entry)) (PreH14 : (data_length_pre = requested)) (PreH15 : (b_force_pre = force0)) (PreH16 : (circular_area_pre <> 0)) (PreH17 : (input_buffer_pre <> 0)) (PreH18 : (0 < area_length)) (PreH19 : (area_length <= 256)) (PreH20 : (0 <= readidx)) (PreH21 : (readidx <= 255)) (PreH22 : (readidx < area_length)) (PreH23 : (0 <= writeidx)) (PreH24 : (writeidx <= 255)) (PreH25 : (writeidx < area_length)) (PreH26 : (p_head = data_buffer)) (PreH27 : (p_tail = (data_buffer + area_length ))) (PreH28 : ((Zlength (contents)) = area_length)) (PreH29 : ((Zlength (input_contents)) = requested)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ (area_length <= 256) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (readidx <= 255) ” 
  &&  “ (readidx < area_length) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ (writeidx <= 255) ” 
  &&  “ (writeidx < area_length) ” 
  &&  “ (p_head = p_head) ” 
  &&  “ ((p_head + area_length ) = (p_head + area_length )) ” 
  &&  “ ((Zlength (contents)) = area_length) ” 
  &&  “ (0 <= (area_length - retval )) ” 
  &&  “ ((area_length - retval ) <= area_length) ” 
  &&  “ ((writeidx + (area_length - retval ) ) <= 4294967295) ” 
  &&  “ (data_length_pre > (area_length - retval )) ” 
  &&  “ (CircularAreaDataLengthResult readidx writeidx area_length b_status retval ) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= area_length) ” 
  &&  “ (retval_2 = 0) ” 
  &&  “ (CircularAreaIsFullResult readidx writeidx b_status retval_2 ) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 1) ” 
  &&  “ (data_length_pre > 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre = circular_area_entry) ” 
  &&  “ (input_buffer_pre = input_buffer_entry) ” 
  &&  “ (data_length_pre = requested) ” 
  &&  “ (b_force_pre = force0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ (area_length <= 256) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (readidx <= 255) ” 
  &&  “ (readidx < area_length) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ (writeidx <= 255) ” 
  &&  “ (writeidx < area_length) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ ((Zlength (contents)) = area_length) ” 
  &&  “ ((Zlength (input_contents)) = requested) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
.

Definition CircularAreaWrite_partial_solve_wit_4 := CircularAreaWrite_partial_solve_wit_4_pure -> CircularAreaWrite_partial_solve_wit_4_aux.

Definition CircularAreaWrite_partial_solve_wit_5_pure := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (PreH1 : (data_length_pre <= (area_length - retval_2 ))) (PreH2 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH3 : (0 <= retval_2)) (PreH4 : (retval_2 <= area_length)) (PreH5 : (retval = 0)) (PreH6 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH7 : (0 <= retval)) (PreH8 : (retval <= 1)) (PreH9 : (data_length_pre > 0)) (PreH10 : (input_buffer_pre <> 0)) (PreH11 : (circular_area_pre <> 0)) (PreH12 : (circular_area_pre = circular_area_entry)) (PreH13 : (input_buffer_pre = input_buffer_entry)) (PreH14 : (data_length_pre = requested)) (PreH15 : (b_force_pre = force0)) (PreH16 : (circular_area_pre <> 0)) (PreH17 : (input_buffer_pre <> 0)) (PreH18 : (0 < area_length)) (PreH19 : (area_length <= 256)) (PreH20 : (0 <= readidx)) (PreH21 : (readidx <= 255)) (PreH22 : (readidx < area_length)) (PreH23 : (0 <= writeidx)) (PreH24 : (writeidx <= 255)) (PreH25 : (writeidx < area_length)) (PreH26 : (p_head = data_buffer)) (PreH27 : (p_tail = (data_buffer + area_length ))) (PreH28 : ((Zlength (contents)) = area_length)) (PreH29 : ((Zlength (input_contents)) = requested)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  ((( &( "write_data_length" ) )) # UInt  |-> (area_length - retval_2 ))
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ (area_length <= 256) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (readidx <= 255) ” 
  &&  “ (readidx < area_length) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ (writeidx <= 255) ” 
  &&  “ (writeidx < area_length) ” 
  &&  “ (p_head = p_head) ” 
  &&  “ ((p_head + area_length ) = (p_head + area_length )) ” 
  &&  “ ((Zlength (contents)) = area_length) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= area_length) ” 
  &&  “ ((writeidx + data_length_pre ) <= 4294967295) ”
.

Definition CircularAreaWrite_partial_solve_wit_5_aux := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (PreH1 : (data_length_pre <= (area_length - retval_2 ))) (PreH2 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH3 : (0 <= retval_2)) (PreH4 : (retval_2 <= area_length)) (PreH5 : (retval = 0)) (PreH6 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH7 : (0 <= retval)) (PreH8 : (retval <= 1)) (PreH9 : (data_length_pre > 0)) (PreH10 : (input_buffer_pre <> 0)) (PreH11 : (circular_area_pre <> 0)) (PreH12 : (circular_area_pre = circular_area_entry)) (PreH13 : (input_buffer_pre = input_buffer_entry)) (PreH14 : (data_length_pre = requested)) (PreH15 : (b_force_pre = force0)) (PreH16 : (circular_area_pre <> 0)) (PreH17 : (input_buffer_pre <> 0)) (PreH18 : (0 < area_length)) (PreH19 : (area_length <= 256)) (PreH20 : (0 <= readidx)) (PreH21 : (readidx <= 255)) (PreH22 : (readidx < area_length)) (PreH23 : (0 <= writeidx)) (PreH24 : (writeidx <= 255)) (PreH25 : (writeidx < area_length)) (PreH26 : (p_head = data_buffer)) (PreH27 : (p_tail = (data_buffer + area_length ))) (PreH28 : ((Zlength (contents)) = area_length)) (PreH29 : ((Zlength (input_contents)) = requested)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ (area_length <= 256) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (readidx <= 255) ” 
  &&  “ (readidx < area_length) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ (writeidx <= 255) ” 
  &&  “ (writeidx < area_length) ” 
  &&  “ (p_head = p_head) ” 
  &&  “ ((p_head + area_length ) = (p_head + area_length )) ” 
  &&  “ ((Zlength (contents)) = area_length) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= area_length) ” 
  &&  “ ((writeidx + data_length_pre ) <= 4294967295) ” 
  &&  “ (data_length_pre <= (area_length - retval_2 )) ” 
  &&  “ (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 ) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= area_length) ” 
  &&  “ (retval = 0) ” 
  &&  “ (CircularAreaIsFullResult readidx writeidx b_status retval ) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 1) ” 
  &&  “ (data_length_pre > 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre = circular_area_entry) ” 
  &&  “ (input_buffer_pre = input_buffer_entry) ” 
  &&  “ (data_length_pre = requested) ” 
  &&  “ (b_force_pre = force0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ (area_length <= 256) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (readidx <= 255) ” 
  &&  “ (readidx < area_length) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ (writeidx <= 255) ” 
  &&  “ (writeidx < area_length) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ ((Zlength (contents)) = area_length) ” 
  &&  “ ((Zlength (input_contents)) = requested) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
.

Definition CircularAreaWrite_partial_solve_wit_5 := CircularAreaWrite_partial_solve_wit_5_pure -> CircularAreaWrite_partial_solve_wit_5_aux.

Definition CircularAreaWrite_partial_solve_wit_6_pure := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval: Z) (PreH1 : (data_length_pre > (area_length - retval ))) (PreH2 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH3 : (0 <= retval)) (PreH4 : (retval <= area_length)) (PreH5 : (b_force_pre <> 0)) (PreH6 : (retval_2 <> 0)) (PreH7 : (CircularAreaIsFullResult readidx writeidx b_status retval_2 )) (PreH8 : (0 <= retval_2)) (PreH9 : (retval_2 <= 1)) (PreH10 : (data_length_pre > 0)) (PreH11 : (input_buffer_pre <> 0)) (PreH12 : (circular_area_pre <> 0)) (PreH13 : (circular_area_pre = circular_area_entry)) (PreH14 : (input_buffer_pre = input_buffer_entry)) (PreH15 : (data_length_pre = requested)) (PreH16 : (b_force_pre = force0)) (PreH17 : (circular_area_pre <> 0)) (PreH18 : (input_buffer_pre <> 0)) (PreH19 : (0 < area_length)) (PreH20 : (area_length <= 256)) (PreH21 : (0 <= readidx)) (PreH22 : (readidx <= 255)) (PreH23 : (readidx < area_length)) (PreH24 : (0 <= writeidx)) (PreH25 : (writeidx <= 255)) (PreH26 : (writeidx < area_length)) (PreH27 : (p_head = data_buffer)) (PreH28 : (p_tail = (data_buffer + area_length ))) (PreH29 : ((Zlength (contents)) = area_length)) (PreH30 : ((Zlength (input_contents)) = requested)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  ((( &( "write_data_length" ) )) # UInt  |-> (area_length - retval ))
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> (area_length - retval ))
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ (area_length <= 256) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (readidx <= 255) ” 
  &&  “ (readidx < area_length) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ (writeidx <= 255) ” 
  &&  “ (writeidx < area_length) ” 
  &&  “ (p_head = p_head) ” 
  &&  “ ((p_head + area_length ) = (p_head + area_length )) ” 
  &&  “ ((Zlength (contents)) = area_length) ” 
  &&  “ (0 <= (area_length - retval )) ” 
  &&  “ ((area_length - retval ) <= area_length) ” 
  &&  “ ((writeidx + (area_length - retval ) ) <= 4294967295) ”
.

Definition CircularAreaWrite_partial_solve_wit_6_aux := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval_2: Z) (retval: Z) (PreH1 : (data_length_pre > (area_length - retval ))) (PreH2 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval )) (PreH3 : (0 <= retval)) (PreH4 : (retval <= area_length)) (PreH5 : (b_force_pre <> 0)) (PreH6 : (retval_2 <> 0)) (PreH7 : (CircularAreaIsFullResult readidx writeidx b_status retval_2 )) (PreH8 : (0 <= retval_2)) (PreH9 : (retval_2 <= 1)) (PreH10 : (data_length_pre > 0)) (PreH11 : (input_buffer_pre <> 0)) (PreH12 : (circular_area_pre <> 0)) (PreH13 : (circular_area_pre = circular_area_entry)) (PreH14 : (input_buffer_pre = input_buffer_entry)) (PreH15 : (data_length_pre = requested)) (PreH16 : (b_force_pre = force0)) (PreH17 : (circular_area_pre <> 0)) (PreH18 : (input_buffer_pre <> 0)) (PreH19 : (0 < area_length)) (PreH20 : (area_length <= 256)) (PreH21 : (0 <= readidx)) (PreH22 : (readidx <= 255)) (PreH23 : (readidx < area_length)) (PreH24 : (0 <= writeidx)) (PreH25 : (writeidx <= 255)) (PreH26 : (writeidx < area_length)) (PreH27 : (p_head = data_buffer)) (PreH28 : (p_tail = (data_buffer + area_length ))) (PreH29 : ((Zlength (contents)) = area_length)) (PreH30 : ((Zlength (input_contents)) = requested)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ (area_length <= 256) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (readidx <= 255) ” 
  &&  “ (readidx < area_length) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ (writeidx <= 255) ” 
  &&  “ (writeidx < area_length) ” 
  &&  “ (p_head = p_head) ” 
  &&  “ ((p_head + area_length ) = (p_head + area_length )) ” 
  &&  “ ((Zlength (contents)) = area_length) ” 
  &&  “ (0 <= (area_length - retval )) ” 
  &&  “ ((area_length - retval ) <= area_length) ” 
  &&  “ ((writeidx + (area_length - retval ) ) <= 4294967295) ” 
  &&  “ (data_length_pre > (area_length - retval )) ” 
  &&  “ (CircularAreaDataLengthResult readidx writeidx area_length b_status retval ) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= area_length) ” 
  &&  “ (b_force_pre <> 0) ” 
  &&  “ (retval_2 <> 0) ” 
  &&  “ (CircularAreaIsFullResult readidx writeidx b_status retval_2 ) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 1) ” 
  &&  “ (data_length_pre > 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre = circular_area_entry) ” 
  &&  “ (input_buffer_pre = input_buffer_entry) ” 
  &&  “ (data_length_pre = requested) ” 
  &&  “ (b_force_pre = force0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ (area_length <= 256) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (readidx <= 255) ” 
  &&  “ (readidx < area_length) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ (writeidx <= 255) ” 
  &&  “ (writeidx < area_length) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ ((Zlength (contents)) = area_length) ” 
  &&  “ ((Zlength (input_contents)) = requested) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
.

Definition CircularAreaWrite_partial_solve_wit_6 := CircularAreaWrite_partial_solve_wit_6_pure -> CircularAreaWrite_partial_solve_wit_6_aux.

Definition CircularAreaWrite_partial_solve_wit_7_pure := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (PreH1 : (data_length_pre <= (area_length - retval_2 ))) (PreH2 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH3 : (0 <= retval_2)) (PreH4 : (retval_2 <= area_length)) (PreH5 : (b_force_pre <> 0)) (PreH6 : (retval <> 0)) (PreH7 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH8 : (0 <= retval)) (PreH9 : (retval <= 1)) (PreH10 : (data_length_pre > 0)) (PreH11 : (input_buffer_pre <> 0)) (PreH12 : (circular_area_pre <> 0)) (PreH13 : (circular_area_pre = circular_area_entry)) (PreH14 : (input_buffer_pre = input_buffer_entry)) (PreH15 : (data_length_pre = requested)) (PreH16 : (b_force_pre = force0)) (PreH17 : (circular_area_pre <> 0)) (PreH18 : (input_buffer_pre <> 0)) (PreH19 : (0 < area_length)) (PreH20 : (area_length <= 256)) (PreH21 : (0 <= readidx)) (PreH22 : (readidx <= 255)) (PreH23 : (readidx < area_length)) (PreH24 : (0 <= writeidx)) (PreH25 : (writeidx <= 255)) (PreH26 : (writeidx < area_length)) (PreH27 : (p_head = data_buffer)) (PreH28 : (p_tail = (data_buffer + area_length ))) (PreH29 : ((Zlength (contents)) = area_length)) (PreH30 : ((Zlength (input_contents)) = requested)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  ((( &( "write_data_length" ) )) # UInt  |-> (area_length - retval_2 ))
  **  ((( &( "b_force" ) )) # Int  |-> b_force_pre)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ (area_length <= 256) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (readidx <= 255) ” 
  &&  “ (readidx < area_length) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ (writeidx <= 255) ” 
  &&  “ (writeidx < area_length) ” 
  &&  “ (p_head = p_head) ” 
  &&  “ ((p_head + area_length ) = (p_head + area_length )) ” 
  &&  “ ((Zlength (contents)) = area_length) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= area_length) ” 
  &&  “ ((writeidx + data_length_pre ) <= 4294967295) ”
.

Definition CircularAreaWrite_partial_solve_wit_7_aux := 
forall (b_force_pre: Z) (data_length_pre: Z) (input_buffer_pre: Z) (circular_area_pre: Z) (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (retval: Z) (retval_2: Z) (PreH1 : (data_length_pre <= (area_length - retval_2 ))) (PreH2 : (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 )) (PreH3 : (0 <= retval_2)) (PreH4 : (retval_2 <= area_length)) (PreH5 : (b_force_pre <> 0)) (PreH6 : (retval <> 0)) (PreH7 : (CircularAreaIsFullResult readidx writeidx b_status retval )) (PreH8 : (0 <= retval)) (PreH9 : (retval <= 1)) (PreH10 : (data_length_pre > 0)) (PreH11 : (input_buffer_pre <> 0)) (PreH12 : (circular_area_pre <> 0)) (PreH13 : (circular_area_pre = circular_area_entry)) (PreH14 : (input_buffer_pre = input_buffer_entry)) (PreH15 : (data_length_pre = requested)) (PreH16 : (b_force_pre = force0)) (PreH17 : (circular_area_pre <> 0)) (PreH18 : (input_buffer_pre <> 0)) (PreH19 : (0 < area_length)) (PreH20 : (area_length <= 256)) (PreH21 : (0 <= readidx)) (PreH22 : (readidx <= 255)) (PreH23 : (readidx < area_length)) (PreH24 : (0 <= writeidx)) (PreH25 : (writeidx <= 255)) (PreH26 : (writeidx < area_length)) (PreH27 : (p_head = data_buffer)) (PreH28 : (p_tail = (data_buffer + area_length ))) (PreH29 : ((Zlength (contents)) = area_length)) (PreH30 : ((Zlength (input_contents)) = requested)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
|--
  “ (circular_area_pre <> 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ (area_length <= 256) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (readidx <= 255) ” 
  &&  “ (readidx < area_length) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ (writeidx <= 255) ” 
  &&  “ (writeidx < area_length) ” 
  &&  “ (p_head = p_head) ” 
  &&  “ ((p_head + area_length ) = (p_head + area_length )) ” 
  &&  “ ((Zlength (contents)) = area_length) ” 
  &&  “ (0 <= data_length_pre) ” 
  &&  “ (data_length_pre <= area_length) ” 
  &&  “ ((writeidx + data_length_pre ) <= 4294967295) ” 
  &&  “ (data_length_pre <= (area_length - retval_2 )) ” 
  &&  “ (CircularAreaDataLengthResult readidx writeidx area_length b_status retval_2 ) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= area_length) ” 
  &&  “ (b_force_pre <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (CircularAreaIsFullResult readidx writeidx b_status retval ) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 1) ” 
  &&  “ (data_length_pre > 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (circular_area_pre = circular_area_entry) ” 
  &&  “ (input_buffer_pre = input_buffer_entry) ” 
  &&  “ (data_length_pre = requested) ” 
  &&  “ (b_force_pre = force0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (input_buffer_pre <> 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ (area_length <= 256) ” 
  &&  “ (0 <= readidx) ” 
  &&  “ (readidx <= 255) ” 
  &&  “ (readidx < area_length) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ (writeidx <= 255) ” 
  &&  “ (writeidx < area_length) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ ((Zlength (contents)) = area_length) ” 
  &&  “ ((Zlength (input_contents)) = requested) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (p_head + area_length ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full p_head area_length contents )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre requested input_contents )
.

Definition CircularAreaWrite_partial_solve_wit_7 := CircularAreaWrite_partial_solve_wit_7_pure -> CircularAreaWrite_partial_solve_wit_7_aux.

Definition CircularAreaWrite_partial_solve_wit_8_pure := 
(
forall (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (write_len_up: Z) (write_len_down: Z) (write_data_length_addr_v: Z) (PreH1 : (circular_area_entry <> 0)) (PreH2 : (input_buffer_entry <> 0)) (PreH3 : (requested > 0)) (PreH4 : (0 < area_length)) (PreH5 : ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0)))) (PreH6 : (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length )) (PreH7 : ((Zlength (input_contents)) = requested)) (PreH8 : (0 <= data_length)) (PreH9 : (data_length <= requested)) (PreH10 : (0 <= writeidx)) (PreH11 : (writeidx < area_length)) (PreH12 : (write_len_up = (area_length - writeidx ))) (PreH13 : (write_len_down = (data_length - write_len_up ))) (PreH14 : (write_len_up <= data_length)) (PreH15 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH16 : (p_head = data_buffer)) (PreH17 : (p_tail = (data_buffer + area_length ))) (PreH18 : (CircularAreaDescriptorState readidx writeidx area_length b_status contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_entry)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_entry)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "write_len_up" ) )) # UInt  |-> write_len_up)
  **  ((( &( "write_len_down" ) )) # UInt  |-> write_len_down)
  **  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx area_length (sublist (writeidx) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry write_len_up requested (sublist (write_len_up) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((data_buffer + (writeidx * sizeof(UCHAR))) = (data_buffer + writeidx )) ” 
  &&  “ (input_buffer_entry = (input_buffer_entry + 0 )) ” 
  &&  “ (write_len_up = (area_length - writeidx )) ” 
  &&  “ (write_len_up = (write_len_up - 0 )) ” 
  &&  “ ((Zlength ((sublist (0) (write_len_up) (input_contents)))) = (write_len_up - 0 )) ” 
  &&  “ ((Zlength ((sublist (writeidx) (area_length) (contents)))) = (area_length - writeidx )) ”
) \/
(
forall (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (write_len_up: Z) (write_len_down: Z) (write_data_length_addr_v: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (write_data_length_addr_v <= UINT_MAX)) (PreH3 : (write_len_down <= UINT_MAX)) (PreH4 : (write_len_up <= UINT_MAX)) (PreH5 : (data_length <= UINT_MAX)) (PreH6 : (area_length >= 0)) (PreH7 : (write_data_length_addr_v >= 0)) (PreH8 : (write_len_down >= 0)) (PreH9 : (write_len_up >= 0)) (PreH10 : (data_length >= 0)) (PreH11 : (b_status <= INT_MAX)) (PreH12 : (force0 <= INT_MAX)) (PreH13 : (b_status >= INT_MIN)) (PreH14 : (force0 >= INT_MIN)) (PreH15 : (circular_area_entry <> 0)) (PreH16 : (input_buffer_entry <> 0)) (PreH17 : (requested > 0)) (PreH18 : (0 < area_length)) (PreH19 : ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0)))) (PreH20 : (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length )) (PreH21 : ((Zlength (input_contents)) = requested)) (PreH22 : (0 <= data_length)) (PreH23 : (data_length <= requested)) (PreH24 : (0 <= writeidx)) (PreH25 : (writeidx < area_length)) (PreH26 : (write_len_up = (area_length - writeidx ))) (PreH27 : (write_len_down = (data_length - write_len_up ))) (PreH28 : (write_len_up <= data_length)) (PreH29 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH30 : (p_head = data_buffer)) (PreH31 : (p_tail = (data_buffer + area_length ))) (PreH32 : (CircularAreaDescriptorState readidx writeidx area_length b_status contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_entry)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_entry)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "write_len_up" ) )) # UInt  |-> write_len_up)
  **  ((( &( "write_len_down" ) )) # UInt  |-> write_len_down)
  **  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx area_length (sublist (writeidx) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry write_len_up requested (sublist (write_len_up) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((Zlength ((sublist (writeidx) (area_length) (contents)))) = (area_length - writeidx )) ” 
  &&  “ ((Zlength ((sublist (0) (write_len_up) (input_contents)))) = (write_len_up - 0 )) ”
).

Definition CircularAreaWrite_partial_solve_wit_8_pure_split_goal_1 := 
forall (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (write_len_up: Z) (write_len_down: Z) (write_data_length_addr_v: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (write_data_length_addr_v <= UINT_MAX)) (PreH3 : (write_len_down <= UINT_MAX)) (PreH4 : (write_len_up <= UINT_MAX)) (PreH5 : (data_length <= UINT_MAX)) (PreH6 : (area_length >= 0)) (PreH7 : (write_data_length_addr_v >= 0)) (PreH8 : (write_len_down >= 0)) (PreH9 : (write_len_up >= 0)) (PreH10 : (data_length >= 0)) (PreH11 : (b_status <= INT_MAX)) (PreH12 : (force0 <= INT_MAX)) (PreH13 : (b_status >= INT_MIN)) (PreH14 : (force0 >= INT_MIN)) (PreH15 : (circular_area_entry <> 0)) (PreH16 : (input_buffer_entry <> 0)) (PreH17 : (requested > 0)) (PreH18 : (0 < area_length)) (PreH19 : ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0)))) (PreH20 : (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length )) (PreH21 : ((Zlength (input_contents)) = requested)) (PreH22 : (0 <= data_length)) (PreH23 : (data_length <= requested)) (PreH24 : (0 <= writeidx)) (PreH25 : (writeidx < area_length)) (PreH26 : (write_len_up = (area_length - writeidx ))) (PreH27 : (write_len_down = (data_length - write_len_up ))) (PreH28 : (write_len_up <= data_length)) (PreH29 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH30 : (p_head = data_buffer)) (PreH31 : (p_tail = (data_buffer + area_length ))) (PreH32 : (CircularAreaDescriptorState readidx writeidx area_length b_status contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_entry)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_entry)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "write_len_up" ) )) # UInt  |-> write_len_up)
  **  ((( &( "write_len_down" ) )) # UInt  |-> write_len_down)
  **  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx area_length (sublist (writeidx) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry write_len_up requested (sublist (write_len_up) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((Zlength ((sublist (writeidx) (area_length) (contents)))) = (area_length - writeidx )) ”
.

Definition CircularAreaWrite_partial_solve_wit_8_pure_split_goal_2 := 
forall (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (write_len_up: Z) (write_len_down: Z) (write_data_length_addr_v: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (write_data_length_addr_v <= UINT_MAX)) (PreH3 : (write_len_down <= UINT_MAX)) (PreH4 : (write_len_up <= UINT_MAX)) (PreH5 : (data_length <= UINT_MAX)) (PreH6 : (area_length >= 0)) (PreH7 : (write_data_length_addr_v >= 0)) (PreH8 : (write_len_down >= 0)) (PreH9 : (write_len_up >= 0)) (PreH10 : (data_length >= 0)) (PreH11 : (b_status <= INT_MAX)) (PreH12 : (force0 <= INT_MAX)) (PreH13 : (b_status >= INT_MIN)) (PreH14 : (force0 >= INT_MIN)) (PreH15 : (circular_area_entry <> 0)) (PreH16 : (input_buffer_entry <> 0)) (PreH17 : (requested > 0)) (PreH18 : (0 < area_length)) (PreH19 : ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0)))) (PreH20 : (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length )) (PreH21 : ((Zlength (input_contents)) = requested)) (PreH22 : (0 <= data_length)) (PreH23 : (data_length <= requested)) (PreH24 : (0 <= writeidx)) (PreH25 : (writeidx < area_length)) (PreH26 : (write_len_up = (area_length - writeidx ))) (PreH27 : (write_len_down = (data_length - write_len_up ))) (PreH28 : (write_len_up <= data_length)) (PreH29 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH30 : (p_head = data_buffer)) (PreH31 : (p_tail = (data_buffer + area_length ))) (PreH32 : (CircularAreaDescriptorState readidx writeidx area_length b_status contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_entry)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_entry)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "write_len_up" ) )) # UInt  |-> write_len_up)
  **  ((( &( "write_len_down" ) )) # UInt  |-> write_len_down)
  **  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx area_length (sublist (writeidx) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry write_len_up requested (sublist (write_len_up) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((Zlength ((sublist (0) (write_len_up) (input_contents)))) = (write_len_up - 0 )) ”
.

Definition CircularAreaWrite_partial_solve_wit_8_aux := 
forall (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (write_len_up: Z) (write_len_down: Z) (PreH1 : (circular_area_entry <> 0)) (PreH2 : (input_buffer_entry <> 0)) (PreH3 : (requested > 0)) (PreH4 : (0 < area_length)) (PreH5 : ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0)))) (PreH6 : (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length )) (PreH7 : ((Zlength (input_contents)) = requested)) (PreH8 : (0 <= data_length)) (PreH9 : (data_length <= requested)) (PreH10 : (0 <= writeidx)) (PreH11 : (writeidx < area_length)) (PreH12 : (write_len_up = (area_length - writeidx ))) (PreH13 : (write_len_down = (data_length - write_len_up ))) (PreH14 : (write_len_up <= data_length)) (PreH15 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH16 : (p_head = data_buffer)) (PreH17 : (p_tail = (data_buffer + area_length ))) (PreH18 : (CircularAreaDescriptorState readidx writeidx area_length b_status contents )) ,
  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx area_length (sublist (writeidx) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry write_len_up requested (sublist (write_len_up) (requested) (input_contents)) )
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((data_buffer + (writeidx * sizeof(UCHAR))) = (data_buffer + writeidx )) ” 
  &&  “ (input_buffer_entry = (input_buffer_entry + 0 )) ” 
  &&  “ (write_len_up = (area_length - writeidx )) ” 
  &&  “ (write_len_up = (write_len_up - 0 )) ” 
  &&  “ ((Zlength ((sublist (0) (write_len_up) (input_contents)))) = (write_len_up - 0 )) ” 
  &&  “ ((Zlength ((sublist (writeidx) (area_length) (contents)))) = (area_length - writeidx )) ” 
  &&  “ (circular_area_entry <> 0) ” 
  &&  “ (input_buffer_entry <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0))) ” 
  &&  “ (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length ) ” 
  &&  “ ((Zlength (input_contents)) = requested) ” 
  &&  “ (0 <= data_length) ” 
  &&  “ (data_length <= requested) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ (writeidx < area_length) ” 
  &&  “ (write_len_up = (area_length - writeidx )) ” 
  &&  “ (write_len_down = (data_length - write_len_up )) ” 
  &&  “ (write_len_up <= data_length) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx data_length area_length 1 ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status contents ) ”
  &&  (UCharArray.seg data_buffer writeidx area_length (sublist (writeidx) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg input_buffer_entry write_len_up requested (sublist (write_len_up) (requested) (input_contents)) )
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
.

Definition CircularAreaWrite_partial_solve_wit_8 := CircularAreaWrite_partial_solve_wit_8_pure -> CircularAreaWrite_partial_solve_wit_8_aux.

Definition CircularAreaWrite_partial_solve_wit_9_pure := 
(
forall (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (write_len_down: Z) (write_len_up: Z) (write_data_length_addr_v: Z) (PreH1 : (circular_area_entry <> 0)) (PreH2 : (input_buffer_entry <> 0)) (PreH3 : (requested > 0)) (PreH4 : (0 < area_length)) (PreH5 : ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0)))) (PreH6 : (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length )) (PreH7 : ((Zlength (input_contents)) = requested)) (PreH8 : (0 <= write_len_down)) (PreH9 : (write_len_down <= writeidx)) (PreH10 : (write_len_up = (area_length - writeidx ))) (PreH11 : (write_len_down = (data_length - write_len_up ))) (PreH12 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH13 : (p_head = data_buffer)) (PreH14 : (p_tail = (data_buffer + area_length ))) (PreH15 : (CircularAreaDescriptorState readidx writeidx area_length b_status contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_entry)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_entry)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "write_len_down" ) )) # UInt  |-> write_len_down)
  **  ((( &( "write_len_up" ) )) # UInt  |-> write_len_up)
  **  (UCharArray.seg data_buffer 0 write_len_down (sublist (0) (write_len_down) (contents)) )
  **  (UCharArray.seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx area_length (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ (p_head = (data_buffer + 0 )) ” 
  &&  “ ((input_buffer_entry + (write_len_up * sizeof(UCHAR))) = (input_buffer_entry + write_len_up )) ” 
  &&  “ (write_len_down = (write_len_down - 0 )) ” 
  &&  “ (write_len_down = (data_length - write_len_up )) ” 
  &&  “ ((Zlength ((sublist (write_len_up) (data_length) (input_contents)))) = (data_length - write_len_up )) ” 
  &&  “ ((Zlength ((sublist (0) (write_len_down) (contents)))) = (write_len_down - 0 )) ”
) \/
(
forall (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (write_len_down: Z) (write_len_up: Z) (write_data_length_addr_v: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (write_data_length_addr_v <= UINT_MAX)) (PreH3 : (write_len_up <= UINT_MAX)) (PreH4 : (write_len_down <= UINT_MAX)) (PreH5 : (data_length <= UINT_MAX)) (PreH6 : (area_length >= 0)) (PreH7 : (write_data_length_addr_v >= 0)) (PreH8 : (write_len_up >= 0)) (PreH9 : (write_len_down >= 0)) (PreH10 : (data_length >= 0)) (PreH11 : (b_status <= INT_MAX)) (PreH12 : (force0 <= INT_MAX)) (PreH13 : (b_status >= INT_MIN)) (PreH14 : (force0 >= INT_MIN)) (PreH15 : (circular_area_entry <> 0)) (PreH16 : (input_buffer_entry <> 0)) (PreH17 : (requested > 0)) (PreH18 : (0 < area_length)) (PreH19 : ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0)))) (PreH20 : (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length )) (PreH21 : ((Zlength (input_contents)) = requested)) (PreH22 : (0 <= write_len_down)) (PreH23 : (write_len_down <= writeidx)) (PreH24 : (write_len_up = (area_length - writeidx ))) (PreH25 : (write_len_down = (data_length - write_len_up ))) (PreH26 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH27 : (p_head = data_buffer)) (PreH28 : (p_tail = (data_buffer + area_length ))) (PreH29 : (CircularAreaDescriptorState readidx writeidx area_length b_status contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_entry)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_entry)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "write_len_down" ) )) # UInt  |-> write_len_down)
  **  ((( &( "write_len_up" ) )) # UInt  |-> write_len_up)
  **  (UCharArray.seg data_buffer 0 write_len_down (sublist (0) (write_len_down) (contents)) )
  **  (UCharArray.seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx area_length (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((Zlength ((sublist (0) (write_len_down) (contents)))) = (write_len_down - 0 )) ” 
  &&  “ ((Zlength ((sublist (write_len_up) (data_length) (input_contents)))) = (data_length - write_len_up )) ”
).

Definition CircularAreaWrite_partial_solve_wit_9_pure_split_goal_1 := 
forall (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (write_len_down: Z) (write_len_up: Z) (write_data_length_addr_v: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (write_data_length_addr_v <= UINT_MAX)) (PreH3 : (write_len_up <= UINT_MAX)) (PreH4 : (write_len_down <= UINT_MAX)) (PreH5 : (data_length <= UINT_MAX)) (PreH6 : (area_length >= 0)) (PreH7 : (write_data_length_addr_v >= 0)) (PreH8 : (write_len_up >= 0)) (PreH9 : (write_len_down >= 0)) (PreH10 : (data_length >= 0)) (PreH11 : (b_status <= INT_MAX)) (PreH12 : (force0 <= INT_MAX)) (PreH13 : (b_status >= INT_MIN)) (PreH14 : (force0 >= INT_MIN)) (PreH15 : (circular_area_entry <> 0)) (PreH16 : (input_buffer_entry <> 0)) (PreH17 : (requested > 0)) (PreH18 : (0 < area_length)) (PreH19 : ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0)))) (PreH20 : (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length )) (PreH21 : ((Zlength (input_contents)) = requested)) (PreH22 : (0 <= write_len_down)) (PreH23 : (write_len_down <= writeidx)) (PreH24 : (write_len_up = (area_length - writeidx ))) (PreH25 : (write_len_down = (data_length - write_len_up ))) (PreH26 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH27 : (p_head = data_buffer)) (PreH28 : (p_tail = (data_buffer + area_length ))) (PreH29 : (CircularAreaDescriptorState readidx writeidx area_length b_status contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_entry)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_entry)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "write_len_down" ) )) # UInt  |-> write_len_down)
  **  ((( &( "write_len_up" ) )) # UInt  |-> write_len_up)
  **  (UCharArray.seg data_buffer 0 write_len_down (sublist (0) (write_len_down) (contents)) )
  **  (UCharArray.seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx area_length (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((Zlength ((sublist (0) (write_len_down) (contents)))) = (write_len_down - 0 )) ”
.

Definition CircularAreaWrite_partial_solve_wit_9_pure_split_goal_2 := 
forall (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (write_len_down: Z) (write_len_up: Z) (write_data_length_addr_v: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (write_data_length_addr_v <= UINT_MAX)) (PreH3 : (write_len_up <= UINT_MAX)) (PreH4 : (write_len_down <= UINT_MAX)) (PreH5 : (data_length <= UINT_MAX)) (PreH6 : (area_length >= 0)) (PreH7 : (write_data_length_addr_v >= 0)) (PreH8 : (write_len_up >= 0)) (PreH9 : (write_len_down >= 0)) (PreH10 : (data_length >= 0)) (PreH11 : (b_status <= INT_MAX)) (PreH12 : (force0 <= INT_MAX)) (PreH13 : (b_status >= INT_MIN)) (PreH14 : (force0 >= INT_MIN)) (PreH15 : (circular_area_entry <> 0)) (PreH16 : (input_buffer_entry <> 0)) (PreH17 : (requested > 0)) (PreH18 : (0 < area_length)) (PreH19 : ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0)))) (PreH20 : (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length )) (PreH21 : ((Zlength (input_contents)) = requested)) (PreH22 : (0 <= write_len_down)) (PreH23 : (write_len_down <= writeidx)) (PreH24 : (write_len_up = (area_length - writeidx ))) (PreH25 : (write_len_down = (data_length - write_len_up ))) (PreH26 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH27 : (p_head = data_buffer)) (PreH28 : (p_tail = (data_buffer + area_length ))) (PreH29 : (CircularAreaDescriptorState readidx writeidx area_length b_status contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_entry)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_entry)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  ((( &( "write_len_down" ) )) # UInt  |-> write_len_down)
  **  ((( &( "write_len_up" ) )) # UInt  |-> write_len_up)
  **  (UCharArray.seg data_buffer 0 write_len_down (sublist (0) (write_len_down) (contents)) )
  **  (UCharArray.seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx area_length (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((Zlength ((sublist (write_len_up) (data_length) (input_contents)))) = (data_length - write_len_up )) ”
.

Definition CircularAreaWrite_partial_solve_wit_9_aux := 
forall (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (write_len_down: Z) (write_len_up: Z) (PreH1 : (circular_area_entry <> 0)) (PreH2 : (input_buffer_entry <> 0)) (PreH3 : (requested > 0)) (PreH4 : (0 < area_length)) (PreH5 : ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0)))) (PreH6 : (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length )) (PreH7 : ((Zlength (input_contents)) = requested)) (PreH8 : (0 <= write_len_down)) (PreH9 : (write_len_down <= writeidx)) (PreH10 : (write_len_up = (area_length - writeidx ))) (PreH11 : (write_len_down = (data_length - write_len_up ))) (PreH12 : (CircularAreaDivideWrDataResult writeidx data_length area_length 1 )) (PreH13 : (p_head = data_buffer)) (PreH14 : (p_tail = (data_buffer + area_length ))) (PreH15 : (CircularAreaDescriptorState readidx writeidx area_length b_status contents )) ,
  (UCharArray.seg data_buffer 0 write_len_down (sublist (0) (write_len_down) (contents)) )
  **  (UCharArray.seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx area_length (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ (p_head = (data_buffer + 0 )) ” 
  &&  “ ((input_buffer_entry + (write_len_up * sizeof(UCHAR))) = (input_buffer_entry + write_len_up )) ” 
  &&  “ (write_len_down = (write_len_down - 0 )) ” 
  &&  “ (write_len_down = (data_length - write_len_up )) ” 
  &&  “ ((Zlength ((sublist (write_len_up) (data_length) (input_contents)))) = (data_length - write_len_up )) ” 
  &&  “ ((Zlength ((sublist (0) (write_len_down) (contents)))) = (write_len_down - 0 )) ” 
  &&  “ (circular_area_entry <> 0) ” 
  &&  “ (input_buffer_entry <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0))) ” 
  &&  “ (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length ) ” 
  &&  “ ((Zlength (input_contents)) = requested) ” 
  &&  “ (0 <= write_len_down) ” 
  &&  “ (write_len_down <= writeidx) ” 
  &&  “ (write_len_up = (area_length - writeidx )) ” 
  &&  “ (write_len_down = (data_length - write_len_up )) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx data_length area_length 1 ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status contents ) ”
  &&  (UCharArray.seg data_buffer 0 write_len_down (sublist (0) (write_len_down) (contents)) )
  **  (UCharArray.seg input_buffer_entry write_len_up data_length (sublist (write_len_up) (data_length) (input_contents)) )
  **  (UCharArray.seg data_buffer write_len_down writeidx (sublist (write_len_down) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx area_length (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry 0 write_len_up (sublist (0) (write_len_up) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
.

Definition CircularAreaWrite_partial_solve_wit_9 := CircularAreaWrite_partial_solve_wit_9_pure -> CircularAreaWrite_partial_solve_wit_9_aux.

Definition CircularAreaWrite_partial_solve_wit_10_pure := 
(
forall (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (write_data_length_addr_v: Z) (PreH1 : (circular_area_entry <> 0)) (PreH2 : (input_buffer_entry <> 0)) (PreH3 : (requested > 0)) (PreH4 : (0 < area_length)) (PreH5 : ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0)))) (PreH6 : (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length )) (PreH7 : ((Zlength (input_contents)) = requested)) (PreH8 : (0 <= data_length)) (PreH9 : (data_length <= requested)) (PreH10 : (0 <= writeidx)) (PreH11 : ((writeidx + data_length ) <= area_length)) (PreH12 : (CircularAreaDivideWrDataResult writeidx data_length area_length 0 )) (PreH13 : (p_head = data_buffer)) (PreH14 : (p_tail = (data_buffer + area_length ))) (PreH15 : (CircularAreaDescriptorState readidx writeidx area_length b_status contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_entry)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_entry)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx (writeidx + data_length ) (sublist (writeidx) ((writeidx + data_length )) (contents)) )
  **  (UCharArray.seg data_buffer (writeidx + data_length ) area_length (sublist ((writeidx + data_length )) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((data_buffer + (writeidx * sizeof(UCHAR))) = (data_buffer + writeidx )) ” 
  &&  “ (input_buffer_entry = (input_buffer_entry + 0 )) ” 
  &&  “ (data_length = ((writeidx + data_length ) - writeidx )) ” 
  &&  “ (data_length = (data_length - 0 )) ” 
  &&  “ ((Zlength ((sublist (0) (data_length) (input_contents)))) = (data_length - 0 )) ” 
  &&  “ ((Zlength ((sublist (writeidx) ((writeidx + data_length )) (contents)))) = ((writeidx + data_length ) - writeidx )) ”
) \/
(
forall (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (write_data_length_addr_v: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (write_data_length_addr_v <= UINT_MAX)) (PreH3 : (data_length <= UINT_MAX)) (PreH4 : (area_length >= 0)) (PreH5 : (write_data_length_addr_v >= 0)) (PreH6 : (data_length >= 0)) (PreH7 : (b_status <= INT_MAX)) (PreH8 : (force0 <= INT_MAX)) (PreH9 : (b_status >= INT_MIN)) (PreH10 : (force0 >= INT_MIN)) (PreH11 : (circular_area_entry <> 0)) (PreH12 : (input_buffer_entry <> 0)) (PreH13 : (requested > 0)) (PreH14 : (0 < area_length)) (PreH15 : ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0)))) (PreH16 : (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length )) (PreH17 : ((Zlength (input_contents)) = requested)) (PreH18 : (0 <= data_length)) (PreH19 : (data_length <= requested)) (PreH20 : (0 <= writeidx)) (PreH21 : ((writeidx + data_length ) <= area_length)) (PreH22 : (CircularAreaDivideWrDataResult writeidx data_length area_length 0 )) (PreH23 : (p_head = data_buffer)) (PreH24 : (p_tail = (data_buffer + area_length ))) (PreH25 : (CircularAreaDescriptorState readidx writeidx area_length b_status contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_entry)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_entry)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx (writeidx + data_length ) (sublist (writeidx) ((writeidx + data_length )) (contents)) )
  **  (UCharArray.seg data_buffer (writeidx + data_length ) area_length (sublist ((writeidx + data_length )) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((Zlength ((sublist (writeidx) ((writeidx + data_length )) (contents)))) = ((writeidx + data_length ) - writeidx )) ” 
  &&  “ ((Zlength ((sublist (0) (data_length) (input_contents)))) = (data_length - 0 )) ”
).

Definition CircularAreaWrite_partial_solve_wit_10_pure_split_goal_1 := 
forall (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (write_data_length_addr_v: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (write_data_length_addr_v <= UINT_MAX)) (PreH3 : (data_length <= UINT_MAX)) (PreH4 : (area_length >= 0)) (PreH5 : (write_data_length_addr_v >= 0)) (PreH6 : (data_length >= 0)) (PreH7 : (b_status <= INT_MAX)) (PreH8 : (force0 <= INT_MAX)) (PreH9 : (b_status >= INT_MIN)) (PreH10 : (force0 >= INT_MIN)) (PreH11 : (circular_area_entry <> 0)) (PreH12 : (input_buffer_entry <> 0)) (PreH13 : (requested > 0)) (PreH14 : (0 < area_length)) (PreH15 : ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0)))) (PreH16 : (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length )) (PreH17 : ((Zlength (input_contents)) = requested)) (PreH18 : (0 <= data_length)) (PreH19 : (data_length <= requested)) (PreH20 : (0 <= writeidx)) (PreH21 : ((writeidx + data_length ) <= area_length)) (PreH22 : (CircularAreaDivideWrDataResult writeidx data_length area_length 0 )) (PreH23 : (p_head = data_buffer)) (PreH24 : (p_tail = (data_buffer + area_length ))) (PreH25 : (CircularAreaDescriptorState readidx writeidx area_length b_status contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_entry)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_entry)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx (writeidx + data_length ) (sublist (writeidx) ((writeidx + data_length )) (contents)) )
  **  (UCharArray.seg data_buffer (writeidx + data_length ) area_length (sublist ((writeidx + data_length )) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((Zlength ((sublist (writeidx) ((writeidx + data_length )) (contents)))) = ((writeidx + data_length ) - writeidx )) ”
.

Definition CircularAreaWrite_partial_solve_wit_10_pure_split_goal_2 := 
forall (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (write_data_length_addr_v: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (write_data_length_addr_v <= UINT_MAX)) (PreH3 : (data_length <= UINT_MAX)) (PreH4 : (area_length >= 0)) (PreH5 : (write_data_length_addr_v >= 0)) (PreH6 : (data_length >= 0)) (PreH7 : (b_status <= INT_MAX)) (PreH8 : (force0 <= INT_MAX)) (PreH9 : (b_status >= INT_MIN)) (PreH10 : (force0 >= INT_MIN)) (PreH11 : (circular_area_entry <> 0)) (PreH12 : (input_buffer_entry <> 0)) (PreH13 : (requested > 0)) (PreH14 : (0 < area_length)) (PreH15 : ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0)))) (PreH16 : (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length )) (PreH17 : ((Zlength (input_contents)) = requested)) (PreH18 : (0 <= data_length)) (PreH19 : (data_length <= requested)) (PreH20 : (0 <= writeidx)) (PreH21 : ((writeidx + data_length ) <= area_length)) (PreH22 : (CircularAreaDivideWrDataResult writeidx data_length area_length 0 )) (PreH23 : (p_head = data_buffer)) (PreH24 : (p_tail = (data_buffer + area_length ))) (PreH25 : (CircularAreaDescriptorState readidx writeidx area_length b_status contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_entry)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_entry)
  **  ((( &( "b_force" ) )) # Int  |-> force0)
  **  ((( &( "data_length" ) )) # UInt  |-> data_length)
  **  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx (writeidx + data_length ) (sublist (writeidx) ((writeidx + data_length )) (contents)) )
  **  (UCharArray.seg data_buffer (writeidx + data_length ) area_length (sublist ((writeidx + data_length )) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((( &( "write_data_length" ) )) # UInt  |-> write_data_length_addr_v)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((Zlength ((sublist (0) (data_length) (input_contents)))) = (data_length - 0 )) ”
.

Definition CircularAreaWrite_partial_solve_wit_10_aux := 
forall (input_contents: (@list Z)) (contents: (@list Z)) (input_buffer_entry: Z) (circular_area_entry: Z) (force0: Z) (requested: Z) (operations: Z) (LitMap: (string -> Z)) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (data_length: Z) (PreH1 : (circular_area_entry <> 0)) (PreH2 : (input_buffer_entry <> 0)) (PreH3 : (requested > 0)) (PreH4 : (0 < area_length)) (PreH5 : ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0)))) (PreH6 : (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length )) (PreH7 : ((Zlength (input_contents)) = requested)) (PreH8 : (0 <= data_length)) (PreH9 : (data_length <= requested)) (PreH10 : (0 <= writeidx)) (PreH11 : ((writeidx + data_length ) <= area_length)) (PreH12 : (CircularAreaDivideWrDataResult writeidx data_length area_length 0 )) (PreH13 : (p_head = data_buffer)) (PreH14 : (p_tail = (data_buffer + area_length ))) (PreH15 : (CircularAreaDescriptorState readidx writeidx area_length b_status contents )) ,
  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer writeidx (writeidx + data_length ) (sublist (writeidx) ((writeidx + data_length )) (contents)) )
  **  (UCharArray.seg data_buffer (writeidx + data_length ) area_length (sublist ((writeidx + data_length )) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  (UCharArray.seg input_buffer_entry data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
|--
  “ ((data_buffer + (writeidx * sizeof(UCHAR))) = (data_buffer + writeidx )) ” 
  &&  “ (input_buffer_entry = (input_buffer_entry + 0 )) ” 
  &&  “ (data_length = ((writeidx + data_length ) - writeidx )) ” 
  &&  “ (data_length = (data_length - 0 )) ” 
  &&  “ ((Zlength ((sublist (0) (data_length) (input_contents)))) = (data_length - 0 )) ” 
  &&  “ ((Zlength ((sublist (writeidx) ((writeidx + data_length )) (contents)))) = ((writeidx + data_length ) - writeidx )) ” 
  &&  “ (circular_area_entry <> 0) ” 
  &&  “ (input_buffer_entry <> 0) ” 
  &&  “ (requested > 0) ” 
  &&  “ (0 < area_length) ” 
  &&  “ ~((((readidx = writeidx) /\ (b_status <> 0)) /\ (force0 = 0))) ” 
  &&  “ (CircularAreaActualWriteLength readidx writeidx area_length b_status requested data_length ) ” 
  &&  “ ((Zlength (input_contents)) = requested) ” 
  &&  “ (0 <= data_length) ” 
  &&  “ (data_length <= requested) ” 
  &&  “ (0 <= writeidx) ” 
  &&  “ ((writeidx + data_length ) <= area_length) ” 
  &&  “ (CircularAreaDivideWrDataResult writeidx data_length area_length 0 ) ” 
  &&  “ (p_head = data_buffer) ” 
  &&  “ (p_tail = (data_buffer + area_length )) ” 
  &&  “ (CircularAreaDescriptorState readidx writeidx area_length b_status contents ) ”
  &&  (UCharArray.seg data_buffer writeidx (writeidx + data_length ) (sublist (writeidx) ((writeidx + data_length )) (contents)) )
  **  (UCharArray.seg input_buffer_entry 0 data_length (sublist (0) (data_length) (input_contents)) )
  **  (UCharArray.seg data_buffer 0 writeidx (sublist (0) (writeidx) (contents)) )
  **  (UCharArray.seg data_buffer (writeidx + data_length ) area_length (sublist ((writeidx + data_length )) (area_length) (contents)) )
  **  (UCharArray.seg input_buffer_entry data_length requested (sublist (data_length) (requested) (input_contents)) )
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_entry)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (GlobalStrings LitMap )
.

Definition CircularAreaWrite_partial_solve_wit_10 := CircularAreaWrite_partial_solve_wit_10_pure -> CircularAreaWrite_partial_solve_wit_10_aux.

Definition CircularAreaGetDataLength_derive_circular_area_data_length_callable_by_circular_area_data_length_body := 
forall (circular_area_pre: Z) (contents_circular_area_data_length_callable: (@list Z)) (operations_circular_area_data_length_callable: Z) (LitMap_circular_area_data_length_callable: (string -> Z)) (b_status_circular_area_data_length_callable: Z) (area_length_circular_area_data_length_callable: Z) (p_tail_circular_area_data_length_callable: Z) (p_head_circular_area_data_length_callable: Z) (writeidx_circular_area_data_length_callable: Z) (readidx_circular_area_data_length_callable: Z) (data_buffer_circular_area_data_length_callable: Z) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (0 < area_length_circular_area_data_length_callable) ” 
  &&  “ (area_length_circular_area_data_length_callable <= 256) ” 
  &&  “ (0 <= readidx_circular_area_data_length_callable) ” 
  &&  “ (readidx_circular_area_data_length_callable <= 255) ” 
  &&  “ (readidx_circular_area_data_length_callable < area_length_circular_area_data_length_callable) ” 
  &&  “ (0 <= writeidx_circular_area_data_length_callable) ” 
  &&  “ (writeidx_circular_area_data_length_callable <= 255) ” 
  &&  “ (writeidx_circular_area_data_length_callable < area_length_circular_area_data_length_callable) ” 
  &&  “ (p_head_circular_area_data_length_callable = data_buffer_circular_area_data_length_callable) ” 
  &&  “ (p_tail_circular_area_data_length_callable = (data_buffer_circular_area_data_length_callable + area_length_circular_area_data_length_callable )) ” 
  &&  “ ((Zlength (contents_circular_area_data_length_callable)) = area_length_circular_area_data_length_callable) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_data_length_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_data_length_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_data_length_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_data_length_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_data_length_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_data_length_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_data_length_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_data_length_callable)
  **  (UCharArray.full data_buffer_circular_area_data_length_callable area_length_circular_area_data_length_callable contents_circular_area_data_length_callable )
  **  (GlobalStrings LitMap_circular_area_data_length_callable )
|--
EX (data_buffer_circular_area_data_length_body: Z) (readidx_circular_area_data_length_body: Z) (writeidx_circular_area_data_length_body: Z) (p_head_circular_area_data_length_body: Z) (p_tail_circular_area_data_length_body: Z) (area_length_circular_area_data_length_body: Z) (b_status_circular_area_data_length_body: Z) (LitMap_circular_area_data_length_body: (string -> Z)) (operations_circular_area_data_length_body: Z) (contents_circular_area_data_length_body: (@list Z)) ,
  ((“ (circular_area_pre = 0) ”
  &&  emp)
  ||
  (“ (circular_area_pre <> 0) ” 
  &&  “ (0 < area_length_circular_area_data_length_body) ” 
  &&  “ (area_length_circular_area_data_length_body <= 256) ” 
  &&  “ (0 <= readidx_circular_area_data_length_body) ” 
  &&  “ (readidx_circular_area_data_length_body <= 255) ” 
  &&  “ (readidx_circular_area_data_length_body < area_length_circular_area_data_length_body) ” 
  &&  “ (0 <= writeidx_circular_area_data_length_body) ” 
  &&  “ (writeidx_circular_area_data_length_body <= 255) ” 
  &&  “ (writeidx_circular_area_data_length_body < area_length_circular_area_data_length_body) ” 
  &&  “ (p_head_circular_area_data_length_body = data_buffer_circular_area_data_length_body) ” 
  &&  “ (p_tail_circular_area_data_length_body = (data_buffer_circular_area_data_length_body + area_length_circular_area_data_length_body )) ” 
  &&  “ ((Zlength (contents_circular_area_data_length_body)) = area_length_circular_area_data_length_body) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_data_length_body)
  **  (UCharArray.full data_buffer_circular_area_data_length_body area_length_circular_area_data_length_body contents_circular_area_data_length_body )
  **  (GlobalStrings LitMap_circular_area_data_length_body )))
  **
  (((EX retval_2,
  “ (circular_area_pre = 0) ” 
  &&  “ (retval_2 = 1) ”
  &&  emp)
  ||
  (EX retval_2,
  “ (circular_area_pre <> 0) ” 
  &&  “ (CircularAreaDataLengthResult readidx_circular_area_data_length_body writeidx_circular_area_data_length_body area_length_circular_area_data_length_body b_status_circular_area_data_length_body retval_2 ) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= area_length_circular_area_data_length_body) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_data_length_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_data_length_body)
  **  (UCharArray.full data_buffer_circular_area_data_length_body area_length_circular_area_data_length_body contents_circular_area_data_length_body )
  **  (GlobalStrings LitMap_circular_area_data_length_body )))
  -*
  (EX retval,
  “ (CircularAreaDataLengthResult readidx_circular_area_data_length_callable writeidx_circular_area_data_length_callable area_length_circular_area_data_length_callable b_status_circular_area_data_length_callable retval ) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= area_length_circular_area_data_length_callable) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_data_length_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_data_length_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_data_length_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_data_length_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_data_length_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_data_length_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_data_length_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_data_length_callable)
  **  (UCharArray.full data_buffer_circular_area_data_length_callable area_length_circular_area_data_length_callable contents_circular_area_data_length_callable )
  **  (GlobalStrings LitMap_circular_area_data_length_callable )))
.

Definition CircularAreaIsFull_derive_circular_area_is_full_callable_by_circular_area_is_full_body := 
forall (circular_area_pre: Z) (contents_circular_area_is_full_callable: (@list Z)) (operations_circular_area_is_full_callable: Z) (LitMap_circular_area_is_full_callable: (string -> Z)) (b_status_circular_area_is_full_callable: Z) (area_length_circular_area_is_full_callable: Z) (p_tail_circular_area_is_full_callable: Z) (p_head_circular_area_is_full_callable: Z) (writeidx_circular_area_is_full_callable: Z) (readidx_circular_area_is_full_callable: Z) (data_buffer_circular_area_is_full_callable: Z) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (0 < area_length_circular_area_is_full_callable) ” 
  &&  “ (area_length_circular_area_is_full_callable <= 256) ” 
  &&  “ (0 <= readidx_circular_area_is_full_callable) ” 
  &&  “ (readidx_circular_area_is_full_callable <= 255) ” 
  &&  “ (readidx_circular_area_is_full_callable < area_length_circular_area_is_full_callable) ” 
  &&  “ (0 <= writeidx_circular_area_is_full_callable) ” 
  &&  “ (writeidx_circular_area_is_full_callable <= 255) ” 
  &&  “ (writeidx_circular_area_is_full_callable < area_length_circular_area_is_full_callable) ” 
  &&  “ (p_head_circular_area_is_full_callable = data_buffer_circular_area_is_full_callable) ” 
  &&  “ (p_tail_circular_area_is_full_callable = (data_buffer_circular_area_is_full_callable + area_length_circular_area_is_full_callable )) ” 
  &&  “ ((Zlength (contents_circular_area_is_full_callable)) = area_length_circular_area_is_full_callable) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_is_full_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_is_full_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_is_full_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_is_full_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_is_full_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_is_full_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_is_full_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_is_full_callable)
  **  (UCharArray.full data_buffer_circular_area_is_full_callable area_length_circular_area_is_full_callable contents_circular_area_is_full_callable )
  **  (GlobalStrings LitMap_circular_area_is_full_callable )
|--
EX (data_buffer_circular_area_is_full_body: Z) (readidx_circular_area_is_full_body: Z) (writeidx_circular_area_is_full_body: Z) (p_head_circular_area_is_full_body: Z) (p_tail_circular_area_is_full_body: Z) (area_length_circular_area_is_full_body: Z) (b_status_circular_area_is_full_body: Z) (LitMap_circular_area_is_full_body: (string -> Z)) (operations_circular_area_is_full_body: Z) (contents_circular_area_is_full_body: (@list Z)) ,
  ((“ (circular_area_pre = 0) ”
  &&  emp)
  ||
  (“ (circular_area_pre <> 0) ” 
  &&  “ (0 < area_length_circular_area_is_full_body) ” 
  &&  “ (area_length_circular_area_is_full_body <= 256) ” 
  &&  “ (0 <= readidx_circular_area_is_full_body) ” 
  &&  “ (readidx_circular_area_is_full_body <= 255) ” 
  &&  “ (readidx_circular_area_is_full_body < area_length_circular_area_is_full_body) ” 
  &&  “ (0 <= writeidx_circular_area_is_full_body) ” 
  &&  “ (writeidx_circular_area_is_full_body <= 255) ” 
  &&  “ (writeidx_circular_area_is_full_body < area_length_circular_area_is_full_body) ” 
  &&  “ (p_head_circular_area_is_full_body = data_buffer_circular_area_is_full_body) ” 
  &&  “ (p_tail_circular_area_is_full_body = (data_buffer_circular_area_is_full_body + area_length_circular_area_is_full_body )) ” 
  &&  “ ((Zlength (contents_circular_area_is_full_body)) = area_length_circular_area_is_full_body) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_is_full_body)
  **  (UCharArray.full data_buffer_circular_area_is_full_body area_length_circular_area_is_full_body contents_circular_area_is_full_body )
  **  (GlobalStrings LitMap_circular_area_is_full_body )))
  **
  (((EX retval_2,
  “ (circular_area_pre = 0) ” 
  &&  “ (retval_2 = 1) ”
  &&  emp)
  ||
  (EX retval_2,
  “ (circular_area_pre <> 0) ” 
  &&  “ (CircularAreaIsFullResult readidx_circular_area_is_full_body writeidx_circular_area_is_full_body b_status_circular_area_is_full_body retval_2 ) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 1) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_is_full_body)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_is_full_body)
  **  (UCharArray.full data_buffer_circular_area_is_full_body area_length_circular_area_is_full_body contents_circular_area_is_full_body )
  **  (GlobalStrings LitMap_circular_area_is_full_body )))
  -*
  (EX retval,
  “ (CircularAreaIsFullResult readidx_circular_area_is_full_callable writeidx_circular_area_is_full_callable b_status_circular_area_is_full_callable retval ) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 1) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer_circular_area_is_full_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx_circular_area_is_full_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx_circular_area_is_full_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> p_head_circular_area_is_full_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail_circular_area_is_full_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length_circular_area_is_full_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status_circular_area_is_full_callable)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations_circular_area_is_full_callable)
  **  (UCharArray.full data_buffer_circular_area_is_full_callable area_length_circular_area_is_full_callable contents_circular_area_is_full_callable )
  **  (GlobalStrings LitMap_circular_area_is_full_callable )))
.

Module Type VC_Correct.

Include char_array_Strategy_Correct.

Axiom proof_of_CircularAreaIsFull_safety_wit_1 : CircularAreaIsFull_safety_wit_1.
Axiom proof_of_CircularAreaIsFull_safety_wit_2 : CircularAreaIsFull_safety_wit_2.
Axiom proof_of_CircularAreaIsFull_safety_wit_3 : CircularAreaIsFull_safety_wit_3.
Axiom proof_of_CircularAreaIsFull_safety_wit_4 : CircularAreaIsFull_safety_wit_4.
Axiom proof_of_CircularAreaIsFull_safety_wit_5 : CircularAreaIsFull_safety_wit_5.
Axiom proof_of_CircularAreaIsFull_safety_wit_6 : CircularAreaIsFull_safety_wit_6.
Axiom proof_of_CircularAreaIsFull_safety_wit_7 : CircularAreaIsFull_safety_wit_7.
Axiom proof_of_CircularAreaIsFull_safety_wit_8 : CircularAreaIsFull_safety_wit_8.
Axiom proof_of_CircularAreaIsFull_safety_wit_9 : CircularAreaIsFull_safety_wit_9.
Axiom proof_of_CircularAreaIsFull_safety_wit_10 : CircularAreaIsFull_safety_wit_10.
Axiom proof_of_CircularAreaIsFull_return_wit_1 : CircularAreaIsFull_return_wit_1.
Axiom proof_of_CircularAreaIsFull_return_wit_2 : CircularAreaIsFull_return_wit_2.
Axiom proof_of_CircularAreaIsFull_return_wit_3 : CircularAreaIsFull_return_wit_3.
Axiom proof_of_CircularAreaIsFull_return_wit_4 : CircularAreaIsFull_return_wit_4.
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
Axiom proof_of_CircularAreaDivideWrData_safety_wit_1 : CircularAreaDivideWrData_safety_wit_1.
Axiom proof_of_CircularAreaDivideWrData_safety_wit_2 : CircularAreaDivideWrData_safety_wit_2.
Axiom proof_of_CircularAreaDivideWrData_safety_wit_3 : CircularAreaDivideWrData_safety_wit_3.
Axiom proof_of_CircularAreaDivideWrData_safety_wit_4 : CircularAreaDivideWrData_safety_wit_4.
Axiom proof_of_CircularAreaDivideWrData_safety_wit_5 : CircularAreaDivideWrData_safety_wit_5.
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
Axiom proof_of_CircularAreaWrite_entail_wit_1_1 : CircularAreaWrite_entail_wit_1_1.
Axiom proof_of_CircularAreaWrite_entail_wit_1_2 : CircularAreaWrite_entail_wit_1_2.
Axiom proof_of_CircularAreaWrite_entail_wit_1_3 : CircularAreaWrite_entail_wit_1_3.
Axiom proof_of_CircularAreaWrite_entail_wit_1_4 : CircularAreaWrite_entail_wit_1_4.
Axiom proof_of_CircularAreaWrite_entail_wit_2 : CircularAreaWrite_entail_wit_2.
Axiom proof_of_CircularAreaWrite_entail_wit_3_1 : CircularAreaWrite_entail_wit_3_1.
Axiom proof_of_CircularAreaWrite_entail_wit_3_2 : CircularAreaWrite_entail_wit_3_2.
Axiom proof_of_CircularAreaWrite_entail_wit_3_3 : CircularAreaWrite_entail_wit_3_3.
Axiom proof_of_CircularAreaWrite_entail_wit_3_4 : CircularAreaWrite_entail_wit_3_4.
Axiom proof_of_CircularAreaWrite_return_wit_1 : CircularAreaWrite_return_wit_1.
Axiom proof_of_CircularAreaWrite_return_wit_2 : CircularAreaWrite_return_wit_2.
Axiom proof_of_CircularAreaWrite_return_wit_3 : CircularAreaWrite_return_wit_3.
Axiom proof_of_CircularAreaWrite_return_wit_4 : CircularAreaWrite_return_wit_4.
Axiom proof_of_CircularAreaWrite_return_wit_5 : CircularAreaWrite_return_wit_5.
Axiom proof_of_CircularAreaWrite_return_wit_6 : CircularAreaWrite_return_wit_6.
Axiom proof_of_CircularAreaWrite_return_wit_7 : CircularAreaWrite_return_wit_7.
Axiom proof_of_CircularAreaWrite_return_wit_8 : CircularAreaWrite_return_wit_8.
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
Axiom proof_of_CircularAreaWrite_partial_solve_wit_8_pure : CircularAreaWrite_partial_solve_wit_8_pure.
Axiom proof_of_CircularAreaWrite_partial_solve_wit_8 : CircularAreaWrite_partial_solve_wit_8.
Axiom proof_of_CircularAreaWrite_partial_solve_wit_9_pure : CircularAreaWrite_partial_solve_wit_9_pure.
Axiom proof_of_CircularAreaWrite_partial_solve_wit_9 : CircularAreaWrite_partial_solve_wit_9.
Axiom proof_of_CircularAreaWrite_partial_solve_wit_10_pure : CircularAreaWrite_partial_solve_wit_10_pure.
Axiom proof_of_CircularAreaWrite_partial_solve_wit_10 : CircularAreaWrite_partial_solve_wit_10.
Axiom proof_of_CircularAreaGetDataLength_derive_circular_area_data_length_callable_by_circular_area_data_length_body : CircularAreaGetDataLength_derive_circular_area_data_length_callable_by_circular_area_data_length_body.
Axiom proof_of_CircularAreaIsFull_derive_circular_area_is_full_callable_by_circular_area_is_full_body : CircularAreaIsFull_derive_circular_area_is_full_callable_by_circular_area_is_full_body.

End VC_Correct.
