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
Local Open Scope sac.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_strategy_goal.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_strategy_proof.

(*----- Function xizi_double_link_next_rec_middle -----*)

Definition xizi_double_link_next_rec_middle_safety_wit_1 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (l0: (@list Z)) (last: Z) (next: Z) (prev: Z) (next_2: Z) (l0_2: (@list Z)) (PreH1 : (next_2 = linklist_pre)) (PreH2 : ((cons (linklist_node_pre) ((cons (next) (l0)))) = (cons (linklist_node_pre) (l0_2)))) (PreH3 : (linklist_pre <> 0)) (PreH4 : (linklist_node_pre <> 0)) (PreH5 : (linklist_node_pre <> linklist_pre)) (PreH6 : (next <> linklist_pre)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_2)
  **  (xizi_dllseg next_2 linklist_node_pre linklist_pre last l0_2 )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
  **  ((( &( "linklist_node" ) )) # Ptr  |-> linklist_node_pre)
  **  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_double_link_next_rec_middle_return_wit_1 := 
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (l0: (@list Z)) (last: Z) (next: Z) (prev: Z) (next_2: Z) (l0_2: (@list Z)) (PreH1 : (next_2 = linklist_pre)) (PreH2 : ((cons (linklist_node_pre) ((cons (next) (l0)))) = (cons (linklist_node_pre) (l0_2)))) (PreH3 : (linklist_pre <> 0)) (PreH4 : (linklist_node_pre <> 0)) (PreH5 : (linklist_node_pre <> linklist_pre)) (PreH6 : (next <> linklist_pre)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_2)
  **  (xizi_dllseg next_2 linklist_node_pre linklist_pre last l0_2 )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
|--
  “ (0 = next) ”
  &&  (xizi_dllseg linklist_node_pre prev linklist_pre last (cons (linklist_node_pre) ((cons (next) (l0)))) )
) \/
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (l0: (@list Z)) (last: Z) (next: Z) (prev: Z) (next_2: Z) (l0_2: (@list Z)) (PreH1 : (next_2 = linklist_pre)) (PreH2 : ((cons (linklist_node_pre) ((cons (next) (l0)))) = (cons (linklist_node_pre) (l0_2)))) (PreH3 : (linklist_pre <> 0)) (PreH4 : (linklist_node_pre <> 0)) (PreH5 : (linklist_node_pre <> linklist_pre)) (PreH6 : (next <> linklist_pre)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_2)
  **  (xizi_dllseg next_2 linklist_node_pre linklist_pre last l0_2 )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
|--
  “ (0 = next) ”
  &&  (xizi_dllseg linklist_node_pre prev linklist_pre last (cons (linklist_node_pre) ((cons (next) (l0)))) )
).

Definition xizi_double_link_next_rec_middle_return_wit_1_split_goal_1 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (l0: (@list Z)) (last: Z) (next: Z) (prev: Z) (next_2: Z) (l0_2: (@list Z)) (PreH1 : (next_2 = linklist_pre)) (PreH2 : ((cons (linklist_node_pre) ((cons (next) (l0)))) = (cons (linklist_node_pre) (l0_2)))) (PreH3 : (linklist_pre <> 0)) (PreH4 : (linklist_node_pre <> 0)) (PreH5 : (linklist_node_pre <> linklist_pre)) (PreH6 : (next <> linklist_pre)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_2)
  **  (xizi_dllseg next_2 linklist_node_pre linklist_pre last l0_2 )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
|--
  “ (0 = next) ”
.

Definition xizi_double_link_next_rec_middle_return_wit_1_split_goal_spatial := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (l0: (@list Z)) (last: Z) (next: Z) (prev: Z) (next_2: Z) (l0_2: (@list Z)) (PreH1 : (next_2 = linklist_pre)) (PreH2 : ((cons (linklist_node_pre) ((cons (next) (l0)))) = (cons (linklist_node_pre) (l0_2)))) (PreH3 : (linklist_pre <> 0)) (PreH4 : (linklist_node_pre <> 0)) (PreH5 : (linklist_node_pre <> linklist_pre)) (PreH6 : (next <> linklist_pre)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_2)
  **  (xizi_dllseg next_2 linklist_node_pre linklist_pre last l0_2 )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
|--
  (xizi_dllseg linklist_node_pre prev linklist_pre last (cons (linklist_node_pre) ((cons (next) (l0)))) )
.

Definition xizi_double_link_next_rec_middle_return_wit_2 := 
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (l0: (@list Z)) (last: Z) (next: Z) (prev: Z) (next_2: Z) (l0_2: (@list Z)) (PreH1 : (next_2 <> linklist_pre)) (PreH2 : ((cons (linklist_node_pre) ((cons (next) (l0)))) = (cons (linklist_node_pre) (l0_2)))) (PreH3 : (linklist_pre <> 0)) (PreH4 : (linklist_node_pre <> 0)) (PreH5 : (linklist_node_pre <> linklist_pre)) (PreH6 : (next <> linklist_pre)) ,
  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_2)
  **  (xizi_dllseg next_2 linklist_node_pre linklist_pre last l0_2 )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
