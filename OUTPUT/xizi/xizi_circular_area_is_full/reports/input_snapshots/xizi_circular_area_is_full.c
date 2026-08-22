#include "char_array_def.h"

/*@ Import Coq Require Import SimpleC.EE.OUTPUT.xizi.xizi_circular_area_is_full.source.xizi_circular_area_is_full_lib */

/*@ Extern Coq
      (xizi_circular_area_is_full_result : Z -> Z -> Z -> Z -> Prop)
      (xizi_circular_area_error_result : Z -> Prop)
*/

typedef unsigned char uint8;
typedef unsigned int uint32;
typedef int x_bool;
struct CircularArea;
typedef struct CircularArea *CircularAreaType;

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

x_bool CircularAreaIsFull(CircularAreaType circular_area)
/*@ With LitMap data_buffer readidx writeidx p_head p_tail area_length
         b_status operations buffer_contents
    Require
      (circular_area == 0 && GlobalStrings(LitMap)) ||
      (circular_area != 0 &&
       GlobalStrings(LitMap) *
       store(&(circular_area->data_buffer), data_buffer) *
       store(&(circular_area->readidx), readidx) *
       store(&(circular_area->writeidx), writeidx) *
       store(&(circular_area->p_head), p_head) *
       store(&(circular_area->p_tail), p_tail) *
       store(&(circular_area->area_length), area_length) *
       store(&(circular_area->b_status), b_status) *
       store(&(circular_area->CircularAreaOperations), operations) *
       CharArray::full(data_buffer, area_length, buffer_contents))
    Ensure
      (circular_area == 0 && xizi_circular_area_error_result(__return) &&
       GlobalStrings(LitMap)) ||
      (circular_area != 0 &&
       xizi_circular_area_is_full_result(readidx, writeidx, b_status, __return) &&
       GlobalStrings(LitMap) *
       store(&(circular_area->data_buffer), data_buffer) *
       store(&(circular_area->readidx), readidx) *
       store(&(circular_area->writeidx), writeidx) *
       store(&(circular_area->p_head), p_head) *
       store(&(circular_area->p_tail), p_tail) *
       store(&(circular_area->area_length), area_length) *
       store(&(circular_area->b_status), b_status) *
       store(&(circular_area->CircularAreaOperations), operations) *
       CharArray::full(data_buffer, area_length, buffer_contents))
*/
{
    NULL_PARAM_CHECK(circular_area);

    if ((circular_area->readidx == circular_area->writeidx) &&
        circular_area->b_status) {
        KPrintf("the circular area is full\n")
          /*@ where LM = LitMap, s = "the circular area is full\n" */;
        return RET_TRUE;
    } else {
        return RET_FALSE;
    }
}
