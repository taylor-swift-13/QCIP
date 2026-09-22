# Timing summary

- Controller run wall time: 10399.031 s
- Annotation phases: 3729.789 s（r1 因控制流改写被拒绝，r2 接受）
- VC checking phases: 1070.624 s
- VC proving / parent phase: 5239.496 s
- Parent verify: 2 次，共 555.980 s；第二次通过
- Final-check phase: 315.712 s；fixed full check 291.907 s

完整机器可读时间线见 `controller/timing_summary.json`。
