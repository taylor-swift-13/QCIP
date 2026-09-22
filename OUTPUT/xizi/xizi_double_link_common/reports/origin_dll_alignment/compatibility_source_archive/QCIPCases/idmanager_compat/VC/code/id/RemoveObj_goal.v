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

(*----- Function RemoveObj -----*)

Definition RemoveObj_return_wit_1 := 
(
forall (idnode_pre: Z) (manager_pre: Z) (id: Z) (m: idmanager) (manager_hoffset: Z) (manager_id_max: Z) (id_map: Z) (htable: Z) (bytes: (@list Z)) (prefix: (@list (@DL_Node Z))) (suffix: (@list (@DL_Node Z))) (bucket: (@list Z)) (PreH1 : (0 <= id)) (PreH2 : (id < (m.(idmax) ))) (PreH3 : (id_map_bytes_ok (m.(idmax) ) (idlist_remove (id) ((m.(idlist) ))) bytes )) (PreH4 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH5 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (idlist_remove (id) ((m.(idlist) ))) (idmanager_remove_bucket ((m.(hoffset) )) (id) ((m.(idbuckets) ))) )) (PreH6 : (bucket = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH7 : (bucket = (map (getData) ((app (prefix) ((cons ((Build_DL_Node (id) (&((idnode_pre)  # "IdNode" ->ₛ "link")))) (suffix)))))))) (PreH8 : ((idlist_remove (id) (bucket)) = (map (getData) ((app (prefix) (suffix)))))) (PreH9 : (idmanager_storeA m idnode_pre id )) (PreH10 : (manager_id_max = (m.(idmax) ))) (PreH11 : (manager_hoffset = (m.(hoffset) ))) ,
  (store_dll (store_idnode ((m.(storeA) ))) (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) (app (prefix) (suffix)) )
  **  (store_idnode (m.(storeA) ) &((idnode_pre)  # "IdNode" ->ₛ "link") id )
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_next")) # Ptr  |-> &((idnode_pre)  # "IdNode" ->ₛ "link"))
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_prev")) # Ptr  |-> &((idnode_pre)  # "IdNode" ->ₛ "link"))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
|--
  (store_idmanager_removeobj_post m manager_pre idnode_pre id )
) \/
(
forall (idnode_pre: Z) (manager_pre: Z) (id: Z) (m: idmanager) (manager_hoffset: Z) (manager_id_max: Z) (id_map: Z) (htable: Z) (bytes: (@list Z)) (prefix: (@list (@DL_Node Z))) (suffix: (@list (@DL_Node Z))) (bucket: (@list Z)) (PreH1 : (0 <= id)) (PreH2 : (id < (m.(idmax) ))) (PreH3 : (id_map_bytes_ok (m.(idmax) ) (idlist_remove (id) ((m.(idlist) ))) bytes )) (PreH4 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH5 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (idlist_remove (id) ((m.(idlist) ))) (idmanager_remove_bucket ((m.(hoffset) )) (id) ((m.(idbuckets) ))) )) (PreH6 : (bucket = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH7 : (bucket = (map (getData) ((app (prefix) ((cons ((Build_DL_Node (id) (&((idnode_pre)  # "IdNode" ->ₛ "link")))) (suffix)))))))) (PreH8 : ((idlist_remove (id) (bucket)) = (map (getData) ((app (prefix) (suffix)))))) (PreH9 : (idmanager_storeA m idnode_pre id )) (PreH10 : (manager_id_max = (m.(idmax) ))) (PreH11 : (manager_hoffset = (m.(hoffset) ))) ,
  (store_dll (store_idnode ((m.(storeA) ))) (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) (app (prefix) (suffix)) )
  **  (store_idnode (m.(storeA) ) &((idnode_pre)  # "IdNode" ->ₛ "link") id )
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_next")) # Ptr  |-> &((idnode_pre)  # "IdNode" ->ₛ "link"))
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_prev")) # Ptr  |-> &((idnode_pre)  # "IdNode" ->ₛ "link"))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
|--
  (store_idmanager_removeobj_post m manager_pre idnode_pre id )
).

Definition RemoveObj_return_wit_1_split_goal_spatial := 
forall (idnode_pre: Z) (manager_pre: Z) (id: Z) (m: idmanager) (manager_hoffset: Z) (manager_id_max: Z) (id_map: Z) (htable: Z) (bytes: (@list Z)) (prefix: (@list (@DL_Node Z))) (suffix: (@list (@DL_Node Z))) (bucket: (@list Z)) (PreH1 : (0 <= id)) (PreH2 : (id < (m.(idmax) ))) (PreH3 : (id_map_bytes_ok (m.(idmax) ) (idlist_remove (id) ((m.(idlist) ))) bytes )) (PreH4 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH5 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (idlist_remove (id) ((m.(idlist) ))) (idmanager_remove_bucket ((m.(hoffset) )) (id) ((m.(idbuckets) ))) )) (PreH6 : (bucket = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH7 : (bucket = (map (getData) ((app (prefix) ((cons ((Build_DL_Node (id) (&((idnode_pre)  # "IdNode" ->ₛ "link")))) (suffix)))))))) (PreH8 : ((idlist_remove (id) (bucket)) = (map (getData) ((app (prefix) (suffix)))))) (PreH9 : (idmanager_storeA m idnode_pre id )) (PreH10 : (manager_id_max = (m.(idmax) ))) (PreH11 : (manager_hoffset = (m.(hoffset) ))) ,
  (store_dll (store_idnode ((m.(storeA) ))) (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) (app (prefix) (suffix)) )
  **  (store_idnode (m.(storeA) ) &((idnode_pre)  # "IdNode" ->ₛ "link") id )
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_next")) # Ptr  |-> &((idnode_pre)  # "IdNode" ->ₛ "link"))
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_prev")) # Ptr  |-> &((idnode_pre)  # "IdNode" ->ₛ "link"))
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
|--
  (store_idmanager_removeobj_post m manager_pre idnode_pre id )
.

Definition RemoveObj_partial_solve_wit_1 := 
forall (idnode_pre: Z) (manager_pre: Z) (id: Z) (m: idmanager) ,
  (store_idmanager_remove_ready m manager_pre idnode_pre id )
|--
  (store_idmanager_remove_ready m manager_pre idnode_pre id )
.

Definition RemoveObj_partial_solve_wit_2 := 
forall (idnode_pre: Z) (manager_pre: Z) (id: Z) (m: idmanager) (manager_hoffset: Z) (manager_id_max: Z) (id_map: Z) (htable: Z) (bytes: (@list Z)) (prefix: (@list (@DL_Node Z))) (suffix: (@list (@DL_Node Z))) (bucket: (@list Z)) (PreH1 : (0 <= id)) (PreH2 : (id < (m.(idmax) ))) (PreH3 : (id_map_bytes_ok (m.(idmax) ) (idlist_remove (id) ((m.(idlist) ))) bytes )) (PreH4 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) )) (PreH5 : (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (idlist_remove (id) ((m.(idlist) ))) (idmanager_remove_bucket ((m.(hoffset) )) (id) ((m.(idbuckets) ))) )) (PreH6 : (bucket = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) (PreH7 : (bucket = (map (getData) ((app (prefix) ((cons ((Build_DL_Node (id) (&((idnode_pre)  # "IdNode" ->ₛ "link")))) (suffix)))))))) (PreH8 : ((idlist_remove (id) (bucket)) = (map (getData) ((app (prefix) (suffix)))))) (PreH9 : (idmanager_storeA m idnode_pre id )) (PreH10 : (manager_id_max = (m.(idmax) ))) (PreH11 : (manager_hoffset = (m.(hoffset) ))) ,
  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (store_dll (store_idnode ((m.(storeA) ))) (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) (app (prefix) ((cons ((Build_DL_Node (id) (&((idnode_pre)  # "IdNode" ->ₛ "link")))) (suffix)))) )
|--
  “ (0 <= id) ” 
  &&  “ (id < (m.(idmax) )) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (idlist_remove (id) ((m.(idlist) ))) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (idlist_remove (id) ((m.(idlist) ))) (idmanager_remove_bucket ((m.(hoffset) )) (id) ((m.(idbuckets) ))) ) ” 
  &&  “ (bucket = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z)))) ” 
  &&  “ (bucket = (map (getData) ((app (prefix) ((cons ((Build_DL_Node (id) (&((idnode_pre)  # "IdNode" ->ₛ "link")))) (suffix))))))) ” 
  &&  “ ((idlist_remove (id) (bucket)) = (map (getData) ((app (prefix) (suffix))))) ” 
  &&  “ (idmanager_storeA m idnode_pre id ) ” 
  &&  “ (manager_id_max = (m.(idmax) )) ” 
  &&  “ (manager_hoffset = (m.(hoffset) )) ”
  &&  (store_dll (store_idnode ((m.(storeA) ))) (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) (app (prefix) ((cons ((Build_DL_Node (id) (&((idnode_pre)  # "IdNode" ->ₛ "link")))) (suffix)))) )
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager_pre)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
.

Definition RemoveObj_which_implies_wit_1 := 
(
forall (id: Z) (m: idmanager) (idnode: Z) (manager: Z) ,
  (store_idmanager_remove_ready m manager idnode id )
|--
  EX (htable: Z)  (id_map: Z)  (manager_hoffset: Z)  (manager_id_max: Z)  (prefix: (@list (@DL_Node Z)))  (suffix: (@list (@DL_Node Z)))  (bucket: (@list Z))  (bytes: (@list Z)) ,
  “ (0 <= id) ” 
  &&  “ (id < (m.(idmax) )) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (idlist_remove (id) ((m.(idlist) ))) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (idlist_remove (id) ((m.(idlist) ))) (idmanager_remove_bucket ((m.(hoffset) )) (id) ((m.(idbuckets) ))) ) ” 
  &&  “ (bucket = (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z)))) ” 
  &&  “ (bucket = (map (getData) ((app (prefix) ((cons ((Build_DL_Node (id) (&((idnode)  # "IdNode" ->ₛ "link")))) (suffix))))))) ” 
  &&  “ ((idlist_remove (id) (bucket)) = (map (getData) ((app (prefix) (suffix))))) ” 
  &&  “ (idmanager_storeA m idnode id ) ” 
  &&  “ (manager_id_max = (m.(idmax) )) ” 
  &&  “ (manager_hoffset = (m.(hoffset) )) ”
  &&  ((&((manager)  # "IdManager" ->ₛ "id_max")) # UShort  |-> manager_id_max)
  **  ((&((manager)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> manager_hoffset)
  **  ((&((manager)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) bucket (m.(idbuckets) ) )
  **  (store_dll (store_idnode ((m.(storeA) ))) (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) (app (prefix) ((cons ((Build_DL_Node (id) (&((idnode)  # "IdNode" ->ₛ "link")))) (suffix)))) )
) \/
(
forall (id: Z) (m: idmanager) (idnode: Z) (manager: Z) ,
  (store_idmanager_remove_ready m manager idnode id )
|--
  EX (htable: Z)  (id_map: Z)  (prefix: (@list (@DL_Node Z)))  (suffix: (@list (@DL_Node Z)))  (bytes: (@list Z)) ,
  “ (0 <= id) ” 
  &&  “ (id < (m.(idmax) )) ” 
  &&  “ (id_map_bytes_ok (m.(idmax) ) (idlist_remove (id) ((m.(idlist) ))) bytes ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (m.(idlist) ) (m.(idbuckets) ) ) ” 
  &&  “ (idbuckets_ok (m.(idmax) ) (m.(hoffset) ) (idlist_remove (id) ((m.(idlist) ))) (idmanager_remove_bucket ((m.(hoffset) )) (id) ((m.(idbuckets) ))) ) ” 
  &&  “ ((Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))) = (map (getData) ((app (prefix) ((cons ((Build_DL_Node (id) (&((idnode)  # "IdNode" ->ₛ "link")))) (suffix))))))) ” 
  &&  “ ((idlist_remove (id) ((Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))))) = (map (getData) ((app (prefix) (suffix))))) ” 
  &&  “ (idmanager_storeA m idnode id ) ”
  &&  ((&((manager)  # "IdManager" ->ₛ "id_max")) # UShort  |-> (m.(idmax) ))
  **  ((&((manager)  # "IdManager" ->ₛ "hoffset")) # UShort  |-> (m.(hoffset) ))
  **  ((&((manager)  # "IdManager" ->ₛ "id_map")) # Ptr  |-> id_map)
  **  ((&((manager)  # "IdManager" ->ₛ "htable")) # Ptr  |-> htable)
  **  (UCharArray.full id_map (((m.(idmax) ) + 7 ) ÷ 8 ) bytes )
  **  (store_idbuckets_except (m.(storeA) ) htable (id % ( (m.(hoffset) ) ) ) (Znth ((id % ( (m.(hoffset) ) ) )) ((m.(idbuckets) )) ((@nil Z))) (m.(idbuckets) ) )
  **  (store_dll (store_idnode ((m.(storeA) ))) (htable + ((id % ( (m.(hoffset) ) ) ) * sizeof( "SysDoubleLinklistNode" ))) (app (prefix) ((cons ((Build_DL_Node (id) (&((idnode)  # "IdNode" ->ₛ "link")))) (suffix)))) )
).

Module Type VC_Correct.

Axiom proof_of_RemoveObj_return_wit_1 : RemoveObj_return_wit_1.
Axiom proof_of_RemoveObj_partial_solve_wit_1 : RemoveObj_partial_solve_wit_1.
Axiom proof_of_RemoveObj_partial_solve_wit_2 : RemoveObj_partial_solve_wit_2.
Axiom proof_of_RemoveObj_which_implies_wit_1 : RemoveObj_which_implies_wit_1.

End VC_Correct.
