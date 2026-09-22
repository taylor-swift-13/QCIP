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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next_rec_last.source
      Require Import xizi_double_link_next_rec_last_lib.
Local Open Scope sac.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_strategy_goal.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_strategy_proof.

(*----- Function DoubleLinkListGetNext -----*)

Definition DoubleLinkListGetNext_safety_wit_1 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (first: Z) (last: Z) (PreH1 : (first = linklist_pre)) (PreH2 : (linklist_pre <> 0)) (PreH3 : (linklist_node_pre = linklist_pre)) (PreH4 : ((xizi_double_link_next_dispatch_value (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) = (xizi_double_link_first_value (nodes_dispatch_case)))) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  ((( &( "linklist_node" ) )) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first linklist_pre linklist_pre last nodes_dispatch_case )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition DoubleLinkListGetNext_safety_wit_2 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (first: Z) (last: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (node_next: Z) (node_prev: Z) (PreH1 : (node_next = linklist_pre)) (PreH2 : (linklist_pre <> 0)) (PreH3 : (nodes_dispatch_case = (app (nodes_before) ((cons (linklist_node_pre) (nodes_after)))))) (PreH4 : ~((In linklist_node_pre nodes_before ))) (PreH5 : ((xizi_double_link_next_dispatch_value (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) = (xizi_double_link_first_value (nodes_after)))) (PreH6 : (linklist_node_pre <> 0)) (PreH7 : (linklist_node_pre <> linklist_pre)) ,
  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  ((( &( "linklist_node" ) )) # Ptr  |-> linklist_node_pre)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first linklist_pre linklist_node_pre node_prev nodes_before )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev)
  **  (xizi_dllseg node_next linklist_node_pre linklist_pre last nodes_after )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition DoubleLinkListGetNext_entail_wit_1 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (PreH1 : (xizi_double_link_next_anchor linklist_pre nodes_dispatch_case linklist_node_pre )) ,
  (xizi_dll linklist_pre nodes_dispatch_case )
|--
  (EX (last: Z)  (first: Z) ,
  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_node_pre = linklist_pre) ” 
  &&  “ ((xizi_double_link_next_dispatch_value (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) = (xizi_double_link_first_value (nodes_dispatch_case))) ”
  &&  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first linklist_pre linklist_pre last nodes_dispatch_case ))
  ||
  (EX (node_next: Z)  (node_prev: Z)  (nodes_before: (@list Z))  (nodes_after: (@list Z))  (last: Z)  (first: Z) ,
  “ (linklist_pre <> 0) ” 
  &&  “ (nodes_dispatch_case = (app (nodes_before) ((cons (linklist_node_pre) (nodes_after))))) ” 
  &&  “ ~((In linklist_node_pre nodes_before )) ” 
  &&  “ ((xizi_double_link_next_dispatch_value (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) = (xizi_double_link_first_value (nodes_after))) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ (linklist_node_pre <> linklist_pre) ”
  &&  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first linklist_pre linklist_node_pre node_prev nodes_before )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev)
  **  (xizi_dllseg node_next linklist_node_pre linklist_pre last nodes_after ))
.

Definition DoubleLinkListGetNext_return_wit_1 := 
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (first: Z) (last: Z) (PreH1 : (first = linklist_pre)) (PreH2 : (linklist_pre <> 0)) (PreH3 : (linklist_node_pre = linklist_pre)) (PreH4 : ((xizi_double_link_next_dispatch_value (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) = (xizi_double_link_first_value (nodes_dispatch_case)))) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first linklist_pre linklist_pre last nodes_dispatch_case )
|--
  “ (0 = (xizi_double_link_next_dispatch_value (nodes_dispatch_case) (linklist_pre) (linklist_node_pre))) ”
  &&  (xizi_dll linklist_pre nodes_dispatch_case )
) \/
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (first: Z) (last: Z) (PreH1 : (first = linklist_pre)) (PreH2 : (linklist_pre <> 0)) (PreH3 : (linklist_node_pre = linklist_pre)) (PreH4 : ((xizi_double_link_next_dispatch_value (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) = (xizi_double_link_first_value (nodes_dispatch_case)))) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  (xizi_dllseg first linklist_pre linklist_pre last nodes_dispatch_case )
|--
  EX (first_2: Z) ,
  “ (linklist_pre <> 0) ” 
  &&  “ (0 = (xizi_double_link_next_dispatch_value (nodes_dispatch_case) (linklist_pre) (linklist_node_pre))) ”
  &&  (xizi_dllseg first_2 linklist_pre linklist_pre last nodes_dispatch_case )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_2)
).

