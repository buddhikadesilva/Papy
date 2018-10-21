int PinLed = 13;
boolean state = false;


//M1
int enA = 10;
int in1 = 9;
int in2 = 8;
//M2
int enB = 5;
int in3 = 7;
int in4 = 6;


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
    if (Data=='a') { // forward
      
    mpower(1,1,100);
    mpower(2,1,100);
    }
     if (Data=='b') { // back
      
    mpower(1,-1,100);
    mpower(2,-1,100);
    }
    else{
       digitalWrite(8, 0);
      digitalWrite(9, 0);
      
      }
  
  }
}
