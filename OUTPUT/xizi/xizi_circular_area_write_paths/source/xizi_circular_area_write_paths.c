/*@ Import Coq From QCIPLib.xizi.xizi_circular_area_write_paths Require Import xizi_circular_area_write_paths_lib */
/*@ Extern Coq (circular_area_state :: *) */
/*@ Extern Coq (CircularAreaWriteDestination: Z -> Z -> Z -> Prop) */
/*@ Extern Coq (ca_capacity: circular_area_state -> Z) */
/*@ Extern Coq (ca_contents: circular_area_state -> list Z) */
/*@ Extern Coq (CircularAreaLogicalState: Z -> Z -> Z -> Z -> list Z -> list (option Z) -> Prop) */
/*@ Extern Coq (CircularAreaDescriptorOwnership: circular_area_state -> Z -> Assertion) */
/*@ Extern Coq (CircularAreaWriteInput: circular_area_state -> list Z -> Z -> Z -> Z -> Z -> Assertion) */
/*@ Extern Coq (CircularAreaInputOwnership: Z -> Z -> list Z -> Assertion) */
/*@ Extern Coq (CircularAreaStateFullResult: circular_area_state -> Z -> Prop) */
/*@ Extern Coq (CircularAreaStateDataLengthResult: circular_area_state -> Z -> Prop) */
/*@ Extern Coq (CircularAreaFullByFieldsResult: Z -> Z -> Z -> Z -> Prop) */
/*@ Extern Coq (CircularAreaDataLengthByFieldsResult: Z -> Z -> Z -> Z -> Z -> Prop) */
/*@ Extern Coq (CircularAreaDivideWrDataResult: Z -> Z -> Z -> Z -> Prop) */
/*@ Extern Coq (UCharArray::mixed_full: Z -> Z -> list (option Z) -> Assertion) */
/*@ Extern Coq (UCharArray::mixed_seg: Z -> Z -> Z -> list (option Z) -> Assertion) */
/*@ Extern Coq (UCharArray::seg: Z -> Z -> Z -> list Z -> Assertion) */
/*@ Extern Coq (UCharArray::full: Z -> Z -> list Z -> Assertion) */

typedef unsigned char uint8;
typedef unsigned int uint32;

void *memcpy(uint8 *dest, uint8 *src, uint32 n)
/*@ memcpy_spec
    With (dst_before: list (option Z)) (src_contents: list Z)
    Require n == Zlength(dst_before) && n == Zlength(src_contents) &&
      UCharArray::mixed_seg(dest, 0, n, dst_before) *
      UCharArray::seg(src, 0, n, src_contents)
    Ensure __return == dest &&
      UCharArray::seg(dest, 0, n, src_contents) *
      UCharArray::seg(src, 0, n, src_contents)
*/;
typedef int x_bool;
struct CircularArea;
typedef struct CircularArea *CircularAreaType;

#define NONE ((void *)0)
#define RET_TRUE 1
#define RET_FALSE 0
#define EOK 0
#define ERROR 1
#define NULL_PARAM_CHECK(p) { if ((p) == NONE) return ERROR; }
#define CHECK(cond) { if (!(cond)) return ERROR; }
// #define KPrintf(...) ((void)0)

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
/*@ is_full_spec
    With state data_buffer operations readidx writeidx b_status physical
    Require circular_area != 0 && data_buffer != 0 &&
      CircularAreaLogicalState(readidx, writeidx, ca_capacity(state),
        b_status, ca_contents(state), physical) &&
      data_at(&(circular_area->data_buffer), uint8*, data_buffer) *
      data_at(&(circular_area->readidx), uint8, readidx) *
      data_at(&(circular_area->writeidx), uint8, writeidx) *
      data_at(&(circular_area->p_head), uint8*, data_buffer) *
      data_at(&(circular_area->p_tail), uint8*, data_buffer + ca_capacity(state)) *
      data_at(&(circular_area->area_length), uint32, ca_capacity(state)) *
      data_at(&(circular_area->b_status), x_bool, b_status) *
      data_at(&(circular_area->CircularAreaOperations), struct CircularAreaOps*, operations) *
      UCharArray::mixed_full(data_buffer, ca_capacity(state), physical)
    Ensure CircularAreaFullByFieldsResult(readidx, writeidx, b_status, __return) &&
      CircularAreaStateFullResult(state, __return) &&
      CircularAreaLogicalState(readidx, writeidx, ca_capacity(state),
        b_status, ca_contents(state), physical) &&
      data_at(&(circular_area->data_buffer), uint8*, data_buffer) *
      data_at(&(circular_area->readidx), uint8, readidx) *
      data_at(&(circular_area->writeidx), uint8, writeidx) *
      data_at(&(circular_area->p_head), uint8*, data_buffer) *
      data_at(&(circular_area->p_tail), uint8*, data_buffer + ca_capacity(state)) *
      data_at(&(circular_area->area_length), uint32, ca_capacity(state)) *
      data_at(&(circular_area->b_status), x_bool, b_status) *
      data_at(&(circular_area->CircularAreaOperations), struct CircularAreaOps*, operations) *
      UCharArray::mixed_full(data_buffer, ca_capacity(state), physical)
*/
{
    NULL_PARAM_CHECK(circular_area);

    if ((circular_area->readidx == circular_area->writeidx) &&
        circular_area->b_status) {
        // KPrintf("the circular area is full\n");
        return RET_TRUE;
    } else {
        return RET_FALSE;
    }
}


