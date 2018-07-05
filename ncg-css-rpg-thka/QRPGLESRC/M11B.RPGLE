000100170126        //****************************************************************
000101170126        //
000102170126        // Member M11B from ILESRC
000103170126        //
000104170126        // Module M11B - Test for nondigit character
000105170126        // Contains one procedure - NonDigit
000106170126        //
000107170126        //****************************************************************
000108170126        ctl-opt Nomain;
000109170126        //================================================================
000110170126        // NonDigit - Checks if the input character variable contains
000111170126        // a non-digit (or nonblank) character.
000112170126        // If yes, returns error code *On and replaces
000113170126        // the input variable with all zero characters.
000114170126        // If not, returns positive code *Off replaces
000115170126        // all blanks by zeros.
000116170126        //
000117170126        //================================================================
000118170126        //----------------------------------------------------------------
000119170126        // Procedure prototypes
000120170126        //----------------------------------------------------------------
000121170126        /Copy qrpglesrc,CpyS11
000122170126        //----------------------------------------------------------------
000123170126        // Procedure definition
000124170126        //----------------------------------------------------------------
000125170126        dcl-Proc NonDigit EXPORT;
000126170126        // Procedure interface (must match the prototype)
000127170126        Dcl-pi NonDigit ind;
000128170126          String varchar(100) value;
000129170126          Position packed(3 : 0);
000130170126        end-Pi;
000131170126        //----------------------------------------------------------------
000132170126        // No local data definitions
000133170126        //----------------------------------------------------------------
000134170126        // Check if invalid character is found in the string
000135170126        // (other than a digit or blank)
000136170126
000137170126        Position = %check(' 0123456789' : String : 1);
000138170126
000139170126        // If found replace the input string with all zero digits
000140170126        // Return *On if invalid character found, *Off if not found
000141170126
000142170126        if position <> 0;
000143170126          String = *All'0';
000144170126          return *on;
000145170126        else;
000146170126        // If all digits or blanks - Replace blanks by zeros
000147170126          String = %xlate(' ' : '0' : String);
000148170126          return *off;
000149170126        endIf;
000150170126
000151170126        end-Proc NonDigit;
000152170126
