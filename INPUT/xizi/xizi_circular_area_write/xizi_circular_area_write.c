#include <stdint.h>
#include <string.h>

typedef uint8_t uint8;
typedef uint32_t uint32;
typedef int x_bool;
typedef struct CircularArea *CircularAreaType;

#define NONE ((void *)0)
#define RET_TRUE 1
#define RET_FALSE 0
#define EOK 0
#define ERROR (-1)
#define NULL_PARAM_CHECK(p) do { if ((p) == NONE) return ERROR; } while (0)
#define CHECK(cond) do { if (!(cond)) return ERROR; } while (0)
#define KPrintf(...) ((void)0)

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
{
    NULL_PARAM_CHECK(circular_area);

    if ((circular_area->readidx == circular_area->writeidx) &&
        circular_area->b_status) {
        KPrintf("the circular area is full\n");
        return RET_TRUE;
    } else {
        return RET_FALSE;
    }
}

uint32 CircularAreaGetDataLength(CircularAreaType circular_area)
{
    NULL_PARAM_CHECK(circular_area);

    if (CircularAreaIsFull(circular_area)) {
        return circular_area->area_length;
    } else {
        return (circular_area->writeidx - circular_area->readidx +
                circular_area->area_length) % circular_area->area_length;
    }
}

static uint32 CircularAreaDivideWrData(CircularAreaType circular_area,
                                       uint32 data_length)
{
    NULL_PARAM_CHECK(circular_area);

    if (circular_area->writeidx + data_length <= circular_area->area_length) {
        return RET_FALSE;
    } else {
        return RET_TRUE;
    }
}

uint32 CircularAreaWrite(CircularAreaType circular_area, uint8 *input_buffer,
                         uint32 data_length, x_bool b_force)
{
    NULL_PARAM_CHECK(circular_area);
    NULL_PARAM_CHECK(input_buffer);
    CHECK(data_length > 0);

    if (CircularAreaIsFull(circular_area) && !b_force) {
        return ERROR;
    }

    uint32 write_data_length = circular_area->area_length -
        CircularAreaGetDataLength(circular_area);
    data_length = (data_length > write_data_length) ?
        write_data_length : data_length;

    if (CircularAreaDivideWrData(circular_area, data_length)) {
        uint32 write_len_up = circular_area->area_length -
            circular_area->writeidx;
        uint32 write_len_down = data_length - write_len_up;

        memcpy(&circular_area->data_buffer[circular_area->writeidx],
               input_buffer, write_len_up);
        memcpy(circular_area->p_head, input_buffer + write_len_up,
               write_len_down);

        circular_area->writeidx = write_len_down;
    } else {
        memcpy(&circular_area->data_buffer[circular_area->writeidx],
               input_buffer, data_length);
        circular_area->writeidx =
            (circular_area->writeidx + data_length) %
            circular_area->area_length;
    }

    circular_area->b_status = RET_TRUE;

    if (b_force) {
        circular_area->readidx = circular_area->writeidx;
    }

    return EOK;
}