uint32 CircularAreaGetDataLength(CircularAreaType circular_area)
/*@ get_data_length_spec
    With state data_buffer operations readidx writeidx b_status physical
    Require circular_area != 0 && data_buffer != 0 &&
      CircularAreaLogicalState(readidx, writeidx, ca_capacity(state),
        b_status, ca_contents(state), physical) &&
      data_at(&(circular_area->data_buffer), uint8*, data_buffer) *
      data_at(&(circular_area->readidx), uint8, readidx) *
      data_at(&(circular_area->writeidx), uint8, writeidx) *
      data_at(&(circular_area->p_head), uint8*, data_buffer) *
      data_at(&(circular_area->p_tail), uint8*, data_buffer + ca_capacity(state)) *
      data_at(&(circular_area->area_length), uint32, ca_capacity(state)) *
      data_at(&(circular_area->b_status), x_bool, b_status) *
      data_at(&(circular_area->CircularAreaOperations), struct CircularAreaOps*, operations) *
      UCharArray::mixed_full(data_buffer, ca_capacity(state), physical)
    Ensure CircularAreaDataLengthByFieldsResult(readidx, writeidx, b_status,
        ca_capacity(state), __return) &&
      CircularAreaStateDataLengthResult(state, __return) &&
      CircularAreaLogicalState(readidx, writeidx, ca_capacity(state),
        b_status, ca_contents(state), physical) &&
      data_at(&(circular_area->data_buffer), uint8*, data_buffer) *
      data_at(&(circular_area->readidx), uint8, readidx) *
      data_at(&(circular_area->writeidx), uint8, writeidx) *
      data_at(&(circular_area->p_head), uint8*, data_buffer) *
      data_at(&(circular_area->p_tail), uint8*, data_buffer + ca_capacity(state)) *
      data_at(&(circular_area->area_length), uint32, ca_capacity(state)) *
      data_at(&(circular_area->b_status), x_bool, b_status) *
      data_at(&(circular_area->CircularAreaOperations), struct CircularAreaOps*, operations) *
      UCharArray::mixed_full(data_buffer, ca_capacity(state), physical)
*/
{
    NULL_PARAM_CHECK(circular_area);

    if (CircularAreaIsFull(circular_area)
      /*@ where(is_full_spec) state = state, data_buffer = data_buffer,
           operations = operations, readidx = readidx, writeidx = writeidx,
           b_status = b_status, physical = physical */) {
        return circular_area->area_length;
    } else {
        return (circular_area->writeidx + circular_area->area_length -
                circular_area->readidx) % circular_area->area_length;
    }
}


static uint32 CircularAreaDivideWrData(CircularAreaType circular_area,
                                       uint32 data_length)
/*@ divide_wr_data_spec
    With capacity writeidx0
    Require circular_area != 0 && 0 < capacity && capacity <= 256 &&
      0 <= data_length && data_length <= capacity &&
      0 <= writeidx0 && writeidx0 < capacity &&
      data_at(&(circular_area->writeidx), uint8, writeidx0) *
      data_at(&(circular_area->area_length), uint32, capacity)
    Ensure CircularAreaDivideWrDataResult(writeidx0, data_length,
        capacity, __return) &&
      data_at(&(circular_area->writeidx), uint8, writeidx0) *
      data_at(&(circular_area->area_length), uint32, capacity)
*/
{
    NULL_PARAM_CHECK(circular_area);

    if (circular_area->writeidx + data_length <= circular_area->area_length) {
        return RET_FALSE;
    } else {
        return RET_TRUE;
    }
}

/*@ Extern Coq (CircularAreaWriteInvalidParameters: Z -> Z -> Z -> Prop) */
/*@ Extern Coq (CircularAreaWriteNormalParameters: circular_area_state -> Z -> Z -> Z -> Z -> Prop) */
/*@ Extern Coq (CircularAreaWriteForceParameters: circular_area_state -> Z -> Z -> Z -> Z -> Prop) */
/*@ Extern Coq (CircularAreaWriteInvalidResult: circular_area_state -> Z -> circular_area_state -> Prop) */
/*@ Extern Coq (CircularAreaWriteNormalResult: circular_area_state -> Z -> list Z -> Z -> circular_area_state -> Prop) */
/*@ Extern Coq (CircularAreaWriteForceResult: circular_area_state -> list Z -> Z -> circular_area_state -> Prop) */


