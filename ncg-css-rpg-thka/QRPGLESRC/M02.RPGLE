000100170126      //****************************************************************
000101170126      //
000102170126      // Member M02 from ILESRC
000103170126      //
000104170126      // Module M02 - function call to module M02A
000105170126      //
000106170126      //****************************************************************
000107170126              ctl-opt main(mainPgm);
000108170126
000109170126              dcl-pr mainPgm extpgm('P02');
000110170126              end-Pr;
000111170126
000112170126              // Data definitions
000113170126
000114170126              Dcl-s NonDigTxt char(30) Inz('Non-digit in position');
000115170126              Dcl-s AllDigits char(30) Inz('All digits in string');
000116170126
000117170126              // Prototype for procedure NonDigit
000118170126              /COPY QRPGLESRC,CPYM02A
000119170126
000120170126              // Main procedure
000121170126
000122170126              dcl-proc mainPgm;
000123170126
000124170126              dcl-pi mainPgm;
000125170126              end-Pi;
000126170126
000127170126              // Local variables
000128170126
000129170126              Dcl-s String varchar(100) Inz('111*1');
000130170126              Dcl-s Position packed(3 : 0) Inz(1);
000131170126
000132170126              If NonDigit(String : Position);
000133170126                Dsply (NonDigTxt + ' ' + %char(Position));
000134170126              Else;
000135170126                Dsply AllDigits;
000136170126              EndIf;
000137170126
000138170126              *InLR = *On;
000139170126
000140170126              end-Proc;
