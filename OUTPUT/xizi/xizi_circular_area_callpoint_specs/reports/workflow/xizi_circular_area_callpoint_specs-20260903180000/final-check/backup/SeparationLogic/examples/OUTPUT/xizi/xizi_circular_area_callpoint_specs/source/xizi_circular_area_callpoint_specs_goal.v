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
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_callpoint_specs.source
      Require Import xizi_circular_area_callpoint_specs_lib.
Local Open Scope sac.

(*----- Function xizi_circular_area_call_init_metadata_release -----*)

Definition xizi_circular_area_call_init_metadata_release_safety_wit_1 := 
forall (requested_pre: Z) (LitMap: (string -> Z)) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (4 <= requested_pre)) (PreH3 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  (GlobalStrings LitMap )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_init_metadata_release_safety_wit_2 := 
forall (requested_pre: Z) (LitMap: (string -> Z)) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (4 <= requested_pre)) (PreH3 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  (GlobalStrings LitMap )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_init_metadata_release_safety_wit_3 := 
forall (requested_pre: Z) (LitMap: (string -> Z)) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  (GlobalStrings LitMap )
|--
  “ False ”
.

Definition xizi_circular_area_call_init_metadata_release_safety_wit_4 := 
forall (requested_pre: Z) (LitMap: (string -> Z)) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval <> 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  (GlobalStrings LitMap )
|--
  “ False ”
.

Definition xizi_circular_area_call_init_metadata_release_safety_wit_5 := 
forall (requested_pre: Z) (LitMap: (string -> Z)) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  (GlobalStrings LitMap )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_init_metadata_release_safety_wit_6 := 
forall (requested_pre: Z) (LitMap: (string -> Z)) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (CircularAreaStateDataLengthResult (CircularAreaInitState (requested_pre)) retval_5 )) (PreH2 : (retval_4 = (ca_capacity ((CircularAreaInitState (requested_pre)))))) (PreH3 : (CircularAreaStateFullResult (CircularAreaInitState (requested_pre)) retval_3 )) (PreH4 : (CircularAreaStateEmptyResult (CircularAreaInitState (requested_pre)) retval_2 )) (PreH5 : (retval <> 0)) (PreH6 : (retval <> 0)) (PreH7 : (4 <= requested_pre)) (PreH8 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition xizi_circular_area_call_init_metadata_release_return_wit_1 := 
(
forall (requested_pre: Z) (LitMap: (string -> Z)) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (CircularAreaStateDataLengthResult (CircularAreaInitState (requested_pre)) retval_5 )) (PreH2 : (retval_4 = (ca_capacity ((CircularAreaInitState (requested_pre)))))) (PreH3 : (CircularAreaStateFullResult (CircularAreaInitState (requested_pre)) retval_3 )) (PreH4 : (CircularAreaStateEmptyResult (CircularAreaInitState (requested_pre)) retval_2 )) (PreH5 : (retval <> 0)) (PreH6 : (retval <> 0)) (PreH7 : (4 <= requested_pre)) (PreH8 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 1 )
) \/
(
forall (requested_pre: Z) (LitMap: (string -> Z)) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (CircularAreaStateDataLengthResult (CircularAreaInitState (requested_pre)) retval_5 )) (PreH2 : (retval_4 = (ca_capacity ((CircularAreaInitState (requested_pre)))))) (PreH3 : (CircularAreaStateFullResult (CircularAreaInitState (requested_pre)) retval_3 )) (PreH4 : (CircularAreaStateEmptyResult (CircularAreaInitState (requested_pre)) retval_2 )) (PreH5 : (retval <> 0)) (PreH6 : (retval <> 0)) (PreH7 : (4 <= requested_pre)) (PreH8 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 1 )
).

Definition xizi_circular_area_call_init_metadata_release_return_wit_1_split_goal_spatial := 
forall (requested_pre: Z) (LitMap: (string -> Z)) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (CircularAreaStateDataLengthResult (CircularAreaInitState (requested_pre)) retval_5 )) (PreH2 : (retval_4 = (ca_capacity ((CircularAreaInitState (requested_pre)))))) (PreH3 : (CircularAreaStateFullResult (CircularAreaInitState (requested_pre)) retval_3 )) (PreH4 : (CircularAreaStateEmptyResult (CircularAreaInitState (requested_pre)) retval_2 )) (PreH5 : (retval <> 0)) (PreH6 : (retval <> 0)) (PreH7 : (4 <= requested_pre)) (PreH8 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 1 )
.

Definition xizi_circular_area_call_init_metadata_release_return_wit_2 := 
(
forall (requested_pre: Z) (LitMap: (string -> Z)) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 0 )
) \/
(
forall (requested_pre: Z) (LitMap: (string -> Z)) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 0 )
).

Definition xizi_circular_area_call_init_metadata_release_return_wit_2_split_goal_spatial := 
forall (requested_pre: Z) (LitMap: (string -> Z)) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 0 )
.

Definition xizi_circular_area_call_init_metadata_release_partial_solve_wit_1_pure := 
forall (requested_pre: Z) (LitMap: (string -> Z)) (PreH1 : (4 <= requested_pre)) (PreH2 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |->_)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  (GlobalStrings LitMap )
|--
  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
.

Definition xizi_circular_area_call_init_metadata_release_partial_solve_wit_1_aux := 
forall (requested_pre: Z) (LitMap: (string -> Z)) (PreH1 : (4 <= requested_pre)) (PreH2 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
|--
  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
.

Definition xizi_circular_area_call_init_metadata_release_partial_solve_wit_1 := xizi_circular_area_call_init_metadata_release_partial_solve_wit_1_pure -> xizi_circular_area_call_init_metadata_release_partial_solve_wit_1_aux.

Definition xizi_circular_area_call_init_metadata_release_partial_solve_wit_2 := 
forall (requested_pre: Z) (LitMap: (string -> Z)) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  (GlobalStrings LitMap )
|--
  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
.

Definition xizi_circular_area_call_init_metadata_release_partial_solve_wit_3 := 
forall (requested_pre: Z) (LitMap: (string -> Z)) (retval: Z) (retval_2: Z) (PreH1 : (CircularAreaStateEmptyResult (CircularAreaInitState (requested_pre)) retval_2 )) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (4 <= requested_pre)) (PreH5 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
|--
  “ (CircularAreaStateEmptyResult (CircularAreaInitState (requested_pre)) retval_2 ) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
.

Definition xizi_circular_area_call_init_metadata_release_partial_solve_wit_4 := 
forall (requested_pre: Z) (LitMap: (string -> Z)) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (CircularAreaStateFullResult (CircularAreaInitState (requested_pre)) retval_3 )) (PreH2 : (CircularAreaStateEmptyResult (CircularAreaInitState (requested_pre)) retval_2 )) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
|--
  “ (CircularAreaStateFullResult (CircularAreaInitState (requested_pre)) retval_3 ) ” 
  &&  “ (CircularAreaStateEmptyResult (CircularAreaInitState (requested_pre)) retval_2 ) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
.

Definition xizi_circular_area_call_init_metadata_release_partial_solve_wit_5 := 
forall (requested_pre: Z) (LitMap: (string -> Z)) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (ca_capacity ((CircularAreaInitState (requested_pre)))))) (PreH2 : (CircularAreaStateFullResult (CircularAreaInitState (requested_pre)) retval_3 )) (PreH3 : (CircularAreaStateEmptyResult (CircularAreaInitState (requested_pre)) retval_2 )) (PreH4 : (retval <> 0)) (PreH5 : (retval <> 0)) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
|--
  “ (retval_4 = (ca_capacity ((CircularAreaInitState (requested_pre))))) ” 
  &&  “ (CircularAreaStateFullResult (CircularAreaInitState (requested_pre)) retval_3 ) ” 
  &&  “ (CircularAreaStateEmptyResult (CircularAreaInitState (requested_pre)) retval_2 ) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
.

Definition xizi_circular_area_call_init_metadata_release_partial_solve_wit_6 := 
forall (requested_pre: Z) (LitMap: (string -> Z)) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (CircularAreaStateDataLengthResult (CircularAreaInitState (requested_pre)) retval_5 )) (PreH2 : (retval_4 = (ca_capacity ((CircularAreaInitState (requested_pre)))))) (PreH3 : (CircularAreaStateFullResult (CircularAreaInitState (requested_pre)) retval_3 )) (PreH4 : (CircularAreaStateEmptyResult (CircularAreaInitState (requested_pre)) retval_2 )) (PreH5 : (retval <> 0)) (PreH6 : (retval <> 0)) (PreH7 : (4 <= requested_pre)) (PreH8 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
|--
  “ (CircularAreaStateDataLengthResult (CircularAreaInitState (requested_pre)) retval_5 ) ” 
  &&  “ (retval_4 = (ca_capacity ((CircularAreaInitState (requested_pre))))) ” 
  &&  “ (CircularAreaStateFullResult (CircularAreaInitState (requested_pre)) retval_3 ) ” 
  &&  “ (CircularAreaStateEmptyResult (CircularAreaInitState (requested_pre)) retval_2 ) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
.

(*----- Function xizi_circular_area_call_init_empty_read_release -----*)

Definition xizi_circular_area_call_init_empty_read_release_safety_wit_1 := 
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (4 <= requested_pre)) (PreH3 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_init_empty_read_release_safety_wit_2 := 
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (4 <= requested_pre)) (PreH3 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_init_empty_read_release_safety_wit_3 := 
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  “ False ”
.

Definition xizi_circular_area_call_init_empty_read_release_safety_wit_4 := 
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval <> 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  “ False ”
.

Definition xizi_circular_area_call_init_empty_read_release_safety_wit_5 := 
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_init_empty_read_release_safety_wit_6 := 
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition xizi_circular_area_call_init_empty_read_release_safety_wit_7 := 
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 1)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (4 <= requested_pre)) (PreH5 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition xizi_circular_area_call_init_empty_read_release_return_wit_1 := 
(
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 1)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (4 <= requested_pre)) (PreH5 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 1 )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
) \/
(
forall (requested_pre: Z) (LitMap: (string -> Z)) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 1)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (4 <= requested_pre)) (PreH5 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 1 )
).

Definition xizi_circular_area_call_init_empty_read_release_return_wit_1_split_goal_spatial := 
forall (requested_pre: Z) (LitMap: (string -> Z)) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 1)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (4 <= requested_pre)) (PreH5 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 1 )
.

Definition xizi_circular_area_call_init_empty_read_release_return_wit_2 := 
(
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 0 )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
) \/
(
forall (requested_pre: Z) (LitMap: (string -> Z)) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 0 )
).

Definition xizi_circular_area_call_init_empty_read_release_return_wit_2_split_goal_spatial := 
forall (requested_pre: Z) (LitMap: (string -> Z)) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 0 )
.

Definition xizi_circular_area_call_init_empty_read_release_partial_solve_wit_1_pure := 
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (PreH1 : (4 <= requested_pre)) (PreH2 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |->_)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
.

