#include "verification_stdlib.h"
#include "verification_list.h"
#include "../../xizi_single_link_common/source/xizi_single_link_def.h"

void AppendSingleLinkList(SysSingleLinklistType *linklist, SysSingleLinklistType *linklist_node)
/*@ With l
    Require
      xizi_sll_head(linklist, l) *
      xizi_sll_node(linklist_node)
    Ensure
      xizi_sll_head(linklist, app(l, cons(linklist_node, nil)))
*/
{
    struct SingleLinklistNode *node;

    node = linklist;

    /*@ Inv
          exists l1a l1b next,
            linklist == linklist@pre &&
            linklist_node == linklist_node@pre &&
            cons(linklist, l) == app(l1a, cons(node, l1b)) &&
            node != 0 &&
            linklist_node != 0 &&
            node -> node_next == next &&
            xizi_sllseg(linklist, node, l1a) *
            xizi_sll(next, l1b) &&
            has_permission(&(linklist_node -> node_next))
    */
    while (node->node_next) {
        node = node->node_next;
    }

    node->node_next = linklist_node;
    linklist_node->node_next = (void *)0;
}
