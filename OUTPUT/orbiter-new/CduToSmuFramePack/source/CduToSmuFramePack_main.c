#include "../../../../FloatTest/ref/orbiter_support.h"
#include "../../../../INPUT/orbiter-new/CduToSmuFramePack/IP_CduToSmuFramePack.h"

static SFrameCduSend *active_frame;
static uint8_t stub_valid_1;
static uint8_t stub_valid_2;
static uint8_t stub_payload[3];
static uint32_t pack_calls;
static uint32_t pack_ptr_ok;
static uint32_t checksum_calls;
static uint32_t checksum_ptr_ok;
static uint32_t checksum_length;

void CduToSmuFrameDataPack(uint8_t *data, uint8_t *valid_1, uint8_t *valid_2)
{
    ++pack_calls;
    pack_ptr_ok = data == &active_frame->data[10] &&
                  valid_1 == &active_frame->data[7] &&
                  valid_2 == &active_frame->data[8];
    *valid_1 = stub_valid_1;
    *valid_2 = stub_valid_2;
    data[0] = stub_payload[0];
    data[1] = stub_payload[1];
    data[2] = stub_payload[2];
}

uint8_t CheckSumAdd08(const uint8_t *data, uint32_t length)
{
    ++checksum_calls;
    checksum_ptr_ok = data == &active_frame->data[6];
    checksum_length = length;
    uint32_t sum = 0;
    for (uint32_t i = 0; i < length; ++i) sum += data[i];
    return (uint8_t)sum;
}

#include "../../../../INPUT/orbiter-new/CduToSmuFramePack/IP_CduToSmuFramePack.c"

int main(int argc, char **argv)
{
    unsigned long count = ft_count_arg(argc, argv);
    uint64_t state = ft_seed_arg(argc, argv);
    for (unsigned long row = 0; row < count; ++row) {
        SFrameCduSend frame;
        uint8_t frm = row < 4u ? (uint8_t[]){0u, 1u, 254u, 255u}[row]
                               : (uint8_t)ft_prng_next(&state);
        uint8_t background = (uint8_t)ft_prng_next(&state);
        stub_valid_1 = (uint8_t)ft_prng_next(&state);
        stub_valid_2 = (uint8_t)ft_prng_next(&state);
        for (int i = 0; i < 3; ++i) stub_payload[i] = (uint8_t)ft_prng_next(&state);
        memset(&frame, background, sizeof frame);
        frame.frmNum = frm;
        active_frame = &frame;
        pack_calls = pack_ptr_ok = checksum_calls = checksum_ptr_ok = checksum_length = 0;

        CduToSmuFramePack(&frame);

        printf("%u %u %u %u %u %u %u", frm, background, stub_valid_1,
               stub_valid_2, stub_payload[0], stub_payload[1], stub_payload[2]);
        printf(" %u", frame.frmNum);
        for (int i = 0; i <= 12; ++i) printf(" %u", frame.data[i]);
        printf(" %u %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32 "\n",
               frame.data[SMU_LVDS_SEND_FRAME_LEN - 1], pack_calls, pack_ptr_ok,
               checksum_calls, checksum_ptr_ok, checksum_length);
    }
    return 0;
}
