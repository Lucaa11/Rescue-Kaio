#include <stm8s.h>
#include <stdlib.h>
#include "i2c.h"
#include "VL6180X.h"
#include "BNO.h"
#include "serial.h"
#include "delay.h"

bool start=0, startedCom=0, secondSent = 0, I2C_received = 0;
uint8_t data0,a1,a0;


ErrorStatus I2C_CheckEvent1(I2C_Event_TypeDef I2C_Event)
{
  __IO uint16_t lastevent = 0x00;
  uint8_t flag1 = 0x00 ;
  uint8_t flag2 = 0x00;
  ErrorStatus status = ERROR;

  /* Check the parameters */
  assert_param(IS_I2C_EVENT_OK(I2C_Event));

  if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
  {
    lastevent = I2C->SR2 & I2C_SR2_AF;
  }
  else
  {
    flag1 = I2C->SR1;
    flag2 = I2C->SR3;
    lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
		if(lastevent!=0x44)Serial_Send_Hex(lastevent);
  }
  /* Check whether the last event is equal to I2C_EVENT */
  if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
  {
    /* SUCCESS: last event is equal to I2C_EVENT */
    status = SUCCESS;
  }
  else
  {
    /* ERROR: last event is different from I2C_EVENT */
    status = ERROR;
  }

  /* Return status */
  return status;
}


void InitI2C(void){
	int i=0;
	float* result;		
	GPIO_DeInit(GPIOE);
	GPIO_Init(GPIOE,GPIO_PIN_1|GPIO_PIN_2, GPIO_MODE_OUT_OD_HIZ_FAST);
	GPIO_Init(GPIOC, GPIO_PIN_6|GPIO_PIN_7 , GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(GPIOG, GPIO_PIN_0|GPIO_PIN_1|GPIO_PIN_2|GPIO_PIN_3|GPIO_PIN_4|GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_WriteLow(GPIOG, GPIO_PIN_ALL);
	GPIO_WriteLow(GPIOC, GPIO_PIN_6|GPIO_PIN_7);
	delay_ms(30000);
	I2C_DeInit();
	I2C_Init(I2C_MAX_STANDARD_FREQ, 0xA0, I2C_DUTYCYCLE_2, I2C_ACK_NONE, I2C_ADDMODE_7BIT, 16);
	for (i=7;i>5;i--)VL6180X_Init((7-i),0x20+(7-i)*2,GPIOC,1<<i);
	//for (i=0;i<5;i++)VL6180X_Init(i+2,0x24+(i)*2,GPIOG,1<<i);
	Serial_Send_String("laser ok\n");
	if(!BNO055_Init(OPERATION_MODE_NDOF))Serial_Send_String("gyro non va\n");
	else Serial_Send_String("va da dio\n");
	delay_ms(1000);
	BNO055_SetExternalCrystalUse(TRUE);
	delay_ms(1000);
}

uint8_t I2C_Send(uint8_t EdiS_add, uint16_t register_EdiS_address, uint16_t iData, bool VL6180X)
{
	uint8_t a1 = (uint8_t)((register_EdiS_address >> 8) & 0xFF);
	uint8_t a0 = (uint8_t)(register_EdiS_address & 0xFF);
	uint8_t d1 = (uint8_t)((iData >> 8) & 0xFF);
	uint8_t d0 = (uint8_t)(iData & 0xFF);
	stopWatch(0);
	while(I2C_GetFlagStatus(I2C_FLAG_BUSBUSY))
		if(TIM4_GetCounter()>200){
				Serial_Send_String("SEND: busy error\n");
				stopWatch(1);
				I2C_GenerateSTOP(ENABLE);
				return BUSY_ERROR[0];
			}
  I2C_GenerateSTART(ENABLE);
	stopWatch(0);
  while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
		if(TIM4_GetCounter()>200){
				Serial_Send_String("SEND: start error\n"); 
				stopWatch(1);
				I2C_GenerateSTOP(ENABLE);
				return START_ERROR[0];
			}
	I2C->DR = (uint8_t)(EdiS_add<<1 | I2C_DIRECTION_TX);
	stopWatch(0);	
  while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
		if(TIM4_GetCounter()>200){
				Serial_Send_String("SEND: add error\n");
				stopWatch(1);
				I2C_GenerateSTOP(ENABLE);
				return ADD_ERROR[0];
			}
	if(VL6180X){	//only to VL6180X because it has 2bytes register address
		I2C_SendData(a1);
		stopWatch(0);
		while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED))
			if(TIM4_GetCounter()>200){
				Serial_Send_String("SEND: send error\n");
				stopWatch(1);
				I2C_GenerateSTOP(ENABLE);				
				return SEND_ERROR[0];
			}
	}
	I2C_SendData(a0);
	stopWatch(0);
	while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED))
		if(TIM4_GetCounter()>200){
				Serial_Send_String("SEND: send error\n");
				stopWatch(1);
				I2C_GenerateSTOP(ENABLE);
				return SEND_ERROR[0];
			}
	I2C_SendData(d0);
	stopWatch(0);
	while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED))
		if(TIM4_GetCounter()>200){
				Serial_Send_String("SEND: send error\n");
				stopWatch(1);
				I2C_GenerateSTOP(ENABLE);
				return SEND_ERROR[0];
			}
	I2C_GenerateSTOP(ENABLE);
	return 0;
}


