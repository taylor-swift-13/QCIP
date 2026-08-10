# CS_Track_Atti 差分测试

本目录验证原始 `IP_CS_Track_Atti.c` 中六种 `w2dEuler` 公式、角速度差分、
`J * dw/dt * Mdf` 力矩、向量模限幅以及两个历史状态复制。所有
`Sinx/Cosx` 调用真实执行，并由 `ported_trig.c` 与 `FloatTrig.v` 按
musl binary64 算法逐位对照。

## C2Angle 边界

仓库没有六个 `C2Angle*` 的实现（它们还依赖尚未移植的 asin/atan2）。
驱动因此把其输出改成显式输入的三个角，并记录实际被调度的函数编号；
Rocq spec 使用相同输入，函数编号也进入期望输出。这样没有声称验证
DCM 到欧拉角的反三角计算，但其后的六套 sin/cos 和控制计算均执行
原始 C。

复现：

```bash
COQ=$(command -v coqc) bash FloatTest/tools/run_tests.sh CS_Track_Atti 5000 0x3976a4c82d1be50f
```

结果为 **5013/5013**（13 定向 + 5000 随机）逐位一致。定向覆盖六种
转序、非法转序、各公式分母接近奇异点，以及力矩清零/保留两条路径；
全量中力矩清零/保留路径分别命中 2545/2468 条。

这是采样差分测试，不是全称证明；不覆盖内存安全，也不覆盖被打桩的
反三角 `C2Angle*` 算法。
