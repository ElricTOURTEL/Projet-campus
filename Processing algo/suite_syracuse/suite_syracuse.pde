int suite;
void setup(){
  int suite=int(random(100));
  println(suite);
  while (suite!=1){
    if(suite%2==0){
      suite=suite/2;
    }
    else{
      suite=suite*3;
      suite=suite+1;
    }
    println(suite);
  }
}
