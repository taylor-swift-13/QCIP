#include "xizi_double_link_def.h"

/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_double_link_len.source Require Import xizi_double_link_len_lib */
/*@ Import Coq Import DLL */

/*@ Extern Coq (DL_Node :: * => *) */
/*@ Extern Coq
      (store_dll : {A} -> (Z -> A -> Assertion) -> Z -> list (DL_Node A) -> Assertion)
      (dllseg : {A} -> (Z -> A -> Assertion) -> Z -> Z -> Z -> Z -> list (DL_Node A) -> Assertion)
      (dllseg_shift : {A} -> (Z -> A -> Assertion) -> Z -> Z -> list (DL_Node A) -> Assertion)
      (getPtr : {A} -> DL_Node A -> Z)
      (getData : {A} -> DL_Node A -> A)
*/

unsigned int DoubleLinkListLenGet(const DoubleLinklistType *linklist)
/*@ general
    With {A} (storeA : Z -> A -> Assertion)
         (nodes : list (DL_Node A))
    Require
      store_dll(storeA, linklist, nodes)
    Ensure
      __return == Zlength(nodes) &&
      store_dll(storeA, linklist, nodes)
*/;

unsigned int DoubleLinkListLenGet(const DoubleLinklistType *linklist)
/*@ nil_case <= general
    With {A} (storeA : Z -> A -> Assertion)
    Require
      store_dll(storeA, linklist, nil)
    Ensure
      __return == 0 &&
      store_dll(storeA, linklist, nil)
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
            dllseg_shift(storeA, linklist, tmp_node, done) *
            store(&(tmp_node -> node_next), next) *
            dllseg(storeA, next, tmp_node, linklist, last, todo)
      */
    while (tmp_node->node_next != linklist) {
        /*@ Assert
              exists done node rest after last,
                nodes == app(done, cons(node, rest)) &&
                linklist == linklist@pre &&
                linklist_length == Zlength(done) &&
                Zlength(nodes) == Zlength(done) + 1 + Zlength(rest) &&
                store(&(linklist -> node_prev), last) *
                dllseg_shift(storeA, linklist, tmp_node, done) *
                store(&(tmp_node -> node_next), getPtr(node)) *
                storeA(getPtr(node), getData(node)) *
                store(&(getPtr(node) -> node_prev), tmp_node) *
                store(&(getPtr(node) -> node_next), after) *
                dllseg(storeA, after, getPtr(node), linklist, last, rest)
        */
        tmp_node = tmp_node->node_next;
        linklist_length++;
    }

    return linklist_length;
}
