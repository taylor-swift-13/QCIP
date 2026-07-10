#include "IP_STSTransDataSave.h"

/*@ Import Coq Require Import SimpleC.EE.LLM_bench.Engineering.STSTransDataSave.IP_STSTransDataSave_lib */
/*@ Extern Coq (STSTransDataSavePost: Z -> Z -> Z -> Prop) */

void STSTransDataSave()
/*@ With (ptr : Z)
    Require 0 <= ptr && ptr <= 1024 &&
            store(&(sSTSTran.ptr), ptr)
    Ensure exists ptr1,
      STSTransDataSavePost(ptr, ptr1, 248) &&
      store(&(sSTSTran.ptr), ptr1)
*/
{
    unint32 pDst;

    if (sSTSTran.ptr < 776)
    {
        pDst = 1074343936u + sSTSTran.ptr;
        Memcpyx((unint08*)pDst, sSTSTran.dataBuf, 248);
        sSTSTran.ptr = sSTSTran.ptr + 248;
    }

    return;
}
