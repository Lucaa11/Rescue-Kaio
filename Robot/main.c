 /* MAIN.C file
 /* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

#include <stm8s.h>
#include <math.h>
#include <string.h>
#include "Serial.h"
#include "PWM.h"
#include "ISR.h"
#include "I2C.h"
#include "adc.h"
#include "bno.h"
#include "vl6180x.h"
#include "delay.h"
#include "millis.h"


uint8_t* test = {0};
long test1 = 0;
double long test2 = 0;
double long test3 = 0;
double long test4 = 10;
double long test5 = 10;
double long test6 = 10;
double long test7 = 10;
double long test8 = 10;
double long test9 = 10;

main()
{
	int i;
	InitCLK();
	InitSer();
	Serial_Send_String("xd\n");
	//InitI2C();
	InitPwm();
	InitISR();
	Serial_Send_String("av\n");
	VaiAvanti();
	while(1){
		delay_ms(100);
		
		/*Serial_Send_String("de\n");
		Gira(Destra);
		Serial_Send_String("av\n");
		VaiAvanti();
		Serial_Send_String("si\n");
		Gira(Sinistra);*/
		
		delay_ms(100);
	}
		/*int i;
		for(i=0;i<3;i++){
			if(comb[i][0])GPIO_WriteHigh(GPIOG,GPIO_PIN_5);
			else GPIO_WriteLow(GPIOG,GPIO_PIN_5);
			if(comb[i][1])GPIO_WriteHigh(GPIOG,GPIO_PIN_6);			
			else GPIO_WriteLow(GPIOG,GPIO_PIN_6);
			test6=0;
			while(!GPIO_ReadInputPin(GPIOG,GPIO_PIN_7));
			while(GPIO_ReadInputPin(GPIOG,GPIO_PIN_7)){test6++;}
			HighLow[i][0]=test6>HighLow[i][0]?test6:HighLow[i][0];
			HighLow[i][1]=test6<HighLow[i][1]?test6:HighLow[i][1];
			delay_ms(1);
		}
		for(i=0;i<3;i++){
			Serial_Send_String(col[i]);
			Serial_Send_Int(HighLow[i][0]);
			Serial_Send_Int(HighLow[i][1]);
		}
		delay_ms(100);*/

	
	return 0;
}


long CalcPid(uint8_t N){
	error[N] = setpoint[N] - speed[N];
	if (ABS(error[N])>0.04){
		integral[N] += error[N]*0.002;									//0.002 -> dt 
		integral[N] = integral[N] > limI ? limI : integral[N] < -limI ? -limI : integral[N];
		proportional[N] = error[N]*Kp;
		proportional[N] = proportional[N] > limP ? limP : proportional[N] < -limP ? -limP : proportional[N];
		derivative[N] = (error[N] - old_error[N])/0.002;
		duty[N] = (proportional[N] + integral[N]*Ki + derivative[N]*Kd)>65535?65535: \
							(proportional[N] + integral[N]*Ki + derivative[N]*Kd)<0?0: \
							(uint16_t)(proportional[N] + integral[N]*Ki + derivative[N]*Kd);									
		old_error[N] = error[N];
	}
	return duty[N];
}




//------------------ISRs------------------\\


