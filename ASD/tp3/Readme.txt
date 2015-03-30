Casier Sofian
Orieux Baptiste
TP 3 ASD

Listes et itérateurs

Question 1)

Il y a une definition de liste_interne dans la definition
de la structure de liste doublement chainée car cela permet
de pouvoir accéder aux cellules que l'on souhaite.

Question 2)

La fonction cellule permet d'accéder à la cellule de la 
liste mis en parametre

Question 9)

Il y a un probleme au niveau de l'impression de la liste.
Ajouter un élément en début ne peut être affiché par la fonction imprimer_avec_iterateur
et ajouter un élément en fin ne peut être affiché par la fonction imprimer_avec_iterateur_envers.
Pour y remedier, il faut utiliser ajouter_en_tete pour mettre à jour le début de la liste lorsque l'on ajoute en debut de liste et
il faut une fonction ajouter_en_queue pour mettre à jour la fin de la liste  lorsque l'on ajoute en fin de liste.

Question 14)

Les fonctions qui ont du etre modifié sont "avancer" et "valeur"

question 17)
let f l =
let it1 = iterateur_en_debut l 
and it2 = iterateur_en_debut l in
supprimer it1


Question 18)

On peut réaliser une liste d'itérateurs qui seront tous indéfinis grâce au booleen
que j'ai ajouté dans la définition du type sauf celui qui est utilié pour supprimer l'élément donné.
Il sera le seul dans la liste à avoir son booleen sur "true".
