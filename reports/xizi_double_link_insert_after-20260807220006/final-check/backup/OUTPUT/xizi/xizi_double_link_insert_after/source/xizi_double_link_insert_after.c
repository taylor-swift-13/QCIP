#include "xizi_double_link_def.h"

/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_double_link_insert_after Require Import xizi_double_link_insert_after_lib */
/*@ Extern Coq (xizi_double_link_insert_after_nodes : list Z -> Z -> Z -> list Z -> list Z) */

void xizi_double_link_insert_after(DoubleLinklistType *linklist,
                                   DoubleLinklistType *linklist_node)
/*@ With (head: Z) (nodes_before nodes_after: list Z)
    Require linklist != 0 &&
            linklist_node != 0 &&
            xizi_dll(head,
                     app(nodes_before, cons(linklist, nodes_after))) *
            undef_data_at(&(linklist_node -> node_next), DoubleLinklistType *) *
            undef_data_at(&(linklist_node -> node_prev), DoubleLinklistType *)
    Ensure xizi_dll(head,
                    xizi_double_link_insert_after_nodes(nodes_before,
                                                        linklist@pre,
                                                        linklist_node@pre,
                                                        nodes_after))
*/
{
    /*@ Assert
        (exists first old_prev,
           nodes_after == nil &&
           linklist == linklist@pre &&
           linklist_node == linklist_node@pre &&
           linklist != 0 &&
           linklist_node != 0 &&
           store(&(head -> node_next), first) *
           xizi_dllseg(first, head, linklist, old_prev, nodes_before) *
           store(&(linklist -> node_next), head) *
           store(&(linklist -> node_prev), old_prev) *
           store(&(head -> node_prev), linklist) *
           undef_data_at(&(linklist_node -> node_next), DoubleLinklistType *) *
           undef_data_at(&(linklist_node -> node_prev), DoubleLinklistType *)) ||
        (exists first last old_next old_prev next_next rest,
           nodes_after == cons(old_next, rest) &&
           linklist == linklist@pre &&
           linklist_node == linklist_node@pre &&
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
           undef_data_at(&(linklist_node -> node_next), DoubleLinklistType *) *
           undef_data_at(&(linklist_node -> node_prev), DoubleLinklistType *))
    */
    linklist->node_next->node_prev = linklist_node;
    linklist_node->node_next = linklist->node_next;

    linklist->node_next = linklist_node;
    linklist_node->node_prev = linklist;
}
