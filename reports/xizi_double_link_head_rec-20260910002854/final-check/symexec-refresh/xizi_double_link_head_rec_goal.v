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
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_head_rec.source
      Require Import xizi_double_link_head_rec_lib.
Local Open Scope sac.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_strategy_goal.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_strategy_proof.

(*----- Function DoubleLinkListGetHead -----*)

Definition DoubleLinkListGetHead_safety_wit_1 := 
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@XiziStoreADLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (first_link: Z) (last_link: Z) (PreH1 : (first_link = linklist_pre)) (PreH2 : (linklist_pre <> 0)) ,
  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_link)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last_link)
  **  (XiziStoreADLL.dllseg storeA_general first_link linklist_pre linklist_pre last_link nodes_general )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition DoubleLinkListGetHead_entail_wit_1 := 
(
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@XiziStoreADLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) ,
  (xizi_store_dll storeA_general linklist_pre nodes_general )
|--
  EX (last_link: Z)  (first_link: Z) ,
  “ (linklist_pre <> 0) ”
  &&  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_link)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last_link)
  **  (XiziStoreADLL.dllseg storeA_general first_link linklist_pre linklist_pre last_link nodes_general )
) \/
(
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@XiziStoreADLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) ,
  (xizi_store_dll storeA_general linklist_pre nodes_general )
|--
  EX (last_link: Z)  (first_link: Z) ,
  “ (linklist_pre <> 0) ”
  &&  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_link)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last_link)
  **  (XiziStoreADLL.dllseg storeA_general first_link linklist_pre linklist_pre last_link nodes_general )
).

Definition DoubleLinkListGetHead_return_wit_1 := 
(
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@XiziStoreADLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (first_link: Z) (last_link: Z) (PreH1 : (first_link = linklist_pre)) (PreH2 : (linklist_pre <> 0)) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_link)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last_link)
  **  (XiziStoreADLL.dllseg storeA_general first_link linklist_pre linklist_pre last_link nodes_general )
|--
  “ (0 = (xizi_double_link_first_value ((xizi_dll_ptrs (nodes_general))))) ”
  &&  (xizi_store_dll storeA_general linklist_pre nodes_general )
) \/
(
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@XiziStoreADLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (first_link: Z) (last_link: Z) (PreH1 : (first_link = linklist_pre)) (PreH2 : (linklist_pre <> 0)) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_link)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last_link)
  **  (XiziStoreADLL.dllseg storeA_general first_link linklist_pre linklist_pre last_link nodes_general )
|--
  “ (0 = (xizi_double_link_first_value ((xizi_dll_ptrs (nodes_general))))) ”
  &&  (xizi_store_dll storeA_general linklist_pre nodes_general )
).

Definition DoubleLinkListGetHead_return_wit_1_split_goal_1 := 
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@XiziStoreADLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (first_link: Z) (last_link: Z) (PreH1 : (first_link = linklist_pre)) (PreH2 : (linklist_pre <> 0)) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_link)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last_link)
  **  (XiziStoreADLL.dllseg storeA_general first_link linklist_pre linklist_pre last_link nodes_general )
|--
  “ (0 = (xizi_double_link_first_value ((xizi_dll_ptrs (nodes_general))))) ”
.

Definition DoubleLinkListGetHead_return_wit_1_split_goal_spatial := 
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@XiziStoreADLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (first_link: Z) (last_link: Z) (PreH1 : (first_link = linklist_pre)) (PreH2 : (linklist_pre <> 0)) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_link)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last_link)
  **  (XiziStoreADLL.dllseg storeA_general first_link linklist_pre linklist_pre last_link nodes_general )
|--
  (xizi_store_dll storeA_general linklist_pre nodes_general )
.

Definition DoubleLinkListGetHead_return_wit_2 := 
(
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@XiziStoreADLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (first_link: Z) (last_link: Z) (PreH1 : (first_link <> linklist_pre)) (PreH2 : (linklist_pre <> 0)) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_link)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last_link)
  **  (XiziStoreADLL.dllseg storeA_general first_link linklist_pre linklist_pre last_link nodes_general )
|--
  “ (first_link = (xizi_double_link_first_value ((xizi_dll_ptrs (nodes_general))))) ”
  &&  (xizi_store_dll storeA_general linklist_pre nodes_general )
) \/
(
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@XiziStoreADLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (first_link: Z) (last_link: Z) (PreH1 : (first_link <> linklist_pre)) (PreH2 : (linklist_pre <> 0)) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_link)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last_link)
  **  (XiziStoreADLL.dllseg storeA_general first_link linklist_pre linklist_pre last_link nodes_general )
|--
  “ (first_link = (xizi_double_link_first_value ((xizi_dll_ptrs (nodes_general))))) ”
  &&  (xizi_store_dll storeA_general linklist_pre nodes_general )
).

Definition DoubleLinkListGetHead_return_wit_2_split_goal_1 := 
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@XiziStoreADLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (first_link: Z) (last_link: Z) (PreH1 : (first_link <> linklist_pre)) (PreH2 : (linklist_pre <> 0)) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_link)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last_link)
  **  (XiziStoreADLL.dllseg storeA_general first_link linklist_pre linklist_pre last_link nodes_general )
|--
  “ (first_link = (xizi_double_link_first_value ((xizi_dll_ptrs (nodes_general))))) ”
.

Definition DoubleLinkListGetHead_return_wit_2_split_goal_spatial := 
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@XiziStoreADLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (first_link: Z) (last_link: Z) (PreH1 : (first_link <> linklist_pre)) (PreH2 : (linklist_pre <> 0)) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_link)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last_link)
  **  (XiziStoreADLL.dllseg storeA_general first_link linklist_pre linklist_pre last_link nodes_general )
|--
  (xizi_store_dll storeA_general linklist_pre nodes_general )
.

Definition DoubleLinkListGetHead_derive_nil_case_by_general := 
forall (A: Type) ,
forall (linklist_pre: Z) (storeA_nil_case: (Z -> (A -> Assertion))) ,
  (xizi_store_dll storeA_nil_case linklist_pre nil )
|--
EX (A: Type) ,
EX (storeA_general: (Z -> (A -> Assertion))) (nodes_general: (@list (@XiziStoreADLL.DL_Node A))) ,
  ((xizi_store_dll storeA_general linklist_pre nodes_general ))
  **
  ((EX retval_2,
  “ (retval_2 = (xizi_double_link_first_value ((xizi_dll_ptrs (nodes_general))))) ”
  &&  (xizi_store_dll storeA_general linklist_pre nodes_general ))
  -*
  (EX retval,
  “ (retval = 0) ”
  &&  (xizi_store_dll storeA_nil_case linklist_pre nil )))
.

Module Type VC_Correct.

Include xizi_double_link_Strategy_Correct.

Axiom proof_of_DoubleLinkListGetHead_safety_wit_1 : DoubleLinkListGetHead_safety_wit_1.
Axiom proof_of_DoubleLinkListGetHead_entail_wit_1 : DoubleLinkListGetHead_entail_wit_1.
Axiom proof_of_DoubleLinkListGetHead_return_wit_1 : DoubleLinkListGetHead_return_wit_1.
Axiom proof_of_DoubleLinkListGetHead_return_wit_2 : DoubleLinkListGetHead_return_wit_2.
Axiom proof_of_DoubleLinkListGetHead_derive_nil_case_by_general : DoubleLinkListGetHead_derive_nil_case_by_general.

End VC_Correct.
