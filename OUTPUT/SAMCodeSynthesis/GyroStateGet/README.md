# GyroStateGet 验证结果

本目录包含 `INPUT/SAMCodeSynthesis/GyroStateGet/IP_GyroStateGet.c` 的 Coq
差分测试产物。浮点 IP 不走 QCP 全链路（路线 B，方案与边界声明见
`FloatTest/README.md`）。

## 功能

`GyroStateGetFun` 陀螺数据采集：UART 发取数指令（`0xEB 0x91`）、收
48 字节帧，然后：

1. 错误记录：`debugGyro.ErrCode = bSucc`；若 `bSucc != 0` 则 `ErrCnt++`；
   否则若 `(sum(b[0..46]) & 0xFF) != b[47]`：`ErrCode = 0xCC`、`ErrCnt++`。
2. **与通讯成败无关，总是执行**：对 `i < NumGyro`：
   - `wa[i] = float(b[2+4i..5+4i])`（大端重组，与 DSSDataGet 相同，
     spec 全程在 bits 域，不涉及浮点运算）；
   - `stateFlag[i] = b[38+i]`（unint08 零扩展到 unint32）；
   `i >= NumGyro` 的元素保持原值。

帧布局：b0/b1 帧头（只进校验和）；b[2..37] 为 9 路 float 大端字节；
b[38..46] 为 9 路状态字节；b[47] 校验和。

## 目录结构

```
OUTPUT/SAMCodeSynthesis/GyroStateGet/
├── source/
│   └── GyroStateGet_main.c          # 参考驱动 + UART stub（注入测试帧）
├── rocq/
│   ├── spec.v                       # Coq spec：bSucc + 48 字节 + NumGyro + wa/stateFlag 初值 + errCnt → wa'/stateFlag'/errCode/errCnt'
│   └── tests.v                      # 1000 条 vm_compute 差分定理（工具生成，请勿手改）
└── reports/
    ├── vectors.txt                  # 1000 条输入/输出标准答案（每条 89 列）
    └── final_checklist.md           # 路径覆盖统计与阴性自检记录
```

## 复现步骤

在仓库根目录下执行：

```bash
bash FloatTest/tools/run_tests.sh GyroStateGet 1000
# 输出 PASS: GyroStateGet (1000 vectors)
```

## 验证结论

- **1000/1000 条向量逐位一致**（每条 89 列）。
- 覆盖：numGyro 0–9 全覆盖（0: 172、9: 301、其余各约 50）；元素级
  更新 4852 次、透传 4148 次；errCode=0 301、0xCC 422、bSucc 277；
  errCnt 回绕定向 125。重组公式与透传行为在向量上独立复核 0 失配
  （详见 reports/final_checklist.md）。
- 阴性自检：故意改错一个期望 bits，coqc 正确报错。
- 边界声明：这是采样验证，不是全称证明；不覆盖内存安全。

## 备注

- **NumGyro 超出 [0,9] 时 C 代码会越界写 `wa[9]`/`stateFlag[9]`（UB）**，
  不属于被测行为；驱动与 spec 都按 NumGyro ∈ [0,9] 建模，README 特此
  声明（若上层可能传更大值，那是另一个需要在调用侧解决的问题）。
- UART stub 建模选择同 DSSDataGet：总是填入向量字节并返回给定
  `bSucc`，通讯失败时字节重组仍发生的行为被 mode 3 覆盖。
- `ErrCnt` 为全局 `debugGyro` 成员（unint32，跨调用累计），spec 作为
  显式输入/输出参数（`u32_inc` 模 2^32）。
