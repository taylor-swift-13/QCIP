# Final checklist

- [x] 原始目标 C 直接参与编译，INPUT 未修改
- [x] 补齐头只来自同一输入快照，未进入 helper 为可观察桩
- [x] 覆盖 BZ4、惯性基准残差阈值计数与历史保存
- [x] binary64 结果按位比较，helper 调用计数必须为零
- [x] 1000 条确定性向量、Rocq 定理与 negative control
- [x] README 明确大型数值分支的测试边界
