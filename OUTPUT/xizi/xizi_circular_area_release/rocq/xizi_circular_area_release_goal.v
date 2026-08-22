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
forall (circular_area_pre: Z) (contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (readidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (xizi_circular_area_release_domain circular_area_pre data_buffer area_length contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
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

Definition CircularAreaRelease_safety_wit_2 := 
forall (circular_area_pre: Z) (contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (writeidx: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (xizi_circular_area_release_domain circular_area_pre data_buffer area_length contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
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

Definition CircularAreaRelease_safety_wit_3 := 
forall (circular_area_pre: Z) (contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (p_head: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (xizi_circular_area_release_domain circular_area_pre data_buffer area_length contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
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

Definition CircularAreaRelease_safety_wit_4 := 
forall (circular_area_pre: Z) (contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (p_tail: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (xizi_circular_area_release_domain circular_area_pre data_buffer area_length contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> p_tail)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRelease_safety_wit_5 := 
forall (circular_area_pre: Z) (contents: (@list Z)) (operations: Z) (b_status: Z) (area_length: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (xizi_circular_area_release_domain circular_area_pre data_buffer area_length contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRelease_safety_wit_6 := 
forall (circular_area_pre: Z) (contents: (@list Z)) (operations: Z) (area_length: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (xizi_circular_area_release_domain circular_area_pre data_buffer area_length contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> area_length)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaRelease_return_wit_1 := 
forall (circular_area_pre: Z) (contents: (@list Z)) (area_length: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (xizi_circular_area_release_domain circular_area_pre data_buffer area_length contents )) ,
  TT && emp 
|--
  TT && emp 
.

Definition CircularAreaRelease_partial_solve_wit_1_pure := 
forall (circular_area_pre: Z) (contents: (@list Z)) (operations: Z) (area_length: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (xizi_circular_area_release_domain circular_area_pre data_buffer area_length contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
|--
  “ (data_buffer = data_buffer) ” 
  &&  “ (data_buffer <> 0) ”
.

Definition CircularAreaRelease_partial_solve_wit_1_aux := 
forall (circular_area_pre: Z) (contents: (@list Z)) (operations: Z) (area_length: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (xizi_circular_area_release_domain circular_area_pre data_buffer area_length contents )) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
  **  (UCharArray.full data_buffer area_length contents )
|--
  “ (data_buffer = data_buffer) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (circular_area_pre <> 0) ” 
  &&  “ (data_buffer <> 0) ” 
  &&  “ (xizi_circular_area_release_domain circular_area_pre data_buffer area_length contents ) ”
  &&  (UCharArray.full data_buffer area_length contents )
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
forall (circular_area_pre: Z) (contents: (@list Z)) (operations: Z) (area_length: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (xizi_circular_area_release_domain circular_area_pre data_buffer area_length contents )) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
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
forall (circular_area_pre: Z) (contents: (@list Z)) (operations: Z) (area_length: Z) (data_buffer: Z) (PreH1 : (circular_area_pre <> 0)) (PreH2 : (data_buffer <> 0)) (PreH3 : (xizi_circular_area_release_domain circular_area_pre data_buffer area_length contents )) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
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
  &&  “ (xizi_circular_area_release_domain circular_area_pre data_buffer area_length contents ) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> operations)
.

Definition CircularAreaRelease_partial_solve_wit_2 := CircularAreaRelease_partial_solve_wit_2_pure -> CircularAreaRelease_partial_solve_wit_2_aux.

Module Type VC_Correct.


Axiom proof_of_CircularAreaRelease_safety_wit_1 : CircularAreaRelease_safety_wit_1.
Axiom proof_of_CircularAreaRelease_safety_wit_2 : CircularAreaRelease_safety_wit_2.
Axiom proof_of_CircularAreaRelease_safety_wit_3 : CircularAreaRelease_safety_wit_3.
Axiom proof_of_CircularAreaRelease_safety_wit_4 : CircularAreaRelease_safety_wit_4.
Axiom proof_of_CircularAreaRelease_safety_wit_5 : CircularAreaRelease_safety_wit_5.
Axiom proof_of_CircularAreaRelease_safety_wit_6 : CircularAreaRelease_safety_wit_6.
Axiom proof_of_CircularAreaRelease_return_wit_1 : CircularAreaRelease_return_wit_1.
Axiom proof_of_CircularAreaRelease_partial_solve_wit_1_pure : CircularAreaRelease_partial_solve_wit_1_pure.
Axiom proof_of_CircularAreaRelease_partial_solve_wit_1 : CircularAreaRelease_partial_solve_wit_1.
Axiom proof_of_CircularAreaRelease_partial_solve_wit_2_pure : CircularAreaRelease_partial_solve_wit_2_pure.
Axiom proof_of_CircularAreaRelease_partial_solve_wit_2 : CircularAreaRelease_partial_solve_wit_2.

End VC_Correct.
