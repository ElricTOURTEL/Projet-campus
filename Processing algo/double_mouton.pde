void setup(){
  size(1400, 1400);
  mouton(100, 100);
  mouton(600, 100);
}
void mouton(int x, int y){
  fill(0, 0, 0);
  rect(120+x, 80+y, 300, 200);
  noFill();
  fill(255, 255, 255);
  rect(120+x, 280+y, 50, 100);
  rect(200+x, 280+y, 50, 100);
  rect(280+x, 280+y, 50, 100);
  rect(360+x, 280+y, 50, 100);
  rect(420+x, 80+y, 150, 100);
  ellipse(520+x, 100+y, 5, 5);
}
