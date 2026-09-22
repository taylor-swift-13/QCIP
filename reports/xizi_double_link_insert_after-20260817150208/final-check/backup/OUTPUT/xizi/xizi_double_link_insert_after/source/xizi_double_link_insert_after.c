#include "xizi_double_link_def.h"

/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_double_link_insert_after.source Require Import xizi_double_link_insert_after_lib */
/*@ Extern Coq (In : Z -> list Z -> Prop)
               (xizi_double_link_insert_after_nodes : list Z -> Z -> Z -> list Z)
 */

void xizi_double_link_insert_after(DoubleLinklistType *linklist,
                                   DoubleLinklistType *linklist_node)
/*@ With (head: Z) (nodes: list Z)
    Require In(linklist, nodes) &&
            xizi_dll(head, nodes) *
            xizi_dll_node(linklist_node)
    Ensure xizi_dll(head,
                    xizi_double_link_insert_after_nodes(nodes,
                                                        linklist@pre,
                                                        linklist_node@pre))
*/
{
    /*@ Assert
        (exists nodes_before nodes_after first old_prev,
           nodes == app(nodes_before, cons(linklist, nodes_after)) &&
           ! In(linklist, nodes_before) &&
           xizi_double_link_insert_after_nodes(nodes,
                                               linklist,
                                               linklist_node) ==
             app(nodes_before,
                 cons(linklist, cons(linklist_node, nodes_after))) &&
           nodes_after == nil &&
           linklist == linklist@pre &&
           linklist_node == linklist_node@pre &&
           head != 0 &&
           linklist != 0 &&
           linklist_node != 0 &&
           store(&(head -> node_next), first) *
           xizi_dllseg(first, head, linklist, old_prev, nodes_before) *
           store(&(linklist -> node_next), head) *
           store(&(linklist -> node_prev), old_prev) *
           store(&(head -> node_prev), linklist) *
           xizi_dll_node(linklist_node)) ||
        (exists nodes_before nodes_after
                first last old_next old_prev next_next rest,
           nodes == app(nodes_before, cons(linklist, nodes_after)) &&
           ! In(linklist, nodes_before) &&
           xizi_double_link_insert_after_nodes(nodes,
                                               linklist,
                                               linklist_node) ==
             app(nodes_before,
                 cons(linklist, cons(linklist_node, nodes_after))) &&
           nodes_after == cons(old_next, rest) &&
           linklist == linklist@pre &&
           linklist_node == linklist_node@pre &&
           head != 0 &&
           linklist != 0 &&
           linklist_node != 0 &&
           old_next != 0 &&
           store(&(head -> node_next), first) *
           store(&(head -> node_prev), last) *
           xizi_dllseg(first, head, linklist, old_prev, nodes_before) *
           store(&(linklist -> node_next), old_next) *
           store(&(linklist -> node_prev), old_prev) *
           store(&(old_next -> node_next), next_next) *
           store(&(old_next -> node_prev), linklist) *
           xizi_dllseg(next_next, old_next, head, last, rest) *
           xizi_dll_node(linklist_node))
    */
    linklist->node_next->node_prev = linklist_node;
    linklist_node->node_next = linklist->node_next;

    linklist->node_next = linklist_node;
    linklist_node->node_prev = linklist;
}
