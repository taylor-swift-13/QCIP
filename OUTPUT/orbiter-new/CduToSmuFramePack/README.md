# CduToSmuFramePack FloatTest

本交付直接包含原始 `INPUT/orbiter-new/CduToSmuFramePack/IP_CduToSmuFramePack.c`。快照未提供 `CduToSmuFrameDataPack` 与 `CheckSumAdd08`，因此前者使用可观测桩（记录三个位于原帧内的指针并写入 5 个显式输入字节），后者用逐字节模 256 累加的确定性实现并记录指针和长度。其余 1010 个校验范围字节统一为随机 background，因而 Rocq 侧可独立计算完整校验和。覆盖帧号 0、1、254、255 及随机值。

复现：`bash FloatTest/tools/run_tests.sh CduToSmuFramePack 1000 0x9E3779B97F4A7C15`

测试覆盖帧头、地址、长度、类型、帧号回绕、调用接口和校验和；不声称验证缺失的真实 payload 打包实现。

有限采样结论不构成对该组件全部输入的全称证明。
