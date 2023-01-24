#include <stm8s.h>
#include "pwm.h"
#include "delay.h"


volatile double error[4], proportional[4], integral[4], derivative[4], setpoint[4], old_error[4];					
volatile double errorGy, integralGy , derivativeGy, setpointGy, old_errorGy, increase[4],set[4],objDegree;
volatile bool Ti;
volatile double angle;
volatile long duty[4],imptemp[4]={0,0,0,0};


//funzione per inizializzare i timer per pwm, va sicuramente (ovviamente se ci sono problemi e avete guardato negli altri posti controllate)
void InitPwm(void){
	verify_option(0x4803,1<<4);				//enable tim1_ch4 port
	TIM1_DeInit(); 																																	//timer1 pwm 
	TIM1_OC1Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_DISABLE, 65535, TIM1_OCPOLARITY_HIGH, TIM1_OCNPOLARITY_HIGH, TIM1_OCIDLESTATE_SET, TIM1_OCNIDLESTATE_RESET);
	TIM1_OC2Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_DISABLE, 65535, TIM1_OCPOLARITY_HIGH, TIM1_OCNPOLARITY_HIGH, TIM1_OCIDLESTATE_SET, TIM1_OCNIDLESTATE_RESET);
	TIM1_OC3Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_DISABLE, 65535, TIM1_OCPOLARITY_HIGH, TIM1_OCNPOLARITY_HIGH, TIM1_OCIDLESTATE_SET, TIM1_OCNIDLESTATE_RESET);
	TIM1_OC4Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE,  65535, TIM1_OCPOLARITY_HIGH, TIM1_OCIDLESTATE_SET);
	TIM1_TimeBaseInit(4, TIM1_COUNTERMODE_UP, 65535, 0);//N=4, Top=65535, f=61.04Hz
	TIM3_DeInit();
	TIM3_OC1Init(TIM3_OCMODE_PWM1, TIM3_OUTPUTSTATE_ENABLE, 0, TIM3_OCPOLARITY_HIGH);
	TIM3_OC2Init(TIM3_OCMODE_PWM1, TIM3_OUTPUTSTATE_ENABLE, 0, TIM3_OCPOLARITY_HIGH);
	TIM3_TimeBaseInit(TIM3_PRESCALER_8, 40000);
	TIM1_Cmd(ENABLE);
	TIM1_CtrlPWMOutputs(ENABLE);
	TIM3_Cmd(ENABLE);
	
	GPIO_DeInit(GPIOB);
	GPIO_Init(GPIOB, GPIO_PIN_ALL, GPIO_MODE_OUT_PP_LOW_FAST);
}
void VaiAvanti(void){
	int i;
	GPIO_WriteHigh(GPIOB,GPIO_PIN_0|GPIO_PIN_2|GPIO_PIN_4|GPIO_PIN_6);
	//imptemp = {0,0,0,0};
	for(i=0;i<4;i++)setpoint[i]=1;
	//while(imptemp[0]<30 || imptemp[1]<30 || imptemp[2]<30 || imptemp[3]<30);
	
	//delay_ms(1000);
	//for(i=0;i<4;i++)setpoint[i]=0;
	//GPIO_WriteLow(GPIOB,GPIO_PIN_ALL);
}
void Gira(bool verso){
	int i;
	if(verso)GPIO_WriteHigh(GPIOB,GPIO_PIN_0|GPIO_PIN_3|GPIO_PIN_4|GPIO_PIN_7);
	else GPIO_WriteHigh(GPIOB,GPIO_PIN_1|GPIO_PIN_2|GPIO_PIN_5|GPIO_PIN_6);
	for(i=0;i<4;i++)setpoint[i]=1;
	delay_ms(1000);
	for(i=0;i<4;i++)setpoint[i]=0;
	GPIO_WriteLow(GPIOB,GPIO_PIN_ALL);
}
void verify_option(uint16_t address, uint8_t data)
{
	uint16_t stored_data = FLASH_ReadOptionByte( address );
	if( ( FLASH_OPTIONBYTE_ERROR == stored_data ) || ( data != (uint8_t)( stored_data>>8 ) ) )
	{
		FLASH_Unlock( FLASH_MEMTYPE_DATA );
    FLASH_EraseOptionByte( address );
    FLASH_ProgramOptionByte( address, data );
    FLASH_Lock( FLASH_MEMTYPE_DATA );	

    /* Use the watchdog to reset the device to enable the feature */
	
		IWDG->KR = IWDG_KEY_ENABLE;

    while(1);
	}
}
double long ABS(double long x){
	if (x<0)x=-x;
	return x;
}
