typedef unsigned int unint32;

typedef struct TAG_BUS_STSOBJ {
  unint32 update;
} BUS_STSOBJ;

typedef struct TAG_STS_ATT {
  unint32 stsFlg;
  unint32 dataSrc;
  unint32 useOld;
} STS_ATT;

BUS_STSOBJ sBusSTSObj;
STS_ATT sSTSAtt;

/*@ Import Coq Require Import SimpleC.EE.LLM_bench.Engineering.STSUseFlag.IP_STSUseFlag_lib */
/*@ Extern Coq (STSUseFlagPost: Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Prop) */

void STSUseFlag(void)
/*@ With (data_src update status use_old : Z)
    Require store(&(sSTSAtt.dataSrc), data_src) *
            store(&(sBusSTSObj.update), update) *
            store(&(sSTSAtt.stsFlg), status) *
            store(&(sSTSAtt.useOld), use_old)
    Ensure exists data_src1 update1 status1 use_old1,
      STSUseFlagPost(data_src, update, status, use_old,
                     data_src1, update1, status1, use_old1) &&
      store(&(sSTSAtt.dataSrc), data_src1) *
      store(&(sBusSTSObj.update), update1) *
      store(&(sSTSAtt.stsFlg), status1) *
      store(&(sSTSAtt.useOld), use_old1)
*/
{
    if (sSTSAtt.dataSrc == 1)
    {
        if (sBusSTSObj.update == 3952088175)
        {
            if (sSTSAtt.stsFlg == 1)
            {
                sSTSAtt.stsFlg = 6;
            }
            else if (sSTSAtt.stsFlg == 2)
            {
                sSTSAtt.stsFlg = 7;
            }
            else if (sSTSAtt.stsFlg == 4)
            {
                sSTSAtt.stsFlg = 8;
            }
            else
            {
            }

            sSTSAtt.useOld = sSTSAtt.stsFlg;

        }
        else
        {
            if (sSTSAtt.stsFlg != 3)
            {
                sSTSAtt.stsFlg = sSTSAtt.useOld;
            }
        }
    }
    else
    {
        sBusSTSObj.update = 0;
    }

    return;
}
