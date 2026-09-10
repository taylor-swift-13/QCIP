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

(*----- Function GetObj -----*)

Definition GetObj_safety_wit_1 := 
(
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (id_map: Z) (htable: Z) (bytes: (@list Z)) (PreH1 : (0 <= id_pre)) (PreH2 : (id_pre < (m.(idmax) ))) (PreH3 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH4 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH5 : (manager_callee_id_max = (m.(idmax) ))) (PreH6 : (manager_callee_hoffset = (m.(hoffset) ))) (PreH7 : (0 <= id_pre)) (PreH8 : (id_pre < (m.(idmax) ))) ,
  ((( &( "head" ) )) # Ptr  |->_)
  **  ((( &( "id" ) )) # UShort  |-> id_pre)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ ((id_pre <> (INT_MIN)) \/ (manager_callee_hoffset <> (-1))) ” 
  &&  “ (manager_callee_hoffset <> 0) ”
) \/
(
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (id_map: Z) (htable: Z) (bytes: (@list Z)) (PreH1 : (0 <= id_pre)) (PreH2 : (id_pre < (m.(idmax) ))) (PreH3 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH4 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH5 : (manager_callee_id_max = (m.(idmax) ))) (PreH6 : (manager_callee_hoffset = (m.(hoffset) ))) (PreH7 : (0 <= id_pre)) (PreH8 : (id_pre < (m.(idmax) ))) ,
  ((( &( "head" ) )) # Ptr  |->_)
  **  ((( &( "id" ) )) # UShort  |-> id_pre)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ ((id_pre <> (INT_MIN)) \/ (manager_callee_hoffset <> (-1))) ” 
  &&  “ (manager_callee_hoffset <> 0) ”
).

Definition GetObj_safety_wit_1_split_goal_1 := 
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (id_map: Z) (htable: Z) (bytes: (@list Z)) (PreH1 : (0 <= id_pre)) (PreH2 : (id_pre < (m.(idmax) ))) (PreH3 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH4 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH5 : (manager_callee_id_max = (m.(idmax) ))) (PreH6 : (manager_callee_hoffset = (m.(hoffset) ))) (PreH7 : (0 <= id_pre)) (PreH8 : (id_pre < (m.(idmax) ))) ,
  ((( &( "head" ) )) # Ptr  |->_)
  **  ((( &( "id" ) )) # UShort  |-> id_pre)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ ((id_pre <> (INT_MIN)) \/ (manager_callee_hoffset <> (-1))) ”
.

Definition GetObj_safety_wit_1_split_goal_2 := 
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (id_map: Z) (htable: Z) (bytes: (@list Z)) (PreH1 : (0 <= id_pre)) (PreH2 : (id_pre < (m.(idmax) ))) (PreH3 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH4 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH5 : (manager_callee_id_max = (m.(idmax) ))) (PreH6 : (manager_callee_hoffset = (m.(hoffset) ))) (PreH7 : (0 <= id_pre)) (PreH8 : (id_pre < (m.(idmax) ))) ,
  ((( &( "head" ) )) # Ptr  |->_)
  **  ((( &( "id" ) )) # UShort  |-> id_pre)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ (manager_callee_hoffset <> 0) ”
.

Definition GetObj_safety_wit_2 := 
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (id_map: Z) (htable: Z) (bytes: (@list Z)) (PreH1 : (0 <= id_pre)) (PreH2 : (id_pre < (m.(idmax) ))) (PreH3 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH4 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH5 : (manager_callee_id_max = (m.(idmax) ))) (PreH6 : (manager_callee_hoffset = (m.(hoffset) ))) (PreH7 : (0 <= id_pre)) (PreH8 : (id_pre < (m.(idmax) ))) ,
  ((( &( "node" ) )) # Ptr  |->_)
  **  ((( &( "head" ) )) # Ptr  |-> (htable + ((id_pre % ( manager_callee_hoffset ) ) * sizeof( "SysDoubleLinklistNode" ))))
  **  ((( &( "id" ) )) # UShort  |-> id_pre)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition GetObj_safety_wit_3 := 
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (id_map: Z) (htable: Z) (bytes: (@list Z)) (PreH1 : (0 <= id_pre)) (PreH2 : (id_pre < (m.(idmax) ))) (PreH3 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH4 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH5 : (manager_callee_id_max = (m.(idmax) ))) (PreH6 : (manager_callee_hoffset = (m.(hoffset) ))) (PreH7 : (0 <= id_pre)) (PreH8 : (id_pre < (m.(idmax) ))) ,
  ((( &( "idnode" ) )) # Ptr  |->_)
  **  ((( &( "node" ) )) # Ptr  |-> 0)
  **  ((( &( "head" ) )) # Ptr  |-> (htable + ((id_pre % ( manager_callee_hoffset ) ) * sizeof( "SysDoubleLinklistNode" ))))
  **  ((( &( "id" ) )) # UShort  |-> id_pre)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition GetObj_safety_wit_4_linked_bucket := 
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (id_map: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (prev: Z) (next: Z) (PreH1 : (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH2 : ((htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH3 : (0 = 0)) (PreH4 : (0 = 0)) (PreH5 : (0 <= id_pre)) (PreH6 : (id_pre < (m.(idmax) ))) (PreH7 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH8 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH9 : ((map (getData) (nodes)) = bucket)) (PreH10 : (prev <> 0)) (PreH11 : (next <> 0)) (PreH12 : ((m.(idmax) ) = (m.(idmax) ))) (PreH13 : ((m.(hoffset) ) = (m.(hoffset) ))) (PreH14 : (0 <= id_pre)) (PreH15 : (id_pre < (m.(idmax) ))) (PreH16 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH17 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH18 : (manager_callee_id_max = (m.(idmax) ))) (PreH19 : (manager_callee_hoffset = (m.(hoffset) ))) (PreH20 : (0 <= id_pre)) (PreH21 : (id_pre < (m.(idmax) ))) ,
  ((( &( "id" ) )) # UShort  |-> id_pre)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((( &( "head" ) )) # Ptr  |-> (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> (m.(hoffset) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((( &( "node" ) )) # Ptr  |-> 0)
  **  ((( &( "idnode" ) )) # Ptr  |-> 0)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> (m.(idmax) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&(((htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&(((htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (dllseg (store_idnode ((m.(storeA) ))) next (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) prev nodes )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition GetObj_safety_wit_5_empty_bucket := 
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (id_map: Z) (htable: Z) (bytes: (@list Z)) (head_node_next: Z) (head_node_prev: Z) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (prev: Z) (next: Z) (PreH1 : (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH2 : ((htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH3 : (0 = 0)) (PreH4 : (0 = 0)) (PreH5 : (0 <= id_pre)) (PreH6 : (id_pre < (m.(idmax) ))) (PreH7 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH8 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH9 : (bucket = (@nil Z))) (PreH10 : (nodes = (@nil (@DL_Node Z)))) (PreH11 : ((map (getData) (nodes)) = bucket)) (PreH12 : (prev = 0)) (PreH13 : (next = 0)) (PreH14 : ((m.(idmax) ) = (m.(idmax) ))) (PreH15 : ((m.(hoffset) ) = (m.(hoffset) ))) (PreH16 : (head_node_prev = 0)) (PreH17 : (head_node_next = 0)) (PreH18 : (0 <= id_pre)) (PreH19 : (id_pre < (m.(idmax) ))) (PreH20 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH21 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH22 : (manager_callee_id_max = (m.(idmax) ))) (PreH23 : (manager_callee_hoffset = (m.(hoffset) ))) (PreH24 : (0 <= id_pre)) (PreH25 : (id_pre < (m.(idmax) ))) ,
  ((( &( "id" ) )) # UShort  |-> id_pre)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((( &( "head" ) )) # Ptr  |-> (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> (m.(hoffset) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((( &( "node" ) )) # Ptr  |-> 0)
  **  ((( &( "idnode" ) )) # Ptr  |-> 0)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> (m.(idmax) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&(((htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> head_node_prev)
  **  ((&(((htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_node_next)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition GetObj_safety_wit_6_linked_bucket := 
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (id_map: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (prev: Z) (next: Z) (PreH1 : (prev = 0)) (PreH2 : (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH3 : ((htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH4 : (0 = 0)) (PreH5 : (0 = 0)) (PreH6 : (0 <= id_pre)) (PreH7 : (id_pre < (m.(idmax) ))) (PreH8 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH9 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH10 : ((map (getData) (nodes)) = bucket)) (PreH11 : (prev <> 0)) (PreH12 : (next <> 0)) (PreH13 : ((m.(idmax) ) = (m.(idmax) ))) (PreH14 : ((m.(hoffset) ) = (m.(hoffset) ))) (PreH15 : (0 <= id_pre)) (PreH16 : (id_pre < (m.(idmax) ))) (PreH17 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH18 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH19 : (manager_callee_id_max = (m.(idmax) ))) (PreH20 : (manager_callee_hoffset = (m.(hoffset) ))) (PreH21 : (0 <= id_pre)) (PreH22 : (id_pre < (m.(idmax) ))) ,
  ((( &( "id" ) )) # UShort  |-> id_pre)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((( &( "head" ) )) # Ptr  |-> (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> (m.(hoffset) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((( &( "node" ) )) # Ptr  |-> 0)
  **  ((( &( "idnode" ) )) # Ptr  |-> 0)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> (m.(idmax) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&(((htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&(((htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (dllseg (store_idnode ((m.(storeA) ))) next (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) prev nodes )
|--
  “ False ”
.

Definition GetObj_safety_wit_7_empty_bucket := 
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (id_map: Z) (htable: Z) (bytes: (@list Z)) (head_node_next: Z) (head_node_prev: Z) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (prev: Z) (next: Z) (PreH1 : (head_node_prev <> 0)) (PreH2 : (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH3 : ((htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH4 : (0 = 0)) (PreH5 : (0 = 0)) (PreH6 : (0 <= id_pre)) (PreH7 : (id_pre < (m.(idmax) ))) (PreH8 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH9 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH10 : (bucket = (@nil Z))) (PreH11 : (nodes = (@nil (@DL_Node Z)))) (PreH12 : ((map (getData) (nodes)) = bucket)) (PreH13 : (prev = 0)) (PreH14 : (next = 0)) (PreH15 : ((m.(idmax) ) = (m.(idmax) ))) (PreH16 : ((m.(hoffset) ) = (m.(hoffset) ))) (PreH17 : (head_node_prev = 0)) (PreH18 : (head_node_next = 0)) (PreH19 : (0 <= id_pre)) (PreH20 : (id_pre < (m.(idmax) ))) (PreH21 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH22 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH23 : (manager_callee_id_max = (m.(idmax) ))) (PreH24 : (manager_callee_hoffset = (m.(hoffset) ))) (PreH25 : (0 <= id_pre)) (PreH26 : (id_pre < (m.(idmax) ))) ,
  ((( &( "id" ) )) # UShort  |-> id_pre)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((( &( "head" ) )) # Ptr  |-> (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> (m.(hoffset) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((( &( "node" ) )) # Ptr  |-> 0)
  **  ((( &( "idnode" ) )) # Ptr  |-> 0)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> (m.(idmax) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&(((htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> head_node_prev)
  **  ((&(((htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_node_next)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
|--
  “ False ”
.

Definition GetObj_safety_wit_8_empty_bucket := 
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (id_map: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (head: Z) (node: Z) (idnode: Z) (manager_id_max: Z) (manager_hoffset: Z) (PreH1 : (head = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH2 : (node = 0)) (PreH3 : (idnode = 0)) (PreH4 : (0 <= id_pre)) (PreH5 : (id_pre < (m.(idmax) ))) (PreH6 : (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH7 : (bucket = (@nil Z))) (PreH8 : (nodes = (@nil (@DL_Node Z)))) (PreH9 : ((map (getData) (nodes)) = bucket)) (PreH10 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH11 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH12 : (manager_id_max = (m.(idmax) ))) (PreH13 : (manager_hoffset = (m.(hoffset) ))) ,
  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((( &( "id" ) )) # UShort  |-> id_pre)
  **  ((( &( "head" ) )) # Ptr  |-> head)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((( &( "node" ) )) # Ptr  |-> node)
  **  ((( &( "idnode" ) )) # Ptr  |-> idnode)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (store_dll (store_idnode ((m.(storeA) ))) head nodes )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition GetObj_safety_wit_9_linked_bucket := 
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (id_map: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (prefix: (@list (@DL_Node Z))) (suffix: (@list (@DL_Node Z))) (first: Z) (last: Z) (prev_cur: Z) (node_id: Z) (node_next: Z) (rest: (@list (@DL_Node Z))) (idnode: Z) (node: Z) (head: Z) (manager_id_max: Z) (manager_hoffset: Z) (PreH1 : (node_id <> id_pre)) (PreH2 : (&((idnode)  # "IdNode" ->ₛ "link") = node)) (PreH3 : (suffix = (cons ((Build_DL_Node (node_id) (node))) (rest)))) (PreH4 : (head = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH5 : (0 <= id_pre)) (PreH6 : (id_pre < (m.(idmax) ))) (PreH7 : (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH8 : (nodes = (app (prefix) (suffix)))) (PreH9 : (idnodes_no_id id_pre prefix )) (PreH10 : ((map (getData) (nodes)) = bucket)) (PreH11 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH12 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH13 : (idmanager_storeA m idnode node_id )) (PreH14 : (manager_id_max = (m.(idmax) ))) (PreH15 : (manager_hoffset = (m.(hoffset) ))) ,
  ((( &( "idnode" ) )) # Ptr  |-> idnode)
  **  ((( &( "node" ) )) # Ptr  |-> node)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((( &( "id" ) )) # UShort  |-> id_pre)
  **  ((( &( "head" ) )) # Ptr  |-> head)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((node)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev_cur)
  **  ((&((node)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  ((&((idnode)  # "IdNode" ->ₛ "id")) # UShort  |-> node_id)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (dllseg (store_idnode ((m.(storeA) ))) first head node prev_cur prefix )
  **  (dllseg (store_idnode ((m.(storeA) ))) node_next node head last rest )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition GetObj_entail_wit_1_empty_bucket := 
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (id_map: Z) (htable: Z) (bytes: (@list Z)) (head_node_next: Z) (head_node_prev: Z) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (prev: Z) (next: Z) (PreH1 : (head_node_prev = 0)) (PreH2 : (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH3 : (0 <= id_pre)) (PreH4 : (id_pre < (m.(idmax) ))) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (bucket = (@nil Z))) (PreH8 : (nodes = (@nil (@DL_Node Z)))) (PreH9 : ((map (getData) (nodes)) = bucket)) (PreH10 : (prev = 0)) (PreH11 : (next = 0)) (PreH12 : (head_node_prev = 0)) (PreH13 : (head_node_next = 0)) (PreH14 : (0 <= id_pre)) (PreH15 : (id_pre < (m.(idmax) ))) (PreH16 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH17 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH18 : (manager_callee_id_max = (m.(idmax) ))) (PreH19 : (manager_callee_hoffset = (m.(hoffset) ))) (PreH20 : (0 <= id_pre)) (PreH21 : (id_pre < (m.(idmax) ))) ,
  (store_dll (store_idnode ((m.(storeA) ))) (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) (@nil (@DL_Node Z)) )
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> (m.(hoffset) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> (m.(idmax) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
|--
  EX (manager_hoffset: Z)  (manager_id_max: Z) ,
  “ ((htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" )))) ” 
  &&  “ (0 = 0) ” 
  &&  “ (0 = 0) ” 
  &&  “ (0 <= id_pre) ” 
  &&  “ (id_pre < (m.(idmax) )) ” 
  &&  “ (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z)))) ” 
  &&  “ (bucket = (@nil Z)) ” 
  &&  “ (nodes = (@nil (@DL_Node Z))) ” 
  &&  “ ((map (getData) (nodes)) = bucket) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (manager_id_max = (m.(idmax) )) ” 
  &&  “ (manager_hoffset = (m.(hoffset) )) ”
  &&  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (store_dll (store_idnode ((m.(storeA) ))) (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) nodes )
.

Definition GetObj_entail_wit_2_linked_bucket := 
(
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (id_map: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (prev: Z) (next: Z) (PreH1 : (prev <> 0)) (PreH2 : (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH3 : ((htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH4 : (0 = 0)) (PreH5 : (0 = 0)) (PreH6 : (0 <= id_pre)) (PreH7 : (id_pre < (m.(idmax) ))) (PreH8 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH9 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH10 : ((map (getData) (nodes)) = bucket)) (PreH11 : (prev <> 0)) (PreH12 : (next <> 0)) (PreH13 : ((m.(idmax) ) = (m.(idmax) ))) (PreH14 : ((m.(hoffset) ) = (m.(hoffset) ))) (PreH15 : (0 <= id_pre)) (PreH16 : (id_pre < (m.(idmax) ))) (PreH17 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH18 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH19 : (manager_callee_id_max = (m.(idmax) ))) (PreH20 : (manager_callee_hoffset = (m.(hoffset) ))) (PreH21 : (0 <= id_pre)) (PreH22 : (id_pre < (m.(idmax) ))) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> (m.(hoffset) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> (m.(idmax) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&(((htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&(((htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (dllseg (store_idnode ((m.(storeA) ))) next (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) prev nodes )
|--
  EX (manager_hoffset: Z)  (manager_id_max: Z) ,
  “ ((htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" )))) ” 
  &&  “ (0 = 0) ” 
  &&  “ (0 = 0) ” 
  &&  “ (0 <= id_pre) ” 
  &&  “ (id_pre < (m.(idmax) )) ” 
  &&  “ (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z)))) ” 
  &&  “ ((map (getData) (nodes)) = bucket) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (manager_id_max = (m.(idmax) )) ” 
  &&  “ (manager_hoffset = (m.(hoffset) )) ”
  &&  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (store_dll (store_idnode ((m.(storeA) ))) (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) nodes )
) \/
(
forall (id_pre: Z) (m: idmanager) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (prev: Z) (next: Z) (PreH1 : (prev <> 0)) (PreH2 : (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH3 : (0 <= id_pre)) (PreH4 : (id_pre < (m.(idmax) ))) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : ((map (getData) (nodes)) = bucket)) (PreH8 : (prev <> 0)) (PreH9 : (next <> 0)) (PreH10 : (0 <= id_pre)) (PreH11 : (id_pre < (m.(idmax) ))) (PreH12 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH13 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH14 : (manager_callee_id_max = (m.(idmax) ))) (PreH15 : (manager_callee_hoffset = (m.(hoffset) ))) (PreH16 : (0 <= id_pre)) (PreH17 : (id_pre < (m.(idmax) ))) ,
  ((&(((htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&(((htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (dllseg (store_idnode ((m.(storeA) ))) next (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) prev nodes )
|--
  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (store_dll (store_idnode ((m.(storeA) ))) (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) nodes )
).

Definition GetObj_entail_wit_2_linked_bucket_split_goal_spatial := 
forall (id_pre: Z) (m: idmanager) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (prev: Z) (next: Z) (PreH1 : (prev <> 0)) (PreH2 : (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH3 : (0 <= id_pre)) (PreH4 : (id_pre < (m.(idmax) ))) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : ((map (getData) (nodes)) = bucket)) (PreH8 : (prev <> 0)) (PreH9 : (next <> 0)) (PreH10 : (0 <= id_pre)) (PreH11 : (id_pre < (m.(idmax) ))) (PreH12 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH13 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH14 : (manager_callee_id_max = (m.(idmax) ))) (PreH15 : (manager_callee_hoffset = (m.(hoffset) ))) (PreH16 : (0 <= id_pre)) (PreH17 : (id_pre < (m.(idmax) ))) ,
  ((&(((htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&(((htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (dllseg (store_idnode ((m.(storeA) ))) next (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) prev nodes )
|--
  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (store_dll (store_idnode ((m.(storeA) ))) (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) nodes )
.

Definition GetObj_entail_wit_3_linked_bucket := 
(
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (id_map: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (head: Z) (node: Z) (idnode: Z) (manager_id_max_2: Z) (manager_hoffset_2: Z) (PreH1 : (head = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH2 : (node = 0)) (PreH3 : (idnode = 0)) (PreH4 : (0 <= id_pre)) (PreH5 : (id_pre < (m.(idmax) ))) (PreH6 : (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH7 : ((map (getData) (nodes)) = bucket)) (PreH8 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH9 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH10 : (manager_id_max_2 = (m.(idmax) ))) (PreH11 : (manager_hoffset_2 = (m.(hoffset) ))) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max_2)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset_2)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (store_dll (store_idnode ((m.(storeA) ))) head nodes )
|--
  EX (first: Z)  (last: Z)  (manager_hoffset: Z)  (manager_id_max: Z) ,
  “ (head = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" )))) ” 
  &&  “ (node = 0) ” 
  &&  “ (idnode = 0) ” 
  &&  “ (0 <= id_pre) ” 
  &&  “ (id_pre < (m.(idmax) )) ” 
  &&  “ (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z)))) ” 
  &&  “ ((map (getData) (nodes)) = bucket) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (manager_id_max = (m.(idmax) )) ” 
  &&  “ (manager_hoffset = (m.(hoffset) )) ”
  &&  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (dllseg (store_idnode ((m.(storeA) ))) first head head last nodes )
) \/
(
forall (id_pre: Z) (m: idmanager) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (head: Z) (node: Z) (idnode: Z) (manager_id_max_2: Z) (manager_hoffset_2: Z) (PreH1 : (head = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH2 : (node = 0)) (PreH3 : (idnode = 0)) (PreH4 : (0 <= id_pre)) (PreH5 : (id_pre < (m.(idmax) ))) (PreH6 : (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH7 : ((map (getData) (nodes)) = bucket)) (PreH8 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH9 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH10 : (manager_id_max_2 = (m.(idmax) ))) (PreH11 : (manager_hoffset_2 = (m.(hoffset) ))) ,
  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (store_dll (store_idnode ((m.(storeA) ))) head nodes )
|--
  EX (first: Z)  (last: Z) ,
  “ (manager_hoffset_2 = (m.(hoffset) )) ” 
  &&  “ (manager_id_max_2 = (m.(idmax) )) ” 
  &&  “ (manager_hoffset_2 = (m.(hoffset) )) ” 
  &&  “ (manager_id_max_2 = (m.(idmax) )) ” 
  &&  “ (head = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" )))) ” 
  &&  “ (node = 0) ” 
  &&  “ (idnode = 0) ” 
  &&  “ (0 <= id_pre) ” 
  &&  “ (id_pre < (m.(idmax) )) ” 
  &&  “ (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z)))) ” 
  &&  “ ((map (getData) (nodes)) = bucket) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ”
  &&  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (dllseg (store_idnode ((m.(storeA) ))) first head head last nodes )
).

Definition GetObj_entail_wit_4_linked_bucket := 
(
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (id_map: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (first: Z) (last_2: Z) (head: Z) (node: Z) (idnode: Z) (manager_id_max_2: Z) (manager_hoffset_2: Z) (PreH1 : (head = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH2 : (node = 0)) (PreH3 : (idnode = 0)) (PreH4 : (0 <= id_pre)) (PreH5 : (id_pre < (m.(idmax) ))) (PreH6 : (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH7 : ((map (getData) (nodes)) = bucket)) (PreH8 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH9 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH10 : (manager_id_max_2 = (m.(idmax) ))) (PreH11 : (manager_hoffset_2 = (m.(hoffset) ))) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max_2)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset_2)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last_2)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (dllseg (store_idnode ((m.(storeA) ))) first head head last_2 nodes )
|--
  EX (prev_cur: Z)  (first_2: Z)  (last: Z)  (manager_hoffset: Z)  (manager_id_max: Z)  (prefix: (@list (@DL_Node Z)))  (suffix: (@list (@DL_Node Z))) ,
  “ (head = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" )))) ” 
  &&  “ (idnode = 0) ” 
  &&  “ (0 <= id_pre) ” 
  &&  “ (id_pre < (m.(idmax) )) ” 
  &&  “ (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z)))) ” 
  &&  “ (nodes = (app (prefix) (suffix))) ” 
  &&  “ (idnodes_no_id id_pre prefix ) ” 
  &&  “ ((map (getData) (nodes)) = bucket) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (manager_id_max = (m.(idmax) )) ” 
  &&  “ (manager_hoffset = (m.(hoffset) )) ”
  &&  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_2)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (dllseg (store_idnode ((m.(storeA) ))) first_2 head first prev_cur prefix )
  **  (dllseg (store_idnode ((m.(storeA) ))) first prev_cur head last suffix )
) \/
(
forall (id_pre: Z) (m: idmanager) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (first: Z) (last_2: Z) (head: Z) (node: Z) (idnode: Z) (manager_id_max_2: Z) (manager_hoffset_2: Z) (PreH1 : (head = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH2 : (node = 0)) (PreH3 : (idnode = 0)) (PreH4 : (0 <= id_pre)) (PreH5 : (id_pre < (m.(idmax) ))) (PreH6 : (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH7 : ((map (getData) (nodes)) = bucket)) (PreH8 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH9 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH10 : (manager_id_max_2 = (m.(idmax) ))) (PreH11 : (manager_hoffset_2 = (m.(hoffset) ))) ,
  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (dllseg (store_idnode ((m.(storeA) ))) first head head last_2 nodes )
|--
  EX (prev_cur: Z)  (prefix: (@list (@DL_Node Z)))  (suffix: (@list (@DL_Node Z))) ,
  “ (manager_hoffset_2 = (m.(hoffset) )) ” 
  &&  “ (manager_id_max_2 = (m.(idmax) )) ” 
  &&  “ (manager_hoffset_2 = (m.(hoffset) )) ” 
  &&  “ (manager_id_max_2 = (m.(idmax) )) ” 
  &&  “ (head = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" )))) ” 
  &&  “ (idnode = 0) ” 
  &&  “ (0 <= id_pre) ” 
  &&  “ (id_pre < (m.(idmax) )) ” 
  &&  “ (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z)))) ” 
  &&  “ (nodes = (app (prefix) (suffix))) ” 
  &&  “ (idnodes_no_id id_pre prefix ) ” 
  &&  “ ((map (getData) (nodes)) = bucket) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ”
  &&  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (dllseg (store_idnode ((m.(storeA) ))) first head first prev_cur prefix )
  **  (dllseg (store_idnode ((m.(storeA) ))) first prev_cur head last_2 suffix )
).

Definition GetObj_entail_wit_5_linked_bucket := 
(
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (id_map: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (node: Z) (manager_hoffset_2: Z) (manager_id_max_2: Z) (idnode: Z) (head: Z) (prefix: (@list (@DL_Node Z))) (suffix: (@list (@DL_Node Z))) (first: Z) (last: Z) (prev_cur: Z) (PreH1 : (node <> head)) (PreH2 : (head = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH3 : (idnode = 0)) (PreH4 : (0 <= id_pre)) (PreH5 : (id_pre < (m.(idmax) ))) (PreH6 : (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH7 : (nodes = (app (prefix) (suffix)))) (PreH8 : (idnodes_no_id id_pre prefix )) (PreH9 : ((map (getData) (nodes)) = bucket)) (PreH10 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH11 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH12 : (manager_id_max_2 = (m.(idmax) ))) (PreH13 : (manager_hoffset_2 = (m.(hoffset) ))) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max_2)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset_2)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (dllseg (store_idnode ((m.(storeA) ))) first head node prev_cur prefix )
  **  (dllseg (store_idnode ((m.(storeA) ))) node prev_cur head last suffix )
|--
  EX (node_next: Z)  (manager_hoffset: Z)  (manager_id_max: Z)  (node_id: Z)  (rest: (@list (@DL_Node Z))) ,
  “ (suffix = (cons ((Build_DL_Node (node_id) (node))) (rest))) ” 
  &&  “ (head = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" )))) ” 
  &&  “ (idnode = 0) ” 
  &&  “ (0 <= id_pre) ” 
  &&  “ (id_pre < (m.(idmax) )) ” 
  &&  “ (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z)))) ” 
  &&  “ (nodes = (app (prefix) (suffix))) ” 
  &&  “ (idnodes_no_id id_pre prefix ) ” 
  &&  “ ((map (getData) (nodes)) = bucket) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (manager_id_max = (m.(idmax) )) ” 
  &&  “ (manager_hoffset = (m.(hoffset) )) ”
  &&  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((node)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev_cur)
  **  ((&((node)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (dllseg (store_idnode ((m.(storeA) ))) first head node prev_cur prefix )
  **  (store_idnode (m.(storeA) ) node node_id )
  **  (dllseg (store_idnode ((m.(storeA) ))) node_next node head last rest )
) \/
(
forall (id_pre: Z) (m: idmanager) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (node: Z) (manager_hoffset_2: Z) (manager_id_max_2: Z) (idnode: Z) (head: Z) (prefix: (@list (@DL_Node Z))) (suffix: (@list (@DL_Node Z))) (first: Z) (last: Z) (prev_cur: Z) (PreH1 : (node <> head)) (PreH2 : (head = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH3 : (idnode = 0)) (PreH4 : (0 <= id_pre)) (PreH5 : (id_pre < (m.(idmax) ))) (PreH6 : (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH7 : (nodes = (app (prefix) (suffix)))) (PreH8 : (idnodes_no_id id_pre prefix )) (PreH9 : ((map (getData) (nodes)) = bucket)) (PreH10 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH11 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH12 : (manager_id_max_2 = (m.(idmax) ))) (PreH13 : (manager_hoffset_2 = (m.(hoffset) ))) ,
  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (dllseg (store_idnode ((m.(storeA) ))) first head node prev_cur prefix )
  **  (dllseg (store_idnode ((m.(storeA) ))) node prev_cur head last suffix )
|--
  EX (node_next: Z)  (node_id: Z)  (rest: (@list (@DL_Node Z))) ,
  “ (manager_hoffset_2 = (m.(hoffset) )) ” 
  &&  “ (manager_id_max_2 = (m.(idmax) )) ” 
  &&  “ (manager_hoffset_2 = (m.(hoffset) )) ” 
  &&  “ (manager_id_max_2 = (m.(idmax) )) ” 
  &&  “ (suffix = (cons ((Build_DL_Node (node_id) (node))) (rest))) ” 
  &&  “ (head = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" )))) ” 
  &&  “ (idnode = 0) ” 
  &&  “ (0 <= id_pre) ” 
  &&  “ (id_pre < (m.(idmax) )) ” 
  &&  “ (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z)))) ” 
  &&  “ (nodes = (app (prefix) (suffix))) ” 
  &&  “ (idnodes_no_id id_pre prefix ) ” 
  &&  “ ((map (getData) (nodes)) = bucket) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ”
  &&  ((&((node)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev_cur)
  **  ((&((node)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (dllseg (store_idnode ((m.(storeA) ))) first head node prev_cur prefix )
  **  (store_idnode (m.(storeA) ) node node_id )
  **  (dllseg (store_idnode ((m.(storeA) ))) node_next node head last rest )
).

Definition GetObj_entail_wit_6_linked_bucket := 
(
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (id_map: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (prefix: (@list (@DL_Node Z))) (suffix: (@list (@DL_Node Z))) (first: Z) (last: Z) (prev_cur: Z) (node: Z) (head: Z) (idnode: Z) (manager_id_max_2: Z) (manager_hoffset_2: Z) (node_id: Z) (node_next: Z) (rest: (@list (@DL_Node Z))) (retval: Z) (PreH1 : (&((retval)  # "IdNode" ->ₛ "link") = node)) (PreH2 : (suffix = (cons ((Build_DL_Node (node_id) (node))) (rest)))) (PreH3 : (head = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH4 : (idnode = 0)) (PreH5 : (0 <= id_pre)) (PreH6 : (id_pre < (m.(idmax) ))) (PreH7 : (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH8 : (nodes = (app (prefix) (suffix)))) (PreH9 : (idnodes_no_id id_pre prefix )) (PreH10 : ((map (getData) (nodes)) = bucket)) (PreH11 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH12 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH13 : (manager_id_max_2 = (m.(idmax) ))) (PreH14 : (manager_hoffset_2 = (m.(hoffset) ))) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max_2)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset_2)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((node)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev_cur)
  **  ((&((node)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (dllseg (store_idnode ((m.(storeA) ))) first head node prev_cur prefix )
  **  (store_idnode (m.(storeA) ) node node_id )
  **  (dllseg (store_idnode ((m.(storeA) ))) node_next node head last rest )
|--
  EX (manager_hoffset: Z)  (manager_id_max: Z) ,
  “ (&((retval)  # "IdNode" ->ₛ "link") = node) ” 
  &&  “ (suffix = (cons ((Build_DL_Node (node_id) (node))) (rest))) ” 
  &&  “ (head = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" )))) ” 
  &&  “ (0 <= id_pre) ” 
  &&  “ (id_pre < (m.(idmax) )) ” 
  &&  “ (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z)))) ” 
  &&  “ (nodes = (app (prefix) (suffix))) ” 
  &&  “ (idnodes_no_id id_pre prefix ) ” 
  &&  “ ((map (getData) (nodes)) = bucket) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (idmanager_storeA m retval node_id ) ” 
  &&  “ (manager_id_max = (m.(idmax) )) ” 
  &&  “ (manager_hoffset = (m.(hoffset) )) ”
  &&  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((node)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev_cur)
  **  ((&((node)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  ((&((retval)  # "IdNode" ->ₛ "id")) # UShort  |-> node_id)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (dllseg (store_idnode ((m.(storeA) ))) first head node prev_cur prefix )
  **  (dllseg (store_idnode ((m.(storeA) ))) node_next node head last rest )
) \/
(
forall (id_pre: Z) (m: idmanager) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (prefix: (@list (@DL_Node Z))) (suffix: (@list (@DL_Node Z))) (first: Z) (last: Z) (prev_cur: Z) (node: Z) (head: Z) (idnode: Z) (manager_id_max_2: Z) (manager_hoffset_2: Z) (node_id: Z) (node_next: Z) (rest: (@list (@DL_Node Z))) (retval: Z) (PreH1 : (&((retval)  # "IdNode" ->ₛ "link") = node)) (PreH2 : (suffix = (cons ((Build_DL_Node (node_id) (node))) (rest)))) (PreH3 : (head = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH4 : (idnode = 0)) (PreH5 : (0 <= id_pre)) (PreH6 : (id_pre < (m.(idmax) ))) (PreH7 : (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH8 : (nodes = (app (prefix) (suffix)))) (PreH9 : (idnodes_no_id id_pre prefix )) (PreH10 : ((map (getData) (nodes)) = bucket)) (PreH11 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH12 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH13 : (manager_id_max_2 = (m.(idmax) ))) (PreH14 : (manager_hoffset_2 = (m.(hoffset) ))) ,
  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (dllseg (store_idnode ((m.(storeA) ))) first head node prev_cur prefix )
  **  (store_idnode (m.(storeA) ) node node_id )
  **  (dllseg (store_idnode ((m.(storeA) ))) node_next node head last rest )
|--
  “ (idmanager_storeA m retval node_id ) ”
  &&  ((&((retval)  # "IdNode" ->ₛ "id")) # UShort  |-> node_id)
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (dllseg (store_idnode ((m.(storeA) ))) first head node prev_cur prefix )
  **  (dllseg (store_idnode ((m.(storeA) ))) node_next node head last rest )
).

Definition GetObj_entail_wit_6_linked_bucket_split_goal_1 := 
forall (id_pre: Z) (m: idmanager) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (prefix: (@list (@DL_Node Z))) (suffix: (@list (@DL_Node Z))) (first: Z) (last: Z) (prev_cur: Z) (node: Z) (head: Z) (idnode: Z) (manager_id_max_2: Z) (manager_hoffset_2: Z) (node_id: Z) (node_next: Z) (rest: (@list (@DL_Node Z))) (retval: Z) (PreH1 : (&((retval)  # "IdNode" ->ₛ "link") = node)) (PreH2 : (suffix = (cons ((Build_DL_Node (node_id) (node))) (rest)))) (PreH3 : (head = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH4 : (idnode = 0)) (PreH5 : (0 <= id_pre)) (PreH6 : (id_pre < (m.(idmax) ))) (PreH7 : (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH8 : (nodes = (app (prefix) (suffix)))) (PreH9 : (idnodes_no_id id_pre prefix )) (PreH10 : ((map (getData) (nodes)) = bucket)) (PreH11 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH12 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH13 : (manager_id_max_2 = (m.(idmax) ))) (PreH14 : (manager_hoffset_2 = (m.(hoffset) ))) ,
  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (dllseg (store_idnode ((m.(storeA) ))) first head node prev_cur prefix )
  **  (store_idnode (m.(storeA) ) node node_id )
  **  (dllseg (store_idnode ((m.(storeA) ))) node_next node head last rest )
|--
  “ (idmanager_storeA m retval node_id ) ”
.

Definition GetObj_entail_wit_6_linked_bucket_split_goal_spatial := 
forall (id_pre: Z) (m: idmanager) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (prefix: (@list (@DL_Node Z))) (suffix: (@list (@DL_Node Z))) (first: Z) (last: Z) (prev_cur: Z) (node: Z) (head: Z) (idnode: Z) (manager_id_max_2: Z) (manager_hoffset_2: Z) (node_id: Z) (node_next: Z) (rest: (@list (@DL_Node Z))) (retval: Z) (PreH1 : (&((retval)  # "IdNode" ->ₛ "link") = node)) (PreH2 : (suffix = (cons ((Build_DL_Node (node_id) (node))) (rest)))) (PreH3 : (head = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH4 : (idnode = 0)) (PreH5 : (0 <= id_pre)) (PreH6 : (id_pre < (m.(idmax) ))) (PreH7 : (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH8 : (nodes = (app (prefix) (suffix)))) (PreH9 : (idnodes_no_id id_pre prefix )) (PreH10 : ((map (getData) (nodes)) = bucket)) (PreH11 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH12 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH13 : (manager_id_max_2 = (m.(idmax) ))) (PreH14 : (manager_hoffset_2 = (m.(hoffset) ))) ,
  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (dllseg (store_idnode ((m.(storeA) ))) first head node prev_cur prefix )
  **  (store_idnode (m.(storeA) ) node node_id )
  **  (dllseg (store_idnode ((m.(storeA) ))) node_next node head last rest )
|--
  ((&((retval)  # "IdNode" ->ₛ "id")) # UShort  |-> node_id)
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (dllseg (store_idnode ((m.(storeA) ))) first head node prev_cur prefix )
  **  (dllseg (store_idnode ((m.(storeA) ))) node_next node head last rest )
.

Definition GetObj_entail_wit_7_linked_bucket := 
(
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (id_map: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (prefix_2: (@list (@DL_Node Z))) (suffix_2: (@list (@DL_Node Z))) (first_2: Z) (last_2: Z) (prev_cur_2: Z) (node_id: Z) (node_next: Z) (rest: (@list (@DL_Node Z))) (idnode: Z) (node: Z) (head: Z) (manager_id_max_2: Z) (manager_hoffset_2: Z) (PreH1 : (node_id <> id_pre)) (PreH2 : (&((idnode)  # "IdNode" ->ₛ "link") = node)) (PreH3 : (suffix_2 = (cons ((Build_DL_Node (node_id) (node))) (rest)))) (PreH4 : (head = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH5 : (0 <= id_pre)) (PreH6 : (id_pre < (m.(idmax) ))) (PreH7 : (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH8 : (nodes = (app (prefix_2) (suffix_2)))) (PreH9 : (idnodes_no_id id_pre prefix_2 )) (PreH10 : ((map (getData) (nodes)) = bucket)) (PreH11 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH12 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH13 : (idmanager_storeA m idnode node_id )) (PreH14 : (manager_id_max_2 = (m.(idmax) ))) (PreH15 : (manager_hoffset_2 = (m.(hoffset) ))) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max_2)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset_2)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last_2)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_2)
  **  ((&((node)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev_cur_2)
  **  ((&((node)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  ((&((idnode)  # "IdNode" ->ₛ "id")) # UShort  |-> node_id)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (dllseg (store_idnode ((m.(storeA) ))) first_2 head node prev_cur_2 prefix_2 )
  **  (dllseg (store_idnode ((m.(storeA) ))) node_next node head last_2 rest )
|--
  EX (prev_cur: Z)  (first: Z)  (last: Z)  (manager_hoffset: Z)  (manager_id_max: Z)  (prefix: (@list (@DL_Node Z)))  (suffix: (@list (@DL_Node Z))) ,
  “ (head = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" )))) ” 
  &&  “ (0 = 0) ” 
  &&  “ (0 <= id_pre) ” 
  &&  “ (id_pre < (m.(idmax) )) ” 
  &&  “ (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z)))) ” 
  &&  “ (nodes = (app (prefix) (suffix))) ” 
  &&  “ (idnodes_no_id id_pre prefix ) ” 
  &&  “ ((map (getData) (nodes)) = bucket) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (manager_id_max = (m.(idmax) )) ” 
  &&  “ (manager_hoffset = (m.(hoffset) )) ”
  &&  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (dllseg (store_idnode ((m.(storeA) ))) first head node_next prev_cur prefix )
  **  (dllseg (store_idnode ((m.(storeA) ))) node_next prev_cur head last suffix )
) \/
(
forall (id_pre: Z) (m: idmanager) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (prefix_2: (@list (@DL_Node Z))) (suffix_2: (@list (@DL_Node Z))) (first_2: Z) (last_2: Z) (prev_cur_2: Z) (node_id: Z) (node_next: Z) (rest: (@list (@DL_Node Z))) (idnode: Z) (node: Z) (head: Z) (manager_id_max_2: Z) (manager_hoffset_2: Z) (PreH1 : (node_id <> id_pre)) (PreH2 : (&((idnode)  # "IdNode" ->ₛ "link") = node)) (PreH3 : (suffix_2 = (cons ((Build_DL_Node (node_id) (node))) (rest)))) (PreH4 : (head = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH5 : (0 <= id_pre)) (PreH6 : (id_pre < (m.(idmax) ))) (PreH7 : (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH8 : (nodes = (app (prefix_2) (suffix_2)))) (PreH9 : (idnodes_no_id id_pre prefix_2 )) (PreH10 : ((map (getData) (nodes)) = bucket)) (PreH11 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH12 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH13 : (idmanager_storeA m idnode node_id )) (PreH14 : (manager_id_max_2 = (m.(idmax) ))) (PreH15 : (manager_hoffset_2 = (m.(hoffset) ))) ,
  ((&((node)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev_cur_2)
  **  ((&((node)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  ((&((idnode)  # "IdNode" ->ₛ "id")) # UShort  |-> node_id)
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (dllseg (store_idnode ((m.(storeA) ))) first_2 head node prev_cur_2 prefix_2 )
  **  (dllseg (store_idnode ((m.(storeA) ))) node_next node head last_2 rest )
|--
  EX (prev_cur: Z)  (prefix: (@list (@DL_Node Z)))  (suffix: (@list (@DL_Node Z))) ,
  “ (manager_hoffset_2 = (m.(hoffset) )) ” 
  &&  “ (manager_id_max_2 = (m.(idmax) )) ” 
  &&  “ (manager_hoffset_2 = (m.(hoffset) )) ” 
  &&  “ (manager_id_max_2 = (m.(idmax) )) ” 
  &&  “ (head = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" )))) ” 
  &&  “ (0 <= id_pre) ” 
  &&  “ (id_pre < (m.(idmax) )) ” 
  &&  “ (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z)))) ” 
  &&  “ (nodes = (app (prefix) (suffix))) ” 
  &&  “ (idnodes_no_id id_pre prefix ) ” 
  &&  “ ((map (getData) (nodes)) = bucket) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ”
  &&  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (dllseg (store_idnode ((m.(storeA) ))) first_2 head node_next prev_cur prefix )
  **  (dllseg (store_idnode ((m.(storeA) ))) node_next prev_cur head last_2 suffix )
).

Definition GetObj_return_wit_1_linked_bucket := 
(
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (id_map: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (node: Z) (prev_cur: Z) (first: Z) (last: Z) (manager_hoffset: Z) (manager_id_max: Z) (prefix: (@list (@DL_Node Z))) (suffix: (@list (@DL_Node Z))) (idnode: Z) (head: Z) (PreH1 : (node = head)) (PreH2 : (head = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH3 : (idnode = 0)) (PreH4 : (0 <= id_pre)) (PreH5 : (id_pre < (m.(idmax) ))) (PreH6 : (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH7 : (nodes = (app (prefix) (suffix)))) (PreH8 : (idnodes_no_id id_pre prefix )) (PreH9 : ((map (getData) (nodes)) = bucket)) (PreH10 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH11 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH12 : (manager_id_max = (m.(idmax) ))) (PreH13 : (manager_hoffset = (m.(hoffset) ))) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (dllseg (store_idnode ((m.(storeA) ))) first head node prev_cur prefix )
  **  (dllseg (store_idnode ((m.(storeA) ))) node prev_cur head last suffix )
|--
  (store_idmanager_getobj_post m manager_pre id_pre idnode )
) \/
(
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (id_map: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (node: Z) (prev_cur: Z) (first: Z) (last: Z) (manager_hoffset: Z) (manager_id_max: Z) (prefix: (@list (@DL_Node Z))) (suffix: (@list (@DL_Node Z))) (idnode: Z) (head: Z) (PreH1 : (node = head)) (PreH2 : (head = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH3 : (idnode = 0)) (PreH4 : (0 <= id_pre)) (PreH5 : (id_pre < (m.(idmax) ))) (PreH6 : (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH7 : (nodes = (app (prefix) (suffix)))) (PreH8 : (idnodes_no_id id_pre prefix )) (PreH9 : ((map (getData) (nodes)) = bucket)) (PreH10 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH11 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH12 : (manager_id_max = (m.(idmax) ))) (PreH13 : (manager_hoffset = (m.(hoffset) ))) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (dllseg (store_idnode ((m.(storeA) ))) first head node prev_cur prefix )
  **  (dllseg (store_idnode ((m.(storeA) ))) node prev_cur head last suffix )
|--
  (store_idmanager_getobj_post m manager_pre id_pre idnode )
).

Definition GetObj_return_wit_1_linked_bucket_split_goal_spatial := 
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (id_map: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (node: Z) (prev_cur: Z) (first: Z) (last: Z) (manager_hoffset: Z) (manager_id_max: Z) (prefix: (@list (@DL_Node Z))) (suffix: (@list (@DL_Node Z))) (idnode: Z) (head: Z) (PreH1 : (node = head)) (PreH2 : (head = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH3 : (idnode = 0)) (PreH4 : (0 <= id_pre)) (PreH5 : (id_pre < (m.(idmax) ))) (PreH6 : (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH7 : (nodes = (app (prefix) (suffix)))) (PreH8 : (idnodes_no_id id_pre prefix )) (PreH9 : ((map (getData) (nodes)) = bucket)) (PreH10 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH11 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH12 : (manager_id_max = (m.(idmax) ))) (PreH13 : (manager_hoffset = (m.(hoffset) ))) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (dllseg (store_idnode ((m.(storeA) ))) first head node prev_cur prefix )
  **  (dllseg (store_idnode ((m.(storeA) ))) node prev_cur head last suffix )
|--
  (store_idmanager_getobj_post m manager_pre id_pre idnode )
.

Definition GetObj_return_wit_2_linked_bucket := 
(
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (id_map: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (prefix: (@list (@DL_Node Z))) (suffix: (@list (@DL_Node Z))) (first: Z) (last: Z) (prev_cur: Z) (node_id: Z) (node_next: Z) (rest: (@list (@DL_Node Z))) (idnode: Z) (node: Z) (head: Z) (manager_id_max: Z) (manager_hoffset: Z) (PreH1 : (node_id = id_pre)) (PreH2 : (&((idnode)  # "IdNode" ->ₛ "link") = node)) (PreH3 : (suffix = (cons ((Build_DL_Node (node_id) (node))) (rest)))) (PreH4 : (head = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH5 : (0 <= id_pre)) (PreH6 : (id_pre < (m.(idmax) ))) (PreH7 : (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH8 : (nodes = (app (prefix) (suffix)))) (PreH9 : (idnodes_no_id id_pre prefix )) (PreH10 : ((map (getData) (nodes)) = bucket)) (PreH11 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH12 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH13 : (idmanager_storeA m idnode node_id )) (PreH14 : (manager_id_max = (m.(idmax) ))) (PreH15 : (manager_hoffset = (m.(hoffset) ))) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((node)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev_cur)
  **  ((&((node)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  ((&((idnode)  # "IdNode" ->ₛ "id")) # UShort  |-> node_id)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (dllseg (store_idnode ((m.(storeA) ))) first head node prev_cur prefix )
  **  (dllseg (store_idnode ((m.(storeA) ))) node_next node head last rest )
|--
  (store_idmanager_getobj_post m manager_pre id_pre idnode )
) \/
(
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (id_map: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (prefix: (@list (@DL_Node Z))) (suffix: (@list (@DL_Node Z))) (first: Z) (last: Z) (prev_cur: Z) (node_id: Z) (node_next: Z) (rest: (@list (@DL_Node Z))) (idnode: Z) (node: Z) (head: Z) (manager_id_max: Z) (manager_hoffset: Z) (PreH1 : (node_id = id_pre)) (PreH2 : (&((idnode)  # "IdNode" ->ₛ "link") = node)) (PreH3 : (suffix = (cons ((Build_DL_Node (node_id) (node))) (rest)))) (PreH4 : (head = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH5 : (0 <= id_pre)) (PreH6 : (id_pre < (m.(idmax) ))) (PreH7 : (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH8 : (nodes = (app (prefix) (suffix)))) (PreH9 : (idnodes_no_id id_pre prefix )) (PreH10 : ((map (getData) (nodes)) = bucket)) (PreH11 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH12 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH13 : (idmanager_storeA m idnode node_id )) (PreH14 : (manager_id_max = (m.(idmax) ))) (PreH15 : (manager_hoffset = (m.(hoffset) ))) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((node)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev_cur)
  **  ((&((node)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  ((&((idnode)  # "IdNode" ->ₛ "id")) # UShort  |-> node_id)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (dllseg (store_idnode ((m.(storeA) ))) first head node prev_cur prefix )
  **  (dllseg (store_idnode ((m.(storeA) ))) node_next node head last rest )
|--
  (store_idmanager_getobj_post m manager_pre id_pre idnode )
).

Definition GetObj_return_wit_2_linked_bucket_split_goal_spatial := 
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (id_map: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (prefix: (@list (@DL_Node Z))) (suffix: (@list (@DL_Node Z))) (first: Z) (last: Z) (prev_cur: Z) (node_id: Z) (node_next: Z) (rest: (@list (@DL_Node Z))) (idnode: Z) (node: Z) (head: Z) (manager_id_max: Z) (manager_hoffset: Z) (PreH1 : (node_id = id_pre)) (PreH2 : (&((idnode)  # "IdNode" ->ₛ "link") = node)) (PreH3 : (suffix = (cons ((Build_DL_Node (node_id) (node))) (rest)))) (PreH4 : (head = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH5 : (0 <= id_pre)) (PreH6 : (id_pre < (m.(idmax) ))) (PreH7 : (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH8 : (nodes = (app (prefix) (suffix)))) (PreH9 : (idnodes_no_id id_pre prefix )) (PreH10 : ((map (getData) (nodes)) = bucket)) (PreH11 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH12 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH13 : (idmanager_storeA m idnode node_id )) (PreH14 : (manager_id_max = (m.(idmax) ))) (PreH15 : (manager_hoffset = (m.(hoffset) ))) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((node)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev_cur)
  **  ((&((node)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  ((&((idnode)  # "IdNode" ->ₛ "id")) # UShort  |-> node_id)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (dllseg (store_idnode ((m.(storeA) ))) first head node prev_cur prefix )
  **  (dllseg (store_idnode ((m.(storeA) ))) node_next node head last rest )
|--
  (store_idmanager_getobj_post m manager_pre id_pre idnode )
.

Definition GetObj_return_wit_3_empty_bucket := 
(
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (id_map: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (head: Z) (node: Z) (idnode: Z) (manager_id_max: Z) (manager_hoffset: Z) (PreH1 : (head = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH2 : (node = 0)) (PreH3 : (idnode = 0)) (PreH4 : (0 <= id_pre)) (PreH5 : (id_pre < (m.(idmax) ))) (PreH6 : (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH7 : (bucket = (@nil Z))) (PreH8 : (nodes = (@nil (@DL_Node Z)))) (PreH9 : ((map (getData) (nodes)) = bucket)) (PreH10 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH11 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH12 : (manager_id_max = (m.(idmax) ))) (PreH13 : (manager_hoffset = (m.(hoffset) ))) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (store_dll (store_idnode ((m.(storeA) ))) head nodes )
|--
  (store_idmanager_getobj_post m manager_pre id_pre 0 )
) \/
(
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (id_map: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (head: Z) (node: Z) (idnode: Z) (manager_id_max: Z) (manager_hoffset: Z) (PreH1 : (head = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH2 : (node = 0)) (PreH3 : (idnode = 0)) (PreH4 : (0 <= id_pre)) (PreH5 : (id_pre < (m.(idmax) ))) (PreH6 : (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH7 : (bucket = (@nil Z))) (PreH8 : (nodes = (@nil (@DL_Node Z)))) (PreH9 : ((map (getData) (nodes)) = bucket)) (PreH10 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH11 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH12 : (manager_id_max = (m.(idmax) ))) (PreH13 : (manager_hoffset = (m.(hoffset) ))) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (store_dll (store_idnode ((m.(storeA) ))) head nodes )
|--
  (store_idmanager_getobj_post m manager_pre id_pre 0 )
).

Definition GetObj_return_wit_3_empty_bucket_split_goal_spatial := 
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (id_map: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (head: Z) (node: Z) (idnode: Z) (manager_id_max: Z) (manager_hoffset: Z) (PreH1 : (head = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH2 : (node = 0)) (PreH3 : (idnode = 0)) (PreH4 : (0 <= id_pre)) (PreH5 : (id_pre < (m.(idmax) ))) (PreH6 : (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH7 : (bucket = (@nil Z))) (PreH8 : (nodes = (@nil (@DL_Node Z)))) (PreH9 : ((map (getData) (nodes)) = bucket)) (PreH10 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH11 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH12 : (manager_id_max = (m.(idmax) ))) (PreH13 : (manager_hoffset = (m.(hoffset) ))) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (store_dll (store_idnode ((m.(storeA) ))) head nodes )
|--
  (store_idmanager_getobj_post m manager_pre id_pre 0 )
.

Definition GetObj_partial_solve_wit_1_pure := 
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (PreH1 : (0 <= id_pre)) (PreH2 : (id_pre < (m.(idmax) ))) ,
  ((( &( "id" ) )) # UShort  |-> id_pre)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  (store_idmanager m manager_pre )
|--
  “ (0 <= id_pre) ” 
  &&  “ (id_pre < (m.(idmax) )) ”
.

Definition GetObj_partial_solve_wit_1_aux := 
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (PreH1 : (0 <= id_pre)) (PreH2 : (id_pre < (m.(idmax) ))) ,
  (store_idmanager m manager_pre )
|--
  “ (0 <= id_pre) ” 
  &&  “ (id_pre < (m.(idmax) )) ” 
  &&  “ (0 <= id_pre) ” 
  &&  “ (id_pre < (m.(idmax) )) ”
  &&  (store_idmanager m manager_pre )
.

Definition GetObj_partial_solve_wit_1 := GetObj_partial_solve_wit_1_pure -> GetObj_partial_solve_wit_1_aux.

Definition GetObj_partial_solve_wit_2_pure := 
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (id_map: Z) (htable: Z) (bytes: (@list Z)) (PreH1 : (0 <= id_pre)) (PreH2 : (id_pre < (m.(idmax) ))) (PreH3 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH4 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH5 : (manager_callee_id_max = (m.(idmax) ))) (PreH6 : (manager_callee_hoffset = (m.(hoffset) ))) (PreH7 : (0 <= id_pre)) (PreH8 : (id_pre < (m.(idmax) ))) ,
  ((( &( "idnode" ) )) # Ptr  |-> 0)
  **  ((( &( "node" ) )) # Ptr  |-> 0)
  **  ((( &( "head" ) )) # Ptr  |-> (htable + ((id_pre % ( manager_callee_hoffset ) ) * sizeof( "SysDoubleLinklistNode" ))))
  **  ((( &( "id" ) )) # UShort  |-> id_pre)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ ((htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" )))) ” 
  &&  “ (0 = 0) ” 
  &&  “ (0 = 0) ” 
  &&  “ (0 <= id_pre) ” 
  &&  “ (id_pre < (m.(idmax) )) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ ((m.(idmax) ) = (m.(idmax) )) ” 
  &&  “ ((m.(hoffset) ) = (m.(hoffset) )) ”
.

Definition GetObj_partial_solve_wit_2_aux := 
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (id_map: Z) (htable: Z) (bytes: (@list Z)) (PreH1 : (0 <= id_pre)) (PreH2 : (id_pre < (m.(idmax) ))) (PreH3 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH4 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH5 : (manager_callee_id_max = (m.(idmax) ))) (PreH6 : (manager_callee_hoffset = (m.(hoffset) ))) (PreH7 : (0 <= id_pre)) (PreH8 : (id_pre < (m.(idmax) ))) ,
  ((( &( "head" ) )) # Ptr  |-> (htable + ((id_pre % ( manager_callee_hoffset ) ) * sizeof( "SysDoubleLinklistNode" ))))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  “ ((htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" )))) ” 
  &&  “ (0 = 0) ” 
  &&  “ (0 = 0) ” 
  &&  “ (0 <= id_pre) ” 
  &&  “ (id_pre < (m.(idmax) )) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ ((m.(idmax) ) = (m.(idmax) )) ” 
  &&  “ ((m.(hoffset) ) = (m.(hoffset) )) ” 
  &&  “ (0 <= id_pre) ” 
  &&  “ (id_pre < (m.(idmax) )) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (manager_callee_id_max = (m.(idmax) )) ” 
  &&  “ (manager_callee_hoffset = (m.(hoffset) )) ” 
  &&  “ (0 <= id_pre) ” 
  &&  “ (id_pre < (m.(idmax) )) ”
  &&  ((( &( "head" ) )) # Ptr  |-> (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> (m.(idmax) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> (m.(hoffset) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
.

Definition GetObj_partial_solve_wit_2 := GetObj_partial_solve_wit_2_pure -> GetObj_partial_solve_wit_2_aux.

Definition GetObj_partial_solve_wit_3_empty_bucket := 
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (id_map: Z) (htable: Z) (bytes: (@list Z)) (head_node_next: Z) (head_node_prev: Z) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (prev: Z) (next: Z) (PreH1 : (head_node_prev = 0)) (PreH2 : (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH3 : ((htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH4 : (0 = 0)) (PreH5 : (0 = 0)) (PreH6 : (0 <= id_pre)) (PreH7 : (id_pre < (m.(idmax) ))) (PreH8 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH9 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH10 : (bucket = (@nil Z))) (PreH11 : (nodes = (@nil (@DL_Node Z)))) (PreH12 : ((map (getData) (nodes)) = bucket)) (PreH13 : (prev = 0)) (PreH14 : (next = 0)) (PreH15 : ((m.(idmax) ) = (m.(idmax) ))) (PreH16 : ((m.(hoffset) ) = (m.(hoffset) ))) (PreH17 : (head_node_prev = 0)) (PreH18 : (head_node_next = 0)) (PreH19 : (0 <= id_pre)) (PreH20 : (id_pre < (m.(idmax) ))) (PreH21 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH22 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH23 : (manager_callee_id_max = (m.(idmax) ))) (PreH24 : (manager_callee_hoffset = (m.(hoffset) ))) (PreH25 : (0 <= id_pre)) (PreH26 : (id_pre < (m.(idmax) ))) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> (m.(hoffset) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> (m.(idmax) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&(((htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> head_node_prev)
  **  ((&(((htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_node_next)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
|--
  “ (head_node_prev = 0) ” 
  &&  “ (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z)))) ” 
  &&  “ (0 <= id_pre) ” 
  &&  “ (id_pre < (m.(idmax) )) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (bucket = (@nil Z)) ” 
  &&  “ (nodes = (@nil (@DL_Node Z))) ” 
  &&  “ ((map (getData) (nodes)) = bucket) ” 
  &&  “ (prev = 0) ” 
  &&  “ (next = 0) ” 
  &&  “ (head_node_prev = 0) ” 
  &&  “ (head_node_next = 0) ” 
  &&  “ (0 <= id_pre) ” 
  &&  “ (id_pre < (m.(idmax) )) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (manager_callee_id_max = (m.(idmax) )) ” 
  &&  “ (manager_callee_hoffset = (m.(hoffset) )) ” 
  &&  “ (0 <= id_pre) ” 
  &&  “ (id_pre < (m.(idmax) )) ”
  &&  ((&(((htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> 0)
  **  ((&(((htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> 0)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> (m.(hoffset) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> (m.(idmax) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
.

Definition GetObj_partial_solve_wit_4_linked_bucket := 
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (id_map: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (prefix: (@list (@DL_Node Z))) (suffix: (@list (@DL_Node Z))) (first: Z) (last: Z) (prev_cur: Z) (node: Z) (head: Z) (idnode: Z) (manager_id_max: Z) (manager_hoffset: Z) (node_id: Z) (node_next: Z) (rest: (@list (@DL_Node Z))) (PreH1 : (suffix = (cons ((Build_DL_Node (node_id) (node))) (rest)))) (PreH2 : (head = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH3 : (idnode = 0)) (PreH4 : (0 <= id_pre)) (PreH5 : (id_pre < (m.(idmax) ))) (PreH6 : (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH7 : (nodes = (app (prefix) (suffix)))) (PreH8 : (idnodes_no_id id_pre prefix )) (PreH9 : ((map (getData) (nodes)) = bucket)) (PreH10 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH11 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH12 : (manager_id_max = (m.(idmax) ))) (PreH13 : (manager_hoffset = (m.(hoffset) ))) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((node)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev_cur)
  **  ((&((node)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (dllseg (store_idnode ((m.(storeA) ))) first head node prev_cur prefix )
  **  (store_idnode (m.(storeA) ) node node_id )
  **  (dllseg (store_idnode ((m.(storeA) ))) node_next node head last rest )
|--
  “ (suffix = (cons ((Build_DL_Node (node_id) (node))) (rest))) ” 
  &&  “ (head = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" )))) ” 
  &&  “ (idnode = 0) ” 
  &&  “ (0 <= id_pre) ” 
  &&  “ (id_pre < (m.(idmax) )) ” 
  &&  “ (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z)))) ” 
  &&  “ (nodes = (app (prefix) (suffix))) ” 
  &&  “ (idnodes_no_id id_pre prefix ) ” 
  &&  “ ((map (getData) (nodes)) = bucket) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (manager_id_max = (m.(idmax) )) ” 
  &&  “ (manager_hoffset = (m.(hoffset) )) ”
  &&  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((node)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev_cur)
  **  ((&((node)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (dllseg (store_idnode ((m.(storeA) ))) first head node prev_cur prefix )
  **  (store_idnode (m.(storeA) ) node node_id )
  **  (dllseg (store_idnode ((m.(storeA) ))) node_next node head last rest )
.

Definition GetObj_which_implies_wit_1 := 
(
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (PreH1 : (0 <= id_pre)) (PreH2 : (id_pre < (m.(idmax) ))) ,
  (store_idmanager m manager_pre )
|--
  EX (htable: Z)  (id_map: Z)  (manager_pre_hoffset: Z)  (manager_pre_id_max: Z)  (bytes: (@list Z)) ,
  “ (0 <= id_pre) ” 
  &&  “ (id_pre < (m.(idmax) )) ” 
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
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (PreH1 : (0 <= id_pre)) (PreH2 : (id_pre < (m.(idmax) ))) ,
  (store_idmanager m manager_pre )
|--
  EX (htable: Z)  (id_map: Z)  (bytes: (@list Z)) ,
  “ (0 <= id_pre) ” 
  &&  “ (id_pre < (m.(idmax) )) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ”
  &&  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> (m.(idmax) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> (m.(hoffset) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
).

Definition GetObj_which_implies_wit_2 := 
forall (id_pre: Z) (manager_pre: Z) (m: idmanager) (id_map: Z) (htable: Z) (bytes: (@list Z)) (head: Z) (node: Z) (idnode: Z) (manager_id_max: Z) (manager_hoffset: Z) (PreH1 : (head = (htable + ((id_pre % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH2 : (node = 0)) (PreH3 : (idnode = 0)) (PreH4 : (0 <= id_pre)) (PreH5 : (id_pre < (m.(idmax) ))) (PreH6 : (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes )) (PreH7 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH8 : (manager_id_max = (m.(idmax) ))) (PreH9 : (manager_hoffset = (m.(hoffset) ))) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
|--
  (EX (head_node_next: Z)  (head_node_prev: Z)  (next: Z)  (prev: Z)  (nodes: (@list (@DL_Node Z)))  (bucket: (@list Z)) ,
  “ (bucket = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z)))) ” 
  &&  “ (head = (htable + ((id_pre % ( manager_hoffset ) ) * sizeof( "SysDoubleLinklistNode" )))) ” 
  &&  “ (node = 0) ” 
  &&  “ (idnode = 0) ” 
  &&  “ (0 <= id_pre) ” 
  &&  “ (id_pre < (m.(idmax) )) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (bucket = (@nil Z)) ” 
  &&  “ (nodes = (@nil (@DL_Node Z))) ” 
  &&  “ ((map (getData) (nodes)) = bucket) ” 
  &&  “ (prev = 0) ” 
  &&  “ (next = 0) ” 
  &&  “ (manager_id_max = (m.(idmax) )) ” 
  &&  “ (manager_hoffset = (m.(hoffset) )) ” 
  &&  “ (head_node_prev = 0) ” 
  &&  “ (head_node_next = 0) ”
  &&  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> head_node_prev)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_node_next)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) ))
  ||
  (EX (next_2: Z)  (prev_2: Z)  (nodes_2: (@list (@DL_Node Z)))  (bucket_2: (@list Z)) ,
  “ (bucket_2 = (Znth ((id_pre % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z)))) ” 
  &&  “ (head = (htable + ((id_pre % ( manager_hoffset ) ) * sizeof( "SysDoubleLinklistNode" )))) ” 
  &&  “ (node = 0) ” 
  &&  “ (idnode = 0) ” 
  &&  “ (0 <= id_pre) ” 
  &&  “ (id_pre < (m.(idmax) )) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (m.(idlist) ) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ ((map (getData) (nodes_2)) = bucket_2) ” 
  &&  “ (prev_2 <> 0) ” 
  &&  “ (next_2 <> 0) ” 
  &&  “ (manager_id_max = (m.(idmax) )) ” 
  &&  “ (manager_hoffset = (m.(hoffset) )) ”
  &&  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev_2)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_2)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id_pre % ( (m.(hoffset) ) ) ) bucket_2 (m.(idbuckets) ) )
  **  (dllseg (store_idnode ((m.(storeA) ))) next_2 head head prev_2 nodes_2 ))
.

Module Type VC_Correct.

Axiom proof_of_GetObj_safety_wit_1 : GetObj_safety_wit_1.
Axiom proof_of_GetObj_safety_wit_2 : GetObj_safety_wit_2.
Axiom proof_of_GetObj_safety_wit_3 : GetObj_safety_wit_3.
Axiom proof_of_GetObj_safety_wit_4_linked_bucket : GetObj_safety_wit_4_linked_bucket.
Axiom proof_of_GetObj_safety_wit_5_empty_bucket : GetObj_safety_wit_5_empty_bucket.
Axiom proof_of_GetObj_safety_wit_6_linked_bucket : GetObj_safety_wit_6_linked_bucket.
Axiom proof_of_GetObj_safety_wit_7_empty_bucket : GetObj_safety_wit_7_empty_bucket.
Axiom proof_of_GetObj_safety_wit_8_empty_bucket : GetObj_safety_wit_8_empty_bucket.
Axiom proof_of_GetObj_safety_wit_9_linked_bucket : GetObj_safety_wit_9_linked_bucket.
Axiom proof_of_GetObj_entail_wit_1_empty_bucket : GetObj_entail_wit_1_empty_bucket.
Axiom proof_of_GetObj_entail_wit_2_linked_bucket : GetObj_entail_wit_2_linked_bucket.
Axiom proof_of_GetObj_entail_wit_3_linked_bucket : GetObj_entail_wit_3_linked_bucket.
Axiom proof_of_GetObj_entail_wit_4_linked_bucket : GetObj_entail_wit_4_linked_bucket.
Axiom proof_of_GetObj_entail_wit_5_linked_bucket : GetObj_entail_wit_5_linked_bucket.
Axiom proof_of_GetObj_entail_wit_6_linked_bucket : GetObj_entail_wit_6_linked_bucket.
Axiom proof_of_GetObj_entail_wit_7_linked_bucket : GetObj_entail_wit_7_linked_bucket.
Axiom proof_of_GetObj_return_wit_1_linked_bucket : GetObj_return_wit_1_linked_bucket.
Axiom proof_of_GetObj_return_wit_2_linked_bucket : GetObj_return_wit_2_linked_bucket.
Axiom proof_of_GetObj_return_wit_3_empty_bucket : GetObj_return_wit_3_empty_bucket.
Axiom proof_of_GetObj_partial_solve_wit_1_pure : GetObj_partial_solve_wit_1_pure.
Axiom proof_of_GetObj_partial_solve_wit_1 : GetObj_partial_solve_wit_1.
Axiom proof_of_GetObj_partial_solve_wit_2_pure : GetObj_partial_solve_wit_2_pure.
Axiom proof_of_GetObj_partial_solve_wit_2 : GetObj_partial_solve_wit_2.
Axiom proof_of_GetObj_partial_solve_wit_3_empty_bucket : GetObj_partial_solve_wit_3_empty_bucket.
Axiom proof_of_GetObj_partial_solve_wit_4_linked_bucket : GetObj_partial_solve_wit_4_linked_bucket.
Axiom proof_of_GetObj_which_implies_wit_1 : GetObj_which_implies_wit_1.
Axiom proof_of_GetObj_which_implies_wit_2 : GetObj_which_implies_wit_2.

End VC_Correct.
