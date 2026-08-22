#include "IP_CduModuleInfoGet.h"

// =======================================================
// 函数实现
// =======================================================

void DevCommInit(void)
{
    /* 所有部件的通讯错误计数、连续通讯错误计数清0 */
    sStsComm[0].cntCommErrorCnt = 0;
    sStsComm[1].cntCommErrorCnt = 0;

    sImuComm[0].cntCommErrorCnt = 0;
    sImuComm[1].cntCommErrorCnt = 0;

    sMrvsComm[0].cntCommErrorCnt = 0;
    sMrvsComm[1].cntCommErrorCnt = 0;
    sMrvsComm[2].cntCommErrorCnt = 0;
    sMrvsComm[3].cntCommErrorCnt = 0;

    sFtdiComm.cntCommErrorCnt = 0;
    sLtpsComm.cntCommErrorCnt = 0;
    sOtsComm.cntCommErrorCnt = 0;
    sZlqCcuStatus.cntCommErrorCnt = 0;

    /* 所有部件的通讯失效标志清0 */
    sStsComm[0].bCommFault = FALSE32;
    sStsComm[1].bCommFault = FALSE32;

    sImuComm[0].bCommFault = FALSE32;
    sImuComm[1].bCommFault = FALSE32;

    sMrvsComm[0].bCommFault = FALSE32;
    sMrvsComm[1].bCommFault = FALSE32;
    sMrvsComm[2].bCommFault = FALSE32;
    sMrvsComm[3].bCommFault = FALSE32;

    return;
}

