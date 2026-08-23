#include "../../../../FloatTest/ref/orbiter_support.h"
#include "../../../../INPUT/orbiter-new/AttiCtrlCmd/IP_AttiCtrlCmd.h"
#define PI 3.14159265358979323846264338327950288
#undef Sinx
#undef Cosx
#define Sinx(x) (x)
#define Cosx(x) (x)

struct { double ri[3], wOrbit[3], wOrbitB[3]; } sNaviData;
struct { double aIC[3], dlamd1[3], lamdv1[3]; uint32_t bCovFlg, bHoverFlg; } sGuideData;
struct { double dot_rI_aIc, cBF[3][3]; } sAttiModifyParam;
struct { double dThetar; } sAttiCtrlParam;

static uint32_t avv_calls, c2q_calls, qdiv_calls, q2c_calls, dispatch_kind, pointer_ok;
void DivNorm(double *dst, const double *src, uint32_t n)
{
    double norm=0.0; for(uint32_t i=0;i<n;++i) norm+=src[i]*src[i]; norm=sqrt(norm);
    for(uint32_t i=0;i<n;++i) dst[i]=norm==0.0?src[i]:src[i]/norm;
}
void VectorRotation(double *dst,const double *v,const double *axis,double a)
{ (void)axis;(void)a; VectorEval3(dst,v); }
void Avv(double *out,const double *a,const double *b,const double *c,const double *d)
{
    (void)a;(void)b;(void)c; ++avv_calls;
    dispatch_kind = d == &sNaviData.wOrbitB[0] ? 2u : 3u;
    for(uint32_t i=0;i<9u;++i) out[i]=0.0;
    out[0]=(double)dispatch_kind;
}
void C2Q(double *out,const double *m)
{
    ++c2q_calls; for(uint32_t i=0;i<4u;++i) out[i]=m[0]+(double)i;
}
void Qdiv(double *out,const double *a,const double *b)
{ (void)a;(void)b;++qdiv_calls;out[0]=out[1]=out[2]=0.0;out[3]=1.0; }
double Acosx(double x) { (void)x; return 0.0; }
void QMulti(double *out,const double *a,const double *b)
{ for(uint32_t i=0;i<4u;++i) out[i]=a[i]+b[i]; }
void Q2C(double *out,const double *q)
{
    (void)q;++q2c_calls;for(uint32_t i=0;i<9u;++i)out[i]=(i==0u||i==4u||i==8u)?1.0:0.0;
}

#include "../../../../INPUT/orbiter-new/AttiCtrlCmd/IP_AttiCtrlCmd.c"

int main(int argc,char **argv)
{
    static const uint32_t modes[7]={2u,3u,4u,5u,6u,8u,99u};
    unsigned long count=ft_count_arg(argc,argv); uint64_t state=ft_seed_arg(argc,argv);
    for(unsigned long row=0;row<count;++row){
        uint32_t mode=modes[row%7u], cov=(uint32_t)(ft_prng_next(&state)&1u), hover=(uint32_t)(ft_prng_next(&state)&1u);
        uint64_t oldq[4],q0[4]; for(uint32_t i=0;i<4u;++i){oldq[i]=ft_bits64(ft_prng_finite(&state,1.0));q0[i]=ft_bits64(ft_prng_finite(&state,1.0));sAttiData.qGI.q4[i]=ft_from_bits64(oldq[i]);sAttiData.q0.q4[i]=ft_from_bits64(q0[i]);}
        sGncCtrlFlag.BZ1=mode;sGuideData.bCovFlg=cov;sGuideData.bHoverFlg=hover;
        sNaviData.ri[0]=sGuideData.aIC[0]=1.0;sNaviData.ri[1]=sNaviData.ri[2]=sGuideData.aIC[1]=sGuideData.aIC[2]=0.0;
        memset(sGuideData.dlamd1,0,sizeof sGuideData.dlamd1);memset(sGuideData.lamdv1,0,sizeof sGuideData.lamdv1);
        sAttiModifyParam.dot_rI_aIc=-0.99;sAttiCtrlParam.dThetar=1.0;
        avv_calls=c2q_calls=qdiv_calls=q2c_calls=dispatch_kind=0;pointer_ok=1;
        printf("%" PRIu32 " %" PRIu32 " %" PRIu32,mode,cov,hover);for(uint32_t i=0;i<4u;++i)printf(" %" PRIu64,oldq[i]);for(uint32_t i=0;i<4u;++i)printf(" %" PRIu64,q0[i]);
        AttiCtrlCmd();
        for(uint32_t i=0;i<4u;++i) printf(" %" PRIu64,ft_bits64(sAttiData.qGI.q4[i]));
        for(uint32_t i=0;i<3u;++i) printf(" %" PRIu64,ft_bits64(sAttiData.wGI[i]));
        printf(" %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32 "\n",avv_calls,c2q_calls,qdiv_calls,q2c_calls,dispatch_kind,pointer_ok);
    }return 0;
}
