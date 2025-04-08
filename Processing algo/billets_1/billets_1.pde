float prixbillets = 10.5;
void setup(){
  calculePrix(9);
}

void calculePrix(float nombredebillets){
  float prixTotal=nombredebillets*prixbillets;
  println(prixTotal);
}
