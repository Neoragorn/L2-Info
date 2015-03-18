(**
   Module permettant de construire et dessiner un arbre de codage binaire.

   @author FIL - IEEA - Univ. Lille1 (oct 2010)
*)

(** {2 Le type} *)

(**
   Le type des arbres de codages binaires.
*)
type 'a t 

(**
   Exception déclenchée par les fonctions {!racine_codante}, {!racine_symbole}, {!gauche} et {!droit}.
*)
exception Arbre_vide

(** {2 Fonctions de création et de représentation graphique} *)

(**
   [creer alphabet code] renvoie l'arbre du codage défini par l'[alphabet] et le [code]. 

   @raise Codage_incorrect si le code n'est pas binaire.
*)
val creer : 'a array -> string array -> 'a t

(**
   [dessiner a c] imprime via le canal [c]  une description de l'arbre binaire [a] au format Graphviz.

   {b CU :} le canal [c] doit être ouvert.

   @see <http://www.graphviz.org> le site de Graphviz.
*)
val dessiner : int t -> out_channel -> unit

(** {2 Fonctions primitives d'arbre} *)

(**
   [racine_codante a] =
   - Vrai si la racine de l'arbre de codage [a] correspond à un symbole codé,
   - Faux sinon.

   @raise Arbre_vide si l'arbre [a] est vide.
*)
val racine_codante : 'a t -> bool


(**
   [racine_symbole a] renvoie le symbole codé par la racine de [a]. 

   @raise Arbre_vide si l'arbre [a] est vide.
   @raise Poisition_non_codante si [racine_codante a] renvoie faux.
*)
val racine_symbole : 'a t -> 'a

(**
   [gauche a] renvoie le sous-arbre gauche de l'arbre [a].

   @raise Arbre_vide si [a] est vide.
*)
val gauche : 'a t -> 'a t

(**
   [droit a] renvoie le sous-arbre droit de l'arbre [a].

   @raise Arbre_vide si [a] est vide.
*)
val droit : 'a t -> 'a t

(**
   [est_vide a] =
   - Vrai si l'arbre [a] est vide,
   - Faux sinon.
*)
val est_vide : 'a t -> bool

