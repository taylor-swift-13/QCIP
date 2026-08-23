# ConstDiagSignInt FloatTest

本交付直接编译原始 `INPUT/orbiter-new/ConstDiagSignInt/IP_ConstDiagSignInt.c`。输入数组固定容量 8，`sizeVar` 覆盖 0..8；覆盖全相等、首项/末项不等、零长度以及计数阈值两侧。初始计数限制在 -10..10，排除有符号溢出。Rocq 规格独立建模前缀比较、计数更新和严格 `>` 判定。

复现：`bash FloatTest/tools/run_tests.sh ConstDiagSignInt 1000 0x9E3779B97F4A7C15`

这是有限确定性采样，不是对任意数组长度的证明。
