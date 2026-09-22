typedef unsigned char uint8;
typedef unsigned int uint32;
typedef int x_bool;

#define NONE ((void *)0)

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

/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_callpoint_specs.source
      Require Import xizi_circular_area_callpoint_specs_lib */
/*@ Extern Coq
      (xizi_circular_area_uninitialized : Z -> list (option Z) -> Prop)
      (CircularAreaBackingResource :
         Z -> Z -> Z -> Z -> Z -> Z -> Z -> list Z ->
         list (option Z) -> Assertion)
      (CircularAreaAlignedLength : Z -> Z -> Prop)
      (CircularAreaInitFailureResource : Z -> Assertion)
      (CircularAreaCallResult : Z -> Assertion)
      (CircularAreaReadCallResult : Z -> Z -> Z -> Assertion)
      (CircularAreaEmptyResult : list Z -> Z -> Prop)
      (CircularAreaFullResult : Z -> list Z -> Z -> Prop)
      (CircularAreaDataLengthResult : list Z -> Z -> Prop)
      (CircularAreaMaxLengthResult : Z -> Z -> Prop)
*/

CircularAreaType CircularAreaInit(uint32 requested)
/*@ Require 4 <= requested && requested <= 256 && emp
    Ensure
      (exists failed_area,
         __return == 0 &&
         CircularAreaInitFailureResource(failed_area)) ||
      (exists data_buffer area_length operations physical,
         __return != 0 &&
         CircularAreaAlignedLength(requested, area_length) &&
         xizi_circular_area_uninitialized(area_length, physical) &&
         CircularAreaBackingResource(
           __return, data_buffer, 0, 0, area_length, 0, operations,
           nil, physical))
*/;

x_bool CircularAreaIsEmpty(CircularAreaType circular_area)
/*@ state_spec
    With data_buffer readidx writeidx area_length b_status operations
         logical physical
    Require CircularAreaBackingResource(
              circular_area, data_buffer, readidx, writeidx, area_length,
              b_status, operations, logical, physical)
    Ensure CircularAreaEmptyResult(logical, __return) &&
           CircularAreaBackingResource(
             circular_area, data_buffer, readidx, writeidx, area_length,
             b_status, operations, logical, physical)
*/;

x_bool CircularAreaIsFull(CircularAreaType circular_area)
/*@ state_spec
    With data_buffer readidx writeidx area_length b_status operations
         logical physical
    Require CircularAreaBackingResource(
              circular_area, data_buffer, readidx, writeidx, area_length,
              b_status, operations, logical, physical)
    Ensure CircularAreaFullResult(area_length, logical, __return) &&
           CircularAreaBackingResource(
             circular_area, data_buffer, readidx, writeidx, area_length,
             b_status, operations, logical, physical)
*/;

uint32 CircularAreaGetMaxLength(CircularAreaType circular_area)
/*@ state_spec
    With data_buffer readidx writeidx area_length b_status operations
         logical physical
    Require CircularAreaBackingResource(
              circular_area, data_buffer, readidx, writeidx, area_length,
              b_status, operations, logical, physical)
    Ensure CircularAreaMaxLengthResult(area_length, __return) &&
           CircularAreaBackingResource(
             circular_area, data_buffer, readidx, writeidx, area_length,
             b_status, operations, logical, physical)
*/;

uint32 CircularAreaGetDataLength(CircularAreaType circular_area)
/*@ state_spec
    With data_buffer readidx writeidx area_length b_status operations
         logical physical
    Require CircularAreaBackingResource(
              circular_area, data_buffer, readidx, writeidx, area_length,
              b_status, operations, logical, physical)
    Ensure CircularAreaDataLengthResult(logical, __return) &&
           CircularAreaBackingResource(
             circular_area, data_buffer, readidx, writeidx, area_length,
             b_status, operations, logical, physical)
*/;

uint32 CircularAreaRead(CircularAreaType circular_area,
                        uint8 *output_buffer,
                        uint32 data_length)
/*@ empty_one_spec
    With data_buffer empty_index area_length operations physical
    Require data_length == 1 &&
            CircularAreaBackingResource(
              circular_area, data_buffer, empty_index, empty_index,
              area_length, 0, operations, nil, physical) *
            UCharArray::undef_full(output_buffer, 1)
    Ensure __return == 0 &&
           CircularAreaBackingResource(
             circular_area, data_buffer, empty_index, empty_index,
             area_length, 0, operations, nil, physical) *
           UCharArray::undef_full(output_buffer, 1)
*/;

uint32 CircularAreaRead(CircularAreaType circular_area,
                        uint8 *output_buffer,
                        uint32 data_length)
