ORG 0000H;                    SELECTING THE PROGRAM ORIGIN

JMP MAIN;                     JUMP TO MAIN

ORG 000BH;                    ORIGIN FOR INTERUPT CODE

CPL P1.3;                     COMPLEMENT THE VALUE OF BIT P1.3

RETI;

ORG 40H;                      SELCTING THE ADDRESS FOR WRTING THE PROGRAM

MAIN:

MOV TMOD,#02H;                SELECTING TIMER 0 IN MODE 2

MOV IE,#82H;                  ENABLE TIMER 0 INTERRUPT

MOV TH0,#0A4H;                LOAD COUNT TO TH0 OF TIMER 0

MOV TL0,#0A4H;                LOAD COUNT TO TL0 OF TIMER 0

SETB TR0;                     SELECT THE TIMER 0

LOOP:

MOV A,#'A';                   MOV 'A' TO ACCUMULATOR

MOV P2,A;                     MOV THE VALUE OF A TO P2

MOV A,#'B';                   MOV 'B' TO ACCUMULATOR

MOV P0,A;                     MOV THE VALUE OF A TO P0

SJMP LOOP;                    SHORT JUMP TO LOOP

END;                          END THE PROGRAM
