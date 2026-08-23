# ClearIntFromDsp FloatTest

原始函数依赖快照中不可执行的 MMIO 宏。本交付直接包含原始 `IP_ClearIntFromDsp.c`，仅把缺失的 `ADDR_WRITE` 替换为可观测桩，比较调用次数、地址、顺序和写入值；随机 tag 只用于确认桩状态每轮被真实调用结果覆盖。未访问实际地址 `0x20000000/0x20000004`。

复现：`bash FloatTest/tools/run_tests.sh ClearIntFromDsp 1000 0x9E3779B97F4A7C15`

这是对 MMIO 调用协议的有限重复测试，不验证真实硬件副作用。
