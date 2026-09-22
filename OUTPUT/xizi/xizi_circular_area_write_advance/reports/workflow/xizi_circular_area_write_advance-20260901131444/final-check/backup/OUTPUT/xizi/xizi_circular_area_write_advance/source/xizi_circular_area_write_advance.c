typedef unsigned char uint8_t;
typedef unsigned int uint32_t;

/*@ Import Coq Require Import
      SimpleC.EE.OUTPUT.xizi.xizi_circular_area_write_advance.source.xizi_circular_area_write_advance_lib
 */
/*@ Extern Coq
      (CircularAreaDivideWrDataResult : Z -> Z -> Z -> Z -> Prop)
 */

typedef uint8_t uint8;
typedef uint32_t uint32;
typedef int x_bool;
struct CircularArea;
typedef struct CircularArea *CircularAreaType;

#define NONE ((void *)0)
#define RET_TRUE 1
#define RET_FALSE 0
#define ERROR 1
#define NULL_PARAM_CHECK(p) do { if ((p) == NONE) return ERROR; } while (0)

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

static uint32 CircularAreaDivideWrData(CircularAreaType circular_area,
                                       uint32 data_length)
/*@ With (data_buffer : Z)
          (readidx : Z)
          (writeidx : Z)
          (p_head : Z)
          (p_tail : Z)
          (area_length : Z)
          (b_status : Z)
          (circular_area_operations : Z)
          (buffer_contents : list Z)
    Require
      (circular_area == 0 && emp) ||
      (circular_area != 0 &&
       0 < area_length && area_length <= 256 &&
       0 <= readidx && readidx < area_length &&
       0 <= writeidx && writeidx < area_length &&
       0 <= data_length && data_length <= area_length &&
       p_head == data_buffer &&
       p_tail == data_buffer + area_length &&
       store(&(circular_area->data_buffer), data_buffer) *
       store(&(circular_area->readidx), readidx) *
       store(&(circular_area->writeidx), writeidx) *
       store(&(circular_area->p_head), p_head) *
       store(&(circular_area->p_tail), p_tail) *
       store(&(circular_area->area_length), area_length) *
       store(&(circular_area->b_status), b_status) *
       store(&(circular_area->CircularAreaOperations), circular_area_operations) *
       UCharArray::full(data_buffer, area_length, buffer_contents))
    Ensure
      (circular_area == 0 && __return == 1 && emp) ||
      (circular_area != 0 &&
       0 < area_length && area_length <= 256 &&
       0 <= readidx && readidx < area_length &&
       0 <= writeidx && writeidx < area_length &&
       0 <= data_length && data_length <= area_length &&
       p_head == data_buffer &&
       p_tail == data_buffer + area_length &&
       CircularAreaDivideWrDataResult(writeidx, data_length,
                                      area_length, __return) &&
       store(&(circular_area->data_buffer), data_buffer) *
       store(&(circular_area->readidx), readidx) *
       store(&(circular_area->writeidx), writeidx) *
       store(&(circular_area->p_head), p_head) *
       store(&(circular_area->p_tail), p_tail) *
       store(&(circular_area->area_length), area_length) *
       store(&(circular_area->b_status), b_status) *
       store(&(circular_area->CircularAreaOperations), circular_area_operations) *
       UCharArray::full(data_buffer, area_length, buffer_contents))
 */
{
    NULL_PARAM_CHECK(circular_area);

    if (circular_area->writeidx + data_length <= circular_area->area_length) {
        return RET_FALSE;
    } else {
        return RET_TRUE;
    }
}
