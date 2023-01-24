#include <stm8s.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include "isr.h"

void InitCLK()
{ 
	FLASH_DeInit();
	
	CLK_DeInit();
	CLK_HSECmd(DISABLE);
	CLK_LSICmd(DISABLE);
	CLK_HSICmd(ENABLE);
	CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);
	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
  CLK_ClockSwitchCmd(ENABLE);
	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
  CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
	CLK -> PCKENR1 = 0xff;			  //Enable all peripheral clock
	CLK -> PCKENR2 = 0xff;
}

void InitISR(void){
	disableInterrupts();
	//-------interrupts for encoders-------\\
	GPIO_DeInit(GPIOA);
	GPIO_Init(GPIOE,GPIO_PIN_3, GPIO_MODE_IN_PU_IT);
	GPIO_Init(GPIOD,GPIO_PIN_4, GPIO_MODE_IN_PU_IT);
	GPIO_Init(GPIOC,GPIO_PIN_5, GPIO_MODE_IN_PU_IT);
	GPIO_Init(GPIOA,GPIO_PIN_6, GPIO_MODE_IN_PU_IT);
	EXTI_DeInit();
	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOE, EXTI_SENSITIVITY_FALL_ONLY);
	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD, EXTI_SENSITIVITY_FALL_ONLY);
	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOC, EXTI_SENSITIVITY_FALL_ONLY);
	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOA, EXTI_SENSITIVITY_FALL_ONLY);
	
	//-------Timers interrupts-------\\
	
	TIM2_DeInit();
	TIM2_OC1Init(TIM2_OCMODE_ACTIVE, TIM2_OUTPUTSTATE_DISABLE, (double)CLK_GetClockFreq()*0.002, TIM2_OCPOLARITY_HIGH);
	TIM2_TimeBaseInit(TIM2_PRESCALER_1, 65535);
	TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);
	TIM2_ClearFlag(TIM2_IT_UPDATE);
	TIM2_ITConfig(TIM2_IT_CC1, ENABLE);
	TIM2_ClearFlag(TIM2_IT_CC1);
	TIM2_Cmd(ENABLE);
	
	//-------I2C interrupts-------\\
	
	I2C_ITConfig(I2C_IT_ERR|I2C_IT_EVT|I2C_IT_BUF, ENABLE);

	enableInterrupts();
	
}

