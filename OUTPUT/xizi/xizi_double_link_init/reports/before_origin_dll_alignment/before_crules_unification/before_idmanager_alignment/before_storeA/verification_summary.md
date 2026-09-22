# xizi_double_link_init 验证摘要

- accepted run：`xizi_double_link_init-20260719024528`
- annotation：accepted；canonical symbolic execution 到文件尾
- permission-only 前置条件：两个 `undef_data_at`，无命名旧值
- manual witnesses：0
- parent fixed Coq check：passed
- final-check：passed
- fixed flags hash：`1637faae25397c4c30221b8193a63d94b656cb2c56e2ccfd6b0cfa1f2bcf8771`
- authoritative reports：`reports/xizi_double_link_init-20260719024528/`

首个直接以 `source/` 为 target 的 run 因 controller case-name 推导约束在 parent
verify 被拒绝；它保留为诊断证据，不是 accepted final candidate。
