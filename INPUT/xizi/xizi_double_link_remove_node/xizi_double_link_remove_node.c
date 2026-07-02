#include "xizi_double_link_def.h"

void xizi_double_link_remove_node(DoubleLinklistType *linklist_node)
{
    linklist_node->node_next->node_prev = linklist_node->node_prev;
    linklist_node->node_prev->node_next = linklist_node->node_next;

    linklist_node->node_next = linklist_node;
    linklist_node->node_prev = linklist_node;
}
