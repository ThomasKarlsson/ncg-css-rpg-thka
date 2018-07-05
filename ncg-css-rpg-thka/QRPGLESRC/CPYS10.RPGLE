000100170126        //****************************************************************
000101170126        //
000102170126        // Member CPYS10 from ILESRC
000103170126        //
000104170126        // Prototype for function EdtChrNbr - Edit character coded number
000105170126        //
000106170126        //****************************************************************
000107170126        // EdtChrNbr prototype - edit a character into a number
000108170126        Dcl-pr EdtChrNbr ind;
000109170126          CharNbr varchar(100);
000110170126          DecPos packed(3 : 0) Value;
000111170126          EditedNbr varchar(100);
000112170126        end-pr;
