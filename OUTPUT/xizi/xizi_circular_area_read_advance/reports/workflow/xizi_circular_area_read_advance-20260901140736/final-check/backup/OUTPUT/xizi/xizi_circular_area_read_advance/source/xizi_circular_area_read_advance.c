/* Parser-compatible spellings of CRTOS's fixed-width aliases. */
typedef unsigned char uint8;
typedef unsigned int uint32;
typedef int x_bool;

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

typedef struct CircularArea *CircularAreaType;

/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_read_advance.source Require Import xizi_circular_area_read_advance_lib */
/*@ Extern Coq
      (CircularAreaDescriptorState : Z -> Z -> Z -> Z -> list Z -> Prop)
      (CircularAreaDivideRdDataResult : Z -> Z -> Z -> Z -> Prop)
*/

static uint32 CircularAreaDivideRdData(CircularAreaType circular_area,
                                       uint32 data_length)
/*@ With data_buffer readidx writeidx p_head p_tail area_length b_status operations buffer_contents
    Require
      (circular_area == 0 && emp) ||
      (circular_area != 0 &&
       0 <= data_length && data_length <= area_length &&
       readidx + data_length <= 4294967295 &&
       CircularAreaDescriptorState(readidx, writeidx, area_length, b_status, buffer_contents) &&
       p_head == data_buffer &&
       p_tail == data_buffer + area_length &&
       UCharArray::full(data_buffer, area_length, buffer_contents) *
       store_ptr(&(circular_area->data_buffer), data_buffer) *
       store_uchar(&(circular_area->readidx), readidx) *
       store_uchar(&(circular_area->writeidx), writeidx) *
       store_ptr(&(circular_area->p_head), p_head) *
       store_ptr(&(circular_area->p_tail), p_tail) *
       store_uint(&(circular_area->area_length), area_length) *
       store_int(&(circular_area->b_status), b_status) *
       store_ptr(&(circular_area->CircularAreaOperations), operations))
    Ensure
      (circular_area == 0 && __return == 1 && emp) ||
      (circular_area != 0 &&
       0 <= data_length && data_length <= area_length &&
       readidx + data_length <= 4294967295 &&
       CircularAreaDescriptorState(readidx, writeidx, area_length, b_status, buffer_contents) &&
       p_head == data_buffer &&
       p_tail == data_buffer + area_length &&
       CircularAreaDivideRdDataResult(readidx, data_length, area_length, __return) &&
       UCharArray::full(data_buffer, area_length, buffer_contents) *
       store_ptr(&(circular_area->data_buffer), data_buffer) *
       store_uchar(&(circular_area->readidx), readidx) *
       store_uchar(&(circular_area->writeidx), writeidx) *
       store_ptr(&(circular_area->p_head), p_head) *
       store_ptr(&(circular_area->p_tail), p_tail) *
       store_uint(&(circular_area->area_length), area_length) *
       store_int(&(circular_area->b_status), b_status) *
       store_ptr(&(circular_area->CircularAreaOperations), operations))
*/
{
    NULL_PARAM_CHECK(circular_area);

    if (circular_area->readidx + data_length <= circular_area->area_length) {
        return RET_FALSE;
    } else {
        return RET_TRUE;
    }
}
