#include "xizi_double_link_def.h"

/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_double_link_insert_after.source Require Import xizi_double_link_insert_after_lib */
/*@ Import Coq Import DLL */
/*@ Extern Coq (DL_Node :: * => *) */
/*@ Extern Coq (occupy_dll_node : Z -> Assertion)
    (In : Z -> list Z -> Prop)
    (Build_DL_Node : {A} -> A -> Z -> DL_Node A)
    (store_dll : {A} -> (Z -> A -> Assertion) -> Z -> list (DL_Node A) -> Assertion)
    (dllseg : {A} -> (Z -> A -> Assertion) -> Z -> Z -> Z -> Z -> list (DL_Node A) -> Assertion)
    (xizi_insert_after_ptrs : {A} -> list (DL_Node A) -> list Z)
    (xizi_double_link_insert_after_anchor : Z -> list Z -> Z -> Prop)
    (xizi_insert_after_payload : {A} -> list (DL_Node A) -> Z -> DL_Node A -> list (DL_Node A) -> Prop)
    (xizi_insert_after_dispatch_payload : {A} -> Z -> list (DL_Node A) -> Z -> DL_Node A -> list (DL_Node A) -> Prop)
 */

void DoubleLinkListInsertNodeAfter(DoubleLinklistType *linklist,
                                   DoubleLinklistType *linklist_node)
/*@ dispatch_case
    With {A} (storeA : Z -> A -> Assertion) (data : A) (head: Z) (nodes: list (DL_Node A))
    Require xizi_double_link_insert_after_anchor(head, xizi_insert_after_ptrs(nodes), linklist) &&
            store_dll(storeA, head, nodes) *
            occupy_dll_node(linklist_node) * storeA(linklist_node, data)
    Ensure exists result,
      xizi_insert_after_dispatch_payload(head, nodes, linklist,
        Build_DL_Node(data, linklist_node), result) &&
      store_dll(storeA, head, result)
*/;

void DoubleLinkListInsertNodeAfter(DoubleLinklistType *linklist,
                                   DoubleLinklistType *linklist_node)
/*@ member_case <= dispatch_case
    With {A} (storeA : Z -> A -> Assertion) (data : A) (head: Z) (nodes: list (DL_Node A))
    Require In(linklist, xizi_insert_after_ptrs(nodes)) &&
            store_dll(storeA, head, nodes) *
            occupy_dll_node(linklist_node) * storeA(linklist_node, data)
    Ensure exists result,
      xizi_insert_after_payload(nodes, linklist,
        Build_DL_Node(data, linklist_node), result) &&
      store_dll(storeA, head, result)
*/;

void DoubleLinkListInsertNodeAfter(DoubleLinklistType *linklist,
                                   DoubleLinklistType *linklist_node)
/*@ sentinel_case <= dispatch_case
    With {A} (storeA : Z -> A -> Assertion) (data : A) (nodes: list (DL_Node A))
    Require store_dll(storeA, linklist, nodes) *
            occupy_dll_node(linklist_node) * storeA(linklist_node, data)
    Ensure store_dll(storeA, linklist,
                    cons(Build_DL_Node(data, linklist_node), nodes))
*/;

void DoubleLinkListInsertNodeAfter(DoubleLinklistType *linklist,
                                   DoubleLinklistType *linklist_node)
/*@ dispatch_case
*/
{
    /*@ Assert
        exists first last old_next old_prev next_next detached_next detached_prev,
          linklist == linklist@pre &&
          linklist_node == linklist_node@pre &&
          store(&(linklist_node -> node_next), detached_next) *
          store(&(linklist_node -> node_prev), detached_prev) * storeA(linklist_node, data) *
          ((exists nodes_before nodes_after (anchor_data : A),
              nodes == app(nodes_before, cons(Build_DL_Node(anchor_data, linklist), nodes_after)) &&
              ! In(linklist, xizi_insert_after_ptrs(nodes_before)) &&
              xizi_insert_after_dispatch_payload(
                head, nodes, linklist, Build_DL_Node(data, linklist_node),
                app(nodes_before,
                    cons(Build_DL_Node(anchor_data, linklist), cons(Build_DL_Node(data, linklist_node), nodes_after)))) &&
              storeA(linklist, anchor_data) *
              ((nodes_after == nil &&
                store(&(head -> node_next), first) *
                dllseg(storeA, first, head, linklist, old_prev, nodes_before) *
                store(&(linklist -> node_next), head) *
                store(&(linklist -> node_prev), old_prev) *
                store(&(head -> node_prev), linklist)) ||
               (exists rest (next_data : A),
                  nodes_after == cons(Build_DL_Node(next_data, old_next), rest) &&
                  storeA(old_next, next_data) *
                  store(&(head -> node_next), first) *
                  store(&(head -> node_prev), last) *
                  dllseg(storeA, first, head, linklist, old_prev, nodes_before) *
                  store(&(linklist -> node_next), old_next) *
                  store(&(linklist -> node_prev), old_prev) *
                  store(&(old_next -> node_next), next_next) *
                  store(&(old_next -> node_prev), linklist) *
                  dllseg(storeA, next_next, old_next, head, last, rest)))) ||
           (linklist == head &&
            xizi_insert_after_dispatch_payload(
              head, nodes, linklist, Build_DL_Node(data, linklist_node),
              cons(Build_DL_Node(data, linklist_node), nodes)) &&
            ((nodes == nil &&
              first == head &&
              last == head &&
              old_next == head &&
              store(&(head -> node_next), head) *
              store(&(head -> node_prev), head)) ||
             (exists rest (next_data : A),
                nodes == cons(Build_DL_Node(next_data, old_next), rest) &&
                  storeA(old_next, next_data) *
                store(&(head -> node_next), old_next) *
                store(&(head -> node_prev), last) *
                store(&(old_next -> node_next), next_next) *
                store(&(old_next -> node_prev), head) *
                dllseg(storeA, next_next, old_next, head, last, rest)))))
    */
    linklist->node_next->node_prev = linklist_node;
    linklist_node->node_next = linklist->node_next;

    linklist->node_next = linklist_node;
    linklist_node->node_prev = linklist;
}
