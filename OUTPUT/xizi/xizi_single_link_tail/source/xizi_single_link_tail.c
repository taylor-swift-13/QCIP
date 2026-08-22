#include "verification_stdlib.h"
#include "verification_list.h"
#include "../../xizi_single_link_common/source/xizi_single_link_def.h"

SysSingleLinklistType *SingleLinkListGetTailNode(SysSingleLinklistType *linklist)
/*@ With l
    Require
      xizi_sll_head(linklist, l)
    Ensure
      __return ==
        xizi_sll_tail_value(l, linklist) &&
      xizi_sll_head(linklist, l)
*/
{
    SysSingleLinklistType *current = linklist->node_next;

    if (current == (void *)0) {
        return linklist;
    }

    /*@ Inv Assert
          exists first l1 l2 next,
            l == app(l1, cons(current, l2)) &&
            linklist == linklist@pre &&
            current != 0 &&
            linklist != 0 &&
            (linklist -> node_next == first) *
            xizi_sllseg(first, current, l1) *
            (current -> node_next == next) *
            xizi_sll(next, l2)
    */
    while (current->node_next) {
        current = current->node_next;
    }

    return current;
}
