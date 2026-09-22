typedef unsigned char uint8_t;
typedef unsigned int uint32_t;

#include "char_array_def.h"

/*@ Import Coq Require Import
      SimpleC.EE.OUTPUT.xizi.xizi_circular_area_write.source.xizi_circular_area_write_lib
 */

/*@ Extern Coq
      (CircularAreaBackingResource :
         Z -> Z -> Z -> Z -> Z -> Z -> Z -> list Z ->
         list (option Z) -> Assertion)
      (CircularAreaLogicalState :
         Z -> Z -> Z -> Z -> list Z -> list (option Z) -> Prop)
      (CircularAreaFullResult : Z -> list Z -> Z -> Prop)
      (CircularAreaDataLengthResult : list Z -> Z -> Prop)
      (CircularAreaDivideWrDataResult : Z -> Z -> Z -> Z -> Prop)
      (CircularAreaActualWriteLength :
         Z -> Z -> list Z -> Z -> Prop)
      (CircularAreaWriteLengthReady :
         Z -> Z -> list Z -> Z -> Z -> Prop)
      (CircularAreaSomeBytes : list Z -> list (option Z))
      (CircularAreaPhysicalWrite :
         list (option Z) -> list Z -> list (option Z) ->
         Z -> Z -> Z -> Prop)
      (CircularAreaWriteSuccess :
         Z -> Z -> Z -> Z -> Z -> list Z -> list Z -> list Z ->
         list (option Z) -> list (option Z) -> Prop)
      (CircularAreaForceWriteEffect :
         Z -> Z -> Z -> Z -> Z -> list Z -> list Z ->
         list (option Z) -> list (option Z) -> Prop)
      (CircularAreaForceWriteResource :
         Z -> Z -> Z -> Z -> Z -> list (option Z) -> Assertion)
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
/*@ With ca0 data_buffer readidx writeidx area_length b_status operations
         logical physical LitMap
    Require circular_area == ca0 && ca0 != 0 && data_buffer != 0 &&
            CircularAreaLogicalState(readidx, writeidx, area_length, b_status,
                                     logical, physical) &&
            GlobalStrings(LitMap) *
            UCharArray::mixed_full(data_buffer, area_length, physical) *
            store_ptr(&(ca0->data_buffer), data_buffer) *
            store_uchar(&(ca0->readidx), readidx) *
            store_uchar(&(ca0->writeidx), writeidx) *
            store_ptr(&(ca0->p_head), data_buffer) *
            store_ptr(&(ca0->p_tail), data_buffer + area_length) *
            store_uint(&(ca0->area_length), area_length) *
            store_int(&(ca0->b_status), b_status) *
            store_ptr(&(ca0->CircularAreaOperations), operations)
    Ensure ca0 != 0 && data_buffer != 0 &&
           CircularAreaFullResult(area_length, logical, __return) &&
           CircularAreaLogicalState(readidx, writeidx, area_length, b_status,
                                    logical, physical) &&
           GlobalStrings(LitMap) *
           UCharArray::mixed_full(data_buffer, area_length, physical) *
           store_ptr(&(ca0->data_buffer), data_buffer) *
           store_uchar(&(ca0->readidx), readidx) *
           store_uchar(&(ca0->writeidx), writeidx) *
           store_ptr(&(ca0->p_head), data_buffer) *
           store_ptr(&(ca0->p_tail), data_buffer + area_length) *
           store_uint(&(ca0->area_length), area_length) *
           store_int(&(ca0->b_status), b_status) *
           store_ptr(&(ca0->CircularAreaOperations), operations)
 */
{
    /*@ Assert
      circular_area == ca0 && ca0 != 0 && data_buffer != 0 &&
      CircularAreaLogicalState(readidx, writeidx, area_length, b_status,
                               logical, physical) &&
      GlobalStrings(LitMap) *
      UCharArray::mixed_full(data_buffer, area_length, physical) *
      store_ptr(&(ca0->data_buffer), data_buffer) *
      store_uchar(&(ca0->readidx), readidx) *
      store_uchar(&(ca0->writeidx), writeidx) *
      store_ptr(&(ca0->p_head), data_buffer) *
      store_ptr(&(ca0->p_tail), data_buffer + area_length) *
      store_uint(&(ca0->area_length), area_length) *
      store_int(&(ca0->b_status), b_status) *
      store_ptr(&(ca0->CircularAreaOperations), operations)
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
/*@ With ca0 data_buffer readidx writeidx area_length b_status operations
         logical physical LitMap
    Require circular_area == ca0 && ca0 != 0 && data_buffer != 0 &&
            CircularAreaLogicalState(readidx, writeidx, area_length, b_status,
                                     logical, physical) &&
            GlobalStrings(LitMap) *
            UCharArray::mixed_full(data_buffer, area_length, physical) *
            store_ptr(&(ca0->data_buffer), data_buffer) *
            store_uchar(&(ca0->readidx), readidx) *
            store_uchar(&(ca0->writeidx), writeidx) *
            store_ptr(&(ca0->p_head), data_buffer) *
            store_ptr(&(ca0->p_tail), data_buffer + area_length) *
            store_uint(&(ca0->area_length), area_length) *
            store_int(&(ca0->b_status), b_status) *
            store_ptr(&(ca0->CircularAreaOperations), operations)
    Ensure ca0 != 0 && data_buffer != 0 &&
           CircularAreaDataLengthResult(logical, __return) &&
           CircularAreaLogicalState(readidx, writeidx, area_length, b_status,
                                    logical, physical) &&
           GlobalStrings(LitMap) *
           UCharArray::mixed_full(data_buffer, area_length, physical) *
           store_ptr(&(ca0->data_buffer), data_buffer) *
           store_uchar(&(ca0->readidx), readidx) *
           store_uchar(&(ca0->writeidx), writeidx) *
           store_ptr(&(ca0->p_head), data_buffer) *
           store_ptr(&(ca0->p_tail), data_buffer + area_length) *
           store_uint(&(ca0->area_length), area_length) *
           store_int(&(ca0->b_status), b_status) *
           store_ptr(&(ca0->CircularAreaOperations), operations)
 */
{
    NULL_PARAM_CHECK(circular_area);

    if (CircularAreaIsFull(circular_area)
        /*@ where ca0 = ca0, data_buffer = data_buffer,
                  readidx = readidx, writeidx = writeidx,
                  area_length = area_length, b_status = b_status,
                  operations = operations, logical = logical,
                  physical = physical, LitMap = LitMap */) {
        /*@ Assert
          circular_area == ca0 && ca0 != 0 && data_buffer != 0 &&
          Zlength(logical) == area_length &&
          CircularAreaLogicalState(readidx, writeidx, area_length, b_status,
                                   logical, physical) &&
          GlobalStrings(LitMap) *
          UCharArray::mixed_full(data_buffer, area_length, physical) *
          store_ptr(&(ca0->data_buffer), data_buffer) *
          store_uchar(&(ca0->readidx), readidx) *
          store_uchar(&(ca0->writeidx), writeidx) *
          store_ptr(&(ca0->p_head), data_buffer) *
          store_ptr(&(ca0->p_tail), data_buffer + area_length) *
          store_uint(&(ca0->area_length), area_length) *
          store_int(&(ca0->b_status), b_status) *
          store_ptr(&(ca0->CircularAreaOperations), operations)
        */
        return circular_area->area_length;
    } else {
        /*@ Assert
          circular_area == ca0 && ca0 != 0 && data_buffer != 0 &&
          Zlength(logical) < area_length &&
          CircularAreaLogicalState(readidx, writeidx, area_length, b_status,
                                   logical, physical) &&
          GlobalStrings(LitMap) *
          UCharArray::mixed_full(data_buffer, area_length, physical) *
          store_ptr(&(ca0->data_buffer), data_buffer) *
          store_uchar(&(ca0->readidx), readidx) *
          store_uchar(&(ca0->writeidx), writeidx) *
          store_ptr(&(ca0->p_head), data_buffer) *
          store_ptr(&(ca0->p_tail), data_buffer + area_length) *
          store_uint(&(ca0->area_length), area_length) *
          store_int(&(ca0->b_status), b_status) *
          store_ptr(&(ca0->CircularAreaOperations), operations)
        */
        return (circular_area->writeidx - circular_area->readidx +
                circular_area->area_length) % circular_area->area_length;
    }
}

static uint32 CircularAreaDivideWrData(CircularAreaType circular_area,
                                       uint32 data_length)
/*@ With ca0 d0 data_buffer readidx writeidx area_length b_status operations
         logical physical LitMap
    Require circular_area == ca0 && data_length == d0 &&
            ca0 != 0 && data_buffer != 0 &&
            0 <= d0 && d0 <= area_length &&
            writeidx + d0 <= UINT_MAX &&
            CircularAreaLogicalState(readidx, writeidx, area_length, b_status,
                                     logical, physical) &&
            GlobalStrings(LitMap) *
            UCharArray::mixed_full(data_buffer, area_length, physical) *
            store_ptr(&(ca0->data_buffer), data_buffer) *
            store_uchar(&(ca0->readidx), readidx) *
            store_uchar(&(ca0->writeidx), writeidx) *
            store_ptr(&(ca0->p_head), data_buffer) *
            store_ptr(&(ca0->p_tail), data_buffer + area_length) *
            store_uint(&(ca0->area_length), area_length) *
            store_int(&(ca0->b_status), b_status) *
            store_ptr(&(ca0->CircularAreaOperations), operations)
    Ensure ca0 != 0 && data_buffer != 0 &&
           CircularAreaDivideWrDataResult(writeidx, d0, area_length,
                                          __return) &&
           CircularAreaLogicalState(readidx, writeidx, area_length, b_status,
                                    logical, physical) &&
           GlobalStrings(LitMap) *
           UCharArray::mixed_full(data_buffer, area_length, physical) *
           store_ptr(&(ca0->data_buffer), data_buffer) *
           store_uchar(&(ca0->readidx), readidx) *
           store_uchar(&(ca0->writeidx), writeidx) *
           store_ptr(&(ca0->p_head), data_buffer) *
           store_ptr(&(ca0->p_tail), data_buffer + area_length) *
           store_uint(&(ca0->area_length), area_length) *
           store_int(&(ca0->b_status), b_status) *
           store_ptr(&(ca0->CircularAreaOperations), operations)
 */
{
    /*@ Assert
      circular_area == ca0 && data_length == d0 &&
      ca0 != 0 && data_buffer != 0 &&
      0 <= d0 && d0 <= area_length && writeidx + d0 <= UINT_MAX &&
      CircularAreaLogicalState(readidx, writeidx, area_length, b_status,
                               logical, physical) &&
      GlobalStrings(LitMap) *
      UCharArray::mixed_full(data_buffer, area_length, physical) *
      store_ptr(&(ca0->data_buffer), data_buffer) *
      store_uchar(&(ca0->readidx), readidx) *
      store_uchar(&(ca0->writeidx), writeidx) *
      store_ptr(&(ca0->p_head), data_buffer) *
      store_ptr(&(ca0->p_tail), data_buffer + area_length) *
      store_uint(&(ca0->area_length), area_length) *
      store_int(&(ca0->b_status), b_status) *
      store_ptr(&(ca0->CircularAreaOperations), operations)
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
/*@ With ca0 in0 data_buffer readidx writeidx area_length b_status operations
         logical physical requested force0 input_contents LitMap
    Require
      circular_area == ca0 && input_buffer == in0 &&
      data_length == requested && b_force == force0 &&
      0 <= requested && requested <= UINT_MAX &&
      GlobalStrings(LitMap) *
      ((ca0 == 0 && emp) ||
       (ca0 != 0 &&
        CircularAreaBackingResource(ca0, data_buffer, readidx, writeidx,
                                    area_length, b_status, operations,
                                    logical, physical) *
        ((in0 == 0 && emp) ||
         (in0 != 0 && Zlength(input_contents) == requested &&
          UCharArray::full(in0, requested, input_contents)))))
    Ensure
      GlobalStrings(LitMap) *
      ((ca0 == 0 && CircularAreaErrorResult(__return) && emp) ||
       (ca0 != 0 && in0 == 0 && CircularAreaErrorResult(__return) &&
        CircularAreaBackingResource(ca0, data_buffer, readidx, writeidx,
                                    area_length, b_status, operations,
                                    logical, physical)) ||
       (ca0 != 0 && in0 != 0 &&
        (requested == 0 ||
         (force0 == 0 && Zlength(logical) == area_length)) &&
        CircularAreaErrorResult(__return) &&
        CircularAreaBackingResource(ca0, data_buffer, readidx, writeidx,
                                    area_length, b_status, operations,
                                    logical, physical) *
        UCharArray::full(in0, requested, input_contents)) ||
       (exists actual new_writeidx logical_after physical_after,
        ca0 != 0 && in0 != 0 && requested > 0 && force0 == 0 &&
        CircularAreaWriteSuccess(area_length, writeidx, requested, actual,
                                 new_writeidx, logical, input_contents,
                                 logical_after, physical, physical_after) &&
        __return == 0 &&
        CircularAreaBackingResource(ca0, data_buffer, readidx, new_writeidx,
                                    area_length, 1, operations,
                                    logical_after, physical_after) *
        UCharArray::full(in0, requested, input_contents)) ||
       (exists actual new_writeidx physical_after,
        ca0 != 0 && in0 != 0 && requested > 0 && force0 != 0 &&
        CircularAreaForceWriteEffect(area_length, writeidx, requested, actual,
                                     new_writeidx, logical, input_contents,
                                     physical, physical_after) &&
        __return == 0 &&
        CircularAreaForceWriteResource(ca0, data_buffer, new_writeidx,
                                       area_length, operations,
                                       physical_after) *
        UCharArray::full(in0, requested, input_contents)))
 */
{
    NULL_PARAM_CHECK(circular_area);
    NULL_PARAM_CHECK(input_buffer);
    CHECK(data_length > 0);

    /*@ Assert
      circular_area == ca0 && input_buffer == in0 &&
      ca0 != 0 && in0 != 0 && data_buffer != 0 && requested > 0 &&
      data_length == requested && b_force == force0 &&
      Zlength(input_contents) == requested &&
      CircularAreaLogicalState(readidx, writeidx, area_length, b_status,
                               logical, physical) &&
      GlobalStrings(LitMap) *
      UCharArray::mixed_full(data_buffer, area_length, physical) *
      UCharArray::full(in0, requested, input_contents) *
      store_ptr(&(ca0->data_buffer), data_buffer) *
      store_uchar(&(ca0->readidx), readidx) *
      store_uchar(&(ca0->writeidx), writeidx) *
      store_ptr(&(ca0->p_head), data_buffer) *
      store_ptr(&(ca0->p_tail), data_buffer + area_length) *
      store_uint(&(ca0->area_length), area_length) *
      store_int(&(ca0->b_status), b_status) *
      store_ptr(&(ca0->CircularAreaOperations), operations)
    */

    if (CircularAreaIsFull(circular_area)
        /*@ where ca0 = ca0, data_buffer = data_buffer,
                  readidx = readidx, writeidx = writeidx,
                  area_length = area_length, b_status = b_status,
                  operations = operations, logical = logical,
                  physical = physical, LitMap = LitMap */ && !b_force) {
        return ERROR;
    }

    /*@ Assert
      exists full_result,
      circular_area == ca0 && input_buffer == in0 &&
      ca0 != 0 && in0 != 0 && data_buffer != 0 && requested > 0 &&
      data_length == requested && b_force == force0 &&
      CircularAreaFullResult(area_length, logical, full_result) &&
      !(full_result != 0 && force0 == 0) &&
      (force0 == 0 => Zlength(logical) < area_length) &&
      Zlength(input_contents) == requested &&
      CircularAreaLogicalState(readidx, writeidx, area_length, b_status,
                               logical, physical) &&
      GlobalStrings(LitMap) *
      UCharArray::mixed_full(data_buffer, area_length, physical) *
      UCharArray::full(in0, requested, input_contents) *
      store_ptr(&(ca0->data_buffer), data_buffer) *
      store_uchar(&(ca0->readidx), readidx) *
      store_uchar(&(ca0->writeidx), writeidx) *
      store_ptr(&(ca0->p_head), data_buffer) *
      store_ptr(&(ca0->p_tail), data_buffer + area_length) *
      store_uint(&(ca0->area_length), area_length) *
      store_int(&(ca0->b_status), b_status) *
      store_ptr(&(ca0->CircularAreaOperations), operations)
    */

    uint32 write_data_length = circular_area->area_length -
        CircularAreaGetDataLength(circular_area)
        /*@ where ca0 = ca0, data_buffer = data_buffer,
                  readidx = readidx, writeidx = writeidx,
                  area_length = area_length, b_status = b_status,
                  operations = operations, logical = logical,
                  physical = physical, LitMap = LitMap */;
    data_length = (data_length > write_data_length) ?
        write_data_length : data_length;

    if (CircularAreaDivideWrData(circular_area, data_length)
        /*@ where ca0 = ca0, d0 = data_length,
                  data_buffer = data_buffer, readidx = readidx,
                  writeidx = writeidx, area_length = area_length,
                  b_status = b_status, operations = operations,
                  logical = logical, physical = physical,
                  LitMap = LitMap */) {
        /*@ Assert
          circular_area == ca0 && input_buffer == in0 &&
          ca0 != 0 && in0 != 0 && data_buffer != 0 && requested > 0 &&
          b_force == force0 &&
          CircularAreaWriteLengthReady(area_length, requested, logical,
                                       data_length, force0) &&
          Zlength(input_contents) == requested &&
          0 <= data_length && data_length <= requested &&
          CircularAreaDivideWrDataResult(writeidx, data_length,
                                         area_length, 1) &&
          CircularAreaLogicalState(readidx, writeidx, area_length, b_status,
                                   logical, physical) &&
          GlobalStrings(LitMap) *
          UCharArray::mixed_full(data_buffer, area_length, physical) *
          UCharArray::full(in0, requested, input_contents) *
          data_at(&write_data_length, uint32, write_data_length) *
          store_ptr(&(ca0->data_buffer), data_buffer) *
          store_uchar(&(ca0->readidx), readidx) *
          store_uchar(&(ca0->writeidx), writeidx) *
          store_ptr(&(ca0->p_head), data_buffer) *
          store_ptr(&(ca0->p_tail), data_buffer + area_length) *
          store_uint(&(ca0->area_length), area_length) *
          store_int(&(ca0->b_status), b_status) *
          store_ptr(&(ca0->CircularAreaOperations), operations)
        */
        uint32 write_len_up = circular_area->area_length -
            circular_area->writeidx;
        uint32 write_len_down = data_length - write_len_up;

        /*@ Assert
          circular_area == ca0 && input_buffer == in0 &&
          ca0 != 0 && in0 != 0 && data_buffer != 0 && requested > 0 &&
          b_force == force0 &&
          CircularAreaWriteLengthReady(area_length, requested, logical,
                                       data_length, force0) &&
          Zlength(input_contents) == requested &&
          0 <= data_length && data_length <= requested &&
          0 <= writeidx && writeidx < area_length &&
          write_len_up == area_length - writeidx &&
          write_len_down == data_length - write_len_up &&
          write_len_up <= data_length &&
          CircularAreaDivideWrDataResult(writeidx, data_length,
                                         area_length, 1) &&
          CircularAreaLogicalState(readidx, writeidx, area_length, b_status,
                                   logical, physical) &&
          UCharArray::mixed_seg(data_buffer, 0, writeidx,
                                sublist(0, writeidx, physical)) *
          UCharArray::mixed_seg(data_buffer, writeidx, area_length,
                                sublist(writeidx, area_length, physical)) *
          UCharArray::seg(input_buffer, 0, write_len_up,
                          sublist(0, write_len_up, input_contents)) *
          UCharArray::seg(input_buffer, write_len_up, requested,
                          sublist(write_len_up, requested, input_contents)) *
          data_at(&write_data_length, uint32, write_data_length) *
          store_ptr(&(ca0->data_buffer), data_buffer) *
          store_uchar(&(ca0->readidx), readidx) *
          store_uchar(&(ca0->writeidx), writeidx) *
          store_ptr(&(ca0->p_head), data_buffer) *
          store_ptr(&(ca0->p_tail), data_buffer + area_length) *
          store_uint(&(ca0->area_length), area_length) *
          store_int(&(ca0->b_status), b_status) *
          store_ptr(&(ca0->CircularAreaOperations), operations) *
          GlobalStrings(LitMap)
        */
        memcpy(&circular_area->data_buffer[circular_area->writeidx],
               input_buffer, write_len_up)
        /*@ where dest_base = data_buffer, dest_lo = writeidx,
                  dest_hi = area_length,
                  src_base = input_buffer, src_lo = 0,
                  src_hi = write_len_up,
                  dest_before = sublist(writeidx, area_length, physical),
                  src_contents = sublist(0, write_len_up, input_contents) */;
        /*@ Assert
          circular_area == ca0 && input_buffer == in0 &&
          ca0 != 0 && in0 != 0 && data_buffer != 0 && requested > 0 &&
          b_force == force0 &&
          CircularAreaWriteLengthReady(area_length, requested, logical,
                                       data_length, force0) &&
          Zlength(input_contents) == requested &&
          0 <= write_len_down && write_len_down <= writeidx &&
          write_len_up == area_length - writeidx &&
          write_len_down == data_length - write_len_up &&
          CircularAreaDivideWrDataResult(writeidx, data_length,
                                         area_length, 1) &&
          CircularAreaLogicalState(readidx, writeidx, area_length, b_status,
                                   logical, physical) &&
          UCharArray::mixed_seg(data_buffer, 0, write_len_down,
                                sublist(0, write_len_down, physical)) *
          UCharArray::mixed_seg(data_buffer, write_len_down, writeidx,
                                sublist(write_len_down, writeidx, physical)) *
          UCharArray::mixed_seg(data_buffer, writeidx, area_length,
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
          store_ptr(&(ca0->p_tail), data_buffer + area_length) *
          store_uint(&(ca0->area_length), area_length) *
          store_int(&(ca0->b_status), b_status) *
          store_ptr(&(ca0->CircularAreaOperations), operations) *
          GlobalStrings(LitMap)
        */
        memcpy(circular_area->p_head, input_buffer + write_len_up,
               write_len_down)
        /*@ where dest_base = data_buffer, dest_lo = 0,
                  dest_hi = write_len_down,
                  src_base = input_buffer, src_lo = write_len_up,
                  src_hi = data_length,
                  dest_before = sublist(0, write_len_down, physical),
                  src_contents = sublist(write_len_up, data_length,
                                         input_contents) */;

        circular_area->writeidx = write_len_down;
    } else {
        /*@ Assert
          circular_area == ca0 && input_buffer == in0 &&
          ca0 != 0 && in0 != 0 && data_buffer != 0 && requested > 0 &&
          b_force == force0 &&
          CircularAreaWriteLengthReady(area_length, requested, logical,
                                       data_length, force0) &&
          Zlength(input_contents) == requested &&
          0 <= data_length && data_length <= requested &&
          0 <= writeidx && writeidx + data_length <= area_length &&
          CircularAreaDivideWrDataResult(writeidx, data_length,
                                         area_length, 0) &&
          CircularAreaLogicalState(readidx, writeidx, area_length, b_status,
                                   logical, physical) &&
          UCharArray::mixed_seg(data_buffer, 0, writeidx,
                                sublist(0, writeidx, physical)) *
          UCharArray::mixed_seg(data_buffer, writeidx,
                                writeidx + data_length,
                                sublist(writeidx, writeidx + data_length,
                                        physical)) *
          UCharArray::mixed_seg(data_buffer, writeidx + data_length,
                                area_length,
                                sublist(writeidx + data_length, area_length,
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
          store_ptr(&(ca0->p_tail), data_buffer + area_length) *
          store_uint(&(ca0->area_length), area_length) *
          store_int(&(ca0->b_status), b_status) *
          store_ptr(&(ca0->CircularAreaOperations), operations) *
          GlobalStrings(LitMap)
        */
        memcpy(&circular_area->data_buffer[circular_area->writeidx],
               input_buffer, data_length)
        /*@ where dest_base = data_buffer, dest_lo = writeidx,
                  dest_hi = writeidx + data_length,
                  src_base = input_buffer, src_lo = 0,
                  src_hi = data_length,
                  dest_before = sublist(writeidx, writeidx + data_length,
                                        physical),
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
