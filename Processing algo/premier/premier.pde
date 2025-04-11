int suite;
void setup(){
  premier(47);
}
void premier(int premier){
  for(int i=2; i <= sqrt(premier);i++){
    if (premier%i!=0){
      println("Ce nombre est encore premier");
      println(premier%i);
    }
    else{
      println("Ce nombre n'est pas premier");
      println(premier%i);
      i=int(sqrt(premier));
    }
  }
}
