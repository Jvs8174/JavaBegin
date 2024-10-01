float x;
float y;
float Punten = 0;

void setup(){
  size (800,800);
  frameRate (1000);
  x = 0;
  y = 0;
  
}

void draw(){
  background (255,255,255);
  ellipse (x,y,100,100);
  x++;
  y++;
  
  if(y > 800){
    y = 0;
  }
  if(x > 800){
    x = 0;
  }
   if(x == 800){
    Punten++; 
  }
  fill(0,255,0);
  textSize (50);
  text ("PUNTEN: " + Punten,400,150);
}
