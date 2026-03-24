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
    charge = random(1) < 0.5;
  } // // Constructor; all but charge specified

  Orb() {
    center = new PVector(random(width), random(height));
    size = random(min_s, max_s);
    mass = random(min_m, max_m);
    velocity = new PVector();
    acceleration = new PVector();
    // charge initializes
    charge = random(1) < 0.5; // half the time 
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
    if (charge == true) {
      fill(255, 0, 0); // positive
    } else {
      fill(0, 0, 255); // negative
    }
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

   PVector getGrav(Orb O, float g) {
     PVector force = PVector.sub(O.center, this.center); 
     float distance = constrain(force.mag(), 5, 100); 
     force.normalize(); 
     float strength = g * this.mass * O.mass / (distance * distance); 
     force.mult(strength); 
     return force;
   } // function calculating gravity
   
   PVector getDrag(float coef) {
     PVector drag = velocity.copy(); 
     drag.mult(-1); 
     drag.normalize(); 
     float speed = velocity.mag(); 
     float strength = coef * speed * speed; 
     drag.mult(strength); 
     return drag; 
   } // function calculating drag
   
   PVector getSpring(Orb O, float springLength, float k) {
     PVector force = PVector.sub(this.center, O.center); 
     float distance = force.mag(); 
     float stretch = distance - springLength; 
     
     force.normalize(); 
     force.mult(-k * stretch); 
     return force; 
   } // function calculating spring force
   
   PVector getMag(Orb O, float k) {
     PVector force = PVector.sub(O.center, this.center); 
     float distance = constrain(force.mag(), 5, 100); 
     
     force.normalize(); 
     
     //convert the boolean to show the + and - charges 
     float q1;
     if (this.charge) {
       q1 = 1; 
     } else {
       q1 = -1; 
     }
     
     float q2;
     if (O.charge) {
       q2 = 1; 
     } else { 
       q2 = -1; 
     } 
     
     float strength = k * (q1 * q2) / (distance * distance); 
     force.mult(strength);
     return force; 
     
   } // function calclating magnetic force */

  // other constructors, all specified, nothing specified
} // Orb
