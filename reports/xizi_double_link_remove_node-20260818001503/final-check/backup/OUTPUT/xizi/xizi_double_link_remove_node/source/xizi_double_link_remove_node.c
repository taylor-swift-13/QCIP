#include "xizi_double_link_def.h"

/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_double_link_remove_node.source Require Import xizi_double_link_remove_node_lib */
/*@ Extern Coq (xizi_dllseg_shift : Z -> Z -> list Z -> Assertion)
               (xizi_dllseg_shift_rev : Z -> Z -> list Z -> Assertion)
               (xizi_dll_remove_first : Z -> list Z -> list Z)
               (In : {A} -> A -> list A -> Prop)
 */

void xizi_double_link_remove_node(DoubleLinklistType *linklist_node)
/*@ remove_member_spec <= strong_spec
    With (head : Z) (nodes : list Z)
    Require In(linklist_node, nodes) &&
            xizi_dll(head, nodes)
    Ensure xizi_dll(
             head,
             xizi_dll_remove_first(linklist_node, nodes)) *
           xizi_dll(linklist_node@pre, nil)
*/;

void xizi_double_link_remove_node(DoubleLinklistType *linklist_node)
/*@ strong_spec
    With (head: Z) (nodes prefix suffix: list Z)
    Require nodes == app(prefix, cons(linklist_node, suffix)) &&
            xizi_dll(head, nodes)
    Ensure xizi_dll(head, app(prefix, suffix)) *
           xizi_dll(linklist_node@pre, nil)
*/
{
    /*@ Assert
        exists node_next node_prev,
          linklist_node == linklist_node@pre &&
          linklist_node != 0 &&
          xizi_dllseg_shift(head, node_prev, prefix) *
          store(&(node_prev -> node_next), linklist_node) *
          store(&(linklist_node -> node_next), node_next) *
          store(&(linklist_node -> node_prev), node_prev) *
          store(&(node_next -> node_prev), linklist_node) *
          xizi_dllseg_shift_rev(node_next, head, suffix)
    */
    linklist_node->node_next->node_prev = linklist_node->node_prev;
    linklist_node->node_prev->node_next = linklist_node->node_next;

    linklist_node->node_next = linklist_node;
    linklist_node->node_prev = linklist_node;
}
