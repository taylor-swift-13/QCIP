## WheelFriction 简化说明

### 原始代码复杂度

```c
void WheelFriction(void) {
    MW_PARAM * para;
    unint32 i;
    para = sMWCtrl.para;
    for (i = 0; i < 4; i++) {
        if (sMWData.F_Valid_MW[i] == TRUE32) {
            sMWData.vf[i] = para->kf[i] * sMWData.h[i] / para->cut[i]
                          + para->vf0[i] * Sgn2(sMWData.h[i]);
        } else {
            sMWData.vf[i] = 0.0;
        }
    }
}
```

### QCP 不支持的 C 特性

| 特性 | 状态 | 解决方案 |
|------|------|----------|
| float64 (double) 类型 | 不支持 | 替换为 unint32 |
| 指针间接访问 (para->) | 有限支持 | 展平为直接字段 |
| 外部函数调用 (Sgn2) | 需要 spec | 抽象为 WheelFricComp |
| 浮点算术 (* / +) | 不支持 | 抽象为未解释函数 |
| for 循环 + 循环不变量 | 支持但复杂 | 手动展开 4 次 |

### 待完整验证需要的改进

1. QCP 支持浮点类型和浮点算术
2. 或使用 refinement proof 模式建立 C 程序与抽象模型的精化关系
3. 循环不变式生成与证明
4. 外部函数 Sgn2 的规格定义
