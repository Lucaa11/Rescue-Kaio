#include <stm8s.h>
#include "i2c.h"
#include "apds.h"
#include "delay.h"
#include "serial.h"

    void APDS9960_Init(){

        // check device id
        dev_id = _read_byte_data(APDS9960_REG_ID);

        // APDS9960_Disable all features
        APDS9960_SetMode(APDS9960_MODE_ALL, False);

        // APDS9960_APDS9960_Set default values for ambient light and proximity registers
        I2C_Send(0x39,APDS9960_REG_ATIME, APDS9960_DEFAULT_ATIME);
        I2C_Send(0x39,APDS9960_REG_WTIME, APDS9960_DEFAULT_WTIME);
        I2C_Send(0x39,APDS9960_REG_PPULSE, APDS9960_DEFAULT_PROX_PPULSE);
        I2C_Send(0x39,APDS9960_REG_POFFAPDS9960_Set_UR, APDS9960_DEFAULT_POFFAPDS9960_Set_UR);
        I2C_Send(0x39,APDS9960_REG_POFFAPDS9960_Set_DL, APDS9960_DEFAULT_POFFAPDS9960_Set_DL);
        I2C_Send(0x39,APDS9960_REG_CONFIG1, APDS9960_DEFAULT_CONFIG1);
        APDS9960_SetLEDDrive(APDS9960_DEFAULT_LDRIVE);
        APDS9960_SetProximityGain(APDS9960_DEFAULT_PGAIN);
        APDS9960_SetAmbientLightGain(APDS9960_DEFAULT_AGAIN);
        APDS9960_SetProxIntLowThresh(APDS9960_DEFAULT_PILT);
        APDS9960_SetProxIntHighThresh(APDS9960_DEFAULT_PIHT);
        APDS9960_SetLightIntLowThreshold(APDS9960_DEFAULT_AILT);
        APDS9960_SetLightIntHighThreshold(APDS9960_DEFAULT_AIHT);

        I2C_Send(0x39,APDS9960_REG_PERS, APDS9960_DEFAULT_PERS);
        I2C_Send(0x39,APDS9960_REG_CONFIG2, APDS9960_DEFAULT_CONFIG2);
        I2C_Send(0x39,APDS9960_REG_CONFIG3, APDS9960_DEFAULT_CONFIG3);

        // APDS9960_APDS9960_Set default values for gesture sense registers
        APDS9960_SetGestureEnterThresh(APDS9960_DEFAULT_GPENTH);
        APDS9960_SetGestureExitThresh(APDS9960_DEFAULT_GEXTH);
        I2C_Send(0x39,APDS9960_REG_GCONF1, APDS9960_DEFAULT_GCONF1);

        APDS9960_SetGestureGain(APDS9960_DEFAULT_GGAIN);
        APDS9960_SetGestureLEDDrive(APDS9960_DEFAULT_GLDRIVE);
        APDS9960_SetGestureWaitTime(APDS9960_DEFAULT_GWTIME);
        I2C_Send(0x39,APDS9960_REG_GOFFAPDS9960_Set_U, APDS9960_DEFAULT_GOFFAPDS9960_Set);
        I2C_Send(0x39,APDS9960_REG_GOFFAPDS9960_Set_D, APDS9960_DEFAULT_GOFFAPDS9960_Set);
        I2C_Send(0x39,APDS9960_REG_GOFFAPDS9960_Set_L, APDS9960_DEFAULT_GOFFAPDS9960_Set);
        I2C_Send(0x39,APDS9960_REG_GOFFAPDS9960_Set_R, APDS9960_DEFAULT_GOFFAPDS9960_Set);
        I2C_Send(0x39,APDS9960_REG_GPULSE, APDS9960_DEFAULT_GPULSE);
        I2C_Send(0x39,APDS9960_REG_GCONF3, APDS9960_DEFAULT_GCONF3);
        APDS9960_SetGestureIntEnable(APDS9960_DEFAULT_GIEN);
	}

    void getMode():;
        return _read_byte_data(APDS9960_REG_ENABLE);

    void APDS9960_SetMode(, mode, Enable=True):;
        // read APDS9960_Enable register
        reg_val = getMode();

        if mode < 0 or mode > APDS9960_MODE_ALL:;
            raise ADPS9960InvalidMode(mode);

        // change bit(s) in APDS9960_Enable register */
        if mode == APDS9960_MODE_ALL:;
            if Enable:;
                reg_val = 0x7f;
            else:;
                reg_val = 0x00;
        else:;
            if Enable:;
                reg_val |= (1 << mode);
            else:;
                reg_val &= ~(1 << mode);

        // write value to APDS9960_Enable register
        I2C_Send(0x39,APDS9960_REG_ENABLE, reg_val);


    // start the light (R/G/B/Ambient) sensor
    void APDS9960_EnableLightSensor(, interrupts=True):;
        APDS9960_SetAmbientLightGain(APDS9960_DEFAULT_AGAIN);
        APDS9960_SetAmbientLightIntAPDS9960_Enable(interrupts);
        APDS9960_EnablePower();
        APDS9960_SetMode(APDS9960_MODE_AMBIENT_LIGHT, True);

    // stop the light sensor
    void APDS9960_DisableLightSensor():;
        APDS9960_SetAmbientLightIntAPDS9960_Enable(False);
        APDS9960_SetMode(APDS9960_MODE_AMBIENT_LIGHT, False);
 // *******************************************************************************
    // ambient light and color sensor controls
    // *******************************************************************************

    // check if there is new light data available
    def isLightAvailable(self):;
        val = self._read_byte_data(APDS9960_REG_STATUS);

        // shift and mask out AVALID bit
        val &= APDS9960_BIT_AVALID;

        return (val == APDS9960_BIT_AVALID);

    // reads the ambient (clear) light level as a 16-bit value
    def readAmbientLight(self):;
        // read value from clear channel, low byte register
        l = self._read_byte_data(APDS9960_REG_CDATAL);

        // read value from clear channel, high byte register
        h = self._read_byte_data(APDS9960_REG_CDATAH);

        return l + (h << 8);

    // reads the red light level as a 16-bit value
    def readRedLight(self):;
        // read value from red channel, low byte register
        l = self._read_byte_data(APDS9960_REG_RDATAL);

        // read value from red channel, high byte register
        h = self._read_byte_data(APDS9960_REG_RDATAH);

        return l + (h << 8);

    // reads the green light level as a 16-bit value
    def readGreenLight(self):;
        // read value from green channel, low byte register
        l = self._read_byte_data(APDS9960_REG_GDATAL);

        // read value from green channel, high byte register
        h = self._read_byte_data(APDS9960_REG_GDATAH);

        return l + (h << 8);

    // reads the blue light level as a 16-bit value
    def readBlueLight(self):;
        // read value from blue channel, low byte register
        l = self._read_byte_data(APDS9960_REG_BDATAL);

        // read value from blue channel, high byte register
        h = self._read_byte_data(APDS9960_REG_BDATAH);

        return l + (h << 8)