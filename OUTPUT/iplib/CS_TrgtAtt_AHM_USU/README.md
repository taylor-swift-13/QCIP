# CS_TrgtAtt_AHM_USU 验证结果

本目录包含 `INPUT/iplib/CS_TrgtAtt_AHM_USU/source/IP_CS_TrgtAtt_AHM_USU.c`
的 Coq 差分测试产物（路线 B，方案与边界声明见 `FloatTest/README.md`）。
iplib 批次三角依赖题目的第三题，复用 `FloatTest/ref/ported_trig.c` +
`FloatTest/lib/FloatTrig.v` 的 musl sin/cos 移植；首次采用
**"打桩 + 输入注入"** 规避未移植的 asin/atan2（见"组件库重建与打桩声明"）。

## 功能

`CS_TrgtAtt_AHM_USUFun` 常规偏置飞行模式目标姿态计算（全部浮点输入为
float64），本体 4 个内部函数均为本 case 文件内的真实代码：

```c
// 主函数（5.3.2.5.1）
tmpCp      = CS_Angle2C([0;0;Psi_DA], sv);   // sv = Seq_AttD[wm]
tmpC_Trgtb = Cbiasp * CS_Angle2C(A_Trgt, sv);
Cro_si     = (tmpCp * Csib_DARot) * tmpC_Trgtb;
wri_si     = Cro_si*w0i;  wri_si[2] += dPsi_DA;
Cro        = Cbsi_DARot * Cro_si;
wri        = Cbsi_DARot * wri_si;
A_Ref_si   = C2Angle123(Cro_si);             // 【打桩】
qri        = C2Q(Cro*coi);
wro        = wri - Cro*w0i;

// XX_Track_Atti（5.3.1.5）
A_Ref   = CS_C2Angle(Cro, sv);               // 【打桩：注入输入】
dA_Ref  = w2dEuler(A_Ref, wro, sv);          // 6 转序；default 原样透传
ddA_Ref = (dA_Ref - dA_Ref_Lst) / m_DeltaT;
if (wm==WKMD_AMM && F_MnvNextMode∈{1,2}) {
    dChi_Ref2 = (FS==0) ? XX_RateForeHybridTrace() : 原值;
    wri2 = Cbsi * (Cro_si*w0i + (Q2C([0;0;sin(ψ/2);cos(ψ/2)])*Csib)
                   * (e_xyz*dChi_Ref2) + [0;0;dPsi_DA]);
    dwri = (wri2 - wri2_Lst) / m_DeltaT;
} else {
    wri2 = wri;  dwri = (wri - wri_Lst) / m_DeltaT;
}
TorqRef = Mdf * (Js_Use * dwri);
if (VectorNorm3(TorqRef) > Mlf) TorqRef = 0;
```

`XX_RateForeHybridTrace` 是 9 段混合轨迹角速度规划（4 段含 sin/cos），
`tmA + dt_TorqRef2` 参与分段判断（函数返回前恢复 tmA，无可观察效应）。

## 组件库重建与打桩声明（关键）

**重建**（仓库全库无实现，与 spec 逐式同序；约定与 CS_TrgtAtt_EIM
完全一致）：

- `Angle2C123..321` / `CS_Angle2C`：主动右手元旋转，
  `A<ijk> = Ai(a_i)·Aj(a_j)·Ak(a_k)`，参量序=轴号；`default→321`
  沿用 EIM case 内嵌 switch 包装器的仓库自身惯例（EIM 的包装器是
  真实代码）。sin/cos 用 musl 移植。
- `Q2C`：四元数→DCM，`q[3]` 标量部，与 C2Q/Angle2C 同号约定的
  标准展开式（`C = [1-2(q2²+q3²), 2(q1q2-q3q4), ...]`）。
- `C2Q`：Shepperd 法四分支；sqrt 在 C 侧用 musl 移植（ported_sqrt.c，
  正确舍入；替换原因见 FloatTest/README.md §17），Coq 侧用
  `fp64_sqrt`（Flocq `Bsqrt` mode_NE），两侧逐比特一致。
- `MatrixMulti333/331`、`VectorNorm3`：行主序累加，0.0 起、k 升序。

**打桩**（`CS_C2Angle`、`C2Angle123` 内部是 asin/atan2，musl 反三角
尚未移植）：

- `CS_C2Angle`（输出 A_Ref）打桩为**直接拷贝注入输入 `a_ref_in`**。
  下游 `w2dEuler → ddA_Ref → dwri → TorqRef` 全部为真实计算并被
  逐比特比对；被打桩的只有"DCM→欧拉角"这一步转换本身。
- `C2Angle123`（输出 A_Ref_si）打桩为空操作：A_Ref_si 下游无人读，
  移出比较集。

