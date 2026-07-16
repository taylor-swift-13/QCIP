/* ============================================================
 * UartInit 的 QCP 验证用 C 源码
 *
 * 功能：调用底层串口初始化函数 Drv_Uart_Init。
 *
 * 为避开 QCP parser 对头文件宏、函数指针等无关特性的限制，
 * 这里使用自包含的最小等价形态：保留原始类型名和字段名，
 * 但把结构体定义内联，并把入口改为直接接收 UartInit*。
 * ============================================================ */

typedef unsigned int unint32;

/*@ Extern Coq (UartInitPost : Z -> Z -> Z -> Z -> Prop) */
/*@ Import Coq Require Import QCIPLib.SAMCodeSynthesis.UartInit.IP_UartInit_lib */

typedef struct __UartInit
{
    void (*fun)(void *);    /* 接口函数指针 */
    unint32 uartno;         /* 串口号 */
    unint32 stop;           /* 停止位配置 */
    unint32 even;           /* 奇偶校验配置 */
    unint32 baud;           /* 波特率配置 */
} UartInit;

void Drv_Uart_Init(unsigned int uartno, unsigned int baud,
                   unsigned int even, unsigned int stop)
/*@ Require emp
    Ensure emp
*/
;

void UartInitFun(UartInit *pIp)
/*@ With (uartno: Z) (baud: Z) (even: Z) (stop: Z)
    Require
      store(&(pIp->uartno), uartno) *
      store(&(pIp->baud), baud) *
      store(&(pIp->even), even) *
      store(&(pIp->stop), stop)
    Ensure
      UartInitPost(uartno, baud, even, stop) &&
      store(&(pIp->uartno), uartno) *
      store(&(pIp->baud), baud) *
      store(&(pIp->even), even) *
      store(&(pIp->stop), stop)
*/
{
    Drv_Uart_Init(pIp->uartno, pIp->baud, pIp->even, pIp->stop);
    return;
}
