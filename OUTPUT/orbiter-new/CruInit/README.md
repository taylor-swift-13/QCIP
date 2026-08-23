# CruInit FloatTest

本交付直接编译原始 `INPUT/orbiter-new/CruInit/IP_CruInit.c`。输入覆盖 `bCruRestore` 的 0、1 和其他非零值，验证 C 源码严格比较 `TRUE32` 的语义；同时随机化所有被写字段和一个应保持不变的 `cycleSave3To2` 字段。规格独立给出初始化后的 10 个可观测字段。

复现：`bash FloatTest/tools/run_tests.sh CruInit 1000 0x9E3779B97F4A7C15`

这是初始化字段的有限确定性测试，不覆盖结构体中未被该函数访问的大数组内容。

有限采样结论不构成对该组件全部输入的全称证明。
