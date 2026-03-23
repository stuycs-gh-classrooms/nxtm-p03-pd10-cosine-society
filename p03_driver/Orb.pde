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

  Orb() {
    center = new PVector(random(width), random(height));
    size = random(min_s, max_s);
    mass = random(min_m, max_m);
    velocity = new PVector();
    acceleration = new PVector();
  } // Constructor; none specified

  void move(boolean bounce) {
    if (bounce) {
      bouncex();
      bouncey();
    } // if time, write a function such that balls bounce off other balls? but may be time consuming

    velocity.add(acceleration);
    center.add(velocity);
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    PVector applied = new PVector(force.x, force.y);
    applied.x /= mass;
    applied.y /= mass;
    acceleration.add(applied);
  } // applyForce

  void display() {
    circle(center.x, center.y, size);
  }

  void bouncex() {
    if (center.x - size/2 <= 0 ||
      center.x + size/2 >= width) {
      velocity.x *= -1;
    }
  } // bouncex

  void bouncey() {
    if (center.y - size/2 <= 0 ||
      center.y + size/2 >= height) {
      velocity.y *= -1;
    }
  } // bouncey

  /* PVector getGrav(Orb O, float g) {
   } // function calculating gravity
   
   PVector getDrag(float coef) {
   } // function calculating drag
   
   PVector getSpring(Orb O, float springLength, float k) {
   } // function calculating spring force
   
   // PVector getMag() {
   //} // function calclating magnetic force */

  // other constructors, all specified, nothing specified
} // Orb
