import processing.sound.*;

int bellCount = 113;
PImage[] bellPics = new PImage[bellCount];
SoundFile[] sounds = new SoundFile[bellCount];
Bell[] bells = new Bell[bellCount];

long timer;
int period = 240000; //how many ms before all bells have refreshed


void setup(){
  size(1000, 700, P3D);
  
  for (int i = 1; i < bellCount+1; i++ ){
    if(i != 15 && i != 17 && i != 80 && i != 90 && i != 97){ //hack because images are missing
      bellPics[i-1] = loadImage("alt-images/furin"+i+"_trans.png");
      sounds[i-1] = new SoundFile(this, "sounds/"+i+".mp3");
      bells[i-1] = new Bell(i-1);
    }
    else{
      bellPics[i-1] = loadImage("alt-images/furin1_trans.png"); //valid bell image just in case
      bells[i-1] = new Bell(666); //set the broken bells to id 666 for disuse later
    }
  }
  println("done loading images");
  
}

void draw(){
 timer = millis() % period;
 int firstBell = int(map(timer, 0, period, 0, bellCount-10));
 int lastBell = firstBell + 10;
 background(0);
 for (int i = firstBell; i < lastBell; i++){
   if(bells[i].id != 666){
     bells[i].move();
     bells[i].display();
     if(i == firstBell){
       bells[i].ring();
     }
   }
 }
 println("done");
  
}
