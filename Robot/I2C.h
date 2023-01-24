	
	//costants (cannot use #define)	
	static const char BUSY_ERROR[]={1,255,0,127,0,63};
	static const char START_ERROR[]={63,255,0,127,0,63};
	static const char ADD_ERROR[]= {127,255,0,127,0,63};
	static const char SEND_ERROR[]= {191,255,0,127,0,63};
	static const char RECV_ERROR[]= {255,255,0,127,0,63};
	//functions
	void InitI2C(void);
	uint8_t I2C_Send(uint8_t I2C_Slave_Address, uint16_t register_address, uint16_t iData, bool VL6180X);
	uint8_t* I2C_Recv(uint8_t EdiS_add, uint16_t register_EdiS_address, uint8_t nBytes, bool VL6180X);
	ErrorStatus I2C_CheckEvent1(I2C_Event_TypeDef I2C_Event);
	//variables
	extern bool start, startedCom, secondSent, I2C_received;
	extern uint8_t data0,a1,a0;