#include "verification_stdlib.h"
#include "verification_list.h"
#include "../../xizi_single_link_common/source/xizi_single_link_def.h"

unsigned int xizi_single_link_len(const SysSingleLinklistType *linklist)
/*@ With l
    Require
      xizi_sll_head(linklist, l)
    Ensure
      __return == Zlength(l) &&
      xizi_sll_head(linklist, l)
*/
{
    unsigned int length = 0;
    const SysSingleLinklistType *tmp_list = linklist->node_next;

    /*@ Inv Assert
          exists first l1 l2,
            l == app(l1, l2) &&
            length == Zlength(l1) &&
            linklist != 0 &&
            linklist -> node_next == first &&
            xizi_sllseg(first, tmp_list, l1) *
            xizi_sll(tmp_list, l2)
    */
    while (tmp_list != (void *)0)
    {
        tmp_list = tmp_list->node_next;
        length ++;
    }

    return length;
}
