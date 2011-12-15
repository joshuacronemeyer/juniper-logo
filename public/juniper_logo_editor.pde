float rot0 = 0.0;
JuniperBurst juniper0;
final int defaultPetals = 6;

void setup()
{
  size(800,800);
  frameRate(20);
  juniper0 = new JuniperBurst(new Poynt(400,400));
  juniper0.reset(defaultPetals);
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
      juniper0.reset(defaultPetals);
    }
  }
  rot0 += PI/500;
  juniper0.setTilt(rot0);
  juniper0.display();
}

JuniperBurst getBurst(){
  return juniper0;
}

void setBurst(JuniperBurst burst, int petalCount){
  juniper0 = burst;
  juniper0.resetPetals(petalCount);
}