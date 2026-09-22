#include "xizi_double_link_def.h"


/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next.source Require Import xizi_double_link_next_lib */
/*@ Import Coq Import DLL */
/*@ Extern Coq (DL_Node :: * => *) */
/*@ Extern Coq
      (store_dll : {A} -> (Z -> A -> Assertion) -> Z -> list (DL_Node A) -> Assertion)
      (ptrs : {A} -> list (DL_Node A) -> list Z)
      (addr_dllseg : Z -> Z -> Z -> Z -> list Z -> Assertion)
      (payloads : {A} -> (Z -> A -> Assertion) -> list (DL_Node A) -> Assertion)
*/
/*@ Extern Coq (In : Z -> list Z -> Prop)
               (xizi_double_link_first_value : list Z -> Z)
               (xizi_double_link_next_value : list Z -> Z -> Z)
               (xizi_double_link_next_anchor : Z -> list Z -> Z -> Prop)
               (xizi_double_link_next_dispatch_value : Z -> list Z -> Z -> Z) */

struct SysDoubleLinklistNode *DoubleLinkListGetNext(
    const DoubleLinklistType *linklist,
    const struct SysDoubleLinklistNode *linklist_node)
/*@ dispatch_case
    With {A} (storeA : Z -> A -> Assertion)
         (nodes : list (DL_Node A))
    Require xizi_double_link_next_anchor(linklist, ptrs(nodes), linklist_node) &&
            store_dll(storeA, linklist, nodes)
    Ensure __return ==
             xizi_double_link_next_dispatch_value(linklist,
                                                  ptrs(nodes),
                                                  linklist_node) &&
           store_dll(storeA, linklist, nodes)
*/;

struct SysDoubleLinklistNode *DoubleLinkListGetNext(
    const DoubleLinklistType *linklist,
    const struct SysDoubleLinklistNode *linklist_node)
/*@ member_case <= dispatch_case
    With {A} (storeA : Z -> A -> Assertion)
         (nodes : list (DL_Node A))
    Require In(linklist_node, ptrs(nodes)) &&
            store_dll(storeA, linklist, nodes)
    Ensure __return == xizi_double_link_next_value(ptrs(nodes), linklist_node) &&
           store_dll(storeA, linklist, nodes)
*/;

struct SysDoubleLinklistNode *DoubleLinkListGetNext(
    const DoubleLinklistType *linklist,
    const struct SysDoubleLinklistNode *linklist_node)
/*@ sentinel_case <= dispatch_case
    With {A} (storeA : Z -> A -> Assertion)
         (nodes : list (DL_Node A))
    Require linklist_node == linklist &&
            store_dll(storeA, linklist, nodes)
    Ensure __return == xizi_double_link_first_value(ptrs(nodes)) &&
           store_dll(storeA, linklist, nodes)
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
          payloads(storeA, nodes) *
          ((ptrs(nodes) == app(nodes_before, cons(linklist_node, nodes_after)) &&
            ! In(linklist_node, nodes_before) &&
            xizi_double_link_next_dispatch_value(linklist,
                                                 ptrs(nodes),
                                                 linklist_node) ==
              xizi_double_link_first_value(nodes_after) &&
            linklist_node != linklist &&
            store(&(linklist -> node_next), first) *
            store(&(linklist -> node_prev), last) *
            addr_dllseg(first,
                        linklist,
                        linklist_node,
                        node_prev,
                        nodes_before) *
            store(&(linklist_node -> node_next), node_next) *
            store(&(linklist_node -> node_prev), node_prev) *
            addr_dllseg(node_next,
                        linklist_node,
                        linklist,
                        last,
                        nodes_after)) ||
           (linklist_node == linklist &&
            xizi_double_link_next_dispatch_value(linklist,
                                                 ptrs(nodes),
                                                 linklist_node) ==
              xizi_double_link_first_value(ptrs(nodes)) &&
            store(&(linklist -> node_next), first) *
            store(&(linklist -> node_prev), last) *
            addr_dllseg(first, linklist, linklist, last, ptrs(nodes))))
    */
    return linklist_node->node_next == linklist ? NONE : linklist_node->node_next;
}
