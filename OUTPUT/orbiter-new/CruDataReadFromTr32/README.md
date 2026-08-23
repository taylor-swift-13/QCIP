# CruDataReadFromTr32 FloatTest

本交付直接编译原始 `IP_CruDataReadFromTr32.c`，从同批头文件补入快照遗漏的恢复区声明。真实三取二 SRAM 读取由确定性可观察桩替代；每次返回 `base + step*i` 的 32 位值，并核对三区地址、128 次调用、首尾大端字节和完整 512 字节校验和。

复现：`bash FloatTest/tools/run_tests.sh CruDataReadFromTr32 1000 0x9E3779B97F4A7C15`

这是确定性有限采样，不访问真实 SRAM，也不验证缺失的 `Tr32Uint` 驱动实现。
