000100990115      /TITLE Ta emot återköp Godis
000200170313     H DATEDIT(*YMD) ALWNULL(*USRCTL)
000300910617     F*************************************************************************
000400910617     F*
000500990115     F*      FR1030   Ta emot återköp Godis
000600881202     F*
000700981119     F*      P H 1998-11-19 P H  Cuecumber AB
000800930128     F*
000900080910     F**--------------------------------------------------------------------
001000080910     F*
001100080910     F*      B. Ström SYSteam 2008-09-09
001200080910     F*      Ändrat svarssträngen för anpassning till nya skrivarprogrammen
001300080910     F*      i klientprogramvaran.
001400080910     F*
001500080910     F**--------------------------------------------------------------------
001600040907     F*      B. Ström SYSteam 2004-09-07 Version 6.4
001700040907     F*
001800040907     F*      Omkompilerat pga av nytt fält GODLOG GoMRab  Rabattkoden
001900090630     F*
002000090630     F**--------------------------------------------------------------------
002100090630     F*      SF Kino R4 B. Ström 2009-06-30
002200090630     F*      Antal är nu 8,2 och används både för antal och vikt
002300090911     F*
002400090911     F*      2009-09-11 B. Ström SYSteam
002500090911     F*      SF Kino R5. Ny hantering av specialtecken så att de blir
002600090911     F*      språkoberoende.
002700140310     F*
002800120117     F*      B. Ström 2012-01-17
002900120117     F*      Fel pris i svarssträngen pga att Wsumma är 6 långt
003000120117     F*
003100140310     F*
003200140310     F*      2014-03-10 B. Ström EVRY
003300140310     F*      Nya fält i GodArt, GodPak och GodLog för "Nya artikelregistret"
003400140505     F*
003500140505     F*      2014-05-05 B. Ström EVRY
003600140505     F*      Nya inparametrar vid försäljninging. ProdRule, Menyartikel
003700140505     F*      och Inköpspris
003800161005     F*
003900161005     F*   2016-10-05 P. Ågrup Bromma Konsult
004000161005     F*   Nytt fält Wftransid i PRM1, läggs i GOTRA00001 i GODLOG
004100161118     F*
004200161118     F*   2016-11-18 P. Ågrup Bromma Konsult
004300161118     F*   Omkompilerat pga av nya fält för Auditoriet
004400161005     F*
004500090630     F**--------------------------------------------------------------------
004600040907     F*
004700911004     F*      FILER
004800911004     F*
004900930128     F*      GODDR01    Dagsrapport från LC
005000940619     F*      GODPI00    Artikelstatistik+inköpsstatistik från LC
005100910830     F*
005200090219     F**--------------------------------------------------------------------
005300090219     F*
005400090219     F*      Pär Lönnqvist IBS Konsult AB 2009-02-16
005500090219     F*      Flytt av felmeddelanden och konstanter till fil
005600090318     F*      Läs fil Text istället för SFBILJFR
005700091207     F*
005800091207     F*      2009-12-07 B. Ström SYSteam
005900091207     F*      SF Kino R7. Omkompilerat pga av ändrade fil BKREG
006000090219     F*
006100121207     F*      2012-11-29 Björn Ljunggren Bizt AB
006200121207     F*      Ny GODLOG skapad med SQL - omkompilerad LF - omkompilerat PGM
006300121207     F*
006400121207     F*      2012-12-07 Björn Ljunggren Bizt AB
006500121207     F*      Nya inparm för 3D Glasögon som skrivs till GODLOG
006600121207     F*      med information för BJREG.
006700130218     F*
006800130218     F*      2013-02-18 Björn Ljunggren Bizt AB
006900130228     F*      Återköp fler än 50 artiklar, hanteras i klienten
007000160419     F*
007100160419     F*      2016-04-19  B. Ström EVRY
007200160419     F*      Omkompilerad pga beloppsfält Common Sales System
007300160419     F*
007400170213     F*      2017-02-13  THKA
007500170213     F*                  Nytt fält Ägare/PWÄGR i PWREG
007600170213     F*
007700090219     F**--------------------------------------------------------------------***
007800910830     F*************************************************************************
007900090318     Ftextak2   if   e           k disk    usropn
008000090318     F                                     rename(text:textpf)
008100090318     Fmoduleak2 if   e           k disk
008200990324     FSYREGA    IF   E           K DISK
008300090311     F*SFBILJFR  IF   E             DISK    USROPN
008400990108     FBKREGB    UF A E           K DISK
008500981125     FFORSTLC   IF A E           K DISK
008600981124     FGODLOG    O  A E             DISK
008700990111     FPWREGA    IF   E           K DISK
008800121207     FBJREG48   IF   E           K DISK
008900090630
009000011008      **********************************************************************
009100011008
009200011008      *  Arrayer
009300011008
009400011008      **********************************************************************
009500090219     D/copy qrpglesrc,TXTCPYSRCF
009600170313     D/copy qrpglesrc,tbl0301h
009700011008     D ARR             S              1    DIM(30000) INZ(*BLANKS)
009800080910     D ARRN            S              1    DIM(30000) INZ(*BLANKS)
009900981110     D* Workfält
010000981110KK12 D Weoj            S              1A   INZ('0')
010100981201KK12 D Wsts            S              1A   INZ
010200981125     D Wfldlen         S              5  0
010300011008     D Wfirst          S              3A
010400160419KK12 D Wsumma          S                   LIKE(GoUtp) INZ
010500160419     D Wsumma7         S              7A
010600990108KK12 D Wrt             S                   LIKE(Bkrt) INZ
010700981125KK12 D Wrabkr          S              5S 0 INZ
010800981125KK12 D Wrabpr          S              4S 0 INZ
010900981120KK12 D Wben            S              9A   INZ
011000981119KK12 D Wgrp            S              4A   INZ
011100981119KK12 D Wmeny           S              4A   INZ('MENY')
011200981119KK12 D Wmanpris        S              1A   INZ
011300990115KK12 D Wbnkfi          S              3A   INZ
011400011008KK12 D Z80             S             80A   INZ
011500011008     D Xfr             S              3S 0 INZ
011600981110KK12 D Wminus1         C                   '-1'
011700981119     D* Define carriage-return/linefeed
011800090911     D NewLine         S              1A
011900090911KK12 D Wsemi           S              1A
012000981110KK12 D W               S              3  0 INZ(*ZEROS)
012100130219KK12 D X               S              3  0 INZ(*ZEROS)
012200981119KK12 D Y               S              5  0 INZ(*ZEROS)
012300080910KK12 D YN              S              5  0 INZ(*ZEROS)
012400080910KK12 D YX              S              5  0 INZ(*ZEROS)
012500011008KK12 D V               S              5  0 INZ(*ZEROS)
012600011008KK12 D Ww              S              5  0 INZ(*ZEROS)
012700011008KK12 D Index           S              5  0 INZ
012800011008     D Wapo            C                   '"'
012900011008     D Wsned           C                   '/'
013000011008KK12 D Wkolon          C                   ':'
013100011008     D Wpunkt          C                   '.'
013200090219     D Wkiosk          S             60
013300090219     D Wkiosktext      S             60
013400090219     D Wkvittext       S             60
013500090219     D Wpristext       S             60
013600090219     D Wansttext       S             60
013700090318     D  wmoduleid      s                   like(moduleid)
013800090311     D  wname          s                   like(name)
013900170314     D  wrBank         s             11S 2
014000981120      *****************************************************************
014100981120      *
014200981120      *           Datastrukturer.
014300981120      *
014400011008      * SFBILJFR
014500011008     D NFR             DS                  OCCURS(100)
014600011008     D  WPTFR                  1      2
014700011008     D  WFR                    1     80
014800011008
014900011008     D                 DS
015000011008     D  Wfem                   1      5
015100011008     D  W5                     1      5
015200011008     D                                     DIM(5)
015300011008
015400011008     D                 DS
015500011008     D  Wtid                   1      6S 0
015600011008     D   Wtidtm                1      4  0
015700011008     D   Wtimalf               1      2
015800011008     D   Wminalf               3      4
015900011008     D  Wrdtid                 1      4  0
016000011008     D   RDTTT                 1      2  0
016100011008     D   RDTMM                 3      4  0
016200011008     D                 DS
016300011008     D  WTTA07                 1      2
016400011008     D  WKLA07                 3      3
016500011008     D  WMMA07                 4      5
016600011008     D  WTIDALFA               1      7
016700011008     D                 DS
016800011008     D  WDD02                  1      2
016900011008     D  WD02                   1      1
017000011008     D  WSNE02                 3      3
017100011008     D  WMM02                  4      5
017200011008     D  WA1                    4      5
017300011008     D                                     DIM(2)
017400011008     D  ZTXT02                 1      5
017500981120     D                 DS
017600981120     D*
017700981125     D  Wtimestmp              1      6  0
017800981110
017900981110     D                 DS
018000981110     D  Wean                   1     13
018100981110     D   Wwean                 1     13  0
018200881202     F*
018300981125      *
018400990108      *
018500990108     D LDA            UDS                  DTAARA(*LDA)
018600990108      * Ursprungsbio
018700990108     D  LDSBIO               298    299
018800990108     D* Sälja Godis via biljpgm J/N
018900990108     D  LDGOD                300    300
019000990108     D* Smartcard på avslut.    J/N
019100990108     D  LDSMRT               301    301
019200990108     D*
019300990108     D  LDBIO                302    303
019400990108     D  LDBIOA               302    304
019500990108     D  LDBIOR               305    307
019600990108     D  LDKASS               308    312  0
019700990108     D*
019800990108     D  LDDAT                313    320  0
019900990108     D  LDDAT6               315    320  0
020000011008     D  RDDAT6               315    320  0
020100011008     D  RDDATA               315    320
020200011008     D  RDÅÅ                 315    316  0
020300011008     D  RDMM                 317    318  0
020400011008     D  RDDD                 319    320  0
020500990108      *
020600990108     D  LDKTO                345    348
020700990108     D* Försäljningställe
020800990108     D  LDSTL                390    394
020900990108
021000981125      * Tillbaks
021100981125      *
021200981125     DPRM1             DS
021300010912     D Data1                   1  30000
021400981125
021500981203     D  Wfraga                 1      4
021600981125     D   Wfavd                 6     13
021700981125     D    Wfkto                6      9
021800981125     D   Wfkass               15     19  0
021900981125     D   Wftid                21     26  0
022000161005      * Transaktions ID
022100161006     D   Wftransid            28     37
022200981125
022300981125      *  Varje delmängd i prodlist består av
022400981125      *    1. Ean-nr                     13  0
022500090630      *    :                              1
022600160419      *    2. Pris                        9  2
022700090630      *    :                              1
022800981125      *    3. Rabatt                      5A
022900981125      *       = Antingen pris 5 eller rab % = 4 + % ex. 0050%
023000090630      *    :                              1
023100090630      *    4. Orsak till återköp         80A
023200090630      *    :                              1
023300121207      *    5. Stad                        2A
023400140505      *       :                           1
023500121207      *    6. Sal                         2A
023600121207      *       :                           1
023700121207      *    7. Föreställnings dag          8  0
023800121207      *       :                           1
023900121207      *    8. Föreställningstid           4  0
024000121207      *       :                           1
024100121207      *    9. Stol                        5  0
024200121211      *       :                           1
024300140505      *   11. Inköpsställe                8A
024400140505      *       :                           1
024500140505      *   12. ProdRule                    9  0
024600140505      *       :                           1
024700160419      *   13. Inköpspris                  9  2
024800140505      *       :                           1
024900140505      *   14. Menyid                     13  0
025000140505      *       #                           1
025100981125
025200160419      *    Summa                        180 posar med : emellan och #
025300160419      *    Låt det bli 50 element =    9000 posar
025400981125
025500161006     D   Wfprodlist           39   9038
025600161006     D   Wpro                 39   9038    DIM(50)
025700981125      * Tillbaks
025800981125     DPRM2             DS
025900000526     D Data2                   1  30000
026000981125
026100981130     D                 DS
026200160419     D  Wprodtest              1    180
026300981130     D   Wfeanalf              1     13
026400981125     D                 DS
026500160419     D  Wprods                 1    180
026600981125     D   Wfean                 1     13  0
026700160419     D   Wfpris               15     23  2
026800160419     D   Wfrab                25     29
026900160419     D    Wfrab1              25     29
027000160419     D    Wfrab2              25     28
027100160419     D    Wfproc              29     29
027200160419     D    Wforsk              31    110
027300160419     D   WfStad              112    113
027400160419     D   WfSal               115    116
027500160419     D   WfFÖdag             118    125  0
027600160419     D   WfFÖdagA            118    125
027700160419     D   WfFÖtid             127    130  0
027800160419     D   WfFÖtidA            127    130
027900160419     D   WfStol              132    136  0
028000160419     D   WfStolA             132    136
028100160419     D   WfFkto              138    145
028200981119      *
028300160419     D   WfProdRule          147    155  0
028400160419     D   WfInkP              157    165  2
028500160419     D   WfMnyId             167    179  0
028600140505      *
028700910617     I*************************************************************************
028800910617     I*
028900910617     I*      Tabeller
029000910617     I*
029100910617     I*************************************************************************
029200881202     I/EJECT
029300881202     ******************************************************************---
029400881202     **
029500881202     **           Keylists
029600881202     **
029700910611     ******************************************************************
029800990108     ** BKREG
029900990108     C     BKKY1         KLIST
030000990108     C                   KFLD                    LDBIO
030100990108     C                   KFLD                    LDKTO
030200990108     C                   KFLD                    LDDAT
030300990108     C                   KFLD                    WfKASS
030400990108     C                   KFLD                    WRT
030500990108
030600981125     C     FORKY1        KLIST
030700981125     C                   KFLD                    Wfkto
030800911009     **
030900981125     C     PWAKY1        KLIST
031000981125     C                   KFLD                    Fsbio
031100981125     C                   KFLD                    Wfkass
031200990324      * Syrega
031300990324     C     SYSKEY        KLIST
031400990324     C                   KFLD                    SYKEY
031500090311     C     keymoduleak1  klist
031600090311     C                   kfld                    wname
031700090311     C     keytextak2    klist
031800090311     C                   kfld                    wmoduleid
031900910611      /EJECT
032000910611     *****************************************************************
032100910611     **
032200981110     **                    Huvudslinga
032300910611     **
032400910611     ***************************************************************
032500981125     C     *ENTRY        PLIST
032600981125     C                   PARM                    PRM1
032700981125     C                   PARM                    PRM2
032800981125     C                   PARM                    Wfldlen
032900990225
033000990225     C                   IN        LDA
033100011008
033200011008     C                   MOVEA     *BLANKS       ARR
033300011008
033400011008     C                   SELECT
033500011008     C                   WHEN      Wfirst <> 'JA '
033600990324
033700990324      *                  Hämta aktuellt datum
033800990324
033900990324     C                   EVAL      Lddat = *DATE
034000990324
034100990324     C                   MOVEL     'DATUM'       SYKEY
034200990324     C     SYSKEY        CHAIN     SYREGA                             91
034300990324     C                   SELECT
034400990324     C                   WHEN      *IN91 = *OFF
034500990324     C                   MOVEL     SYDATA        Lddat
034600990324     C                   ENDSL
034700011008      *  SFBILJFR
034800011008     C                   Z-ADD     1             XFR
034900090311     C*                  OPEN      SFBILJFR
035000090311     C*                  READ      SFBILJFR                               93
035100090318     C                   open      textak2
035200090318     C     keytextak2    setll     textak2                                93
035300090318     C                   read      textak2                                93
035400011008     C     *IN93         DOWEQ     *OFF
035500011008     C     XFR           OCCUR     NFR
035600090311     C*                  MOVEL     SRCDTA        WFR
035700090312     C                   eval      wfr = text
035800011008     C                   ADD       1             XFR
035900090311     C*                  READ      SFBILJFR                               93
036000090318     C     keytextak2    reade     textak2                                93
036100011008     C                   END
036200011008     C                   MOVE      *OFF          *IN93
036300090311     C*                  CLOSE     SFBILJFR
036400090311     C                   CLOSE     textak2
036500011008
036600011008     C                   EVAL      Wfirst = 'JA '
036700011008     C                   ENDSL
036800990108
036900990108     C                   EVAL      Wsumma = 0
037000981110
037100121207     C                   EVAL      Wsts = '0'
037200121207
037300981124      *                  Hämta uppgifter ur PWREG. tex. Stad = Bio
037400981124
037500981125     C     FORKY1        CHAIN     FORSTLC                            91
037600981124     C                   SELECT
037700981124     C                   WHEN      *IN91 = *OFF
037800981125
037900990108     C                   EVAL      Ldbio = Fsbio
038000990108     C                   EVAL      Ldkto = Wfkto
038100990108     C                   EVAL      Ldstl = Fsstl
038200990108
038300990108      *                  Lägg ut till Godlog
038400990108
038500981125     C                   EVAL      Gobio = Fsbio
038600981125     C     PWAKY1        CHAIN     PWREGA                             91
038700981125     C                   SELECT
038800981125     C                   WHEN      *IN91 = *OFF
038900981124
039000981125     C                   EVAL      Gobio = Fsbio
039100981125     C                   EVAL      Goait2 = Wfavd
039200990324     C                   EVAL      Gofdat = Lddat
039300981125     C                   TIME                    Wtimestmp
039400011008     C                   TIME                    Wtid
039500981125     C                   EVAL      Gotmsp = Wftid
039600981125     C                   EVAL      Gokass = Wfkass
039700981125     C                   EVAL      X = 1
039800130228     C                   DOW       X <= 50
039900981130
040000981130      *                  Ta varje arrayelement för sig
040100981130
040200981130     C                   EVAL      Goark = 0
040300981130     C                   EVAL      Gosrk = 0
040400981130     C                   EVAL      Goarp = 0
040500981130     C                   EVAL      Gosrp = 0
040600981130
040700981130     C                   MOVEL     Wpro(X)       Wprodtest
040800981130
040900981130      *                  Om slut i arrayen
041000981130
041100990121     C                   EVAL      *IN91 = *OFF
041200990121     C                   TESTN                   Wfeanalf             91
041300990121     C     *IN91         IFEQ      *OFF
041400130219     C                   EVAL      X = 999
041500981130     C                   ELSE
041600981130
041700990121     C                   EVAL      *IN91 = *OFF
041800981130     C                   MOVEL     Wpro(X)       Wprods
041900981125      * Artnr
042000090924     C                   EVAL      Goean = Wfean
042100990115     C                   EVAL      Goutp = Wfpris * -1
042200090831     C****               EVAL      GoVolym = WfVolym
042300140508     C* Ingående artiklar i en meny skall inte räknas med i summan att
042400140508     C* återbetala.
042500140508     C     WfMnyId       Ifeq      0
042600090924     C                   EVAL      Wsumma = Wsumma + Goutp
042700140508     C                   End
042800981125
042900981125      *                  %-rabatt
043000981125
043100981125     C                   SELECT
043200981125     C                   WHEN      Wfproc = '%'
043300981125     C                   MOVEL     Wfrab2        Wrabpr
043400990115     C                   EVAL      Goarp = -1
043500981130     C                   EVAL      Gosrp = Wrabpr
043600981125     C                   ENDSL
043700981125
043800981125      *                  kr-rabatt
043900981125
044000981125     C                   SELECT
044100981130     C                   WHEN      Wfproc <> '%'
044200981125     C                   MOVEL     Wfrab1        Wrabkr
044300990308     C     Wrabkr        IFNE      0
044400990115     C                   EVAL      Goark = -1
044500990115     C                   EVAL      Gosrk = Wrabkr * -1
044600990308     C                   ENDIF
044700990308
044800981125     C                   ENDSL
044900990115     C                   EVAL      Goorsk = Wforsk
045000990115     C                   EVAL      Goinfo = *BLANKS
045100990324      * B=Back(Återköp)
045200990326     C                   EVAL      GOTYP = 'B'
045300040907
045400040907     C                   EVAL      GoMRab= *Blanks
045500121207
045600121207     C                   EVAL      Gostad = WfStad
045700121207     C                   EVAL      Gosal  = WfSal
045800130219     C     WFFÖDAGA      IFNE      *BLANKS
045900121211     C                   EVAL      GoFÖdat= WfFÖdag
046000130219     C                   ELSE
046100130219     C                   EVAL      GoFÖdat= 0
046200130219     C                   ENDIF
046300130219     C     WFFÖTIDA      IFNE      *BLANKS
046400121207     C                   EVAL      GoFÖtid= WfFÖtid
046500130219     C                   ELSE
046600130219     C                   EVAL      GoFÖtid= 0
046700130219     C                   ENDIF
046800130219     C     WFSTOLA       IFNE      *BLANKS
046900121211     C                   EVAL      GoStolid = WfStol
047000130219     C                   ELSE
047100130219     C                   EVAL      GoStolid = 0
047200130219     C                   ENDIF
047300121211     C                   EVAL      GoFkto = WfFkto
047400981125
047500140326     C* 2014-03-26 Nya fält
047600140505     C                   EVAL      GoProdRule = WfProdRule
047700140505     C                   EVAL      GoMnyId    = WfMnyId
047800140505     C                   EVAL      GoInkP     = WfInkP
047900161005
048000161005     C* 2016-10-05 Nytt fält
048100161005     C                   EVAL      GOTRA00001 = Wftransid
048200140326
048300981125     C                   WRITE     Rgodlog
048400981125     C                   EVAL      X = X + 1
048500981130      * Slut array
048600981130     C                   ENDIF
048700981130
048800981125     C                   ENDDO
048900981125
049000981110
049100981110     C                   EVAL      *IN93 = *OFF
049200990115
049300990115      *                    Om ej sålt förut lägg ut en tom räknarpost i
049400990115      *                    BKREG.
049500170313      /Free
049600170313                         Wrt = *BLANKS;
049700170314                         WrBank = 0;
049800170314                         addBankedAmount(LdKto:WfKass:LdDat:Wrt:WrBank);
049900170313      /End-Free
050000990115
050100990108      *                    Addera Godisförsäljning till BKREG
050200990115
050300170313      /Free
050400170313                         Wrt = 'G ';
050500170314                         WrBank = WSumma;
050600170314                         addBankedAmount(LdKto:WfKass:LdDat:Wrt:WrBank);
050700170313      /End-Free
050800990115
050900981119      * Längd på strängen
051000981125     C                   EVAL      Wfldlen = 8
051100981119
051200981125     C                   EVAL      Y = 0
051300981125     C                   EVAL      Data2 = *BLANKS
051400981125
051500981125
051600981125      *                  Börja lägg ut
051700981125
051800011008      * Felkod
051900121207     C                   EVAL      Wsts = '0'
052000011008
052100011008     C                   EVAL      Y = 1
052200011008     C                   MOVEA     Wfraga        Arr(Y)
052300011008     C                   EVAL      Y = Y + 4
052400011008     C                   MOVEA     Wsemi         Arr(Y)
052500011008     C                   EVAL      Y = Y + 1
052600011008      * Status
052700011008     C                   MOVEA     Wsts          Arr(Y)
052800011008     c                   EVAL      Y = Y + 1
052900011008     C                   MOVEA     Wsemi         Arr(Y)
053000011008     C                   EVAL      Y = Y + 1
053100981119
053200011008      *                  Skriv kvitto
053300011008
053400011008     C                   EXSR      KVITTOATR
053500011008
053600981125     C                   ENDSL
053700981125     C                   ENDSL
053800011008
053900011008     C                   EVAL      Data2 = *BLANKS
054000011008     C                   MOVEA     ARR           Data2
054100011008     C                   EVAL      Wfldlen = Y
054200981125
054300981119     C                   RETURN
054400911009     **
054500011008     ***********************************************************
054600011008     **
054700011008     **    KVITTOATR Sriver kvitto på återköp GOdis
054800011008     **
054900011008     ***********************************************************
055000011008     C     KVITTOATR     BEGSR
055100011008
055200011008     C                   Z-ADD     1             V
055300011008      *
055400011008     C                   Z-ADD     1             INDEX
055500011008     C     INDEX         DOWLE     XFR
055600011008     C     INDEX         OCCUR     NFR
055700011008      *
055800011008     b*                    Om Typ = BT ska du in med dina parametrar
055900011008      *
056000011008     C     WPTFR         IFEQ      'PT'
056100011008     C                   MOVE      *BLANKS       Z80
056200011008      *
056300011008      *                    Skriv PT och en blank
056400011008      *
056500011008     C     Z80           CAT       WPTFR:0       Z80
056600011008      *
056700011008      *                    1:a BT = Byt ut "Salong=  mot punkt
056800011008      *
056900011008     C     V             IFEQ      1
057000011008     C     Z80           CAT       WAPO:1        Z80
057100011008     C                   CAT       Wpunkt:0      Z80
057200011008     C     Z80           CAT       WAPO:0        Z80
057300011008
057400011008     C                   MOVEA     Z80           Arr(Y)
057500011008     C                   EVAL      Y = Y + 6
057600011008     C                   MOVEA     Newline       Arr(Y)
057700011008     C                   EVAL      Y = Y + 1
057800011008     C                   ADD       1             V
057900011008     C                   ELSE
058000011008      *
058100090923      *                    2:A BT = Byt ut ordinarie pris mot betalt
058200011008      *
058300011008     C     V             IFEQ      2
058400011008     C     Z80           CAT       WAPO:1        Z80
058500011008     C                   CAT       Wpristext:0   Z80
058600011008     C     Z80           CAT       WAPO:0        Z80
058700011008
058800011008     C                   MOVEA     Z80           Arr(Y)
058900011008     C                   EVAL      Y = Y + 20
059000011008     C                   MOVEA     Newline       Arr(Y)
059100011008     C                   EVAL      Y = Y + 1
059200011008     C                   ADD       1             V
059300011008     C                   ELSE
059400011008      *
059500011008      *                    3:e BT = Byt ut antal mot punkt
059600011008      *
059700011008     C     V             IFEQ      3
059800011008     C     Z80           CAT       WAPO:1        Z80
059900011008     C                   CAT       Wpunkt:0      Z80
060000011008     C     Z80           CAT       WAPO:0        Z80
060100011008
060200011008     C                   MOVEA     Z80           Arr(Y)
060300011008     C                   EVAL      Y = Y + 6
060400011008     C                   MOVEA     Newline       Arr(Y)
060500011008     C                   EVAL      Y = Y + 1
060600011008     C                   ADD       1             V
060700011008     C                   ELSE
060800011008      *
060900011008      *                    6:E BT = Text Återköp Godisprodukter
061000011008      *
061100011008     C     V             IFEQ      6
061200011008     C     Z80           CAT       WAPO:1        Z80
061300011008     C                   CAT       Wkvittext:0   Z80
061400011008     C     Z80           CAT       WAPO:0        Z80
061500011008
061600011008     C                   MOVEA     Z80           Arr(Y)
061700011008     C                   EVAL      Y = Y + 35
061800011008     C                   MOVEA     Newline       Arr(Y)
061900011008     C                   EVAL      Y = Y + 1
062000011008     C                   ADD       1             V
062100011008     C                   ELSE
062200011008      *
062300011008      *                    7:e BT = Biografens namn
062400011008      *
062500011008     C     V             IFEQ      7
062600011008     C     Z80           CAT       WAPO:1        Z80
062700011008     C     Z80           CAT       FSNMN:0       Z80
062800011008     C     Z80           CAT       WAPO:0        Z80
062900011008
063000011008     C                   MOVEA     Z80           Arr(Y)
063100011008     C                   EVAL      Y = Y + 40
063200011008     C                   MOVEA     Newline       Arr(Y)
063300011008     C                   EVAL      Y = Y + 1
063400011008     C                   ADD       1             V
063500011008     C                   ELSE
063600011008      *
063700011008      *                    8:a BT = 18/3
063800011008      *
063900011008     C     V             IFEQ      8
064000011008     C     Z80           CAT       WAPO:1        Z80
064100011008     **
064200011008     **                    Dag
064300011008     **
064400011008     C                   MOVEL     RDDD          WDD02
064500011008     **
064600011008     **                    Månad
064700011008     **
064800011008     C                   MOVEL     RDMM          WMM02
064900011008     C     WA1(1)        IFEQ      '0'
065000011008     C                   MOVEL     WA1(2)        WA1(1)
065100011008     C                   MOVE      *BLANK        WA1(2)
065200011008     C                   END
065300011008     C     WD02          IFEQ      '0'
065400011008     C                   MOVE      *BLANKS       WD02
065500011008     C                   END
065600011008     C                   MOVEL     WSNED         WSNE02
065700011008      *
065800011008     C     Z80           CAT       ZTXT02:0      Z80
065900011008     C     Z80           CAT       WAPO:0        Z80
066000011008
066100011008     C                   MOVEA     Z80           Arr(Y)
066200011008     C                   EVAL      Y = Y + 10
066300011008     C                   MOVEA     Newline       Arr(Y)
066400011008     C                   EVAL      Y = Y + 1
066500011008
066600011008     C                   ADD       1             V
066700011008     C                   ELSE
066800011008      *
066900011008      *                    9:a BT = Datum ex. 980514
067000011008      *
067100011008     C     V             IFEQ      9
067200011008     C     Z80           CAT       WAPO:1        Z80
067300011008     C     Z80           CAT       RDDATA:0      Z80
067400011008     C     Z80           CAT       WAPO:0        Z80
067500011008
067600011008     C                   MOVEA     Z80           Arr(Y)
067700011008     C                   EVAL      Y = Y + 12
067800011008     C                   MOVEA     Newline       Arr(Y)
067900011008     C                   EVAL      Y = Y + 1
068000011008
068100011008     C                   ADD       1             V
068200011008     C                   ELSE
068300011008      *
068400011008      *                    10:a BT = Kioskartiklar
068500011008      *
068600011008     C     V             IFEQ      10
068700011008     C     Z80           CAT       WAPO:1        Z80
068800011008      **   Z80           CAT       Wkiosktext:0  Z80
068900011008     C                   CAT       Goorsk:0      Z80
069000011008     C     Z80           CAT       WAPO:0        Z80
069100011008
069200011008     C                   MOVEA     Z80           Arr(Y)
069300011008     C                   EVAL      Y = Y + 90
069400011008     C                   MOVEA     Newline       Arr(Y)
069500011008     C                   EVAL      Y = Y + 1
069600011008
069700011008     C                   ADD       1             V
069800011008     C                   ELSE
069900011008      *
070000011008      *                    11:a BT = Tid
070100011008      *
070200011008     C     V             IFEQ      11
070300011008     C     Z80           CAT       WAPO:1        Z80
070400011008     **
070500011008     **                    Om efter 24 står tiden 25,26 etc
070600011008     **
070700011008     C     WRDTID        IFGE      2401
070800011008     C                   SUB       2400          WRDTID
070900011008     C                   END
071000011008      *
071100011008     C                   MOVEL     RDTTT         WTTA07
071200011008     C                   MOVE      WKOLON        WKLA07
071300011008     C                   MOVEL     RDTMM         WMMA07
071400011008     **
071500011008     **                    Om det är en salong som man säljer till där
071600011008     **                    tiden är ointressant så står det EJTID i pos
071700011008      *
071800011008     C     Z80           CAT       Wtidalfa:0    Z80
071900011008     C     Z80           CAT       WAPO:0        Z80
072000011008
072100011008     C                   MOVEA     Z80           Arr(Y)
072200011008     C                   EVAL      Y = Y + 10
072300011008     C                   MOVEA     Newline       Arr(Y)
072400011008     C                   EVAL      Y = Y + 1
072500011008
072600011008     C                   ADD       1             V
072700011008     C                   ELSE
072800011008      *
072900011008      *                    12:a BT = Samma tid som i 5:an
073000011008      *
073100011008     C     V             IFEQ      12
073200011008      *
073300011008     C     Z80           CAT       WAPO:1        Z80
073400011008     C     Z80           CAT       Wtidalfa:0    Z80
073500011008     C     Z80           CAT       WAPO:0        Z80
073600011008
073700011008     C                   MOVEA     Z80           Arr(Y)
073800011008     C                   EVAL      Y = Y + 10
073900011008     C                   MOVEA     Newline       Arr(Y)
074000011008     C                   EVAL      Y = Y + 1
074100011008
074200011008     C                   ADD       1             V
074300011008     C                   ELSE
074400011008      *
074500011008      *                    13:e BT = Kiosk
074600011008      *
074700011008     C     V             IFEQ      13
074800011008     C     Z80           CAT       WAPO:1        Z80
074900011008     C     Z80           CAT       Wkiosk:0      Z80
075000011008     C     Z80           CAT       WAPO:0        Z80
075100011008
075200011008     C                   MOVEA     Z80           Arr(Y)
075300011008     C                   EVAL      Y = Y + 10
075400011008     C                   MOVEA     Newline       Arr(Y)
075500011008     C                   EVAL      Y = Y + 1
075600011008
075700011008     C                   ADD       1             V
075800011008     C                   ELSE
075900011008      *
076000011008      *                    14:e BT = Ordinarie priset
076100011008      *
076200011008     C     V             IFEQ      14
076300011008     C                   CAT       WAPO:1        Z80
076400011008      *
076500011008      *                    Betalt pris (summa)
076600011008      *
076700011008     C                   EVAL      Wsumma = Wsumma * -1
076800160419     C                   MOVEL     Wsumma        Wsumma7
076900160419     C                   MOVE      Wsumma7       WFem
077000160419     C                   MOVEL     Wsumma        WNioBelopp        9
077100011008      *
077200011008     C                   EVAL      Ww = 1
077300011008     C                   DOW       Ww < 5
077400011008     C     W5(WW)        IFGE      '0'
077500011008     C     W5(WW)        IFEQ      '0'
077600011008     C                   MOVE      *BLANK        W5(WW)
077700011008     C                   ELSE
077800011008     C                   Z-ADD     9             Ww
077900011008     C                   ENDIF
078000011008     C                   ENDIF
078100011008     C                   EVAL      Ww = WW + 1
078200011008     C                   ENDDO
078300011008     C                   CAT       Wfem:0        Z80
078400011008     C                   CAT       WAPO:0        Z80
078500011008
078600011008     C                   MOVEA     Z80           Arr(Y)
078700011008     C                   EVAL      Y = Y + 16
078800011008     C                   MOVEA     Newline       Arr(Y)
078900011008     C                   EVAL      Y = Y + 1
079000011008
079100011008     C                   ADD       1             V
079200011008     C                   EVAL      Wsumma = Wsumma * -1
079300011008     C                   ELSE
079400011008      *
079500011008      *                    15:e BT = byt ut Antalet mot punkt
079600011008
079700011008     C     V             IFEQ      15
079800011008     C     Z80           CAT       WAPO:1        Z80
079900011008     C     Z80           CAT       Wpunkt:0      Z80
080000011008     C     Z80           CAT       WAPO:0        Z80
080100011008
080200011008     C                   MOVEA     Z80           Arr(Y)
080300011008     C                   EVAL      Y = Y + 6
080400011008     C                   MOVEA     Newline       Arr(Y)
080500011008     C                   EVAL      Y = Y + 1
080600011008
080700011008     C                   ADD       1             V
080800011008     C                   ELSE
080900011008      *
081000011008      *                    16:e BT = byt ut WKORTNR" mot giltigt
081100011008
081200011008     C     V             IFEQ      16
081300011008     C     Z80           CAT       WAPO:1        Z80
081400011008     C     Z80           CAT       Wansttext:0   Z80
081500011008     C     Z80           CAT       WAPO:0        Z80
081600011008
081700011008     C                   MOVEA     Z80           Arr(Y)
081800011008     C                   EVAL      Y = Y + 12
081900011008     C                   MOVEA     Newline       Arr(Y)
082000011008     C                   EVAL      Y = Y + 1
082100011008
082200011008     C                   ADD       1             V
082300011008     C                   ELSE
082400011008      *
082500011008      *                    17:e BT = Anställningsnr och namn
082600011008      *
082700011008     C     V             IFEQ      17
082800011008     C                   CAT       WAPO:1        Z80
082900011008     C                   MOVEL     Wfkass        WFem
083000011008      *
083100011008     C                   EVAL      Ww = 1
083200011008     C                   DOW       Ww < 5
083300011008     C     W5(WW)        IFGE      '0'
083400011008     C     W5(WW)        IFEQ      '0'
083500011008     C                   MOVE      *BLANK        W5(WW)
083600011008     C                   ELSE
083700011008     C                   Z-ADD     9             Ww
083800011008     C                   ENDIF
083900011008     C                   ENDIF
084000011008     C                   EVAL      Ww = WW + 1
084100011008     C                   ENDDO
084200080910     C                   MOVEL     WFem          WFemKass          5
084300011008     C                   CAT       Wfem:0        Z80
084400160530     C                   MOVE      *BLANKS       PwNamn
084500011008     C                   CAT       PWNAMN:2      Z80
084600011008     C                   CAT       WAPO:0        Z80
084700011008
084800011008     C                   CAT       WAPO:0        Z80
084900011008     C                   MOVEA     Z80           Arr(Y)
085000011008     C                   EVAL      Y = Y + 30
085100011008
085200011008     C                   MOVEA     Newline       Arr(Y)
085300011008     C                   EVAL      Y = Y + 1
085400011008      *
085500011008     C                   ADD       1             V
085600011008     C                   ELSE
085700011008      *
085800011008      *                    Om PT-post med konstant skriv bara
085900011008      *
086000011008     C                   MOVEL     WFR           Z80
086100011008
086200011008     C                   MOVEA     Z80           Arr(Y)
086300011008     C                   EVAL      Y = Y + 40
086400011008     C                   MOVEA     Newline       Arr(Y)
086500011008     C                   EVAL      Y = Y + 1
086600011008     C                   ADD       1             V
086700011008      *
086800011008     C                   END
086900011008     C                   END
087000011008     C                   END
087100011008     C                   END
087200011008     C                   END
087300011008     C                   END
087400011008     C                   END
087500011008     C                   END
087600011008     C                   END
087700011008     C                   END
087800011008     C                   END
087900011008     C                   END
088000011008     C                   END
088100011008     C                   END
088200011008     C                   END
088300011008     C                   ELSE
088400011008      *
088500011008      *                    Om EJ BT-post skriv bara raden rakt av
088600011008      *
088700011008     C                   MOVEL     WFR           Z80
088800011008
088900011008     C                   MOVEA     Z80           Arr(Y)
089000011008     C                   EVAL      Y = Y + 33
089100011008     C                   MOVEA     Newline       Arr(Y)
089200011008     C                   EVAL      Y = Y + 1
089300011008     C                   END
089400011008      *
089500011008     C                   ADD       1             INDEX
089600011008     C                   END
089700080910
089800080910     C*
089900080910     C**---------------------------------------------------------------
090000080910     C* B. Ström 2008-09-10 Lägg ut skrivarinfo för nya skrivaren
090100080910     C**---------------------------------------------------------------
090200080910     C*
090300080910     C                   Movea     *Blanks       Arrn
090400080910     C* Lägg ut tag för att nu kommer nya skrivarinformationen
090500080910     C                   Eval      Yn = 1
090600080910     C                   Movea     Wsemi         Arrn(Yn)
090700080910     C                   Eval      Yn = Yn + 1
090800080910
090900080910     C* Lägg ut data som skall skrivas på kvittot enligt Object attribute
091000080910
091100080910     C* Private String theatreInfo;
091200080910     C                   Movea     FsNmn         Arrn(Yn)
091300080910     C                   Eval      Yn = Yn + 30
091400080910     C                   Movea     Wsemi         Arrn(Yn)
091500080910     C                   Eval      Yn = Yn + 1
091600080910
091700080910     C* Private String dayMonthDate;
091800080910     C                   Movea     ZTxt02        Arrn(Yn)
091900080910     C                   Eval      Yn = Yn + 5
092000080910     C                   Movea     Wsemi         Arrn(Yn)
092100080910     C                   Eval      Yn = Yn + 1
092200080910
092300080910     C* Private String yymmddDate;
092400080910     C                   Movea     RdData        Arrn(Yn)
092500080910     C                   Eval      Yn = Yn + 6
092600080910     C                   Movea     Wsemi         Arrn(Yn)
092700080910     C                   Eval      Yn = Yn + 1
092800080910
092900080910     C* Private String soldTime;
093000080910     C                   Movea     WTidAlfa      Arrn(Yn)
093100080910     C                   Eval      Yn = Yn + 7
093200080910     C                   Movea     Wsemi         Arrn(Yn)
093300080910     C                   Eval      Yn = Yn + 1
093400080910
093500080910     C* Private String paidPrice;
093600160419     C                   Movea     WnioBelopp    Arrn(Yn)
093700160419     C                   Eval      Yn = Yn + 9
093800080910     C                   Movea     Wsemi         Arrn(Yn)
093900080910     C                   Eval      Yn = Yn + 1
094000080910
094100080910     C* Private String cardOrEmployeeNr;
094200080910      * Anställningsnummer
094300080910     C                   Movea     Wansttext     Arrn(Yn)
094400080910     C                   Eval      Yn = Yn + 8
094500080910     C                   Movea     WFemKass      Arrn(Yn)
094600080910     C                   Eval      Yn = Yn + 6
094700160530     C                   MOVE      *BLANKS       PwNamn
094800080910     C                   Movea     PwNamn        Arrn(Yn)
094900080910     C                   Eval      Yn = Yn + 30
095000080910     C                   Movea     Wsemi         Arrn(Yn)
095100080910     C                   Eval      Yn = Yn + 1
095200080910
095300080910     C* Private String reason
095400080910     C                   Movel     GoOrsk        WrGoOrsk         40
095500080910     C                   Movea     WrGoOrsk      Arrn(Yn)
095600080910     C                   Eval      Yn = Yn + 40
095700080910     C                   Movea     Wsemi         Arrn(Yn)
095800080910     C                   Eval      Yn = Yn + 1
095900080910
096000080910     C* Slå ihop strängen för nya skrivaren med vanliga svarssträngen
096100080910-    C     Yn            Ifne      0
096200080910--   C     1             Do        Yn            Yx
096300080910---  C     Y             Iflt      30000
096400080910     C                   Eval      Y = Y + 1
096500080910     C                   Movel     Arrn(Yx)      Arr(Y)
096600080910---  C                   EndIf
096700080910--   C                   EndDo
096800080910-    C                   EndIf
096900080910     C*
097000011008     C                   ENDSR
097100090219     C**********************************************************************
097200090219     C*    *InzSr  Anropas vi progamladdning                              **
097300090219     C*----------------------------------------------------------------   **
097400090219     CSr   *inzsr        Begsr
097500090219     C*                                                                   **
097600090219
097700090911     C* Flytta in språkunika skiljetecken
097800090911     C/copy qrpglesrc,FR9050CPY
097900090911     C                   Movel     xyzFyrkant    NewLine
098000090911     C                   Movel     xyzSemiKolon  Wsemi
098100090911
098200090219     C* Hämta språkunika texter enligt hittad försäljningskonto
098300090219     C                   Exsr      Srlanguage
098400090219
098500090219     CSr                 Endsr
098600090219     C**********************************************************************
098700090219     C*    SrLanguage Hämta text via språkkoden på biografens ägare       **
098800090219     C*----------------------------------------------------------------   **
098900090219     CSr   SrLanguage    Begsr
099000090219
099100090219     C                   Eval      WrPrmSystem  = 'I-Series'
099200090219     C                   Eval      WrPrmModul   = 'FR1030'
099300090219
099400090219     C                   Eval      wtxtcde   = '000001'
099500090219     C                   if        Sys99Text(WrPrmA100:WrPrmSystem:
099600090219     C                                       WrPrmModul:wtxtcde) = *off
099700090219     C                   eval      Wkiosk    = %subst(WrPrmA100:3)
099800090219     C                   Endif
099900090219
100000090219     C                   Eval      wtxtcde   = '000002'
100100090219     C                   Eval      WrPrmA100 = *blank
100200090219     C                   if        Sys99Text(WrPrmA100:WrPrmSystem:
100300090219     C                                       WrPrmModul:wtxtcde) = *off
100400090219     C                   eval      Wkiosktext = %subst(WrPrmA100:3)
100500090219     C                   Endif
100600090219
100700090219     C                   Eval      wtxtcde   = '000003'
100800090219     C                   Eval      WrPrmA100 = *blank
100900090219     C                   if        Sys99Text(WrPrmA100:WrPrmSystem:
101000090219     C                                       WrPrmModul:wtxtcde) = *off
101100090219     C                   eval      Wkvittext = %subst(WrPrmA100:3)
101200090219     C                   Endif
101300090219
101400090219     C                   Eval      wtxtcde   = '000004'
101500090219     C                   Eval      WrPrmA100 = *blank
101600090219     C                   if        Sys99Text(WrPrmA100:WrPrmSystem:
101700090219     C                                       WrPrmModul:wtxtcde) = *off
101800090219     C                   eval      Wpristext = %subst(WrPrmA100:3)
101900090219     C                   Endif
102000090219
102100090219     C                   Eval      wtxtcde   = '000005'
102200090219     C                   Eval      WrPrmA100 = *blank
102300090219     C                   if        Sys99Text(WrPrmA100:WrPrmSystem:
102400090219     C                                       WrPrmModul:wtxtcde) = *off
102500090219     C                   eval      Wansttext = %subst(WrPrmA100:3)
102600090219     C                   Endif
102700090311      * Hämta modulid
102800090311     C                   eval      wname = 'SFBILJFR'
102900170314     C     keymoduleak1  Chain     moduleak2
103000090311     C                   if        %found
103100090311     C                   eval      wmoduleid = moduleid
103200090311     C                   endif
103300090219
103400090219     CSr                 Endsr
103500011008      *
