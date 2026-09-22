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
forall (requested_pre: Z) (LitMap: (string -> Z)) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (CircularAreaAlignedLength requested_pre area_length )) (PreH3 : (xizi_circular_area_uninitialized area_length physical )) (PreH4 : (4 <= requested_pre)) (PreH5 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
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
forall (requested_pre: Z) (LitMap: (string -> Z)) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaAlignedLength requested_pre area_length )) (PreH4 : (xizi_circular_area_uninitialized area_length physical )) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
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
forall (requested_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (CircularAreaDataLengthResult (@nil Z) retval_5 )) (PreH2 : (CircularAreaMaxLengthResult area_length retval_4 )) (PreH3 : (CircularAreaFullResult area_length (@nil Z) retval_3 )) (PreH4 : (CircularAreaEmptyResult (@nil Z) retval_2 )) (PreH5 : (retval <> 0)) (PreH6 : (retval <> 0)) (PreH7 : (CircularAreaAlignedLength requested_pre area_length )) (PreH8 : (xizi_circular_area_uninitialized area_length physical )) (PreH9 : (4 <= requested_pre)) (PreH10 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition xizi_circular_area_call_init_metadata_release_return_wit_1 := 
(
forall (requested_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (CircularAreaDataLengthResult (@nil Z) retval_5 )) (PreH2 : (CircularAreaMaxLengthResult area_length retval_4 )) (PreH3 : (CircularAreaFullResult area_length (@nil Z) retval_3 )) (PreH4 : (CircularAreaEmptyResult (@nil Z) retval_2 )) (PreH5 : (retval <> 0)) (PreH6 : (retval <> 0)) (PreH7 : (CircularAreaAlignedLength requested_pre area_length )) (PreH8 : (xizi_circular_area_uninitialized area_length physical )) (PreH9 : (4 <= requested_pre)) (PreH10 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 1 )
) \/
(
forall (requested_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (CircularAreaDataLengthResult (@nil Z) retval_5 )) (PreH2 : (CircularAreaMaxLengthResult area_length retval_4 )) (PreH3 : (CircularAreaFullResult area_length (@nil Z) retval_3 )) (PreH4 : (CircularAreaEmptyResult (@nil Z) retval_2 )) (PreH5 : (retval <> 0)) (PreH6 : (retval <> 0)) (PreH7 : (CircularAreaAlignedLength requested_pre area_length )) (PreH8 : (xizi_circular_area_uninitialized area_length physical )) (PreH9 : (4 <= requested_pre)) (PreH10 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 1 )
).

Definition xizi_circular_area_call_init_metadata_release_return_wit_1_split_goal_spatial := 
forall (requested_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (CircularAreaDataLengthResult (@nil Z) retval_5 )) (PreH2 : (CircularAreaMaxLengthResult area_length retval_4 )) (PreH3 : (CircularAreaFullResult area_length (@nil Z) retval_3 )) (PreH4 : (CircularAreaEmptyResult (@nil Z) retval_2 )) (PreH5 : (retval <> 0)) (PreH6 : (retval <> 0)) (PreH7 : (CircularAreaAlignedLength requested_pre area_length )) (PreH8 : (xizi_circular_area_uninitialized area_length physical )) (PreH9 : (4 <= requested_pre)) (PreH10 : (requested_pre <= 256)) ,
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
forall (requested_pre: Z) (LitMap: (string -> Z)) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaAlignedLength requested_pre area_length )) (PreH4 : (xizi_circular_area_uninitialized area_length physical )) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
  **  (GlobalStrings LitMap )
|--
  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (CircularAreaAlignedLength requested_pre area_length ) ” 
  &&  “ (xizi_circular_area_uninitialized area_length physical ) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
.

Definition xizi_circular_area_call_init_metadata_release_partial_solve_wit_3 := 
forall (requested_pre: Z) (LitMap: (string -> Z)) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (retval_2: Z) (PreH1 : (CircularAreaEmptyResult (@nil Z) retval_2 )) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (CircularAreaAlignedLength requested_pre area_length )) (PreH5 : (xizi_circular_area_uninitialized area_length physical )) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
|--
  “ (CircularAreaEmptyResult (@nil Z) retval_2 ) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (CircularAreaAlignedLength requested_pre area_length ) ” 
  &&  “ (xizi_circular_area_uninitialized area_length physical ) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
.

Definition xizi_circular_area_call_init_metadata_release_partial_solve_wit_4 := 
forall (requested_pre: Z) (LitMap: (string -> Z)) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (CircularAreaFullResult area_length (@nil Z) retval_3 )) (PreH2 : (CircularAreaEmptyResult (@nil Z) retval_2 )) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (CircularAreaAlignedLength requested_pre area_length )) (PreH6 : (xizi_circular_area_uninitialized area_length physical )) (PreH7 : (4 <= requested_pre)) (PreH8 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
|--
  “ (CircularAreaFullResult area_length (@nil Z) retval_3 ) ” 
  &&  “ (CircularAreaEmptyResult (@nil Z) retval_2 ) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (CircularAreaAlignedLength requested_pre area_length ) ” 
  &&  “ (xizi_circular_area_uninitialized area_length physical ) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
.

Definition xizi_circular_area_call_init_metadata_release_partial_solve_wit_5 := 
forall (requested_pre: Z) (LitMap: (string -> Z)) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (CircularAreaMaxLengthResult area_length retval_4 )) (PreH2 : (CircularAreaFullResult area_length (@nil Z) retval_3 )) (PreH3 : (CircularAreaEmptyResult (@nil Z) retval_2 )) (PreH4 : (retval <> 0)) (PreH5 : (retval <> 0)) (PreH6 : (CircularAreaAlignedLength requested_pre area_length )) (PreH7 : (xizi_circular_area_uninitialized area_length physical )) (PreH8 : (4 <= requested_pre)) (PreH9 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
|--
  “ (CircularAreaMaxLengthResult area_length retval_4 ) ” 
  &&  “ (CircularAreaFullResult area_length (@nil Z) retval_3 ) ” 
  &&  “ (CircularAreaEmptyResult (@nil Z) retval_2 ) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (CircularAreaAlignedLength requested_pre area_length ) ” 
  &&  “ (xizi_circular_area_uninitialized area_length physical ) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
.

Definition xizi_circular_area_call_init_metadata_release_partial_solve_wit_6 := 
forall (requested_pre: Z) (LitMap: (string -> Z)) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (CircularAreaDataLengthResult (@nil Z) retval_5 )) (PreH2 : (CircularAreaMaxLengthResult area_length retval_4 )) (PreH3 : (CircularAreaFullResult area_length (@nil Z) retval_3 )) (PreH4 : (CircularAreaEmptyResult (@nil Z) retval_2 )) (PreH5 : (retval <> 0)) (PreH6 : (retval <> 0)) (PreH7 : (CircularAreaAlignedLength requested_pre area_length )) (PreH8 : (xizi_circular_area_uninitialized area_length physical )) (PreH9 : (4 <= requested_pre)) (PreH10 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
|--
  “ (CircularAreaDataLengthResult (@nil Z) retval_5 ) ” 
  &&  “ (CircularAreaMaxLengthResult area_length retval_4 ) ” 
  &&  “ (CircularAreaFullResult area_length (@nil Z) retval_3 ) ” 
  &&  “ (CircularAreaEmptyResult (@nil Z) retval_2 ) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (CircularAreaAlignedLength requested_pre area_length ) ” 
  &&  “ (xizi_circular_area_uninitialized area_length physical ) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
  **  (GlobalStrings LitMap )
.

(*----- Function xizi_circular_area_call_init_empty_read_release -----*)

Definition xizi_circular_area_call_init_empty_read_release_safety_wit_1 := 
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (4 <= requested_pre)) (PreH3 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full output_buffer_pre 1 output_before )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_init_empty_read_release_safety_wit_2 := 
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (CircularAreaAlignedLength requested_pre area_length )) (PreH3 : (xizi_circular_area_uninitialized area_length physical )) (PreH4 : (4 <= requested_pre)) (PreH5 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full output_buffer_pre 1 output_before )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_init_empty_read_release_safety_wit_3 := 
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full output_buffer_pre 1 output_before )
|--
  “ False ”
