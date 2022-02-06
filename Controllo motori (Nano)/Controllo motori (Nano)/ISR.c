/*
 * ISR.c
 *
 * Created: 09/06/2021 12:34:06
 *  Author: tollardogiacomo
 */ 

#define F_CPU 16000000ul
#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include <stdlib.h>
#include <stdio.h>
#include "ISR.h"
#include "PWM.h"
#include "serial.h"
#include "Millis.h"
#include "BNO.h"
#include "ADC.h"

volatile unsigned long topRaggiunti = 0;
volatile unsigned long ciao = 0;

void InitISR(void){
	PORTD|=(1<<PIND3);
	EIMSK|=(1<<INT0)|(1<<INT1);
	EICRA|=(1<<ISC01)|(1<<ISC00)|(1<<ISC11)|(1<<ISC10);
	sei();
}

	
ISR(TIMER2_COMPA_vect){
	OCR1A = CalculatePID(0);
	//dutyMDxA = CalculatePID(MDxA);
	//dutyMSxD = CalculatePID(MSxD);
	//dutyMDxD = CalculatePID(MDxD);
	
}

ISR(TIMER0_COMPA_vect){
	topRaggiunti++;	
	
}

ISR(INT0_vect){	
	
	tImp[0] = TCNT0;
	topRaggiuntiProv[0]=topRaggiunti;
	if(topRaggiuntiProv[0]==vTopRaggiunti[0]){
		difftImp[0] = tImp[0] - vtImp[0];
	}
	else{
		difftImp[0] = (OCR0A - vtImp[0]) + (tImp[0]) + ((topRaggiuntiProv[0]-vTopRaggiunti[0]-1)*OCR0A);
		
	}
	speed[0] = 250000.0 / (622.0*difftImp[0]);
	vtImp[0] = tImp[0];
	vTopRaggiunti[0] = topRaggiuntiProv[0];
}

ISR(INT1_vect){


}





ISR (USART_RX_vect){
	char n=UDR0;
	if (n!= 'e'){
		
		num[countForSer]=n;				//riempie la stringa dalla cifra più significativa
		countForSer++;
	}
	
	else{
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
				Serial_Send(ColorSens());
				SerialN();
				break;
			default:
				Serial_Send("ciao");
				SerialN();
				break;
		}

		for(countForSer; countForSer>=0; countForSer--) num[countForSer]=0;
		countForSer++;
		
	}
}