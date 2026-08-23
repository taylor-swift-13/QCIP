#include "../../../../FloatTest/ref/orbiter_support.h"
#include "../../../../INPUT/orbiter-new/AttiErrCalc/IP_AttiErrCalc.h"

struct { double w[3],w8[3]; } sGyroData;
struct { double LmtPhi; } sAttiModifyParam;
static uint32_t phi_case,qdiv_calls,q2c_calls,acos_calls,pointer_ok;
void Qdiv(double*out,const double*a,const double*b){(void)a;(void)b;++qdiv_calls;out[0]=phi_case?1.0:0.0;out[1]=0.25;out[2]=-0.5;out[3]=1.0;}
double Acosx(double x){(void)x;++acos_calls;return 0.0;}
void Q2C(double*out,const double*q){(void)q;++q2c_calls;for(uint32_t i=0;i<9u;++i)out[i]=(i==0u||i==4u||i==8u)?1.0:0.0;}
void DivNorm(double*d,const double*s,uint32_t n){VectorEval(d,s,n);}
void MatrixExtractRow(double*d,const double*m,uint32_t r,uint32_t c,uint32_t row){(void)r;for(uint32_t i=0;i<c;++i)d[i]=m[row*c+i];}
void QUnit(double*q){(void)q;} double Atan2x(double y,double x){return y+x;} double Sgn3(double x){return x<0?-1.0:x>0?1.0:0.0;}
#undef Sinx
#undef Cosx
#define Sinx(x) (x)
#define Cosx(x) (x)

#include "../../../../INPUT/orbiter-new/AttiErrCalc/IP_AttiErrCalc.c"

int main(int argc,char**argv){unsigned long count=ft_count_arg(argc,argv);uint64_t state=ft_seed_arg(argc,argv);
 for(unsigned long row=0;row<count;++row){phi_case=(uint32_t)(row&1u);uint32_t select=(uint32_t)((row>>1)&1u);uint64_t bits[9];for(uint32_t i=0;i<9u;++i)bits[i]=ft_bits64(ft_prng_finite(&state,2.0));
  for(uint32_t i=0;i<3u;++i){sAttiData.wGI[i]=ft_from_bits64(bits[i]);sGyroData.w[i]=ft_from_bits64(bits[3+i]);sGyroData.w8[i]=ft_from_bits64(bits[6+i]);}
  sGncCtrlFlag.ZT9=select<<1;sGncCtrlFlag.ZT10=0;sAttiCtrlParam.thetaM=1.0;sAttiModifyParam.LmtPhi=0.5;
  qdiv_calls=q2c_calls=acos_calls=0;pointer_ok=1;
  printf("%" PRIu32 " %" PRIu32,phi_case,select);for(uint32_t i=0;i<9u;++i)printf(" %" PRIu64,bits[i]);
  AttiErrCalc();
  printf(" %" PRIu64 " %" PRId32 " %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32,ft_bits64(sAttiData.eulerBT),sGncCtrlFlag.FlgPhi,sAttiCtrl.bAVCtrl,sGncCtrlFlag.AVCFlgX,sGncCtrlFlag.AVCFlgY,sGncCtrlFlag.AVCFlgZ);
  for(uint32_t i=0;i<3u;++i) printf(" %" PRIu64,ft_bits64(sAttiCtrl.angleErr[i]));
  for(uint32_t i=0;i<3u;++i) printf(" %" PRIu64,ft_bits64(sAttiCtrl.rateErr[i]));
  printf(" %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32 "\n",qdiv_calls,q2c_calls,acos_calls,pointer_ok);
 }return 0;}
