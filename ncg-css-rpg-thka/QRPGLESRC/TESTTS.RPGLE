000100180427     D  WrkDate        S               D
000200180427     D  WrkTimeStamp   S               Z
000300180427      /FREE
000400180427         WrkDate = %DATE();
000500180427         WrkTimeStamp = %timestamp(WrkDate);
000600180427         WrkTimeStamp = %timestamp(%DATE());
000700180427      /END-FREE
000800170131     C                   SETON                                        LR
000900170131     C                   RETURN
