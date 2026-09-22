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

(*----- Function InsertObj -----*)

Definition InsertObj_safety_wit_1 := 
(
forall (idnode_pre: Z) (manager_pre: Z) (id: Z) (m: idmanager) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (id_map: Z) (htable: Z) (bytes: (@list Z)) (PreH1 : (idmanager_min_free_id m id )) (PreH2 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH3 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH4 : (idmanager_storeA m idnode_pre id )) (PreH5 : (manager_callee_id_max = (m.(idmax) ))) (PreH6 : (manager_callee_hoffset = (m.(hoffset) ))) ,
  ((( &( "head" ) )) # Ptr  |->_)
  **  ((( &( "idnode" ) )) # Ptr  |-> idnode_pre)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "id")) # UShort  |-> id)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_prev")) # Ptr  |->_)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_next")) # Ptr  |->_)
|--
  “ ((id <> (INT_MIN)) \/ (manager_callee_hoffset <> (-1))) ” 
  &&  “ (manager_callee_hoffset <> 0) ”
) \/
(
forall (idnode_pre: Z) (manager_pre: Z) (id: Z) (m: idmanager) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (id_map: Z) (htable: Z) (bytes: (@list Z)) (PreH1 : (idmanager_min_free_id m id )) (PreH2 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH3 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH4 : (idmanager_storeA m idnode_pre id )) (PreH5 : (manager_callee_id_max = (m.(idmax) ))) (PreH6 : (manager_callee_hoffset = (m.(hoffset) ))) ,
  ((( &( "head" ) )) # Ptr  |->_)
  **  ((( &( "idnode" ) )) # Ptr  |-> idnode_pre)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "id")) # UShort  |-> id)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_prev")) # Ptr  |->_)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_next")) # Ptr  |->_)
|--
  “ ((id <> (INT_MIN)) \/ (manager_callee_hoffset <> (-1))) ” 
  &&  “ (manager_callee_hoffset <> 0) ”
).

Definition InsertObj_safety_wit_1_split_goal_1 := 
forall (idnode_pre: Z) (manager_pre: Z) (id: Z) (m: idmanager) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (id_map: Z) (htable: Z) (bytes: (@list Z)) (PreH1 : (idmanager_min_free_id m id )) (PreH2 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH3 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH4 : (idmanager_storeA m idnode_pre id )) (PreH5 : (manager_callee_id_max = (m.(idmax) ))) (PreH6 : (manager_callee_hoffset = (m.(hoffset) ))) ,
  ((( &( "head" ) )) # Ptr  |->_)
  **  ((( &( "idnode" ) )) # Ptr  |-> idnode_pre)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "id")) # UShort  |-> id)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_prev")) # Ptr  |->_)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_next")) # Ptr  |->_)
|--
  “ ((id <> (INT_MIN)) \/ (manager_callee_hoffset <> (-1))) ”
.

Definition InsertObj_safety_wit_1_split_goal_2 := 
forall (idnode_pre: Z) (manager_pre: Z) (id: Z) (m: idmanager) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (id_map: Z) (htable: Z) (bytes: (@list Z)) (PreH1 : (idmanager_min_free_id m id )) (PreH2 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH3 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH4 : (idmanager_storeA m idnode_pre id )) (PreH5 : (manager_callee_id_max = (m.(idmax) ))) (PreH6 : (manager_callee_hoffset = (m.(hoffset) ))) ,
  ((( &( "head" ) )) # Ptr  |->_)
  **  ((( &( "idnode" ) )) # Ptr  |-> idnode_pre)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "id")) # UShort  |-> id)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_prev")) # Ptr  |->_)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_next")) # Ptr  |->_)
|--
  “ (manager_callee_hoffset <> 0) ”
.

Definition InsertObj_safety_wit_2_linked_bucket := 
forall (idnode_pre: Z) (manager_pre: Z) (id: Z) (m: idmanager) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (id_map: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (prev: Z) (next: Z) (PreH1 : (bucket = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH2 : ((htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) = (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH3 : (idmanager_min_free_id m id )) (PreH4 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH5 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH6 : (idmanager_storeA m idnode_pre id )) (PreH7 : ((m.(idmax) ) = (m.(idmax) ))) (PreH8 : ((m.(hoffset) ) = (m.(hoffset) ))) (PreH9 : ((map (getData) (nodes)) = bucket)) (PreH10 : (prev <> 0)) (PreH11 : (next <> 0)) (PreH12 : (idmanager_min_free_id m id )) (PreH13 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH14 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH15 : (idmanager_storeA m idnode_pre id )) (PreH16 : (manager_callee_id_max = (m.(idmax) ))) (PreH17 : (manager_callee_hoffset = (m.(hoffset) ))) ,
  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((( &( "idnode" ) )) # Ptr  |-> idnode_pre)
  **  ((( &( "head" ) )) # Ptr  |-> (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "id")) # UShort  |-> id)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> (m.(hoffset) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> (m.(idmax) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&(((htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&(((htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_prev")) # Ptr  |->_)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_next")) # Ptr  |->_)
  **  (dllseg (store_idnode ((m.(storeA) ))) next (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) prev nodes )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition InsertObj_safety_wit_3_empty_bucket := 
forall (idnode_pre: Z) (manager_pre: Z) (id: Z) (m: idmanager) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (id_map: Z) (htable: Z) (bytes: (@list Z)) (head_node_next: Z) (head_node_prev: Z) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (prev: Z) (next: Z) (PreH1 : (bucket = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH2 : ((htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) = (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH3 : (idmanager_min_free_id m id )) (PreH4 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH5 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH6 : (idmanager_storeA m idnode_pre id )) (PreH7 : ((m.(idmax) ) = (m.(idmax) ))) (PreH8 : ((m.(hoffset) ) = (m.(hoffset) ))) (PreH9 : (bucket = (@nil Z))) (PreH10 : (nodes = (@nil (@DL_Node Z)))) (PreH11 : ((map (getData) (nodes)) = bucket)) (PreH12 : (prev = 0)) (PreH13 : (next = 0)) (PreH14 : (head_node_prev = 0)) (PreH15 : (head_node_next = 0)) (PreH16 : (idmanager_min_free_id m id )) (PreH17 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH18 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH19 : (idmanager_storeA m idnode_pre id )) (PreH20 : (manager_callee_id_max = (m.(idmax) ))) (PreH21 : (manager_callee_hoffset = (m.(hoffset) ))) ,
  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((( &( "idnode" ) )) # Ptr  |-> idnode_pre)
  **  ((( &( "head" ) )) # Ptr  |-> (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "id")) # UShort  |-> id)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> (m.(hoffset) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> (m.(idmax) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&(((htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> head_node_prev)
  **  ((&(((htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_node_next)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_prev")) # Ptr  |->_)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_next")) # Ptr  |->_)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition InsertObj_safety_wit_4_linked_bucket := 
forall (idnode_pre: Z) (manager_pre: Z) (id: Z) (m: idmanager) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (id_map: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (prev: Z) (next: Z) (PreH1 : (prev = 0)) (PreH2 : (bucket = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH3 : ((htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) = (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH4 : (idmanager_min_free_id m id )) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (idmanager_storeA m idnode_pre id )) (PreH8 : ((m.(idmax) ) = (m.(idmax) ))) (PreH9 : ((m.(hoffset) ) = (m.(hoffset) ))) (PreH10 : ((map (getData) (nodes)) = bucket)) (PreH11 : (prev <> 0)) (PreH12 : (next <> 0)) (PreH13 : (idmanager_min_free_id m id )) (PreH14 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH15 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH16 : (idmanager_storeA m idnode_pre id )) (PreH17 : (manager_callee_id_max = (m.(idmax) ))) (PreH18 : (manager_callee_hoffset = (m.(hoffset) ))) ,
  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((( &( "idnode" ) )) # Ptr  |-> idnode_pre)
  **  ((( &( "head" ) )) # Ptr  |-> (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "id")) # UShort  |-> id)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> (m.(hoffset) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> (m.(idmax) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&(((htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&(((htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_prev")) # Ptr  |->_)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_next")) # Ptr  |->_)
  **  (dllseg (store_idnode ((m.(storeA) ))) next (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) prev nodes )
|--
  “ False ”
.

Definition InsertObj_safety_wit_5_empty_bucket := 
forall (idnode_pre: Z) (manager_pre: Z) (id: Z) (m: idmanager) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (id_map: Z) (htable: Z) (bytes: (@list Z)) (head_node_next: Z) (head_node_prev: Z) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (prev: Z) (next: Z) (PreH1 : (head_node_prev <> 0)) (PreH2 : (bucket = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH3 : ((htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) = (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH4 : (idmanager_min_free_id m id )) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (idmanager_storeA m idnode_pre id )) (PreH8 : ((m.(idmax) ) = (m.(idmax) ))) (PreH9 : ((m.(hoffset) ) = (m.(hoffset) ))) (PreH10 : (bucket = (@nil Z))) (PreH11 : (nodes = (@nil (@DL_Node Z)))) (PreH12 : ((map (getData) (nodes)) = bucket)) (PreH13 : (prev = 0)) (PreH14 : (next = 0)) (PreH15 : (head_node_prev = 0)) (PreH16 : (head_node_next = 0)) (PreH17 : (idmanager_min_free_id m id )) (PreH18 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH19 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH20 : (idmanager_storeA m idnode_pre id )) (PreH21 : (manager_callee_id_max = (m.(idmax) ))) (PreH22 : (manager_callee_hoffset = (m.(hoffset) ))) ,
  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((( &( "idnode" ) )) # Ptr  |-> idnode_pre)
  **  ((( &( "head" ) )) # Ptr  |-> (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "id")) # UShort  |-> id)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> (m.(hoffset) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> (m.(idmax) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&(((htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> head_node_prev)
  **  ((&(((htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_node_next)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_prev")) # Ptr  |->_)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_next")) # Ptr  |->_)
|--
  “ False ”
.

Definition InsertObj_entail_wit_1_empty_bucket := 
(
forall (idnode_pre: Z) (manager_pre: Z) (id: Z) (m: idmanager) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (id_map: Z) (htable: Z) (bytes: (@list Z)) (head_node_next: Z) (head_node_prev: Z) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (prev: Z) (next: Z) (PreH1 : (head_node_prev = 0)) (PreH2 : (bucket = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH3 : (idmanager_min_free_id m id )) (PreH4 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH5 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH6 : (idmanager_storeA m idnode_pre id )) (PreH7 : (bucket = (@nil Z))) (PreH8 : (nodes = (@nil (@DL_Node Z)))) (PreH9 : ((map (getData) (nodes)) = bucket)) (PreH10 : (prev = 0)) (PreH11 : (next = 0)) (PreH12 : (head_node_prev = 0)) (PreH13 : (head_node_next = 0)) (PreH14 : (idmanager_min_free_id m id )) (PreH15 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH16 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH17 : (idmanager_storeA m idnode_pre id )) (PreH18 : (manager_callee_id_max = (m.(idmax) ))) (PreH19 : (manager_callee_hoffset = (m.(hoffset) ))) ,
  (store_dll (store_idnode ((m.(storeA) ))) (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) (@nil (@DL_Node Z)) )
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "id")) # UShort  |-> id)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> (m.(hoffset) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> (m.(idmax) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_prev")) # Ptr  |->_)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_next")) # Ptr  |->_)
|--
  EX (manager_hoffset: Z)  (manager_id_max: Z) ,
  “ ((htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) = (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" )))) ” 
  &&  “ (idmanager_min_free_id m id ) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (bucket = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z)))) ” 
  &&  “ ((map (getData) (nodes)) = bucket) ” 
  &&  “ (idmanager_storeA m idnode_pre id ) ” 
  &&  “ (manager_id_max = (m.(idmax) )) ” 
  &&  “ (manager_hoffset = (m.(hoffset) )) ”
  &&  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (store_dll (store_idnode ((m.(storeA) ))) (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) nodes )
  **  (store_idnode_unlinked (m.(storeA) ) &((idnode_pre)  # "IdNode" ->ₛ "link") id )
) \/
(
forall (idnode_pre: Z) (id: Z) (m: idmanager) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (htable: Z) (bytes: (@list Z)) (head_node_next: Z) (head_node_prev: Z) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (prev: Z) (next: Z) (PreH1 : (head_node_prev = 0)) (PreH2 : (bucket = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH3 : (idmanager_min_free_id m id )) (PreH4 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH5 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH6 : (idmanager_storeA m idnode_pre id )) (PreH7 : (bucket = (@nil Z))) (PreH8 : (nodes = (@nil (@DL_Node Z)))) (PreH9 : ((map (getData) (nodes)) = bucket)) (PreH10 : (prev = 0)) (PreH11 : (next = 0)) (PreH12 : (head_node_prev = 0)) (PreH13 : (head_node_next = 0)) (PreH14 : (idmanager_min_free_id m id )) (PreH15 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH16 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH17 : (idmanager_storeA m idnode_pre id )) (PreH18 : (manager_callee_id_max = (m.(idmax) ))) (PreH19 : (manager_callee_hoffset = (m.(hoffset) ))) ,
  (store_dll (store_idnode ((m.(storeA) ))) (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) (@nil (@DL_Node Z)) )
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "id")) # UShort  |-> id)
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_prev")) # Ptr  |->_)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_next")) # Ptr  |->_)
|--
  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (store_dll (store_idnode ((m.(storeA) ))) (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) nodes )
  **  (store_idnode_unlinked (m.(storeA) ) &((idnode_pre)  # "IdNode" ->ₛ "link") id )
).

Definition InsertObj_entail_wit_1_empty_bucket_split_goal_spatial := 
forall (idnode_pre: Z) (id: Z) (m: idmanager) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (htable: Z) (bytes: (@list Z)) (head_node_next: Z) (head_node_prev: Z) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (prev: Z) (next: Z) (PreH1 : (head_node_prev = 0)) (PreH2 : (bucket = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH3 : (idmanager_min_free_id m id )) (PreH4 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH5 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH6 : (idmanager_storeA m idnode_pre id )) (PreH7 : (bucket = (@nil Z))) (PreH8 : (nodes = (@nil (@DL_Node Z)))) (PreH9 : ((map (getData) (nodes)) = bucket)) (PreH10 : (prev = 0)) (PreH11 : (next = 0)) (PreH12 : (head_node_prev = 0)) (PreH13 : (head_node_next = 0)) (PreH14 : (idmanager_min_free_id m id )) (PreH15 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH16 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH17 : (idmanager_storeA m idnode_pre id )) (PreH18 : (manager_callee_id_max = (m.(idmax) ))) (PreH19 : (manager_callee_hoffset = (m.(hoffset) ))) ,
  (store_dll (store_idnode ((m.(storeA) ))) (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) (@nil (@DL_Node Z)) )
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "id")) # UShort  |-> id)
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_prev")) # Ptr  |->_)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_next")) # Ptr  |->_)
|--
  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (store_dll (store_idnode ((m.(storeA) ))) (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) nodes )
  **  (store_idnode_unlinked (m.(storeA) ) &((idnode_pre)  # "IdNode" ->ₛ "link") id )
.

Definition InsertObj_entail_wit_2_linked_bucket := 
(
forall (idnode_pre: Z) (manager_pre: Z) (id: Z) (m: idmanager) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (id_map: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (prev: Z) (next: Z) (PreH1 : (prev <> 0)) (PreH2 : (bucket = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH3 : ((htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) = (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH4 : (idmanager_min_free_id m id )) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (idmanager_storeA m idnode_pre id )) (PreH8 : ((m.(idmax) ) = (m.(idmax) ))) (PreH9 : ((m.(hoffset) ) = (m.(hoffset) ))) (PreH10 : ((map (getData) (nodes)) = bucket)) (PreH11 : (prev <> 0)) (PreH12 : (next <> 0)) (PreH13 : (idmanager_min_free_id m id )) (PreH14 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH15 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH16 : (idmanager_storeA m idnode_pre id )) (PreH17 : (manager_callee_id_max = (m.(idmax) ))) (PreH18 : (manager_callee_hoffset = (m.(hoffset) ))) ,
  ((&((idnode_pre)  # "IdNode" ->ₛ "id")) # UShort  |-> id)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> (m.(hoffset) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> (m.(idmax) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&(((htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&(((htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_prev")) # Ptr  |->_)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_next")) # Ptr  |->_)
  **  (dllseg (store_idnode ((m.(storeA) ))) next (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) prev nodes )
|--
  EX (manager_hoffset: Z)  (manager_id_max: Z) ,
  “ ((htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) = (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" )))) ” 
  &&  “ (idmanager_min_free_id m id ) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (bucket = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z)))) ” 
  &&  “ ((map (getData) (nodes)) = bucket) ” 
  &&  “ (idmanager_storeA m idnode_pre id ) ” 
  &&  “ (manager_id_max = (m.(idmax) )) ” 
  &&  “ (manager_hoffset = (m.(hoffset) )) ”
  &&  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (store_dll (store_idnode ((m.(storeA) ))) (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) nodes )
  **  (store_idnode_unlinked (m.(storeA) ) &((idnode_pre)  # "IdNode" ->ₛ "link") id )
) \/
(
forall (idnode_pre: Z) (id: Z) (m: idmanager) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (prev: Z) (next: Z) (PreH1 : (prev <> 0)) (PreH2 : (bucket = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH3 : (idmanager_min_free_id m id )) (PreH4 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH5 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH6 : (idmanager_storeA m idnode_pre id )) (PreH7 : ((map (getData) (nodes)) = bucket)) (PreH8 : (prev <> 0)) (PreH9 : (next <> 0)) (PreH10 : (idmanager_min_free_id m id )) (PreH11 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH12 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH13 : (idmanager_storeA m idnode_pre id )) (PreH14 : (manager_callee_id_max = (m.(idmax) ))) (PreH15 : (manager_callee_hoffset = (m.(hoffset) ))) ,
  ((&((idnode_pre)  # "IdNode" ->ₛ "id")) # UShort  |-> id)
  **  ((&(((htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&(((htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_prev")) # Ptr  |->_)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_next")) # Ptr  |->_)
  **  (dllseg (store_idnode ((m.(storeA) ))) next (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) prev nodes )
|--
  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (store_dll (store_idnode ((m.(storeA) ))) (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) nodes )
  **  (store_idnode_unlinked (m.(storeA) ) &((idnode_pre)  # "IdNode" ->ₛ "link") id )
).

Definition InsertObj_entail_wit_2_linked_bucket_split_goal_spatial := 
forall (idnode_pre: Z) (id: Z) (m: idmanager) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (prev: Z) (next: Z) (PreH1 : (prev <> 0)) (PreH2 : (bucket = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH3 : (idmanager_min_free_id m id )) (PreH4 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH5 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH6 : (idmanager_storeA m idnode_pre id )) (PreH7 : ((map (getData) (nodes)) = bucket)) (PreH8 : (prev <> 0)) (PreH9 : (next <> 0)) (PreH10 : (idmanager_min_free_id m id )) (PreH11 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH12 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH13 : (idmanager_storeA m idnode_pre id )) (PreH14 : (manager_callee_id_max = (m.(idmax) ))) (PreH15 : (manager_callee_hoffset = (m.(hoffset) ))) ,
  ((&((idnode_pre)  # "IdNode" ->ₛ "id")) # UShort  |-> id)
  **  ((&(((htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((&(((htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_prev")) # Ptr  |->_)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_next")) # Ptr  |->_)
  **  (dllseg (store_idnode ((m.(storeA) ))) next (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) prev nodes )
|--
  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (store_dll (store_idnode ((m.(storeA) ))) (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) nodes )
  **  (store_idnode_unlinked (m.(storeA) ) &((idnode_pre)  # "IdNode" ->ₛ "link") id )
.

Definition InsertObj_entail_wit_3_linked_bucket := 
forall (idnode_pre: Z) (manager_pre: Z) (id: Z) (m: idmanager) (id_map: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (head: Z) (manager_id_max_2: Z) (manager_hoffset_2: Z) (PreH1 : (head = (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH2 : (head = (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH3 : (idmanager_min_free_id m id )) (PreH4 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH5 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH6 : (bucket = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH7 : ((map (getData) (nodes)) = bucket)) (PreH8 : (idmanager_storeA m idnode_pre id )) (PreH9 : (manager_id_max_2 = (m.(idmax) ))) (PreH10 : (manager_hoffset_2 = (m.(hoffset) ))) ,
  (store_dll (store_idnode ((m.(storeA) ))) head (cons ((Build_DL_Node (id) (&((idnode_pre)  # "IdNode" ->ₛ "link")))) (nodes)) )
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max_2)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset_2)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
|--
  EX (manager_hoffset: Z)  (manager_id_max: Z) ,
  “ (head = (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" )))) ” 
  &&  “ (idmanager_min_free_id m id ) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (bucket = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z)))) ” 
  &&  “ ((map (getData) (nodes)) = bucket) ” 
  &&  “ (idmanager_storeA m idnode_pre id ) ” 
  &&  “ (manager_id_max = (m.(idmax) )) ” 
  &&  “ (manager_hoffset = (m.(hoffset) )) ”
  &&  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (store_dll (store_idnode ((m.(storeA) ))) head (cons ((Build_DL_Node (id) (&((idnode_pre)  # "IdNode" ->ₛ "link")))) (nodes)) )
.

Definition InsertObj_entail_wit_4_empty_bucket := 
forall (idnode_pre: Z) (manager_pre: Z) (id: Z) (m: idmanager) (id_map: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (head: Z) (manager_id_max_2: Z) (manager_hoffset_2: Z) (PreH1 : (head = (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH2 : (head = (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH3 : (idmanager_min_free_id m id )) (PreH4 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH5 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH6 : (bucket = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH7 : ((map (getData) (nodes)) = bucket)) (PreH8 : (idmanager_storeA m idnode_pre id )) (PreH9 : (manager_id_max_2 = (m.(idmax) ))) (PreH10 : (manager_hoffset_2 = (m.(hoffset) ))) ,
  (store_dll (store_idnode ((m.(storeA) ))) head (cons ((Build_DL_Node (id) (&((idnode_pre)  # "IdNode" ->ₛ "link")))) (nodes)) )
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max_2)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset_2)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
|--
  EX (manager_hoffset: Z)  (manager_id_max: Z) ,
  “ (head = (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" )))) ” 
  &&  “ (idmanager_min_free_id m id ) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (bucket = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z)))) ” 
  &&  “ ((map (getData) (nodes)) = bucket) ” 
  &&  “ (idmanager_storeA m idnode_pre id ) ” 
  &&  “ (manager_id_max = (m.(idmax) )) ” 
  &&  “ (manager_hoffset = (m.(hoffset) )) ”
  &&  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (store_dll (store_idnode ((m.(storeA) ))) head (cons ((Build_DL_Node (id) (&((idnode_pre)  # "IdNode" ->ₛ "link")))) (nodes)) )
.

Definition InsertObj_entail_wit_5_empty_bucket := 
(
forall (idnode_pre: Z) (manager_pre: Z) (id: Z) (m: idmanager) (id_map: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (head: Z) (manager_id_max: Z) (manager_hoffset: Z) (PreH1 : (head = (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH2 : (idmanager_min_free_id m id )) (PreH3 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH4 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH5 : (bucket = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH6 : ((map (getData) (nodes)) = bucket)) (PreH7 : (idmanager_storeA m idnode_pre id )) (PreH8 : (manager_id_max = (m.(idmax) ))) (PreH9 : (manager_hoffset = (m.(hoffset) ))) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (store_dll (store_idnode ((m.(storeA) ))) head (cons ((Build_DL_Node (id) (&((idnode_pre)  # "IdNode" ->ₛ "link")))) (nodes)) )
|--
  (store_idmanager (idmanager_link ((idmanager_add (m) (id))) (id)) manager_pre )
) \/
(
forall (idnode_pre: Z) (manager_pre: Z) (id: Z) (m: idmanager) (id_map: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (head: Z) (manager_id_max: Z) (manager_hoffset: Z) (PreH1 : (head = (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH2 : (idmanager_min_free_id m id )) (PreH3 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH4 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH5 : (bucket = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH6 : ((map (getData) (nodes)) = bucket)) (PreH7 : (idmanager_storeA m idnode_pre id )) (PreH8 : (manager_id_max = (m.(idmax) ))) (PreH9 : (manager_hoffset = (m.(hoffset) ))) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (store_dll (store_idnode ((m.(storeA) ))) head (cons ((Build_DL_Node (id) (&((idnode_pre)  # "IdNode" ->ₛ "link")))) (nodes)) )
|--
  (store_idmanager (idmanager_link ((idmanager_add (m) (id))) (id)) manager_pre )
).

Definition InsertObj_entail_wit_5_empty_bucket_split_goal_spatial := 
forall (idnode_pre: Z) (manager_pre: Z) (id: Z) (m: idmanager) (id_map: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (head: Z) (manager_id_max: Z) (manager_hoffset: Z) (PreH1 : (head = (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH2 : (idmanager_min_free_id m id )) (PreH3 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH4 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH5 : (bucket = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH6 : ((map (getData) (nodes)) = bucket)) (PreH7 : (idmanager_storeA m idnode_pre id )) (PreH8 : (manager_id_max = (m.(idmax) ))) (PreH9 : (manager_hoffset = (m.(hoffset) ))) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (store_dll (store_idnode ((m.(storeA) ))) head (cons ((Build_DL_Node (id) (&((idnode_pre)  # "IdNode" ->ₛ "link")))) (nodes)) )
|--
  (store_idmanager (idmanager_link ((idmanager_add (m) (id))) (id)) manager_pre )
.

Definition InsertObj_entail_wit_6_linked_bucket := 
(
forall (idnode_pre: Z) (manager_pre: Z) (id: Z) (m: idmanager) (id_map: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (head: Z) (manager_id_max: Z) (manager_hoffset: Z) (PreH1 : (head = (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH2 : (idmanager_min_free_id m id )) (PreH3 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH4 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH5 : (bucket = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH6 : ((map (getData) (nodes)) = bucket)) (PreH7 : (idmanager_storeA m idnode_pre id )) (PreH8 : (manager_id_max = (m.(idmax) ))) (PreH9 : (manager_hoffset = (m.(hoffset) ))) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (store_dll (store_idnode ((m.(storeA) ))) head (cons ((Build_DL_Node (id) (&((idnode_pre)  # "IdNode" ->ₛ "link")))) (nodes)) )
|--
  (store_idmanager (idmanager_link ((idmanager_add (m) (id))) (id)) manager_pre )
) \/
(
forall (idnode_pre: Z) (manager_pre: Z) (id: Z) (m: idmanager) (id_map: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (head: Z) (manager_id_max: Z) (manager_hoffset: Z) (PreH1 : (head = (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH2 : (idmanager_min_free_id m id )) (PreH3 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH4 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH5 : (bucket = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH6 : ((map (getData) (nodes)) = bucket)) (PreH7 : (idmanager_storeA m idnode_pre id )) (PreH8 : (manager_id_max = (m.(idmax) ))) (PreH9 : (manager_hoffset = (m.(hoffset) ))) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (store_dll (store_idnode ((m.(storeA) ))) head (cons ((Build_DL_Node (id) (&((idnode_pre)  # "IdNode" ->ₛ "link")))) (nodes)) )
|--
  (store_idmanager (idmanager_link ((idmanager_add (m) (id))) (id)) manager_pre )
).

Definition InsertObj_entail_wit_6_linked_bucket_split_goal_spatial := 
forall (idnode_pre: Z) (manager_pre: Z) (id: Z) (m: idmanager) (id_map: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (head: Z) (manager_id_max: Z) (manager_hoffset: Z) (PreH1 : (head = (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH2 : (idmanager_min_free_id m id )) (PreH3 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH4 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH5 : (bucket = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH6 : ((map (getData) (nodes)) = bucket)) (PreH7 : (idmanager_storeA m idnode_pre id )) (PreH8 : (manager_id_max = (m.(idmax) ))) (PreH9 : (manager_hoffset = (m.(hoffset) ))) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (store_dll (store_idnode ((m.(storeA) ))) head (cons ((Build_DL_Node (id) (&((idnode_pre)  # "IdNode" ->ₛ "link")))) (nodes)) )
|--
  (store_idmanager (idmanager_link ((idmanager_add (m) (id))) (id)) manager_pre )
.

Definition InsertObj_return_wit_1_empty_bucket := 
forall (manager_pre: Z) (id: Z) (m: idmanager) ,
  (store_idmanager (idmanager_link ((idmanager_add (m) (id))) (id)) manager_pre )
|--
  (store_idmanager (idmanager_link ((idmanager_add (m) (id))) (id)) manager_pre )
.

Definition InsertObj_return_wit_2_linked_bucket := 
forall (manager_pre: Z) (id: Z) (m: idmanager) ,
  (store_idmanager (idmanager_link ((idmanager_add (m) (id))) (id)) manager_pre )
|--
  (store_idmanager (idmanager_link ((idmanager_add (m) (id))) (id)) manager_pre )
.

Definition InsertObj_partial_solve_wit_1 := 
forall (idnode_pre: Z) (manager_pre: Z) (id: Z) (m: idmanager) ,
  (store_idmanager_allocated_unlinked m manager_pre id )
  **  (store_idnode_unlinked (m.(storeA) ) &((idnode_pre)  # "IdNode" ->ₛ "link") id )
|--
  (store_idmanager_allocated_unlinked m manager_pre id )
  **  (store_idnode_unlinked (m.(storeA) ) &((idnode_pre)  # "IdNode" ->ₛ "link") id )
.

Definition InsertObj_partial_solve_wit_2_pure := 
forall (idnode_pre: Z) (manager_pre: Z) (id: Z) (m: idmanager) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (id_map: Z) (htable: Z) (bytes: (@list Z)) (PreH1 : (idmanager_min_free_id m id )) (PreH2 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH3 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH4 : (idmanager_storeA m idnode_pre id )) (PreH5 : (manager_callee_id_max = (m.(idmax) ))) (PreH6 : (manager_callee_hoffset = (m.(hoffset) ))) ,
  ((( &( "head" ) )) # Ptr  |-> (htable + ((id % ( manager_callee_hoffset ) ) * sizeof( "SysDoubleLinklistNode" ))))
  **  ((( &( "idnode" ) )) # Ptr  |-> idnode_pre)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "id")) # UShort  |-> id)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_prev")) # Ptr  |->_)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_next")) # Ptr  |->_)
|--
  “ ((htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) = (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" )))) ” 
  &&  “ (idmanager_min_free_id m id ) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (idmanager_storeA m idnode_pre id ) ” 
  &&  “ ((m.(idmax) ) = (m.(idmax) )) ” 
  &&  “ ((m.(hoffset) ) = (m.(hoffset) )) ”
.

Definition InsertObj_partial_solve_wit_2_aux := 
forall (idnode_pre: Z) (manager_pre: Z) (id: Z) (m: idmanager) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (id_map: Z) (htable: Z) (bytes: (@list Z)) (PreH1 : (idmanager_min_free_id m id )) (PreH2 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH3 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH4 : (idmanager_storeA m idnode_pre id )) (PreH5 : (manager_callee_id_max = (m.(idmax) ))) (PreH6 : (manager_callee_hoffset = (m.(hoffset) ))) ,
  ((( &( "head" ) )) # Ptr  |-> (htable + ((id % ( manager_callee_hoffset ) ) * sizeof( "SysDoubleLinklistNode" ))))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_callee_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_callee_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "id")) # UShort  |-> id)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_prev")) # Ptr  |->_)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_next")) # Ptr  |->_)
|--
  “ ((htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) = (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" )))) ” 
  &&  “ (idmanager_min_free_id m id ) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (idmanager_storeA m idnode_pre id ) ” 
  &&  “ ((m.(idmax) ) = (m.(idmax) )) ” 
  &&  “ ((m.(hoffset) ) = (m.(hoffset) )) ” 
  &&  “ (idmanager_min_free_id m id ) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (idmanager_storeA m idnode_pre id ) ” 
  &&  “ (manager_callee_id_max = (m.(idmax) )) ” 
  &&  “ (manager_callee_hoffset = (m.(hoffset) )) ”
  &&  ((( &( "head" ) )) # Ptr  |-> (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> (m.(idmax) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> (m.(hoffset) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "id")) # UShort  |-> id)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_prev")) # Ptr  |->_)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_next")) # Ptr  |->_)
.

Definition InsertObj_partial_solve_wit_2 := InsertObj_partial_solve_wit_2_pure -> InsertObj_partial_solve_wit_2_aux.

Definition InsertObj_partial_solve_wit_3_empty_bucket := 
forall (idnode_pre: Z) (manager_pre: Z) (id: Z) (m: idmanager) (manager_callee_hoffset: Z) (manager_callee_id_max: Z) (id_map: Z) (htable: Z) (bytes: (@list Z)) (head_node_next: Z) (head_node_prev: Z) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (prev: Z) (next: Z) (PreH1 : (head_node_prev = 0)) (PreH2 : (bucket = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH3 : ((htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) = (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH4 : (idmanager_min_free_id m id )) (PreH5 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH6 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH7 : (idmanager_storeA m idnode_pre id )) (PreH8 : ((m.(idmax) ) = (m.(idmax) ))) (PreH9 : ((m.(hoffset) ) = (m.(hoffset) ))) (PreH10 : (bucket = (@nil Z))) (PreH11 : (nodes = (@nil (@DL_Node Z)))) (PreH12 : ((map (getData) (nodes)) = bucket)) (PreH13 : (prev = 0)) (PreH14 : (next = 0)) (PreH15 : (head_node_prev = 0)) (PreH16 : (head_node_next = 0)) (PreH17 : (idmanager_min_free_id m id )) (PreH18 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH19 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH20 : (idmanager_storeA m idnode_pre id )) (PreH21 : (manager_callee_id_max = (m.(idmax) ))) (PreH22 : (manager_callee_hoffset = (m.(hoffset) ))) ,
  ((&((idnode_pre)  # "IdNode" ->ₛ "id")) # UShort  |-> id)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> (m.(hoffset) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> (m.(idmax) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&(((htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> head_node_prev)
  **  ((&(((htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_node_next)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_prev")) # Ptr  |->_)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_next")) # Ptr  |->_)
|--
  “ (head_node_prev = 0) ” 
  &&  “ (bucket = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z)))) ” 
  &&  “ (idmanager_min_free_id m id ) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (idmanager_storeA m idnode_pre id ) ” 
  &&  “ (bucket = (@nil Z)) ” 
  &&  “ (nodes = (@nil (@DL_Node Z))) ” 
  &&  “ ((map (getData) (nodes)) = bucket) ” 
  &&  “ (prev = 0) ” 
  &&  “ (next = 0) ” 
  &&  “ (head_node_prev = 0) ” 
  &&  “ (head_node_next = 0) ” 
  &&  “ (idmanager_min_free_id m id ) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (idmanager_storeA m idnode_pre id ) ” 
  &&  “ (manager_callee_id_max = (m.(idmax) )) ” 
  &&  “ (manager_callee_hoffset = (m.(hoffset) )) ”
  &&  ((&(((htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> 0)
  **  ((&(((htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> 0)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "id")) # UShort  |-> id)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> (m.(hoffset) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> (m.(idmax) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_prev")) # Ptr  |->_)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_next")) # Ptr  |->_)
.

Definition InsertObj_partial_solve_wit_4_empty_bucket_pure := 
forall (idnode_pre: Z) (manager_pre: Z) (id: Z) (m: idmanager) (id_map: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (head: Z) (manager_id_max: Z) (manager_hoffset: Z) (PreH1 : (head = (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH2 : (idmanager_min_free_id m id )) (PreH3 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH4 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH5 : (bucket = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH6 : ((map (getData) (nodes)) = bucket)) (PreH7 : (idmanager_storeA m idnode_pre id )) (PreH8 : (manager_id_max = (m.(idmax) ))) (PreH9 : (manager_hoffset = (m.(hoffset) ))) ,
  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((( &( "idnode" ) )) # Ptr  |-> idnode_pre)
  **  ((( &( "head" ) )) # Ptr  |-> head)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (store_dll (store_idnode ((m.(storeA) ))) head nodes )
  **  (store_idnode_unlinked (m.(storeA) ) &((idnode_pre)  # "IdNode" ->ₛ "link") id )
|--
  “ (head = (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" )))) ”
.

Definition InsertObj_partial_solve_wit_4_empty_bucket_aux := 
forall (idnode_pre: Z) (manager_pre: Z) (id: Z) (m: idmanager) (id_map: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (head: Z) (manager_id_max: Z) (manager_hoffset: Z) (PreH1 : (head = (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH2 : (idmanager_min_free_id m id )) (PreH3 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH4 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH5 : (bucket = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH6 : ((map (getData) (nodes)) = bucket)) (PreH7 : (idmanager_storeA m idnode_pre id )) (PreH8 : (manager_id_max = (m.(idmax) ))) (PreH9 : (manager_hoffset = (m.(hoffset) ))) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (store_dll (store_idnode ((m.(storeA) ))) head nodes )
  **  (store_idnode_unlinked (m.(storeA) ) &((idnode_pre)  # "IdNode" ->ₛ "link") id )
|--
  “ (head = (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" )))) ” 
  &&  “ (head = (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" )))) ” 
  &&  “ (idmanager_min_free_id m id ) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (bucket = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z)))) ” 
  &&  “ ((map (getData) (nodes)) = bucket) ” 
  &&  “ (idmanager_storeA m idnode_pre id ) ” 
  &&  “ (manager_id_max = (m.(idmax) )) ” 
  &&  “ (manager_hoffset = (m.(hoffset) )) ”
  &&  (store_dll (store_idnode ((m.(storeA) ))) head nodes )
  **  (store_idnode_unlinked (m.(storeA) ) &((idnode_pre)  # "IdNode" ->ₛ "link") id )
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
.

Definition InsertObj_partial_solve_wit_4_empty_bucket := InsertObj_partial_solve_wit_4_empty_bucket_pure -> InsertObj_partial_solve_wit_4_empty_bucket_aux.

Definition InsertObj_partial_solve_wit_5_linked_bucket_pure := 
forall (idnode_pre: Z) (manager_pre: Z) (id: Z) (m: idmanager) (id_map: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (head: Z) (manager_id_max: Z) (manager_hoffset: Z) (PreH1 : (head = (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH2 : (idmanager_min_free_id m id )) (PreH3 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH4 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH5 : (bucket = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH6 : ((map (getData) (nodes)) = bucket)) (PreH7 : (idmanager_storeA m idnode_pre id )) (PreH8 : (manager_id_max = (m.(idmax) ))) (PreH9 : (manager_hoffset = (m.(hoffset) ))) ,
  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((( &( "idnode" ) )) # Ptr  |-> idnode_pre)
  **  ((( &( "head" ) )) # Ptr  |-> head)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (store_dll (store_idnode ((m.(storeA) ))) head nodes )
  **  (store_idnode_unlinked (m.(storeA) ) &((idnode_pre)  # "IdNode" ->ₛ "link") id )
|--
  “ (head = (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" )))) ”
.

Definition InsertObj_partial_solve_wit_5_linked_bucket_aux := 
forall (idnode_pre: Z) (manager_pre: Z) (id: Z) (m: idmanager) (id_map: Z) (htable: Z) (bytes: (@list Z)) (bucket: (@list Z)) (nodes: (@list (@DL_Node Z))) (head: Z) (manager_id_max: Z) (manager_hoffset: Z) (PreH1 : (head = (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH2 : (idmanager_min_free_id m id )) (PreH3 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH4 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH5 : (bucket = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH6 : ((map (getData) (nodes)) = bucket)) (PreH7 : (idmanager_storeA m idnode_pre id )) (PreH8 : (manager_id_max = (m.(idmax) ))) (PreH9 : (manager_hoffset = (m.(hoffset) ))) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (store_dll (store_idnode ((m.(storeA) ))) head nodes )
  **  (store_idnode_unlinked (m.(storeA) ) &((idnode_pre)  # "IdNode" ->ₛ "link") id )
|--
  “ (head = (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" )))) ” 
  &&  “ (head = (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" )))) ” 
  &&  “ (idmanager_min_free_id m id ) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (bucket = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z)))) ” 
  &&  “ ((map (getData) (nodes)) = bucket) ” 
  &&  “ (idmanager_storeA m idnode_pre id ) ” 
  &&  “ (manager_id_max = (m.(idmax) )) ” 
  &&  “ (manager_hoffset = (m.(hoffset) )) ”
  &&  (store_dll (store_idnode ((m.(storeA) ))) head nodes )
  **  (store_idnode_unlinked (m.(storeA) ) &((idnode_pre)  # "IdNode" ->ₛ "link") id )
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
.

Definition InsertObj_partial_solve_wit_5_linked_bucket := InsertObj_partial_solve_wit_5_linked_bucket_pure -> InsertObj_partial_solve_wit_5_linked_bucket_aux.

Definition InsertObj_which_implies_wit_1 := 
(
forall (idnode_pre: Z) (manager_pre: Z) (id: Z) (m: idmanager) ,
  (store_idmanager_allocated_unlinked m manager_pre id )
  **  (store_idnode_unlinked (m.(storeA) ) &((idnode_pre)  # "IdNode" ->ₛ "link") id )
|--
  EX (htable: Z)  (id_map: Z)  (manager_pre_hoffset: Z)  (manager_pre_id_max: Z)  (bytes: (@list Z)) ,
  “ (idmanager_min_free_id m id ) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (idmanager_storeA m idnode_pre id ) ” 
  &&  “ (manager_pre_id_max = (m.(idmax) )) ” 
  &&  “ (manager_pre_hoffset = (m.(hoffset) )) ”
  &&  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_pre_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_pre_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "id")) # UShort  |-> id)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_prev")) # Ptr  |->_)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_next")) # Ptr  |->_)
) \/
(
forall (idnode_pre: Z) (manager_pre: Z) (id: Z) (m: idmanager) ,
  (store_idmanager_allocated_unlinked m manager_pre id )
  **  (store_idnode_unlinked (m.(storeA) ) &((idnode_pre)  # "IdNode" ->ₛ "link") id )
|--
  EX (x_2: Z)  (x: Z)  (htable: Z)  (id_map: Z)  (bytes: (@list Z)) ,
  “ (idmanager_min_free_id m id ) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (idmanager_storeA m idnode_pre id ) ”
  &&  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_next")) # Ptr  |-> x_2)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_prev")) # Ptr  |-> x)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> (m.(idmax) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> (m.(hoffset) ))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "id")) # UShort  |-> id)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
).

Definition InsertObj_which_implies_wit_2 := 
forall (idnode_pre: Z) (manager_pre: Z) (id: Z) (m: idmanager) (id_map: Z) (htable: Z) (bytes: (@list Z)) (head: Z) (manager_id_max: Z) (manager_hoffset: Z) (PreH1 : (head = (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))))) (PreH2 : (idmanager_min_free_id m id )) (PreH3 : (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes )) (PreH4 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH5 : (idmanager_storeA m idnode_pre id )) (PreH6 : (manager_id_max = (m.(idmax) ))) (PreH7 : (manager_hoffset = (m.(hoffset) ))) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "id")) # UShort  |-> id)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets (m.(storeA) ) htable (m.(hoffset) ) (m.(idbuckets) ) )
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_prev")) # Ptr  |->_)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_next")) # Ptr  |->_)
|--
  (EX (head_node_next: Z)  (head_node_prev: Z)  (next: Z)  (prev: Z)  (nodes: (@list (@DL_Node Z)))  (bucket: (@list Z)) ,
  “ (bucket = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z)))) ” 
  &&  “ (head = (htable + ((id % ( manager_hoffset ) ) * sizeof( "SysDoubleLinklistNode" )))) ” 
  &&  “ (idmanager_min_free_id m id ) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (idmanager_storeA m idnode_pre id ) ” 
  &&  “ (manager_id_max = (m.(idmax) )) ” 
  &&  “ (manager_hoffset = (m.(hoffset) )) ” 
  &&  “ (bucket = (@nil Z)) ” 
  &&  “ (nodes = (@nil (@DL_Node Z))) ” 
  &&  “ ((map (getData) (nodes)) = bucket) ” 
  &&  “ (prev = 0) ” 
  &&  “ (next = 0) ” 
  &&  “ (head_node_prev = 0) ” 
  &&  “ (head_node_next = 0) ”
  &&  ((&((idnode_pre)  # "IdNode" ->ₛ "id")) # UShort  |-> id)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> head_node_prev)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> head_node_next)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_prev")) # Ptr  |->_)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_next")) # Ptr  |->_))
  ||
  (EX (next_2: Z)  (prev_2: Z)  (nodes_2: (@list (@DL_Node Z)))  (bucket_2: (@list Z)) ,
  “ (bucket_2 = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z)))) ” 
  &&  “ (head = (htable + ((id % ( manager_hoffset ) ) * sizeof( "SysDoubleLinklistNode" )))) ” 
  &&  “ (idmanager_min_free_id m id ) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (idlist_add (id) ((m.(idlist) ))) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (idmanager_storeA m idnode_pre id ) ” 
  &&  “ (manager_id_max = (m.(idmax) )) ” 
  &&  “ (manager_hoffset = (m.(hoffset) )) ” 
  &&  “ ((map (getData) (nodes_2)) = bucket_2) ” 
  &&  “ (prev_2 <> 0) ” 
  &&  “ (next_2 <> 0) ”
  &&  ((&((idnode_pre)  # "IdNode" ->ₛ "id")) # UShort  |-> id)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev_2)
  **  ((&((head)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_2)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket_2 (m.(idbuckets) ) )
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_prev")) # Ptr  |->_)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_next")) # Ptr  |->_)
  **  (dllseg (store_idnode ((m.(storeA) ))) next_2 head head prev_2 nodes_2 ))
.

Module Type VC_Correct.

Axiom proof_of_InsertObj_safety_wit_1 : InsertObj_safety_wit_1.
Axiom proof_of_InsertObj_safety_wit_2_linked_bucket : InsertObj_safety_wit_2_linked_bucket.
Axiom proof_of_InsertObj_safety_wit_3_empty_bucket : InsertObj_safety_wit_3_empty_bucket.
Axiom proof_of_InsertObj_safety_wit_4_linked_bucket : InsertObj_safety_wit_4_linked_bucket.
Axiom proof_of_InsertObj_safety_wit_5_empty_bucket : InsertObj_safety_wit_5_empty_bucket.
Axiom proof_of_InsertObj_entail_wit_1_empty_bucket : InsertObj_entail_wit_1_empty_bucket.
Axiom proof_of_InsertObj_entail_wit_2_linked_bucket : InsertObj_entail_wit_2_linked_bucket.
Axiom proof_of_InsertObj_entail_wit_3_linked_bucket : InsertObj_entail_wit_3_linked_bucket.
Axiom proof_of_InsertObj_entail_wit_4_empty_bucket : InsertObj_entail_wit_4_empty_bucket.
Axiom proof_of_InsertObj_entail_wit_5_empty_bucket : InsertObj_entail_wit_5_empty_bucket.
Axiom proof_of_InsertObj_entail_wit_6_linked_bucket : InsertObj_entail_wit_6_linked_bucket.
Axiom proof_of_InsertObj_return_wit_1_empty_bucket : InsertObj_return_wit_1_empty_bucket.
Axiom proof_of_InsertObj_return_wit_2_linked_bucket : InsertObj_return_wit_2_linked_bucket.
Axiom proof_of_InsertObj_partial_solve_wit_1 : InsertObj_partial_solve_wit_1.
Axiom proof_of_InsertObj_partial_solve_wit_2_pure : InsertObj_partial_solve_wit_2_pure.
Axiom proof_of_InsertObj_partial_solve_wit_2 : InsertObj_partial_solve_wit_2.
Axiom proof_of_InsertObj_partial_solve_wit_3_empty_bucket : InsertObj_partial_solve_wit_3_empty_bucket.
Axiom proof_of_InsertObj_partial_solve_wit_4_empty_bucket_pure : InsertObj_partial_solve_wit_4_empty_bucket_pure.
Axiom proof_of_InsertObj_partial_solve_wit_4_empty_bucket : InsertObj_partial_solve_wit_4_empty_bucket.
Axiom proof_of_InsertObj_partial_solve_wit_5_linked_bucket_pure : InsertObj_partial_solve_wit_5_linked_bucket_pure.
Axiom proof_of_InsertObj_partial_solve_wit_5_linked_bucket : InsertObj_partial_solve_wit_5_linked_bucket.
Axiom proof_of_InsertObj_which_implies_wit_1 : InsertObj_which_implies_wit_1.
Axiom proof_of_InsertObj_which_implies_wit_2 : InsertObj_which_implies_wit_2.

End VC_Correct.
