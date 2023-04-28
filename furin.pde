import processing.sound.*;

int bellCount = 113;
PImage[] bellPics = new PImage[bellCount];
SoundFile[] sounds = new SoundFile[bellCount];
Bell[] bells = new Bell[bellCount];


void setup(){
  size(1920, 1080, P3D);
  
  for (int i = 1; i < bellCount+1; i++ ){
    bellPics[i-1] = loadImage("images/"+i+" (2).jpg");
    bellPics[i-1].resize(208, 320);
    //sounds[i] = new SoundFile(this, "sounds/"+i+".mp3");
    bells[i-1] = new Bell(i-1);
  }
  println("done loading images");
  
}

void draw(){
 background(0);
 for (Bell b : bells){
   b.move();
   b.display();
 }
  
}
