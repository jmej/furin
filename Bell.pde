class Bell {
  PVector loc;
  PVector vel;
  int id;
  boolean playing;
  int playTimer;
  
  Bell(int identity){
    id = identity;
    loc = new PVector(random(width), random(height), 0);
    vel = PVector.random3D();
  }
  
  void display(){
    pushMatrix();
    translate(loc.x, loc.y);
    imageMode(CENTER);
    image(bellPics[id], 0, 0);
    popMatrix();
  }
  
  void move(){
    if (loc.x < 0 || loc.x > width){ //todo: add a half-bell offset
      vel.x = vel.x * -1;
    }
    if (loc.y < 0 || loc.y > height){ //same as above
      vel.y = vel.y * -1;
    }
   //if (loc.z < -10 || loc.z > 10){ //same as above
   //   vel.z = vel.z * -1;
   // }
    loc = loc.add(vel);
    for (int i = 0; i < bellCount; i++){
      if (i != id && id != 666){
        //incomplete collision logic below
        //if(loc.x < (bells[i].loc.x + 5) && loc.x > (bells[i].loc.x - 5)) && loc.y + bellPics[i].height/2 < bells[i].loc.y + bellPics[i].height/2 && loc.y - bellPics[i].height/2 > bells[i].loc.y - bellPics[i].height/2){
        //if(dist(loc.x, loc.y, bells[i].loc.x, bells[i].loc.y) < 40){
        //  vel.x = vel.x * -1;
        //  vel.y = vel.y * -1;
        //  //ringing this much breaks things
        //  ring();
        //}
      }
    }
  }
  
  void ring(){
    if(!playing){
      sounds[id].play(1.0, 1.0);
      playTimer = millis();
      playing = true;
    }
    if (millis() > playTimer + 5000){ //re-arm after 5 seconds
      playing = false;
    }
  }
  
  
}
