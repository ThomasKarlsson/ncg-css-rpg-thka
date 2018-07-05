000100170110      /TITLE
000200031229     H DATEDIT(*YMD) OPTION(*NODEBUGIO)
000300100601
000400170110     FSeat      IF   E           K DISK
000500170110     F                                     EXTDESC('AUDIT00003')
000600170110     F                                     EXTFILE(*EXTDESC)
000700170110     F                                     RENAME(AUDIT00003:RSeat)
000800170110
000900170110     FTypePrice IF   E           K DISK
001000170112     F                                     EXTDESC('SEAT_00002')
001100170110     F                                     EXTFILE(*EXTDESC)
001200170110     F                                     RENAME(SEAT_00001:RTypePrice)
001300170110
001400170112     D WrSeatId        S                   LIKE(S_SeatID)
001500170112     D WrPlayDate      S                   LIKE(T_FromDate) INZ(*SYS)
001600170110
001700170110     IRSEAT
001800170112     I              ID                          S_SeatID
001900170112     I              SEAT_00002                  S_SeatTypeID
002000170110
002100170112     IRTypePrice
002200170112     I              SEAT_00001                  T_SeatTypeID
002300170112     I              OWNER                       T_Owner
002400170112     I              EFFEC00001                  T_FromDate
002500170112     I              EFFEC00002                  T_ToDate
002600170112
002700170112     C     KeyTypePrice  KLIST
002800170112     C                   KFLD                    T_Owner
002900170112     C                   KFLD                    T_SeatTypeID
003000170112
003100170110     C                   READ      RSEAT                                  93
003200170110     C                   DOW       *IN93 =*OFF
003300170112
003400170112     C                   EVAL      T_Owner = 'SF'
003500170112     C                   EVAL      %LEN(T_Owner) = 2
003600170112     C                   Z-ADD     S_SeatTypeID  T_SeatTypeID
003700170112
003800170112     C     KeyTypePrice  SETLL     RTypePrice
003900170112     C     KeyTypePrice  READE     RTypePrice                             93
004000170112
004100170112     C                   DOW       *IN93 = *OFF
004200170112
004300170112     C                   IF        WrPlayDate >= T_FromDate AND
004400170112     C                             WrPlayDate <= T_ToDAte
004500170112     C                   ENDIF
004600170112
004700170112     C     KeyTypePrice  READE     RTypePrice                             93
004800170112     C                   ENDDO
004900170112
005000170110     C                   READ      RSEAT                                  93
005100170110     C                   ENDDO
005200170110
005300940922     C                   SETON                                        LR
005400940922     C                   RETURN
005500100601
