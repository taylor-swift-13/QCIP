Require Import Coq.ZArith.ZArith.
Require Import Coq.Strings.String.
From SimpleC.SL Require Import SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
From QCIPLib.xizi.xizi_avl_common Require Import xizi_avl_lib.

Import naive_C_Rules.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.

Definition xizi_avl_strategy501 :=
  forall (p : Z) (t : addr_avl_tree),
    TT && “ p = NULL ” && emp ** store_addr_avl p t |--
    (TT && “ t = avl_empty ” && emp) **
    (TT && emp -* TT && emp).

Definition xizi_avl_strategy502 :=
  TT && emp |--
  (TT && emp) **
  (TT && emp -* TT && emp ** store_addr_avl NULL avl_empty).

Definition xizi_avl_strategy503 :=
  forall (p : Z) (t : addr_avl_tree),
    TT && “ p <> NULL ” && emp ** store_addr_avl p t |--
    EX data height left_tree right_tree,
      (TT && “ p <> NULL ” &&
       “ t = avl_node_model p data height left_tree right_tree ” &&
       emp **
       avl_node_fields p data height
         (avl_root_addr left_tree) (avl_root_addr right_tree) **
       store_addr_avl (avl_root_addr left_tree) left_tree **
       store_addr_avl (avl_root_addr right_tree) right_tree) **
      (TT && emp -* TT && emp).

Definition xizi_avl_strategy504 :=
  TT && emp |--
  (TT && emp) **
  (ALL (p data height : Z) (left_tree right_tree : addr_avl_tree),
    TT && “ p <> NULL ” && emp **
    avl_node_fields p data height
      (avl_root_addr left_tree) (avl_root_addr right_tree) **
    store_addr_avl (avl_root_addr left_tree) left_tree **
    store_addr_avl (avl_root_addr right_tree) right_tree -*
    TT && emp **
    store_addr_avl p
      (avl_node_model p data height left_tree right_tree)).

Definition xizi_avl_strategy505 :=
  forall (p data height left right : Z),
    TT && emp ** avl_node_fields p data height left right |--
    (TT && emp **
     &(p # "AvlNode" ->ₛ "data") # Int |-> data **
     &(p # "AvlNode" ->ₛ "height") # UInt |-> height **
     &(p # "AvlNode" ->ₛ "left") # Ptr |-> left **
     &(p # "AvlNode" ->ₛ "right") # Ptr |-> right) **
    (TT && emp -* TT && emp).

Definition xizi_avl_strategy506 :=
  TT && emp |--
  (TT && emp) **
  (ALL (p data height left right : Z),
    TT && emp **
    &(p # "AvlNode" ->ₛ "data") # Int |-> data **
    &(p # "AvlNode" ->ₛ "height") # UInt |-> height **
    &(p # "AvlNode" ->ₛ "left") # Ptr |-> left **
    &(p # "AvlNode" ->ₛ "right") # Ptr |-> right -*
    TT && emp ** avl_node_fields p data height left right).

Definition xizi_avl_strategy507 :=
  forall (p : Z),
    TT && emp ** store_addr_avl_shape p |--
    EX t,
      (TT && emp ** store_addr_avl p t) **
      (TT && emp -* TT && emp).

Definition xizi_avl_strategy508 :=
  TT && emp |--
  (TT && emp) **
  (ALL (p : Z) (t : addr_avl_tree),
    TT && emp ** store_addr_avl p t -*
    TT && emp ** store_addr_avl_shape p).

Definition xizi_avl_strategy509 :=
  forall (p : Z),
    TT && emp ** store_nonempty_addr_avl p |--
    (TT && “ p <> NULL ” && emp ** store_addr_avl_shape p) **
    (TT && emp -* TT && emp).

Definition xizi_avl_strategy510 :=
  TT && emp |--
  (TT && emp) **
  (ALL (p : Z),
    TT && “ p <> NULL ” && emp ** store_addr_avl_shape p -*
    TT && emp ** store_nonempty_addr_avl p).
