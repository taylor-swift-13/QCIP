#include "xizi_double_link_def.h"

/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_double_link_insert_before.source Require Import xizi_double_link_insert_before_lib */
/*@ Extern Coq (In : Z -> list Z -> Prop)
               (xizi_double_link_insert_before_nodes : list Z -> Z -> Z -> list Z)
 */

void xizi_double_link_insert_before(DoubleLinklistType *linklist,
                                    DoubleLinklistType *linklist_node)
/*@ With (head: Z) (nodes: list Z)
    Require In(linklist, nodes) &&
            xizi_dll(head, nodes) *
            xizi_dll_node(linklist_node)
    Ensure xizi_dll(head,
                    xizi_double_link_insert_before_nodes(nodes,
                                                         linklist@pre,
                                                         linklist_node@pre))
*/
{
    /*@ Assert
        exists nodes_before nodes_after first last prev before_prev next,
           nodes == app(nodes_before, cons(linklist, nodes_after)) &&
           ! In(linklist, nodes_before) &&
           xizi_double_link_insert_before_nodes(nodes,
                                                linklist,
                                                linklist_node) ==
             app(nodes_before,
                 cons(linklist_node, cons(linklist, nodes_after))) &&
           linklist == linklist@pre &&
           linklist_node == linklist_node@pre &&
           head != 0 &&
           linklist != 0 &&
           linklist_node != 0 &&
           store(&(((DoubleLinklistType *)prev) -> node_next), linklist) *
           store(&(((DoubleLinklistType *)prev) -> node_prev), before_prev) *
           store(&(linklist -> node_next), next) *
           store(&(linklist -> node_prev), prev) *
           xizi_dllseg(next, linklist, head, last, nodes_after) *
           xizi_dll_node(linklist_node) *
           ((nodes_before == nil &&
             prev == head &&
             before_prev == last &&
             first == linklist && emp) ||
            (exists prefix0,
               nodes_before == app(prefix0, cons(prev, nil)) &&
               prev != 0 &&
               prev != head &&
               store(&(head -> node_next), first) *
               store(&(head -> node_prev), last) *
               xizi_dllseg(first, head, prev, before_prev, prefix0)))
    */
    linklist->node_prev->node_next = linklist_node;
    linklist_node->node_prev = linklist->node_prev;

    linklist->node_prev = linklist_node;
    linklist_node->node_next = linklist;
}
