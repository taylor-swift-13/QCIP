#include "xizi_double_link_def.h"

void xizi_double_link_insert_before(DoubleLinklistType *linklist,
                                    DoubleLinklistType *linklist_node)
/*@ With (head: Z) (prefix suffix: list Z)
    Require head != 0 &&
            linklist != 0 &&
            linklist_node != 0 &&
            xizi_dll(head, app(prefix, cons(linklist, suffix))) *
            undef_data_at(&(linklist_node -> node_next), DoubleLinklistType *) *
            undef_data_at(&(linklist_node -> node_prev), DoubleLinklistType *)
    Ensure xizi_dll(head,
                    app(prefix,
                        cons(linklist_node@pre,
                             cons(linklist@pre, suffix))))
*/
{
    /*@ Assert
        exists first last prev before_prev next,
          head != 0 &&
          linklist == linklist@pre &&
          linklist_node == linklist_node@pre &&
          linklist != 0 &&
          linklist != head &&
          linklist_node != 0 &&
          linklist_node != head &&
          linklist_node != linklist &&
          store(&(((DoubleLinklistType *)prev) -> node_next), linklist) *
          store(&(((DoubleLinklistType *)prev) -> node_prev), before_prev) *
          store(&(linklist -> node_next), next) *
          store(&(linklist -> node_prev), prev) *
          xizi_dllseg(next, linklist, head, last, suffix) *
          undef_data_at(&(linklist_node -> node_next), DoubleLinklistType *) *
          undef_data_at(&(linklist_node -> node_prev), DoubleLinklistType *) *
          ((prefix == nil &&
            prev == head &&
            prev != 0 &&
            before_prev == last &&
            first == linklist && emp) ||
           (exists prefix0,
              prefix == app(prefix0, cons(prev, nil)) &&
              prev != 0 &&
              prev != head &&
              prev != linklist_node &&
              store(&(((DoubleLinklistType *)head) -> node_next), first) *
              store(&(((DoubleLinklistType *)head) -> node_prev), last) *
              xizi_dllseg(first, head, prev, before_prev, prefix0)))
    */
    linklist->node_prev->node_next = linklist_node;
    linklist_node->node_prev = linklist->node_prev;

    linklist->node_prev = linklist_node;
    linklist_node->node_next = linklist;
}
