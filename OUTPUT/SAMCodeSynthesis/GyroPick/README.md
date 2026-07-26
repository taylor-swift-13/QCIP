# GyroPick 验证结果

本目录包含 `INPUT/SAMCodeSynthesis/GyroPick/IP_GyroPick.c` 的 Coq 差分测试
产物。浮点 IP 不走 QCP 全链路（路线 B，方案与边界声明见
`FloatTest/README.md`）。

## 功能

`GyroPickFun` 对 9 路陀螺角速度独立剔野（i = 0..8）：

1. `tmpgi = ABS(wa[i] - wal[i])`（`ABS` 宏：`((a)>0)?(a):-(a)`）。
2. 若 `tmpgi > waThr`（判为野值）：`countPick[i]++`（unint08，模 256 回绕）；
   若自增后的值 `< pickThr`（未连续 n 次）：`wa_out[i] = wal[i]` 沿用旧值；
   否则（连续野值）：`wal[i] = wa[i]`、`wa_out[i] = wa[i]`、`countPick[i] = 0`。
3. 若未超限：`wal[i] = wa[i]`、`wa_out[i] = wa[i]`、`countPick[i] = 0`。

注意 `ABS` 宏遇 NaN 时 `(a)>0` 为 false 而取 `-(a)` 支（仍是 NaN），随后的
`>` 比较为 false——**NaN 输入会被当作正常新值直接采纳**进 `wal`/`wa_out`。

## 目录结构

```
OUTPUT/SAMCodeSynthesis/GyroPick/
├── source/
│   └── GyroPick_main.c              # 参考驱动（gcc 编译原始 C）
├── rocq/
│   ├── spec.v                       # Coq spec：9 路 wa/wal + 阈值 + 计数器 → wa_out/wal'/countPick'
│   └── tests.v                      # 1000 条 vm_compute 差分定理（工具生成，请勿手改）
└── reports/
    ├── vectors.txt                  # 1000 条输入/输出标准答案（每条 56 列）
    └── final_checklist.md           # 路径覆盖统计与阴性自检记录
```

## 复现步骤

在仓库根目录下执行：

```bash
bash FloatTest/tools/run_tests.sh GyroPick 1000
# 输出 PASS: GyroPick (1000 vectors)
```

## 验证结论

- **1000/1000 条向量逐位一致**（每条 56 列 = 9000 个元素级判定）。
- 元素级覆盖：沿用旧值 1332 次、采纳新值 6768 次；定向模式各 100 条：
  `d=0`、未连续野值、连续野值、`|d|==thr` 恰边界、单路 NaN、thr NaN、
  +Inf、countPick=255 回绕、pickThr=0（详见 reports/final_checklist.md）。
- 阴性自检：故意改错一个期望 bits，coqc 正确报错。
- 边界声明：这是采样验证，不是全称证明；不覆盖内存安全。

## 备注

- `countPick` 是 **unint08**：自增模 256 回绕（spec 的 `u8_inc`），
  mode 8 定向验证 `255+1=0 < pickThr` 的回绕语义。
- `< pickThr` 比较的是**自增后**的值（mode 2/3 分别验证 `cnt+1 = pthr-1`
  沿用旧值与 `cnt+1 = pthr` 采纳新值）。
- spec 按元素抽象 `pick_step` + `pick_loop`，9 路共用一套逻辑；
  差分测试同时覆盖了"9 路独立"这一结构性假设。
