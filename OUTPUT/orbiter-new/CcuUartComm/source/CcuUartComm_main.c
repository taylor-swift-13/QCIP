#include "../../../../FloatTest/ref/orbiter_support.h"
#define MASK_LO08 UINT32_C(0xff)
#include "../../../../INPUT/orbiter-new/CcuUartComm/IP_CcuUartComm.h"

struct { uint32_t devStatus[64]; } sDevManage;
struct { uint32_t flgAbnormal; } sZlqCcuRecvData;

static uint32_t stub_fifo, stub_recv, stub_valid, stub_send;
static uint32_t get_calls, recv_calls, parse_calls, send_calls, abnormal_calls, init_calls;
static uint32_t args_ok;

uint32_t Drv_Uart_Get_FIFO_Num(uint32_t uart)
{
    ++get_calls; args_ok &= uart == 15u; return stub_fifo;
}
uint32_t UartRecv(uint32_t uart, uint8_t *buf, uint32_t *size, uint32_t *error)
{
    (void)error; ++recv_calls;
    args_ok &= uart == 15u && buf == &sZlqCcuStatus.buf[0] && *size == 92u;
    return stub_recv;
}
uint32_t CcuUartDataProc(uint8_t *buf)
{
    ++parse_calls; args_ok &= buf == &sZlqCcuStatus.buf[0]; return stub_valid;
}
uint32_t UartSend(uint32_t uart, uint8_t *buf, uint32_t size)
{
    ++send_calls; args_ok &= uart == 15u && size == 1u && *buf == 0xbbu; return stub_send;
}
void AbnormalSaveOp(uint32_t kind, uint32_t flag, uint32_t length, uint8_t *buf)
{
    ++abnormal_calls;
    args_ok &= kind == 14u &&
               flag == UI32_MAKE16(sZlqCcuStatus.flgCommValidRecv,
                                    sZlqCcuRecvData.flgAbnormal) &&
               length == 92u && buf == &sZlqCcuStatus.buf[0];
}
void Drv_Uart_Init(uint32_t uart, uint32_t baud, uint32_t parity, uint32_t stop)
{
    ++init_calls; args_ok &= uart == 15u && baud == 115200u && parity == 0u && stop == 0u;
}

#include "../../../../INPUT/orbiter-new/CcuUartComm/IP_CcuUartComm.c"

int main(int argc, char **argv)
{
    static const uint32_t fifo_cases[5] = {92u, 0u, 0u, 17u, 17u};
    unsigned long count = ft_count_arg(argc, argv);
    uint64_t state = ft_seed_arg(argc, argv);
    for (unsigned long row = 0; row < count; ++row) {
        uint32_t x[14];
        x[0] = row % 7u == 0u ? 0u : 1u;
        x[1] = fifo_cases[row % 5u];
        x[2] = row % 5u == 4u ? 2u : (uint32_t)(ft_prng_next(&state) % 2u);
        x[3] = row % 5u == 2u ? 2u : (uint32_t)(ft_prng_next(&state) % 3u);
        x[4] = row % 6u == 1u ? 1u : 0u;
        x[5] = row % 6u == 2u ? 0u : 1u;
        x[6] = (uint32_t)ft_prng_next(&state);
        x[7] = (uint32_t)(ft_prng_next(&state) % 1000u);
        x[8] = (uint32_t)(ft_prng_next(&state) % 1000u);
        x[9] = (uint32_t)(ft_prng_next(&state) % 1000u);
        x[10] = (uint32_t)ft_prng_next(&state);
        x[11] = (uint32_t)ft_prng_next(&state);
        x[12] = (uint32_t)ft_prng_next(&state);
        x[13] = (uint32_t)ft_prng_next(&state);

        sDevManage.devStatus[31] = x[0] ? UINT32_C(0x00ff0000) : 0u;
        stub_fifo = x[1]; stub_recv = x[4]; stub_valid = x[5]; stub_send = x[6];
        sZlqCcuStatus.lenRecved = x[2]; sZlqCcuStatus.cntUnComm = x[3];
        sZlqCcuStatus.cntCommSucc = x[7]; sZlqCcuStatus.cntCommError = x[8];
        sZlqCcuStatus.cntCommErrorCnt = x[9]; sZlqCcuRecvData.flgAbnormal = x[10];
        sZlqCcuStatus.flgCommValidRecv = x[11]; sZlqCcuStatus.flgCommValidSend = x[12];
        sZlqCcuStatus.bCommValid = x[13];
        get_calls = recv_calls = parse_calls = send_calls = abnormal_calls = init_calls = 0;
        args_ok = 1;

        for (uint32_t i = 0; i < 14u; ++i) printf(i ? " %" PRIu32 : "%" PRIu32, x[i]);
        CcuUartComm();
        printf(" %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32
               " %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32,
               sZlqCcuStatus.lenRecved, sZlqCcuStatus.cntUnComm,
               sZlqCcuStatus.cntCommSucc, sZlqCcuStatus.cntCommError,
               sZlqCcuStatus.cntCommErrorCnt, sZlqCcuStatus.bCommValid,
               sZlqCcuStatus.flgCommValidRecv, sZlqCcuStatus.flgCommValidSend);
        printf(" %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32
               " %" PRIu32 " %" PRIu32 " %" PRIu32 "\n",
               get_calls, recv_calls, parse_calls, send_calls,
               abnormal_calls, init_calls, args_ok);
    }
    return 0;
}
