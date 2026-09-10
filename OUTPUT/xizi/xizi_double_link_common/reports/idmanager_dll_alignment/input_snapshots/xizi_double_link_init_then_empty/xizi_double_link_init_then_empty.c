#include "xizi_double_link_def.h"

/*@ Extern Coq (XiziStoreADLL::DL_Node :: * => *) */
/*@ Extern Coq (xizi_store_dll : {A} -> (Z -> A -> Assertion) -> Z -> list (XiziStoreADLL::DL_Node A) -> Assertion)
               (XiziStoreADLL::dllseg : {A} -> (Z -> A -> Assertion) -> Z -> Z -> Z -> Z -> list (XiziStoreADLL::DL_Node A) -> Assertion)
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

int IsDoubleLinkListEmpty(const DoubleLinklistType *linklist)
/*@ nil_case <= general
    With {A} (storeA : Z -> A -> Assertion)
    Require
      xizi_store_dll(storeA, linklist, nil)
    Ensure
      __return == 1 &&
      xizi_store_dll(storeA, linklist, nil)
*/;

int IsDoubleLinkListEmpty(const DoubleLinklistType *linklist)
/*@ general
    With {A} (storeA : Z -> A -> Assertion) (nodes : list (XiziStoreADLL::DL_Node A))
    Require
      xizi_store_dll(storeA, linklist, nodes)
    Ensure
      ((nodes == nil && __return == 1) ||
       (nodes != nil && __return == 0)) &&
      xizi_store_dll(storeA, linklist, nodes)
*/
{
    /*@ Assert exists first last,
          linklist == linklist@pre && linklist != 0 &&
          data_at(field_addr(linklist, SysDoubleLinklistNode, node_next), struct SysDoubleLinklistNode *,  first) *
          data_at(field_addr(linklist, SysDoubleLinklistNode, node_prev), struct SysDoubleLinklistNode *,  last) *
          XiziStoreADLL::dllseg(storeA, first, linklist, linklist, last, nodes)
    */
    return linklist->node_next == linklist;
}

int xizi_double_link_init_then_empty(DoubleLinklistType *linklist_head)
/*@ With {A} (storeA : Z -> A -> Assertion)
    Require
      xizi_dll_node(linklist_head)
    Ensure
      __return == 1 &&
      xizi_store_dll(storeA, linklist_head, nil)
*/
{
    InitDoubleLinkList(linklist_head) /*@ where storeA = storeA; A = A */;
    return IsDoubleLinkListEmpty(linklist_head) /*@ where (nil_case) storeA = storeA; A = A */;
}
