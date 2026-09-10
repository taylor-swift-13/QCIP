# 用时与记录缺口

从 intake 到当前记录终点：8753.835 秒；包含 cleanup：True。

已记录区间的并集：5794.538 秒；未归类间隔：2959.297 秒。两项相加等于真实 wall-clock，不重复累加嵌套或并行区间。

主 agent 活动、实际等待、所有 worker 命令与失败重跑没有完整分项计时，相关总量明确为 unknown。详情见 timing_review.json；controller 原始计时保留在 timing_summary.json。

超过 600 秒的 worker 区间：2 个；原因证据与缺项已逐项保留，不把 worker 活跃时间冒充主 agent 等待时间。
