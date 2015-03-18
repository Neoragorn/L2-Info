(**
   Module destine a la representation des cartes

   @author FIL - IEEA - Univ. Lille 1
*)

(** {2 Les types de donnees} *)

type hauteur 
and couleur 
and carte

(** {2 Constructeur et selecteurs} *)

(**
   [cree s n] renvoie une carte dont la couleur est donnee par [s] et la hauteur par [n].

   {b CU :} [s] ne peut prendre que l'une des quatre valeurs 
   - ['T'] pour trefle
   - ['P'] pour pique
   - ['K'] pour carreau
   - ['C'] pour coeur
   Sinon, declenchement de l'exception [Failure "Carte.cree : couleur non valide"].

   [n] doit etre un entier compris entre 1 et 13 avec la correspondance
   - [1] pour un as
   - [11] pour un valet
   - [12] pour une dame
   - [13] pour un roi
   - les autres valeurs representant elles-memes.
   Sinon, declenchement de l'exception [Failure "Carte.cree : hauteur non valide"].
*)
val cree : char -> int -> carte

(**
   [couleur c] renvoie la couleur de la carte [c].
*)
val couleur : carte -> couleur


(**
   [hauteur c] renvoie la hauteur de la carte [c].
*)
val hauteur : carte -> hauteur


(** {2 Fonctions de comparaison} *)

(**
   [hauteurs_consecutives h1 h2] = 
   - [true] si les deux hauteurs sont consecutives
   - [false] sinon
*)
val hauteurs_consecutives : hauteur -> hauteur -> bool

(**
   [compare_hauteurs h1 h2] compare les hauteurs [h1] et [h2].
   - = -1 si la hauteur [h1] est plus petite que [h2]
   - = 1 si la hauteur [h1] est plus grande que [h2]
   - = 0 si les hauteurs sont egales.
*)
val compare_hauteurs : hauteur -> hauteur -> int


(**
   [compare_cartes c1 c2] compare les hauteurs des cartes [c1] et [c2].
   - = -1 si la hauteur de [c1] est plus petite que celle de [c2]
   - = 1 si la hauteur de [c1] est plus grande que celle de [c2]
   - = 0 si les hauteurs sont egales.
*)
val compare_cartes : carte -> carte -> int
(**
   {b Remarque : } on peut aussi tester l'egalite de deux cartes avec l'operateur [=].
*)

(** {2 Procedures d'mpression} *)

(**
   [imprimer_couleur c] imprime la couleur [c].
   Un trefle est imprime [T], un pique [P], un carreau [K] et un coeur [C].
*)
val imprimer_couleur : couleur -> unit

(**
   [imprimer_hauteur] imprime la couleur [h].
*)
val imprimer_hauteur : hauteur -> unit

(**
   [imprimer_carte c] imprime la carte [c].
   L'ipression se fait sur deux caracteres :
   - le premier pour la hauteur
   - et le second pour la couleur.
   
   L'impression d'un roi de carreau produit donc [RK].
*)
val imprimer_carte : carte -> unit

(** {2 Constructions de paquet de cartes}*)

(**
   [paquet_ordonne ()] renvoie un tableau contenant les 52 cartes d'un jeu de poker.
   Ces cartes sont rangees par couleurs T, C, P, K, puis au sein d'une couleur dans l'ordre As, 2, 3, ..., Roi.
*)
val paquet_ordonne : unit -> carte array

(**
   [battre_paquet ()] renvoie un tableau contenant les 52 cartes d'un jeu de poker dans un ordre quelconque.
*)
val battre_paquet : unit -> carte array
