#include "xizi_double_link_def.h"

/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_double_link_init_then_len.source Require Import xizi_double_link_init_then_len_lib */
/*@ Extern Coq (xizi_double_link_init_then_len_result : Z -> Prop) */

/*@ Extern Coq (XiziStoreADLL::DL_Node :: * => *) */
/*@ Extern Coq
      (xizi_store_dll : {A} -> (Z -> A -> Assertion) -> Z -> list (XiziStoreADLL::DL_Node A) -> Assertion)
      (xizi_dll_ptrs : {A} -> list (XiziStoreADLL::DL_Node A) -> list Z)
      (xizi_dll_payloads : {A} -> (Z -> A -> Assertion) -> list (XiziStoreADLL::DL_Node A) -> Assertion)
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

unsigned int DoubleLinkListLenGet(const DoubleLinklistType *linklist)
/*@ general
    With {A} (storeA : Z -> A -> Assertion)
         (nodes : list (XiziStoreADLL::DL_Node A))
    Require
      xizi_store_dll(storeA, linklist, nodes)
    Ensure
      __return == Zlength(nodes) &&
      xizi_store_dll(storeA, linklist, nodes)
*/;

unsigned int DoubleLinkListLenGet(const DoubleLinklistType *linklist)
/*@ nil_case <= general
    With {A} (storeA : Z -> A -> Assertion)
    Require
      xizi_store_dll(storeA, linklist, nil)
    Ensure
      __return == 0 &&
      xizi_store_dll(storeA, linklist, nil)
*/;

unsigned int DoubleLinkListLenGet(const DoubleLinklistType *linklist)
/*@ general
*/
{
    unsigned int linklist_length = 0;
    const DoubleLinklistType *tmp_node = linklist;
    /*@ Inv Assert
          exists done todo first last,
            xizi_dll_ptrs(nodes) == app(done, todo) &&
            linklist == linklist@pre &&
            linklist != 0 &&
            linklist_length == Zlength(done) &&
            Zlength(nodes) == Zlength(done) + Zlength(todo) &&
            xizi_dll_payloads(storeA, nodes) *
            ((done == nil &&
              tmp_node == linklist &&
              store(&(linklist -> node_next), first) *
              store(&(linklist -> node_prev), last) *
              xizi_dllseg(first, linklist, linklist, last, todo)) ||
             (exists before next prev,
                done == app(before, cons(tmp_node, nil)) &&
                tmp_node != 0 &&
                tmp_node != linklist &&
                store(&(linklist -> node_next), first) *
                store(&(linklist -> node_prev), last) *
                xizi_dllseg(first, linklist, tmp_node, prev, before) *
                store(&(tmp_node -> node_next), next) *
                store(&(tmp_node -> node_prev), prev) *
                xizi_dllseg(next, tmp_node, linklist, last, todo)))
      */
    while (tmp_node->node_next != linklist) {
        tmp_node = tmp_node->node_next;
        linklist_length++;
    }

    return linklist_length;
}

unsigned int xizi_double_link_init_then_len(DoubleLinklistType *linklist_head)
/*@ With {A} (storeA : Z -> A -> Assertion)
    Require
      xizi_dll_node(linklist_head)
    Ensure
      xizi_double_link_init_then_len_result(__return) &&
      xizi_store_dll(storeA, linklist_head, nil)
*/
{
    InitDoubleLinkList(linklist_head) /*@ where storeA = storeA; A = A */;
    return DoubleLinkListLenGet(linklist_head) /*@ where (nil_case) storeA = storeA; A = A */;
}
