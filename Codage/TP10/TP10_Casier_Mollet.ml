(*TP10 Codage
Casier Sofian
Mollet Loick 

Question 3)

1.
cbssm (-3.) 4;; 
Exception: Canal_binaire.Pas_une_proba (-3.).
# cbssm (2.) 4;; 
Exception: Canal_binaire.Pas_une_proba 2..

2.
cbssm 0.5 (-6);; 
Exception: Canal_binaire.Pas_un_octet (-6).
# cbssm 0.5 256;; 
Exception: Canal_binaire.Pas_un_octet 256.

3.

cbssm 0. 3;;
- : int = 3

Si la probabilité est à 0, la fonction renvoit directement l'entier n.

cbssm 1. 3;;
- : int = 252
cbssm 1. 10;;
- : int = 245
cbssm 1. 255;;
- : int = 0

Si la probabilité est à 1, la fonction renvoie 255 - n.

Question 7)

En testant les différents fichiers et en les comparant, ils sont tous différents et remplis d'erreurs
par rapport au texte d'origine.
On denombre 364 erreurs avec 0.1 de proba, ce qui représente déjà  plus de la moitié du texte.
Arrivé à 0.2, on dépasse les 550 erreurs au moins et le texte est déjà méconaissable.

Question 8)

J'ai pu decompresser le fichier, non sans avoir une erreur de la part du programme de decompression.
Le fichier était tout de même lisible, avec 3 erreurs seulement.


ocamlc -o transmission canal_binaire.ml transmission_bruitee.ml
ocamlc -o repeter canal_binaire.ml repete_trois_fois_et_transmet.ml
ocamlc -o decode canal_binaire.ml decode.ml

Question 11)
Le programme de decodage fonctionne. Comparer les fichiers test_cig_repete.txt
et cig_decoded.txt (fichier codé avec une probabilité de 0.01). Le fichier est compréhensible
avec tout de même quelques erreurs encore présentes.

Question 12)
Dès que je passe au dessus de 0.1 de probabilité, le fichier est deja beaucoup moins compréhensible.

*)

