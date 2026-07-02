#include "xizi_double_link_def.h"

void xizi_double_link_insert_after(DoubleLinklistType *linklist,
                                   DoubleLinklistType *linklist_node)
{
    linklist->node_next->node_prev = linklist_node;
    linklist_node->node_next = linklist->node_next;

    linklist->node_next = linklist_node;
    linklist_node->node_prev = linklist;
}
