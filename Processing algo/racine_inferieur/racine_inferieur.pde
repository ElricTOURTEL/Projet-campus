int puissance;
int racine;
void setup(){
    calculeCarre(143);
    puissance=racine*racine;
    println(puissance);
}
void calculeCarre(int nombre){
  racine = int(sqrt(nombre));
  println(racine);
}
