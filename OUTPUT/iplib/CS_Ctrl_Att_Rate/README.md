# CS_Ctrl_Att_Rate 浮点差分测试

本交付使用原始 `INPUT/iplib/CS_Ctrl_Att_Rate/source/IP_CS_Ctrl_Att_Rate.c`，
覆盖 `FS_ModeProc=2` 直接复制，以及普通路径下 `FS_AttD=0..4`、BMC/非 BMC、
六种 Angle2C 转序和非法转序回退。每条向量逐位比较 A/Rate/wbo/w 闭环量、
3×3 Cbo、姿态误差和速率误差，共 27 个 binary64 输出。

固定种子结果为 **1018/1018**（18 条定向 + 1000 条随机）正例通过，另有
1 条阴性控制。覆盖计数：`FS_ModeProc=2` 129、普通路径 889；`FS_AttD`
0/1/2/3/4 分别 194/197/216/206/205；BMC/非 BMC 分别 470/548；六种
合法转序和非法转序各 126–166 条。

`FP_Qctrl` 固定为 0：其值为 1 的分支依赖尚未确定化移植的 `asin`。
`Qdiv` 的结果只供该排除分支使用，因此用可观察调用桩隔离，不进入输出结论。
非 BMC 向量把姿态差限制在 `(-pi,pi)`，在该域真实 `ModPNHP` 返回 float
输入本身；C 与 Rocq 两侧仍显式经历 binary64→binary32→binary64 转换。
Angle2C/矩阵 helper 与其他 iplib 姿态题复用相同的已自测重建实现。

复现：

```sh
bash FloatTest/tools/run_tests.sh CS_Ctrl_Att_Rate 1000 0x13198a2e03707344
```

这是有限采样差分测试，不是全输入全称证明，也不覆盖内存安全、天线历史
缓冲输出和 `FP_Qctrl=1` 的反三角路径。
