Particle[] field;

void setup()
{
  size(500,500);
  background(0);
  
  field = new Particle[100];
  
  for(int i = 0; i < field.length; i++){
    field[i] = new Particle(250,250);
  }
}
void draw(){
  fill(0,0,0,20);
  rect(0,0,500,500);
  
  for(int i = 0; i < field.length; i++){
    field[i].show();
    field[i].move();
    field[i].reset();
  }
}
class Particle extends OddballParticle{
  double x, y, angle, speed;
  int r, g, b;
  float size;
  Particle(int X, int Y){
    x = X;
    y = Y;
    r = 255;
    g = 255;
    b = 255;
    size = 10;
    speed = 1.5;
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

class OddballParticle //inherits from Particle
{
  //your code here
}
