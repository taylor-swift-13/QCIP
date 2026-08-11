# CS_TrgtAtt_OCM 差分测试

本目录验证原始 `IP_CS_TrgtAtt_OCM.c`：

```text
Ctmp = Angle2C<Seq_AttD[m_WorkMode]>(A_Trgt)
Cro  = Cbiasp * Ctmp
qri  = C2Q(Cro * coi)
wri  = Cro * w0i
wro  = wri - Cro * w0i
CS_Track_Atti()
```

`Angle2C`、矩阵乘和 `C2Q` 复用 EIM 已记录的组件重建，C/Rocq 两侧
分别来自 `FloatTest/ref/iplib_attitude_helpers.c` 和
`OUTPUT/iplib/CS_TrgtAtt_EIM/rocq/spec.v`；`sin/cos` 使用同算法 musl
binary64 移植。仓库缺失的无参 `CS_Track_Atti` 使用计数桩，调用次数
纳入输出，但不把该下游过程的效果算作本题覆盖。

复现：

```bash
COQ=$(command -v coqc) bash FloatTest/tools/run_tests.sh CS_TrgtAtt_OCM 5000 0x6d50b9713af42ce5
```

结果为 **5011/5011**（11 定向 + 5000 随机）逐位一致。定向包含六种
转序、非法转序和用于触发 `C2Q` 四条 Shepperd 路径的物理 DCM。
这是采样差分测试，不是全称证明，也不覆盖内存安全或未知组件原件等价性。

2026-08-10 独立复核修正了早期重建中四个 Angle2C 第一轴符号和 C2Q
两个对称项下标；修正后通过 `attitude_selftest` 独立 oracle 及本题全量回归。
