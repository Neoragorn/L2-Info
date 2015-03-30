(**
   [trier t cmp] retrourne un nouveau tableau compose des elements de [t] tries par ordre croissant suivant la fonction de comparaison [cmp] 
   Note: la fonction de comparaison doit retourner -1, 0 ou 1.
*)
val trier : 'a array -> ('a -> 'a -> int) -> 'a array

