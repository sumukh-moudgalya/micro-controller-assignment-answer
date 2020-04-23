//Header file for using microcontroller
#include <reg52.h>

void main(){
	unsigned int i;
	char db[]={'H','E','L','L','O'};
	//Choosing mode 2 and timer 1
	TMOD=0x20;

	//choosing mode 2 for serial com 
	SCON=0x50;

	//selecting the timer 1
	TR1=1;

	////setting the baud rate to 4800
	TH1=0XFA;
	
	//setting a for loop for transfer of hello
	for(i=0;i<5;i++){
		
	SBUF=db[i];//moving the char db[i] to sbuf register
		
	while(!TI);//waiting for data transmission to be complete
		
	TI=0;//clearing the transmission bit for further use
		
	}

}
