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

/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_data_length.source Require Import xizi_circular_area_data_length_lib */
/*@ Extern Coq
      (CircularAreaErrorResult : Z -> Prop)
      (CircularAreaDescriptorState : Z -> Z -> Z -> Z -> list Z -> Prop)
      (CircularAreaIsFullResult : Z -> Z -> Z -> Z -> Prop)
      (CircularAreaDataLengthResult : Z -> Z -> Z -> Z -> Z -> Prop)
*/

x_bool CircularAreaIsFull(CircularAreaType circular_area)
/*@ With data_buffer readidx writeidx p_head p_tail area_length b_status
          operations buffer_contents LitMap
    Require
      circular_area != 0 &&
      p_head == data_buffer &&
      p_tail == data_buffer + area_length &&
      CircularAreaDescriptorState(readidx, writeidx, area_length, b_status,
                                  buffer_contents) &&
      GlobalStrings(LitMap) *
      UCharArray::full(data_buffer, area_length, buffer_contents) *
      store_ptr(&(circular_area->data_buffer), data_buffer) *
      store_uchar(&(circular_area->readidx), readidx) *
      store_uchar(&(circular_area->writeidx), writeidx) *
      store_ptr(&(circular_area->p_head), p_head) *
      store_ptr(&(circular_area->p_tail), p_tail) *
      store_uint(&(circular_area->area_length), area_length) *
      store_int(&(circular_area->b_status), b_status) *
      store_ptr(&(circular_area->CircularAreaOperations), operations)
    Ensure
      CircularAreaIsFullResult(readidx, writeidx, b_status, __return) &&
      p_head == data_buffer &&
      p_tail == data_buffer + area_length &&
      CircularAreaDescriptorState(readidx, writeidx, area_length, b_status,
                                  buffer_contents) &&
      GlobalStrings(LitMap) *
      UCharArray::full(data_buffer, area_length, buffer_contents) *
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

    if((circular_area->readidx == circular_area->writeidx) && (circular_area->b_status)) {
        KPrintf("the circular area is full\n")
          /*@ where LM = LitMap, s = "the circular area is full\n" */;
        return RET_TRUE;
    } else {
        return RET_FALSE;
    }
}

uint32 CircularAreaGetDataLength(CircularAreaType circular_area)
/*@ With data_buffer readidx writeidx p_head p_tail area_length b_status
          operations buffer_contents LitMap
    Require
      (circular_area == 0 && GlobalStrings(LitMap)) ||
      (circular_area != 0 &&
       p_head == data_buffer &&
       p_tail == data_buffer + area_length &&
       CircularAreaDescriptorState(readidx, writeidx, area_length, b_status,
                                   buffer_contents) &&
       GlobalStrings(LitMap) *
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
      (circular_area == 0 && CircularAreaErrorResult(__return) &&
       GlobalStrings(LitMap)) ||
      (circular_area != 0 &&
       CircularAreaDataLengthResult(readidx, writeidx, area_length, b_status,
                                    __return) &&
       p_head == data_buffer &&
       p_tail == data_buffer + area_length &&
       CircularAreaDescriptorState(readidx, writeidx, area_length, b_status,
                                   buffer_contents) &&
       GlobalStrings(LitMap) *
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

    if(CircularAreaIsFull(circular_area)
       /*@ where data_buffer = data_buffer, readidx = readidx,
                 writeidx = writeidx, p_head = p_head, p_tail = p_tail,
                 area_length = area_length, b_status = b_status,
                 operations = operations, buffer_contents = buffer_contents,
                 LitMap = LitMap */) {
        return circular_area->area_length;
    } else {
        return (circular_area->writeidx - circular_area->readidx +
                circular_area->area_length) % circular_area->area_length;
    }
}
