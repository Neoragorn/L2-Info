(**
   Module définissant un type de données pour les listes, ainsi que les opérations primitives les accompagnant.

   @author FIL - IEEA - Univ. Lille1 (oct 2010)
*)

(** {2 Le type} *)

(**
   Le type des listes contenant des éléments de type ['a].
*)
type 'a liste


exception Liste_vide

(** {2 Constructeurs} *)

(**
   La liste vide.
*)
val liste_vide : 'a liste

(**
   [ajoute_en_tete x l] renvoie une liste dont la tête est [x] et le reste [l].
*)
val ajoute_en_tete : 'a -> 'a liste -> 'a liste

(** {2 Sélecteurs} *)

(**
   [tete l] renvoie le premier élément de la liste [l].

   @raise Liste_vide si [l] est vide.
*)
val tete : 'a liste -> 'a

(**
   [reste l] renvoie le reste de la liste [l].

   @raise Liste_vide si [l] est vide.
*)
val reste : 'a liste -> 'a liste

(** {2 Prédicat} *)

(**
   [est_vide l] =
   - Vrai si la liste [l] est vide,
   - Faux sinon
*)
val est_vide : 'a liste -> bool

val imprimer : int liste -> unit

val imprimer2 : ('a -> unit) -> 'a liste -> unit 

val longueur : 'a liste -> int

val n_ieme : 'a liste -> int -> 'a

val dernier : 'a liste ->  'a

val liste_decroissante : int -> int liste

val liste_croissante : int -> int liste

val liste_alea : int -> int -> int -> int liste

val renverse : 'a liste -> 'a liste

val concatene : 'a liste -> 'a liste -> 'a liste

val applique : ('a -> 'b) -> 'a liste -> 'b liste

val assoc : 'a -> ('a * 'b) list -> 'b
