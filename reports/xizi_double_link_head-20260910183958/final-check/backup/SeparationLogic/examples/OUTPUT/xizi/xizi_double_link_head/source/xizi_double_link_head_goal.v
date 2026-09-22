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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_head.source
      Require Import xizi_double_link_head_lib.
Local Open Scope sac.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_strategy_goal.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_strategy_proof.

(*----- Function DoubleLinkListGetHead -----*)

Definition DoubleLinkListGetHead_safety_wit_1 := 
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@DLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (last_out: Z) (first_out: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (nodes_general <> (@nil (@DLL.DL_Node A)))) (PreH3 : (retval = 0)) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_out)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last_out)
  **  (XiziLocalDLL.dllseg storeA_general first_out linklist_pre linklist_pre last_out nodes_general )
  **  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
|--
  “ False ”
.

Definition DoubleLinkListGetHead_safety_wit_2 := 
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@DLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (last_out: Z) (first_out: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (nodes_general = (@nil (@DLL.DL_Node A)))) (PreH3 : (retval = 1)) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_out)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last_out)
  **  (XiziLocalDLL.dllseg storeA_general first_out linklist_pre linklist_pre last_out nodes_general )
  **  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition DoubleLinkListGetHead_safety_wit_3 := 
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@DLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (last_out: Z) (first_out: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (nodes_general = (@nil (@DLL.DL_Node A)))) (PreH3 : (retval = 1)) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_out)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last_out)
  **  (XiziLocalDLL.dllseg storeA_general first_out linklist_pre linklist_pre last_out nodes_general )
  **  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
|--
  “ False ”
.

Definition DoubleLinkListGetHead_entail_wit_1 := 
(
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@DLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) ,
  (XiziLocalDLL.store_dll storeA_general linklist_pre nodes_general )
|--
  EX (last_link: Z)  (first_link: Z) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_link)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last_link)
  **  (XiziLocalDLL.dllseg storeA_general first_link linklist_pre linklist_pre last_link nodes_general )
) \/
(
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@DLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) ,
  (XiziLocalDLL.store_dll storeA_general linklist_pre nodes_general )
|--
  EX (last_link: Z)  (first_link: Z) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_link)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last_link)
  **  (XiziLocalDLL.dllseg storeA_general first_link linklist_pre linklist_pre last_link nodes_general )
).

Definition DoubleLinkListGetHead_return_wit_1 := 
(
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@DLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (last_out: Z) (first_out: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (nodes_general = (@nil (@DLL.DL_Node A)))) (PreH3 : (retval = 1)) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_out)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last_out)
  **  (XiziLocalDLL.dllseg storeA_general first_out linklist_pre linklist_pre last_out nodes_general )
|--
  “ (0 = (xizi_double_link_first_value ((xizi_double_link_head_ptrs (nodes_general))))) ”
  &&  (XiziLocalDLL.store_dll storeA_general linklist_pre nodes_general )
) \/
(
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@DLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (last_out: Z) (first_out: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (nodes_general = (@nil (@DLL.DL_Node A)))) (PreH3 : (retval = 1)) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_out)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last_out)
  **  (XiziLocalDLL.dllseg storeA_general first_out linklist_pre linklist_pre last_out nodes_general )
|--
  “ (0 = (xizi_double_link_first_value ((xizi_double_link_head_ptrs (nodes_general))))) ”
  &&  (XiziLocalDLL.store_dll storeA_general linklist_pre nodes_general )
).

Definition DoubleLinkListGetHead_return_wit_1_split_goal_1 := 
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@DLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (last_out: Z) (first_out: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (nodes_general = (@nil (@DLL.DL_Node A)))) (PreH3 : (retval = 1)) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_out)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last_out)
  **  (XiziLocalDLL.dllseg storeA_general first_out linklist_pre linklist_pre last_out nodes_general )
|--
  “ (0 = (xizi_double_link_first_value ((xizi_double_link_head_ptrs (nodes_general))))) ”
.

Definition DoubleLinkListGetHead_return_wit_1_split_goal_spatial := 
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@DLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (last_out: Z) (first_out: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (nodes_general = (@nil (@DLL.DL_Node A)))) (PreH3 : (retval = 1)) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_out)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last_out)
  **  (XiziLocalDLL.dllseg storeA_general first_out linklist_pre linklist_pre last_out nodes_general )
|--
  (XiziLocalDLL.store_dll storeA_general linklist_pre nodes_general )
.

Definition DoubleLinkListGetHead_return_wit_2 := 
(
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@DLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (last_out: Z) (first_out: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (nodes_general <> (@nil (@DLL.DL_Node A)))) (PreH3 : (retval = 0)) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_out)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last_out)
  **  (XiziLocalDLL.dllseg storeA_general first_out linklist_pre linklist_pre last_out nodes_general )
|--
  “ (first_out = (xizi_double_link_first_value ((xizi_double_link_head_ptrs (nodes_general))))) ”
  &&  (XiziLocalDLL.store_dll storeA_general linklist_pre nodes_general )
) \/
(
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@DLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (last_out: Z) (first_out: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (nodes_general <> (@nil (@DLL.DL_Node A)))) (PreH3 : (retval = 0)) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_out)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last_out)
  **  (XiziLocalDLL.dllseg storeA_general first_out linklist_pre linklist_pre last_out nodes_general )
|--
  “ (first_out = (xizi_double_link_first_value ((xizi_double_link_head_ptrs (nodes_general))))) ”
  &&  (XiziLocalDLL.store_dll storeA_general linklist_pre nodes_general )
).

