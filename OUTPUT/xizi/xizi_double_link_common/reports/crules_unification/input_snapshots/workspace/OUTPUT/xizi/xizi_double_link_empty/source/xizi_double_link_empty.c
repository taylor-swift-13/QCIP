#include "xizi_double_link_def.h"

/*@ Extern Coq (DLL::DL_Node :: * => *) */
/*@ Extern Coq (XiziLocalDLL::store_dll : {A} -> (Z -> A -> Assertion) -> Z -> list (DLL::DL_Node A) -> Assertion)
               (XiziLocalDLL::dllseg : {A} -> (Z -> A -> Assertion) -> Z -> Z -> Z -> Z -> list (DLL::DL_Node A) -> Assertion)
*/

int IsDoubleLinkListEmpty(const DoubleLinklistType *linklist)
/*@ nil_case <= general
    With {A} (storeA : Z -> A -> Assertion)
    Require
      XiziLocalDLL::store_dll(storeA, linklist, nil)
    Ensure
      __return == 1 &&
      XiziLocalDLL::store_dll(storeA, linklist, nil)
*/;

int IsDoubleLinkListEmpty(const DoubleLinklistType *linklist)
/*@ general
    With {A} (storeA : Z -> A -> Assertion) (nodes : list (DLL::DL_Node A))
    Require
      XiziLocalDLL::store_dll(storeA, linklist, nodes)
    Ensure
      ((nodes == nil && __return == 1) ||
       (nodes != nil && __return == 0)) &&
      XiziLocalDLL::store_dll(storeA, linklist, nodes)
*/
{
    /*@ Assert exists first last,
          linklist == linklist@pre &&
          data_at(field_addr(linklist, SysDoubleLinklistNode, node_next), struct SysDoubleLinklistNode *,  first) *
          data_at(field_addr(linklist, SysDoubleLinklistNode, node_prev), struct SysDoubleLinklistNode *,  last) *
          XiziLocalDLL::dllseg(storeA, first, linklist, linklist, last, nodes)
    */
    return linklist->node_next == linklist;
}
