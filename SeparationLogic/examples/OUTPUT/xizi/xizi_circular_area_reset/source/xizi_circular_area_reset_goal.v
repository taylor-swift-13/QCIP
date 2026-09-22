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
      SimpleC.EE.OUTPUT.xizi.xizi_circular_area_reset.source.xizi_circular_area_reset_lib.
Local Open Scope sac.

(*----- Function CircularAreaReset -----*)

Definition CircularAreaReset_safety_wit_1 := 
forall (circular_area_pre: Z) (state: circular_area_state) (data_buffer0: Z) (operations0: Z) (readidx0: Z) (writeidx0: Z) (b_status0: Z) (physical: (@list (@option Z))) (circular_area_p_tail: Z) (circular_area_area_length: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer0 <> 0)) (PreH3 : (0 < (ca_capacity (state)))) (PreH4 : ((ca_capacity (state)) <= 256)) (PreH5 : ((Zlength (physical)) = (ca_capacity (state)))) (PreH6 : (circular_area_p_tail = (data_buffer0 + (ca_capacity (state)) ))) (PreH7 : (circular_area_area_length = (ca_capacity (state)))) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> circular_area_p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> circular_area_area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations0)
  **  (UCharArray.mixed_full data_buffer0 (ca_capacity (state)) physical )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaReset_safety_wit_2 := 
forall (circular_area_pre: Z) (state: circular_area_state) (data_buffer0: Z) (operations0: Z) (readidx0: Z) (b_status0: Z) (physical: (@list (@option Z))) (circular_area_p_tail: Z) (circular_area_area_length: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer0 <> 0)) (PreH3 : (0 < (ca_capacity (state)))) (PreH4 : ((ca_capacity (state)) <= 256)) (PreH5 : ((Zlength (physical)) = (ca_capacity (state)))) (PreH6 : (circular_area_p_tail = (data_buffer0 + (ca_capacity (state)) ))) (PreH7 : (circular_area_area_length = (ca_capacity (state)))) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> circular_area_p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> circular_area_area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations0)
  **  (UCharArray.mixed_full data_buffer0 (ca_capacity (state)) physical )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaReset_safety_wit_3 := 
forall (circular_area_pre: Z) (state: circular_area_state) (data_buffer0: Z) (operations0: Z) (b_status0: Z) (physical: (@list (@option Z))) (circular_area_p_tail: Z) (circular_area_area_length: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer0 <> 0)) (PreH3 : (0 < (ca_capacity (state)))) (PreH4 : ((ca_capacity (state)) <= 256)) (PreH5 : ((Zlength (physical)) = (ca_capacity (state)))) (PreH6 : (circular_area_p_tail = (data_buffer0 + (ca_capacity (state)) ))) (PreH7 : (circular_area_area_length = (ca_capacity (state)))) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> circular_area_p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> circular_area_area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations0)
  **  (UCharArray.mixed_full data_buffer0 (ca_capacity (state)) physical )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaReset_entail_wit_1 := 
(
forall (circular_area_pre: Z) (state: circular_area_state) ,
  (store_circular_area state circular_area_pre )
|--
  EX (operations0: Z)  (b_status0: Z)  (circular_area_area_length: Z)  (circular_area_p_tail: Z)  (writeidx0: Z)  (readidx0: Z)  (physical: (@list (@option Z)))  (data_buffer0: Z) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer0 <> 0) ” 
  &&  “ (0 < (ca_capacity (state))) ” 
  &&  “ ((ca_capacity (state)) <= 256) ” 
  &&  “ ((Zlength (physical)) = (ca_capacity (state))) ” 
  &&  “ (circular_area_p_tail = (data_buffer0 + (ca_capacity (state)) )) ” 
  &&  “ (circular_area_area_length = (ca_capacity (state))) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> circular_area_p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> circular_area_area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations0)
  **  (UCharArray.mixed_full data_buffer0 (ca_capacity (state)) physical )
) \/
(
forall (circular_area_pre: Z) (state: circular_area_state) ,
  (store_circular_area state circular_area_pre )
|--
  EX (operations0: Z)  (b_status0: Z)  (writeidx0: Z)  (readidx0: Z)  (physical: (@list (@option Z)))  (data_buffer0: Z) ,
  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer0 <> 0) ” 
  &&  “ (0 < (ca_capacity (state))) ” 
  &&  “ ((ca_capacity (state)) <= 256) ” 
  &&  “ ((Zlength (physical)) = (ca_capacity (state))) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer0 + (ca_capacity (state)) ))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (ca_capacity (state)))
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations0)
  **  (UCharArray.mixed_full data_buffer0 (ca_capacity (state)) physical )
).

