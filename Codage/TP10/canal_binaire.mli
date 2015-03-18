(**
   Module de simulation d'un canal binaire symétrique sans mémoire.

   @author FIL - IEEA - Univ. Lille 1 (nov 2010)
*)

exception Pas_une_proba of float
exception Pas_un_octet of int

(**
   [cbssm p n] renvoie un octet [n xor e] où [e] est un octet dont chaque bit vaut 1 avec la probabilité [p], et 0 avec la probabilité [1 - p].

   @raise Pas_un_octet si [n] n'est pas un octet (c.-à-d. si [n] n'est pas compris entre 0 et 255).
*)
val cbssm : float -> int -> int
