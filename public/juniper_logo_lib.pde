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
  
  String toJSON(){
    return "{center: { x:" + center.getX() + ", y:" + center.getY() + " }, tilt:" + tilt + ", scalar:" + scalar + ", alpha:" + alpha + " }";
  }
  
}

class JuniperBurst {
  Poynt position;
  float scalar, tilt;
  ArrayList petals;
  int fatness;
  final int default_fatness = 68;
  final int first_node_default_alpha = 180;
  final int default_alpha = 100;
  
  JuniperBurst(Poynt pos) {
    fatness = default_fatness;
    position = pos;
    scalar = 200;
    tilt = 0;
    petals = new ArrayList();
  }
  
  JuniperBurst(Poynt pos, int f, float s) {
    fatness = f;
    position = pos;
    scalar = s;
    tilt = 0;
    petals = new ArrayList();
  }
  
  void display() {
    for(int i=0; i < petals.size(); i++) {
      petals.get(i).setTilt(pointOrientation(i) + tilt);
      petals.get(i).fatness(fatness);
      petals.get(i).display();
    } 
  }
  
  void addJShape(){
    int alpha = default_alpha;
    if (petals.size() == 0) {
      alpha = first_node_default_alpha;
    }
    petals.add(new BasicJShape(position, tilt, scalar, alpha));
  }
  
  void removeJShape(){
    petals.remove(petals.size() - 1);
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
    return ((2*index)*PI/petals.size());
  }
  
  void reset(int numberOfPetals) {
    fatness = default_fatness;
    resetPetals(numberOfPetals);
  }
  
  void resetPetals(int numberOfPetals) {
    petals = new ArrayList();
    for(int i=0; i < numberOfPetals; i++) {
      addJShape();
    }
  }
  
  String toJSON() {
    return "{ position:{ x:" + position.getX() + ", y:" + position.getY() + "}, scalar:" + scalar + ", tilt:" + tilt + ", fatness:" + fatness + ", petals:" + petalsToJSON() + " }";
  }
  
  String petalsToJSON() {
    String json = "[";
    for(int i=0; i < petals.size(); i++) {
      json = json + petals.get(i).toJSON();
      if (i < (petals.size() - 1)){
        json = json + ", ";
      }
    }
    json = json + "]";
    return json;
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