/*@ live_one_spec
    With data_buffer readidx writeidx area_length b_status operations
         byte suffix physical
    Require data_length == 1 &&
            CircularAreaBackingResource(
              circular_area, data_buffer, readidx, writeidx, area_length,
              b_status, operations, cons(byte, suffix), physical) *
            UCharArray::undef_full(output_buffer, 1)
    Ensure __return == 1 &&
           CircularAreaBackingResource(
             circular_area, data_buffer, (readidx + 1) % area_length,
             writeidx, area_length, 0, operations, suffix, physical) *
           UCharArray::full(output_buffer, 1, cons(byte, nil))
*/;

uint32 CircularAreaWrite(CircularAreaType circular_area,
                         uint8 *input_buffer,
                         uint32 data_length,
                         x_bool b_force)
/*@ empty_one_spec
    With data_buffer empty_index area_length operations physical byte
    Require data_length == 1 && b_force == 0 &&
            CircularAreaBackingResource(
              circular_area, data_buffer, empty_index, empty_index,
              area_length, 0, operations, nil, physical) *
            UCharArray::full(input_buffer, 1, cons(byte, nil))
    Ensure exists physical1,
           __return == 1 &&
           physical1 == replace_Znth(empty_index, Some(byte), physical) &&
           CircularAreaBackingResource(
             circular_area, data_buffer, empty_index,
             (empty_index + 1) % area_length, area_length, 0, operations,
             cons(byte, nil), physical1) *
           UCharArray::full(input_buffer, 1, cons(byte, nil))
*/;

uint32 CircularAreaWrite(CircularAreaType circular_area,
                         uint8 *input_buffer,
                         uint32 data_length,
                         x_bool b_force)
/*@ nonempty_one_spec
    With data_buffer readidx writeidx area_length b_status operations
         head suffix physical byte
    Require data_length == 1 && b_force == 0 &&
            Zlength(cons(head, suffix)) < area_length &&
            CircularAreaBackingResource(
              circular_area, data_buffer, readidx, writeidx, area_length,
              b_status, operations, cons(head, suffix), physical) *
            UCharArray::full(input_buffer, 1, cons(byte, nil))
    Ensure exists physical1 new_status,
           __return == 1 &&
           physical1 == replace_Znth(writeidx, Some(byte), physical) &&
           CircularAreaBackingResource(
             circular_area, data_buffer, readidx,
             (writeidx + 1) % area_length, area_length, new_status, operations,
             app(cons(head, suffix), cons(byte, nil)), physical1) *
           UCharArray::full(input_buffer, 1, cons(byte, nil))
*/;

void CircularAreaReset(CircularAreaType circular_area)
/*@ state_spec
    With data_buffer readidx writeidx area_length b_status operations
         logical physical
    Require CircularAreaBackingResource(
              circular_area, data_buffer, readidx, writeidx, area_length,
              b_status, operations, logical, physical)
    Ensure CircularAreaBackingResource(
             circular_area, data_buffer, 0, 0, area_length, 0, operations,
             nil, physical)
*/;

void CircularAreaRelease(CircularAreaType circular_area)
/*@ state_spec
    With data_buffer readidx writeidx area_length b_status operations
         logical physical
    Require CircularAreaBackingResource(
              circular_area, data_buffer, readidx, writeidx, area_length,
              b_status, operations, logical, physical)
    Ensure emp
*/;

int xizi_circular_area_call_init_metadata_release(uint32 requested)
/*@ Require 4 <= requested && requested <= 256 && emp
    Ensure CircularAreaCallResult(__return)
*/
{
    CircularAreaType area = CircularAreaInit(requested);
    if (area == 0) {
        return 0;
    }
    CircularAreaIsEmpty(area) /*@ where (state_spec) */;
    CircularAreaIsFull(area) /*@ where (state_spec) */;
    CircularAreaGetMaxLength(area) /*@ where (state_spec) */;
    CircularAreaGetDataLength(area) /*@ where (state_spec) */;
    CircularAreaRelease(area) /*@ where (state_spec) */;
    return 1;
}

int xizi_circular_area_call_init_empty_read_release(
    uint32 requested, uint8 *output_buffer)
/*@ Require 4 <= requested && requested <= 256 &&
            UCharArray::undef_full(output_buffer, 1)
    Ensure CircularAreaCallResult(__return) *
           UCharArray::undef_full(output_buffer, 1)
*/
{
    CircularAreaType area = CircularAreaInit(requested);
    if (area == 0) {
        return 0;
    }
    CircularAreaRead(area, output_buffer, 1)
      /*@ where (empty_one_spec) */;
    CircularAreaRelease(area) /*@ where (state_spec) */;
    return 1;
}

int xizi_circular_area_call_init_first_write_release(
    uint32 requested, uint8 *input_buffer)
