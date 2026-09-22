#ifndef SIPEX_H_CalculateGyroDg
#define SIPEX_H_CalculateGyroDg

#include "IP.h"
#include "MatrixMulti.h"

#ifndef SIPEX_DT_float32
#define SIPEX_DT_float32
typedef float           float32;
#endif

#ifndef SIPEX_DT_unint08
#define SIPEX_DT_unint08
typedef unsigned char   unint08;
#endif

#ifndef SIPEX_DT_unint16
#define SIPEX_DT_unint16
typedef unsigned int    unint16;
#endif

#ifndef SIPEX_DT_unint32
#define SIPEX_DT_unint32
typedef unsigned long   unint32;
#endif

#ifndef SIPEX_DT_SGyroData
#define SIPEX_DT_SGyroData
typedef struct TAG_DIGITAL_GYRO_DATA
{

    unint08		countPick[9];		 	/* ����ԭʼ���ݴ���ʱ,��Ұ������ */   
    float32 	Gi[3];				 	/* ���ݽǶȻ��� */
    float32 	wa[9];				 	/* ���ݽ��ٶ�ģ�� */
    float32 	wal[9];				 	/* ���������ݽ��ٶ�ģ���� */
 	unint08		JoinTotal;           	/* �μӶ��˵����ݸ��� */
 	unint16 	gyroStatus0;		 	/* ����״̬�� */
 	unint16 	gyroStatus1;		 	/* ����״̬�� */
    float32 	W[3];				 	/* ��������Ľ��ٶ� */
    unint08		SignFlag[9] ; 		 	/* �μӶ��˵�������� */    
	float32 	Rtemp[3][5];		 	/* ��������� */
	unint32		stateFlag[9];			/* ���ݼӵ�״̬ */
	
} SGyroData;
#endif


typedef struct __CalculateGyroDg {
    Fun fun;
    SGyroData * pGyroData;
} CalculateGyroDg;


void CalculateGyroDgFun(void *sip_ip_arg);

#endif /* SIPEX_H_CalculateGyroDg */
