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
/*@ Extern Coq (circular_area_state :: *) */
/*@ Extern Coq (forced_circular_area_state :: *) */
/*@ Extern Coq
      (ca_capacity : circular_area_state -> Z)
      (ca_contents : circular_area_state -> list Z)
      (Build_circular_area_state : Z -> list Z -> circular_area_state)
      (CircularAreaInitState : Z -> circular_area_state)
      (store_circular_area : circular_area_state -> Z -> Assertion)
      (store_forced_circular_area :
         forced_circular_area_state -> Z -> Assertion)
      (CircularAreaCallResult : Z -> Assertion)
      (CircularAreaReadCallResult :
         Z -> Z -> Z -> list (option Z) -> Assertion)
      (CircularAreaReadOneResult :
         circular_area_state -> circular_area_state -> Z ->
         list (option Z) -> list (option Z) -> Prop)
      (CircularAreaStateEmptyResult : circular_area_state -> Z -> Prop)
      (CircularAreaStateFullResult : circular_area_state -> Z -> Prop)
      (CircularAreaStateDataLengthResult :
         circular_area_state -> Z -> Prop)
      (CircularAreaFourBytes : list Z -> Prop)
      (CircularAreaForceWriteResult :
         circular_area_state -> Z -> list Z -> Z ->
         forced_circular_area_state -> Prop)
*/

CircularAreaType CircularAreaInit(uint32 requested)
/*@ Require 4 <= requested && requested <= 256 && emp
    Ensure
      (__return == 0 && emp) ||
      (__return != 0 &&
       store_circular_area(CircularAreaInitState(requested), __return))
*/;

x_bool CircularAreaIsEmpty(CircularAreaType circular_area)
/*@ state_spec
    With (state : circular_area_state) LitMap
    Require GlobalStrings(LitMap) *
            store_circular_area(state, circular_area)
    Ensure CircularAreaStateEmptyResult(state, __return) &&
           GlobalStrings(LitMap) *
           store_circular_area(state, circular_area)
*/;

x_bool CircularAreaIsFull(CircularAreaType circular_area)
/*@ state_spec
    With (state : circular_area_state) LitMap
    Require GlobalStrings(LitMap) *
            store_circular_area(state, circular_area)
    Ensure CircularAreaStateFullResult(state, __return) &&
           GlobalStrings(LitMap) *
           store_circular_area(state, circular_area)
*/;

uint32 CircularAreaGetMaxLength(CircularAreaType circular_area)
/*@ state_spec
    With (state : circular_area_state) LitMap
    Require GlobalStrings(LitMap) *
            store_circular_area(state, circular_area)
    Ensure __return == ca_capacity(state) &&
           GlobalStrings(LitMap) *
           store_circular_area(state, circular_area)
*/;

uint32 CircularAreaGetDataLength(CircularAreaType circular_area)
/*@ state_spec
    With (state : circular_area_state) LitMap
    Require GlobalStrings(LitMap) *
            store_circular_area(state, circular_area)
    Ensure CircularAreaStateDataLengthResult(state, __return) &&
           GlobalStrings(LitMap) *
           store_circular_area(state, circular_area)
*/;

uint32 CircularAreaRead(CircularAreaType circular_area,
                        uint8 *output_buffer,
                        uint32 data_length)
/*@ read_one_spec
    With (state : circular_area_state)
         (output_before : list (option Z)) LitMap
    Require data_length == 1 &&
            GlobalStrings(LitMap) *
            store_circular_area(state, circular_area) *
            UCharArray::mixed_full(output_buffer, 1, output_before)
    Ensure exists state_after output_after,
           CircularAreaReadOneResult(
             state, state_after, __return,
             output_before, output_after) &&
           GlobalStrings(LitMap) *
           store_circular_area(state_after, circular_area) *
           UCharArray::mixed_full(
             output_buffer, 1, output_after)
*/;

uint32 CircularAreaWrite(CircularAreaType circular_area,
                         uint8 *input_buffer,
                         uint32 data_length,
                         x_bool b_force)