.

Definition xizi_circular_area_call_init_empty_read_release_safety_wit_4 := 
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaAlignedLength requested_pre area_length )) (PreH4 : (xizi_circular_area_uninitialized area_length physical )) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full output_buffer_pre 1 output_before )
|--
  “ False ”
.

Definition xizi_circular_area_call_init_empty_read_release_safety_wit_5 := 
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full output_buffer_pre 1 output_before )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_init_empty_read_release_safety_wit_6 := 
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaAlignedLength requested_pre area_length )) (PreH4 : (xizi_circular_area_uninitialized area_length physical )) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full output_buffer_pre 1 output_before )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition xizi_circular_area_call_init_empty_read_release_safety_wit_7 := 
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 1)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (CircularAreaAlignedLength requested_pre area_length )) (PreH5 : (xizi_circular_area_uninitialized area_length physical )) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full output_buffer_pre 1 output_before )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition xizi_circular_area_call_init_empty_read_release_return_wit_1 := 
(
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 1)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (CircularAreaAlignedLength requested_pre area_length )) (PreH5 : (xizi_circular_area_uninitialized area_length physical )) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full output_buffer_pre 1 output_before )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 1 )
  **  (UCharArray.full output_buffer_pre 1 output_before )
) \/
(
forall (requested_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 1)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (CircularAreaAlignedLength requested_pre area_length )) (PreH5 : (xizi_circular_area_uninitialized area_length physical )) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 1 )
).

Definition xizi_circular_area_call_init_empty_read_release_return_wit_1_split_goal_spatial := 
forall (requested_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 1)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (CircularAreaAlignedLength requested_pre area_length )) (PreH5 : (xizi_circular_area_uninitialized area_length physical )) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 1 )
.

Definition xizi_circular_area_call_init_empty_read_release_return_wit_2 := 
(
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full output_buffer_pre 1 output_before )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 0 )
  **  (UCharArray.full output_buffer_pre 1 output_before )
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
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (PreH1 : (4 <= requested_pre)) (PreH2 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |->_)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full output_buffer_pre 1 output_before )
|--
  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
.

Definition xizi_circular_area_call_init_empty_read_release_partial_solve_wit_1_aux := 
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (PreH1 : (4 <= requested_pre)) (PreH2 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full output_buffer_pre 1 output_before )
|--
  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.full output_buffer_pre 1 output_before )
.

Definition xizi_circular_area_call_init_empty_read_release_partial_solve_wit_1 := xizi_circular_area_call_init_empty_read_release_partial_solve_wit_1_pure -> xizi_circular_area_call_init_empty_read_release_partial_solve_wit_1_aux.

Definition xizi_circular_area_call_init_empty_read_release_partial_solve_wit_2_pure := 
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaAlignedLength requested_pre area_length )) (PreH4 : (xizi_circular_area_uninitialized area_length physical )) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full output_buffer_pre 1 output_before )
|--
  “ (1 = 1) ”
.

Definition xizi_circular_area_call_init_empty_read_release_partial_solve_wit_2_aux := 
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaAlignedLength requested_pre area_length )) (PreH4 : (xizi_circular_area_uninitialized area_length physical )) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full output_buffer_pre 1 output_before )
|--
  “ (1 = 1) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (CircularAreaAlignedLength requested_pre area_length ) ” 
  &&  “ (xizi_circular_area_uninitialized area_length physical ) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
  **  (UCharArray.full output_buffer_pre 1 output_before )
.

Definition xizi_circular_area_call_init_empty_read_release_partial_solve_wit_2 := xizi_circular_area_call_init_empty_read_release_partial_solve_wit_2_pure -> xizi_circular_area_call_init_empty_read_release_partial_solve_wit_2_aux.

Definition xizi_circular_area_call_init_empty_read_release_partial_solve_wit_3 := 
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 1)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (CircularAreaAlignedLength requested_pre area_length )) (PreH5 : (xizi_circular_area_uninitialized area_length physical )) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
  **  (UCharArray.full output_buffer_pre 1 output_before )
|--
  “ (retval_2 = 1) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (CircularAreaAlignedLength requested_pre area_length ) ” 
  &&  “ (xizi_circular_area_uninitialized area_length physical ) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full output_buffer_pre 1 output_before )
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
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (CircularAreaAlignedLength requested_pre area_length )) (PreH3 : (xizi_circular_area_uninitialized area_length physical )) (PreH4 : (4 <= requested_pre)) (PreH5 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
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
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaAlignedLength requested_pre area_length )) (PreH4 : (xizi_circular_area_uninitialized area_length physical )) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
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
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaAlignedLength requested_pre area_length )) (PreH4 : (xizi_circular_area_uninitialized area_length physical )) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
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
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaAlignedLength requested_pre area_length )) (PreH4 : (xizi_circular_area_uninitialized area_length physical )) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
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
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (CircularAreaAlignedLength requested_pre area_length )) (PreH5 : (xizi_circular_area_uninitialized area_length physical )) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
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
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (CircularAreaAlignedLength requested_pre area_length )) (PreH5 : (xizi_circular_area_uninitialized area_length physical )) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 1 )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
) \/
(
forall (requested_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (CircularAreaAlignedLength requested_pre area_length )) (PreH5 : (xizi_circular_area_uninitialized area_length physical )) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 1 )
).

Definition xizi_circular_area_call_init_first_write_release_return_wit_1_split_goal_spatial := 
forall (requested_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (CircularAreaAlignedLength requested_pre area_length )) (PreH5 : (xizi_circular_area_uninitialized area_length physical )) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
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
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaAlignedLength requested_pre area_length )) (PreH4 : (xizi_circular_area_uninitialized area_length physical )) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ (1 = 1) ” 
  &&  “ (0 = 0) ”
.

