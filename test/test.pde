/**
 * Load and Display 
 * 
 * Images can be loaded and displayed to the screen at their actual size
 * or any other size. 
 */

PImage img;  // Declare variable "a" of type PImage
PVector loc;
PVector vel;

void setup() {
  size(640, 360);
  loc = new PVector(width/2, height/2);
  vel = new PVector(random(-1 ,1), random(-1 ,1));
  // The image file must be in the data folder of the current sketch 
  // to load successfully
  img = loadImage("alt-images/furin1_trans.png");  // Load the image into the program  
}

void draw() {
   background(0);
  loc.add(vel);
  image(img, loc.x, loc.y);

}
