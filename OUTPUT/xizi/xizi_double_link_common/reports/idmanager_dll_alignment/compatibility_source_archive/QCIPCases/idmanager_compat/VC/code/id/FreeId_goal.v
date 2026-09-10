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

(*----- Function FreeId -----*)

Definition FreeId_safety_wit_1 := 
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (bytes: (@list Z)) (PreH1 : (0 <= id_pre)) (PreH2 : (id_pre < (m.(idmax) ))) (PreH3 : (0 <= (id_pre ÷ 8 ))) (PreH4 : ((id_pre ÷ 8 ) < (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (manager_callee_id_max = (m.(idmax) ))) (PreH8 : (manager_callee_hoffset = (m.(hoffset) ))) (PreH9 : (0 <= id_pre)) (PreH10 : (id_pre < (m.(idmax) ))) ,
  ((( &( "id" ) )) # UShort  |-> id_pre)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ ((id_pre <> (INT_MIN)) \/ (8 <> (-1))) ” 
  &&  “ (8 <> 0) ”
.

Definition FreeId_safety_wit_2 := 
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (bytes: (@list Z)) (PreH1 : (0 <= id_pre)) (PreH2 : (id_pre < (m.(idmax) ))) (PreH3 : (0 <= (id_pre ÷ 8 ))) (PreH4 : ((id_pre ÷ 8 ) < (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (manager_callee_id_max = (m.(idmax) ))) (PreH8 : (manager_callee_hoffset = (m.(hoffset) ))) (PreH9 : (0 <= id_pre)) (PreH10 : (id_pre < (m.(idmax) ))) ,
  ((( &( "id" ) )) # UShort  |-> id_pre)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition FreeId_safety_wit_3 := 
(
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (bytes: (@list Z)) (PreH1 : (0 <= id_pre)) (PreH2 : (id_pre < (m.(idmax) ))) (PreH3 : (0 <= (id_pre ÷ 8 ))) (PreH4 : ((id_pre ÷ 8 ) < (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (manager_callee_id_max = (m.(idmax) ))) (PreH8 : (manager_callee_hoffset = (m.(hoffset) ))) (PreH9 : (0 <= id_pre)) (PreH10 : (id_pre < (m.(idmax) ))) ,
  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  ((( &( "id" ) )) # UShort  |-> id_pre)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ ((signed_last_nbits ((1 * (2^(id_pre % ( 8 ) )) )) (32)) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (signed_last_nbits ((1 * (2^(id_pre % ( 8 ) )) )) (32))) ” 
  &&  “ ((id_pre % ( 8 ) ) <= 31) ” 
  &&  “ (0 <= (id_pre % ( 8 ) )) ”
) \/
(
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (bytes: (@list Z)) (PreH1 : (0 <= id_pre)) (PreH2 : (id_pre < (m.(idmax) ))) (PreH3 : (0 <= (id_pre ÷ 8 ))) (PreH4 : ((id_pre ÷ 8 ) < (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (manager_callee_id_max = (m.(idmax) ))) (PreH8 : (manager_callee_hoffset = (m.(hoffset) ))) (PreH9 : (0 <= id_pre)) (PreH10 : (id_pre < (m.(idmax) ))) ,
  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  ((( &( "id" ) )) # UShort  |-> id_pre)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ ((signed_last_nbits ((1 * (2^(id_pre % ( 8 ) )) )) (32)) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (signed_last_nbits ((1 * (2^(id_pre % ( 8 ) )) )) (32))) ” 
  &&  “ ((id_pre % ( 8 ) ) <= 31) ” 
  &&  “ (0 <= (id_pre % ( 8 ) )) ”
).

Definition FreeId_safety_wit_3_split_goal_1 := 
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (bytes: (@list Z)) (PreH1 : (0 <= id_pre)) (PreH2 : (id_pre < (m.(idmax) ))) (PreH3 : (0 <= (id_pre ÷ 8 ))) (PreH4 : ((id_pre ÷ 8 ) < (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (manager_callee_id_max = (m.(idmax) ))) (PreH8 : (manager_callee_hoffset = (m.(hoffset) ))) (PreH9 : (0 <= id_pre)) (PreH10 : (id_pre < (m.(idmax) ))) ,
  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  ((( &( "id" ) )) # UShort  |-> id_pre)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ ((signed_last_nbits ((1 * (2^(id_pre % ( 8 ) )) )) (32)) <= INT_MAX) ”
.

Definition FreeId_safety_wit_3_split_goal_2 := 
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (bytes: (@list Z)) (PreH1 : (0 <= id_pre)) (PreH2 : (id_pre < (m.(idmax) ))) (PreH3 : (0 <= (id_pre ÷ 8 ))) (PreH4 : ((id_pre ÷ 8 ) < (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (manager_callee_id_max = (m.(idmax) ))) (PreH8 : (manager_callee_hoffset = (m.(hoffset) ))) (PreH9 : (0 <= id_pre)) (PreH10 : (id_pre < (m.(idmax) ))) ,
  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  ((( &( "id" ) )) # UShort  |-> id_pre)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ ((INT_MIN) <= (signed_last_nbits ((1 * (2^(id_pre % ( 8 ) )) )) (32))) ”
.

Definition FreeId_safety_wit_3_split_goal_3 := 
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (bytes: (@list Z)) (PreH1 : (0 <= id_pre)) (PreH2 : (id_pre < (m.(idmax) ))) (PreH3 : (0 <= (id_pre ÷ 8 ))) (PreH4 : ((id_pre ÷ 8 ) < (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (manager_callee_id_max = (m.(idmax) ))) (PreH8 : (manager_callee_hoffset = (m.(hoffset) ))) (PreH9 : (0 <= id_pre)) (PreH10 : (id_pre < (m.(idmax) ))) ,
  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  ((( &( "id" ) )) # UShort  |-> id_pre)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ ((id_pre % ( 8 ) ) <= 31) ”
.

Definition FreeId_safety_wit_3_split_goal_4 := 
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (bytes: (@list Z)) (PreH1 : (0 <= id_pre)) (PreH2 : (id_pre < (m.(idmax) ))) (PreH3 : (0 <= (id_pre ÷ 8 ))) (PreH4 : ((id_pre ÷ 8 ) < (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (manager_callee_id_max = (m.(idmax) ))) (PreH8 : (manager_callee_hoffset = (m.(hoffset) ))) (PreH9 : (0 <= id_pre)) (PreH10 : (id_pre < (m.(idmax) ))) ,
  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  ((( &( "id" ) )) # UShort  |-> id_pre)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ (0 <= (id_pre % ( 8 ) )) ”
.

Definition FreeId_safety_wit_4 := 
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (bytes: (@list Z)) (PreH1 : (0 <= id_pre)) (PreH2 : (id_pre < (m.(idmax) ))) (PreH3 : (0 <= (id_pre ÷ 8 ))) (PreH4 : ((id_pre ÷ 8 ) < (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (manager_callee_id_max = (m.(idmax) ))) (PreH8 : (manager_callee_hoffset = (m.(hoffset) ))) (PreH9 : (0 <= id_pre)) (PreH10 : (id_pre < (m.(idmax) ))) ,
  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  ((( &( "id" ) )) # UShort  |-> id_pre)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ ((id_pre <> (INT_MIN)) \/ (8 <> (-1))) ” 
  &&  “ (8 <> 0) ”
.

Definition FreeId_safety_wit_5 := 
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (bytes: (@list Z)) (PreH1 : (0 <= id_pre)) (PreH2 : (id_pre < (m.(idmax) ))) (PreH3 : (0 <= (id_pre ÷ 8 ))) (PreH4 : ((id_pre ÷ 8 ) < (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (manager_callee_id_max = (m.(idmax) ))) (PreH8 : (manager_callee_hoffset = (m.(hoffset) ))) (PreH9 : (0 <= id_pre)) (PreH10 : (id_pre < (m.(idmax) ))) ,
  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  ((( &( "id" ) )) # UShort  |-> id_pre)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition FreeId_safety_wit_6 := 
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (bytes: (@list Z)) (PreH1 : (0 <= id_pre)) (PreH2 : (id_pre < (m.(idmax) ))) (PreH3 : (0 <= (id_pre ÷ 8 ))) (PreH4 : ((id_pre ÷ 8 ) < (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (manager_callee_id_max = (m.(idmax) ))) (PreH8 : (manager_callee_hoffset = (m.(hoffset) ))) (PreH9 : (0 <= id_pre)) (PreH10 : (id_pre < (m.(idmax) ))) ,
  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  ((( &( "id" ) )) # UShort  |-> id_pre)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition FreeId_return_wit_1 := 
(
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (bytes: (@list Z)) (PreH1 : (0 <= id_pre)) (PreH2 : (id_pre < (m.(idmax) ))) (PreH3 : (0 <= (id_pre ÷ 8 ))) (PreH4 : ((id_pre ÷ 8 ) < (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (manager_callee_id_max = (m.(idmax) ))) (PreH8 : (manager_callee_hoffset = (m.(hoffset) ))) (PreH9 : (0 <= id_pre)) (PreH10 : (id_pre < (m.(idmax) ))) ,
  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) (replace_Znth ((id_pre ÷ 8 )) ((Z.land (Znth (id_pre ÷ 8 ) bytes 0) (unsigned_last_nbits ((Z.lnot (signed_last_nbits ((Z.shiftl 1 (id_pre % ( 8 ) ))) (32)))) (8)))) (bytes)) )
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  (store_idmanager_freeid_post m manager_pre id_pre )
) \/
(
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (bytes: (@list Z)) (PreH1 : (0 <= id_pre)) (PreH2 : (id_pre < (m.(idmax) ))) (PreH3 : (0 <= (id_pre ÷ 8 ))) (PreH4 : ((id_pre ÷ 8 ) < (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (manager_callee_id_max = (m.(idmax) ))) (PreH8 : (manager_callee_hoffset = (m.(hoffset) ))) (PreH9 : (0 <= id_pre)) (PreH10 : (id_pre < (m.(idmax) ))) ,
  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) (replace_Znth ((id_pre ÷ 8 )) ((Z.land (Znth (id_pre ÷ 8 ) bytes 0) (unsigned_last_nbits ((Z.lnot (signed_last_nbits ((Z.shiftl 1 (id_pre % ( 8 ) ))) (32)))) (8)))) (bytes)) )
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  (store_idmanager_freeid_post m manager_pre id_pre )
).

Definition FreeId_return_wit_1_split_goal_spatial := 
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (bytes: (@list Z)) (PreH1 : (0 <= id_pre)) (PreH2 : (id_pre < (m.(idmax) ))) (PreH3 : (0 <= (id_pre ÷ 8 ))) (PreH4 : ((id_pre ÷ 8 ) < (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (manager_callee_id_max = (m.(idmax) ))) (PreH8 : (manager_callee_hoffset = (m.(hoffset) ))) (PreH9 : (0 <= id_pre)) (PreH10 : (id_pre < (m.(idmax) ))) ,
  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) (replace_Znth ((id_pre ÷ 8 )) ((Z.land (Znth (id_pre ÷ 8 ) bytes 0) (unsigned_last_nbits ((Z.lnot (signed_last_nbits ((Z.shiftl 1 (id_pre % ( 8 ) ))) (32)))) (8)))) (bytes)) )
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  (store_idmanager_freeid_post m manager_pre id_pre )
.

Definition FreeId_partial_solve_wit_1_pure := 
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (PreH1 : (0 <= id_pre)) (PreH2 : (id_pre < (m.(idmax) ))) ,
  ((( &( "id" ) )) # UShort  |-> id_pre)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  (store_idmanager m manager_pre )
|--
  “ (0 <= id_pre) ” 
  &&  “ (id_pre < (m.(idmax) )) ”
.

Definition FreeId_partial_solve_wit_1_aux := 
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (PreH1 : (0 <= id_pre)) (PreH2 : (id_pre < (m.(idmax) ))) ,
  (store_idmanager m manager_pre )
|--
  “ (0 <= id_pre) ” 
  &&  “ (id_pre < (m.(idmax) )) ” 
  &&  “ (0 <= id_pre) ” 
  &&  “ (id_pre < (m.(idmax) )) ”
  &&  (store_idmanager m manager_pre )
.

Definition FreeId_partial_solve_wit_1 := FreeId_partial_solve_wit_1_pure -> FreeId_partial_solve_wit_1_aux.

Definition FreeId_partial_solve_wit_2 := 
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (bytes: (@list Z)) (PreH1 : (0 <= id_pre)) (PreH2 : (id_pre < (m.(idmax) ))) (PreH3 : (0 <= (id_pre ÷ 8 ))) (PreH4 : ((id_pre ÷ 8 ) < (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (manager_callee_id_max = (m.(idmax) ))) (PreH8 : (manager_callee_hoffset = (m.(hoffset) ))) (PreH9 : (0 <= id_pre)) (PreH10 : (id_pre < (m.(idmax) ))) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ (0 <= id_pre) ” 
  &&  “ (id_pre < (m.(idmax) )) ” 
  &&  “ (0 <= (id_pre ÷ 8 )) ” 
  &&  “ ((id_pre ÷ 8 ) < (((m.(idmax) ) + 7 ) ÷ 8 )) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (manager_callee_id_max = (m.(idmax) )) ” 
  &&  “ (manager_callee_hoffset = (m.(hoffset) )) ” 
  &&  “ (0 <= id_pre) ” 
  &&  “ (id_pre < (m.(idmax) )) ”
  &&  (((id_map + ((id_pre ÷ 8 ) * sizeof(UCHAR)))) # UChar  |-> (Znth (id_pre ÷ 8 ) bytes 0))
  **  (UCharArray.missing_i id_map (id_pre ÷ 8 ) 0 (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
.

Definition FreeId_partial_solve_wit_3 := 
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (htable: Z) (id_map: Z) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (bytes: (@list Z)) (PreH1 : (0 <= id_pre)) (PreH2 : (id_pre < (m.(idmax) ))) (PreH3 : (0 <= (id_pre ÷ 8 ))) (PreH4 : ((id_pre ÷ 8 ) < (((m.(idmax) ) + 7 ) ÷ 8 ))) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (manager_callee_id_max = (m.(idmax) ))) (PreH8 : (manager_callee_hoffset = (m.(hoffset) ))) (PreH9 : (0 <= id_pre)) (PreH10 : (id_pre < (m.(idmax) ))) ,
  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ (0 <= id_pre) ” 
  &&  “ (id_pre < (m.(idmax) )) ” 
  &&  “ (0 <= (id_pre ÷ 8 )) ” 
  &&  “ ((id_pre ÷ 8 ) < (((m.(idmax) ) + 7 ) ÷ 8 )) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (manager_callee_id_max = (m.(idmax) )) ” 
  &&  “ (manager_callee_hoffset = (m.(hoffset) )) ” 
  &&  “ (0 <= id_pre) ” 
  &&  “ (id_pre < (m.(idmax) )) ”
  &&  (((id_map + ((id_pre ÷ 8 ) * sizeof(UCHAR)))) # UChar  |->_)
  **  (UCharArray.missing_i id_map (id_pre ÷ 8 ) 0 (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
.

Definition FreeId_which_implies_wit_1 := 
(
forall (manager_pre: Z) (m: idmanager) (id: Z) (PreH1 : (0 <= id)) (PreH2 : (id < (m.(idmax) ))) ,
  (store_idmanager m manager_pre )
|--
  EX (htable: Z)  (id_map: Z)  (manager_pre_hoffset: Z)  (manager_pre_id_max: Z)  (bytes: (@list Z)) ,
  “ (0 <= id) ” 
  &&  “ (id < (m.(idmax) )) ” 
  &&  “ (0 <= (id ÷ 8 )) ” 
  &&  “ ((id ÷ 8 ) < (((m.(idmax) ) + 7 ) ÷ 8 )) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes ) ” 
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
forall (manager_pre: Z) (m: idmanager) (id: Z) (PreH1 : (0 <= id)) (PreH2 : (id < (m.(idmax) ))) ,
  (store_idmanager m manager_pre )
|--
  EX (htable: Z)  (id_map: Z)  (bytes: (@list Z)) ,
  “ (0 <= id) ” 
  &&  “ (id < (m.(idmax) )) ” 
  &&  “ (0 <= (id ÷ 8 )) ” 
  &&  “ ((id ÷ 8 ) < (((m.(idmax) ) + 7 ) ÷ 8 )) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ”
  &&  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> (m.(idmax) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> (m.(hoffset) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
).

Module Type VC_Correct.

Axiom proof_of_FreeId_safety_wit_1 : FreeId_safety_wit_1.
Axiom proof_of_FreeId_safety_wit_2 : FreeId_safety_wit_2.
Axiom proof_of_FreeId_safety_wit_3 : FreeId_safety_wit_3.
Axiom proof_of_FreeId_safety_wit_4 : FreeId_safety_wit_4.
Axiom proof_of_FreeId_safety_wit_5 : FreeId_safety_wit_5.
Axiom proof_of_FreeId_safety_wit_6 : FreeId_safety_wit_6.
Axiom proof_of_FreeId_return_wit_1 : FreeId_return_wit_1.
Axiom proof_of_FreeId_partial_solve_wit_1_pure : FreeId_partial_solve_wit_1_pure.
Axiom proof_of_FreeId_partial_solve_wit_1 : FreeId_partial_solve_wit_1.
Axiom proof_of_FreeId_partial_solve_wit_2 : FreeId_partial_solve_wit_2.
Axiom proof_of_FreeId_partial_solve_wit_3 : FreeId_partial_solve_wit_3.
Axiom proof_of_FreeId_which_implies_wit_1 : FreeId_which_implies_wit_1.

End VC_Correct.
