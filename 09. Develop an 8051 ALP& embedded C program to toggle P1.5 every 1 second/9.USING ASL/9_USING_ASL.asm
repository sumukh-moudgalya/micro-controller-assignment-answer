ORG 0000H;                          SETTING THE ORIGIN

SQUARE EQU P1.5;                    SETTING THE OUTPUT PIN AS VARIABLE SQUARE

MOV TMOD,#10H;                      CHOOSING THE MODE 1 AND TIMER 0

LOOP1:

SETB SQUARE;                        LOGIC HIGH 

ACALL LOOP_200;                     CALLING DELAY OF 1s

CLR SQUARE;                         LOGIC LOW

ACALL LOOP_200;                     CALLING DELAY OF 1s

JMP LOOP1;                          REPEATING THE PROCESS FOR CONTINOUS WAVE


LOOP_200:

MOV R0,#28d;                        to repeat the process to get 1 sec delay

LOOP2:

ACALL DELAY;                         calling delay func

DJNZ R0,LOOP2;

RET;

DELAY:;                             defining subroutine delay

SETB TR1;                           CHOOSING TIMER 1

MOV TL1,#0H;                        SETTING THE VALUE OF TL1 OF TIMER 1 TO 0

MOV TH1,#00H;                       SETTING THE VALUE OF TH1 OF TIMER 1 TO 0

LOOP3:
JNB TF1,LOOP3;                      JUMP IF THE BIT IS NOT SET TO LOOP3

CLR TF1;                            CLEARING OVERFLOW BIT OF TFO FOR FURTHER USE

CLR TR1;                            DESELECTING THE TIMER 0

RET;

END; 
