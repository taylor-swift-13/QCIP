# CS_TrgtAtt_NWM_USU 验证结果

本目录包含 `INPUT/iplib/CS_TrgtAtt_NWM_USU/source/IP_CS_TrgtAtt_NWM_USU.c`
的 Coq 差分测试产物（路线 B，方案与边界声明见 `FloatTest/README.md`）。
复用 `FloatTest/ref/ported_trig.c` + `FloatTest/lib/FloatTrig.v` 的
musl sin/cos 移植、`FloatTest/ref/ported_sqrt.c` 的 musl sqrt 移植，
以及 EIM 的组件库重建约定。

## 功能

`CS_TrgtAtt_NWM_USUFun` 目标姿态解算（全部浮点输入为 float64），
无 A_Trgt 输入（与 AHM_USU/OCM 不同，姿态漂移角 Psi_DA/dPsi_DA
直接进旋转）：

```c
tmpCp = Angle2C<sv>(0, 0, Psi_DA);   // sv = Seq_AttD[m_WorkMode]，6 转序 + default→321
                                     // （内嵌包装器 CS_Angle2CX_temp1，本 case 真实代码）
Cro_si = tmpCp * (Csib_DARot * Cbiasp);   // 两次 MatrixMulti333
wri_si = Cro_si * w0i;  wri_si[2] += dPsi_DA;  // MatrixMulti331 + 标量加
Cro    = Cbsi_DARot * Cro_si;             // MatrixMulti333
wri    = Cbsi_DARot * wri_si;             // MatrixMulti331
C2Angle123(&A_Ref_si, Cro_si);            // 内部 asin/atan2，未移植【打桩】
qri    = C2Q(Cro * coi);                  // Shepperd，q[3] 为标量部
wro    = wri - Cro * w0i;                 // MatrixMulti331 + 标量减
```

## 组件库重建与打桩声明（关键）

- `Angle2C×6`、`MatrixMulti333/331`、`C2Q` 仓库全库无实现，驱动与
  spec 使用与 CS_TrgtAtt_EIM **完全相同的重建约定**（主动右手元
  旋转、参量序=轴号；C2Q 为 Shepperd 法 q[3] 标量部）。sin/cos
  用 musl 移植（ported_trig.c），sqrt 用 musl 移植（ported_sqrt.c，
  发现 MSVCRT sqrt 在 x=0x1.de63fa81fe9bcp+0 处存在 1-ulp 误舍入
  后统一替换，见 FloatTest/README.md §17），Coq 侧 fp64_sqrt
  同为正确舍入。
- `default→321` 不是重建假设：本 case 内嵌包装器
  `CS_Angle2CX_temp1` 的 switch default 分支就是 Angle2C321，
  属于被测原始代码的一部分。
- `m_WorkMode` 是结构体字段 `pIp->m_WorkMode`（头文件有定义），
  由驱动注入，真实参与 sv 查表。
- `C2Angle123`（内部是 asin/atan2，未移植）打空操作桩，`A_Ref_si`
  保持初值并**移出比较集**（下游无人读它，31 个输出不含该数组）。

**测试真值 = "原始 IP + musl 移植三角/sqrt + EIM 同款重建组件库"**；
若将来拿到组件库原件且约定不同，需按同一流程重做。

## 目录结构

```
OUTPUT/iplib/CS_TrgtAtt_NWM_USU/
├── source/
│   ├── CS_TrgtAtt_NWM_USU_main.c          # 参考驱动（含重建组件库与打桩）
│   ├── CS_TrgtAtt_NWM_USU_cflags.txt      # -fno-builtin-sin/-cos/-sqrt + -include decls.h
│   ├── CS_TrgtAtt_NWM_USU_extra_srcs.txt  # 追加源文件：ported_trig.c + ported_sqrt.c
│   └── CS_TrgtAtt_NWM_USU_decls.h         # 组件库原型 extern
├── rocq/
│   ├── spec.v                         # Coq spec：56 输入 → 31 输出
│   └── tests.v                        # 1025 条 vm_compute 差分定理（工具生成，请勿手改）
└── reports/
    ├── vectors.txt                    # 1025 条输入/输出标准答案（87 列）
    └── final_checklist.md             # 路径覆盖统计与阴性自检记录
```

## 复现步骤

在仓库根目录下执行：

```bash
bash FloatTest/tools/run_tests.sh CS_TrgtAtt_NWM_USU 1000
# 输出 PASS: CS_TrgtAtt_NWM_USU (1000 vectors)
```

## 验证结论

- **1025/1025 条向量逐位一致**（25 定向 + 1000 随机；每条向量是一条
  `vm_compute; reflexivity` 判定的精确 Coq 定理）。
- 路径覆盖：6 转序全部命中（123:154、132:170、213:154、231:156、
  312:171、321:220，其中非法转序走 default→321 共 32 条计入 321）；
  C2Q 四分支全部命中（tr>0:428、m0:193、m4:198、m8:206）。统计口径
  见 reports/final_checklist.md。
- 阴性自检：故意改错 t_0500 的期望 Cro_si[0] 最低位，coqc 正确报错
  （Unable to unify）；恢复后重新通过。
- 边界声明：这是采样验证，不是全称证明；不覆盖内存安全；组件库为
  重建约定（见上节）；C2Angle123 被打桩，对应转换不在测试范围内。

## 备注

1. sin/cos/sqrt 是 musl 确定化移植，不是平台 libm（三角移植输入域
   |x| < 2²⁰·(π/2)；本题角度输入 ∈ [-π, π]，远在域内）。详见
   `FloatTest/README.md` §17。
2. 本题曾暴露 MSVCRT sqrt 的 1-ulp 误舍入（t_0861 的 qri[0..3] 各差
   ±1 ulp，根因 x = tr+1.0 = bits 4611094754575247804），是引入
   ported_sqrt.c 的直接动因。
3. `wro = wri − Cro·w0i` 中两处 Cro·w0i 是同表达式同输入的两次
   计算，但 wri 先经 `Cbsi·(Cro_si·w0i + [0;0;dPsi])` 变换，wro 不
   恒为零，spec 如实建模。
4. 全部输入为有限值（不注入 NaN/Inf）：C 的 NaN payload 传播与
   Flocq 规范 NaN bits 不同，这是全 FloatTest 的统一纪律。
5. iplib 头文件为 GBK 编码（阅读用 `iconv -f GBK -t UTF-8`）。
