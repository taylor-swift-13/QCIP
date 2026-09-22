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
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations0: Z) (b_status0: Z) (area_length0: Z) (writeidx0: Z) (readidx0: Z) (data_buffer0: Z) (circular_area_pre_p_tail: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer0 <> 0)) (PreH3 : (CircularAreaLogicalState readidx0 writeidx0 area_length0 b_status0 logical physical )) (PreH4 : (circular_area_pre_p_tail = (data_buffer0 + area_length0 ))) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> writeidx0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> circular_area_pre_p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations0)
  **  (UCharArray.mixed_full data_buffer0 area_length0 physical )
  **  (GlobalStrings LitMap )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaReset_safety_wit_2 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations0: Z) (b_status0: Z) (area_length0: Z) (writeidx0: Z) (readidx0: Z) (data_buffer0: Z) (circular_area_pre_p_tail: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer0 <> 0)) (PreH3 : (CircularAreaLogicalState readidx0 writeidx0 area_length0 b_status0 logical physical )) (PreH4 : (circular_area_pre_p_tail = (data_buffer0 + area_length0 ))) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> readidx0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> circular_area_pre_p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations0)
  **  (UCharArray.mixed_full data_buffer0 area_length0 physical )
  **  (GlobalStrings LitMap )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaReset_safety_wit_3 := 
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations0: Z) (b_status0: Z) (area_length0: Z) (writeidx0: Z) (readidx0: Z) (data_buffer0: Z) (circular_area_pre_p_tail: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer0 <> 0)) (PreH3 : (CircularAreaLogicalState readidx0 writeidx0 area_length0 b_status0 logical physical )) (PreH4 : (circular_area_pre_p_tail = (data_buffer0 + area_length0 ))) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> circular_area_pre_p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations0)
  **  (UCharArray.mixed_full data_buffer0 area_length0 physical )
  **  (GlobalStrings LitMap )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaReset_return_wit_1 := 
(
forall (circular_area_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (logical: (@list Z)) (operations0: Z) (b_status0: Z) (area_length0: Z) (writeidx0: Z) (readidx0: Z) (data_buffer0: Z) (circular_area_pre_p_tail_2: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer0 <> 0)) (PreH3 : (CircularAreaLogicalState readidx0 writeidx0 area_length0 b_status0 logical physical )) (PreH4 : (circular_area_pre_p_tail_2 = (data_buffer0 + area_length0 ))) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> circular_area_pre_p_tail_2)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations0)
  **  (UCharArray.mixed_full data_buffer0 area_length0 physical )
  **  (GlobalStrings LitMap )
|--
  EX (circular_area_pre_b_status: Z)  (circular_area_pre_p_tail: Z)  (circular_area_pre_writeidx: Z)  (circular_area_pre_readidx: Z) ,
  “ (CircularAreaLogicalState 0 0 area_length0 0 (@nil Z) physical ) ” 
  &&  “ (circular_area_pre_readidx = 0) ” 
  &&  “ (circular_area_pre_writeidx = 0) ” 
  &&  “ (circular_area_pre_p_tail = (data_buffer0 + area_length0 )) ” 
  &&  “ (circular_area_pre_b_status = 0) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> circular_area_pre_readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> circular_area_pre_writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> circular_area_pre_p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> circular_area_pre_b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations0)
  **  (UCharArray.mixed_full data_buffer0 area_length0 physical )
  **  (GlobalStrings LitMap )
) \/
(
forall (circular_area_pre: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status0: Z) (area_length0: Z) (writeidx0: Z) (readidx0: Z) (data_buffer0: Z) (circular_area_pre_p_tail_2: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer0 <> 0)) (PreH3 : (CircularAreaLogicalState readidx0 writeidx0 area_length0 b_status0 logical physical )) (PreH4 : (circular_area_pre_p_tail_2 = (data_buffer0 + area_length0 ))) ,
  TT && emp 
|--
  “ (CircularAreaLogicalState 0 0 area_length0 0 (@nil Z) physical ) ”
  &&  emp
).

Definition CircularAreaReset_return_wit_1_split_goal_1 := 
forall (circular_area_pre: Z) (physical: (@list (@option Z))) (logical: (@list Z)) (b_status0: Z) (area_length0: Z) (writeidx0: Z) (readidx0: Z) (data_buffer0: Z) (circular_area_pre_p_tail_2: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer0 <> 0)) (PreH3 : (CircularAreaLogicalState readidx0 writeidx0 area_length0 b_status0 logical physical )) (PreH4 : (circular_area_pre_p_tail_2 = (data_buffer0 + area_length0 ))) ,
  (CircularAreaLogicalState 0 0 area_length0 0 (@nil Z) physical )
.

Module Type VC_Correct.


Axiom proof_of_CircularAreaReset_safety_wit_1 : CircularAreaReset_safety_wit_1.
Axiom proof_of_CircularAreaReset_safety_wit_2 : CircularAreaReset_safety_wit_2.
Axiom proof_of_CircularAreaReset_safety_wit_3 : CircularAreaReset_safety_wit_3.
Axiom proof_of_CircularAreaReset_return_wit_1 : CircularAreaReset_return_wit_1.

End VC_Correct.
