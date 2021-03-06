ORG 300H;                   SELECTING THE ORGIN FOR STORING MESSAGES

MESS1: DB '                 HELLO$';MESSAGE 1 HELLO

MESS2: DB 'WELCOME$';       MESSAGE 2 WELCOME

//AGAIN:
ORG 0000H;                  SELECTING THE ORIGIN OF THE PROGRAM

MOV TMOD,#20H;              SELECTING TIMER 1 IN MODE 2 FOR BAUDRATE

MOV TH1,#-3;                SELECTING 9600 BAUD RATE

MOV SCON,#50H;              SELECTING SERIAL TRANSFER MODE 1

SETB TR1;                   STARTING THE TIMER 1

CLR A;                      CLEARING THE CONTENTS OF A(OPTIONAL)

SETB P2.0;                  SETTING PIN P2.0 AS INPUT

AGAIN:
JNB P2.0,SEND_HELLO;        JUMP IF THE BIT IS NOT SET TO AGAIN

SEND_WELCOME:
MOV DPTR,#MESS2;            MOVING THE ADDRESS OF THE MESSAGE TO THE DATA POINTER

SEND_WELCOME_LOOP:
MOVC A,@A+DPTR;             MOVE THE DATA POINTED BY DPTR TO A

CJNE A,#'$',NEXT_WELCOME;   COMPARE AND JUMP  IF NOT EQUAL TO NEXT_WELCOME

JMP LAST;                   JUMP TO LAST

NEXT_WELCOME:
MOV SBUF,A;                 MOVE THE CONTENTS OF A TO SBUF REGISTER

LOOP1:JNB TI,LOOP1;         JUMP IF THE BIT IS NOT SET TO LOOP1

INC DPTR;                   INCREMENT THE VALUE OF DPTR

CLR A;                      CLEAR THE CONTENTS OF A

CLR TI;                     CLEAR THE TI BIT

SJMP SEND_WELCOME_LOOP;     SHORT JUMP TO SEND_WELCOME_LOOP

SEND_HELLO:
MOV DPTR,#MESS1;            MOVING THE ADDRESS OF THE MESSAGE TO THE DATA POINTER

SEND_HELLO_LOOP:
MOVC A,@A+DPTR;             MOVE THE DATA POINTED BY DPTR TO A

CJNE A,#'$',NEXT_HELLO;     COMPARE AND JUMP  IF NOT EQUAL TO NEXT_HELLO

JMP LAST;                   JUMP TO LAST

NEXT_HELLO:
MOV SBUF,A;                 MOVE THE CONTENTS OF A TO SBUF REGISTER

LOOP2:JNB TI,LOOP2;         JUMP IF THE BIT IS NOT SET TO LOOP1

INC DPTR;                   INCREMENT THE VALUE OF DPTR

CLR A;                      CLEAR THE CONTENTS OF A

CLR TI;                     CLEAR THE TI BIT

SJMP SEND_HELLO_LOOP;       SHORT JUMP TO SEND_HELLO_LOOP


LAST:
//JMP AGAIN;
END;
 
