000100170126       //*********************************************************************
000101170126        //
000102170126        // Member M02A from ILESRC
000103170126        //
000104170126        // Module M02A - function NonDigit
000105170126        //
000106170126        //*********************************************************************
000107170126
000108170126        ctl-opt nomain;
000109170126
000110170126        // Procedure prototype
000111170126        /COPY QRPGLESRC,CPYM02A
000112170126
000113170126        // Procedure definition
000114170126
000115170126        dcl-Proc NonDigit EXPORT;
000116170126
000117170126        // Procedure interface (must match the prototype)
000118170126
000119170126        Dcl-pi NonDigit ind;
000120170126        String varchar(100) value;
000121170126        Position packed(3 : 0);
000122170126        end-Pi;
000123170126
000124170126        //Dump;
000125170126
000126170126        Position = %check('0123456789' : String : 1);
000127170126        if position = 0;
000128170126          return *off;
000129170126        else;
000130170126          return *on;
000131170126        endIf;
000132170126
000133170126        end-Proc NonDigit;
