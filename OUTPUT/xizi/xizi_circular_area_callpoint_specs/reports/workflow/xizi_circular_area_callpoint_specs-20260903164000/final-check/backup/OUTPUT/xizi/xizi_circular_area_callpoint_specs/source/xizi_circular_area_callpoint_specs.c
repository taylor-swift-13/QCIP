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
      (CircularAreaCallResult : Z -> Assertion)
      (CircularAreaReadCallResult : Z -> Z -> Z -> list Z -> Assertion)
      (CircularAreaEmptyResult : list Z -> Z -> Prop)
      (CircularAreaFullResult : Z -> list Z -> Z -> Prop)
      (CircularAreaDataLengthResult : list Z -> Z -> Prop)
      (CircularAreaMaxLengthResult : Z -> Z -> Prop)
      (CircularAreaFourBytes : list Z -> Prop)
      (CircularAreaForceWriteEffect :
         Z -> Z -> Z -> Z -> Z -> list Z -> list Z ->
         list (option Z) -> list (option Z) -> Prop)
      (CircularAreaForceWriteResource :
         Z -> Z -> Z -> Z -> Z -> list (option Z) -> Assertion)
*/

CircularAreaType CircularAreaInit(uint32 requested)
/*@ Require 4 <= requested && requested <= 256 && emp
    Ensure
      (__return == 0 && emp) ||
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
         logical physical LitMap
    Require GlobalStrings(LitMap) *
            CircularAreaBackingResource(
              circular_area, data_buffer, readidx, writeidx, area_length,
              b_status, operations, logical, physical)
    Ensure CircularAreaEmptyResult(logical, __return) &&
           GlobalStrings(LitMap) *
           CircularAreaBackingResource(
             circular_area, data_buffer, readidx, writeidx, area_length,
             b_status, operations, logical, physical)
*/;

x_bool CircularAreaIsFull(CircularAreaType circular_area)
/*@ state_spec
    With data_buffer readidx writeidx area_length b_status operations
         logical physical LitMap
    Require GlobalStrings(LitMap) *
            CircularAreaBackingResource(
              circular_area, data_buffer, readidx, writeidx, area_length,
              b_status, operations, logical, physical)
    Ensure CircularAreaFullResult(area_length, logical, __return) &&
           GlobalStrings(LitMap) *
           CircularAreaBackingResource(
             circular_area, data_buffer, readidx, writeidx, area_length,
             b_status, operations, logical, physical)
*/;

uint32 CircularAreaGetMaxLength(CircularAreaType circular_area)
/*@ state_spec
    With data_buffer readidx writeidx area_length b_status operations
         logical physical LitMap
    Require GlobalStrings(LitMap) *
            CircularAreaBackingResource(
              circular_area, data_buffer, readidx, writeidx, area_length,
              b_status, operations, logical, physical)
    Ensure CircularAreaMaxLengthResult(area_length, __return) &&
           GlobalStrings(LitMap) *
           CircularAreaBackingResource(
             circular_area, data_buffer, readidx, writeidx, area_length,
             b_status, operations, logical, physical)
*/;

uint32 CircularAreaGetDataLength(CircularAreaType circular_area)
/*@ state_spec
    With data_buffer readidx writeidx area_length b_status operations
         logical physical LitMap
    Require GlobalStrings(LitMap) *
            CircularAreaBackingResource(
              circular_area, data_buffer, readidx, writeidx, area_length,
              b_status, operations, logical, physical)
    Ensure CircularAreaDataLengthResult(logical, __return) &&
           GlobalStrings(LitMap) *
           CircularAreaBackingResource(
             circular_area, data_buffer, readidx, writeidx, area_length,
             b_status, operations, logical, physical)
*/;

uint32 CircularAreaRead(CircularAreaType circular_area,
                        uint8 *output_buffer,
                        uint32 data_length)
/*@ empty_one_spec
    With data_buffer empty_index area_length operations physical
         output_before LitMap
    Require data_length == 1 &&
            GlobalStrings(LitMap) *
            CircularAreaBackingResource(
              circular_area, data_buffer, empty_index, empty_index,
              area_length, 0, operations, nil, physical) *
            UCharArray::full(output_buffer, 1, output_before)
    Ensure __return == 1 &&
           GlobalStrings(LitMap) *
           CircularAreaBackingResource(
             circular_area, data_buffer, empty_index, empty_index,
             area_length, 0, operations, nil, physical) *
           UCharArray::full(output_buffer, 1, output_before)
*/;

