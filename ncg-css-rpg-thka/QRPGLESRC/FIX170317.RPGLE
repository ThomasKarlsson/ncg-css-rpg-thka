000100041019      /TITLE Rensar KortVer
000200031229     H DATEDIT(*YMD) OPTION(*NODEBUGIO)
000300100601
000400170317     Di                S              3  0
000500170317     Dj                S              3  0
000600170317     DWordCnt          S              3  0
000700170317     DWordIncr         S              3  0
000800170317     DSentence         S             50
000900170317     DWORD             S             50    DIM(50)
001000170317
001100170317      /free
001200170317       WordCnt = 0;
001300170317       Sentence = 'En mening med fem ord';
001400170317
001401170317       // i = 1 initiera i till 1
001402170317       // WordIncr används först vid endfor statementet
001403170317       // till blir i detta fall längden på fältet sentence
001404170317
001405170317       // Vid endfor adderas det till i spelar alltså ingen roll
001406170317       // att WrdIncr är noll första gången
001407170317
001408170317       // Syntax FOR
001409170317
001410170317       // For i = 1             sätter startvärde till 1
001411170317       // by  WordIncr          ökar index med värdet i WordIncr
001412170317       // to  %len (Sentence)   till index är lika med längden på fältet Sentenc
001413170317       // DOWNTO                man kan också räkna ner till ett värde
001414170317
001500170317       for i = 1 by WordIncr to %len (Sentence);
001600170317         // Is there a blank?
001700170317         if %subst(Sentence: i: 1) = ' ';
001800170317            WordIncr = 1;
001900170317            iter;
002000170317         endif;
002100170317
002200170317         // We've found a word - determine its length:
002300170317         for j = i+1 to %len(Sentence);
002400170317            if %subst (Sentence: j: 1) = ' ';
002500170317               leave;
002600170317            endif;
002700170317         endfor;
002800170317
002900170317           // Store the word:
003000170317           WordIncr = j - i;
003100170317           WordCnt = WordCnt + 1;
003200170317         Word (WordCnt) = %subst (Sentence: i: WordIncr);
003300170317       endfor;
003400170317
003500170317      /end-free
003600170317
003700170317
003800170317
003900170317
004000170317
004100170317
004200170317
004300170317
004400170317
004500170317
004600170317
004700170317
004800170317
004900170317
005000170317
005100170317
005200170317
005300170317
005400170317
005500940922     C                   SETON                                        LR
005600940922     C                   RETURN
005700100601
