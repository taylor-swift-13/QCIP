#include "xizi_avl_def.h"

/*@ Extern Coq (avl_balance_graph_input : avl_model -> Z -> Prop)
               (avl_balance_graph_result : avl_model -> avl_model -> Z -> Prop)
               (avl_balance_factor_input_valid : avl_model -> Prop)
               (avl_balance_factor_or_null : avl_model -> Z -> Z -> Prop)
               (avl_nodes_without : avl_model -> Z -> list Z)
               (avl_graph_nodes_store : avl_model -> list Z -> Assertion)
               (avl_with_root_cache : avl_model -> Z -> Z -> avl_model)
               (avl_right_rotation_input : avl_model -> Z -> Prop)
               (avl_right_rotation_post : avl_model -> Z -> Z -> Assertion)
               (avl_left_rotation_cached_input : avl_model -> Z -> Prop)
               (avl_left_rotation_post : avl_model -> Z -> Z -> Assertion)
               (avl_lr_rotation_input : avl_model -> Z -> Prop)
               (avl_lr_rotation_post : avl_model -> Z -> Z -> Assertion)
               (avl_rl_rotation_input : avl_model -> Z -> Prop)
               (avl_rl_rotation_post : avl_model -> Z -> Z -> Assertion)
*/

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

struct AvlNode *xizi_avl_right_rotate(struct AvlNode *avl_node)
  /*@ high_level_spec
      With before root_cached_height
      Require avl_right_rotation_input(before, avl_node) &&
              avl_tree_store(avl_with_root_cache(before, avl_node, root_cached_height))
      Ensure avl_right_rotation_post(before, avl_node, __return)
   */
;

struct AvlNode *xizi_avl_left_rotate(struct AvlNode *avl_node)
  /*@ high_level_spec
      With before root_cached_height
      Require avl_left_rotation_cached_input(before, avl_node) &&
              avl_tree_store(avl_with_root_cache(before, avl_node, root_cached_height))
      Ensure avl_left_rotation_post(before, avl_node, __return)
   */
;

struct AvlNode *xizi_avl_lr_rotate(struct AvlNode *avl_node)
  /*@ high_level_spec
      With before root_cached_height
      Require avl_lr_rotation_input(before, avl_node) &&
              avl_tree_store(avl_with_root_cache(before, avl_node, root_cached_height))
      Ensure avl_lr_rotation_post(before, avl_node, __return)
   */
;

struct AvlNode *xizi_avl_rl_rotate(struct AvlNode *avl_node)
  /*@ high_level_spec
      With before root_cached_height
      Require avl_rl_rotation_input(before, avl_node) &&
              avl_tree_store(avl_with_root_cache(before, avl_node, root_cached_height))
      Ensure avl_rl_rotation_post(before, avl_node, __return)
   */
;

/* Restore AVL balance at an exact-height BST root.  Child subtrees are
 * already AVL; root factor sign determines the side requiring repair. */
