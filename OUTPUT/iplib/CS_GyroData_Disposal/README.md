# CS_GyroData_Disposal 验证结果

本目录包含 `INPUT/iplib/CS_GyroData_Disposal/source/IP_CS_GyroData_Disposal.c`
的 Coq 差分测试产物（路线 B，方案与边界声明见 `FloatTest/README.md`）。
这是 iplib CS 系列的第二题，也是第一批需要**重建组件库 helper** 的题。

## 功能

`CS_GyroData_DisposalFun` 陀螺数据处理（全部浮点输入为 float64）：

```c
F_StopCtrl = (F_NoUseGroup==1) && (FS_AttD∈{0,1})
             && (FP_ModeStopCtrl[m_WorkMode]==1);
n = #{i | FU_ing[i] == 1};                       // ==1 严格，2 不计数
if (F_StopCtrl==1 || (n!=3 && n!=4))
    deltag = deltag_Lst;                          // 停控/可用数不足 → 用历史值
else {
    n==4: deltag = (R4ᵀ·R4)⁻¹ · R4ᵀ · dg4;       // 四陀螺最小二乘
    n==3: deltag = R3⁻¹ · dg3;                    // 三陀螺直接求逆
    wbi[i] = LimitDouble(deltag[i] / m_DeltaT, Mlfw);
    deltag_Lst = deltag;
}
```

R4/R3 由前 4/3 个有效陀螺（按下标顺序）的 Vbs 安装向量行组成，
dg4/dg3 为对应陀螺的测量角度增量。

## 目录结构

```
OUTPUT/iplib/CS_GyroData_Disposal/
├── source/
│   ├── CS_GyroData_Disposal_main.c     # 参考驱动 + 组件库 fp64 重建实现
│   ├── CS_GyroData_Disposal_decls.h    # 4 个 helper 的原型（仓库头文件无声明）
│   └── CS_GyroData_Disposal_cflags.txt # 额外编译参数：-include ..._decls.h
├── rocq/
│   ├── spec.v                          # Coq spec（含 helper 的 fp64 重建）
│   └── tests.v                         # 1000 条 vm_compute 差分定理（工具生成，请勿手改）
└── reports/
    ├── vectors.txt                     # 1000 条输入/输出标准答案
    └── final_checklist.md              # 路径覆盖统计与阴性自检记录
```

## 复现步骤

在仓库根目录下执行：

```bash
bash FloatTest/tools/run_tests.sh CS_GyroData_Disposal 1000
# 输出 PASS: CS_GyroData_Disposal (1000 vectors)
```

## 验证结论

- **1000/1000 条向量逐位一致**（每条向量是一条 `vm_compute; reflexivity`
  判定的精确 Coq 定理）。
- 路径覆盖：历史分支 250（停控 125 + n=5 125）、n=3 主路径 250
  （含奇异回退 125）、n=4 主路径 500（含强限幅 125、±0/负 deltaT 125、
  fsAttD=2 不停控 125）（详见 reports/final_checklist.md）。
- 阴性自检：故意改错 t_0000（n=4 主路径）的期望 deltag bits，
  coqc 正确报错；恢复后重新通过。
- 边界声明：这是采样验证，不是全称证明；不覆盖内存安全。

## 备注（重要，与此前 case 的本质差异）

1. **helper 是重建的，不是原件**。`MatrixTran / MatrixMulti /
   MatrixInv33 / LimitDouble` 在仓库中只有调用、没有实现（iplib 组件库
   未随源码提供）。参考驱动与 spec 中的实现均按 SAM 批次
   `std_utils.c` 的 fp32 同名函数（`MatrixTranF / MatrixMultiF /
   MatrixInv33F / LimitFloat`）的算法**逐式重建为 fp64**，包括：
   乘法累加从 `+0.0` 开始左到右、伴随式求逆的行列式左结合、
   奇异（`|rank| ≤ 1e-6`，沿用 fp32 的 `FLT32_ZERO` 阈值）回退
   `inv = src`、限幅 NaN 走 else。
   **含义**：本题验证的是"IP 层逻辑（分支、陀螺选择、历史值管理）的
   spec 转写一致性" + "两侧 helper 重建的逐位一致性"；helper 与
   不可得的原始实现的等价性不在本测试范围内。若后续拿到原始组件库
   源码，应以原件替换驱动中的重建实现重跑。
2. `m_DeltaT` 是 `std_utils.h` 声明的**全局**控制周期（非结构体字段），
   驱动定义该全局并每向量赋值，spec 将其建模为普通输入。
3. 4 个 helper 在仓库头文件中连声明都没有，原始 TU 直接调用会得到
   隐式 int 声明（float64 返回值语义错误），故以 `-include` 注入
   `*_decls.h` 原型（既有 `*_cflags.txt` 机制的首次扩展使用）。
4. 特殊值纪律：NaN/±Inf 只走历史值透传分支（逐位拷贝）；矩阵/除法
   路径只用有限值；奇异回退用"前两行相同 → det=0"构造触发（无 0/0）。
   `m_WorkMode` 越界 [0,13] 是 UB，spec 取 stop=0，驱动不生成。
5. iplib 头文件为 GBK 编码（部分字节非法 GBK，属原始文件如此；
   阅读用 `iconv -c -f GB18030 -t UTF-8`）。
