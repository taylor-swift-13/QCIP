#include "xizi_double_link_def.h"

/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_double_link_head.source
      Require Import xizi_double_link_head_lib
 */
/*@ Extern Coq (DLL::DL_Node :: * => *) */
/*@ Extern Coq
      (XiziLocalDLL::store_dll : {A} -> (Z -> A -> Assertion) -> Z -> list (DLL::DL_Node A) -> Assertion)
      (XiziLocalDLL::dllseg : {A} -> (Z -> A -> Assertion) -> Z -> Z -> Z -> Z -> list (DLL::DL_Node A) -> Assertion)
      (xizi_double_link_head_ptrs : {A} -> list (DLL::DL_Node A) -> list Z)
      (xizi_double_link_first_value : list Z -> Z)
 */

int IsDoubleLinkListEmpty(const DoubleLinklistType *linklist)
/*@ expanded <= general
    With {A} (storeA : Z -> A -> Assertion)
         (nodes : list (DLL::DL_Node A)) first_link last_link
    Require
      data_at(field_addr(linklist, SysDoubleLinklistNode, node_next), struct SysDoubleLinklistNode *, first_link) *
      data_at(field_addr(linklist, SysDoubleLinklistNode, node_prev), struct SysDoubleLinklistNode *, last_link) *
      XiziLocalDLL::dllseg(storeA, first_link, linklist, linklist, last_link, nodes)
    Ensure exists first_out last_out,
      ((nodes == nil && __return == 1) ||
       (nodes != nil && __return == 0)) &&
      data_at(field_addr(linklist, SysDoubleLinklistNode, node_next), struct SysDoubleLinklistNode *, first_out) *
      data_at(field_addr(linklist, SysDoubleLinklistNode, node_prev), struct SysDoubleLinklistNode *, last_out) *
      XiziLocalDLL::dllseg(storeA, first_out, linklist, linklist, last_out, nodes)
 */;

int IsDoubleLinkListEmpty(const DoubleLinklistType *linklist)
/*@ general
    With {A} (storeA : Z -> A -> Assertion) (nodes : list (DLL::DL_Node A))
    Require XiziLocalDLL::store_dll(storeA, linklist, nodes)
    Ensure ((nodes == nil && __return == 1) ||
            (nodes != nil && __return == 0)) &&
           XiziLocalDLL::store_dll(storeA, linklist, nodes)
 */;

struct SysDoubleLinklistNode *DoubleLinkListGetHead(
    const DoubleLinklistType *linklist)
/*@ nil_case <= general
    With {A} (storeA : Z -> A -> Assertion)
    Require XiziLocalDLL::store_dll(storeA, linklist, nil)
    Ensure __return == 0 &&
           XiziLocalDLL::store_dll(storeA, linklist, nil)
 */;

struct SysDoubleLinklistNode *DoubleLinkListGetHead(
    const DoubleLinklistType *linklist)
/*@ general
    With {A} (storeA : Z -> A -> Assertion) (nodes: list (DLL::DL_Node A))
    Require XiziLocalDLL::store_dll(storeA, linklist, nodes)
    Ensure __return == xizi_double_link_first_value(xizi_double_link_head_ptrs(nodes)) &&
           XiziLocalDLL::store_dll(storeA, linklist, nodes)
 */
{
    /*@ Assert exists first_link last_link,
          linklist == linklist@pre &&
          data_at(field_addr(linklist, SysDoubleLinklistNode, node_next), struct SysDoubleLinklistNode *, first_link) *
          data_at(field_addr(linklist, SysDoubleLinklistNode, node_prev), struct SysDoubleLinklistNode *, last_link) *
          XiziLocalDLL::dllseg(storeA, first_link, linklist, linklist, last_link, nodes)
    */
    return IsDoubleLinkListEmpty(linklist) /*@ where (expanded) storeA = storeA, nodes = nodes; A = A */ ? NONE : linklist->node_next;
}