uint32 CircularAreaWriteInvalid(CircularAreaType circular_area, uint8 *input_buffer, uint32 data_length, x_bool b_force)
/*@ write_invalid_spec
    With (state: circular_area_state) (input_contents: list Z)
    Require CircularAreaWriteInvalidParameters(circular_area, input_buffer, data_length) &&
      CircularAreaWriteInput(state, input_contents,
      circular_area, input_buffer, data_length, b_force)
    Ensure exists state_after,
      CircularAreaWriteInvalidResult(state, __return, state_after) &&
      CircularAreaDescriptorOwnership(state_after, circular_area) *
      CircularAreaInputOwnership(input_buffer@pre, data_length@pre, input_contents)
*/
{
    uint32 free_len;
    uint32 input_offset = 0;

    /*@ Assert
      CircularAreaWriteInvalidParameters(circular_area@pre, input_buffer@pre, data_length@pre) && (circular_area == 0 || input_buffer == 0 || data_length == 0) &&
      circular_area == circular_area@pre && input_buffer == input_buffer@pre &&
      data_length == data_length@pre && b_force == b_force@pre && input_offset == 0 &&
      has_permission(&free_len) *
      CircularAreaWriteInput(state, input_contents, circular_area@pre,
        input_buffer@pre, data_length@pre, b_force@pre)
    */
    NULL_PARAM_CHECK(circular_area);
    NULL_PARAM_CHECK(input_buffer);
    CHECK(data_length > 0);

    /*@ Assert exists data_buffer operations readidx writeidx b_status physical,
      CircularAreaWriteInvalidParameters(circular_area@pre, input_buffer@pre, data_length@pre) &&
      circular_area != 0 && input_buffer != 0 && data_buffer != 0 &&
      circular_area == circular_area@pre && b_force == b_force@pre &&
      input_buffer == input_buffer@pre && data_length == data_length@pre &&
      input_offset == 0 && data_length > 0 &&
      Zlength(input_contents) == data_length &&
      CircularAreaLogicalState(readidx, writeidx, ca_capacity(state),
        b_status, ca_contents(state), physical) &&
      has_permission(&free_len) *
      data_at(&(circular_area->data_buffer), uint8*, data_buffer) *
      data_at(&(circular_area->readidx), uint8, readidx) *
      data_at(&(circular_area->writeidx), uint8, writeidx) *
      data_at(&(circular_area->p_head), uint8*, data_buffer) *
      data_at(&(circular_area->p_tail), uint8*, data_buffer + ca_capacity(state)) *
      data_at(&(circular_area->area_length), uint32, ca_capacity(state)) *
      data_at(&(circular_area->b_status), x_bool, b_status) *
      data_at(&(circular_area->CircularAreaOperations), struct CircularAreaOps*, operations) *
      UCharArray::mixed_full(data_buffer, ca_capacity(state), physical) *
      UCharArray::full(input_buffer, data_length, input_contents)
    */
    free_len = circular_area->area_length - CircularAreaGetDataLength(circular_area)
      ;

    if(!b_force) {
        if(0 == free_len) {
            return ERROR;
        }
        if(data_length > free_len) {
            data_length = free_len;
        }
    } else {
        if(data_length > circular_area->area_length) {
            input_offset = data_length - circular_area->area_length;
            input_buffer += input_offset;
            data_length = circular_area->area_length;
        }
        if(data_length > free_len) {
            circular_area->readidx = (circular_area->readidx + (data_length - free_len)) % circular_area->area_length;
            /* Dropped every old byte. Mark empty so the following write can fill it. */
            if(circular_area->readidx == circular_area->writeidx) {
                circular_area->b_status = RET_FALSE;
            }
        }
    }

    if(CircularAreaDivideWrData(circular_area, data_length)) {
        uint32 write_len_up = circular_area->area_length - circular_area->writeidx;
        uint32 write_len_down = data_length - write_len_up;
        uint8 *dest_ptr = &circular_area->data_buffer[circular_area->writeidx];

        /*@ Assert exists data_buffer operations readidx writeidx b_status physical readidx_mid status_mid,
          has_permission(&free_len) *
          (CircularAreaWriteInvalidParameters(circular_area@pre, input_buffer@pre, data_length@pre) &&
           input_buffer == input_buffer@pre + input_offset &&
           0 <= writeidx && writeidx < ca_capacity(state) &&
           CircularAreaLogicalState(readidx, writeidx, ca_capacity(state),
             b_status, ca_contents(state), physical) &&
           circular_area == circular_area@pre && b_force == b_force@pre &&
           CircularAreaWriteDestination(data_buffer, writeidx, dest_ptr) &&
           circular_area != 0 && input_buffer@pre != 0 && data_buffer != 0 &&
           data_length@pre > 0 && Zlength(input_contents) == data_length@pre &&
           write_len_up == ca_capacity(state) - writeidx &&
           write_len_down == data_length - write_len_up &&
           input_offset + data_length <= data_length@pre && 0 <= write_len_down &&
           write_len_down <= writeidx &&
           (readidx_mid != writeidx || status_mid == 0) &&
           ((b_force == 0 && Zlength(ca_contents(state)) < ca_capacity(state) &&
             input_offset == 0 && readidx_mid == readidx && status_mid == b_status &&
             0 < data_length && data_length <= data_length@pre &&
             data_length <= ca_capacity(state) - Zlength(ca_contents(state)) &&
             (data_length == data_length@pre ||
              data_length == ca_capacity(state) - Zlength(ca_contents(state)))) ||
            (b_force != 0 && input_offset + data_length == data_length@pre &&
             0 < data_length && data_length <= ca_capacity(state) &&
             (input_offset == 0 || data_length == ca_capacity(state)) &&
             ((data_length <= ca_capacity(state) - Zlength(ca_contents(state)) &&
               readidx_mid == readidx) ||
              (data_length > ca_capacity(state) - Zlength(ca_contents(state)) &&
               readidx_mid == (readidx + data_length -
                 (ca_capacity(state) - Zlength(ca_contents(state)))) % ca_capacity(state))))) && emp) *
          UCharArray::mixed_seg(data_buffer, 0, write_len_down,
            sublist(0, write_len_down, physical)) *
          UCharArray::mixed_seg(data_buffer, write_len_down, writeidx,
            sublist(write_len_down, writeidx, physical)) *
          UCharArray::mixed_seg(dest_ptr,
            0, ca_capacity(state) - writeidx,
            sublist(writeidx, ca_capacity(state), physical)) *
          data_at(&(circular_area->data_buffer), uint8*, data_buffer) *
          data_at(&(circular_area->readidx), uint8, readidx_mid) *
          data_at(&(circular_area->writeidx), uint8, writeidx) *
          data_at(&(circular_area->p_head), uint8*, data_buffer) *
          data_at(&(circular_area->p_tail), uint8*, data_buffer + ca_capacity(state)) *
          data_at(&(circular_area->area_length), uint32, ca_capacity(state)) *
          data_at(&(circular_area->b_status), x_bool, status_mid) *
          data_at(&(circular_area->CircularAreaOperations), struct CircularAreaOps*, operations) *
          UCharArray::seg(input_buffer@pre, 0, input_offset,
            sublist(0, input_offset, input_contents)) *
          UCharArray::seg(input_buffer, 0, write_len_up,
            sublist(input_offset, input_offset + write_len_up, input_contents)) *
          UCharArray::seg(input_buffer + write_len_up, 0, write_len_down,
            sublist(input_offset + write_len_up, input_offset + data_length, input_contents)) *
          UCharArray::seg(input_buffer@pre, input_offset + data_length, data_length@pre,
            sublist(input_offset + data_length, data_length@pre, input_contents))
        */
        memcpy(dest_ptr, input_buffer, write_len_up)
          ;
        memcpy(circular_area->p_head, input_buffer + write_len_up, write_len_down)
          ;

        circular_area->writeidx = write_len_down;
    } else {
        uint8 *dest_ptr = &circular_area->data_buffer[circular_area->writeidx];
        /*@ Assert exists data_buffer operations readidx writeidx b_status physical readidx_mid status_mid,
          has_permission(&free_len) *
          (CircularAreaWriteInvalidParameters(circular_area@pre, input_buffer@pre, data_length@pre) &&
           CircularAreaLogicalState(readidx, writeidx, ca_capacity(state),
             b_status, ca_contents(state), physical) &&
           circular_area == circular_area@pre && b_force == b_force@pre &&
           CircularAreaWriteDestination(data_buffer, writeidx, dest_ptr) &&
           circular_area != 0 && input_buffer@pre != 0 && data_buffer != 0 &&
           data_length@pre > 0 && Zlength(input_contents) == data_length@pre &&
           writeidx + data_length <= ca_capacity(state) &&
           Zlength(sublist(writeidx, writeidx + data_length,
             physical)) == data_length &&
           Zlength(sublist(input_offset, input_offset + data_length,
             input_contents)) == data_length &&
           input_buffer == input_buffer@pre + input_offset &&
           input_offset + data_length <= data_length@pre &&
           (readidx_mid != writeidx || status_mid == 0) &&
           ((b_force == 0 && Zlength(ca_contents(state)) < ca_capacity(state) &&
             input_offset == 0 && readidx_mid == readidx && status_mid == b_status &&
             0 < data_length && data_length <= data_length@pre &&
             data_length <= ca_capacity(state) - Zlength(ca_contents(state)) &&
             (data_length == data_length@pre ||
              data_length == ca_capacity(state) - Zlength(ca_contents(state)))) ||
            (b_force != 0 && input_offset + data_length == data_length@pre &&
             0 < data_length && data_length <= ca_capacity(state) &&
             (input_offset == 0 || data_length == ca_capacity(state)) &&
             ((data_length <= ca_capacity(state) - Zlength(ca_contents(state)) &&
               readidx_mid == readidx) ||
              (data_length > ca_capacity(state) - Zlength(ca_contents(state)) &&
               readidx_mid == (readidx + data_length -
                 (ca_capacity(state) - Zlength(ca_contents(state)))) % ca_capacity(state))))) && emp) *
          UCharArray::mixed_seg(data_buffer, 0, writeidx,
            sublist(0, writeidx, physical)) *
          UCharArray::mixed_seg(dest_ptr,
            0, data_length,
            sublist(writeidx, writeidx + data_length, physical)) *
          UCharArray::mixed_seg(data_buffer, writeidx + data_length, ca_capacity(state),
            sublist(writeidx + data_length, ca_capacity(state), physical)) *
          data_at(&(circular_area->data_buffer), uint8*, data_buffer) *
          data_at(&(circular_area->readidx), uint8, readidx_mid) *
          data_at(&(circular_area->writeidx), uint8, writeidx) *
          data_at(&(circular_area->p_head), uint8*, data_buffer) *
          data_at(&(circular_area->p_tail), uint8*, data_buffer + ca_capacity(state)) *
          data_at(&(circular_area->area_length), uint32, ca_capacity(state)) *
          data_at(&(circular_area->b_status), x_bool, status_mid) *
          data_at(&(circular_area->CircularAreaOperations), struct CircularAreaOps*, operations) *
          UCharArray::seg(input_buffer@pre, 0, input_offset,
            sublist(0, input_offset, input_contents)) *
          UCharArray::seg(input_buffer, 0, data_length,
            sublist(input_offset, input_offset + data_length, input_contents)) *
          UCharArray::seg(input_buffer@pre, input_offset + data_length, data_length@pre,
            sublist(input_offset + data_length, data_length@pre, input_contents))
        */
        memcpy(dest_ptr, input_buffer, data_length)
          ;
        circular_area->writeidx = (circular_area->writeidx + data_length) % circular_area->area_length;
    }

    circular_area->b_status = RET_TRUE;

    return EOK;
}


