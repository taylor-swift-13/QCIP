# Strategy Report

29 个目标按调用语义分为 Init/首次写、Write→Read/连续写、Read 后 Write/Reset、force-full bridge 四组。唯一 `read_one_spec` 通过 `CircularAreaReadOneResult` 统一空/非空分支；一般 force 结果保持 raw，仅 fresh capacity=4 且恰写满时由 annotation-approved bridge 恢复 canonical resource。
