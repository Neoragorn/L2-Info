(* module carte *)

let tab_hauteurs = [| "2"; "3"; "4"; "5"; "6"; "7"; "8"; "9"; "10"; "V"; "D"; "R"; "A" |]

type couleur = Coeur | Carreau | Pique | Trefle 
and hauteur = Valet | Dame | Roi | As | Chiffre of int
and carte = Carte of (couleur * hauteur)

let cree couleur hauteur =
  let c = match couleur with
    | 'K' -> Carreau
    | 'C' -> Coeur
    | 'P' -> Pique
    | 'T' -> Trefle
    | _ ->  failwith "Couleur non valide"
  and hauteur = match hauteur with
    | 1 -> As
    | 11 -> Valet
    | 12 -> Dame
    | 13 -> Roi
    | _ ->
      if hauteur > 1 && hauteur < 11 then
Chiffre hauteur
      else
failwith "hauteur non valide"
  in Carte (c, hauteur)

let couleur carte =
  match carte with
  | Carte(c, _) -> c

let hauteur carte =
  match carte with
  | Carte(_, h) -> h

let rang hauteur =
  match hauteur with 
  | As -> 14
  | Roi -> 13
  | Dame -> 12
  | Valet -> 11
  | Chiffre n -> n

let hauteurs_consecutives h1 h2 =
  rang h1 = (rang h2) - 1

let compare_hauteurs h1 h2 =
  compare (rang h1) (rang h2)

let compare_cartes c1 c2 =
  compare_hauteurs (hauteur c1) (hauteur c2)

let string_of_couleur couleur =
  match couleur with
  | Coeur -> "C"
  | Carreau -> "K"
  | Trefle -> "T"
  | Pique -> "K"

let string_of_hauteur h =
  tab_hauteurs.((rang h) - 2)

let imprimer_couleur c =
  Printf.printf "[%s]\n" (string_of_couleur c)

let imprimer_hauteur h =
  Printf.printf "%s\n" (string_of_hauteur h)

let imprimer_carte c = 
  Printf.printf "[%s%s]" (string_of_hauteur(hauteur c)) (string_of_couleur (couleur c))

let paquet_ordonne () =
  let tab_char = [|'C'; 'P'; 'K';'T'|]
  and paquet = Array.make 52 (cree 'T' 1)
  and  cpt = ref 0 in
for i = 0 to 3 do
for h = 1 to 13 do
paquet.(!cpt) <-(cree(tab_char.(i)) h);
cpt := !cpt + 1
done;
done;
paquet;;

let battre_paquet () =
  let paquet = paquet_ordonne () in
  let length = Array.length (paquet) in 
  for i = 0 to (length - 1) do
    let n = Random.int length
    and swap_carte = paquet.(i)
    in
    paquet.(i) <- paquet.(n);
    paquet.(n) <- swap_carte
  done;
  paquet
