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

pinMode(enA, OUTPUT);
pinMode(in1, OUTPUT);
pinMode(in2, OUTPUT);

pinMode(enB, OUTPUT);
pinMode(in3, OUTPUT);
pinMode(in4, OUTPUT);
  
  Serial.begin(9600);
}

void loop() {
  if (Serial.available() > 0) {
    char Data = Serial.read();
    state = !state;
    if (Data=='f') { // forward
      
    mpower(1,1,60);
    mpower(2,1,60);
    }
    else if (Data=='b') { // back
      
    mpower(1,-1,70);
    mpower(2,-1,70);
    }
     else if (Data=='l') { // left
      
    mpower(1,1,70);
    mpower(2,1,50);
    }
     else if (Data=='r') { // right
      
    mpower(1,1,50);
    mpower(2,1,70);
    }
    else{
       mpower(1,0,100);
    mpower(2,0,100);
      
      }
  
  }
}
