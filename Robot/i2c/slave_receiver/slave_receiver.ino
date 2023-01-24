// Wire Slave Receiver
// by Nicholas Zambetti <http://www.zambetti.com>

// Demonstrates use of the Wire library
// Receives data as an I2C/TWI slave device
// Refer to the "Wire Master Writer" example for use with this

// Created 29 March 2006

// This example code is in the public domain.


#include <Wire.h>

void setup() {
  Wire.begin(41);                // join i2c bus with address #41
  Wire.onReceive(receiveEvent); // register event
  Wire.onRequest(requestEvent); // register event
  Serial.begin(500000);           // start serial for output
  Wire.write(31);
}

void loop() {
  delay(100);
}

// function that executes whenever data is received from master
// this function is registered as an event, see setup()
bool flag,flag2;
void receiveEvent(int howMany) {
  Serial.print("receiveing: ");
  while (1 < Wire.available()) { // loop through all but the last
    int c = Wire.read(); // receive byte as a character
    Serial.print(c, HEX);         // print the character
  }
  int x = Wire.read();    // receive byte as an integer
  Serial.println(x,HEX);         // print the integer
  if (x==8)flag2=1;
}
void requestEvent(){
  Wire.write(31);
  Serial.println("ciao");
  /*flag=0;
  if (flag2){
    flag=1;
    flag2=0;
    int i=0;
    while(flag){
      Wire.write(31);
    Serial.print("sending: ");
    Serial.println(1, HEX);}}
  if (Serial.available() > 0) {
    // read the incoming byte:
    int data = Serial.read();
    
    // say what you got:
    Serial.print("sending: ");
    Serial.println(data, HEX);
    Wire.write(data);
  }*/
}
