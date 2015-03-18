
(*
TP6 Codage
Groupe 4
Casier Sofian
Mollet Loick

Question 2)

Codage.code 1 un_codage;;
- : string = "01000011011010010101"
Codage.code 101 un_codage;;
- : string = "101"

Question 3)
*)

let un_code =
	let i = ref 0
	and test = (ref "")
	and code_array = Array.make 256 "" in
		while (!i <> 256) do
			test := (Codage.code !i Un_codage.un_codage);
			code_array.(!i) <- !test;
			i := !i + 1;
		done;
code_array;;

(*
Question 4)
*)

let check_plus_grand test = 
	let i = ref 0 and
	tmp = ref 0 and
	n = ref 0 in
		while !i <> 256 do
  			n := String.length test.(!i);
	  		if !n >= !tmp then
  				tmp := !n;
  			i := !i + 1; 
  		done;
 !tmp;;

let check_moins_grand test = 
	let i = ref 0 and
  	tmp = ref (check_plus_grand test) and
  	n = ref 0 in
  		while !i <> 256 do
  			n := String.length test.(!i);
  			if !n <= !tmp then
  				tmp := !n;
  			i := !i + 1; 
  		done;
!tmp;;

(*
# check_plus_grand test;;      
- : int = 21
# check_moins_grand test;;     
- : int = 3
Question 5)
*)

let codecmp s s2 =
	let  s_sub = (String.sub s2 0 (String.length(s))) 
	and check = ref (false) in
		if s_sub = s then 
			check := true ;
!check

let code_min s =
 let min = ref((String.length(s.(0))),0) in
  for i = 1 to (Array.length(s) - 1) do
	  if String.length(s.(i)) < fst (!min) then 
  		min := (String.length(s.(i)),i);
  done;
snd (!min) ;;

let code_max s =
 let max = ref((String.length(s.(0))),0) in
	 for i = 1 to (Array.length(s) - 1) do
	  if String.length(s.(i)) > fst (!max) then 
  		max := (String.length(s.(i)),i);
  done;
snd (!max);;

let sort_code tab =
	let tab_copy = Array.copy(tab)
	and final = Array.make(Array.length(tab)) "" in
		for i = 255 downto 0 do
			final.(i)<- tab_copy.(code_max tab_copy);
			tab_copy.(code_max tab_copy) <- "";
		done;
final;;

let check_prefixe tab_code =
	let copy = Array.copy (sort_code tab_code )
	and check = ref true in
		for i = 0 to (Array.length(tab_code) - 1) do
			for j = (i+1) to (Array.length(tab_code) - 1)do
				if codecmp copy.(i) copy.(j) = true then 
					check := false ;
		done;
	done;
!check;;

(*question 6 *)

let complete_partial chaine_bin n = 
	let correct_chaine = (String.make (n + (8 - n)) ' ') 
	and carac = ref ' '
	and i = ref 0 in
		while !i <> n do
			carac := chaine_bin.[!i];
			correct_chaine.[!i] <- !carac;
			i := !i + 1;
		done;
		while !i <> (n + (8 - n)) do
		if !i = (n) then
			correct_chaine.[!i] <- '1'
		else
			correct_chaine.[!i] <- '0';
		i := !i + 1;
		done;
correct_chaine;;

let complete_full chaine_bin n =
	let correct_chaine = ref (String.make (n) ' ')
	and carac = ref ' '
	and i = ref 0 in
	while !i <> n do
		carac := chaine_bin.[!i];
		!correct_chaine.[!i] <- !carac;
		i := !i + 1;
	done;
	correct_chaine := !correct_chaine^("10000000");
!correct_chaine;;

let complete chaine_bin =
	let n = (String.length chaine_bin)
	and	correcte_chaine = ref "" in
	if (n > 8 ) then
	failwith "Error : Chaine doit etre inferieure ou égal a 8";
	if (n < 8) then
	correcte_chaine := complete_partial chaine_bin (n);
	if (n = 8) then
	correcte_chaine := complete_full chaine_bin n;
!correcte_chaine;;

(*question 7 *)

let coder_fichier name_file_in codage name_file_out =
	let f_in = open_in name_file_in
	and s = ref ""
	and f_out = open_out name_file_out in
	try
		while true do
			let carac = input_byte (f_in) in
				s := !s^(Codage.code carac codage);
			while (String.length (!s) / 8 ) > 0  do
				output_byte f_out (int_of_string("0b"^(String.sub !s 0 8)));
				s := String.sub !s 8 (String.length (!s) - 8);
			done;
		done;
	output_byte f_out (int_of_string(complete(!s)));
	with
		| End_of_file -> close_in f_in; close_out f_out;;

coder_fichier "cigale.txt" un_codage "test_cigale";;

(*Question 9
Le fichier cigale.txt fait 639 octets tandis que le fichier codé test_cigale en fait 427.
) *)

coder_fichier "poeme" un_codage "test_poeme";;

(*Le poeme originel fait 465 octets tandis que la version codée en fait 306. 
Il semble que le codage permet d'optimiser le poids du fichier*)