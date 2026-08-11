# CS_TrgtP2P_Ini 验证结果

本目录包含 `INPUT/iplib/CS_TrgtP2P_Ini/source/IP_CS_TrgtP2P_Ini.c`
的 Coq 差分测试产物（路线 B，方案与边界声明见 `FloatTest/README.md`）。
复用 `FloatTest/ref/ported_sqrt.c` 的 musl sqrt 移植（C2Q 内）与
EIM 的组件库重建约定。

## 功能

`CS_TrgtP2P_IniFun` 点对点机动的初始化（全部浮点输入为 float64）：

```c
dChimax[i] = dChimax_RWorCMGCtrlZR[i][F_P2PType];   // i=0..2，查表
amax[i]    = amax_RWorCMGCtrlZR[i][F_P2PType];
if      (m_WorkMode == WKMD_OAM) CS_TrgtP2P_OrbCtl_Ini();   // 【打桩】
else if (m_WorkMode == WKMD_AMM) CS_TrgtP2P_Tar_Init();     // 【打桩】
else                             f_Fun_Null();              // 【打桩】
qro  = C2Q(Cro);            // Shepperd，q[3] 为标量部
qro0 = qro;                 // 透传拷贝
```

## 组件库重建与打桩声明（关键）

- `C2Q` 仓库全库无实现，驱动与 spec 使用与 CS_TrgtAtt_EIM **完全相同
  的重建约定**（Shepperd 法四分支、q[3] 标量部、sqrt 用 musl 移植
  ported_sqrt.c，与 Coq 侧 fp64_sqrt 同为正确舍入）。`Memcpyx` =
  memcpy 包装（std_utils.h 只有声明无实现）。
- `CS_TrgtP2P_OrbCtl_Ini` 全库无实现、`CS_TrgtP2P_Tar_Init` 是独立的
  兄弟 case（其 Cro 生成逻辑在该题目内单独测试）：两者都打空操作
  桩（驱动计数 orbc/tar/nul 到 stderr，确认 187/391/435 次分支命中），
  `f_Fun_Null` 空操作。打桩后 **`m_WorkMode` 不影响任何输出**——
  spec 如实建模（wm 进签名但不参与计算），"wm 任意值输出相同"这一
  性质本身被 1013 条向量验证。
- 本题 `Cro` 作为输入注入（定向注入 I/Rx(π)/Ry(π)/Rz(π) 强制 C2Q
  四分支，随机由欧拉角经 Angle2C321 现场构造物理 DCM）。
- 裸全局 `m_WorkMode`（仓库源码无定义）由驱动定义为输入注入；
  `WKMD_OAM=0x55`、`WKMD_AMM=0x44` 为替身值（0x44 沿用
  ModeConvert_NWM 的既有替身，0x55 为本题新设）。

**测试真值 = "原始 IP + EIM 同款重建组件库 + 上述打桩"**；
若将来拿到组件库原件且约定不同，需按同一流程重做。

## 目录结构

```
OUTPUT/iplib/CS_TrgtP2P_Ini/
├── source/
│   ├── CS_TrgtP2P_Ini_main.c          # 参考驱动（含重建组件库与打桩）
│   ├── CS_TrgtP2P_Ini_cflags.txt      # -fno-builtin-* + -include decls.h
│   ├── CS_TrgtP2P_Ini_extra_srcs.txt  # ported_trig.c + ported_sqrt.c
│   └── CS_TrgtP2P_Ini_decls.h         # 替身常量 + 裸全局 extern + 打桩原型
├── rocq/
│   ├── spec.v                         # Coq spec：47 输入 → 14 输出
│   └── tests.v                        # 1013 条 vm_compute 差分定理（工具生成，请勿手改）
└── reports/
    ├── vectors.txt                    # 1013 条输入/输出标准答案（61 列）
    └── final_checklist.md             # 分支覆盖统计与阴性自检记录
```

## 复现步骤

在仓库根目录下执行：

```bash
bash FloatTest/tools/run_tests.sh CS_TrgtP2P_Ini 1000
# 输出 PASS: CS_TrgtP2P_Ini (1000 vectors)
```

## 验证结论

- **1013/1013 条向量逐位一致**（13 定向 + 1000 随机；每条向量是一条
  `vm_compute; reflexivity` 判定的精确 Coq 定理）。
- 分支覆盖：wm 三分支 WKMD_OAM 187 / WKMD_AMM 391 / 其他 435
  （与打桩计数 orbc/tar/nul 一致）；F_P2PType 0..5 全覆盖
  （195/156/176/157/172/157）；C2Q 四分支全部命中
  （tr>0:422、m0:229、m4:153、m8:209）。统计口径见
  reports/final_checklist.md。
- 阴性自检：故意改错 t_0500 的期望 qro[0] 最低位，coqc 正确报错；
  恢复后重新通过。
- 边界声明：这是采样验证，不是全称证明；不覆盖内存安全；组件库为
  重建约定、mode callee 被打桩（见上节）。

## 备注

1. sqrt 是 musl 确定化移植（ported_sqrt.c），不是平台 libm；详见
   `FloatTest/README.md` §17。
2. `F_P2PType` 越界（[0,5] 之外）是数组越界 UB，按全 FloatTest 的
   统一纪律不注入（ModeConvert_EIM 的下标覆盖先例）。
3. 全部输入为有限值（不注入 NaN/Inf）：C 的 NaN payload 传播与
   Flocq 规范 NaN bits 不同，这是全 FloatTest 的统一纪律。
4. iplib 头文件为 GBK 编码（阅读用 `iconv -f GBK -t UTF-8`）。
