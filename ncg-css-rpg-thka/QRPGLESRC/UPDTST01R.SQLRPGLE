000100170329       CTL-OPT NOMAIN OPTION(*NODEBUGIO);
000200170329
000300170329       /INCLUDE qrpglesrc,updtst01p // Modulens eget gränssnitt
000400170330
000500170330       DCL-PR QCmdExc extpgm('QCMDEXC');
000600170330         CmdString char(1024) const options(*Varsize);
000700170330         CmdLength Packed(15:5) const;
000800170330       END-PR;
000900170330
001000170329       // ---------------------------------------------------------------------
001100170329       //
001200170329       // Procedure name: changeCstStatus
001300170329       // Purpose:        Changes staus for a file constraint
001400170329       // Returns:        True/false
001500170329       // Parameter:      file   - File name
001600170329       //                 state  - Desired state (*ENABLED/DISABLED)
001700170329       //
001800170329       // ----------------------------------------------------------------------
001900170329
002000170329       DCL-PROC changeCstStatus  EXPORT;
002100170329         DCL-PI *N IND;
002200170330           lib     CHAR(10);
002300170330           file    CHAR(10);
002400170329           state   CHAR(10);
002500170329         END-PI;
002600170329
002700170330       DCL-DS QadbfcstRec extname('QADBFCST') END-DS;
002800170329
002900170330       DCL-S CmdString CHAR(1024);
002901170330       DCL-S QadbfcstInd int(5:0) dim(99);
003000170329
003100161215       exec SQL declare C1 cursor for
003200170330         select *
003300170329         from qsys.qadbfcst
003400170330         where dbcpfl = :lib and dbcpff = :file;
003500161215
003600161215       exec SQL open C1;
003700161215
003800170330       exec SQL fetch next from C1 into :QadbfcstRec :QadbfcstInd;
003900161215
004000161215       dow sqlstt='00000' or %subst(sqlstt:1:2)='01';
004100170329
004200170330         CmdString = ('CHGPFCST'+' FILE('+ %trim(dbccfl) +'/'+ %trim(dbccff)
004300170330                       + ')' +' CST(' + %trim(dbccnm) + ')' +
004400170330                       ' STATE(' + %trim(state) + ')' ) ;
004500170330
004600170329         if state = '*ENABLED';
004601170331
004700170330           if dbcsta <> 'V';    // Only if *DISABLED
004701170331
004702170331             monitor;
004800170331               QCmdExc(CmdString: %len(CmdString));
004801170331             on-error;
004802170331               return *off;
004803170331             endmon;
004804170331
004900170329           endif;
004901170331
005000170329         else;
005001170331
005100170330           if dbcsta = 'V';     // Only if *ENABLED
005101170331
005103170331             monitor;
005200170331               QCmdExc(CmdString : %len(CmdString));
005201170331             on-error;
005202170331               return *off;
005203170331             endmon;
005204170331
005300170329           endif;
005301170331
005400170329         endif;
005500170329
005600170329         exec SQL fetch next from C1 into :QadbfcstRec;
005700161215       enddo;
005800161215
005900161215       exec SQL close C1;
006000160617
006100170330       return *ON;
006200161215
006300170329       END-PROC;
