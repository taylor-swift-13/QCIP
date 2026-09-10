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
forall (linklist_pre: Z) (nodes_general: (@list Z)) (first: Z) (last: Z) (PreH1 : (first = linklist_pre)) (PreH2 : (linklist_pre <> 0)) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_dllseg first linklist_pre linklist_pre last nodes_general )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition DoubleLinkListGetHead_return_wit_1 := 
(
forall (linklist_pre: Z) (nodes_general: (@list Z)) (first: Z) (last: Z) (PreH1 : (first = linklist_pre)) (PreH2 : (linklist_pre <> 0)) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_dllseg first linklist_pre linklist_pre last nodes_general )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
|--
  “ (0 = (xizi_double_link_first_value (nodes_general))) ”
  &&  (xizi_dll linklist_pre nodes_general )
) \/
(
forall (linklist_pre: Z) (nodes_general: (@list Z)) (first: Z) (last: Z) (PreH1 : (first = linklist_pre)) (PreH2 : (linklist_pre <> 0)) ,
  (xizi_dllseg first linklist_pre linklist_pre last nodes_general )
|--
  “ (0 = (xizi_double_link_first_value (nodes_general))) ”
  &&  (xizi_dllseg first linklist_pre linklist_pre last nodes_general )
).

Definition DoubleLinkListGetHead_return_wit_1_split_goal_1 := 
forall (linklist_pre: Z) (nodes_general: (@list Z)) (first: Z) (last: Z) (PreH1 : (first = linklist_pre)) (PreH2 : (linklist_pre <> 0)) ,
  (xizi_dllseg first linklist_pre linklist_pre last nodes_general )
|--
  “ (0 = (xizi_double_link_first_value (nodes_general))) ”
.

Definition DoubleLinkListGetHead_return_wit_1_split_goal_spatial := 
forall (linklist_pre: Z) (nodes_general: (@list Z)) (first: Z) (last: Z) (PreH1 : (first = linklist_pre)) (PreH2 : (linklist_pre <> 0)) ,
  (xizi_dllseg first linklist_pre linklist_pre last nodes_general )
|--
  (xizi_dllseg first linklist_pre linklist_pre last nodes_general )
.

Definition DoubleLinkListGetHead_return_wit_2 := 
(
forall (linklist_pre: Z) (nodes_general: (@list Z)) (first: Z) (last: Z) (PreH1 : (first <> linklist_pre)) (PreH2 : (linklist_pre <> 0)) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_dllseg first linklist_pre linklist_pre last nodes_general )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
|--
  “ (first = (xizi_double_link_first_value (nodes_general))) ”
  &&  (xizi_dll linklist_pre nodes_general )
) \/
(
forall (linklist_pre: Z) (nodes_general: (@list Z)) (first: Z) (last: Z) (next: Z) (l0: (@list Z)) (PreH1 : (nodes_general = (cons (first) (l0)))) (PreH2 : (first <> linklist_pre)) (PreH3 : (linklist_pre <> 0)) ,
  (xizi_dllseg next first linklist_pre last l0 )
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_pre)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
|--
  “ (first = (xizi_double_link_first_value (nodes_general))) ”
  &&  (xizi_dllseg first linklist_pre linklist_pre last nodes_general )
).

Definition DoubleLinkListGetHead_return_wit_2_split_goal_1 := 
forall (linklist_pre: Z) (nodes_general: (@list Z)) (first: Z) (last: Z) (next: Z) (l0: (@list Z)) (PreH1 : (nodes_general = (cons (first) (l0)))) (PreH2 : (first <> linklist_pre)) (PreH3 : (linklist_pre <> 0)) ,
  (xizi_dllseg next first linklist_pre last l0 )
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_pre)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
|--
  “ (first = (xizi_double_link_first_value (nodes_general))) ”
.

Definition DoubleLinkListGetHead_return_wit_2_split_goal_spatial := 
forall (linklist_pre: Z) (nodes_general: (@list Z)) (first: Z) (last: Z) (next: Z) (l0: (@list Z)) (PreH1 : (nodes_general = (cons (first) (l0)))) (PreH2 : (first <> linklist_pre)) (PreH3 : (linklist_pre <> 0)) ,
  (xizi_dllseg next first linklist_pre last l0 )
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_pre)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
|--
  (xizi_dllseg first linklist_pre linklist_pre last nodes_general )
.

Definition DoubleLinkListGetHead_partial_solve_wit_1 := 
forall (linklist_pre: Z) (nodes_general: (@list Z)) ,
  (xizi_dll linklist_pre nodes_general )
|--
  EX (last: Z)  (first: Z) ,
  “ (linklist_pre <> 0) ”
  &&  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_dllseg first linklist_pre linklist_pre last nodes_general )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
.

Definition DoubleLinkListGetHead_derive_nil_case_by_general := 
forall (linklist_pre: Z) ,
  (xizi_dll linklist_pre nil )
|--
EX (nodes_general: (@list Z)) ,
  ((xizi_dll linklist_pre nodes_general ))
  **
  ((EX retval_2,
  “ (retval_2 = (xizi_double_link_first_value (nodes_general))) ”
  &&  (xizi_dll linklist_pre nodes_general ))
  -*
  (EX retval,
  “ (retval = 0) ”
  &&  (xizi_dll linklist_pre nil )))
.

Module Type VC_Correct.

Include xizi_double_link_Strategy_Correct.

Axiom proof_of_DoubleLinkListGetHead_safety_wit_1 : DoubleLinkListGetHead_safety_wit_1.
Axiom proof_of_DoubleLinkListGetHead_return_wit_1 : DoubleLinkListGetHead_return_wit_1.
Axiom proof_of_DoubleLinkListGetHead_return_wit_2 : DoubleLinkListGetHead_return_wit_2.
Axiom proof_of_DoubleLinkListGetHead_partial_solve_wit_1 : DoubleLinkListGetHead_partial_solve_wit_1.
Axiom proof_of_DoubleLinkListGetHead_derive_nil_case_by_general : DoubleLinkListGetHead_derive_nil_case_by_general.

End VC_Correct.
