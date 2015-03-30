type marqueur = string

(** [marqueurs p] retourne un tableau avec [p] marqueurs 

    Note: Le tableau sera toujours le meme pour un p donne.
*)
val marqueurs : int -> marqueur array

(** [experience n m] retrourne le resultat d'une experience qui contient
    [n] marqueurs positifs parmi le tableau [m] de marqueurs.
*)
val experience : int -> marqueur array -> marqueur array

(**
   [cmp a b] retourne le resultat de la comparaison des marqueurs [a] et [b]
   -1 si a < b
   0 si a = b
   1 si a > b
*)
val cmp : marqueur -> marqueur -> int
