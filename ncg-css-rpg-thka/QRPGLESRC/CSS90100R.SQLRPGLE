000100161215     H NOMAIN OPTION(*NODEBUGIO) PGMINFO(*PCML:*MODULE)
000200160617
000300161215      /INCLUDE qrpglesrc,CSS90100P // Modulens eget gränssnitt
000400160617      *--------------------------------------------------------------------*
000500161215      *   List verifications for submitted date                            *
000600160617      *--------------------------------------------------------------------*
000906161215     D OutPutrow       DS                  QUALIFIED INZ
000907161215     D VerNo                          8S 0
000908161215     D VerText                       40A
000914161215
000915161215     P VerList         B                   EXPORT
000916161215
000917161215     D VerList         PI
000918161215     D  Date                          8S 0 const
000919161215     D  rtnCount                     10I 0
000920161215     D  rtnList                            LIKEDS(OutPutRow)  DIM(9999)
000921161215
001300161215      /free
001301161215
001302161215       rtnCount = 0;
001303161215
001304161215       exec SQL declare C1 cursor for
001305161215         select ACVONO, ACVTXT
001306161215         from SVFCR040
001307161215         where acacdt = :Date
001308161215           and acvser in ('BLJ', 'GOD')
001309161215         group by ACVONO, ACVTXT Order by ACVONO;
001310161215
001311161215       exec SQL open C1;
001312161215
001313161215       exec SQL fetch next from C1 into :OutPutrow;
001314161215
001315161215       dow sqlstt='00000' or %subst(sqlstt:1:2)='01';
001316161215         rtnCount = rtnCount + 1;
001317161215         rtnList(rtnCount) = OutPutrow;
001318161215
001319161215         exec SQL fetch next from C1 into :OutPutrow;
001320161215       enddo;
001321161215
001322161215       exec SQL close C1;
001700160617
001701161215       *INLR = *ON;
001703161215
001704161215      /end-free
001705161215
001800161215     P VerList         E
001900160617      /EJECT
001901161215
001903161215
001904161215
001905161215
