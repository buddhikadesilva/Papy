int PinLed = 13;
boolean state = false;
void setup() {
  pinMode(PinLed, OUTPUT);

pinMode(8, OUTPUT);
pinMode(9, OUTPUT);

pinMode(6, OUTPUT);
  
  Serial.begin(9600);
}

void loop() {
  if (Serial.available() > 0) {
    char Data = Serial.read();
    state = !state;
    if (Data=='a') {
      
      digitalWrite(8, 1);
      digitalWrite(9, 0);
      analogWrite(6,80);
    }
    else{
       digitalWrite(8, 0);
      digitalWrite(9, 0);
      
      }
  
  }
}
