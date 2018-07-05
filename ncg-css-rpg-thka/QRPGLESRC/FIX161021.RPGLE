000100041019      /TITLE Rensar KortVer
000200031229     H DATEDIT(*YMD) OPTION(*NODEBUGIO)
000300100601
000400161020     FBJREG     IF   E           K DISK
000500161020     FBKCDLG    IF   E           K DISK
000600990804
000700161020     DWpgpl            S                   LIKE(BJPGPL)
000800100601
000900161020     C                   READ      RBJREG                                 93
001000161020     C                   READ      RBKCDLG                                93
001100101111
001200161020     C                   Z-ADD     10920         BJPGPL
001300161020     C                   MONITOR
001400161020     C                   EVAL      F2PNF = BJPGPL
001500161020     C                   ON-ERROR
001600161020     C                   DIV       100           BJPGPL
001700161020     C                   EVAL      F2PNF = BJPGPL
001800161020     C                   ENDMON
001900161020
002000940922     C                   SETON                                        LR
002100940922     C                   RETURN
002200100601
