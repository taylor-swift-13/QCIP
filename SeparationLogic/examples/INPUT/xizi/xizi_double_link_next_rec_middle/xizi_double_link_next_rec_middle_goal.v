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
Require Import SimpleC.EE.INPUT.xizi.xizi_double_link_next_rec_middle.xizi_double_link_next_rec_middle_lib.
Local Open Scope sac.

(*----- Function xizi_double_link_next_rec_middle -----*)

Definition xizi_double_link_next_rec_middle_safety_wit_1 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (after: Z) (successor: Z) (node_prev: Z) (last: Z) (first: Z) (suffix: (@list Z)) (prefix: (@list Z)) (nodes: (@list Z)) (PreH1 : (successor = linklist_pre)) (PreH2 : (linklist_pre <> 0)) (PreH3 : (linklist_node_pre <> 0)) (PreH4 : (successor <> 0)) (PreH5 : (successor <> linklist_pre)) (PreH6 : (nodes = (app (prefix) ((cons (linklist_node_pre) ((cons (successor) (suffix)))))))) (PreH7 : (xizi_strict_successor linklist_node_pre successor nodes )) ,
  ((( &( "linklist_node" ) )) # Ptr  |-> linklist_node_pre)
  **  ((( &( "linklist" ) )) # Ptr  |-> linklist_pre)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first linklist_node_pre linklist_pre node_prev prefix )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> successor)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev)
  **  ((&((successor)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> after)
  **  ((&((successor)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg after linklist_pre successor last suffix )
|--
  “ False ”
.

Definition xizi_double_link_next_rec_middle_return_wit_1 := 
forall (linklist_node_pre: Z) (linklist_pre: Z) (after: Z) (successor: Z) (node_prev: Z) (last: Z) (first: Z) (suffix: (@list Z)) (prefix: (@list Z)) (nodes: (@list Z)) (PreH1 : (successor <> linklist_pre)) (PreH2 : (linklist_pre <> 0)) (PreH3 : (linklist_node_pre <> 0)) (PreH4 : (successor <> 0)) (PreH5 : (successor <> linklist_pre)) (PreH6 : (nodes = (app (prefix) ((cons (linklist_node_pre) ((cons (successor) (suffix)))))))) (PreH7 : (xizi_strict_successor linklist_node_pre successor nodes )) ,
  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first linklist_node_pre linklist_pre node_prev prefix )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> successor)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev)
  **  ((&((successor)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> after)
  **  ((&((successor)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg after linklist_pre successor last suffix )
|--
  “ (successor = successor) ” 
  &&  “ (xizi_strict_successor linklist_node_pre successor nodes ) ”
  &&  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> first)
  **  ((&((linklist_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> last)
  **  (xizi_dllseg first linklist_node_pre linklist_pre node_prev prefix )
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> successor)
  **  ((&((linklist_node_pre)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> node_prev)
  **  ((&((successor)  # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr  |-> after)
  **  ((&((successor)  # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr  |-> linklist_node_pre)
  **  (xizi_dllseg after linklist_pre successor last suffix )
.

Module Type VC_Correct.


Axiom proof_of_xizi_double_link_next_rec_middle_safety_wit_1 : xizi_double_link_next_rec_middle_safety_wit_1.
Axiom proof_of_xizi_double_link_next_rec_middle_return_wit_1 : xizi_double_link_next_rec_middle_return_wit_1.

End VC_Correct.
