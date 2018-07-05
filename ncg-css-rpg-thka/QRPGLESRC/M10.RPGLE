000100170126        //****************************************************************
000101170126        //
000102170126        // Member M10 from ILESRC
000103170126        //
000104170126        // Module M10 - Entering character coded numbers and edit them
000105170126        // with requested decimal positions on the screen
000106170126        //
000107170126        //****************************************************************
000108170126        ctl-opt main(mainPgm);
000109170126        //================================================================
000110170126        // File description - Display file
000111170126        //================================================================
000112170126        dcl-F CHRNUMW WorkStn;
000113170126        //================================================================
000114170126        // Data definitions
000115170126        //================================================================
000116170126        Dcl-s EditNbr varchar(100);
000117170126        Dcl-s RC ind;
000118170126        Dcl-s CharNbr varchar(100);
000119170126        // Called procedure prototypes
000120170126        /Copy qrpglesrc,CpyS10
000121170126
000122170126        dcl-pr mainPgm extpgm('S123');
000123170126        end-Pr;
000124170126
000125170126        //================================================================
000126170126        // Mainline program
000127170126        //================================================================
000128170126
000129170126        dcl-proc mainPgm;
000130170126        // Process display file
000131170126        DoW 1 = 1;
000132170126          // Show the first format to enter a character number
000133170126          // and requested decimal positions to edit
000134170126          ExFmt CHRNUMWR;
000135170126          If *In03;
000136170126            Leave;
000137170126          EndIf;
000138170126          // Edit the character coded number with requested decimal positions
000139170126          CharNbr = %trim(CHRNBR);
000140170126          RC = EdtChrNbr(CharNbr: DecPos: EditNbr);
000141170126          // If error - Supply all blanks
000142170126          If RC;
000143170126            EDTNBR = *Blanks;
000144170126          Else;
000145170126          // Else (OK) - Trim trailing blanks and shift right
000146170126            EvalR EDTNBR = %TrimR(EditNbr);
000147170126          EndIf;
000148170126          // Show the result on the second screen format
000149170126          ExFmt CHRNUMWR2;
000150170126          If *In03;
000151170126           Leave;
000152170126          EndIf;
000153170126
000154170126        EndDo; // End do while forever
000155170126
000156170126        end-Proc;
