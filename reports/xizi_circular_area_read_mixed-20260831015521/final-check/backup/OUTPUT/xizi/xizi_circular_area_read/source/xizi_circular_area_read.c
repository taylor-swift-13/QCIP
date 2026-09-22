typedef unsigned char uint8;
typedef unsigned int uint32;
typedef int x_bool;

/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_read.source Require Import xizi_circular_area_read_lib */
/*@ Extern Coq
      (CircularAreaDescriptorState : Z -> Z -> Z -> Z -> list Z -> Prop)
      (CircularAreaIsFullResult : Z -> Z -> Z -> Z -> Prop)
      (CircularAreaEmptyResult : Z -> Z -> Z -> Z -> Prop)
      (CircularAreaDataLengthResult : Z -> Z -> Z -> Z -> Z -> Prop)
      (CircularAreaDivideRdDataResult : Z -> Z -> Z -> Z -> Prop)
      (CircularAreaActualReadLength : Z -> Z -> Z -> Z -> Z -> Z -> Prop)
      (CircularAreaReadSuccess : Z -> Z -> Z -> Z -> Z -> Z -> list Z -> list Z -> Z -> Z -> list Z -> list Z -> Prop)
      (CircularAreaErrorResult : Z -> Prop)
      (UCharArray::seg : Z -> Z -> Z -> list Z -> Assertion)
*/

