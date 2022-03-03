/*
 * Nuovo_Robot_Codice.c
 *
 * Created: 07/06/2021 16:15:27
 * Author : tollardogiacomo
 */ 
#define F_CPU 16000000ul
#include <avr/io.h>
#include <util/delay.h>
#include <math.h>
#include "PWM.h"
#include "ISR.h"
#include "serial.h"
#include "Millis.h"
#include "BNO.h"
#include "TWI.h"
#include "i2cMaster.h"
//#include "ADC.h"

int main(void)
{
	
	//TWI_init();
	//BNO_init();
	//init_millis(F_CPU);
	Serial_Init();
	Serial_Send("servo");
	SerialN();
	InitPWM();
	InitISR();
	//InitADC();
	DDRA=0;
	while (1)
	{

	}
}