uint32 CircularAreaRead(CircularAreaType circular_area,
                        uint8 *output_buffer,
                        uint32 data_length)
/*@ live_one_spec
    With data_buffer readidx writeidx area_length b_status operations
         byte suffix physical output_before LitMap
    Require data_length == 1 &&
            GlobalStrings(LitMap) *
            CircularAreaBackingResource(
              circular_area, data_buffer, readidx, writeidx, area_length,
              b_status, operations, cons(byte, suffix), physical) *
            UCharArray::full(output_buffer, 1, output_before)
    Ensure __return == 0 &&
           GlobalStrings(LitMap) *
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
    With data_buffer empty_index area_length operations physical byte LitMap
    Require data_length == 1 && b_force == 0 &&
            GlobalStrings(LitMap) *
            CircularAreaBackingResource(
              circular_area, data_buffer, empty_index, empty_index,
              area_length, 0, operations, nil, physical) *
            UCharArray::full(input_buffer, 1, cons(byte, nil))
    Ensure exists physical1,
           __return == 0 &&
           GlobalStrings(LitMap) *
           CircularAreaBackingResource(
             circular_area, data_buffer, empty_index,
             (empty_index + 1) % area_length, area_length, 1, operations,
             cons(byte, nil), physical1) *
           UCharArray::full(input_buffer, 1, cons(byte, nil))
*/;

uint32 CircularAreaWrite(CircularAreaType circular_area,
                         uint8 *input_buffer,
                         uint32 data_length,
                         x_bool b_force)
/*@ nonempty_one_spec
    With data_buffer readidx writeidx area_length b_status operations
         head suffix physical byte LitMap
    Require data_length == 1 && b_force == 0 &&
            Zlength(cons(head, suffix)) < area_length &&
            GlobalStrings(LitMap) *
            CircularAreaBackingResource(
              circular_area, data_buffer, readidx, writeidx, area_length,
              b_status, operations, cons(head, suffix), physical) *
            UCharArray::full(input_buffer, 1, cons(byte, nil))
    Ensure exists physical1,
           __return == 0 &&
           GlobalStrings(LitMap) *
           CircularAreaBackingResource(
             circular_area, data_buffer, readidx,
             (writeidx + 1) % area_length, area_length, 1, operations,
             app(cons(head, suffix), cons(byte, nil)), physical1) *
           UCharArray::full(input_buffer, 1, cons(byte, nil))
*/;

uint32 CircularAreaWrite(CircularAreaType circular_area,
                         uint8 *input_buffer,
                         uint32 data_length,
                         x_bool b_force)
/*@ force_fresh_full_spec
    With data_buffer operations physical input_contents LitMap
    Require data_length == 4 && b_force == 1 &&
            CircularAreaFourBytes(input_contents) &&
            xizi_circular_area_uninitialized(4, physical) &&
            GlobalStrings(LitMap) *
            CircularAreaBackingResource(
              circular_area, data_buffer, 0, 0, 4, 0, operations,
              nil, physical) *
            UCharArray::full(input_buffer, 4, input_contents)
    Ensure exists actual new_writeidx physical_after,
           CircularAreaForceWriteEffect(
             4, 0, 4, actual, new_writeidx, nil, input_contents,
             physical, physical_after) &&
           __return == 0 &&
           GlobalStrings(LitMap) *
           CircularAreaForceWriteResource(
             circular_area, data_buffer, new_writeidx, 4, operations,
             physical_after) *
           UCharArray::full(input_buffer, 4, input_contents)
*/;

