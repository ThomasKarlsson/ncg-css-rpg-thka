000100041019      /TITLE Rensar KortVer
000200031229     H DATEDIT(*YMD) OPTION(*NODEBUGIO)
000300160619     H ACTGRP(*CALLER) BNDDIR('CSSBNDDIR') DFTACTGRP(*NO)
000400100601
000600160619
000700161215      /INCLUDE qrpglesrc,CSS90100P // Modulens eget gränssnitt
000800160619
000801161215     D OutPutrow       DS                  QUALIFIED INZ
000802161215     D VerNo                          8S 0
000803161215     D VerText                       40A
000804161215
000900161215     D WrkDate         S              8S 0
000901161215     D  WrkCount       S             10I 0
000902161215     D  WrkList        DS                  LIKEDS(OutPutRow)  DIM(9999)
000903161215
000904161215      /free
000905161215       WrkDate = 20160113;
000906161215       VerList(WrkDate : wrkCount : wrkList);
000907161215      /end-free
002500101111
002600940922     C                   SETON                                        LR
002700940922     C                   RETURN
002800100601
