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
Import CRules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_len.source Require Import xizi_double_link_len_lib.
Local Open Scope sac.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_strategy_goal.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_strategy_proof.

(*----- Function DoubleLinkListLenGet -----*)

Definition DoubleLinkListLenGet_safety_wit_1 := 
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@DLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) ,
  ((( &( "linklist_length" ) )) # UInt  |->_)
  **  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  (XiziLocalDLL.store_dll storeA_general linklist_pre nodes_general )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition DoubleLinkListLenGet_entail_wit_1 := 
(
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@DLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) ,
  (XiziLocalDLL.store_dll storeA_general linklist_pre nodes_general )
|--
  EX (next: Z)  (last: Z)  (done: (@list (@DLL.DL_Node A)))  (todo: (@list (@DLL.DL_Node A))) ,
  “ (nodes_general = (app (done) (todo))) ” 
  &&  “ (0 = (Zlength (done))) ” 
  &&  “ ((Zlength (nodes_general)) = ((Zlength (done)) + (Zlength (todo)) )) ”
  &&  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (XiziLocalDLL.dllseg_shift storeA_general linklist_pre linklist_pre done )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (XiziLocalDLL.dllseg storeA_general next linklist_pre linklist_pre last todo )
) \/
(
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@DLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) ,
  (XiziLocalDLL.store_dll storeA_general linklist_pre nodes_general )
|--
  EX (next: Z)  (last: Z)  (done: (@list (@DLL.DL_Node A)))  (todo: (@list (@DLL.DL_Node A))) ,
  “ (nodes_general = (app (done) (todo))) ” 
  &&  “ (0 = (Zlength (done))) ” 
  &&  “ ((Zlength (nodes_general)) = ((Zlength (done)) + (Zlength (todo)) )) ”
  &&  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (XiziLocalDLL.dllseg_shift storeA_general linklist_pre linklist_pre done )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (XiziLocalDLL.dllseg storeA_general next linklist_pre linklist_pre last todo )
).