Definition CircularAreaReset_return_wit_1 := 
(
forall (circular_area_pre: Z) (state: circular_area_state) (data_buffer0: Z) (operations0: Z) (physical: (@list (@option Z))) (circular_area_p_tail: Z) (circular_area_area_length: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer0 <> 0)) (PreH3 : (0 < (ca_capacity (state)))) (PreH4 : ((ca_capacity (state)) <= 256)) (PreH5 : ((Zlength (physical)) = (ca_capacity (state)))) (PreH6 : (circular_area_p_tail = (data_buffer0 + (ca_capacity (state)) ))) (PreH7 : (circular_area_area_length = (ca_capacity (state)))) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> circular_area_p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> circular_area_area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations0)
  **  (UCharArray.mixed_full data_buffer0 (ca_capacity (state)) physical )
|--
  (store_circular_area (Build_circular_area_state ((ca_capacity (state))) ((@nil Z))) circular_area_pre )
) \/
(
forall (circular_area_pre: Z) (state: circular_area_state) (data_buffer0: Z) (operations0: Z) (physical: (@list (@option Z))) (circular_area_p_tail: Z) (circular_area_area_length: Z) (PreH1 : (circular_area_area_length <= UINT_MAX)) (PreH2 : (circular_area_area_length >= 0)) (PreH3 : (0 <= INT_MAX)) (PreH4 : (0 >= INT_MIN)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (data_buffer0 <> 0)) (PreH7 : (0 < (ca_capacity (state)))) (PreH8 : ((ca_capacity (state)) <= 256)) (PreH9 : ((Zlength (physical)) = (ca_capacity (state)))) (PreH10 : (circular_area_p_tail = (data_buffer0 + (ca_capacity (state)) ))) (PreH11 : (circular_area_area_length = (ca_capacity (state)))) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> circular_area_p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> circular_area_area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations0)
  **  (UCharArray.mixed_full data_buffer0 (ca_capacity (state)) physical )
|--
  (store_circular_area (Build_circular_area_state ((ca_capacity (state))) ((@nil Z))) circular_area_pre )
).

Definition CircularAreaReset_return_wit_1_split_goal_spatial := 
forall (circular_area_pre: Z) (state: circular_area_state) (data_buffer0: Z) (operations0: Z) (physical: (@list (@option Z))) (circular_area_p_tail: Z) (circular_area_area_length: Z) (PreH1 : (circular_area_area_length <= UINT_MAX)) (PreH2 : (circular_area_area_length >= 0)) (PreH3 : (0 <= INT_MAX)) (PreH4 : (0 >= INT_MIN)) (PreH5 : (circular_area_pre <> 0)) (PreH6 : (data_buffer0 <> 0)) (PreH7 : (0 < (ca_capacity (state)))) (PreH8 : ((ca_capacity (state)) <= 256)) (PreH9 : ((Zlength (physical)) = (ca_capacity (state)))) (PreH10 : (circular_area_p_tail = (data_buffer0 + (ca_capacity (state)) ))) (PreH11 : (circular_area_area_length = (ca_capacity (state)))) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> circular_area_p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> circular_area_area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations0)
  **  (UCharArray.mixed_full data_buffer0 (ca_capacity (state)) physical )
|--
  (store_circular_area (Build_circular_area_state ((ca_capacity (state))) ((@nil Z))) circular_area_pre )
.

Module Type VC_Correct.


Axiom proof_of_CircularAreaReset_safety_wit_1 : CircularAreaReset_safety_wit_1.
Axiom proof_of_CircularAreaReset_safety_wit_2 : CircularAreaReset_safety_wit_2.
Axiom proof_of_CircularAreaReset_safety_wit_3 : CircularAreaReset_safety_wit_3.
Axiom proof_of_CircularAreaReset_entail_wit_1 : CircularAreaReset_entail_wit_1.
Axiom proof_of_CircularAreaReset_return_wit_1 : CircularAreaReset_return_wit_1.

End VC_Correct.
