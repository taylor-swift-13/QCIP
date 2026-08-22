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
      SimpleC.EE.OUTPUT.xizi.xizi_circular_area_init.source.xizi_circular_area_init_lib.
Local Open Scope sac.

(*----- Function CircularAreaReset -----*)

Definition CircularAreaReset_safety_wit_1 := 
forall (circular_area_pre: Z) (PreH1 : (circular_area_pre <> 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |->_)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |->_)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |->_)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |->_)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |->_)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |->_)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |->_)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |->_)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaReset_safety_wit_2 := 
forall (circular_area_pre: Z) (PreH1 : (circular_area_pre <> 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |->_)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |->_)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |->_)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |->_)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |->_)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |->_)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |->_)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaReset_safety_wit_3 := 
forall (circular_area_pre: Z) (PreH1 : (circular_area_pre <> 0)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> circular_area_pre)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |->_)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |->_)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |->_)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |->_)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |->_)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |->_)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaReset_return_wit_1 := 
forall (circular_area_pre: Z) (PreH1 : (circular_area_pre <> 0)) ,
  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |->_)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |->_)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |->_)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |->_)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> 0)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |->_)
|--
  EX (circular_area_pre_b_status: Z)  (circular_area_pre_writeidx: Z)  (circular_area_pre_readidx: Z) ,
  “ (circular_area_pre_readidx = 0) ” 
  &&  “ (circular_area_pre_writeidx = 0) ” 
  &&  “ (circular_area_pre_b_status = 0) ”
  &&  ((&((circular_area_pre)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |->_)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> circular_area_pre_readidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> circular_area_pre_writeidx)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_head")) # Ptr  |->_)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |->_)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "area_length")) # UInt  |->_)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "b_status")) # Int  |-> circular_area_pre_b_status)
  **  ((&((circular_area_pre)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |->_)
.

(*----- Function CircularAreaRelease -----*)

(*----- Function CircularAreaInit -----*)

Definition CircularAreaInit_safety_wit_1 := 
forall (circular_area_length_pre: Z) (PreH1 : (0 < circular_area_length_pre)) (PreH2 : (circular_area_length_pre <= 256)) ,
  ((( &( "circular_area_length" ) )) # UInt  |-> circular_area_length_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaInit_safety_wit_2 := 
forall (circular_area_length_pre: Z) (PreH1 : (circular_area_length_pre <= 0)) (PreH2 : (0 < circular_area_length_pre)) (PreH3 : (circular_area_length_pre <= 256)) ,
  ((( &( "circular_area_length" ) )) # UInt  |-> circular_area_length_pre)
|--
  “ False ”
.

Definition CircularAreaInit_safety_wit_3 := 
forall (circular_area_length_pre: Z) (PreH1 : (circular_area_length_pre > 0)) (PreH2 : (0 < circular_area_length_pre)) (PreH3 : (circular_area_length_pre <= 256)) ,
  ((( &( "circular_area_length" ) )) # UInt  |-> circular_area_length_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaInit_safety_wit_4 := 
forall (circular_area_length_pre: Z) (PreH1 : (circular_area_length_pre > 0)) (PreH2 : (0 < circular_area_length_pre)) (PreH3 : (circular_area_length_pre <= 256)) ,
  ((( &( "circular_area_length" ) )) # UInt  |-> circular_area_length_pre)
|--
  “ (4 <> 0) ”
.

Definition CircularAreaInit_safety_wit_5 := 
forall (circular_area_length_pre: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (circular_area_length_pre > 0)) (PreH3 : (0 < circular_area_length_pre)) (PreH4 : (circular_area_length_pre <= 256)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> retval)
  **  ((( &( "circular_area_length" ) )) # UInt  |-> (unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)))
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaInit_safety_wit_6 := 
forall (circular_area_length_pre: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (circular_area_length_pre > 0)) (PreH3 : (0 < circular_area_length_pre)) (PreH4 : (circular_area_length_pre <= 256)) ,
  ((&((retval)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "readidx")) # UChar  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "writeidx")) # UChar  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "p_head")) # Ptr  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "area_length")) # UInt  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "b_status")) # Int  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |->_)
  **  ((( &( "circular_area" ) )) # Ptr  |-> retval)
  **  ((( &( "circular_area_length" ) )) # UInt  |-> (unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)))
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaInit_safety_wit_7 := 
forall (circular_area_length_pre: Z) (retval: Z) (PreH1 : (0 <> retval)) (PreH2 : (retval = 0)) (PreH3 : (circular_area_length_pre > 0)) (PreH4 : (0 < circular_area_length_pre)) (PreH5 : (circular_area_length_pre <= 256)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> retval)
  **  ((( &( "circular_area_length" ) )) # UInt  |-> (unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)))
|--
  “ False ”
.

Definition CircularAreaInit_safety_wit_8 := 
forall (circular_area_length_pre: Z) (retval: Z) (PreH1 : (0 = retval)) (PreH2 : (retval <> 0)) (PreH3 : (circular_area_length_pre > 0)) (PreH4 : (0 < circular_area_length_pre)) (PreH5 : (circular_area_length_pre <= 256)) ,
  ((&((retval)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "readidx")) # UChar  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "writeidx")) # UChar  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "p_head")) # Ptr  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "area_length")) # UInt  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "b_status")) # Int  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |->_)
  **  ((( &( "circular_area" ) )) # Ptr  |-> retval)
  **  ((( &( "circular_area_length" ) )) # UInt  |-> (unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)))
|--
  “ False ”
.

Definition CircularAreaInit_safety_wit_9 := 
forall (circular_area_length_pre: Z) (retval: Z) (PreH1 : (0 = retval)) (PreH2 : (retval = 0)) (PreH3 : (circular_area_length_pre > 0)) (PreH4 : (0 < circular_area_length_pre)) (PreH5 : (circular_area_length_pre <= 256)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> retval)
  **  ((( &( "circular_area_length" ) )) # UInt  |-> (unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)))
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaInit_safety_wit_10 := 
forall (circular_area_length_pre: Z) (retval: Z) (circular_area_callee_b_status: Z) (circular_area_callee_writeidx: Z) (circular_area_callee_readidx: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (circular_area_callee_readidx = 0)) (PreH3 : (circular_area_callee_writeidx = 0)) (PreH4 : (circular_area_callee_b_status = 0)) (PreH5 : (0 <> retval)) (PreH6 : (retval <> 0)) (PreH7 : (circular_area_length_pre > 0)) (PreH8 : (0 < circular_area_length_pre)) (PreH9 : (circular_area_length_pre <= 256)) ,
  ((&((retval)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> retval_2)
  **  ((&((retval)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> circular_area_callee_readidx)
  **  ((&((retval)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> circular_area_callee_writeidx)
  **  ((&((retval)  # "CircularArea" ->ₛ "p_head")) # Ptr  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "area_length")) # UInt  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "b_status")) # Int  |-> circular_area_callee_b_status)
  **  ((&((retval)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |->_)
  **  ((( &( "circular_area" ) )) # Ptr  |-> retval)
  **  ((( &( "circular_area_length" ) )) # UInt  |-> (unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)))
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaInit_safety_wit_11 := 
forall (circular_area_length_pre: Z) (retval: Z) (circular_area_callee_b_status: Z) (circular_area_callee_writeidx: Z) (circular_area_callee_readidx: Z) (retval_2: Z) (PreH1 : (retval_2 <> 0)) (PreH2 : ((unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)) > 0)) (PreH3 : (circular_area_callee_readidx = 0)) (PreH4 : (circular_area_callee_writeidx = 0)) (PreH5 : (circular_area_callee_b_status = 0)) (PreH6 : (0 <> retval)) (PreH7 : (retval <> 0)) (PreH8 : (circular_area_length_pre > 0)) (PreH9 : (0 < circular_area_length_pre)) (PreH10 : (circular_area_length_pre <= 256)) ,
  (UCharArray.undef_full retval_2 (unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)) )
  **  ((&((retval)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> retval_2)
  **  ((&((retval)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> circular_area_callee_readidx)
  **  ((&((retval)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> circular_area_callee_writeidx)
  **  ((&((retval)  # "CircularArea" ->ₛ "p_head")) # Ptr  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "area_length")) # UInt  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "b_status")) # Int  |-> circular_area_callee_b_status)
  **  ((&((retval)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |->_)
  **  ((( &( "circular_area" ) )) # Ptr  |-> retval)
  **  ((( &( "circular_area_length" ) )) # UInt  |-> (unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)))
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaInit_safety_wit_12 := 
forall (circular_area_length_pre: Z) (retval: Z) (circular_area_callee_b_status: Z) (circular_area_callee_writeidx: Z) (circular_area_callee_readidx: Z) (retval_2: Z) (PreH1 : (0 = retval_2)) (PreH2 : (retval_2 <> 0)) (PreH3 : ((unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)) > 0)) (PreH4 : (circular_area_callee_readidx = 0)) (PreH5 : (circular_area_callee_writeidx = 0)) (PreH6 : (circular_area_callee_b_status = 0)) (PreH7 : (0 <> retval)) (PreH8 : (retval <> 0)) (PreH9 : (circular_area_length_pre > 0)) (PreH10 : (0 < circular_area_length_pre)) (PreH11 : (circular_area_length_pre <= 256)) ,
  (UCharArray.undef_full retval_2 (unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)) )
  **  ((&((retval)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> retval_2)
  **  ((&((retval)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> circular_area_callee_readidx)
  **  ((&((retval)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> circular_area_callee_writeidx)
  **  ((&((retval)  # "CircularArea" ->ₛ "p_head")) # Ptr  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "area_length")) # UInt  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "b_status")) # Int  |-> circular_area_callee_b_status)
  **  ((&((retval)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |->_)
  **  ((( &( "circular_area" ) )) # Ptr  |-> retval)
  **  ((( &( "circular_area_length" ) )) # UInt  |-> (unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)))
|--
  “ False ”
.

Definition CircularAreaInit_safety_wit_13 := 
forall (circular_area_length_pre: Z) (retval: Z) (circular_area_callee_b_status: Z) (circular_area_callee_writeidx: Z) (circular_area_callee_readidx: Z) (retval_2: Z) (PreH1 : (0 <> retval_2)) (PreH2 : (retval_2 = 0)) (PreH3 : (circular_area_callee_readidx = 0)) (PreH4 : (circular_area_callee_writeidx = 0)) (PreH5 : (circular_area_callee_b_status = 0)) (PreH6 : (0 <> retval)) (PreH7 : (retval <> 0)) (PreH8 : (circular_area_length_pre > 0)) (PreH9 : (0 < circular_area_length_pre)) (PreH10 : (circular_area_length_pre <= 256)) ,
  ((&((retval)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> retval_2)
  **  ((&((retval)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> circular_area_callee_readidx)
  **  ((&((retval)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> circular_area_callee_writeidx)
  **  ((&((retval)  # "CircularArea" ->ₛ "p_head")) # Ptr  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "area_length")) # UInt  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "b_status")) # Int  |-> circular_area_callee_b_status)
  **  ((&((retval)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |->_)
  **  ((( &( "circular_area" ) )) # Ptr  |-> retval)
  **  ((( &( "circular_area_length" ) )) # UInt  |-> (unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)))
|--
  “ False ”
.

Definition CircularAreaInit_safety_wit_14 := 
forall (circular_area_length_pre: Z) (retval: Z) (circular_area_callee_b_status: Z) (circular_area_callee_writeidx: Z) (circular_area_callee_readidx: Z) (retval_2: Z) (PreH1 : (0 = retval_2)) (PreH2 : (retval_2 = 0)) (PreH3 : (circular_area_callee_readidx = 0)) (PreH4 : (circular_area_callee_writeidx = 0)) (PreH5 : (circular_area_callee_b_status = 0)) (PreH6 : (0 <> retval)) (PreH7 : (retval <> 0)) (PreH8 : (circular_area_length_pre > 0)) (PreH9 : (0 < circular_area_length_pre)) (PreH10 : (circular_area_length_pre <= 256)) ,
  ((&((retval)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> retval_2)
  **  ((&((retval)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> circular_area_callee_readidx)
  **  ((&((retval)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> circular_area_callee_writeidx)
  **  ((&((retval)  # "CircularArea" ->ₛ "p_head")) # Ptr  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "area_length")) # UInt  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "b_status")) # Int  |-> circular_area_callee_b_status)
  **  ((&((retval)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |->_)
  **  ((( &( "circular_area" ) )) # Ptr  |-> retval)
  **  ((( &( "circular_area_length" ) )) # UInt  |-> (unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)))
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CircularAreaInit_return_wit_1 := 
(
forall (circular_area_length_pre: Z) (retval: Z) (circular_area_callee_b_status: Z) (circular_area_callee_writeidx: Z) (circular_area_callee_readidx: Z) (retval_2: Z) (PreH1 : (0 <> retval_2)) (PreH2 : (retval_2 <> 0)) (PreH3 : ((unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)) > 0)) (PreH4 : (circular_area_callee_readidx = 0)) (PreH5 : (circular_area_callee_writeidx = 0)) (PreH6 : (circular_area_callee_b_status = 0)) (PreH7 : (0 <> retval)) (PreH8 : (retval <> 0)) (PreH9 : (circular_area_length_pre > 0)) (PreH10 : (0 < circular_area_length_pre)) (PreH11 : (circular_area_length_pre <= 256)) ,
  (UCharArray.undef_full retval_2 (unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)) )
  **  ((&((retval)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> retval_2)
  **  ((&((retval)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> circular_area_callee_readidx)
  **  ((&((retval)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> circular_area_callee_writeidx)
  **  ((&((retval)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> retval_2)
  **  ((&((retval)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> (retval_2 + ((unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)) * sizeof(UCHAR))))
  **  ((&((retval)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> (unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)))
  **  ((&((retval)  # "CircularArea" ->ₛ "b_status")) # Int  |-> circular_area_callee_b_status)
  **  ((&((retval)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> ( &( "CircularAreaOperations" ) ))
|--
  EX (circular_area_b_status: Z)  (circular_area_p_tail: Z)  (circular_area_writeidx: Z)  (circular_area_readidx: Z)  (circular_area_2: Z)  (data_buffer: Z)  (aligned_2: Z) ,
  “ (circular_area_length_pre > 0) ” 
  &&  “ (CircularAreaAlignedLength circular_area_length_pre aligned_2 ) ” 
  &&  “ (CircularAreaInitDescriptorState aligned_2 circular_area_2 data_buffer 0 0 data_buffer (data_buffer + aligned_2 ) aligned_2 0 ( &( "CircularAreaOperations" ) ) ( &( "CircularAreaOperations" ) ) ) ” 
  &&  “ (retval = circular_area_2) ” 
  &&  “ (circular_area_readidx = 0) ” 
  &&  “ (circular_area_writeidx = 0) ” 
  &&  “ (circular_area_p_tail = (data_buffer + aligned_2 )) ” 
  &&  “ (circular_area_b_status = 0) ”
  &&  ((&((circular_area_2)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_2)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> circular_area_readidx)
  **  ((&((circular_area_2)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> circular_area_writeidx)
  **  ((&((circular_area_2)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_2)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> circular_area_p_tail)
  **  ((&((circular_area_2)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> aligned_2)
  **  ((&((circular_area_2)  # "CircularArea" ->ₛ "b_status")) # Int  |-> circular_area_b_status)
  **  ((&((circular_area_2)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> ( &( "CircularAreaOperations" ) ))
  **  (UCharArray.undef_full data_buffer aligned_2 )
) \/
(
forall (circular_area_length_pre: Z) (retval: Z) (circular_area_callee_b_status: Z) (circular_area_callee_writeidx: Z) (circular_area_callee_readidx: Z) (retval_2: Z) (PreH1 : (0 <> retval_2)) (PreH2 : (retval_2 <> 0)) (PreH3 : ((unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)) > 0)) (PreH4 : (circular_area_callee_readidx = 0)) (PreH5 : (circular_area_callee_writeidx = 0)) (PreH6 : (circular_area_callee_b_status = 0)) (PreH7 : (0 <> retval)) (PreH8 : (retval <> 0)) (PreH9 : (circular_area_length_pre > 0)) (PreH10 : (0 < circular_area_length_pre)) (PreH11 : (circular_area_length_pre <= 256)) ,
  (UCharArray.undef_full retval_2 (unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)) )
|--
  “ (CircularAreaInitDescriptorState (unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)) retval retval_2 0 0 retval_2 (retval_2 + (unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)) ) (unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)) 0 ( &( "CircularAreaOperations" ) ) ( &( "CircularAreaOperations" ) ) ) ” 
  &&  “ (CircularAreaAlignedLength circular_area_length_pre (unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)) ) ”
  &&  (UCharArray.undef_full retval_2 (unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)) )
).

Definition CircularAreaInit_return_wit_1_split_goal_1 := 
forall (circular_area_length_pre: Z) (retval: Z) (circular_area_callee_b_status: Z) (circular_area_callee_writeidx: Z) (circular_area_callee_readidx: Z) (retval_2: Z) (PreH1 : (0 <> retval_2)) (PreH2 : (retval_2 <> 0)) (PreH3 : ((unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)) > 0)) (PreH4 : (circular_area_callee_readidx = 0)) (PreH5 : (circular_area_callee_writeidx = 0)) (PreH6 : (circular_area_callee_b_status = 0)) (PreH7 : (0 <> retval)) (PreH8 : (retval <> 0)) (PreH9 : (circular_area_length_pre > 0)) (PreH10 : (0 < circular_area_length_pre)) (PreH11 : (circular_area_length_pre <= 256)) ,
  (UCharArray.undef_full retval_2 (unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)) )
|--
  “ (CircularAreaInitDescriptorState (unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)) retval retval_2 0 0 retval_2 (retval_2 + (unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)) ) (unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)) 0 ( &( "CircularAreaOperations" ) ) ( &( "CircularAreaOperations" ) ) ) ”
.

Definition CircularAreaInit_return_wit_1_split_goal_2 := 
forall (circular_area_length_pre: Z) (retval: Z) (circular_area_callee_b_status: Z) (circular_area_callee_writeidx: Z) (circular_area_callee_readidx: Z) (retval_2: Z) (PreH1 : (0 <> retval_2)) (PreH2 : (retval_2 <> 0)) (PreH3 : ((unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)) > 0)) (PreH4 : (circular_area_callee_readidx = 0)) (PreH5 : (circular_area_callee_writeidx = 0)) (PreH6 : (circular_area_callee_b_status = 0)) (PreH7 : (0 <> retval)) (PreH8 : (retval <> 0)) (PreH9 : (circular_area_length_pre > 0)) (PreH10 : (0 < circular_area_length_pre)) (PreH11 : (circular_area_length_pre <= 256)) ,
  (UCharArray.undef_full retval_2 (unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)) )
|--
  “ (CircularAreaAlignedLength circular_area_length_pre (unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)) ) ”
.

Definition CircularAreaInit_return_wit_1_split_goal_spatial := 
forall (circular_area_length_pre: Z) (retval: Z) (circular_area_callee_b_status: Z) (circular_area_callee_writeidx: Z) (circular_area_callee_readidx: Z) (retval_2: Z) (PreH1 : (0 <> retval_2)) (PreH2 : (retval_2 <> 0)) (PreH3 : ((unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)) > 0)) (PreH4 : (circular_area_callee_readidx = 0)) (PreH5 : (circular_area_callee_writeidx = 0)) (PreH6 : (circular_area_callee_b_status = 0)) (PreH7 : (0 <> retval)) (PreH8 : (retval <> 0)) (PreH9 : (circular_area_length_pre > 0)) (PreH10 : (0 < circular_area_length_pre)) (PreH11 : (circular_area_length_pre <= 256)) ,
  (UCharArray.undef_full retval_2 (unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)) )
|--
  (UCharArray.undef_full retval_2 (unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)) )
.

Definition CircularAreaInit_return_wit_2 := 
forall (circular_area_length_pre: Z) (retval: Z) (circular_area_callee_b_status: Z) (circular_area_callee_writeidx: Z) (circular_area_callee_readidx: Z) (retval_2: Z) (PreH1 : (0 = retval_2)) (PreH2 : (retval_2 = 0)) (PreH3 : (circular_area_callee_readidx = 0)) (PreH4 : (circular_area_callee_writeidx = 0)) (PreH5 : (circular_area_callee_b_status = 0)) (PreH6 : (0 <> retval)) (PreH7 : (retval <> 0)) (PreH8 : (circular_area_length_pre > 0)) (PreH9 : (0 < circular_area_length_pre)) (PreH10 : (circular_area_length_pre <= 256)) ,
  ((&((retval)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> retval_2)
  **  ((&((retval)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> circular_area_callee_readidx)
  **  ((&((retval)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> circular_area_callee_writeidx)
  **  ((&((retval)  # "CircularArea" ->ₛ "p_head")) # Ptr  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "area_length")) # UInt  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "b_status")) # Int  |-> circular_area_callee_b_status)
  **  ((&((retval)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |->_)
|--
  (EX (circular_area: Z)  (aligned: Z) ,
  “ (circular_area_length_pre > 0) ” 
  &&  “ (CircularAreaAlignedLength circular_area_length_pre aligned ) ” 
  &&  “ (0 = 0) ”
  &&  (CircularAreaInitFailureState circular_area &((circular_area)  # "CircularArea" ->ₛ "data_buffer") &((circular_area)  # "CircularArea" ->ₛ "readidx") &((circular_area)  # "CircularArea" ->ₛ "writeidx") &((circular_area)  # "CircularArea" ->ₛ "p_head") &((circular_area)  # "CircularArea" ->ₛ "p_tail") &((circular_area)  # "CircularArea" ->ₛ "area_length") &((circular_area)  # "CircularArea" ->ₛ "b_status") &((circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations") ))
  ||
  (EX (circular_area_b_status: Z)  (circular_area_p_tail: Z)  (circular_area_writeidx: Z)  (circular_area_readidx: Z)  (circular_area_2: Z)  (data_buffer: Z)  (aligned_2: Z) ,
  “ (circular_area_length_pre > 0) ” 
  &&  “ (CircularAreaAlignedLength circular_area_length_pre aligned_2 ) ” 
  &&  “ (CircularAreaInitDescriptorState aligned_2 circular_area_2 data_buffer 0 0 data_buffer (data_buffer + aligned_2 ) aligned_2 0 ( &( "CircularAreaOperations" ) ) ( &( "CircularAreaOperations" ) ) ) ” 
  &&  “ (0 = circular_area_2) ” 
  &&  “ (circular_area_readidx = 0) ” 
  &&  “ (circular_area_writeidx = 0) ” 
  &&  “ (circular_area_p_tail = (data_buffer + aligned_2 )) ” 
  &&  “ (circular_area_b_status = 0) ”
  &&  ((&((circular_area_2)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_2)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> circular_area_readidx)
  **  ((&((circular_area_2)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> circular_area_writeidx)
  **  ((&((circular_area_2)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_2)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> circular_area_p_tail)
  **  ((&((circular_area_2)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> aligned_2)
  **  ((&((circular_area_2)  # "CircularArea" ->ₛ "b_status")) # Int  |-> circular_area_b_status)
  **  ((&((circular_area_2)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> ( &( "CircularAreaOperations" ) ))
  **  (UCharArray.undef_full data_buffer aligned_2 ))
.

Definition CircularAreaInit_return_wit_3 := 
forall (circular_area_length_pre: Z) (retval: Z) (PreH1 : (0 = retval)) (PreH2 : (retval = 0)) (PreH3 : (circular_area_length_pre > 0)) (PreH4 : (0 < circular_area_length_pre)) (PreH5 : (circular_area_length_pre <= 256)) ,
  TT && emp 
|--
  (EX (circular_area: Z)  (aligned: Z) ,
  “ (circular_area_length_pre > 0) ” 
  &&  “ (CircularAreaAlignedLength circular_area_length_pre aligned ) ” 
  &&  “ (0 = 0) ”
  &&  (CircularAreaInitFailureState circular_area &((circular_area)  # "CircularArea" ->ₛ "data_buffer") &((circular_area)  # "CircularArea" ->ₛ "readidx") &((circular_area)  # "CircularArea" ->ₛ "writeidx") &((circular_area)  # "CircularArea" ->ₛ "p_head") &((circular_area)  # "CircularArea" ->ₛ "p_tail") &((circular_area)  # "CircularArea" ->ₛ "area_length") &((circular_area)  # "CircularArea" ->ₛ "b_status") &((circular_area)  # "CircularArea" ->ₛ "CircularAreaOperations") ))
  ||
  (EX (circular_area_b_status: Z)  (circular_area_p_tail: Z)  (circular_area_writeidx: Z)  (circular_area_readidx: Z)  (circular_area_2: Z)  (data_buffer: Z)  (aligned_2: Z) ,
  “ (circular_area_length_pre > 0) ” 
  &&  “ (CircularAreaAlignedLength circular_area_length_pre aligned_2 ) ” 
  &&  “ (CircularAreaInitDescriptorState aligned_2 circular_area_2 data_buffer 0 0 data_buffer (data_buffer + aligned_2 ) aligned_2 0 ( &( "CircularAreaOperations" ) ) ( &( "CircularAreaOperations" ) ) ) ” 
  &&  “ (0 = circular_area_2) ” 
  &&  “ (circular_area_readidx = 0) ” 
  &&  “ (circular_area_writeidx = 0) ” 
  &&  “ (circular_area_p_tail = (data_buffer + aligned_2 )) ” 
  &&  “ (circular_area_b_status = 0) ”
  &&  ((&((circular_area_2)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_2)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> circular_area_readidx)
  **  ((&((circular_area_2)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> circular_area_writeidx)
  **  ((&((circular_area_2)  # "CircularArea" ->ₛ "p_head")) # Ptr  |-> data_buffer)
  **  ((&((circular_area_2)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |-> circular_area_p_tail)
  **  ((&((circular_area_2)  # "CircularArea" ->ₛ "area_length")) # UInt  |-> aligned_2)
  **  ((&((circular_area_2)  # "CircularArea" ->ₛ "b_status")) # Int  |-> circular_area_b_status)
  **  ((&((circular_area_2)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |-> ( &( "CircularAreaOperations" ) ))
  **  (UCharArray.undef_full data_buffer aligned_2 ))
.

Definition CircularAreaInit_partial_solve_wit_1_pure := 
forall (circular_area_length_pre: Z) (PreH1 : (circular_area_length_pre > 0)) (PreH2 : (0 < circular_area_length_pre)) (PreH3 : (circular_area_length_pre <= 256)) ,
  ((( &( "circular_area" ) )) # Ptr  |->_)
  **  ((( &( "circular_area_length" ) )) # UInt  |-> (unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)))
|--
  “ (sizeof( "CircularArea" ) = sizeof( "CircularArea" )) ”
.

Definition CircularAreaInit_partial_solve_wit_1_aux := 
forall (circular_area_length_pre: Z) (PreH1 : (circular_area_length_pre > 0)) (PreH2 : (0 < circular_area_length_pre)) (PreH3 : (circular_area_length_pre <= 256)) ,
  TT && emp 
|--
  “ (sizeof( "CircularArea" ) = sizeof( "CircularArea" )) ” 
  &&  “ (circular_area_length_pre > 0) ” 
  &&  “ (0 < circular_area_length_pre) ” 
  &&  “ (circular_area_length_pre <= 256) ”
  &&  emp
.

Definition CircularAreaInit_partial_solve_wit_1 := CircularAreaInit_partial_solve_wit_1_pure -> CircularAreaInit_partial_solve_wit_1_aux.

Definition CircularAreaInit_partial_solve_wit_2_pure := 
forall (circular_area_length_pre: Z) (retval: Z) (PreH1 : (0 = retval)) (PreH2 : (retval = 0)) (PreH3 : (circular_area_length_pre > 0)) (PreH4 : (0 < circular_area_length_pre)) (PreH5 : (circular_area_length_pre <= 256)) ,
  ((( &( "circular_area" ) )) # Ptr  |-> retval)
  **  ((( &( "circular_area_length" ) )) # UInt  |-> (unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)))
|--
  “ (retval = 0) ”
.

Definition CircularAreaInit_partial_solve_wit_2_aux := 
forall (circular_area_length_pre: Z) (retval: Z) (PreH1 : (0 = retval)) (PreH2 : (retval = 0)) (PreH3 : (circular_area_length_pre > 0)) (PreH4 : (0 < circular_area_length_pre)) (PreH5 : (circular_area_length_pre <= 256)) ,
  TT && emp 
|--
  “ (retval = 0) ” 
  &&  “ (0 = retval) ” 
  &&  “ (retval = 0) ” 
  &&  “ (circular_area_length_pre > 0) ” 
  &&  “ (0 < circular_area_length_pre) ” 
  &&  “ (circular_area_length_pre <= 256) ”
  &&  emp
.

Definition CircularAreaInit_partial_solve_wit_2 := CircularAreaInit_partial_solve_wit_2_pure -> CircularAreaInit_partial_solve_wit_2_aux.

Definition CircularAreaInit_partial_solve_wit_3_pure := 
forall (circular_area_length_pre: Z) (retval: Z) (PreH1 : (0 <> retval)) (PreH2 : (retval <> 0)) (PreH3 : (circular_area_length_pre > 0)) (PreH4 : (0 < circular_area_length_pre)) (PreH5 : (circular_area_length_pre <= 256)) ,
  ((&((retval)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "readidx")) # UChar  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "writeidx")) # UChar  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "p_head")) # Ptr  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "area_length")) # UInt  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "b_status")) # Int  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |->_)
  **  ((( &( "circular_area" ) )) # Ptr  |-> retval)
  **  ((( &( "circular_area_length" ) )) # UInt  |-> (unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)))
|--
  “ (retval <> 0) ”
.

Definition CircularAreaInit_partial_solve_wit_3_aux := 
forall (circular_area_length_pre: Z) (retval: Z) (PreH1 : (0 <> retval)) (PreH2 : (retval <> 0)) (PreH3 : (circular_area_length_pre > 0)) (PreH4 : (0 < circular_area_length_pre)) (PreH5 : (circular_area_length_pre <= 256)) ,
  ((&((retval)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "readidx")) # UChar  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "writeidx")) # UChar  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "p_head")) # Ptr  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "area_length")) # UInt  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "b_status")) # Int  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |->_)
|--
  “ (retval <> 0) ” 
  &&  “ (0 <> retval) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (circular_area_length_pre > 0) ” 
  &&  “ (0 < circular_area_length_pre) ” 
  &&  “ (circular_area_length_pre <= 256) ”
  &&  ((&((retval)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "readidx")) # UChar  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "writeidx")) # UChar  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "p_head")) # Ptr  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "area_length")) # UInt  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "b_status")) # Int  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |->_)
.

Definition CircularAreaInit_partial_solve_wit_3 := CircularAreaInit_partial_solve_wit_3_pure -> CircularAreaInit_partial_solve_wit_3_aux.

Definition CircularAreaInit_partial_solve_wit_4_pure := 
forall (circular_area_length_pre: Z) (retval: Z) (circular_area_callee_b_status: Z) (circular_area_callee_writeidx: Z) (circular_area_callee_readidx: Z) (PreH1 : (circular_area_callee_readidx = 0)) (PreH2 : (circular_area_callee_writeidx = 0)) (PreH3 : (circular_area_callee_b_status = 0)) (PreH4 : (0 <> retval)) (PreH5 : (retval <> 0)) (PreH6 : (circular_area_length_pre > 0)) (PreH7 : (0 < circular_area_length_pre)) (PreH8 : (circular_area_length_pre <= 256)) ,
  ((&((retval)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> circular_area_callee_readidx)
  **  ((&((retval)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> circular_area_callee_writeidx)
  **  ((&((retval)  # "CircularArea" ->ₛ "p_head")) # Ptr  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "area_length")) # UInt  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "b_status")) # Int  |-> circular_area_callee_b_status)
  **  ((&((retval)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |->_)
  **  ((( &( "circular_area" ) )) # Ptr  |-> retval)
  **  ((( &( "circular_area_length" ) )) # UInt  |-> (unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)))
|--
  “ ((unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)) <= UINT_MAX) ” 
  &&  “ (0 <= (unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32))) ”
.

Definition CircularAreaInit_partial_solve_wit_4_aux := 
forall (circular_area_length_pre: Z) (retval: Z) (circular_area_callee_b_status: Z) (circular_area_callee_writeidx: Z) (circular_area_callee_readidx: Z) (PreH1 : (circular_area_callee_readidx = 0)) (PreH2 : (circular_area_callee_writeidx = 0)) (PreH3 : (circular_area_callee_b_status = 0)) (PreH4 : (0 <> retval)) (PreH5 : (retval <> 0)) (PreH6 : (circular_area_length_pre > 0)) (PreH7 : (0 < circular_area_length_pre)) (PreH8 : (circular_area_length_pre <= 256)) ,
  ((&((retval)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> circular_area_callee_readidx)
  **  ((&((retval)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> circular_area_callee_writeidx)
  **  ((&((retval)  # "CircularArea" ->ₛ "p_head")) # Ptr  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "area_length")) # UInt  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "b_status")) # Int  |-> circular_area_callee_b_status)
  **  ((&((retval)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |->_)
|--
  “ ((unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)) <= UINT_MAX) ” 
  &&  “ (0 <= (unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32))) ” 
  &&  “ (circular_area_callee_readidx = 0) ” 
  &&  “ (circular_area_callee_writeidx = 0) ” 
  &&  “ (circular_area_callee_b_status = 0) ” 
  &&  “ (0 <> retval) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (circular_area_length_pre > 0) ” 
  &&  “ (0 < circular_area_length_pre) ” 
  &&  “ (circular_area_length_pre <= 256) ”
  &&  ((&((retval)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> circular_area_callee_readidx)
  **  ((&((retval)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> circular_area_callee_writeidx)
  **  ((&((retval)  # "CircularArea" ->ₛ "p_head")) # Ptr  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "area_length")) # UInt  |->_)
  **  ((&((retval)  # "CircularArea" ->ₛ "b_status")) # Int  |-> circular_area_callee_b_status)
  **  ((&((retval)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |->_)
.

Definition CircularAreaInit_partial_solve_wit_4 := CircularAreaInit_partial_solve_wit_4_pure -> CircularAreaInit_partial_solve_wit_4_aux.

Definition CircularAreaInit_partial_solve_wit_5_pure := 
forall (circular_area_length_pre: Z) (retval_2: Z) (circular_area_callee_b_status: Z) (circular_area_callee_writeidx: Z) (circular_area_callee_readidx: Z) (retval: Z) (PreH1 : (0 = retval)) (PreH2 : (retval = 0)) (PreH3 : (circular_area_callee_readidx = 0)) (PreH4 : (circular_area_callee_writeidx = 0)) (PreH5 : (circular_area_callee_b_status = 0)) (PreH6 : (0 <> retval_2)) (PreH7 : (retval_2 <> 0)) (PreH8 : (circular_area_length_pre > 0)) (PreH9 : (0 < circular_area_length_pre)) (PreH10 : (circular_area_length_pre <= 256)) ,
  ((&((retval_2)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> retval)
  **  ((&((retval_2)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> circular_area_callee_readidx)
  **  ((&((retval_2)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> circular_area_callee_writeidx)
  **  ((&((retval_2)  # "CircularArea" ->ₛ "p_head")) # Ptr  |->_)
  **  ((&((retval_2)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |->_)
  **  ((&((retval_2)  # "CircularArea" ->ₛ "area_length")) # UInt  |->_)
  **  ((&((retval_2)  # "CircularArea" ->ₛ "b_status")) # Int  |-> circular_area_callee_b_status)
  **  ((&((retval_2)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |->_)
  **  ((( &( "circular_area" ) )) # Ptr  |-> retval_2)
  **  ((( &( "circular_area_length" ) )) # UInt  |-> (unsigned_last_nbits (((circular_area_length_pre ÷ 4 ) * 4 )) (32)))
|--
  “ (retval = 0) ”
.

Definition CircularAreaInit_partial_solve_wit_5_aux := 
forall (circular_area_length_pre: Z) (retval_2: Z) (circular_area_callee_b_status: Z) (circular_area_callee_writeidx: Z) (circular_area_callee_readidx: Z) (retval: Z) (PreH1 : (0 = retval)) (PreH2 : (retval = 0)) (PreH3 : (circular_area_callee_readidx = 0)) (PreH4 : (circular_area_callee_writeidx = 0)) (PreH5 : (circular_area_callee_b_status = 0)) (PreH6 : (0 <> retval_2)) (PreH7 : (retval_2 <> 0)) (PreH8 : (circular_area_length_pre > 0)) (PreH9 : (0 < circular_area_length_pre)) (PreH10 : (circular_area_length_pre <= 256)) ,
  ((&((retval_2)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> retval)
  **  ((&((retval_2)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> circular_area_callee_readidx)
  **  ((&((retval_2)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> circular_area_callee_writeidx)
  **  ((&((retval_2)  # "CircularArea" ->ₛ "p_head")) # Ptr  |->_)
  **  ((&((retval_2)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |->_)
  **  ((&((retval_2)  # "CircularArea" ->ₛ "area_length")) # UInt  |->_)
  **  ((&((retval_2)  # "CircularArea" ->ₛ "b_status")) # Int  |-> circular_area_callee_b_status)
  **  ((&((retval_2)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |->_)
|--
  “ (retval = 0) ” 
  &&  “ (0 = retval) ” 
  &&  “ (retval = 0) ” 
  &&  “ (circular_area_callee_readidx = 0) ” 
  &&  “ (circular_area_callee_writeidx = 0) ” 
  &&  “ (circular_area_callee_b_status = 0) ” 
  &&  “ (0 <> retval_2) ” 
  &&  “ (retval_2 <> 0) ” 
  &&  “ (circular_area_length_pre > 0) ” 
  &&  “ (0 < circular_area_length_pre) ” 
  &&  “ (circular_area_length_pre <= 256) ”
  &&  ((&((retval_2)  # "CircularArea" ->ₛ "data_buffer")) # Ptr  |-> retval)
  **  ((&((retval_2)  # "CircularArea" ->ₛ "readidx")) # UChar  |-> circular_area_callee_readidx)
  **  ((&((retval_2)  # "CircularArea" ->ₛ "writeidx")) # UChar  |-> circular_area_callee_writeidx)
  **  ((&((retval_2)  # "CircularArea" ->ₛ "p_head")) # Ptr  |->_)
  **  ((&((retval_2)  # "CircularArea" ->ₛ "p_tail")) # Ptr  |->_)
  **  ((&((retval_2)  # "CircularArea" ->ₛ "area_length")) # UInt  |->_)
  **  ((&((retval_2)  # "CircularArea" ->ₛ "b_status")) # Int  |-> circular_area_callee_b_status)
  **  ((&((retval_2)  # "CircularArea" ->ₛ "CircularAreaOperations")) # Ptr  |->_)
.

Definition CircularAreaInit_partial_solve_wit_5 := CircularAreaInit_partial_solve_wit_5_pure -> CircularAreaInit_partial_solve_wit_5_aux.

Module Type VC_Correct.


Axiom proof_of_CircularAreaReset_safety_wit_1 : CircularAreaReset_safety_wit_1.
Axiom proof_of_CircularAreaReset_safety_wit_2 : CircularAreaReset_safety_wit_2.
Axiom proof_of_CircularAreaReset_safety_wit_3 : CircularAreaReset_safety_wit_3.
Axiom proof_of_CircularAreaReset_return_wit_1 : CircularAreaReset_return_wit_1.
Axiom proof_of_CircularAreaInit_safety_wit_1 : CircularAreaInit_safety_wit_1.
Axiom proof_of_CircularAreaInit_safety_wit_2 : CircularAreaInit_safety_wit_2.
Axiom proof_of_CircularAreaInit_safety_wit_3 : CircularAreaInit_safety_wit_3.
Axiom proof_of_CircularAreaInit_safety_wit_4 : CircularAreaInit_safety_wit_4.
Axiom proof_of_CircularAreaInit_safety_wit_5 : CircularAreaInit_safety_wit_5.
Axiom proof_of_CircularAreaInit_safety_wit_6 : CircularAreaInit_safety_wit_6.
Axiom proof_of_CircularAreaInit_safety_wit_7 : CircularAreaInit_safety_wit_7.
Axiom proof_of_CircularAreaInit_safety_wit_8 : CircularAreaInit_safety_wit_8.
Axiom proof_of_CircularAreaInit_safety_wit_9 : CircularAreaInit_safety_wit_9.
Axiom proof_of_CircularAreaInit_safety_wit_10 : CircularAreaInit_safety_wit_10.
Axiom proof_of_CircularAreaInit_safety_wit_11 : CircularAreaInit_safety_wit_11.
Axiom proof_of_CircularAreaInit_safety_wit_12 : CircularAreaInit_safety_wit_12.
Axiom proof_of_CircularAreaInit_safety_wit_13 : CircularAreaInit_safety_wit_13.
Axiom proof_of_CircularAreaInit_safety_wit_14 : CircularAreaInit_safety_wit_14.
Axiom proof_of_CircularAreaInit_return_wit_1 : CircularAreaInit_return_wit_1.
Axiom proof_of_CircularAreaInit_return_wit_2 : CircularAreaInit_return_wit_2.
Axiom proof_of_CircularAreaInit_return_wit_3 : CircularAreaInit_return_wit_3.
Axiom proof_of_CircularAreaInit_partial_solve_wit_1_pure : CircularAreaInit_partial_solve_wit_1_pure.
Axiom proof_of_CircularAreaInit_partial_solve_wit_1 : CircularAreaInit_partial_solve_wit_1.
Axiom proof_of_CircularAreaInit_partial_solve_wit_2_pure : CircularAreaInit_partial_solve_wit_2_pure.
Axiom proof_of_CircularAreaInit_partial_solve_wit_2 : CircularAreaInit_partial_solve_wit_2.
Axiom proof_of_CircularAreaInit_partial_solve_wit_3_pure : CircularAreaInit_partial_solve_wit_3_pure.
Axiom proof_of_CircularAreaInit_partial_solve_wit_3 : CircularAreaInit_partial_solve_wit_3.
Axiom proof_of_CircularAreaInit_partial_solve_wit_4_pure : CircularAreaInit_partial_solve_wit_4_pure.
Axiom proof_of_CircularAreaInit_partial_solve_wit_4 : CircularAreaInit_partial_solve_wit_4.
Axiom proof_of_CircularAreaInit_partial_solve_wit_5_pure : CircularAreaInit_partial_solve_wit_5_pure.
Axiom proof_of_CircularAreaInit_partial_solve_wit_5 : CircularAreaInit_partial_solve_wit_5.

End VC_Correct.
