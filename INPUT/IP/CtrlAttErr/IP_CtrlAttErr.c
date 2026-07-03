#include "IP_CtrlAttErr.h"

// =======================================================
// 函数实现
// =======================================================

void CtrlAttErr( float64 * q, float64 * w, float64 * qt, float64 * wt )
{
    float64 Cq[3][3];
    float64 wb[3];

    /* （1）	误差四元数和角速度 */
    /*  a)	本体相对目标姿态的四元数  */
    Qdiv( sAttPub.qbt, qt, q );

    /* b)	本体相对目标姿态的角速度 */
    Q2C( Cq[0], sAttPub.qbt );
    MatrixMulti331( wb, Cq[0], wt );
    VectorSub3( sAttPub.wbt, w, wb );

    /* （2）	三轴姿态角偏差和角速度偏差 */
    VectorScalar3( sAttCtrl.e, sAttPub.qbt, 2.0 );
    V3Copy( sAttCtrl.de, sAttPub.wbt );

    return;
}