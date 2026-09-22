#include <stdint.h>
#include <stdlib.h>

typedef uint8_t uint8;
typedef uint32_t uint32;
typedef int x_bool;
typedef struct CircularArea *CircularAreaType;

#define NONE ((void *)0)
#define RET_FALSE 0
#define x_free free

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
