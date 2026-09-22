typedef unsigned char uint8_t;
typedef unsigned int uint32_t;

#include "char_array_def.h"

/*@ Import Coq Require Import
      SimpleC.EE.OUTPUT.xizi.xizi_circular_area_write.source.xizi_circular_area_write_lib
 */

/*@ Extern Coq
      (CircularAreaIsFullResult : Z -> Z -> Z -> Z -> Prop)
      (CircularAreaDataLengthResult : Z -> Z -> Z -> Z -> Z -> Prop)
      (CircularAreaDivideWrDataResult : Z -> Z -> Z -> Z -> Prop)
      (CircularAreaDescriptorState : Z -> Z -> Z -> Z -> list Z -> Prop)
      (CircularAreaActualWriteLength : Z -> Z -> Z -> Z -> Z -> Z -> Prop)
      (CircularAreaWriteSuccess : Z -> Z -> Z -> Z -> Z -> Z ->
                                  list Z -> list Z -> list Z ->
                                  Z -> Z -> Z -> Z -> Prop)
      (UCharArray::seg : Z -> Z -> Z -> list Z -> Assertion)
 */

typedef uint8_t uint8;
typedef uint32_t uint32;
typedef int x_bool;
struct CircularArea;
typedef struct CircularArea *CircularAreaType;

uint8 *memcpy(uint8 *dest, uint8 *src, uint32 count)
/*@ With dest_base dest_lo dest_hi src_base src_lo src_hi
          (dest_before : list Z) (src_contents : list Z)
    Require
      dest == dest_base + dest_lo &&
      src == src_base + src_lo &&
      count == dest_hi - dest_lo &&
      count == src_hi - src_lo &&
      Zlength(dest_before) == dest_hi - dest_lo &&
      Zlength(src_contents) == src_hi - src_lo &&
      UCharArray::seg(dest_base, dest_lo, dest_hi, dest_before) *
      UCharArray::seg(src_base, src_lo, src_hi, src_contents)
    Ensure
      __return == dest &&
      UCharArray::seg(dest_base, dest_lo, dest_hi, src_contents) *
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
/*@ circular_area_is_full_callable <= circular_area_is_full_body
    With data_buffer readidx writeidx p_head p_tail area_length b_status LitMap
         operations (contents : list Z)
    Require circular_area != 0 &&
            0 < area_length && area_length <= 256 &&
            0 <= readidx && readidx <= 255 && readidx < area_length &&
            0 <= writeidx && writeidx <= 255 && writeidx < area_length &&
            p_head == data_buffer && p_tail == data_buffer + area_length &&
            Zlength(contents) == area_length &&
            data_at(&(circular_area->data_buffer), uint8 *, data_buffer) *
            data_at(&(circular_area->readidx), uint8, readidx) *
            data_at(&(circular_area->writeidx), uint8, writeidx) *
            data_at(&(circular_area->p_head), uint8 *, p_head) *
            data_at(&(circular_area->p_tail), uint8 *, p_tail) *
            data_at(&(circular_area->area_length), uint32, area_length) *
            data_at(&(circular_area->b_status), x_bool, b_status) *
            data_at(&(circular_area->CircularAreaOperations), struct CircularAreaOps *, operations) *
            UCharArray::full(data_buffer, area_length, contents) *
            GlobalStrings(LitMap)
    Ensure CircularAreaIsFullResult(readidx, writeidx, b_status, __return) &&
           0 <= __return && __return <= 1 &&
           data_at(&(circular_area->data_buffer), uint8 *, data_buffer) *
           data_at(&(circular_area->readidx), uint8, readidx) *
           data_at(&(circular_area->writeidx), uint8, writeidx) *
           data_at(&(circular_area->p_head), uint8 *, p_head) *
           data_at(&(circular_area->p_tail), uint8 *, p_tail) *
           data_at(&(circular_area->area_length), uint32, area_length) *
           data_at(&(circular_area->b_status), x_bool, b_status) *
           data_at(&(circular_area->CircularAreaOperations), struct CircularAreaOps *, operations) *
           UCharArray::full(data_buffer, area_length, contents) *
           GlobalStrings(LitMap)
 */;

