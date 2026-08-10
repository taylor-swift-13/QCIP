# CS_TrgtAtt_OCM 验证结果

本目录包含 `INPUT/iplib/CS_TrgtAtt_OCM/source/IP_CS_TrgtAtt_OCM.c`
的 Coq 差分测试产物（路线 B，方案与边界声明见 `FloatTest/README.md`）。
复用 `FloatTest/ref/ported_trig.c` + `FloatTest/lib/FloatTrig.v` 的
musl sin/cos 移植与 EIM 的组件库重建约定。

## 功能

`CS_TrgtAtt_OCMFun` 目标姿态解算（全部浮点输入为 float64），语义是
CS_TrgtAtt_EIM 主函数的严格子集（无 A_Ref_si）：

```c
Ctmp = CS_Angle2C(A_Trgt, Seq_AttD[m_WorkMode]);  // 6 转序 + default→321
Cro  = Cbiasp * Ctmp;        // MatrixMulti333
Cri  = Cro * coi;            // MatrixMulti333
qri  = C2Q(Cri);             // Shepperd，q[3] 为标量部
wri  = Cro * w0i;            // MatrixMulti331
cw   = Cro * w0i;            // 同上（逐比特相同）
wro  = wri - cw;             // 恒为 +0.0
CS_Track_Atti();             // 应用层装配调用【打桩】
```

## 组件库重建与打桩声明（关键）

- `CS_Angle2C`、`MatrixMulti333/331`、`C2Q` 仓库全库无实现，驱动与
  spec 使用与 CS_TrgtAtt_EIM **完全相同的重建约定**（主动右手元
  旋转、`A<ijk> = Ai·Aj·Ak`、参量序=轴号、`default→321` 沿用
  EIM/NWM_USU case 内嵌 switch 包装器的仓库自身惯例；C2Q 为
  Shepperd 法 q[3] 标量部；sqrt：C 侧 musl 移植（ported_sqrt.c）
  ↔ Coq 侧 fp64_sqrt，均正确舍入）。sin/cos 用 musl 移植。
- `CS_Track_Atti()` 是应用层装配调用：仓库内对应物是 CS_Track_Atti
  案例的 `CS_Track_AttiFun(void*)`，原名 `CS_Track_Atti` 无定义，
  且此处为**无参调用**。本函数的全部输出（Cro/qri/wri/wro）不依赖
  它，打空操作桩（驱动 `track_calls` 计数确认 1042 次调用全部
  触发，见复现日志 stderr）。
- 裸全局 `m_WorkMode`（仓库源码无定义）由驱动定义为输入注入；
  结构体同名字段 `pIp->m_WorkMode` 无人读。

**测试真值 = "原始 IP + musl 移植三角 + EIM 同款重建组件库"**；
若将来拿到组件库原件且约定不同，需按同一流程重做。

## 目录结构

```
OUTPUT/iplib/CS_TrgtAtt_OCM/
├── source/
│   ├── CS_TrgtAtt_OCM_main.c          # 参考驱动（含重建组件库与打桩）
│   ├── CS_TrgtAtt_OCM_cflags.txt      # -fno-builtin-sin/-cos/-sqrt + -include decls.h
│   ├── CS_TrgtAtt_OCM_extra_srcs.txt  # 追加源文件：ported_trig.c + ported_sqrt.c
│   └── CS_TrgtAtt_OCM_decls.h         # 组件库原型 + 裸全局 extern
├── rocq/
│   ├── spec.v                         # Coq spec：与 EIM 同签名（子集语义）
│   └── tests.v                        # 1042 条 vm_compute 差分定理（工具生成，请勿手改）
└── reports/
    ├── vectors.txt                    # 1042 条输入/输出标准答案
    └── final_checklist.md             # 路径覆盖统计与阴性自检记录
```

## 复现步骤

在仓库根目录下执行：

```bash
bash FloatTest/tools/run_tests.sh CS_TrgtAtt_OCM 1000
# 输出 PASS: CS_TrgtAtt_OCM (1000 vectors)
```

## 验证结论

- **1042/1042 条向量逐位一致**（42 定向 + 1000 随机；每条向量是一条
  `vm_compute; reflexivity` 判定的精确 Coq 定理）。
- 路径覆盖：6 转序全部命中（123:172、132:154、213:166、231:169、
  312:181、321:200），非法转序 default 17 条；C2Q 四分支全部命中
  （tr>0:425、m0:186、m4:202、m8:229）。统计口径见
  reports/final_checklist.md。
- 阴性自检：故意改错 t_0500 的期望 qri[0] 最低位，coqc 正确报错；
  恢复后重新通过。
- 边界声明：这是采样验证，不是全称证明；不覆盖内存安全；组件库为
  重建约定（见上节）。

## 备注

1. sin/cos 是 musl 确定化移植，不是平台 libm（移植输入域
   |x| < 2²⁰·(π/2)；本题角度输入 ∈ [-π, π]，远在域内）。详见
   `FloatTest/README.md` §17。
2. 随机输入与定向设计与 CS_TrgtAtt_EIM 相同（同一发生器结构），
   本题向量在相同 seed 下与 EIM 逐行一致，构成一次意外的
   跨 case 交叉验证：两题 spec 独立编写却给出逐比特相同的
   Cro/wri/qri/wro。
3. `wro = wri − cw` 中 `cw` 与 `wri` 是同表达式同输入的两次计算，
   逐比特相同，故 wro 恒为 +0.0；spec 如实建模该语义（不化简）。
4. 全部输入为有限值（不注入 NaN/Inf）：C 的 NaN payload 传播与
   Flocq 规范 NaN bits 不同，这是全 FloatTest 的统一纪律。
5. iplib 头文件为 GBK 编码（阅读用 `iconv -f GBK -t UTF-8`）。
