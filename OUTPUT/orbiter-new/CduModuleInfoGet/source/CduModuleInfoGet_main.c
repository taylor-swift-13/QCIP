#include "../../../../FloatTest/ref/orbiter_support.h"
#include "../../../../INPUT/orbiter-new/CduModuleInfoGet/IP_CduModuleInfoGet.h"

uint32_t SYSPowerSwitch;
static uint32_t pin_values[32];
static uint32_t read_calls;
static uint32_t read_order_ok;
static const uint32_t expected_pins[12] =
    {16u, 17u, 18u, 3u, 4u, 5u, 8u, 9u, 10u, 11u, 12u, 13u};

uint32_t Drv_IO_Bit_In(uint32_t pin)
{
    read_order_ok &= read_calls < 12u && pin == expected_pins[read_calls];
    ++read_calls;
    return pin_values[pin];
}

#include "../../../../INPUT/orbiter-new/CduModuleInfoGet/IP_CduModuleInfoGet.c"

static void init_comm(uint32_t value)
{
    for (uint32_t i = 0; i < 2u; ++i) {
        sStsComm[i].cntCommErrorCnt = value; sStsComm[i].bCommFault = value;
        sImuComm[i].cntCommErrorCnt = value; sImuComm[i].bCommFault = value;
    }
    for (uint32_t i = 0; i < 4u; ++i) {
        sMrvsComm[i].cntCommErrorCnt = value; sMrvsComm[i].bCommFault = value;
    }
    sFtdiComm.cntCommErrorCnt = value;
    sLtpsComm.cntCommErrorCnt = value;
    sOtsComm.cntCommErrorCnt = value;
    sZlqCcuStatus.cntCommErrorCnt = value;
}

int main(int argc, char **argv)
{
    unsigned long count = ft_count_arg(argc, argv);
    uint64_t state = ft_seed_arg(argc, argv);
    for (unsigned long row = 0; row < count; ++row) {
        uint32_t judge[3], pre[3], force[3], duty[3], power[3];
        uint32_t pre_flag = (uint32_t)ft_prng_next(&state);
        for (uint32_t i = 0; i < 3u; ++i) {
            judge[i] = (uint32_t)(ft_prng_next(&state) & 1u);
            pre[i] = (uint32_t)(ft_prng_next(&state) & 1u);
            force[i] = (uint32_t)(ft_prng_next(&state) & 1u);
            duty[i] = (uint32_t)(ft_prng_next(&state) & 1u);
            power[i] = (uint32_t)(ft_prng_next(&state) & 1u);
        }
        if (row < 4u) {
            static const uint32_t js[4][3] = {{0,0,0},{1,0,0},{0,1,0},{0,0,0}};
            pre_flag = row == 3u ? 8u : 0u;
            memcpy(judge, js[row], sizeof judge);
        }
        uint32_t final_flag = (pre_flag & UINT32_C(0xfffffff8)) |
                              judge[0] | (judge[1] << 1) | (judge[2] << 2);
        if (row < 4u) {
            uint32_t selected = final_flag == 0u ? 0u : final_flag == 1u ? 1u : 2u;
            pre[selected] = 1u; duty[selected] = 0u;
        }
        uint32_t sys_before = (uint32_t)ft_prng_next(&state) | 1u;
        uint32_t sentinel = (uint32_t)ft_prng_next(&state) | 1u;
        memset(&sCduStatus, 0, sizeof sCduStatus);
        sCduStatus.CduModuleFlag = pre_flag;
        for (uint32_t i = 0; i < 3u; ++i) sCduStatus.CduOnDuty[i] = pre[i];
        pin_values[16] = judge[0]; pin_values[17] = judge[1]; pin_values[18] = judge[2];
        pin_values[3] = force[0]; pin_values[4] = force[1]; pin_values[5] = force[2];
        pin_values[8] = duty[0]; pin_values[9] = duty[1]; pin_values[10] = duty[2];
        pin_values[11] = power[0]; pin_values[12] = power[1]; pin_values[13] = power[2];
        SYSPowerSwitch = sys_before;
        init_comm(sentinel);
        read_calls = 0; read_order_ok = 1;

        for (uint32_t i = 0; i < 3u; ++i) printf(i ? " %" PRIu32 : "%" PRIu32, judge[i]);
        printf(" %" PRIu32, pre_flag);
        for (uint32_t i = 0; i < 3u; ++i) printf(" %" PRIu32, pre[i]);
        for (uint32_t i = 0; i < 3u; ++i) printf(" %" PRIu32, force[i]);
        for (uint32_t i = 0; i < 3u; ++i) printf(" %" PRIu32, duty[i]);
        for (uint32_t i = 0; i < 3u; ++i) printf(" %" PRIu32, power[i]);
        printf(" %" PRIu32 " %" PRIu32, sys_before, sentinel);

        CduModuleInfoGet();

        printf(" %" PRIu32, sCduStatus.CduModuleFlag);
        for (uint32_t i = 0; i < 3u; ++i) printf(" %" PRIu32, sCduStatus.CduOnDutyForce[i]);
        for (uint32_t i = 0; i < 3u; ++i) printf(" %" PRIu32, sCduStatus.CduOnDuty[i]);
        for (uint32_t i = 0; i < 3u; ++i) printf(" %" PRIu32, sCduStatus.CduOnDutyOld[i]);
        for (uint32_t i = 0; i < 3u; ++i) printf(" %" PRIu32, sCduStatus.CduPowerOn[i]);
        printf(" %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32
               " %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32 "\n",
               SYSPowerSwitch, sStsComm[0].cntCommErrorCnt, sStsComm[1].bCommFault,
               sImuComm[1].cntCommErrorCnt, sMrvsComm[3].bCommFault,
               sFtdiComm.cntCommErrorCnt, sZlqCcuStatus.cntCommErrorCnt,
               read_calls, read_order_ok);
    }
    return 0;
}
