ORG 0000H;                             SETTING THE ORIGIN

MOV TMOD,#20H;                         SELECTING THE TIMER 1 MODE 2 OPERATION

MOV SCON,#50H;                         SELECTING MODE 1,RECEPTION ENABLED,8 BIT AUTO RELOAD TIMER

SETB TR1;                              SELECTING TIMER 1

MOV TH1,#0FAH;                         SETTING THE BAUD RATE OF 4800

MOV DPTR,#300H;                        MOVING THE POINTER TO THE DATA AT 300H

LOOP1:
MOVC A,@A+DPTR;                        MOVING THE DATA TO A

CJNE A,#'$',LOOP2;                     COMPARE AND JUMP IF NOT EQUAL TO 

JMP LAST;                              JUMP TO LAST

LOOP2:
MOV SBUF,A;                            MOVE THE CONTENTS OF A TO BUFFER REGISTER

LOOP3:
JNB TI,LOOP3;                          JUMP IF THE BIT IS NOT SET TO LOOP3

CLR TI;                                CLEAR TI

INC DPTR;                              INCREMENT DPTR TO POINT IT TO NEXT DATA

JMP LOOP1;                             JUMP TO LOOP1


ORG 300H;
db'H E L L O $'                        //entering the data that needs to be transmitted


LAST:
END;