/*@ With byte
    Require 4 <= requested && requested <= 256 &&
            UCharArray::full(input_buffer, 1, cons(byte, nil))
    Ensure CircularAreaCallResult(__return) *
           UCharArray::full(input_buffer, 1, cons(byte, nil))
*/
{
    CircularAreaType area = CircularAreaInit(requested);
    if (area == 0) {
        return 0;
    }
    CircularAreaWrite(area, input_buffer, 1, 0)
      /*@ where (empty_one_spec) byte = byte */;
    CircularAreaRelease(area) /*@ where (state_spec) */;
    return 1;
}

int xizi_circular_area_call_write_read_release(
    uint32 requested, uint8 *input_buffer, uint8 *output_buffer)
/*@ With byte
    Require 4 <= requested && requested <= 256 &&
            UCharArray::full(input_buffer, 1, cons(byte, nil)) *
            UCharArray::undef_full(output_buffer, 1)
    Ensure UCharArray::full(input_buffer, 1, cons(byte, nil)) *
           CircularAreaReadCallResult(__return, output_buffer, byte)
*/
{
    CircularAreaType area = CircularAreaInit(requested);
    if (area == 0) {
        return 0;
    }
    CircularAreaWrite(area, input_buffer, 1, 0)
      /*@ where (empty_one_spec) byte = byte */;
    CircularAreaRead(area, output_buffer, 1)
      /*@ where (live_one_spec) byte = byte */;
    CircularAreaRelease(area) /*@ where (state_spec) */;
    return 1;
}

int xizi_circular_area_call_repeated_write_release(
    uint32 requested, uint8 *first_input, uint8 *second_input)
/*@ With first_byte second_byte
    Require 4 <= requested && requested <= 256 &&
            UCharArray::full(first_input, 1, cons(first_byte, nil)) *
            UCharArray::full(second_input, 1, cons(second_byte, nil))
    Ensure CircularAreaCallResult(__return) *
           UCharArray::full(first_input, 1, cons(first_byte, nil)) *
           UCharArray::full(second_input, 1, cons(second_byte, nil))
*/
{
    CircularAreaType area = CircularAreaInit(requested);
    if (area == 0) {
        return 0;
    }
    CircularAreaWrite(area, first_input, 1, 0)
      /*@ where (empty_one_spec) byte = first_byte */;
    CircularAreaWrite(area, second_input, 1, 0)
      /*@ where (nonempty_one_spec) byte = second_byte */;
    CircularAreaRelease(area) /*@ where (state_spec) */;
    return 1;
}

int xizi_circular_area_call_read_then_write_release(
    uint32 requested, uint8 *first_input, uint8 *output_buffer,
    uint8 *second_input)
/*@ With first_byte second_byte
    Require 4 <= requested && requested <= 256 &&
            UCharArray::full(first_input, 1, cons(first_byte, nil)) *
            UCharArray::undef_full(output_buffer, 1) *
            UCharArray::full(second_input, 1, cons(second_byte, nil))
    Ensure UCharArray::full(first_input, 1, cons(first_byte, nil)) *
           UCharArray::full(second_input, 1, cons(second_byte, nil)) *
           CircularAreaReadCallResult(__return, output_buffer, first_byte)
*/
{
    CircularAreaType area = CircularAreaInit(requested);
    if (area == 0) {
        return 0;
    }
    CircularAreaWrite(area, first_input, 1, 0)
      /*@ where (empty_one_spec) byte = first_byte */;
    CircularAreaRead(area, output_buffer, 1)
      /*@ where (live_one_spec) byte = first_byte */;
    CircularAreaWrite(area, second_input, 1, 0)
      /*@ where (empty_one_spec) byte = second_byte */;
    CircularAreaRelease(area) /*@ where (state_spec) */;
    return 1;
}

int xizi_circular_area_call_reset_release(uint32 requested,
                                          uint8 *input_buffer)
/*@ With byte
    Require 4 <= requested && requested <= 256 &&
            UCharArray::full(input_buffer, 1, cons(byte, nil))
    Ensure CircularAreaCallResult(__return) *
           UCharArray::full(input_buffer, 1, cons(byte, nil))
*/
{
    CircularAreaType area = CircularAreaInit(requested);
    if (area == 0) {
        return 0;
    }
    CircularAreaWrite(area, input_buffer, 1, 0)
      /*@ where (empty_one_spec) byte = byte */;
    CircularAreaReset(area) /*@ where (state_spec) */;
    CircularAreaIsEmpty(area) /*@ where (state_spec) */;
    CircularAreaGetDataLength(area) /*@ where (state_spec) */;
    CircularAreaRelease(area) /*@ where (state_spec) */;
    return 1;
}
