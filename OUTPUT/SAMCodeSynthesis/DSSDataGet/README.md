# DSSDataGet 验证结果

本目录包含 `INPUT/SAMCodeSynthesis/DSSDataGet/IP_DSSDataGet.c` 的 Coq 差分
测试产物。浮点 IP 不走 QCP 全链路（路线 B，方案与边界声明见
`FloatTest/README.md`）。

## 功能

`DSSDataGetFun` 太阳敏感器数据采集：UART 发取数指令（`0xEB 0x92`）、
收 11 字节帧，然后：

1. 错误记录：`debugDss.ErrCode = bSucc`；若 `bSucc != 0` 则 `ErrCnt++`；
   否则若 `(sum(b[0..9]) & 0xFF) != b[10]`：`ErrCode = 0xCC`、`ErrCnt++`。
2. **与通讯成败无关，总是执行**：
   - `royaw = float(b[0..3])`、`piyaw = float(b[4..7])`（字节重组见下）；
   - `flgSP = (b[8] == 1 || b[9] == 1) ? 1 : 0`。

### 字节重组（USED_WORD 联合）

gcc x86-64 上位域从 LSB 起分配，`Byte` 声明序 `High_h..Low_l` 使
`Low_l` 落在字的**最高字节**；C 按 `Low_l=b0 … High_h=b3` 赋值后：

```
word = b0<<24 | b1<<16 | b2<<8 | b3   （大端组装，线上首字节为 MSB）
```

（endian spike 实测：`Low_l=0x11, Low_h=0x22, High_l=0x33, High_h=0x44`
得 `0x11223344`；并在 200 条向量上独立复核重组公式 0 失配。）

## 目录结构

```
OUTPUT/SAMCodeSynthesis/DSSDataGet/
├── source/
│   └── DSSDataGet_main.c            # 参考驱动 + UART stub（注入测试帧）
├── rocq/
│   ├── spec.v                       # Coq spec：bSucc + 11 字节 + errCnt → royaw/piyaw/flgSP/errCode/errCnt'
│   └── tests.v                      # 1000 条 vm_compute 差分定理（工具生成，请勿手改）
└── reports/
    ├── vectors.txt                  # 1000 条输入/输出标准答案
    └── final_checklist.md           # 路径覆盖统计与阴性自检记录
```

## 复现步骤

在仓库根目录下执行：

```bash
bash FloatTest/tools/run_tests.sh DSSDataGet 1000
# 输出 PASS: DSSDataGet (1000 vectors)
```

## 验证结论

- **1000/1000 条向量逐位一致**。
- 路径覆盖：errCode=0 237、errCode=0xCC 485、errCode=bSucc 278、
  flgSP=1 580、errCnt 自增 763、errCnt 回绕定向 125
  （详见 reports/final_checklist.md）。
- 阴性自检：故意改错一个期望 bits，coqc 正确报错。
- 边界声明：这是采样验证，不是全称证明；不覆盖内存安全。

## 备注

- **UART stub 建模选择**：`UartRecv` stub 总是把向量字节填入接收缓冲并
  返回给定的 `bSucc`。真实硬件在接收失败时缓冲内容不定，但 IP 代码
  无论成败都会重组缓冲字节——本测试锁定的是"给定缓冲内容时 IP 逻辑的
  行为"，`bSucc != 0` 与字节重组的组合也被覆盖（mode 3）。
- `UartSend` / `SYS_Delay` 为 no-op stub（只发不收、无观察点）。
- IP 源文件对 UART 函数是隐式声明调用（DRV 头只在 `__GCC_COMPILED__`
  下引入），链接到驱动内 stub；gcc 有 `-Wimplicit-function-declaration`
  警告，属预期。
- `ErrCnt` 是全局 `debugDss` 的成员（unint32），跨调用累计——spec 把它
  作为显式输入/输出参数（`u32_inc` 模 2^32），mode 7 验证回绕。
