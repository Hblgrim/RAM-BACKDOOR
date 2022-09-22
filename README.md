# Unité de calcul FPGA et hardware trojan

Le calcul est une fonction primordiale dans les circuits numériques. Les calculs intermédiaires doivent
en général rester confidentiels afin de ne pas exposer les algorithmes utilisés. Les circuits étant
complexes, il est difficile voire impossible de tester complétement l’intégrité des fonctions réalisées.
Il est donc possible d’ajouter un peu de logique non désirée afin de créer une porte dérobée
(backdoor).

Ce projet est divisé en trois parties. La première partie ou on doit réaliser une unité de calcul FPGA, on va
s'intéresser à 2 calculs : un additionneur de deux vecteurs sur N bit, nombres non signés entiers ou à
virgule fixe, et un multiplicateur de deux vecteurs complexes sur N bit. Après on va comparer les
différentes approches d’implémentation pour le même calcul. Et on va chercher systématiquement à
optimiser le code VHDL, en fonction de différentes grandeurs comme la consommation, le nombre
de LUT (Look Up Table) utilisées ou la fréquence maximale d’utilisation. La deuxième partie, se
caractérise par la réalisation de la RAM « sécurisée » , alors on va réaliser une mémoire possédant
trois parties , une partie de la RAM est accessible sans limitation, la deuxième partie de la RAM n’est
accessible qu’en lecture et la troisième partie de la RAM accessible ni en lecture ni en écriture . La
troisième partie, a pour but de réaliser une porte dérobée dans la mémoire « sécurisée », à l’aide
d’un automate qui détecte une séquence, et une fois séquence détectée il va permettre d’accéder
aux données protégées en lecture/écriture et transmet les données sur une E/S.

## Contenu du dépôt :

- **README.md** : le fichier que vous êtes en train de lire .

- **Le répertoire testbench** : Contenant les fichiers permettant de faire le testbench .

- **Le répertoire vdhl** : Contenant les fichiers vhdl .

- **Le répertoire xdc** : Le répertoire le fichier xdc .
