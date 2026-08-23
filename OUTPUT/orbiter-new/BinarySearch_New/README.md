# BinarySearch_New FloatTest

本交付直接编译原始 `INPUT/orbiter-new/BinarySearch_New/IP_BinarySearch_New.c`（由驱动单 translation unit 包含，以补齐快照缺失的基础 typedef）。测试固定 8 项严格升序表，覆盖首/尾/中间命中、子区间命中及区间外未命中；索引限定为 0..7，避免原函数断言失败。Rocq 规格独立实现同一二分循环。

复现：`bash FloatTest/tools/run_tests.sh BinarySearch_New 1000 0x9E3779B97F4A7C15`

这是有限确定性采样，不是对任意表长或全部 C 执行的证明。
