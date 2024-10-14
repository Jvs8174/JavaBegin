int heightX = 100;
int heightY = 200;
int speedY = 0;
boolean SpacePressed = false;

void setup() {
  size(500, 600);
}

void draw() {
  background(80, 80, 80);
  updateHelicopter();
  displayHelicopter();
}

void updateHelicopter() {
  if (!SpacePressed) {
    speedY += 1;
  } else {
    speedY -= 2;
  }

  if (speedY > 5) speedY = 5;
  if (speedY < -5) speedY = -5;

  heightY += speedY;

  if (heightY < 0) {
    heightY = 0;
    speedY = 0;
  }
  if (heightY > height - 30) {
    heightY = height - 30;
    speedY = 0;
  }
}

void displayHelicopter() {
  fill(255, 0, 0);
  rect(heightX, heightY, 30, 30);

}

void keyPressed() {
  if (key == ' ') {
    SpacePressed = true;
  }
}

void keyReleased() {
  if (key == ' ') {
    SpacePressed = false;
  }
}
