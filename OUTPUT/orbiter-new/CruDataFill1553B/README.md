# CruDataFill1553B FloatTest

本交付直接编译原始 `IP_CruDataFill1553B.c`。输入快照缺少 `SCrucialSave` 声明，测试从同批 `CruPackFlyToWalk` 头文件补入；快照也缺少 1553B 库实现，因此 `BufferCopy08to16` 按大端双字节转换重建，`B1553RtSaWrite` 替换为可观察桩。Rocq 独立检查 8 个子地址、参数、源区偏移，以及每个 64 字节块首尾字的数据路径。

复现：`bash FloatTest/tools/run_tests.sh CruDataFill1553B 1000 0x9E3779B97F4A7C15`

这是确定性有限采样；不执行真实 1553B 总线 I/O，也不声称验证缺失驱动本身。
