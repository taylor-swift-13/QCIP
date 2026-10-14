#include "xizi_avl_def.h"

/*@ Import Coq Require Import QCIPLib.xizi.xizi_avl_common.xizi_avl_graph_lib */
/*@ Extern Coq (avl_model :: *) */
/*@ Extern Coq (avl_vvalid : avl_model -> Z -> Prop)
               (avl_height_input_valid : avl_model -> Prop)
               (avl_height_int_result_safe : avl_model -> Z -> Prop)
               (avl_height_result : avl_model -> Z -> Z -> Prop)
               (avl_subtree_store_at : avl_model -> Z -> Assertion)
               (avl_balance_factor_input_valid : avl_model -> Prop)
               (avl_balance_factor_or_null : avl_model -> Z -> Z -> Prop)
               (avl_graph_nodes_store : avl_model -> list Z -> Assertion)
               (avl_nodes_without : avl_model -> Z -> list Z)
               (avl_key_of : avl_model -> Z -> Z)
               (avl_height_of : avl_model -> Z -> Z)
               (avl_left : avl_model -> Z -> option Z)
               (avl_right : avl_model -> Z -> option Z)
               (avl_ptr_of : option Z -> Z) */

/* Height of an AVL tree node; declared with an explicit entry pointer so the
 * result and the preserved subtree ownership both refer to the call's input. */
int xizi_avl_height(struct AvlNode *avl_node)
  /*@ high_level_spec
      With g entry
      Require avl_node == entry &&
              avl_height_input_valid(g) &&
              avl_height_int_result_safe(g, entry) &&
              avl_subtree_store_at(g, entry)
      Ensure avl_height_result(g, entry, __return) &&
             avl_subtree_store_at(g, entry)
   */
;

/* Balance factor is the model's left subtree height minus right subtree
 * height, with a missing input returning zero. */
int xizi_avl_balance_factor(struct AvlNode *avl_node)
  /*@ high_level_spec
      With g factor_arg owner
      Require avl_node == factor_arg &&
             avl_balance_factor_input_valid(g) &&
             (factor_arg == 0 || avl_vvalid(g, factor_arg)) &&
             owner != 0 &&
             store(&(owner->data), avl_key_of(g, owner)) *
             store(&(owner->height), avl_height_of(g, owner)) *
             store(&(owner->left), avl_ptr_of(avl_left(g, owner))) *
             store(&(owner->right), avl_ptr_of(avl_right(g, owner))) *
             avl_graph_nodes_store(g, avl_nodes_without(g, owner))
      Ensure avl_balance_factor_or_null(g, factor_arg, __return) &&
             avl_balance_factor_input_valid(g) &&
             owner != 0 &&
             store(&(owner->data), avl_key_of(g, owner)) *
             store(&(owner->height), avl_height_of(g, owner)) *
             store(&(owner->left), avl_ptr_of(avl_left(g, owner))) *
             store(&(owner->right), avl_ptr_of(avl_right(g, owner))) *
             avl_graph_nodes_store(g, avl_nodes_without(g, owner))
   */
;

/* Balance factor of an AVL tree node: height(left) - height(right); a null
 * input returns zero. */
int xizi_avl_balance_factor(struct AvlNode *avl_node)
{
    if (avl_node == (void *)0) {
        return 0;
    }
    int lh = xizi_avl_height(avl_node->left);
    int rh = xizi_avl_height(avl_node->right);
    return lh - rh;
}
