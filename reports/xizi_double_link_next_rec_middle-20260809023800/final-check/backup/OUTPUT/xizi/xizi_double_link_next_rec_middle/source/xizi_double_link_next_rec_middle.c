#include "xizi_double_link_def.h"

/*@ Extern Coq (xizi_double_link_next_value : list Z -> Z) */
/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next_rec_middle.source Require Import xizi_double_link_next_rec_middle_lib */




struct SysDoubleLinklistNode *xizi_double_link_next_rec_middle(
    const DoubleLinklistType *linklist,
    const struct SysDoubleLinklistNode *linklist_node)
/*@ With (head node: Z) (nodes_before nodes_after: list Z)
    Require linklist == head &&
            linklist_node == node &&
            linklist_node != 0 &&
            xizi_dll(head, app(nodes_before, cons(node, nodes_after)))
    Ensure __return == xizi_double_link_next_value(nodes_after) &&
           xizi_dll(head, app(nodes_before, cons(node, nodes_after)))
*/
{
    /*@ Assert
        exists first last node_next node_prev,
          linklist == linklist@pre &&
          linklist_node == linklist_node@pre &&
          linklist@pre == head &&
          linklist_node@pre == node &&
          head != 0 &&
          linklist_node != 0 &&
          store(&(linklist -> node_next), first) *
          store(&(linklist -> node_prev), last) *
          xizi_dllseg(first, head, node, node_prev, nodes_before) *
          store(&(linklist_node -> node_next), node_next) *
          store(&(linklist_node -> node_prev), node_prev) *
          xizi_dllseg(node_next, node, head, last, nodes_after)
    */
    return linklist_node->node_next == linklist ?
        (void *)0 : linklist_node->node_next;
}