**因此本题的测试真值是"原始 IP + musl 移植三角 + 上述重建组件库 +
两个打桩"**；asin/atan2 移植完成后可取消打桩按同一流程复测。

**裸全局与替身值**（仓库源码无定义，README 即声明）：
`m_WorkMode`、`m_DeltaT`、`csCtrlerData.Js_Use`、`csMnvData.e_xyz`
由驱动定义为全局并作为输入注入；`WKMD_AMM = 3` 为替身值（真实值
不在仓库；取 < 14 使 `Seq_AttD[wm]` 不越界——ModeConvert_NWM 的
0x44 替身可行是因为该 case 不按模式索引数组）。代码使用裸全局
`m_WorkMode` 而非同名字段 `pIp->m_WorkMode`（后者无人读）。

## 目录结构

```
OUTPUT/iplib/CS_TrgtAtt_AHM_USU/
├── source/
│   ├── CS_TrgtAtt_AHM_USU_main.c          # 参考驱动（含重建组件库与打桩）
│   ├── CS_TrgtAtt_AHM_USU_cflags.txt      # -fno-builtin-sin/-cos + -include decls.h
│   ├── CS_TrgtAtt_AHM_USU_extra_srcs.txt  # 追加源文件：FloatTest/ref/ported_trig.c
│   └── CS_TrgtAtt_AHM_USU_decls.h         # 组件库原型 + 裸全局 extern + WKMD_AMM
├── rocq/
│   ├── spec.v                             # Coq spec：104 输入 → 44 输出 bits
│   └── tests.v                            # 1023 条 vm_compute 差分定理（工具生成，请勿手改）
└── reports/
    ├── vectors.txt                        # 1023 条输入/输出标准答案
    └── final_checklist.md                 # 路径覆盖统计与阴性自检记录
```

## 复现步骤

在仓库根目录下执行：

```bash
bash FloatTest/tools/run_tests.sh CS_TrgtAtt_AHM_USU 1000
# 输出 PASS: CS_TrgtAtt_AHM_USU (1000 vectors)
```

## 验证结论

- **1023/1023 条向量逐位一致**（23 定向 + 1000 随机；每条向量是一条
  `vm_compute; reflexivity` 判定的精确 Coq 定理）。
- 路径覆盖（详见 reports/final_checklist.md）：6 转序全部命中
  （123:184、132:150、213:160、231:166、312:154、321:178）+
  非法转序 default 31（w2dEuler 原样透传可观察）；HybridTrace
  9 个分段全部命中（18~39 条/段）；外层分支 ratefore 306 /
  else 717；FS 0/1 = 243/63；t_sinacc≤1e-3 共 17；TorqRef 限幅
  清零 96。
- 阴性自检：故意改错 t_0500 的期望 dChi_Ref2 最低位，coqc 正确
  报错；恢复后重新通过。
- 边界声明：这是采样验证，不是全称证明；不覆盖内存安全；组件库
  为重建约定、含两个打桩（见上节）。

## 备注

1. sin/cos 是 musl 确定化移植，不是平台 libm：参考程序链接
   `FloatTest/ref/ported_trig.c`（shadow 同名符号，全部 TU 加
   `-fno-builtin-sin -fno-builtin-cos`），Coq spec 用
   `FloatTest/lib/FloatTrig.v` 的同算法复刻。移植输入域
   |x| < 2²⁰·(π/2)；本题最大三角参数为 w_ping·Δt ≲ 1.6×10⁴，
   远在域内。
2. 随机输入要点：atr ∈ [-π,π]³；cb/csib/cbsi/coi 为随机物理 DCM；
   `a_ref_in ∈ [-1.4,1.4]`（保证 w2dEuler 各转序 cos 除数
   |cos| ≥ 0.17，远离奇异）；wm ∈ [0,13]（1/3 概率强制 WKMD_AMM
   以提高 ratefore 覆盖）；fmn 约 1/2 概率 ∈ {1,2}；mtrack 断点
   有序；js 为小量级对称惯量阵、mlf 约 8% 取 1e-6（保证 TorqRef
   清零/保留两分支都有足够样本）。这些量级为覆盖服务，不要求
   物理保真。
3. `wri_si2[0..1]` 的显式 `+ 0.0` 会把 -0.0 翻成 +0.0（IEEE 加法
   规则），spec 如实建模未化简；`wro`、`dChi_Ref2` 的原值透传
   （else 分支/FS≠0）同样如实建模。
4. 全部输入为有限值（不注入 NaN/Inf）：C 的 NaN payload 传播与
   Flocq 规范 NaN bits 不同，这是全 FloatTest 的统一纪律。
5. iplib 头文件为 GBK 编码（阅读用 `iconv -f GBK -t UTF-8`）。
