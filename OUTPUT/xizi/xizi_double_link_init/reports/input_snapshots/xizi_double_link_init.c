#include "xizi_double_link_def.h"

void xizi_double_link_init(DoubleLinklistType *linklist_head)
/*@ Require
      xizi_dll_node(linklist_head)
    Ensure
      xizi_dll(linklist_head, nil)
*/
{
    linklist_head->node_next = linklist_head;
    linklist_head->node_prev = linklist_head;
}
