#include "verification_stdlib.h"
#include "verification_list.h"
#include "xizi_double_link_def.h"

struct SysDoubleLinklistNode *xizi_double_link_head_rec(
    const DoubleLinklistType *linklist)
/*@ With first l0
    Require
      linklist != 0 &&
      xizi_dll(linklist, cons(first, l0))
    Ensure
      __return == first &&
      xizi_dll(linklist, cons(first, l0))
*/
{
    return linklist->node_next == linklist ? (void *)0 : linklist->node_next;
}
