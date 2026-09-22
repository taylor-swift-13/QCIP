#include "xizi_double_link_def.h"

/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_double_link_insert_before.source Require Import xizi_double_link_insert_before_lib */
/*@ Import Coq Import DLL */
/*@ Extern Coq (DL_Node :: * => *) */
/*@ Extern Coq (In : Z -> list Z -> Prop)
    (Build_DL_Node : {A} -> A -> Z -> DL_Node A)
    (store_dll : {A} -> (Z -> A -> Assertion) -> Z -> list (DL_Node A) -> Assertion)
    (ptrs : {A} -> list (DL_Node A) -> list Z)
    (payloads : {A} -> (Z -> A -> Assertion) -> list (DL_Node A) -> Assertion)
    (occupy_dll_node : Z -> Assertion)
    (addr_dllseg : Z -> Z -> Z -> Z -> list Z -> Assertion)
    (xizi_insert_before_payload : {A} -> list (DL_Node A) -> Z -> DL_Node A -> list (DL_Node A) -> Prop)
    (xizi_double_link_insert_before_anchor : Z -> list Z -> Z -> Prop)
    (xizi_double_link_insert_before_nodes : list Z -> Z -> Z -> list Z)
 */

void DoubleLinkListInsertNodeBefore(DoubleLinklistType *linklist,
                                    DoubleLinklistType *linklist_node)
/*@ dispatch_case
    With {A} (storeA : Z -> A -> Assertion) (data : A) (head : Z) (nodes : list (DL_Node A))
    Require xizi_double_link_insert_before_anchor(head, ptrs(nodes), linklist) &&
            store_dll(storeA, head, nodes) *
            occupy_dll_node(linklist_node) * storeA(linklist_node, data)
    Ensure exists result,
      xizi_insert_before_payload(nodes, linklist,
        Build_DL_Node(data, linklist_node), result) &&
      store_dll(storeA, head, result)
*/;

void DoubleLinkListInsertNodeBefore(DoubleLinklistType *linklist,
                                    DoubleLinklistType *linklist_node)
/*@ member_case <= dispatch_case
    With {A} (storeA : Z -> A -> Assertion) (data : A) (head : Z) (nodes : list (DL_Node A))
    Require In(linklist, ptrs(nodes)) &&
            store_dll(storeA, head, nodes) *
            occupy_dll_node(linklist_node) * storeA(linklist_node, data)
    Ensure exists result,
      xizi_insert_before_payload(nodes, linklist,
        Build_DL_Node(data, linklist_node), result) &&
      store_dll(storeA, head, result)
*/;

void DoubleLinkListInsertNodeBefore(DoubleLinklistType *linklist,
                                    DoubleLinklistType *linklist_node)
/*@ sentinel_case <= dispatch_case
    With {A} (storeA : Z -> A -> Assertion) (data : A) (nodes : list (DL_Node A))
    Require store_dll(storeA, linklist, nodes) *
            occupy_dll_node(linklist_node) * storeA(linklist_node, data)
    Ensure store_dll(storeA, linklist,
      app(nodes, cons(Build_DL_Node(data, linklist_node), nil)))
*/;

void DoubleLinkListInsertNodeBefore(DoubleLinklistType *linklist,
                                    DoubleLinklistType *linklist_node)
/*@ dispatch_case
*/
{
    /*@ Assert
        exists (node_ptrs : list Z) (result : list (DL_Node A)) nodes_before nodes_after first last prev before_prev next old_prev old_next,
          linklist == linklist@pre &&
          linklist_node == linklist_node@pre &&
          node_ptrs == ptrs(nodes) &&
          xizi_insert_before_payload(nodes, linklist,
            Build_DL_Node(data, linklist_node), result) &&
          ptrs(result) ==
            xizi_double_link_insert_before_nodes(node_ptrs, linklist, linklist_node) &&
          payloads(storeA, result) *
          store(&(linklist_node -> node_prev), old_prev) *
          store(&(linklist_node -> node_next), old_next) *
          ((node_ptrs == app(nodes_before, cons(linklist, nodes_after)) &&
            ! In(linklist, nodes_before) &&
            xizi_double_link_insert_before_nodes(node_ptrs,
                                                 linklist,
                                                 linklist_node) ==
              app(nodes_before,
                  cons(linklist_node, cons(linklist, nodes_after))) &&
            store(&(((DoubleLinklistType *)prev) -> node_next), linklist) *
            store(&(((DoubleLinklistType *)prev) -> node_prev), before_prev) *
            store(&(linklist -> node_next), next) *
            store(&(linklist -> node_prev), prev) *
            addr_dllseg(next, linklist, head, last, nodes_after) *
            ((nodes_before == nil &&
              prev == head &&
              before_prev == last &&
              first == linklist && emp) ||
             (exists prefix0,
                nodes_before == app(prefix0, cons(prev, nil)) &&
                store(&(head -> node_next), first) *
                store(&(head -> node_prev), last) *
                addr_dllseg(first, head, prev, before_prev, prefix0)))) ||
           (linklist == head &&
            xizi_double_link_insert_before_nodes(node_ptrs,
                                                 linklist,
                                                 linklist_node) ==
              app(node_ptrs, cons(linklist_node, nil)) &&
            ((node_ptrs == nil &&
              prev == head &&
              before_prev == head &&
              first == head &&
              store(&(linklist -> node_next), linklist) *
              store(&(linklist -> node_prev), linklist)) ||
             (exists prefix0,
                node_ptrs == app(prefix0, cons(prev, nil)) &&
                store(&(((DoubleLinklistType *)prev) -> node_next), linklist) *
                store(&(((DoubleLinklistType *)prev) -> node_prev), before_prev) *
                store(&(head -> node_next), first) *
                store(&(head -> node_prev), prev) *
                addr_dllseg(first, head, prev, before_prev, prefix0)))))
    */
    linklist->node_prev->node_next = linklist_node;
    linklist_node->node_prev = linklist->node_prev;

    linklist->node_prev = linklist_node;
    linklist_node->node_next = linklist;
}
