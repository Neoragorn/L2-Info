(**
   Module destine a la representation des combinaisons du poker

   @author FIL - IEEA - Univ. Lille 1
*)

(** {2 Le type de donnees} *)

(**
   Au poker, les combinaisons d'une main peuvent etre dans l'ordre decroissant de valeur :
   - une quinte flush
   - un carre
   - un full
   - une couleur
   - une suite
   - un brelan
   - une double paire
   - une paire
   - une main vide (aucune combinaison)
*)
type combinaison

(** {2 Procedure d'impression d'une combinaison} *)

(**
   [imprimer c] imprime la combinaison [c].
*)
val imprimer : combinaison -> unit

(** {2 Evaluation d'une main au poker} *)

(**
   [evalue m] donne la combinaison de valeur maximale presente dans la main [m].
*)
val evalue : Main.main -> combinaison

(** {2 Comparaison de combinaisons} *)

(**
   [compare c1 c2]
   - = -1 si la combinaison [c1] est inferieure a la combinaison [c2]
   - = 1 si la combinaison [c1] est superieure a la combinaison [c2]
   - = 0 si les deux combinaisons sont de meme niveau.
*)
val compare : combinaison -> combinaison -> int
