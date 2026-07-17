# JetCtrlSend 验证结果

## 功能说明

`JetCtrlSendFun` 是卫星软件中负责推力器控制输出的 IP：它读取 12 路推力器
脉冲输入 `pulse[0..11]`，把 6 对脉冲信号打包成软件喷气字节 `wPulse`
（第 k 对 `pulse[2k]`、`pulse[2k+1]` 中任意一路等于 1，则置位 `0x04 << k`），
再组帧 `[0xEB, 0x93, wPulse]`，调用底层驱动 `UartSend` 经串口发出。

原始代码位于 `INPUT/SAMCodeSynthesis/JetCtrlSend/IP_JetCtrlSend.c`。

## 验证产物

```text
OUTPUT/SAMCodeSynthesis/JetCtrlSend/
├── source/
│   └── IP_JetCtrlSend.c          # 带 QCP annotation 的自包含验证用 C 源码
├── rocq/
│   ├── IP_JetCtrlSend_lib.v      # 数学 spec / helper lemmas
│   ├── IP_JetCtrlSend_goal.v     # symexec 生成的 VC（验证条件）
│   ├── IP_JetCtrlSend_proof_auto.v   # 自动证明部分（safety + partial）
│   ├── IP_JetCtrlSend_proof_manual.v # 手动证明部分（return + pure）
│   └── IP_JetCtrlSend_goal_check.v   # 总体验证模块
└── reports/
    ├── case_brief.md             # case 概述与验证策略
    ├── witness_ledger.md         # witness 分类台账
    ├── final_checklist.md        # final-check 检查清单
    ├── timing_summary.md         # 各阶段耗时
    └── gen_proofs.py             # 批量生成证明的脚本（可复现）
```

对应正式工作区产物：

- `QCIPLib/SAMCodeSynthesis/JetCtrlSend/IP_JetCtrlSend_lib.v`
- `QCIPCases/SAMCodeSynthesis/JetCtrlSend/IP_JetCtrlSend_goal.v`
- `QCIPCases/SAMCodeSynthesis/JetCtrlSend/IP_JetCtrlSend_proof_auto.v`
- `QCIPCases/SAMCodeSynthesis/JetCtrlSend/IP_JetCtrlSend_proof_manual.v`
- `QCIPCases/SAMCodeSynthesis/JetCtrlSend/IP_JetCtrlSend_goal_check.v`

## 规格说明

本 case 采用**强功能规格**（与 CheckCal08 / ThrusterCtrlLogic 同级）：

- **前置条件**：`pIp->uartno`、`pIp->pulse`、`pIp->sendBuf` 三个字段可读写；
  `pulse` 指向 12 个 `unint32`，`sendBuf` 指向 3 个 `unint08`，内容任意。
- **后置条件**：存在字节序列 `sent`，使得
  1. `UartSendRecord(uartno, sent)`（`sent` 就是交给 `UartSend` 的字节序列）；
  2. `JetCtrlSendPost(pulse_list, sent)`，即
     `sent = [0xEB, 0x93, pack_wPulse(pulse_list)]`（帧头 + 按位打包字节）；
  3. 返回后 `sendBuf` 的内容恰为 `sent`，`pulse` 数组与字段不变。

也就是说，证明的不只是内存安全，而是"**交给驱动的字节序列在数学上完全由
输入决定**"：`pack_wPulse` 逐对展开 `(p0 =? 1) || (p1 =? 1)` 的置位语义，
spec 对任意取值的 `pulse[i]` 都成立（不要求输入是 0/1）。

- **UartSend 建模**：`Require Zlength l = sendsize && UCharArray::full(buf, sendsize, l)`，
  `Ensure UartSendRecord(uartno, l) && UCharArray::full(...)`。驱动实现不可见，
  但它读到的缓冲区内容被完整刻画。
- **UartSendRecord** 目前是占位谓词（`True`）；发送内容的性质由
  `JetCtrlSendPost` 与缓冲区断言共同给出。若后续要给驱动配真实语义，
  只需加强 `UartSendRecord`，调用者 spec 不变。

### 验证模型与原始代码的差异（均为绕过当前工具限制的等价变形）

1. 结构体定义内联，入口由 `void *p` 强转变为直接接收 `JetCtrlSend *pIp`。
2. **局部数组不支持**：当前 symexec 对任何局部 C 数组（哪怕裸声明
   `unint08 sendBuf[10];`）都在 return 处报 `Unsupported array predicate`。
   因此把 `sendBuf[10]` 建模为结构体指针字段 `sendBuf`（指向 3 字节缓冲区，
   原始代码只写前 3 字节）。
