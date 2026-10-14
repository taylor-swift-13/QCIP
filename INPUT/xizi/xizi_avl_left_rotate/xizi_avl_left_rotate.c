#include "xizi_avl_def.h"

/*@ Import Coq Require Import QCIPLib.xizi.xizi_avl_common.xizi_avl_graph_lib */
/*@ Extern Coq (avl_model :: *) */
/*@ Extern Coq (avl_height_input_valid : avl_model -> Prop)
               (avl_height_int_result_safe : avl_model -> Z -> Prop)
               (avl_height_result : avl_model -> Z -> Z -> Prop)
               (avl_subtree_store_at : avl_model -> Z -> Assertion)
               (avl_vvalid : avl_model -> Z -> Prop)
               (avl_root : avl_model -> option Z)
               (avl_left : avl_model -> Z -> option Z)
               (avl_right : avl_model -> Z -> option Z)
               (avl_ptr_of : option Z -> Z)
               (avl_key_of : avl_model -> Z -> Z)
               (avl_height_of : avl_model -> Z -> Z)
               (avl_left_rotation_model : avl_model -> avl_model -> Z -> Z -> Prop)
               (avl_left_rotation_cached_input : avl_model -> Z -> Prop)
               (avl_left_rotation_post : avl_model -> Z -> Z -> Assertion)
               (avl_with_root_cache : avl_model -> Z -> Z -> avl_model)
               (avl_tree_store : avl_model -> Assertion) */

int xizi_avl_height(struct AvlNode *avl_node)
  /*@ high_level_spec
      With h_graph entry
      Require avl_node == entry &&
              avl_height_input_valid(h_graph) &&
              avl_height_int_result_safe(h_graph, entry) &&
              avl_subtree_store_at(h_graph, entry)
      Ensure avl_height_result(h_graph, entry, __return) &&
             avl_subtree_store_at(h_graph, entry)
   */
;


/* Graph-only caller interface. The graph describes the owned subtree, so
 * an enclosing tree's disjoint resources can be kept by the frame rule.
 * Only the root cache may be stale; the abstract graph has exact heights.
 * Exact-cache callers choose root_cached_height = avl_height_of(before, avl_node).
 * Output existence and post-graph validity are obligations of this refinement. */
struct AvlNode *xizi_avl_left_rotate(struct AvlNode *avl_node)
  /*@ high_level_spec <= low_level_spec
      With before root_cached_height
      Require avl_left_rotation_cached_input(before, avl_node) &&
              avl_tree_store(avl_with_root_cache(before, avl_node, root_cached_height))
      Ensure avl_left_rotation_post(before, avl_node, __return)
   */
;

/* Left rotation of an AVL subtree (the RR-imbalance fix); mirror of the right
 * rotation.
 *
 * Shape-level closure of
 *   crtos/Ubiquitous/XiZi_IIoT_Macro/kernel/thread/avl_tree.c
 *   :: AvlTreeSetLeftRotate
 * The caller supplies a non-null top node whose right child is also non-null.
 *
 *      avl_node                     new_node
 *      /      \                     /      \
 *     l    new_node   ==>       avl_node    .
 *           /    \               /    \
 *          .      .             l      .
 *
 * This primitive refreshes the cached heights of the demoted root and promoted
 * child after rewiring, matching the current crtos implementation. */
