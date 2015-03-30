(**

   [tri_fusion t cmp] tri le tableau [t] selon la fonction de
   comparaison [cmp] en utilisant l'algorithme de tri fusion
*)
val tri_fusion : 'a array -> ('a -> 'a -> int) -> 'a array

(**

   [tri_rapide t cmp] tri le tableau [t] selon la fonction de
   comparaison [cmp] en utilisant l'algorithme de tri rapide
*)

val tri_rapide : 'a array -> ('a -> 'a -> int) -> 'a array

val tri_rapide_aleatoire : 'a array -> ('a -> 'a -> int) -> 'a array

val tri_rapide_optimal : int array -> (int -> int -> int) -> int array

val tri_rapide_optimal_mini : int array -> (int -> int -> int) -> int array