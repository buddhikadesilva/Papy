import gab.opencv.*;
import java.awt.*;
import processing.video.*;


PImage src, dst;
OpenCV opencv;
Capture img;
import processing.serial.*;

Serial MySerial;
boolean state = false;

ArrayList<Contour> contours;
ArrayList<Contour> polygons;
float[] Areas;
float maxArea=0;
Rectangle rec;

int lineCenter;

void setup() {
//  src = loadImage("d1.png"); 
  size(640, 480);
  
   
 // Open the port you are using at the rate you want:
  MySerial = new Serial(this, Serial.list()[7], 9600);
  
  
// List all the available serial ports:
printArray(Serial.list());

  

  
    img = new Capture(this, 640/2, 480/2);
    opencv = new OpenCV(this, 640/2, 480/2);
 // opencv = new OpenCV(this, video);

  opencv.gray();
  opencv.threshold(70);
  dst = opencv.getOutput();

  contours = opencv.findContours();
  println("found " + contours.size() + " contours");
  //stroke(0, 255, 0);
   img.start();
}

void draw() {
  //scale(1.5);
 // image(src, 0, 0);

  image(img, 320, 0);
 opencv.loadImage(img);
   opencv.gray();
  opencv.threshold(70);
  opencv.blur(12);  
  opencv.invert();
  dst = opencv.getOutput();
 
//  image(video, 0, 0 );


 /////////////////////////////////////////////////////////////////////////////////
 
  contours = opencv.findContours();
  println("found " + contours.size() + " contours");
 //background(dst);
// filter(INVERT);
  image(dst, 0, 0);
 stroke(255, 0, 0);
  noFill();
  
  strokeWeight(3);                  //Middle Aim
   line(0,240/2,320,240/2);
   line(320/2,0,320/2,240); //END Middle Aim
   
    stroke(100, 200, 0);
   line(3*320/8,0,3*320/8,240);////      |
   
   stroke(180, 200, 0);
   line(320/4,0,320/4,240);///////    |
   
      stroke(200, 200, 0);
   line(320/8,0,320/8,240);////// |
   
   
   
  // int mArea=max(contours.Contour.area());
  try{
    Areas =new float[contours.size()];////////////////////////selecting the contour that have max area.
 for (int i = 0; i < contours.size(); i++) {
   Areas[i]=contours.get(i).area();
   // print("Max Areas : "+maxArea+" ");
  }
//  println();
 maxArea=max(Areas);
 //  println(maxArea);///////////////////////////////////////END selecting the contour that have max area.
  
  
  
  for (Contour contour : contours) {
   
    
    
   if(contour.area()==maxArea){
    stroke(0, 255, 0);
    contour.draw();
    
 //   println(" Big Boss");
    rec = contour.getBoundingBox();
  //  rect(rec.x, rec.y, rec.width, rec.height);
    
     stroke(0, 0, 255);
     strokeWeight(10);
    point(rec.x+rec.width/2, rec.y+rec.height/2);
    lineCenter=rec.x+rec.width/2;
    
    
    ///////////////////////////////////////////////640---------------   320 | 320        160 160 | 160 160      80 80 80 80 | 80 80 80 80
    if(lineCenter>(3*320/8) && lineCenter<(5*320/8)){ // x2>x1  
    println("FORWARD--------");
      MySerial.write('f');
    
    }
    if(lineCenter<=(3*320/8)){ // x2>x1
     println("LEFT--------");
       MySerial.write('l');
    }
     if(lineCenter>=(5*320/8)){ // x2>x1
     println("RIGHT--------");
       MySerial.write('r');
    }
    
   }

 
  
  //   println("Ponits............................"+contour);
 
  } 
  }
  catch(Exception e){}
}

void captureEvent(Capture c) {
  c.read();
}
