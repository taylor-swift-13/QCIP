#include "../../../../FloatTest/ref/orbiter_support.h"

#define WORK_MODE_STATIC UINT32_C(10)

struct {
    unint32 TaskNumber;
    float64 AttBaseBoard;
} sWalkModeData;

struct {
    unint32 BZ1;
    siint32 GyrInvNum;
    siint32 AccInvNum;
} sGncCtrlFlag;

struct { unint32 AttValidIF; } sWalkAttData;
struct { float64 theta_safe; } sWalkModeParam;
struct { siint32 GyrInvMaxN; siint32 AccInvMaxN; } sAttiModifyParam;
struct { unint32 Task; } sWalkCtrlFlag;
struct { unint32 tiltAlarm; } sWalkSendData;

static unint32 device_calls;
static unint32 deter_walk_calls;
static unint32 proc_walk_calls;
static unint32 sts_gyro_calls;
static unint32 call_trace;
static float64 stub_att_base_board;

static void trace_call(unint32 tag)
{
    call_trace = call_trace * UINT32_C(10) + tag;
}

void DeviceDataProc(void) { ++device_calls; trace_call(1); }
void AttDeterWalk(void) { ++deter_walk_calls; trace_call(2); }
void AttProcWalk(void)
{
    ++proc_walk_calls;
    trace_call(3);
    sWalkModeData.AttBaseBoard = stub_att_base_board;
}
void AttDeterStsGyro(void) { ++sts_gyro_calls; trace_call(4); }

#include "AttDeterWalkMode_extracted.c"

static float64 angle_for_case(unint32 angle_case)
{
    switch (angle_case) {
    case 0: return 0.5;
    case 1: return 2.0;
    case 2: return -2.0;
    default: return 1.0;
    }
}

int main(int argc, char **argv)
{
    unsigned long count = ft_count_arg(argc, argv);
    uint64_t state = ft_seed_arg(argc, argv);

    for (unsigned long row = 0; row < count; ++row) {
        unint32 task_number = (unint32)(ft_prng_next(&state) % UINT64_C(11));
        unint32 static_mode = (unint32)(ft_prng_next(&state) & UINT64_C(1));
        unint32 att_valid = (unint32)(ft_prng_next(&state) & UINT64_C(1));
        unint32 angle_case = (unint32)(ft_prng_next(&state) % UINT64_C(4));
        unint32 gyr_inv = (unint32)(ft_prng_next(&state) % UINT64_C(5));
        unint32 acc_inv = (unint32)(ft_prng_next(&state) % UINT64_C(5));
        unint32 initial_task = (unint32)(ft_prng_next(&state) % UINT64_C(100));
        unint32 initial_tilt = (unint32)ft_prng_next(&state);

        sWalkModeData.TaskNumber = task_number;
        sWalkModeData.AttBaseBoard = 0.0;
        sGncCtrlFlag.BZ1 = static_mode ? WORK_MODE_STATIC : UINT32_C(11);
        sGncCtrlFlag.GyrInvNum = (siint32)gyr_inv;
        sGncCtrlFlag.AccInvNum = (siint32)acc_inv;
        sWalkAttData.AttValidIF = att_valid;
        sWalkModeParam.theta_safe = 1.0;
        sAttiModifyParam.GyrInvMaxN = 2;
        sAttiModifyParam.AccInvMaxN = 2;
        sWalkCtrlFlag.Task = initial_task;
        sWalkSendData.tiltAlarm = initial_tilt;
        stub_att_base_board = angle_for_case(angle_case);
        device_calls = deter_walk_calls = proc_walk_calls = 0;
        sts_gyro_calls = call_trace = 0;

        printf("%" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32
               " %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32,
               task_number, static_mode, att_valid, angle_case,
               gyr_inv, acc_inv, initial_task, initial_tilt);
        AttDeterWalkMode();
        printf(" %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32
               " %" PRIu32 " %" PRIu32 " %" PRIu32 "\n",
               sWalkCtrlFlag.Task, sWalkSendData.tiltAlarm,
               device_calls, deter_walk_calls, proc_walk_calls,
               sts_gyro_calls, call_trace);
    }
    return 0;
}
