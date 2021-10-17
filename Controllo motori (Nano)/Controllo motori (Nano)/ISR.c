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
#include "ISR.h"
#include "PWM.h"
#include "serial.h"
#include "Millis.h"
#include "BNO.h"

volatile unsigned long topRaggiunti = 0;

void InitISR(void){
	PORTD|=(1<<PD3);
	EIMSK|=(1<<INT0)|(1<<INT1);
	EICRA|=(1<<ISC01)|(1<<ISC00)|(1<<ISC11)|(1<<ISC10);
	sei();
}


	
ISR(TIMER2_COMPA_vect){
	//dutyMSxA = CalculatePID(MSxA);
	//dutyMDxA = CalculatePID(MDxA);
	//dutyMSxD = CalculatePID(MSxD);
	//dutyMDxD = CalculatePID(MDxD);
	OCR1A=1023;	
}

ISR(TIMER0_COMPA_vect){
	//topRaggiunti++;	
	OCR1B=0;
}

ISR(INT0_vect){	
	tImp1 = TCNT2;
	topRaggiuntiProv1=topRaggiunti;
	if(topRaggiuntiProv1==vTopRaggiunti1){
		difftImp1 = tImp1 - vtImp1;
	}
	else{
		difftImp1 = (OCR2A - vtImp1) + (tImp1) + ((topRaggiuntiProv1-vTopRaggiunti1)*OCR2A);
		
	}
	vtImp1 = tImp1;
	vTopRaggiunti1 = topRaggiuntiProv1;
	speed[1] = 62500.0 / (difftImp1 * 622.0);
}

//ISR(INT3_vect){
	//tImp2 = TCNT4;
	//topRaggiuntiProv2=topRaggiunti;
	//if(topRaggiuntiProv2==vTopRaggiunti2){
		//difftImp2 = tImp2 - vtImp2;
	//}
	//else{
		//difftImp2 = (OCR4A - vtImp2) + (tImp2) + ((topRaggiuntiProv2-vTopRaggiunti2)*OCR4A);
		//
	//}
	//vtImp2 = tImp2;
	//vTopRaggiunti2 = topRaggiuntiProv2;
	//speed[2] = 62500 / (difftImp2 * 622);
//}
//
//ISR(INT5_vect){
	//tImp3 = TCNT4;
	//topRaggiuntiProv3=topRaggiunti;
	//if(topRaggiuntiProv3==vTopRaggiunti3){
		//difftImp3 = tImp3 - vtImp3;
	//}
	//else{
		//difftImp3 = (OCR4A - vtImp3) + (tImp3) + ((topRaggiuntiProv3-vTopRaggiunti3)*OCR4A);
		//
	//}
	//vtImp3 = tImp3;
	//vTopRaggiunti3 = topRaggiuntiProv3;
	//speed[3] = 62500 / (difftImp3 * 622);
//}
//
//ISR(INT4_vect){
	//tImp4 = TCNT4;
	//topRaggiuntiProv4=topRaggiunti;
	//if(topRaggiuntiProv4==vTopRaggiunti4){
		//difftImp4 = tImp4 - vtImp4;
	//}
	//else{
		//difftImp4 = (OCR4A - vtImp4) + (tImp4) + ((topRaggiuntiProv4-vTopRaggiunti4)*OCR4A);
		//
	//}
	//vtImp4 = tImp4;
	//vTopRaggiunti4 = topRaggiuntiProv4;
	//speed[4] = 62500 / (difftImp4 * 622);
//}