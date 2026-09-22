#include "xizi_double_link_def.h"

/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_double_link_insert_before.source Require Import xizi_double_link_insert_before_lib */
/*@ Extern Coq (XiziStoreADLL::DL_Node :: * => *) */
/*@ Extern Coq (In : Z -> list Z -> Prop)
    (XiziStoreADLL::Build_DL_Node : {A} -> A -> Z -> XiziStoreADLL::DL_Node A)
    (xizi_store_dll : {A} -> (Z -> A -> Assertion) -> Z -> list (XiziStoreADLL::DL_Node A) -> Assertion)
    (xizi_dll_ptrs : {A} -> list (XiziStoreADLL::DL_Node A) -> list Z)
    (xizi_dll_payloads : {A} -> (Z -> A -> Assertion) -> list (XiziStoreADLL::DL_Node A) -> Assertion)
    (xizi_insert_before_payload : {A} -> list (XiziStoreADLL::DL_Node A) -> Z -> XiziStoreADLL::DL_Node A -> list (XiziStoreADLL::DL_Node A) -> Prop)
    (xizi_double_link_insert_before_anchor : Z -> list Z -> Z -> Prop)
    (xizi_double_link_insert_before_nodes : list Z -> Z -> Z -> list Z)
 */

void DoubleLinkListInsertNodeBefore(DoubleLinklistType *linklist,
                                    DoubleLinklistType *linklist_node)
/*@ dispatch_case
    With {A} (storeA : Z -> A -> Assertion) (data : A) (head : Z) (nodes : list (XiziStoreADLL::DL_Node A))
    Require xizi_double_link_insert_before_anchor(head, xizi_dll_ptrs(nodes), linklist) &&
            xizi_store_dll(storeA, head, nodes) *
            xizi_dll_node(linklist_node) * storeA(linklist_node, data)
    Ensure exists result,
      xizi_insert_before_payload(nodes, linklist,
        XiziStoreADLL::Build_DL_Node(data, linklist_node), result) &&
      xizi_store_dll(storeA, head, result)
*/;

void DoubleLinkListInsertNodeBefore(DoubleLinklistType *linklist,
                                    DoubleLinklistType *linklist_node)
/*@ member_case <= dispatch_case
    With {A} (storeA : Z -> A -> Assertion) (data : A) (head : Z) (nodes : list (XiziStoreADLL::DL_Node A))
    Require In(linklist, xizi_dll_ptrs(nodes)) &&
            xizi_store_dll(storeA, head, nodes) *
            xizi_dll_node(linklist_node) * storeA(linklist_node, data)
    Ensure exists result,
      xizi_insert_before_payload(nodes, linklist,
        XiziStoreADLL::Build_DL_Node(data, linklist_node), result) &&
      xizi_store_dll(storeA, head, result)
*/;

void DoubleLinkListInsertNodeBefore(DoubleLinklistType *linklist,
                                    DoubleLinklistType *linklist_node)
/*@ sentinel_case <= dispatch_case
    With {A} (storeA : Z -> A -> Assertion) (data : A) (nodes : list (XiziStoreADLL::DL_Node A))
    Require xizi_store_dll(storeA, linklist, nodes) *
            xizi_dll_node(linklist_node) * storeA(linklist_node, data)
    Ensure xizi_store_dll(storeA, linklist,
      app(nodes, cons(XiziStoreADLL::Build_DL_Node(data, linklist_node), nil)))
*/;

void DoubleLinkListInsertNodeBefore(DoubleLinklistType *linklist,
                                    DoubleLinklistType *linklist_node)
/*@ dispatch_case
*/
{
    /*@ Assert
        exists (ptrs : list Z) (result : list (XiziStoreADLL::DL_Node A)) nodes_before nodes_after first last prev before_prev next,
          linklist == linklist@pre &&
          linklist_node == linklist_node@pre &&
          ptrs == xizi_dll_ptrs(nodes) &&
          xizi_insert_before_payload(nodes, linklist,
            XiziStoreADLL::Build_DL_Node(data, linklist_node), result) &&
          xizi_dll_ptrs(result) ==
            xizi_double_link_insert_before_nodes(ptrs, linklist, linklist_node) &&
          head != 0 &&
          linklist_node != 0 &&
          xizi_dll_payloads(storeA, result) *
          xizi_dll_node(linklist_node) *
          ((ptrs == app(nodes_before, cons(linklist, nodes_after)) &&
            ! In(linklist, nodes_before) &&
            xizi_double_link_insert_before_nodes(ptrs,
                                                 linklist,
                                                 linklist_node) ==
              app(nodes_before,
                  cons(linklist_node, cons(linklist, nodes_after))) &&
            linklist != 0 &&
            linklist != head &&
            store(&(((DoubleLinklistType *)prev) -> node_next), linklist) *
            store(&(((DoubleLinklistType *)prev) -> node_prev), before_prev) *
            store(&(linklist -> node_next), next) *
            store(&(linklist -> node_prev), prev) *
            xizi_dllseg(next, linklist, head, last, nodes_after) *
            ((nodes_before == nil &&
              prev == head &&
              before_prev == last &&
              first == linklist && emp) ||
             (exists prefix0,
                nodes_before == app(prefix0, cons(prev, nil)) &&
                prev != 0 &&
                prev != head &&
                store(&(head -> node_next), first) *
                store(&(head -> node_prev), last) *
                xizi_dllseg(first, head, prev, before_prev, prefix0)))) ||
           (linklist == head &&
            xizi_double_link_insert_before_nodes(ptrs,
                                                 linklist,
                                                 linklist_node) ==
              app(ptrs, cons(linklist_node, nil)) &&
            ((ptrs == nil &&
              prev == head &&
              before_prev == head &&
              first == head &&
              store(&(linklist -> node_next), linklist) *
              store(&(linklist -> node_prev), linklist)) ||
             (exists prefix0,
                ptrs == app(prefix0, cons(prev, nil)) &&
                prev != 0 &&
                prev != head &&
                store(&(((DoubleLinklistType *)prev) -> node_next), linklist) *
                store(&(((DoubleLinklistType *)prev) -> node_prev), before_prev) *
                store(&(head -> node_next), first) *
                store(&(head -> node_prev), prev) *
                xizi_dllseg(first, head, prev, before_prev, prefix0)))))
    */
    linklist->node_prev->node_next = linklist_node;
    linklist_node->node_prev = linklist->node_prev;

    linklist->node_prev = linklist_node;
    linklist_node->node_next = linklist;
}