Definition xizi_circular_area_call_init_first_write_release_partial_solve_wit_2_aux := 
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaAlignedLength requested_pre area_length )) (PreH4 : (xizi_circular_area_uninitialized area_length physical )) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ (1 = 1) ” 
  &&  “ (0 = 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (CircularAreaAlignedLength requested_pre area_length ) ” 
  &&  “ (xizi_circular_area_uninitialized area_length physical ) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
.

Definition xizi_circular_area_call_init_first_write_release_partial_solve_wit_2 := xizi_circular_area_call_init_first_write_release_partial_solve_wit_2_pure -> xizi_circular_area_call_init_first_write_release_partial_solve_wit_2_aux.

Definition xizi_circular_area_call_init_first_write_release_partial_solve_wit_3 := 
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (physical1: (@list (@option Z))) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (CircularAreaAlignedLength requested_pre area_length )) (PreH5 : (xizi_circular_area_uninitialized area_length physical )) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 ((0 + 1 ) % ( area_length ) ) area_length 1 operations (cons (byte) ((@nil Z))) physical1 )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ (retval_2 = 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (CircularAreaAlignedLength requested_pre area_length ) ” 
  &&  “ (xizi_circular_area_uninitialized area_length physical ) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (CircularAreaBackingResource retval data_buffer 0 ((0 + 1 ) % ( area_length ) ) area_length 1 operations (cons (byte) ((@nil Z))) physical1 )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
.

(*----- Function xizi_circular_area_call_write_read_release -----*)

Definition xizi_circular_area_call_write_read_release_safety_wit_1 := 
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (byte: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (4 <= requested_pre)) (PreH3 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (UCharArray.full output_buffer_pre 1 output_before )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_write_read_release_safety_wit_2 := 
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (CircularAreaAlignedLength requested_pre area_length )) (PreH3 : (xizi_circular_area_uninitialized area_length physical )) (PreH4 : (4 <= requested_pre)) (PreH5 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (UCharArray.full output_buffer_pre 1 output_before )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_write_read_release_safety_wit_3 := 
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (byte: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (UCharArray.full output_buffer_pre 1 output_before )
|--
  “ False ”
.

Definition xizi_circular_area_call_write_read_release_safety_wit_4 := 
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaAlignedLength requested_pre area_length )) (PreH4 : (xizi_circular_area_uninitialized area_length physical )) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (UCharArray.full output_buffer_pre 1 output_before )
|--
  “ False ”
.

Definition xizi_circular_area_call_write_read_release_safety_wit_5 := 
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (byte: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (UCharArray.full output_buffer_pre 1 output_before )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_write_read_release_safety_wit_6 := 
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaAlignedLength requested_pre area_length )) (PreH4 : (xizi_circular_area_uninitialized area_length physical )) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (UCharArray.full output_buffer_pre 1 output_before )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition xizi_circular_area_call_write_read_release_safety_wit_7 := 
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaAlignedLength requested_pre area_length )) (PreH4 : (xizi_circular_area_uninitialized area_length physical )) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (UCharArray.full output_buffer_pre 1 output_before )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_write_read_release_safety_wit_8 := 
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (physical1: (@list (@option Z))) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (CircularAreaAlignedLength requested_pre area_length )) (PreH5 : (xizi_circular_area_uninitialized area_length physical )) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 ((0 + 1 ) % ( area_length ) ) area_length 1 operations (cons (byte) ((@nil Z))) physical1 )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (UCharArray.full output_buffer_pre 1 output_before )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition xizi_circular_area_call_write_read_release_safety_wit_9 := 
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (retval_2 = 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (CircularAreaAlignedLength requested_pre area_length )) (PreH6 : (xizi_circular_area_uninitialized area_length physical )) (PreH7 : (4 <= requested_pre)) (PreH8 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full output_buffer_pre 1 (cons (byte) ((@nil Z))) )
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
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (byte: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (retval_2 = 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (CircularAreaAlignedLength requested_pre area_length )) (PreH6 : (xizi_circular_area_uninitialized area_length physical )) (PreH7 : (4 <= requested_pre)) (PreH8 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full output_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (CircularAreaReadCallResult 1 output_buffer_pre byte output_before )
) \/
(
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (byte: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (retval_2 = 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (CircularAreaAlignedLength requested_pre area_length )) (PreH6 : (xizi_circular_area_uninitialized area_length physical )) (PreH7 : (4 <= requested_pre)) (PreH8 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full output_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaReadCallResult 1 output_buffer_pre byte output_before )
).

Definition xizi_circular_area_call_write_read_release_return_wit_1_split_goal_spatial := 
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (byte: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (retval_2 = 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (CircularAreaAlignedLength requested_pre area_length )) (PreH6 : (xizi_circular_area_uninitialized area_length physical )) (PreH7 : (4 <= requested_pre)) (PreH8 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full output_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaReadCallResult 1 output_buffer_pre byte output_before )
.

Definition xizi_circular_area_call_write_read_release_return_wit_2 := 
(
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (byte: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (UCharArray.full output_buffer_pre 1 output_before )
|--
  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (CircularAreaReadCallResult 0 output_buffer_pre byte output_before )
) \/
(
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (byte: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full output_buffer_pre 1 output_before )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaReadCallResult 0 output_buffer_pre byte output_before )
).

Definition xizi_circular_area_call_write_read_release_return_wit_2_split_goal_spatial := 
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (byte: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full output_buffer_pre 1 output_before )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaReadCallResult 0 output_buffer_pre byte output_before )
.

Definition xizi_circular_area_call_write_read_release_partial_solve_wit_1_pure := 
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (byte: Z) (PreH1 : (4 <= requested_pre)) (PreH2 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |->_)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (UCharArray.full output_buffer_pre 1 output_before )
|--
  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
.

Definition xizi_circular_area_call_write_read_release_partial_solve_wit_1_aux := 
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (byte: Z) (PreH1 : (4 <= requested_pre)) (PreH2 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (UCharArray.full output_buffer_pre 1 output_before )
|--
  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (UCharArray.full output_buffer_pre 1 output_before )
.

Definition xizi_circular_area_call_write_read_release_partial_solve_wit_1 := xizi_circular_area_call_write_read_release_partial_solve_wit_1_pure -> xizi_circular_area_call_write_read_release_partial_solve_wit_1_aux.

Definition xizi_circular_area_call_write_read_release_partial_solve_wit_2_pure := 
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaAlignedLength requested_pre area_length )) (PreH4 : (xizi_circular_area_uninitialized area_length physical )) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (UCharArray.full output_buffer_pre 1 output_before )
|--
  “ (1 = 1) ” 
  &&  “ (0 = 0) ”
.

Definition xizi_circular_area_call_write_read_release_partial_solve_wit_2_aux := 
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaAlignedLength requested_pre area_length )) (PreH4 : (xizi_circular_area_uninitialized area_length physical )) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (UCharArray.full output_buffer_pre 1 output_before )
|--
  “ (1 = 1) ” 
  &&  “ (0 = 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (CircularAreaAlignedLength requested_pre area_length ) ” 
  &&  “ (xizi_circular_area_uninitialized area_length physical ) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (UCharArray.full output_buffer_pre 1 output_before )
.

Definition xizi_circular_area_call_write_read_release_partial_solve_wit_2 := xizi_circular_area_call_write_read_release_partial_solve_wit_2_pure -> xizi_circular_area_call_write_read_release_partial_solve_wit_2_aux.

Definition xizi_circular_area_call_write_read_release_partial_solve_wit_3_pure := 
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (physical1: (@list (@option Z))) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (CircularAreaAlignedLength requested_pre area_length )) (PreH5 : (xizi_circular_area_uninitialized area_length physical )) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 ((0 + 1 ) % ( area_length ) ) area_length 1 operations (cons (byte) ((@nil Z))) physical1 )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  (UCharArray.full output_buffer_pre 1 output_before )
|--
  “ (1 = 1) ”
.

Definition xizi_circular_area_call_write_read_release_partial_solve_wit_3_aux := 
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (physical1: (@list (@option Z))) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (CircularAreaAlignedLength requested_pre area_length )) (PreH5 : (xizi_circular_area_uninitialized area_length physical )) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 ((0 + 1 ) % ( area_length ) ) area_length 1 operations (cons (byte) ((@nil Z))) physical1 )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (UCharArray.full output_buffer_pre 1 output_before )
|--
  “ (1 = 1) ” 
  &&  “ (retval_2 = 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (CircularAreaAlignedLength requested_pre area_length ) ” 
  &&  “ (xizi_circular_area_uninitialized area_length physical ) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 ((0 + 1 ) % ( area_length ) ) area_length 1 operations (cons (byte) ((@nil Z))) physical1 )
  **  (UCharArray.full output_buffer_pre 1 output_before )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
.

Definition xizi_circular_area_call_write_read_release_partial_solve_wit_3 := xizi_circular_area_call_write_read_release_partial_solve_wit_3_pure -> xizi_circular_area_call_write_read_release_partial_solve_wit_3_aux.

