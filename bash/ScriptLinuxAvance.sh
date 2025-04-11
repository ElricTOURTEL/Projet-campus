#!/bin/bash

# Ecrire un message dans la console;
echo "Hello world !";

# Télécharger et extraire le fichier en anglais
wget https://object.pouta.csc.fi/OPUS-UN/v20090831/mono/en.txt.gz;
gunzip en.txt.gz;

#Traiter le texte (Supprimer chiffres, lignes vides et mettre en minuscules)
sed -e 's/[[:punct:]]//g' -e 's/./\L&/g' -e 's/[0-9]*//g' en.txt | grep -v '^$' > preproc_en.txt;

#Preparer le fichier .csv (mettre tous les mots en colonne, puis supprimer les espaces restants, puis supprimer les espaces en début de chaque ligne, et enfin trier)
sed -e 's/\ /\n/g' preproc_en.txt | sort -h | uniq -c | sort -h | sed -e 's/^[[:space:]]*//g' > occurences_en.csv;
sed -i -e's/\ /,/g' occurences_en.csv;

#Créer l'histogramme avec les 10 mots les plus fréquents
tail 10 occurences_en.csv | awk -F "," '{ print $1 }' | feedgnuplot -p --style data histogram --title "histogram_en" --ylabel "frequence" --xlabel "valeurs"

#Petit RickRoll au passage, désolé ;)
xdg-open "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
