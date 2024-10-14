int helicopterX = 100;
int helicopterY = 200;
int speedY = 0;
boolean spacePressed = false;

int buildingWidth = 60;
int buildingGap = 180;
int numBuildings = 3;
int[] buildingX;
int[] buildingGapPosition;

int score = 0;
boolean[] passedBuilding;

void setup() {
  size(600, 600);
  buildingX = new int[numBuildings];
  buildingGapPosition = new int[numBuildings];
  passedBuilding = new boolean[numBuildings];
  
  for (int i = 0; i < numBuildings; i++) {
    buildingX[i] = width + i * (buildingWidth + 150);
    buildingGapPosition[i] = (int) random(100, height - 200);
    passedBuilding[i] = false;
  }
}

void draw() {
  background(80, 80, 80);
  updateHelicopter();
  displayHelicopter();
  updateBuildings();
  displayBuildings();
  checkScore();
  displayScore();
  
  if (checkCollision()) {
    resetGame();
  }
}

void updateHelicopter() {
  if (!spacePressed) {
    speedY += 1;
  } else {
    speedY -= 2;
  }

  speedY = constrain(speedY, -5, 5);
  helicopterY += speedY;
  helicopterY = constrain(helicopterY, 0, height - 30);
}

void displayHelicopter() {
  fill(255, 0, 0);
  rect(helicopterX, helicopterY, 30, 30);
 
}

void updateBuildings() {
  for (int i = 0; i < numBuildings; i++) {
    buildingX[i] -= 2;

    if (buildingX[i] + buildingWidth < 0) {
      buildingX[i] = width;
      buildingGapPosition[i] = (int) random(100, height - 200);
      passedBuilding[i] = false;
    }
  }
}

void displayBuildings() {
  fill(100, 100, 100);

  for (int i = 0; i < numBuildings; i++) {
    rect(buildingX[i], 0, buildingWidth, buildingGapPosition[i]);
    rect(buildingX[i], buildingGapPosition[i] + buildingGap, buildingWidth, height - (buildingGapPosition[i] + buildingGap));
  }
}

boolean checkCollision() {
  for (int i = 0; i < numBuildings; i++) {
    if (helicopterX + 60 > buildingX[i] && helicopterX < buildingX[i] + buildingWidth) {
      if (helicopterY < buildingGapPosition[i] || helicopterY + 30 > buildingGapPosition[i] + buildingGap) {
        return true;
      }
    }
  }
  return false;
}

void checkScore() {
  for (int i = 0; i < numBuildings; i++) {
    if (!passedBuilding[i] && helicopterX > buildingX[i] + buildingWidth) {
      score++;
      passedBuilding[i] = true;
    }
  }
}

void displayScore() {
  fill(0);
  textSize(32);
  text("Score: " + score, 10, 40);
}

void resetGame() {
  helicopterY = 200;
  speedY = 0;
  score = 0;

  for (int i = 0; i < numBuildings; i++) {
    buildingX[i] = width + i * (buildingWidth + 150);
    buildingGapPosition[i] = (int) random(100, height - 200);
    passedBuilding[i] = false;
  }
}

void keyPressed() {
  if (key == ' ') {
    spacePressed = true;
  }
}

void keyReleased() {
  if (key == ' ') {
    spacePressed = false;
  }
}
