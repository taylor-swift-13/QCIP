#include "verification_stdlib.h"
#include "verification_list.h"
#include "xizi_double_link_def.h"

struct SysDoubleLinklistNode *xizi_double_link_next_rec_middle(
    const DoubleLinklistType *linklist,
    const struct SysDoubleLinklistNode *linklist_node)
/*@ With prev next last l0
    Require
      linklist != 0 &&
      linklist_node != 0 &&
      linklist_node != linklist &&
      next != linklist &&
      xizi_dllseg(linklist_node, prev, linklist, last,
        cons(linklist_node, cons(next, l0)))
    Ensure
      __return == next &&
      xizi_dllseg(linklist_node@pre, prev, linklist@pre, last,
        cons(linklist_node@pre, cons(next, l0)))
*/
{
    return linklist_node->node_next == linklist ?
        (void *)0 : linklist_node->node_next;
}
