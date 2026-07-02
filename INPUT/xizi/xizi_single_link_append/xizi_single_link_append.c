#include "xizi_single_link_def.h"

void xizi_single_link_append(SysSingleLinklistType *linklist, SysSingleLinklistType *linklist_node)

{
    struct SingleLinklistNode *node;

    node = linklist;

    
    while (node->node_next) {
        node = node->node_next;
    }

    node->node_next = linklist_node;
    linklist_node->node_next = (void *)0;
}
