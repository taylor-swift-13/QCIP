# SAMSubModeRoll 验证结果

本目录包含 `INPUT/SAMCodeSynthesis/SAMSubModeRoll/IP_SAMSubModeRoll.c`
的 Coq 差分测试产物。浮点 IP 不走 QCP 全链路（路线 B，方案与边界声明见
`FloatTest/README.md`）。

## 功能

`SAMSubModeRollFun` SAM 滚动搜索方式的模式逻辑（浮点含量仅一次
`royaw > 1.0f` 比较，主体为 unint32 计数器/模式字逻辑）：

1. `m_workMode = *m_curMode`；`m_countMode++`（unint32，模 2^32 回绕）。
2. 若 `*flgSP == TRUE(1)` 且 `*royaw > 1.0f`：`m_countPublic++`；
   若自增后的值 `> 12`：转 `SAM_CRUISE(0x33)`、清双计数器（**outUp 不动**）；
   否则清 `outUp[0..2] = 0.0f`。`royaw <= 1.0f` 时什么都不做。
3. 若 `*flgSP != TRUE`：`m_countPublic = 0`。
4. 最后若 `m_countMode > 6250`（用可能被巡航分支重置后的值）：
   转 `SAM_PITCH(0x11)`、清双计数器。

## 目录结构

```
OUTPUT/SAMCodeSynthesis/SAMSubModeRoll/
├── source/
│   └── SAMSubModeRoll_main.c        # 参考驱动（gcc 编译原始 C，打印输入/输出）
├── rocq/
│   ├── spec.v                       # Coq spec：royaw + 4 个 unint32 + outUp[3] → 模式字/计数器/outUp
│   └── tests.v                      # 1000 条 vm_compute 差分定理（工具生成，请勿手改）
└── reports/
    ├── vectors.txt                  # 1000 条输入/输出标准答案
    └── final_checklist.md           # 路径覆盖统计与阴性自检记录
```

## 复现步骤

在仓库根目录下执行：

```bash
bash FloatTest/tools/run_tests.sh SAMSubModeRoll 1000
# 输出 PASS: SAMSubModeRoll (1000 vectors)
```

## 验证结论

- **1000/1000 条向量逐位一致**（每条向量是一条 `vm_compute; reflexivity`
  判定的精确 Coq 定理）。
- 路径覆盖（1000 条）：转巡航 187、超时转俯仰 235、模式字透传 605、
  清 outUp 271、countMode/countPublic `0xFFFFFFFF` 回绕各 83、
  NaN/+Inf 输入各 83（详见 reports/final_checklist.md）。
- 阴性自检：故意改错一个期望 workMode，coqc 正确报错。
- 边界声明：这是采样验证，不是全称证明；不覆盖内存安全。

## 备注

- 计数器按 unint32 真实语义建模：spec 的 `u32_inc` 自增模 2^32 回绕，
  因此回绕边界可以直接进向量验证（mode 10/11）。
- 分支顺序敏感：`m_countPublic > 12` 比较的是**自增后**的值；超时判断
  用的是可能被巡航分支重置后的 `m_countMode`（mode 7 定向验证
  "巡航重置优先于超时"）。
- 转巡航分支不清 outUp（只有"继续计数"分支才清），转写时容易看错。
