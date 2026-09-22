#include "xizi_double_link_def.h"

/*@ Extern Coq (DLL::DL_Node :: * => *) */
/*@ Extern Coq
      (XiziLocalDLL::store_dll : {A} -> (Z -> A -> Assertion) -> Z -> list (DLL::DL_Node A) -> Assertion)
      (XiziLocalDLL::dllseg : {A} -> (Z -> A -> Assertion) -> Z -> Z -> Z -> Z -> list (DLL::DL_Node A) -> Assertion)
      (XiziLocalDLL::dllseg_shift : {A} -> (Z -> A -> Assertion) -> Z -> Z -> list (DLL::DL_Node A) -> Assertion)
      (DLL::getPtr : {A} -> DLL::DL_Node A -> Z)
      (DLL::getData : {A} -> DLL::DL_Node A -> A)
*/
/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_double_link_len.source Require Import xizi_double_link_len_lib */

unsigned int DoubleLinkListLenGet(const DoubleLinklistType *linklist)
/*@ general
    With {A} (storeA : Z -> A -> Assertion)
         (nodes : list (DLL::DL_Node A))
    Require
      XiziLocalDLL::store_dll(storeA, linklist, nodes)
    Ensure
      __return == Zlength(nodes) &&
      XiziLocalDLL::store_dll(storeA, linklist, nodes)
*/;

unsigned int DoubleLinkListLenGet(const DoubleLinklistType *linklist)
/*@ nil_case <= general
    With {A} (storeA : Z -> A -> Assertion)
    Require
      XiziLocalDLL::store_dll(storeA, linklist, nil)
    Ensure
      __return == 0 &&
      XiziLocalDLL::store_dll(storeA, linklist, nil)
*/;

unsigned int DoubleLinkListLenGet(const DoubleLinklistType *linklist)
/*@ general
*/
{
    unsigned int linklist_length = 0;
    const DoubleLinklistType *tmp_node = linklist;
    /*@ Inv Assert
          exists done todo next last,
            nodes == app(done, todo) &&
            linklist == linklist@pre &&
            linklist_length == Zlength(done) &&
            Zlength(nodes) == Zlength(done) + Zlength(todo) &&
            store(&(linklist -> node_prev), last) *
            XiziLocalDLL::dllseg_shift(storeA, linklist, tmp_node, done) *
            store(&(tmp_node -> node_next), next) *
            XiziLocalDLL::dllseg(storeA, next, tmp_node, linklist, last, todo)
      */
    while (tmp_node->node_next != linklist) {
        /*@ Assert
              exists done node rest after last,
                nodes == app(done, cons(node, rest)) &&
                linklist == linklist@pre &&
                linklist_length == Zlength(done) &&
                Zlength(nodes) == Zlength(done) + 1 + Zlength(rest) &&
                store(&(linklist -> node_prev), last) *
                XiziLocalDLL::dllseg_shift(storeA, linklist, tmp_node, done) *
                store(&(tmp_node -> node_next), DLL::getPtr(node)) *
                storeA(DLL::getPtr(node), DLL::getData(node)) *
                store(&(DLL::getPtr(node) -> node_prev), tmp_node) *
                store(&(DLL::getPtr(node) -> node_next), after) *
                XiziLocalDLL::dllseg(storeA, after, DLL::getPtr(node), linklist, last, rest)
        */
        tmp_node = tmp_node->node_next;
        linklist_length++;
    }

    return linklist_length;
}
