/*
 * Controllo motori (Nano).c
 *
 * Created: 16/10/2021 21:31:09
 * Author : Lenovo
 */ 

#define F_CPU 16000000ul
#include <avr/io.h>
#include <util/delay.h>
#include <math.h>
#include <stdlib.h>
#include "PWM.h"
#include "ISR.h"
#include "serial.h"

int main(void)
{
	
	//init_millis(F_CPU);
	Serial_Init();
	Serial_Send("xd");
	SerialN();
	InitPWM();
	InitISR();
	DDRC=0;
	DDRD=0;
	Kp=0;
	Ki=0;
	Kd=0;
    while (1) 
    {
		while((PIND & (1<<PIND4))==1)
		{
			if(Kp<100)Kp++;
			else Kp=0;
			Serial_Send(Kp);
			SerialN();
			_delay_ms(100);
		}
		while((PINC & (1<<PINC1))==1)
		{
			if((Kp>=100)&&(Kp<200))Kp++;
			else Kp=100;
			Serial_Send(Kp);
			SerialN();
			_delay_ms(100);
		}
		while((PINC & (1<<PINC2))==1)
		{
			if((Kp>=200)&&(Kp<300))Kp++;
			else Kp=200;
			Serial_Send(Kp);
			SerialN();
			_delay_ms(100);
		}
		while((PINC & (1<<PINC3))==1)
		{
			if((Kp>=300)&&(Kp<400))Kp++;
			else Kp=300;
			Serial_Send(Kp);
			SerialN();
			_delay_ms(100);
		}
		while((PINC & (1<<PINC4))==1)
		{
			if((Kp>=400)&&(Kp<500))Kp++;
			else Kp=400;
			Serial_Send(Kp);
			SerialN();
			_delay_ms(100);
		}
		while((PINC & (1<<PINC5))==1)
		{
			if((Kp>=500)&&(Kp<600))Kp++;
			else Kp=500;
			Serial_Send(Kp);
			SerialN();
			_delay_ms(100);
		}
		while((PINC & (1<<PINC6))==1)
		{
			if((Kp>=600)&&(Kp<700))Kp++;
			else Kp=600;
			Serial_Send(Kp);
			SerialN();
			_delay_ms(100);
		}
		Serial_Send(Kp);
		SerialN();
    }
}

