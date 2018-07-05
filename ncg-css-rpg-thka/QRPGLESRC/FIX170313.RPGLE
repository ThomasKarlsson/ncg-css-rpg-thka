000100000000
000200170118
000300170313       CTL-OPT ACTGRP(*CALLER) option(*nodebugio) debug(*yes);
000400170313       CTL-OPT BNDDIR('CSSBNDDIR');
000500170313
000600170118
000700170313       /INCLUDE QRPGLESRC,TBL0301H
000800170118
000900170313       DCL-S  departmentNo     CHAR(4);
001000170313       DCL-S  cashierNo       ZONED(5:0);
001100170313       DCL-S  salesDate       ZONED(8:0);
001200170313       DCL-S  bankingType     CHAR(2);
001300170313       DCL-S  amount          ZONED(11:2);
001400170313
001500170313       departmentNo = '1234';
001600170313       cashierNo = 99998;
001700170313       salesDate = 20171013;
001800170313       BankingType = *BLANKS;
001900170313       amount = *ZEROS;
002000170313
002100170313       addBankedAmount(departmentNo:cashierNo:salesDate:bankingType:amount);
002200170313
002300170313       departmentNo = '1234';
002400170313       cashierNo = 99998;
002500170313       salesDate = 20171013;
002600170313       BankingType = 'G';
002700170313       amount = 1000;
002800170313
002900170313       addBankedAmount(departmentNo:cashierNo:salesDate:bankingType:amount);
003000170313
003100170118       *Inlr = *ON ;
