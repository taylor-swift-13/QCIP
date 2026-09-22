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
/*@ Import Coq Require Import QCIPLib.xizi.xizi_circular_area_common.xizi_circular_area_lib */
/*@ Extern Coq (circular_area_state :: *) */
/*@ Extern Coq
      (CircularAreaStateEmptyResult : circular_area_state -> Z -> Prop)
      (ca_capacity : circular_area_state -> Z)
      (ca_contents : circular_area_state -> list Z)
      (store_circular_area : circular_area_state -> Z -> Assertion)
      (store_circular_area_or_null : circular_area_state -> Z -> Assertion)
      (CircularAreaLogicalState : Z -> Z -> Z -> Z -> list Z -> list (option Z) -> Prop)
      (UCharArray::mixed_full : Z -> Z -> list (option Z) -> Assertion)
*/

x_bool CircularAreaIsEmpty(CircularAreaType circular_area)
/*@ With LitMap state
    Require
      GlobalStrings(LitMap) *
      store_circular_area_or_null(state, circular_area)
    Ensure
      (circular_area == 0 && __return == 1 &&
       GlobalStrings(LitMap)) ||
      (circular_area != 0 &&
       CircularAreaStateEmptyResult(state, __return) &&
       GlobalStrings(LitMap) * store_circular_area(state, circular_area))
*/
{
    NULL_PARAM_CHECK(circular_area);

    /*@ Assert
      exists data_buffer operations readidx writeidx b_status physical,
        circular_area != 0 &&
        circular_area == circular_area@pre &&
        data_buffer != 0 &&
        CircularAreaLogicalState(readidx, writeidx, ca_capacity(state), b_status,
                                 ca_contents(state), physical) &&
        GlobalStrings(LitMap) *
        store(&(circular_area->data_buffer), data_buffer) *
        store(&(circular_area->readidx), readidx) *
        store(&(circular_area->writeidx), writeidx) *
        store(&(circular_area->p_head), data_buffer) *
        store(&(circular_area->p_tail), data_buffer + ca_capacity(state)) *
        store(&(circular_area->area_length), ca_capacity(state)) *
        store(&(circular_area->b_status), b_status) *
        store(&(circular_area->CircularAreaOperations), operations) *
        UCharArray::mixed_full(data_buffer, ca_capacity(state), physical)
    */

    if ((circular_area->readidx == circular_area->writeidx) &&
        !circular_area->b_status) {
        KPrintf("the circular area is empty\n")
          /*@ where LM = LitMap, s = "the circular area is empty\n" */;
        return RET_TRUE;
    } else {
        return RET_FALSE;
    }
}
