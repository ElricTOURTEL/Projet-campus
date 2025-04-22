String mysteryWord = "leopard";
char [] tablemysteryWord = new char [mysteryWord.length()];
boolean [] reveal = new boolean [mysteryWord.length()];
String newmysteryWord="";
char lettreUtilisateur;
boolean victory=false;
int tryNumber=(tablemysteryWord.length)+3;
int compteurtryNumber=0;
int compteurImage=0;
PImage [] images = new PImage[8];

void setup() {
  size(1000, 1000);
  stockage();
}
void draw() {
  if (!victory && compteurtryNumber < tryNumber) {
    game(); // Un tour de jeu par frame
  } else {
    if (victory) {
      println("🎉 Congratulations, you won!");
    } else {
      println("❌ You lost! The word was: " + mysteryWord);
    }
    noLoop(); // Stoppe draw() pour éviter de relancer la partie
  }
  if (compteurtryNumber>tryNumber-8) {
    println(compteurImage);
    images[compteurImage]=loadImage("image"+(compteurImage)+".png");
    image(images[compteurImage], 0, 0, 500, 500);
    compteurImage++;
  }
}

void input() {
  lettreUtilisateur = javax.swing.JOptionPane.showInputDialog(null,
    "Tapez une lettre ?").charAt(0);
}

void comparaison() {
  boolean found=false;
  for (int i = 0; i < tablemysteryWord.length; i++) {
    if (tablemysteryWord[i]==lettreUtilisateur) {
      reveal[i]=true;
      found = true;
    }
    }
   if (!found){
     compteurtryNumber++;
     println("Lettre incorrecte. Essai n°" + compteurtryNumber);
   }
}
void stockage() {
  int i=0;
  while (i<mysteryWord.length()) {
    tablemysteryWord[i]=mysteryWord.charAt(i);
    i++;
  }
}
void affichagemysteryWord() {
  int i=0;
  newmysteryWord="";
  while (i<mysteryWord.length()) {
    if (reveal[i]) {
      newmysteryWord+=tablemysteryWord[i];
    } else {
      newmysteryWord+="*";
    }
    i++;
  }
  println(newmysteryWord);
}

void victory() {
  for (int i=0; i< tablemysteryWord.length; i++) {
    if (reveal[i]==true && compteurtryNumber<tryNumber) {
      victory=true;
    } else if (compteurtryNumber>=tryNumber) {
      victory=false;
      println("You lost");
      break;
    } else {
      victory=false;
      break;
    }
  }
}
void game() {
      input();
      comparaison();
      affichagemysteryWord();
      victory();
}
