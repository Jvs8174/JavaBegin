int mijnGetal;


void setup(){
  mijnGetal = optellen(10,10);
  println(mijnGetal);
}


void draw(){
  
}

int optellen(int getal1, int getal2){
  int antwoord = getal1 + getal2;
  return antwoord;
}
