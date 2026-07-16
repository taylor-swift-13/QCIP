# 当前 symexec 对 std_basal.h 的解析问题与 workaround

## 现象

在 Windows 下使用当前 `win-binary/symexec.exe`（v2.0.4）直接跑 `INPUT/SAMCodeSynthesis/*/IP_*.c` 时，会报以下 parser 错误：

```text
bison: syntax error, unexpected PT_LESS, expecting PT_STRINGLIT in .../std_basal.h:8:9
```

对应 `std_basal.h` 第 8 行的 `#include <math.h>`。继续绕开后还会遇到：

- `signed char` 不被识别（`unexpected PT_IDENT`）。
- `USED_WORD` 联合体里的位域 `unsigned High : 16;` 不被识别（`unexpected PT_COLON`）。

## 根本原因

当前 symexec 的 C 前端不支持：

1. 尖括号系统头文件 include（`#include <xxx.h>`）。
2. `signed char` 这种类型说明符（`unsigned char` 可以）。
3. C 位域（bitfield）语法。

`std_basal.h` 和 `IP.h` 里同时包含这三类特性，导致无法直接对原始 `INPUT` 文件做符号执行。

## 验证用源码策略

参考已验证 case（`CheckCal08`、`ThrusterCtrlLogic` 等）的做法：

1. **保留原始字段名和类型名**，保证生成的 VC 与真实代码语义一致。
2. **把结构体定义内联到 C 文件**，避免 include `IP.h` / `std_basal.h`。
3. **去掉函数指针、位域、系统头 include 等无关特性**。
4. 如果函数入口原本是 `void Fun(void *p)`，可改为直接接收结构体指针 `void Fun(StructType *pIp)`，避开 `void*` 强制转换。

示例（UartInit 的最小化形态）：

```c
typedef unsigned int unint32;

typedef struct __UartInit
{
    void (*fun)(void *);
    unint32 uartno;
    unint32 stop;
    unint32 even;
    unint32 baud;
} UartInit;

void UartInitFun(UartInit *pIp)
/*@ With ... Require ... Ensure ... */
{
    Drv_Uart_Init(pIp->uartno, pIp->baud, pIp->even, pIp->stop);
    return;
}
```

这份最小化 C 只供 symexec 生成 VC，不影响原始飞行代码。

## 对 Drv_Uart_Init 等外部函数的处理

原始 `IP.h` 在 `__GCC_COMPILED__` 分支下才包含 `DRV_UART.h`，验证分支里没有 `Drv_Uart_Init` 的声明。在最小化 C 里需要补前向声明，并加上 QCP function spec：

```c
void Drv_Uart_Init(unsigned int uartno, unsigned int baud,
                   unsigned int even, unsigned int stop)
/*@ Require emp
    Ensure emp
*/
;
```

`Require emp / Ensure emp` 表示该调用不消耗、不产生分离逻辑资源，从而让调用者保持对 `pIp` 字段的 ownership。

## 文件位置约定

- 原始代码：`INPUT/SAMCodeSynthesis/UartInit/IP_UartInit.c`（不改）
- 验证用 annotated C：`OUTPUT/SAMCodeSynthesis/UartInit/source/IP_UartInit.c`
- symexec 输入使用验证用 C，产物输出到 `QCIPCases/SAMCodeSynthesis/UartInit/`

## 后续改进建议

如果要让 symexec 直接吃原始 `INPUT/*.c`，需要：

- 把 `std_basal.h` 里的 `#include <math.h>` 等改成 `"math.h"` 并提供空 stub；或
- 给 symexec 配一个能预处理 C 的前端（但当前二进制似乎不接受预处理后输入）；或
- 使用旧版 / 其他平台的 symexec 二进制验证是否没有此限制。

在拿到更健壮的 symexec 之前，推荐沿用“自包含最小化 annotated C”的方案。
