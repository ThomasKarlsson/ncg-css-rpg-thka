000100
000101170118
000102170118       CTL-OPT DFTACTGRP(*NO) option(*nodebugio) debug(*yes);
000103170118
000104170118       DCL-F SalongInfo rename(SalongInfo : Rin);
000105170118
000106170118       dcl-s  ScreenNo ZONED(7:0);
000107170118
000108170118       // --------------------------------------------------
000109170118       // Prototype for procedure: CountScreens
000110170118       // --------------------------------------------------
000111170118       DCL-PR CountScreens ;
000112170118         ScreenNo ZONED(7:0);
000113170118       END-PR ;
000114170118
000115170118       read Salonginfo;
000116170118
000117170118       dow not %eof(Salonginfo);
000118170118         CountScreens(ScreenNo);
000119170118         read Salonginfo;
000120170118       enddo;
000121170118
000122170118       dsply ScreenNo;
000123170118
000124170118       *Inlr = *ON ;
000125170118       // --------------------------------------------------
000126170118       // Procedure name: CountScreens
000127170118       // Purpose:        Counts No of Screens
000128170118       // Returns:
000129170118       // Parameter:      ScreenNo => Number of Screens
000130170118       // --------------------------------------------------
000131170118       DCL-PROC CountScreens ;
000132170118
000133170118         DCL-PI *N;
000134170118           ScreenNo ZONED(7:0);
000135170118         END-PI ;
000136170118                   ScreenNo += 1;
000137170118
000138170118         return ;
000139170118
000140170118       END-PROC ;
000141170118
