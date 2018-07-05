000100981125     DPRM1             DS
000200170131     D  WSeats                 1    180
000300170131     D  WSeatID                      18    OVERLAY(WSeats) DIM(10)
000400170131
000500170131     D  BJSEATID       S             18  0
000600170131     D  X              S              3  0
000700170131
000800170131     C     *ENTRY        PLIST
000900170131     C                   PARM                    Prm1
001000170131
001100170131     C                   Z-ADD     1             x
001200170131     C                   DOW       x <= 10
001300170131
001400170131     C                   EVAL      BjSeatID = +
001500170131     C                             %dec(%xlate(' ' :'0': WSeatId(X)):18:0)
001600170131
001700170131     C                   ADD       1             x
001800170131     C                   ENDDO
001900170110
002000170131     C                   SETON                                        LR
002100170131     C                   RETURN
