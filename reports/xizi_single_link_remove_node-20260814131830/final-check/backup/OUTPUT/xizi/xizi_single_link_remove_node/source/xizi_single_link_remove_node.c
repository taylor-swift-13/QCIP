#include "verification_stdlib.h"
#include "verification_list.h"
#include "../../xizi_single_link_common/source/xizi_single_link_def.h"

SysSingleLinklistType *xizi_single_link_remove_node(SysSingleLinklistType *linklist, SysSingleLinklistType *linklist_node)
/*@ With l l1 l2
    Require
      l == app(l1, cons(linklist_node, l2)) &&
      xizi_sll_head(linklist, l)
    Ensure
      __return == linklist &&
      xizi_sll_head(linklist, app(l1, l2)) *
      (linklist_node -> node_next ==
        xizi_sll_first_value(l2))
*/
{
    /*@
      l == app(l1, cons(linklist_node, l2)) &&
      xizi_sll_head(linklist, l)
      which implies
      linklist != 0 &&
      linklist_node != 0 &&
      linklist != linklist_node &&
      xizi_sll_to_target(
        linklist,
        linklist_node,
        cons(linklist, l1)) *
      (linklist_node -> node_next ==
        xizi_sll_first_value(l2)) *
      xizi_sll(xizi_sll_first_value(l2), l2)
    */
    struct SingleLinklistNode *node = linklist;

    /*@ Inv
          exists l1a l1b next,
            cons(linklist, l1) ==
              app(l1a, cons(node, l1b)) &&
            node != 0 &&
            node -> node_next == next &&
            xizi_sllseg(linklist, node, l1a) *
            xizi_sll_to_target(next, linklist_node, l1b) *
            (linklist_node -> node_next ==
              xizi_sll_first_value(l2)) *
            xizi_sll(xizi_sll_first_value(l2), l2)
    */
    while (node->node_next && node->node_next != linklist_node) {
        node = node->node_next;
    }
    if (node->node_next != (SysSingleLinklistType *)0) {
        node->node_next = node->node_next->node_next;
    }

    return linklist;
}
