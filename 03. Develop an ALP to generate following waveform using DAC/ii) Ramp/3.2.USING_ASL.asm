ORG 0000H;                      SELECTING THE ORIGIN FOR THE PROGRAM
CLR A;                          CLEARING THE CONTEN OF A(OPTIONAL)
FIRST:
MOV P0,A;                       MOVE THE CONTENTS OF A TO PORT 0
INC A;                          INCREMENT THE VALUE OF A
CJNE A,#0FFH,FIRST;             COMPARE AND JUMP IF NOT EQUAL TO 
MOV P0,A;                       MOVE THE CONTENTS OF P0 TO A
JMP FIRST;                      JUMP TO FIRST
END;
