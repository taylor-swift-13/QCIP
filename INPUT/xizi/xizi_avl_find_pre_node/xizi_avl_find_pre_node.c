#include "xizi_avl_def.h"

/* Compilable single-function extraction of crtos AvlTreeFindPreNode.
 * It returns the rightmost node in the left subtree, or the input node when
 * there is no left subtree. */
struct AvlNode *xizi_avl_find_pre_node(struct AvlNode *avl_node)
{
    struct AvlNode *pre_node = (void *)0;

    if (avl_node->left != (void *)0) {
        if (avl_node->left->right != (void *)0) {
            pre_node = avl_node->left->right;
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
