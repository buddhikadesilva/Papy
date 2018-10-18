import processing.serial.*;

Serial MySerial;
boolean state = false;
void setup() {
  size(400, 400);
 
 // Open the port you are using at the rate you want:
  MySerial = new Serial(this, Serial.list()[7], 9600);
  
  
// List all the available serial ports:
printArray(Serial.list());



}

void draw() {
  if (state) {
    background(110, 110, 110);
    fill(0, 0, 0);
  } else {
    background(0, 0, 0);
    fill(110, 110, 110);
  }
  ellipse(200, 200, 300, 300);
}

void mouseClicked() {
  float D = dist(mouseX, mouseY, 200, 200);
  if (D < 150) {
    MySerial.write('a');
    state = !state;
  }
}
