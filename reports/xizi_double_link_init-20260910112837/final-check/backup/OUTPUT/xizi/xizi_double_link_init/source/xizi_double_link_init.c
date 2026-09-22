#include "xizi_double_link_def.h"

/*@ Extern Coq (XiziStoreADLL::DL_Node :: * => *) */
/*@ Extern Coq (xizi_store_dll : {A} -> (Z -> A -> Assertion) -> Z -> list (XiziStoreADLL::DL_Node A) -> Assertion)
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