Definition xizi_circular_area_call_init_empty_read_release_partial_solve_wit_1_aux := 
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (PreH1 : (4 <= requested_pre)) (PreH2 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
.

Definition xizi_circular_area_call_init_empty_read_release_partial_solve_wit_1 := xizi_circular_area_call_init_empty_read_release_partial_solve_wit_1_pure -> xizi_circular_area_call_init_empty_read_release_partial_solve_wit_1_aux.

Definition xizi_circular_area_call_init_empty_read_release_partial_solve_wit_2_pure := 
(
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  “ (1 = 1) ” 
  &&  “ ((ca_capacity ((CircularAreaInitState (requested_pre)))) = (ca_capacity ((CircularAreaInitState (requested_pre))))) ” 
  &&  “ ((ca_contents ((CircularAreaInitState (requested_pre)))) = (@nil Z)) ”
) \/
(
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (retval: Z) (PreH1 : (requested_pre <= UINT_MAX)) (PreH2 : (requested_pre >= 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  “ ((ca_contents ((CircularAreaInitState (requested_pre)))) = (@nil Z)) ”
).

Definition xizi_circular_area_call_init_empty_read_release_partial_solve_wit_2_pure_split_goal_1 := 
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (retval: Z) (PreH1 : (requested_pre <= UINT_MAX)) (PreH2 : (requested_pre >= 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  “ ((ca_contents ((CircularAreaInitState (requested_pre)))) = (@nil Z)) ”
.

Definition xizi_circular_area_call_init_empty_read_release_partial_solve_wit_2_aux := 
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  “ (1 = 1) ” 
  &&  “ ((ca_capacity ((CircularAreaInitState (requested_pre)))) = (ca_capacity ((CircularAreaInitState (requested_pre))))) ” 
  &&  “ ((ca_contents ((CircularAreaInitState (requested_pre)))) = (@nil Z)) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
.

Definition xizi_circular_area_call_init_empty_read_release_partial_solve_wit_2 := xizi_circular_area_call_init_empty_read_release_partial_solve_wit_2_pure -> xizi_circular_area_call_init_empty_read_release_partial_solve_wit_2_aux.

Definition xizi_circular_area_call_init_empty_read_release_partial_solve_wit_3 := 
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 1)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (4 <= requested_pre)) (PreH5 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  “ (retval_2 = 1) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
.

(*----- Function xizi_circular_area_call_init_first_write_release -----*)

Definition xizi_circular_area_call_init_first_write_release_safety_wit_1 := 
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (4 <= requested_pre)) (PreH3 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_init_first_write_release_safety_wit_2 := 
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (4 <= requested_pre)) (PreH3 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_init_first_write_release_safety_wit_3 := 
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ False ”
.

Definition xizi_circular_area_call_init_first_write_release_safety_wit_4 := 
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval <> 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ False ”
.

Definition xizi_circular_area_call_init_first_write_release_safety_wit_5 := 
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_init_first_write_release_safety_wit_6 := 
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition xizi_circular_area_call_init_first_write_release_safety_wit_7 := 
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_init_first_write_release_safety_wit_8 := 
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (4 <= requested_pre)) (PreH5 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition xizi_circular_area_call_init_first_write_release_return_wit_1 := 
(
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (4 <= requested_pre)) (PreH5 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 1 )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
) \/
(
forall (requested_pre: Z) (LitMap: (string -> Z)) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (4 <= requested_pre)) (PreH5 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 1 )
).

Definition xizi_circular_area_call_init_first_write_release_return_wit_1_split_goal_spatial := 
forall (requested_pre: Z) (LitMap: (string -> Z)) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (4 <= requested_pre)) (PreH5 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 1 )
.

Definition xizi_circular_area_call_init_first_write_release_return_wit_2 := 
(
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 0 )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
) \/
(
forall (requested_pre: Z) (LitMap: (string -> Z)) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 0 )
).

Definition xizi_circular_area_call_init_first_write_release_return_wit_2_split_goal_spatial := 
forall (requested_pre: Z) (LitMap: (string -> Z)) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 0 )
.

Definition xizi_circular_area_call_init_first_write_release_partial_solve_wit_1_pure := 
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (PreH1 : (4 <= requested_pre)) (PreH2 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |->_)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
.

Definition xizi_circular_area_call_init_first_write_release_partial_solve_wit_1_aux := 
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (PreH1 : (4 <= requested_pre)) (PreH2 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
.

Definition xizi_circular_area_call_init_first_write_release_partial_solve_wit_1 := xizi_circular_area_call_init_first_write_release_partial_solve_wit_1_pure -> xizi_circular_area_call_init_first_write_release_partial_solve_wit_1_aux.

Definition xizi_circular_area_call_init_first_write_release_partial_solve_wit_2_pure := 
(
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ (1 = 1) ” 
  &&  “ (0 = 0) ” 
  &&  “ ((ca_capacity ((CircularAreaInitState (requested_pre)))) = (ca_capacity ((CircularAreaInitState (requested_pre))))) ” 
  &&  “ ((ca_contents ((CircularAreaInitState (requested_pre)))) = (@nil Z)) ”
) \/
(
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (PreH1 : (requested_pre <= UINT_MAX)) (PreH2 : (requested_pre >= 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ ((ca_contents ((CircularAreaInitState (requested_pre)))) = (@nil Z)) ”
).

Definition xizi_circular_area_call_init_first_write_release_partial_solve_wit_2_pure_split_goal_1 := 
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (PreH1 : (requested_pre <= UINT_MAX)) (PreH2 : (requested_pre >= 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ ((ca_contents ((CircularAreaInitState (requested_pre)))) = (@nil Z)) ”
.

Definition xizi_circular_area_call_init_first_write_release_partial_solve_wit_2_aux := 
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ (1 = 1) ” 
  &&  “ (0 = 0) ” 
  &&  “ ((ca_capacity ((CircularAreaInitState (requested_pre)))) = (ca_capacity ((CircularAreaInitState (requested_pre))))) ” 
  &&  “ ((ca_contents ((CircularAreaInitState (requested_pre)))) = (@nil Z)) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
.

Definition xizi_circular_area_call_init_first_write_release_partial_solve_wit_2 := xizi_circular_area_call_init_first_write_release_partial_solve_wit_2_pure -> xizi_circular_area_call_init_first_write_release_partial_solve_wit_2_aux.

Definition xizi_circular_area_call_init_first_write_release_partial_solve_wit_3 := 
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (4 <= requested_pre)) (PreH5 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (byte) ((@nil Z))))) retval )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ (retval_2 = 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (byte) ((@nil Z))))) retval )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
.

(*----- Function xizi_circular_area_call_write_read_release -----*)

Definition xizi_circular_area_call_write_read_release_safety_wit_1 := 
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (byte: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (4 <= requested_pre)) (PreH3 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_write_read_release_safety_wit_2 := 
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (byte: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (4 <= requested_pre)) (PreH3 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_write_read_release_safety_wit_3 := 
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (byte: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  “ False ”
.

Definition xizi_circular_area_call_write_read_release_safety_wit_4 := 
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (byte: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval <> 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  “ False ”
.

Definition xizi_circular_area_call_write_read_release_safety_wit_5 := 
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (byte: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_write_read_release_safety_wit_6 := 
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (byte: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition xizi_circular_area_call_write_read_release_safety_wit_7 := 
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (byte: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_write_read_release_safety_wit_8 := 
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (byte: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (4 <= requested_pre)) (PreH5 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (byte) ((@nil Z))))) retval )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition xizi_circular_area_call_write_read_release_safety_wit_9 := 
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (retval_2 = 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full output_buffer_pre 1 (cons ((Some (byte))) ((@nil (@option Z)))) )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition xizi_circular_area_call_write_read_release_return_wit_1 := 
(
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (byte: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (retval_2 = 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full output_buffer_pre 1 (cons ((Some (byte))) ((@nil (@option Z)))) )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (CircularAreaReadCallResult 1 output_buffer_pre byte output_before )
) \/
(
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (byte: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (retval_2 = 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full output_buffer_pre 1 (cons ((Some (byte))) ((@nil (@option Z)))) )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaReadCallResult 1 output_buffer_pre byte output_before )
).

Definition xizi_circular_area_call_write_read_release_return_wit_1_split_goal_spatial := 
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (byte: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (retval_2 = 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full output_buffer_pre 1 (cons ((Some (byte))) ((@nil (@option Z)))) )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaReadCallResult 1 output_buffer_pre byte output_before )
.

Definition xizi_circular_area_call_write_read_release_return_wit_2 := 
(
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (byte: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (CircularAreaReadCallResult 0 output_buffer_pre byte output_before )
) \/
(
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (byte: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaReadCallResult 0 output_buffer_pre byte output_before )
).

Definition xizi_circular_area_call_write_read_release_return_wit_2_split_goal_spatial := 
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (byte: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaReadCallResult 0 output_buffer_pre byte output_before )
.

Definition xizi_circular_area_call_write_read_release_partial_solve_wit_1_pure := 
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (byte: Z) (PreH1 : (4 <= requested_pre)) (PreH2 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |->_)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
.

Definition xizi_circular_area_call_write_read_release_partial_solve_wit_1_aux := 
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (byte: Z) (PreH1 : (4 <= requested_pre)) (PreH2 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
.

Definition xizi_circular_area_call_write_read_release_partial_solve_wit_1 := xizi_circular_area_call_write_read_release_partial_solve_wit_1_pure -> xizi_circular_area_call_write_read_release_partial_solve_wit_1_aux.

Definition xizi_circular_area_call_write_read_release_partial_solve_wit_2_pure := 
(
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (byte: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  “ (1 = 1) ” 
  &&  “ (0 = 0) ” 
  &&  “ ((ca_capacity ((CircularAreaInitState (requested_pre)))) = (ca_capacity ((CircularAreaInitState (requested_pre))))) ” 
  &&  “ ((ca_contents ((CircularAreaInitState (requested_pre)))) = (@nil Z)) ”
) \/
(
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (byte: Z) (retval: Z) (PreH1 : (requested_pre <= UINT_MAX)) (PreH2 : (requested_pre >= 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  “ ((ca_contents ((CircularAreaInitState (requested_pre)))) = (@nil Z)) ”
).

Definition xizi_circular_area_call_write_read_release_partial_solve_wit_2_pure_split_goal_1 := 
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (byte: Z) (retval: Z) (PreH1 : (requested_pre <= UINT_MAX)) (PreH2 : (requested_pre >= 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  “ ((ca_contents ((CircularAreaInitState (requested_pre)))) = (@nil Z)) ”
.

Definition xizi_circular_area_call_write_read_release_partial_solve_wit_2_aux := 
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (byte: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  “ (1 = 1) ” 
  &&  “ (0 = 0) ” 
  &&  “ ((ca_capacity ((CircularAreaInitState (requested_pre)))) = (ca_capacity ((CircularAreaInitState (requested_pre))))) ” 
  &&  “ ((ca_contents ((CircularAreaInitState (requested_pre)))) = (@nil Z)) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
.

Definition xizi_circular_area_call_write_read_release_partial_solve_wit_2 := xizi_circular_area_call_write_read_release_partial_solve_wit_2_pure -> xizi_circular_area_call_write_read_release_partial_solve_wit_2_aux.

Definition xizi_circular_area_call_write_read_release_partial_solve_wit_3_pure := 
(
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (byte: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (4 <= requested_pre)) (PreH5 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (byte) ((@nil Z))))) retval )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  “ (1 = 1) ” 
  &&  “ ((ca_contents ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (byte) ((@nil Z))))))) = (cons (byte) ((@nil Z)))) ” 
  &&  “ ((ca_capacity ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (byte) ((@nil Z))))))) = (ca_capacity ((CircularAreaInitState (requested_pre))))) ”
) \/
(
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (byte: Z) (retval: Z) (retval_2: Z) (PreH1 : (requested_pre <= UINT_MAX)) (PreH2 : (requested_pre >= 0)) (PreH3 : (retval_2 = 0)) (PreH4 : (retval <> 0)) (PreH5 : (retval <> 0)) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (byte) ((@nil Z))))) retval )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  “ ((ca_capacity ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (byte) ((@nil Z))))))) = (ca_capacity ((CircularAreaInitState (requested_pre))))) ” 
  &&  “ ((ca_contents ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (byte) ((@nil Z))))))) = (cons (byte) ((@nil Z)))) ”
).

