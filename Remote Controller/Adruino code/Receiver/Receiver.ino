#include <SPI.h>
#include <printf.h>
#include "RF24.h"

bool radioNumber = 0;

RF24 radio(7,8);

byte address[] = {};


void setup() {
  radio.begin();
  Serial.begin(9600);
  printf_begin();
  /* Test connection */
  if(radio.isChipConnected()){
    Serial.println("Chip is connected.");
  }
  else{
    Serial.println("Chip is not connected.");
  } 

  /* print debug informatio */
  radio.printDetails(); 
  
}

void loop(){
  delay(1000);
}
