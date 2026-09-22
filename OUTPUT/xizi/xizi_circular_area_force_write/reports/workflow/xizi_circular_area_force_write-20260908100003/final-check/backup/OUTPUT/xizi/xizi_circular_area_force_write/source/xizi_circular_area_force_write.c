typedef unsigned char uint8_t;
typedef unsigned int uint32_t;

#include "char_array_def.h"

/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_force_write.source Require Import xizi_circular_area_force_write_lib */

/*@ Extern Coq (circular_area_state :: *) */
/*@ Extern Coq (forced_circular_area_state :: *) */
/*@ Extern Coq
      (ca_capacity : circular_area_state -> Z)
      (ca_contents : circular_area_state -> list Z)
      (Build_circular_area_state : Z -> list Z -> circular_area_state)
      (store_circular_area : circular_area_state -> Z -> Assertion)
      (CircularAreaLogicalState :
         Z -> Z -> Z -> Z -> list Z -> list (option Z) -> Prop)
      (CircularAreaStateFullResult : circular_area_state -> Z -> Prop)
      (CircularAreaStateDataLengthResult : circular_area_state -> Z -> Prop)
      (CircularAreaStateDivideWrDataResult :
         circular_area_state -> Z -> Z -> Prop)
      (CircularAreaWriteResult :
         circular_area_state -> Z -> list Z -> Z ->
         circular_area_state -> Prop)
      (CircularAreaDivideWrDataResult : Z -> Z -> Z -> Z -> Prop)
      (CircularAreaActualWriteLength :
         Z -> Z -> list Z -> Z -> Prop)
      (CircularAreaSomeBytes : list Z -> list (option Z))
      (CircularAreaPhysicalWrite :
         list (option Z) -> list Z -> list (option Z) ->
         Z -> Z -> Z -> Prop)
      (CircularAreaWriteSuccess :
         Z -> Z -> Z -> Z -> Z -> list Z -> list Z -> list Z ->
         list (option Z) -> list (option Z) -> Prop)
      (Build_forced_circular_area_state :
         Z -> Z -> list (option Z) -> forced_circular_area_state)
      (fca_capacity : forced_circular_area_state -> Z)
      (fca_forced_index : forced_circular_area_state -> Z)
      (fca_physical : forced_circular_area_state -> list (option Z))
      (CircularAreaForceWriteResult :
         circular_area_state -> Z -> list Z -> Z ->
         forced_circular_area_state -> Prop)
      (CircularAreaForceRawRecoverable :
         forced_circular_area_state -> circular_area_state -> Prop)
      (CircularAreaForceFillToCapacity :
         circular_area_state -> Z -> list Z ->
         forced_circular_area_state -> circular_area_state -> Prop)
      (store_forced_circular_area :
         forced_circular_area_state -> Z -> Assertion)
      (CircularAreaForceWriteOutcome :
         circular_area_state -> Z -> list Z -> Z -> Z -> Assertion)
      (CircularAreaErrorResult : Z -> Prop)
      (UCharArray::seg : Z -> Z -> Z -> list Z -> Assertion)
      (UCharArray::mixed_seg :
         Z -> Z -> Z -> list (option Z) -> Assertion)
 */

typedef uint8_t uint8;
typedef uint32_t uint32;
typedef int x_bool;
struct CircularArea;
typedef struct CircularArea *CircularAreaType;

uint8 *memcpy(uint8 *dest, uint8 *src, uint32 count)
/*@ With dest_base dest_lo dest_hi src_base src_lo src_hi
          (dest_before : list (option Z)) (src_contents : list Z)
    Require
      dest == dest_base + dest_lo &&
      src == src_base + src_lo &&
      count == dest_hi - dest_lo &&
      count == src_hi - src_lo &&
      Zlength(dest_before) == dest_hi - dest_lo &&
      Zlength(src_contents) == src_hi - src_lo &&
      UCharArray::mixed_seg(dest_base, dest_lo, dest_hi, dest_before) *
      UCharArray::seg(src_base, src_lo, src_hi, src_contents)
    Ensure
      __return == dest &&
      UCharArray::mixed_seg(dest_base, dest_lo, dest_hi,
                            CircularAreaSomeBytes(src_contents)) *
      UCharArray::seg(src_base, src_lo, src_hi, src_contents)
 */;