/*@ empty_one_spec
    With (state : circular_area_state) capacity byte LitMap
    Require data_length == 1 && b_force == 0 &&
            ca_capacity(state) == capacity &&
            ca_contents(state) == nil &&
            GlobalStrings(LitMap) *
            store_circular_area(state, circular_area) *
            UCharArray::full(input_buffer, 1, cons(byte, nil))
    Ensure __return == 0 &&
           GlobalStrings(LitMap) *
           store_circular_area(
             Build_circular_area_state(capacity, cons(byte, nil)),
             circular_area) *
           UCharArray::full(input_buffer, 1, cons(byte, nil))
*/;

uint32 CircularAreaWrite(CircularAreaType circular_area,
                         uint8 *input_buffer,
                         uint32 data_length,
                         x_bool b_force)
/*@ nonempty_one_spec
    With (state : circular_area_state) capacity head byte LitMap
    Require data_length == 1 && b_force == 0 &&
            ca_capacity(state) == capacity &&
            ca_contents(state) == cons(head, nil) &&
            Zlength(ca_contents(state)) < ca_capacity(state) &&
            GlobalStrings(LitMap) *
            store_circular_area(state, circular_area) *
            UCharArray::full(input_buffer, 1, cons(byte, nil))
    Ensure __return == 0 &&
           GlobalStrings(LitMap) *
           store_circular_area(
             Build_circular_area_state(
               capacity, cons(head, cons(byte, nil))), circular_area) *
           UCharArray::full(input_buffer, 1, cons(byte, nil))
*/;

uint32 CircularAreaWrite(CircularAreaType circular_area,
                         uint8 *input_buffer,
                         uint32 data_length,
                         x_bool b_force)
/*@ force_fresh_full_spec
    With (state : circular_area_state) input_contents LitMap
    Require data_length == 4 && b_force == 1 &&
            ca_capacity(state) == 4 && ca_contents(state) == nil &&
            CircularAreaFourBytes(input_contents) &&
            GlobalStrings(LitMap) *
            store_circular_area(state, circular_area) *
            UCharArray::full(input_buffer, 4, input_contents)
    Ensure exists raw_after,
           CircularAreaForceWriteResult(
             state, 4, input_contents, 0, raw_after) &&
           __return == 0 &&
           GlobalStrings(LitMap) *
           store_forced_circular_area(raw_after, circular_area) *
           UCharArray::full(input_buffer, 4, input_contents)
*/;

void CircularAreaReset(CircularAreaType circular_area)
/*@ state_spec
    With (state : circular_area_state) capacity LitMap
    Require ca_capacity(state) == capacity &&
            GlobalStrings(LitMap) *
            store_circular_area(state, circular_area)
    Ensure GlobalStrings(LitMap) *
           store_circular_area(
             Build_circular_area_state(capacity, nil),
             circular_area)
*/;

void CircularAreaRelease(CircularAreaType circular_area)
/*@ state_spec
    With (state : circular_area_state) LitMap
    Require GlobalStrings(LitMap) *
            store_circular_area(state, circular_area)
    Ensure GlobalStrings(LitMap)
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
    CircularAreaIsEmpty(area)
      /*@ where (state_spec)
                state = CircularAreaInitState(requested), LitMap = LitMap */;
    CircularAreaIsFull(area)
      /*@ where (state_spec)
                state = CircularAreaInitState(requested), LitMap = LitMap */;
    CircularAreaGetMaxLength(area)
      /*@ where (state_spec)
                state = CircularAreaInitState(requested), LitMap = LitMap */;
    CircularAreaGetDataLength(area)
      /*@ where (state_spec)
                state = CircularAreaInitState(requested), LitMap = LitMap */;
    CircularAreaRelease(area)
      /*@ where (state_spec)
                state = CircularAreaInitState(requested), LitMap = LitMap */;
    return 1;
}