uint8_t* I2C_Recv(uint8_t EdiS_add, uint16_t register_EdiS_address, uint8_t nBytes, bool VL6180X)
{
  uint8_t data[10];
	long i=0,j=0,k=0;
	uint8_t a0,a1;
	
	for(i;i<10;i++)data[i]=0;
	for(i=0;i<nBytes;i++){
		a1 = (uint8_t)((register_EdiS_address >> 8) & 0xFF);
		a0 = (uint8_t)(register_EdiS_address & 0xFF);
		stopWatch(0);
		while(I2C_GetFlagStatus(I2C_FLAG_BUSBUSY))
			if(TIM4_GetCounter()>250){
				Serial_Send_String("RECV: busy error\n"); 
				stopWatch(1);
				I2C_AcknowledgeConfig(I2C_ACK_NONE);
				I2C_GenerateSTOP(ENABLE);
				return BUSY_ERROR;
			}
		Serial_Send_String("caio");
		Serial_Send_Int(k++);
		I2C_GenerateSTART(ENABLE);
		stopWatch(0);
		while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
			if(TIM4_GetCounter()>250){
				Serial_Send_String("RECV: start error\n");
				stopWatch(1);
				I2C_AcknowledgeConfig(I2C_ACK_NONE);
		I2C_GenerateSTOP(ENABLE);
				return START_ERROR;
			}
		Serial_Send_String("caio");
		Serial_Send_Int(k++);
		I2C->DR = (uint8_t)(EdiS_add<<1 | I2C_DIRECTION_TX);
		stopWatch(0);
		while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
		Serial_Send_String("caio");
		Serial_Send_Int(k++);
		if(VL6180X){//only to VL6180X because it has 2bytes register address
			I2C_SendData(a1);
			stopWatch(0);
			while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED))
				if(TIM4_GetCounter()>250){
					Serial_Send_String("RECV: send error\n"); 
					stopWatch(1);
					I2C_AcknowledgeConfig(I2C_ACK_NONE);
		I2C_GenerateSTOP(ENABLE);
					return SEND_ERROR;
				}
		}
		Serial_Send_String("caio");
		Serial_Send_Int(k++);
		I2C_SendData(a0);
		stopWatch(0);
		while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED))
			if(TIM4_GetCounter()>250){
				Serial_Send_String("RECV: send error\n"); 
				stopWatch(1);
				I2C_AcknowledgeConfig(I2C_ACK_NONE);
		I2C_GenerateSTOP(ENABLE);
				return SEND_ERROR;
			}
		Serial_Send_String("caio");
		Serial_Send_Int(k++);
		I2C_GenerateSTART(ENABLE); 
		stopWatch(0);
		while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
			if(TIM4_GetCounter()>250){
				Serial_Send_String("RECV: restart error\n"); 
				stopWatch(1);
				I2C_AcknowledgeConfig(I2C_ACK_NONE);
		I2C_GenerateSTOP(ENABLE);
				return START_ERROR;
			}
		Serial_Send_String("caio");
		Serial_Send_Int(k++);
		I2C->DR = (uint8_t)(EdiS_add<<1 | I2C_DIRECTION_RX);
		stopWatch(0);
		while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_RECEIVED))
			if(TIM4_GetCounter()>250){
				Serial_Send_String("RECV: recv error\n"); 
				stopWatch(1);
				I2C_AcknowledgeConfig(I2C_ACK_NONE);
		I2C_GenerateSTOP(ENABLE);
				return RECV_ERROR;
			}
		Serial_Send_String("caio");
		Serial_Send_Int(k++);
		data[j++] = I2C_ReceiveData();
	
		I2C_AcknowledgeConfig(I2C_ACK_NONE);
		I2C_GenerateSTOP(ENABLE);
		register_EdiS_address+=1;
	}
	Serial_Send_Hex(data[0]);
	return data;
}
