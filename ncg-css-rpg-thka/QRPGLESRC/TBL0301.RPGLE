000100170310        CTL-OPT NOMAIN;
000200170310
000300170310        DCL-F BkRegE USAGE(*UPDATE:*DELETE:*OUTPUT) KEYED USROPN;
000400170310
000500170310        /INCLUDE QRPGLESRC,TBL0301H
000600170310
000700170313        DCL-S wrVoucherSaleDate ZONED(8:0);
000800170313
000900170313
001000170304       // ---------------------------------------------------------------------
001100170304       // Procedure name: addBankedAmount
001200170304       // Purpose:        Adds banked anmount to Bankingtype in BKREG
001300170124       // Returns:        True/false
001400170313       // Parameter:      departmentNo    - Cinemas departmentnumber
001500170310       //                 cashierNo       - Cashier number
001600170310       //                 salesDate       - Date of sale
001700170310       //                 bankingType     - Type of banking
001800170310       //                 voucherSaleDate - Voucher sales date
001900170310       //                 amount          - amount banked in local currency
002000170304       // ----------------------------------------------------------------------
002100170124
002200170304       DCL-PROC addBankedAmount EXPORT;
002300170124
002400170124         DCL-PI *N IND;
002500170313           departmentNo    CHAR(4);
002600170310           cashierNo       ZONED(5:0);
002700170310           salesDate       ZONED(8:0);
002800170310           bankingType     CHAR(2);
002900170310           amount          ZONED(11:2);
003000170313           voucherSaleDate ZONED(8:0) OPTIONS(*NOPASS);
003100170124         END-PI ;
003200170124
003300170313         if %parms = 6;
003400170313            wrVoucherSaleDate = voucherSaleDate;
003500170313         else;
003600170313            wrVoucherSaleDate = *ZEROS;
003700170313         endif;
003800170313
003900170310         if openFiles();
004000170310
004100170313           chain (departmentNo:cashierNo:salesDate:bankingType:
004200170313                  wrVoucherSaleDate) RBkReg;
004300170310
004400170310           if %found(BkRegE);
004500170310             bkbank += Amount;
004600170310             update RBkreg;
004700170310           else;
004800170313             initBkreg(departmentNo:cashierNo:salesDate:bankingType:
004900170313                       wrVoucherSaleDate);
005000170310             bkbank += Amount;
005100170310             write RBkReg;
005200170310           endif;
005300170124
005400170310           Return *On;
005500170310
005600170310         endif;
005700170310
005800170124       END-PROC ;
005900170124
006000170310       // ---------------------------------------------------------------------
006100170310       // Procedure name: initBkReg
006200170310       // Purpose:        initialize all fields in BKREG
006300170310       // Returns:        True/false
006400170313       // Parameter:      departmentNo    - Cinemas departmentNo
006500170313       //                 cashierNo       - Cashier number
006600170313       //                 salesDate       - Date of sale
006700170313       //                 bankingType     - Type of banking
006800170310       //                 voucherSaleDate - Voucher sales date
006900170310       // ---------------------------------------------------------------------
007000170310
007100170310       DCL-PROC initBkReg;
007200170310
007300170310         DCL-PI *N IND;
007400170313           departmentNo   CHAR(4);
007500170310           cashierNo   ZONED(5:0);
007600170310           salesDate   ZONED(8:0);
007700170310           bankingType CHAR(2);
007800170313           wrVoucherSaleDate ZONED(8:0);
007900170310         END-PI ;
008000170310
008100170310         Clear *All RBkreg;
008200170310
008300170313         BkBio  = 'SE';
008400170313         BkKto  = departmentNo;
008500170310         BkKass = cashierNo;
008600170310         BkDat  = salesDate;
008700170310         BKRt   = bankingType;
008800170313         BKSeNr = wrVoucherSaleDate;
008900170310
009000170310           Return *On;
009100170310
009200170310       END-PROC;
009300170310
009400170310       // ---------------------------------------------------------------------
009500170310       // Procedure name: OpenFiles
009600170310       // Purpose:        opens BKREG
009700170310       // Returns:        True/false
009800170310       // ---------------------------------------------------------------------
009900170310
010000170310       DCL-PROC openFiles;
010100170310
010200170310         DCL-PI *N IND;
010300170310         END-PI ;
010400170310
010500170310       if Not %open(BkRegE);
010600170310         open BkRegE;
010700170310       endif;
010800170310
010900170310       Return *on;
011000170310
011100170310       END-PROC;
011200170310       // ---------------------------------------------------------------------
011300170310       // Procedure name: closeFiles
011400170310       // Purpose:        close files
011500170310       // Returns:        True/false
011600170310       // ---------------------------------------------------------------------
011700170310
011800170310       DCL-PROC closeFiles;
011900170310
012000170310         DCL-PI *N IND;
012100170310         END-PI ;
012200170310
012300170310       if %open(BkRegE);
012400170310         close BkRegE;
012500170310       endif;
012600170310
012700170310       Return *on;
012800170310
012900170310       END-PROC;
