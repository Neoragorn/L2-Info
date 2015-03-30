type 'a bloomfilter = { filter : bool array ; code : 'a -> int -> int ; nb : int}

let new_bloomfilter n f m =
let bloom = Array.make (1 lsl n) false in
	{filter = bloom; code = f; nb = m}

let add bf e =
	for i = 0 to (bf.nb - 1) do
	let valeur = (bf.code e i) mod Array.length (bf.filter)
	in bf.filter.(valeur) <- true;
	done
  (* calculer la valeur de chaque fonction de hachage pour l'element [e]
     et mettre a vrai la case correspondante *)

let contains bf e =
	let check = ref 0 in
	for i = 0 to (bf.nb - 1) do
	let valeur = (bf.code e i) mod Array.length (bf.filter) in
	if (bf.filter.(valeur) = false) then
		check := !check + 1;
	done;
	if (!check <> 0) then
	false
	else
	true
  (* calculer la valeur de chaque fonction de hachage pour l'element [e]
     et tester si toutes les cases sont a vrai *)