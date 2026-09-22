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

int xizi_double_link_empty(const DoubleLinklistType *linklist)
/*@ general
    With nodes
    Require
      xizi_dll(linklist, nodes)
    Ensure
      ((nodes == nil && __return == 1) ||
       (nodes != nil && __return == 0)) &&
      xizi_dll(linklist, nodes)
*/
/*@ nil_case
    Require
      xizi_dll(linklist, nil)
    Ensure
      __return == 1 &&
      xizi_dll(linklist, nil)
*/
{
    return linklist->node_next == linklist;
}

int xizi_double_link_init_then_empty(DoubleLinklistType *linklist_head)
/*@ Require
      xizi_dll_node(linklist_head)
    Ensure
      __return == 1 &&
      xizi_dll(linklist_head, nil)
*/
{
    xizi_double_link_init(linklist_head);
    return xizi_double_link_empty(linklist_head) /*@ where (nil_case) */;
}
