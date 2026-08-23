# CMICalculate FloatTest

本交付直接编译原始 `IP_CMICalculate.c`。缺失的 sin/cos、四元数乘法和 Q→C 转换由确定性可观察桩提供；转置与行提取使用共享逐语句实现。Rocq 检查导航重置、`tmpa` 的 binary64 求值顺序、四元数数据流、CMI/CIM 布局和 `wmi` 行复制。

复现：`bash FloatTest/tools/run_tests.sh CMICalculate 1000 0x9E3779B97F4A7C15`

这是调用链/矩阵布局测试，不验证缺失的真实三角和四元数转换公式。

有限采样结论不构成对该组件全部输入的全称证明。
