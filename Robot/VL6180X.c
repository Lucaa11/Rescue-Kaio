#include <stm8s.h>
#include "delay.h"
#include "vl6180x.h"
#include "i2c.h"
#include "Serial.h"

uint8_t address[7];
bool ready[7];

void VL6180X_Init( uint8_t N,uint8_t newAddress,GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef shdnPin){
				GPIO_WriteHigh(GPIOx,shdnPin);
				delay_ms(11);
        address[N]= 0x29;
        // Module identification;
				Serial_Send_String("Fresh\n");
				if (I2C_Recv(address[N],__VL6180X_SYSTEM_FRESH_OUT_OF_RESET,1,1)[0] == 1){ 
					Serial_Send_String("TRUE\n");
					ready[N]=TRUE;
				}
				else { 
					delay_ms(1000);
					if (I2C_Recv(address[N],__VL6180X_SYSTEM_FRESH_OUT_OF_RESET,1,1)[0] == 1){ 
						Serial_Send_String("TRUE\n");
						ready[N]=TRUE;
					}
					else{
						Serial_Send_String("FALSE\n");
						ready[N]=FALSE;
					}
				}
        // Required by datasheet;
        // http://www.st.com/st-web-ui/static/active/en/resource/technical/document/application_note/DM00122600.pdf;
				if(ready[N]){
					I2C_Send(address[N],0x0207, 0x01,1);
					I2C_Send(address[N],0x0208, 0x01,1);
					I2C_Send(address[N],0x0096, 0x00,1);
					I2C_Send(address[N],0x0097, 0xfd,1);
					I2C_Send(address[N],0x00e3, 0x00,1);
					I2C_Send(address[N],0x00e4, 0x04,1);
					I2C_Send(address[N],0x00e5, 0x02,1);
					I2C_Send(address[N],0x00e6, 0x01,1);
					I2C_Send(address[N],0x00e7, 0x03,1);
					I2C_Send(address[N],0x00f5, 0x02,1);
					I2C_Send(address[N],0x00d9, 0x05,1);
					I2C_Send(address[N],0x00db, 0xce,1);
					I2C_Send(address[N],0x00dc, 0x03,1);
					I2C_Send(address[N],0x00dd, 0xf8,1);
					I2C_Send(address[N],0x009f, 0x00,1);
					I2C_Send(address[N],0x00a3, 0x3c,1);
					I2C_Send(address[N],0x00b7, 0x00,1);
					I2C_Send(address[N],0x00bb, 0x3c,1);
					I2C_Send(address[N],0x00b2, 0x09,1);
					I2C_Send(address[N],0x00ca, 0x09,1);
					I2C_Send(address[N],0x0198, 0x01,1);
					I2C_Send(address[N],0x01b0, 0x17,1);
					I2C_Send(address[N],0x01ad, 0x00,1);
					I2C_Send(address[N],0x00ff, 0x05,1);
					I2C_Send(address[N],0x0100, 0x05,1);
					I2C_Send(address[N],0x0199, 0x05,1);
					I2C_Send(address[N],0x01a6, 0x1b,1);
					I2C_Send(address[N],0x01ac, 0x3e,1);
					I2C_Send(address[N],0x01a7, 0x1f,1);
					I2C_Send(address[N],0x0030, 0x00,1);
					if (I2C_Recv(address[N],__VL6180X_IDENTIFICATION_MODEL_ID,1,1)[0] != 0xB4){
						Serial_Send_String("Not a valid sensor id");
					}
					else{
						Serial_Send_String("valid sensor id");
					}
					VL6180X_DefaultSettings(N);
					VL6180X_ChangeAddress(N,newAddress);
				}
}

    void VL6180X_DefaultSettings(uint8_t N){
        // Recommended settings from datasheet;
        // http://www.st.com/st-web-ui/static/active/en/resource/technical/document/application_note/DM00122600.pdf;
        // Set GPIO1 high when sample complete;
        I2C_Send(address[N],__VL6180X_SYSTEM_MODE_GPIO1, 0x10,1);
        // Set Avg sample period;
        I2C_Send(address[N],__VL6180X_READOUT_AVERAGING_SAMPLE_PERIOD, 0x30,1);
        // Set the ALS gain;
        I2C_Send(address[N],__VL6180X_SYSALS_ANALOGUE_GAIN, 0x46,1);
        // Set auto calibration period (Max = 255)/(OFF = 0);
        I2C_Send(address[N],__VL6180X_SYSRANGE_VHV_REPEAT_RATE, 0xFF,1);
        // Set ALS integration time to 100ms;
        I2C_Send(address[N],__VL6180X_SYSALS_INTEGRATION_PERIOD, 0x63,1);
        // perform a single temperature calibration;
        I2C_Send(address[N],__VL6180X_SYSRANGE_VHV_RECALIBRATE, 0x01,1);
        // Optional settings from datasheet;
        // http://www.st.com/st-web-ui/static/active/en/resource/technical/document/application_note/DM00122600.pdf;
        // Set default ranging inter-measurement period to 100ms;
        I2C_Send(address[N],__VL6180X_SYSRANGE_INTERMEASUREMENT_PERIOD, 0x09,1);
        // Set default ALS inter-measurement period to 100ms;
        I2C_Send(address[N],__VL6180X_SYSALS_INTERMEASUREMENT_PERIOD, 0x31,1);
        // Configures interrupt on 'New Sample Ready threshold event';
        I2C_Send(address[N],__VL6180X_SYSTEM_INTERRUPT_CONFIG_GPIO, 0x24,1);
        // Additional settings defaults from community;
        I2C_Send(address[N],__VL6180X_SYSRANGE_MAX_CONVERGENCE_TIME, 0x32,1);
        I2C_Send(address[N],__VL6180X_SYSRANGE_RANGE_CHECK_ENABLES, 0x10,1);
        I2C_Send(address[N],__VL6180X_SYSRANGE_EARLY_CONVERGENCE_ESTIMATE, 0x7B,1);
        I2C_Send(address[N],__VL6180X_SYSALS_INTEGRATION_PERIOD, 0x64,1);
        I2C_Send(address[N],__VL6180X_SYSALS_ANALOGUE_GAIN, 0x40,1);
        I2C_Send(address[N],__VL6180X_FIRMWARE_RESULT_SCALER, 0x01,1);

}
    uint8_t VL6180X_ChangeAddress(uint8_t N, uint8_t new_address){
        // NOTICE:  IT APPEARS THAT CHANGING THE 0x29 IS NOT STORED IN NON-;
        // VOLATILE MEMORY POWER CYCLING THE DEVICE REVERTS 0x29 BACK TO 0X29;
        if (address[N] == new_address) return address[N];
        if (new_address > 127) return address[N];
        I2C_Send(address[N], __VL6180X_I2C_SLAVE_DEVICE_ADDRESS, new_address, 1);
				Serial_Send_Hex(address[N]);
        address[N] = new_address;
				Serial_Send_Hex(address[N]);
        return I2C_Recv(address[N], __VL6180X_I2C_SLAVE_DEVICE_ADDRESS,1,1)[0];
}
    uint8_t VL6180X_GetDistance(uint8_t N){
        // Start Single shot mode;
				int distance;
        I2C_Send(address[N],__VL6180X_SYSRANGE_START, 0x01, 1);
				delay_ms(10);
        distance = I2C_Recv(address[N],__VL6180X_RESULT_RANGE_VAL,1,1)[0];
        I2C_Send(address[N],__VL6180X_SYSTEM_INTERRUPT_CLEAR, 0x07, 1);
        return distance;
}
 uint8_t VL6180X_GetWalls(){
	u8 walls=0;
	if (VL6180X_GetDistance(0)<100 && VL6180X_GetDistance(1)<100) walls|=1<<0;
	if (VL6180X_GetDistance(2)<100 && VL6180X_GetDistance(3)<100) walls|=1<<1;
	if (VL6180X_GetDistance(4)<100 && VL6180X_GetDistance(5)<100) walls|=1<<2;
	return walls;
}