void CircularAreaReset(CircularAreaType circular_area)
/*@ state_spec
    With data_buffer readidx writeidx area_length b_status operations
         logical physical LitMap
    Require GlobalStrings(LitMap) *
            CircularAreaBackingResource(
              circular_area, data_buffer, readidx, writeidx, area_length,
              b_status, operations, logical, physical)
    Ensure GlobalStrings(LitMap) *
           CircularAreaBackingResource(
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
/*@ With LitMap
    Require 4 <= requested && requested <= 256 && GlobalStrings(LitMap)
    Ensure GlobalStrings(LitMap) * CircularAreaCallResult(__return)
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
/*@ With output_before LitMap
    Require 4 <= requested && requested <= 256 &&
            GlobalStrings(LitMap) *
            UCharArray::full(output_buffer, 1, output_before)
    Ensure GlobalStrings(LitMap) *
           CircularAreaCallResult(__return) *
           UCharArray::full(output_buffer, 1, output_before)
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
/*@ With byte LitMap
    Require 4 <= requested && requested <= 256 &&
            GlobalStrings(LitMap) *
            UCharArray::full(input_buffer, 1, cons(byte, nil))
    Ensure GlobalStrings(LitMap) *
           CircularAreaCallResult(__return) *
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
/*@ With byte output_before LitMap
    Require 4 <= requested && requested <= 256 &&
            GlobalStrings(LitMap) *
            UCharArray::full(input_buffer, 1, cons(byte, nil)) *
            UCharArray::full(output_buffer, 1, output_before)
    Ensure GlobalStrings(LitMap) *
           UCharArray::full(input_buffer, 1, cons(byte, nil)) *
           CircularAreaReadCallResult(
             __return, output_buffer, byte, output_before)
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
/*@ With first_byte second_byte LitMap
    Require 4 <= requested && requested <= 256 &&
            GlobalStrings(LitMap) *
            UCharArray::full(first_input, 1, cons(first_byte, nil)) *
            UCharArray::full(second_input, 1, cons(second_byte, nil))
    Ensure GlobalStrings(LitMap) *
           CircularAreaCallResult(__return) *
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
/*@ With first_byte second_byte output_before LitMap
    Require 4 <= requested && requested <= 256 &&
            GlobalStrings(LitMap) *
            UCharArray::full(first_input, 1, cons(first_byte, nil)) *
            UCharArray::full(output_buffer, 1, output_before) *
            UCharArray::full(second_input, 1, cons(second_byte, nil))
    Ensure GlobalStrings(LitMap) *
           UCharArray::full(first_input, 1, cons(first_byte, nil)) *
           UCharArray::full(second_input, 1, cons(second_byte, nil)) *
           CircularAreaReadCallResult(
             __return, output_buffer, first_byte, output_before)
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
/*@ With byte LitMap
    Require 4 <= requested && requested <= 256 &&
            GlobalStrings(LitMap) *
            UCharArray::full(input_buffer, 1, cons(byte, nil))
    Ensure GlobalStrings(LitMap) *
           CircularAreaCallResult(__return) *
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

int xizi_circular_area_call_force_full_release(uint8 *input_buffer)
/*@ With input_contents LitMap
    Require CircularAreaFourBytes(input_contents) &&
            GlobalStrings(LitMap) *
            UCharArray::full(input_buffer, 4, input_contents)
    Ensure GlobalStrings(LitMap) *
           CircularAreaCallResult(__return) *
           UCharArray::full(input_buffer, 4, input_contents)
*/
{
    CircularAreaType area = CircularAreaInit(4);
    if (area == 0) {
        return 0;
    }
    /*@ Assert
          exists data_buffer operations physical,
          input_buffer == input_buffer@pre &&
          CircularAreaFourBytes(input_contents) &&
          xizi_circular_area_uninitialized(4, physical) &&
          GlobalStrings(LitMap) *
          CircularAreaBackingResource(
            area, data_buffer, 0, 0, 4, 0, operations, nil, physical) *
          UCharArray::full(input_buffer, 4, input_contents)
    */
    CircularAreaWrite(area, input_buffer, 4, 1)
      /*@ where (force_fresh_full_spec)
                input_contents = input_contents */;
    /*@ Assert
          exists data_buffer operations physical_after,
          input_buffer == input_buffer@pre &&
          CircularAreaFourBytes(input_contents) &&
          GlobalStrings(LitMap) *
          CircularAreaBackingResource(
            area, data_buffer, 0, 0, 4, 1, operations,
            input_contents, physical_after) *
          UCharArray::full(input_buffer, 4, input_contents)
    */
    CircularAreaRelease(area) /*@ where (state_spec) */;
    return 1;
}
