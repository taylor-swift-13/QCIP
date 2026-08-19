Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import naive_C_Rules.
Require Import QCIPLib.xizi.xizi_avl_common.xizi_avl_lib.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition xizi_avl_strategy0 :=
  forall (p : Z) (tr0 : tree),
    TT &&
    emp **
    ((store_tree p tr0))
    |--
    (
    TT &&
    emp
    ) ** (
    ALL (tr1 : tree),
      TT &&
      (“ (tr0 = tr1) ”) &&
      emp -*
      TT &&
      emp **
      ((store_tree p tr1))
      ).

Definition xizi_avl_strategy9 :=
  forall (p : Z),
    TT &&
    emp **
    ((store_tree_shape p))
    |--
    (
    TT &&
    emp
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((store_tree_shape p))
    ).

Definition xizi_avl_strategy12 :=
  forall (p : Z),
    TT &&
    emp **
    ((store_non_empty_tree p))
    |--
    (
    TT &&
    emp
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((store_non_empty_tree p))
    ).

Definition xizi_avl_strategy7 :=
  forall (l : Z) (d : Z) (h : Z) (r : Z) (p : Z),
    TT &&
    emp **
    ((poly_store FET_int &( ((p)) # "AvlNode" ->ₛ "data") d)) **
    ((poly_store FET_uint &( ((p)) # "AvlNode" ->ₛ "height") h)) **
    ((poly_store FET_ptr &( ((p)) # "AvlNode" ->ₛ "left") l)) **
    ((poly_store FET_ptr &( ((p)) # "AvlNode" ->ₛ "right") r))
    |--
    (
    TT &&
    emp **
    ((single_tree_node p d h l r))
    ) ** (
    TT &&
    emp -*
    TT &&
    emp
    ).

Definition xizi_avl_strategy8 :=
  TT &&
  emp
  |--
  (
  TT &&
  emp
  ) ** (
  ALL (p : Z) (h : Z) (r : Z) (l : Z) (d : Z),
    TT &&
    emp **
    ((single_tree_node p d h l r)) -*
    TT &&
    emp **
    ((poly_store FET_int &( ((p)) # "AvlNode" ->ₛ "data") d)) **
    ((poly_store FET_uint &( ((p)) # "AvlNode" ->ₛ "height") h)) **
    ((poly_store FET_ptr &( ((p)) # "AvlNode" ->ₛ "left") l)) **
    ((poly_store FET_ptr &( ((p)) # "AvlNode" ->ₛ "right") r))
    ).

Definition xizi_avl_strategy1 :=
  forall (p : Z) (tr : tree),
    TT &&
    (“ (p <> 0) ”) &&
    emp **
    ((store_tree p tr))
    |--
    EX (d : Z) (h : Z) (l : Z) (r : Z) (tr1 : tree) (tr2 : tree),
      (
      TT &&
      (“ (p <> 0) ”) &&
      (“ (tr = ( make_tree tr1 tr2)) ”) &&
      emp **
      ((single_tree_node p d h l r)) **
      ((store_tree l tr1)) **
      ((store_tree r tr2))
      ) ** (
      TT &&
      emp -*
      TT &&
      emp
      ).

Definition xizi_avl_strategy2 :=
  forall (p : Z),
    TT &&
    (“ (p <> 0) ”) &&
    emp
    |--
    (
    TT &&
    (“ (p <> 0) ”) &&
    emp
    ) ** (
    ALL (tr : tree) (tr1 : tree) (tr2 : tree) (l : Z) (h : Z) (d : Z) (r : Z),
      TT &&
      (“ (tr = ( make_tree tr1 tr2)) ”) &&
      emp **
      ((single_tree_node p d h l r)) **
      ((store_tree l tr1)) **
      ((store_tree r tr2)) -*
      TT &&
      emp **
      ((store_tree p tr))
      ).

Definition xizi_avl_strategy3 :=
  forall (p : Z) (tr : tree),
    TT &&
    (“ (p = 0) ”) &&
    emp **
    ((store_tree p tr))
    |--
    (
    TT &&
    (“ (p = 0) ”) &&
    (“ (tr = ( empty)) ”) &&
    emp
    ) ** (
    TT &&
    emp -*
    TT &&
    emp
    ).

Definition xizi_avl_strategy4 :=
  forall (p : Z),
    TT &&
    (“ (p = 0) ”) &&
    emp
    |--
    (
    TT &&
    (“ (p = 0) ”) &&
    emp
    ) ** (
    ALL (tr : tree),
      TT &&
      (“ (tr = ( empty)) ”) &&
      emp -*
      TT &&
      emp **
      ((store_tree p tr))
      ).

Definition xizi_avl_strategy10 :=
  forall (p : Z),
    TT &&
    emp **
    ((store_tree_shape p))
    |--
    EX (tr : tree),
      (
      TT &&
      emp **
      ((store_tree p tr))
      ) ** (
      TT &&
      emp -*
      TT &&
      emp
      ).

Definition xizi_avl_strategy11 :=
  TT &&
  emp
  |--
  (
  TT &&
  emp
  ) ** (
  ALL (p : Z) (tr : tree),
    TT &&
    emp **
    ((store_tree p tr)) -*
    TT &&
    emp **
    ((store_tree_shape p))
    ).

Definition xizi_avl_strategy13 :=
  forall (p : Z),
    TT &&
    emp **
    ((store_non_empty_tree p))
    |--
    (
    TT &&
    (“ (p <> 0) ”) &&
    emp **
    ((store_tree_shape p))
    ) ** (
    TT &&
    emp -*
    TT &&
    emp
    ).

Definition xizi_avl_strategy15 :=
  forall (p : Z),
    TT &&
    (“ (p <> 0) ”) &&
    emp
    |--
    (
    TT &&
    (“ (p <> 0) ”) &&
    emp
    ) ** (
    TT &&
    emp **
    ((store_tree_shape p)) -*
    TT &&
    emp **
    ((store_non_empty_tree p))
    ).

Definition xizi_avl_strategy16 :=
  forall (p : Z),
    TT &&
    (“ (p <> 0) ”) &&
    emp
    |--
    (
    TT &&
    (“ (p <> 0) ”) &&
    emp
    ) ** (
    ALL (tr : tree) (tr1 : tree) (tr2 : tree) (l : Z) (h : Z) (d : Z) (r : Z),
      TT &&
      (“ (tr = ( make_tree tr1 tr2)) ”) &&
      emp **
      ((single_tree_node p d h l r)) **
      ((store_tree l tr1)) **
      ((store_tree r tr2)) -*
      TT &&
      emp **
      ((store_tree p tr))
      ).

Definition xizi_avl_strategy17 :=
  TT &&
  emp
  |--
  (
  TT &&
  emp
  ) ** (
  ALL (tr : tree),
    TT &&
    (“ (tr = ( empty)) ”) &&
    emp -*
    TT &&
    emp **
    ((store_tree 0 tr))
    ).

Definition xizi_avl_strategy5 :=
  forall (p : Z) (h : Z) (r : Z) (l : Z) (d : Z),
    TT &&
    emp **
    ((single_tree_node p d h l r))
    |--
    (
    TT &&
    emp **
    ((poly_store FET_int &( ((p)) # "AvlNode" ->ₛ "data") d)) **
    ((poly_store FET_uint &( ((p)) # "AvlNode" ->ₛ "height") h)) **
    ((poly_store FET_ptr &( ((p)) # "AvlNode" ->ₛ "left") l)) **
    ((poly_store FET_ptr &( ((p)) # "AvlNode" ->ₛ "right") r))
    ) ** (
    TT &&
    emp -*
    TT &&
    emp
    ).

Definition xizi_avl_strategy6 :=
  TT &&
  emp
  |--
  (
  TT &&
  emp
  ) ** (
  ALL (l : Z) (d : Z) (h : Z) (r : Z) (p : Z),
    TT &&
    emp **
    ((poly_store FET_int &( ((p)) # "AvlNode" ->ₛ "data") d)) **
    ((poly_store FET_uint &( ((p)) # "AvlNode" ->ₛ "height") h)) **
    ((poly_store FET_ptr &( ((p)) # "AvlNode" ->ₛ "left") l)) **
    ((poly_store FET_ptr &( ((p)) # "AvlNode" ->ₛ "right") r)) -*
    TT &&
    emp **
    ((single_tree_node p d h l r))
    ).

Module Type xizi_avl_Strategy_Correct.

  Axiom xizi_avl_strategy0_correctness : xizi_avl_strategy0.
  Axiom xizi_avl_strategy9_correctness : xizi_avl_strategy9.
  Axiom xizi_avl_strategy12_correctness : xizi_avl_strategy12.
  Axiom xizi_avl_strategy7_correctness : xizi_avl_strategy7.
  Axiom xizi_avl_strategy8_correctness : xizi_avl_strategy8.
  Axiom xizi_avl_strategy1_correctness : xizi_avl_strategy1.
  Axiom xizi_avl_strategy2_correctness : xizi_avl_strategy2.
  Axiom xizi_avl_strategy3_correctness : xizi_avl_strategy3.
  Axiom xizi_avl_strategy4_correctness : xizi_avl_strategy4.
  Axiom xizi_avl_strategy10_correctness : xizi_avl_strategy10.
  Axiom xizi_avl_strategy11_correctness : xizi_avl_strategy11.
  Axiom xizi_avl_strategy13_correctness : xizi_avl_strategy13.
  Axiom xizi_avl_strategy15_correctness : xizi_avl_strategy15.
  Axiom xizi_avl_strategy16_correctness : xizi_avl_strategy16.
  Axiom xizi_avl_strategy17_correctness : xizi_avl_strategy17.
  Axiom xizi_avl_strategy5_correctness : xizi_avl_strategy5.
  Axiom xizi_avl_strategy6_correctness : xizi_avl_strategy6.

End xizi_avl_Strategy_Correct.
