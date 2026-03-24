int numOrbs = 6;
int min_s = 10;
int max_s = 60;
int min_m = 10;
int max_m = 100;
float gravCon = 1;
float dragCon = 0.05;
Orb[] orbs;

int springLen = 100;
float springCon = 0.01;

int MOVING = 0;
int BOUNCE = 1;
int GRAVITY = 2;
int DRAGF = 4;
int SPRING = 3;
int MAGNETIC = 5;
int COMBO = 6;

boolean[] toggles = new boolean[7];

void setup() {
  size(600, 400);
  makeOrbs(false);

  toggles[MOVING] = true;
  toggles[BOUNCE] = true;
  toggles[GRAVITY] = true;
}

void draw() {
  background(255);
  drawLines();
  displayOrbs();

  if (toggles[MOVING]) {
    applyForces();

    for (int i = 0; i < numOrbs; i++) {
      orbs[i].move(toggles[BOUNCE]);
      orbs[i].display();
    }
  }
  drawMenu();
  // maybe drawing a line between the orbs?
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


// Apply forces to all orbs based on current mode toggles
void applyForces() {

  for (int i = 0; i < numOrbs; i++) {
    for (int j = 0; j < numOrbs; j++) {
      if (i == j) continue; // skip self

      // Apply gravity if selected
      if (toggles[GRAVITY]) {
        orbs[i].applyForce(orbs[i].getGrav(orbs[j], gravCon));
      }

      // Apply spring force if selected
      if (toggles[SPRING]) {
        orbs[i].applyForce(orbs[i].getSpring(orbs[j], springLen, springCon));
      }

      // Apply magnetic force if selected
      if (toggles[MAGNETIC]) {
        orbs[i].applyForce(orbs[i].getMag(orbs[j], 1));
      }

      // Apply combination mode (gravity + magnetic)
      if (toggles[COMBO]) {
        orbs[i].applyForce(orbs[i].getGrav(orbs[j], gravCon));
        orbs[i].applyForce(orbs[i].getMag(orbs[j], 1));
      }
    }

    // Apply drag force either in drag mode or combination mode
    if (toggles[DRAGF] || toggles[COMBO]) {
      orbs[i].applyForce(orbs[i].getDrag(dragCon));
    }
  }
}

void drawLines() {
  if (toggles[SPRING]) {
    for (int i = 0; i < numOrbs; i++) {
      for (int j = 0; j < numOrbs; j++) {
        if (i == j) continue; // skip self
        if (dist(orbs[i].center.x, orbs[i].center.y, orbs[j].center.x, orbs[j].center.y) < springLen + 50) {
          stroke(#71b77d);
        } else if (dist(orbs[i].center.x, orbs[i].center.y, orbs[j].center.x, orbs[j].center.y) > springLen - 50) {
          stroke(#ff52e3);
        } else {
          stroke(0, 0, 0);
        }
        line(orbs[i].center.x, orbs[i].center.y, orbs[j].center.x, orbs[j].center.y);
      }
    }
  }
} // drawLines

// Set the current simulation mode and turn off all others
void setMode(int m) {
  toggles[GRAVITY] = false;
  toggles[SPRING] = false;
  toggles[DRAGF] = false;
  toggles[MAGNETIC] = false;
  toggles[COMBO] = false;

  toggles[m] = true; // activate selected mode
}

void keyPressed() {

  // Number keys switch simulation modes
  if (key == '1') setMode(GRAVITY);
  if (key == '2') setMode(SPRING);
  if (key == '3') setMode(DRAGF);
  if (key == '4') setMode(MAGNETIC);
  if (key == '5') setMode(COMBO);

  // Space toggles movement on/off
  if (key == ' ') toggles[MOVING] = !toggles[MOVING];

  // B toggles bouncing on/off
  if (key == 'b' || key == 'B') toggles[BOUNCE] = !toggles[BOUNCE];
}

// Draw top menu displaying current simulation mode and status
void drawMenu() {
  fill(0);
  textSize(14);

  String modeName = "";

  if (toggles[GRAVITY]) modeName = "Gravity";
  if (toggles[SPRING]) modeName = "Spring";
  if (toggles[DRAGF]) modeName = "Drag";
  if (toggles[MAGNETIC]) modeName = "Magnetic";
  if (toggles[COMBO]) modeName = "Combination";

  text("Mode: " + modeName, 10, 20);
  text("Movement: " + (toggles[MOVING] ? "ON" : "OFF"), 10, 40);
  text("Bouncing: " + (toggles[BOUNCE] ? "ON" : "OFF"), 10, 60);
}

void displayOrbs() {
  for (int i = 0; i < numOrbs; i++) {
    orbs[i].display();
  }
}