int KPrintf(char *format)
/*@ kprintf_frame_preserving
    With LitMap
    Require GlobalStrings(LitMap)
    Ensure GlobalStrings(LitMap)
 */;

#define NONE ((void *)0)
#define RET_TRUE 1
#define RET_FALSE 0
#define EOK 0
#define ERROR 1
#define NULL_PARAM_CHECK(p) do { if ((p) == NONE) return ERROR; } while (0)
#define CHECK(cond) do { if (!(cond)) return ERROR; } while (0)

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
/*@ With (state : circular_area_state) LitMap
    Require
      exists data_buffer operations readidx writeidx b_status physical,
        circular_area != 0 && data_buffer != 0 &&
        CircularAreaLogicalState(
          readidx, writeidx, ca_capacity(state), b_status,
          ca_contents(state), physical) &&
        GlobalStrings(LitMap) *
        UCharArray::mixed_full(data_buffer, ca_capacity(state), physical) *
        store_ptr(&(circular_area->data_buffer), data_buffer) *
        store_uchar(&(circular_area->readidx), readidx) *
        store_uchar(&(circular_area->writeidx), writeidx) *
        store_ptr(&(circular_area->p_head), data_buffer) *
        store_ptr(&(circular_area->p_tail),
                  data_buffer + ca_capacity(state)) *
        store_uint(&(circular_area->area_length), ca_capacity(state)) *
        store_int(&(circular_area->b_status), b_status) *
        store_ptr(&(circular_area->CircularAreaOperations), operations)
    Ensure
      exists data_buffer operations readidx writeidx b_status physical,
        circular_area != 0 && data_buffer != 0 &&
        CircularAreaStateFullResult(state, __return) &&
        CircularAreaLogicalState(
          readidx, writeidx, ca_capacity(state), b_status,
          ca_contents(state), physical) &&
        GlobalStrings(LitMap) *
        UCharArray::mixed_full(data_buffer, ca_capacity(state), physical) *
        store_ptr(&(circular_area->data_buffer), data_buffer) *
        store_uchar(&(circular_area->readidx), readidx) *
        store_uchar(&(circular_area->writeidx), writeidx) *
        store_ptr(&(circular_area->p_head), data_buffer) *
        store_ptr(&(circular_area->p_tail),
                  data_buffer + ca_capacity(state)) *
        store_uint(&(circular_area->area_length), ca_capacity(state)) *
        store_int(&(circular_area->b_status), b_status) *
        store_ptr(&(circular_area->CircularAreaOperations), operations)
 */
{
    /*@ Assert
      exists data_buffer operations readidx writeidx b_status physical,
        circular_area == circular_area@pre && circular_area != 0 &&
        data_buffer != 0 &&
        CircularAreaLogicalState(
          readidx, writeidx, ca_capacity(state), b_status,
          ca_contents(state), physical) &&
        GlobalStrings(LitMap) *
        UCharArray::mixed_full(data_buffer, ca_capacity(state), physical) *
        store_ptr(&(circular_area->data_buffer), data_buffer) *
        store_uchar(&(circular_area->readidx), readidx) *
        store_uchar(&(circular_area->writeidx), writeidx) *
        store_ptr(&(circular_area->p_head), data_buffer) *
        store_ptr(&(circular_area->p_tail),
                  data_buffer + ca_capacity(state)) *
        store_uint(&(circular_area->area_length), ca_capacity(state)) *
        store_int(&(circular_area->b_status), b_status) *
        store_ptr(&(circular_area->CircularAreaOperations), operations)
    */
    NULL_PARAM_CHECK(circular_area);

    if ((circular_area->readidx == circular_area->writeidx) &&
        circular_area->b_status) {
        KPrintf("the circular area is full\n")
        /*@ where (kprintf_frame_preserving) */;
        return RET_TRUE;
    } else {
        return RET_FALSE;
    }
}

