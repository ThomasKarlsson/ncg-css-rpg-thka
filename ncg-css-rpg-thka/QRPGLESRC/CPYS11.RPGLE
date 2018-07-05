000100170126        //****************************************************************
000101170126        //
000102170126        // Member CPYS11 from ILESRC
000103170126        //
000104170126        // Prototypes for functions: DynEdit - Dynamic editing
000105170126        // NonDigit - Check for non-digit
000106170126        // characters in a string
000107170126        //****************************************************************
000108170126        // Prototype for function DynEdit - Dynamic editing
000109170126        Dcl-pr DynEdit varchar(100);
000110170126          Number packed(15 : 0) Value;
000111170126          DecPos packed(3 : 0) Value;
000112170126        end-Pr;
000113170126        // Prototype for function NonDigit - Check for non-digit
000114170126        // characters in a string
000115170126        Dcl-pr NonDigit ind;
000116170126          String varchar(100) value;
000117170126          Position packed(3 : 0);
000118170126        end-Pr;
