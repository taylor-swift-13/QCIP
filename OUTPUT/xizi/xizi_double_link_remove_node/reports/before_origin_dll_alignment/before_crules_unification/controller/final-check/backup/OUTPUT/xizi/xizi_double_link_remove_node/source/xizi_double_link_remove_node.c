#include "xizi_double_link_def.h"

/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_double_link_remove_node.source Require Import xizi_double_link_remove_node_lib */
/*@ Extern Coq (XiziStoreADLL::DL_Node :: * => *) */
/*@ Extern Coq (xizi_dllseg_shift : Z -> Z -> list Z -> Assertion)
               (xizi_dllseg_shift_rev : Z -> Z -> list Z -> Assertion)
               (XiziStoreADLL::getPtr : {A} -> XiziStoreADLL::DL_Node A -> Z)
               (XiziStoreADLL::getData : {A} -> XiziStoreADLL::DL_Node A -> A)
               (xizi_store_dll : {A} -> (Z -> A -> Assertion) -> Z -> list (XiziStoreADLL::DL_Node A) -> Assertion)
               (xizi_dll_ptrs : {A} -> list (XiziStoreADLL::DL_Node A) -> list Z)
               (xizi_dll_payloads : {A} -> (Z -> A -> Assertion) -> list (XiziStoreADLL::DL_Node A) -> Assertion)
               (xizi_dll_remove_node_rel : {A} -> XiziStoreADLL::DL_Node A -> list (XiziStoreADLL::DL_Node A) -> list (XiziStoreADLL::DL_Node A) -> Prop)
               (In : {A} -> A -> list A -> Prop)
 */

void DoubleLinkListRmNode(DoubleLinklistType *linklist_node)
/*@ remove_member_spec <= strong_spec
    With {A} (storeA : Z -> A -> Assertion)
         (head : Z) (nodes : list (XiziStoreADLL::DL_Node A))
    Require In(linklist_node, xizi_dll_ptrs(nodes)) &&
            xizi_store_dll(storeA, head, nodes)
    Ensure exists (removed : XiziStoreADLL::DL_Node A)
                  (remaining : list (XiziStoreADLL::DL_Node A)),
           XiziStoreADLL::getPtr(removed) == linklist_node &&
           xizi_dll_remove_node_rel(removed, nodes, remaining) &&
           xizi_store_dll(storeA, head, remaining) *
           xizi_dll(linklist_node, nil) *
           storeA(linklist_node, XiziStoreADLL::getData(removed))
*/;

void DoubleLinkListRmNode(DoubleLinklistType *linklist_node)
/*@ remove_front_spec <= strong_spec
    With {A} (storeA : Z -> A -> Assertion)
         (head : Z) (removed : XiziStoreADLL::DL_Node A)
         (suffix : list (XiziStoreADLL::DL_Node A))
    Require XiziStoreADLL::getPtr(removed) == linklist_node &&
            xizi_store_dll(storeA, head, cons(removed, suffix))
    Ensure xizi_store_dll(storeA, head, suffix) *
           xizi_dll(linklist_node, nil) *
           storeA(linklist_node, XiziStoreADLL::getData(removed))
*/;

void DoubleLinkListRmNode(DoubleLinklistType *linklist_node)
/*@ remove_tail_spec <= strong_spec
    With {A} (storeA : Z -> A -> Assertion)
         (head : Z) (removed : XiziStoreADLL::DL_Node A)
         (prefix : list (XiziStoreADLL::DL_Node A))
    Require XiziStoreADLL::getPtr(removed) == linklist_node &&
            xizi_store_dll(storeA, head, app(prefix, cons(removed, nil)))
    Ensure xizi_store_dll(storeA, head, prefix) *
           xizi_dll(linklist_node, nil) *
           storeA(linklist_node, XiziStoreADLL::getData(removed))
*/;

void DoubleLinkListRmNode(DoubleLinklistType *linklist_node)
/*@ strong_spec
    With {A} (storeA : Z -> A -> Assertion)
         (head : Z) (removed : XiziStoreADLL::DL_Node A)
         (nodes prefix suffix : list (XiziStoreADLL::DL_Node A))
    Require XiziStoreADLL::getPtr(removed) == linklist_node &&
            nodes == app(prefix, cons(removed, suffix)) &&
            xizi_store_dll(storeA, head, nodes)
    Ensure xizi_store_dll(storeA, head, app(prefix, suffix)) *
           xizi_dll(linklist_node, nil) *
           storeA(linklist_node, XiziStoreADLL::getData(removed))
*/
{
    /*@ Assert
        exists node_next node_prev,
          linklist_node == linklist_node@pre &&
          linklist_node != 0 &&
          xizi_dllseg_shift(head, node_prev, xizi_dll_ptrs(prefix)) *
          store(&(node_prev -> node_next), linklist_node) *
          store(&(linklist_node -> node_next), node_next) *
          store(&(linklist_node -> node_prev), node_prev) *
          store(&(node_next -> node_prev), linklist_node) *
          xizi_dllseg_shift_rev(node_next, head, xizi_dll_ptrs(suffix)) *
          xizi_dll_payloads(storeA, prefix) *
          xizi_dll_payloads(storeA, suffix) *
          storeA(linklist_node, XiziStoreADLL::getData(removed))
    */
    linklist_node->node_next->node_prev = linklist_node->node_prev;
    linklist_node->node_prev->node_next = linklist_node->node_next;

    linklist_node->node_next = linklist_node;
    linklist_node->node_prev = linklist_node;
}
