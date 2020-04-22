org 000h

start:mov a,#00h

hi:mov p0,a

add a,#28h

acall delay

cjne a,#0a0h,hi;

mov p0,a;

acall delay

triangle1:mov p0,a;

inc a

cjne a,#0ffh,triangle1

triangle2:mov p0,a

dec a

cjne a,#0a0h,triangle2

nohi:mov p0,a

acall delay

clr c

subb a,#28h

cjne a,#00h,nohi

ajmp hi

delay:

mov r3,#0ffh

delay5:
djnz r3,delay5

ret;
END