uint8 *memcpy(uint8 *dest, uint8 *src, uint32 count)
/*@ With dest_base dest_lo dest_hi src_base src_lo src_hi
          dest_before src_contents
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

void KPrintf(char *format)
/*@ Require emp
    Ensure emp
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

typedef struct CircularArea *CircularAreaType;

x_bool CircularAreaIsFull(CircularAreaType circular_area)
/*@ With data_buffer readidx writeidx p_head p_tail area_length b_status operations buffer_contents LitMap
    Require
      circular_area != 0 &&
      p_head == data_buffer &&
      p_tail == data_buffer + area_length &&
      CircularAreaDescriptorState(readidx, writeidx, area_length, b_status, buffer_contents) &&
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
      CircularAreaDescriptorState(readidx, writeidx, area_length, b_status, buffer_contents) &&
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
        KPrintf("the circular area is full\n");
        return RET_TRUE;
    } else {
        return RET_FALSE;
    }
}

x_bool CircularAreaIsEmpty(CircularAreaType circular_area)
/*@ With data_buffer readidx writeidx p_head p_tail area_length b_status operations buffer_contents LitMap
    Require
      circular_area != 0 &&
      p_head == data_buffer &&
      p_tail == data_buffer + area_length &&
      CircularAreaDescriptorState(readidx, writeidx, area_length, b_status, buffer_contents) &&
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
      CircularAreaEmptyResult(readidx, writeidx, b_status, __return) &&
      p_head == data_buffer &&
      p_tail == data_buffer + area_length &&
      CircularAreaDescriptorState(readidx, writeidx, area_length, b_status, buffer_contents) &&
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

    if((circular_area->readidx == circular_area->writeidx) && (!circular_area->b_status)) {
        KPrintf("the circular area is empty\n");
        return RET_TRUE;
    } else {
        return RET_FALSE;
    }
}

uint32 CircularAreaGetDataLength(CircularAreaType circular_area)
/*@ With data_buffer readidx writeidx p_head p_tail area_length b_status operations buffer_contents LitMap
    Require
      circular_area != 0 &&
      p_head == data_buffer &&
      p_tail == data_buffer + area_length &&
      CircularAreaDescriptorState(readidx, writeidx, area_length, b_status, buffer_contents) &&
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
      CircularAreaDataLengthResult(readidx, writeidx, area_length, b_status, __return) &&
      p_head == data_buffer &&
      p_tail == data_buffer + area_length &&
      CircularAreaDescriptorState(readidx, writeidx, area_length, b_status, buffer_contents) &&
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

    if (CircularAreaIsFull(circular_area)
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

static uint32 CircularAreaDivideRdData(CircularAreaType circular_area,
                                       uint32 data_length)
/*@ With data_buffer readidx writeidx p_head p_tail area_length b_status operations buffer_contents LitMap
    Require
      circular_area != 0 &&
      0 <= data_length && data_length <= area_length &&
      readidx + data_length <= UINT_MAX &&
      p_head == data_buffer &&
      p_tail == data_buffer + area_length &&
      CircularAreaDescriptorState(readidx, writeidx, area_length, b_status, buffer_contents) &&
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
      CircularAreaDivideRdDataResult(readidx, data_length, area_length, __return) &&
      p_head == data_buffer &&
      p_tail == data_buffer + area_length &&
      CircularAreaDescriptorState(readidx, writeidx, area_length, b_status, buffer_contents) &&
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

    if (circular_area->readidx + data_length <= circular_area->area_length) {
        return RET_FALSE;
    } else {
        return RET_TRUE;
    }
}

uint32 CircularAreaRead(CircularAreaType circular_area, uint8 *output_buffer,
                        uint32 data_length)
/*@ With data_buffer readidx writeidx p_head p_tail area_length b_status operations LitMap
          buffer_contents output_capacity output_before ca0 out0 requested
    Require
      circular_area == ca0 && output_buffer == out0 && data_length == requested &&
      0 <= requested && requested <= UINT_MAX &&
      GlobalStrings(LitMap) *
      ((ca0 == 0 && emp) ||
      (ca0 != 0 &&
       p_head == data_buffer &&
       p_tail == data_buffer + area_length &&
       CircularAreaDescriptorState(readidx, writeidx, area_length, b_status, buffer_contents) &&
       UCharArray::full(data_buffer, area_length, buffer_contents) *
       store_ptr(&(circular_area->data_buffer), data_buffer) *
       store_uchar(&(circular_area->readidx), readidx) *
       store_uchar(&(circular_area->writeidx), writeidx) *
       store_ptr(&(circular_area->p_head), p_head) *
       store_ptr(&(circular_area->p_tail), p_tail) *
       store_uint(&(circular_area->area_length), area_length) *
       store_int(&(circular_area->b_status), b_status) *
       store_ptr(&(circular_area->CircularAreaOperations), operations) *
       ((out0 == 0 && emp) ||
        (out0 != 0 &&
         requested <= output_capacity &&
         UCharArray::full(out0, output_capacity, output_before)))))
    Ensure
      GlobalStrings(LitMap) *
      ((ca0 == 0 && CircularAreaErrorResult(__return) && emp) ||
      (ca0 != 0 && out0 == 0 && CircularAreaErrorResult(__return) &&
       p_head == data_buffer && p_tail == data_buffer + area_length &&
       CircularAreaDescriptorState(readidx, writeidx, area_length, b_status, buffer_contents) &&
       UCharArray::full(data_buffer, area_length, buffer_contents) *
       store_ptr(&(ca0->data_buffer), data_buffer) *
       store_uchar(&(ca0->readidx), readidx) *
       store_uchar(&(ca0->writeidx), writeidx) *
       store_ptr(&(ca0->p_head), p_head) *
       store_ptr(&(ca0->p_tail), p_tail) *
       store_uint(&(ca0->area_length), area_length) *
       store_int(&(ca0->b_status), b_status) *
       store_ptr(&(ca0->CircularAreaOperations), operations)) ||
      (ca0 != 0 && out0 != 0 &&
       (requested == 0 || CircularAreaEmptyResult(readidx, writeidx, b_status, 1)) &&
       CircularAreaErrorResult(__return) &&
       p_head == data_buffer && p_tail == data_buffer + area_length &&
       CircularAreaDescriptorState(readidx, writeidx, area_length, b_status, buffer_contents) &&
       UCharArray::full(data_buffer, area_length, buffer_contents) *
       UCharArray::full(out0, output_capacity, output_before) *
       store_ptr(&(ca0->data_buffer), data_buffer) *
       store_uchar(&(ca0->readidx), readidx) *
       store_uchar(&(ca0->writeidx), writeidx) *
       store_ptr(&(ca0->p_head), p_head) *
       store_ptr(&(ca0->p_tail), p_tail) *
       store_uint(&(ca0->area_length), area_length) *
       store_int(&(ca0->b_status), b_status) *
       store_ptr(&(ca0->CircularAreaOperations), operations)) ||
      (exists actual new_readidx bytes output_after,
       ca0 != 0 && out0 != 0 && requested > 0 &&
       CircularAreaEmptyResult(readidx, writeidx, b_status, 0) &&
       CircularAreaReadSuccess(readidx, writeidx, area_length, b_status,
                               requested, output_capacity,
                               buffer_contents, output_before,
                               actual, new_readidx, bytes, output_after) &&
       p_head == data_buffer && p_tail == data_buffer + area_length &&
       UCharArray::full(data_buffer, area_length, buffer_contents) *
       UCharArray::full(out0, output_capacity, output_after) *
       store_ptr(&(ca0->data_buffer), data_buffer) *
       store_uchar(&(ca0->readidx), new_readidx) *
       store_uchar(&(ca0->writeidx), writeidx) *
       store_ptr(&(ca0->p_head), p_head) *
       store_ptr(&(ca0->p_tail), p_tail) *
       store_uint(&(ca0->area_length), area_length) *
       store_int(&(ca0->b_status), 0) *
       store_ptr(&(ca0->CircularAreaOperations), operations))
      )
*/
{
    NULL_PARAM_CHECK(circular_area);
    NULL_PARAM_CHECK(output_buffer);
    /*@ 0 <= data_length && data_length <= UINT_MAX by local */
    CHECK(data_length > 0);

    if (CircularAreaIsEmpty(circular_area)
        /*@ where data_buffer = data_buffer, readidx = readidx,
                  writeidx = writeidx, p_head = p_head, p_tail = p_tail,
                  area_length = area_length, b_status = b_status,
                  operations = operations, buffer_contents = buffer_contents,
                  LitMap = LitMap */) {
        /*@ Assert
          circular_area != 0 && output_buffer != 0 && data_length > 0 &&
          circular_area == ca0 && output_buffer == out0 && data_length == requested &&
          data_length <= output_capacity &&
          CircularAreaEmptyResult(readidx, writeidx, b_status, 1) &&
          p_head == data_buffer && p_tail == data_buffer + area_length &&
          CircularAreaDescriptorState(readidx, writeidx, area_length, b_status, buffer_contents) &&
          GlobalStrings(LitMap) *
          UCharArray::full(data_buffer, area_length, buffer_contents) *
          UCharArray::full(output_buffer, output_capacity, output_before) *
          store_ptr(&(circular_area->data_buffer), data_buffer) *
          store_uchar(&(circular_area->readidx), readidx) *
          store_uchar(&(circular_area->writeidx), writeidx) *
          store_ptr(&(circular_area->p_head), p_head) *
          store_ptr(&(circular_area->p_tail), p_tail) *
          store_uint(&(circular_area->area_length), area_length) *
          store_int(&(circular_area->b_status), b_status) *
          store_ptr(&(circular_area->CircularAreaOperations), operations)
        */
        return ERROR;
    }

    data_length = (data_length > CircularAreaGetDataLength(circular_area)
                   /*@ where data_buffer = data_buffer, readidx = readidx,
                             writeidx = writeidx, p_head = p_head, p_tail = p_tail,
                             area_length = area_length, b_status = b_status,
                             operations = operations, buffer_contents = buffer_contents,
                             LitMap = LitMap */) ?
        CircularAreaGetDataLength(circular_area)
        /*@ where data_buffer = data_buffer, readidx = readidx,
                  writeidx = writeidx, p_head = p_head, p_tail = p_tail,
                  area_length = area_length, b_status = b_status,
                  operations = operations, buffer_contents = buffer_contents,
                  LitMap = LitMap */ : data_length;

    if (CircularAreaDivideRdData(circular_area, data_length)
        /*@ where data_buffer = data_buffer, readidx = readidx,
                  writeidx = writeidx, p_head = p_head, p_tail = p_tail,
                  area_length = area_length, b_status = b_status,
                  operations = operations, buffer_contents = buffer_contents,
                  LitMap = LitMap */) {
        uint32 read_len_up = circular_area->area_length -
            circular_area->readidx;
        uint32 read_len_down = data_length - read_len_up;

        /*@ Assert
          circular_area != 0 && output_buffer != 0 &&
          circular_area == ca0 && output_buffer == out0 && requested > 0 &&
          CircularAreaEmptyResult(readidx, writeidx, b_status, 0) &&
          CircularAreaActualReadLength(readidx, writeidx, area_length, b_status,
                                       requested, data_length) &&
          0 < data_length && data_length <= output_capacity &&
          0 <= readidx && readidx < area_length &&
          read_len_up == area_length - readidx &&
          read_len_down == data_length - read_len_up &&
          read_len_up <= data_length &&
          CircularAreaDivideRdDataResult(readidx, data_length, area_length, 1) &&
          p_head == data_buffer && p_tail == data_buffer + area_length &&
          CircularAreaDescriptorState(readidx, writeidx, area_length, b_status, buffer_contents) &&
          GlobalStrings(LitMap) *
          UCharArray::seg(data_buffer, 0, readidx,
                          sublist(0, readidx, buffer_contents)) *
          UCharArray::seg(data_buffer, readidx, area_length,
                          sublist(readidx, area_length, buffer_contents)) *
          UCharArray::seg(output_buffer, 0, read_len_up,
                          sublist(0, read_len_up, output_before)) *
          UCharArray::seg(output_buffer, read_len_up, output_capacity,
                          sublist(read_len_up, output_capacity, output_before)) *
          store_ptr(&(circular_area->data_buffer), data_buffer) *
          store_uchar(&(circular_area->readidx), readidx) *
          store_uchar(&(circular_area->writeidx), writeidx) *
          store_ptr(&(circular_area->p_head), p_head) *
          store_ptr(&(circular_area->p_tail), p_tail) *
          store_uint(&(circular_area->area_length), area_length) *
          store_int(&(circular_area->b_status), b_status) *
          store_ptr(&(circular_area->CircularAreaOperations), operations)
        */
        memcpy(output_buffer,
               &circular_area->data_buffer[circular_area->readidx],
               read_len_up)
        /*@ where dest_base = output_buffer, dest_lo = 0,
                  dest_hi = read_len_up,
                  src_base = data_buffer, src_lo = readidx,
                  src_hi = area_length,
                  dest_before = sublist(0, read_len_up, output_before),
                  src_contents = sublist(readidx, area_length, buffer_contents) */;
        /*@ Assert
          circular_area != 0 && output_buffer != 0 &&
          circular_area == ca0 && output_buffer == out0 && requested > 0 &&
          CircularAreaEmptyResult(readidx, writeidx, b_status, 0) &&
          CircularAreaActualReadLength(readidx, writeidx, area_length, b_status,
                                       requested, data_length) &&
          0 < data_length && data_length <= output_capacity &&
          0 <= read_len_down && read_len_down <= readidx &&
          read_len_up == area_length - readidx &&
          read_len_down == data_length - read_len_up &&
          CircularAreaDivideRdDataResult(readidx, data_length, area_length, 1) &&
          p_head == data_buffer && p_tail == data_buffer + area_length &&
          CircularAreaDescriptorState(readidx, writeidx, area_length, b_status, buffer_contents) &&
          GlobalStrings(LitMap) *
          UCharArray::seg(data_buffer, 0, read_len_down,
                          sublist(0, read_len_down, buffer_contents)) *
          UCharArray::seg(data_buffer, read_len_down, readidx,
                          sublist(read_len_down, readidx, buffer_contents)) *
          UCharArray::seg(data_buffer, readidx, area_length,
                          sublist(readidx, area_length, buffer_contents)) *
          UCharArray::seg(output_buffer, 0, read_len_up,
                          sublist(readidx, area_length, buffer_contents)) *
          UCharArray::seg(output_buffer, read_len_up, data_length,
                          sublist(read_len_up, data_length, output_before)) *
          UCharArray::seg(output_buffer, data_length, output_capacity,
                          sublist(data_length, output_capacity, output_before)) *
          store_ptr(&(circular_area->data_buffer), data_buffer) *
          store_uchar(&(circular_area->readidx), readidx) *
          store_uchar(&(circular_area->writeidx), writeidx) *
          store_ptr(&(circular_area->p_head), p_head) *
          store_ptr(&(circular_area->p_tail), p_tail) *
          store_uint(&(circular_area->area_length), area_length) *
          store_int(&(circular_area->b_status), b_status) *
          store_ptr(&(circular_area->CircularAreaOperations), operations)
        */
        memcpy(output_buffer + read_len_up, circular_area->p_head,
               read_len_down)
        /*@ where dest_base = output_buffer, dest_lo = read_len_up,
                  dest_hi = data_length,
                  src_base = data_buffer, src_lo = 0,
                  src_hi = read_len_down,
                  dest_before = sublist(read_len_up, data_length, output_before),
                  src_contents = sublist(0, read_len_down, buffer_contents) */;

        circular_area->readidx = read_len_down;
    } else {
        /*@ Assert
          circular_area != 0 && output_buffer != 0 &&
          circular_area == ca0 && output_buffer == out0 && requested > 0 &&
          CircularAreaEmptyResult(readidx, writeidx, b_status, 0) &&
          CircularAreaActualReadLength(readidx, writeidx, area_length, b_status,
                                       requested, data_length) &&
          0 < data_length && data_length <= output_capacity &&
          0 <= readidx && readidx + data_length <= area_length &&
          CircularAreaDivideRdDataResult(readidx, data_length, area_length, 0) &&
          p_head == data_buffer && p_tail == data_buffer + area_length &&
          CircularAreaDescriptorState(readidx, writeidx, area_length, b_status, buffer_contents) &&
          GlobalStrings(LitMap) *
          UCharArray::seg(data_buffer, 0, readidx,
                          sublist(0, readidx, buffer_contents)) *
          UCharArray::seg(data_buffer, readidx, readidx + data_length,
                          sublist(readidx, readidx + data_length, buffer_contents)) *
          UCharArray::seg(data_buffer, readidx + data_length, area_length,
                          sublist(readidx + data_length, area_length, buffer_contents)) *
          UCharArray::seg(output_buffer, 0, data_length,
                          sublist(0, data_length, output_before)) *
          UCharArray::seg(output_buffer, data_length, output_capacity,
                          sublist(data_length, output_capacity, output_before)) *
          store_ptr(&(circular_area->data_buffer), data_buffer) *
          store_uchar(&(circular_area->readidx), readidx) *
          store_uchar(&(circular_area->writeidx), writeidx) *
          store_ptr(&(circular_area->p_head), p_head) *
          store_ptr(&(circular_area->p_tail), p_tail) *
          store_uint(&(circular_area->area_length), area_length) *
          store_int(&(circular_area->b_status), b_status) *
          store_ptr(&(circular_area->CircularAreaOperations), operations)
        */
        memcpy(output_buffer,
               &circular_area->data_buffer[circular_area->readidx],
               data_length)
        /*@ where dest_base = output_buffer, dest_lo = 0,
                  dest_hi = data_length,
                  src_base = data_buffer, src_lo = readidx,
                  src_hi = readidx + data_length,
                  dest_before = sublist(0, data_length, output_before),
                  src_contents = sublist(readidx, readidx + data_length, buffer_contents) */;
        circular_area->readidx =
            (circular_area->readidx + data_length) %
            circular_area->area_length;
    }

    circular_area->b_status = RET_FALSE;

    return EOK;
}
