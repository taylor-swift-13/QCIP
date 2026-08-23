# CruPack FloatTest

本交付直接编译原始 `IP_CruPack.c`。自动打包器由写入两个载荷字节的可观察桩替代，校验和独立重建；测试覆盖飞跃条件的严格 `TRUE32` 判断、六个工作模式和默认分支、行走分支保持 `tmpTime`、448 字节初始化、包头、表选择和调用长度。

复现：`bash FloatTest/tools/run_tests.sh CruPack 1000 0x9E3779B97F4A7C15`

这是确定性有限采样，不验证缺失的完整打包表内容；调度器和位/字节打包器另有独立 case。
