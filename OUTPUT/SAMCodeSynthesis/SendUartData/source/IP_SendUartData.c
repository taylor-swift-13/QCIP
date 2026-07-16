/* ============================================================
 * SendUartData 的 QCP 验证用 C 源码
 *
 * 功能：调用底层串口发送函数 UartSend，把 pIp->buf 中 sendsize
 *      个字节从 pIp->uartno 发送出去。
 *
 * 为避开 QCP parser 对头文件宏、函数指针等无关特性的限制，
 * 这里使用自包含的最小等价形态：保留原始类型名和字段名，
 * 但把结构体定义内联，并把入口改为直接接收 SendUartData*。
 * ============================================================ */

typedef unsigned int unint32;
typedef unsigned char unint08;

/*@ Extern Coq (SendUartDataPost : Z -> Z -> Z -> Prop) */
/*@ Import Coq Require Import QCIPLib.SAMCodeSynthesis.SendUartData.IP_SendUartData_lib */

typedef struct __SendUartData
{
    void (*fun)(void *);    /* 接口函数指针 */
    unint32 uartno;         /* 串口号 */
    unint08 *buf;           /* 待发送数据缓冲区指针 */
    unint32 sendsize;       /* 待发送字节数 */
} SendUartData;

void UartSend(unsigned int uartno, unsigned char *buf, unsigned int sendsize)
/*@ Require emp
    Ensure emp
*/
;

void SendUartDataFun(SendUartData *pIp)
/*@ With (uartno: Z) (buf: Z) (sendsize: Z)
    Require
      store(&(pIp->uartno), uartno) *
      store(&(pIp->buf), buf) *
      store(&(pIp->sendsize), sendsize)
    Ensure
      SendUartDataPost(uartno, buf, sendsize) &&
      store(&(pIp->uartno), uartno) *
      store(&(pIp->buf), buf) *
      store(&(pIp->sendsize), sendsize)
*/
{
    UartSend(pIp->uartno, pIp->buf, pIp->sendsize);
    return;
}
