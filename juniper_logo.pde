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
    if (key == 'x') {
      juniper0.addJShape();
    }
    if (key == 'z') {
      juniper0.removeJShape();
    }
    if (key == 'y') {
      juniper0.fatter();
    }
    if (key == 'u') {
      juniper0.thinner();
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
  
  JuniperBurst(Poynt pos) {
    fatness = 68;
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
    jShapes.add(new BasicJShape(position, tilt, scalar, 100));
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
    jShapes = new ArrayList();
    jShapes.add(new BasicJShape(position, (0) + tilt, scalar, 180));
    for(int i=0; i < 5; i++) {
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