Definition DoubleLinkListGetHead_return_wit_2_split_goal_1 := 
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@DLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (last_out: Z) (first_out: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (nodes_general <> (@nil (@DLL.DL_Node A)))) (PreH3 : (retval = 0)) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_out)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last_out)
  **  (XiziLocalDLL.dllseg storeA_general first_out linklist_pre linklist_pre last_out nodes_general )
|--
  “ (first_out = (xizi_double_link_first_value ((xizi_double_link_head_ptrs (nodes_general))))) ”
.

Definition DoubleLinkListGetHead_return_wit_2_split_goal_spatial := 
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@DLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (last_out: Z) (first_out: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (nodes_general <> (@nil (@DLL.DL_Node A)))) (PreH3 : (retval = 0)) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_out)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last_out)
  **  (XiziLocalDLL.dllseg storeA_general first_out linklist_pre linklist_pre last_out nodes_general )
|--
  (XiziLocalDLL.store_dll storeA_general linklist_pre nodes_general )
.

Definition DoubleLinkListGetHead_partial_solve_wit_1 := 
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@DLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (first_link: Z) (last_link: Z) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_link)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last_link)
  **  (XiziLocalDLL.dllseg storeA_general first_link linklist_pre linklist_pre last_link nodes_general )
|--
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_link)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last_link)
  **  (XiziLocalDLL.dllseg storeA_general first_link linklist_pre linklist_pre last_link nodes_general )
.

Definition DoubleLinkListGetHead_derive_nil_case_by_general := 
forall (A: Type) ,
forall (linklist_pre: Z) (storeA_nil_case: (Z -> (A -> Assertion))) ,
  (XiziLocalDLL.store_dll storeA_nil_case linklist_pre nil )
|--
EX (A: Type) ,
EX (storeA_general: (Z -> (A -> Assertion))) (nodes_general: (@list (@DLL.DL_Node A))) ,
  ((XiziLocalDLL.store_dll storeA_general linklist_pre nodes_general ))
  **
  ((EX retval_2,
  “ (retval_2 = (xizi_double_link_first_value ((xizi_double_link_head_ptrs (nodes_general))))) ”
  &&  (XiziLocalDLL.store_dll storeA_general linklist_pre nodes_general ))
  -*
  (EX retval,
  “ (retval = 0) ”
  &&  (XiziLocalDLL.store_dll storeA_nil_case linklist_pre nil )))
.

Definition IsDoubleLinkListEmpty_derive_expanded_by_general := 
forall (A: Type) ,
forall (linklist_pre: Z) (last_link_expanded: Z) (first_link_expanded: Z) (nodes_expanded: (@list (@DLL.DL_Node A))) (storeA_expanded: (Z -> (A -> Assertion))) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_link_expanded)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last_link_expanded)
  **  (XiziLocalDLL.dllseg storeA_expanded first_link_expanded linklist_pre linklist_pre last_link_expanded nodes_expanded )
|--
EX (A: Type) ,
EX (storeA_general: (Z -> (A -> Assertion))) (nodes_general: (@list (@DLL.DL_Node A))) ,
  ((XiziLocalDLL.store_dll storeA_general linklist_pre nodes_general ))
  **
  (((EX retval_2,
  “ (nodes_general <> nil) ” 
  &&  “ (retval_2 = 0) ”
  &&  (XiziLocalDLL.store_dll storeA_general linklist_pre nodes_general ))
  ||
  (EX retval_2,
  “ (nodes_general = nil) ” 
  &&  “ (retval_2 = 1) ”
  &&  (XiziLocalDLL.store_dll storeA_general linklist_pre nodes_general )))
  -*
  ((EX last_out first_out retval,
  “ (nodes_expanded <> nil) ” 
  &&  “ (retval = 0) ”
  &&  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_out)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last_out)
  **  (XiziLocalDLL.dllseg storeA_expanded first_out linklist_pre linklist_pre last_out nodes_expanded ))
  ||
  (EX last_out first_out retval,
  “ (nodes_expanded = nil) ” 
  &&  “ (retval = 1) ”
  &&  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_out)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last_out)
  **  (XiziLocalDLL.dllseg storeA_expanded first_out linklist_pre linklist_pre last_out nodes_expanded ))))
.

Module Type VC_Correct.

Include xizi_double_link_Strategy_Correct.

Axiom proof_of_DoubleLinkListGetHead_safety_wit_1 : DoubleLinkListGetHead_safety_wit_1.
Axiom proof_of_DoubleLinkListGetHead_safety_wit_2 : DoubleLinkListGetHead_safety_wit_2.
Axiom proof_of_DoubleLinkListGetHead_safety_wit_3 : DoubleLinkListGetHead_safety_wit_3.
Axiom proof_of_DoubleLinkListGetHead_entail_wit_1 : DoubleLinkListGetHead_entail_wit_1.
Axiom proof_of_DoubleLinkListGetHead_return_wit_1 : DoubleLinkListGetHead_return_wit_1.
Axiom proof_of_DoubleLinkListGetHead_return_wit_2 : DoubleLinkListGetHead_return_wit_2.
Axiom proof_of_DoubleLinkListGetHead_partial_solve_wit_1 : DoubleLinkListGetHead_partial_solve_wit_1.
Axiom proof_of_DoubleLinkListGetHead_derive_nil_case_by_general : DoubleLinkListGetHead_derive_nil_case_by_general.
Axiom proof_of_IsDoubleLinkListEmpty_derive_expanded_by_general : IsDoubleLinkListEmpty_derive_expanded_by_general.

End VC_Correct.
