#include "xizi_double_link_def.h"

/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_double_link_insert_before.source Require Import xizi_double_link_insert_before_lib */
/*@ Extern Coq (DLL::DL_Node :: * => *) */
/*@ Extern Coq (In : Z -> list Z -> Prop)
    (DLL::Build_DL_Node : {A} -> A -> Z -> DLL::DL_Node A)
    (XiziLocalDLL::store_dll : {A} -> (Z -> A -> Assertion) -> Z -> list (DLL::DL_Node A) -> Assertion)
    (XiziLocalDLL::ptrs : {A} -> list (DLL::DL_Node A) -> list Z)
    (XiziLocalDLL::payloads : {A} -> (Z -> A -> Assertion) -> list (DLL::DL_Node A) -> Assertion)
    (XiziLocalDLL::occupy_dll_node : Z -> Assertion)
    (XiziLocalDLL::addr_dllseg : Z -> Z -> Z -> Z -> list Z -> Assertion)
    (xizi_insert_before_payload : {A} -> list (DLL::DL_Node A) -> Z -> DLL::DL_Node A -> list (DLL::DL_Node A) -> Prop)
    (xizi_double_link_insert_before_anchor : Z -> list Z -> Z -> Prop)
    (xizi_double_link_insert_before_nodes : list Z -> Z -> Z -> list Z)
 */

void DoubleLinkListInsertNodeBefore(DoubleLinklistType *linklist,
                                    DoubleLinklistType *linklist_node)
/*@ dispatch_case
    With {A} (storeA : Z -> A -> Assertion) (data : A) (head : Z) (nodes : list (DLL::DL_Node A))
    Require xizi_double_link_insert_before_anchor(head, XiziLocalDLL::ptrs(nodes), linklist) &&
            XiziLocalDLL::store_dll(storeA, head, nodes) *
            XiziLocalDLL::occupy_dll_node(linklist_node) * storeA(linklist_node, data)
    Ensure exists result,
      xizi_insert_before_payload(nodes, linklist,
        DLL::Build_DL_Node(data, linklist_node), result) &&
      XiziLocalDLL::store_dll(storeA, head, result)
*/;

void DoubleLinkListInsertNodeBefore(DoubleLinklistType *linklist,
                                    DoubleLinklistType *linklist_node)
/*@ member_case <= dispatch_case
    With {A} (storeA : Z -> A -> Assertion) (data : A) (head : Z) (nodes : list (DLL::DL_Node A))
    Require In(linklist, XiziLocalDLL::ptrs(nodes)) &&
            XiziLocalDLL::store_dll(storeA, head, nodes) *
            XiziLocalDLL::occupy_dll_node(linklist_node) * storeA(linklist_node, data)
    Ensure exists result,
      xizi_insert_before_payload(nodes, linklist,
        DLL::Build_DL_Node(data, linklist_node), result) &&
      XiziLocalDLL::store_dll(storeA, head, result)
*/;

void DoubleLinkListInsertNodeBefore(DoubleLinklistType *linklist,
                                    DoubleLinklistType *linklist_node)
/*@ sentinel_case <= dispatch_case
    With {A} (storeA : Z -> A -> Assertion) (data : A) (nodes : list (DLL::DL_Node A))
    Require XiziLocalDLL::store_dll(storeA, linklist, nodes) *
            XiziLocalDLL::occupy_dll_node(linklist_node) * storeA(linklist_node, data)
    Ensure XiziLocalDLL::store_dll(storeA, linklist,
      app(nodes, cons(DLL::Build_DL_Node(data, linklist_node), nil)))
*/;

void DoubleLinkListInsertNodeBefore(DoubleLinklistType *linklist,
                                    DoubleLinklistType *linklist_node)
/*@ dispatch_case
*/
{
    /*@ Assert
        exists (ptrs : list Z) (result : list (DLL::DL_Node A)) nodes_before nodes_after first last prev before_prev next old_prev old_next,
          linklist == linklist@pre &&
          linklist_node == linklist_node@pre &&
          ptrs == XiziLocalDLL::ptrs(nodes) &&
          xizi_insert_before_payload(nodes, linklist,
            DLL::Build_DL_Node(data, linklist_node), result) &&
          XiziLocalDLL::ptrs(result) ==
            xizi_double_link_insert_before_nodes(ptrs, linklist, linklist_node) &&
          XiziLocalDLL::payloads(storeA, result) *
          store(&(linklist_node -> node_prev), old_prev) *
          store(&(linklist_node -> node_next), old_next) *
          ((ptrs == app(nodes_before, cons(linklist, nodes_after)) &&
            ! In(linklist, nodes_before) &&
            xizi_double_link_insert_before_nodes(ptrs,
                                                 linklist,
                                                 linklist_node) ==
              app(nodes_before,
                  cons(linklist_node, cons(linklist, nodes_after))) &&
            store(&(((DoubleLinklistType *)prev) -> node_next), linklist) *
            store(&(((DoubleLinklistType *)prev) -> node_prev), before_prev) *
            store(&(linklist -> node_next), next) *
            store(&(linklist -> node_prev), prev) *
            XiziLocalDLL::addr_dllseg(next, linklist, head, last, nodes_after) *
            ((nodes_before == nil &&
              prev == head &&
              before_prev == last &&
              first == linklist && emp) ||
             (exists prefix0,
                nodes_before == app(prefix0, cons(prev, nil)) &&
                store(&(head -> node_next), first) *
                store(&(head -> node_prev), last) *
                XiziLocalDLL::addr_dllseg(first, head, prev, before_prev, prefix0)))) ||
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
                store(&(((DoubleLinklistType *)prev) -> node_next), linklist) *
                store(&(((DoubleLinklistType *)prev) -> node_prev), before_prev) *
                store(&(head -> node_next), first) *
                store(&(head -> node_prev), prev) *
                XiziLocalDLL::addr_dllseg(first, head, prev, before_prev, prefix0)))))
    */
    linklist->node_prev->node_next = linklist_node;
    linklist_node->node_prev = linklist->node_prev;

    linklist->node_prev = linklist_node;
    linklist_node->node_next = linklist;
}
