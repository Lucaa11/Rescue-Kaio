#include <stm8s.h>
#include "millis.h"

void diffMillis(bool start){
	if(start){
		TIM6_TimeBaseInit(TIM6_PRESCALER_64, 250);
		TIM6_Cmd(ENABLE);
	}
}