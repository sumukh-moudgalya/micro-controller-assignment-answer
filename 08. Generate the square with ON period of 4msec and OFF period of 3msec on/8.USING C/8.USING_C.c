#include <reg52.h>
sbit square=P1^5;

void delay_3ms();

void delay_4ms();

void main(){
	TMOD=0x00;
	while(1){
		square=1;
		delay_4ms();
		square=0;
		delay_3ms();
		
	}


}
void delay_3ms(){
	TR0=1;
	TL0=0x04;
	TH0=0x54;
	while(!TF0);
	TF0=0;
	TR0=0;


}
void delay_4ms(){
	TR0=1;
	TL0=0x1A;
	TH0=0x1A;
	while(!TF0);
	TF0=0;
	TR0=0;


}