x_bool CircularAreaIsFull(CircularAreaType circular_area)
/*@ circular_area_is_full_body
    With data_buffer readidx writeidx p_head p_tail area_length b_status LitMap
         operations (contents : list Z)
    Require (circular_area == 0 && emp) ||
            (circular_area != 0 &&
             0 < area_length && area_length <= 256 &&
             0 <= readidx && readidx <= 255 && readidx < area_length &&
             0 <= writeidx && writeidx <= 255 && writeidx < area_length &&
             p_head == data_buffer && p_tail == data_buffer + area_length &&
             Zlength(contents) == area_length &&
             data_at(&(circular_area->data_buffer), uint8 *, data_buffer) *
             data_at(&(circular_area->readidx), uint8, readidx) *
             data_at(&(circular_area->writeidx), uint8, writeidx) *
             data_at(&(circular_area->p_head), uint8 *, p_head) *
             data_at(&(circular_area->p_tail), uint8 *, p_tail) *
             data_at(&(circular_area->area_length), uint32, area_length) *
             data_at(&(circular_area->b_status), x_bool, b_status) *
             data_at(&(circular_area->CircularAreaOperations), struct CircularAreaOps *, operations) *
             UCharArray::full(data_buffer, area_length, contents) *
             GlobalStrings(LitMap))
    Ensure (circular_area == 0 && __return == 1 && emp) ||
           (circular_area != 0 &&
            CircularAreaIsFullResult(readidx, writeidx, b_status, __return) &&
            0 <= __return && __return <= 1 &&
            data_at(&(circular_area->data_buffer), uint8 *, data_buffer) *
            data_at(&(circular_area->readidx), uint8, readidx) *
            data_at(&(circular_area->writeidx), uint8, writeidx) *
            data_at(&(circular_area->p_head), uint8 *, p_head) *
            data_at(&(circular_area->p_tail), uint8 *, p_tail) *
            data_at(&(circular_area->area_length), uint32, area_length) *
            data_at(&(circular_area->b_status), x_bool, b_status) *
            data_at(&(circular_area->CircularAreaOperations), struct CircularAreaOps *, operations) *
            UCharArray::full(data_buffer, area_length, contents) *
            GlobalStrings(LitMap))
 */
{
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
/*@ circular_area_data_length_callable <= circular_area_data_length_body
    With data_buffer readidx writeidx p_head p_tail area_length b_status LitMap
         operations (contents : list Z)
    Require circular_area != 0 &&
            0 < area_length && area_length <= 256 &&
            0 <= readidx && readidx <= 255 && readidx < area_length &&
            0 <= writeidx && writeidx <= 255 && writeidx < area_length &&
            p_head == data_buffer && p_tail == data_buffer + area_length &&
            Zlength(contents) == area_length &&
            data_at(&(circular_area->data_buffer), uint8 *, data_buffer) *
            data_at(&(circular_area->readidx), uint8, readidx) *
            data_at(&(circular_area->writeidx), uint8, writeidx) *
            data_at(&(circular_area->p_head), uint8 *, p_head) *
            data_at(&(circular_area->p_tail), uint8 *, p_tail) *
            data_at(&(circular_area->area_length), uint32, area_length) *
            data_at(&(circular_area->b_status), x_bool, b_status) *
            data_at(&(circular_area->CircularAreaOperations), struct CircularAreaOps *, operations) *
            UCharArray::full(data_buffer, area_length, contents) *
            GlobalStrings(LitMap)
    Ensure CircularAreaDataLengthResult(readidx, writeidx, area_length,
                                        b_status, __return) &&
           0 <= __return && __return <= area_length &&
           data_at(&(circular_area->data_buffer), uint8 *, data_buffer) *
           data_at(&(circular_area->readidx), uint8, readidx) *
           data_at(&(circular_area->writeidx), uint8, writeidx) *
           data_at(&(circular_area->p_head), uint8 *, p_head) *
           data_at(&(circular_area->p_tail), uint8 *, p_tail) *
           data_at(&(circular_area->area_length), uint32, area_length) *
           data_at(&(circular_area->b_status), x_bool, b_status) *
           data_at(&(circular_area->CircularAreaOperations), struct CircularAreaOps *, operations) *
           UCharArray::full(data_buffer, area_length, contents) *
           GlobalStrings(LitMap)
 */;

uint32 CircularAreaGetDataLength(CircularAreaType circular_area)
/*@ circular_area_data_length_body
    With data_buffer readidx writeidx p_head p_tail area_length b_status LitMap
         operations (contents : list Z)
    Require (circular_area == 0 && emp) ||
            (circular_area != 0 &&
             0 < area_length && area_length <= 256 &&
             0 <= readidx && readidx <= 255 && readidx < area_length &&
             0 <= writeidx && writeidx <= 255 && writeidx < area_length &&
             p_head == data_buffer && p_tail == data_buffer + area_length &&
             Zlength(contents) == area_length &&
             data_at(&(circular_area->data_buffer), uint8 *, data_buffer) *
             data_at(&(circular_area->readidx), uint8, readidx) *
             data_at(&(circular_area->writeidx), uint8, writeidx) *
             data_at(&(circular_area->p_head), uint8 *, p_head) *
             data_at(&(circular_area->p_tail), uint8 *, p_tail) *
             data_at(&(circular_area->area_length), uint32, area_length) *
             data_at(&(circular_area->b_status), x_bool, b_status) *
             data_at(&(circular_area->CircularAreaOperations), struct CircularAreaOps *, operations) *
             UCharArray::full(data_buffer, area_length, contents) *
             GlobalStrings(LitMap))
    Ensure (circular_area == 0 && __return == 1 && emp) ||
           (circular_area != 0 &&
            CircularAreaDataLengthResult(readidx, writeidx, area_length,
                                         b_status, __return) &&
            0 <= __return && __return <= area_length &&
            data_at(&(circular_area->data_buffer), uint8 *, data_buffer) *
            data_at(&(circular_area->readidx), uint8, readidx) *
            data_at(&(circular_area->writeidx), uint8, writeidx) *
            data_at(&(circular_area->p_head), uint8 *, p_head) *
            data_at(&(circular_area->p_tail), uint8 *, p_tail) *
            data_at(&(circular_area->area_length), uint32, area_length) *
            data_at(&(circular_area->b_status), x_bool, b_status) *
            data_at(&(circular_area->CircularAreaOperations), struct CircularAreaOps *, operations) *
            UCharArray::full(data_buffer, area_length, contents) *
            GlobalStrings(LitMap))
 */
{
    NULL_PARAM_CHECK(circular_area);

    if (CircularAreaIsFull(circular_area) /*@ where (circular_area_is_full_callable) */) {
        return circular_area->area_length;
    } else {
        return (circular_area->writeidx - circular_area->readidx +
                circular_area->area_length) % circular_area->area_length;
    }
}

static uint32 CircularAreaDivideWrData(CircularAreaType circular_area,
                                       uint32 data_length)
/*@ circular_area_divide_wr_data_callable
    With data_buffer readidx writeidx p_head p_tail area_length b_status
         operations (contents : list Z)
    Require circular_area != 0 &&
            0 < area_length && area_length <= 256 &&
            0 <= readidx && readidx <= 255 && readidx < area_length &&
            0 <= writeidx && writeidx <= 255 && writeidx < area_length &&
            p_head == data_buffer && p_tail == data_buffer + area_length &&
            Zlength(contents) == area_length &&
            0 <= data_length && data_length <= area_length &&
            writeidx + data_length <= 4294967295 &&
            data_at(&(circular_area->data_buffer), uint8 *, data_buffer) *
            data_at(&(circular_area->readidx), uint8, readidx) *
            data_at(&(circular_area->writeidx), uint8, writeidx) *
            data_at(&(circular_area->p_head), uint8 *, p_head) *
            data_at(&(circular_area->p_tail), uint8 *, p_tail) *
            data_at(&(circular_area->area_length), uint32, area_length) *
            data_at(&(circular_area->b_status), x_bool, b_status) *
            data_at(&(circular_area->CircularAreaOperations), struct CircularAreaOps *, operations) *
            UCharArray::full(data_buffer, area_length, contents)
    Ensure CircularAreaDivideWrDataResult(writeidx, data_length,
                                          area_length, __return) &&
           0 <= __return && __return <= 1 &&
           data_at(&(circular_area->data_buffer), uint8 *, data_buffer) *
           data_at(&(circular_area->readidx), uint8, readidx) *
           data_at(&(circular_area->writeidx), uint8, writeidx) *
           data_at(&(circular_area->p_head), uint8 *, p_head) *
           data_at(&(circular_area->p_tail), uint8 *, p_tail) *
           data_at(&(circular_area->area_length), uint32, area_length) *
           data_at(&(circular_area->b_status), x_bool, b_status) *
           data_at(&(circular_area->CircularAreaOperations), struct CircularAreaOps *, operations) *
           UCharArray::full(data_buffer, area_length, contents)
 */
{
    NULL_PARAM_CHECK(circular_area);

    if (circular_area->writeidx + data_length <= circular_area->area_length) {
        return RET_FALSE;
    } else {
        return RET_TRUE;
    }
}

uint32 CircularAreaWrite(CircularAreaType circular_area, uint8 *input_buffer,
                         uint32 data_length, x_bool b_force)
/*@ With data_buffer readidx writeidx p_head p_tail area_length b_status LitMap
         operations requested force0 circular_area_entry input_buffer_entry
         (contents : list Z) (input_contents : list Z)
    Require
      circular_area == circular_area_entry &&
      input_buffer == input_buffer_entry &&
      data_length == requested && b_force == force0 &&
      ((circular_area == 0 && emp) ||
      (circular_area != 0 && input_buffer == 0 &&
       0 < area_length && area_length <= 256 &&
       0 <= readidx && readidx <= 255 && readidx < area_length &&
       0 <= writeidx && writeidx <= 255 && writeidx < area_length &&
       p_head == data_buffer && p_tail == data_buffer + area_length &&
       Zlength(contents) == area_length &&
       data_at(&(circular_area->data_buffer), uint8 *, data_buffer) *
       data_at(&(circular_area->readidx), uint8, readidx) *
       data_at(&(circular_area->writeidx), uint8, writeidx) *
       data_at(&(circular_area->p_head), uint8 *, p_head) *
       data_at(&(circular_area->p_tail), uint8 *, p_tail) *
       data_at(&(circular_area->area_length), uint32, area_length) *
       data_at(&(circular_area->b_status), x_bool, b_status) *
       data_at(&(circular_area->CircularAreaOperations), struct CircularAreaOps *, operations) *
       UCharArray::full(data_buffer, area_length, contents)) ||
      (circular_area != 0 && input_buffer != 0 &&
       0 < area_length && area_length <= 256 &&
       0 <= readidx && readidx <= 255 && readidx < area_length &&
       0 <= writeidx && writeidx <= 255 && writeidx < area_length &&
       p_head == data_buffer && p_tail == data_buffer + area_length &&
       Zlength(contents) == area_length &&
       Zlength(input_contents) == requested &&
       data_at(&(circular_area->data_buffer), uint8 *, data_buffer) *
       data_at(&(circular_area->readidx), uint8, readidx) *
       data_at(&(circular_area->writeidx), uint8, writeidx) *
       data_at(&(circular_area->p_head), uint8 *, p_head) *
       data_at(&(circular_area->p_tail), uint8 *, p_tail) *
       data_at(&(circular_area->area_length), uint32, area_length) *
       data_at(&(circular_area->b_status), x_bool, b_status) *
       data_at(&(circular_area->CircularAreaOperations), struct CircularAreaOps *, operations) *
       UCharArray::full(data_buffer, area_length, contents) *
       UCharArray::full(input_buffer, requested, input_contents) *
       GlobalStrings(LitMap)))
    Ensure
      (circular_area == 0 && __return == 1 && emp) ||
      (circular_area != 0 && input_buffer == 0 && __return == 1 &&
       data_at(&(circular_area->data_buffer), uint8 *, data_buffer) *
       data_at(&(circular_area->readidx), uint8, readidx) *
       data_at(&(circular_area->writeidx), uint8, writeidx) *
       data_at(&(circular_area->p_head), uint8 *, p_head) *
       data_at(&(circular_area->p_tail), uint8 *, p_tail) *
       data_at(&(circular_area->area_length), uint32, area_length) *
       data_at(&(circular_area->b_status), x_bool, b_status) *
       data_at(&(circular_area->CircularAreaOperations), struct CircularAreaOps *, operations) *
       UCharArray::full(data_buffer, area_length, contents)) ||
      (circular_area != 0 && input_buffer != 0 && requested == 0 &&
       __return == 1 &&
       data_at(&(circular_area->data_buffer), uint8 *, data_buffer) *
       data_at(&(circular_area->readidx), uint8, readidx) *
       data_at(&(circular_area->writeidx), uint8, writeidx) *
       data_at(&(circular_area->p_head), uint8 *, p_head) *
       data_at(&(circular_area->p_tail), uint8 *, p_tail) *
       data_at(&(circular_area->area_length), uint32, area_length) *
       data_at(&(circular_area->b_status), x_bool, b_status) *
       data_at(&(circular_area->CircularAreaOperations), struct CircularAreaOps *, operations) *
       UCharArray::full(data_buffer, area_length, contents) *
       UCharArray::full(input_buffer, requested, input_contents) *
       GlobalStrings(LitMap)) ||
      (circular_area != 0 && input_buffer != 0 && requested > 0 &&
       readidx == writeidx && b_status != 0 && force0 == 0 &&
       __return == 1 &&
       data_at(&(circular_area->data_buffer), uint8 *, data_buffer) *
       data_at(&(circular_area->readidx), uint8, readidx) *
       data_at(&(circular_area->writeidx), uint8, writeidx) *
       data_at(&(circular_area->p_head), uint8 *, p_head) *
       data_at(&(circular_area->p_tail), uint8 *, p_tail) *
       data_at(&(circular_area->area_length), uint32, area_length) *
       data_at(&(circular_area->b_status), x_bool, b_status) *
       data_at(&(circular_area->CircularAreaOperations), struct CircularAreaOps *, operations) *
       UCharArray::full(data_buffer, area_length, contents) *
       UCharArray::full(input_buffer, requested, input_contents) *
       GlobalStrings(LitMap)) ||
      (exists contents_after readidx_after writeidx_after status_after,
       circular_area_entry != 0 && input_buffer_entry != 0 && requested > 0 &&
       !(readidx == writeidx && b_status != 0 && force0 == 0) &&
       CircularAreaWriteSuccess(readidx, writeidx, area_length, b_status,
                                requested, force0, input_contents,
                                contents, contents_after, readidx_after,
                                writeidx_after, status_after, __return) &&
       data_at(&(circular_area_entry->data_buffer), uint8 *, data_buffer) *
       data_at(&(circular_area_entry->readidx), uint8, readidx_after) *
       data_at(&(circular_area_entry->writeidx), uint8, writeidx_after) *
       data_at(&(circular_area_entry->p_head), uint8 *, p_head) *
       data_at(&(circular_area_entry->p_tail), uint8 *, p_tail) *
       data_at(&(circular_area_entry->area_length), uint32, area_length) *
       data_at(&(circular_area_entry->b_status), x_bool, status_after) *
       data_at(&(circular_area_entry->CircularAreaOperations), struct CircularAreaOps *, operations) *
       UCharArray::full(data_buffer, area_length, contents_after) *
       UCharArray::full(input_buffer_entry, requested, input_contents) *
       GlobalStrings(LitMap))
 */
{
    NULL_PARAM_CHECK(circular_area);
    NULL_PARAM_CHECK(input_buffer);
    CHECK(data_length > 0);

    if (CircularAreaIsFull(circular_area) /*@ where (circular_area_is_full_callable) */ && !b_force) {
        return ERROR;
    }

    uint32 write_data_length = circular_area->area_length -
        CircularAreaGetDataLength(circular_area) /*@ where (circular_area_data_length_callable) */;
    data_length = (data_length > write_data_length) ?
        write_data_length : data_length;

    if (CircularAreaDivideWrData(circular_area, data_length) /*@ where (circular_area_divide_wr_data_callable) */) {
        uint32 write_len_up = circular_area->area_length -
            circular_area->writeidx;
        uint32 write_len_down = data_length - write_len_up;

        /*@ Assert
          circular_area != 0 && input_buffer != 0 && requested > 0 &&
          circular_area == circular_area_entry &&
          input_buffer == input_buffer_entry &&
          b_force == force0 && 0 < area_length &&
          !(readidx == writeidx && b_status != 0 && force0 == 0) &&
          CircularAreaActualWriteLength(readidx, writeidx, area_length,
                                        b_status, requested, data_length) &&
          Zlength(input_contents) == requested &&
          0 <= data_length && data_length <= requested &&
          0 <= writeidx && writeidx < area_length &&
          write_len_up == area_length - writeidx &&
          write_len_down == data_length - write_len_up &&
          write_len_up <= data_length &&
          CircularAreaDivideWrDataResult(writeidx, data_length,
                                         area_length, 1) &&
          p_head == data_buffer &&
          p_tail == data_buffer + area_length &&
          CircularAreaDescriptorState(readidx, writeidx, area_length,
                                      b_status, contents) &&
          UCharArray::seg(data_buffer, 0, writeidx,
                          sublist(0, writeidx, contents)) *
          UCharArray::seg(data_buffer, writeidx, area_length,
                          sublist(writeidx, area_length, contents)) *
          UCharArray::seg(input_buffer, 0, write_len_up,
                          sublist(0, write_len_up, input_contents)) *
          UCharArray::seg(input_buffer, write_len_up, requested,
                          sublist(write_len_up, requested, input_contents)) *
          data_at(&write_data_length, uint32, write_data_length) *
          data_at(&(circular_area->data_buffer), uint8 *, data_buffer) *
          data_at(&(circular_area->readidx), uint8, readidx) *
          data_at(&(circular_area->writeidx), uint8, writeidx) *
          data_at(&(circular_area->p_head), uint8 *, p_head) *
          data_at(&(circular_area->p_tail), uint8 *, p_tail) *
          data_at(&(circular_area->area_length), uint32, area_length) *
          data_at(&(circular_area->b_status), x_bool, b_status) *
          data_at(&(circular_area->CircularAreaOperations), struct CircularAreaOps *, operations) *
          GlobalStrings(LitMap)
        */
        memcpy(&circular_area->data_buffer[circular_area->writeidx],
               input_buffer, write_len_up)
        /*@ where dest_base = data_buffer, dest_lo = writeidx,
                  dest_hi = area_length,
                  src_base = input_buffer, src_lo = 0,
                  src_hi = write_len_up,
                  dest_before = sublist(writeidx, area_length, contents),
                  src_contents = sublist(0, write_len_up, input_contents) */;
        /*@ Assert
          circular_area != 0 && input_buffer != 0 && requested > 0 &&
          circular_area == circular_area_entry &&
          input_buffer == input_buffer_entry &&
          b_force == force0 && 0 < area_length &&
          !(readidx == writeidx && b_status != 0 && force0 == 0) &&
          CircularAreaActualWriteLength(readidx, writeidx, area_length,
                                        b_status, requested, data_length) &&
          Zlength(input_contents) == requested &&
          0 <= write_len_down && write_len_down <= writeidx &&
          write_len_up == area_length - writeidx &&
          write_len_down == data_length - write_len_up &&
          CircularAreaDivideWrDataResult(writeidx, data_length,
                                         area_length, 1) &&
          p_head == data_buffer &&
          p_tail == data_buffer + area_length &&
          CircularAreaDescriptorState(readidx, writeidx, area_length,
                                      b_status, contents) &&
          UCharArray::seg(data_buffer, 0, write_len_down,
                          sublist(0, write_len_down, contents)) *
          UCharArray::seg(data_buffer, write_len_down, writeidx,
                          sublist(write_len_down, writeidx, contents)) *
          UCharArray::seg(data_buffer, writeidx, area_length,
                          sublist(0, write_len_up, input_contents)) *
          UCharArray::seg(input_buffer, 0, write_len_up,
                          sublist(0, write_len_up, input_contents)) *
          UCharArray::seg(input_buffer, write_len_up, data_length,
                          sublist(write_len_up, data_length, input_contents)) *
          UCharArray::seg(input_buffer, data_length, requested,
                          sublist(data_length, requested, input_contents)) *
          data_at(&write_data_length, uint32, write_data_length) *
          data_at(&(circular_area->data_buffer), uint8 *, data_buffer) *
          data_at(&(circular_area->readidx), uint8, readidx) *
          data_at(&(circular_area->writeidx), uint8, writeidx) *
          data_at(&(circular_area->p_head), uint8 *, p_head) *
          data_at(&(circular_area->p_tail), uint8 *, p_tail) *
          data_at(&(circular_area->area_length), uint32, area_length) *
          data_at(&(circular_area->b_status), x_bool, b_status) *
          data_at(&(circular_area->CircularAreaOperations), struct CircularAreaOps *, operations) *
          GlobalStrings(LitMap)
        */
        memcpy(circular_area->p_head, input_buffer + write_len_up,
               write_len_down)
        /*@ where dest_base = data_buffer, dest_lo = 0,
                  dest_hi = write_len_down,
                  src_base = input_buffer, src_lo = write_len_up,
                  src_hi = data_length,
                  dest_before = sublist(0, write_len_down, contents),
                  src_contents = sublist(write_len_up, data_length,
                                         input_contents) */;

        circular_area->writeidx = write_len_down;
    } else {
        /*@ Assert
          circular_area != 0 && input_buffer != 0 && requested > 0 &&
          circular_area == circular_area_entry &&
          input_buffer == input_buffer_entry &&
          b_force == force0 && 0 < area_length &&
          !(readidx == writeidx && b_status != 0 && force0 == 0) &&
          CircularAreaActualWriteLength(readidx, writeidx, area_length,
                                        b_status, requested, data_length) &&
          Zlength(input_contents) == requested &&
          0 <= data_length && data_length <= requested &&
          0 <= writeidx && writeidx + data_length <= area_length &&
          CircularAreaDivideWrDataResult(writeidx, data_length,
                                         area_length, 0) &&
          p_head == data_buffer &&
          p_tail == data_buffer + area_length &&
          CircularAreaDescriptorState(readidx, writeidx, area_length,
                                      b_status, contents) &&
          UCharArray::seg(data_buffer, 0, writeidx,
                          sublist(0, writeidx, contents)) *
          UCharArray::seg(data_buffer, writeidx, writeidx + data_length,
                          sublist(writeidx, writeidx + data_length, contents)) *
          UCharArray::seg(data_buffer, writeidx + data_length, area_length,
                          sublist(writeidx + data_length, area_length,
                                  contents)) *
          UCharArray::seg(input_buffer, 0, data_length,
                          sublist(0, data_length, input_contents)) *
          UCharArray::seg(input_buffer, data_length, requested,
                          sublist(data_length, requested, input_contents)) *
          data_at(&write_data_length, uint32, write_data_length) *
          data_at(&(circular_area->data_buffer), uint8 *, data_buffer) *
          data_at(&(circular_area->readidx), uint8, readidx) *
          data_at(&(circular_area->writeidx), uint8, writeidx) *
          data_at(&(circular_area->p_head), uint8 *, p_head) *
          data_at(&(circular_area->p_tail), uint8 *, p_tail) *
          data_at(&(circular_area->area_length), uint32, area_length) *
          data_at(&(circular_area->b_status), x_bool, b_status) *
          data_at(&(circular_area->CircularAreaOperations), struct CircularAreaOps *, operations) *
          GlobalStrings(LitMap)
        */
        memcpy(&circular_area->data_buffer[circular_area->writeidx],
               input_buffer, data_length)
        /*@ where dest_base = data_buffer, dest_lo = writeidx,
                  dest_hi = writeidx + data_length,
                  src_base = input_buffer, src_lo = 0,
                  src_hi = data_length,
                  dest_before = sublist(writeidx, writeidx + data_length,
                                        contents),
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
