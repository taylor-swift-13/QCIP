#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "IP_ThreeAxisController.h"

static uint32_t f2b(float f){uint32_t u;memcpy(&u,&f,4);return u;}
int main(int argc,char **argv){int n=argc>1?atoi(argv[1]):30;for(int k=0;k<n;++k){
 float a[3],r[3],d[3],kp[3],kd[3];ThreeAxisController x={0};x.pAngle=a;x.pRate=r;x.destRate=d;
 for(int j=0;j<3;++j){a[j]=-12.0f+1.1f*((k+7*j)%25);r[j]=-3.5f+.55f*((k+3*j)%15);d[j]=-1.8f+.3f*((k+5*j)%13);kp[j]=.15f+.07f*((k+j)%7);kd[j]=.25f+.11f*((k+2*j)%6);}
 for(int j=0;j<3;++j){x.CTRL_PARAM_SAM[j].Kp=kp[j];x.CTRL_PARAM_SAM[j].Kd=kd[j];}
 if(k%6==1){a[0]=8.0f;} if(k%6==2){a[0]=-8.0f;} if(k%6==3){r[0]=d[0]+1.2f;} if(k%6==4){r[0]=d[0]-1.2f;} if(k%6==5){a[0]=a[1]=a[2]=0.0f;r[0]=r[1]=r[2]=0.0f;d[0]=d[1]=d[2]=0.0f;}
 ThreeAxisControllerFun(&x);printf("%u",k);for(int j=0;j<3;++j)printf(" %u",f2b(a[j]));for(int j=0;j<3;++j)printf(" %u",f2b(r[j]));for(int j=0;j<3;++j)printf(" %u",f2b(d[j]));for(int j=0;j<3;++j)printf(" %u",f2b(kp[j]));for(int j=0;j<3;++j)printf(" %u",f2b(kd[j]));for(int j=0;j<3;++j)printf(" %u",f2b(x.mController[j].Up));for(int j=0;j<3;++j)printf(" %u",f2b(x.mController[j].Ud));for(int j=0;j<3;++j)printf(" %u",f2b(x.mController[j].fy));for(int j=0;j<3;++j)printf(" %u",f2b(x.u[j]));putchar('\n');}return 0;}
