#include <Wire.h>

# define I2C_SLAVE_ADDRESS 11 // 12 pour l'esclave 2 et ainsi de suite

#define PAYLOAD_SIZE 2

void setup()
{
  Wire.begin(I2C_SLAVE_ADDRESS);
  Serial.begin(1000000);
  Serial.println("xd");
  delay(1000);               
  Wire.onRequest(requestEvents);
  Wire.onReceive(receiveEvents);
}

void loop(){}

int n = 0;

void requestEvents()
{
  Serial.println(F("---> recieved request"));
  Serial.print(F("sending value : "));
  Serial.println(100);
  Wire.write(100);
}

void receiveEvents(int numBytes)
{  
  Serial.println(F("---> recieved events"));
  n = Wire.read();
  Serial.print(numBytes);
  Serial.println(F("bytes recieved"));
  Serial.print(F("recieved value : "));
  Serial.println(n);
}
