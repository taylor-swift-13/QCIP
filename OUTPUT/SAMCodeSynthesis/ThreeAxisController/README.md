# ThreeAxisController 验证结果

本目录包含 `INPUT/SAMCodeSynthesis/ThreeAxisController/IP_ThreeAxisController.c`
的 Coq 差分测试产物。浮点 IP 不走 QCP 全链路（路线 B，方案与边界声明见
`FloatTest/README.md`）。

## 功能

`ThreeAxisControllerFun` 三轴 PD 控制器（`LimitFloat` 来自 `std_utils.c`，
语义为 `fin > b ? b : (fin < -b ? -b : fin)`）：

- X/Y 轴：`Up = LimitFloat(pAngle, 8.0f)`；`Ud = LimitFloat(pRate - destRate, 1.2f)`；
  `fy = Up*Kp + Ud*Kd`；`u = LimitFloat(fy, 1.3f)`
- Z 轴：`Up = 0.0f`（不再限幅）；`Ud = LimitFloat(pRate[2], 1.2f)`；
  `fy = Ud*Kd`（无 Kp 项）；`u = LimitFloat(fy, 1.3f)`

## 目录结构

```
OUTPUT/SAMCodeSynthesis/ThreeAxisController/
├── source/
│   └── ThreeAxisController_main.c   # 参考驱动（gcc 编译原始 C，打印 bit pattern）
├── rocq/
│   ├── spec.v                       # Coq spec：12 路 fp32 输入 → 12 个输出 bits
│   └── tests.v                      # 1000 条 vm_compute 差分定理（工具生成，请勿手改）
└── reports/
    ├── vectors.txt                  # 1000 条输入/输出标准答案
    └── final_checklist.md           # 覆盖模式与阴性自检记录
```

## 复现步骤

在仓库根目录下执行：

```bash
bash FloatTest/tools/run_tests.sh ThreeAxisController 1000
# 输出 PASS: ThreeAxisController (1000 vectors)
```

脚本自动识别本目录布局：gcc `-std=c11 -O0` 编译原始 C 与参考驱动 →
生成向量 → 生成 `rocq/tests.v` → 用仓库根 `_CoqProject` 编译
`FloatTest/lib/FloatTestCommon.v`、`rocq/spec.v`、`rocq/tests.v`。

## 验证结论

- **1000/1000 条向量逐位一致**（spec vs gcc 编译的原始 C，
  每条向量是一条 `vm_compute; reflexivity` 判定的精确 Coq 定理）。
- 定向覆盖 8 类模式：纯随机、Up 恰取 ±8.0f、Ud 恰取 ±1.2f、Z 轴 Ud 边界、
  全零、小信号（全不饱和支路）、大增益强制 u 饱和。
- 阴性自检：故意改错一个期望 bits，coqc 正确报错（见 reports/final_checklist.md）。
- 边界声明：这是采样验证，不是全称证明；不覆盖内存安全。

## 备注

- C 代码不读取 `pAngle[2]`、`destRate[2]`、`CTRL_PARAM_SAM[2].Kp`，
  这三个输入不进 spec 参数表（参考侧置 0、不打印）。
- `LimitFloat` 遇 NaN 时两个比较均为 false、返回 `fin` 本身；spec 的
  `c_gt/c_lt` 封装与 C 的 NaN 比较语义一致（本 case 向量未注入 NaN）。
