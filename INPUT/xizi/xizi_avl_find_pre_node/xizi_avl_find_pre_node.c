#include "xizi_avl_def.h"

/*@ Extern Coq (avl_mapping :: *) */
/*@ Extern Coq (avl_mapping_refines_graph : avl_mapping -> avl_model -> Prop)
               (avl_predecessor_result : avl_model -> Z -> Z -> Prop)
               (avl_mapping_predecessor_result : avl_mapping -> avl_model -> Z -> Z -> Prop)
               (avl_right_spine_cursor_valid : avl_model -> Z -> Z -> Prop)
               (avl_graph_rep_at : avl_model -> Z -> Assertion) */

struct AvlNode *xizi_avl_find_pre_node(struct AvlNode *avl_node)
  /*@ high_level_spec
      With m g
      Require avl_mapping_refines_graph(m, g) &&
              avl_gvalid(g) && avl_vvalid(g, avl_node) &&
              avl_graph_rep_at(g, avl_node)
      Ensure avl_mapping_predecessor_result(m, g, avl_node, __return) &&
             avl_graph_rep_at(g, avl_node)
   */
  /*@ low_level_spec
      With g
      Require avl_gvalid(g) && avl_vvalid(g, avl_node) &&
              avl_graph_rep_at(g, avl_node)
      Ensure avl_predecessor_result(g, avl_node, __return) &&
             avl_graph_rep_at(g, avl_node)
   */
;

/* Compilable single-function extraction of crtos AvlTreeFindPreNode.
 * It returns the rightmost node in the left subtree, or the input node when
 * there is no left subtree. */
struct AvlNode *xizi_avl_find_pre_node(struct AvlNode *avl_node)
{
    struct AvlNode *pre_node = (void *)0;

    if (avl_node->left != (void *)0) {
        /*@ Assert
            exists g, avl_gvalid(g) && avl_vvalid(g, avl_node) &&
            avl_left(g, avl_node) != None &&
            avl_graph_rep_at(g, avl_node) * store(&pre_node, 0)
        */
        if (avl_node->left->right != (void *)0) {
            pre_node = avl_node->left->right;
            /*@ Assert
                exists g, avl_gvalid(g) && avl_vvalid(g, avl_node) &&
                avl_right_spine_cursor_valid(
                  g, avl_ptr_of(avl_left(g, avl_node)), pre_node) &&
                avl_graph_rep_at(g, avl_node) * store(&pre_node, pre_node)
            */
            /*@ Inv Assert
                exists g, avl_gvalid(g) && avl_vvalid(g, avl_node) &&
                avl_right_spine_cursor_valid(
                  g, avl_ptr_of(avl_left(g, avl_node)), pre_node) &&
                avl_graph_rep_at(g, avl_node) * store(&pre_node, pre_node)
            */
            while (pre_node->right != (void *)0) {
                pre_node = pre_node->right;
            }
        } else {
            pre_node = avl_node->left;
        }
    } else {
        pre_node = avl_node;
    }

    return pre_node;
}
