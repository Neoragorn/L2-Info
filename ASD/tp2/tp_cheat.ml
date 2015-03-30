type tranche = { t : int array ; g : int ; d : int }

(**
   [tri_fusion t cmp] trie le tableau [t] selon la fonction de comparaison [cmp]
*)
let fusionner t1 t2 cmp =
  let n1 = (Array.length t1)
  and n2 = (Array.length t2)
  in
  let t = Array.concat [ t1; t2]
  and i = ref 0 and j = ref 0 and k = ref 0
  in
  while !i < n1 && !j < n2 do
    if (cmp t1.(!i)  t2.(!j)) < 0 then begin
      t.(!k) <- t1.(!i);
      i := !i + 1
    end else begin
      t.(!k) <- t2.(!j);
      j := !j + 1
    end;
    k := !k + 1
  done;
  while !i < n1 do
      t.(!k) <- t1.(!i);
      i := !i + 1;
      k := !k + 1
  done;
  while !j < n2 do
      t.(!k) <- t2.(!j);
      j := !j + 1;
      k := !k + 1
  done;
  t

let rec tri_fusion t cmp =
  let n = Array.length t 
  in
  if n = 1 then
    Array.sub t 0 n
  else
    let t1 = tri_fusion (Array.sub t 0 ((n-1)/2+1)) cmp
    and t2 = tri_fusion (Array.sub t ((n-1)/2+1) ((n-1)-((n-1)/2+1)+1)) cmp
    in
    fusionner t1 t2 cmp

(**
   le compteur du nombre de comparaisons
*)
let cpt = ref 0


(**
   [cmp a b] renvoie 1 si a > b, 0 si a = b et -1 si a < b
*)
let cmp a b =
  cpt := !cpt + 1;
  if a = b then
    0
  else if a < b then
    -1
  else
    1


(** 
    [partitionner tr cmp ind_pivot] partitionne la tranche [tr] en deux tranches
    et retourne un couple de tranches selon la fonction de comparaison [cmp] et avec
    le pivot en position [ind_pivot]
*)
let partitionner tr cmp ind_pivot =
let temp = tr.t.(ind_pivot)
in
tr.t.(ind_pivot) <- tr.t.(tr.g);
tr.t.(tr.g) <- temp;
let pivot = tr.t.(tr.g) and indice_pivot = ref (tr.g)
in
for i = tr.g + 1 to tr.d do
if ((cmp pivot tr.t.(i)) = 1) then
begin
let aux = tr.t.(i) and k = ref i
in
while (!k <> (!indice_pivot)) do
tr.t.(!k) <- tr.t.(!k - 1);
k := !k - 1
done;
tr.t.(!k) <- aux;
indice_pivot := !indice_pivot + 1
end
done;
({ t = tr.t ; g = tr.g ; d = !indice_pivot - 1} , { t = tr.t ; g = !indice_pivot + 1 ; d = tr.d })
   

(**
   [tri_rapide_tranche_premiere_position tr cmp] trie la tranche [tr] selon la
   fonction de comparaison [cmp] en utilisant l'algorithme
   de tri rapide avec le pivot en première position
*)
let rec tri_rapide_tranche_premiere_position tr cmp =
if tr.g >= tr.d  then
  begin
  for i = 0 to 6 do
  Printf.printf "%d " tr.t.(i);
  done;
  Printf.printf "\n";
end
else
let t1,t2 = partitionner tr cmp tr.g
in
tri_rapide_tranche_premiere_position t1 cmp;
tri_rapide_tranche_premiere_position t2 cmp


(**
   [tri_rapide_premiere_position tab cmp] trie le tableau [tab] selon la fonction de
   comparaison [cmp] en utilisant l'algorithme de tri rapide avec
   le pivot en première position
*)
let tri_rapide_premiere_position tab cmp =
ignore (tri_rapide_tranche_premiere_position { t = tab ; g = 0 ; d = (Array.length tab - 1) } cmp);
					     tab


(**
   [pivot_aleatoire tab] retourne une valeur aléatoire de la tranche tab
*)
let pivot_aleatoire tab = ((Random.int (tab.d + 1 - tab.g)) + tab.g)


