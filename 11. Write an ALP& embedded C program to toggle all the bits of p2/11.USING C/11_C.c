//Header file for the using microcontroller
#include <reg52.h>

//delay function prototype
void delay();

void main(){
	
	unsigned int i;

	//Choosing mode 2 operation of timer 2
	TMOD=0x20;

	//running the program continously
	while(1){

		//logic high
		P2=0x0ff;

		//for delay of 50ms i.e,200X.25ms=50ms 
		for(i=0;i<200;i++){
			//calling a delay of 5ms
			delay();
		}

		//logic low
		P2=0x00;
		for(i=0;i<200;i++){
			//calling a delay of 5ms
			delay();
		}
	}




}


void delay(){

	//choosing timer 1
	TR1=1;

	//setting the value of TL1 of timer 1 as 1A
	TL1=0X1A;

	//setting the value of TH1 of timer 1 as 1A
	TH1=0X1A;

	//or while(TF1==0)
	while(!TF1);

	//setting the overflow bit of timer 1 to 0
	TF1=0;

	//deselecting the timer 0 for further use
	TR1=0;
	
}