Definition xizi_circular_area_call_write_read_release_partial_solve_wit_3_pure_split_goal_1 := 
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (byte: Z) (retval: Z) (retval_2: Z) (PreH1 : (requested_pre <= UINT_MAX)) (PreH2 : (requested_pre >= 0)) (PreH3 : (retval_2 = 0)) (PreH4 : (retval <> 0)) (PreH5 : (retval <> 0)) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (byte) ((@nil Z))))) retval )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  “ ((ca_capacity ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (byte) ((@nil Z))))))) = (ca_capacity ((CircularAreaInitState (requested_pre))))) ”
.

Definition xizi_circular_area_call_write_read_release_partial_solve_wit_3_pure_split_goal_2 := 
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (byte: Z) (retval: Z) (retval_2: Z) (PreH1 : (requested_pre <= UINT_MAX)) (PreH2 : (requested_pre >= 0)) (PreH3 : (retval_2 = 0)) (PreH4 : (retval <> 0)) (PreH5 : (retval <> 0)) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (byte) ((@nil Z))))) retval )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  “ ((ca_contents ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (byte) ((@nil Z))))))) = (cons (byte) ((@nil Z)))) ”
.

Definition xizi_circular_area_call_write_read_release_partial_solve_wit_3_aux := 
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (byte: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (4 <= requested_pre)) (PreH5 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (byte) ((@nil Z))))) retval )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  “ (1 = 1) ” 
  &&  “ ((ca_contents ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (byte) ((@nil Z))))))) = (cons (byte) ((@nil Z)))) ” 
  &&  “ ((ca_capacity ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (byte) ((@nil Z))))))) = (ca_capacity ((CircularAreaInitState (requested_pre))))) ” 
  &&  “ (retval_2 = 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (byte) ((@nil Z))))) retval )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
.

Definition xizi_circular_area_call_write_read_release_partial_solve_wit_3 := xizi_circular_area_call_write_read_release_partial_solve_wit_3_pure -> xizi_circular_area_call_write_read_release_partial_solve_wit_3_aux.

Definition xizi_circular_area_call_write_read_release_partial_solve_wit_4 := 
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (retval_2 = 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))) retval )
  **  (UCharArray.mixed_full output_buffer_pre 1 (cons ((Some (byte))) ((@nil (@option Z)))) )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ (retval_3 = 0) ” 
  &&  “ (retval_2 = 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))) retval )
  **  (UCharArray.mixed_full output_buffer_pre 1 (cons ((Some (byte))) ((@nil (@option Z)))) )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
.

(*----- Function xizi_circular_area_call_repeated_write_release -----*)

Definition xizi_circular_area_call_repeated_write_release_safety_wit_1 := 
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (4 <= requested_pre)) (PreH3 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_repeated_write_release_safety_wit_2 := 
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (4 <= requested_pre)) (PreH3 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_repeated_write_release_safety_wit_3 := 
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ False ”
.

Definition xizi_circular_area_call_repeated_write_release_safety_wit_4 := 
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval <> 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ False ”
.

Definition xizi_circular_area_call_repeated_write_release_safety_wit_5 := 
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_repeated_write_release_safety_wit_6 := 
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition xizi_circular_area_call_repeated_write_release_safety_wit_7 := 
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_repeated_write_release_safety_wit_8 := 
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (4 <= requested_pre)) (PreH5 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z))))) retval )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition xizi_circular_area_call_repeated_write_release_safety_wit_9 := 
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (4 <= requested_pre)) (PreH5 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z))))) retval )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_repeated_write_release_safety_wit_10 := 
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (retval_2 = 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition xizi_circular_area_call_repeated_write_release_return_wit_1 := 
(
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (retval_2 = 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 1 )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
) \/
(
forall (requested_pre: Z) (LitMap: (string -> Z)) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (retval_2 = 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 1 )
).

Definition xizi_circular_area_call_repeated_write_release_return_wit_1_split_goal_spatial := 
forall (requested_pre: Z) (LitMap: (string -> Z)) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (retval_2 = 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 1 )
.

Definition xizi_circular_area_call_repeated_write_release_return_wit_2 := 
(
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 0 )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
) \/
(
forall (requested_pre: Z) (LitMap: (string -> Z)) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 0 )
).

Definition xizi_circular_area_call_repeated_write_release_return_wit_2_split_goal_spatial := 
forall (requested_pre: Z) (LitMap: (string -> Z)) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 0 )
.

Definition xizi_circular_area_call_repeated_write_release_partial_solve_wit_1_pure := 
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (PreH1 : (4 <= requested_pre)) (PreH2 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |->_)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
.

Definition xizi_circular_area_call_repeated_write_release_partial_solve_wit_1_aux := 
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (PreH1 : (4 <= requested_pre)) (PreH2 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
.

Definition xizi_circular_area_call_repeated_write_release_partial_solve_wit_1 := xizi_circular_area_call_repeated_write_release_partial_solve_wit_1_pure -> xizi_circular_area_call_repeated_write_release_partial_solve_wit_1_aux.

Definition xizi_circular_area_call_repeated_write_release_partial_solve_wit_2_pure := 
(
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (1 = 1) ” 
  &&  “ (0 = 0) ” 
  &&  “ ((ca_capacity ((CircularAreaInitState (requested_pre)))) = (ca_capacity ((CircularAreaInitState (requested_pre))))) ” 
  &&  “ ((ca_contents ((CircularAreaInitState (requested_pre)))) = (@nil Z)) ”
) \/
(
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (retval: Z) (PreH1 : (requested_pre <= UINT_MAX)) (PreH2 : (requested_pre >= 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ ((ca_contents ((CircularAreaInitState (requested_pre)))) = (@nil Z)) ”
).

Definition xizi_circular_area_call_repeated_write_release_partial_solve_wit_2_pure_split_goal_1 := 
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (retval: Z) (PreH1 : (requested_pre <= UINT_MAX)) (PreH2 : (requested_pre >= 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ ((ca_contents ((CircularAreaInitState (requested_pre)))) = (@nil Z)) ”
.

Definition xizi_circular_area_call_repeated_write_release_partial_solve_wit_2_aux := 
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (1 = 1) ” 
  &&  “ (0 = 0) ” 
  &&  “ ((ca_capacity ((CircularAreaInitState (requested_pre)))) = (ca_capacity ((CircularAreaInitState (requested_pre))))) ” 
  &&  “ ((ca_contents ((CircularAreaInitState (requested_pre)))) = (@nil Z)) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
.

Definition xizi_circular_area_call_repeated_write_release_partial_solve_wit_2 := xizi_circular_area_call_repeated_write_release_partial_solve_wit_2_pure -> xizi_circular_area_call_repeated_write_release_partial_solve_wit_2_aux.

Definition xizi_circular_area_call_repeated_write_release_partial_solve_wit_3_pure := 
(
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (4 <= requested_pre)) (PreH5 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z))))) retval )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (1 = 1) ” 
  &&  “ (0 = 0) ” 
  &&  “ ((Zlength ((ca_contents ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z))))))))) < (ca_capacity ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z)))))))) ” 
  &&  “ ((ca_contents ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z))))))) = (cons (first_byte) ((@nil Z)))) ” 
  &&  “ ((ca_capacity ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z))))))) = (ca_capacity ((CircularAreaInitState (requested_pre))))) ”
) \/
(
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (retval: Z) (retval_2: Z) (PreH1 : (requested_pre <= UINT_MAX)) (PreH2 : (requested_pre >= 0)) (PreH3 : (retval_2 = 0)) (PreH4 : (retval <> 0)) (PreH5 : (retval <> 0)) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z))))) retval )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ ((ca_capacity ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z))))))) = (ca_capacity ((CircularAreaInitState (requested_pre))))) ” 
  &&  “ ((ca_contents ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z))))))) = (cons (first_byte) ((@nil Z)))) ” 
  &&  “ ((Zlength ((ca_contents ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z))))))))) < (ca_capacity ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z)))))))) ”
).

Definition xizi_circular_area_call_repeated_write_release_partial_solve_wit_3_pure_split_goal_1 := 
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (retval: Z) (retval_2: Z) (PreH1 : (requested_pre <= UINT_MAX)) (PreH2 : (requested_pre >= 0)) (PreH3 : (retval_2 = 0)) (PreH4 : (retval <> 0)) (PreH5 : (retval <> 0)) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z))))) retval )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ ((ca_capacity ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z))))))) = (ca_capacity ((CircularAreaInitState (requested_pre))))) ”
.

Definition xizi_circular_area_call_repeated_write_release_partial_solve_wit_3_pure_split_goal_2 := 
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (retval: Z) (retval_2: Z) (PreH1 : (requested_pre <= UINT_MAX)) (PreH2 : (requested_pre >= 0)) (PreH3 : (retval_2 = 0)) (PreH4 : (retval <> 0)) (PreH5 : (retval <> 0)) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z))))) retval )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ ((ca_contents ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z))))))) = (cons (first_byte) ((@nil Z)))) ”
.

Definition xizi_circular_area_call_repeated_write_release_partial_solve_wit_3_pure_split_goal_3 := 
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (retval: Z) (retval_2: Z) (PreH1 : (requested_pre <= UINT_MAX)) (PreH2 : (requested_pre >= 0)) (PreH3 : (retval_2 = 0)) (PreH4 : (retval <> 0)) (PreH5 : (retval <> 0)) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z))))) retval )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ ((Zlength ((ca_contents ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z))))))))) < (ca_capacity ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z)))))))) ”
.

