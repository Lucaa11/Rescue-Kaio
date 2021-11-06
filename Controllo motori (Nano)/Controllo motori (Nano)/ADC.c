/*
 * ADC.c
 *
 * Created: 06/11/2021 19:21:24
 *  Author: Lenovo
 */ 
/*
 * ADC.c
 *
 * Created: 22/06/2021 16:55:50
 *  Author: tollardogiacomo
 */ 
#define F_CPU 16000000ul
#include <avr/io.h>
#include <math.h>
#include "ADC.h"

/*-------------ADC-----------------*/
void InitADC(void){
	
	ADCSRA |= ((1<<ADPS2)|(1<<ADPS1)|(1<<ADPS0));    //16Mhz/128 = 125Khz the ADC reference clock
	ADMUX |= (1<<REFS0);                //Voltage reference from Avcc (5v)
	ADCSRA |= (1<<ADEN);                //Turn on ADC
	ADCSRA |= (1<<ADSC);                //Do an initial conversion because this one is the slowest and to ensure that everything is up and running
	
}
int StartADC(uint8_t channel){
	for (int i=0;i<2;i++)
	{
		ADMUX &= 0xF0;                    //Clear the older channel that was read
		if(channel<=7){
			ADMUX |= channel;                //Defines the new ADC channel to be read
		}
		else{
			ADMUX |= (channel & 0b00000111);
		}
		
		ADCSRA |= (1<<ADSC);                //Starts a new conversion
		while(ADCSRA & (1<<ADSC));            //Wait until the conversion is done
	}
	return ADCW;                    //Returns the ADC value of the chosen channel
}
double DistanzaIR(uint8_t POS){					//funzione per sensori sharp corti e lunghi
	                                                 // 10CM =500 PATATE CIT. F. POJER
	double valore=0;
	for (int i=0;i<1000;i++)
	{
		valore+=(double)StartADC(4);
	}
	valore/=1000;
	valore=29.988 * pow(valore*5/1023 , -1.173);

	return valore;
}