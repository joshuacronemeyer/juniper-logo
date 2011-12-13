void setup()
{
  size(800,800);
  frameRate(20);
}

float rot0 = 0.0;
float rot1 = 0.0;
float size0 = 1;
float size1 = 1;
int nX, nY;

void draw(){
  background( 255 );  
  JuniperBurst juniper = new JuniperBurst(600,400,rot0,100*size0);
  JuniperBurst juniper2 = new JuniperBurst(200,400,rot1,100*size1);
  rot0 = nY*PI/100;
  size0 = abs(cos(400/(nX+130))) + 1;
  rot1 += PI/500;
  size1 = abs(sin(size1)) + 1;  
  juniper.display();
  juniper2.display();
}

void mouseMoved(){
  nX = mouseX;
  nY = mouseY;  
}

class BasicJShape {
  float x, y;
  float tilt;
  float angle;
  float scalar;
  int alpha;
  
  BasicJShape(int xpos, int ypos, float t, float s, int a) {
    x = xpos;
    y = ypos;
    tilt = t;
    scalar = s / 100.0;
    alpha = a;
  }
  void display() {
    noStroke();
    fill( 0, 121, 184, alpha );  
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
    j0 = new BasicJShape(x, y, (0) + tilt, s, 180);
    j1 = new BasicJShape(x, y, (PI/4) + tilt, s, 100);
    j2 = new BasicJShape(x, y, (PI/2) + tilt, s, 100);
    j3 = new BasicJShape(x, y, (3*PI/4) + tilt, s, 100);
    j4 = new BasicJShape(x, y, (PI) + tilt, s, 100);
    j5 = new BasicJShape(x, y, (5*PI/4) + tilt, s, 100);
    j6 = new BasicJShape(x, y, (3*PI/2) + tilt, s, 100);
    j7 = new BasicJShape(x, y, (7*PI/4) + tilt, s, 100);
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