Definition xizi_circular_area_call_repeated_write_release_partial_solve_wit_3_aux := 
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (4 <= requested_pre)) (PreH5 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z))))) retval )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (1 = 1) ” 
  &&  “ (0 = 0) ” 
  &&  “ ((Zlength ((ca_contents ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z))))))))) < (ca_capacity ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z)))))))) ” 
  &&  “ ((ca_contents ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z))))))) = (cons (first_byte) ((@nil Z)))) ” 
  &&  “ ((ca_capacity ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z))))))) = (ca_capacity ((CircularAreaInitState (requested_pre))))) ” 
  &&  “ (retval_2 = 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z))))) retval )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
.

Definition xizi_circular_area_call_repeated_write_release_partial_solve_wit_3 := xizi_circular_area_call_repeated_write_release_partial_solve_wit_3_pure -> xizi_circular_area_call_repeated_write_release_partial_solve_wit_3_aux.

Definition xizi_circular_area_call_repeated_write_release_partial_solve_wit_4 := 
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (retval_2 = 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((cons (second_byte) ((@nil Z))))))) retval )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
|--
  “ (retval_3 = 0) ” 
  &&  “ (retval_2 = 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((cons (second_byte) ((@nil Z))))))) retval )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
.

(*----- Function xizi_circular_area_call_read_then_write_release -----*)

Definition xizi_circular_area_call_read_then_write_release_safety_wit_1 := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (second_byte: Z) (first_byte: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (4 <= requested_pre)) (PreH3 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_read_then_write_release_safety_wit_2 := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (second_byte: Z) (first_byte: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (4 <= requested_pre)) (PreH3 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_read_then_write_release_safety_wit_3 := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (second_byte: Z) (first_byte: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ False ”
.

Definition xizi_circular_area_call_read_then_write_release_safety_wit_4 := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (second_byte: Z) (first_byte: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval <> 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ False ”
.

Definition xizi_circular_area_call_read_then_write_release_safety_wit_5 := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (second_byte: Z) (first_byte: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_read_then_write_release_safety_wit_6 := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (second_byte: Z) (first_byte: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition xizi_circular_area_call_read_then_write_release_safety_wit_7 := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (second_byte: Z) (first_byte: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_read_then_write_release_safety_wit_8 := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (second_byte: Z) (first_byte: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (4 <= requested_pre)) (PreH5 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z))))) retval )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition xizi_circular_area_call_read_then_write_release_safety_wit_9 := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (retval_2 = 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))) retval )
  **  (UCharArray.mixed_full output_buffer_pre 1 (cons ((Some (first_byte))) ((@nil (@option Z)))) )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition xizi_circular_area_call_read_then_write_release_safety_wit_10 := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (retval_2 = 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))) retval )
  **  (UCharArray.mixed_full output_buffer_pre 1 (cons ((Some (first_byte))) ((@nil (@option Z)))) )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_read_then_write_release_safety_wit_11 := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = 0)) (PreH2 : (retval_3 = 0)) (PreH3 : (retval_2 = 0)) (PreH4 : (retval <> 0)) (PreH5 : (retval <> 0)) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 (cons ((Some (first_byte))) ((@nil (@option Z)))) )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition xizi_circular_area_call_read_then_write_release_return_wit_1 := 
(
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (second_byte: Z) (first_byte: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = 0)) (PreH2 : (retval_3 = 0)) (PreH3 : (retval_2 = 0)) (PreH4 : (retval <> 0)) (PreH5 : (retval <> 0)) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 (cons ((Some (first_byte))) ((@nil (@option Z)))) )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
|--
  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
  **  (CircularAreaReadCallResult 1 output_buffer_pre first_byte output_before )
) \/
(
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (first_byte: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = 0)) (PreH2 : (retval_3 = 0)) (PreH3 : (retval_2 = 0)) (PreH4 : (retval <> 0)) (PreH5 : (retval <> 0)) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full output_buffer_pre 1 (cons ((Some (first_byte))) ((@nil (@option Z)))) )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaReadCallResult 1 output_buffer_pre first_byte output_before )
).

Definition xizi_circular_area_call_read_then_write_release_return_wit_1_split_goal_spatial := 
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (first_byte: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = 0)) (PreH2 : (retval_3 = 0)) (PreH3 : (retval_2 = 0)) (PreH4 : (retval <> 0)) (PreH5 : (retval <> 0)) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full output_buffer_pre 1 (cons ((Some (first_byte))) ((@nil (@option Z)))) )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaReadCallResult 1 output_buffer_pre first_byte output_before )
.

Definition xizi_circular_area_call_read_then_write_release_return_wit_2 := 
(
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (second_byte: Z) (first_byte: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
  **  (CircularAreaReadCallResult 0 output_buffer_pre first_byte output_before )
) \/
(
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (first_byte: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaReadCallResult 0 output_buffer_pre first_byte output_before )
).

Definition xizi_circular_area_call_read_then_write_release_return_wit_2_split_goal_spatial := 
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (first_byte: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaReadCallResult 0 output_buffer_pre first_byte output_before )
.

Definition xizi_circular_area_call_read_then_write_release_partial_solve_wit_1_pure := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (second_byte: Z) (first_byte: Z) (PreH1 : (4 <= requested_pre)) (PreH2 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |->_)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
.

Definition xizi_circular_area_call_read_then_write_release_partial_solve_wit_1_aux := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (second_byte: Z) (first_byte: Z) (PreH1 : (4 <= requested_pre)) (PreH2 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
.

Definition xizi_circular_area_call_read_then_write_release_partial_solve_wit_1 := xizi_circular_area_call_read_then_write_release_partial_solve_wit_1_pure -> xizi_circular_area_call_read_then_write_release_partial_solve_wit_1_aux.

Definition xizi_circular_area_call_read_then_write_release_partial_solve_wit_2_pure := 
(
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (second_byte: Z) (first_byte: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (1 = 1) ” 
  &&  “ (0 = 0) ” 
  &&  “ ((ca_capacity ((CircularAreaInitState (requested_pre)))) = (ca_capacity ((CircularAreaInitState (requested_pre))))) ” 
  &&  “ ((ca_contents ((CircularAreaInitState (requested_pre)))) = (@nil Z)) ”
) \/
(
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (second_byte: Z) (first_byte: Z) (retval: Z) (PreH1 : (requested_pre <= UINT_MAX)) (PreH2 : (requested_pre >= 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ ((ca_contents ((CircularAreaInitState (requested_pre)))) = (@nil Z)) ”
).

Definition xizi_circular_area_call_read_then_write_release_partial_solve_wit_2_pure_split_goal_1 := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (second_byte: Z) (first_byte: Z) (retval: Z) (PreH1 : (requested_pre <= UINT_MAX)) (PreH2 : (requested_pre >= 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ ((ca_contents ((CircularAreaInitState (requested_pre)))) = (@nil Z)) ”
.

Definition xizi_circular_area_call_read_then_write_release_partial_solve_wit_2_aux := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (second_byte: Z) (first_byte: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (1 = 1) ” 
  &&  “ (0 = 0) ” 
  &&  “ ((ca_capacity ((CircularAreaInitState (requested_pre)))) = (ca_capacity ((CircularAreaInitState (requested_pre))))) ” 
  &&  “ ((ca_contents ((CircularAreaInitState (requested_pre)))) = (@nil Z)) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
.

Definition xizi_circular_area_call_read_then_write_release_partial_solve_wit_2 := xizi_circular_area_call_read_then_write_release_partial_solve_wit_2_pure -> xizi_circular_area_call_read_then_write_release_partial_solve_wit_2_aux.

Definition xizi_circular_area_call_read_then_write_release_partial_solve_wit_3_pure := 
(
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (second_byte: Z) (first_byte: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (4 <= requested_pre)) (PreH5 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z))))) retval )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (1 = 1) ” 
  &&  “ ((ca_contents ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z))))))) = (cons (first_byte) ((@nil Z)))) ” 
  &&  “ ((ca_capacity ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z))))))) = (ca_capacity ((CircularAreaInitState (requested_pre))))) ”
) \/
(
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (second_byte: Z) (first_byte: Z) (retval: Z) (retval_2: Z) (PreH1 : (requested_pre <= UINT_MAX)) (PreH2 : (requested_pre >= 0)) (PreH3 : (retval_2 = 0)) (PreH4 : (retval <> 0)) (PreH5 : (retval <> 0)) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z))))) retval )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ ((ca_capacity ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z))))))) = (ca_capacity ((CircularAreaInitState (requested_pre))))) ” 
  &&  “ ((ca_contents ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z))))))) = (cons (first_byte) ((@nil Z)))) ”
).

Definition xizi_circular_area_call_read_then_write_release_partial_solve_wit_3_pure_split_goal_1 := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (second_byte: Z) (first_byte: Z) (retval: Z) (retval_2: Z) (PreH1 : (requested_pre <= UINT_MAX)) (PreH2 : (requested_pre >= 0)) (PreH3 : (retval_2 = 0)) (PreH4 : (retval <> 0)) (PreH5 : (retval <> 0)) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z))))) retval )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ ((ca_capacity ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z))))))) = (ca_capacity ((CircularAreaInitState (requested_pre))))) ”
.

Definition xizi_circular_area_call_read_then_write_release_partial_solve_wit_3_pure_split_goal_2 := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (second_byte: Z) (first_byte: Z) (retval: Z) (retval_2: Z) (PreH1 : (requested_pre <= UINT_MAX)) (PreH2 : (requested_pre >= 0)) (PreH3 : (retval_2 = 0)) (PreH4 : (retval <> 0)) (PreH5 : (retval <> 0)) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z))))) retval )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ ((ca_contents ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z))))))) = (cons (first_byte) ((@nil Z)))) ”
.

Definition xizi_circular_area_call_read_then_write_release_partial_solve_wit_3_aux := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list (@option Z))) (second_byte: Z) (first_byte: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (4 <= requested_pre)) (PreH5 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z))))) retval )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (1 = 1) ” 
  &&  “ ((ca_contents ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z))))))) = (cons (first_byte) ((@nil Z)))) ” 
  &&  “ ((ca_capacity ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z))))))) = (ca_capacity ((CircularAreaInitState (requested_pre))))) ” 
  &&  “ (retval_2 = 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (first_byte) ((@nil Z))))) retval )
  **  (UCharArray.mixed_full output_buffer_pre 1 output_before )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
.

Definition xizi_circular_area_call_read_then_write_release_partial_solve_wit_3 := xizi_circular_area_call_read_then_write_release_partial_solve_wit_3_pure -> xizi_circular_area_call_read_then_write_release_partial_solve_wit_3_aux.

