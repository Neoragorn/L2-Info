type nat = int list
let un = [1]
let zero = []
let t0 = [];;  
let t1 = 123::[];;
let t2 = 1::3::[];; 
let t3 = 123::4567::[];;

let taille l =
	if l = zero 
		then 1
	else
	let rec aux n l =
		if List.tl l = [] then
			n + String.length(string_of_int(List.hd l))
		else
			aux (4 + n) (List.tl l) in
			aux 0 l;;

let entier_en_nat n =
	let nb = ref n 
	and l = ref zero in
		while !nb > 0 do
			l := !l @ [(!nb mod 10000)];
			nb := !nb / 10000
		done;
!l;;

let ajouter_elem s =
	if (String.length s) mod 4 <> 0 then
		(String.make (4 - ((String.length s) mod 4)) '0')^s 
	else
		s;;

let rec chaine_en_nat s =
	let add_s = ajouter_elem s in
		if String.length add_s = 0 then
			zero
		else
			(chaine_en_nat(String.sub add_s 4 ((String.length add_s) - 4)))
			@
			[(int_of_string(String.sub add_s 0 4))];;

let rec nat_en_chaine nb_nat =
	if nb_nat = zero then 
		"0"
	else
		if List.tl nb_nat = zero then
			(string_of_int(List.hd(nb_nat)))
		else
			nat_en_chaine(List.tl(nb_nat)) ^ ajouter_elem (string_of_int(List.hd(nb_nat)));;

let rec compare nat1 nat2 =
	let n1 = nat1
	and n2 = nat2 in
	if (List.length n1) <> (List.length n2) then
		Pervasives.compare (List.length n1) (List.length n2)
	else 
		if (List.length n1) = 0 && (List.length n2) = 0 then
			0
		else
			if (List.hd n1) <> (List.hd n2) then
				Pervasives.compare (List.hd n1) (List.hd n2)
			else
				compare (List.tl n1) (List.tl n2);;

let max_int nat1 nat2 =
	if compare nat1 nat2 >= 0 then
		nat1
	else
		nat2;;

let min_int nat1 nat2 =
	if compare nat1 nat2 >= 0 then
		nat2
	else
		nat1;;

let add nat1 nat2 =
	let rec add2 nat1 nat2 retenue =
		if nat2 = [] then
			begin
				if (nat1 = []) then [retenue]
				else
					begin
					if retenue <> 0 then (((retenue+(List.hd nat1)) mod 10000))::(add2 (List.tl nat1)
						[] ((retenue+(List.hd nat1)) / 10000)) 
					else nat1;
					end
			end
		else
			(((List.hd nat1) + (List.hd nat2)+retenue) mod 10000)
			::(add2 (List.tl nat1) (List.tl nat2) (((List.hd nat1) + (List.hd nat2)
		+ retenue)/10000))
	in
		if (List.length nat1) >= (List.length nat2) then
			add2 nat1 nat2 0
		else
			add2 nat2 nat1 0;; 

let mul_chiffre n x =
    let rec aux y t =
        match y with
        | 0 -> t
        | _ -> aux (y-1) (add t n)
    in
    aux x [];;

let rec mul l1 l2 =
    match l1, l2 with
    | [], [] -> []
    | _, [] -> []
    | [], _ -> []
    | x::l1', q::l2' -> add (mul_chiffre l1 q) (0::(mul l2' l1))
;;

let nat_alea nb =
	if (nb < 0) then
		failwith "Pas de chiffre inferieur a 0";
	Random.self_init ();
	let rec aux nb l =
		if nb = 0 then
			l
		else
			if nb <= 4 then
				(l @ [Random.int(int_of_float(10. ** float_of_int(nb) -. 10. ** float_of_int(nb - 1)))
					+ int_of_float(10. ** float_of_int(nb - 1))])
			else
				aux (nb - 4) (l @ [(Random.int(10000))])
	in
		if nb < 0 then
			failwith ("L'entier doit etre positif ou nul.")
		else 
			aux nb zero;;
let rec fact n =
    if (n < 0) then
	failwith "Pas de chiffre inferieur a 0";
    match n with
    | 0 -> un
    | _ -> mul (fact (n - 1)) (entier_en_nat n)
;;

let rec puissance n p =
    if p = 0 then
        un
    else if p mod 2 = 0 then
        mul (puissance n (p/2)) (puissance n (p/2))
    else
        mul n (mul (puissance n (p/2)) (puissance n (p/2)))
;;

let fibo n =
    if (n < 0) then
	failwith "Pas de chiffre inferieur a 0";
    let rec aux p q l =
        match p, q, l with
        | _, 0, _ -> []
        | _, 1, _ -> [1]
        | _, _, a::b::l' -> if p=q then
                                (add a b)
                            else
                                aux (p+1) q ((add a b)::l)
        | _ -> failwith ""
    in
    aux 2 n ((1::[])::([])::[])
;;
