#include <stm8s.h>
#include "delay.h"


void stopWatch(bool disable){
			  
			if(disable){
				TIM4_ClearFlag(TIM4_FLAG_UPDATE);
		  	TIM4_Cmd(DISABLE);
			}
			else{
				TIM4_DeInit();
				TIM4_TimeBaseInit(TIM4_PRESCALER_128, 255);
				TIM4_Cmd(ENABLE);
			}
}
void delay_us(int us)
	{
				 TIM4_DeInit();     
				 if((us <= 200) && (us >= 0))
				 {
								TIM4_TimeBaseInit(TIM4_PRESCALER_16, 200);
								TIM4_Cmd(ENABLE);  
				 }
				 else if((us <= 400) && (us > 200))
				 {
								us >>= 1;
								TIM4_TimeBaseInit(TIM4_PRESCALER_32, 200);
								TIM4_Cmd(ENABLE);  
				 }
				 else if((us <= 800) && (us > 400))
				 {
								us >>= 2;
								TIM4_TimeBaseInit(TIM4_PRESCALER_64, 200);
								TIM4_Cmd(ENABLE);  
				 }
				 else if((us <= 1600) && (us > 800))
				 {
								us >>= 3;
								TIM4_TimeBaseInit(TIM4_PRESCALER_128, 200);
								TIM4_Cmd(ENABLE);  
				 }
				 while(TIM4_GetCounter() < us);
				 TIM4_ClearFlag(TIM4_FLAG_UPDATE);
				 TIM4_Cmd(DISABLE);    
	}
	void delay_ms(long ms)
	{
				 while(ms--)
				 {
								delay_us(1000);
				 }
	}