int xizi_circular_area_call_init_empty_read_release(
    uint32 requested, uint8 *output_buffer)
/*@ With (output_before : list (option Z)) LitMap
    Require 4 <= requested && requested <= 256 &&
            GlobalStrings(LitMap) *
            UCharArray::mixed_full(output_buffer, 1, output_before)
    Ensure GlobalStrings(LitMap) *
           CircularAreaCallResult(__return) *
           UCharArray::mixed_full(output_buffer, 1, output_before)
*/
{
    CircularAreaType area = CircularAreaInit(requested);
    if (area == 0) {
        return 0;
    }
    CircularAreaRead(area, output_buffer, 1)
      /*@ where (read_one_spec)
                state = CircularAreaInitState(requested),
                output_before = output_before, LitMap = LitMap */;
    /*@ Assert
          output_buffer == output_buffer@pre &&
          GlobalStrings(LitMap) *
          store_circular_area(CircularAreaInitState(requested), area) *
          UCharArray::mixed_full(output_buffer, 1, output_before)
    */
    CircularAreaRelease(area)
      /*@ where (state_spec)
                state = CircularAreaInitState(requested), LitMap = LitMap */;
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
      /*@ where (empty_one_spec)
                state = CircularAreaInitState(requested),
                capacity = ca_capacity(CircularAreaInitState(requested)),
                byte = byte, LitMap = LitMap */;
    CircularAreaRelease(area)
      /*@ where (state_spec)
                state = Build_circular_area_state(
                  ca_capacity(CircularAreaInitState(requested)),
                  cons(byte, nil)), LitMap = LitMap */;
    return 1;
}

int xizi_circular_area_call_write_read_release(
    uint32 requested, uint8 *input_buffer, uint8 *output_buffer)
/*@ With byte (output_before : list (option Z)) LitMap
    Require 4 <= requested && requested <= 256 &&
            GlobalStrings(LitMap) *
            UCharArray::full(input_buffer, 1, cons(byte, nil)) *
            UCharArray::mixed_full(output_buffer, 1, output_before)
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
      /*@ where (empty_one_spec)
                state = CircularAreaInitState(requested),
                capacity = ca_capacity(CircularAreaInitState(requested)),
                byte = byte, LitMap = LitMap */;
    CircularAreaRead(area, output_buffer, 1)
      /*@ where (read_one_spec)
                state = Build_circular_area_state(
                  ca_capacity(CircularAreaInitState(requested)),
                  cons(byte, nil)),
                output_before = output_before, LitMap = LitMap */;
    /*@ Assert
          input_buffer == input_buffer@pre &&
          output_buffer == output_buffer@pre &&
          GlobalStrings(LitMap) *
          UCharArray::full(input_buffer, 1, cons(byte, nil)) *
          store_circular_area(
            Build_circular_area_state(
              ca_capacity(CircularAreaInitState(requested)), nil), area) *
          UCharArray::mixed_full(
            output_buffer, 1, cons(Some(byte), nil))
    */
    CircularAreaRelease(area)
      /*@ where (state_spec)
                state = Build_circular_area_state(
                  ca_capacity(CircularAreaInitState(requested)), nil),
                LitMap = LitMap */;
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
      /*@ where (empty_one_spec)
                state = CircularAreaInitState(requested),
                capacity = ca_capacity(CircularAreaInitState(requested)),
                byte = first_byte, LitMap = LitMap */;
    CircularAreaWrite(area, second_input, 1, 0)
      /*@ where (nonempty_one_spec)
                state = Build_circular_area_state(
                  ca_capacity(CircularAreaInitState(requested)),
                  cons(first_byte, nil)),
                capacity = ca_capacity(CircularAreaInitState(requested)),
                head = first_byte,
                byte = second_byte, LitMap = LitMap */;
    CircularAreaRelease(area)
      /*@ where (state_spec)
                state = Build_circular_area_state(
                  ca_capacity(CircularAreaInitState(requested)),
                  cons(first_byte, cons(second_byte, nil))),
                LitMap = LitMap */;
    return 1;
}

