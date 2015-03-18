type nat = int list

let zero = []

let un = [1]

let taille l =
	if l = zero then 1 (* [] est certes vide mais il represente 0, constitue d'un chiffre et donc taille 1.*) else
	let rec aux n l =
		if List.tl l = [] then
			n + String.length(string_of_int(List.hd l))
		else
			aux (4 + n) (List.tl l)
	in
		aux 0 l;;
		
let entier_en_nat n =
	let nb = ref n 
	and liste = ref zero in
		while !nb > 0 do
			liste := !liste@[(!nb mod 10000)];
			nb := !nb / 10000
		done;
		!liste;;

let complete chaine =
	if (String.length chaine) mod 4 <> 0 then
		(String.make (4 - ((String.length chaine) mod 4)) '0') ^ chaine 
	else
		chaine;;

let rec chaine_en_nat chaine =
	let complet = complete chaine in
		if String.length complet = 0 then
			zero
		else
			(chaine_en_nat(String.sub complet 4 ((String.length complet) - 4)))@[(int_of_string(String.sub complet 0 4))];;


let rec nat_en_chaine natu =
	if natu = zero then 
		"0"
	else
		if List.tl natu = zero then
			(string_of_int(List.hd(natu)))
		else
			nat_en_chaine(List.tl(natu)) ^ complete (string_of_int(List.hd(natu)));;

let rec compare nat1 nat2 =
	let n1 = List.rev (nat1)
	and n2 = List.rev (nat2) in
	if (List.length n1) <> (List.length n2) then
		Pervasives.compare (List.length n1) (List.length n2)
	else 
		if (List.length n1) = 0 then
			0
		else
			if (List.hd n1) <> (List.hd n2) then
				Pervasives.compare (List.hd n1) (List.hd n2)
			else
				compare (List.tl n1) (List.tl n2)

let max_int nat1 nat2 =
	if compare nat1 nat2 >= 0 then
		nat1
	else
		nat2 ;;

let min_int nat1 nat2 =
	if compare nat1 nat2 >= 0 then
		nat2
	else
		nat1 ;;

let add nat1 nat2 =
	let rec add2 nat1 nat2 retenue =
		if nat2 = [] then
			begin
				if (nat1 = []) then [retenue]
				else
					begin
					if retenue <> 0 then (((retenue+(List.hd nat1)) mod 10000))::(add2 (List.tl nat1) [] ((retenue+(List.hd nat1)) / 10000)) 
					else nat1;
					end
			end
		else
			(((List.hd nat1) + (List.hd nat2)+retenue) mod 10000)::(add2 (List.tl nat1) (List.tl nat2) (((List.hd nat1) + (List.hd nat2)+retenue)/10000))
	
	in
		if (List.length nat1) >= (List.length nat2) then
			add2 nat1 nat2 0
		else
			add2 nat2 nat1 0;; 

(*
let mul_chiffre n nat =
	let rec mult2 n nat retenue =
		if nat = [] then [retenue]
			begin
				begin
				if retenue <> 0 then (((retenue+(List.hd nat)) mod 10000))::(mult2 n (List.tl nat) ((retenue*(List.hd nat)) / 10000))  
				else nat;
				end
			end
			else
			(((List.hd nat) * n +retenue) mod 10000)::(mult2 n (List.tl nat) (((List.hd nat) * n +retenue)/10000))
	in mult2 n nat 0;;  *)

	




Random.self_init ;;

let nat_alea t =
	let rec aux t l =
		if t = 0 then
			l
		else
			if t <= 4 then
				(l@[Random.int(int_of_float(10. ** float_of_int(t) -. 10. ** float_of_int(t-1))) + int_of_float(10. ** float_of_int(t-1))])
			else
				aux (t-4) (l@[(Random.int(10000))])
	in
		if t < 0 then
			invalid_arg("L'entier doit etre positif ou nul.")
		else 
			aux t zero;;
			
(*
let fact n =
	let rec factbis n =
		if Big_int.eq_big_int (Big_int.big_int_of_int n) (Big_int.zero_big_int) then 
			Big_int.unit_big_int
		else
			Big_int.mult_big_int (Big_int.big_int_of_int n) (factbis(n-1)) 
	in
	    chaine_en_nat(Big_int.string_of_big_int(factbis n));;
		
		
let rec fibo n =
	if n = 0 then 0 else if n = 1 then 1 else fibo(n-1) + fibo(n-2) ;;  *)
