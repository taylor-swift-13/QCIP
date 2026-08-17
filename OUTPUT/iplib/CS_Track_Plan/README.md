# CS_Track_Plan 浮点差分测试

## 覆盖结论

本 case 测试 `INPUT/iplib/CS_Track_Plan/source/IP_CS_Track_Plan.c` 的真实
顶层函数 `CS_Track_PlanFun`，覆盖 `FS_MnvTraceStyle` 的 0、1、2、3 和
其他值五类路径。逐向量比较实际调用类型、`mTrack` 指针身份以及转发给
callee 的 binary64 参数位模式。

固定种子运行结果为 **1005/1005**（5 条定向 + 1000 条随机）正例通过，
另有 1 条阴性控制证明翻转后的错误调用标签不成立。所有 1005 条指针身份
检查均为 1，参数转发复核为 0 个失配。调用分布为 MixedTrack 111、
SinTrackCalculate 140、AccSinTrackCalculate 123、ExtendedTrack 123、
无调用 508。

仓库没有 `SMnvrData` 定义，也没有 `MixedTrack`、`SinTrackCalculate`、
`AccSinTrackCalculate` 和扩展轨迹 hook 的实现。因此这些 callee 使用
可观察桩；测试证明的是顶层分派与参数传递，不宣称验证三个轨迹算法的
内部行为。clean compilation wrapper 只补足缺失类型，不改写输入源码中的
函数体。

## 复现

在仓库根目录执行：

```sh
bash FloatTest/tools/run_tests.sh CS_Track_Plan 1000 0x243f6a8885a308d3
```

`reports/vectors.txt` 保存 C 参考位模式，`rocq/tests.v` 中每条向量对应一条
`vm_compute` 定理；`reports/coqc_check_evidence.json` 保存固定 Coq 工具检查
记录。结果属于采样差分测试，不是全输入全称证明，也不覆盖内存安全。
