typedef unsigned char uint8;
typedef unsigned int uint32;
typedef int x_bool;

/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_read.source Require Import xizi_circular_area_read_lib */
/*@ Extern Coq
      (CircularAreaBackingResource :
         Z -> Z -> Z -> Z -> Z -> Z -> Z -> list Z ->
         list (option Z) -> Assertion)
      (CircularAreaLogicalState :
         Z -> Z -> Z -> Z -> list Z -> list (option Z) -> Prop)
      (CircularAreaLiveBytes :
         Z -> Z -> list Z -> list (option Z) -> Prop)
      (CircularAreaFullResult : Z -> list Z -> Z -> Prop)
      (CircularAreaEmptyResult : list Z -> Z -> Prop)
      (CircularAreaDataLengthResult : list Z -> Z -> Prop)
      (CircularAreaDivideRdDataResult : Z -> Z -> Z -> Z -> Prop)
      (CircularAreaActualReadLength : list Z -> Z -> Z -> Prop)
      (CircularAreaInitializedSlice :
         list (option Z) -> Z -> Z -> list Z -> Prop)
      (CircularAreaSomeBytes : list Z -> list (option Z))
      (CircularAreaReadSuccess :
         Z -> Z -> Z -> Z -> list Z -> list (option Z) -> Z -> Z ->
         list Z -> list Z -> list (option Z) -> Prop)
      (CircularAreaErrorResult : Z -> Prop)
      (UCharArray::seg : Z -> Z -> Z -> list Z -> Assertion)
      (UCharArray::mixed_seg :
         Z -> Z -> Z -> list (option Z) -> Assertion)
*/

