Particle[] dust;

void setup(){
  size(1000, 1000);
  dust = new Particle[666];
  for (int i = 0; i < dust.length; i++){
    dust[i] = new NormalParticle();
    dust [0] = new OddballParticle();
    dust [1] = new JumboParticle();
  }
}

void draw(){
  background(0);
  for (int i = 0; i < dust.length; i++){
    dust [i].move();
    dust [i].show();
  }
}

void mousePressed(){
  for(int i = 0; i < dust.length; i++){
    dust[i] = new NormalParticle();
  }
  dust[665] = new OddballParticle();
}

class NormalParticle implements Particle{
  double myX, myY, myAngle, mySpeed;
  float myColor;
  NormalParticle(){
    myY = myX = 500;
    mySpeed = (Math.random()*0.5) + 1;
    myAngle = (Math.random()*3)*Math.PI;
    myColor = (255);
  }
  public void move(){
    myX = (Math.cos(myAngle) *mySpeed) + myX;
    myY = (Math.sin(myAngle) *mySpeed) + myY;
  }
  public void show(){
    fill(myColor,50,50);
    ellipse((float)myX, (float)myY, 10,10);
    stroke(myColor-59, myColor+100, myColor-100);
  }
}

interface Particle{
  public void move();
  public void show();
}

class OddballParticle implements Particle{
  float myX, myY;
  OddballParticle(){
    myY = myX = (int)(Math.random()*5);
  }
  public void show(){
    fill(255);
    ellipse((float) myX, (float) myY, 20, 20);
  }
  public void move(){
    myX= (int)(Math.random()*500)+250;
    myY= (int)(Math.random()*500)+250;
  }
}

class JumboParticle extends NormalParticle{
  public void show(){
    fill (135,223,124);
    ellipse((float)myX, (float)myY, 25,25);
  }
}
