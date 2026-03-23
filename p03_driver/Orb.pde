class Orb {

  PVector center;
  float size; // diameter
  PVector velocity;
  PVector acceleration;
  boolean charge;
  float chargeMag;
  float mass;

  boolean pos = true;
  boolean neg = false;

  Orb(int x, int y, float s, float m) {
    center = new PVector(x, y);
    size = s;
    mass = m;
    if (random(2) % 2 == 0) {
      charge = pos;
    } else {
      charge = neg;
    }
  } // // Constructor; all but charge specified

  // other constructors, all specified, nothing specified
} // Orb
