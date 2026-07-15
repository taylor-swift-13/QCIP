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
Require Import QCIPLib.xizi.xizi_avl_common.xizi_avl_lib.
Local Open Scope sac.
Require Import xizi_avl_strategy_goal.
Require Import xizi_avl_strategy_proof.

(*----- Function xizi_avl_left_rotate -----*)

Definition xizi_avl_left_rotate_entail_wit_1 := 
(
forall (avl_node_pre: Z) (before: addr_avl_tree) (c: addr_avl_tree) (b: addr_avl_tree) (a: addr_avl_tree) (right_height: Z) (right_data: Z) (root_height: Z) (root_data: Z) (right_addr: Z) (data: Z) (height: Z) (left_tree: addr_avl_tree) (right_tree: addr_avl_tree) (PreH1 : (before = (avl_node_model (avl_node_pre) (data) (height) (left_tree) (right_tree)))) (PreH2 : (avl_node_pre <> 0)) (PreH3 : (right_addr <> 0)) (PreH4 : (before = (avl_node_model (avl_node_pre) (root_data) (root_height) (a) ((avl_node_model (right_addr) (right_data) (right_height) (b) (c)))))) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_root_addr (right_tree)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_root_addr (left_tree)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> height)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> data)
  **  (store_addr_avl (avl_root_addr (right_tree)) right_tree )
  **  (store_addr_avl (avl_root_addr (left_tree)) left_tree )
  **  ((( &( "new_node" ) )) # Ptr  |-> (avl_root_addr (right_tree)))
|--
  “ (avl_node_pre <> 0) ” 
  &&  “ (right_addr <> 0) ” 
  &&  “ (before = (avl_node_model (avl_node_pre) (root_data) (root_height) (a) ((avl_node_model (right_addr) (right_data) (right_height) (b) (c))))) ”
  &&  ((( &( "new_node" ) )) # Ptr  |-> right_addr)
  **  (avl_node_fields avl_node_pre root_data root_height (avl_root_addr (a)) right_addr )
  **  (store_addr_avl (avl_root_addr (a)) a )
  **  (store_addr_avl right_addr (avl_node_model (right_addr) (right_data) (right_height) (b) (c)) )
) \/
(
forall (avl_node_pre: Z) (before: addr_avl_tree) (c: addr_avl_tree) (b: addr_avl_tree) (a: addr_avl_tree) (right_height: Z) (right_data: Z) (root_height: Z) (root_data: Z) (right_addr: Z) (data: Z) (height: Z) (left_tree: addr_avl_tree) (right_tree: addr_avl_tree) (PreH1 : (before = (avl_node_model (avl_node_pre) (data) (height) (left_tree) (right_tree)))) (PreH2 : (avl_node_pre <> 0)) (PreH3 : (right_addr <> 0)) (PreH4 : (before = (avl_node_model (avl_node_pre) (root_data) (root_height) (a) ((avl_node_model (right_addr) (right_data) (right_height) (b) (c)))))) ,
  (store_addr_avl (avl_root_addr (right_tree)) right_tree )
  **  (store_addr_avl (avl_root_addr (left_tree)) left_tree )
|--
  “ ((avl_root_addr (right_tree)) = right_addr) ” 
  &&  “ ((avl_root_addr (left_tree)) = (avl_root_addr (a))) ” 
  &&  “ (height = root_height) ” 
  &&  “ (data = root_data) ”
  &&  ((&((right_addr)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_root_addr (c)))
  **  ((&((right_addr)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_root_addr (b)))
  **  ((&((right_addr)  # "AvlNode" ->ₛ "height")) # UInt  |-> right_height)
  **  ((&((right_addr)  # "AvlNode" ->ₛ "data")) # Int  |-> right_data)
  **  (store_addr_avl (avl_root_addr (c)) c )
  **  (store_addr_avl (avl_root_addr (b)) b )
  **  (store_addr_avl (avl_root_addr (a)) a )
).

Definition xizi_avl_left_rotate_entail_wit_1_split_goal_1 := 
forall (avl_node_pre: Z) (before: addr_avl_tree) (c: addr_avl_tree) (b: addr_avl_tree) (a: addr_avl_tree) (right_height: Z) (right_data: Z) (root_height: Z) (root_data: Z) (right_addr: Z) (data: Z) (height: Z) (left_tree: addr_avl_tree) (right_tree: addr_avl_tree) (PreH1 : (before = (avl_node_model (avl_node_pre) (data) (height) (left_tree) (right_tree)))) (PreH2 : (avl_node_pre <> 0)) (PreH3 : (right_addr <> 0)) (PreH4 : (before = (avl_node_model (avl_node_pre) (root_data) (root_height) (a) ((avl_node_model (right_addr) (right_data) (right_height) (b) (c)))))) ,
  (store_addr_avl (avl_root_addr (right_tree)) right_tree )
  **  (store_addr_avl (avl_root_addr (left_tree)) left_tree )
|--
  “ ((avl_root_addr (right_tree)) = right_addr) ”
.

Definition xizi_avl_left_rotate_entail_wit_1_split_goal_2 := 
forall (avl_node_pre: Z) (before: addr_avl_tree) (c: addr_avl_tree) (b: addr_avl_tree) (a: addr_avl_tree) (right_height: Z) (right_data: Z) (root_height: Z) (root_data: Z) (right_addr: Z) (data: Z) (height: Z) (left_tree: addr_avl_tree) (right_tree: addr_avl_tree) (PreH1 : (before = (avl_node_model (avl_node_pre) (data) (height) (left_tree) (right_tree)))) (PreH2 : (avl_node_pre <> 0)) (PreH3 : (right_addr <> 0)) (PreH4 : (before = (avl_node_model (avl_node_pre) (root_data) (root_height) (a) ((avl_node_model (right_addr) (right_data) (right_height) (b) (c)))))) ,
  (store_addr_avl (avl_root_addr (right_tree)) right_tree )
  **  (store_addr_avl (avl_root_addr (left_tree)) left_tree )
|--
  “ ((avl_root_addr (left_tree)) = (avl_root_addr (a))) ”
.

Definition xizi_avl_left_rotate_entail_wit_1_split_goal_3 := 
forall (avl_node_pre: Z) (before: addr_avl_tree) (c: addr_avl_tree) (b: addr_avl_tree) (a: addr_avl_tree) (right_height: Z) (right_data: Z) (root_height: Z) (root_data: Z) (right_addr: Z) (data: Z) (height: Z) (left_tree: addr_avl_tree) (right_tree: addr_avl_tree) (PreH1 : (before = (avl_node_model (avl_node_pre) (data) (height) (left_tree) (right_tree)))) (PreH2 : (avl_node_pre <> 0)) (PreH3 : (right_addr <> 0)) (PreH4 : (before = (avl_node_model (avl_node_pre) (root_data) (root_height) (a) ((avl_node_model (right_addr) (right_data) (right_height) (b) (c)))))) ,
  (store_addr_avl (avl_root_addr (right_tree)) right_tree )
  **  (store_addr_avl (avl_root_addr (left_tree)) left_tree )
|--
  “ (height = root_height) ”
.

Definition xizi_avl_left_rotate_entail_wit_1_split_goal_4 := 
forall (avl_node_pre: Z) (before: addr_avl_tree) (c: addr_avl_tree) (b: addr_avl_tree) (a: addr_avl_tree) (right_height: Z) (right_data: Z) (root_height: Z) (root_data: Z) (right_addr: Z) (data: Z) (height: Z) (left_tree: addr_avl_tree) (right_tree: addr_avl_tree) (PreH1 : (before = (avl_node_model (avl_node_pre) (data) (height) (left_tree) (right_tree)))) (PreH2 : (avl_node_pre <> 0)) (PreH3 : (right_addr <> 0)) (PreH4 : (before = (avl_node_model (avl_node_pre) (root_data) (root_height) (a) ((avl_node_model (right_addr) (right_data) (right_height) (b) (c)))))) ,
  (store_addr_avl (avl_root_addr (right_tree)) right_tree )
  **  (store_addr_avl (avl_root_addr (left_tree)) left_tree )
|--
  “ (data = root_data) ”
.

Definition xizi_avl_left_rotate_entail_wit_1_split_goal_spatial := 
forall (avl_node_pre: Z) (before: addr_avl_tree) (c: addr_avl_tree) (b: addr_avl_tree) (a: addr_avl_tree) (right_height: Z) (right_data: Z) (root_height: Z) (root_data: Z) (right_addr: Z) (data: Z) (height: Z) (left_tree: addr_avl_tree) (right_tree: addr_avl_tree) (PreH1 : (before = (avl_node_model (avl_node_pre) (data) (height) (left_tree) (right_tree)))) (PreH2 : (avl_node_pre <> 0)) (PreH3 : (right_addr <> 0)) (PreH4 : (before = (avl_node_model (avl_node_pre) (root_data) (root_height) (a) ((avl_node_model (right_addr) (right_data) (right_height) (b) (c)))))) ,
  (store_addr_avl (avl_root_addr (right_tree)) right_tree )
  **  (store_addr_avl (avl_root_addr (left_tree)) left_tree )
|--
  ((&((right_addr)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_root_addr (c)))
  **  ((&((right_addr)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_root_addr (b)))
  **  ((&((right_addr)  # "AvlNode" ->ₛ "height")) # UInt  |-> right_height)
  **  ((&((right_addr)  # "AvlNode" ->ₛ "data")) # Int  |-> right_data)
  **  (store_addr_avl (avl_root_addr (c)) c )
  **  (store_addr_avl (avl_root_addr (b)) b )
  **  (store_addr_avl (avl_root_addr (a)) a )
.

Definition xizi_avl_left_rotate_return_wit_1 := 
(
forall (avl_node_pre: Z) (before: addr_avl_tree) (c: addr_avl_tree) (b: addr_avl_tree) (a: addr_avl_tree) (right_height: Z) (right_data: Z) (root_height: Z) (root_data: Z) (right_addr: Z) (data: Z) (height: Z) (left_tree: addr_avl_tree) (right_tree: addr_avl_tree) (PreH1 : ((avl_node_model (right_addr) (right_data) (right_height) (b) (c)) = (avl_node_model (right_addr) (data) (height) (left_tree) (right_tree)))) (PreH2 : (avl_node_pre <> 0)) (PreH3 : (right_addr <> 0)) (PreH4 : (before = (avl_node_model (avl_node_pre) (root_data) (root_height) (a) ((avl_node_model (right_addr) (right_data) (right_height) (b) (c)))))) ,
  ((&((right_addr)  # "AvlNode" ->ₛ "left")) # Ptr  |-> avl_node_pre)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_root_addr (left_tree)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_root_addr (a)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_height)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> root_data)
  **  ((&((right_addr)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_root_addr (right_tree)))
  **  ((&((right_addr)  # "AvlNode" ->ₛ "height")) # UInt  |-> height)
  **  ((&((right_addr)  # "AvlNode" ->ₛ "data")) # Int  |-> data)
  **  (store_addr_avl (avl_root_addr (right_tree)) right_tree )
  **  (store_addr_avl (avl_root_addr (left_tree)) left_tree )
  **  (store_addr_avl (avl_root_addr (a)) a )
|--
  EX (after: addr_avl_tree) ,
  “ (right_addr = right_addr) ” 
  &&  “ (after = (avl_node_model (right_addr) (right_data) (right_height) ((avl_node_model (avl_node_pre) (root_data) (root_height) (a) (b))) (c))) ” 
  &&  “ (avl_left_rotation before after ) ”
  &&  (store_addr_avl right_addr after )
) \/
(
forall (avl_node_pre: Z) (before: addr_avl_tree) (c: addr_avl_tree) (b: addr_avl_tree) (a: addr_avl_tree) (right_height: Z) (right_data: Z) (root_height: Z) (root_data: Z) (right_addr: Z) (data: Z) (height: Z) (left_tree: addr_avl_tree) (right_tree: addr_avl_tree) (PreH1 : (root_height <= UINT_MAX)) (PreH2 : (root_height >= 0)) (PreH3 : (root_data <= INT_MAX)) (PreH4 : (root_data >= INT_MIN)) (PreH5 : ((avl_node_model (right_addr) (right_data) (right_height) (b) (c)) = (avl_node_model (right_addr) (data) (height) (left_tree) (right_tree)))) (PreH6 : (avl_node_pre <> 0)) (PreH7 : (right_addr <> 0)) (PreH8 : (before = (avl_node_model (avl_node_pre) (root_data) (root_height) (a) ((avl_node_model (right_addr) (right_data) (right_height) (b) (c)))))) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_root_addr (left_tree)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_root_addr (a)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_height)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> root_data)
  **  (store_addr_avl (avl_root_addr (right_tree)) right_tree )
  **  (store_addr_avl (avl_root_addr (left_tree)) left_tree )
  **  (store_addr_avl (avl_root_addr (a)) a )
|--
  “ (avl_left_rotation before (avl_node_model (right_addr) (right_data) (right_height) ((avl_node_model (avl_node_pre) (root_data) (root_height) (a) (b))) (c)) ) ” 
  &&  “ (avl_node_pre = (avl_root_addr ((avl_node_model (avl_node_pre) (root_data) (root_height) (a) (b))))) ” 
  &&  “ ((avl_root_addr (right_tree)) = (avl_root_addr (c))) ” 
  &&  “ (height = right_height) ” 
  &&  “ (data = right_data) ”
  &&  (store_addr_avl (avl_root_addr (c)) c )
  **  (store_addr_avl (avl_root_addr ((avl_node_model (avl_node_pre) (root_data) (root_height) (a) (b)))) (avl_node_model (avl_node_pre) (root_data) (root_height) (a) (b)) )
).

Definition xizi_avl_left_rotate_return_wit_1_split_goal_1 := 
forall (avl_node_pre: Z) (before: addr_avl_tree) (c: addr_avl_tree) (b: addr_avl_tree) (a: addr_avl_tree) (right_height: Z) (right_data: Z) (root_height: Z) (root_data: Z) (right_addr: Z) (data: Z) (height: Z) (left_tree: addr_avl_tree) (right_tree: addr_avl_tree) (PreH1 : (root_height <= UINT_MAX)) (PreH2 : (root_height >= 0)) (PreH3 : (root_data <= INT_MAX)) (PreH4 : (root_data >= INT_MIN)) (PreH5 : ((avl_node_model (right_addr) (right_data) (right_height) (b) (c)) = (avl_node_model (right_addr) (data) (height) (left_tree) (right_tree)))) (PreH6 : (avl_node_pre <> 0)) (PreH7 : (right_addr <> 0)) (PreH8 : (before = (avl_node_model (avl_node_pre) (root_data) (root_height) (a) ((avl_node_model (right_addr) (right_data) (right_height) (b) (c)))))) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_root_addr (left_tree)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_root_addr (a)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_height)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> root_data)
  **  (store_addr_avl (avl_root_addr (right_tree)) right_tree )
  **  (store_addr_avl (avl_root_addr (left_tree)) left_tree )
  **  (store_addr_avl (avl_root_addr (a)) a )
|--
  “ (avl_left_rotation before (avl_node_model (right_addr) (right_data) (right_height) ((avl_node_model (avl_node_pre) (root_data) (root_height) (a) (b))) (c)) ) ”
.

Definition xizi_avl_left_rotate_return_wit_1_split_goal_2 := 
forall (avl_node_pre: Z) (before: addr_avl_tree) (c: addr_avl_tree) (b: addr_avl_tree) (a: addr_avl_tree) (right_height: Z) (right_data: Z) (root_height: Z) (root_data: Z) (right_addr: Z) (data: Z) (height: Z) (left_tree: addr_avl_tree) (right_tree: addr_avl_tree) (PreH1 : (root_height <= UINT_MAX)) (PreH2 : (root_height >= 0)) (PreH3 : (root_data <= INT_MAX)) (PreH4 : (root_data >= INT_MIN)) (PreH5 : ((avl_node_model (right_addr) (right_data) (right_height) (b) (c)) = (avl_node_model (right_addr) (data) (height) (left_tree) (right_tree)))) (PreH6 : (avl_node_pre <> 0)) (PreH7 : (right_addr <> 0)) (PreH8 : (before = (avl_node_model (avl_node_pre) (root_data) (root_height) (a) ((avl_node_model (right_addr) (right_data) (right_height) (b) (c)))))) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_root_addr (left_tree)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_root_addr (a)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_height)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> root_data)
  **  (store_addr_avl (avl_root_addr (right_tree)) right_tree )
  **  (store_addr_avl (avl_root_addr (left_tree)) left_tree )
  **  (store_addr_avl (avl_root_addr (a)) a )
|--
  “ (avl_node_pre = (avl_root_addr ((avl_node_model (avl_node_pre) (root_data) (root_height) (a) (b))))) ”
.

Definition xizi_avl_left_rotate_return_wit_1_split_goal_3 := 
forall (avl_node_pre: Z) (before: addr_avl_tree) (c: addr_avl_tree) (b: addr_avl_tree) (a: addr_avl_tree) (right_height: Z) (right_data: Z) (root_height: Z) (root_data: Z) (right_addr: Z) (data: Z) (height: Z) (left_tree: addr_avl_tree) (right_tree: addr_avl_tree) (PreH1 : (root_height <= UINT_MAX)) (PreH2 : (root_height >= 0)) (PreH3 : (root_data <= INT_MAX)) (PreH4 : (root_data >= INT_MIN)) (PreH5 : ((avl_node_model (right_addr) (right_data) (right_height) (b) (c)) = (avl_node_model (right_addr) (data) (height) (left_tree) (right_tree)))) (PreH6 : (avl_node_pre <> 0)) (PreH7 : (right_addr <> 0)) (PreH8 : (before = (avl_node_model (avl_node_pre) (root_data) (root_height) (a) ((avl_node_model (right_addr) (right_data) (right_height) (b) (c)))))) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_root_addr (left_tree)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_root_addr (a)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_height)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> root_data)
  **  (store_addr_avl (avl_root_addr (right_tree)) right_tree )
  **  (store_addr_avl (avl_root_addr (left_tree)) left_tree )
  **  (store_addr_avl (avl_root_addr (a)) a )
|--
  “ ((avl_root_addr (right_tree)) = (avl_root_addr (c))) ”
.

Definition xizi_avl_left_rotate_return_wit_1_split_goal_4 := 
forall (avl_node_pre: Z) (before: addr_avl_tree) (c: addr_avl_tree) (b: addr_avl_tree) (a: addr_avl_tree) (right_height: Z) (right_data: Z) (root_height: Z) (root_data: Z) (right_addr: Z) (data: Z) (height: Z) (left_tree: addr_avl_tree) (right_tree: addr_avl_tree) (PreH1 : (root_height <= UINT_MAX)) (PreH2 : (root_height >= 0)) (PreH3 : (root_data <= INT_MAX)) (PreH4 : (root_data >= INT_MIN)) (PreH5 : ((avl_node_model (right_addr) (right_data) (right_height) (b) (c)) = (avl_node_model (right_addr) (data) (height) (left_tree) (right_tree)))) (PreH6 : (avl_node_pre <> 0)) (PreH7 : (right_addr <> 0)) (PreH8 : (before = (avl_node_model (avl_node_pre) (root_data) (root_height) (a) ((avl_node_model (right_addr) (right_data) (right_height) (b) (c)))))) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_root_addr (left_tree)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_root_addr (a)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_height)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> root_data)
  **  (store_addr_avl (avl_root_addr (right_tree)) right_tree )
  **  (store_addr_avl (avl_root_addr (left_tree)) left_tree )
  **  (store_addr_avl (avl_root_addr (a)) a )
|--
  “ (height = right_height) ”
.

Definition xizi_avl_left_rotate_return_wit_1_split_goal_5 := 
forall (avl_node_pre: Z) (before: addr_avl_tree) (c: addr_avl_tree) (b: addr_avl_tree) (a: addr_avl_tree) (right_height: Z) (right_data: Z) (root_height: Z) (root_data: Z) (right_addr: Z) (data: Z) (height: Z) (left_tree: addr_avl_tree) (right_tree: addr_avl_tree) (PreH1 : (root_height <= UINT_MAX)) (PreH2 : (root_height >= 0)) (PreH3 : (root_data <= INT_MAX)) (PreH4 : (root_data >= INT_MIN)) (PreH5 : ((avl_node_model (right_addr) (right_data) (right_height) (b) (c)) = (avl_node_model (right_addr) (data) (height) (left_tree) (right_tree)))) (PreH6 : (avl_node_pre <> 0)) (PreH7 : (right_addr <> 0)) (PreH8 : (before = (avl_node_model (avl_node_pre) (root_data) (root_height) (a) ((avl_node_model (right_addr) (right_data) (right_height) (b) (c)))))) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_root_addr (left_tree)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_root_addr (a)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_height)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> root_data)
  **  (store_addr_avl (avl_root_addr (right_tree)) right_tree )
  **  (store_addr_avl (avl_root_addr (left_tree)) left_tree )
  **  (store_addr_avl (avl_root_addr (a)) a )
|--
  “ (data = right_data) ”
.

Definition xizi_avl_left_rotate_return_wit_1_split_goal_spatial := 
forall (avl_node_pre: Z) (before: addr_avl_tree) (c: addr_avl_tree) (b: addr_avl_tree) (a: addr_avl_tree) (right_height: Z) (right_data: Z) (root_height: Z) (root_data: Z) (right_addr: Z) (data: Z) (height: Z) (left_tree: addr_avl_tree) (right_tree: addr_avl_tree) (PreH1 : (root_height <= UINT_MAX)) (PreH2 : (root_height >= 0)) (PreH3 : (root_data <= INT_MAX)) (PreH4 : (root_data >= INT_MIN)) (PreH5 : ((avl_node_model (right_addr) (right_data) (right_height) (b) (c)) = (avl_node_model (right_addr) (data) (height) (left_tree) (right_tree)))) (PreH6 : (avl_node_pre <> 0)) (PreH7 : (right_addr <> 0)) (PreH8 : (before = (avl_node_model (avl_node_pre) (root_data) (root_height) (a) ((avl_node_model (right_addr) (right_data) (right_height) (b) (c)))))) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_root_addr (left_tree)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_root_addr (a)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_height)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> root_data)
  **  (store_addr_avl (avl_root_addr (right_tree)) right_tree )
  **  (store_addr_avl (avl_root_addr (left_tree)) left_tree )
  **  (store_addr_avl (avl_root_addr (a)) a )
|--
  (store_addr_avl (avl_root_addr (c)) c )
  **  (store_addr_avl (avl_root_addr ((avl_node_model (avl_node_pre) (root_data) (root_height) (a) (b)))) (avl_node_model (avl_node_pre) (root_data) (root_height) (a) (b)) )
.

Definition xizi_avl_left_rotate_partial_solve_wit_1 := 
forall (avl_node_pre: Z) (before: addr_avl_tree) (c: addr_avl_tree) (b: addr_avl_tree) (a: addr_avl_tree) (right_height: Z) (right_data: Z) (root_height: Z) (root_data: Z) (right_addr: Z) (PreH1 : (avl_node_pre <> 0)) (PreH2 : (right_addr <> 0)) (PreH3 : (before = (avl_node_model (avl_node_pre) (root_data) (root_height) (a) ((avl_node_model (right_addr) (right_data) (right_height) (b) (c)))))) ,
  (store_addr_avl avl_node_pre before )
|--
  EX (right_tree: addr_avl_tree)  (left_tree: addr_avl_tree)  (height: Z)  (data: Z) ,
  “ (before = (avl_node_model (avl_node_pre) (data) (height) (left_tree) (right_tree))) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (right_addr <> 0) ” 
  &&  “ (before = (avl_node_model (avl_node_pre) (root_data) (root_height) (a) ((avl_node_model (right_addr) (right_data) (right_height) (b) (c))))) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_root_addr (right_tree)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_root_addr (left_tree)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> height)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> data)
  **  (store_addr_avl (avl_root_addr (right_tree)) right_tree )
  **  (store_addr_avl (avl_root_addr (left_tree)) left_tree )
.

Definition xizi_avl_left_rotate_partial_solve_wit_2 := 
forall (avl_node_pre: Z) (before: addr_avl_tree) (c: addr_avl_tree) (b: addr_avl_tree) (a: addr_avl_tree) (right_height: Z) (right_data: Z) (root_height: Z) (root_data: Z) (right_addr: Z) (PreH1 : (avl_node_pre <> 0)) (PreH2 : (right_addr <> 0)) (PreH3 : (before = (avl_node_model (avl_node_pre) (root_data) (root_height) (a) ((avl_node_model (right_addr) (right_data) (right_height) (b) (c)))))) ,
  (avl_node_fields avl_node_pre root_data root_height (avl_root_addr (a)) right_addr )
  **  (store_addr_avl (avl_root_addr (a)) a )
  **  (store_addr_avl right_addr (avl_node_model (right_addr) (right_data) (right_height) (b) (c)) )
|--
  EX (right_tree: addr_avl_tree)  (left_tree: addr_avl_tree)  (height: Z)  (data: Z) ,
  “ ((avl_node_model (right_addr) (right_data) (right_height) (b) (c)) = (avl_node_model (right_addr) (data) (height) (left_tree) (right_tree))) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (right_addr <> 0) ” 
  &&  “ (before = (avl_node_model (avl_node_pre) (root_data) (root_height) (a) ((avl_node_model (right_addr) (right_data) (right_height) (b) (c))))) ”
  &&  ((&((right_addr)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_root_addr (left_tree)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> right_addr)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_root_addr (a)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_height)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> root_data)
  **  ((&((right_addr)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_root_addr (right_tree)))
  **  ((&((right_addr)  # "AvlNode" ->ₛ "height")) # UInt  |-> height)
  **  ((&((right_addr)  # "AvlNode" ->ₛ "data")) # Int  |-> data)
  **  (store_addr_avl (avl_root_addr (right_tree)) right_tree )
  **  (store_addr_avl (avl_root_addr (left_tree)) left_tree )
  **  (store_addr_avl (avl_root_addr (a)) a )
.

Module Type VC_Correct.

Include xizi_avl_Strategy_Correct.

Axiom proof_of_xizi_avl_left_rotate_entail_wit_1 : xizi_avl_left_rotate_entail_wit_1.
Axiom proof_of_xizi_avl_left_rotate_return_wit_1 : xizi_avl_left_rotate_return_wit_1.
Axiom proof_of_xizi_avl_left_rotate_partial_solve_wit_1 : xizi_avl_left_rotate_partial_solve_wit_1.
Axiom proof_of_xizi_avl_left_rotate_partial_solve_wit_2 : xizi_avl_left_rotate_partial_solve_wit_2.

End VC_Correct.
