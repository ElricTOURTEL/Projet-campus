int totalPizza = 13;
int livraison = 5;
int numLivraison = 0;
int [] pizzaPourLivraison = {2, 3, 1, 2, 3};
int prixPizza= 10;
int fraisLivraison;


void setup(){
    while(numLivraison<livraison){
        fraisLivraison=3;
        println("Pour la livraison n°" + (numLivraison+1) + " nous avons " + pizzaPourLivraison[numLivraison] + " pizza à livrer");
        prixlivraison();
        calculprixlivraison();
        println("Livraison n°" +(numLivraison+1) + " ,le prix est de " + calculprixlivraison() + "€ pour un total de " + pizzaPourLivraison[numLivraison] + " commandé");
        numLivraison++;
    }
}

void prixlivraison(){
    if (pizzaPourLivraison[numLivraison]>=3){
        fraisLivraison=0;
        println("les frais de livraison  sont à 0 € pour cette commande");
    }
}
int calculprixlivraison(){
    int prixTotal;
    prixTotal=prixPizza*pizzaPourLivraison[numLivraison];
    prixTotal=prixTotal+fraisLivraison;
    return prixTotal;
}