int xizi_circular_area_call_read_then_write_release(
    uint32 requested, uint8 *first_input, uint8 *output_buffer,
    uint8 *second_input)
/*@ With first_byte second_byte
         (output_before : list (option Z)) LitMap
    Require 4 <= requested && requested <= 256 &&
            GlobalStrings(LitMap) *
            UCharArray::full(first_input, 1, cons(first_byte, nil)) *
            UCharArray::mixed_full(output_buffer, 1, output_before) *
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
      /*@ where (empty_one_spec)
                state = CircularAreaInitState(requested),
                capacity = ca_capacity(CircularAreaInitState(requested)),
                byte = first_byte, LitMap = LitMap */;
    CircularAreaRead(area, output_buffer, 1)
      /*@ where (read_one_spec)
                state = Build_circular_area_state(
                  ca_capacity(CircularAreaInitState(requested)),
                  cons(first_byte, nil)),
                output_before = output_before, LitMap = LitMap */;
    /*@ Assert
          first_input == first_input@pre &&
          output_buffer == output_buffer@pre &&
          second_input == second_input@pre &&
          GlobalStrings(LitMap) *
          UCharArray::full(
            first_input, 1, cons(first_byte, nil)) *
          store_circular_area(
            Build_circular_area_state(
              ca_capacity(CircularAreaInitState(requested)), nil), area) *
          UCharArray::mixed_full(
            output_buffer, 1, cons(Some(first_byte), nil)) *
          UCharArray::full(
            second_input, 1, cons(second_byte, nil))
    */
    CircularAreaWrite(area, second_input, 1, 0)
      /*@ where (empty_one_spec)
                state = Build_circular_area_state(
                  ca_capacity(CircularAreaInitState(requested)), nil),
                capacity = ca_capacity(CircularAreaInitState(requested)),
                byte = second_byte, LitMap = LitMap */;
    CircularAreaRelease(area)
      /*@ where (state_spec)
                state = Build_circular_area_state(
                  ca_capacity(CircularAreaInitState(requested)),
                  cons(second_byte, nil)), LitMap = LitMap */;
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
      /*@ where (empty_one_spec)
                state = CircularAreaInitState(requested),
                capacity = ca_capacity(CircularAreaInitState(requested)),
                byte = byte, LitMap = LitMap */;
    CircularAreaReset(area)
      /*@ where (state_spec)
                state = Build_circular_area_state(
                  ca_capacity(CircularAreaInitState(requested)),
                  cons(byte, nil)),
                capacity = ca_capacity(CircularAreaInitState(requested)),
                LitMap = LitMap */;
    CircularAreaIsEmpty(area)
      /*@ where (state_spec)
                state = Build_circular_area_state(
                  ca_capacity(CircularAreaInitState(requested)), nil),
                LitMap = LitMap */;
    CircularAreaGetDataLength(area)
      /*@ where (state_spec)
                state = Build_circular_area_state(
                  ca_capacity(CircularAreaInitState(requested)), nil),
                LitMap = LitMap */;
    CircularAreaRelease(area)
      /*@ where (state_spec)
                state = Build_circular_area_state(
                  ca_capacity(CircularAreaInitState(requested)), nil),
                LitMap = LitMap */;
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
    CircularAreaWrite(area, input_buffer, 4, 1)
      /*@ where (force_fresh_full_spec)
                state = CircularAreaInitState(4),
                input_contents = input_contents, LitMap = LitMap */;
    /*@ Assert
          input_buffer == input_buffer@pre &&
          CircularAreaFourBytes(input_contents) &&
          GlobalStrings(LitMap) *
          store_circular_area(
            Build_circular_area_state(4, input_contents), area) *
          UCharArray::full(input_buffer, 4, input_contents)
    */
    CircularAreaRelease(area)
      /*@ where (state_spec)
                state = Build_circular_area_state(4, input_contents),
                LitMap = LitMap */;
    return 1;
}
