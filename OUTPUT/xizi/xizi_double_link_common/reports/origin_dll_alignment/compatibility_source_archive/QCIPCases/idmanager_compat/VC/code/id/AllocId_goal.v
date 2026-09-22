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
From AUXLib Require Import int_auto Axioms Feq Idents ListLib VMap.
Require Import SetsClass.SetsClass. Import SetsNotation.
From SimpleC.SL Require Import Mem SeparationLogic MapLib.
Require Import Logic.LogicGenerator.demo932.Interface.
Import CRules.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string.
Local Open Scope list.
Import ListNotations.
Require Import SimpleC.SL.ConAssertion SimpleC.SL.CriticalSTS SimpleC.SL.NestedCriticalSTS.
From MonadLib.StateRelMonad Require Export StateRelMonad.
Export MonadNotation.
Local Open Scope sac.
Local Open Scope monad.
Require Import QCIPCases.idmanager_compat.lib.idnode.
Import DLL.
Import IDNode.
Local Open Scope sac.

(*----- Function AllocId -----*)

Definition AllocId_safety_wit_1 := 
forall (manager_pre: Z) (m: idmanager) ,
  ((( &( "index" ) )) # Int  |->_)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  (store_idmanager m manager_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AllocId_safety_wit_2 := 
forall (manager_pre: Z) (m: idmanager) ,
  ((( &( "map_end" ) )) # Int  |->_)
  **  ((( &( "index" ) )) # Int  |-> 0)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  (store_idmanager m manager_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AllocId_safety_wit_3 := 
forall (manager_pre: Z) (m: idmanager) ,
  ((( &( "id" ) )) # Int  |->_)
  **  ((( &( "map_end" ) )) # Int  |-> 0)
  **  ((( &( "index" ) )) # Int  |-> 0)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  (store_idmanager m manager_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AllocId_safety_wit_4 := 
forall (manager_pre: Z) (m: idmanager) ,
  ((( &( "entry" ) )) # UChar  |->_)
  **  ((( &( "id" ) )) # Int  |-> 0)
  **  ((( &( "map_end" ) )) # Int  |-> 0)
  **  ((( &( "index" ) )) # Int  |-> 0)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  (store_idmanager m manager_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AllocId_safety_wit_5 := 
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (bytes: (@list Z)) (PreH1 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH2 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH3 : (manager_callee_id_max = (m.(idmax) ))) (PreH4 : (manager_callee_hoffset = (m.(hoffset) ))) ,
  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
  **  ((( &( "entry" ) )) # UChar  |-> 0)
  **  ((( &( "id" ) )) # Int  |-> 0)
  **  ((( &( "map_end" ) )) # Int  |-> 0)
  **  ((( &( "index" ) )) # Int  |-> 0)
|--
  “ (((manager_callee_id_max + 7 ) <> (INT_MIN)) \/ (8 <> (-1))) ” 
  &&  “ (8 <> 0) ”
.

Definition AllocId_safety_wit_6 := 
(
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (bytes: (@list Z)) (PreH1 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH2 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH3 : (manager_callee_id_max = (m.(idmax) ))) (PreH4 : (manager_callee_hoffset = (m.(hoffset) ))) ,
  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
  **  ((( &( "entry" ) )) # UChar  |-> 0)
  **  ((( &( "id" ) )) # Int  |-> 0)
  **  ((( &( "map_end" ) )) # Int  |-> 0)
  **  ((( &( "index" ) )) # Int  |-> 0)
|--
  “ ((manager_callee_id_max + 7 ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (manager_callee_id_max + 7 )) ”
) \/
(
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (bytes: (@list Z)) (PreH1 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH2 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH3 : (manager_callee_id_max = (m.(idmax) ))) (PreH4 : (manager_callee_hoffset = (m.(hoffset) ))) ,
  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
  **  ((( &( "entry" ) )) # UChar  |-> 0)
  **  ((( &( "id" ) )) # Int  |-> 0)
  **  ((( &( "map_end" ) )) # Int  |-> 0)
  **  ((( &( "index" ) )) # Int  |-> 0)
|--
  “ ((manager_callee_id_max + 7 ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (manager_callee_id_max + 7 )) ”
).

Definition AllocId_safety_wit_6_split_goal_1 := 
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (bytes: (@list Z)) (PreH1 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH2 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH3 : (manager_callee_id_max = (m.(idmax) ))) (PreH4 : (manager_callee_hoffset = (m.(hoffset) ))) ,
  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
  **  ((( &( "entry" ) )) # UChar  |-> 0)
  **  ((( &( "id" ) )) # Int  |-> 0)
  **  ((( &( "map_end" ) )) # Int  |-> 0)
  **  ((( &( "index" ) )) # Int  |-> 0)
|--
  “ ((manager_callee_id_max + 7 ) <= INT_MAX) ”
.

Definition AllocId_safety_wit_6_split_goal_2 := 
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (bytes: (@list Z)) (PreH1 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH2 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH3 : (manager_callee_id_max = (m.(idmax) ))) (PreH4 : (manager_callee_hoffset = (m.(hoffset) ))) ,
  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
  **  ((( &( "entry" ) )) # UChar  |-> 0)
  **  ((( &( "id" ) )) # Int  |-> 0)
  **  ((( &( "map_end" ) )) # Int  |-> 0)
  **  ((( &( "index" ) )) # Int  |-> 0)
|--
  “ ((INT_MIN) <= (manager_callee_id_max + 7 )) ”
.

Definition AllocId_safety_wit_7 := 
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (bytes: (@list Z)) (PreH1 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH2 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH3 : (manager_callee_id_max = (m.(idmax) ))) (PreH4 : (manager_callee_hoffset = (m.(hoffset) ))) ,
  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
  **  ((( &( "entry" ) )) # UChar  |-> 0)
  **  ((( &( "id" ) )) # Int  |-> 0)
  **  ((( &( "map_end" ) )) # Int  |-> 0)
  **  ((( &( "index" ) )) # Int  |-> 0)
|--
  “ (7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 7) ”
.

Definition AllocId_safety_wit_8 := 
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (bytes: (@list Z)) (PreH1 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH2 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH3 : (manager_callee_id_max = (m.(idmax) ))) (PreH4 : (manager_callee_hoffset = (m.(hoffset) ))) ,
  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
  **  ((( &( "entry" ) )) # UChar  |-> 0)
  **  ((( &( "id" ) )) # Int  |-> 0)
  **  ((( &( "map_end" ) )) # Int  |-> 0)
  **  ((( &( "index" ) )) # Int  |-> 0)
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition AllocId_safety_wit_9 := 
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (bytes: (@list Z)) (PreH1 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH2 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH3 : (manager_callee_id_max = (m.(idmax) ))) (PreH4 : (manager_callee_hoffset = (m.(hoffset) ))) ,
  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
  **  ((( &( "entry" ) )) # UChar  |-> 0)
  **  ((( &( "id" ) )) # Int  |-> 0)
  **  ((( &( "map_end" ) )) # Int  |-> ((manager_callee_id_max + 7 ) ÷ 8 ))
  **  ((( &( "index" ) )) # Int  |-> 0)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AllocId_safety_wit_10 := 
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (bytes: (@list Z)) (index: Z) (entry: Z) (id: Z) (map_end: Z) (PreH1 : (index < map_end)) (PreH2 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH3 : (id = 0)) (PreH4 : (entry = 0)) (PreH5 : (0 <= index)) (PreH6 : (index <= map_end)) (PreH7 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH8 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH9 : (allocid_index_scan_inv bytes index )) (PreH10 : (manager_id_max = (m.(idmax) ))) (PreH11 : (manager_hoffset = (m.(hoffset) ))) ,
  (UCharArray.full id_map map_end bytes )
  **  ((( &( "map_end" ) )) # Int  |-> map_end)
  **  ((( &( "id" ) )) # Int  |-> id)
  **  ((( &( "entry" ) )) # UChar  |-> entry)
  **  ((( &( "index" ) )) # Int  |-> index)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ (255 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 255) ”
.

Definition AllocId_safety_wit_11 := 
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (bytes: (@list Z)) (index: Z) (entry: Z) (id: Z) (map_end: Z) (PreH1 : ((Znth index bytes 0) = 255)) (PreH2 : (index < map_end)) (PreH3 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH4 : (id = 0)) (PreH5 : (entry = 0)) (PreH6 : (0 <= index)) (PreH7 : (index <= map_end)) (PreH8 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH9 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH10 : (allocid_index_scan_inv bytes index )) (PreH11 : (manager_id_max = (m.(idmax) ))) (PreH12 : (manager_hoffset = (m.(hoffset) ))) ,
  (UCharArray.full id_map map_end bytes )
  **  ((( &( "map_end" ) )) # Int  |-> map_end)
  **  ((( &( "id" ) )) # Int  |-> id)
  **  ((( &( "entry" ) )) # UChar  |-> entry)
  **  ((( &( "index" ) )) # Int  |-> index)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ ((index + 1 ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (index + 1 )) ”
.

Definition AllocId_safety_wit_12 := 
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (bytes: (@list Z)) (index: Z) (entry: Z) (id: Z) (map_end: Z) (PreH1 : (index <> map_end)) (PreH2 : (index >= map_end)) (PreH3 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH4 : (id = 0)) (PreH5 : (entry = 0)) (PreH6 : (0 <= index)) (PreH7 : (index <= map_end)) (PreH8 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH9 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH10 : (allocid_index_scan_inv bytes index )) (PreH11 : (manager_id_max = (m.(idmax) ))) (PreH12 : (manager_hoffset = (m.(hoffset) ))) ,
  ((( &( "map_end" ) )) # Int  |-> map_end)
  **  ((( &( "id" ) )) # Int  |-> id)
  **  ((( &( "entry" ) )) # UChar  |-> entry)
  **  ((( &( "index" ) )) # Int  |-> index)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map map_end bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ False ”
.

Definition AllocId_safety_wit_13 := 
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (bytes: (@list Z)) (index: Z) (entry: Z) (id: Z) (map_end: Z) (PreH1 : (index = map_end)) (PreH2 : ((Znth index bytes 0) <> 255)) (PreH3 : (index < map_end)) (PreH4 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH5 : (id = 0)) (PreH6 : (entry = 0)) (PreH7 : (0 <= index)) (PreH8 : (index <= map_end)) (PreH9 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH10 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH11 : (allocid_index_scan_inv bytes index )) (PreH12 : (manager_id_max = (m.(idmax) ))) (PreH13 : (manager_hoffset = (m.(hoffset) ))) ,
  (UCharArray.full id_map map_end bytes )
  **  ((( &( "map_end" ) )) # Int  |-> map_end)
  **  ((( &( "id" ) )) # Int  |-> id)
  **  ((( &( "entry" ) )) # UChar  |-> entry)
  **  ((( &( "index" ) )) # Int  |-> index)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ False ”
.

Definition AllocId_safety_wit_14 := 
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (bytes: (@list Z)) (index: Z) (entry: Z) (id: Z) (map_end: Z) (PreH1 : (index = map_end)) (PreH2 : (index >= map_end)) (PreH3 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH4 : (id = 0)) (PreH5 : (entry = 0)) (PreH6 : (0 <= index)) (PreH7 : (index <= map_end)) (PreH8 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH9 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH10 : (allocid_index_scan_inv bytes index )) (PreH11 : (manager_id_max = (m.(idmax) ))) (PreH12 : (manager_hoffset = (m.(hoffset) ))) ,
  ((( &( "map_end" ) )) # Int  |-> map_end)
  **  ((( &( "id" ) )) # Int  |-> id)
  **  ((( &( "entry" ) )) # UChar  |-> entry)
  **  ((( &( "index" ) )) # Int  |-> index)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map map_end bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ (1 <> (INT_MIN)) ”
.

Definition AllocId_safety_wit_15 := 
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (bytes: (@list Z)) (index: Z) (entry: Z) (id: Z) (map_end: Z) (PreH1 : (index = map_end)) (PreH2 : (index >= map_end)) (PreH3 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH4 : (id = 0)) (PreH5 : (entry = 0)) (PreH6 : (0 <= index)) (PreH7 : (index <= map_end)) (PreH8 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH9 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH10 : (allocid_index_scan_inv bytes index )) (PreH11 : (manager_id_max = (m.(idmax) ))) (PreH12 : (manager_hoffset = (m.(hoffset) ))) ,
  ((( &( "map_end" ) )) # Int  |-> map_end)
  **  ((( &( "id" ) )) # Int  |-> id)
  **  ((( &( "entry" ) )) # UChar  |-> entry)
  **  ((( &( "index" ) )) # Int  |-> index)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map map_end bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition AllocId_safety_wit_16 := 
(
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (bytes: (@list Z)) (index: Z) (entry: Z) (id: Z) (map_end: Z) (PreH1 : (index <> map_end)) (PreH2 : ((Znth index bytes 0) <> 255)) (PreH3 : (index < map_end)) (PreH4 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH5 : (id = 0)) (PreH6 : (entry = 0)) (PreH7 : (0 <= index)) (PreH8 : (index <= map_end)) (PreH9 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH10 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH11 : (allocid_index_scan_inv bytes index )) (PreH12 : (manager_id_max = (m.(idmax) ))) (PreH13 : (manager_hoffset = (m.(hoffset) ))) ,
  (UCharArray.full id_map map_end bytes )
  **  ((( &( "map_end" ) )) # Int  |-> map_end)
  **  ((( &( "id" ) )) # Int  |-> id)
  **  ((( &( "entry" ) )) # UChar  |-> entry)
  **  ((( &( "index" ) )) # Int  |-> index)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ ((index * 8 ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (index * 8 )) ”
) \/
(
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (bytes: (@list Z)) (index: Z) (entry: Z) (id: Z) (map_end: Z) (PreH1 : (index <> map_end)) (PreH2 : ((Znth index bytes 0) <> 255)) (PreH3 : (index < map_end)) (PreH4 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH5 : (id = 0)) (PreH6 : (entry = 0)) (PreH7 : (0 <= index)) (PreH8 : (index <= map_end)) (PreH9 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH10 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH11 : (allocid_index_scan_inv bytes index )) (PreH12 : (manager_id_max = (m.(idmax) ))) (PreH13 : (manager_hoffset = (m.(hoffset) ))) ,
  (UCharArray.full id_map map_end bytes )
  **  ((( &( "map_end" ) )) # Int  |-> map_end)
  **  ((( &( "id" ) )) # Int  |-> id)
  **  ((( &( "entry" ) )) # UChar  |-> entry)
  **  ((( &( "index" ) )) # Int  |-> index)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ ((index * 8 ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (index * 8 )) ”
).

Definition AllocId_safety_wit_16_split_goal_1 := 
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (bytes: (@list Z)) (index: Z) (entry: Z) (id: Z) (map_end: Z) (PreH1 : (index <> map_end)) (PreH2 : ((Znth index bytes 0) <> 255)) (PreH3 : (index < map_end)) (PreH4 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH5 : (id = 0)) (PreH6 : (entry = 0)) (PreH7 : (0 <= index)) (PreH8 : (index <= map_end)) (PreH9 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH10 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH11 : (allocid_index_scan_inv bytes index )) (PreH12 : (manager_id_max = (m.(idmax) ))) (PreH13 : (manager_hoffset = (m.(hoffset) ))) ,
  (UCharArray.full id_map map_end bytes )
  **  ((( &( "map_end" ) )) # Int  |-> map_end)
  **  ((( &( "id" ) )) # Int  |-> id)
  **  ((( &( "entry" ) )) # UChar  |-> entry)
  **  ((( &( "index" ) )) # Int  |-> index)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ ((index * 8 ) <= INT_MAX) ”
.

Definition AllocId_safety_wit_16_split_goal_2 := 
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (bytes: (@list Z)) (index: Z) (entry: Z) (id: Z) (map_end: Z) (PreH1 : (index <> map_end)) (PreH2 : ((Znth index bytes 0) <> 255)) (PreH3 : (index < map_end)) (PreH4 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH5 : (id = 0)) (PreH6 : (entry = 0)) (PreH7 : (0 <= index)) (PreH8 : (index <= map_end)) (PreH9 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH10 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH11 : (allocid_index_scan_inv bytes index )) (PreH12 : (manager_id_max = (m.(idmax) ))) (PreH13 : (manager_hoffset = (m.(hoffset) ))) ,
  (UCharArray.full id_map map_end bytes )
  **  ((( &( "map_end" ) )) # Int  |-> map_end)
  **  ((( &( "id" ) )) # Int  |-> id)
  **  ((( &( "entry" ) )) # UChar  |-> entry)
  **  ((( &( "index" ) )) # Int  |-> index)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ ((INT_MIN) <= (index * 8 )) ”
.

Definition AllocId_safety_wit_17 := 
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (bytes: (@list Z)) (index: Z) (entry: Z) (id: Z) (map_end: Z) (PreH1 : (index <> map_end)) (PreH2 : ((Znth index bytes 0) <> 255)) (PreH3 : (index < map_end)) (PreH4 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH5 : (id = 0)) (PreH6 : (entry = 0)) (PreH7 : (0 <= index)) (PreH8 : (index <= map_end)) (PreH9 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH10 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH11 : (allocid_index_scan_inv bytes index )) (PreH12 : (manager_id_max = (m.(idmax) ))) (PreH13 : (manager_hoffset = (m.(hoffset) ))) ,
  (UCharArray.full id_map map_end bytes )
  **  ((( &( "map_end" ) )) # Int  |-> map_end)
  **  ((( &( "id" ) )) # Int  |-> id)
  **  ((( &( "entry" ) )) # UChar  |-> entry)
  **  ((( &( "index" ) )) # Int  |-> index)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition AllocId_safety_wit_18 := 
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (id: Z) (entry: Z) (bytes: (@list Z)) (index: Z) (map_end: Z) (PreH1 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH2 : (0 <= index)) (PreH3 : (index < map_end)) (PreH4 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH5 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH6 : (allocid_index_scan_inv bytes index )) (PreH7 : ((Znth index bytes 0) <> 255)) (PreH8 : (allocid_entry_scan_inv bytes index id entry )) (PreH9 : (manager_id_max = (m.(idmax) ))) (PreH10 : (manager_hoffset = (m.(hoffset) ))) ,
  ((( &( "map_end" ) )) # Int  |-> map_end)
  **  ((( &( "index" ) )) # Int  |-> index)
  **  ((( &( "entry" ) )) # UChar  |-> entry)
  **  ((( &( "id" ) )) # Int  |-> id)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map map_end bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition AllocId_safety_wit_19 := 
(
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (id: Z) (entry: Z) (bytes: (@list Z)) (index: Z) (map_end: Z) (PreH1 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH2 : (0 <= index)) (PreH3 : (index < map_end)) (PreH4 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH5 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH6 : (allocid_index_scan_inv bytes index )) (PreH7 : ((Znth index bytes 0) <> 255)) (PreH8 : (allocid_entry_scan_inv bytes index id entry )) (PreH9 : (manager_id_max = (m.(idmax) ))) (PreH10 : (manager_hoffset = (m.(hoffset) ))) (PreH11 : ((Z.land entry 1) <> 0)) ,
  ((( &( "map_end" ) )) # Int  |-> map_end)
  **  ((( &( "index" ) )) # Int  |-> index)
  **  ((( &( "entry" ) )) # UChar  |-> entry)
  **  ((( &( "id" ) )) # Int  |-> id)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map map_end bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ ((id + 1 ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (id + 1 )) ”
) \/
(
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (id: Z) (entry: Z) (bytes: (@list Z)) (index: Z) (map_end: Z) (PreH1 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH2 : (0 <= index)) (PreH3 : (index < map_end)) (PreH4 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH5 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH6 : (allocid_index_scan_inv bytes index )) (PreH7 : ((Znth index bytes 0) <> 255)) (PreH8 : (allocid_entry_scan_inv bytes index id entry )) (PreH9 : (manager_id_max = (m.(idmax) ))) (PreH10 : (manager_hoffset = (m.(hoffset) ))) (PreH11 : ((Z.land entry 1) <> 0)) ,
  ((( &( "map_end" ) )) # Int  |-> map_end)
  **  ((( &( "index" ) )) # Int  |-> index)
  **  ((( &( "entry" ) )) # UChar  |-> entry)
  **  ((( &( "id" ) )) # Int  |-> id)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map map_end bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ ((id + 1 ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (id + 1 )) ”
).

Definition AllocId_safety_wit_19_split_goal_1 := 
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (id: Z) (entry: Z) (bytes: (@list Z)) (index: Z) (map_end: Z) (PreH1 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH2 : (0 <= index)) (PreH3 : (index < map_end)) (PreH4 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH5 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH6 : (allocid_index_scan_inv bytes index )) (PreH7 : ((Znth index bytes 0) <> 255)) (PreH8 : (allocid_entry_scan_inv bytes index id entry )) (PreH9 : (manager_id_max = (m.(idmax) ))) (PreH10 : (manager_hoffset = (m.(hoffset) ))) (PreH11 : ((Z.land entry 1) <> 0)) ,
  ((( &( "map_end" ) )) # Int  |-> map_end)
  **  ((( &( "index" ) )) # Int  |-> index)
  **  ((( &( "entry" ) )) # UChar  |-> entry)
  **  ((( &( "id" ) )) # Int  |-> id)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map map_end bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ ((id + 1 ) <= INT_MAX) ”
.

Definition AllocId_safety_wit_19_split_goal_2 := 
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (id: Z) (entry: Z) (bytes: (@list Z)) (index: Z) (map_end: Z) (PreH1 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH2 : (0 <= index)) (PreH3 : (index < map_end)) (PreH4 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH5 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH6 : (allocid_index_scan_inv bytes index )) (PreH7 : ((Znth index bytes 0) <> 255)) (PreH8 : (allocid_entry_scan_inv bytes index id entry )) (PreH9 : (manager_id_max = (m.(idmax) ))) (PreH10 : (manager_hoffset = (m.(hoffset) ))) (PreH11 : ((Z.land entry 1) <> 0)) ,
  ((( &( "map_end" ) )) # Int  |-> map_end)
  **  ((( &( "index" ) )) # Int  |-> index)
  **  ((( &( "entry" ) )) # UChar  |-> entry)
  **  ((( &( "id" ) )) # Int  |-> id)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map map_end bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ ((INT_MIN) <= (id + 1 )) ”
.

Definition AllocId_safety_wit_20 := 
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (id: Z) (entry: Z) (bytes: (@list Z)) (index: Z) (map_end: Z) (PreH1 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH2 : (0 <= index)) (PreH3 : (index < map_end)) (PreH4 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH5 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH6 : (allocid_index_scan_inv bytes index )) (PreH7 : ((Znth index bytes 0) <> 255)) (PreH8 : (allocid_entry_scan_inv bytes index id entry )) (PreH9 : (manager_id_max = (m.(idmax) ))) (PreH10 : (manager_hoffset = (m.(hoffset) ))) (PreH11 : ((Z.land entry 1) <> 0)) ,
  ((( &( "map_end" ) )) # Int  |-> map_end)
  **  ((( &( "index" ) )) # Int  |-> index)
  **  ((( &( "entry" ) )) # UChar  |-> entry)
  **  ((( &( "id" ) )) # Int  |-> (id + 1 ))
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map map_end bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ (1 <= 7) ” 
  &&  “ (0 <= 1) ”
.

Definition AllocId_safety_wit_21 := 
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (id: Z) (entry: Z) (bytes: (@list Z)) (index: Z) (map_end: Z) (PreH1 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH2 : (0 <= index)) (PreH3 : (index < map_end)) (PreH4 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH5 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH6 : (allocid_index_scan_inv bytes index )) (PreH7 : ((Znth index bytes 0) <> 255)) (PreH8 : (allocid_entry_scan_inv bytes index id entry )) (PreH9 : (manager_id_max = (m.(idmax) ))) (PreH10 : (manager_hoffset = (m.(hoffset) ))) (PreH11 : ((Z.land entry 1) <> 0)) ,
  ((( &( "map_end" ) )) # Int  |-> map_end)
  **  ((( &( "index" ) )) # Int  |-> index)
  **  ((( &( "entry" ) )) # UChar  |-> entry)
  **  ((( &( "id" ) )) # Int  |-> (id + 1 ))
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map map_end bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition AllocId_safety_wit_22 := 
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (id: Z) (entry: Z) (bytes: (@list Z)) (index: Z) (map_end: Z) (PreH1 : (id >= manager_id_max)) (PreH2 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH3 : (0 <= index)) (PreH4 : (index < map_end)) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (allocid_index_scan_inv bytes index )) (PreH8 : ((Znth index bytes 0) <> 255)) (PreH9 : (allocid_entry_scan_inv bytes index id entry )) (PreH10 : (manager_id_max = (m.(idmax) ))) (PreH11 : (manager_hoffset = (m.(hoffset) ))) (PreH12 : ((Z.land entry 1) = 0)) ,
  ((( &( "map_end" ) )) # Int  |-> map_end)
  **  ((( &( "index" ) )) # Int  |-> index)
  **  ((( &( "entry" ) )) # UChar  |-> entry)
  **  ((( &( "id" ) )) # Int  |-> id)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map map_end bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ (1 <> (INT_MIN)) ”
.

Definition AllocId_safety_wit_23 := 
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (id: Z) (entry: Z) (bytes: (@list Z)) (index: Z) (map_end: Z) (PreH1 : (id >= manager_id_max)) (PreH2 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH3 : (0 <= index)) (PreH4 : (index < map_end)) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (allocid_index_scan_inv bytes index )) (PreH8 : ((Znth index bytes 0) <> 255)) (PreH9 : (allocid_entry_scan_inv bytes index id entry )) (PreH10 : (manager_id_max = (m.(idmax) ))) (PreH11 : (manager_hoffset = (m.(hoffset) ))) (PreH12 : ((Z.land entry 1) = 0)) ,
  ((( &( "map_end" ) )) # Int  |-> map_end)
  **  ((( &( "index" ) )) # Int  |-> index)
  **  ((( &( "entry" ) )) # UChar  |-> entry)
  **  ((( &( "id" ) )) # Int  |-> id)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map map_end bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition AllocId_safety_wit_24 := 
(
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (id: Z) (entry: Z) (bytes: (@list Z)) (index: Z) (map_end: Z) (PreH1 : (id < manager_id_max)) (PreH2 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH3 : (0 <= index)) (PreH4 : (index < map_end)) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (allocid_index_scan_inv bytes index )) (PreH8 : ((Znth index bytes 0) <> 255)) (PreH9 : (allocid_entry_scan_inv bytes index id entry )) (PreH10 : (manager_id_max = (m.(idmax) ))) (PreH11 : (manager_hoffset = (m.(hoffset) ))) (PreH12 : ((Z.land entry 1) = 0)) ,
  (UCharArray.full id_map map_end bytes )
  **  ((( &( "map_end" ) )) # Int  |-> map_end)
  **  ((( &( "index" ) )) # Int  |-> index)
  **  ((( &( "entry" ) )) # UChar  |-> entry)
  **  ((( &( "id" ) )) # Int  |-> id)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ ((signed_last_nbits ((1 * (2^(id % ( 8 ) )) )) (32)) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (signed_last_nbits ((1 * (2^(id % ( 8 ) )) )) (32))) ” 
  &&  “ ((id % ( 8 ) ) <= 31) ” 
  &&  “ (0 <= (id % ( 8 ) )) ”
) \/
(
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (id: Z) (entry: Z) (bytes: (@list Z)) (index: Z) (map_end: Z) (PreH1 : (id < manager_id_max)) (PreH2 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH3 : (0 <= index)) (PreH4 : (index < map_end)) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (allocid_index_scan_inv bytes index )) (PreH8 : ((Znth index bytes 0) <> 255)) (PreH9 : (allocid_entry_scan_inv bytes index id entry )) (PreH10 : (manager_id_max = (m.(idmax) ))) (PreH11 : (manager_hoffset = (m.(hoffset) ))) (PreH12 : ((Z.land entry 1) = 0)) ,
  (UCharArray.full id_map map_end bytes )
  **  ((( &( "map_end" ) )) # Int  |-> map_end)
  **  ((( &( "index" ) )) # Int  |-> index)
  **  ((( &( "entry" ) )) # UChar  |-> entry)
  **  ((( &( "id" ) )) # Int  |-> id)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ ((signed_last_nbits ((1 * (2^(id % ( 8 ) )) )) (32)) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (signed_last_nbits ((1 * (2^(id % ( 8 ) )) )) (32))) ” 
  &&  “ ((id % ( 8 ) ) <= 31) ” 
  &&  “ (0 <= (id % ( 8 ) )) ”
).

Definition AllocId_safety_wit_24_split_goal_1 := 
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (id: Z) (entry: Z) (bytes: (@list Z)) (index: Z) (map_end: Z) (PreH1 : (id < manager_id_max)) (PreH2 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH3 : (0 <= index)) (PreH4 : (index < map_end)) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (allocid_index_scan_inv bytes index )) (PreH8 : ((Znth index bytes 0) <> 255)) (PreH9 : (allocid_entry_scan_inv bytes index id entry )) (PreH10 : (manager_id_max = (m.(idmax) ))) (PreH11 : (manager_hoffset = (m.(hoffset) ))) (PreH12 : ((Z.land entry 1) = 0)) ,
  (UCharArray.full id_map map_end bytes )
  **  ((( &( "map_end" ) )) # Int  |-> map_end)
  **  ((( &( "index" ) )) # Int  |-> index)
  **  ((( &( "entry" ) )) # UChar  |-> entry)
  **  ((( &( "id" ) )) # Int  |-> id)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ ((signed_last_nbits ((1 * (2^(id % ( 8 ) )) )) (32)) <= INT_MAX) ”
.

Definition AllocId_safety_wit_24_split_goal_2 := 
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (id: Z) (entry: Z) (bytes: (@list Z)) (index: Z) (map_end: Z) (PreH1 : (id < manager_id_max)) (PreH2 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH3 : (0 <= index)) (PreH4 : (index < map_end)) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (allocid_index_scan_inv bytes index )) (PreH8 : ((Znth index bytes 0) <> 255)) (PreH9 : (allocid_entry_scan_inv bytes index id entry )) (PreH10 : (manager_id_max = (m.(idmax) ))) (PreH11 : (manager_hoffset = (m.(hoffset) ))) (PreH12 : ((Z.land entry 1) = 0)) ,
  (UCharArray.full id_map map_end bytes )
  **  ((( &( "map_end" ) )) # Int  |-> map_end)
  **  ((( &( "index" ) )) # Int  |-> index)
  **  ((( &( "entry" ) )) # UChar  |-> entry)
  **  ((( &( "id" ) )) # Int  |-> id)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ ((INT_MIN) <= (signed_last_nbits ((1 * (2^(id % ( 8 ) )) )) (32))) ”
.

Definition AllocId_safety_wit_24_split_goal_3 := 
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (id: Z) (entry: Z) (bytes: (@list Z)) (index: Z) (map_end: Z) (PreH1 : (id < manager_id_max)) (PreH2 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH3 : (0 <= index)) (PreH4 : (index < map_end)) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (allocid_index_scan_inv bytes index )) (PreH8 : ((Znth index bytes 0) <> 255)) (PreH9 : (allocid_entry_scan_inv bytes index id entry )) (PreH10 : (manager_id_max = (m.(idmax) ))) (PreH11 : (manager_hoffset = (m.(hoffset) ))) (PreH12 : ((Z.land entry 1) = 0)) ,
  (UCharArray.full id_map map_end bytes )
  **  ((( &( "map_end" ) )) # Int  |-> map_end)
  **  ((( &( "index" ) )) # Int  |-> index)
  **  ((( &( "entry" ) )) # UChar  |-> entry)
  **  ((( &( "id" ) )) # Int  |-> id)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ ((id % ( 8 ) ) <= 31) ”
.

Definition AllocId_safety_wit_24_split_goal_4 := 
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (id: Z) (entry: Z) (bytes: (@list Z)) (index: Z) (map_end: Z) (PreH1 : (id < manager_id_max)) (PreH2 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH3 : (0 <= index)) (PreH4 : (index < map_end)) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (allocid_index_scan_inv bytes index )) (PreH8 : ((Znth index bytes 0) <> 255)) (PreH9 : (allocid_entry_scan_inv bytes index id entry )) (PreH10 : (manager_id_max = (m.(idmax) ))) (PreH11 : (manager_hoffset = (m.(hoffset) ))) (PreH12 : ((Z.land entry 1) = 0)) ,
  (UCharArray.full id_map map_end bytes )
  **  ((( &( "map_end" ) )) # Int  |-> map_end)
  **  ((( &( "index" ) )) # Int  |-> index)
  **  ((( &( "entry" ) )) # UChar  |-> entry)
  **  ((( &( "id" ) )) # Int  |-> id)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ (0 <= (id % ( 8 ) )) ”
.

Definition AllocId_safety_wit_25 := 
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (id: Z) (entry: Z) (bytes: (@list Z)) (index: Z) (map_end: Z) (PreH1 : (id < manager_id_max)) (PreH2 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH3 : (0 <= index)) (PreH4 : (index < map_end)) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (allocid_index_scan_inv bytes index )) (PreH8 : ((Znth index bytes 0) <> 255)) (PreH9 : (allocid_entry_scan_inv bytes index id entry )) (PreH10 : (manager_id_max = (m.(idmax) ))) (PreH11 : (manager_hoffset = (m.(hoffset) ))) (PreH12 : ((Z.land entry 1) = 0)) ,
  (UCharArray.full id_map map_end bytes )
  **  ((( &( "map_end" ) )) # Int  |-> map_end)
  **  ((( &( "index" ) )) # Int  |-> index)
  **  ((( &( "entry" ) )) # UChar  |-> entry)
  **  ((( &( "id" ) )) # Int  |-> id)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ ((id <> (INT_MIN)) \/ (8 <> (-1))) ” 
  &&  “ (8 <> 0) ”
.

Definition AllocId_safety_wit_26 := 
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (id: Z) (entry: Z) (bytes: (@list Z)) (index: Z) (map_end: Z) (PreH1 : (id < manager_id_max)) (PreH2 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH3 : (0 <= index)) (PreH4 : (index < map_end)) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (allocid_index_scan_inv bytes index )) (PreH8 : ((Znth index bytes 0) <> 255)) (PreH9 : (allocid_entry_scan_inv bytes index id entry )) (PreH10 : (manager_id_max = (m.(idmax) ))) (PreH11 : (manager_hoffset = (m.(hoffset) ))) (PreH12 : ((Z.land entry 1) = 0)) ,
  (UCharArray.full id_map map_end bytes )
  **  ((( &( "map_end" ) )) # Int  |-> map_end)
  **  ((( &( "index" ) )) # Int  |-> index)
  **  ((( &( "entry" ) )) # UChar  |-> entry)
  **  ((( &( "id" ) )) # Int  |-> id)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition AllocId_safety_wit_27 := 
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (id: Z) (entry: Z) (bytes: (@list Z)) (index: Z) (map_end: Z) (PreH1 : (id < manager_id_max)) (PreH2 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH3 : (0 <= index)) (PreH4 : (index < map_end)) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (allocid_index_scan_inv bytes index )) (PreH8 : ((Znth index bytes 0) <> 255)) (PreH9 : (allocid_entry_scan_inv bytes index id entry )) (PreH10 : (manager_id_max = (m.(idmax) ))) (PreH11 : (manager_hoffset = (m.(hoffset) ))) (PreH12 : ((Z.land entry 1) = 0)) ,
  (UCharArray.full id_map map_end bytes )
  **  ((( &( "map_end" ) )) # Int  |-> map_end)
  **  ((( &( "index" ) )) # Int  |-> index)
  **  ((( &( "entry" ) )) # UChar  |-> entry)
  **  ((( &( "id" ) )) # Int  |-> id)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition AllocId_entail_wit_1 := 
(
forall (manager_pre: Z) (m: idmanager) (htable_2: Z) (id_map_2: Z) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (bytes_2: (@list Z)) (PreH1 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes_2 )) (PreH2 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH3 : (manager_callee_id_max = (m.(idmax) ))) (PreH4 : (manager_callee_hoffset = (m.(hoffset) ))) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map_2)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable_2)
  **  (UCharArray.full id_map_2 (((m.(idmax) ) + 7 ) ÷ 8 ) bytes_2 )
  **  (store_idbuckets (m.(storeA) ) htable_2 (m.(hoffset) ) (m.(idbuckets) ) )
|--
  EX (htable: Z)  (id_map: Z)  (manager_hoffset: Z)  (manager_id_max: Z)  (bytes: (@list Z)) ,
  “ (((manager_callee_id_max + 7 ) ÷ 8 ) = (((m.(idmax) ) + 7 ) ÷ 8 )) ” 
  &&  “ (0 = 0) ” 
  &&  “ (0 = 0) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= ((manager_callee_id_max + 7 ) ÷ 8 )) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (allocid_index_scan_inv bytes 0 ) ” 
  &&  “ (manager_id_max = (m.(idmax) )) ” 
  &&  “ (manager_hoffset = (m.(hoffset) )) ”
  &&  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map ((manager_callee_id_max + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
) \/
(
forall (m: idmanager) (htable_2: Z) (id_map_2: Z) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (bytes_2: (@list Z)) (PreH1 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes_2 )) (PreH2 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH3 : (manager_callee_id_max = (m.(idmax) ))) (PreH4 : (manager_callee_hoffset = (m.(hoffset) ))) ,
  (UCharArray.full id_map_2 (((m.(idmax) ) + 7 ) ÷ 8 ) bytes_2 )
  **  (store_idbuckets (m.(storeA) ) htable_2 (m.(hoffset) ) (m.(idbuckets) ) )
|--
  EX (bytes: (@list Z)) ,
  “ (manager_callee_hoffset = (m.(hoffset) )) ” 
  &&  “ (manager_callee_id_max = (m.(idmax) )) ” 
  &&  “ (manager_callee_hoffset = (m.(hoffset) )) ” 
  &&  “ (manager_callee_id_max = (m.(idmax) )) ” 
  &&  “ (((manager_callee_id_max + 7 ) ÷ 8 ) = (((m.(idmax) ) + 7 ) ÷ 8 )) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= ((manager_callee_id_max + 7 ) ÷ 8 )) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (allocid_index_scan_inv bytes 0 ) ”
  &&  (UCharArray.full id_map_2 ((manager_callee_id_max + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets (m.(storeA) ) htable_2 (m.(hoffset) ) (m.(idbuckets) ) )
).

Definition AllocId_entail_wit_2 := 
(
forall (manager_pre: Z) (m: idmanager) (htable_2: Z) (id_map_2: Z) (manager_hoffset_2: Z) (manager_id_max_2: Z) (bytes_2: (@list Z)) (index: Z) (entry: Z) (id: Z) (map_end: Z) (PreH1 : ((Znth index bytes_2 0) = 255)) (PreH2 : (index < map_end)) (PreH3 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH4 : (id = 0)) (PreH5 : (entry = 0)) (PreH6 : (0 <= index)) (PreH7 : (index <= map_end)) (PreH8 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes_2 )) (PreH9 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH10 : (allocid_index_scan_inv bytes_2 index )) (PreH11 : (manager_id_max_2 = (m.(idmax) ))) (PreH12 : (manager_hoffset_2 = (m.(hoffset) ))) ,
  (UCharArray.full id_map_2 map_end bytes_2 )
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max_2)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset_2)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map_2)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable_2)
  **  (store_idbuckets (m.(storeA) ) htable_2 (m.(hoffset) ) (m.(idbuckets) ) )
|--
  EX (htable: Z)  (id_map: Z)  (manager_hoffset: Z)  (manager_id_max: Z)  (bytes: (@list Z)) ,
  “ (map_end = (((m.(idmax) ) + 7 ) ÷ 8 )) ” 
  &&  “ (id = 0) ” 
  &&  “ (entry = 0) ” 
  &&  “ (0 <= (index + 1 )) ” 
  &&  “ ((index + 1 ) <= map_end) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (allocid_index_scan_inv bytes (index + 1 ) ) ” 
  &&  “ (manager_id_max = (m.(idmax) )) ” 
  &&  “ (manager_hoffset = (m.(hoffset) )) ”
  &&  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map map_end bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
) \/
(
forall (m: idmanager) (htable_2: Z) (manager_hoffset_2: Z) (manager_id_max_2: Z) (bytes_2: (@list Z)) (index: Z) (entry: Z) (id: Z) (map_end: Z) (PreH1 : ((Znth index bytes_2 0) = 255)) (PreH2 : (index < map_end)) (PreH3 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH4 : (id = 0)) (PreH5 : (entry = 0)) (PreH6 : (0 <= index)) (PreH7 : (index <= map_end)) (PreH8 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes_2 )) (PreH9 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH10 : (allocid_index_scan_inv bytes_2 index )) (PreH11 : (manager_id_max_2 = (m.(idmax) ))) (PreH12 : (manager_hoffset_2 = (m.(hoffset) ))) ,
  (store_idbuckets (m.(storeA) ) htable_2 (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ (allocid_index_scan_inv bytes_2 (index + 1 ) ) ”
  &&  (store_idbuckets (m.(storeA) ) htable_2 (m.(hoffset) ) (m.(idbuckets) ) )
).

Definition AllocId_entail_wit_2_split_goal_1 := 
forall (m: idmanager) (htable_2: Z) (manager_hoffset_2: Z) (manager_id_max_2: Z) (bytes_2: (@list Z)) (index: Z) (entry: Z) (id: Z) (map_end: Z) (PreH1 : ((Znth index bytes_2 0) = 255)) (PreH2 : (index < map_end)) (PreH3 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH4 : (id = 0)) (PreH5 : (entry = 0)) (PreH6 : (0 <= index)) (PreH7 : (index <= map_end)) (PreH8 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes_2 )) (PreH9 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH10 : (allocid_index_scan_inv bytes_2 index )) (PreH11 : (manager_id_max_2 = (m.(idmax) ))) (PreH12 : (manager_hoffset_2 = (m.(hoffset) ))) ,
  (store_idbuckets (m.(storeA) ) htable_2 (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ (allocid_index_scan_inv bytes_2 (index + 1 ) ) ”
.

Definition AllocId_entail_wit_2_split_goal_spatial := 
forall (m: idmanager) (htable_2: Z) (manager_hoffset_2: Z) (manager_id_max_2: Z) (bytes_2: (@list Z)) (index: Z) (entry: Z) (id: Z) (map_end: Z) (PreH1 : ((Znth index bytes_2 0) = 255)) (PreH2 : (index < map_end)) (PreH3 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH4 : (id = 0)) (PreH5 : (entry = 0)) (PreH6 : (0 <= index)) (PreH7 : (index <= map_end)) (PreH8 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes_2 )) (PreH9 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH10 : (allocid_index_scan_inv bytes_2 index )) (PreH11 : (manager_id_max_2 = (m.(idmax) ))) (PreH12 : (manager_hoffset_2 = (m.(hoffset) ))) ,
  (store_idbuckets (m.(storeA) ) htable_2 (m.(hoffset) ) (m.(idbuckets) ) )
|--
  (store_idbuckets (m.(storeA) ) htable_2 (m.(hoffset) ) (m.(idbuckets) ) )
.

Definition AllocId_entail_wit_3 := 
(
forall (manager_pre: Z) (m: idmanager) (htable_2: Z) (id_map_2: Z) (manager_hoffset_2: Z) (manager_id_max_2: Z) (bytes: (@list Z)) (index: Z) (entry: Z) (id: Z) (map_end: Z) (PreH1 : (index <> map_end)) (PreH2 : ((Znth index bytes 0) <> 255)) (PreH3 : (index < map_end)) (PreH4 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH5 : (id = 0)) (PreH6 : (entry = 0)) (PreH7 : (0 <= index)) (PreH8 : (index <= map_end)) (PreH9 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH10 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH11 : (allocid_index_scan_inv bytes index )) (PreH12 : (manager_id_max_2 = (m.(idmax) ))) (PreH13 : (manager_hoffset_2 = (m.(hoffset) ))) ,
  (UCharArray.full id_map_2 map_end bytes )
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max_2)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset_2)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map_2)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable_2)
  **  (store_idbuckets (m.(storeA) ) htable_2 (m.(hoffset) ) (m.(idbuckets) ) )
|--
  EX (htable: Z)  (id_map: Z)  (manager_hoffset: Z)  (manager_id_max: Z)  (bytes_2: (@list Z)) ,
  “ (map_end = (((m.(idmax) ) + 7 ) ÷ 8 )) ” 
  &&  “ (0 <= index) ” 
  &&  “ (index < map_end) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes_2 ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (allocid_index_scan_inv bytes_2 index ) ” 
  &&  “ ((Znth index bytes_2 0) <> 255) ” 
  &&  “ (allocid_entry_scan_inv bytes_2 index (index * 8 ) (Znth index bytes 0) ) ” 
  &&  “ (manager_id_max = (m.(idmax) )) ” 
  &&  “ (manager_hoffset = (m.(hoffset) )) ”
  &&  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map map_end bytes_2 )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
) \/
(
forall (m: idmanager) (htable_2: Z) (manager_hoffset_2: Z) (manager_id_max_2: Z) (bytes: (@list Z)) (index: Z) (entry: Z) (id: Z) (map_end: Z) (PreH1 : (index <> map_end)) (PreH2 : ((Znth index bytes 0) <> 255)) (PreH3 : (index < map_end)) (PreH4 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH5 : (id = 0)) (PreH6 : (entry = 0)) (PreH7 : (0 <= index)) (PreH8 : (index <= map_end)) (PreH9 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH10 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH11 : (allocid_index_scan_inv bytes index )) (PreH12 : (manager_id_max_2 = (m.(idmax) ))) (PreH13 : (manager_hoffset_2 = (m.(hoffset) ))) ,
  (store_idbuckets (m.(storeA) ) htable_2 (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ (allocid_entry_scan_inv bytes index (index * 8 ) (Znth index bytes 0) ) ”
  &&  (store_idbuckets (m.(storeA) ) htable_2 (m.(hoffset) ) (m.(idbuckets) ) )
).

Definition AllocId_entail_wit_3_split_goal_1 := 
forall (m: idmanager) (htable_2: Z) (manager_hoffset_2: Z) (manager_id_max_2: Z) (bytes: (@list Z)) (index: Z) (entry: Z) (id: Z) (map_end: Z) (PreH1 : (index <> map_end)) (PreH2 : ((Znth index bytes 0) <> 255)) (PreH3 : (index < map_end)) (PreH4 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH5 : (id = 0)) (PreH6 : (entry = 0)) (PreH7 : (0 <= index)) (PreH8 : (index <= map_end)) (PreH9 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH10 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH11 : (allocid_index_scan_inv bytes index )) (PreH12 : (manager_id_max_2 = (m.(idmax) ))) (PreH13 : (manager_hoffset_2 = (m.(hoffset) ))) ,
  (store_idbuckets (m.(storeA) ) htable_2 (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ (allocid_entry_scan_inv bytes index (index * 8 ) (Znth index bytes 0) ) ”
.

Definition AllocId_entail_wit_3_split_goal_spatial := 
forall (m: idmanager) (htable_2: Z) (manager_hoffset_2: Z) (manager_id_max_2: Z) (bytes: (@list Z)) (index: Z) (entry: Z) (id: Z) (map_end: Z) (PreH1 : (index <> map_end)) (PreH2 : ((Znth index bytes 0) <> 255)) (PreH3 : (index < map_end)) (PreH4 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH5 : (id = 0)) (PreH6 : (entry = 0)) (PreH7 : (0 <= index)) (PreH8 : (index <= map_end)) (PreH9 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH10 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH11 : (allocid_index_scan_inv bytes index )) (PreH12 : (manager_id_max_2 = (m.(idmax) ))) (PreH13 : (manager_hoffset_2 = (m.(hoffset) ))) ,
  (store_idbuckets (m.(storeA) ) htable_2 (m.(hoffset) ) (m.(idbuckets) ) )
|--
  (store_idbuckets (m.(storeA) ) htable_2 (m.(hoffset) ) (m.(idbuckets) ) )
.

Definition AllocId_entail_wit_4 := 
(
forall (manager_pre: Z) (m: idmanager) (htable_2: Z) (id_map_2: Z) (manager_hoffset_2: Z) (manager_id_max_2: Z) (id: Z) (entry: Z) (bytes_2: (@list Z)) (index: Z) (map_end: Z) (PreH1 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH2 : (0 <= index)) (PreH3 : (index < map_end)) (PreH4 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes_2 )) (PreH5 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH6 : (allocid_index_scan_inv bytes_2 index )) (PreH7 : ((Znth index bytes_2 0) <> 255)) (PreH8 : (allocid_entry_scan_inv bytes_2 index id entry )) (PreH9 : (manager_id_max_2 = (m.(idmax) ))) (PreH10 : (manager_hoffset_2 = (m.(hoffset) ))) (PreH11 : ((Z.land entry 1) <> 0)) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max_2)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset_2)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map_2)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable_2)
  **  (UCharArray.full id_map_2 map_end bytes_2 )
  **  (store_idbuckets (m.(storeA) ) htable_2 (m.(hoffset) ) (m.(idbuckets) ) )
|--
  EX (htable: Z)  (id_map: Z)  (manager_hoffset: Z)  (manager_id_max: Z)  (bytes: (@list Z)) ,
  “ (map_end = (((m.(idmax) ) + 7 ) ÷ 8 )) ” 
  &&  “ (0 <= index) ” 
  &&  “ (index < map_end) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (allocid_index_scan_inv bytes index ) ” 
  &&  “ ((Znth index bytes 0) <> 255) ” 
  &&  “ (allocid_entry_scan_inv bytes index (id + 1 ) (unsigned_last_nbits ((Z.shiftr entry 1)) (8)) ) ” 
  &&  “ (manager_id_max = (m.(idmax) )) ” 
  &&  “ (manager_hoffset = (m.(hoffset) )) ”
  &&  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map map_end bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
) \/
(
forall (m: idmanager) (htable_2: Z) (manager_hoffset_2: Z) (manager_id_max_2: Z) (id: Z) (entry: Z) (bytes_2: (@list Z)) (index: Z) (map_end: Z) (PreH1 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH2 : (0 <= index)) (PreH3 : (index < map_end)) (PreH4 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes_2 )) (PreH5 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH6 : (allocid_index_scan_inv bytes_2 index )) (PreH7 : ((Znth index bytes_2 0) <> 255)) (PreH8 : (allocid_entry_scan_inv bytes_2 index id entry )) (PreH9 : (manager_id_max_2 = (m.(idmax) ))) (PreH10 : (manager_hoffset_2 = (m.(hoffset) ))) (PreH11 : ((Z.land entry 1) <> 0)) ,
  (store_idbuckets (m.(storeA) ) htable_2 (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ (allocid_entry_scan_inv bytes_2 index (id + 1 ) (unsigned_last_nbits ((Z.shiftr entry 1)) (8)) ) ”
  &&  (store_idbuckets (m.(storeA) ) htable_2 (m.(hoffset) ) (m.(idbuckets) ) )
).

Definition AllocId_entail_wit_4_split_goal_1 := 
forall (m: idmanager) (htable_2: Z) (manager_hoffset_2: Z) (manager_id_max_2: Z) (id: Z) (entry: Z) (bytes_2: (@list Z)) (index: Z) (map_end: Z) (PreH1 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH2 : (0 <= index)) (PreH3 : (index < map_end)) (PreH4 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes_2 )) (PreH5 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH6 : (allocid_index_scan_inv bytes_2 index )) (PreH7 : ((Znth index bytes_2 0) <> 255)) (PreH8 : (allocid_entry_scan_inv bytes_2 index id entry )) (PreH9 : (manager_id_max_2 = (m.(idmax) ))) (PreH10 : (manager_hoffset_2 = (m.(hoffset) ))) (PreH11 : ((Z.land entry 1) <> 0)) ,
  (store_idbuckets (m.(storeA) ) htable_2 (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ (allocid_entry_scan_inv bytes_2 index (id + 1 ) (unsigned_last_nbits ((Z.shiftr entry 1)) (8)) ) ”
.

Definition AllocId_entail_wit_4_split_goal_spatial := 
forall (m: idmanager) (htable_2: Z) (manager_hoffset_2: Z) (manager_id_max_2: Z) (id: Z) (entry: Z) (bytes_2: (@list Z)) (index: Z) (map_end: Z) (PreH1 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH2 : (0 <= index)) (PreH3 : (index < map_end)) (PreH4 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes_2 )) (PreH5 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH6 : (allocid_index_scan_inv bytes_2 index )) (PreH7 : ((Znth index bytes_2 0) <> 255)) (PreH8 : (allocid_entry_scan_inv bytes_2 index id entry )) (PreH9 : (manager_id_max_2 = (m.(idmax) ))) (PreH10 : (manager_hoffset_2 = (m.(hoffset) ))) (PreH11 : ((Z.land entry 1) <> 0)) ,
  (store_idbuckets (m.(storeA) ) htable_2 (m.(hoffset) ) (m.(idbuckets) ) )
|--
  (store_idbuckets (m.(storeA) ) htable_2 (m.(hoffset) ) (m.(idbuckets) ) )
.

Definition AllocId_return_wit_1 := 
(
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (id: Z) (entry: Z) (bytes: (@list Z)) (index: Z) (map_end: Z) (PreH1 : (id < manager_id_max)) (PreH2 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH3 : (0 <= index)) (PreH4 : (index < map_end)) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (allocid_index_scan_inv bytes index )) (PreH8 : ((Znth index bytes 0) <> 255)) (PreH9 : (allocid_entry_scan_inv bytes index id entry )) (PreH10 : (manager_id_max = (m.(idmax) ))) (PreH11 : (manager_hoffset = (m.(hoffset) ))) (PreH12 : ((Z.land entry 1) = 0)) ,
  (UCharArray.full id_map map_end (replace_Znth (index) ((Z.lor (unsigned_last_nbits ((Znth index bytes 0)) (8)) (unsigned_last_nbits ((Z.shiftl 1 (id % ( 8 ) ))) (8)))) (bytes)) )
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  (store_idmanager_allocid_post m manager_pre id )
) \/
(
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (id: Z) (entry: Z) (bytes: (@list Z)) (index: Z) (map_end: Z) (PreH1 : (id < manager_id_max)) (PreH2 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH3 : (0 <= index)) (PreH4 : (index < map_end)) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (allocid_index_scan_inv bytes index )) (PreH8 : ((Znth index bytes 0) <> 255)) (PreH9 : (allocid_entry_scan_inv bytes index id entry )) (PreH10 : (manager_id_max = (m.(idmax) ))) (PreH11 : (manager_hoffset = (m.(hoffset) ))) (PreH12 : ((Z.land entry 1) = 0)) ,
  (UCharArray.full id_map map_end (replace_Znth (index) ((Z.lor (unsigned_last_nbits ((Znth index bytes 0)) (8)) (unsigned_last_nbits ((Z.shiftl 1 (id % ( 8 ) ))) (8)))) (bytes)) )
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  (store_idmanager_allocid_post m manager_pre id )
).

Definition AllocId_return_wit_1_split_goal_spatial := 
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (id: Z) (entry: Z) (bytes: (@list Z)) (index: Z) (map_end: Z) (PreH1 : (id < manager_id_max)) (PreH2 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH3 : (0 <= index)) (PreH4 : (index < map_end)) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (allocid_index_scan_inv bytes index )) (PreH8 : ((Znth index bytes 0) <> 255)) (PreH9 : (allocid_entry_scan_inv bytes index id entry )) (PreH10 : (manager_id_max = (m.(idmax) ))) (PreH11 : (manager_hoffset = (m.(hoffset) ))) (PreH12 : ((Z.land entry 1) = 0)) ,
  (UCharArray.full id_map map_end (replace_Znth (index) ((Z.lor (unsigned_last_nbits ((Znth index bytes 0)) (8)) (unsigned_last_nbits ((Z.shiftl 1 (id % ( 8 ) ))) (8)))) (bytes)) )
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  (store_idmanager_allocid_post m manager_pre id )
.

Definition AllocId_return_wit_2 := 
(
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (id: Z) (entry: Z) (bytes: (@list Z)) (index: Z) (map_end: Z) (PreH1 : (id >= manager_id_max)) (PreH2 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH3 : (0 <= index)) (PreH4 : (index < map_end)) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (allocid_index_scan_inv bytes index )) (PreH8 : ((Znth index bytes 0) <> 255)) (PreH9 : (allocid_entry_scan_inv bytes index id entry )) (PreH10 : (manager_id_max = (m.(idmax) ))) (PreH11 : (manager_hoffset = (m.(hoffset) ))) (PreH12 : ((Z.land entry 1) = 0)) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map map_end bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  (store_idmanager_allocid_post m manager_pre (-1) )
) \/
(
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (id: Z) (entry: Z) (bytes: (@list Z)) (index: Z) (map_end: Z) (PreH1 : (id >= manager_id_max)) (PreH2 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH3 : (0 <= index)) (PreH4 : (index < map_end)) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (allocid_index_scan_inv bytes index )) (PreH8 : ((Znth index bytes 0) <> 255)) (PreH9 : (allocid_entry_scan_inv bytes index id entry )) (PreH10 : (manager_id_max = (m.(idmax) ))) (PreH11 : (manager_hoffset = (m.(hoffset) ))) (PreH12 : ((Z.land entry 1) = 0)) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map map_end bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  (store_idmanager_allocid_post m manager_pre (-1) )
).

Definition AllocId_return_wit_2_split_goal_spatial := 
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (id: Z) (entry: Z) (bytes: (@list Z)) (index: Z) (map_end: Z) (PreH1 : (id >= manager_id_max)) (PreH2 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH3 : (0 <= index)) (PreH4 : (index < map_end)) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (allocid_index_scan_inv bytes index )) (PreH8 : ((Znth index bytes 0) <> 255)) (PreH9 : (allocid_entry_scan_inv bytes index id entry )) (PreH10 : (manager_id_max = (m.(idmax) ))) (PreH11 : (manager_hoffset = (m.(hoffset) ))) (PreH12 : ((Z.land entry 1) = 0)) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map map_end bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  (store_idmanager_allocid_post m manager_pre (-1) )
.

Definition AllocId_return_wit_3 := 
(
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (bytes: (@list Z)) (index: Z) (entry: Z) (id: Z) (map_end: Z) (PreH1 : (index = map_end)) (PreH2 : (index >= map_end)) (PreH3 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH4 : (id = 0)) (PreH5 : (entry = 0)) (PreH6 : (0 <= index)) (PreH7 : (index <= map_end)) (PreH8 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH9 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH10 : (allocid_index_scan_inv bytes index )) (PreH11 : (manager_id_max = (m.(idmax) ))) (PreH12 : (manager_hoffset = (m.(hoffset) ))) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map map_end bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  (store_idmanager_allocid_post m manager_pre (-1) )
) \/
(
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (bytes: (@list Z)) (index: Z) (entry: Z) (id: Z) (map_end: Z) (PreH1 : (index = map_end)) (PreH2 : (index >= map_end)) (PreH3 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH4 : (id = 0)) (PreH5 : (entry = 0)) (PreH6 : (0 <= index)) (PreH7 : (index <= map_end)) (PreH8 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH9 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH10 : (allocid_index_scan_inv bytes index )) (PreH11 : (manager_id_max = (m.(idmax) ))) (PreH12 : (manager_hoffset = (m.(hoffset) ))) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map map_end bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  (store_idmanager_allocid_post m manager_pre (-1) )
).

Definition AllocId_return_wit_3_split_goal_spatial := 
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (bytes: (@list Z)) (index: Z) (entry: Z) (id: Z) (map_end: Z) (PreH1 : (index = map_end)) (PreH2 : (index >= map_end)) (PreH3 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH4 : (id = 0)) (PreH5 : (entry = 0)) (PreH6 : (0 <= index)) (PreH7 : (index <= map_end)) (PreH8 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH9 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH10 : (allocid_index_scan_inv bytes index )) (PreH11 : (manager_id_max = (m.(idmax) ))) (PreH12 : (manager_hoffset = (m.(hoffset) ))) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map map_end bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  (store_idmanager_allocid_post m manager_pre (-1) )
.

Definition AllocId_partial_solve_wit_1 := 
forall (manager_pre: Z) (m: idmanager) ,
  (store_idmanager m manager_pre )
|--
  (store_idmanager m manager_pre )
.

Definition AllocId_partial_solve_wit_2 := 
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (bytes: (@list Z)) (index: Z) (entry: Z) (id: Z) (map_end: Z) (PreH1 : (index < map_end)) (PreH2 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH3 : (id = 0)) (PreH4 : (entry = 0)) (PreH5 : (0 <= index)) (PreH6 : (index <= map_end)) (PreH7 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH8 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH9 : (allocid_index_scan_inv bytes index )) (PreH10 : (manager_id_max = (m.(idmax) ))) (PreH11 : (manager_hoffset = (m.(hoffset) ))) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map map_end bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ (index < map_end) ” 
  &&  “ (map_end = (((m.(idmax) ) + 7 ) ÷ 8 )) ” 
  &&  “ (id = 0) ” 
  &&  “ (entry = 0) ” 
  &&  “ (0 <= index) ” 
  &&  “ (index <= map_end) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (allocid_index_scan_inv bytes index ) ” 
  &&  “ (manager_id_max = (m.(idmax) )) ” 
  &&  “ (manager_hoffset = (m.(hoffset) )) ”
  &&  (((id_map + (index * sizeof(UCHAR)))) # UChar  |-> (Znth index bytes 0))
  **  (UCharArray.missing_i id_map index 0 map_end bytes )
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
.

Definition AllocId_partial_solve_wit_3 := 
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (bytes: (@list Z)) (index: Z) (entry: Z) (id: Z) (map_end: Z) (PreH1 : (index <> map_end)) (PreH2 : ((Znth index bytes 0) <> 255)) (PreH3 : (index < map_end)) (PreH4 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH5 : (id = 0)) (PreH6 : (entry = 0)) (PreH7 : (0 <= index)) (PreH8 : (index <= map_end)) (PreH9 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH10 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH11 : (allocid_index_scan_inv bytes index )) (PreH12 : (manager_id_max = (m.(idmax) ))) (PreH13 : (manager_hoffset = (m.(hoffset) ))) ,
  (UCharArray.full id_map map_end bytes )
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ (index <> map_end) ” 
  &&  “ ((Znth index bytes 0) <> 255) ” 
  &&  “ (index < map_end) ” 
  &&  “ (map_end = (((m.(idmax) ) + 7 ) ÷ 8 )) ” 
  &&  “ (id = 0) ” 
  &&  “ (entry = 0) ” 
  &&  “ (0 <= index) ” 
  &&  “ (index <= map_end) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (allocid_index_scan_inv bytes index ) ” 
  &&  “ (manager_id_max = (m.(idmax) )) ” 
  &&  “ (manager_hoffset = (m.(hoffset) )) ”
  &&  (((id_map + (index * sizeof(UCHAR)))) # UChar  |-> (Znth index bytes 0))
  **  (UCharArray.missing_i id_map index 0 map_end bytes )
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
.

Definition AllocId_partial_solve_wit_4 := 
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (id: Z) (entry: Z) (bytes: (@list Z)) (index: Z) (map_end: Z) (PreH1 : (id < manager_id_max)) (PreH2 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH3 : (0 <= index)) (PreH4 : (index < map_end)) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (allocid_index_scan_inv bytes index )) (PreH8 : ((Znth index bytes 0) <> 255)) (PreH9 : (allocid_entry_scan_inv bytes index id entry )) (PreH10 : (manager_id_max = (m.(idmax) ))) (PreH11 : (manager_hoffset = (m.(hoffset) ))) (PreH12 : ((Z.land entry 1) = 0)) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map map_end bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ (id < manager_id_max) ” 
  &&  “ (map_end = (((m.(idmax) ) + 7 ) ÷ 8 )) ” 
  &&  “ (0 <= index) ” 
  &&  “ (index < map_end) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (allocid_index_scan_inv bytes index ) ” 
  &&  “ ((Znth index bytes 0) <> 255) ” 
  &&  “ (allocid_entry_scan_inv bytes index id entry ) ” 
  &&  “ (manager_id_max = (m.(idmax) )) ” 
  &&  “ (manager_hoffset = (m.(hoffset) )) ” 
  &&  “ ((Z.land entry 1) = 0) ”
  &&  (((id_map + (index * sizeof(UCHAR)))) # UChar  |-> (Znth index bytes 0))
  **  (UCharArray.missing_i id_map index 0 map_end bytes )
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
.

Definition AllocId_partial_solve_wit_5 := 
forall (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_hoffset: Z) (manager_id_max: Z) (id: Z) (entry: Z) (bytes: (@list Z)) (index: Z) (map_end: Z) (PreH1 : (id < manager_id_max)) (PreH2 : (map_end = (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH3 : (0 <= index)) (PreH4 : (index < map_end)) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (allocid_index_scan_inv bytes index )) (PreH8 : ((Znth index bytes 0) <> 255)) (PreH9 : (allocid_entry_scan_inv bytes index id entry )) (PreH10 : (manager_id_max = (m.(idmax) ))) (PreH11 : (manager_hoffset = (m.(hoffset) ))) (PreH12 : ((Z.land entry 1) = 0)) ,
  (UCharArray.full id_map map_end bytes )
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ (id < manager_id_max) ” 
  &&  “ (map_end = (((m.(idmax) ) + 7 ) ÷ 8 )) ” 
  &&  “ (0 <= index) ” 
  &&  “ (index < map_end) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (allocid_index_scan_inv bytes index ) ” 
  &&  “ ((Znth index bytes 0) <> 255) ” 
  &&  “ (allocid_entry_scan_inv bytes index id entry ) ” 
  &&  “ (manager_id_max = (m.(idmax) )) ” 
  &&  “ (manager_hoffset = (m.(hoffset) )) ” 
  &&  “ ((Z.land entry 1) = 0) ”
  &&  (((id_map + (index * sizeof(UCHAR)))) # UChar  |->_)
  **  (UCharArray.missing_i id_map index 0 map_end bytes )
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
.

Definition AllocId_which_implies_wit_1 := 
(
forall (manager_pre: Z) (m: idmanager) ,
  (store_idmanager m manager_pre )
|--
  EX (htable: Z)  (id_map: Z)  (manager_pre_hoffset: Z)  (manager_pre_id_max: Z)  (bytes: (@list Z)) ,
  “ (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (manager_pre_id_max = (m.(idmax) )) ” 
  &&  “ (manager_pre_hoffset = (m.(hoffset) )) ”
  &&  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_pre_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_pre_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
) \/
(
forall (manager_pre: Z) (m: idmanager) ,
  (store_idmanager m manager_pre )
|--
  EX (htable: Z)  (id_map: Z)  (bytes: (@list Z)) ,
  “ (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ”
  &&  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> (m.(idmax) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> (m.(hoffset) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
).

Module Type VC_Correct.

Axiom proof_of_AllocId_safety_wit_1 : AllocId_safety_wit_1.
Axiom proof_of_AllocId_safety_wit_2 : AllocId_safety_wit_2.
Axiom proof_of_AllocId_safety_wit_3 : AllocId_safety_wit_3.
Axiom proof_of_AllocId_safety_wit_4 : AllocId_safety_wit_4.
Axiom proof_of_AllocId_safety_wit_5 : AllocId_safety_wit_5.
Axiom proof_of_AllocId_safety_wit_6 : AllocId_safety_wit_6.
Axiom proof_of_AllocId_safety_wit_7 : AllocId_safety_wit_7.
Axiom proof_of_AllocId_safety_wit_8 : AllocId_safety_wit_8.
Axiom proof_of_AllocId_safety_wit_9 : AllocId_safety_wit_9.
Axiom proof_of_AllocId_safety_wit_10 : AllocId_safety_wit_10.
Axiom proof_of_AllocId_safety_wit_11 : AllocId_safety_wit_11.
Axiom proof_of_AllocId_safety_wit_12 : AllocId_safety_wit_12.
Axiom proof_of_AllocId_safety_wit_13 : AllocId_safety_wit_13.
Axiom proof_of_AllocId_safety_wit_14 : AllocId_safety_wit_14.
Axiom proof_of_AllocId_safety_wit_15 : AllocId_safety_wit_15.
Axiom proof_of_AllocId_safety_wit_16 : AllocId_safety_wit_16.
Axiom proof_of_AllocId_safety_wit_17 : AllocId_safety_wit_17.
Axiom proof_of_AllocId_safety_wit_18 : AllocId_safety_wit_18.
Axiom proof_of_AllocId_safety_wit_19 : AllocId_safety_wit_19.
Axiom proof_of_AllocId_safety_wit_20 : AllocId_safety_wit_20.
Axiom proof_of_AllocId_safety_wit_21 : AllocId_safety_wit_21.
Axiom proof_of_AllocId_safety_wit_22 : AllocId_safety_wit_22.
Axiom proof_of_AllocId_safety_wit_23 : AllocId_safety_wit_23.
Axiom proof_of_AllocId_safety_wit_24 : AllocId_safety_wit_24.
Axiom proof_of_AllocId_safety_wit_25 : AllocId_safety_wit_25.
Axiom proof_of_AllocId_safety_wit_26 : AllocId_safety_wit_26.
Axiom proof_of_AllocId_safety_wit_27 : AllocId_safety_wit_27.
Axiom proof_of_AllocId_entail_wit_1 : AllocId_entail_wit_1.
Axiom proof_of_AllocId_entail_wit_2 : AllocId_entail_wit_2.
Axiom proof_of_AllocId_entail_wit_3 : AllocId_entail_wit_3.
Axiom proof_of_AllocId_entail_wit_4 : AllocId_entail_wit_4.
Axiom proof_of_AllocId_return_wit_1 : AllocId_return_wit_1.
Axiom proof_of_AllocId_return_wit_2 : AllocId_return_wit_2.
Axiom proof_of_AllocId_return_wit_3 : AllocId_return_wit_3.
Axiom proof_of_AllocId_partial_solve_wit_1 : AllocId_partial_solve_wit_1.
Axiom proof_of_AllocId_partial_solve_wit_2 : AllocId_partial_solve_wit_2.
Axiom proof_of_AllocId_partial_solve_wit_3 : AllocId_partial_solve_wit_3.
Axiom proof_of_AllocId_partial_solve_wit_4 : AllocId_partial_solve_wit_4.
Axiom proof_of_AllocId_partial_solve_wit_5 : AllocId_partial_solve_wit_5.
Axiom proof_of_AllocId_which_implies_wit_1 : AllocId_which_implies_wit_1.

End VC_Correct.
