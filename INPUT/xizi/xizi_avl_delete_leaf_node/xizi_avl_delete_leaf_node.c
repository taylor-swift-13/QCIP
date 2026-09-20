#include "xizi_avl_def.h"

void x_free(void *pointer);
struct AvlNode *xizi_avl_find_pre_node(struct AvlNode *avl_node);
struct AvlNode *xizi_avl_delete(struct AvlNode *avl_node, int data);

/* Compilable single-function extraction of crtos AvlTreeDeleteLeafNode.
 * The source assigns NULL before x_free in its zero/one-child branches.  That
 * behavior is deliberately retained here so verification can expose it. */
struct AvlNode *xizi_avl_delete_leaf_node(struct AvlNode *avl_node)
{
    struct AvlNode *pre_node = (void *)0;

    if (avl_node->left == (void *)0 && avl_node->right == (void *)0) {
        avl_node = (void *)0;
        x_free(avl_node);
    } else if (avl_node->left == (void *)0) {
        avl_node->data = avl_node->right->data;
        avl_node->right = (void *)0;
        x_free(avl_node->right);
    } else if (avl_node->right == (void *)0) {
        avl_node->data = avl_node->left->data;
        avl_node->left = (void *)0;
        x_free(avl_node->left);
    } else {
        pre_node = xizi_avl_find_pre_node(avl_node);
        if (pre_node != (void *)0) {
            avl_node->data = pre_node->data;
            avl_node->left = xizi_avl_delete(avl_node->left, pre_node->data);
        }
    }

    return avl_node;
}
