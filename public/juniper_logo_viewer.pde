float rot0 = 0.0;
JuniperBurst juniper0;
final int defaultPetals = 6;

void setup()
{
  size(300,300);
  frameRate(20);
  juniper0 = new JuniperBurst(new Poynt(150,150));
  juniper0.reset(defaultPetals);
}

void draw(){
  background( 255 );
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