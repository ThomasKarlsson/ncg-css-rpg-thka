000100151207     D**********************************************************************
000200151207     D*                                                                   **
000300151207     D*    Definition specification:                                      **
000400151207     D*                                                                   **
000500151207     D**********************************************************************
000600151207
000700151207     D BeorRec       E Ds                  ExtName( Be_Beor )
000800151207     D                                     Prefix( Be )
000901151207
001000151207     D BeorInd         S              5I 0 DIM(99)
001001151207
001101151207     D NotFound        S              1    INZ(*OFF)
001103151207
001105151207     D   QueBenr                      7  0
001106151207     D   QueBonr                      7  0
001107151207     D   QueBol                       2  0
001200151207
001201151207      /EJECT
001202151207     S*****************************************************************
001203151207     S*
001204151207     S*    SQL Cursor specifications
001205151207     S*
001206151207     S*****************************************************************
001300151207
002100151207     c/exec sql
002200151207     c+   declare Beor dynamic scroll cursor for
002300151207     c+    select be.*
002400151207     c+      from Be_Beor Be
002500151207     c+     where BeBenr = :Quebenr AND BoBonr = :QueBonr
002600151207     c+       And Be.Fibol  = :QueBol
002700151207     c/end-exec
002701151207
002800151207      * Rensa data struktur
002900151207     c                   Clear                   BeorRec
002901151207      * Sätt End of File indikator till av
003000151207     c                   Eval      NotFound = *Off
003001151207
003002151207      * Öppna cursor och skapa index?
003100151207     c/exec sql
003200151207     c+   Open Beor
003300151207     c/end-exec
003301151207
003400151207      * Hämta data från cursor till record och NULL indikatorer
003500151207     c/exec sql
003600151207     c+   Fetch Beor
003700151207     c+    into   :BeorRec :BeorInd
003800151207     c/end-exec
003801151207
003900151207      * Mer poster fanns
004000151207     c                   If        SqlCod = 0
004001151207     c                   Eval      NotFound = *OFF
004002151207     c                   EndIf
004003151207      * End Of File
004100151207     c                   If        SqlCod <> 0
004200151207     c                   Eval      NotFound = *On
004300151207     c                   EndIf
004401151207
004402151207      * Sätt av NULL indikatorer för fält 9 och fält 14
004403151207     c                   Eval      BeorInd(9) = 0
004404151207     c                   Eval      BeorInd(14) = 0
004405151207
004406151207      * Uppdatera fält i tabellen
004500151207     c/exec sql
004600151207     c+   Update Be_Beor
004700151207     c+      Set BeOrda = Current Date, BeAvda = Current Date
004800151207     c+      where BeBenr = :Quebenr AND BoBonr = :QueBonr
004900151207     c+        And Fibol  = :QueBol
005000151207     c/end-exec
005100151207
005101151207      * Stäng cursor (Om man vill fylla den på nytt med nytt data)
005200151207     c/exec sql
005300151207     c+   Close Beor
005400151207     c/end-exec
005500151207
005600151207      *   Om fält 21 ej är "Null"
005800151207     c                   If        BeorInd(21) >= 0
005900151207
005901151207      * Kör SQL sats direkt
006000151207     c/EXEC SQL SELECT MAX(AdAdNr)
006100151207     c+  INTO :AdAdAdnr
006200151207     c+  FROM Ad_Adre
006300151207     c/END-EXEC
