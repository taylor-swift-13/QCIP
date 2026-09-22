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
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_max_length.source Require Import xizi_circular_area_max_length_lib.
Local Open Scope sac.

(*----- Function CircularAreaGetMaxLength -----*)

Definition CircularAreaGetMaxLength_safety_wit_1 := 
forall (circular_area_pre: Z) (entry_circular_area: Z) (PreH1 : (circular_area_pre = entry_circular_area)) (PreH2 : (entry_circular_area = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaGetMaxLength_safety_wit_2 := 
forall (circular_area_pre: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (entry_circular_area: Z) (PreH1 : (circular_area_pre = entry_circular_area)) (PreH2 : (entry_circular_area <> 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (CircularAreaBackingResource entry_circular_area data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaGetMaxLength_safety_wit_3 := 
forall (circular_area_pre: Z) (entry_circular_area: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = entry_circular_area)) (PreH3 : (entry_circular_area = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  “ False ”
.

Definition CircularAreaGetMaxLength_safety_wit_4 := 
forall (circular_area_pre: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (entry_circular_area: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = entry_circular_area)) (PreH3 : (entry_circular_area <> 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (CircularAreaBackingResource entry_circular_area data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ False ”
.

Definition CircularAreaGetMaxLength_safety_wit_5 := 
forall (circular_area_pre: Z) (entry_circular_area: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = entry_circular_area)) (PreH3 : (entry_circular_area = 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition CircularAreaGetMaxLength_safety_wit_6 := 
forall (circular_area_pre: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (entry_circular_area: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = entry_circular_area)) (PreH3 : (entry_circular_area <> 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (CircularAreaBackingResource entry_circular_area data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaGetMaxLength_entail_wit_1 := 
(
forall (circular_area_pre: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (entry_circular_area: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = entry_circular_area)) (PreH3 : (entry_circular_area <> 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  (CircularAreaBackingResource entry_circular_area data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (entry_circular_area <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
  &&  ((( &( "circular_area" ) )) # Ptr  |-> entry_circular_area)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer area_length physical )
) \/
(
forall (circular_area_pre: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (entry_circular_area: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = entry_circular_area)) (PreH3 : (entry_circular_area <> 0)) ,
  (CircularAreaBackingResource entry_circular_area data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ” 
  &&  “ (data_buffer <> 0) ”
  &&  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer area_length physical )
).

Definition CircularAreaGetMaxLength_entail_wit_1_split_goal_1 := 
forall (circular_area_pre: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (entry_circular_area: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = entry_circular_area)) (PreH3 : (entry_circular_area <> 0)) ,
  (CircularAreaBackingResource entry_circular_area data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (CircularAreaLogicalState readidx writeidx area_length b_status logical physical ) ”
.

Definition CircularAreaGetMaxLength_entail_wit_1_split_goal_2 := 
forall (circular_area_pre: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (entry_circular_area: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = entry_circular_area)) (PreH3 : (entry_circular_area <> 0)) ,
  (CircularAreaBackingResource entry_circular_area data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  “ (data_buffer <> 0) ”
.

Definition CircularAreaGetMaxLength_entail_wit_1_split_goal_spatial := 
forall (circular_area_pre: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (entry_circular_area: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (circular_area_pre = entry_circular_area)) (PreH3 : (entry_circular_area <> 0)) ,
  (CircularAreaBackingResource entry_circular_area data_buffer readidx writeidx area_length b_status operations logical physical )
|--
  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer area_length physical )
.

Definition CircularAreaGetMaxLength_return_wit_1 := 
(
forall (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (entry_circular_area: Z) (PreH1 : (entry_circular_area <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer area_length physical )
|--
  “ (entry_circular_area <> 0) ” 
  &&  “ (CircularAreaGetMaxLengthResult entry_circular_area area_length area_length ) ”
  &&  (CircularAreaBackingResource entry_circular_area data_buffer readidx writeidx area_length b_status operations logical physical )
) \/
(
forall (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (entry_circular_area: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (entry_circular_area <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer area_length physical )
|--
  “ (CircularAreaGetMaxLengthResult entry_circular_area area_length area_length ) ”
  &&  (CircularAreaBackingResource entry_circular_area data_buffer readidx writeidx area_length b_status operations logical physical )
).

Definition CircularAreaGetMaxLength_return_wit_1_split_goal_1 := 
forall (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (entry_circular_area: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (entry_circular_area <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer area_length physical )
|--
  “ (CircularAreaGetMaxLengthResult entry_circular_area area_length area_length ) ”
.

Definition CircularAreaGetMaxLength_return_wit_1_split_goal_spatial := 
forall (physical: (@list (@option Z))) (logical: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (entry_circular_area: Z) (PreH1 : (area_length <= UINT_MAX)) (PreH2 : (area_length >= 0)) (PreH3 : (b_status <= INT_MAX)) (PreH4 : (b_status >= INT_MIN)) (PreH5 : (entry_circular_area <> 0)) (PreH6 : (data_buffer <> 0)) (PreH7 : (CircularAreaLogicalState readidx writeidx area_length b_status logical physical )) ,
  ((&((entry_circular_area)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (data_buffer + area_length ))
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((entry_circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.mixed_full data_buffer area_length physical )
|--
  (CircularAreaBackingResource entry_circular_area data_buffer readidx writeidx area_length b_status operations logical physical )
.

Definition CircularAreaGetMaxLength_return_wit_2 := 
(
forall (circular_area_pre: Z) (area_length: Z) (entry_circular_area: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = entry_circular_area)) (PreH3 : (entry_circular_area = 0)) ,
  TT && emp 
|--
  “ (entry_circular_area = 0) ” 
  &&  “ (CircularAreaGetMaxLengthResult entry_circular_area area_length 1 ) ”
  &&  emp
) \/
(
forall (circular_area_pre: Z) (area_length: Z) (entry_circular_area: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = entry_circular_area)) (PreH3 : (entry_circular_area = 0)) ,
  TT && emp 
|--
  “ (CircularAreaGetMaxLengthResult circular_area_pre area_length 1 ) ”
  &&  emp
).

Definition CircularAreaGetMaxLength_return_wit_2_split_goal_1 := 
forall (circular_area_pre: Z) (area_length: Z) (entry_circular_area: Z) (PreH1 : (circular_area_pre = 0)) (PreH2 : (circular_area_pre = entry_circular_area)) (PreH3 : (entry_circular_area = 0)) ,
  (CircularAreaGetMaxLengthResult circular_area_pre area_length 1 )
.

Module Type VC_Correct.


Axiom proof_of_CircularAreaGetMaxLength_safety_wit_1 : CircularAreaGetMaxLength_safety_wit_1.
Axiom proof_of_CircularAreaGetMaxLength_safety_wit_2 : CircularAreaGetMaxLength_safety_wit_2.
Axiom proof_of_CircularAreaGetMaxLength_safety_wit_3 : CircularAreaGetMaxLength_safety_wit_3.
Axiom proof_of_CircularAreaGetMaxLength_safety_wit_4 : CircularAreaGetMaxLength_safety_wit_4.
Axiom proof_of_CircularAreaGetMaxLength_safety_wit_5 : CircularAreaGetMaxLength_safety_wit_5.
Axiom proof_of_CircularAreaGetMaxLength_safety_wit_6 : CircularAreaGetMaxLength_safety_wit_6.
Axiom proof_of_CircularAreaGetMaxLength_entail_wit_1 : CircularAreaGetMaxLength_entail_wit_1.
Axiom proof_of_CircularAreaGetMaxLength_return_wit_1 : CircularAreaGetMaxLength_return_wit_1.
Axiom proof_of_CircularAreaGetMaxLength_return_wit_2 : CircularAreaGetMaxLength_return_wit_2.

End VC_Correct.
