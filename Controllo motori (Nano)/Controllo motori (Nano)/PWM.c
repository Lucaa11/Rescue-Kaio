
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
//#include "BNO.h"

/*-------------------PWM-------------------*/
//Inizializzazione PWM
void InitPWM(void){
	TCCR1A|=(1<<WGM10)|(1<<WGM11)|(1<<COM1A1)|(1<<COM1B1);								//PWM 10 bit, non-inverting mode, PRESCALER = 256, FREQUENZA OTTENUTA = 61 Hz
	TCCR1B|=(1<<WGM12)|(0<<WGM13)|(1<<CS12);
	
	TCCR2A|=(0<<WGM20)|(0<<WGM21)|(0<<COM2A1)|(0<<COM2B1);								//CTC timer 5, PRESCALER = 8
	TCCR2B|=(1<<WGM22)|(1<<CS21);
	TIMSK2 = (1<<OCIE2A);
	OCR2A = 1999;
	TCNT2=0x1FF;																				
	
	TCCR0A|=(0<<WGM00)|(1<<WGM01)|(0<<COM0A1)|(0<<COM0B1);								//PRESCALER = 256, FREQUENZA timer = 62500 Hz					
	TCCR0B|=(1<<WGM02)|(1<<CS00);
	TIMSK0 = (1<<OCIE0A);
	OCR0A = 127;
	TCNT0=0x1FF;

	
	DDRC=0xFF;
	DDRB|=(1<<PB1)|(1<<PB2);

	for(int i=1;i<5;i++)integral[i]=0;
}

//
//
//void Avantitutta(double RPS){
	//
	//for(int i=1;i<5;i++)setpoint[i]=ABS(RPS);	
	//if(RPS>0) PORTA=(1<<PA0)|(1<<PA3)|(1<<PA5)|(1<<PA7);
	//else PORTA=(1<<PA1)|(1<<PA2)|(1<<PA4)|(1<<PA6);
//}
//
//void setGiriCoppia(double RPS_sx, double RPS_dx){
	//setpoint[1]=ABS(RPS_sx);
	//setpoint[3]=ABS(RPS_sx);
	//setpoint[2]=ABS(RPS_dx);
	//setpoint[4]=ABS(RPS_dx);
	//if ((RPS_dx>0) && (RPS_sx>0) )PORTA=(1<<PA0)|(1<<PA3)|(1<<PA5)|(1<<PA7);
	//if ((RPS_dx<0) && (RPS_sx<0)) PORTA=(1<<PA1)|(1<<PA2)|(1<<PA4)|(1<<PA6);
	//if ((RPS_dx>0) && (RPS_sx<0)) PORTA=(1<<PA0)|(1<<PA3)|(1<<PA4)|(1<<PA6);
	//if ((RPS_dx<0) && (RPS_sx>0)) PORTA=(1<<PA1)|(1<<PA2)|(1<<PA5)|(1<<PA7);
	//
//}
//
//void stopMotori(){
	//for(int i=1;i<5;i++)setpoint[i]=0;
//}
//
//void Turn(double degrees){
	//Ti=1;
	//objDegree = gradiGiroscopio(1)+degrees;
	//if (objDegree>360) objDegree-=360;
	//else if (objDegree<0) objDegree+=360;
	//if (degrees>0){
		//setGiriCoppia(1,-1);
		//while((gradiGiroscopio(1)<(objDegree-5))|| gradiGiroscopio(1)>(objDegree+5));
	//}
	//if (degrees<0){
		//setGiriCoppia(-1,1);
		//while((gradiGiroscopio(1)<(objDegree-5))|| gradiGiroscopio(1)>(objDegree+5));
	//}
	//stopMotori();
	//Ti=0;
	//setpointGy+=degrees;
//}
//
///*-------------------PID-------------------*/
//
//int CalculatePID(int N){
//
	//if(Ti==0){
		//errorGy = setpointGy + ABS(angle);
		//derivativeGy = (errorGy - old_errorGy)/0.002;
		//
		//if(angle>0){
			//increase[MDxA] = increase[MDxD] = -errorGy*Kpg /*+ derivativeGy*Kdg*/;
			//increase[MSxA] = increase[MSxD] = (errorGy*Kpg /*+ derivativeGy*Kdg*/);
		//}
		//if(angle<0){
			//increase[MDxA] = increase[MDxD] = errorGy*Kpg /*+ derivativeGy*Kdg*/;
			//increase[MSxD] = increase[MSxA] = -(errorGy*Kpg /*+ derivativeGy*Kdg*/);
		//}
		//old_errorGy = errorGy;	
	//}
	//set[N] = (setpoint[N]) + (increase[N]);
	//error[N] = set[N] - speed[N];
	//integral[N] += error[N]*0.002;
	//derivative[N] = (error[N] - old_error[N])/0.002;
	//duty[N] = error[N]*Kp + integral[N]*Ki + derivative[N]*Kd;
	//if (duty[N]<0) duty[N]=0;
	//if (duty[N]>1023) duty[N]=1023;
	//old_error[N] = error[N];
	//return duty[N];
//}