3. **路径爆炸规避**：每个 `if (pulse[2k]==1 || pulse[2k+1]==1)` 产生 3 条可行
   路径，6 个 if 内联会产生 `3^6 = 729` 条返回路径（实测生成 3642 个
   witness，不可承受）。因此把每个 if 块**逐字**抽取为 helper 函数
   `JetCtrlSendPairStep`（含 `||` 短路语义与位或赋值），调用点使用其 spec
   `__return == jet_step(p0, p1, w, mask)`。主函数因此只有 1 条返回路径，
   全 case 只有 82 个 witness。打包的数学性质集中在 lib 的
   `jet_step` / `pack_wPulse` 中刻画。

## 复现命令

```bash
# 0. 生成 VC（可选；产物已在 QCIPCases 下）
./win-binary/symexec.exe \
  --goal-file=QCIPCases/SAMCodeSynthesis/JetCtrlSend/IP_JetCtrlSend_goal.v \
  --proof-auto-file=QCIPCases/SAMCodeSynthesis/JetCtrlSend/IP_JetCtrlSend_proof_auto.v \
  --proof-manual-file=QCIPCases/SAMCodeSynthesis/JetCtrlSend/IP_JetCtrlSend_proof_manual.v \
  --coq-logic-path=QCIPCases.SAMCodeSynthesis.JetCtrlSend \
  --input-file=OUTPUT/SAMCodeSynthesis/JetCtrlSend/source/IP_JetCtrlSend.c \
  --no-exec-info

# 1. 重新批量生成证明（可选；会覆盖两个 proof 文件）
python -X utf8 OUTPUT/SAMCodeSynthesis/JetCtrlSend/reports/gen_proofs.py

# 2. 编译验证（依赖顺序）
coqc $(cat _CoqProject) QCIPLib/SAMCodeSynthesis/JetCtrlSend/IP_JetCtrlSend_lib.v
coqc $(cat _CoqProject) QCIPCases/SAMCodeSynthesis/JetCtrlSend/IP_JetCtrlSend_goal.v
coqc $(cat _CoqProject) QCIPCases/SAMCodeSynthesis/JetCtrlSend/IP_JetCtrlSend_proof_auto.v
coqc $(cat _CoqProject) QCIPCases/SAMCodeSynthesis/JetCtrlSend/IP_JetCtrlSend_proof_manual.v
coqc $(cat _CoqProject) QCIPCases/SAMCodeSynthesis/JetCtrlSend/IP_JetCtrlSend_goal_check.v
```

## 关键技巧

1. **位运算的建模**：uchar 上的 `w | 0x04` 在 goal 中就是 `Z.lor w 4`
   （写回 UChar 时外层套 `unsigned_last_nbits ... 8 = x mod 256`，
   定义见 `SeparationLogic/SeparationLogic/IntLib.v`）。分支条件中的
   `(a == 1)` 求值会在逻辑层面对 `a = 1` 分情形，路径假设直接是
   `a_pre = 1` / `a_pre <> 1`，配合 `Z.eqb_eq` / `Z.eqb_neq` 即可化简 spec 侧
   的 `(a =? 1)`。
2. **字节界引理**：`lor_byte_bound`（两字节的 lor 仍是字节，经由
   `unsigned_last_nbits_lor_distr` 与 `Z.mod_pos_bound`）与
   `jet_step_byte_bound`，用于证明各 helper 调用点的前置 `0 <= w < 256`。
3. **强 spec 的对号入座**：lib 中 `pack_wPulse` 的定义形状与 C 中 6 次
   helper 调用的嵌套顺序完全一致，主 return witness 把 PreH 中的
   retval 链逐条 `rewrite` 后两边语法相同，`reflexivity` 即可。
4. **`replace3` 引理**：长度为 3 的列表经 `replace_Znth 0/1/2` 后等于
   显式列表 `[a; b; c]`，把 symexec 生成的缓冲区 replace 链与 spec 的
   `[0xEB; 0x93; pack]` 连接起来。
5. **写数组前的拆分**：对 `sendBuf[i] = v` 这类写操作，symexec 生成
   `undef` 形态的拆分 VC（`|->_`）；先用
   `UCharArray.full_split_to_missing_i` 拆出元素，再用
   `store_uchar_undef_store_uchar` 把带值 store 转成 undef store。
6. **symexec 不覆盖已有 proof 文件**：重跑前需先删除旧的
   `*_proof_auto.v` / `*_proof_manual.v`（否则报
   `manual proof file not updated`）。
