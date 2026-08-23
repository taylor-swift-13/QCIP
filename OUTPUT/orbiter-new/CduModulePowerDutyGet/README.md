# CduModulePowerDutyGet FloatTest

本交付直接编译原始 `IP_CduModulePowerDutyGet.c`。位口读取由按真实引脚号索引的可观察桩替代，并验证 9 次读取的顺序；缺失的 `SYSPowerSwitch` 声明由 driver 提供。测试覆盖 A/B/C、非法模块值走 C 分支、切换与不切换，并观察通讯计数和故障标志是否按条件清零。

复现：`bash FloatTest/tools/run_tests.sh CduModulePowerDutyGet 1000 0x9E3779B97F4A7C15`

这是布尔位口域上的确定性有限采样，不访问真实 GPIO。