uint32 CircularAreaGetDataLength(CircularAreaType circular_area)
/*@ With (state : circular_area_state) LitMap
    Require
      exists data_buffer operations readidx writeidx b_status physical,
        circular_area != 0 && data_buffer != 0 &&
        CircularAreaLogicalState(
          readidx, writeidx, ca_capacity(state), b_status,
          ca_contents(state), physical) &&
        GlobalStrings(LitMap) *
        UCharArray::mixed_full(data_buffer, ca_capacity(state), physical) *
        store_ptr(&(circular_area->data_buffer), data_buffer) *
        store_uchar(&(circular_area->readidx), readidx) *
        store_uchar(&(circular_area->writeidx), writeidx) *
        store_ptr(&(circular_area->p_head), data_buffer) *
        store_ptr(&(circular_area->p_tail),
                  data_buffer + ca_capacity(state)) *
        store_uint(&(circular_area->area_length), ca_capacity(state)) *
        store_int(&(circular_area->b_status), b_status) *
        store_ptr(&(circular_area->CircularAreaOperations), operations)
    Ensure
      exists data_buffer operations readidx writeidx b_status physical,
        circular_area != 0 && data_buffer != 0 &&
        CircularAreaStateDataLengthResult(state, __return) &&
        CircularAreaLogicalState(
          readidx, writeidx, ca_capacity(state), b_status,
          ca_contents(state), physical) &&
        GlobalStrings(LitMap) *
        UCharArray::mixed_full(data_buffer, ca_capacity(state), physical) *
        store_ptr(&(circular_area->data_buffer), data_buffer) *
        store_uchar(&(circular_area->readidx), readidx) *
        store_uchar(&(circular_area->writeidx), writeidx) *
        store_ptr(&(circular_area->p_head), data_buffer) *
        store_ptr(&(circular_area->p_tail),
                  data_buffer + ca_capacity(state)) *
        store_uint(&(circular_area->area_length), ca_capacity(state)) *
        store_int(&(circular_area->b_status), b_status) *
        store_ptr(&(circular_area->CircularAreaOperations), operations)
 */
{
    NULL_PARAM_CHECK(circular_area);

    if (CircularAreaIsFull(circular_area)
        /*@ where state = state, LitMap = LitMap */) {
        /*@ Assert
          exists data_buffer operations readidx writeidx b_status physical,
            circular_area == circular_area@pre && circular_area != 0 &&
            data_buffer != 0 &&
            Zlength(ca_contents(state)) == ca_capacity(state) &&
            CircularAreaLogicalState(
              readidx, writeidx, ca_capacity(state), b_status,
              ca_contents(state), physical) &&
            GlobalStrings(LitMap) *
            UCharArray::mixed_full(
              data_buffer, ca_capacity(state), physical) *
            store_ptr(&(circular_area->data_buffer), data_buffer) *
            store_uchar(&(circular_area->readidx), readidx) *
            store_uchar(&(circular_area->writeidx), writeidx) *
            store_ptr(&(circular_area->p_head), data_buffer) *
            store_ptr(&(circular_area->p_tail),
                      data_buffer + ca_capacity(state)) *
            store_uint(&(circular_area->area_length), ca_capacity(state)) *
            store_int(&(circular_area->b_status), b_status) *
            store_ptr(&(circular_area->CircularAreaOperations), operations)
        */
        return circular_area->area_length;
    } else {
        /*@ Assert
          exists data_buffer operations readidx writeidx b_status physical,
            circular_area == circular_area@pre && circular_area != 0 &&
            data_buffer != 0 &&
            Zlength(ca_contents(state)) < ca_capacity(state) &&
            CircularAreaLogicalState(
              readidx, writeidx, ca_capacity(state), b_status,
              ca_contents(state), physical) &&
            GlobalStrings(LitMap) *
            UCharArray::mixed_full(
              data_buffer, ca_capacity(state), physical) *
            store_ptr(&(circular_area->data_buffer), data_buffer) *
            store_uchar(&(circular_area->readidx), readidx) *
            store_uchar(&(circular_area->writeidx), writeidx) *
            store_ptr(&(circular_area->p_head), data_buffer) *
            store_ptr(&(circular_area->p_tail),
                      data_buffer + ca_capacity(state)) *
            store_uint(&(circular_area->area_length), ca_capacity(state)) *
            store_int(&(circular_area->b_status), b_status) *
            store_ptr(&(circular_area->CircularAreaOperations), operations)
        */
        return (circular_area->writeidx - circular_area->readidx +
                circular_area->area_length) % circular_area->area_length;
    }
}

