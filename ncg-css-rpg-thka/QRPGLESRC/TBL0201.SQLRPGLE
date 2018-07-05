000100000000
000200170124        CTL-OPT NOMAIN;
000300170124       // !!! 1. MOVE THIS PROTOTYPE TO A /COPY SOURCE FILE.
000400170124       // !!! 2. INSERT A /COPY STATEMENT IN THIS SOURCE FILE.
000500170124       // --------------------------------------------------
000600170124       // Prototype for procedure: delete_fromBJREG
000700170124       // --------------------------------------------------
000800170209       DCL-PR delete_fromSÖREG IND;
000900170124         deleteDate DATE(*ISO);
001000170124       END-PR ;
001100170124       // !!! END OF PROTOTYPE.
001200170124
001300170124
001400170124       // --------------------------------------------------------
001500170209       // Procedure name: delete_fromSÖREG
001600170209       // Purpose:        Deletes old shows from SÖREG
001700170124       // Returns:        True/false
001800170124       // Parameter:      deleteDate => Has to be less than today
001900170124       // --------------------------------------------------------
002000170124
002100170209       DCL-PROC delete_FromSÖREG;
002200170124
002300170124         DCL-PI *N IND;
002400170124           deleteDate DATE(*ISO);
002500170124         END-PI ;
002600170124
002700170124         dcl-s  numDeleteDate PACKED(8:0);
002800170124
002900170124         if  deleteDate >= %DATE();   // We can never remove todays tickets
003000170124           return *OFF;
003100170124         endif;
003200170124
003300170124         numDeleteDate = %dec(%char(deleteDate : *iso-):8:0);
003400170124
003500170124         exec sql
003600170209           delete from SÖReg
003700170209           where SÖdat < :numDeleteDate;
003800170124
003900170124         If sqlcode = 0;
004000170124           return *ON;
004100170124         else;
004200170124           return *OFF;
004300170124         endif;
004400170124
004500170124       END-PROC ;
004600170124