Definition xizi_circular_area_call_write_read_release_partial_solve_wit_4 := 
forall (output_buffer_pre: Z) (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (physical1: (@list (@option Z))) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (retval_2 = 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (CircularAreaAlignedLength requested_pre area_length )) (PreH6 : (xizi_circular_area_uninitialized area_length physical )) (PreH7 : (4 <= requested_pre)) (PreH8 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer ((0 + 1 ) % ( area_length ) ) ((0 + 1 ) % ( area_length ) ) area_length 0 operations (@nil Z) physical1 )
  **  (UCharArray.full output_buffer_pre 1 (cons (byte) ((@nil Z))) )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ (retval_3 = 0) ” 
  &&  “ (retval_2 = 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (CircularAreaAlignedLength requested_pre area_length ) ” 
  &&  “ (xizi_circular_area_uninitialized area_length physical ) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (CircularAreaBackingResource retval data_buffer ((0 + 1 ) % ( area_length ) ) ((0 + 1 ) % ( area_length ) ) area_length 0 operations (@nil Z) physical1 )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full output_buffer_pre 1 (cons (byte) ((@nil Z))) )
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
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (CircularAreaAlignedLength requested_pre area_length )) (PreH3 : (xizi_circular_area_uninitialized area_length physical )) (PreH4 : (4 <= requested_pre)) (PreH5 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
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
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaAlignedLength requested_pre area_length )) (PreH4 : (xizi_circular_area_uninitialized area_length physical )) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
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
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaAlignedLength requested_pre area_length )) (PreH4 : (xizi_circular_area_uninitialized area_length physical )) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
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
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaAlignedLength requested_pre area_length )) (PreH4 : (xizi_circular_area_uninitialized area_length physical )) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
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
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (physical1: (@list (@option Z))) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (CircularAreaAlignedLength requested_pre area_length )) (PreH5 : (xizi_circular_area_uninitialized area_length physical )) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 ((0 + 1 ) % ( area_length ) ) area_length 1 operations (cons (first_byte) ((@nil Z))) physical1 )
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
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (physical1: (@list (@option Z))) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (CircularAreaAlignedLength requested_pre area_length )) (PreH5 : (xizi_circular_area_uninitialized area_length physical )) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 ((0 + 1 ) % ( area_length ) ) area_length 1 operations (cons (first_byte) ((@nil Z))) physical1 )
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
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (retval_2 = 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (CircularAreaAlignedLength requested_pre area_length )) (PreH6 : (xizi_circular_area_uninitialized area_length physical )) (PreH7 : (4 <= requested_pre)) (PreH8 : (requested_pre <= 256)) ,
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
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (retval_2 = 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (CircularAreaAlignedLength requested_pre area_length )) (PreH6 : (xizi_circular_area_uninitialized area_length physical )) (PreH7 : (4 <= requested_pre)) (PreH8 : (requested_pre <= 256)) ,
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
forall (requested_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (retval_2 = 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (CircularAreaAlignedLength requested_pre area_length )) (PreH6 : (xizi_circular_area_uninitialized area_length physical )) (PreH7 : (4 <= requested_pre)) (PreH8 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 1 )
).

Definition xizi_circular_area_call_repeated_write_release_return_wit_1_split_goal_spatial := 
forall (requested_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (retval_2 = 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (CircularAreaAlignedLength requested_pre area_length )) (PreH6 : (xizi_circular_area_uninitialized area_length physical )) (PreH7 : (4 <= requested_pre)) (PreH8 : (requested_pre <= 256)) ,
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
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaAlignedLength requested_pre area_length )) (PreH4 : (xizi_circular_area_uninitialized area_length physical )) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
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
.

Definition xizi_circular_area_call_repeated_write_release_partial_solve_wit_2_aux := 
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaAlignedLength requested_pre area_length )) (PreH4 : (xizi_circular_area_uninitialized area_length physical )) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (1 = 1) ” 
  &&  “ (0 = 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (CircularAreaAlignedLength requested_pre area_length ) ” 
  &&  “ (xizi_circular_area_uninitialized area_length physical ) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
.

Definition xizi_circular_area_call_repeated_write_release_partial_solve_wit_2 := xizi_circular_area_call_repeated_write_release_partial_solve_wit_2_pure -> xizi_circular_area_call_repeated_write_release_partial_solve_wit_2_aux.

Definition xizi_circular_area_call_repeated_write_release_partial_solve_wit_3_pure := 
(
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (physical1: (@list (@option Z))) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (CircularAreaAlignedLength requested_pre area_length )) (PreH5 : (xizi_circular_area_uninitialized area_length physical )) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 ((0 + 1 ) % ( area_length ) ) area_length 1 operations (cons (first_byte) ((@nil Z))) physical1 )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (1 = 1) ” 
  &&  “ (0 = 0) ” 
  &&  “ ((Zlength ((cons (first_byte) ((@nil Z))))) < area_length) ”
) \/
(
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (physical1: (@list (@option Z))) (retval_2: Z) (PreH1 : (requested_pre <= UINT_MAX)) (PreH2 : (requested_pre >= 0)) (PreH3 : (retval_2 = 0)) (PreH4 : (retval <> 0)) (PreH5 : (retval <> 0)) (PreH6 : (CircularAreaAlignedLength requested_pre area_length )) (PreH7 : (xizi_circular_area_uninitialized area_length physical )) (PreH8 : (4 <= requested_pre)) (PreH9 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 ((0 + 1 ) % ( area_length ) ) area_length 1 operations (cons (first_byte) ((@nil Z))) physical1 )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ ((Zlength ((cons (first_byte) ((@nil Z))))) < area_length) ”
).

Definition xizi_circular_area_call_repeated_write_release_partial_solve_wit_3_pure_split_goal_1 := 
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (physical1: (@list (@option Z))) (retval_2: Z) (PreH1 : (requested_pre <= UINT_MAX)) (PreH2 : (requested_pre >= 0)) (PreH3 : (retval_2 = 0)) (PreH4 : (retval <> 0)) (PreH5 : (retval <> 0)) (PreH6 : (CircularAreaAlignedLength requested_pre area_length )) (PreH7 : (xizi_circular_area_uninitialized area_length physical )) (PreH8 : (4 <= requested_pre)) (PreH9 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 ((0 + 1 ) % ( area_length ) ) area_length 1 operations (cons (first_byte) ((@nil Z))) physical1 )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ ((Zlength ((cons (first_byte) ((@nil Z))))) < area_length) ”
.

Definition xizi_circular_area_call_repeated_write_release_partial_solve_wit_3_aux := 
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (physical1: (@list (@option Z))) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (CircularAreaAlignedLength requested_pre area_length )) (PreH5 : (xizi_circular_area_uninitialized area_length physical )) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 ((0 + 1 ) % ( area_length ) ) area_length 1 operations (cons (first_byte) ((@nil Z))) physical1 )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (1 = 1) ” 
  &&  “ (0 = 0) ” 
  &&  “ ((Zlength ((cons (first_byte) ((@nil Z))))) < area_length) ” 
  &&  “ (retval_2 = 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (CircularAreaAlignedLength requested_pre area_length ) ” 
  &&  “ (xizi_circular_area_uninitialized area_length physical ) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 ((0 + 1 ) % ( area_length ) ) area_length 1 operations (cons (first_byte) ((@nil Z))) physical1 )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
.

Definition xizi_circular_area_call_repeated_write_release_partial_solve_wit_3 := xizi_circular_area_call_repeated_write_release_partial_solve_wit_3_pure -> xizi_circular_area_call_repeated_write_release_partial_solve_wit_3_aux.

