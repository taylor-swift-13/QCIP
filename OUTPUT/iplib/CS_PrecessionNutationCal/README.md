# CS_PrecessionNutationCal 验证结果

本目录包含 `INPUT/iplib/CS_PrecessionNutationCal/source/IP_CS_PrecessionNutationCal.c`
的 Coq 差分测试产物（路线 B，方案与边界声明见 `FloatTest/README.md`）。
复用 `FloatTest/ref/ported_trig.c` + `FloatTest/lib/FloatTrig.v` 的
musl sin/cos 移植与 `FloatTest/ref/ported_sqrt.c` 的 musl sqrt 移植。

## 功能

`CS_PrecessionNutationCalFun` 岁差章动矩阵计算（全部浮点输入为 float64）：

```c
F_qJDerr = 0;
if (FS_CPNCal == 1) {                       // 在轨计算分支
    tJ2000 = tmpT + I_UTC0 + tGPS0 + dT_UTC2TDT;
    CPN = CPNCalc(tJ2000);                  // IAU1976 岁差 + 1980 章动
      // Tc = tJ2000/(86400*36525)
      // Cp = Rz(-Zp)·Ry(θp)·Rz(-ζp)（岁差矩阵）
      // Δψ/Δε = IAU1980 章动级数（5 项 sin / 5 项 cos）
      // Cn = Rx(-(εm+Δε))·Rz(-Δψ)·Rx(εm)（章动矩阵）
      // CPN = Cpᵀ·Cnᵀ
} else if (TripleFabsMax(qd[0..2]) < 0.05) { // 四元数分支
    qd[3] = sqrt(1 - qd0² - qd1² - qd2²);
    CPN = Q2C(qd);
} else {                                     // 异常分支
    CPN = I;  F_qJDerr = 1;
}
```

## 组件库重建声明（关键，本题重建假设比以往 case 更重）

原代码引用的 `CPN_POLY1/CPN_POLY3` 宏、`Rx/Ry/Rz`、`Q2C`、
`MatrixMulti333/MatrixTran33/MatrixIdentity33`、`TripleFabsMax`
在**全库均无定义**（连声明都没有，cfg_target 的 `-fsyntax-only`
编译只能靠隐式函数声明告警混过去，语义上是错的）。驱动与 spec
按以下约定重建，**真值口径 = "原始 IP + 下列重建约定"**：

1. **CPN_POLY 含角秒→弧度转换**（本题最重要的假设）：
   `CPN_POLY1(a0,a1,T) = (a0+a1·T)·ARC2RAD`、
   `CPN_POLY3(a0..a3,T) = (a0+a1·T+a2·T²+a3·T³)·ARC2RAD`，
   ARC2RAD = π/648000 = 0x1.455a5b2ff8f9dp-18。依据：IAU 岁差/章动
   系数全部以角秒为单位，而代码把结果直接送 Sinx/Cosx 与
   Rx/Ry/Rz（弧度域），转换只可能存在于被裁掉的宏定义中。
   多项式求值顺序为朴素逐项（a0+a1·T 再加 a2·T·T 再加 a3·T·T·T），
   若真实实现是 Horner 或单位换算位置不同，需两侧同步重做。
2. **Rx/Ry/Rz = Vallado/IAU 被动元旋转**（Rx(θ)=[1,0,0;0,c,s;0,-s,c]，
   Ry(θ)=[c,0,-s;0,1,0;s,0,c]，Rz(θ)=[c,s,0;-s,c,0;0,0,1]），
   与 EIM 重建中 1 轴元旋转一致，也是 IAU 岁差章动的教科书形式。
3. Q2C：q[3] 标量部标准展开式（与 AHM_USU 同款）。
4. MatrixMulti333 行主序 0.0 起 k 升序；TripleFabsMax 左到右两两取大
   （严格 > 才替换）；MatrixTran33/MatrixIdentity33 直白。
5. sin/cos/sqrt 均为 musl 确定化移植（非平台 libm）。

若将来拿到组件库原件且约定不同，需按同一流程重做。

## 目录结构

```
OUTPUT/iplib/CS_PrecessionNutationCal/
├── source/
│   ├── CS_PrecessionNutationCal_main.c          # 参考驱动（含重建组件库）
│   ├── CS_PrecessionNutationCal_cflags.txt      # -fno-builtin-* + -include decls.h
│   ├── CS_PrecessionNutationCal_extra_srcs.txt  # ported_trig.c + ported_sqrt.c
│   └── CS_PrecessionNutationCal_decls.h         # CPN_POLY 宏 + 组件库原型
├── rocq/
│   ├── spec.v                         # Coq spec：8 输入 → 11 输出
│   └── tests.v                        # 1016 条 vm_compute 差分定理（工具生成，请勿手改）
└── reports/
    ├── vectors.txt                    # 1016 条输入/输出标准答案（20 列）
    └── final_checklist.md             # 分支覆盖统计与阴性自检记录
```

## 复现步骤

在仓库根目录下执行：

```bash
bash FloatTest/tools/run_tests.sh CS_PrecessionNutationCal 1000
# 输出 PASS: CS_PrecessionNutationCal (1000 vectors)
```

## 验证结论

- **1016/1016 条向量逐位一致**（16 定向 + 1000 随机；每条向量是一条
  `vm_compute; reflexivity` 判定的精确 Coq 定理）。
- 分支覆盖：FS=1（CPNCalc 全链路）549 条、FS=0 四元数分支 146 条、
  FS=0 异常分支（单位阵+F_qJDerr=1）321 条。定向含 Tc 网格
  （0/±0.2/0.26/0.5/1.0/±1.5/2.0 世纪）、阈值 0.05 两侧恰等、
  阈值由第二/第三分量触发、qd 全零（qd3=1）。
- 阴性自检：故意改错 t_0500 的期望 CPN[0] 最低位，coqc 正确报错
  （Unable to unify）；恢复后重新通过。
- 边界声明：这是采样验证，不是全称证明；不覆盖内存安全；组件库为
  重建约定（见上节，尤其 CPN_POLY 的角秒→弧度假设）。

## 备注

1. sin/cos/sqrt 是 musl 确定化移植，不是平台 libm（三角移植输入域
   |x| < 2²⁰·(π/2)；本题 Tc ∈ [-2, 2] 世纪时章动角参数最大 ~10⁴ rad，
   远在域内）。详见 `FloatTest/README.md` §17。
2. `FS_CPNCal` 原代码是 `== 1` 判定，其余整数值一律走 else，spec
   如实建模；定向与随机只注入 0/1。
3. 四元数分支中 `TripleFabsMax(qd) < 0.05` 保证 sqrt 参数
   1-Σqd² > 0.9925 > 0，不会产生 NaN；全部输入为有限值（不注入
   NaN/Inf），这是全 FloatTest 的统一纪律。
4. iplib 头文件为 GBK 编码（阅读用 `iconv -f GBK -t UTF-8`）。
