//Header file for the program
#include <reg52.h>
//setbit P1^5 as variable square
sbit square=P1^5;

//delay function prototype
void delay();


void main(){
	
	unsigned int i;
	//Choosing mode one operation
	TMOD=0x10;

	//running the program continously
	while(1){
			//Logic high
			square=1;
			//Running delay of 5ms for 200 times to get 1 sec delay
			for (i=0;i<200;i++){
				delay();
			}
				
			
			square=0;
			//Running delay of 5ms for 200 times to get 1 sec delay
			for (i=0;i<200;i++){
				delay();
			}

	}


}

void delay(){
	//choosing the timer 1
	TR1=1;

	//setting the value of TL1 of timer 1 to 0
	TL1=0x00;

	//setting the value of TH1 of timer 1 to EE
	TH1=0xEE;

	//or while(TF0==0)
	while(!TF1);

	//setting the overflow bit of timer 1 to 0
	TF1=0;

	//deselecting the timer 1 for further use
	TR1=0;
}