Definition xizi_circular_area_call_repeated_write_release_partial_solve_wit_4 := 
forall (second_input_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (retval_2: Z) (physical1: (@list (@option Z))) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (retval_2 = 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (CircularAreaAlignedLength requested_pre area_length )) (PreH6 : (xizi_circular_area_uninitialized area_length physical )) (PreH7 : (4 <= requested_pre)) (PreH8 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 ((((0 + 1 ) % ( area_length ) ) + 1 ) % ( area_length ) ) area_length 1 operations (app ((cons (first_byte) ((@nil Z)))) ((cons (second_byte) ((@nil Z))))) physical1 )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
|--
  “ (retval_3 = 0) ” 
  &&  “ (retval_2 = 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (CircularAreaAlignedLength requested_pre area_length ) ” 
  &&  “ (xizi_circular_area_uninitialized area_length physical ) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (CircularAreaBackingResource retval data_buffer 0 ((((0 + 1 ) % ( area_length ) ) + 1 ) % ( area_length ) ) area_length 1 operations (app ((cons (first_byte) ((@nil Z)))) ((cons (second_byte) ((@nil Z))))) physical1 )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
.

(*----- Function xizi_circular_area_call_read_then_write_release -----*)

Definition xizi_circular_area_call_read_then_write_release_safety_wit_1 := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (second_byte: Z) (first_byte: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (4 <= requested_pre)) (PreH3 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_read_then_write_release_safety_wit_2 := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (second_byte: Z) (first_byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (CircularAreaAlignedLength requested_pre area_length )) (PreH3 : (xizi_circular_area_uninitialized area_length physical )) (PreH4 : (4 <= requested_pre)) (PreH5 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_read_then_write_release_safety_wit_3 := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (second_byte: Z) (first_byte: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ False ”
.

Definition xizi_circular_area_call_read_then_write_release_safety_wit_4 := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (second_byte: Z) (first_byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaAlignedLength requested_pre area_length )) (PreH4 : (xizi_circular_area_uninitialized area_length physical )) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ False ”
.

Definition xizi_circular_area_call_read_then_write_release_safety_wit_5 := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (second_byte: Z) (first_byte: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_read_then_write_release_safety_wit_6 := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (second_byte: Z) (first_byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaAlignedLength requested_pre area_length )) (PreH4 : (xizi_circular_area_uninitialized area_length physical )) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition xizi_circular_area_call_read_then_write_release_safety_wit_7 := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (second_byte: Z) (first_byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaAlignedLength requested_pre area_length )) (PreH4 : (xizi_circular_area_uninitialized area_length physical )) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_circular_area_call_read_then_write_release_safety_wit_8 := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (second_byte: Z) (first_byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (physical1: (@list (@option Z))) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (CircularAreaAlignedLength requested_pre area_length )) (PreH5 : (xizi_circular_area_uninitialized area_length physical )) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 ((0 + 1 ) % ( area_length ) ) area_length 1 operations (cons (first_byte) ((@nil Z))) physical1 )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (UCharArray.full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition xizi_circular_area_call_read_then_write_release_safety_wit_9 := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (physical1: (@list (@option Z))) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (retval_2 = 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (CircularAreaAlignedLength requested_pre area_length )) (PreH6 : (xizi_circular_area_uninitialized area_length physical )) (PreH7 : (4 <= requested_pre)) (PreH8 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer ((0 + 1 ) % ( area_length ) ) ((0 + 1 ) % ( area_length ) ) area_length 0 operations (@nil Z) physical1 )
  **  (UCharArray.full output_buffer_pre 1 (cons (first_byte) ((@nil Z))) )
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
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (physical1: (@list (@option Z))) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (retval_2 = 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (CircularAreaAlignedLength requested_pre area_length )) (PreH6 : (xizi_circular_area_uninitialized area_length physical )) (PreH7 : (4 <= requested_pre)) (PreH8 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer ((0 + 1 ) % ( area_length ) ) ((0 + 1 ) % ( area_length ) ) area_length 0 operations (@nil Z) physical1 )
  **  (UCharArray.full output_buffer_pre 1 (cons (first_byte) ((@nil Z))) )
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
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = 0)) (PreH2 : (retval_3 = 0)) (PreH3 : (retval_2 = 0)) (PreH4 : (retval <> 0)) (PreH5 : (retval <> 0)) (PreH6 : (CircularAreaAlignedLength requested_pre area_length )) (PreH7 : (xizi_circular_area_uninitialized area_length physical )) (PreH8 : (4 <= requested_pre)) (PreH9 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
  **  (UCharArray.full output_buffer_pre 1 (cons (first_byte) ((@nil Z))) )
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
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (second_byte: Z) (first_byte: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = 0)) (PreH2 : (retval_3 = 0)) (PreH3 : (retval_2 = 0)) (PreH4 : (retval <> 0)) (PreH5 : (retval <> 0)) (PreH6 : (CircularAreaAlignedLength requested_pre area_length )) (PreH7 : (xizi_circular_area_uninitialized area_length physical )) (PreH8 : (4 <= requested_pre)) (PreH9 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
  **  (UCharArray.full output_buffer_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
|--
  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
  **  (CircularAreaReadCallResult 1 output_buffer_pre first_byte output_before )
) \/
(
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (first_byte: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = 0)) (PreH2 : (retval_3 = 0)) (PreH3 : (retval_2 = 0)) (PreH4 : (retval <> 0)) (PreH5 : (retval <> 0)) (PreH6 : (CircularAreaAlignedLength requested_pre area_length )) (PreH7 : (xizi_circular_area_uninitialized area_length physical )) (PreH8 : (4 <= requested_pre)) (PreH9 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full output_buffer_pre 1 (cons (first_byte) ((@nil Z))) )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaReadCallResult 1 output_buffer_pre first_byte output_before )
).

Definition xizi_circular_area_call_read_then_write_release_return_wit_1_split_goal_spatial := 
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (first_byte: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = 0)) (PreH2 : (retval_3 = 0)) (PreH3 : (retval_2 = 0)) (PreH4 : (retval <> 0)) (PreH5 : (retval <> 0)) (PreH6 : (CircularAreaAlignedLength requested_pre area_length )) (PreH7 : (xizi_circular_area_uninitialized area_length physical )) (PreH8 : (4 <= requested_pre)) (PreH9 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full output_buffer_pre 1 (cons (first_byte) ((@nil Z))) )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaReadCallResult 1 output_buffer_pre first_byte output_before )
.

Definition xizi_circular_area_call_read_then_write_release_return_wit_2 := 
(
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (second_byte: Z) (first_byte: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
  **  (CircularAreaReadCallResult 0 output_buffer_pre first_byte output_before )
) \/
(
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (first_byte: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full output_buffer_pre 1 output_before )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaReadCallResult 0 output_buffer_pre first_byte output_before )
).

Definition xizi_circular_area_call_read_then_write_release_return_wit_2_split_goal_spatial := 
forall (output_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (first_byte: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = 0)) (PreH3 : (4 <= requested_pre)) (PreH4 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full output_buffer_pre 1 output_before )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaReadCallResult 0 output_buffer_pre first_byte output_before )
.

