/* 
 Creates a gradient made of random hexagons
 Press R to Export PDF  */
import processing.pdf.*;
boolean record = false;

void setup() {
  size(1000, 700);   
  fill(0);
  frameRate(2);
}

void draw() {
  background(255);
  if (record == true) {
    beginRecord(PDF, "output.pdf");  // Start recording to the file
  }

  stroke(0);
  for (int x=0; x<width; x+=50) {
    for (int y=0; y<height; y+=50) {
      int shapeSize = x/25;
      if  ( random(2) < 1) {
        polygon(x, y, shapeSize,6);
      } else {
        polygon(x-shapeSize/2, y-shapeSize/2, shapeSize, 6);
      }
    }
  }

  if (record == true) {
    endRecord();
    record = false; // Stop recording to the file
    println("recorded PDF");
  }
}

void keyPressed() {
  if (key == 'R' || key == 'r') { // Press R to save the file
    record = true;
  }
}

void polygon(float x, float y, float radius, int numberSides) {

   float angle = TWO_PI / numberSides;  //  The nomber of point or vertexes determins the angle of rotation
   fill(220, 100, 0);
   beginShape();                        //  +++++++ Used wit vert() to create a shape
        // ++++++++++++++++++++++++++++++++++++++++ The loop is incremented by the value angle  
      for (float i = 0; i < TWO_PI; i += angle) { 
        float sx = x + cos(i) * radius;         //calculate each vertes in relation to the center (x, y)
        float sy = y + sin(i) * radius;
        vertex(sx, sy);
      }
   endShape(CLOSE);                             // CLOSE ensures a line between the last two vetexes
}
