#include "IP_STSTransDataSave.h"

/*@ Import Coq Require Import SimpleC.EE.LLM_bench.Engineering.STSTransDataSave.r2.IP_STSTransDataSave__annotation_subagent_tmp_lib */
/*@ Extern Coq (STSTransDataSaveBytePost: Z -> Z -> list Z -> list Z -> list Z -> Prop) */

void STSTransDataSave()
/*@ true_case
    With (ptr : Z) (data_head : list Z) (data_tail : list Z)
          (prefix : list Z) (old_dst : list Z) (suffix : list Z)
    Require 0 <= ptr && ptr < 776 &&
            Zlength(data_head) == 248 && Zlength(data_tail) == 8 &&
            Zlength(prefix) == ptr && Zlength(old_dst) == 248 &&
            Zlength(suffix) == 1024 - ptr - 248 &&
            store(&(sSTSTran.ptr), ptr) *
            CharArray::full(&(sSTSTran.dataBuf[0]), 248, data_head) *
            CharArray::full(&(sSTSTran.dataBuf[0]) + 248, 8, data_tail) *
            CharArray::full(1074343936, ptr, prefix) *
            CharArray::full(1074343936 + ptr, 248, old_dst) *
            CharArray::full(1074343936 + ptr + 248, 1024 - ptr - 248, suffix)
    Ensure exists ptr1 new_sram,
      STSTransDataSaveBytePost(ptr, ptr1, app(data_head, data_tail),
        app(prefix, app(old_dst, suffix)), new_sram) &&
      store(&(sSTSTran.ptr), ptr1) *
      CharArray::full(&(sSTSTran.dataBuf[0]), 248, data_head) *
      CharArray::full(&(sSTSTran.dataBuf[0]) + 248, 8, data_tail) *
      CharArray::full(1074343936, 1024, new_sram)
*/
/*@ false_case
    With (ptr : Z) (data_head : list Z) (data_tail : list Z) (old_sram : list Z)
    Require 776 <= ptr && ptr <= 1024 &&
            Zlength(data_head) == 248 && Zlength(data_tail) == 8 &&
            Zlength(old_sram) == 1024 &&
            store(&(sSTSTran.ptr), ptr) *
            CharArray::full(&(sSTSTran.dataBuf[0]), 248, data_head) *
            CharArray::full(&(sSTSTran.dataBuf[0]) + 248, 8, data_tail) *
            CharArray::full(1074343936, 1024, old_sram)
    Ensure exists ptr1 new_sram,
      STSTransDataSaveBytePost(ptr, ptr1, app(data_head, data_tail), old_sram, new_sram) &&
      store(&(sSTSTran.ptr), ptr1) *
      CharArray::full(&(sSTSTran.dataBuf[0]), 248, data_head) *
      CharArray::full(&(sSTSTran.dataBuf[0]) + 248, 8, data_tail) *
      CharArray::full(1074343936, 1024, new_sram)
*/
{
    unint32 pDst;

    if (sSTSTran.ptr < 776)
    {
        pDst = 1074343936u + sSTSTran.ptr;
        /*@ Assert ptr < 776 && pDst == 1074343936 + ptr &&
              store(&(sSTSTran.ptr), ptr) *
              CharArray::full(1074343936, ptr, prefix) *
              CharArray::full(pDst, 248, old_dst) *
              CharArray::full(pDst + 248, 1024 - ptr - 248, suffix) *
              CharArray::full(&(sSTSTran.dataBuf[0]), 248, data_head) *
              CharArray::full(&(sSTSTran.dataBuf[0]) + 248, 8, data_tail)
        */
        Memcpyx((unint08*)pDst, &(sSTSTran.dataBuf[0]), 248) /*@ where bytes = data_head, old_dst = old_dst */;
        /*@ Assert ptr < 776 && pDst == 1074343936 + ptr &&
              store(&(sSTSTran.ptr), ptr) *
              CharArray::full(1074343936, ptr, prefix) *
              CharArray::full(pDst, 248, data_head) *
              CharArray::full(pDst + 248, 1024 - ptr - 248, suffix) *
              CharArray::full(&(sSTSTran.dataBuf[0]), 248, data_head) *
              CharArray::full(&(sSTSTran.dataBuf[0]) + 248, 8, data_tail)
        */
        sSTSTran.ptr = sSTSTran.ptr + 248;
    }

    return;
}
