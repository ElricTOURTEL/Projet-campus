IntList chemin;
StringList animaux;
float size;
int convertsize;
int deplacement;
void creationchemin(){
  int i=0;
  chemin = new IntList();
  chemin.append(0);
  animaux = new StringList();
  animaux.append("tiger");
  String[] words = {"tiger", "lion", "elephant", "dog"};
  while(chemin.size() < convertsize){
    String animal = words[(int(random(words.length)))];
    animaux.append(animal);
    println(animaux);
    if (chemin.get(i)==0){
     int val = int(random(2));
     chemin.append(val);
     println(chemin);
    }
    else{
      chemin.append(0);
    }
    i++;
  }
  println(chemin);
}

void parcours(){
  for (int i=0; i < chemin.size();){
    if(i+2 <chemin.size() && chemin.get(i+2) == 1 || i+1<chemin.size() && chemin.get(i+1) == 1){
      walk();
      i=deplacement;
      println(deplacement);
    }
    else{
      jump();
      i=deplacement;
      println(deplacement);
    }
  }
}

void walk(){
  deplacement=deplacement+1;
}
void jump(){
  deplacement=deplacement+2;
}
void tableau(){
  println("Chemin\tAnimal");
  println("--------------");
  for (int i = 0; i < chemin.size(); i++){
    int val = chemin.get(i);
    String animal = animaux.get(i);
    println(val + "\t" + animal);
  }
}
void afficherTableauGraphique() {
  textSize(16);      // Taille du texte
  fill(0);           // Couleur du texte : noir

  int startX = 500;       // Position X de départ pour les colonnes
  int startY = 50;       // Position Y de départ pour le tableau
  int lineHeight = 20;   // Hauteur entre chaque ligne

  // Affiche les titres des colonnes
  text("Chemin", startX, startY);
  text("Animal", startX + 100, startY);  // 100 pixels plus loin pour la colonne 2

  // Affiche chaque ligne du tableau
  for (int i = 0; i < chemin.size(); i++) {
    int y = startY + (i + 1) * lineHeight;   // Calcule la position verticale de la ligne
    text(chemin.get(i), startX, y);          // Affiche la valeur de chemin
    text(animaux.get(i), startX + 100, y);   // Affiche l’animal associé
  }
}

void setup(){
  size(1000,1000);
  deplacement = 0;
  size = random(0, 50);
  convertsize = int(size);
  println(chemin);
  println(convertsize);
  creationchemin();
  parcours();
  tableau();
  afficherTableauGraphique();
}
