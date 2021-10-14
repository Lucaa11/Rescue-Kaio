
/*
 * PWM.c
 *
 * Created: 07/06/2021 16:31:20
 *  Author: tollardogiacomo
 */ 

#define F_CPU 16000000ul
#include <avr/io.h>
#include <util/delay.h>
#include "PWM.h"
#include "ISR.h"
#include "serial.h"
#include "BNO.h"

/*-------------------PWM-------------------*/
//Inizializzazione PWM
void InitPWM(void){
	TCCR1A|=(1<<WGM10)|(1<<WGM11)|(1<<COM1A1)|(1<<COM1B1)|(1<<COM1C1);								//PWM 10 bit, non-inverting mode, PRESCALER = 256, FREQUENZA OTTENUTA = 61 Hz
	TCCR1B|=(1<<WGM12)|(0<<WGM13)|(1<<CS12);
	TCCR3A|=(1<<WGM30)|(1<<WGM31)|(1<<COM3A1)|(1<<COM3B1)|(1<<COM3C1);								//PWM 10 bit, non-inverting mode, PRESCALER = 256, FREQUENZA OTTENUTA = 61 Hz
	TCCR3B|=(1<<WGM32)|(0<<WGM33)|(1<<CS32);
	
	
	TCCR5A|=(0<<WGM50)|(0<<WGM51)|(0<<COM5A1)|(0<<COM5B1)|(0<<COM5C1);								//CTC timer 5, PRESCALER = 8
	TCCR5B|=(1<<WGM52)|(0<<WGM53)|(1<<CS51);
	TIMSK5 = (1<<OCIE5A);
	OCR5A = 1999;																				
	
	TCCR4A|=(0<<WGM40)|(0<<WGM41)|(0<<COM4A1)|(0<<COM4B1)|(0<<COM4C1);								//PRESCALER = 256, FREQUENZA timer = 62500 Hz					
	TCCR4B|=(1<<WGM42)|(0<<WGM43)|(1<<CS42);
	TIMSK4 = (1<<OCIE4A);
	OCR4A = 62500;
	TCNT4=0x1FF;

	
	DDRA=0xFF;
	DDRB|=(1<<PB5)|(1<<PB6)|(1<<PB7);															
	DDRE|=(1<<PE3);

	for(int i=1;i<5;i++)integral[i]=0;
}



void Avantitutta(double RPS){
	
	for(int i=1;i<5;i++)setpoint[i]=ABS(RPS);	
	if(RPS>0) PORTA=(1<<PA0)|(1<<PA3)|(1<<PA5)|(1<<PA7);
	else PORTA=(1<<PA1)|(1<<PA2)|(1<<PA4)|(1<<PA6);
}

void setGiriCoppia(double RPS_sx, double RPS_dx){
	setpoint[1]=ABS(RPS_sx);
	setpoint[3]=ABS(RPS_sx);
	setpoint[2]=ABS(RPS_dx);
	setpoint[4]=ABS(RPS_dx);
	if ((RPS_dx>0) && (RPS_sx>0) )PORTA=(1<<PA0)|(1<<PA3)|(1<<PA5)|(1<<PA7);
	if ((RPS_dx<0) && (RPS_sx<0)) PORTA=(1<<PA1)|(1<<PA2)|(1<<PA4)|(1<<PA6);
	if ((RPS_dx>0) && (RPS_sx<0)) PORTA=(1<<PA0)|(1<<PA3)|(1<<PA4)|(1<<PA6);
	if ((RPS_dx<0) && (RPS_sx>0)) PORTA=(1<<PA1)|(1<<PA2)|(1<<PA5)|(1<<PA7);
	
}

void stopMotori(){
	for(int i=1;i<5;i++)setpoint[i]=0;
}

void Turn(double degrees){
	Ti=1;
	objDegree = gradiGiroscopio(1)+degrees;
	if (objDegree>360) objDegree-=360;
	else if (objDegree<0) objDegree+=360;
	if (degrees>0){
		setGiriCoppia(1,-1);
		while((gradiGiroscopio(1)<(objDegree-5))|| gradiGiroscopio(1)>(objDegree+5));
	}
	if (degrees<0){
		setGiriCoppia(-1,1);
		while((gradiGiroscopio(1)<(objDegree-5))|| gradiGiroscopio(1)>(objDegree+5));
	}
	stopMotori();
	Ti=0;
	setpointGy+=degrees;
}

/*-------------------PID-------------------*/

int CalculatePID(int N){

	if(Ti==0){
		errorGy = setpointGy + ABS(angle);
		derivativeGy = (errorGy - old_errorGy)/0.002;
		
		if(angle>0){
			increase[MDxA] = increase[MDxD] = -errorGy*Kpg /*+ derivativeGy*Kdg*/;
			increase[MSxA] = increase[MSxD] = (errorGy*Kpg /*+ derivativeGy*Kdg*/);
		}
		if(angle<0){
			increase[MDxA] = increase[MDxD] = errorGy*Kpg /*+ derivativeGy*Kdg*/;
			increase[MSxD] = increase[MSxA] = -(errorGy*Kpg /*+ derivativeGy*Kdg*/);
		}
		old_errorGy = errorGy;	
	}
	set[N] = (setpoint[N]) + (increase[N]);
	error[N] = set[N] - speed[N];
	integral[N] += error[N]*0.002;
	derivative[N] = (error[N] - old_error[N])/0.002;
	duty[N] = error[N]*Kp + integral[N]*Ki + derivative[N]*Kd;
	if (duty[N]<0) duty[N]=0;
	if (duty[N]>1023) duty[N]=1023;
	old_error[N] = error[N];
	return duty[N];
}
