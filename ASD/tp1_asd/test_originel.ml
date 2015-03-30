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

let recherche_dicho t a b x =
if a <= b then
  let (d,f) = (ref a,ref b) in
    while (!d < !f) do
      let m = (!d + !f)/2
    in
      if t.(m) < x then
        d := m + 1
      else
        f := m ;
      done;
      t.(!d) = x;
    else
    false

(** 
    strategie 2
*)

let cmp_embedded m1 m2 =
cpt := !cpt+1;
cmp m1 m2;;

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
    t.(!d) = x
  else
    false ;;

let liste_des_marqueurs_negatifs_2 m mp =
  let l = ref []
  in
    let variable = trier mp cmp_embedded and n = Array.length m
    and n2 = Array.length mp
    and i = ref 0
    in
    while !i <> n do
      let y = ref 0
       and check = ref 0 in
        while (!y <> n2 )&&(!check == 0) do
        if (recherche_dicho variable 0 (n2-1) m.(!i)) <> false then
        check := 1;
    y := !y + 1;
        done;
        if !check == 0 then
    l := m.(!i)::!l;
      i := !i + 1;
    done;
  !l

(** 
    strategie 3
*)

let liste_des_marqueurs_negatifs_3 m mp =
  let l = ref []
  in
    let variable = trier mp cmp_embedded
    and m2 = trier m cmp_embedded
    and n = Array.length m
    and n2 = Array.length mp
    and i = ref 0
    in
    while !i <> n do
      let y = ref 0
       and check = ref 0 in
        while (!y <> n2 )&&(!check == 0) do
        if (recherche_dicho variable 0 (n2-1) m2.(!i)) <> false then
        check := 1;
    y := !y + 1;
        done;
        if !check == 0 then
    l := m2.(!i)::!l;
      i := !i + 1;
    done;
  !l

(**
   [imprimer_liste_marqueurs l] imprime les marqueurs de la liste l
*)
let rec imprimer_liste_marqueurs l =
  match l with
    | [] -> 
      Printf.printf "\n"
    | m::r -> 
      Printf.printf "%s " m;
      imprimer_liste_marqueurs r

let _ = 
  let p = int_of_string Sys.argv.(1) (* nombre de marqueurs positifs *) 
  and m = int_of_string Sys.argv.(2) (* nombre de marqueurs total *)
in
  let mtab = marqueurs m
  in
  let etab = experience p mtab
  in

  (* impression des marqueurs *)
  Printf.printf "Marqueurs          : ";
  for i = 0 to m-1 do
    Printf.printf "%s " mtab.(i)
  done;
  Printf.printf "\n";

  (* impression des marqueurs positifs *)
  Printf.printf "Marqueurs positifs : ";
  for i = 0 to (p-1) do
    Printf.printf "%s " etab.(i)
  done;
  Printf.printf "\n";


  (* test methode 1 *)
  cpt := 0;
  Printf.printf "Marqueurs negatifs : ";
  imprimer_liste_marqueurs (liste_des_marqueurs_negatifs_1 mtab etab);
  Printf.printf "M1: %d\n" !cpt;


  (* test methode 2 *)
  cpt := 0;
  Printf.printf "Marqueurs negatifs : ";
  imprimer_liste_marqueurs (liste_des_marqueurs_negatifs_2 mtab etab);
  Printf.printf "M2 : %d\n" !cpt;


  (* test methode 3 *)
  cpt := 0;
  Printf.printf "Marqueurs negatifs : ";
  imprimer_liste_marqueurs (liste_des_marqueurs_negatifs_3 mtab etab);
  Printf.printf "M3 : %d\n" !cpt;

  
      
