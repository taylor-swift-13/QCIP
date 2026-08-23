# CduModuleInfoGet FloatTest

本交付直接编译原始 `IP_CduModuleInfoGet.c`（含其内部 `CduModulePowerDutyGet` 与 `DevCommInit`）。位口读取由可观察桩替代并核对 12 个真实引脚的调用顺序；测试覆盖模块标志低三位更新、上位保留、A/B/C/非法值分支、当班旧值最终更新和有条件通讯状态清零。

复现：`bash FloatTest/tools/run_tests.sh CduModuleInfoGet 1000 0x9E3779B97F4A7C15`

这是布尔位口域上的确定性有限采样，不访问真实 GPIO。
