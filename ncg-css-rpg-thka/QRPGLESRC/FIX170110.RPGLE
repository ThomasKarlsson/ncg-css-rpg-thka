000100170110      /TITLE TESTAR DIM I DATA-STRUCTURE
000200031229     H DATEDIT(*YMD) OPTION(*NODEBUGIO)
000300100601
000400170110     DPRM1             DS
000500170110     D  Data1                  1    100
000600170110     D  Stolid                       10    OVERLAY(Data1) DIM(10)
000700161020
000800170110     DWRSTOLID         S             10  0
000900170110     DX                S              3  0
001000170110
001100170110     C     *entry        PLIST
001200170110     C                   PARM                    PRM1
001300170110     C                   Z-ADD     1             X
001400170110     C                   DOW       X <= 10
001500170110     C                   MOVE      STOLID(X)     WRSTOLID
001600170110     C                   ADD       1             X
001700170110     C                   ENDDO
001800170110
001801180705     C                   SUB       1             X
001802180705
001900940922     C                   SETON                                        LR
002000940922     C                   RETURN
002100100601
