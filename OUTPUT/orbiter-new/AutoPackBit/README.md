# AutoPackBit FloatTest

本交付直接编译原始 `IP_AutoPackBit.c`，覆盖空位、1–7 位原码、32 位逻辑判断和 8 位逻辑判断，共 10 个无 MMIO 分支；每个分支同时覆盖首次定位和复用缓存位置。Rocq 独立建模掩码写入、`type` 低位缓存及跨字节偏移。

复现：`bash FloatTest/tools/run_tests.sh AutoPackBit 1000 0x9E3779B97F4A7C15`

本轮不执行浮点压缩及 POWER/COMM MMIO 分支；这些缺失硬件/转换语义不在有限采样结论内。
