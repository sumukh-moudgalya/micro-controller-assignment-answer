#include <reg51.h>

sbit square=P1^3;//setting the output bit for the square wave

void timer0() interrupt 1
{

square=~square;//complementing the state of the bit 1.3

}

void main(){

	TMOD=0x02;//selecting timer 0 in mode2

	TH0=0xA4;//loading the value 0a4 for TH0

	TL0=0x0a4;//loading the value 0a4 for TL0

	IE=0x82;//enabling timer 0 interrupt

	TR0=1;//enabling the timer 0

	while(1){

		P2='A';//loading the value 'A' to port 2

		P0='B';//loading the value 'B' to port 0
	}
}