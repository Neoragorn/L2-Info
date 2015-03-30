open Experience
open Tris

let cpt = ref 0;;

Random.self_init();;

let cmp_embedded m1 m2 =
cpt := !cpt+1;
cmp m1 m2;;

(** 
    strategie 1
*)

let liste_des_marqueurs_negatifs_1 m mp =
  let l = ref []
  and n = Array.length m
  and n2 = Array.length mp
  and i = ref 0
  in
  while !i <> n do
    let y = ref 0
     and check = ref 0 in
      while ((!y <> n2) && (!check == 0)) do
        if (cmp m.(!i) mp.(!y)) == 0 then
        check := 1;
        cpt := !cpt + 1;
        y := !y + 1;
      done;
      if !check == 0 then
        l := m.(!i)::!l;
    i := !i + 1;
  done;
!l;;


(** 
    strategie 2
*)

 let liste_des_marqueurs_negatifs_2 m mp =
  let l = ref []
  in
    let variable = trier mp cmp_embedded
    and n = (Array.length m) - 1
    and n2 = (Array.length mp) - 1
    in
    for i = 0 to n do
    let rec search m a b =
    let middle = (b - a) / 2 + a in
    if a = b || middle = a || middle = b then
    (false, 0)
  else
  match cmp_embedded m variable.(middle) with
  | 1 -> (search m middle b)
  | 0 -> (true, middle)
  | -1 -> (search m a middle)
  | _ -> failwith "Error in cmp\n"
in
match search m.(i) 0 n2 with
| true, n -> Printf.printf "";
| false, _ -> l := m.(i)::!l
done;
!l;; 

(** 
    strategie 3
*)

let recherche_dicho t a b x =
  if a <= b then
    let (d,f) = (ref a,ref b) in
    while (!d < !f) do
      let m = (!d + !f)/2
        in
          if ((cmp_embedded t.(m) x) == (-1)) then
          d := m + 1
          else
          f := m ;
    done;
    true;
  else
    false ;;
    
let liste_des_marqueurs_negatifs_3 marqueurs positifs =
  let l = ref []
  and mar_trie = trier marqueurs cmp_embedded
  and pos_trie = trier positifs cmp_embedded
  and m = Array.length marqueurs 
  and p = Array.length positifs
  and i=ref 0
  and j=ref 0 in
    while ((!j < p)&&(!i < m)) do
      let x = (cmp_embedded mar_trie.(!i) pos_trie.(!j)) in
      if x= -1 then
  begin
  l:= mar_trie.(!i)::(!l) ;
  i:= !i+1;
  end
  else if x=0 then
    begin
    j:=!j+1;
    i:=!i+1;
    end;
    done;
    for k = !i to (m-1) do 
      l:= mar_trie.(k)::(!l)
    done;
!l;;

(**
   [imprimer_liste_marqueurs l] imprime les marqueurs de la liste l
*)
let rec imprimer_liste_marqueurs l =
  match l with
    | [] -> 
      Printf.printf " "
    | m::r -> 
      imprimer_liste_marqueurs r

let _ = 
  (*let p = int_of_string Sys.argv.(1) (* nombre de marqueurs positifs *) *)
  let m = int_of_string Sys.argv.(1) (* nombre de marqueurs total *)
  and p = ref 1 in
  while (!p != m + 1) do
  let mtab = marqueurs m
  in
  let etab = experience !p mtab
  in
  (* impression des marqueurs *)
  (* impression des marqueurs positifs *)
  (* test methode 1 *)
  Printf.printf "%d %d" m !p;
  cpt := 0;
  imprimer_liste_marqueurs (liste_des_marqueurs_negatifs_1 mtab etab);
  Printf.printf "%d" !cpt;
  (* test methode 2 *)
  cpt := 0;
  imprimer_liste_marqueurs (liste_des_marqueurs_negatifs_2 mtab etab);
  Printf.printf "%d" !cpt;
  (* test methode 3 *)
  cpt := 0;
  imprimer_liste_marqueurs (liste_des_marqueurs_negatifs_3 mtab etab);
  Printf.printf "%d" !cpt;
p := !p + 1;
Printf.printf "\n";
done;