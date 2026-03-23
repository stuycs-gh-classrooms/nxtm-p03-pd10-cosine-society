int numOrbs = 6;
int min_s = 10;
int max_s = 60;
int min_m = 10;
int max_m = 100;
float gravCon = 1;
float dragCon = 0.1;
Orb[] orbs;

int springLen = 50;
float springCon = 0.006;

int MOVING = 0;
int BOUNCE = 1;
int GRAVITY = 2;
int DRAGF = 4;

boolean[] toggles = new boolean[4];

void setup() {
  size(600, 400);
  makeOrbs(true);
}

void draw() {
  displayOrbs();
}

void makeOrbs(boolean ordered) {
  orbs = new Orb[numOrbs];
  for (int i = 0; i < numOrbs; i ++) {
    if (ordered) {
      orbs[i] = new Orb(i*100, 100, random(min_s, max_s), random(min_m, max_m));
    } else {
      orbs[i] = new Orb();
    }
  }
} // makeOrbs

void displayOrbs() {
  for (int i = 0; i < numOrbs; i++) {
    orbs[i].display();
  }
}