uint8 *memcpy(uint8 *dest, uint8 *src, uint32 count)
/*@ With dest_base dest_lo dest_hi src_base src_lo src_hi
          (dest_before : list (option Z))
          (src_contents : list Z) src_physical
    Require
      dest == dest_base + dest_lo &&
      src == src_base + src_lo &&
      count == dest_hi - dest_lo &&
      count == src_hi - src_lo &&
      Zlength(dest_before) == dest_hi - dest_lo &&
      Zlength(src_contents) == src_hi - src_lo &&
      CircularAreaInitializedSlice(src_physical, src_lo, src_hi,
                                   src_contents) &&
      UCharArray::mixed_seg(dest_base, dest_lo, dest_hi, dest_before) *
      UCharArray::mixed_seg(src_base, src_lo, src_hi,
                            sublist(src_lo, src_hi, src_physical))
    Ensure
      __return == dest &&
      UCharArray::mixed_seg(dest_base, dest_lo, dest_hi,
                            CircularAreaSomeBytes(src_contents)) *
      UCharArray::mixed_seg(src_base, src_lo, src_hi,
                            sublist(src_lo, src_hi, src_physical))
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
/*@ With ca0 data_buffer readidx writeidx area_length b_status operations logical physical LitMap
    Require
      circular_area == ca0 && ca0 != 0 && data_buffer != 0 &&
      GlobalStrings(LitMap) *
      CircularAreaBackingResource(ca0, data_buffer, readidx, writeidx,
                                  area_length, b_status, operations,
                                  logical, physical)
    Ensure
      ca0 != 0 && data_buffer != 0 &&
      CircularAreaFullResult(area_length, logical, __return) &&
      GlobalStrings(LitMap) *
      CircularAreaBackingResource(ca0, data_buffer, readidx, writeidx,
                                  area_length, b_status, operations,
                                  logical, physical)
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

    if((circular_area->readidx == circular_area->writeidx) && (circular_area->b_status)) {
        KPrintf("the circular area is full\n");
        return RET_TRUE;
    } else {
        return RET_FALSE;
    }
}

x_bool CircularAreaIsEmpty(CircularAreaType circular_area)
/*@ With ca0 data_buffer readidx writeidx area_length b_status operations logical physical LitMap
    Require
      circular_area == ca0 && ca0 != 0 && data_buffer != 0 &&
      GlobalStrings(LitMap) *
      CircularAreaBackingResource(ca0, data_buffer, readidx, writeidx,
                                  area_length, b_status, operations,
                                  logical, physical)
    Ensure
      ca0 != 0 && data_buffer != 0 &&
      CircularAreaEmptyResult(logical, __return) &&
      GlobalStrings(LitMap) *
      CircularAreaBackingResource(ca0, data_buffer, readidx, writeidx,
                                  area_length, b_status, operations,
                                  logical, physical)
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

    if((circular_area->readidx == circular_area->writeidx) && (!circular_area->b_status)) {
        KPrintf("the circular area is empty\n");
        return RET_TRUE;
    } else {
        return RET_FALSE;
    }
}

uint32 CircularAreaGetDataLength(CircularAreaType circular_area)
/*@ With ca0 data_buffer readidx writeidx area_length b_status operations logical physical LitMap
    Require
      circular_area == ca0 && ca0 != 0 && data_buffer != 0 &&
      GlobalStrings(LitMap) *
      CircularAreaBackingResource(ca0, data_buffer, readidx, writeidx,
                                  area_length, b_status, operations,
                                  logical, physical)
    Ensure
      ca0 != 0 && data_buffer != 0 &&
      CircularAreaDataLengthResult(logical, __return) &&
      GlobalStrings(LitMap) *
      CircularAreaBackingResource(ca0, data_buffer, readidx, writeidx,
                                  area_length, b_status, operations,
                                  logical, physical)
*/
{
    NULL_PARAM_CHECK(circular_area);

    if (CircularAreaIsFull(circular_area)
        /*@ where ca0 = ca0, data_buffer = data_buffer, readidx = readidx,
                  writeidx = writeidx,
                  area_length = area_length, b_status = b_status,
                  operations = operations, logical = logical, physical = physical,
                  LitMap = LitMap */) {
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

static uint32 CircularAreaDivideRdData(CircularAreaType circular_area,
                                       uint32 data_length)
/*@ With ca0 d0 data_buffer readidx writeidx area_length b_status operations logical physical LitMap
    Require
      circular_area == ca0 && data_length == d0 &&
      ca0 != 0 && data_buffer != 0 &&
      0 <= d0 && d0 <= area_length &&
      readidx + d0 <= UINT_MAX &&
      GlobalStrings(LitMap) *
      CircularAreaBackingResource(ca0, data_buffer, readidx, writeidx,
                                  area_length, b_status, operations,
                                  logical, physical)
    Ensure
      ca0 != 0 && data_buffer != 0 &&
      CircularAreaDivideRdDataResult(readidx, d0, area_length, __return) &&
      GlobalStrings(LitMap) *
      CircularAreaBackingResource(ca0, data_buffer, readidx, writeidx,
                                  area_length, b_status, operations,
                                  logical, physical)
*/
{
    /*@ Assert
      circular_area == ca0 && data_length == d0 &&
      ca0 != 0 && data_buffer != 0 &&
      0 <= d0 && d0 <= area_length &&
      readidx + d0 <= UINT_MAX &&
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

    if (circular_area->readidx + data_length <= circular_area->area_length) {
        return RET_FALSE;
    } else {
        return RET_TRUE;
    }
}

uint32 CircularAreaRead(CircularAreaType circular_area, uint8 *output_buffer,
                        uint32 data_length)
/*@ With data_buffer readidx writeidx area_length b_status operations LitMap
          logical physical output_capacity output_before ca0 out0 requested
    Require
      circular_area == ca0 && output_buffer == out0 && data_length == requested &&
      0 <= requested && requested <= UINT_MAX &&
      GlobalStrings(LitMap) *
      ((ca0 == 0 && emp) ||
      (ca0 != 0 &&
       CircularAreaBackingResource(ca0, data_buffer, readidx, writeidx,
                                   area_length, b_status, operations,
                                   logical, physical) *
       ((out0 == 0 && emp) ||
        (out0 != 0 &&
         requested <= output_capacity &&
         UCharArray::mixed_full(out0, output_capacity, output_before)))))
    Ensure
      GlobalStrings(LitMap) *
      ((ca0 == 0 && CircularAreaErrorResult(__return) && emp) ||
      (ca0 != 0 && out0 == 0 && CircularAreaErrorResult(__return) &&
       CircularAreaBackingResource(ca0, data_buffer, readidx, writeidx,
                                   area_length, b_status, operations,
                                   logical, physical)) ||
      (ca0 != 0 && out0 != 0 &&
       (requested == 0 || CircularAreaEmptyResult(logical, 1)) &&
       CircularAreaErrorResult(__return) &&
       CircularAreaBackingResource(ca0, data_buffer, readidx, writeidx,
                                   area_length, b_status, operations,
                                   logical, physical) *
       UCharArray::mixed_full(out0, output_capacity, output_before) *
       emp) ||
      (exists actual new_readidx bytes logical_after output_after,
       ca0 != 0 && out0 != 0 && data_buffer != 0 && requested > 0 &&
       __return == EOK &&
       CircularAreaEmptyResult(logical, 0) &&
       CircularAreaReadSuccess(readidx, area_length, requested, output_capacity,
                               logical, output_before, actual, new_readidx,
                               bytes, logical_after, output_after) &&
       CircularAreaBackingResource(ca0, data_buffer, new_readidx, writeidx,
                                   area_length, 0, operations,
                                   logical_after, physical) *
       UCharArray::mixed_full(out0, output_capacity, output_after) *
       emp)
      )
*/
{
    NULL_PARAM_CHECK(circular_area);
    NULL_PARAM_CHECK(output_buffer);
    /*@ 0 <= data_length && data_length <= UINT_MAX by local */
    CHECK(data_length > 0);

    if (CircularAreaIsEmpty(circular_area)
        /*@ where ca0 = ca0, data_buffer = data_buffer, readidx = readidx,
                  writeidx = writeidx,
                  area_length = area_length, b_status = b_status,
                  operations = operations, logical = logical, physical = physical,
                  LitMap = LitMap */) {
        /*@ Assert
          circular_area != 0 && output_buffer != 0 && data_length > 0 &&
          circular_area == ca0 && output_buffer == out0 && data_length == requested &&
          data_buffer != 0 && data_length <= output_capacity &&
          CircularAreaEmptyResult(logical, 1) &&
          GlobalStrings(LitMap) *
          CircularAreaBackingResource(ca0, data_buffer, readidx, writeidx,
                                      area_length, b_status, operations,
                                      logical, physical) *
          UCharArray::mixed_full(output_buffer, output_capacity, output_before) *
          emp
        */
        return ERROR;
    }

    data_length = (data_length > CircularAreaGetDataLength(circular_area)
                   /*@ where ca0 = ca0, data_buffer = data_buffer, readidx = readidx,
                             writeidx = writeidx,
                             area_length = area_length, b_status = b_status,
                             operations = operations, logical = logical, physical = physical,
                             LitMap = LitMap */) ?
        CircularAreaGetDataLength(circular_area)
        /*@ where ca0 = ca0, data_buffer = data_buffer, readidx = readidx,
                  writeidx = writeidx,
                  area_length = area_length, b_status = b_status,
                  operations = operations, logical = logical, physical = physical,
                  LitMap = LitMap */ : data_length;

    if (CircularAreaDivideRdData(circular_area, data_length)
        /*@ where ca0 = ca0, d0 = data_length,
                  data_buffer = data_buffer, readidx = readidx,
                  writeidx = writeidx,
                  area_length = area_length, b_status = b_status,
                  operations = operations, logical = logical, physical = physical,
                  LitMap = LitMap */) {
        /*@ Assert
          circular_area == ca0 && output_buffer == out0 &&
          ca0 != 0 && out0 != 0 && data_buffer != 0 && requested > 0 &&
          CircularAreaEmptyResult(logical, 0) &&
          CircularAreaActualReadLength(logical, requested, data_length) &&
          0 < data_length && data_length <= output_capacity &&
          CircularAreaDivideRdDataResult(readidx, data_length, area_length, 1) &&
          CircularAreaLogicalState(readidx, writeidx, area_length, b_status,
                                   logical, physical) &&
          GlobalStrings(LitMap) *
          UCharArray::mixed_full(data_buffer, area_length, physical) *
          UCharArray::mixed_full(output_buffer, output_capacity, output_before) *
          store_ptr(&(ca0->data_buffer), data_buffer) *
          store_uchar(&(ca0->readidx), readidx) *
          store_uchar(&(ca0->writeidx), writeidx) *
          store_ptr(&(ca0->p_head), data_buffer) *
          store_ptr(&(ca0->p_tail), data_buffer + area_length) *
          store_uint(&(ca0->area_length), area_length) *
          store_int(&(ca0->b_status), b_status) *
          store_ptr(&(ca0->CircularAreaOperations), operations)
        */
        uint32 read_len_up = circular_area->area_length -
            circular_area->readidx;
        uint32 read_len_down = data_length - read_len_up;

        /*@ Assert
          circular_area == ca0 && output_buffer == out0 &&
          ca0 != 0 && out0 != 0 && data_buffer != 0 && requested > 0 &&
          CircularAreaEmptyResult(logical, 0) &&
          CircularAreaActualReadLength(logical, requested, data_length) &&
          0 < data_length && data_length <= output_capacity &&
          0 <= readidx && readidx < area_length &&
          read_len_up == area_length - readidx &&
          read_len_down == data_length - read_len_up &&
          read_len_up <= data_length &&
          CircularAreaDivideRdDataResult(readidx, data_length, area_length, 1) &&
          CircularAreaLogicalState(readidx, writeidx, area_length, b_status,
                                   logical, physical) &&
          CircularAreaLiveBytes(readidx, area_length, logical, physical) &&
          CircularAreaInitializedSlice(physical, readidx, area_length,
                                       sublist(0, read_len_up, logical)) &&
          GlobalStrings(LitMap) *
          UCharArray::mixed_seg(data_buffer, 0, readidx,
                                sublist(0, readidx, physical)) *
          UCharArray::mixed_seg(data_buffer, readidx, area_length,
                                sublist(readidx, area_length, physical)) *
          UCharArray::mixed_seg(output_buffer, 0, read_len_up,
                                sublist(0, read_len_up, output_before)) *
          UCharArray::mixed_seg(output_buffer, read_len_up, output_capacity,
                                sublist(read_len_up, output_capacity,
                                        output_before)) *
          store_ptr(&(ca0->data_buffer), data_buffer) *
          store_uchar(&(ca0->readidx), readidx) *
          store_uchar(&(ca0->writeidx), writeidx) *
          store_ptr(&(ca0->p_head), data_buffer) *
          store_ptr(&(ca0->p_tail), data_buffer + area_length) *
          store_uint(&(ca0->area_length), area_length) *
          store_int(&(ca0->b_status), b_status) *
          store_ptr(&(ca0->CircularAreaOperations), operations)
        */
        memcpy(output_buffer,
               &circular_area->data_buffer[circular_area->readidx],
               read_len_up)
        /*@ where dest_base = output_buffer, dest_lo = 0,
                  dest_hi = read_len_up,
                  src_base = data_buffer, src_lo = readidx,
                  src_hi = area_length,
                  dest_before = sublist(0, read_len_up, output_before),
                  src_contents = sublist(0, read_len_up, logical),
                  src_physical = physical */;
        /*@ Assert
          circular_area == ca0 && output_buffer == out0 &&
          ca0 != 0 && out0 != 0 && data_buffer != 0 && requested > 0 &&
          CircularAreaEmptyResult(logical, 0) &&
          CircularAreaActualReadLength(logical, requested, data_length) &&
          0 < data_length && data_length <= output_capacity &&
          0 <= read_len_down && read_len_down <= readidx &&
          read_len_up == area_length - readidx &&
          read_len_down == data_length - read_len_up &&
          CircularAreaDivideRdDataResult(readidx, data_length, area_length, 1) &&
          CircularAreaLogicalState(readidx, writeidx, area_length, b_status,
                                   logical, physical) &&
          CircularAreaLiveBytes(readidx, area_length, logical, physical) &&
          CircularAreaInitializedSlice(physical, 0, read_len_down,
                                       sublist(read_len_up, data_length, logical)) &&
          GlobalStrings(LitMap) *
          UCharArray::mixed_seg(data_buffer, 0, read_len_down,
                                sublist(0, read_len_down, physical)) *
          UCharArray::mixed_seg(data_buffer, read_len_down, readidx,
                                sublist(read_len_down, readidx, physical)) *
          UCharArray::mixed_seg(data_buffer, readidx, area_length,
                                sublist(readidx, area_length, physical)) *
          UCharArray::mixed_seg(output_buffer, 0, read_len_up,
                                CircularAreaSomeBytes(
                                  sublist(0, read_len_up, logical))) *
          UCharArray::mixed_seg(output_buffer, read_len_up, data_length,
                                sublist(read_len_up, data_length,
                                        output_before)) *
          UCharArray::mixed_seg(output_buffer, data_length, output_capacity,
                                sublist(data_length, output_capacity,
                                        output_before)) *
          store_ptr(&(ca0->data_buffer), data_buffer) *
          store_uchar(&(ca0->readidx), readidx) *
          store_uchar(&(ca0->writeidx), writeidx) *
          store_ptr(&(ca0->p_head), data_buffer) *
          store_ptr(&(ca0->p_tail), data_buffer + area_length) *
          store_uint(&(ca0->area_length), area_length) *
          store_int(&(ca0->b_status), b_status) *
          store_ptr(&(ca0->CircularAreaOperations), operations)
        */
        memcpy(output_buffer + read_len_up, circular_area->p_head,
               read_len_down)
        /*@ where dest_base = output_buffer, dest_lo = read_len_up,
                  dest_hi = data_length,
                  src_base = data_buffer, src_lo = 0,
                  src_hi = read_len_down,
                  dest_before = sublist(read_len_up, data_length, output_before),
                  src_contents = sublist(read_len_up, data_length, logical),
                  src_physical = physical */;

        circular_area->readidx = read_len_down;
    } else {
        /*@ Assert
          circular_area == ca0 && output_buffer == out0 &&
          ca0 != 0 && out0 != 0 && data_buffer != 0 && requested > 0 &&
          CircularAreaEmptyResult(logical, 0) &&
          CircularAreaActualReadLength(logical, requested, data_length) &&
          0 < data_length && data_length <= output_capacity &&
          0 <= readidx && readidx + data_length <= area_length &&
          CircularAreaDivideRdDataResult(readidx, data_length, area_length, 0) &&
          CircularAreaLogicalState(readidx, writeidx, area_length, b_status,
                                   logical, physical) &&
          CircularAreaLiveBytes(readidx, area_length, logical, physical) &&
          CircularAreaInitializedSlice(physical, readidx,
                                       readidx + data_length,
                                       sublist(0, data_length, logical)) &&
          GlobalStrings(LitMap) *
          UCharArray::mixed_seg(data_buffer, 0, readidx,
                                sublist(0, readidx, physical)) *
          UCharArray::mixed_seg(data_buffer, readidx, readidx + data_length,
                                sublist(readidx, readidx + data_length, physical)) *
          UCharArray::mixed_seg(data_buffer, readidx + data_length, area_length,
                                sublist(readidx + data_length, area_length, physical)) *
          UCharArray::mixed_seg(output_buffer, 0, data_length,
                                sublist(0, data_length, output_before)) *
          UCharArray::mixed_seg(output_buffer, data_length, output_capacity,
                                sublist(data_length, output_capacity,
                                        output_before)) *
          store_ptr(&(ca0->data_buffer), data_buffer) *
          store_uchar(&(ca0->readidx), readidx) *
          store_uchar(&(ca0->writeidx), writeidx) *
          store_ptr(&(ca0->p_head), data_buffer) *
          store_ptr(&(ca0->p_tail), data_buffer + area_length) *
          store_uint(&(ca0->area_length), area_length) *
          store_int(&(ca0->b_status), b_status) *
          store_ptr(&(ca0->CircularAreaOperations), operations)
        */
        memcpy(output_buffer,
               &circular_area->data_buffer[circular_area->readidx],
               data_length)
        /*@ where dest_base = output_buffer, dest_lo = 0,
                  dest_hi = data_length,
                  src_base = data_buffer, src_lo = readidx,
                  src_hi = readidx + data_length,
                  dest_before = sublist(0, data_length, output_before),
                  src_contents = sublist(0, data_length, logical),
                  src_physical = physical */;
        circular_area->readidx =
            (circular_area->readidx + data_length) %
            circular_area->area_length;
    }

    circular_area->b_status = RET_FALSE;

    return EOK;
}
