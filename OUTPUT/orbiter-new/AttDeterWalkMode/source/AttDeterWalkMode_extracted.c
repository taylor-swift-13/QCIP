/* Mechanical extraction of lines 3873--3933 from
 * INPUT/orbiter-new/AttDeterWalkMode/IP_AttDeterWalkMode.c.
 * Only the surrounding translation unit was omitted; this function body is
 * kept verbatim so the FloatTest harness can replace its four downstream
 * subsystem calls with observable deterministic stubs. */
void AttDeterWalkMode(void)
{
    float64 tmpFabs;

    /* 任务1~任务8周期调用 */
    if (IN_RANGE_CLOSE(sWalkModeData.TaskNumber, 1, 8))
    {
        /* (1)调用4.2.1(部件数据处理) */
        DeviceDataProc();

        /* (2)调用4.3.7(行走过程中姿态确定(行走)) */
        AttDeterWalk();

        /* (3)调用4.3.8(行走姿态处理(行走)) */
        AttProcWalk();

        tmpFabs = Fabsx(sWalkModeData.AttBaseBoard);

        /* 静态模式处理 */
        if (sGncCtrlFlag.BZ1 == WORK_MODE_STATIC)
        {
            if ((sWalkAttData.AttValidIF == 1) &&
                (tmpFabs > sWalkModeParam.theta_safe))
            {
                /* 姿态报警 */
                sWalkCtrlFlag.Task = 62;
                UI32_BIT_SET1(sWalkSendData.tiltAlarm, 0u, 1u);
            }
            else
            {
                /* 姿态正常 */
                UI32_BIT_SET1(sWalkSendData.tiltAlarm, 0u, 0u);
            }
        }
        /* 地面规划行走、全局规划、移动规划模式处理 */
        else
        {
            if (tmpFabs > sWalkModeParam.theta_safe)
            {
                /* 姿态报警 */
                sWalkCtrlFlag.Task = 62;
                UI32_BIT_SET1(sWalkSendData.tiltAlarm, 0u, 1u);
            }

            /* 陀螺/加计小于3个 */
            if ((sGncCtrlFlag.GyrInvNum > sAttiModifyParam.GyrInvMaxN) ||
                (sGncCtrlFlag.AccInvNum > sAttiModifyParam.AccInvMaxN))
            {
                sWalkCtrlFlag.Task = 35;
            }
        }
    }

    /* （3）调用4.3.1（星敏感器陀螺确定惯性姿态）, 任务1周期调用 */
    if (sWalkModeData.TaskNumber == 1)
    {
        AttDeterStsGyro();
    }

    return;
}