Definition xizi_circular_area_call_read_then_write_release_partial_solve_wit_1_pure := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (second_byte: Z) (first_byte: Z) (PreH1 : (4 <= requested_pre)) (PreH2 : (requested_pre <= 256)) ,
  ((( &( "area" ) )) # Ptr  |->_)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
.

Definition xizi_circular_area_call_read_then_write_release_partial_solve_wit_1_aux := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (second_byte: Z) (first_byte: Z) (PreH1 : (4 <= requested_pre)) (PreH2 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
.

Definition xizi_circular_area_call_read_then_write_release_partial_solve_wit_1 := xizi_circular_area_call_read_then_write_release_partial_solve_wit_1_pure -> xizi_circular_area_call_read_then_write_release_partial_solve_wit_1_aux.

Definition xizi_circular_area_call_read_then_write_release_partial_solve_wit_2_pure := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (second_byte: Z) (first_byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaAlignedLength requested_pre area_length )) (PreH4 : (xizi_circular_area_uninitialized area_length physical )) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (1 = 1) ” 
  &&  “ (0 = 0) ”
.

Definition xizi_circular_area_call_read_then_write_release_partial_solve_wit_2_aux := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (second_byte: Z) (first_byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaAlignedLength requested_pre area_length )) (PreH4 : (xizi_circular_area_uninitialized area_length physical )) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (1 = 1) ” 
  &&  “ (0 = 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (CircularAreaAlignedLength requested_pre area_length ) ” 
  &&  “ (xizi_circular_area_uninitialized area_length physical ) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
.

Definition xizi_circular_area_call_read_then_write_release_partial_solve_wit_2 := xizi_circular_area_call_read_then_write_release_partial_solve_wit_2_pure -> xizi_circular_area_call_read_then_write_release_partial_solve_wit_2_aux.

Definition xizi_circular_area_call_read_then_write_release_partial_solve_wit_3_pure := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (second_byte: Z) (first_byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (physical1: (@list (@option Z))) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (CircularAreaAlignedLength requested_pre area_length )) (PreH5 : (xizi_circular_area_uninitialized area_length physical )) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 ((0 + 1 ) % ( area_length ) ) area_length 1 operations (cons (first_byte) ((@nil Z))) physical1 )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "first_input" ) )) # Ptr  |-> first_input_pre)
  **  ((( &( "output_buffer" ) )) # Ptr  |-> output_buffer_pre)
  **  ((( &( "second_input" ) )) # Ptr  |-> second_input_pre)
  **  (UCharArray.full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (1 = 1) ”
.

Definition xizi_circular_area_call_read_then_write_release_partial_solve_wit_3_aux := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (output_before: (@list Z)) (second_byte: Z) (first_byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (physical1: (@list (@option Z))) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (CircularAreaAlignedLength requested_pre area_length )) (PreH5 : (xizi_circular_area_uninitialized area_length physical )) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 ((0 + 1 ) % ( area_length ) ) area_length 1 operations (cons (first_byte) ((@nil Z))) physical1 )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full output_buffer_pre 1 output_before )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (1 = 1) ” 
  &&  “ (retval_2 = 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (CircularAreaAlignedLength requested_pre area_length ) ” 
  &&  “ (xizi_circular_area_uninitialized area_length physical ) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 ((0 + 1 ) % ( area_length ) ) area_length 1 operations (cons (first_byte) ((@nil Z))) physical1 )
  **  (UCharArray.full output_buffer_pre 1 output_before )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
.

Definition xizi_circular_area_call_read_then_write_release_partial_solve_wit_3 := xizi_circular_area_call_read_then_write_release_partial_solve_wit_3_pure -> xizi_circular_area_call_read_then_write_release_partial_solve_wit_3_aux.

Definition xizi_circular_area_call_read_then_write_release_partial_solve_wit_4_pure := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (physical1: (@list (@option Z))) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (retval_2 = 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (CircularAreaAlignedLength requested_pre area_length )) (PreH6 : (xizi_circular_area_uninitialized area_length physical )) (PreH7 : (4 <= requested_pre)) (PreH8 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer ((0 + 1 ) % ( area_length ) ) ((0 + 1 ) % ( area_length ) ) area_length 0 operations (@nil Z) physical1 )
  **  (UCharArray.full output_buffer_pre 1 (cons (first_byte) ((@nil Z))) )
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
.

Definition xizi_circular_area_call_read_then_write_release_partial_solve_wit_4_aux := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (physical1: (@list (@option Z))) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (retval_2 = 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (CircularAreaAlignedLength requested_pre area_length )) (PreH6 : (xizi_circular_area_uninitialized area_length physical )) (PreH7 : (4 <= requested_pre)) (PreH8 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer ((0 + 1 ) % ( area_length ) ) ((0 + 1 ) % ( area_length ) ) area_length 0 operations (@nil Z) physical1 )
  **  (UCharArray.full output_buffer_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
|--
  “ (1 = 1) ” 
  &&  “ (0 = 0) ” 
  &&  “ (retval_3 = 0) ” 
  &&  “ (retval_2 = 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (CircularAreaAlignedLength requested_pre area_length ) ” 
  &&  “ (xizi_circular_area_uninitialized area_length physical ) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer ((0 + 1 ) % ( area_length ) ) ((0 + 1 ) % ( area_length ) ) area_length 0 operations (@nil Z) physical1 )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
  **  (UCharArray.full output_buffer_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
.

Definition xizi_circular_area_call_read_then_write_release_partial_solve_wit_4 := xizi_circular_area_call_read_then_write_release_partial_solve_wit_4_pure -> xizi_circular_area_call_read_then_write_release_partial_solve_wit_4_aux.

Definition xizi_circular_area_call_read_then_write_release_partial_solve_wit_5 := 
forall (second_input_pre: Z) (output_buffer_pre: Z) (first_input_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (second_byte: Z) (first_byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (physical1: (@list (@option Z))) (retval_4: Z) (PreH1 : (retval_4 = 0)) (PreH2 : (retval_3 = 0)) (PreH3 : (retval_2 = 0)) (PreH4 : (retval <> 0)) (PreH5 : (retval <> 0)) (PreH6 : (CircularAreaAlignedLength requested_pre area_length )) (PreH7 : (xizi_circular_area_uninitialized area_length physical )) (PreH8 : (4 <= requested_pre)) (PreH9 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer ((0 + 1 ) % ( area_length ) ) ((((0 + 1 ) % ( area_length ) ) + 1 ) % ( area_length ) ) area_length 1 operations (cons (second_byte) ((@nil Z))) physical1 )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
  **  (UCharArray.full output_buffer_pre 1 (cons (first_byte) ((@nil Z))) )
  **  (UCharArray.full first_input_pre 1 (cons (first_byte) ((@nil Z))) )
|--
  “ (retval_4 = 0) ” 
  &&  “ (retval_3 = 0) ” 
  &&  “ (retval_2 = 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (CircularAreaAlignedLength requested_pre area_length ) ” 
  &&  “ (xizi_circular_area_uninitialized area_length physical ) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (CircularAreaBackingResource retval data_buffer ((0 + 1 ) % ( area_length ) ) ((((0 + 1 ) % ( area_length ) ) + 1 ) % ( area_length ) ) area_length 1 operations (cons (second_byte) ((@nil Z))) physical1 )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full second_input_pre 1 (cons (second_byte) ((@nil Z))) )
  **  (UCharArray.full output_buffer_pre 1 (cons (first_byte) ((@nil Z))) )
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
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (CircularAreaAlignedLength requested_pre area_length )) (PreH3 : (xizi_circular_area_uninitialized area_length physical )) (PreH4 : (4 <= requested_pre)) (PreH5 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
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
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaAlignedLength requested_pre area_length )) (PreH4 : (xizi_circular_area_uninitialized area_length physical )) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
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
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaAlignedLength requested_pre area_length )) (PreH4 : (xizi_circular_area_uninitialized area_length physical )) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
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
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaAlignedLength requested_pre area_length )) (PreH4 : (xizi_circular_area_uninitialized area_length physical )) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
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
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (CircularAreaDataLengthResult (@nil Z) retval_4 )) (PreH2 : (CircularAreaEmptyResult (@nil Z) retval_3 )) (PreH3 : (retval_2 = 0)) (PreH4 : (retval <> 0)) (PreH5 : (retval <> 0)) (PreH6 : (CircularAreaAlignedLength requested_pre area_length )) (PreH7 : (xizi_circular_area_uninitialized area_length physical )) (PreH8 : (4 <= requested_pre)) (PreH9 : (requested_pre <= 256)) ,
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
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (CircularAreaDataLengthResult (@nil Z) retval_4 )) (PreH2 : (CircularAreaEmptyResult (@nil Z) retval_3 )) (PreH3 : (retval_2 = 0)) (PreH4 : (retval <> 0)) (PreH5 : (retval <> 0)) (PreH6 : (CircularAreaAlignedLength requested_pre area_length )) (PreH7 : (xizi_circular_area_uninitialized area_length physical )) (PreH8 : (4 <= requested_pre)) (PreH9 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 1 )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
) \/
(
forall (requested_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (CircularAreaDataLengthResult (@nil Z) retval_4 )) (PreH2 : (CircularAreaEmptyResult (@nil Z) retval_3 )) (PreH3 : (retval_2 = 0)) (PreH4 : (retval <> 0)) (PreH5 : (retval <> 0)) (PreH6 : (CircularAreaAlignedLength requested_pre area_length )) (PreH7 : (xizi_circular_area_uninitialized area_length physical )) (PreH8 : (4 <= requested_pre)) (PreH9 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
|--
  (GlobalStrings LitMap )
  **  (CircularAreaCallResult 1 )
).

Definition xizi_circular_area_call_reset_release_return_wit_1_split_goal_spatial := 
forall (requested_pre: Z) (LitMap: (string -> Z)) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (CircularAreaDataLengthResult (@nil Z) retval_4 )) (PreH2 : (CircularAreaEmptyResult (@nil Z) retval_3 )) (PreH3 : (retval_2 = 0)) (PreH4 : (retval <> 0)) (PreH5 : (retval <> 0)) (PreH6 : (CircularAreaAlignedLength requested_pre area_length )) (PreH7 : (xizi_circular_area_uninitialized area_length physical )) (PreH8 : (4 <= requested_pre)) (PreH9 : (requested_pre <= 256)) ,
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
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaAlignedLength requested_pre area_length )) (PreH4 : (xizi_circular_area_uninitialized area_length physical )) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
  **  ((( &( "area" ) )) # Ptr  |-> retval)
  **  ((( &( "requested" ) )) # UInt  |-> requested_pre)
  **  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ (1 = 1) ” 
  &&  “ (0 = 0) ”
.

Definition xizi_circular_area_call_reset_release_partial_solve_wit_2_aux := 
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaAlignedLength requested_pre area_length )) (PreH4 : (xizi_circular_area_uninitialized area_length physical )) (PreH5 : (4 <= requested_pre)) (PreH6 : (requested_pre <= 256)) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ (1 = 1) ” 
  &&  “ (0 = 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (CircularAreaAlignedLength requested_pre area_length ) ” 
  &&  “ (xizi_circular_area_uninitialized area_length physical ) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
.

Definition xizi_circular_area_call_reset_release_partial_solve_wit_2 := xizi_circular_area_call_reset_release_partial_solve_wit_2_pure -> xizi_circular_area_call_reset_release_partial_solve_wit_2_aux.

Definition xizi_circular_area_call_reset_release_partial_solve_wit_3 := 
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (physical1: (@list (@option Z))) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (CircularAreaAlignedLength requested_pre area_length )) (PreH5 : (xizi_circular_area_uninitialized area_length physical )) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 ((0 + 1 ) % ( area_length ) ) area_length 1 operations (cons (byte) ((@nil Z))) physical1 )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ (retval_2 = 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (CircularAreaAlignedLength requested_pre area_length ) ” 
  &&  “ (xizi_circular_area_uninitialized area_length physical ) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 ((0 + 1 ) % ( area_length ) ) area_length 1 operations (cons (byte) ((@nil Z))) physical1 )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