(**
   [tri_rapide_tranche_aleatoire tr cmp] trie la tranche [tr] selon la
   fonction de comparaison [cmp] en utilisant l'algorithme
   de tri rapide avec un pivot aléatoire
*)
let rec tri_rapide_tranche_aleatoire tr cmp =
if tr.g >= tr.d  then
()
else
let t1,t2 = partitionner tr cmp (pivot_aleatoire tr)
in
tri_rapide_tranche_aleatoire t1 cmp;
tri_rapide_tranche_aleatoire t2 cmp


(**
   [tri_rapide_aleatoire tab cmp] trie le tableau [tab] selon la fonction de
   comparaison [cmp] en utilisant l'algorithme de tri rapide avec
   un pivot aléatoire
*)
let tri_rapide_aleatoire tab cmp =
ignore (tri_rapide_tranche_aleatoire { t = tab ; g = 0 ; d = (Array.length tab - 1) } cmp);
				     tab


(**
  [pivot_optimal tr] calcule le pivot optimal à choisir pour la tranche tr
*)
let pivot_optimal tr =
if tr.g > tr.d then
0
else
let tr' = { t = Array.sub tr.t tr.g (tr.d + 1 - tr.g) ; g = 0 ; d = tr.d - tr.g }
in
tri_rapide_tranche_premiere_position tr' cmp;
let x = tr'.t.((tr'.d)/2) and i = ref tr'.g
in
while (!i <= tr.d) && ((tr.t.(!i)) <> x) do
i := !i + 1
done;
!i


(**
   [tri_rapide_tranche_optimal tr cmp] trie la tranche [tr] selon la
   fonction de comparaison [cmp] en utilisant l'algorithme
   de tri rapide avec le pivot optimal
*)
let rec tri_rapide_tranche_optimal tr cmp =
if tr.g >= tr.d  then
()
else
let t1,t2 = partitionner tr cmp (pivot_optimal tr)
in
tri_rapide_tranche_optimal t1 cmp;
tri_rapide_tranche_optimal t2 cmp


(**
   [tri_rapide_optimal tab cmp] trie le tableau [tab] selon la fonction de
   comparaison [cmp] en utilisant l'algorithme de tri rapide avec
   le pivot optimal
*)
let tri_rapide_optimal tab cmp =
ignore (tri_rapide_tranche_optimal { t = tab ; g = 0 ; d = (Array.length tab - 1) } cmp);
				   tab


(**
   [pivot_optimal_bis tr] calcule le pivot optimal de la tranche tr en comptant
   le nombre de comparaisons
*)
let pivot_optimal_bis tr cmp =
if tr.g > tr.d then
0
else
let tr' = { t = Array.sub tr.t tr.g (tr.d + 1 - tr.g) ; g = 0 ; d = tr.d - tr.g }
in
tri_rapide_tranche_premiere_position tr' cmp;
let x = tr'.t.((tr'.d)/2) and i = ref tr'.g
in
while (!i <= tr.d) && ((tr.t.(!i)) <> x) do
i := !i + 1
done;
!i


(**
   [tri_rapide_tranche_optimal_bis tr cmp] trie la tranche [tr] selon la fonction
   de comparaison [cmp] en utilisant l'algorithme de tri rapide et en comptant
   le nombre de comparaisons effectuées pour faire la recherche du pivot optimal
*)
let rec tri_rapide_tranche_optimal_bis tr cmp =
if tr.g >= tr.d  then
()
else
let t1,t2 = partitionner tr cmp (pivot_optimal_bis tr cmp)
in
tri_rapide_tranche_optimal_bis t1 cmp;
tri_rapide_tranche_optimal_bis t2 cmp


(**
   [tri_rapide_optimal_bis tab cmp] trie le tableau [tab] selon la fonction
   de comparaison [cmp] en utilisant l'algorithme de tri rapide et en comptant
   le nombre de comparaisons effectuées pour faire la recherche du pivot optimal
*)
let tri_rapide_optimal_bis tab cmp =
ignore (tri_rapide_tranche_optimal_bis { t = tab ; g = 0 ; d = (Array.length tab - 1) } cmp);
				       tab