Definition DoubleLinkListGetNext_return_wit_2 := 
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (first: Z) (last: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (node_next: Z) (node_prev: Z) (PreH1 : (node_next = linklist_pre)) (PreH2 : (linklist_pre <> 0)) (PreH3 : (nodes_dispatch_case = (app (nodes_before) ((cons (linklist_node_pre) (nodes_after)))))) (PreH4 : ~((In linklist_node_pre nodes_before ))) (PreH5 : ((xizi_double_link_next_dispatch_value (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) = (xizi_double_link_first_value (nodes_after)))) (PreH6 : (linklist_node_pre <> 0)) (PreH7 : (linklist_node_pre <> linklist_pre)) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first linklist_pre linklist_node_pre node_prev nodes_before )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev)
  **  (xizi_dllseg node_next linklist_node_pre linklist_pre last nodes_after )
|--
  “ (0 = (xizi_double_link_next_dispatch_value (nodes_dispatch_case) (linklist_pre) (linklist_node_pre))) ”
  &&  (xizi_dll linklist_pre nodes_dispatch_case )
) \/
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (first: Z) (last: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (node_next: Z) (node_prev: Z) (PreH1 : (node_next = linklist_pre)) (PreH2 : (linklist_pre <> 0)) (PreH3 : (nodes_dispatch_case = (app (nodes_before) ((cons (linklist_node_pre) (nodes_after)))))) (PreH4 : ~((In linklist_node_pre nodes_before ))) (PreH5 : ((xizi_double_link_next_dispatch_value (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) = (xizi_double_link_first_value (nodes_after)))) (PreH6 : (linklist_node_pre <> 0)) (PreH7 : (linklist_node_pre <> linklist_pre)) ,
  (xizi_dllseg first linklist_pre linklist_node_pre node_prev nodes_before )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev)
  **  (xizi_dllseg node_next linklist_node_pre linklist_pre last nodes_after )
|--
  “ (0 = (xizi_double_link_next_dispatch_value (nodes_dispatch_case) (linklist_pre) (linklist_node_pre))) ”
  &&  (xizi_dllseg first linklist_pre linklist_pre last nodes_dispatch_case )
).

