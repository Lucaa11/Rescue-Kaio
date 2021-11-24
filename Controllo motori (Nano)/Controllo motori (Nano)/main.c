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
#include "ADC.h"
int main(void)
{
	
	//init_millis(F_CPU);
	Serial_Init();
	InitADC();
	Serial_Send("xd");
	SerialN();
	InitPWM();
	InitISR();
	DDRC=0;
	DDRD=0;

	setpoint[1]=0.5;

    while (1) 
    {
		
		Serial_Send(speed[1]*1000);
		SerialN();

    }
}

