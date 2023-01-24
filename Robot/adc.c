#include <stm8s.h>
#include "adc.h"
#include "serial.h"
#include "delay.h"

unsigned int ADC_Read()
{
	unsigned int result = 0;
 ADC2_DeInit();
 ADC2_Init(ADC2_CONVERSIONMODE_SINGLE,
             ADC2_CHANNEL_0,
             ADC2_PRESSEL_FCPU_D18,
             ADC2_EXTTRIG_TIM,
             DISABLE,
             ADC2_ALIGN_RIGHT,
             ADC2_SCHMITTTRIG_ALL,
             DISABLE);
	ADC2_Cmd(ENABLE);

	ADC2_StartConversion();
		while(ADC2_GetFlagStatus() == FALSE);
		result = ADC2_GetConversionValue();
		ADC2_ClearFlag();
return result;
}