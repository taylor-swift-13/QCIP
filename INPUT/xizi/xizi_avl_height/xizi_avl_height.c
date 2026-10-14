#include "xizi_avl_def.h"

/*@ Import Coq Require Import QCIPLib.xizi.xizi_avl_common.xizi_avl_graph_lib */
/*@ Extern Coq (avl_model :: *) */
/*@ Extern Coq (avl_tree_valid : avl_model -> Prop)
               (avl_height_int_result_safe : avl_model -> Z -> Prop)
               (avl_height_consistent : avl_model -> Prop)
               (avl_height_result : avl_model -> Z -> Z -> Prop)
               (avl_height_of : avl_model -> Z -> Z)
               (avl_vvalid : avl_model -> Z -> Prop)
               (avl_key_of : avl_model -> Z -> Z)
               (avl_left : avl_model -> Z -> option Z)
               (avl_right : avl_model -> Z -> option Z)
               (avl_ptr_of : option Z -> Z)
               (avl_subtree_store_at : avl_model -> Z -> Assertion)
*/

/* Return the cached AVL node height, or zero for an empty subtree. */
int xizi_avl_height(struct AvlNode *avl_node)
  /*@ low_level_spec
      With g
      Require avl_tree_valid(g) &&
              avl_height_int_result_safe(g, avl_node) &&
              avl_subtree_store_at(g, avl_node)
      Ensure avl_height_result(g, avl_node, __return) &&
             avl_subtree_store_at(g, avl_node)
   */
{
    if (avl_node == (void *)0) {
        return 0;
    }
    /*@ Assert
        avl_node == avl_node@pre &&
        avl_tree_valid(g) &&
        avl_vvalid(g, avl_node) && avl_node != 0 &&
        0 <= avl_height_of(g, avl_node) &&
        avl_height_of(g, avl_node) <= INT_MAX &&
        store(&(avl_node->data), avl_key_of(g, avl_node)) *
        store(&(avl_node->height), avl_height_of(g, avl_node)) *
        store(&(avl_node->left), avl_ptr_of(avl_left(g, avl_node))) *
        store(&(avl_node->right), avl_ptr_of(avl_right(g, avl_node))) *
        avl_subtree_store_at(g, avl_ptr_of(avl_left(g, avl_node))) *
        avl_subtree_store_at(g, avl_ptr_of(avl_right(g, avl_node)))
    */
    return (int)avl_node->height;
}
