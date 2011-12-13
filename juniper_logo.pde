float rot0 = 0.0;
int nX, nY;
JuniperBurst juniper0;

void setup()
{
  size(800,800);
  frameRate(20);
  juniper0 = new JuniperBurst(new Poynt(400,400));
  juniper0.reset();
}

void draw(){
  background( 255 );  
   
  if(keyPressed) {
    if (key == CODED) {
      if (keyCode == UP) {
        juniper0.addJShape();
      } else if (keyCode == DOWN) {
        juniper0.removeJShape();
      } else if (keyCode == LEFT) {
        juniper0.thinner();
      } else if (keyCode == RIGHT) {
        juniper0.fatter();
      }
    }
    if (key == ESC) {
      juniper0.reset();
    }
  }
  rot0 += PI/500;
  juniper0.setTilt(rot0);
  juniper0.display();
}

void mouseMoved(){
  nX = mouseX;
  nY = mouseY;  
}

class BasicJShape {
  float tilt, scalar;
  int alpha;
  Poynt center, topLeft, topRight, bottom;
  final int defaultCurve = -115;
  
  BasicJShape(Poynt c, float t, float s, int a) {
    center = c;
    tilt = t;
    scalar = s / 100.0;
    alpha = a;
    topLeft = new Poynt(-33, -50);
    topRight = new Poynt(33, -50);
    bottom = new Poynt(0, 70);
  }
  
  void display() {
    noStroke();
    fill( 0, 121, 184, alpha );  
    pushMatrix();
    translate(center.getX(), center.getY());
    rotate(tilt);
    scale(scalar);
    beginShape();  
    vertex(topLeft.getX(), topLeft.getY());
    bezierVertex(topLeft.getX() - 15, defaultCurve, topRight.getX() + 15, defaultCurve, topRight.getX(), topRight.getY());
    vertex(bottom.getX(), bottom.getY());
    endShape();
    popMatrix();
  }
  
  void setTilt(float t) {
    tilt = t;
  }
  
  void fatness(int f){
    int half = (int)(f/2);
    topLeft = new Poynt(-half, -50);
    topRight = new Poynt(half, -50);
  }
  
}

class JuniperBurst {
  Poynt position;
  float scalar, tilt;
  ArrayList jShapes;
  int fatness;
  final int default_fatness = 68;
  final int first_node_default_alpha = 180;
  final int default_alpha = 100;
  
  JuniperBurst(Poynt pos) {
    fatness = default_fatness;
    position = pos;
    scalar = 200;
    tilt = 0;
    jShapes = new ArrayList();
  }
  
  void display() {
    for(int i=0; i < jShapes.size(); i++) {
      jShapes.get(i).setTilt(pointOrientation(i) + tilt);
      jShapes.get(i).fatness(fatness);
      jShapes.get(i).display();
    } 
  }
  
  void addJShape(){
    int alpha = default_alpha;
    if (jShapes.size() == 0) {
      alpha = first_node_default_alpha;
    }
    jShapes.add(new BasicJShape(position, tilt, scalar, alpha));
  }
  
  void removeJShape(){
    jShapes.remove(jShapes.size() - 1);
  }
  
  void setTilt(float t) {
    tilt = t;
  }
  
  void setScalar(float s) {
    scalar = s;
  }
  
  void fatter() {
    fatness += 1;
  }
  
  void thinner() {
    fatness -= 1;
  }
  
  float pointOrientation(int index) {
    return ((2*index)*PI/jShapes.size());
  }
  
  void reset() {
    fatness = default_fatness;
    jShapes = new ArrayList();
    for(int i=0; i < 6; i++) {
      addJShape();
    }
  }
}

class Poynt {
  int x;
  int y;
  
  Poynt(int thatX, int thatY) {
    x = thatX;
    y = thatY;
  }

  int getX() {
    return x;
  }
  
  int getY() {
    return y;
  }
}