Definition xizi_circular_area_call_read_then_write_release_partial_solve_wit_4_pure := 
(
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (retval_2 = 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))) retval )
  **  (UCharArray.mixed_full output_buffer_pre 1 (cons ((Some (first_byte))) ((@nil (@option Z)))) )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (1 = 1) ” 
  &&  “ (0 = 0) ” 
  &&  “ ((ca_contents ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))))) = (@nil Z)) ” 
  &&  “ ((ca_capacity ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))))) = (ca_capacity ((CircularAreaInitState (requested_pre))))) ”
) \/
(
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (requested_pre <= UINT_MAX)) (PreH2 : (requested_pre >= 0)) (PreH3 : (retval_3 = 0)) (PreH4 : (retval_2 = 0)) (PreH5 : (retval <> 0)) (PreH6 : (retval <> 0)) (PreH7 : (4 <= requested_pre)) (PreH8 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))) retval )
  **  (UCharArray.mixed_full output_buffer_pre 1 (cons ((Some (first_byte))) ((@nil (@option Z)))) )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ ((ca_capacity ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))))) = (ca_capacity ((CircularAreaInitState (requested_pre))))) ” 
  &&  “ ((ca_contents ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))))) = (@nil Z)) ”
).

Definition xizi_circular_area_call_read_then_write_release_partial_solve_wit_4_pure_split_goal_1 := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (requested_pre <= UINT_MAX)) (PreH2 : (requested_pre >= 0)) (PreH3 : (retval_3 = 0)) (PreH4 : (retval_2 = 0)) (PreH5 : (retval <> 0)) (PreH6 : (retval <> 0)) (PreH7 : (4 <= requested_pre)) (PreH8 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))) retval )
  **  (UCharArray.mixed_full output_buffer_pre 1 (cons ((Some (first_byte))) ((@nil (@option Z)))) )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ ((ca_capacity ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))))) = (ca_capacity ((CircularAreaInitState (requested_pre))))) ”
.

Definition xizi_circular_area_call_read_then_write_release_partial_solve_wit_4_pure_split_goal_2 := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (requested_pre <= UINT_MAX)) (PreH2 : (requested_pre >= 0)) (PreH3 : (retval_3 = 0)) (PreH4 : (retval_2 = 0)) (PreH5 : (retval <> 0)) (PreH6 : (retval <> 0)) (PreH7 : (4 <= requested_pre)) (PreH8 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))) retval )
  **  (UCharArray.mixed_full output_buffer_pre 1 (cons ((Some (first_byte))) ((@nil (@option Z)))) )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ ((ca_contents ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))))) = (@nil Z)) ”
.

Definition xizi_circular_area_call_read_then_write_release_partial_solve_wit_4_aux := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (retval_2 = 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))) retval )
  **  (UCharArray.mixed_full output_buffer_pre 1 (cons ((Some (first_byte))) ((@nil (@option Z)))) )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (1 = 1) ” 
  &&  “ (0 = 0) ” 
  &&  “ ((ca_contents ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))))) = (@nil Z)) ” 
  &&  “ ((ca_capacity ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))))) = (ca_capacity ((CircularAreaInitState (requested_pre))))) ” 
  &&  “ (retval_3 = 0) ” 
  &&  “ (retval_2 = 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))) retval )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 (cons ((Some (first_byte))) ((@nil (@option Z)))) )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
.

Definition xizi_circular_area_call_read_then_write_release_partial_solve_wit_4 := xizi_circular_area_call_read_then_write_release_partial_solve_wit_4_pure -> xizi_circular_area_call_read_then_write_release_partial_solve_wit_4_aux.

Definition xizi_circular_area_call_read_then_write_release_partial_solve_wit_5 := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = 0)) (PreH2 : (retval_3 = 0)) (PreH3 : (retval_2 = 0)) (PreH4 : (retval <> 0)) (PreH5 : (retval <> 0)) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (second_byte) ((@nil Z))))) retval )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 (cons ((Some (first_byte))) ((@nil (@option Z)))) )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
|--
  “ (retval_4 = 0) ” 
  &&  “ (retval_3 = 0) ” 
  &&  “ (retval_2 = 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (second_byte) ((@nil Z))))) retval )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
  **  (UCharArray.mixed_full output_buffer_pre 1 (cons ((Some (first_byte))) ((@nil (@option Z)))) )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
.

(*----- Function xizi_circular_area_call_reset_release -----*)

Definition xizi_circular_area_call_reset_release_safety_wit_1 := 
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (4 <= requested_pre)) (PreH3 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_reset_release_safety_wit_2 := 
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (4 <= requested_pre)) (PreH3 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_reset_release_safety_wit_3 := 
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ False ”
.

Definition xizi_circular_area_call_reset_release_safety_wit_4 := 
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval <> 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ False ”
.

Definition xizi_circular_area_call_reset_release_safety_wit_5 := 
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_reset_release_safety_wit_6 := 
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition xizi_circular_area_call_reset_release_safety_wit_7 := 
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_reset_release_safety_wit_8 := 
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (CircularAreaStateDataLengthResult (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))) retval_4 )) (PreH2 : (CircularAreaStateEmptyResult (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))) retval_3 )) (PreH3 : (retval_2 = 0)) (PreH4 : (retval <> 0)) (PreH5 : (retval <> 0)) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition xizi_circular_area_call_reset_release_return_wit_1 := 
(
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (CircularAreaStateDataLengthResult (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))) retval_4 )) (PreH2 : (CircularAreaStateEmptyResult (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))) retval_3 )) (PreH3 : (retval_2 = 0)) (PreH4 : (retval <> 0)) (PreH5 : (retval <> 0)) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 1 )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
) \/
(
forall (requested_pre: Z) (LitMap: (string -> Z)) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (CircularAreaStateDataLengthResult (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))) retval_4 )) (PreH2 : (CircularAreaStateEmptyResult (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))) retval_3 )) (PreH3 : (retval_2 = 0)) (PreH4 : (retval <> 0)) (PreH5 : (retval <> 0)) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 1 )
).

Definition xizi_circular_area_call_reset_release_return_wit_1_split_goal_spatial := 
forall (requested_pre: Z) (LitMap: (string -> Z)) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (CircularAreaStateDataLengthResult (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))) retval_4 )) (PreH2 : (CircularAreaStateEmptyResult (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))) retval_3 )) (PreH3 : (retval_2 = 0)) (PreH4 : (retval <> 0)) (PreH5 : (retval <> 0)) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 1 )
.

Definition xizi_circular_area_call_reset_release_return_wit_2 := 
(
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 0 )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
) \/
(
forall (requested_pre: Z) (LitMap: (string -> Z)) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 0 )
).

Definition xizi_circular_area_call_reset_release_return_wit_2_split_goal_spatial := 
forall (requested_pre: Z) (LitMap: (string -> Z)) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 0 )
.

Definition xizi_circular_area_call_reset_release_partial_solve_wit_1_pure := 
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (PreH1 : (4 <= requested_pre)) (PreH2 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |->_)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
.

Definition xizi_circular_area_call_reset_release_partial_solve_wit_1_aux := 
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (PreH1 : (4 <= requested_pre)) (PreH2 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
.

Definition xizi_circular_area_call_reset_release_partial_solve_wit_1 := xizi_circular_area_call_reset_release_partial_solve_wit_1_pure -> xizi_circular_area_call_reset_release_partial_solve_wit_1_aux.

Definition xizi_circular_area_call_reset_release_partial_solve_wit_2_pure := 
(
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ (1 = 1) ” 
  &&  “ (0 = 0) ” 
  &&  “ ((ca_capacity ((CircularAreaInitState (requested_pre)))) = (ca_capacity ((CircularAreaInitState (requested_pre))))) ” 
  &&  “ ((ca_contents ((CircularAreaInitState (requested_pre)))) = (@nil Z)) ”
) \/
(
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (PreH1 : (requested_pre <= UINT_MAX)) (PreH2 : (requested_pre >= 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ ((ca_contents ((CircularAreaInitState (requested_pre)))) = (@nil Z)) ”
).

Definition xizi_circular_area_call_reset_release_partial_solve_wit_2_pure_split_goal_1 := 
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (PreH1 : (requested_pre <= UINT_MAX)) (PreH2 : (requested_pre >= 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ ((ca_contents ((CircularAreaInitState (requested_pre)))) = (@nil Z)) ”
.

Definition xizi_circular_area_call_reset_release_partial_solve_wit_2_aux := 
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ (1 = 1) ” 
  &&  “ (0 = 0) ” 
  &&  “ ((ca_capacity ((CircularAreaInitState (requested_pre)))) = (ca_capacity ((CircularAreaInitState (requested_pre))))) ” 
  &&  “ ((ca_contents ((CircularAreaInitState (requested_pre)))) = (@nil Z)) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area (CircularAreaInitState (requested_pre)) retval )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
.

Definition xizi_circular_area_call_reset_release_partial_solve_wit_2 := xizi_circular_area_call_reset_release_partial_solve_wit_2_pure -> xizi_circular_area_call_reset_release_partial_solve_wit_2_aux.

Definition xizi_circular_area_call_reset_release_partial_solve_wit_3_pure := 
(
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (4 <= requested_pre)) (PreH5 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (byte) ((@nil Z))))) retval )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
|--
  “ ((ca_capacity ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (byte) ((@nil Z))))))) = (ca_capacity ((CircularAreaInitState (requested_pre))))) ”
) \/
(
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (retval_2: Z) (PreH1 : (requested_pre <= UINT_MAX)) (PreH2 : (requested_pre >= 0)) (PreH3 : (retval_2 = 0)) (PreH4 : (retval <> 0)) (PreH5 : (retval <> 0)) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (byte) ((@nil Z))))) retval )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
|--
  “ ((ca_capacity ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (byte) ((@nil Z))))))) = (ca_capacity ((CircularAreaInitState (requested_pre))))) ”
).

Definition xizi_circular_area_call_reset_release_partial_solve_wit_3_pure_split_goal_1 := 
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (retval_2: Z) (PreH1 : (requested_pre <= UINT_MAX)) (PreH2 : (requested_pre >= 0)) (PreH3 : (retval_2 = 0)) (PreH4 : (retval <> 0)) (PreH5 : (retval <> 0)) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (byte) ((@nil Z))))) retval )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
|--
  “ ((ca_capacity ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (byte) ((@nil Z))))))) = (ca_capacity ((CircularAreaInitState (requested_pre))))) ”
.

Definition xizi_circular_area_call_reset_release_partial_solve_wit_3_aux := 
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (4 <= requested_pre)) (PreH5 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (byte) ((@nil Z))))) retval )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ ((ca_capacity ((Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (byte) ((@nil Z))))))) = (ca_capacity ((CircularAreaInitState (requested_pre))))) ” 
  &&  “ (retval_2 = 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((cons (byte) ((@nil Z))))) retval )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
.

Definition xizi_circular_area_call_reset_release_partial_solve_wit_3 := xizi_circular_area_call_reset_release_partial_solve_wit_3_pure -> xizi_circular_area_call_reset_release_partial_solve_wit_3_aux.

Definition xizi_circular_area_call_reset_release_partial_solve_wit_4 := 
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (4 <= requested_pre)) (PreH5 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))) retval )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ (retval_2 = 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))) retval )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
.