@svlreg @far @interrupt void ISR_MOT0(void){ //PE3
		Serial_Send_String("caio\n");
		imptemp[0]++;
		tImp[0] = TIM2_GetCounter();
		topRaggiuntiProv[0] = topRaggiunti;
		if(topRaggiuntiProv[0] == vTopRaggiunti[0]) difftImp[0] = tImp[0] - vtImp[0];
		else difftImp[0] = (65535 - vtImp[0]) + (tImp[0]) + ((topRaggiuntiProv[0]-vTopRaggiunti[0]-1)*0xFFFF);
		if(ABS(speed[0]-(double) 16000000 / (990*difftImp[0]))<1){
			test2 = speed[0] = (double) 16000000 / (990*difftImp[0]);
		}
		
		vtImp[0] = tImp[0];
		vTopRaggiunti[0] = topRaggiuntiProv[0];
		
	}
	@svlreg @far @interrupt void ISR_MOT1(void){ //PD4
		imptemp[1]++;
		tImp[1] = TIM2_GetCounter();
		topRaggiuntiProv[1] = topRaggiunti;
		if(topRaggiuntiProv[1] == vTopRaggiunti[1]) difftImp[1] = tImp[1] - vtImp[1];
		else difftImp[1] = (65535 - vtImp[1]) + (tImp[1]) + ((topRaggiuntiProv[1]-vTopRaggiunti[1]-1)*0xFFFF);
		
		if(ABS(speed[1]-(double) 16000000 / (990*difftImp[1]))<1){
			test3 = speed[1] = (double) 16000000 / (990*difftImp[1]);
		}
		
		vtImp[1] = tImp[1];
		vTopRaggiunti[1] = topRaggiuntiProv[1];
		
	}
	@svlreg @far @interrupt void ISR_MOT2(void){ //PC5
		imptemp[2]++;
		tImp[2] = TIM2_GetCounter();
		topRaggiuntiProv[2] = topRaggiunti;
		if(topRaggiuntiProv[2] == vTopRaggiunti[2]) difftImp[2] = tImp[2] - vtImp[2]; 
		else difftImp[2] = (65535 - vtImp[2]) + (tImp[2]) + ((topRaggiuntiProv[2]-vTopRaggiunti[2]-1)*0xFFFF);
		
		if(ABS(speed[2]-(double) 16000000 / (990*difftImp[2]))<1){
			test4 = speed[2] = (double) 16000000 / (990*difftImp[2]);
		}
		
		vtImp[2] = tImp[2];
		vTopRaggiunti[2] = topRaggiuntiProv[2];
		
	}
	@svlreg @far @interrupt void ISR_MOT3(void){ //PA4
		imptemp[3]++;
		tImp[3] = TIM2_GetCounter();
		topRaggiuntiProv[3] = topRaggiunti;
		if(topRaggiuntiProv[3] == vTopRaggiunti[3]) difftImp[3] = tImp[3] - vtImp[3];
		else difftImp[3] = (65535 - vtImp[3]) + (tImp[3]) + ((topRaggiuntiProv[3]-vTopRaggiunti[3]-1)*0xFFFF);

		if(ABS(speed[3]-(double) 16000000 / (990*difftImp[3]))<1){
			test5 = speed[3] = (double) 16000000 / (990*difftImp[3]);
		}
		
		vtImp[3] = tImp[3];
		vTopRaggiunti[3] = topRaggiuntiProv[3];
		
	}





@svlreg @far @interrupt void ISR_TIM2(void){
	topRaggiunti++;
	TIM2_ClearFlag(TIM2_FLAG_UPDATE);
}





@svlreg @far @interrupt void ISR_TIM2_CC(void){													//2ms
	TIM1_SetCompare1(test6 = (uint16_t)CalcPid(0));
	TIM1_SetCompare2(test7 = (uint16_t)CalcPid(1));
	TIM1_SetCompare3(test8 = (uint16_t)CalcPid(2));
	TIM1_SetCompare4(test9 = (uint16_t)CalcPid(3));
	TIM2_ClearFlag(TIM2_FLAG_CC1);
}

void status_msg(void){
	u8 walls = VL6180X_GetWalls();
	
	
	if (walls & 1<<0) Serial_Send_String("1");
	else Serial_Send_String("0");
	if (walls & 1<<1) Serial_Send_String("1");
	else Serial_Send_String("0");
	if (walls & 1<<2) Serial_Send_String("1");
	else Serial_Send_String("0");
	//strncat(msg,GetTile() + 48,1);
	Serial_Send_String("\n");
}

@svlreg @far @interrupt void ISR_Ser(void){
	char n=UART3 -> DR;
	sendId=0;
	switch (n)
	{
		case '0':
		break;
			
		case '1':
		break;
			
		default:
		Serial_Send_String("default\n");
		break;
	}
}
@svlreg @far @interrupt void ISR_Ser1(void){
	char n=UART1 -> DR;
	sendId=0;
	switch (n)
	{
		case '0':
		GPIO_WriteHigh(GPIOE,GPIO_PIN_0|GPIO_PIN_3);
		delay_ms(2000);
		GPIO_WriteLow(GPIOE,GPIO_PIN_0|GPIO_PIN_3);
		Serial_Send_String("30cm\n");
		status_msg();
		break;
			
		case '1':
		GPIO_WriteHigh(GPIOE,GPIO_PIN_0);
		delay_ms(2000);
		GPIO_WriteLow(GPIOE,GPIO_PIN_0);
		Serial_Send_String("girato a destra\n");
		break;
		
		case '2':
		GPIO_WriteHigh(GPIOE,GPIO_PIN_3);
		delay_ms(2000);
		GPIO_WriteLow(GPIOE,GPIO_PIN_3);
		Serial_Send_String("girato a sinistra\n");
		break;
			
		default:
		Serial_Send_String("niente\n");
		break;
	}
}
