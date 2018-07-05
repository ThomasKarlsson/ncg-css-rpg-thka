000100170126        //****************************************************************
000101170126        //
000102170126        // Member M11A from ILESRC
000103170126        //
000104170126        // Module M11A - Dynamic editing
000105170126        // Contains one subprocedure - DynEdit
000106170126        //
000107170126        //****************************************************************
000108170126        ctl-opt nomain;
000109170126        //----------------------------------------------------------------
000110170126        // Procedure prototypes
000111170126        //----------------------------------------------------------------
000112170126        /Copy qrpglesrc,CpyS11
000113170126        //----------------------------------------------------------------
000114170126        // Procedure definition
000115170126        //----------------------------------------------------------------
000116170126        dcl-Proc DynEdit EXPORT;
000117170126        //----------------------------------------------------------------
000118170126        // Procedure interface
000119170126        //----------------------------------------------------------------
000120170126        Dcl-pi DynEdit varchar(100);
000121170126          Number packed(15 : 0) Value;
000122170126          DecPos packed(3 : 0) Value;
000123170126        end-Pi;
000124170126        //----------------------------------------------------------------
000125170126        // Local data definitions
000126170126        //----------------------------------------------------------------
000127170126        Dcl-s EdtNbr varchar(100);
000128170126        Dcl-s WorkNbr packed(30 : 15);
000129170126        Dcl-s Correction packed(1 : 0);
000130170126        Dcl-s Pos packed(3 : 0);
000131170126
000132170126        // If requested decimal positions are 0 - the correction is -1// If
000133170126        If DecPos = 0;
000134170126          Correction = -1;
000135170126        // If requested decimal positions are > 0 - the correction is 0
000136170126        Else;
000137170126          Correction = 0;
000138170126        EndIf;
000139170126
000140170126        // Shift the (15 0) input number right by requested decimal places
000141170126        // (if decimal places are positive or zero) and place it to
000142170126        // (30 15) work variable. E.g. DecPos = 2:
000143170126        // 1 1 2 3
000144170126        // 1...5....0....5 1...5....0....5....0....5....0
000145170126        // 111111111111111 ==> 001111111111111110000000000000
000146170126
000147170126        WorkNbr = Number * 10 ** -DecPos;
000148170126
000149170126        // Edit the work number with edit code 3 and place the result
000150170126        // in the varying length character variable:
000151170126        // ' 1111111111111.110000000000000'
000152170126
000153170126        EdtNbr = %Editc(WorkNbr :'3');
000154170126
000155170126        // Extract the edited number without trailing digits:
000156170126        // Text from position 1 to the end, minus 15,
000157170126        // plus dec.positions,
000158170126        // ' 1111111111111.11' plus correction
000159170126
000160170126        EdtNbr = %Subst(EdtNbr : 1 :
000161170126                 %Len(EdtNbr) -15 + DecPos
000162170126                                  + Correction );
000163170126
000164170126        // Return the edited number as a varying character variable
000165170126
000166170126        Return EdtNbr;
000167170126        end-proc DynEdit;
