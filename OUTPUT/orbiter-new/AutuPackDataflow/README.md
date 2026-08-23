# AutuPackDataflow FloatTest

本交付直接编译原始 `IP_AutuPackDataflow.c`。`AutoPackBit`/`AutoPackByte` 在此题中替换为可观察桩，以隔离并验证调度层：首次偏移清零、Stop/长度双重终止、位/字节分类、表项指针、调用顺序和首次标志收尾。两个被调函数本身由各自 FloatTest case 覆盖。

复现：`bash FloatTest/tools/run_tests.sh AutuPackDataflow 1000 0x9E3779B97F4A7C15`

这是最多 5 个表项的确定性有限采样。
