#ifndef IP_STSUSEFLAG_H
#define IP_STSUSEFLAG_H

typedef unsigned int unint32;

#define FALSE32 0x00000000u
#define TRUE32  0xEB90146Fu

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

void STSUseFlag(void);

#endif