static uint32 CircularAreaDivideWrData(CircularAreaType circular_area,
                                       uint32 data_length)
/*@ With (state : circular_area_state) d0 LitMap
    Require
      exists data_buffer operations readidx writeidx b_status physical,
        data_length == d0 && circular_area != 0 && data_buffer != 0 &&
        0 <= d0 &&
        d0 <= ca_capacity(state) - Zlength(ca_contents(state)) &&
        CircularAreaLogicalState(
          readidx, writeidx, ca_capacity(state), b_status,
          ca_contents(state), physical) &&
        GlobalStrings(LitMap) *
        UCharArray::mixed_full(data_buffer, ca_capacity(state), physical) *
        store_ptr(&(circular_area->data_buffer), data_buffer) *
        store_uchar(&(circular_area->readidx), readidx) *
        store_uchar(&(circular_area->writeidx), writeidx) *
        store_ptr(&(circular_area->p_head), data_buffer) *
        store_ptr(&(circular_area->p_tail),
                  data_buffer + ca_capacity(state)) *
        store_uint(&(circular_area->area_length), ca_capacity(state)) *
        store_int(&(circular_area->b_status), b_status) *
        store_ptr(&(circular_area->CircularAreaOperations), operations)
    Ensure
      exists data_buffer operations readidx writeidx b_status physical,
        circular_area != 0 && data_buffer != 0 &&
        CircularAreaStateDivideWrDataResult(state, d0, __return) &&
        CircularAreaDivideWrDataResult(
          writeidx, d0, ca_capacity(state), __return) &&
        CircularAreaLogicalState(
          readidx, writeidx, ca_capacity(state), b_status,
          ca_contents(state), physical) &&
        GlobalStrings(LitMap) *
        UCharArray::mixed_full(data_buffer, ca_capacity(state), physical) *
        store_ptr(&(circular_area->data_buffer), data_buffer) *
        store_uchar(&(circular_area->readidx), readidx) *
        store_uchar(&(circular_area->writeidx), writeidx) *
        store_ptr(&(circular_area->p_head), data_buffer) *
        store_ptr(&(circular_area->p_tail),
                  data_buffer + ca_capacity(state)) *
        store_uint(&(circular_area->area_length), ca_capacity(state)) *
        store_int(&(circular_area->b_status), b_status) *
        store_ptr(&(circular_area->CircularAreaOperations), operations)
 */
{
    /*@ Assert
      exists data_buffer operations readidx writeidx b_status physical,
        circular_area == circular_area@pre && data_length == d0 &&
        circular_area != 0 && data_buffer != 0 &&
        0 <= d0 &&
        d0 <= ca_capacity(state) - Zlength(ca_contents(state)) &&
        writeidx + d0 <= UINT_MAX &&
        CircularAreaLogicalState(
          readidx, writeidx, ca_capacity(state), b_status,
          ca_contents(state), physical) &&
        GlobalStrings(LitMap) *
        UCharArray::mixed_full(data_buffer, ca_capacity(state), physical) *
        store_ptr(&(circular_area->data_buffer), data_buffer) *
        store_uchar(&(circular_area->readidx), readidx) *
        store_uchar(&(circular_area->writeidx), writeidx) *
        store_ptr(&(circular_area->p_head), data_buffer) *
        store_ptr(&(circular_area->p_tail),
                  data_buffer + ca_capacity(state)) *
        store_uint(&(circular_area->area_length), ca_capacity(state)) *
        store_int(&(circular_area->b_status), b_status) *
        store_ptr(&(circular_area->CircularAreaOperations), operations)
    */
    NULL_PARAM_CHECK(circular_area);

    if (circular_area->writeidx + data_length <= circular_area->area_length) {
        return RET_FALSE;
    } else {
        return RET_TRUE;
    }
}