struct AvlNode *xizi_avl_balance(struct AvlNode *avl_node)
  /*@ high_level_spec
      With before
      Require avl_balance_graph_input(before, avl_node) &&
              avl_tree_store(before)
      Ensure exists after,
               avl_balance_graph_result(before, after, __return) &&
               avl_tree_store(after)
   */
{
    if (avl_node == (void *)0) {
        return (void *)0;
    }
    /*@ Assert
        avl_balance_graph_input(before, avl_node@pre) &&
        avl_balance_factor_input_valid(before) &&
        avl_vvalid(before, avl_node@pre) && avl_node@pre != 0 &&
        store(&(avl_node@pre->data), avl_key_of(before, avl_node@pre)) *
        store(&(avl_node@pre->height), avl_height_of(before, avl_node@pre)) *
        store(&(avl_node@pre->left), avl_ptr_of(avl_left(before, avl_node@pre))) *
        store(&(avl_node@pre->right), avl_ptr_of(avl_right(before, avl_node@pre))) *
        avl_graph_nodes_store(before, avl_nodes_without(before, avl_node@pre)) *
        store(&avl_node, avl_node@pre)
    */
    int balance_factor = xizi_avl_balance_factor(avl_node)
        /*@ where(high_level_spec) g = before, owner = avl_node@pre,
                factor_arg = avl_node@pre */;

    if (balance_factor > 1) {
        int child_factor = xizi_avl_balance_factor(avl_node->left)
            /*@ where(high_level_spec) g = before, owner = avl_node@pre,
                    factor_arg = avl_ptr_of(avl_left(before, avl_node@pre)) */;
        if (child_factor >= 0) {
            /*@ Assert
                avl_balance_graph_input(before, avl_node@pre) &&
                avl_model_balance_factor(before, avl_node@pre) > 1 &&
                avl_balance_factor_or_null(before,
                  avl_ptr_of(avl_left(before, avl_node@pre)), child_factor) &&
                child_factor >= 0 &&
                avl_right_rotation_input(before, avl_node@pre) &&
                avl_tree_store(avl_with_root_cache(before, avl_node@pre,
                  avl_height_of(before, avl_node@pre))) *
                store(&avl_node, avl_node@pre) *
                store(&balance_factor, avl_model_balance_factor(before, avl_node@pre))
            */
            return xizi_avl_right_rotate(avl_node)
                /*@ where(high_level_spec) before = before,
                        root_cached_height = avl_height_of(before, avl_node@pre) */;
        }
        /*@ Assert
            avl_balance_graph_input(before, avl_node@pre) &&
            avl_model_balance_factor(before, avl_node@pre) > 1 &&
            avl_balance_factor_or_null(before,
              avl_ptr_of(avl_left(before, avl_node@pre)), child_factor) &&
            child_factor < 0 &&
            avl_lr_rotation_input(before, avl_node@pre) &&
            avl_tree_store(avl_with_root_cache(before, avl_node@pre,
              avl_height_of(before, avl_node@pre))) *
            store(&avl_node, avl_node@pre) *
            store(&balance_factor, avl_model_balance_factor(before, avl_node@pre))
        */
        return xizi_avl_lr_rotate(avl_node)
            /*@ where(high_level_spec) before = before,
                    root_cached_height = avl_height_of(before, avl_node@pre) */;
    }
    if (balance_factor < -1) {
        int child_factor = xizi_avl_balance_factor(avl_node->right)
            /*@ where(high_level_spec) g = before, owner = avl_node@pre,
                    factor_arg = avl_ptr_of(avl_right(before, avl_node@pre)) */;
        if (child_factor <= 0) {
            /*@ Assert
                avl_balance_graph_input(before, avl_node@pre) &&
                avl_model_balance_factor(before, avl_node@pre) < -1 &&
                avl_balance_factor_or_null(before,
                  avl_ptr_of(avl_right(before, avl_node@pre)), child_factor) &&
                child_factor <= 0 &&
                avl_left_rotation_cached_input(before, avl_node@pre) &&
                avl_tree_store(avl_with_root_cache(before, avl_node@pre,
                  avl_height_of(before, avl_node@pre))) *
                store(&avl_node, avl_node@pre) *
                store(&balance_factor, avl_model_balance_factor(before, avl_node@pre))
            */
            return xizi_avl_left_rotate(avl_node)
                /*@ where(high_level_spec) before = before,
                        root_cached_height = avl_height_of(before, avl_node@pre) */;
        }
        /*@ Assert
            avl_balance_graph_input(before, avl_node@pre) &&
            avl_model_balance_factor(before, avl_node@pre) < -1 &&
            avl_balance_factor_or_null(before,
              avl_ptr_of(avl_right(before, avl_node@pre)), child_factor) &&
            child_factor > 0 &&
            avl_rl_rotation_input(before, avl_node@pre) &&
            avl_tree_store(avl_with_root_cache(before, avl_node@pre,
              avl_height_of(before, avl_node@pre))) *
            store(&avl_node, avl_node@pre) *
            store(&balance_factor, avl_model_balance_factor(before, avl_node@pre))
        */
        return xizi_avl_rl_rotate(avl_node)
            /*@ where(high_level_spec) before = before,
                    root_cached_height = avl_height_of(before, avl_node@pre) */;
    }
    return avl_node;
}