Definition xizi_circular_area_call_reset_release_partial_solve_wit_5 := 
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (CircularAreaStateEmptyResult (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))) retval_3 )) (PreH2 : (retval_2 = 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))) retval )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ (CircularAreaStateEmptyResult (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))) retval_3 ) ” 
  &&  “ (retval_2 = 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))) retval )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
.

Definition xizi_circular_area_call_reset_release_partial_solve_wit_6 := 
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (CircularAreaStateDataLengthResult (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))) retval_4 )) (PreH2 : (CircularAreaStateEmptyResult (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))) retval_3 )) (PreH3 : (retval_2 = 0)) (PreH4 : (retval <> 0)) (PreH5 : (retval <> 0)) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))) retval )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ (CircularAreaStateDataLengthResult (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))) retval_4 ) ” 
  &&  “ (CircularAreaStateEmptyResult (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))) retval_3 ) ” 
  &&  “ (retval_2 = 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state ((ca_capacity ((CircularAreaInitState (requested_pre))))) ((@nil Z))) retval )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
.

(*----- Function xizi_circular_area_call_force_full_release -----*)

Definition xizi_circular_area_call_force_full_release_safety_wit_1 := 
forall (input_buffer_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (PreH1 : (CircularAreaFourBytes input_contents )) ,
  ((( &( "area" ) )) # Ptr  |->_)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 4 input_contents )
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition xizi_circular_area_call_force_full_release_safety_wit_2 := 
forall (input_buffer_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (CircularAreaFourBytes input_contents )) ,
  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 4 input_contents )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_force_full_release_safety_wit_3 := 
forall (input_buffer_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (CircularAreaFourBytes input_contents )) ,
  (store_circular_area (CircularAreaInitState (4)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 4 input_contents )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_force_full_release_safety_wit_4 := 
forall (input_buffer_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval = 0)) (PreH3 : (CircularAreaFourBytes input_contents )) ,
  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 4 input_contents )
|--
  “ False ”
.

Definition xizi_circular_area_call_force_full_release_safety_wit_5 := 
forall (input_buffer_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaFourBytes input_contents )) ,
  (store_circular_area (CircularAreaInitState (4)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 4 input_contents )
|--
  “ False ”
.

Definition xizi_circular_area_call_force_full_release_safety_wit_6 := 
forall (input_buffer_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (CircularAreaFourBytes input_contents )) ,
  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 4 input_contents )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_force_full_release_safety_wit_7 := 
forall (input_buffer_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaFourBytes input_contents )) ,
  (store_circular_area (CircularAreaInitState (4)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 4 input_contents )
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition xizi_circular_area_call_force_full_release_safety_wit_8 := 
forall (input_buffer_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaFourBytes input_contents )) ,
  (store_circular_area (CircularAreaInitState (4)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 4 input_contents )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition xizi_circular_area_call_force_full_release_safety_wit_9 := 
forall (input_buffer_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (area: Z) (PreH1 : (CircularAreaFourBytes input_contents )) ,
  (GlobalStrings LitMap )
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "area" ) )) # Ptr  |-> area)
  **  (UCharArray.full input_buffer_pre 4 input_contents )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition xizi_circular_area_call_force_full_release_entail_wit_1 := 
(
forall (input_buffer_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (retval: Z) (raw_after: forced_circular_area_state) (retval_2: Z) (PreH1 : (CircularAreaForceWriteResult (CircularAreaInitState (4)) 4 input_contents 0 raw_after )) (PreH2 : (retval_2 = 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (CircularAreaFourBytes input_contents )) ,
  (GlobalStrings LitMap )
  **  (store_forced_circular_area raw_after retval )
  **  (UCharArray.full input_buffer_pre 4 input_contents )
|--
  “ (CircularAreaFourBytes input_contents ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state (4) (input_contents)) retval )
  **  (UCharArray.full input_buffer_pre 4 input_contents )
) \/
(
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (retval: Z) (raw_after: forced_circular_area_state) (retval_2: Z) (PreH1 : (CircularAreaForceWriteResult (CircularAreaInitState (4)) 4 input_contents 0 raw_after )) (PreH2 : (retval_2 = 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (CircularAreaFourBytes input_contents )) ,
  (GlobalStrings LitMap )
  **  (store_forced_circular_area raw_after retval )
|--
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state (4) (input_contents)) retval )
).

Definition xizi_circular_area_call_force_full_release_entail_wit_1_split_goal_spatial := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (retval: Z) (raw_after: forced_circular_area_state) (retval_2: Z) (PreH1 : (CircularAreaForceWriteResult (CircularAreaInitState (4)) 4 input_contents 0 raw_after )) (PreH2 : (retval_2 = 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (CircularAreaFourBytes input_contents )) ,
  (GlobalStrings LitMap )
  **  (store_forced_circular_area raw_after retval )
|--
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state (4) (input_contents)) retval )
.

Definition xizi_circular_area_call_force_full_release_return_wit_1 := 
(
forall (input_buffer_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (PreH1 : (CircularAreaFourBytes input_contents )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 4 input_contents )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 1 )
  **  (UCharArray.full input_buffer_pre 4 input_contents )
) \/
(
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (PreH1 : (CircularAreaFourBytes input_contents )) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 1 )
).

Definition xizi_circular_area_call_force_full_release_return_wit_1_split_goal_spatial := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (PreH1 : (CircularAreaFourBytes input_contents )) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 1 )
.

Definition xizi_circular_area_call_force_full_release_return_wit_2 := 
(
forall (input_buffer_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (CircularAreaFourBytes input_contents )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 4 input_contents )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 0 )
  **  (UCharArray.full input_buffer_pre 4 input_contents )
) \/
(
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (CircularAreaFourBytes input_contents )) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 0 )
).

Definition xizi_circular_area_call_force_full_release_return_wit_2_split_goal_spatial := 
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (CircularAreaFourBytes input_contents )) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 0 )
.

Definition xizi_circular_area_call_force_full_release_partial_solve_wit_1_pure := 
forall (input_buffer_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (PreH1 : (CircularAreaFourBytes input_contents )) ,
  ((( &( "area" ) )) # Ptr  |->_)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 4 input_contents )
|--
  “ (4 <= 4) ” 
  &&  “ (4 <= 256) ”
.

Definition xizi_circular_area_call_force_full_release_partial_solve_wit_1_aux := 
forall (input_buffer_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (PreH1 : (CircularAreaFourBytes input_contents )) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 4 input_contents )
|--
  “ (4 <= 4) ” 
  &&  “ (4 <= 256) ” 
  &&  “ (CircularAreaFourBytes input_contents ) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 4 input_contents )
.

Definition xizi_circular_area_call_force_full_release_partial_solve_wit_1 := xizi_circular_area_call_force_full_release_partial_solve_wit_1_pure -> xizi_circular_area_call_force_full_release_partial_solve_wit_1_aux.

Definition xizi_circular_area_call_force_full_release_partial_solve_wit_2_pure := 
(
forall (input_buffer_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaFourBytes input_contents )) ,
  (store_circular_area (CircularAreaInitState (4)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 4 input_contents )
|--
  “ (4 = 4) ” 
  &&  “ (1 = 1) ” 
  &&  “ (CircularAreaFourBytes input_contents ) ” 
  &&  “ ((ca_contents ((CircularAreaInitState (4)))) = (@nil Z)) ” 
  &&  “ ((ca_capacity ((CircularAreaInitState (4)))) = 4) ”
) \/
(
forall (input_buffer_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaFourBytes input_contents )) ,
  (store_circular_area (CircularAreaInitState (4)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 4 input_contents )
|--
  “ ((ca_capacity ((CircularAreaInitState (4)))) = 4) ” 
  &&  “ ((ca_contents ((CircularAreaInitState (4)))) = (@nil Z)) ”
).

Definition xizi_circular_area_call_force_full_release_partial_solve_wit_2_pure_split_goal_1 := 
forall (input_buffer_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaFourBytes input_contents )) ,
  (store_circular_area (CircularAreaInitState (4)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 4 input_contents )
|--
  “ ((ca_capacity ((CircularAreaInitState (4)))) = 4) ”
.

Definition xizi_circular_area_call_force_full_release_partial_solve_wit_2_pure_split_goal_2 := 
forall (input_buffer_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaFourBytes input_contents )) ,
  (store_circular_area (CircularAreaInitState (4)) retval )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 4 input_contents )
|--
  “ ((ca_contents ((CircularAreaInitState (4)))) = (@nil Z)) ”
.

Definition xizi_circular_area_call_force_full_release_partial_solve_wit_2_aux := 
forall (input_buffer_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaFourBytes input_contents )) ,
  (store_circular_area (CircularAreaInitState (4)) retval )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 4 input_contents )
|--
  “ (4 = 4) ” 
  &&  “ (1 = 1) ” 
  &&  “ (CircularAreaFourBytes input_contents ) ” 
  &&  “ ((ca_contents ((CircularAreaInitState (4)))) = (@nil Z)) ” 
  &&  “ ((ca_capacity ((CircularAreaInitState (4)))) = 4) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (CircularAreaFourBytes input_contents ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area (CircularAreaInitState (4)) retval )
  **  (UCharArray.full input_buffer_pre 4 input_contents )
.

Definition xizi_circular_area_call_force_full_release_partial_solve_wit_2 := xizi_circular_area_call_force_full_release_partial_solve_wit_2_pure -> xizi_circular_area_call_force_full_release_partial_solve_wit_2_aux.

Definition xizi_circular_area_call_force_full_release_partial_solve_wit_3 := 
forall (input_buffer_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (area: Z) (PreH1 : (CircularAreaFourBytes input_contents )) ,
  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state (4) (input_contents)) area )
  **  (UCharArray.full input_buffer_pre 4 input_contents )
|--
  “ (CircularAreaFourBytes input_contents ) ”
  &&  (GlobalStrings LitMap )
  **  (store_circular_area (Build_circular_area_state (4) (input_contents)) area )
  **  (UCharArray.full input_buffer_pre 4 input_contents )
.

Module Type VC_Correct.


