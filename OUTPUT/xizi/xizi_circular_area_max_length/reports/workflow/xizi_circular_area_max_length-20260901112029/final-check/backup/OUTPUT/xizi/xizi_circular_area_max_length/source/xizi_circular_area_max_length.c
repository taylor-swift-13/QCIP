/* Parser-compatible spellings of CRTOS's fixed-width aliases. */
typedef unsigned char uint8;
typedef unsigned int uint32;
typedef int x_bool;

#define NONE ((void *)0)
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

/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_max_length.source Require Import xizi_circular_area_max_length_lib */
/*@ Extern Coq
      (CircularAreaDescriptorState : Z -> Z -> Z -> Z -> list Z -> Prop)
      (CircularAreaGetMaxLengthResult : Z -> Z -> Z -> Prop)
*/

uint32 CircularAreaGetMaxLength(CircularAreaType circular_area)
/*@ With data_buffer readidx writeidx p_head p_tail area_length b_status operations buffer_contents
    Require
      (circular_area == 0 && emp) ||
      (circular_area != 0 &&
       CircularAreaDescriptorState(readidx, writeidx, area_length, b_status, buffer_contents) &&
       store(&(circular_area -> data_buffer), data_buffer) *
       store(&(circular_area -> readidx), readidx) *
       store(&(circular_area -> writeidx), writeidx) *
       store(&(circular_area -> p_head), p_head) *
       store(&(circular_area -> p_tail), p_tail) *
       store(&(circular_area -> area_length), area_length) *
       store(&(circular_area -> b_status), b_status) *
       store(&(circular_area -> CircularAreaOperations), operations) *
       UCharArray::full(data_buffer, area_length, buffer_contents))
    Ensure
      (circular_area == 0 &&
       CircularAreaGetMaxLengthResult(circular_area, area_length, __return) &&
       emp) ||
      (circular_area != 0 &&
       CircularAreaGetMaxLengthResult(circular_area, area_length, __return) &&
       CircularAreaDescriptorState(readidx, writeidx, area_length, b_status, buffer_contents) &&
       store(&(circular_area -> data_buffer), data_buffer) *
       store(&(circular_area -> readidx), readidx) *
       store(&(circular_area -> writeidx), writeidx) *
       store(&(circular_area -> p_head), p_head) *
       store(&(circular_area -> p_tail), p_tail) *
       store(&(circular_area -> area_length), area_length) *
       store(&(circular_area -> b_status), b_status) *
       store(&(circular_area -> CircularAreaOperations), operations) *
       UCharArray::full(data_buffer, area_length, buffer_contents))
*/
{
    NULL_PARAM_CHECK(circular_area);

    return circular_area->area_length;
}
