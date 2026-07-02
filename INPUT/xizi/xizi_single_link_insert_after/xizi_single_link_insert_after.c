#include "xizi_single_link_def.h"

void xizi_single_link_insert_after(SysSingleLinklistType *linklist, SysSingleLinklistType *linklist_node)

{
    linklist_node->node_next = linklist->node_next;
    linklist->node_next = linklist_node;
}
