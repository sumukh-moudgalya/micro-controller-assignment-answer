//Header file for the program
#include<reg52.h>

//setbit P1^5 as variable square
sbit square=P1^5;

//delay function prototype
void delay();


void main(){
	//Choosing mode one operation
	TMOD=0x01;

	//running the program continously
	while(1){
		//Logic high
		square=1;
		//calling a delay of 5ms
		delay();
		//logic low
		square=0;
		//calling delay of 5ms
		delay();


	}






}


void delay(){
	//choosing the timer 0
	TR0=1;

	//setting the value of TL0 of timer 0 to 0
	TL0=0x00;

	//setting the value of TH0 of timer 0 to EE
	TH0=0xEE;
	//or while(TF0==0)
	while(!TF0);

	//setting the overflow bit of timer 0 to 0
	TF0=0;

	//deselecting the timer 0 for further use
	TR0=0;
	


}


