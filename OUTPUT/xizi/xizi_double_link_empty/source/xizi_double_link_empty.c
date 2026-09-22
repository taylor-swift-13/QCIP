#include "xizi_double_link_def.h"

/*@ Import Coq Import DLL */
/*@ Extern Coq (DL_Node :: * => *) */
/*@ Extern Coq (store_dll : {A} -> (Z -> A -> Assertion) -> Z -> list (DL_Node A) -> Assertion)
               (dllseg : {A} -> (Z -> A -> Assertion) -> Z -> Z -> Z -> Z -> list (DL_Node A) -> Assertion)
*/

int IsDoubleLinkListEmpty(const DoubleLinklistType *linklist)
/*@ nil_case <= general
    With {A} (storeA : Z -> A -> Assertion)
    Require
      store_dll(storeA, linklist, nil)
    Ensure
      __return == 1 &&
      store_dll(storeA, linklist, nil)
*/;

int IsDoubleLinkListEmpty(const DoubleLinklistType *linklist)
/*@ general
    With {A} (storeA : Z -> A -> Assertion) (nodes : list (DL_Node A))
    Require
      store_dll(storeA, linklist, nodes)
    Ensure
      ((nodes == nil && __return == 1) ||
       (nodes != nil && __return == 0)) &&
      store_dll(storeA, linklist, nodes)
*/
{
    /*@ Assert exists first last,
          linklist == linklist@pre &&
          data_at(field_addr(linklist, SysDoubleLinklistNode, node_next), struct SysDoubleLinklistNode *,  first) *
          data_at(field_addr(linklist, SysDoubleLinklistNode, node_prev), struct SysDoubleLinklistNode *,  last) *
          dllseg(storeA, first, linklist, linklist, last, nodes)
    */
    return linklist->node_next == linklist;
}