.

Definition xizi_circular_area_call_reset_release_partial_solve_wit_4 := 
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (physical1: (@list (@option Z))) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval <> 0)) (PreH3 : (retval <> 0)) (PreH4 : (CircularAreaAlignedLength requested_pre area_length )) (PreH5 : (xizi_circular_area_uninitialized area_length physical )) (PreH6 : (4 <= requested_pre)) (PreH7 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical1 )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ (retval_2 = 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (CircularAreaAlignedLength requested_pre area_length ) ” 
  &&  “ (xizi_circular_area_uninitialized area_length physical ) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical1 )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
.

Definition xizi_circular_area_call_reset_release_partial_solve_wit_5 := 
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (physical1: (@list (@option Z))) (retval_2: Z) (retval_3: Z) (PreH1 : (CircularAreaEmptyResult (@nil Z) retval_3 )) (PreH2 : (retval_2 = 0)) (PreH3 : (retval <> 0)) (PreH4 : (retval <> 0)) (PreH5 : (CircularAreaAlignedLength requested_pre area_length )) (PreH6 : (xizi_circular_area_uninitialized area_length physical )) (PreH7 : (4 <= requested_pre)) (PreH8 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical1 )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ (CircularAreaEmptyResult (@nil Z) retval_3 ) ” 
  &&  “ (retval_2 = 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (CircularAreaAlignedLength requested_pre area_length ) ” 
  &&  “ (xizi_circular_area_uninitialized area_length physical ) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical1 )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
.

Definition xizi_circular_area_call_reset_release_partial_solve_wit_6 := 
forall (input_buffer_pre: Z) (requested_pre: Z) (LitMap: (string -> Z)) (byte: Z) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (physical1: (@list (@option Z))) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (CircularAreaDataLengthResult (@nil Z) retval_4 )) (PreH2 : (CircularAreaEmptyResult (@nil Z) retval_3 )) (PreH3 : (retval_2 = 0)) (PreH4 : (retval <> 0)) (PreH5 : (retval <> 0)) (PreH6 : (CircularAreaAlignedLength requested_pre area_length )) (PreH7 : (xizi_circular_area_uninitialized area_length physical )) (PreH8 : (4 <= requested_pre)) (PreH9 : (requested_pre <= 256)) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical1 )
  **  (UCharArray.full input_buffer_pre 1 (cons (byte) ((@nil Z))) )
