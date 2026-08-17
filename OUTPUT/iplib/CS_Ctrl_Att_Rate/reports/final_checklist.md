# CS_Ctrl_Att_Rate final checklist

- [x] `FS_ModeProc=2` 和 `FS_AttD=0..4` 均覆盖。
- [x] BMC/非 BMC、六种姿态转序和非法转序均覆盖。
- [x] 1018 条向量的 27 个 binary64 输出逐位一致。
- [x] 1018 条正例和 1 条阴性控制通过固定 `coq_tooling.py check`。
- [x] Rocq 文件不含 `Admitted.` 或额外 `Axiom`。
- [x] 临时重编译所得向量与交付 `vectors.txt` 逐字节一致。

边界：`FP_Qctrl=1`（asin）和天线历史缓冲输出不在本批比较范围内。
