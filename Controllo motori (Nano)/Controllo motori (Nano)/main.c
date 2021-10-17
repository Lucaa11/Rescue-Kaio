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
#include "PWM.h"
#include "ISR.h"

int main(void)
{
	//init_millis(F_CPU);
	//Serial_Init();
	//Serial_Send("xd");
	//SerialN();
	InitPWM();
	InitISR();
	DDRB=0xFF;
	OCR1A=512;
	OCR1B=512;

    while (1) 
    {
		
    }
}

