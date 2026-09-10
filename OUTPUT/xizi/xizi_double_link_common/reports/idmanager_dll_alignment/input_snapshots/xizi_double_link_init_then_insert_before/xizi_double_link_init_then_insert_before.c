#include "xizi_double_link_def.h"

/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_double_link_init_then_insert_before.source Require Import xizi_double_link_init_then_insert_before_lib */
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


void InitDoubleLinkList(DoubleLinklistType *linklist_head)
/*@ With {A} (storeA : Z -> A -> Assertion)
    Require
      xizi_dll_node(linklist_head)
    Ensure
      xizi_store_dll(storeA, linklist_head, nil)
*/
{
    linklist_head->node_next = linklist_head;
    linklist_head->node_prev = linklist_head;
}

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


void xizi_double_link_init_then_insert_before(DoubleLinklistType *linklist_head,
                                              DoubleLinklistType *linklist_node)
/*@ With {A} (storeA : Z -> A -> Assertion) (data : A)
    Require
      xizi_dll_node(linklist_head) *
      xizi_dll_node(linklist_node) * storeA(linklist_node, data)
    Ensure
      xizi_store_dll(storeA, linklist_head,
        cons(XiziStoreADLL::Build_DL_Node(data, linklist_node), nil))
*/
{
    InitDoubleLinkList(linklist_head) /*@ where storeA = storeA; A = A */;
    /*@ Assert
          exists (nodes : list (XiziStoreADLL::DL_Node A)),
            nodes == nil &&
            linklist_head == linklist_head@pre &&
            linklist_node == linklist_node@pre &&
            xizi_store_dll(storeA, linklist_head, nodes) *
            xizi_dll_node(linklist_node) * storeA(linklist_node, data)
    */
    DoubleLinkListInsertNodeBefore(linklist_head, linklist_node)
      /*@ where (sentinel_case) storeA = storeA, data = data; A = A */;
}