void CduModulePowerDutyGet(void)
{
    boolu32 bOnDutySwitch;

    /* 缓存上一拍当班状态 */
    sCduStatus.CduOnDutyOld[0] = sCduStatus.CduOnDuty[0];
    sCduStatus.CduOnDutyOld[1] = sCduStatus.CduOnDuty[1];
    sCduStatus.CduOnDutyOld[2] = sCduStatus.CduOnDuty[2];

    /* 读取位口输入 */
    sCduStatus.CduOnDutyForce[0] = Drv_IO_Bit_In(IO_BIT_IN_NO_ONDUTY_A_FORCE);
    sCduStatus.CduOnDutyForce[1] = Drv_IO_Bit_In(IO_BIT_IN_NO_ONDUTY_B_FORCE);
    sCduStatus.CduOnDutyForce[2] = Drv_IO_Bit_In(IO_BIT_IN_NO_ONDUTY_C_FORCE);
    sCduStatus.CduOnDuty[0]      = Drv_IO_Bit_In(IO_BIT_IN_NO_ONDUTY_A);
    sCduStatus.CduOnDuty[1]      = Drv_IO_Bit_In(IO_BIT_IN_NO_ONDUTY_B);
    sCduStatus.CduOnDuty[2]      = Drv_IO_Bit_In(IO_BIT_IN_NO_ONDUTY_C);
    sCduStatus.CduPowerOn[0]     = Drv_IO_Bit_In(IO_BIT_IN_NO_POWERON_A);
    sCduStatus.CduPowerOn[1]     = Drv_IO_Bit_In(IO_BIT_IN_NO_POWERON_B);
    sCduStatus.CduPowerOn[2]     = Drv_IO_Bit_In(IO_BIT_IN_NO_POWERON_C);

    /* 当非当班机转为当班机时，应清除部件通讯失效标志和连续通讯故障计数 */
    {
        /* 预置未发生切换 */
        bOnDutySwitch = FALSE32;

        /* A机判定 */
        if (sCduStatus.CduModuleFlag == CDU_MODULE_A)
        {
            if ((sCduStatus.CduOnDutyOld[0] == CDU_DUTY_OFF) &&
                (sCduStatus.CduOnDuty[0]    == CDU_DUTY_ON))
            {
                bOnDutySwitch = TRUE32;
            }
        }
        /* B机判定 */
        else if (sCduStatus.CduModuleFlag == CDU_MODULE_B)
        {
            if ((sCduStatus.CduOnDutyOld[1] == CDU_DUTY_OFF) &&
                (sCduStatus.CduOnDuty[1]    == CDU_DUTY_ON))
            {
                bOnDutySwitch = TRUE32;
            }
        }
        /* C机判定 */
        else    /* if (sCduStatus.CduModuleFlag == CDU_MODULE_C) */
        {
            if ((sCduStatus.CduOnDutyOld[2] == CDU_DUTY_OFF) &&
                (sCduStatus.CduOnDuty[2]    == CDU_DUTY_ON))
            {
                bOnDutySwitch = TRUE32;
            }
        }

        /* 发生当班状态变化 */
        if (bOnDutySwitch == TRUE32)
        {
            /* 本机获得当班权的第一个周期头，置切机命令字无效 */
            SYSPowerSwitch = 0x00;

            DevCommInit();
        }
    }

    /* 断言判定 */
    ASSERT((sCduStatus.CduOnDutyForce[0] == CDU_FORCE_DUTY_ON) || (sCduStatus.CduOnDutyForce[0] == CDU_FORCE_DUTY_OFF));
    ASSERT((sCduStatus.CduOnDutyForce[1] == CDU_FORCE_DUTY_ON) || (sCduStatus.CduOnDutyForce[1] == CDU_FORCE_DUTY_OFF));
    ASSERT((sCduStatus.CduOnDutyForce[2] == CDU_FORCE_DUTY_ON) || (sCduStatus.CduOnDutyForce[2] == CDU_FORCE_DUTY_OFF));
    ASSERT((sCduStatus.CduOnDuty[0]      == CDU_DUTY_ON      ) || (sCduStatus.CduOnDuty[0]      == CDU_DUTY_OFF      ));
    ASSERT((sCduStatus.CduOnDuty[1]      == CDU_DUTY_ON      ) || (sCduStatus.CduOnDuty[1]      == CDU_DUTY_OFF      ));
    ASSERT((sCduStatus.CduOnDuty[2]      == CDU_DUTY_ON      ) || (sCduStatus.CduOnDuty[2]      == CDU_DUTY_OFF      ));
    ASSERT((sCduStatus.CduPowerOn[0]     == CDU_POWER_ON     ) || (sCduStatus.CduPowerOn[0]     == CDU_POWER_OFF     ));
    ASSERT((sCduStatus.CduPowerOn[1]     == CDU_POWER_ON     ) || (sCduStatus.CduPowerOn[1]     == CDU_POWER_OFF     ));
    ASSERT((sCduStatus.CduPowerOn[2]     == CDU_POWER_ON     ) || (sCduStatus.CduPowerOn[2]     == CDU_POWER_OFF     ));

    return;
}

void CduModuleInfoGet(void)
{
    unint32 flag[3];

    /* 读取位口输入 */
    flag[0] = Drv_IO_Bit_In(IO_BIT_IN_NO_JUDGE_FLAG1);
    flag[1] = Drv_IO_Bit_In(IO_BIT_IN_NO_JUDGE_FLAG2);
    flag[2] = Drv_IO_Bit_In(IO_BIT_IN_NO_JUDGE_FLAG3);

    /* 断言判定 */
    ASSERT((flag[0] == 1) || (flag[0] == 0));
    ASSERT((flag[1] == 1) || (flag[1] == 0));
    ASSERT((flag[2] == 1) || (flag[2] == 0));

    /* 当前单机标识赋值 */
    UI32_BIT_SET1(sCduStatus.CduModuleFlag, 0u, flag[0]);
    UI32_BIT_SET1(sCduStatus.CduModuleFlag, 1u, flag[1]);
    UI32_BIT_SET1(sCduStatus.CduModuleFlag, 2u, flag[2]);

    /* 获取单机加电及当班信息 */
    CduModulePowerDutyGet();

    /* 更新上一拍当班状态 */
    sCduStatus.CduOnDutyOld[0] = sCduStatus.CduOnDuty[0];
    sCduStatus.CduOnDutyOld[1] = sCduStatus.CduOnDuty[1];
    sCduStatus.CduOnDutyOld[2] = sCduStatus.CduOnDuty[2];

    return;
}