struct AvlNode *xizi_avl_left_rotate(struct AvlNode *avl_node)
  /*@ low_level_spec
      With g rotated promoted root_cached_height
      Require avl_height_input_valid(g) &&
              avl_height_input_valid(rotated) &&
              avl_vvalid(g, avl_node) && avl_node != 0 &&
              avl_root(g) == Some(avl_node) &&
              avl_ptr_of(avl_right(g, avl_node)) == promoted &&
              promoted != 0 && avl_vvalid(g, promoted) &&
              avl_left_rotation_model(g, rotated, avl_node, promoted) &&
              avl_root(rotated) == Some(promoted) &&
              avl_height_int_result_safe(g, avl_ptr_of(avl_left(g, avl_node))) &&
              avl_height_int_result_safe(g, avl_ptr_of(avl_left(g, promoted))) &&
              avl_height_int_result_safe(rotated, avl_node) &&
              avl_height_int_result_safe(g, avl_ptr_of(avl_right(g, promoted))) &&
              0 <= avl_height_of(rotated, avl_node) &&
              avl_height_of(rotated, avl_node) <= UINT_MAX &&
              0 <= avl_height_of(rotated, promoted) &&
              avl_height_of(rotated, promoted) <= UINT_MAX &&
              store(&(avl_node->data), avl_key_of(g, avl_node)) *
              store(&(avl_node->height), root_cached_height) *
              store(&(avl_node->left), avl_ptr_of(avl_left(g, avl_node))) *
              store(&(avl_node->right), promoted) *
              store(&(promoted->data), avl_key_of(g, promoted)) *
              store(&(promoted->height), avl_height_of(g, promoted)) *
              store(&(promoted->left), avl_ptr_of(avl_left(g, promoted))) *
              store(&(promoted->right), avl_ptr_of(avl_right(g, promoted))) *
              avl_subtree_store_at(g, avl_ptr_of(avl_left(g, avl_node))) *
              avl_subtree_store_at(g, avl_ptr_of(avl_left(g, promoted))) *
              avl_subtree_store_at(g, avl_ptr_of(avl_right(g, promoted)))
      Ensure __return == promoted &&
             avl_left_rotation_model(g, rotated, avl_node, promoted) &&
             avl_root(rotated) == Some(__return) &&
             avl_tree_store(rotated)
   */
{
    struct AvlNode *new_node = avl_node->right;

    avl_node->right = new_node->left;
    new_node->left = avl_node;

    unsigned int left_height = xizi_avl_height(avl_node->left)
        /*@ where(high_level_spec) h_graph = g, entry = avl_ptr_of(avl_left(g, avl_node)) */;
    unsigned int right_height = xizi_avl_height(avl_node->right)
        /*@ where(high_level_spec) h_graph = g, entry = avl_ptr_of(avl_left(g, promoted)) */;
    avl_node->height = (left_height > right_height ? left_height : right_height) + 1U;

    /*@ Assert
        exists lh rh,
        avl_height_input_valid(g) &&
        avl_height_input_valid(rotated) &&
        avl_height_int_result_safe(rotated, avl_node@pre) &&
        avl_height_int_result_safe(g, avl_ptr_of(avl_right(g, promoted))) &&
        avl_left_rotation_model(g, rotated, avl_node@pre, promoted) &&
        avl_root(rotated) == Some(promoted) &&
        0 <= avl_height_of(rotated, promoted) &&
        avl_height_of(rotated, promoted) <= UINT_MAX &&
        avl_subtree_store_at(rotated, avl_node@pre) *
        store(&(promoted->data), avl_key_of(g, promoted)) *
        store(&(promoted->height), avl_height_of(g, promoted)) *
        store(&(promoted->left), avl_node@pre) *
        store(&(promoted->right), avl_ptr_of(avl_right(g, promoted))) *
        avl_subtree_store_at(g, avl_ptr_of(avl_right(g, promoted))) *
        store(&avl_node, avl_node@pre) * store(&new_node, promoted) *
        store(&left_height, lh) * store(&right_height, rh)
    */
    left_height = xizi_avl_height(new_node->left)
        /*@ where(high_level_spec) h_graph = rotated, entry = avl_node */;
    right_height = xizi_avl_height(new_node->right)
        /*@ where(high_level_spec) h_graph = g, entry = avl_ptr_of(avl_right(g, promoted)) */;
    new_node->height = (left_height > right_height ? left_height : right_height) + 1U;

    return new_node;
}