Axiom proof_of_xizi_circular_area_call_init_metadata_release_safety_wit_1 : xizi_circular_area_call_init_metadata_release_safety_wit_1.
Axiom proof_of_xizi_circular_area_call_init_metadata_release_safety_wit_2 : xizi_circular_area_call_init_metadata_release_safety_wit_2.
Axiom proof_of_xizi_circular_area_call_init_metadata_release_safety_wit_3 : xizi_circular_area_call_init_metadata_release_safety_wit_3.
Axiom proof_of_xizi_circular_area_call_init_metadata_release_safety_wit_4 : xizi_circular_area_call_init_metadata_release_safety_wit_4.
Axiom proof_of_xizi_circular_area_call_init_metadata_release_safety_wit_5 : xizi_circular_area_call_init_metadata_release_safety_wit_5.
Axiom proof_of_xizi_circular_area_call_init_metadata_release_safety_wit_6 : xizi_circular_area_call_init_metadata_release_safety_wit_6.
Axiom proof_of_xizi_circular_area_call_init_metadata_release_return_wit_1 : xizi_circular_area_call_init_metadata_release_return_wit_1.
Axiom proof_of_xizi_circular_area_call_init_metadata_release_return_wit_2 : xizi_circular_area_call_init_metadata_release_return_wit_2.
Axiom proof_of_xizi_circular_area_call_init_metadata_release_partial_solve_wit_1_pure : xizi_circular_area_call_init_metadata_release_partial_solve_wit_1_pure.
Axiom proof_of_xizi_circular_area_call_init_metadata_release_partial_solve_wit_1 : xizi_circular_area_call_init_metadata_release_partial_solve_wit_1.
Axiom proof_of_xizi_circular_area_call_init_metadata_release_partial_solve_wit_2 : xizi_circular_area_call_init_metadata_release_partial_solve_wit_2.
Axiom proof_of_xizi_circular_area_call_init_metadata_release_partial_solve_wit_3 : xizi_circular_area_call_init_metadata_release_partial_solve_wit_3.
Axiom proof_of_xizi_circular_area_call_init_metadata_release_partial_solve_wit_4 : xizi_circular_area_call_init_metadata_release_partial_solve_wit_4.
Axiom proof_of_xizi_circular_area_call_init_metadata_release_partial_solve_wit_5 : xizi_circular_area_call_init_metadata_release_partial_solve_wit_5.
Axiom proof_of_xizi_circular_area_call_init_metadata_release_partial_solve_wit_6 : xizi_circular_area_call_init_metadata_release_partial_solve_wit_6.
Axiom proof_of_xizi_circular_area_call_init_empty_read_release_safety_wit_1 : xizi_circular_area_call_init_empty_read_release_safety_wit_1.
Axiom proof_of_xizi_circular_area_call_init_empty_read_release_safety_wit_2 : xizi_circular_area_call_init_empty_read_release_safety_wit_2.
Axiom proof_of_xizi_circular_area_call_init_empty_read_release_safety_wit_3 : xizi_circular_area_call_init_empty_read_release_safety_wit_3.
Axiom proof_of_xizi_circular_area_call_init_empty_read_release_safety_wit_4 : xizi_circular_area_call_init_empty_read_release_safety_wit_4.
Axiom proof_of_xizi_circular_area_call_init_empty_read_release_safety_wit_5 : xizi_circular_area_call_init_empty_read_release_safety_wit_5.
Axiom proof_of_xizi_circular_area_call_init_empty_read_release_safety_wit_6 : xizi_circular_area_call_init_empty_read_release_safety_wit_6.
Axiom proof_of_xizi_circular_area_call_init_empty_read_release_safety_wit_7 : xizi_circular_area_call_init_empty_read_release_safety_wit_7.
Axiom proof_of_xizi_circular_area_call_init_empty_read_release_return_wit_1 : xizi_circular_area_call_init_empty_read_release_return_wit_1.
Axiom proof_of_xizi_circular_area_call_init_empty_read_release_return_wit_2 : xizi_circular_area_call_init_empty_read_release_return_wit_2.
Axiom proof_of_xizi_circular_area_call_init_empty_read_release_partial_solve_wit_1_pure : xizi_circular_area_call_init_empty_read_release_partial_solve_wit_1_pure.
Axiom proof_of_xizi_circular_area_call_init_empty_read_release_partial_solve_wit_1 : xizi_circular_area_call_init_empty_read_release_partial_solve_wit_1.
Axiom proof_of_xizi_circular_area_call_init_empty_read_release_partial_solve_wit_2_pure : xizi_circular_area_call_init_empty_read_release_partial_solve_wit_2_pure.
Axiom proof_of_xizi_circular_area_call_init_empty_read_release_partial_solve_wit_2 : xizi_circular_area_call_init_empty_read_release_partial_solve_wit_2.
Axiom proof_of_xizi_circular_area_call_init_empty_read_release_partial_solve_wit_3 : xizi_circular_area_call_init_empty_read_release_partial_solve_wit_3.
Axiom proof_of_xizi_circular_area_call_init_first_write_release_safety_wit_1 : xizi_circular_area_call_init_first_write_release_safety_wit_1.
Axiom proof_of_xizi_circular_area_call_init_first_write_release_safety_wit_2 : xizi_circular_area_call_init_first_write_release_safety_wit_2.
Axiom proof_of_xizi_circular_area_call_init_first_write_release_safety_wit_3 : xizi_circular_area_call_init_first_write_release_safety_wit_3.
Axiom proof_of_xizi_circular_area_call_init_first_write_release_safety_wit_4 : xizi_circular_area_call_init_first_write_release_safety_wit_4.
Axiom proof_of_xizi_circular_area_call_init_first_write_release_safety_wit_5 : xizi_circular_area_call_init_first_write_release_safety_wit_5.
Axiom proof_of_xizi_circular_area_call_init_first_write_release_safety_wit_6 : xizi_circular_area_call_init_first_write_release_safety_wit_6.
Axiom proof_of_xizi_circular_area_call_init_first_write_release_safety_wit_7 : xizi_circular_area_call_init_first_write_release_safety_wit_7.
Axiom proof_of_xizi_circular_area_call_init_first_write_release_safety_wit_8 : xizi_circular_area_call_init_first_write_release_safety_wit_8.
Axiom proof_of_xizi_circular_area_call_init_first_write_release_return_wit_1 : xizi_circular_area_call_init_first_write_release_return_wit_1.
Axiom proof_of_xizi_circular_area_call_init_first_write_release_return_wit_2 : xizi_circular_area_call_init_first_write_release_return_wit_2.
Axiom proof_of_xizi_circular_area_call_init_first_write_release_partial_solve_wit_1_pure : xizi_circular_area_call_init_first_write_release_partial_solve_wit_1_pure.
Axiom proof_of_xizi_circular_area_call_init_first_write_release_partial_solve_wit_1 : xizi_circular_area_call_init_first_write_release_partial_solve_wit_1.
Axiom proof_of_xizi_circular_area_call_init_first_write_release_partial_solve_wit_2_pure : xizi_circular_area_call_init_first_write_release_partial_solve_wit_2_pure.
Axiom proof_of_xizi_circular_area_call_init_first_write_release_partial_solve_wit_2 : xizi_circular_area_call_init_first_write_release_partial_solve_wit_2.
Axiom proof_of_xizi_circular_area_call_init_first_write_release_partial_solve_wit_3 : xizi_circular_area_call_init_first_write_release_partial_solve_wit_3.
Axiom proof_of_xizi_circular_area_call_write_read_release_safety_wit_1 : xizi_circular_area_call_write_read_release_safety_wit_1.
Axiom proof_of_xizi_circular_area_call_write_read_release_safety_wit_2 : xizi_circular_area_call_write_read_release_safety_wit_2.
Axiom proof_of_xizi_circular_area_call_write_read_release_safety_wit_3 : xizi_circular_area_call_write_read_release_safety_wit_3.
Axiom proof_of_xizi_circular_area_call_write_read_release_safety_wit_4 : xizi_circular_area_call_write_read_release_safety_wit_4.
Axiom proof_of_xizi_circular_area_call_write_read_release_safety_wit_5 : xizi_circular_area_call_write_read_release_safety_wit_5.
Axiom proof_of_xizi_circular_area_call_write_read_release_safety_wit_6 : xizi_circular_area_call_write_read_release_safety_wit_6.
Axiom proof_of_xizi_circular_area_call_write_read_release_safety_wit_7 : xizi_circular_area_call_write_read_release_safety_wit_7.
Axiom proof_of_xizi_circular_area_call_write_read_release_safety_wit_8 : xizi_circular_area_call_write_read_release_safety_wit_8.
Axiom proof_of_xizi_circular_area_call_write_read_release_safety_wit_9 : xizi_circular_area_call_write_read_release_safety_wit_9.
Axiom proof_of_xizi_circular_area_call_write_read_release_return_wit_1 : xizi_circular_area_call_write_read_release_return_wit_1.
Axiom proof_of_xizi_circular_area_call_write_read_release_return_wit_2 : xizi_circular_area_call_write_read_release_return_wit_2.
Axiom proof_of_xizi_circular_area_call_write_read_release_partial_solve_wit_1_pure : xizi_circular_area_call_write_read_release_partial_solve_wit_1_pure.
Axiom proof_of_xizi_circular_area_call_write_read_release_partial_solve_wit_1 : xizi_circular_area_call_write_read_release_partial_solve_wit_1.
Axiom proof_of_xizi_circular_area_call_write_read_release_partial_solve_wit_2_pure : xizi_circular_area_call_write_read_release_partial_solve_wit_2_pure.
Axiom proof_of_xizi_circular_area_call_write_read_release_partial_solve_wit_2 : xizi_circular_area_call_write_read_release_partial_solve_wit_2.
Axiom proof_of_xizi_circular_area_call_write_read_release_partial_solve_wit_3_pure : xizi_circular_area_call_write_read_release_partial_solve_wit_3_pure.
Axiom proof_of_xizi_circular_area_call_write_read_release_partial_solve_wit_3 : xizi_circular_area_call_write_read_release_partial_solve_wit_3.
Axiom proof_of_xizi_circular_area_call_write_read_release_partial_solve_wit_4 : xizi_circular_area_call_write_read_release_partial_solve_wit_4.
Axiom proof_of_xizi_circular_area_call_repeated_write_release_safety_wit_1 : xizi_circular_area_call_repeated_write_release_safety_wit_1.
Axiom proof_of_xizi_circular_area_call_repeated_write_release_safety_wit_2 : xizi_circular_area_call_repeated_write_release_safety_wit_2.
Axiom proof_of_xizi_circular_area_call_repeated_write_release_safety_wit_3 : xizi_circular_area_call_repeated_write_release_safety_wit_3.
Axiom proof_of_xizi_circular_area_call_repeated_write_release_safety_wit_4 : xizi_circular_area_call_repeated_write_release_safety_wit_4.
Axiom proof_of_xizi_circular_area_call_repeated_write_release_safety_wit_5 : xizi_circular_area_call_repeated_write_release_safety_wit_5.
Axiom proof_of_xizi_circular_area_call_repeated_write_release_safety_wit_6 : xizi_circular_area_call_repeated_write_release_safety_wit_6.
Axiom proof_of_xizi_circular_area_call_repeated_write_release_safety_wit_7 : xizi_circular_area_call_repeated_write_release_safety_wit_7.
Axiom proof_of_xizi_circular_area_call_repeated_write_release_safety_wit_8 : xizi_circular_area_call_repeated_write_release_safety_wit_8.
Axiom proof_of_xizi_circular_area_call_repeated_write_release_safety_wit_9 : xizi_circular_area_call_repeated_write_release_safety_wit_9.
Axiom proof_of_xizi_circular_area_call_repeated_write_release_safety_wit_10 : xizi_circular_area_call_repeated_write_release_safety_wit_10.
Axiom proof_of_xizi_circular_area_call_repeated_write_release_return_wit_1 : xizi_circular_area_call_repeated_write_release_return_wit_1.
Axiom proof_of_xizi_circular_area_call_repeated_write_release_return_wit_2 : xizi_circular_area_call_repeated_write_release_return_wit_2.
Axiom proof_of_xizi_circular_area_call_repeated_write_release_partial_solve_wit_1_pure : xizi_circular_area_call_repeated_write_release_partial_solve_wit_1_pure.
Axiom proof_of_xizi_circular_area_call_repeated_write_release_partial_solve_wit_1 : xizi_circular_area_call_repeated_write_release_partial_solve_wit_1.
Axiom proof_of_xizi_circular_area_call_repeated_write_release_partial_solve_wit_2_pure : xizi_circular_area_call_repeated_write_release_partial_solve_wit_2_pure.
Axiom proof_of_xizi_circular_area_call_repeated_write_release_partial_solve_wit_2 : xizi_circular_area_call_repeated_write_release_partial_solve_wit_2.
Axiom proof_of_xizi_circular_area_call_repeated_write_release_partial_solve_wit_3_pure : xizi_circular_area_call_repeated_write_release_partial_solve_wit_3_pure.
Axiom proof_of_xizi_circular_area_call_repeated_write_release_partial_solve_wit_3 : xizi_circular_area_call_repeated_write_release_partial_solve_wit_3.
Axiom proof_of_xizi_circular_area_call_repeated_write_release_partial_solve_wit_4 : xizi_circular_area_call_repeated_write_release_partial_solve_wit_4.
Axiom proof_of_xizi_circular_area_call_read_then_write_release_safety_wit_1 : xizi_circular_area_call_read_then_write_release_safety_wit_1.
Axiom proof_of_xizi_circular_area_call_read_then_write_release_safety_wit_2 : xizi_circular_area_call_read_then_write_release_safety_wit_2.
Axiom proof_of_xizi_circular_area_call_read_then_write_release_safety_wit_3 : xizi_circular_area_call_read_then_write_release_safety_wit_3.
Axiom proof_of_xizi_circular_area_call_read_then_write_release_safety_wit_4 : xizi_circular_area_call_read_then_write_release_safety_wit_4.
Axiom proof_of_xizi_circular_area_call_read_then_write_release_safety_wit_5 : xizi_circular_area_call_read_then_write_release_safety_wit_5.
Axiom proof_of_xizi_circular_area_call_read_then_write_release_safety_wit_6 : xizi_circular_area_call_read_then_write_release_safety_wit_6.
Axiom proof_of_xizi_circular_area_call_read_then_write_release_safety_wit_7 : xizi_circular_area_call_read_then_write_release_safety_wit_7.
Axiom proof_of_xizi_circular_area_call_read_then_write_release_safety_wit_8 : xizi_circular_area_call_read_then_write_release_safety_wit_8.
Axiom proof_of_xizi_circular_area_call_read_then_write_release_safety_wit_9 : xizi_circular_area_call_read_then_write_release_safety_wit_9.
Axiom proof_of_xizi_circular_area_call_read_then_write_release_safety_wit_10 : xizi_circular_area_call_read_then_write_release_safety_wit_10.
Axiom proof_of_xizi_circular_area_call_read_then_write_release_safety_wit_11 : xizi_circular_area_call_read_then_write_release_safety_wit_11.
Axiom proof_of_xizi_circular_area_call_read_then_write_release_return_wit_1 : xizi_circular_area_call_read_then_write_release_return_wit_1.
Axiom proof_of_xizi_circular_area_call_read_then_write_release_return_wit_2 : xizi_circular_area_call_read_then_write_release_return_wit_2.
Axiom proof_of_xizi_circular_area_call_read_then_write_release_partial_solve_wit_1_pure : xizi_circular_area_call_read_then_write_release_partial_solve_wit_1_pure.
Axiom proof_of_xizi_circular_area_call_read_then_write_release_partial_solve_wit_1 : xizi_circular_area_call_read_then_write_release_partial_solve_wit_1.
Axiom proof_of_xizi_circular_area_call_read_then_write_release_partial_solve_wit_2_pure : xizi_circular_area_call_read_then_write_release_partial_solve_wit_2_pure.
Axiom proof_of_xizi_circular_area_call_read_then_write_release_partial_solve_wit_2 : xizi_circular_area_call_read_then_write_release_partial_solve_wit_2.
Axiom proof_of_xizi_circular_area_call_read_then_write_release_partial_solve_wit_3_pure : xizi_circular_area_call_read_then_write_release_partial_solve_wit_3_pure.
Axiom proof_of_xizi_circular_area_call_read_then_write_release_partial_solve_wit_3 : xizi_circular_area_call_read_then_write_release_partial_solve_wit_3.
Axiom proof_of_xizi_circular_area_call_read_then_write_release_partial_solve_wit_4_pure : xizi_circular_area_call_read_then_write_release_partial_solve_wit_4_pure.
Axiom proof_of_xizi_circular_area_call_read_then_write_release_partial_solve_wit_4 : xizi_circular_area_call_read_then_write_release_partial_solve_wit_4.
Axiom proof_of_xizi_circular_area_call_read_then_write_release_partial_solve_wit_5 : xizi_circular_area_call_read_then_write_release_partial_solve_wit_5.
Axiom proof_of_xizi_circular_area_call_reset_release_safety_wit_1 : xizi_circular_area_call_reset_release_safety_wit_1.
Axiom proof_of_xizi_circular_area_call_reset_release_safety_wit_2 : xizi_circular_area_call_reset_release_safety_wit_2.
Axiom proof_of_xizi_circular_area_call_reset_release_safety_wit_3 : xizi_circular_area_call_reset_release_safety_wit_3.
Axiom proof_of_xizi_circular_area_call_reset_release_safety_wit_4 : xizi_circular_area_call_reset_release_safety_wit_4.
Axiom proof_of_xizi_circular_area_call_reset_release_safety_wit_5 : xizi_circular_area_call_reset_release_safety_wit_5.
Axiom proof_of_xizi_circular_area_call_reset_release_safety_wit_6 : xizi_circular_area_call_reset_release_safety_wit_6.
Axiom proof_of_xizi_circular_area_call_reset_release_safety_wit_7 : xizi_circular_area_call_reset_release_safety_wit_7.
Axiom proof_of_xizi_circular_area_call_reset_release_safety_wit_8 : xizi_circular_area_call_reset_release_safety_wit_8.
Axiom proof_of_xizi_circular_area_call_reset_release_return_wit_1 : xizi_circular_area_call_reset_release_return_wit_1.
Axiom proof_of_xizi_circular_area_call_reset_release_return_wit_2 : xizi_circular_area_call_reset_release_return_wit_2.
Axiom proof_of_xizi_circular_area_call_reset_release_partial_solve_wit_1_pure : xizi_circular_area_call_reset_release_partial_solve_wit_1_pure.
Axiom proof_of_xizi_circular_area_call_reset_release_partial_solve_wit_1 : xizi_circular_area_call_reset_release_partial_solve_wit_1.
Axiom proof_of_xizi_circular_area_call_reset_release_partial_solve_wit_2_pure : xizi_circular_area_call_reset_release_partial_solve_wit_2_pure.
Axiom proof_of_xizi_circular_area_call_reset_release_partial_solve_wit_2 : xizi_circular_area_call_reset_release_partial_solve_wit_2.
Axiom proof_of_xizi_circular_area_call_reset_release_partial_solve_wit_3_pure : xizi_circular_area_call_reset_release_partial_solve_wit_3_pure.
Axiom proof_of_xizi_circular_area_call_reset_release_partial_solve_wit_3 : xizi_circular_area_call_reset_release_partial_solve_wit_3.
Axiom proof_of_xizi_circular_area_call_reset_release_partial_solve_wit_4 : xizi_circular_area_call_reset_release_partial_solve_wit_4.
Axiom proof_of_xizi_circular_area_call_reset_release_partial_solve_wit_5 : xizi_circular_area_call_reset_release_partial_solve_wit_5.
Axiom proof_of_xizi_circular_area_call_reset_release_partial_solve_wit_6 : xizi_circular_area_call_reset_release_partial_solve_wit_6.
Axiom proof_of_xizi_circular_area_call_force_full_release_safety_wit_1 : xizi_circular_area_call_force_full_release_safety_wit_1.
Axiom proof_of_xizi_circular_area_call_force_full_release_safety_wit_2 : xizi_circular_area_call_force_full_release_safety_wit_2.
Axiom proof_of_xizi_circular_area_call_force_full_release_safety_wit_3 : xizi_circular_area_call_force_full_release_safety_wit_3.
Axiom proof_of_xizi_circular_area_call_force_full_release_safety_wit_4 : xizi_circular_area_call_force_full_release_safety_wit_4.
Axiom proof_of_xizi_circular_area_call_force_full_release_safety_wit_5 : xizi_circular_area_call_force_full_release_safety_wit_5.
Axiom proof_of_xizi_circular_area_call_force_full_release_safety_wit_6 : xizi_circular_area_call_force_full_release_safety_wit_6.
Axiom proof_of_xizi_circular_area_call_force_full_release_safety_wit_7 : xizi_circular_area_call_force_full_release_safety_wit_7.
Axiom proof_of_xizi_circular_area_call_force_full_release_safety_wit_8 : xizi_circular_area_call_force_full_release_safety_wit_8.
Axiom proof_of_xizi_circular_area_call_force_full_release_safety_wit_9 : xizi_circular_area_call_force_full_release_safety_wit_9.
Axiom proof_of_xizi_circular_area_call_force_full_release_entail_wit_1 : xizi_circular_area_call_force_full_release_entail_wit_1.
Axiom proof_of_xizi_circular_area_call_force_full_release_return_wit_1 : xizi_circular_area_call_force_full_release_return_wit_1.
Axiom proof_of_xizi_circular_area_call_force_full_release_return_wit_2 : xizi_circular_area_call_force_full_release_return_wit_2.
Axiom proof_of_xizi_circular_area_call_force_full_release_partial_solve_wit_1_pure : xizi_circular_area_call_force_full_release_partial_solve_wit_1_pure.
Axiom proof_of_xizi_circular_area_call_force_full_release_partial_solve_wit_1 : xizi_circular_area_call_force_full_release_partial_solve_wit_1.
Axiom proof_of_xizi_circular_area_call_force_full_release_partial_solve_wit_2_pure : xizi_circular_area_call_force_full_release_partial_solve_wit_2_pure.
Axiom proof_of_xizi_circular_area_call_force_full_release_partial_solve_wit_2 : xizi_circular_area_call_force_full_release_partial_solve_wit_2.
Axiom proof_of_xizi_circular_area_call_force_full_release_partial_solve_wit_3 : xizi_circular_area_call_force_full_release_partial_solve_wit_3.

End VC_Correct.
