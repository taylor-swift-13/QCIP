#include "xizi_double_link_def.h"

/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next_rec_middle.source Require Import xizi_double_link_next_rec_middle_lib */
/*@ Extern Coq (In : Z -> list Z -> Prop)
               (xizi_double_link_first_value : list Z -> Z)
               (xizi_double_link_next_value : list Z -> Z -> Z)
               (xizi_double_link_next_anchor : Z -> list Z -> Z -> Prop)
               (xizi_double_link_next_dispatch_value : Z -> list Z -> Z -> Z) */

struct SysDoubleLinklistNode *DoubleLinkListGetNext(
    const DoubleLinklistType *linklist,
    const struct SysDoubleLinklistNode *linklist_node)
/*@ dispatch_case
    With (nodes: list Z)
    Require xizi_double_link_next_anchor(linklist, nodes, linklist_node) &&
            xizi_dll(linklist, nodes)
    Ensure __return ==
             xizi_double_link_next_dispatch_value(linklist,
                                                  nodes,
                                                  linklist_node) &&
           xizi_dll(linklist, nodes)
*/;

struct SysDoubleLinklistNode *DoubleLinkListGetNext(
    const DoubleLinklistType *linklist,
    const struct SysDoubleLinklistNode *linklist_node)
/*@ member_case <= dispatch_case
    With (nodes: list Z)
    Require In(linklist_node, nodes) &&
            xizi_dll(linklist, nodes)
    Ensure __return == xizi_double_link_next_value(nodes, linklist_node) &&
           xizi_dll(linklist, nodes)
*/;

struct SysDoubleLinklistNode *DoubleLinkListGetNext(
    const DoubleLinklistType *linklist,
    const struct SysDoubleLinklistNode *linklist_node)
/*@ sentinel_case <= dispatch_case
    With (nodes: list Z)
    Require linklist_node == linklist &&
            xizi_dll(linklist, nodes)
    Ensure __return == xizi_double_link_first_value(nodes) &&
           xizi_dll(linklist, nodes)
*/;

struct SysDoubleLinklistNode *DoubleLinkListGetNext(
    const DoubleLinklistType *linklist,
    const struct SysDoubleLinklistNode *linklist_node)
/*@ dispatch_case
*/
{
    /*@ Assert
        exists nodes_before nodes_after first last node_next node_prev,
          linklist == linklist@pre &&
          linklist_node == linklist_node@pre &&
          linklist != 0 &&
          first != 0 &&
          ((nodes == app(nodes_before, cons(linklist_node, nodes_after)) &&
            ! In(linklist_node, nodes_before) &&
            xizi_double_link_next_dispatch_value(linklist,
                                                 nodes,
                                                 linklist_node) ==
              xizi_double_link_first_value(nodes_after) &&
            linklist_node != 0 &&
            linklist_node != linklist &&
            node_next != 0 &&
            store(&(linklist -> node_next), first) *
            store(&(linklist -> node_prev), last) *
            xizi_dllseg(first,
                        linklist,
                        linklist_node,
                        node_prev,
                        nodes_before) *
            store(&(linklist_node -> node_next), node_next) *
            store(&(linklist_node -> node_prev), node_prev) *
            xizi_dllseg(node_next,
                        linklist_node,
                        linklist,
                        last,
                        nodes_after)) ||
           (linklist_node == linklist &&
            xizi_double_link_next_dispatch_value(linklist,
                                                 nodes,
                                                 linklist_node) ==
              xizi_double_link_first_value(nodes) &&
            store(&(linklist -> node_next), first) *
            store(&(linklist -> node_prev), last) *
            xizi_dllseg(first, linklist, linklist, last, nodes)))
    */
    return linklist_node->node_next == linklist ? NONE : linklist_node->node_next;
}
