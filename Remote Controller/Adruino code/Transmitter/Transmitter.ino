#include <SPI.h>
#include <printf.h>
#include "RF24.h"

bool radioNumber = 0;

RF24 radio(7,8);

const uint8_t address[] = {0,0,0,0,1};
const uint8_t testMsg[] = "Test Message.";

void setup() {
  radio.begin();
  Serial.begin(9600);
  
  /* Test connection */
  if(radio.isChipConnected()){
    Serial.println("Chip is connected.");
  }
  else{
    Serial.println("Chip is not connected.");
  } 

  /* print debug informatio */
  printf_begin();
  radio.printDetails(); 

  radio.setPALevel(RF24_PA_MIN);
  radio.openWritingPipe(address);
  
}

void loop(){
  radio.write(testMsg, sizeof(testMsg));
  Serial.println(radio.get_status());
  delay(1000);
}
