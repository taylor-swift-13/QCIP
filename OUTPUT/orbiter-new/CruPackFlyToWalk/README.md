# CruPackFlyToWalk FloatTest

本交付直接编译原始 `IP_CruPackFlyToWalk.c`。输入快照缺少自动打包器和校验和库实现：测试将自动打包器替换为写入三个确定性载荷字节的可观察桩，并独立重建 8 位累加和；调用指针、映射表、长度、首次标志、64 字节清零、包头和星时位模式都进入比较结果。

复现：`bash FloatTest/tools/run_tests.sh CruPackFlyToWalk 1000 0x9E3779B97F4A7C15`

这是确定性有限采样，不验证缺失的完整 `AutuPackDataflow` 实现。
