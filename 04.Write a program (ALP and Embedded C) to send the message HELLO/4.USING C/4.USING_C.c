//Header file for using microcontroller
#include <reg52.h>

void main(){
	//Choosing mode 2 and timer 1
	TMOD=0x20;

	//choosing mode 2 for serial com 
	SCON=0x50;

	//selecting the timer 1
	TR1=1;

	////setting the baud rate to 4800
	TH1=0XFA;

	//sending the character H
	SBUF='H';
	while(!TI);
	TI=0;

	//sending the character E
	SBUF='E';
	while(!TI);
	TI=0;

	//sending the character L
	SBUF='L';
	while(!TI);
	TI=0;
	//sending the character L
	SBUF='L';
	while(!TI);
	TI=0;

	//sending the character O
	SBUF='O';
	while(!TI);
	TI=0;

	//stopping the com after sending hello
	while(!RI);

	
	
}