Definition DoubleLinkListLenGet_entail_wit_2 := 
(
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@DLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (next: Z) (tmp_node: Z) (last_2: Z) (linklist_length: Z) (done_2: (@list (@DLL.DL_Node A))) (todo: (@list (@DLL.DL_Node A))) (PreH1 : (next <> linklist_pre)) (PreH2 : (nodes_general = (app (done_2) (todo)))) (PreH3 : (linklist_length = (Zlength (done_2)))) (PreH4 : ((Zlength (nodes_general)) = ((Zlength (done_2)) + (Zlength (todo)) ))) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last_2)
  **  (XiziLocalDLL.dllseg_shift storeA_general linklist_pre tmp_node done_2 )
  **  ((&((tmp_node)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (XiziLocalDLL.dllseg storeA_general next tmp_node linklist_pre last_2 todo )
|--
  EX (after: Z)  (last: Z)  (done: (@list (@DLL.DL_Node A)))  (node: (@DLL.DL_Node A))  (rest: (@list (@DLL.DL_Node A))) ,
  “ (nodes_general = (app (done) ((cons (node) (rest))))) ” 
  &&  “ (linklist_length = (Zlength (done))) ” 
  &&  “ ((Zlength (nodes_general)) = (((Zlength (done)) + 1 ) + (Zlength (rest)) )) ”
  &&  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (XiziLocalDLL.dllseg_shift storeA_general linklist_pre tmp_node done )
  **  ((&((tmp_node)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> (DLL.getPtr (node)))
  **  (storeA_general (DLL.getPtr (node)) (DLL.getData (node)) )
  **  ((&(((DLL.getPtr (node)))  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> tmp_node)
  **  ((&(((DLL.getPtr (node)))  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> after)
  **  (XiziLocalDLL.dllseg storeA_general after (DLL.getPtr (node)) linklist_pre last rest )
) \/
(
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@DLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (next: Z) (tmp_node: Z) (last_2: Z) (linklist_length: Z) (done_2: (@list (@DLL.DL_Node A))) (todo: (@list (@DLL.DL_Node A))) (PreH1 : (next <> linklist_pre)) (PreH2 : (nodes_general = (app (done_2) (todo)))) (PreH3 : (linklist_length = (Zlength (done_2)))) (PreH4 : ((Zlength (nodes_general)) = ((Zlength (done_2)) + (Zlength (todo)) ))) ,
  (XiziLocalDLL.dllseg_shift storeA_general linklist_pre tmp_node done_2 )
  **  (XiziLocalDLL.dllseg storeA_general next tmp_node linklist_pre last_2 todo )
|--
  EX (after: Z)  (done: (@list (@DLL.DL_Node A)))  (node: (@DLL.DL_Node A))  (rest: (@list (@DLL.DL_Node A))) ,
  “ (next = (DLL.getPtr (node))) ” 
  &&  “ (nodes_general = (app (done) ((cons (node) (rest))))) ” 
  &&  “ (linklist_length = (Zlength (done))) ” 
  &&  “ ((Zlength (nodes_general)) = (((Zlength (done)) + 1 ) + (Zlength (rest)) )) ”
  &&  (XiziLocalDLL.dllseg_shift storeA_general linklist_pre tmp_node done )
  **  (storeA_general (DLL.getPtr (node)) (DLL.getData (node)) )
  **  ((&(((DLL.getPtr (node)))  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> tmp_node)
  **  ((&(((DLL.getPtr (node)))  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> after)
  **  (XiziLocalDLL.dllseg storeA_general after (DLL.getPtr (node)) linklist_pre last_2 rest )
).

Definition DoubleLinkListLenGet_entail_wit_3 := 
(
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@DLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (done_2: (@list (@DLL.DL_Node A))) (node: (@DLL.DL_Node A)) (rest: (@list (@DLL.DL_Node A))) (after: Z) (last_2: Z) (linklist_length: Z) (tmp_node: Z) (PreH1 : (nodes_general = (app (done_2) ((cons (node) (rest)))))) (PreH2 : (linklist_length = (Zlength (done_2)))) (PreH3 : ((Zlength (nodes_general)) = (((Zlength (done_2)) + 1 ) + (Zlength (rest)) ))) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last_2)
  **  (XiziLocalDLL.dllseg_shift storeA_general linklist_pre tmp_node done_2 )
  **  ((&((tmp_node)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> (DLL.getPtr (node)))
  **  (storeA_general (DLL.getPtr (node)) (DLL.getData (node)) )
  **  ((&(((DLL.getPtr (node)))  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> tmp_node)
  **  ((&(((DLL.getPtr (node)))  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> after)
  **  (XiziLocalDLL.dllseg storeA_general after (DLL.getPtr (node)) linklist_pre last_2 rest )
|--
  EX (next: Z)  (last: Z)  (done: (@list (@DLL.DL_Node A)))  (todo: (@list (@DLL.DL_Node A))) ,
  “ (nodes_general = (app (done) (todo))) ” 
  &&  “ ((unsigned_last_nbits ((linklist_length + 1 )) (32)) = (Zlength (done))) ” 
  &&  “ ((Zlength (nodes_general)) = ((Zlength (done)) + (Zlength (todo)) )) ”
  &&  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (XiziLocalDLL.dllseg_shift storeA_general linklist_pre (DLL.getPtr (node)) done )
  **  ((&(((DLL.getPtr (node)))  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (XiziLocalDLL.dllseg storeA_general next (DLL.getPtr (node)) linklist_pre last todo )
) \/
(
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@DLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (done_2: (@list (@DLL.DL_Node A))) (node: (@DLL.DL_Node A)) (rest: (@list (@DLL.DL_Node A))) (after: Z) (last_2: Z) (linklist_length: Z) (tmp_node: Z) (PreH1 : (nodes_general = (app (done_2) ((cons (node) (rest)))))) (PreH2 : (linklist_length = (Zlength (done_2)))) (PreH3 : ((Zlength (nodes_general)) = (((Zlength (done_2)) + 1 ) + (Zlength (rest)) ))) ,
  (XiziLocalDLL.dllseg_shift storeA_general linklist_pre tmp_node done_2 )
  **  ((&((tmp_node)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> (DLL.getPtr (node)))
  **  (storeA_general (DLL.getPtr (node)) (DLL.getData (node)) )
  **  ((&(((DLL.getPtr (node)))  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> tmp_node)
  **  (XiziLocalDLL.dllseg storeA_general after (DLL.getPtr (node)) linklist_pre last_2 rest )
|--
  EX (done: (@list (@DLL.DL_Node A)))  (todo: (@list (@DLL.DL_Node A))) ,
  “ (nodes_general = (app (done) (todo))) ” 
  &&  “ ((unsigned_last_nbits ((linklist_length + 1 )) (32)) = (Zlength (done))) ” 
  &&  “ ((Zlength (nodes_general)) = ((Zlength (done)) + (Zlength (todo)) )) ”
  &&  (XiziLocalDLL.dllseg_shift storeA_general linklist_pre (DLL.getPtr (node)) done )
  **  (XiziLocalDLL.dllseg storeA_general after (DLL.getPtr (node)) linklist_pre last_2 todo )
).

Definition DoubleLinkListLenGet_return_wit_1 := 
(
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@DLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (next: Z) (tmp_node: Z) (last: Z) (linklist_length: Z) (done: (@list (@DLL.DL_Node A))) (todo: (@list (@DLL.DL_Node A))) (PreH1 : (next = linklist_pre)) (PreH2 : (nodes_general = (app (done) (todo)))) (PreH3 : (linklist_length = (Zlength (done)))) (PreH4 : ((Zlength (nodes_general)) = ((Zlength (done)) + (Zlength (todo)) ))) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (XiziLocalDLL.dllseg_shift storeA_general linklist_pre tmp_node done )
  **  ((&((tmp_node)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (XiziLocalDLL.dllseg storeA_general next tmp_node linklist_pre last todo )
|--
  “ (linklist_length = (Zlength (nodes_general))) ”
  &&  (XiziLocalDLL.store_dll storeA_general linklist_pre nodes_general )
) \/
(
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@DLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (next: Z) (tmp_node: Z) (last: Z) (linklist_length: Z) (done: (@list (@DLL.DL_Node A))) (todo: (@list (@DLL.DL_Node A))) (PreH1 : (next = linklist_pre)) (PreH2 : (nodes_general = (app (done) (todo)))) (PreH3 : (linklist_length = (Zlength (done)))) (PreH4 : ((Zlength (nodes_general)) = ((Zlength (done)) + (Zlength (todo)) ))) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (XiziLocalDLL.dllseg_shift storeA_general linklist_pre tmp_node done )
  **  ((&((tmp_node)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (XiziLocalDLL.dllseg storeA_general next tmp_node linklist_pre last todo )
|--
  “ (linklist_length = (Zlength (nodes_general))) ”
  &&  (XiziLocalDLL.store_dll storeA_general linklist_pre nodes_general )
).

Definition DoubleLinkListLenGet_return_wit_1_split_goal_1 := 
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@DLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (next: Z) (tmp_node: Z) (last: Z) (linklist_length: Z) (done: (@list (@DLL.DL_Node A))) (todo: (@list (@DLL.DL_Node A))) (PreH1 : (next = linklist_pre)) (PreH2 : (nodes_general = (app (done) (todo)))) (PreH3 : (linklist_length = (Zlength (done)))) (PreH4 : ((Zlength (nodes_general)) = ((Zlength (done)) + (Zlength (todo)) ))) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (XiziLocalDLL.dllseg_shift storeA_general linklist_pre tmp_node done )
  **  ((&((tmp_node)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (XiziLocalDLL.dllseg storeA_general next tmp_node linklist_pre last todo )
|--
  “ (linklist_length = (Zlength (nodes_general))) ”
.

Definition DoubleLinkListLenGet_return_wit_1_split_goal_spatial := 
forall (A: Type) (linklist_pre: Z) (nodes_general: (@list (@DLL.DL_Node A))) (storeA_general: (Z -> (A -> Assertion))) (next: Z) (tmp_node: Z) (last: Z) (linklist_length: Z) (done: (@list (@DLL.DL_Node A))) (todo: (@list (@DLL.DL_Node A))) (PreH1 : (next = linklist_pre)) (PreH2 : (nodes_general = (app (done) (todo)))) (PreH3 : (linklist_length = (Zlength (done)))) (PreH4 : ((Zlength (nodes_general)) = ((Zlength (done)) + (Zlength (todo)) ))) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (XiziLocalDLL.dllseg_shift storeA_general linklist_pre tmp_node done )
  **  ((&((tmp_node)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (XiziLocalDLL.dllseg storeA_general next tmp_node linklist_pre last todo )
|--
  (XiziLocalDLL.store_dll storeA_general linklist_pre nodes_general )
.

Definition DoubleLinkListLenGet_derive_nil_case_by_general := 
forall (A: Type) ,
forall (linklist_pre: Z) (storeA_nil_case: (Z -> (A -> Assertion))) ,
  (XiziLocalDLL.store_dll storeA_nil_case linklist_pre nil )
|--
EX (A: Type) ,
EX (storeA_general: (Z -> (A -> Assertion))) (nodes_general: (@list (@DLL.DL_Node A))) ,
  ((XiziLocalDLL.store_dll storeA_general linklist_pre nodes_general ))
  **
  ((EX retval_2,
  “ (retval_2 = (Zlength (nodes_general))) ”
  &&  (XiziLocalDLL.store_dll storeA_general linklist_pre nodes_general ))
  -*
  (EX retval,
  “ (retval = 0) ”
  &&  (XiziLocalDLL.store_dll storeA_nil_case linklist_pre nil )))
.

Module Type VC_Correct.

Include xizi_double_link_Strategy_Correct.

Axiom proof_of_DoubleLinkListLenGet_safety_wit_1 : DoubleLinkListLenGet_safety_wit_1.
Axiom proof_of_DoubleLinkListLenGet_entail_wit_1 : DoubleLinkListLenGet_entail_wit_1.
Axiom proof_of_DoubleLinkListLenGet_entail_wit_2 : DoubleLinkListLenGet_entail_wit_2.
Axiom proof_of_DoubleLinkListLenGet_entail_wit_3 : DoubleLinkListLenGet_entail_wit_3.
Axiom proof_of_DoubleLinkListLenGet_return_wit_1 : DoubleLinkListLenGet_return_wit_1.
Axiom proof_of_DoubleLinkListLenGet_derive_nil_case_by_general : DoubleLinkListLenGet_derive_nil_case_by_general.

End VC_Correct.