uint32 CircularAreaWrite(CircularAreaType circular_area, uint8 *input_buffer,
                         uint32 data_length, x_bool b_force)
/*@ With (state : circular_area_state) LitMap
          ca0 in0 requested input_contents
    Require
      circular_area == ca0 && input_buffer == in0 &&
      data_length == requested && b_force != 0 &&
      0 <= requested && requested <= UINT_MAX &&
      GlobalStrings(LitMap) *
      ((ca0 == 0 && emp) ||
       (ca0 != 0 && store_circular_area(state, ca0))) *
      ((in0 == 0 && emp) ||
       (in0 != 0 && Zlength(input_contents) == requested &&
        UCharArray::full(in0, requested, input_contents)))
    Ensure
      GlobalStrings(LitMap) *
      ((ca0 == 0 && CircularAreaErrorResult(__return) &&
        ((in0 == 0 && emp) ||
         (in0 != 0 && Zlength(input_contents) == requested &&
          UCharArray::full(in0, requested, input_contents)))) ||
       (ca0 != 0 && in0 == 0 && CircularAreaErrorResult(__return) &&
        store_circular_area(state, ca0)) ||
       (ca0 != 0 && in0 != 0 &&
        CircularAreaForceWriteOutcome(
          state, requested, input_contents, __return, ca0) *
        UCharArray::full(in0, requested, input_contents)))
 */
{
    NULL_PARAM_CHECK(circular_area);
    NULL_PARAM_CHECK(input_buffer);
    /*@ 0 <= data_length && data_length <= UINT_MAX by local */
    CHECK(data_length > 0);

    /*@ Assert
      exists data_buffer operations readidx writeidx b_status physical,
        circular_area == ca0 && input_buffer == in0 &&
        ca0 != 0 && in0 != 0 && requested > 0 &&
        data_length == requested && b_force != 0 &&
        Zlength(input_contents) == requested && data_buffer != 0 &&
        CircularAreaLogicalState(
          readidx, writeidx, ca_capacity(state), b_status,
          ca_contents(state), physical) &&
        GlobalStrings(LitMap) *
        UCharArray::mixed_full(data_buffer, ca_capacity(state), physical) *
        UCharArray::full(in0, requested, input_contents) *
        store_ptr(&(ca0->data_buffer), data_buffer) *
        store_uchar(&(ca0->readidx), readidx) *
        store_uchar(&(ca0->writeidx), writeidx) *
        store_ptr(&(ca0->p_head), data_buffer) *
        store_ptr(&(ca0->p_tail), data_buffer + ca_capacity(state)) *
        store_uint(&(ca0->area_length), ca_capacity(state)) *
        store_int(&(ca0->b_status), b_status) *
        store_ptr(&(ca0->CircularAreaOperations), operations)
    */

    if (CircularAreaIsFull(circular_area)
        /*@ where state = state, LitMap = LitMap */ && !b_force) {
        return ERROR;
    }

    /*@ Assert
      exists data_buffer operations readidx writeidx b_status physical,
        circular_area == ca0 && input_buffer == in0 &&
        ca0 != 0 && in0 != 0 && requested > 0 &&
        data_length == requested && b_force != 0 &&
        Zlength(input_contents) == requested && data_buffer != 0 &&
        CircularAreaLogicalState(
          readidx, writeidx, ca_capacity(state), b_status,
          ca_contents(state), physical) &&
        GlobalStrings(LitMap) *
        UCharArray::mixed_full(data_buffer, ca_capacity(state), physical) *
        UCharArray::full(in0, requested, input_contents) *
        store_ptr(&(ca0->data_buffer), data_buffer) *
        store_uchar(&(ca0->readidx), readidx) *
        store_uchar(&(ca0->writeidx), writeidx) *
        store_ptr(&(ca0->p_head), data_buffer) *
        store_ptr(&(ca0->p_tail), data_buffer + ca_capacity(state)) *
        store_uint(&(ca0->area_length), ca_capacity(state)) *
        store_int(&(ca0->b_status), b_status) *
        store_ptr(&(ca0->CircularAreaOperations), operations)
    */

    uint32 write_data_length = circular_area->area_length -
        CircularAreaGetDataLength(circular_area)
        /*@ where state = state, LitMap = LitMap */;
    data_length = (data_length > write_data_length) ?
        write_data_length : data_length;

    if (CircularAreaDivideWrData(circular_area, data_length)
        /*@ where state = state, d0 = data_length, LitMap = LitMap */) {
        /*@ Assert
          exists data_buffer operations readidx writeidx b_status physical,
          circular_area == ca0 && input_buffer == in0 &&
          ca0 != 0 && in0 != 0 && data_buffer != 0 && requested > 0 &&
          b_force != 0 &&
          CircularAreaActualWriteLength(
            ca_capacity(state), requested, ca_contents(state), data_length) &&
          Zlength(input_contents) == requested &&
          0 < data_length && data_length <= requested &&
          CircularAreaStateDivideWrDataResult(state, data_length, 1) &&
          CircularAreaDivideWrDataResult(writeidx, data_length,
                                         ca_capacity(state), 1) &&
          CircularAreaLogicalState(
            readidx, writeidx, ca_capacity(state), b_status,
            ca_contents(state), physical) &&
          GlobalStrings(LitMap) *
          UCharArray::mixed_full(
            data_buffer, ca_capacity(state), physical) *
          UCharArray::full(in0, requested, input_contents) *
          data_at(&write_data_length, uint32, write_data_length) *
          store_ptr(&(ca0->data_buffer), data_buffer) *
          store_uchar(&(ca0->readidx), readidx) *
          store_uchar(&(ca0->writeidx), writeidx) *
          store_ptr(&(ca0->p_head), data_buffer) *
          store_ptr(&(ca0->p_tail),
                    data_buffer + ca_capacity(state)) *
          store_uint(&(ca0->area_length), ca_capacity(state)) *
          store_int(&(ca0->b_status), b_status) *
          store_ptr(&(ca0->CircularAreaOperations), operations)
        */
        uint32 write_len_up = circular_area->area_length -
            circular_area->writeidx;
        uint32 write_len_down = data_length - write_len_up;

        /*@ Assert
          exists data_buffer operations readidx writeidx b_status physical,
          circular_area == ca0 && input_buffer == in0 &&
          ca0 != 0 && in0 != 0 && data_buffer != 0 && requested > 0 &&
          b_force != 0 &&
          CircularAreaActualWriteLength(
            ca_capacity(state), requested, ca_contents(state), data_length) &&
          Zlength(input_contents) == requested &&
          0 < data_length && data_length <= requested &&
          0 <= writeidx && writeidx < ca_capacity(state) &&
          write_len_up == ca_capacity(state) - writeidx &&
          write_len_down == data_length - write_len_up &&
          write_len_up <= data_length &&
          CircularAreaStateDivideWrDataResult(state, data_length, 1) &&
          CircularAreaDivideWrDataResult(writeidx, data_length,
                                         ca_capacity(state), 1) &&
          CircularAreaLogicalState(
            readidx, writeidx, ca_capacity(state), b_status,
            ca_contents(state), physical) &&
          UCharArray::mixed_seg(data_buffer, 0, writeidx,
                                sublist(0, writeidx, physical)) *
          UCharArray::mixed_seg(data_buffer, writeidx, ca_capacity(state),
                                sublist(writeidx, ca_capacity(state),
                                        physical)) *
          UCharArray::seg(input_buffer, 0, write_len_up,
                          sublist(0, write_len_up, input_contents)) *
          UCharArray::seg(input_buffer, write_len_up, requested,
                          sublist(write_len_up, requested, input_contents)) *
          data_at(&write_data_length, uint32, write_data_length) *
          store_ptr(&(ca0->data_buffer), data_buffer) *
          store_uchar(&(ca0->readidx), readidx) *
          store_uchar(&(ca0->writeidx), writeidx) *
          store_ptr(&(ca0->p_head), data_buffer) *
          store_ptr(&(ca0->p_tail),
                    data_buffer + ca_capacity(state)) *
          store_uint(&(ca0->area_length), ca_capacity(state)) *
          store_int(&(ca0->b_status), b_status) *
          store_ptr(&(ca0->CircularAreaOperations), operations) *
          GlobalStrings(LitMap)
        */
        memcpy(&circular_area->data_buffer[circular_area->writeidx],
               input_buffer, write_len_up)
        /*@ where dest_base = circular_area->data_buffer,
                  dest_lo = circular_area->writeidx,
                  dest_hi = circular_area->area_length,
                  src_base = input_buffer, src_lo = 0,
                  src_hi = write_len_up,
                  src_contents = sublist(0, write_len_up, input_contents) */;
        /*@ Assert
          exists data_buffer operations readidx writeidx b_status physical,
          circular_area == ca0 && input_buffer == in0 &&
          ca0 != 0 && in0 != 0 && data_buffer != 0 && requested > 0 &&
          b_force != 0 &&
          CircularAreaActualWriteLength(
            ca_capacity(state), requested, ca_contents(state), data_length) &&
          Zlength(input_contents) == requested &&
          0 <= write_len_down && write_len_down <= writeidx &&
          write_len_up == ca_capacity(state) - writeidx &&
          write_len_down == data_length - write_len_up &&
          CircularAreaStateDivideWrDataResult(state, data_length, 1) &&
          CircularAreaDivideWrDataResult(writeidx, data_length,
                                         ca_capacity(state), 1) &&
          CircularAreaLogicalState(
            readidx, writeidx, ca_capacity(state), b_status,
            ca_contents(state), physical) &&
          UCharArray::mixed_seg(data_buffer, 0, write_len_down,
                                sublist(0, write_len_down, physical)) *
          UCharArray::mixed_seg(data_buffer, write_len_down, writeidx,
                                sublist(write_len_down, writeidx, physical)) *
          UCharArray::mixed_seg(data_buffer, writeidx, ca_capacity(state),
                                CircularAreaSomeBytes(
                                  sublist(0, write_len_up, input_contents))) *
          UCharArray::seg(input_buffer, 0, write_len_up,
                          sublist(0, write_len_up, input_contents)) *
          UCharArray::seg(input_buffer, write_len_up, data_length,
                          sublist(write_len_up, data_length, input_contents)) *
          UCharArray::seg(input_buffer, data_length, requested,
                          sublist(data_length, requested, input_contents)) *
          data_at(&write_data_length, uint32, write_data_length) *
          store_ptr(&(ca0->data_buffer), data_buffer) *
          store_uchar(&(ca0->readidx), readidx) *
          store_uchar(&(ca0->writeidx), writeidx) *
          store_ptr(&(ca0->p_head), data_buffer) *
          store_ptr(&(ca0->p_tail),
                    data_buffer + ca_capacity(state)) *
          store_uint(&(ca0->area_length), ca_capacity(state)) *
          store_int(&(ca0->b_status), b_status) *
          store_ptr(&(ca0->CircularAreaOperations), operations) *
          GlobalStrings(LitMap)
        */
        memcpy(circular_area->p_head, input_buffer + write_len_up,
               write_len_down)
        /*@ where dest_base = circular_area->p_head, dest_lo = 0,
                  dest_hi = write_len_down,
                  src_base = input_buffer, src_lo = write_len_up,
                  src_hi = data_length,
                  src_contents = sublist(write_len_up, data_length,
                                         input_contents) */;

        circular_area->writeidx = write_len_down;
    } else {
        /*@ Assert
          exists data_buffer operations readidx writeidx b_status physical,
          circular_area == ca0 && input_buffer == in0 &&
          ca0 != 0 && in0 != 0 && data_buffer != 0 && requested > 0 &&
          b_force != 0 &&
          CircularAreaActualWriteLength(
            ca_capacity(state), requested, ca_contents(state), data_length) &&
          Zlength(input_contents) == requested &&
          0 <= data_length && data_length <= requested &&
          0 <= writeidx &&
          writeidx + data_length <= ca_capacity(state) &&
          CircularAreaStateDivideWrDataResult(state, data_length, 0) &&
          CircularAreaDivideWrDataResult(writeidx, data_length,
                                         ca_capacity(state), 0) &&
          CircularAreaLogicalState(
            readidx, writeidx, ca_capacity(state), b_status,
            ca_contents(state), physical) &&
          UCharArray::mixed_seg(data_buffer, 0, writeidx,
                                sublist(0, writeidx, physical)) *
          UCharArray::mixed_seg(data_buffer, writeidx,
                                writeidx + data_length,
                                sublist(writeidx, writeidx + data_length,
                                        physical)) *
          UCharArray::mixed_seg(data_buffer, writeidx + data_length,
                                ca_capacity(state),
                                sublist(writeidx + data_length,
                                        ca_capacity(state),
                                        physical)) *
          UCharArray::seg(input_buffer, 0, data_length,
                          sublist(0, data_length, input_contents)) *
          UCharArray::seg(input_buffer, data_length, requested,
                          sublist(data_length, requested, input_contents)) *
          data_at(&write_data_length, uint32, write_data_length) *
          store_ptr(&(ca0->data_buffer), data_buffer) *
          store_uchar(&(ca0->readidx), readidx) *
          store_uchar(&(ca0->writeidx), writeidx) *
          store_ptr(&(ca0->p_head), data_buffer) *
          store_ptr(&(ca0->p_tail),
                    data_buffer + ca_capacity(state)) *
          store_uint(&(ca0->area_length), ca_capacity(state)) *
          store_int(&(ca0->b_status), b_status) *
          store_ptr(&(ca0->CircularAreaOperations), operations) *
          GlobalStrings(LitMap)
        */
        memcpy(&circular_area->data_buffer[circular_area->writeidx],
               input_buffer, data_length)
        /*@ where dest_base = circular_area->data_buffer,
                  dest_lo = circular_area->writeidx,
                  dest_hi = circular_area->writeidx + data_length,
                  src_base = input_buffer, src_lo = 0,
                  src_hi = data_length,
                  src_contents = sublist(0, data_length, input_contents) */;
        circular_area->writeidx =
            (circular_area->writeidx + data_length) %
            circular_area->area_length;
    }

    circular_area->b_status = RET_TRUE;

    if (b_force) {
        circular_area->readidx = circular_area->writeidx;
    }

    return EOK;
}
