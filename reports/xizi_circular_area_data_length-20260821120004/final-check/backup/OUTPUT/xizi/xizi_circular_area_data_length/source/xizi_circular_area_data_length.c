typedef unsigned char uint8;
typedef unsigned int uint32;
typedef int x_bool;

#define NONE ((void *)0)
#define RET_TRUE 1
#define RET_FALSE 0
#define ERROR (-1)
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

/*@ Import Coq Require Import xizi_circular_area_data_length_lib */
/*@ Extern Coq
      (CircularAreaIsFullResult : Z -> Z -> Z -> Z -> Prop)
      (CircularAreaDataLengthResult : Z -> Z -> Z -> Z -> Z -> Prop)
*/

x_bool CircularAreaIsFull(CircularAreaType circular_area)
/*@ With data_buffer readidx writeidx p_head p_tail area_length b_status operations
          (contents: list Z)
    Require circular_area != 0 &&
            0 < area_length &&
            area_length <= UINT_MAX &&
            0 <= readidx && readidx <= 255 &&
            0 <= writeidx && writeidx <= 255 &&
            readidx < area_length &&
            writeidx < area_length &&
            data_at(&(circular_area->data_buffer), uint8 *, data_buffer) *
            data_at(&(circular_area->readidx), uint8, readidx) *
            data_at(&(circular_area->writeidx), uint8, writeidx) *
            data_at(&(circular_area->p_head), uint8 *, p_head) *
            data_at(&(circular_area->p_tail), uint8 *, p_tail) *
            data_at(&(circular_area->area_length), uint32, area_length) *
            data_at(&(circular_area->b_status), x_bool, b_status) *
            data_at(&(circular_area->CircularAreaOperations), struct CircularAreaOps *, operations) *
            UCharArray::full(data_buffer, area_length, contents)
    Ensure CircularAreaIsFullResult(readidx, writeidx, b_status, __return) &&
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

    if ((circular_area->readidx == circular_area->writeidx) &&
        circular_area->b_status) {
        return RET_TRUE;
    } else {
        return RET_FALSE;
    }
}

uint32 CircularAreaGetDataLength(CircularAreaType circular_area)
/*@ With data_buffer readidx writeidx p_head p_tail area_length b_status operations
          (contents: list Z)
    Require (circular_area == 0 && emp) ||
            (circular_area != 0 &&
             0 < area_length &&
             area_length <= UINT_MAX &&
             0 <= readidx && readidx <= 255 &&
             0 <= writeidx && writeidx <= 255 &&
             readidx < area_length &&
             writeidx < area_length &&
             data_at(&(circular_area->data_buffer), uint8 *, data_buffer) *
             data_at(&(circular_area->readidx), uint8, readidx) *
             data_at(&(circular_area->writeidx), uint8, writeidx) *
             data_at(&(circular_area->p_head), uint8 *, p_head) *
             data_at(&(circular_area->p_tail), uint8 *, p_tail) *
             data_at(&(circular_area->area_length), uint32, area_length) *
             data_at(&(circular_area->b_status), x_bool, b_status) *
             data_at(&(circular_area->CircularAreaOperations), struct CircularAreaOps *, operations) *
             UCharArray::full(data_buffer, area_length, contents))
    Ensure (circular_area == 0 && __return == UINT_MAX && emp) ||
           (circular_area != 0 &&
            CircularAreaDataLengthResult(readidx, writeidx, area_length, b_status, __return) &&
            data_at(&(circular_area->data_buffer), uint8 *, data_buffer) *
            data_at(&(circular_area->readidx), uint8, readidx) *
            data_at(&(circular_area->writeidx), uint8, writeidx) *
            data_at(&(circular_area->p_head), uint8 *, p_head) *
            data_at(&(circular_area->p_tail), uint8 *, p_tail) *
            data_at(&(circular_area->area_length), uint32, area_length) *
            data_at(&(circular_area->b_status), x_bool, b_status) *
            data_at(&(circular_area->CircularAreaOperations), struct CircularAreaOps *, operations) *
            UCharArray::full(data_buffer, area_length, contents))
*/
{
    NULL_PARAM_CHECK(circular_area);

    if (CircularAreaIsFull(circular_area)) {
        return circular_area->area_length;
    } else {
        return (circular_area->writeidx - circular_area->readidx +
                circular_area->area_length) % circular_area->area_length;
    }
}
