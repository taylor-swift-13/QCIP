#include "xizi_double_link_def.h"

/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_double_link_insert_after.source Require Import xizi_double_link_insert_after_lib */
/*@ Extern Coq (XiziStoreADLL::DL_Node :: * => *) */
/*@ Extern Coq (In : Z -> list Z -> Prop)
    (XiziStoreADLL::Build_DL_Node : {A} -> A -> Z -> XiziStoreADLL::DL_Node A)
    (xizi_store_dll : {A} -> (Z -> A -> Assertion) -> Z -> list (XiziStoreADLL::DL_Node A) -> Assertion)
    (XiziStoreADLL::dllseg : {A} -> (Z -> A -> Assertion) -> Z -> Z -> Z -> Z -> list (XiziStoreADLL::DL_Node A) -> Assertion)
    (xizi_insert_after_ptrs : {A} -> list (XiziStoreADLL::DL_Node A) -> list Z)
    (xizi_double_link_insert_after_anchor : Z -> list Z -> Z -> Prop)
    (xizi_insert_after_payload : {A} -> list (XiziStoreADLL::DL_Node A) -> Z -> XiziStoreADLL::DL_Node A -> list (XiziStoreADLL::DL_Node A) -> Prop)
    (xizi_insert_after_dispatch_payload : {A} -> Z -> list (XiziStoreADLL::DL_Node A) -> Z -> XiziStoreADLL::DL_Node A -> list (XiziStoreADLL::DL_Node A) -> Prop)
 */

void DoubleLinkListInsertNodeAfter(DoubleLinklistType *linklist,
                                   DoubleLinklistType *linklist_node)
/*@ dispatch_case
    With {A} (storeA : Z -> A -> Assertion) (data : A) (head: Z) (nodes: list (XiziStoreADLL::DL_Node A))
    Require xizi_double_link_insert_after_anchor(head, xizi_insert_after_ptrs(nodes), linklist) &&
            xizi_store_dll(storeA, head, nodes) *
            xizi_dll_node(linklist_node) * storeA(linklist_node, data)
    Ensure exists result,
      xizi_insert_after_dispatch_payload(head, nodes, linklist,
        XiziStoreADLL::Build_DL_Node(data, linklist_node), result) &&
      xizi_store_dll(storeA, head, result)
*/;

void DoubleLinkListInsertNodeAfter(DoubleLinklistType *linklist,
                                   DoubleLinklistType *linklist_node)
/*@ member_case <= dispatch_case
    With {A} (storeA : Z -> A -> Assertion) (data : A) (head: Z) (nodes: list (XiziStoreADLL::DL_Node A))
    Require In(linklist, xizi_insert_after_ptrs(nodes)) &&
            xizi_store_dll(storeA, head, nodes) *
            xizi_dll_node(linklist_node) * storeA(linklist_node, data)
    Ensure exists result,
      xizi_insert_after_payload(nodes, linklist,
        XiziStoreADLL::Build_DL_Node(data, linklist_node), result) &&
      xizi_store_dll(storeA, head, result)
*/;

void DoubleLinkListInsertNodeAfter(DoubleLinklistType *linklist,
                                   DoubleLinklistType *linklist_node)
/*@ sentinel_case <= dispatch_case
    With {A} (storeA : Z -> A -> Assertion) (data : A) (nodes: list (XiziStoreADLL::DL_Node A))
    Require xizi_store_dll(storeA, linklist, nodes) *
            xizi_dll_node(linklist_node) * storeA(linklist_node, data)
    Ensure xizi_store_dll(storeA, linklist,
                    cons(XiziStoreADLL::Build_DL_Node(data, linklist_node), nodes))
*/;

void DoubleLinkListInsertNodeAfter(DoubleLinklistType *linklist,
                                   DoubleLinklistType *linklist_node)
/*@ dispatch_case
*/
{
    /*@ Assert
        exists first last old_next old_prev next_next,
          linklist == linklist@pre &&
          linklist_node == linklist_node@pre &&
          head != 0 &&
          linklist_node != 0 &&
          xizi_dll_node(linklist_node) * storeA(linklist_node, data) *
          ((exists nodes_before nodes_after (anchor_data : A),
              nodes == app(nodes_before, cons(XiziStoreADLL::Build_DL_Node(anchor_data, linklist), nodes_after)) &&
              ! In(linklist, xizi_insert_after_ptrs(nodes_before)) &&
              xizi_insert_after_dispatch_payload(
                head, nodes, linklist, XiziStoreADLL::Build_DL_Node(data, linklist_node),
                app(nodes_before,
                    cons(XiziStoreADLL::Build_DL_Node(anchor_data, linklist), cons(XiziStoreADLL::Build_DL_Node(data, linklist_node), nodes_after)))) &&
              linklist != 0 &&
              storeA(linklist, anchor_data) *
              ((nodes_after == nil &&
                store(&(head -> node_next), first) *
                XiziStoreADLL::dllseg(storeA, first, head, linklist, old_prev, nodes_before) *
                store(&(linklist -> node_next), head) *
                store(&(linklist -> node_prev), old_prev) *
                store(&(head -> node_prev), linklist)) ||
               (exists rest (next_data : A),
                  nodes_after == cons(XiziStoreADLL::Build_DL_Node(next_data, old_next), rest) &&
                  old_next != 0 &&
                  storeA(old_next, next_data) *
                  store(&(head -> node_next), first) *
                  store(&(head -> node_prev), last) *
                  XiziStoreADLL::dllseg(storeA, first, head, linklist, old_prev, nodes_before) *
                  store(&(linklist -> node_next), old_next) *
                  store(&(linklist -> node_prev), old_prev) *
                  store(&(old_next -> node_next), next_next) *
                  store(&(old_next -> node_prev), linklist) *
                  XiziStoreADLL::dllseg(storeA, next_next, old_next, head, last, rest)))) ||
           (linklist == head &&
            xizi_insert_after_dispatch_payload(
              head, nodes, linklist, XiziStoreADLL::Build_DL_Node(data, linklist_node),
              cons(XiziStoreADLL::Build_DL_Node(data, linklist_node), nodes)) &&
            ((nodes == nil &&
              first == head &&
              last == head &&
              old_next == head &&
              store(&(head -> node_next), head) *
              store(&(head -> node_prev), head)) ||
             (exists rest (next_data : A),
                nodes == cons(XiziStoreADLL::Build_DL_Node(next_data, old_next), rest) &&
                old_next != 0 &&
                  storeA(old_next, next_data) *
                store(&(head -> node_next), old_next) *
                store(&(head -> node_prev), last) *
                store(&(old_next -> node_next), next_next) *
                store(&(old_next -> node_prev), head) *
                XiziStoreADLL::dllseg(storeA, next_next, old_next, head, last, rest)))))
    */
    linklist->node_next->node_prev = linklist_node;
    linklist_node->node_next = linklist->node_next;

    linklist->node_next = linklist_node;
    linklist_node->node_prev = linklist;
}
