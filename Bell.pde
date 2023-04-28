class Bell {
  PVector loc;
  PVector vel;
  int id;
  
  Bell(int identity){
    id = identity;
    loc = new PVector(random(width), random(height), random(-10, 10));
    vel = PVector.random3D();
  }
  
  void display(){
    pushMatrix();
    translate(loc.x, loc.y, loc.z);
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
   if (loc.z < -10 || loc.z > 10){ //same as above
      vel.z = vel.z * -1;
    }
    loc = loc.add(vel);
  }
  
  void ring(){
    sounds[id].play();
  }
  
  
}