uint32 CircularAreaWriteNormal(CircularAreaType circular_area, uint8 *input_buffer, uint32 data_length, x_bool b_force)
/*@ write_normal_spec
    With (state: circular_area_state) (input_contents: list Z)
    Require CircularAreaWriteNormalParameters(state, circular_area, input_buffer, data_length, b_force) &&
      CircularAreaWriteInput(state, input_contents,
      circular_area, input_buffer, data_length, b_force)
    Ensure exists state_after,
      CircularAreaWriteNormalResult(state, data_length@pre, input_contents,
        __return, state_after) &&
      CircularAreaDescriptorOwnership(state_after, circular_area) *
      CircularAreaInputOwnership(input_buffer@pre, data_length@pre, input_contents)
*/
{
    uint32 free_len;
    uint32 input_offset = 0;

    /*@ Assert
      CircularAreaWriteNormalParameters(state, circular_area@pre, input_buffer@pre, data_length@pre, b_force@pre) && circular_area != 0 && input_buffer != 0 && data_length > 0 && b_force == 0 &&
      circular_area == circular_area@pre && input_buffer == input_buffer@pre &&
      data_length == data_length@pre && b_force == b_force@pre && input_offset == 0 &&
      has_permission(&free_len) *
      CircularAreaWriteInput(state, input_contents, circular_area@pre,
        input_buffer@pre, data_length@pre, b_force@pre)
    */
    NULL_PARAM_CHECK(circular_area);
    NULL_PARAM_CHECK(input_buffer);
    CHECK(data_length > 0);

    /*@ Assert exists data_buffer operations readidx writeidx b_status physical,
      CircularAreaWriteNormalParameters(state, circular_area@pre, input_buffer@pre, data_length@pre, b_force@pre) &&
      b_force == 0 && 0 < ca_capacity(state) && ca_capacity(state) <= 256 && 0 <= Zlength(ca_contents(state)) && Zlength(ca_contents(state)) <= ca_capacity(state) &&
      circular_area != 0 && input_buffer != 0 && data_buffer != 0 &&
      circular_area == circular_area@pre && b_force == b_force@pre &&
      input_buffer == input_buffer@pre && data_length == data_length@pre &&
      input_offset == 0 && data_length > 0 &&
      Zlength(input_contents) == data_length &&
      CircularAreaLogicalState(readidx, writeidx, ca_capacity(state),
        b_status, ca_contents(state), physical) &&
      has_permission(&free_len) *
      data_at(&(circular_area->data_buffer), uint8*, data_buffer) *
      data_at(&(circular_area->readidx), uint8, readidx) *
      data_at(&(circular_area->writeidx), uint8, writeidx) *
      data_at(&(circular_area->p_head), uint8*, data_buffer) *
      data_at(&(circular_area->p_tail), uint8*, data_buffer + ca_capacity(state)) *
      data_at(&(circular_area->area_length), uint32, ca_capacity(state)) *
      data_at(&(circular_area->b_status), x_bool, b_status) *
      data_at(&(circular_area->CircularAreaOperations), struct CircularAreaOps*, operations) *
      UCharArray::mixed_full(data_buffer, ca_capacity(state), physical) *
      UCharArray::full(input_buffer, data_length, input_contents)
    */
    free_len = circular_area->area_length - CircularAreaGetDataLength(circular_area)
      /*@ where(get_data_length_spec) state = state */
      ;

    /*@ Assert exists data_buffer operations readidx writeidx b_status physical,
      CircularAreaWriteNormalParameters(state, circular_area@pre, input_buffer@pre, data_length@pre, b_force@pre) &&
      b_force == 0 && 0 < ca_capacity(state) && ca_capacity(state) <= 256 && 0 <= Zlength(ca_contents(state)) && Zlength(ca_contents(state)) <= ca_capacity(state) &&
      circular_area != 0 && input_buffer != 0 && data_buffer != 0 &&
      circular_area == circular_area@pre && b_force == b_force@pre &&
      input_buffer == input_buffer@pre && data_length == data_length@pre &&
      input_offset == 0 && data_length > 0 &&
      Zlength(input_contents) == data_length &&
      CircularAreaLogicalState(readidx, writeidx, ca_capacity(state),
        b_status, ca_contents(state), physical) &&
      data_at(&free_len, uint32, ca_capacity(state) - Zlength(ca_contents(state))) *
      data_at(&(circular_area->data_buffer), uint8*, data_buffer) *
      data_at(&(circular_area->readidx), uint8, readidx) *
      data_at(&(circular_area->writeidx), uint8, writeidx) *
      data_at(&(circular_area->p_head), uint8*, data_buffer) *
      data_at(&(circular_area->p_tail), uint8*, data_buffer + ca_capacity(state)) *
      data_at(&(circular_area->area_length), uint32, ca_capacity(state)) *
      data_at(&(circular_area->b_status), x_bool, b_status) *
      data_at(&(circular_area->CircularAreaOperations), struct CircularAreaOps*, operations) *
      UCharArray::mixed_full(data_buffer, ca_capacity(state), physical) *
      UCharArray::full(input_buffer, data_length, input_contents)
    */

    if(!b_force) {
        if(0 == free_len) {
            return ERROR;
        }
        if(data_length > free_len) {
            data_length = free_len;
        }
    } else {
        if(data_length > circular_area->area_length) {
            input_offset = data_length - circular_area->area_length;
            input_buffer += input_offset;
            data_length = circular_area->area_length;
        }
        if(data_length > free_len) {
            circular_area->readidx = (circular_area->readidx + (data_length - free_len)) % circular_area->area_length;
            /* Dropped every old byte. Mark empty so the following write can fill it. */
            if(circular_area->readidx == circular_area->writeidx) {
                circular_area->b_status = RET_FALSE;
            }
        }
    }

    if(CircularAreaDivideWrData(circular_area, data_length)) {
        uint32 write_len_up = circular_area->area_length - circular_area->writeidx;
        uint32 write_len_down = data_length - write_len_up;
        uint8 *dest_ptr = &circular_area->data_buffer[circular_area->writeidx];

        /*@ Assert exists data_buffer operations readidx writeidx b_status physical readidx_mid status_mid,
          has_permission(&free_len) *
          (CircularAreaWriteNormalParameters(state, circular_area@pre, input_buffer@pre, data_length@pre, b_force@pre) &&
      b_force == 0 && 0 < ca_capacity(state) && ca_capacity(state) <= 256 && 0 <= Zlength(ca_contents(state)) && Zlength(ca_contents(state)) <= ca_capacity(state) &&
           input_buffer == input_buffer@pre + input_offset &&
           0 <= writeidx && writeidx < ca_capacity(state) &&
           CircularAreaLogicalState(readidx, writeidx, ca_capacity(state),
             b_status, ca_contents(state), physical) &&
           circular_area == circular_area@pre && b_force == b_force@pre &&
           CircularAreaWriteDestination(data_buffer, writeidx, dest_ptr) &&
           circular_area != 0 && input_buffer@pre != 0 && data_buffer != 0 &&
           data_length@pre > 0 && Zlength(input_contents) == data_length@pre &&
           write_len_up == ca_capacity(state) - writeidx &&
           write_len_down == data_length - write_len_up &&
           input_offset + data_length <= data_length@pre && 0 <= write_len_down &&
           write_len_down <= writeidx &&
           (readidx_mid != writeidx || status_mid == 0) &&
           (b_force == 0 && Zlength(ca_contents(state)) < ca_capacity(state) &&
             input_offset == 0 && readidx_mid == readidx && status_mid == b_status &&
             0 < data_length && data_length <= data_length@pre &&
             data_length <= ca_capacity(state) - Zlength(ca_contents(state)) &&
             (data_length == data_length@pre ||
              data_length == ca_capacity(state) - Zlength(ca_contents(state)))) && emp) *
          UCharArray::mixed_seg(data_buffer, 0, write_len_down,
            sublist(0, write_len_down, physical)) *
          UCharArray::mixed_seg(data_buffer, write_len_down, writeidx,
            sublist(write_len_down, writeidx, physical)) *
          UCharArray::mixed_seg(dest_ptr,
            0, ca_capacity(state) - writeidx,
            sublist(writeidx, ca_capacity(state), physical)) *
          data_at(&(circular_area->data_buffer), uint8*, data_buffer) *
          data_at(&(circular_area->readidx), uint8, readidx_mid) *
          data_at(&(circular_area->writeidx), uint8, writeidx) *
          data_at(&(circular_area->p_head), uint8*, data_buffer) *
          data_at(&(circular_area->p_tail), uint8*, data_buffer + ca_capacity(state)) *
          data_at(&(circular_area->area_length), uint32, ca_capacity(state)) *
          data_at(&(circular_area->b_status), x_bool, status_mid) *
          data_at(&(circular_area->CircularAreaOperations), struct CircularAreaOps*, operations) *
          UCharArray::seg(input_buffer@pre, 0, input_offset,
            sublist(0, input_offset, input_contents)) *
          UCharArray::seg(input_buffer, 0, write_len_up,
            sublist(input_offset, input_offset + write_len_up, input_contents)) *
          UCharArray::seg(input_buffer + write_len_up, 0, write_len_down,
            sublist(input_offset + write_len_up, input_offset + data_length, input_contents)) *
          UCharArray::seg(input_buffer@pre, input_offset + data_length, data_length@pre,
            sublist(input_offset + data_length, data_length@pre, input_contents))
        */
        memcpy(dest_ptr, input_buffer, write_len_up)
          ;
        memcpy(circular_area->p_head, input_buffer + write_len_up, write_len_down)
          ;

        circular_area->writeidx = write_len_down;
    } else {
        uint8 *dest_ptr = &circular_area->data_buffer[circular_area->writeidx];
        /*@ Assert exists data_buffer operations readidx writeidx b_status physical readidx_mid status_mid,
          has_permission(&free_len) *
          (CircularAreaWriteNormalParameters(state, circular_area@pre, input_buffer@pre, data_length@pre, b_force@pre) &&
      b_force == 0 && 0 < ca_capacity(state) && ca_capacity(state) <= 256 && 0 <= Zlength(ca_contents(state)) && Zlength(ca_contents(state)) <= ca_capacity(state) &&
           CircularAreaLogicalState(readidx, writeidx, ca_capacity(state),
             b_status, ca_contents(state), physical) &&
           circular_area == circular_area@pre && b_force == b_force@pre &&
           CircularAreaWriteDestination(data_buffer, writeidx, dest_ptr) &&
           circular_area != 0 && input_buffer@pre != 0 && data_buffer != 0 &&
           data_length@pre > 0 && Zlength(input_contents) == data_length@pre &&
           writeidx + data_length <= ca_capacity(state) &&
           Zlength(sublist(writeidx, writeidx + data_length,
             physical)) == data_length &&
           Zlength(sublist(input_offset, input_offset + data_length,
             input_contents)) == data_length &&
           input_buffer == input_buffer@pre + input_offset &&
           input_offset + data_length <= data_length@pre &&
           (readidx_mid != writeidx || status_mid == 0) &&
           (b_force == 0 && Zlength(ca_contents(state)) < ca_capacity(state) &&
             input_offset == 0 && readidx_mid == readidx && status_mid == b_status &&
             0 < data_length && data_length <= data_length@pre &&
             data_length <= ca_capacity(state) - Zlength(ca_contents(state)) &&
             (data_length == data_length@pre ||
              data_length == ca_capacity(state) - Zlength(ca_contents(state)))) && emp) *
          UCharArray::mixed_seg(data_buffer, 0, writeidx,
            sublist(0, writeidx, physical)) *
          UCharArray::mixed_seg(dest_ptr,
            0, data_length,
            sublist(writeidx, writeidx + data_length, physical)) *
          UCharArray::mixed_seg(data_buffer, writeidx + data_length, ca_capacity(state),
            sublist(writeidx + data_length, ca_capacity(state), physical)) *
          data_at(&(circular_area->data_buffer), uint8*, data_buffer) *
          data_at(&(circular_area->readidx), uint8, readidx_mid) *
          data_at(&(circular_area->writeidx), uint8, writeidx) *
          data_at(&(circular_area->p_head), uint8*, data_buffer) *
          data_at(&(circular_area->p_tail), uint8*, data_buffer + ca_capacity(state)) *
          data_at(&(circular_area->area_length), uint32, ca_capacity(state)) *
          data_at(&(circular_area->b_status), x_bool, status_mid) *
          data_at(&(circular_area->CircularAreaOperations), struct CircularAreaOps*, operations) *
          UCharArray::seg(input_buffer@pre, 0, input_offset,
            sublist(0, input_offset, input_contents)) *
          UCharArray::seg(input_buffer, 0, data_length,
            sublist(input_offset, input_offset + data_length, input_contents)) *
          UCharArray::seg(input_buffer@pre, input_offset + data_length, data_length@pre,
            sublist(input_offset + data_length, data_length@pre, input_contents))
        */
        memcpy(dest_ptr, input_buffer, data_length)
          ;
        circular_area->writeidx = (circular_area->writeidx + data_length) % circular_area->area_length;
    }

    circular_area->b_status = RET_TRUE;

    return EOK;
}


