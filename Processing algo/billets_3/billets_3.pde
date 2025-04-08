float prixbillets = 10.5;
void setup(){
  float total = calculePrix(4);
  println(total,"€");
}

float calculePrix(float nombredebillets){
  if (nombredebillets>5){
    prixbillets=9;
  }
  float prixTotal=nombredebillets*prixbillets;
  return prixTotal;
}
