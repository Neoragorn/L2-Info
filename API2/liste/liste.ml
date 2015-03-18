(**
   Implémentation du module Liste.

   @author FIL - IEEA - Univ. Lille 1 (oct 2010)
*)

type 'a liste = Vide | Cons of 'a * 'a liste

exception Liste_vide

let liste_vide = Vide

let ajoute_en_tete a l =
  Cons (a,l)

let tete l =
  match l with
    | Vide -> raise Liste_vide
    | Cons (a,_) -> a

let reste l = 
  match l with
    | Vide -> raise Liste_vide
    | Cons (_,l) -> l

let est_vide l =
  l = Vide

let rec imprimer liste =
	match liste with
	| Vide -> raise Liste_vide 
	| _ -> Printf.printf "%d " (tete liste); if (reste liste) <> Vide then imprimer (reste liste)
	
let rec imprimer2 t_elem liste =
	match liste with
	| Vide -> raise Liste_vide 
	| _ -> t_elem (tete liste); if (reste liste) <> Vide then imprimer2 t_elem (reste liste)
	
let longueur liste =
	let cpt = ref 0 in
	let l' = ref liste in
		while not (est_vide !l') do
			l' := reste !l';
			cpt := !cpt + 1;
		done;
!cpt;;

let rec n_ieme liste n =
   match liste with
   | Vide -> raise Liste_vide
   | Cons(x, liste)  -> if n = 0 then x else n_ieme liste (n - 1);;
   
let rec dernier liste =
match liste with
|Cons(x, Vide) -> x
|Vide -> raise Liste_vide
|_->dernier (reste liste)

let liste_decroissante n =
let liste = ref (Cons(1,Vide)) and
 i = ref 2 in
 while !i <> n + 1 do
	liste := Cons (!i, !liste);
	i := !i + 1;
done;
!liste;;

let liste_croissante n =
let liste = ref (Cons(n,Vide)) and
 i = ref 1 in
 while !i <> n do
	liste := Cons (n - !i, !liste);
	i := !i + 1;
done;
!liste;;

let liste_alea a b n =
	Random.self_init ();
	let chiffre = Random.int (b - a + 1) + a in
	let liste = ref (Cons(chiffre, Vide))
	and i = ref 0 in
	while (!i <> n) do
		let chiffre = Random.int (b - a + 1) + a in
			liste := Cons(chiffre, !liste);
		i := !i + 1;
	done;
!liste;;

let renverse l =
	let l' = ref (Cons((tete l), Vide))
	and i = ref (((longueur l)))
	and y = ref 1 in
	while (!i <> 1) do
	l' := Cons((n_ieme l !y), !l');
	i  := !i - 1;
	y := !y + 1;
	done;
!l';;

let rec concatene l1 l2 =
	match l1 with
	| Vide -> l2
	| Cons(x,l') -> Cons(x, (concatene l' l2))
;;

let rec applique fonc l =
	match l with
	| Cons(x, l) -> Cons((fonc x), (applique fonc l))
	| Vide -> raise Liste_vide
;;

(*
J'ai essayé de faire la fonction assoc en utilisant le module Liste
mais je n'arrivais pas à la tester avec. Je la laisse donc au cas où
en commentaire et réalise la fonction avec le module List 

let rec first_assoc indice l =
	match l with
	| Cons((x,y), t) -> if x = indice then y else (first_assoc indice )
	| Vide -> failwith "Pas_trouve"
;;
*)

let rec assoc indice l =
	match l with
	| (x,y)::l' -> if indice = x then y else (assoc indice l')
	| [] -> failwith "Pas_trouve"
;;

(* Je n'ai pas réussi à faire la fonction remove_assoc *)
