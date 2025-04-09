IntList chemin; // je crée une liste d'integet
StringList animaux; // je crée une liste de texte
float size; // je crée une variable en décimal pour la taille de mon chemin
int convertsize; // je crée une variable en integer pour stocker la conversion de ma taille
int deplacement; // Je crée une variable en integer qui va me permettre de savoir sur quelle case je suis
Table table; // je crée une variable tableau
void creationchemin(){
  int i=0;
  chemin = new IntList(); // J'initialise la liste de chemin
  chemin.append(0); // la première valeur de la liste est mise à 0 (chemin sur)
  animaux = new StringList(); // J'initialise la liste d'animaux
  animaux.append("tiger"); // la premiière valeur de cette liste est mise sur tiger
  table=new Table(); // J'initialise le tableau
  table.addColumn("Chemin"); // Je rajoute une colonne appelé Chemin
  table.addColumn("Animaux"); // Je rajoute une colonne appelé animaux
  TableRow newRow = table.addRow(); // je rajoute une ligne vide
  newRow.setInt("Chemin", chemin.get(0)); // sur cette ligne vide je lui dis que la colonne chemin prendra la première valeur de ma liste chemin soit 0
  newRow.setString("Animaux", animaux.get(0)); // sur cette ligne vide je lui dis que la colonne animaux prendra la première valeur de ma liste animaux soit tiger
  String[] words = {"tiger", "lion", "elephant", "dog"}; //je crée mon array en texte cette variable qui contient les valeurs s'appelle words et contient les 4 mots suivants
  while(chemin.size() < convertsize){ // je crée une boucle qui continue tant que la taille de ma liste chemin est inférieur à la taille de mon chemin pour ne pas dépasser ma liste
    String animal = words[(int(random(words.length)))]; // je fais un randomiser random va me sortir un float entre 0 et 4 mais les indices des tableaux sont des nombres entier donc on le convertit en integer qui arrondit toujours à l'inférieur tant mieux notre liste est indexé de 0 à 3 et non 4
    animaux.append(animal); // à chaque itération on prends le mot choisi et on le stock dans la liste animaux
    println(animaux);
    if (chemin.get(i)==0){ // si la liste chemin à notre itération en cours cad la case i qui commennce à 0 a une valeur stocké = 0 cad chemin sur alors on execute la suite sinon on passe au else
     int val = int(random(2));
     chemin.append(val);
     println(chemin);
    }
    else{
      chemin.append(0); // le chemin a renvoyé une valeur stocké de 1 on ne peut pas mettre deux trous sinon le jeu serait infaisable du coup on met un 0 dans notre liste
    }
    TableRow addRow = table.addRow(); // Je rajoute une ligne vide 
    addRow.setInt("Chemin", chemin.get(i + 1)); // sur cette ligne vide je lui donne pour la colonne chemin la valeur stocké en i + 1 cad qu'on commence à 1
    addRow.setString("Animaux", animaux.get(i+1));  // pareil qu'au dessus
    i++; // j'incremente pour qu'il verifie les cases suivante et indexe dans le tableaux les bonnes données
  }
  println(chemin);
    for (TableRow row : table.rows()) {
    println("Chemin: " + row.getInt("Chemin") + ", Animal: " + row.getString("Animaux"));
  }
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

void setup(){
  size(1000,1000);
  deplacement = 0;
  size = random(0, 50);
  convertsize = int(size);
  println(chemin);
  println(convertsize);
  creationchemin();
  parcours();
}
