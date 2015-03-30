open Tris;;
open Genere;;

let cpt = ref 0
let moy1 = ref 0
let moy2 = ref 0
let moy3 = ref 0
let moy4 = ref 0

let cmp a b =
  cpt := !cpt + 1;
  if a = b then
    0
  else if a < b then
    -1
  else
    1

let _ =
  for i = 0 to 100 do
  let t = Genere.tableau_aleatoire i
  in
  Tris.tri_rapide t cmp;
  moy1 := !moy1 + !cpt;
  cpt := 0;
  Tris.tri_rapide_aleatoire t cmp;
  moy2 := !moy2 + !cpt;
  cpt := 0;
  Tris.tri_rapide_optimal t cmp;
  moy3 := !moy3 + !cpt;
  cpt := 0;
  Tris.tri_rapide_optimal_mini t cmp;
  moy4 := !moy4 + !cpt;
  cpt := 0;
done;
  Printf.printf "Moyenne normal: %d\n" (!moy1 / (100));
  Printf.printf "Moyenne Aleatoire: %d\n" (!moy2 / (100));
  Printf.printf "Moyenne Opti: %d\n" (!moy3 / (100)); 
  Printf.printf "Moyenne Opti comparaison minimum: %d\n" (!moy4 / (100)); 