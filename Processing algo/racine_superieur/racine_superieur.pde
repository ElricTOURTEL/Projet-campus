int puissance;
int racine;
void setup(){
    calculeCarre(143);
    puissance=racine*racine;
    println(puissance);
}
void calculeCarre(float nombre){
  racine = round(sqrt(nombre));
  println(racine);
}
