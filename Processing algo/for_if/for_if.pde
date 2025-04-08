int position = 0;
void setup(){
  for (int i = 0; i < 7; i += 0){
    if ((i==1) || (i==3)){
      jump();
      i=i+2;
      position=i;
      println(position);
    } else {
      walk();
      i=i+1;
      position=i;
      println(position);
    }
  }
}
void walk(){
  position=position+1;
}
void jump(){
  position=position+2;
}
