000100160617     H NOMAIN
000200160617
000300160619      /INCLUDE qrpglesrc,CSS90001P // Modulens eget gränssnitt
000400160617      *--------------------------------------------------------------------*
000500160617      *   Convert Date to Numeric                                          *
000600160617      *--------------------------------------------------------------------*
000700160617     P Date2Num        B                   EXPORT
000800160617
000900160617     DDate2Num         PI             8S 0
001000160619     D DateFld                         D   value
001100160617     D OutNumeric      s              8S 0
001200160617
001300160617      /free
001400160619         OutNumeric = %int(%char(DateFld:*ISO0) );
001500160617         return OutNumeric;
001600160617      /end-free
001700160617
001800160617     P Date2Num        E
001900160617      /EJECT
002000160617      *--------------------------------------------------------------------*
002100160617      *   Convert Date to Character                                        *
002200160617      *--------------------------------------------------------------------*
002300160617     P Date2Char       B                   EXPORT
002400160617
002500160617     DDate2Char        PI             8A
002600160619     D DateFld                         D   value
002700160617     D OutCharacter    s              8A
002800160617
002900160617      /free
003000160617         OutCharacter = %char(DateFld:*ISO);
003100160617         return OutCharacter;
003200160617      /end-free
003300160617
003400160617     P Date2Char       E
