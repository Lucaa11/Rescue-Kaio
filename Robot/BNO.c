
#include <stm8s.h>
#include "i2c.h"
#include "BNO.h"
#include "delay.h"
#include "serial.h"

uint8_t BNO055_Mode;


bool BNO055_Init(uint8_t mode){
	//OPERATION_MODE_NDOF
	GPIO_WriteHigh(GPIOG,GPIO_PIN_5);
	delay_ms(30000);
	// Make sure we have the right device
	if (I2C_Recv(0x29,BNO055_CHIP_ID_ADDR,1,0)[0] != BNO055_ID){
		delay_ms(30000);	// Wait for the device to boot up
		if (I2C_Recv(0x29,BNO055_CHIP_ID_ADDR,1,0)[0] != BNO055_ID) return FALSE;
	}
	// Switch to config mode
	BNO055_SetMode(OPERATION_MODE_CONFIG);
	// Trigger a reset and wait for the device to boot up again
	I2C_Send(0x29,BNO055_SYS_TRIGGER_ADDR, 0x20,0);
	delay_ms(30000);
	while (I2C_Recv(0x29,BNO055_CHIP_ID_ADDR,1,0)[0] != BNO055_ID)delay_ms(10);
	delay_ms(50);

	// Set to normal power mode
	I2C_Send(0x29,BNO055_PWR_MODE_ADDR, POWER_MODE_NORMAL,0);
	delay_ms(10);

	I2C_Send(0x29,BNO055_PAGE_ID_ADDR, 0,0);
	I2C_Send(0x29,BNO055_SYS_TRIGGER_ADDR, 0,0);
	delay_ms(10);

	// Set the requested mode
	BNO055_SetMode(mode);
	delay_ms(20);

	return TRUE;
}
void BNO055_SetMode(uint8_t mode){
		BNO055_Mode=mode;
		I2C_Send(0x29,BNO055_OPR_MODE_ADDR, mode,0);
		delay_ms(30);
	}
void BNO055_SetExternalCrystalUse(bool useExternalCrystal){
		uint8_t prevMode = BNO055_Mode;
		BNO055_SetMode(OPERATION_MODE_CONFIG);
		delay_ms(25);
		I2C_Send(0x29,BNO055_PAGE_ID_ADDR, 0,0);
		I2C_Send(0x29,BNO055_SYS_TRIGGER_ADDR, useExternalCrystal? 0x80: 0,0);
		delay_ms(10);
		BNO055_SetMode(prevMode);
		delay_ms(20);
	}
float* BNO055_GetVector(uint8_t vectorType){
		int i;
		s16 xyz[3];
		float realxyz[3];
		float scalingFactor;
		uint8_t* buf;
		buf = I2C_Recv(0x29, vectorType, 6, 0);
		for (i=0;i<3;i++) xyz[i] = buf[i*2] | (buf[i*2+1]<<8);
		switch(vectorType){
			case VECTOR_MAGNETOMETER:
				scalingFactor = 16.0;
				break;
			case VECTOR_GYROSCOPE:
				scalingFactor = 900.0;
				break;
			case VECTOR_EULER:
				scalingFactor = 16.0;
				break;
			case VECTOR_GRAVITY:
				scalingFactor = 100.0;
				break;
			default:
				scalingFactor = 1.0;
				break;
		}
		for(i=0;i<3;i++)realxyz[i]=xyz[i]/scalingFactor;
		//realxyz[2]-=(realxyz[2]>180)?4096:0;
		return realxyz;
	}

/*
if __name__ == '__main__':
	if (!BNO_Init())
		print("Error initializing device")
		exit()
	delay_ms(1)
	bno.setExternalCrystalUse(True)
	while True:
		print(bno.getVector(VECTOR_EULER))
		delay_ms(0.01)
		*/