type 'a bloomfilter

(**
   [new_bloomfilter n f m] : crée un nouveau filtre de bloom de taille 2^[n] avec [m] fonction de hachage [f]
*)
val new_bloomfilter : int -> ('a -> int -> int) -> int -> 'a bloomfilter


(**
   [add b s] : ajoute la clé s au filtre de bloom b
*)
val add : 'a bloomfilter -> 'a -> unit

(**
   [contains b s] : prédicat de presence de la clé s au filtre de bloom b
*)
val contains : 'a bloomfilter -> 'a -> bool


