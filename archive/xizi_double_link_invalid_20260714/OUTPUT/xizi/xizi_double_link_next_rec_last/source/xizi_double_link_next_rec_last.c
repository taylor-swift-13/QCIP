#include "verification_stdlib.h"
#include "verification_list.h"
#include "xizi_double_link_def.h"

struct SysDoubleLinklistNode *xizi_double_link_next_rec_last(
    const DoubleLinklistType *linklist,
    const struct SysDoubleLinklistNode *linklist_node)
/*@ With prev
    Require
      linklist != 0 &&
      linklist_node != 0 &&
      linklist_node != linklist &&
      xizi_dllseg(linklist_node, prev, linklist, linklist_node,
        cons(linklist_node, nil))
    Ensure
      __return == 0 &&
      xizi_dllseg(linklist_node@pre, prev, linklist@pre, linklist_node@pre,
        cons(linklist_node@pre, nil))
*/
{
    return linklist_node->node_next == linklist ?
        (void *)0 : linklist_node->node_next;
}
