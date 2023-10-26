Particle[] field;

void setup()
{
  size(500,500);
  background(0);
  noStroke();
  
  field = new Particle[300];
  
  for(int i = 0; i < field.length; i++){
    field[i] = new Particle();
  }
  for(int i = field.length-10; i < field.length; i++){
    field[i] = new OddballParticle();
  }
}
void draw(){
  fill(0,0,0,10);
  rect(0,0,500,500);
  
  for(int i = 0; i < field.length; i++){
    field[i].show();
    field[i].move();
    field[i].reset();
  }
}

class Particle{
  double x, y, angle, speed;
  int r, g, b;
  float size;
  
  Particle(){
    x = 250;
    y = 250;
    r = 255;
    g = 255;
    b = 255;
    speed = Math.random()*2+1;
    size = (float)(speed*speed*speed);
    angle = (Math.random()*360);
  }//constructor end
  
  void move(){
    x = x + ((Math.cos(angle))*speed);
    y = y + ((Math.sin(angle))*speed);
  }//move end
  
  void show(){
    fill(r,g,b);
    size = size*((dist(250,250,(float)x,(float)y)/400))+3;
    ellipse((float)x, (float)y, size, size);
  }
  
  void reset(){
    if((x>500)||(x<0)||(y>500)||(y<0)){
      x = 250;
      y = 250;
      size = 2;
      angle = (Math.random()*360);
    }
  }
}//particle class end

class OddballParticle extends Particle{
  OddballParticle(){
    x = 250;
    y = 250;
    r = 255;
    g = 0;
    b = 0;
    size = 50;
    speed = 1.5;
    angle = (Math.random()*360);
  }
}
