#include <stdint.h>
#include <stdlib.h>

typedef uint8_t uint8;
typedef uint32_t uint32;
typedef int x_bool;
typedef struct CircularArea *CircularAreaType;

#define NONE ((void *)0)
#define RET_FALSE 0
#define EOK 0
#define ERROR (-1)
#define MEM_ALIGN_SIZE 4u
#define ALIGN_MEN_DOWN(length, align) ((uint32)((length) / (align) * (align)))
#define CHECK(cond) do { if (!(cond)) return NONE; } while (0)
// #define KPrintf(...) ((void)0)
#define x_malloc malloc
#define x_free free

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

static uint32 CircularAreaReadStub(CircularAreaType circular_area,
                                   uint8 *output_buffer,
                                   uint32 data_length)
{
    (void)circular_area;
    (void)output_buffer;
    (void)data_length;
    return EOK;
}

static uint32 CircularAreaWriteStub(CircularAreaType circular_area,
                                    uint8 *input_buffer,
                                    uint32 data_length,
                                    x_bool b_force)
{
    (void)circular_area;
    (void)input_buffer;
    (void)data_length;
    (void)b_force;
    return EOK;
}

void CircularAreaReset(CircularAreaType circular_area)
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
    CircularAreaReadStub,
    CircularAreaWriteStub,
    CircularAreaRelease,
    CircularAreaReset,
};

CircularAreaType CircularAreaInit(uint32 circular_area_length)
{
    CHECK(circular_area_length > 0);

    circular_area_length =
        ALIGN_MEN_DOWN(circular_area_length, MEM_ALIGN_SIZE);

    CircularAreaType circular_area = x_malloc(sizeof(struct CircularArea));
    if (NONE == circular_area) {
        // KPrintf("CircularAreaInit malloc struct circular_area failed\n");
        x_free(circular_area);
        return NONE;
    }

    CircularAreaReset(circular_area);

    circular_area->data_buffer = x_malloc(circular_area_length);
    if (NONE == circular_area->data_buffer) {
        // KPrintf("CircularAreaInit malloc circular_area data_buffer failed\n");
        x_free(circular_area->data_buffer);
        return NONE;
    }

    circular_area->p_head = circular_area->data_buffer;
    circular_area->p_tail = circular_area->data_buffer + circular_area_length;
    circular_area->area_length = circular_area_length;

    // KPrintf("CircularAreaInit done p_head %p p_tail %p length %u\n",
    //         circular_area->p_head, circular_area->p_tail,
    //         circular_area->area_length);

    circular_area->CircularAreaOperations = &CircularAreaOperations;

    return circular_area;
}
