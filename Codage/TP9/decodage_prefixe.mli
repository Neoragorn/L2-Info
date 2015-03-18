(**
   Décodage d'un fichier codé à l'aide d'un codage binaire préfixe.

   Nécessite le module Arbre_codage.
   
   @author FIL - IEEA - Univ. Lille1
*)

(** Exception déclenchée par [decoder] en cas de fichier mal codé *)
exception Decodage_impossible



(**
   [decoder_fichier source arbre cible] 
   décode le fichier [source] avec l'[arbre] du codage 
   dans le fichier [cible].

   {b CU :} le fichier [source] doit avoir été codé 
   avec un codage binaire préfixe décrit par [arbre].
   En particulier ce fichier ne peut pas être vide.
*)
val decoder_fichier : string -> int Arbre_codage.t -> string -> unit
