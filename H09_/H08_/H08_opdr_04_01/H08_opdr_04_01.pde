int xWaarde = 50;
int yWaarde = 50;

size(500,500);
background(255,255,255);

for(int i = 0; i < 10; i++) {
  for( int j = 0; j < 10; j++) {
   rect(xWaarde, yWaarde,5,5);
   yWaarde += 15;
  }
  yWaarde = 50;
  xWaarde += 15;
}
