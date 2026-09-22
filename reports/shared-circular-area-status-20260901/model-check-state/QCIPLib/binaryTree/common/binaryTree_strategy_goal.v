Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import naive_C_Rules.
Require Import QCIPLib.binaryTree.common.binaryTree_lib.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition binaryTree_strategy0 :=
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

Definition binaryTree_strategy9 :=
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

Definition binaryTree_strategy12 :=
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

Definition binaryTree_strategy25 :=
  forall (x : Z) (p : Z),
    TT &&
    emp **
    ((poly_store FET_uchar p x))
    |--
    (
    TT &&
    (“ (Z.ge x 0) ”) &&
    emp **
    ((poly_store FET_uchar p x))
    ) ** (
    TT &&
    emp -*
    TT &&
    emp
    ).

Definition binaryTree_strategy26 :=
  forall (x : Z) (p : Z),
    TT &&
    emp **
    ((poly_store FET_uchar p x))
    |--
    (
    TT &&
    (“ (Z.le x 255) ”) &&
    emp **
    ((poly_store FET_uchar p x))
    ) ** (
    TT &&
    emp -*
    TT &&
    emp
    ).

Definition binaryTree_strategy7 :=
  forall (l : Z) (v : Z) (k : Z) (h : Z) (r : Z) (p : Z),
    TT &&
    emp **
    ((poly_store FET_int &( ((p)) # "tree" ->ₛ "key") k)) **
    ((poly_store FET_int &( ((p)) # "tree" ->ₛ "value") v)) **
    ((poly_store FET_uchar &( ((p)) # "tree" ->ₛ "height") h)) **
    ((poly_store FET_ptr &( ((p)) # "tree" ->ₛ "lchild") l)) **
    ((poly_store FET_ptr &( ((p)) # "tree" ->ₛ "rchild") r))
    |--
    (
    TT &&
    emp **
    ((single_tree_node p k v h l r))
    ) ** (
    TT &&
    emp -*
    TT &&
    emp
    ).

Definition binaryTree_strategy8 :=
  TT &&
  emp
  |--
  (
  TT &&
  emp
  ) ** (
  ALL (p : Z) (v : Z) (l : Z) (r : Z) (h : Z) (k : Z),
    TT &&
    emp **
    ((single_tree_node p k v h l r)) -*
    TT &&
    emp **
    ((poly_store FET_int &( ((p)) # "tree" ->ₛ "key") k)) **
    ((poly_store FET_int &( ((p)) # "tree" ->ₛ "value") v)) **
    ((poly_store FET_uchar &( ((p)) # "tree" ->ₛ "height") h)) **
    ((poly_store FET_ptr &( ((p)) # "tree" ->ₛ "lchild") l)) **
    ((poly_store FET_ptr &( ((p)) # "tree" ->ₛ "rchild") r))
    ).

Definition binaryTree_strategy1 :=
  forall (p : Z) (tr : tree),
    TT &&
    (“ (p <> 0) ”) &&
    emp **
    ((store_tree p tr))
    |--
    EX (k : Z) (v : Z) (h : Z) (l : Z) (r : Z) (tr1 : tree) (tr2 : tree),
      (
      TT &&
      (“ (p <> 0) ”) &&
      (“ (tr = ( make_tree tr1 tr2)) ”) &&
      emp **
      ((single_tree_node p k v h l r)) **
      ((store_tree l tr1)) **
      ((store_tree r tr2))
      ) ** (
      TT &&
      emp -*
      TT &&
      emp
      ).

Definition binaryTree_strategy2 :=
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
    ALL (tr : tree) (tr1 : tree) (tr2 : tree) (l : Z) (v : Z) (h : Z) (k : Z) (r : Z),
      TT &&
      (“ (tr = ( make_tree tr1 tr2)) ”) &&
      emp **
      ((single_tree_node p k v h l r)) **
      ((store_tree l tr1)) **
      ((store_tree r tr2)) -*
      TT &&
      emp **
      ((store_tree p tr))
      ).

Definition binaryTree_strategy3 :=
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

Definition binaryTree_strategy4 :=
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

Definition binaryTree_strategy10 :=
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

Definition binaryTree_strategy11 :=
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

Definition binaryTree_strategy13 :=
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

Definition binaryTree_strategy15 :=
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

Definition binaryTree_strategy16 :=
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
    ALL (tr : tree) (tr1 : tree) (tr2 : tree) (l : Z) (v : Z) (h : Z) (k : Z) (r : Z),
      TT &&
      (“ (tr = ( make_tree tr1 tr2)) ”) &&
      emp **
      ((single_tree_node p k v h l r)) **
      ((store_tree l tr1)) **
      ((store_tree r tr2)) -*
      TT &&
      emp **
      ((store_tree p tr))
      ).

Definition binaryTree_strategy17 :=
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

Definition binaryTree_strategy5 :=
  forall (p : Z) (v : Z) (l : Z) (r : Z) (h : Z) (k : Z),
    TT &&
    emp **
    ((single_tree_node p k v h l r))
    |--
    (
    TT &&
    emp **
    ((poly_store FET_int &( ((p)) # "tree" ->ₛ "key") k)) **
    ((poly_store FET_int &( ((p)) # "tree" ->ₛ "value") v)) **
    ((poly_store FET_uchar &( ((p)) # "tree" ->ₛ "height") h)) **
    ((poly_store FET_ptr &( ((p)) # "tree" ->ₛ "lchild") l)) **
    ((poly_store FET_ptr &( ((p)) # "tree" ->ₛ "rchild") r))
    ) ** (
    TT &&
    emp -*
    TT &&
    emp
    ).

Definition binaryTree_strategy6 :=
  TT &&
  emp
  |--
  (
  TT &&
  emp
  ) ** (
  ALL (l : Z) (v : Z) (k : Z) (h : Z) (r : Z) (p : Z),
    TT &&
    emp **
    ((poly_store FET_int &( ((p)) # "tree" ->ₛ "key") k)) **
    ((poly_store FET_int &( ((p)) # "tree" ->ₛ "value") v)) **
    ((poly_store FET_uchar &( ((p)) # "tree" ->ₛ "height") h)) **
    ((poly_store FET_ptr &( ((p)) # "tree" ->ₛ "lchild") l)) **
    ((poly_store FET_ptr &( ((p)) # "tree" ->ₛ "rchild") r)) -*
    TT &&
    emp **
    ((single_tree_node p k v h l r))
    ).

Module Type binaryTree_Strategy_Correct.

  Axiom binaryTree_strategy0_correctness : binaryTree_strategy0.
  Axiom binaryTree_strategy9_correctness : binaryTree_strategy9.
  Axiom binaryTree_strategy12_correctness : binaryTree_strategy12.
  Axiom binaryTree_strategy25_correctness : binaryTree_strategy25.
  Axiom binaryTree_strategy26_correctness : binaryTree_strategy26.
  Axiom binaryTree_strategy7_correctness : binaryTree_strategy7.
  Axiom binaryTree_strategy8_correctness : binaryTree_strategy8.
  Axiom binaryTree_strategy1_correctness : binaryTree_strategy1.
  Axiom binaryTree_strategy2_correctness : binaryTree_strategy2.
  Axiom binaryTree_strategy3_correctness : binaryTree_strategy3.
  Axiom binaryTree_strategy4_correctness : binaryTree_strategy4.
  Axiom binaryTree_strategy10_correctness : binaryTree_strategy10.
  Axiom binaryTree_strategy11_correctness : binaryTree_strategy11.
  Axiom binaryTree_strategy13_correctness : binaryTree_strategy13.
  Axiom binaryTree_strategy15_correctness : binaryTree_strategy15.
  Axiom binaryTree_strategy16_correctness : binaryTree_strategy16.
  Axiom binaryTree_strategy17_correctness : binaryTree_strategy17.
  Axiom binaryTree_strategy5_correctness : binaryTree_strategy5.
  Axiom binaryTree_strategy6_correctness : binaryTree_strategy6.

End binaryTree_Strategy_Correct.
