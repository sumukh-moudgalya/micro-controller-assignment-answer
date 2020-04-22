ORG 0000H;                              SETTING THE ORIGIN

SQUARE EQU P1.5;                        SETTING THE OUTPUT PIN AS VARIABLE SQUARE

MOV TMOD,#01H;                          CHOOSING THE MODE 1 AND TIMER 0

LOOP1:

SETB SQUARE;                            LOGIC HIGH 

ACALL DELAY;                            CALLING DELAY OF 5ms

CLR SQUARE;                             LOGIC LOW

ACALL DELAY;                            CALLING DELAY OF 5ms

SJMP LOOP1;                             REPEATING THE PROCESS FOR CONTINOUS WAVE


DELAY:;                                 DEFINING THE SUBROUTINE DELAY

SETB TR0;                               CHOOSING TIMER 0

MOV TL0,#00H;                           SETTING THE VALUE OF TL0 OF TIMER 0 TO 0

MOV TH0,#0EEH;                          SETTING THE VALUE OF TH0 OF TIMER 0 TO EE

LOOP2:

JNB TF0,LOOP2;                          JUMP IF THE BIT IS NOT SET TO LOOP2

CLR TR0;                                DESELECTING THE TIMER 0

CLR TF0;                                CLEARING OVERFLOW BIT OF TFO FOR FURTHER USE

RET;                                    RETURN TO THE FUNC CALL

END;