Definition DoubleLinkListGetNext_return_wit_2_split_goal_1 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (first: Z) (last: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (node_next: Z) (node_prev: Z) (PreH1 : (node_next = linklist_pre)) (PreH2 : (linklist_pre <> 0)) (PreH3 : (nodes_dispatch_case = (app (nodes_before) ((cons (linklist_node_pre) (nodes_after)))))) (PreH4 : ~((In linklist_node_pre nodes_before ))) (PreH5 : ((xizi_double_link_next_dispatch_value (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) = (xizi_double_link_first_value (nodes_after)))) (PreH6 : (linklist_node_pre <> 0)) (PreH7 : (linklist_node_pre <> linklist_pre)) ,
  (xizi_dllseg first linklist_pre linklist_node_pre node_prev nodes_before )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev)
  **  (xizi_dllseg node_next linklist_node_pre linklist_pre last nodes_after )
|--
  “ (0 = (xizi_double_link_next_dispatch_value (nodes_dispatch_case) (linklist_pre) (linklist_node_pre))) ”
.

Definition DoubleLinkListGetNext_return_wit_2_split_goal_spatial := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (first: Z) (last: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (node_next: Z) (node_prev: Z) (PreH1 : (node_next = linklist_pre)) (PreH2 : (linklist_pre <> 0)) (PreH3 : (nodes_dispatch_case = (app (nodes_before) ((cons (linklist_node_pre) (nodes_after)))))) (PreH4 : ~((In linklist_node_pre nodes_before ))) (PreH5 : ((xizi_double_link_next_dispatch_value (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) = (xizi_double_link_first_value (nodes_after)))) (PreH6 : (linklist_node_pre <> 0)) (PreH7 : (linklist_node_pre <> linklist_pre)) ,
  (xizi_dllseg first linklist_pre linklist_node_pre node_prev nodes_before )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev)
  **  (xizi_dllseg node_next linklist_node_pre linklist_pre last nodes_after )
|--
  (xizi_dllseg first linklist_pre linklist_pre last nodes_dispatch_case )
.

Definition DoubleLinkListGetNext_return_wit_3 := 
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (first: Z) (last: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (node_next: Z) (node_prev: Z) (PreH1 : (node_next <> linklist_pre)) (PreH2 : (linklist_pre <> 0)) (PreH3 : (nodes_dispatch_case = (app (nodes_before) ((cons (linklist_node_pre) (nodes_after)))))) (PreH4 : ~((In linklist_node_pre nodes_before ))) (PreH5 : ((xizi_double_link_next_dispatch_value (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) = (xizi_double_link_first_value (nodes_after)))) (PreH6 : (linklist_node_pre <> 0)) (PreH7 : (linklist_node_pre <> linklist_pre)) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first linklist_pre linklist_node_pre node_prev nodes_before )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev)
  **  (xizi_dllseg node_next linklist_node_pre linklist_pre last nodes_after )
|--
  “ (node_next = (xizi_double_link_next_dispatch_value (nodes_dispatch_case) (linklist_pre) (linklist_node_pre))) ”
  &&  (xizi_dll linklist_pre nodes_dispatch_case )
) \/
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (first: Z) (last: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (node_next: Z) (node_prev: Z) (next: Z) (l0: (@list Z)) (PreH1 : (nodes_after = (cons (node_next) (l0)))) (PreH2 : (node_next <> linklist_pre)) (PreH3 : (linklist_pre <> 0)) (PreH4 : (nodes_dispatch_case = (app (nodes_before) ((cons (linklist_node_pre) (nodes_after)))))) (PreH5 : ~((In linklist_node_pre nodes_before ))) (PreH6 : ((xizi_double_link_next_dispatch_value (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) = (xizi_double_link_first_value (nodes_after)))) (PreH7 : (linklist_node_pre <> 0)) (PreH8 : (linklist_node_pre <> linklist_pre)) ,
  (xizi_dllseg next node_next linklist_pre last l0 )
  **  ((&((node_next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  ((&((node_next)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_dllseg first linklist_pre linklist_node_pre node_prev nodes_before )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev)
|--
  “ (node_next = (xizi_double_link_next_dispatch_value (nodes_dispatch_case) (linklist_pre) (linklist_node_pre))) ”
  &&  (xizi_dllseg first linklist_pre linklist_pre last nodes_dispatch_case )
).

Definition DoubleLinkListGetNext_return_wit_3_split_goal_1 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (first: Z) (last: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (node_next: Z) (node_prev: Z) (next: Z) (l0: (@list Z)) (PreH1 : (nodes_after = (cons (node_next) (l0)))) (PreH2 : (node_next <> linklist_pre)) (PreH3 : (linklist_pre <> 0)) (PreH4 : (nodes_dispatch_case = (app (nodes_before) ((cons (linklist_node_pre) (nodes_after)))))) (PreH5 : ~((In linklist_node_pre nodes_before ))) (PreH6 : ((xizi_double_link_next_dispatch_value (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) = (xizi_double_link_first_value (nodes_after)))) (PreH7 : (linklist_node_pre <> 0)) (PreH8 : (linklist_node_pre <> linklist_pre)) ,
  (xizi_dllseg next node_next linklist_pre last l0 )
  **  ((&((node_next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  ((&((node_next)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_dllseg first linklist_pre linklist_node_pre node_prev nodes_before )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev)
|--
  “ (node_next = (xizi_double_link_next_dispatch_value (nodes_dispatch_case) (linklist_pre) (linklist_node_pre))) ”
.

Definition DoubleLinkListGetNext_return_wit_3_split_goal_spatial := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (first: Z) (last: Z) (nodes_before: (@list Z)) (nodes_after: (@list Z)) (node_next: Z) (node_prev: Z) (next: Z) (l0: (@list Z)) (PreH1 : (nodes_after = (cons (node_next) (l0)))) (PreH2 : (node_next <> linklist_pre)) (PreH3 : (linklist_pre <> 0)) (PreH4 : (nodes_dispatch_case = (app (nodes_before) ((cons (linklist_node_pre) (nodes_after)))))) (PreH5 : ~((In linklist_node_pre nodes_before ))) (PreH6 : ((xizi_double_link_next_dispatch_value (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) = (xizi_double_link_first_value (nodes_after)))) (PreH7 : (linklist_node_pre <> 0)) (PreH8 : (linklist_node_pre <> linklist_pre)) ,
  (xizi_dllseg next node_next linklist_pre last l0 )
  **  ((&((node_next)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  ((&((node_next)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_dllseg first linklist_pre linklist_node_pre node_prev nodes_before )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> node_next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev)
|--
  (xizi_dllseg first linklist_pre linklist_pre last nodes_dispatch_case )
.

Definition DoubleLinkListGetNext_return_wit_4 := 
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (first: Z) (last: Z) (PreH1 : (first <> linklist_pre)) (PreH2 : (linklist_pre <> 0)) (PreH3 : (linklist_node_pre = linklist_pre)) (PreH4 : ((xizi_double_link_next_dispatch_value (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) = (xizi_double_link_first_value (nodes_dispatch_case)))) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first linklist_pre linklist_pre last nodes_dispatch_case )
|--
  “ (first = (xizi_double_link_next_dispatch_value (nodes_dispatch_case) (linklist_pre) (linklist_node_pre))) ”
  &&  (xizi_dll linklist_pre nodes_dispatch_case )
) \/
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (first: Z) (last: Z) (next: Z) (l0: (@list Z)) (PreH1 : (nodes_dispatch_case = (cons (first) (l0)))) (PreH2 : (first <> linklist_pre)) (PreH3 : (linklist_pre <> 0)) (PreH4 : (linklist_node_pre = linklist_pre)) (PreH5 : ((xizi_double_link_next_dispatch_value (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) = (xizi_double_link_first_value (nodes_dispatch_case)))) ,
  (xizi_dllseg next first linklist_pre last l0 )
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_pre)
  **  ((&((first)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
|--
  EX (first_2: Z) ,
  “ (linklist_pre <> 0) ” 
  &&  “ (first = (xizi_double_link_next_dispatch_value (nodes_dispatch_case) (linklist_pre) (linklist_node_pre))) ”
  &&  (xizi_dllseg first_2 linklist_pre linklist_pre last nodes_dispatch_case )
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first_2)
).

Definition DoubleLinkListGetNext_partial_solve_wit_1 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_dispatch_case: (@list Z)) (first: Z) (last: Z) (PreH1 : (linklist_pre <> 0)) (PreH2 : (linklist_node_pre = linklist_pre)) (PreH3 : ((xizi_double_link_next_dispatch_value (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) = (xizi_double_link_first_value (nodes_dispatch_case)))) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first linklist_pre linklist_pre last nodes_dispatch_case )
|--
  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_node_pre = linklist_pre) ” 
  &&  “ ((xizi_double_link_next_dispatch_value (nodes_dispatch_case) (linklist_pre) (linklist_node_pre)) = (xizi_double_link_first_value (nodes_dispatch_case))) ”
  &&  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first linklist_pre linklist_pre last nodes_dispatch_case )
.

Definition DoubleLinkListGetNext_derive_sentinel_case_by_dispatch_case := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_sentinel_case: (@list Z)) ,
  “ (linklist_node_pre = linklist_pre) ”
  &&  (xizi_dll linklist_pre nodes_sentinel_case )
|--
EX (nodes_dispatch_case: (@list Z)) ,
  (“ (xizi_double_link_next_anchor linklist_pre nodes_dispatch_case linklist_node_pre ) ”
  &&  (xizi_dll linklist_pre nodes_dispatch_case ))
  **
  ((EX retval_2,
  “ (retval_2 = (xizi_double_link_next_dispatch_value (nodes_dispatch_case) (linklist_pre) (linklist_node_pre))) ”
  &&  (xizi_dll linklist_pre nodes_dispatch_case ))
  -*
  (EX retval,
  “ (retval = (xizi_double_link_first_value (nodes_sentinel_case))) ”
  &&  (xizi_dll linklist_pre nodes_sentinel_case )))
.

Definition DoubleLinkListGetNext_derive_member_case_by_dispatch_case := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (nodes_member_case: (@list Z)) ,
  “ (In linklist_node_pre nodes_member_case ) ”
  &&  (xizi_dll linklist_pre nodes_member_case )
|--
EX (nodes_dispatch_case: (@list Z)) ,
  (“ (xizi_double_link_next_anchor linklist_pre nodes_dispatch_case linklist_node_pre ) ”
  &&  (xizi_dll linklist_pre nodes_dispatch_case ))
  **
  ((EX retval_2,
  “ (retval_2 = (xizi_double_link_next_dispatch_value (nodes_dispatch_case) (linklist_pre) (linklist_node_pre))) ”
  &&  (xizi_dll linklist_pre nodes_dispatch_case ))
  -*
  (EX retval,
  “ (retval = (xizi_double_link_next_value (nodes_member_case) (linklist_node_pre))) ”
  &&  (xizi_dll linklist_pre nodes_member_case )))
.

Module Type VC_Correct.

Include xizi_double_link_Strategy_Correct.

Axiom proof_of_DoubleLinkListGetNext_safety_wit_1 : DoubleLinkListGetNext_safety_wit_1.
Axiom proof_of_DoubleLinkListGetNext_safety_wit_2 : DoubleLinkListGetNext_safety_wit_2.
Axiom proof_of_DoubleLinkListGetNext_entail_wit_1 : DoubleLinkListGetNext_entail_wit_1.
Axiom proof_of_DoubleLinkListGetNext_return_wit_1 : DoubleLinkListGetNext_return_wit_1.
Axiom proof_of_DoubleLinkListGetNext_return_wit_2 : DoubleLinkListGetNext_return_wit_2.
Axiom proof_of_DoubleLinkListGetNext_return_wit_3 : DoubleLinkListGetNext_return_wit_3.
Axiom proof_of_DoubleLinkListGetNext_return_wit_4 : DoubleLinkListGetNext_return_wit_4.
Axiom proof_of_DoubleLinkListGetNext_partial_solve_wit_1 : DoubleLinkListGetNext_partial_solve_wit_1.
Axiom proof_of_DoubleLinkListGetNext_derive_sentinel_case_by_dispatch_case : DoubleLinkListGetNext_derive_sentinel_case_by_dispatch_case.
Axiom proof_of_DoubleLinkListGetNext_derive_member_case_by_dispatch_case : DoubleLinkListGetNext_derive_member_case_by_dispatch_case.

End VC_Correct.
