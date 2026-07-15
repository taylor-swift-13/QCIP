#include "xizi_double_link_def.h"

/*@ Extern Coq (xizi_dll: Z -> list Z -> Assertion) */
/*@ Import Coq Require Import QCIPLib.xizi.xizi_double_link_common.xizi_double_link_lib */

void xizi_double_link_init(DoubleLinklistType *linklist_head)
/*@ With (old_next old_prev: Z)
    Require linklist_head != 0 &&
            store(&(linklist_head -> node_next), old_next) *
            store(&(linklist_head -> node_prev), old_prev)
    Ensure xizi_dll(linklist_head@pre, nil)
*/
{
    linklist_head->node_next = linklist_head;
    linklist_head->node_prev = linklist_head;
}
