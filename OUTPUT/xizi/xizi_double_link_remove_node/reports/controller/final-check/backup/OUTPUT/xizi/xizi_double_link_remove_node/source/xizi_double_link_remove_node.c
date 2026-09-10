#include "xizi_double_link_def.h"

/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_double_link_remove_node.source Require Import xizi_double_link_remove_node_lib */
/*@ Extern Coq (DLL::DL_Node :: * => *) */
/*@ Extern Coq (XiziLocalDLL::dllseg_shift : {A} -> (Z -> A -> Assertion) -> Z -> Z -> list (DLL::DL_Node A) -> Assertion)
               (XiziLocalDLL::dllseg_shift_rev : {A} -> (Z -> A -> Assertion) -> Z -> Z -> list (DLL::DL_Node A) -> Assertion)
               (DLL::getPtr : {A} -> DLL::DL_Node A -> Z)
               (DLL::getData : {A} -> DLL::DL_Node A -> A)
               (XiziLocalDLL::store_dll : {A} -> (Z -> A -> Assertion) -> Z -> list (DLL::DL_Node A) -> Assertion)
               (xizi_dll_ptrs : {A} -> list (DLL::DL_Node A) -> list Z)
               (xizi_dll_payloads : {A} -> (Z -> A -> Assertion) -> list (DLL::DL_Node A) -> Assertion)
               (xizi_dll_remove_node_rel : {A} -> DLL::DL_Node A -> list (DLL::DL_Node A) -> list (DLL::DL_Node A) -> Prop)
               (In : {A} -> A -> list A -> Prop)
 */

void DoubleLinkListRmNode(DoubleLinklistType *linklist_node)
/*@ remove_member_spec <= strong_spec
    With {A} (storeA : Z -> A -> Assertion)
         (head : Z) (nodes : list (DLL::DL_Node A))
    Require In(linklist_node, xizi_dll_ptrs(nodes)) &&
            XiziLocalDLL::store_dll(storeA, head, nodes)
    Ensure exists (removed : DLL::DL_Node A)
                  (remaining : list (DLL::DL_Node A)),
           DLL::getPtr(removed) == linklist_node &&
           xizi_dll_remove_node_rel(removed, nodes, remaining) &&
           XiziLocalDLL::store_dll(storeA, head, remaining) *
           XiziLocalDLL::store_dll(storeA, linklist_node, nil) *
           storeA(linklist_node, DLL::getData(removed))
*/;

void DoubleLinkListRmNode(DoubleLinklistType *linklist_node)
/*@ remove_front_spec <= strong_spec
    With {A} (storeA : Z -> A -> Assertion)
         (head : Z) (removed : DLL::DL_Node A)
         (suffix : list (DLL::DL_Node A))
    Require DLL::getPtr(removed) == linklist_node &&
            XiziLocalDLL::store_dll(storeA, head, cons(removed, suffix))
    Ensure XiziLocalDLL::store_dll(storeA, head, suffix) *
           XiziLocalDLL::store_dll(storeA, linklist_node, nil) *
           storeA(linklist_node, DLL::getData(removed))
*/;

void DoubleLinkListRmNode(DoubleLinklistType *linklist_node)
/*@ remove_tail_spec <= strong_spec
    With {A} (storeA : Z -> A -> Assertion)
         (head : Z) (removed : DLL::DL_Node A)
         (prefix : list (DLL::DL_Node A))
    Require DLL::getPtr(removed) == linklist_node &&
            XiziLocalDLL::store_dll(storeA, head, app(prefix, cons(removed, nil)))
    Ensure XiziLocalDLL::store_dll(storeA, head, prefix) *
           XiziLocalDLL::store_dll(storeA, linklist_node, nil) *
           storeA(linklist_node, DLL::getData(removed))
*/;

void DoubleLinkListRmNode(DoubleLinklistType *linklist_node)
/*@ strong_spec
    With {A} (storeA : Z -> A -> Assertion)
         (head : Z) (removed : DLL::DL_Node A)
         (nodes prefix suffix : list (DLL::DL_Node A))
    Require DLL::getPtr(removed) == linklist_node &&
            nodes == app(prefix, cons(removed, suffix)) &&
            XiziLocalDLL::store_dll(storeA, head, nodes)
    Ensure XiziLocalDLL::store_dll(storeA, head, app(prefix, suffix)) *
           XiziLocalDLL::store_dll(storeA, linklist_node, nil) *
           storeA(linklist_node, DLL::getData(removed))
*/
{
    /*@ Assert
        exists node_next node_prev,
          linklist_node == linklist_node@pre &&
          XiziLocalDLL::dllseg_shift(storeA, head, node_prev, prefix) *
          store(&(node_prev -> node_next), linklist_node) *
          store(&(linklist_node -> node_next), node_next) *
          store(&(linklist_node -> node_prev), node_prev) *
          store(&(node_next -> node_prev), linklist_node) *
          XiziLocalDLL::dllseg_shift_rev(storeA, node_next, head, suffix) *
          storeA(linklist_node, DLL::getData(removed))
    */
    linklist_node->node_next->node_prev = linklist_node->node_prev;
    linklist_node->node_prev->node_next = linklist_node->node_next;

    linklist_node->node_next = linklist_node;
    linklist_node->node_prev = linklist_node;
}
