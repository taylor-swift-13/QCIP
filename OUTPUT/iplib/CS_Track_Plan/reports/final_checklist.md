# CS_Track_Plan final checklist

- [x] 五类顶层分支均有定向样本并出现在随机样本中。
- [x] 所有 1005 条 callee 指针身份检查均通过。
- [x] 所有转发 binary64 参数逐位一致，独立复核 0 个失配。
- [x] 1005 条正例和 1 条阴性控制通过固定 `coq_tooling.py check`。
- [x] 阴性控制证明错误期望与真实结果不等。
- [x] 交付 Rocq 文件不含 `Admitted.` 或额外 `Axiom`。
- [x] 临时重编译所得向量与交付 `vectors.txt` 逐字节一致。

边界：三个轨迹算法和扩展 hook 缺失，使用可观察桩；结论只覆盖原始顶层
分派和参数传递。
