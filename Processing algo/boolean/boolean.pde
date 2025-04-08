IntList chemin;
boolean trou=false;
float size;
int convertsize;
int deplacement;
void creationchemin(){
  int i=0;
  chemin = new IntList();
  chemin.append(0);
  while(chemin.size() < convertsize){
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
    boolean choix = (i+2 < chemin.size() && chemin.get(i+2)==1 || i+1<chemin.size() && chemin.get(i+1)==1);
    if(choix){
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
