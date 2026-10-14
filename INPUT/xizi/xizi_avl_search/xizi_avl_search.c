#include "xizi_avl_def.h"

/*@ Extern Coq (Some : {A} -> A -> option A)
               (None : {A} -> option A) */
/*@ Extern Coq (avl_tree_valid : avl_model -> Prop)
               (avl_mapping_root_rep : (Z -> option Z) -> Z -> Assertion)
               (avl_subtree_store_at : avl_model -> Z -> Assertion)
               (avl_search_cursor_valid : avl_model -> Z -> Z -> Prop)
*/

/* Compilable single-function extraction of crtos AvlNodeSearchNode.
 * Kernel logging is omitted. */
struct AvlNode *xizi_avl_search(struct AvlNode *avl_node, int data)
  /*@ high_level_spec <= low_level_spec
      With m
      Require
        avl_mapping_root_rep(m, avl_node)
      Ensure
        ((m(data) == None && __return == 0) ||
         (m(data) == Some(__return) && __return != 0)) &&
        avl_mapping_root_rep(m, avl_node)
   */
;

struct AvlNode *xizi_avl_search(struct AvlNode *avl_node, int data)
  /*@ low_level_spec
      With g
      Require
        avl_tree_valid(g) &&
        avl_search_cursor_valid(g, avl_node, data) &&
        avl_subtree_store_at(g, avl_node)
      Ensure
        avl_search_result(g, data, __return) &&
        avl_subtree_store_at(g, avl_node)
   */
{
    struct AvlNode *destination_node = (void *)0;

    /*@ INT_MIN <= data && data <= INT_MAX by local */
    if (avl_node != (void *)0) {
        /*@ Assert
            avl_node == avl_node@pre && data == data@pre &&
            INT_MIN <= data && data <= INT_MAX &&
            avl_tree_valid(g) &&
            avl_vvalid(g, avl_node) && avl_node != 0 &&
            INT_MIN <= avl_key_of(g, avl_node) && avl_key_of(g, avl_node) <= INT_MAX &&
            0 <= avl_height_of(g, avl_node) && avl_height_of(g, avl_node) <= UINT_MAX &&
            avl_search_cursor_valid(g, avl_node, data) &&
            store(&destination_node, 0) *
            store(&(avl_node->data), avl_key_of(g, avl_node)) *
            store(&(avl_node->height), avl_height_of(g, avl_node)) *
            store(&(avl_node->left), avl_ptr_of(avl_left(g, avl_node))) *
            store(&(avl_node->right), avl_ptr_of(avl_right(g, avl_node))) *
            avl_subtree_store_at(g, avl_ptr_of(avl_left(g, avl_node))) *
            avl_subtree_store_at(g, avl_ptr_of(avl_right(g, avl_node)))
        */
        if (data == avl_node->data) {
            destination_node = avl_node;
        } else if (avl_node->data < data) {
            /*@ Assert
                avl_node == avl_node@pre && data == data@pre &&
                INT_MIN <= data && data <= INT_MAX &&
                avl_tree_valid(g) &&
                avl_vvalid(g, avl_node) && avl_node != 0 &&
                INT_MIN <= avl_key_of(g, avl_node) && avl_key_of(g, avl_node) <= INT_MAX &&
                0 <= avl_height_of(g, avl_node) && avl_height_of(g, avl_node) <= UINT_MAX &&
                avl_key_of(g, avl_node) < data &&
                avl_search_cursor_valid(g, avl_ptr_of(avl_right(g, avl_node)), data) &&
                store(&destination_node, 0) *
                store(&(avl_node->data), avl_key_of(g, avl_node)) *
                store(&(avl_node->height), avl_height_of(g, avl_node)) *
                store(&(avl_node->left), avl_ptr_of(avl_left(g, avl_node))) *
                store(&(avl_node->right), avl_ptr_of(avl_right(g, avl_node))) *
                avl_subtree_store_at(g, avl_ptr_of(avl_left(g, avl_node))) *
                avl_subtree_store_at(g, avl_ptr_of(avl_right(g, avl_node)))
            */
            destination_node = xizi_avl_search(avl_node->right, data);
        } else {
            /*@ Assert
                avl_node == avl_node@pre && data == data@pre &&
                INT_MIN <= data && data <= INT_MAX &&
                avl_tree_valid(g) &&
                avl_vvalid(g, avl_node) && avl_node != 0 &&
                INT_MIN <= avl_key_of(g, avl_node) && avl_key_of(g, avl_node) <= INT_MAX &&
                0 <= avl_height_of(g, avl_node) && avl_height_of(g, avl_node) <= UINT_MAX &&
                data < avl_key_of(g, avl_node) &&
                avl_search_cursor_valid(g, avl_ptr_of(avl_left(g, avl_node)), data) &&
                store(&destination_node, 0) *
                store(&(avl_node->data), avl_key_of(g, avl_node)) *
                store(&(avl_node->height), avl_height_of(g, avl_node)) *
                store(&(avl_node->left), avl_ptr_of(avl_left(g, avl_node))) *
                store(&(avl_node->right), avl_ptr_of(avl_right(g, avl_node))) *
                avl_subtree_store_at(g, avl_ptr_of(avl_left(g, avl_node))) *
                avl_subtree_store_at(g, avl_ptr_of(avl_right(g, avl_node)))
            */
            destination_node = xizi_avl_search(avl_node->left, data);
        }
    } else {
        return (void *)0;
    }

    /*@ avl_node == avl_node@pre by local */
    return destination_node;
}
