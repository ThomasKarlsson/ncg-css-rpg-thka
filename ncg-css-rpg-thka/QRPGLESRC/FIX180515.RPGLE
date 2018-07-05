000100170110      /TITLE TESTAR DIM I DATA-STRUCTURE
000200031229     H DATEDIT(*YMD) OPTION(*NODEBUGIO)
000300100601
000400170614     FPNGCLBA   IF   E           K DISK
000500170614
000600170614     D MemberRules     DS
000700170614     D  MbrRules                     17    DIM(100)
000800170614     D  MbrDayOfWeek                  7    OVERLAY(MbrRules)
000900170614     D  MbrShowTime                   4  0 OVERLAY(MbrRules:*NEXT)
001000170614     D  MbrPoints                     6  0 OVERLAY(MbrRules:*NEXT)
001100170614
001200170614     D  IX             S              3  0
001300161020
001400170614     C                   Z-ADD     1             IX
001500170614     C                   MOVE      'BESOK'       PnKod1
001600170614
001700170614     C     PnKod1        SETLL     RPNGCLB
001800170614     C     PnKod1        READE     RPNGCLB                                93
001900170614
002000170614     C                   DOW       *IN93 = *OFF
002100170614
002200170614     C                   EVAL      MbrDayOfWeek(IX) = PNVCDG
002300170614     C                   EVAL      MbrShowTime(IX)  = PNTID
002400170614     C                   EVAL      MbrPoints(IX)    = PNGRNS
002500170614
002600170614     C                   ADD       1             IX
002700170614
002800170614     C     PnKod1        READE     RPNGCLB                                93
002900170614     C                   ENDDO
003000170614
003100940922     C                   SETON                                        LR
003200940922     C                   RETURN
003300100601
