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

(*----- Function IdInsertObj -----*)

Definition IdInsertObj_safety_wit_1 := 
forall (idnode_pre: Z) (manager_pre: Z) (m: idmanager) ,
  ((( &( "alloc_id_ret" ) )) # Int  |->_)
  **  ((( &( "idnode" ) )) # Ptr  |-> idnode_pre)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  (store_idmanager m manager_pre )
  **  (store_idnode_insert_ready m idnode_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition IdInsertObj_safety_wit_2_alloc_failed := 
forall (idnode_pre: Z) (manager_pre: Z) (m: idmanager) (retval: Z) (PreH1 : (retval = (-1))) (PreH2 : ((idmanager_first_free_id (m)) = None)) ,
  ((( &( "alloc_id_ret" ) )) # Int  |-> retval)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((( &( "idnode" ) )) # Ptr  |-> idnode_pre)
  **  (store_idmanager m manager_pre )
  **  (store_idnode_insert_ready m idnode_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition IdInsertObj_safety_wit_3_alloc_succeeded := 
forall (idnode_pre: Z) (manager_pre: Z) (m: idmanager) (retval: Z) (PreH1 : (0 <= retval)) (PreH2 : (retval < (m.(idmax) ))) (PreH3 : (retval < 65536)) (PreH4 : (idmanager_min_free_id m retval )) ,
  ((( &( "alloc_id_ret" ) )) # Int  |-> retval)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((( &( "idnode" ) )) # Ptr  |-> idnode_pre)
  **  (store_idmanager_allocated_unlinked m manager_pre retval )
  **  (store_idnode_insert_ready m idnode_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition IdInsertObj_safety_wit_4_alloc_failed := 
forall (idnode_pre: Z) (manager_pre: Z) (m: idmanager) (retval: Z) (PreH1 : (retval >= 0)) (PreH2 : (retval = (-1))) (PreH3 : ((idmanager_first_free_id (m)) = None)) ,
  ((( &( "alloc_id_ret" ) )) # Int  |-> retval)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((( &( "idnode" ) )) # Ptr  |-> idnode_pre)
  **  (store_idmanager m manager_pre )
  **  (store_idnode_insert_ready m idnode_pre )
|--
  “ False ”
.

Definition IdInsertObj_safety_wit_5_alloc_succeeded := 
forall (idnode_pre: Z) (manager_pre: Z) (m: idmanager) (retval: Z) (PreH1 : (retval < 0)) (PreH2 : (0 <= retval)) (PreH3 : (retval < (m.(idmax) ))) (PreH4 : (retval < 65536)) (PreH5 : (idmanager_min_free_id m retval )) ,
  ((( &( "alloc_id_ret" ) )) # Int  |-> retval)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((( &( "idnode" ) )) # Ptr  |-> idnode_pre)
  **  (store_idmanager_allocated_unlinked m manager_pre retval )
  **  (store_idnode_insert_ready m idnode_pre )
|--
  “ False ”
.

Definition IdInsertObj_safety_wit_6_alloc_failed := 
forall (idnode_pre: Z) (manager_pre: Z) (m: idmanager) (retval: Z) (PreH1 : (retval < 0)) (PreH2 : (retval = (-1))) (PreH3 : ((idmanager_first_free_id (m)) = None)) ,
  ((( &( "alloc_id_ret" ) )) # Int  |-> retval)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((( &( "idnode" ) )) # Ptr  |-> idnode_pre)
  **  (store_idmanager m manager_pre )
  **  (store_idnode_insert_ready m idnode_pre )
|--
  “ (1 <> (INT_MIN)) ”
.

Definition IdInsertObj_safety_wit_7_alloc_failed := 
forall (idnode_pre: Z) (manager_pre: Z) (m: idmanager) (retval: Z) (PreH1 : (retval < 0)) (PreH2 : (retval = (-1))) (PreH3 : ((idmanager_first_free_id (m)) = None)) ,
  ((( &( "alloc_id_ret" ) )) # Int  |-> retval)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((( &( "idnode" ) )) # Ptr  |-> idnode_pre)
  **  (store_idmanager m manager_pre )
  **  (store_idnode_insert_ready m idnode_pre )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition IdInsertObj_entail_wit_1_alloc_succeeded := 
(
forall (idnode_pre: Z) (manager_pre: Z) (m: idmanager) (retval: Z) (alloc_id: Z) (PreH1 : (alloc_id = retval)) (PreH2 : (idmanager_min_free_id m alloc_id )) (PreH3 : (0 <= alloc_id)) (PreH4 : (alloc_id < (m.(idmax) ))) (PreH5 : (alloc_id < 65536)) (PreH6 : (idmanager_storeA m idnode_pre alloc_id )) (PreH7 : (retval >= 0)) (PreH8 : (0 <= retval)) (PreH9 : (retval < (m.(idmax) ))) (PreH10 : (retval < 65536)) (PreH11 : (idmanager_min_free_id m retval )) ,
  (store_idmanager_allocated_unlinked m manager_pre alloc_id )
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "id")) # UShort  |-> retval)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_prev")) # Ptr  |->_)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_next")) # Ptr  |->_)
|--
  “ (idmanager_min_free_id m retval ) ”
  &&  (store_idmanager_allocated_unlinked m manager_pre retval )
  **  (store_idnode_unlinked (m.(storeA) ) &((idnode_pre)  # "IdNode" ->ₛ "link") retval )
) \/
(
forall (idnode_pre: Z) (manager_pre: Z) (m: idmanager) (retval: Z) (alloc_id: Z) (PreH1 : (alloc_id = retval)) (PreH2 : (idmanager_min_free_id m alloc_id )) (PreH3 : (0 <= alloc_id)) (PreH4 : (alloc_id < (m.(idmax) ))) (PreH5 : (alloc_id < 65536)) (PreH6 : (idmanager_storeA m idnode_pre alloc_id )) (PreH7 : (retval >= 0)) (PreH8 : (0 <= retval)) (PreH9 : (retval < (m.(idmax) ))) (PreH10 : (retval < 65536)) (PreH11 : (idmanager_min_free_id m retval )) ,
  (store_idmanager_allocated_unlinked m manager_pre alloc_id )
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "id")) # UShort  |-> retval)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_prev")) # Ptr  |->_)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_next")) # Ptr  |->_)
|--
  (store_idmanager_allocated_unlinked m manager_pre retval )
  **  (store_idnode_unlinked (m.(storeA) ) &((idnode_pre)  # "IdNode" ->ₛ "link") retval )
).

Definition IdInsertObj_entail_wit_1_alloc_succeeded_split_goal_spatial := 
forall (idnode_pre: Z) (manager_pre: Z) (m: idmanager) (retval: Z) (alloc_id: Z) (PreH1 : (alloc_id = retval)) (PreH2 : (idmanager_min_free_id m alloc_id )) (PreH3 : (0 <= alloc_id)) (PreH4 : (alloc_id < (m.(idmax) ))) (PreH5 : (alloc_id < 65536)) (PreH6 : (idmanager_storeA m idnode_pre alloc_id )) (PreH7 : (retval >= 0)) (PreH8 : (0 <= retval)) (PreH9 : (retval < (m.(idmax) ))) (PreH10 : (retval < 65536)) (PreH11 : (idmanager_min_free_id m retval )) ,
  (store_idmanager_allocated_unlinked m manager_pre alloc_id )
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "id")) # UShort  |-> retval)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_prev")) # Ptr  |->_)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_next")) # Ptr  |->_)
|--
  (store_idmanager_allocated_unlinked m manager_pre retval )
  **  (store_idnode_unlinked (m.(storeA) ) &((idnode_pre)  # "IdNode" ->ₛ "link") retval )
.

Definition IdInsertObj_return_wit_1_alloc_succeeded := 
(
forall (idnode_pre: Z) (manager_pre: Z) (m: idmanager) (alloc_id: Z) (PreH1 : (idmanager_min_free_id m alloc_id )) ,
  (store_idmanager (idmanager_link ((idmanager_add (m) (alloc_id))) (alloc_id)) manager_pre )
|--
  (store_idmanager_insert_post m manager_pre idnode_pre alloc_id )
) \/
(
forall (idnode_pre: Z) (manager_pre: Z) (m: idmanager) (alloc_id: Z) (PreH1 : (idmanager_min_free_id m alloc_id )) ,
  (store_idmanager (idmanager_link ((idmanager_add (m) (alloc_id))) (alloc_id)) manager_pre )
|--
  (store_idmanager_insert_post m manager_pre idnode_pre alloc_id )
).

Definition IdInsertObj_return_wit_1_alloc_succeeded_split_goal_spatial := 
forall (idnode_pre: Z) (manager_pre: Z) (m: idmanager) (alloc_id: Z) (PreH1 : (idmanager_min_free_id m alloc_id )) ,
  (store_idmanager (idmanager_link ((idmanager_add (m) (alloc_id))) (alloc_id)) manager_pre )
|--
  (store_idmanager_insert_post m manager_pre idnode_pre alloc_id )
.

Definition IdInsertObj_return_wit_2_alloc_failed := 
(
forall (idnode_pre: Z) (manager_pre: Z) (m: idmanager) (retval: Z) (PreH1 : (retval < 0)) (PreH2 : (retval = (-1))) (PreH3 : ((idmanager_first_free_id (m)) = None)) ,
  (store_idmanager m manager_pre )
  **  (store_idnode_insert_ready m idnode_pre )
|--
  (store_idmanager_insert_post m manager_pre idnode_pre (-1) )
) \/
(
forall (idnode_pre: Z) (manager_pre: Z) (m: idmanager) (retval: Z) (PreH1 : (retval < 0)) (PreH2 : (retval = (-1))) (PreH3 : ((idmanager_first_free_id (m)) = None)) ,
  (store_idmanager m manager_pre )
  **  (store_idnode_insert_ready m idnode_pre )
|--
  (store_idmanager_insert_post m manager_pre idnode_pre (-1) )
).

Definition IdInsertObj_return_wit_2_alloc_failed_split_goal_spatial := 
forall (idnode_pre: Z) (manager_pre: Z) (m: idmanager) (retval: Z) (PreH1 : (retval < 0)) (PreH2 : (retval = (-1))) (PreH3 : ((idmanager_first_free_id (m)) = None)) ,
  (store_idmanager m manager_pre )
  **  (store_idnode_insert_ready m idnode_pre )
|--
  (store_idmanager_insert_post m manager_pre idnode_pre (-1) )
.

Definition IdInsertObj_partial_solve_wit_1 := 
forall (idnode_pre: Z) (manager_pre: Z) (m: idmanager) ,
  (store_idmanager m manager_pre )
  **  (store_idnode_insert_ready m idnode_pre )
|--
  (store_idmanager m manager_pre )
  **  (store_idnode_insert_ready m idnode_pre )
.

Definition IdInsertObj_partial_solve_wit_2 := 
forall (idnode_pre: Z) (manager_pre: Z) (m: idmanager) (retval: Z) ,
  (store_idmanager_allocid_post m manager_pre retval )
  **  (store_idnode_insert_ready m idnode_pre )
|--
  (store_idmanager_allocid_post m manager_pre retval )
  **  (store_idnode_insert_ready m idnode_pre )
.

Definition IdInsertObj_partial_solve_wit_3_alloc_succeeded_pure := 
forall (idnode_pre: Z) (manager_pre: Z) (m: idmanager) (retval: Z) (PreH1 : (retval >= 0)) (PreH2 : (0 <= retval)) (PreH3 : (retval < (m.(idmax) ))) (PreH4 : (retval < 65536)) (PreH5 : (idmanager_min_free_id m retval )) ,
  ((( &( "alloc_id_ret" ) )) # Int  |-> retval)
  **  ((( &( "manager" ) )) # Ptr  |-> manager_pre)
  **  ((( &( "idnode" ) )) # Ptr  |-> idnode_pre)
  **  (store_idmanager_allocated_unlinked m manager_pre retval )
  **  (store_idnode_insert_ready m idnode_pre )
|--
  “ (idmanager_min_free_id m retval ) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval < (m.(idmax) )) ” 
  &&  “ (retval < 65536) ”
.

Definition IdInsertObj_partial_solve_wit_3_alloc_succeeded_aux := 
forall (idnode_pre: Z) (manager_pre: Z) (m: idmanager) (retval: Z) (PreH1 : (retval >= 0)) (PreH2 : (0 <= retval)) (PreH3 : (retval < (m.(idmax) ))) (PreH4 : (retval < 65536)) (PreH5 : (idmanager_min_free_id m retval )) ,
  (store_idmanager_allocated_unlinked m manager_pre retval )
  **  (store_idnode_insert_ready m idnode_pre )
|--
  “ (idmanager_min_free_id m retval ) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval < (m.(idmax) )) ” 
  &&  “ (retval < 65536) ” 
  &&  “ (retval >= 0) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval < (m.(idmax) )) ” 
  &&  “ (retval < 65536) ” 
  &&  “ (idmanager_min_free_id m retval ) ”
  &&  (store_idmanager_allocated_unlinked m manager_pre retval )
  **  (store_idnode_insert_ready m idnode_pre )
.

Definition IdInsertObj_partial_solve_wit_3_alloc_succeeded := IdInsertObj_partial_solve_wit_3_alloc_succeeded_pure -> IdInsertObj_partial_solve_wit_3_alloc_succeeded_aux.

Definition IdInsertObj_partial_solve_wit_4_alloc_succeeded := 
forall (idnode_pre: Z) (manager_pre: Z) (m: idmanager) (alloc_id: Z) (PreH1 : (idmanager_min_free_id m alloc_id )) ,
  (store_idmanager_allocated_unlinked m manager_pre alloc_id )
  **  (store_idnode_unlinked (m.(storeA) ) &((idnode_pre)  # "IdNode" ->ₛ "link") alloc_id )
|--
  “ (idmanager_min_free_id m alloc_id ) ”
  &&  (store_idmanager_allocated_unlinked m manager_pre alloc_id )
  **  (store_idnode_unlinked (m.(storeA) ) &((idnode_pre)  # "IdNode" ->ₛ "link") alloc_id )
.

Definition IdInsertObj_which_implies_wit_1 := 
forall (idnode_pre: Z) (manager_pre: Z) (m: idmanager) (alloc_id_ret: Z) ,
  (store_idmanager_allocid_post m manager_pre alloc_id_ret )
  **  (store_idnode_insert_ready m idnode_pre )
|--
  (“ (alloc_id_ret = (-1)) ” 
  &&  “ ((idmanager_first_free_id (m)) = None) ”
  &&  (store_idmanager m manager_pre )
  **  (store_idnode_insert_ready m idnode_pre ))
  ||
  (“ (0 <= alloc_id_ret) ” 
  &&  “ (alloc_id_ret < (m.(idmax) )) ” 
  &&  “ (alloc_id_ret < 65536) ” 
  &&  “ (idmanager_min_free_id m alloc_id_ret ) ”
  &&  (store_idmanager_allocated_unlinked m manager_pre alloc_id_ret )
  **  (store_idnode_insert_ready m idnode_pre ))
.

Definition IdInsertObj_which_implies_wit_2 := 
(
forall (idnode_pre: Z) (manager_pre: Z) (m: idmanager) (alloc_id_ret: Z) (PreH1 : (idmanager_min_free_id m alloc_id_ret )) (PreH2 : (0 <= alloc_id_ret)) (PreH3 : (alloc_id_ret < (m.(idmax) ))) (PreH4 : (alloc_id_ret < 65536)) ,
  (store_idmanager_allocated_unlinked m manager_pre alloc_id_ret )
  **  (store_idnode_insert_ready m idnode_pre )
|--
  EX (alloc_id: Z) ,
  “ (alloc_id = alloc_id_ret) ” 
  &&  “ (idmanager_min_free_id m alloc_id ) ” 
  &&  “ (0 <= alloc_id) ” 
  &&  “ (alloc_id < (m.(idmax) )) ” 
  &&  “ (alloc_id < 65536) ” 
  &&  “ (idmanager_storeA m idnode_pre alloc_id ) ”
  &&  (store_idmanager_allocated_unlinked m manager_pre alloc_id )
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "id")) # UShort  |->_)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_prev")) # Ptr  |->_)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_next")) # Ptr  |->_)
) \/
(
forall (idnode_pre: Z) (manager_pre: Z) (m: idmanager) (alloc_id_ret: Z) (PreH1 : (idmanager_min_free_id m alloc_id_ret )) (PreH2 : (0 <= alloc_id_ret)) (PreH3 : (alloc_id_ret < (m.(idmax) ))) (PreH4 : (alloc_id_ret < 65536)) ,
  (store_idmanager_allocated_unlinked m manager_pre alloc_id_ret )
  **  (store_idnode_insert_ready m idnode_pre )
|--
  EX (x_3: Z)  (x_2: Z)  (x: Z) ,
  “ (idmanager_min_free_id m alloc_id_ret ) ” 
  &&  “ (0 <= alloc_id_ret) ” 
  &&  “ (alloc_id_ret < (m.(idmax) )) ” 
  &&  “ (alloc_id_ret < 65536) ” 
  &&  “ (idmanager_storeA m idnode_pre alloc_id_ret ) ”
  &&  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_next")) # Ptr  |-> x_3)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "link" .ₛ "node_prev")) # Ptr  |-> x_2)
  **  ((&((idnode_pre)  # "IdNode" ->ₛ "id")) # UShort  |-> x)
  **  (store_idmanager_allocated_unlinked m manager_pre alloc_id_ret )
).

Module Type VC_Correct.

Axiom proof_of_IdInsertObj_safety_wit_1 : IdInsertObj_safety_wit_1.
Axiom proof_of_IdInsertObj_safety_wit_2_alloc_failed : IdInsertObj_safety_wit_2_alloc_failed.
Axiom proof_of_IdInsertObj_safety_wit_3_alloc_succeeded : IdInsertObj_safety_wit_3_alloc_succeeded.
Axiom proof_of_IdInsertObj_safety_wit_4_alloc_failed : IdInsertObj_safety_wit_4_alloc_failed.
Axiom proof_of_IdInsertObj_safety_wit_5_alloc_succeeded : IdInsertObj_safety_wit_5_alloc_succeeded.
Axiom proof_of_IdInsertObj_safety_wit_6_alloc_failed : IdInsertObj_safety_wit_6_alloc_failed.
Axiom proof_of_IdInsertObj_safety_wit_7_alloc_failed : IdInsertObj_safety_wit_7_alloc_failed.
Axiom proof_of_IdInsertObj_entail_wit_1_alloc_succeeded : IdInsertObj_entail_wit_1_alloc_succeeded.
Axiom proof_of_IdInsertObj_return_wit_1_alloc_succeeded : IdInsertObj_return_wit_1_alloc_succeeded.
Axiom proof_of_IdInsertObj_return_wit_2_alloc_failed : IdInsertObj_return_wit_2_alloc_failed.
Axiom proof_of_IdInsertObj_partial_solve_wit_1 : IdInsertObj_partial_solve_wit_1.
Axiom proof_of_IdInsertObj_partial_solve_wit_2 : IdInsertObj_partial_solve_wit_2.
Axiom proof_of_IdInsertObj_partial_solve_wit_3_alloc_succeeded_pure : IdInsertObj_partial_solve_wit_3_alloc_succeeded_pure.
Axiom proof_of_IdInsertObj_partial_solve_wit_3_alloc_succeeded : IdInsertObj_partial_solve_wit_3_alloc_succeeded.
Axiom proof_of_IdInsertObj_partial_solve_wit_4_alloc_succeeded : IdInsertObj_partial_solve_wit_4_alloc_succeeded.
Axiom proof_of_IdInsertObj_which_implies_wit_1 : IdInsertObj_which_implies_wit_1.
Axiom proof_of_IdInsertObj_which_implies_wit_2 : IdInsertObj_which_implies_wit_2.

End VC_Correct.
