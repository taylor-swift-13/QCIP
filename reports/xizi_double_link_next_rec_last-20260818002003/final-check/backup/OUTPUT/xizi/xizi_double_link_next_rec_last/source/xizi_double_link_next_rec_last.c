#include "xizi_double_link_def.h"

/*@ Extern Coq
      (In : Z -> list Z -> Prop)
      (xizi_double_link_first_value : list Z -> Z)
      (xizi_double_link_next_value : list Z -> Z -> Z)
 */
/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next_rec_last.source
      Require Import xizi_double_link_next_rec_last_lib */




struct SysDoubleLinklistNode *xizi_double_link_next_rec_last(
    const DoubleLinklistType *linklist,
    const struct SysDoubleLinklistNode *linklist_node)
/*@ With (nodes: list Z)
    Require In(linklist_node, nodes) &&
            xizi_dll(linklist, nodes)
    Ensure __return == xizi_double_link_next_value(nodes, linklist_node) &&
           xizi_dll(linklist@pre, nodes)
*/
{
    /*@ Assert
        exists nodes_before nodes_after first last node_next node_prev,
          nodes == app(nodes_before, cons(linklist_node, nodes_after)) &&
          ! In(linklist_node, nodes_before) &&
          xizi_double_link_next_value(nodes, linklist_node) ==
            xizi_double_link_first_value(nodes_after) &&
          linklist == linklist@pre &&
          linklist_node == linklist_node@pre &&
          linklist != 0 &&
          linklist_node != 0 &&
          store(&(linklist -> node_next), first) *
          store(&(linklist -> node_prev), last) *
          xizi_dllseg(first, linklist,
                      linklist_node, node_prev, nodes_before) *
          store(&(linklist_node -> node_next), node_next) *
          store(&(linklist_node -> node_prev), node_prev) *
          xizi_dllseg(node_next, linklist_node,
                      linklist, last, nodes_after)
    */
    return linklist_node->node_next == linklist ?
        (void *)0 : linklist_node->node_next;
}
