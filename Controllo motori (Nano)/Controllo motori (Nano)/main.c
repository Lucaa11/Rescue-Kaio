
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
	
	numEnded=0;
	Serial_Init();
	InitADC();
	Serial_Send("xd");
	SerialN();
	InitPWM();
	InitISR();
	DDRC=0;
    while (1) {
		if (numEnded){
			operation=num[countForSer-1];
			num[countForSer-1]=0;
			float wantedSpeed=atof(num);
			switch (operation)
			{
				case '0':
				if (wantedSpeed<0){
					PORTD=(1<<PIND6)|(1<<PIND4);
					wantedSpeed=-wantedSpeed;
				}
				else PORTD=(1<<PIND7)|(1<<PIND5);
				
				for(int i=0; i<2; i++)setpoint[i]=wantedSpeed;
				if(wantedSpeed==0)for(int i=0; i<2; i++)setpoint[i]=-1000;
				break;
				
				case '1':
				Serial_Send(1);
				SerialN();
				SerialN();
				break;
				
				case '2':
				angle=wantedSpeed;
				Serial_Send(angle);
				SerialN();
				SerialN();
				break;
				
				default:
				Serial_Send("ciao");
				SerialN();
				SerialN();
				break;
			}

			for(countForSer; countForSer>=0; countForSer--) num[countForSer]=0;
			countForSer++;
			numEnded=0;
		}
    }
}

