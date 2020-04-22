//Header file for the program
#include <reg52.h>

//setbit P1^4 as variable square
sbit square=P1^4;

//delay function prototype
void delay();


void main(){
	//Choosing mode tw0 operation for timer 0
	TMOD=0x02;
	
	//running the program continously
	while(1){
	
	//Logic high	
	square=1;
		
	//calling a delay of 0.05ms or a frequency of 10KHz
	delay();
		
	//logic low
	square=0;
		
	//calling a delay of 0.05ms or a frequency of 10KHz	
	delay();
	}
}

void delay(){
	//choosing the timer 1
	TR0=1;
	
	//setting the value of TL0 of timer 0 to A4
	TL0=0xA4;
	
	//setting the value of TH0 of timer 0 to A4
	TH0=0xA4;
	
	//or while(TF0==0)
	while(!TF0);
	
	//deselecting the timer 0 for further use
	TR0=0;
	
	//setting the overflow bit of timer 0 to 0
	TF0=0;
}
