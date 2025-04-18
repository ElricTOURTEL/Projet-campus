String mysteryWord = "leopard";
char [] tablemysteryWord = new char [mysteryWord.length()];
boolean [] reveal = new boolean [mysteryWord.length()];
String newmysteryWord;

void setup() {
    stockage();
    affichagemysteryWord();

}

void input(){
    char lettreUtilisateur = javax.swing.JOptionPane.showInputDialog(null,
    "Tapez une lettre ?").charAt(0);
}

void comparaison(){
    for (int i = 0; i < tablemysteryWord[i]; ++i) {
        if (mysteryWord[i]==lettreUtilisateur) {
            reveal[i]=true;
        }
        
    }
}
void stockage(){
    int i=0;
    while (i<mysteryWord.length()) {
        tablemysteryWord[i]=mysteryWord.charAt(i);
        println(tablemysteryWord[i]);
        i++;
    }
}
void affichagemysteryWord(){
    int i=0;
    while(i<mysteryWord.length()){
        if(reveal[i]){
            newmysteryWord.charAt(i)=tablemysteryWord[i];
        } else{
            newmysteryWord.charAt(i)="*";
        }
        println(newmysteryWord)

    }
}
