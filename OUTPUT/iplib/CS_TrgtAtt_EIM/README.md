# CS_TrgtAtt_EIM 验证结果

本目录包含 `INPUT/iplib/CS_TrgtAtt_EIM/source/IP_CS_TrgtAtt_EIM.c`
的 Coq 差分测试产物（路线 B，方案与边界声明见 `FloatTest/README.md`）。
这是 iplib 批次三角依赖题目的第二题，复用 `FloatTest/ref/ported_trig.c`
+ `FloatTest/lib/FloatTrig.v` 的 musl sin/cos 移植（移植自测见
`FloatTest/tools/trig_selftest/`）。

## 功能

`CS_TrgtAtt_EIMFun` 目标姿态解算（全部浮点输入为 float64）：

```c
Ctmp = Angle2C<Seq_AttD[WorkMode]>(A_Trgt);  // 6 转序 + default→321
Cro  = Cbiasp * Ctmp;        // MatrixMulti333
Cri  = Cro * Coi;            // MatrixMulti333
qri  = C2Q(Cri);             // Shepperd，q[3] 为标量部
wri  = Cro * w0i;            // MatrixMulti331
cw   = Cro * w0i;            // 同上（逐比特相同）
wro  = wri - cw;             // 恒为 +0.0
```

`WorkMode ∈ [0,13]` 索引 `Seq_AttD[14]`；转序值非法（含 0/999）走
`default`，与 `321` 相同。

## 组件库重建声明（关键）

`Angle2C123..321`、`MatrixMulti333/331`、`C2Q` 这四个组件库函数
**全仓库无实现**（既不在本 case 头文件，也不在其他 iplib/SAM 源中），
因此参考驱动与 Coq spec 使用同一套**重建版本**，约定如下：

- `Angle2C<ijk>`：主动右手元旋转，`A<ijk> = Ai(a_i)·Aj(a_j)·Ak(a_k)`，
  参量序 = 轴号（`Angle2C321(C, a1, a2, a3)` 的 `a1` 是绕轴 3 的角，
  与经典 3-2-1 展开式一致，已核对）；sin/cos 用 musl 移植。
- `MatrixMulti333/331`：`C[i][j] = Σ_k A[i][k]·B[k][j]`，从 0.0 起、
  k 升序累加（与 FloatTest 既往 ref harness 版本一致）。
- `C2Q`：Shepperd 法四分支（tr>0 / m0 主导 / m4>m8 / else），
  `q[3]` 为标量部；sqrt 在 C 侧用 libm sqrt（IEEE 正确舍入），
  Coq 侧用 `fp64_sqrt`（Flocq `Bsqrt` mode_NE，同样正确舍入），
  两侧逐比特一致。

**因此本题的测试真值是“原始 IP + musl 移植三角 + 上述重建组件库”**；
若将来拿到组件库原件且约定不同（如被动旋转、四元数标量部在前），
需按同一流程重做。

## 目录结构

```
OUTPUT/iplib/CS_TrgtAtt_EIM/
├── source/
│   ├── CS_TrgtAtt_EIM_main.c          # 参考驱动（含重建组件库实现）
│   ├── CS_TrgtAtt_EIM_cflags.txt      # -fno-builtin-sin/-cos + -include decls.h
│   ├── CS_TrgtAtt_EIM_extra_srcs.txt  # 追加源文件：FloatTest/ref/ported_trig.c
│   └── CS_TrgtAtt_EIM_decls.h         # 组件库原型注入（case 头文件无声明）
├── rocq/
│   ├── spec.v                         # Coq spec：1+14 整数 + 24 fp64 → 19 个输出 bits
│   └── tests.v                        # 1042 条 vm_compute 差分定理（工具生成，请勿手改）
└── reports/
    ├── vectors.txt                    # 1042 条输入/输出标准答案
    └── final_checklist.md             # 路径覆盖统计与阴性自检记录
```

## 复现步骤

在仓库根目录下执行：

```bash
bash FloatTest/tools/run_tests.sh CS_TrgtAtt_EIM 1000
# 输出 PASS: CS_TrgtAtt_EIM (1000 vectors)
```

## 验证结论

- **1042/1042 条向量逐位一致**（42 定向 + 1000 随机；每条向量是一条
  `vm_compute; reflexivity` 判定的精确 Coq 定理）。
- 路径覆盖：6 个转序全部命中（123:172、132:154、213:166、231:169、
  312:181、321:200，其中含 17 条非法转序走 default）；C2Q 四分支
  全部命中（tr>0:425、m0:186、m4:202、m8:229）。统计口径见
  reports/final_checklist.md。
- 阴性自检：故意改错 t_0500 的期望 qri[0] 最低位，coqc 正确报错；
  恢复后重新通过。
- 边界声明：这是采样验证，不是全称证明；不覆盖内存安全；组件库为
  重建约定（见上节）。

## 备注

1. sin/cos 是 musl 确定化移植，不是平台 libm：参考程序链接
   `FloatTest/ref/ported_trig.c`（shadow 同名符号，全部 TU 加
   `-fno-builtin-sin -fno-builtin-cos`），Coq spec 用
   `FloatTest/lib/FloatTrig.v` 的同算法复刻。移植输入域
   |x| < 2²⁰·(π/2)；本题角度输入 ∈ [-π, π]，远在域内。
2. 随机输入：atr ∈ [-π,π]³；cb/coi 由 `Angle2C321` 现场构造的随机
   物理 DCM（保证 C2Q 的 sqrt 参数非负、分支分布真实）；w0i ∈
   [-0.1,0.1]；wm ∈ [0,13]，seq 每项 6/25 概率取非法值 0。
3. `wro = wri − cw` 中 `cw` 与 `wri` 是同表达式同输入的两次计算，
   逐比特相同，故 wro 恒为 +0.0；spec 如实建模该语义（不化简）。
4. 全部输入为有限值（不注入 NaN/Inf）：C 的 NaN payload 传播与
   Flocq 规范 NaN bits 不同，这是全 FloatTest 的统一纪律。
5. iplib 头文件为 GBK 编码（阅读用 `iconv -f GBK -t UTF-8`）。
