#include "verification_stdlib.h"
#include "verification_list.h"
#include "../../xizi_single_link_common/source/xizi_single_link_def.h"

/*@ Extern Coq (sll_payload_node :: * => *) */
/*@ Extern Coq (xizi_sll_head_payload : {A} -> (Z -> A -> Assertion) -> Z -> list (sll_payload_node A) -> Assertion)
 */

void InitSingleLinkList(SysSingleLinklistType *linklist)
/*@ With {A} (storeA : Z -> A -> Assertion)
    Require
      xizi_sll_node(linklist)
    Ensure
      xizi_sll_head_payload(storeA, linklist, nil)
*/
{
    linklist->node_next = (void *)0;
}
