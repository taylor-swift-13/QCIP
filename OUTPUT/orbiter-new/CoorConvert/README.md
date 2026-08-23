# CoorConvert FloatTest

本交付直接编译原始 `INPUT/orbiter-new/CoorConvert/IP_CoorConvert.c`。快照缺少 `Sinx/Cosx` 实现，驱动通过共享的确定性 musl sin/cos 移植补齐，Rocq 使用同算法 `FloatTrig.v`；输入限制为有限值且角度远小于移植的约减上界。规格逐步保持 C 中乘、加、减与一元负号的顺序，输出按 binary64 位型比较。

复现：`bash FloatTest/tools/run_tests.sh CoorConvert 1000 0x9E3779B97F4A7C15`

这是声明范围内的有限采样，不覆盖 NaN、Inf 或超大角度。
