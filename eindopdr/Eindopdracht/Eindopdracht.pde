int x = 100;
int y = 300;
int speedY = 0; 
boolean SpacePressed = false;
int[] buildingX = {350, 700};
float[] buildingY = {100, 200};
int buildingWidth = 60;
int ballWidth = 40;
int heightY = 0;
int score = 0;
int frameRate = 60;
int textX = 325;
boolean gameOver = false;  

void setup() {
  size(800, 600);
}

void draw() {
  if (!gameOver) {  
    frameRate(frameRate);
    background(80, 80, 80);
    textSize(300);
    fill(100, 100, 100);
    text(score, textX, 330);
    
    updateHelicopter();
    displayHelicopter();
    updateBuildings();
    displayBuildings();
  
    for (int i = 0; i < buildingX.length; i++) {
      if (x + (ballWidth / 2) >= buildingX[i] && x - (ballWidth / 2) <= buildingX[i] && y + (ballWidth / 2) >= buildingY[i] && y <= buildingY[i] + 300) {
        gameOver = true; 
      }
    }

    for (int i = 0; i < buildingX.length; i++) {
      if (buildingX[i] == 98) {
        score += 1; 
        frameRate += 6;
      }
    }
    
    if (score == 10) {
      textX = 255;
    }
    if (score == 0) {
      textX = 330;
    }
  } else {
    background(90, 90, 90);
    textSize(100);
    fill(150, 150, 150);
    text("YOU LOST", 195, 280);
    fill(255,0,0);
    textSize(60);
    text("YOUR SCORE:",195,170);
    textSize(70);
    text(score,540,173);
    
    fill(180, 180, 180);
    rect(295, 330, 165, 60);
    fill(255);
    textSize(40);
    text("RESTART", 305, 373);
  }
}

void updateBuildings() {
  for (int i = 0; i < buildingX.length; i++) {
    buildingX[i] -= 3;
    if (buildingX[i] < -buildingWidth) {
      buildingX[i] = width;
      buildingY[i] = random(-70, 350);
    }
  }
}

void displayBuildings() {
  fill(65, 65, 65);
  for (int i = 0; i < buildingX.length; i++) {
    rect(buildingX[i], buildingY[i], buildingWidth, 300);
  }
}

void updateHelicopter() {
  if (!SpacePressed) {
    speedY += 1;
  } else {
    speedY -= 2;
  }

  if (speedY > 5) speedY = 5;
  if (speedY < -5) speedY = -5;

  y += speedY;

  if (y < 0) {
    y = 0;
    speedY = 0;
  }
  if (y > height - 30) {
    y = height - 30;
    speedY = 0;
  }
}

void displayHelicopter() {
  fill(200, 200, 200);
  ellipse(x, y, ballWidth, ballWidth);
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

void mousePressed() {
  if (gameOver && mouseX >= 295 && mouseX <= 460 && mouseY >= 290 && mouseY <= 480) {
    restartGame();  
  }
}

void restartGame() {
  x = 100;
  y = 300;
  speedY = 0;
  SpacePressed = false;
  buildingX = new int[] {350, 700};
  buildingY = new float[] {random(-70, 270), random(-70, 270)};
  score = 0;
  frameRate = 60;
  textX = 170;
  gameOver = false;  
}
