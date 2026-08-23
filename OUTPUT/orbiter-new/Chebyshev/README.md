# Chebyshev FloatTest

本交付直接编译原始 `INPUT/orbiter-new/Chebyshev/IP_Chebyshev.c`，测试 `n=0..5`，覆盖 `tao=0, ±1` 及小范围有限随机 binary64 输入。Rocq 规格逐项复刻 C 的循环状态和 `(2*tao)*Tn-Tn1`、`x+C[i]*Tn` 的求值顺序；系数数组固定 6 项，排除越界和浮点异常值。

复现：`bash FloatTest/tools/run_tests.sh Chebyshev 1000 0x9E3779B97F4A7C15`

这是 `n<=5` 定义域内的有限确定性采样，不是任意阶 Chebyshev 展开的证明。
