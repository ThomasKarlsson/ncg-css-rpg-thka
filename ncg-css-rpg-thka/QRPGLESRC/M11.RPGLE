000100170126        //****************************************************************
000101170126        //
000102170126        // Member M11 from ILESRC
000103170126        //
000104170126        // Module M11 - Edit character coded number
000105170126        // Contains one procedure - EdtChrNbr
000106170126        //
000107170126        //****************************************************************
000108170126        ctl-opt Nomain;
000109170126        //================================================================
000110170126        // EdtChrNbr - Edit character coded number
000111170126        //================================================================
000112170126        //----------------------------------------------------------------
000113170126        // Procedure prototypes
000114170126        //----------------------------------------------------------------
000115170126        /Copy qrpglesrc,CpyS10
000116170126        /Copy qrpglesrc,CpyS11
000117170126        //----------------------------------------------------------------
000118170126        // Procedure definition
000119170126        //----------------------------------------------------------------
000120170126        dcl-Proc EdtChrNbr EXPORT;
000121170126
000122170126        Dcl-pi EdtChrNbr ind;
000123170126          CharNbr varchar(100);
000124170126          DecPos packed(3 : 0) Value;
000125170126          EditedNbr varchar(100);
000126170126        end-pi;
000127170126        //----------------------------------------------------------------
000128170126        // Local data definitions
000129170126        //----------------------------------------------------------------
000130170126        Dcl-s Pos packed(3 : 0);
000131170126        Dcl-s Number packed(15 : 0);
000132170126        // Check if the characters contain all digits or blanks
000133170126
000134170126        If NonDigit(CharNbr : Pos);
000136170126        // If not all digits or blanks - Return *On (error)
000138170126          Return *On;
000140170126        EndIf;
000141170126
000142170126        // Else (all digits or blanks) - Convert characters to a number
000143170126
000144170126        Number = %dec(CharNbr : 15 : 0);
000145170126
000146170126        // Edit the number with requested decimal positions (edit code 3)
000147170126
000148170126        EditedNbr = DynEdit(Number : DecPos);
000149170126
000150170126        // Return *Off (OK)
000151170126
000152170126        Return *Off;
000153170126
000154170126        end-Proc EdtChrNbr;
