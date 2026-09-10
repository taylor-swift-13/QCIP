# Witness Ledger

| 分组 | Witness 数 | 结果 |
| --- | ---: | --- |
| `init_observation_and_singleton_insert` | 9 | fixed group-check passed |
| `singleton_removal_normalization` | 4 | fixed group-check passed |
| 合计 | 13 | parent merge/final-check passed |

target 包括 9 个 init 后观察/插入 return witness，以及 singleton 头删/尾删的 2 个 entail 和 2 个 return witness。
