typedef unsigned char uint8;
typedef unsigned int uint32;
typedef int x_bool;
struct CircularArea;
typedef struct CircularArea *CircularAreaType;

/*@ Import Coq Require Import
      SimpleC.EE.OUTPUT.xizi.xizi_circular_area_init.source.xizi_circular_area_init_lib
*/
/*@ Extern Coq
      (CircularAreaAlignedLength : Z -> Z -> Prop)
      (CircularAreaInitDescriptorState :
         Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Prop)
      (CircularAreaInitFailureState :
         Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Assertion)
*/

#define NONE ((void *)0)
#define RET_FALSE 0
#define EOK 0
#define ERROR 1
#define MEM_ALIGN_SIZE 4u
#define ALIGN_MEN_DOWN(length, align) ((uint32)((length) / (align) * (align)))
#define CHECK(cond) do { if (!(cond)) return NONE; } while (0)

struct CircularAreaOps {
    uint32 (*read)(CircularAreaType circular_area, uint8 *output_buffer,
                   uint32 data_length);
    uint32 (*write)(CircularAreaType circular_area, uint8 *input_buffer,
                    uint32 data_length, x_bool b_force);
    void (*release)(CircularAreaType circular_area);
    void (*reset)(CircularAreaType circular_area);
};

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

void *x_malloc(uint32 size)
/*@ descriptor_alloc_spec
    Require size == sizeof(struct CircularArea) && emp
    Ensure (__return == 0 && emp) ||
           (__return != 0 &&
            has_permission(&(((CircularAreaType)__return)->data_buffer)) *
            has_permission(&(((CircularAreaType)__return)->readidx)) *
            has_permission(&(((CircularAreaType)__return)->writeidx)) *
            has_permission(&(((CircularAreaType)__return)->p_head)) *
            has_permission(&(((CircularAreaType)__return)->p_tail)) *
            has_permission(&(((CircularAreaType)__return)->area_length)) *
            has_permission(&(((CircularAreaType)__return)->b_status)) *
            has_permission(&(((CircularAreaType)__return)->CircularAreaOperations)))
*/;

void *x_malloc(uint32 size)
/*@ buffer_alloc_spec
    Require 0 <= size && size <= UINT_MAX && emp
    Ensure (__return == 0 && emp) ||
           (__return != 0 && size > 0 &&
            UCharArray::undef_full(__return, size))
*/;

void x_free(void *p)
/*@ null_free_spec
    Require p == 0 && emp
    Ensure emp
*/;

uint32 CircularAreaRead(CircularAreaType circular_area,
                        uint8 *output_buffer,
                        uint32 data_length);

uint32 CircularAreaWrite(CircularAreaType circular_area,
                         uint8 *input_buffer,
                         uint32 data_length,
                         x_bool b_force);

void CircularAreaReset(CircularAreaType circular_area)
/*@ init_reset_spec
    Require circular_area != 0 &&
            has_permission(&(circular_area->data_buffer)) *
            has_permission(&(circular_area->readidx)) *
            has_permission(&(circular_area->writeidx)) *
            has_permission(&(circular_area->p_head)) *
            has_permission(&(circular_area->p_tail)) *
            has_permission(&(circular_area->area_length)) *
            has_permission(&(circular_area->b_status)) *
            has_permission(&(circular_area->CircularAreaOperations))
    Ensure has_permission(&(circular_area->data_buffer)) *
           (circular_area->readidx == 0) *
           (circular_area->writeidx == 0) *
           has_permission(&(circular_area->p_head)) *
           has_permission(&(circular_area->p_tail)) *
           has_permission(&(circular_area->area_length)) *
           (circular_area->b_status == 0) *
           has_permission(&(circular_area->CircularAreaOperations))
*/
{
    circular_area->writeidx = 0;
    circular_area->readidx = 0;
    circular_area->b_status = RET_FALSE;
}

void CircularAreaRelease(CircularAreaType circular_area)
{
    circular_area->readidx = 0;
    circular_area->writeidx = 0;
    circular_area->p_head = NONE;
    circular_area->p_tail = NONE;
    circular_area->b_status = RET_FALSE;
    circular_area->area_length = 0;

    x_free(circular_area->data_buffer);
    x_free(circular_area);
}

static struct CircularAreaOps CircularAreaOperations = {
    CircularAreaRead,
    CircularAreaWrite,
    CircularAreaRelease,
    CircularAreaReset
};

CircularAreaType CircularAreaInit(uint32 circular_area_length)
/*@ Require 0 < circular_area_length && circular_area_length <= 256 && emp
    Ensure
      (exists circular_area aligned,
         circular_area_length > 0 &&
         CircularAreaAlignedLength(circular_area_length, aligned) &&
         __return == 0 &&
         CircularAreaInitFailureState(
           circular_area,
           &(circular_area->data_buffer),
           &(circular_area->readidx),
           &(circular_area->writeidx),
           &(circular_area->p_head),
           &(circular_area->p_tail),
           &(circular_area->area_length),
           &(circular_area->b_status),
           &(circular_area->CircularAreaOperations))) ||
      (exists circular_area data_buffer aligned,
         circular_area_length > 0 &&
         CircularAreaAlignedLength(circular_area_length, aligned) &&
         CircularAreaInitDescriptorState(
           aligned, circular_area, data_buffer,
           0, 0, data_buffer, data_buffer + aligned,
           aligned, 0, &CircularAreaOperations,
           &CircularAreaOperations) &&
         __return == circular_area &&
         (circular_area->data_buffer == data_buffer) *
         (circular_area->readidx == 0) *
         (circular_area->writeidx == 0) *
         (circular_area->p_head == data_buffer) *
         (circular_area->p_tail == data_buffer + aligned) *
         (circular_area->area_length == aligned) *
         (circular_area->b_status == 0) *
         (circular_area->CircularAreaOperations == &CircularAreaOperations) *
         UCharArray::undef_full(data_buffer, aligned))
*/
{
    CHECK(circular_area_length > 0);

    circular_area_length =
        ALIGN_MEN_DOWN(circular_area_length, MEM_ALIGN_SIZE);

    CircularAreaType circular_area = x_malloc(sizeof(struct CircularArea))
        /*@ where (descriptor_alloc_spec) */;
    if (NONE == circular_area) {
        x_free(circular_area) /*@ where (null_free_spec) */;
        return NONE;
    }

    CircularAreaReset(circular_area) /*@ where (init_reset_spec) */;

    circular_area->data_buffer = x_malloc(circular_area_length)
        /*@ where (buffer_alloc_spec) */;
    if (NONE == circular_area->data_buffer) {
        x_free(circular_area->data_buffer) /*@ where (null_free_spec) */;
        return NONE;
    }

    circular_area->p_head = circular_area->data_buffer;
    circular_area->p_tail = circular_area->data_buffer + circular_area_length;
    circular_area->area_length = circular_area_length;

    circular_area->CircularAreaOperations = &CircularAreaOperations;

    return circular_area;
}
