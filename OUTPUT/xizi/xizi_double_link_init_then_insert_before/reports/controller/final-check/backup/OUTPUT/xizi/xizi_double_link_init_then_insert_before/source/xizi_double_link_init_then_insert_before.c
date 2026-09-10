#include "xizi_double_link_def.h"

/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_double_link_init_then_insert_before.source Require Import xizi_double_link_init_then_insert_before_lib */
/*@ Extern Coq (In : Z -> list Z -> Prop)
               (xizi_double_link_insert_before_anchor : Z -> list Z -> Z -> Prop)
               (xizi_double_link_insert_before_nodes : list Z -> Z -> Z -> list Z)
 */

void InitDoubleLinkList(DoubleLinklistType *linklist_head)
/*@ Require
      xizi_dll_node(linklist_head)
    Ensure
      xizi_dll(linklist_head, nil)
*/
{
    linklist_head->node_next = linklist_head;
    linklist_head->node_prev = linklist_head;
}

void DoubleLinkListInsertNodeBefore(DoubleLinklistType *linklist,
                                    DoubleLinklistType *linklist_node)
/*@ dispatch_case
    With (head: Z) (nodes: list Z)
    Require xizi_double_link_insert_before_anchor(head, nodes, linklist) &&
            xizi_dll(head, nodes) *
            xizi_dll_node(linklist_node)
    Ensure xizi_dll(head,
                    xizi_double_link_insert_before_nodes(nodes,
                                                         linklist,
                                                         linklist_node))
*/;

void DoubleLinkListInsertNodeBefore(DoubleLinklistType *linklist,
                                    DoubleLinklistType *linklist_node)
/*@ member_case <= dispatch_case
    With (head: Z) (nodes: list Z)
    Require In(linklist, nodes) &&
            xizi_dll(head, nodes) *
            xizi_dll_node(linklist_node)
    Ensure xizi_dll(head,
                    xizi_double_link_insert_before_nodes(nodes,
                                                         linklist,
                                                         linklist_node))
*/;

void DoubleLinkListInsertNodeBefore(DoubleLinklistType *linklist,
                                    DoubleLinklistType *linklist_node)
/*@ sentinel_case <= dispatch_case
    With (nodes: list Z)
    Require xizi_dll(linklist, nodes) *
            xizi_dll_node(linklist_node)
    Ensure xizi_dll(linklist,
                    app(nodes, cons(linklist_node, nil)))
*/;

void xizi_double_link_init_then_insert_before(DoubleLinklistType *linklist_head,
                                              DoubleLinklistType *linklist_node)
/*@ Require
      xizi_dll_node(linklist_head) *
      xizi_dll_node(linklist_node)
    Ensure
      xizi_dll(linklist_head, cons(linklist_node, nil))
*/
{
    InitDoubleLinkList(linklist_head);
    /*@ Assert
          exists nodes,
            nodes == nil &&
            linklist_head == linklist_head@pre &&
            linklist_node == linklist_node@pre &&
            xizi_dll(linklist_head, nodes) *
            xizi_dll_node(linklist_node)
    */
    DoubleLinkListInsertNodeBefore(linklist_head, linklist_node)
      /*@ where (sentinel_case) */;
}