|--
  “ (next_2 = next) ”
  &&  (xizi_dllseg linklist_node_pre prev linklist_pre last (cons (linklist_node_pre) ((cons (next) (l0)))) )
) \/
(
forall (linklist_node_pre: Z) (linklist_pre: Z) (l0: (@list Z)) (last: Z) (next: Z) (prev: Z) (next_2: Z) (l0_2: (@list Z)) (next_3: Z) (l0_3: (@list Z)) (PreH1 : (l0_2 = (cons (next_2) (l0_3)))) (PreH2 : (next_2 <> linklist_pre)) (PreH3 : ((cons (linklist_node_pre) ((cons (next) (l0)))) = (cons (linklist_node_pre) (l0_2)))) (PreH4 : (linklist_pre <> 0)) (PreH5 : (linklist_node_pre <> 0)) (PreH6 : (linklist_node_pre <> linklist_pre)) (PreH7 : (next <> linklist_pre)) ,
  (xizi_dllseg next_3 next_2 linklist_pre last l0_3 )
  **  ((&((next_2)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  ((&((next_2)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_3)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_2)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
|--
  “ (next_2 = next) ”
  &&  (xizi_dllseg linklist_node_pre prev linklist_pre last (cons (linklist_node_pre) ((cons (next) (l0)))) )
).

Definition xizi_double_link_next_rec_middle_return_wit_2_split_goal_1 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (l0: (@list Z)) (last: Z) (next: Z) (prev: Z) (next_2: Z) (l0_2: (@list Z)) (next_3: Z) (l0_3: (@list Z)) (PreH1 : (l0_2 = (cons (next_2) (l0_3)))) (PreH2 : (next_2 <> linklist_pre)) (PreH3 : ((cons (linklist_node_pre) ((cons (next) (l0)))) = (cons (linklist_node_pre) (l0_2)))) (PreH4 : (linklist_pre <> 0)) (PreH5 : (linklist_node_pre <> 0)) (PreH6 : (linklist_node_pre <> linklist_pre)) (PreH7 : (next <> linklist_pre)) ,
  (xizi_dllseg next_3 next_2 linklist_pre last l0_3 )
  **  ((&((next_2)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  ((&((next_2)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_3)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_2)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
|--
  “ (next_2 = next) ”
.

Definition xizi_double_link_next_rec_middle_return_wit_2_split_goal_spatial := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (l0: (@list Z)) (last: Z) (next: Z) (prev: Z) (next_2: Z) (l0_2: (@list Z)) (next_3: Z) (l0_3: (@list Z)) (PreH1 : (l0_2 = (cons (next_2) (l0_3)))) (PreH2 : (next_2 <> linklist_pre)) (PreH3 : ((cons (linklist_node_pre) ((cons (next) (l0)))) = (cons (linklist_node_pre) (l0_2)))) (PreH4 : (linklist_pre <> 0)) (PreH5 : (linklist_node_pre <> 0)) (PreH6 : (linklist_node_pre <> linklist_pre)) (PreH7 : (next <> linklist_pre)) ,
  (xizi_dllseg next_3 next_2 linklist_pre last l0_3 )
  **  ((&((next_2)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  ((&((next_2)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_3)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_2)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
|--
  (xizi_dllseg linklist_node_pre prev linklist_pre last (cons (linklist_node_pre) ((cons (next) (l0)))) )
.

Definition xizi_double_link_next_rec_middle_partial_solve_wit_1 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (l0: (@list Z)) (last: Z) (next: Z) (prev: Z) (PreH1 : (linklist_pre <> 0)) (PreH2 : (linklist_node_pre <> 0)) (PreH3 : (linklist_node_pre <> linklist_pre)) (PreH4 : (next <> linklist_pre)) ,
  (xizi_dllseg linklist_node_pre prev linklist_pre last (cons (linklist_node_pre) ((cons (next) (l0)))) )
|--
  EX (l0_2: (@list Z))  (next_2: Z) ,
  “ ((cons (linklist_node_pre) ((cons (next) (l0)))) = (cons (linklist_node_pre) (l0_2))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (linklist_node_pre <> 0) ” 
  &&  “ (linklist_node_pre <> linklist_pre) ” 
  &&  “ (next <> linklist_pre) ”
  &&  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_2)
  **  (xizi_dllseg next_2 linklist_node_pre linklist_pre last l0_2 )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> prev)
.

Module Type VC_Correct.

Include xizi_double_link_Strategy_Correct.

Axiom proof_of_xizi_double_link_next_rec_middle_safety_wit_1 : xizi_double_link_next_rec_middle_safety_wit_1.
Axiom proof_of_xizi_double_link_next_rec_middle_return_wit_1 : xizi_double_link_next_rec_middle_return_wit_1.
Axiom proof_of_xizi_double_link_next_rec_middle_return_wit_2 : xizi_double_link_next_rec_middle_return_wit_2.
Axiom proof_of_xizi_double_link_next_rec_middle_partial_solve_wit_1 : xizi_double_link_next_rec_middle_partial_solve_wit_1.

End VC_Correct.
