# CruDataFillTr32 FloatTest

本交付直接编译原始 `IP_CruDataFillTr32.c`，并从同批头文件补入快照遗漏的关键数据结构。真实三取二 SRAM 写入由可观察桩替代；测试逐次核对三个地址区的 4 字节步进，并比较首值、末值及全部 128 个大端 32 位值的总和。

复现：`bash FloatTest/tools/run_tests.sh CruDataFillTr32 1000 0x9E3779B97F4A7C15`

这是确定性有限采样，不访问真实 SRAM，也不验证缺失的 `Tr32UintValue` 驱动实现。