uint32 CircularAreaWriteForce(CircularAreaType circular_area, uint8 *input_buffer, uint32 data_length, x_bool b_force)
/*@ write_force_spec
    With (state: circular_area_state) (input_contents: list Z)
    Require CircularAreaWriteForceParameters(state, circular_area, input_buffer, data_length, b_force) &&
      CircularAreaWriteInput(state, input_contents,
      circular_area, input_buffer, data_length, b_force)
    Ensure exists state_after,
      CircularAreaWriteForceResult(state, input_contents, __return, state_after) &&
      CircularAreaDescriptorOwnership(state_after, circular_area) *
      CircularAreaInputOwnership(input_buffer@pre, data_length@pre, input_contents)
*/
{
    uint32 free_len;
    uint32 input_offset = 0;

    /*@ Assert
      CircularAreaWriteForceParameters(state, circular_area@pre, input_buffer@pre, data_length@pre, b_force@pre) && circular_area != 0 && input_buffer != 0 && data_length > 0 && b_force != 0 &&
      circular_area == circular_area@pre && input_buffer == input_buffer@pre &&
      data_length == data_length@pre && b_force == b_force@pre && input_offset == 0 &&
      has_permission(&free_len) *
      CircularAreaWriteInput(state, input_contents, circular_area@pre,
        input_buffer@pre, data_length@pre, b_force@pre)
    */
    NULL_PARAM_CHECK(circular_area);
    NULL_PARAM_CHECK(input_buffer);
    CHECK(data_length > 0);

    /*@ Assert exists data_buffer operations readidx writeidx b_status physical,
      CircularAreaWriteForceParameters(state, circular_area@pre, input_buffer@pre, data_length@pre, b_force@pre) &&
      b_force != 0 && 0 < ca_capacity(state) && ca_capacity(state) <= 256 && 0 <= Zlength(ca_contents(state)) && Zlength(ca_contents(state)) <= ca_capacity(state) &&
      circular_area != 0 && input_buffer != 0 && data_buffer != 0 &&
      circular_area == circular_area@pre && b_force == b_force@pre &&
      input_buffer == input_buffer@pre && data_length == data_length@pre &&
      input_offset == 0 && data_length > 0 &&
      Zlength(input_contents) == data_length &&
      CircularAreaLogicalState(readidx, writeidx, ca_capacity(state),
        b_status, ca_contents(state), physical) &&
      has_permission(&free_len) *
      data_at(&(circular_area->data_buffer), uint8*, data_buffer) *
      data_at(&(circular_area->readidx), uint8, readidx) *
      data_at(&(circular_area->writeidx), uint8, writeidx) *
      data_at(&(circular_area->p_head), uint8*, data_buffer) *
      data_at(&(circular_area->p_tail), uint8*, data_buffer + ca_capacity(state)) *
      data_at(&(circular_area->area_length), uint32, ca_capacity(state)) *
      data_at(&(circular_area->b_status), x_bool, b_status) *
      data_at(&(circular_area->CircularAreaOperations), struct CircularAreaOps*, operations) *
      UCharArray::mixed_full(data_buffer, ca_capacity(state), physical) *
      UCharArray::full(input_buffer, data_length, input_contents)
    */
    free_len = circular_area->area_length - CircularAreaGetDataLength(circular_area)
      /*@ where(get_data_length_spec) state = state */
      ;

    /*@ Assert exists data_buffer operations readidx writeidx b_status physical,
      CircularAreaWriteForceParameters(state, circular_area@pre, input_buffer@pre, data_length@pre, b_force@pre) &&
      b_force != 0 && 0 < ca_capacity(state) && ca_capacity(state) <= 256 && 0 <= Zlength(ca_contents(state)) && Zlength(ca_contents(state)) <= ca_capacity(state) &&
      circular_area != 0 && input_buffer != 0 && data_buffer != 0 &&
      circular_area == circular_area@pre && b_force == b_force@pre &&
      input_buffer == input_buffer@pre && data_length == data_length@pre &&
      input_offset == 0 && data_length > 0 &&
      Zlength(input_contents) == data_length &&
      CircularAreaLogicalState(readidx, writeidx, ca_capacity(state),
        b_status, ca_contents(state), physical) &&
      data_at(&free_len, uint32, ca_capacity(state) - Zlength(ca_contents(state))) *
      data_at(&(circular_area->data_buffer), uint8*, data_buffer) *
      data_at(&(circular_area->readidx), uint8, readidx) *
      data_at(&(circular_area->writeidx), uint8, writeidx) *
      data_at(&(circular_area->p_head), uint8*, data_buffer) *
      data_at(&(circular_area->p_tail), uint8*, data_buffer + ca_capacity(state)) *
      data_at(&(circular_area->area_length), uint32, ca_capacity(state)) *
      data_at(&(circular_area->b_status), x_bool, b_status) *
      data_at(&(circular_area->CircularAreaOperations), struct CircularAreaOps*, operations) *
      UCharArray::mixed_full(data_buffer, ca_capacity(state), physical) *
      UCharArray::full(input_buffer, data_length, input_contents)
    */

    if(!b_force) {
        if(0 == free_len) {
            return ERROR;
        }
        if(data_length > free_len) {
            data_length = free_len;
        }
    } else {
        if(data_length > circular_area->area_length) {
            input_offset = data_length - circular_area->area_length;
            input_buffer += input_offset;
            data_length = circular_area->area_length;
        }
        if(data_length > free_len) {
            circular_area->readidx = (circular_area->readidx + (data_length - free_len)) % circular_area->area_length;
            /* Dropped every old byte. Mark empty so the following write can fill it. */
            if(circular_area->readidx == circular_area->writeidx) {
                circular_area->b_status = RET_FALSE;
            }
        }
    }

    if(CircularAreaDivideWrData(circular_area, data_length)) {
        uint32 write_len_up = circular_area->area_length - circular_area->writeidx;
        uint32 write_len_down = data_length - write_len_up;
        uint8 *dest_ptr = &circular_area->data_buffer[circular_area->writeidx];

        /*@ Assert exists data_buffer operations readidx writeidx b_status physical readidx_mid status_mid,
          has_permission(&free_len) *
          (CircularAreaWriteForceParameters(state, circular_area@pre, input_buffer@pre, data_length@pre, b_force@pre) &&
      b_force != 0 && 0 < ca_capacity(state) && ca_capacity(state) <= 256 && 0 <= Zlength(ca_contents(state)) && Zlength(ca_contents(state)) <= ca_capacity(state) &&
           input_buffer == input_buffer@pre + input_offset &&
           0 <= writeidx && writeidx < ca_capacity(state) &&
           CircularAreaLogicalState(readidx, writeidx, ca_capacity(state),
             b_status, ca_contents(state), physical) &&
           circular_area == circular_area@pre && b_force == b_force@pre &&
           CircularAreaWriteDestination(data_buffer, writeidx, dest_ptr) &&
           circular_area != 0 && input_buffer@pre != 0 && data_buffer != 0 &&
           data_length@pre > 0 && Zlength(input_contents) == data_length@pre &&
           write_len_up == ca_capacity(state) - writeidx &&
           write_len_down == data_length - write_len_up &&
           input_offset + data_length <= data_length@pre && 0 <= write_len_down &&
           write_len_down <= writeidx &&
           (readidx_mid != writeidx || status_mid == 0) &&
           (b_force != 0 && input_offset + data_length == data_length@pre &&
             0 < data_length && data_length <= ca_capacity(state) &&
             (input_offset == 0 || data_length == ca_capacity(state)) &&
             ((data_length <= ca_capacity(state) - Zlength(ca_contents(state)) &&
               readidx_mid == readidx) ||
              (data_length > ca_capacity(state) - Zlength(ca_contents(state)) &&
               readidx_mid == (readidx + data_length -
                 (ca_capacity(state) - Zlength(ca_contents(state)))) % ca_capacity(state)))) && emp) *
          UCharArray::mixed_seg(data_buffer, 0, write_len_down,
            sublist(0, write_len_down, physical)) *
          UCharArray::mixed_seg(data_buffer, write_len_down, writeidx,
            sublist(write_len_down, writeidx, physical)) *
          UCharArray::mixed_seg(dest_ptr,
            0, ca_capacity(state) - writeidx,
            sublist(writeidx, ca_capacity(state), physical)) *
          data_at(&(circular_area->data_buffer), uint8*, data_buffer) *
          data_at(&(circular_area->readidx), uint8, readidx_mid) *
          data_at(&(circular_area->writeidx), uint8, writeidx) *
          data_at(&(circular_area->p_head), uint8*, data_buffer) *
          data_at(&(circular_area->p_tail), uint8*, data_buffer + ca_capacity(state)) *
          data_at(&(circular_area->area_length), uint32, ca_capacity(state)) *
          data_at(&(circular_area->b_status), x_bool, status_mid) *
          data_at(&(circular_area->CircularAreaOperations), struct CircularAreaOps*, operations) *
          UCharArray::seg(input_buffer@pre, 0, input_offset,
            sublist(0, input_offset, input_contents)) *
          UCharArray::seg(input_buffer, 0, write_len_up,
            sublist(input_offset, input_offset + write_len_up, input_contents)) *
          UCharArray::seg(input_buffer + write_len_up, 0, write_len_down,
            sublist(input_offset + write_len_up, input_offset + data_length, input_contents)) *
          UCharArray::seg(input_buffer@pre, input_offset + data_length, data_length@pre,
            sublist(input_offset + data_length, data_length@pre, input_contents))
        */
        memcpy(dest_ptr, input_buffer, write_len_up)
          ;
        memcpy(circular_area->p_head, input_buffer + write_len_up, write_len_down)
          ;

        circular_area->writeidx = write_len_down;
    } else {
        uint8 *dest_ptr = &circular_area->data_buffer[circular_area->writeidx];
        /*@ Assert exists data_buffer operations readidx writeidx b_status physical readidx_mid status_mid,
          has_permission(&free_len) *
          (CircularAreaWriteForceParameters(state, circular_area@pre, input_buffer@pre, data_length@pre, b_force@pre) &&
      b_force != 0 && 0 < ca_capacity(state) && ca_capacity(state) <= 256 && 0 <= Zlength(ca_contents(state)) && Zlength(ca_contents(state)) <= ca_capacity(state) &&
           CircularAreaLogicalState(readidx, writeidx, ca_capacity(state),
             b_status, ca_contents(state), physical) &&
           circular_area == circular_area@pre && b_force == b_force@pre &&
           CircularAreaWriteDestination(data_buffer, writeidx, dest_ptr) &&
           circular_area != 0 && input_buffer@pre != 0 && data_buffer != 0 &&
           data_length@pre > 0 && Zlength(input_contents) == data_length@pre &&
           writeidx + data_length <= ca_capacity(state) &&
           Zlength(sublist(writeidx, writeidx + data_length,
             physical)) == data_length &&
           Zlength(sublist(input_offset, input_offset + data_length,
             input_contents)) == data_length &&
           input_buffer == input_buffer@pre + input_offset &&
           input_offset + data_length <= data_length@pre &&
           (readidx_mid != writeidx || status_mid == 0) &&
           (b_force != 0 && input_offset + data_length == data_length@pre &&
             0 < data_length && data_length <= ca_capacity(state) &&
             (input_offset == 0 || data_length == ca_capacity(state)) &&
             ((data_length <= ca_capacity(state) - Zlength(ca_contents(state)) &&
               readidx_mid == readidx) ||
              (data_length > ca_capacity(state) - Zlength(ca_contents(state)) &&
               readidx_mid == (readidx + data_length -
                 (ca_capacity(state) - Zlength(ca_contents(state)))) % ca_capacity(state)))) && emp) *
          UCharArray::mixed_seg(data_buffer, 0, writeidx,
            sublist(0, writeidx, physical)) *
          UCharArray::mixed_seg(dest_ptr,
            0, data_length,
            sublist(writeidx, writeidx + data_length, physical)) *
          UCharArray::mixed_seg(data_buffer, writeidx + data_length, ca_capacity(state),
            sublist(writeidx + data_length, ca_capacity(state), physical)) *
          data_at(&(circular_area->data_buffer), uint8*, data_buffer) *
          data_at(&(circular_area->readidx), uint8, readidx_mid) *
          data_at(&(circular_area->writeidx), uint8, writeidx) *
          data_at(&(circular_area->p_head), uint8*, data_buffer) *
          data_at(&(circular_area->p_tail), uint8*, data_buffer + ca_capacity(state)) *
          data_at(&(circular_area->area_length), uint32, ca_capacity(state)) *
          data_at(&(circular_area->b_status), x_bool, status_mid) *
          data_at(&(circular_area->CircularAreaOperations), struct CircularAreaOps*, operations) *
          UCharArray::seg(input_buffer@pre, 0, input_offset,
            sublist(0, input_offset, input_contents)) *
          UCharArray::seg(input_buffer, 0, data_length,
            sublist(input_offset, input_offset + data_length, input_contents)) *
          UCharArray::seg(input_buffer@pre, input_offset + data_length, data_length@pre,
            sublist(input_offset + data_length, data_length@pre, input_contents))
        */
        memcpy(dest_ptr, input_buffer, data_length)
          ;
        circular_area->writeidx = (circular_area->writeidx + data_length) % circular_area->area_length;
    }

    circular_area->b_status = RET_TRUE;

    return EOK;
}
