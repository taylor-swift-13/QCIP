/* ============================================================
 * B_TcProcess 的 QCP 验证用 C 源码
 *
 * 功能：经串口与 OBDH 交互，处理模式切换指令：
 *   1. 发送取数帧 [0xEB, 0x94]；
 *   2. 延时后接收 4 字节应答帧；
 *   3. 若应答帧头为 [0xE1, 0x00] 且校验和正确
 *      （recv[3] == (recv[0]+recv[1]+recv[2]) mod 256），
 *      则按 recv[2] 把 *workMode 改写为对应模式字：
 *      0 -> SAM_DAMP(0x00)，1 -> SAM_CRUISE(0x33)，其他 -> NOCTRL(0x44)。
 *
 * 为避开当前 symexec 的限制，本文件采用自包含最小等价形态：
 *   1. 结构体定义内联，入口直接接收 B_TcProcess*（原为 void* 强转）。
 *   2. 当前 symexec 不支持局部 C 数组，原始代码中的局部数组
 *      obdhSendData[2] / obdhRecvData[4] 建模为结构体指针字段
 *      sendBuf / recvBuf。
 *   3. 原始代码中 numerror 声明后未初始化即传地址给 UartRecv；模型中
 *      显式初始化为 0（UartRecv 语义上总会覆写它，行为等价）。
 *   4. 循环 for (i = 0; i < 3; i++) chksum += recv[i]; 是常数 3 次，
 *      手动展开（与 ThrusterCtrlLogic 的做法一致）。
 *   5. UartSend / SYS_Delay / UartRecv 是外部函数，按"stub"处理：
 *      只给 QCP spec 不给实现。其中 UartRecv 的 spec 只保证输出形状
 *      （写满 4 字节缓冲区、len/numerror 被覆写、返回值在 UInt 范围内），
 *      内容完全任意——这使主函数 spec 对任意应答帧都成立。
 * ============================================================ */

typedef unsigned int  unint32;
typedef unsigned char unint08;

/*@ Extern Coq (UartSendRecord : Z -> list Z -> Prop) */
/*@ Extern Coq (B_TcProcessPost : Z -> list Z -> Z -> Z -> Z -> Prop) */
/*@ Import Coq Require Import QCIPLib.SAMCodeSynthesis.B_TcProcess.IP_B_TcProcess_lib */

typedef struct __B_TcProcess
{
    unint32 uartno;         /* 串口号 */
    unint32 *workMode;      /* 模式字变量指针 */
    unint32 bSucc;
    unint08 *sendBuf;       /* 验证模型：发送缓冲区指针（2 字节） */
    unint08 *recvBuf;       /* 验证模型：接收缓冲区指针（4 字节） */
} B_TcProcess;

void UartSend(unint32 uartno, unint08 *buf, unint32 sendsize)
/*@ With (l: list Z)
    Require Zlength(l) == sendsize && UCharArray::full(buf, sendsize, l)
    Ensure UartSendRecord(uartno, l) && UCharArray::full(buf, sendsize, l)
*/
;

void SYS_Delay(unint32 ns)
/*@ Require emp
    Ensure emp
*/
;

unint32 UartRecv(unint32 uartno, unint08 *buf, unint32 *len, unint32 *numerror)
/*@ With (old_l: list Z) (old_len: Z) (old_err: Z)
    Require Zlength(old_l) == 4 &&
            UCharArray::full(buf, 4, old_l) *
            store(len, old_len) *
            store(numerror, old_err)
    Ensure exists l new_len new_err,
            Zlength(l) == 4 &&
            UCharArray::full(buf, 4, l) *
            store(len, new_len) *
            store(numerror, new_err) &&
            0 <= __return && __return <= UINT_MAX
*/
;

void B_TcProcessFun(B_TcProcess *pIp)
/*@ With (uartno: Z) (wm_addr: Z) (old_wm: Z) (old_bs: Z)
         (sb_addr: Z) (sb_list: list Z) (rb_addr: Z) (rb_list: list Z)
    Require
      Zlength(sb_list) == 2 &&
      Zlength(rb_list) == 4 &&
      store(&(pIp->uartno), uartno) *
      store(&(pIp->workMode), wm_addr) *
      store(&(pIp->bSucc), old_bs) *
      store(&(pIp->sendBuf), sb_addr) *
      store(&(pIp->recvBuf), rb_addr) *
      data_at(wm_addr, unint32, old_wm) *
      UCharArray::full(sb_addr, 2, sb_list) *
      UCharArray::full(rb_addr, 4, rb_list)
    Ensure
      exists sent recv_l ret new_wm new_bs,
        Zlength(sent) == 2 &&
        Znth(0, sent, 0) == 235 &&
        Znth(1, sent, 0) == 148 &&
        UartSendRecord(uartno, sent) &&
        Zlength(recv_l) == 4 &&
        B_TcProcessPost(old_wm, recv_l, ret, new_wm, new_bs) &&
        store(&(pIp->uartno), uartno) *
        store(&(pIp->workMode), wm_addr) *
        store(&(pIp->bSucc), new_bs) *
        store(&(pIp->sendBuf), sb_addr) *
        store(&(pIp->recvBuf), rb_addr) *
        data_at(wm_addr, unint32, new_wm) *
        UCharArray::full(sb_addr, 2, sent) *
        UCharArray::full(rb_addr, 4, recv_l)
*/
{
    unint32 len = 4;
    unint32 numerror = 0;
    unint08 chksum;

    chksum = 0;
    pIp->bSucc = 0;

    /* 发送取数指令 */
    pIp->sendBuf[0] = 0xEB;
    pIp->sendBuf[1] = 0x94;

    UartSend(pIp->uartno, pIp->sendBuf, 2);

    SYS_Delay(1000);

    /* 串口收数 */
    pIp->bSucc = UartRecv(pIp->uartno, pIp->recvBuf, &len, &numerror);

    if (pIp->recvBuf[0] == 0xE1)
    {
        pIp->bSucc = 0x1;       /* 串口已收到数据 */
    }

    if (pIp->bSucc == 0x1)
    {
        if ((pIp->recvBuf[0] == 0xE1) && (pIp->recvBuf[1] == 0x00))     /* 包头正确 */
        {
            /* 原代码为 for (i = 0; i < 3; i++)，常数 3 次，手动展开 */
            chksum = chksum + pIp->recvBuf[0];
            chksum = chksum + pIp->recvBuf[1];
            chksum = chksum + pIp->recvBuf[2];

            if (pIp->recvBuf[3] == chksum)                  /* 校验和正确 */
            {
                if (pIp->recvBuf[2] == 0)
                {
                    *pIp->workMode = 0x00;  /* SAM_DAMP */
                }
                else if (pIp->recvBuf[2] == 1)
                {
                    *pIp->workMode = 0x33;  /* SAM_CRUISE */
                }
                else
                {
                    *pIp->workMode = 0x44;  /* NOCTRL */
                }
            }
        }
    }

    return;
}
