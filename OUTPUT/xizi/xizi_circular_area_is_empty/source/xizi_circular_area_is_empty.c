#include "char_array_def.h"

typedef unsigned char uint8;
typedef unsigned int uint32;
typedef int x_bool;

#define NONE ((void *)0)
#define RET_TRUE 1
#define RET_FALSE 0
#define ERROR 1
#define NULL_PARAM_CHECK(p) do { if ((p) == NONE) return ERROR; } while (0)

void KPrintf(const char *fmt)
/*@ With LM s
    Require fmt == LM(s) && GlobalStrings(LM)
    Ensure GlobalStrings(LM)
*/;

struct CircularAreaOps;

struct CircularArea {
    uint8 *data_buffer;
    uint8 readidx;
    uint8 writeidx;
    uint8 *p_head;
    uint8 *p_tail;
    uint32 area_length;
    x_bool b_status;
    struct CircularAreaOps *CircularAreaOperations;
};

typedef struct CircularArea *CircularAreaType;

/*@ Import Coq Require Import SimpleC.EE.OUTPUT.xizi.xizi_circular_area_is_empty.source.xizi_circular_area_is_empty_lib */
/*@ Extern Coq
      (CircularAreaEmptyResult : Z -> Z -> Z -> Z -> Prop)
      (xizi_circular_area_error_result : Z -> Prop)
*/

x_bool CircularAreaIsEmpty(CircularAreaType circular_area)
/*@ With LitMap data_buffer readidx writeidx p_head p_tail area_length b_status operations contents
    Require
      circular_area == 0 && GlobalStrings(LitMap) ||
      circular_area != 0 &&
        GlobalStrings(LitMap) *
        UCharArray::full(data_buffer, area_length, contents) *
        store_ptr(&(circular_area->data_buffer), data_buffer) *
        store_uchar(&(circular_area->readidx), readidx) *
        store_uchar(&(circular_area->writeidx), writeidx) *
        store_ptr(&(circular_area->p_head), p_head) *
        store_ptr(&(circular_area->p_tail), p_tail) *
        store_uint(&(circular_area->area_length), area_length) *
        store_int(&(circular_area->b_status), b_status) *
        store_ptr(&(circular_area->CircularAreaOperations), operations)
    Ensure
      circular_area == 0 && xizi_circular_area_error_result(__return) &&
        GlobalStrings(LitMap) ||
      circular_area != 0 &&
        CircularAreaEmptyResult(readidx, writeidx, b_status, __return) &&
        GlobalStrings(LitMap) *
        UCharArray::full(data_buffer, area_length, contents) *
        store_ptr(&(circular_area->data_buffer), data_buffer) *
        store_uchar(&(circular_area->readidx), readidx) *
        store_uchar(&(circular_area->writeidx), writeidx) *
        store_ptr(&(circular_area->p_head), p_head) *
        store_ptr(&(circular_area->p_tail), p_tail) *
        store_uint(&(circular_area->area_length), area_length) *
        store_int(&(circular_area->b_status), b_status) *
        store_ptr(&(circular_area->CircularAreaOperations), operations)
*/
{
    NULL_PARAM_CHECK(circular_area);

    if ((circular_area->readidx == circular_area->writeidx) &&
        !circular_area->b_status) {
        KPrintf("the circular area is empty\n")
          /*@ where LM = LitMap, s = "the circular area is empty\n" */;
        return RET_TRUE;
    } else {
        return RET_FALSE;
    }
}
