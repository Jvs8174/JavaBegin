int heighty = 270;
boolean keyReleased = false;

void setup() { 
  size(1000, 600);
}

void draw(){
  frameRate(45);
  background(80,80,80);
  rect(300,heighty,30,30);
    if (keyReleased) {
    heighty += 1; // Move the rectangle down
  }
}

void keyPressed(){
  if(key == 'w'){
    heighty=heighty-1;

  // When a key is pressed, we don't want to move the rectangle
  keyReleased = false;
  }
}

void keyReleased() {
  // When a key is released, start moving the rectangle down
  keyReleased = true;
}
