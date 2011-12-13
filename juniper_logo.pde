void setup()
{
  size(400,400);
  frameRate(20);
}
float rot = 0.0;
float pulse = 1;
void draw(){  
  X = width / 2;  
  Y = height / 2;
  background( 255 );  
  JuniperBurst juniper = new JuniperBurst(200,200,rot,100*pulse);
  rot += PI/500;
  pulse = abs(sin(rot)) + 1;  
  juniper.display();
}

class BasicJShape {
  float x, y;
  float tilt;
  float angle;
  float scalar;
  
  BasicJShape(int xpos, int ypos, float t, float s) {
    x = xpos;
    y = ypos;
    tilt = t;
    scalar = s / 100.0;
  }
  void display() {
    noStroke();
    fill( 0, 121, 184, 100 );  
    pushMatrix();
    translate(x, y);
    rotate(tilt);
    scale(scalar);
    beginShape();
    vertex(-25,-50);
    bezierVertex(-25, -90, 25, -90, 25, -50);
    vertex(0, 70);
    endShape();
    popMatrix();
  }
}

class JuniperBurst {
  float x, y, scalar, tilt;
  BasicJShape j0,j1,j2,j3,j4,j5,j6,j7;
  JuniperBurst(int xpos, int ypos, float t, float s) {
    x = xpos;
    y = ypos;
    scalar = s;
    tilt = t;
    j0 = new BasicJShape(x, y, (0) + tilt, s);
    j1 = new BasicJShape(x, y, (PI/4) + tilt, s);
    j2 = new BasicJShape(x, y, (PI/2) + tilt, s);
    j3 = new BasicJShape(x, y, (3*PI/4) + tilt, s);
    j4 = new BasicJShape(x, y, (PI) + tilt, s);
    j5 = new BasicJShape(x, y, (5*PI/4) + tilt, s);
    j6 = new BasicJShape(x, y, (3*PI/2) + tilt, s);
    j7 = new BasicJShape(x, y, (7*PI/4) + tilt, s);
  }
  void display() { 
    j0.display();
    j1.display();
    j2.display();
    j3.display();
    j4.display();
    j5.display();
    j6.display();
    j7.display();
  }
}
