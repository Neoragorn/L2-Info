type 'a tranche = { t : 'a array; g : int; d : int}

let mon_tableau = [| 3; 5; 4; 20 ; 1 ; 2 ; 10 ; 7 ; 5 ; 11; 16|];;
let ma_tranche_1 = { t = mon_tableau; g = 2; d = 5 };;
let ma_tranche_2 = { t = mon_tableau; g = 0; d = 0 };;

(**
   [tri_fusion t cmp] tri le tableau [t] selon la fonction de comparaison [cmp]
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
    [partitionner t cmp] partitionne la tranche [t] en deux tranches
    et retourne un couple de tranches
*)

let moy = ref 0
let cpt = ref 0

let cmp a b =
  cpt := !cpt + 1;
  if a = b then
  0
else if a < b then
-1
else
  1

let cmp2 a b =
  if a = b then
  0
  else if a < b then
  -1
  else
  1
(*
******************************************
  Premiere version de la fonction partitionner
******************************************

let check = ref 0

let partitionner_first_version tr cmp =
if (!check == 0) then
  begin
    let temp = tr.t.(0) in
    tr.t.(0) <- tr.t.(tr.g);
    tr.t.(tr.g) <- temp;
    check := !check + 1
  end;
  let pivot = tr.t.(tr.g) and first_pivot = ref (tr.g)
  in
  for i = tr.g + 1 to tr.d do
    if ((cmp pivot tr.t.(i)) = 1) then
      begin
        let aux = tr.t.(i) and k = ref i
        in
        while (!k <> (!first_pivot)) do
          tr.t.(!k) <- tr.t.(!k - 1);
          k := !k - 1
        done;
        tr.t.(!k) <- aux;
        first_pivot := !first_pivot + 1
      end
  done;
  ({ t = tr.t ; g = tr.g ; d = !first_pivot - 1} , { t = tr.t ; g = !first_pivot + 1 ; d = tr.d })
*************************************************
*)

let pivot_aleatoire tr =
  ((Random.int (tr.d + 1 - tr.g)) + tr.g)

let partitionner tr cmp indice =
  let temp = tr.t.(indice)
  in
  tr.t.(indice) <- tr.t.(tr.g);
  tr.t.(tr.g) <- temp;
  let pivot = tr.t.(tr.g) and first_pivot = ref (tr.g)
  in
  for i = tr.g + 1 to tr.d do
    if ((cmp pivot tr.t.(i)) = 1) then
      begin
        let aux = tr.t.(i) and k = ref i
        in
        while (!k <> (!first_pivot)) do
          tr.t.(!k) <- tr.t.(!k - 1);
          k := !k - 1
        done;
        tr.t.(!k) <- aux;
        first_pivot := !first_pivot + 1
      end
  done;
  ({ t = tr.t ; g = tr.g ; d = !first_pivot - 1} , { t = tr.t ; g = !first_pivot + 1 ; d = tr.d })


let rec tri_rapide_tranche_aleatoire tr cmp =
  if tr.g >= tr.d  then
  ()
  else
  let t1,t2 = partitionner tr cmp (pivot_aleatoire tr) in
  tri_rapide_tranche_aleatoire t1 cmp;
  tri_rapide_tranche_aleatoire t2 cmp

  let rec tri_rapide_tranche tr cmp =
  if tr.g >= tr.d  then
  ()
  else
  let t1,t2 = partitionner tr cmp tr.g in
  tri_rapide_tranche t1 cmp;
  tri_rapide_tranche t2 cmp

let pivot_optimal tr =
if tr.g > tr.d then
  0
  else
  let tr2 = { t = Array.sub tr.t tr.g (tr.d + 1 - tr.g) ; g = 0 ; d = tr.d - tr.g }
  in
  tri_rapide_tranche tr2 cmp;
  let x = tr2.t.((tr2.d)/2) and indice = ref tr2.g
  in
    while (!indice <= tr.d) && ((tr.t.(!indice)) <> x) do
      indice := !indice + 1
    done;
!indice

let pivot_optimal_cmp_min tr =
  if tr.g > tr.d then
  0
else
  let tr2 = { t = Array.sub tr.t tr.g (tr.d + 1 - tr.g) ; g = 0 ; d = tr.d - tr.g }
in
tri_rapide_tranche tr2 cmp2;
let x = tr2.t.((tr2.d)/2) and indice = ref tr2.g
in
while (!indice <= tr.d) && ((tr.t.(!indice)) <> x) do
  indice := !indice + 1
done;
!indice

let rec tri_rapide_tranche_opti tr cmp =
  if tr.g >= tr.d  then
  ()
  else
  let t1,t2 = partitionner tr cmp (pivot_optimal tr) in
  tri_rapide_tranche t1 cmp;
  tri_rapide_tranche t2 cmp

let rec tri_rapide_tranche_opti_mini tr cmp2 =
  if tr.g >= tr.d  then
  ()
  else
  let t1,t2 = partitionner tr cmp2 (pivot_optimal_cmp_min tr) in
  tri_rapide_tranche t1 cmp;
  tri_rapide_tranche t2 cmp

(**
   [tri_rapîde t cmp] tri le tableau [t] selon la fonction de
   comparaison [cmp] en utilisant l'algorithme de tri rapide
*)

let tri_rapide_optimal tab cmp =
  tri_rapide_tranche_opti { t = tab ; g = 0 ; d = (Array.length tab - 1) } cmp;
  cpt := 0;
  tab;;

let tri_rapide_optimal_mini tab cmp =
  tri_rapide_tranche_opti_mini { t = tab ; g = 0 ; d = (Array.length tab - 1) } cmp;
  cpt := 0;
  tab;;

let tri_rapide tab cmp =
  tri_rapide_tranche { t = tab ; g = 0 ; d = (Array.length tab - 1) } cmp;
  cpt := 0;
  tab;;

let tri_rapide_aleatoire tab cmp =
  tri_rapide_tranche_aleatoire { t = tab ; g = 0 ; d = (Array.length tab - 1) } cmp;
  tab;;