|--
  “ (CircularAreaDataLengthResult (@nil Z) retval_4 ) ” 
  &&  “ (CircularAreaEmptyResult (@nil Z) retval_3 ) ” 
  &&  “ (retval_2 = 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (CircularAreaAlignedLength requested_pre area_length ) ” 
  &&  “ (xizi_circular_area_uninitialized area_length physical ) ” 
  &&  “ (4 <= requested_pre) ” 
  &&  “ (requested_pre <= 256) ”
  &&  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical1 )
  **  (GlobalStrings LitMap )
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
forall (input_buffer_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (CircularAreaAlignedLength 4 area_length )) (PreH3 : (xizi_circular_area_uninitialized area_length physical )) (PreH4 : (CircularAreaFourBytes input_contents )) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
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
forall (input_buffer_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaAlignedLength 4 area_length )) (PreH4 : (xizi_circular_area_uninitialized area_length physical )) (PreH5 : (CircularAreaFourBytes input_contents )) ,
  (CircularAreaBackingResource retval data_buffer 0 0 area_length 0 operations (@nil Z) physical )
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
forall (input_buffer_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area: Z) (PreH1 : (CircularAreaFourBytes input_contents )) (PreH2 : (xizi_circular_area_uninitialized 4 physical )) ,
  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  ((( &( "area" ) )) # Ptr  |-> area)
  **  (CircularAreaBackingResource area data_buffer 0 0 4 0 operations (@nil Z) physical )
  **  (UCharArray.full input_buffer_pre 4 input_contents )
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition xizi_circular_area_call_force_full_release_safety_wit_8 := 
forall (input_buffer_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area: Z) (PreH1 : (CircularAreaFourBytes input_contents )) (PreH2 : (xizi_circular_area_uninitialized 4 physical )) ,
  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  ((( &( "area" ) )) # Ptr  |-> area)
  **  (CircularAreaBackingResource area data_buffer 0 0 4 0 operations (@nil Z) physical )
  **  (UCharArray.full input_buffer_pre 4 input_contents )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition xizi_circular_area_call_force_full_release_safety_wit_9 := 
forall (input_buffer_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (area: Z) (PreH1 : (CircularAreaFourBytes input_contents )) ,
  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  ((( &( "area" ) )) # Ptr  |-> area)
  **  (UCharArray.full input_buffer_pre 4 input_contents )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition xizi_circular_area_call_force_full_release_entail_wit_1 := 
(
forall (input_buffer_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (data_buffer_2: Z) (operations_2: Z) (physical_2: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaAlignedLength 4 area_length )) (PreH4 : (xizi_circular_area_uninitialized area_length physical_2 )) (PreH5 : (CircularAreaFourBytes input_contents )) ,
  (CircularAreaBackingResource retval data_buffer_2 0 0 area_length 0 operations_2 (@nil Z) physical_2 )
  **  (GlobalStrings LitMap )
  **  (UCharArray.full input_buffer_pre 4 input_contents )
|--
  EX (data_buffer: Z)  (operations: Z)  (physical: (@list (@option Z))) ,
  “ (CircularAreaFourBytes input_contents ) ” 
  &&  “ (xizi_circular_area_uninitialized 4 physical ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 0 4 0 operations (@nil Z) physical )
  **  (UCharArray.full input_buffer_pre 4 input_contents )
) \/
(
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (data_buffer_2: Z) (operations_2: Z) (physical_2: (@list (@option Z))) (area_length: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval <> 0)) (PreH3 : (CircularAreaAlignedLength 4 area_length )) (PreH4 : (xizi_circular_area_uninitialized area_length physical_2 )) (PreH5 : (CircularAreaFourBytes input_contents )) ,
  (CircularAreaBackingResource retval data_buffer_2 0 0 area_length 0 operations_2 (@nil Z) physical_2 )
  **  (GlobalStrings LitMap )
|--
  EX (data_buffer: Z)  (operations: Z)  (physical: (@list (@option Z))) ,
  “ (CircularAreaFourBytes input_contents ) ” 
  &&  “ (xizi_circular_area_uninitialized 4 physical ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource retval data_buffer 0 0 4 0 operations (@nil Z) physical )
).

Definition xizi_circular_area_call_force_full_release_entail_wit_2 := 
(
forall (input_buffer_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (data_buffer_2: Z) (operations_2: Z) (physical: (@list (@option Z))) (area: Z) (actual: Z) (new_writeidx: Z) (physical_after_2: (@list (@option Z))) (retval: Z) (PreH1 : (CircularAreaForceWriteEffect 4 0 4 actual new_writeidx (@nil Z) input_contents physical physical_after_2 )) (PreH2 : (retval = 0)) (PreH3 : (CircularAreaFourBytes input_contents )) (PreH4 : (xizi_circular_area_uninitialized 4 physical )) ,
  (GlobalStrings LitMap )
  **  (CircularAreaForceWriteResource area data_buffer_2 new_writeidx 4 operations_2 physical_after_2 )
  **  (UCharArray.full input_buffer_pre 4 input_contents )
|--
  EX (data_buffer: Z)  (operations: Z)  (physical_after: (@list (@option Z))) ,
  “ (CircularAreaFourBytes input_contents ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource area data_buffer 0 0 4 1 operations input_contents physical_after )
  **  (UCharArray.full input_buffer_pre 4 input_contents )
) \/
(
forall (LitMap: (string -> Z)) (input_contents: (@list Z)) (data_buffer_2: Z) (operations_2: Z) (physical: (@list (@option Z))) (area: Z) (actual: Z) (new_writeidx: Z) (physical_after_2: (@list (@option Z))) (retval: Z) (PreH1 : (CircularAreaForceWriteEffect 4 0 4 actual new_writeidx (@nil Z) input_contents physical physical_after_2 )) (PreH2 : (retval = 0)) (PreH3 : (CircularAreaFourBytes input_contents )) (PreH4 : (xizi_circular_area_uninitialized 4 physical )) ,
  (GlobalStrings LitMap )
  **  (CircularAreaForceWriteResource area data_buffer_2 new_writeidx 4 operations_2 physical_after_2 )
|--
  EX (data_buffer: Z)  (operations: Z)  (physical_after: (@list (@option Z))) ,
  “ (CircularAreaFourBytes input_contents ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource area data_buffer 0 0 4 1 operations input_contents physical_after )
).

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
forall (input_buffer_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area: Z) (PreH1 : (CircularAreaFourBytes input_contents )) (PreH2 : (xizi_circular_area_uninitialized 4 physical )) ,
  ((( &( "input_buffer" ) )) # Ptr  |-> input_buffer_pre)
  **  (GlobalStrings LitMap )
  **  ((( &( "area" ) )) # Ptr  |-> area)
  **  (CircularAreaBackingResource area data_buffer 0 0 4 0 operations (@nil Z) physical )
  **  (UCharArray.full input_buffer_pre 4 input_contents )
|--
  “ (4 = 4) ” 
  &&  “ (1 = 1) ” 
  &&  “ (CircularAreaFourBytes input_contents ) ” 
  &&  “ (xizi_circular_area_uninitialized 4 physical ) ”
.

Definition xizi_circular_area_call_force_full_release_partial_solve_wit_2_aux := 
forall (input_buffer_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (data_buffer: Z) (operations: Z) (physical: (@list (@option Z))) (area: Z) (PreH1 : (CircularAreaFourBytes input_contents )) (PreH2 : (xizi_circular_area_uninitialized 4 physical )) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource area data_buffer 0 0 4 0 operations (@nil Z) physical )
  **  (UCharArray.full input_buffer_pre 4 input_contents )
|--
  “ (4 = 4) ” 
  &&  “ (1 = 1) ” 
  &&  “ (CircularAreaFourBytes input_contents ) ” 
  &&  “ (xizi_circular_area_uninitialized 4 physical ) ” 
  &&  “ (CircularAreaFourBytes input_contents ) ” 
  &&  “ (xizi_circular_area_uninitialized 4 physical ) ”
  &&  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource area data_buffer 0 0 4 0 operations (@nil Z) physical )
  **  (UCharArray.full input_buffer_pre 4 input_contents )
.

Definition xizi_circular_area_call_force_full_release_partial_solve_wit_2 := xizi_circular_area_call_force_full_release_partial_solve_wit_2_pure -> xizi_circular_area_call_force_full_release_partial_solve_wit_2_aux.

Definition xizi_circular_area_call_force_full_release_partial_solve_wit_3 := 
forall (input_buffer_pre: Z) (LitMap: (string -> Z)) (input_contents: (@list Z)) (data_buffer: Z) (operations: Z) (physical_after: (@list (@option Z))) (area: Z) (PreH1 : (CircularAreaFourBytes input_contents )) ,
  (GlobalStrings LitMap )
  **  (CircularAreaBackingResource area data_buffer 0 0 4 1 operations input_contents physical_after )
  **  (UCharArray.full input_buffer_pre 4 input_contents )
|--
  “ (CircularAreaFourBytes input_contents ) ”
  &&  (CircularAreaBackingResource area data_buffer 0 0 4 1 operations input_contents physical_after )
  **  (GlobalStrings LitMap )
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
Axiom proof_of_xizi_circular_area_call_force_full_release_entail_wit_2 : xizi_circular_area_call_force_full_release_entail_wit_2.
Axiom proof_of_xizi_circular_area_call_force_full_release_return_wit_1 : xizi_circular_area_call_force_full_release_return_wit_1.
Axiom proof_of_xizi_circular_area_call_force_full_release_return_wit_2 : xizi_circular_area_call_force_full_release_return_wit_2.
Axiom proof_of_xizi_circular_area_call_force_full_release_partial_solve_wit_1_pure : xizi_circular_area_call_force_full_release_partial_solve_wit_1_pure.
Axiom proof_of_xizi_circular_area_call_force_full_release_partial_solve_wit_1 : xizi_circular_area_call_force_full_release_partial_solve_wit_1.
Axiom proof_of_xizi_circular_area_call_force_full_release_partial_solve_wit_2_pure : xizi_circular_area_call_force_full_release_partial_solve_wit_2_pure.
Axiom proof_of_xizi_circular_area_call_force_full_release_partial_solve_wit_2 : xizi_circular_area_call_force_full_release_partial_solve_wit_2.
Axiom proof_of_xizi_circular_area_call_force_full_release_partial_solve_wit_3 : xizi_circular_area_call_force_full_release_partial_solve_wit_3.

End VC_Correct.
