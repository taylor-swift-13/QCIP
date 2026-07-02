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
From QCIPLib.xizi.xizi_single_link_common Require Import xizi_single_link_lib.
Local Open Scope sac.
From QCIPLib.xizi.xizi_single_link_common Require Import xizi_single_link_strategy_goal.
From QCIPLib.xizi.xizi_single_link_common Require Import xizi_single_link_strategy_proof.

(*----- Function xizi_single_link_tail -----*)

Definition xizi_single_link_tail_entail_wit_1 := 
(
forall (linklist_pre: Z) (l: (@list Z)) (PreH1 : (linklist_pre <> 0)) ,
  (xizi_sll linklist_pre l )
|--
  EX (next: Z)  (l1: (@list Z))  (l2: (@list Z))  (l0: (@list Z)) ,
  “ (l = (app (l1) ((cons (linklist_pre) (l2))))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (l = (cons (linklist_pre) (l0))) ” 
  &&  “ (linklist_pre <> 0) ”
  &&  ((&((linklist_pre)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist_pre linklist_pre l1 )
  **  (xizi_sll next l2 )
) \/
(
forall (linklist_pre: Z) (l: (@list Z)) (q: Z) (l0_2: (@list Z)) (PreH1 : (l = (cons (linklist_pre) (l0_2)))) (PreH2 : (linklist_pre <> 0)) ,
  (xizi_sll q l0_2 )
|--
  EX (l2: (@list Z))  (l0: (@list Z)) ,
  “ (l = (app ((@nil Z)) ((cons (linklist_pre) (l2))))) ” 
  &&  “ (linklist_pre <> 0) ” 
  &&  “ (l = (cons (linklist_pre) (l0))) ” 
  &&  “ (linklist_pre <> 0) ”
  &&  (xizi_sll q l2 )
).

Definition xizi_single_link_tail_entail_wit_2 := 
(
forall (linklist_pre: Z) (l: (@list Z)) (next_2: Z) (l1_2: (@list Z)) (linklist: Z) (l2_2: (@list Z)) (l0_2: (@list Z)) (PreH1 : (l = (app (l1_2) ((cons (linklist) (l2_2)))))) (PreH2 : (linklist <> 0)) (PreH3 : (l = (cons (linklist_pre) (l0_2)))) (PreH4 : (linklist_pre <> 0)) (PreH5 : (next_2 <> 0)) ,
  ((&((linklist)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_2)
  **  (xizi_sllseg linklist_pre linklist l1_2 )
  **  (xizi_sll next_2 l2_2 )
|--
  EX (next: Z)  (l1: (@list Z))  (l2: (@list Z))  (l0: (@list Z)) ,
  “ (l = (app (l1) ((cons (next_2) (l2))))) ” 
  &&  “ (next_2 <> 0) ” 
  &&  “ (l = (cons (linklist_pre) (l0))) ” 
  &&  “ (linklist_pre <> 0) ”
  &&  ((&((next_2)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist_pre next_2 l1 )
  **  (xizi_sll next l2 )
) \/
(
forall (linklist_pre: Z) (l: (@list Z)) (next_2: Z) (l1_2: (@list Z)) (linklist: Z) (l2_2: (@list Z)) (l0_2: (@list Z)) (q: Z) (l0_3: (@list Z)) (PreH1 : (l2_2 = (cons (next_2) (l0_3)))) (PreH2 : (l = (app (l1_2) ((cons (linklist) (l2_2)))))) (PreH3 : (linklist <> 0)) (PreH4 : (l = (cons (linklist_pre) (l0_2)))) (PreH5 : (linklist_pre <> 0)) (PreH6 : (next_2 <> 0)) ,
  (xizi_sll q l0_3 )
  **  ((&((linklist)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next_2)
  **  (xizi_sllseg linklist_pre linklist l1_2 )
|--
  EX (l1: (@list Z))  (l2: (@list Z))  (l0: (@list Z)) ,
  “ (l = (app (l1) ((cons (next_2) (l2))))) ” 
  &&  “ (next_2 <> 0) ” 
  &&  “ (l = (cons (linklist_pre) (l0))) ” 
  &&  “ (linklist_pre <> 0) ”
  &&  (xizi_sllseg linklist_pre next_2 l1 )
  **  (xizi_sll q l2 )
).

Definition xizi_single_link_tail_return_wit_1 := 
(
forall (linklist_pre: Z) (l: (@list Z)) (next: Z) (l1_2: (@list Z)) (linklist: Z) (l2: (@list Z)) (l0: (@list Z)) (PreH1 : (l = (app (l1_2) ((cons (linklist) (l2)))))) (PreH2 : (linklist <> 0)) (PreH3 : (l = (cons (linklist_pre) (l0)))) (PreH4 : (linklist_pre <> 0)) (PreH5 : (next = 0)) ,
  ((&((linklist)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> next)
  **  (xizi_sllseg linklist_pre linklist l1_2 )
  **  (xizi_sll next l2 )
|--
  EX (retval_node_next: Z)  (l1: (@list Z)) ,
  “ (l = (app (l1) ((cons (linklist) ((@nil Z)))))) ” 
  &&  “ (linklist <> 0) ” 
  &&  “ (retval_node_next = 0) ”
  &&  (xizi_sllseg linklist_pre linklist l1 )
  **  ((&((linklist)  # "SingleLinklistNode" ->ₛ "node_next")) # Ptr  |-> retval_node_next)
) \/
(
forall (linklist_pre: Z) (l: (@list Z)) (next: Z) (l1_2: (@list Z)) (linklist: Z) (l2: (@list Z)) (l0: (@list Z)) (PreH1 : (l = (app (l1_2) ((cons (linklist) (l2)))))) (PreH2 : (linklist <> 0)) (PreH3 : (l = (cons (linklist_pre) (l0)))) (PreH4 : (linklist_pre <> 0)) (PreH5 : (next = 0)) ,
  (xizi_sllseg linklist_pre linklist l1_2 )
  **  (xizi_sll next l2 )
|--
  EX (l1: (@list Z)) ,
  “ (next = 0) ” 
  &&  “ (next = 0) ” 
  &&  “ (l = (app (l1) ((cons (linklist) ((@nil Z)))))) ” 
  &&  “ (linklist <> 0) ”
  &&  (xizi_sllseg linklist_pre linklist l1 )
).

Module Type VC_Correct.

Include xizi_single_link_Strategy_Correct.

Axiom proof_of_xizi_single_link_tail_entail_wit_1 : xizi_single_link_tail_entail_wit_1.
Axiom proof_of_xizi_single_link_tail_entail_wit_2 : xizi_single_link_tail_entail_wit_2.
Axiom proof_of_xizi_single_link_tail_return_wit_1 : xizi_single_link_tail_return_wit_1.

End VC_Correct.
