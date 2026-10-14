#include "xizi_avl_def.h"

/*@ Import Coq Require Import QCIPLib.xizi.xizi_avl_common.xizi_avl_graph_lib */
/*@ Extern Coq (avl_model :: *) */
/*@ Extern Coq (avl_left : avl_model -> Z -> option Z)
               (avl_right : avl_model -> Z -> option Z)
               (avl_ptr_of : option Z -> Z)
               (avl_key_of : avl_model -> Z -> Z)
               (avl_height_of : avl_model -> Z -> Z)
               (avl_subtree_model : avl_model -> Z -> avl_model)
               (avl_subtree_store_at : avl_model -> Z -> Assertion)
               (avl_tree_store : avl_model -> Assertion)
               (avl_with_root_cache : avl_model -> Z -> Z -> avl_model)
               (avl_left_rotation_cached_input : avl_model -> Z -> Prop)
               (avl_left_rotation_post : avl_model -> Z -> Z -> Assertion)
               (avl_right_rotation_input : avl_model -> Z -> Prop)
               (avl_right_rotation_post : avl_model -> Z -> Z -> Assertion)
               (avl_lr_rotation_input : avl_model -> Z -> Prop)
               (avl_lr_middle : avl_model -> avl_model -> Z -> Z -> Z -> Prop)
               (avl_lr_rotation_post : avl_model -> Z -> Z -> Assertion) */

/* Accepted cached-root interface of the separately verified left rotation. */
struct AvlNode *xizi_avl_left_rotate(struct AvlNode *avl_node)
  /*@ high_level_spec
      With before root_cached_height
      Require avl_left_rotation_cached_input(before, avl_node) &&
              avl_tree_store(avl_with_root_cache(before, avl_node, root_cached_height))
      Ensure avl_left_rotation_post(before, avl_node, __return)
   */
;

/* Accepted cached-root interface of the separately verified right rotation. */
struct AvlNode *xizi_avl_right_rotate(struct AvlNode *avl_node)
  /*@ high_level_spec
      With before root_cached_height
      Require avl_right_rotation_input(before, avl_node) &&
              avl_tree_store(avl_with_root_cache(before, avl_node, root_cached_height))
      Ensure avl_right_rotation_post(before, avl_node, __return)
   */
;

/* Generic LR rotation preserves BST topology semantics, all nodes and keys,
 * and establishes exact final heights. Only the old outer-root stored cache
 * may differ from the exact mathematical input graph. */
struct AvlNode *xizi_avl_lr_rotate(struct AvlNode *avl_node)
  /*@ high_level_spec
      With before root_cached_height
      Require avl_lr_rotation_input(before, avl_node) &&
              avl_tree_store(avl_with_root_cache(before, avl_node, root_cached_height))
      Ensure avl_lr_rotation_post(before, avl_node, __return)
   */
{
    /*@ Assert
        avl_lr_rotation_input(before, avl_node@pre) &&
        avl_left_rotation_cached_input(
          avl_subtree_model(before, avl_ptr_of(avl_left(before, avl_node@pre))),
          avl_ptr_of(avl_left(before, avl_node@pre))) &&
        store(&(avl_node@pre->data), avl_key_of(before, avl_node@pre)) *
        store(&(avl_node@pre->height), root_cached_height) *
        store(&(avl_node@pre->left), avl_ptr_of(avl_left(before, avl_node@pre))) *
        store(&(avl_node@pre->right), avl_ptr_of(avl_right(before, avl_node@pre))) *
        avl_tree_store(avl_with_root_cache(
          avl_subtree_model(before, avl_ptr_of(avl_left(before, avl_node@pre))),
          avl_ptr_of(avl_left(before, avl_node@pre)),
          avl_height_of(before, avl_ptr_of(avl_left(before, avl_node@pre))))) *
        avl_subtree_store_at(before, avl_ptr_of(avl_right(before, avl_node@pre))) *
        store(&avl_node, avl_node@pre)
    */
    struct AvlNode *left_node = avl_node->left;

    avl_node->left = xizi_avl_left_rotate(left_node)
        /*@ where(high_level_spec)
            before = avl_subtree_model(before, avl_ptr_of(avl_left(before, avl_node@pre))),
            root_cached_height = avl_height_of(before, avl_ptr_of(avl_left(before, avl_node@pre))) */;

    /*@ Assert
        exists middle,
        avl_lr_rotation_input(before, avl_node@pre) &&
        avl_lr_middle(before, middle, avl_node@pre,
          avl_ptr_of(avl_left(before, avl_node@pre)),
          avl_ptr_of(avl_right(before, avl_ptr_of(avl_left(before, avl_node@pre))))) &&
        avl_right_rotation_input(middle, avl_node@pre) &&
        avl_tree_store(avl_with_root_cache(middle, avl_node@pre, root_cached_height)) *
        store(&avl_node, avl_node@pre) *
        store(&left_node, avl_ptr_of(avl_left(before, avl_node@pre)))
    */
    struct AvlNode *new_node = xizi_avl_right_rotate(avl_node)
        /*@ where(high_level_spec) root_cached_height = root_cached_height */;

    return new_node;
}