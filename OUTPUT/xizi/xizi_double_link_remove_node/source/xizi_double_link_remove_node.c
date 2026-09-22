#include "xizi_double_link_def.h"

/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_double_link_remove_node.source Require Import xizi_double_link_remove_node_lib */
/*@ Import Coq Import DLL */
/*@ Extern Coq (DL_Node :: * => *) */
/*@ Extern Coq (dllseg_shift : {A} -> (Z -> A -> Assertion) -> Z -> Z -> list (DL_Node A) -> Assertion)
               (dllseg_shift_rev : {A} -> (Z -> A -> Assertion) -> Z -> Z -> list (DL_Node A) -> Assertion)
               (getPtr : {A} -> DL_Node A -> Z)
               (getData : {A} -> DL_Node A -> A)
               (store_dll : {A} -> (Z -> A -> Assertion) -> Z -> list (DL_Node A) -> Assertion)
               (xizi_dll_ptrs : {A} -> list (DL_Node A) -> list Z)
               (xizi_dll_payloads : {A} -> (Z -> A -> Assertion) -> list (DL_Node A) -> Assertion)
               (xizi_dll_remove_node_rel : {A} -> DL_Node A -> list (DL_Node A) -> list (DL_Node A) -> Prop)
               (xizi_dll_detached : Z -> Assertion)
               (In : {A} -> A -> list A -> Prop)
 */

void DoubleLinkListRmNode(DoubleLinklistType *linklist_node)
/*@
    Require xizi_dll_detached(linklist_node)
    Ensure  xizi_dll_detached(linklist_node)
*/;

void DoubleLinkListRmNode(DoubleLinklistType *linklist_node)
/*@ remove_member_spec <= strong_spec
    With {A} (storeA : Z -> A -> Assertion)
         (head : Z) (nodes : list (DL_Node A))
    Require In(linklist_node, xizi_dll_ptrs(nodes)) &&
            store_dll(storeA, head, nodes)
    Ensure exists (removed : DL_Node A)
                  (remaining : list (DL_Node A)),
           getPtr(removed) == linklist_node &&
           xizi_dll_remove_node_rel(removed, nodes, remaining) &&
           store_dll(storeA, head, remaining) *
           xizi_dll_detached(linklist_node) *
           storeA(linklist_node, getData(removed))
*/;

void DoubleLinkListRmNode(DoubleLinklistType *linklist_node)
/*@ remove_front_spec <= strong_spec
    With {A} (storeA : Z -> A -> Assertion)
         (head : Z) (removed : DL_Node A)
         (suffix : list (DL_Node A))
    Require getPtr(removed) == linklist_node &&
            store_dll(storeA, head, cons(removed, suffix))
    Ensure store_dll(storeA, head, suffix) *
           xizi_dll_detached(linklist_node) *
           storeA(linklist_node, getData(removed))
*/;

void DoubleLinkListRmNode(DoubleLinklistType *linklist_node)
/*@ remove_tail_spec <= strong_spec
    With {A} (storeA : Z -> A -> Assertion)
         (head : Z) (removed : DL_Node A)
         (prefix : list (DL_Node A))
    Require getPtr(removed) == linklist_node &&
            store_dll(storeA, head, app(prefix, cons(removed, nil)))
    Ensure store_dll(storeA, head, prefix) *
           xizi_dll_detached(linklist_node) *
           storeA(linklist_node, getData(removed))
*/;

void DoubleLinkListRmNode(DoubleLinklistType *linklist_node)
/*@ strong_spec
    With {A} (storeA : Z -> A -> Assertion)
         (head : Z) (removed : DL_Node A)
         (nodes prefix suffix : list (DL_Node A))
    Require getPtr(removed) == linklist_node &&
            nodes == app(prefix, cons(removed, suffix)) &&
            store_dll(storeA, head, nodes)
    Ensure store_dll(storeA, head, app(prefix, suffix)) *
           xizi_dll_detached(linklist_node) *
           storeA(linklist_node, getData(removed))
*/
{
    /*@ Assert
        exists node_next node_prev,
          linklist_node == linklist_node@pre &&
          dllseg_shift(storeA, head, node_prev, prefix) *
          store(&(node_prev -> node_next), linklist_node) *
          store(&(linklist_node -> node_next), node_next) *
          store(&(linklist_node -> node_prev), node_prev) *
          store(&(node_next -> node_prev), linklist_node) *
          dllseg_shift_rev(storeA, node_next, head, suffix) *
          storeA(linklist_node, getData(removed))
    */
    linklist_node->node_next->node_prev = linklist_node->node_prev;
    linklist_node->node_prev->node_next = linklist_node->node_next;

    linklist_node->node_next = linklist_node;
    linklist_node->node_prev = linklist_node;
}
