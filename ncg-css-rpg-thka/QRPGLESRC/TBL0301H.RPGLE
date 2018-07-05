000100170310       // --------------------------------------------------
000200170310       // Prototype for procedure: addBankedAmount
000300170310       // --------------------------------------------------
000400170310       DCL-PR addBankedAmount IND;
000500170313         department      CHAR(4);
000600170310         cashierNo       ZONED(5:0);
000700170310         salesDate       ZONED(8:0);
000800170310         bankingType     CHAR(2);
000900170310         amount          ZONED(11:2);
001000170313         voucherSaleDate ZONED(8:0) OPTIONS(*NOPASS);
001100170310       END-PR ;
001200170310
