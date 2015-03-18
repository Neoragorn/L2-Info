(* Fonction qui va prendre le bit de l'octet n à la position i *)

let nth_bit n i = (n lsr i) land 1;;

(* Fonction qui va comparer les bits des 3 octets et
prendre celui qui est majoritaire à la position i
J'ai essayé de la réduire en utilisant l'opérateur || mais
il y avait un problème dans un cas précis que je n'arrivais pas à résoudre.
J'ai dû faire les 8 conditions ainsi*)

let compare_bit n n_2 n_3 i =
	let bit = ref 0 in
	if ((nth_bit n i) = 0) && ((nth_bit n_2 i) = 0) && ((nth_bit n_3 i) = 0) then
	bit := 0;
	if ((nth_bit n i) = 0) && ((nth_bit n_2 i) = 1) && ((nth_bit n_3 i) = 0) then
	bit := 0;
	if ((nth_bit n i) = 0) && ((nth_bit n_2 i) = 0) && ((nth_bit n_3 i) = 1) then
	bit := 0;
	if ((nth_bit n i) = 1) && ((nth_bit n_2 i) = 0) && ((nth_bit n_3 i) = 0) then
	bit := 0;
	if ((nth_bit n i) = 0) && ((nth_bit n_2 i) = 1) && ((nth_bit n_3 i) = 1) then
	bit := 1;
	if ((nth_bit n i) = 1) && ((nth_bit n_2 i) = 1) && ((nth_bit n_3 i) = 1) then
	bit := 1;
	if ((nth_bit n i) = 1) && ((nth_bit n_2 i) = 0) && ((nth_bit n_3 i) = 1) then
	bit := 1;
	if ((nth_bit n i) = 1) && ((nth_bit n_2 i) = 1) && ((nth_bit n_3 i) = 0) then
	bit := 1;
!bit;;

let decoder_fichier entree sortie =
	let f_in = open_in entree
  and f_out = open_out sortie
  and cmpt = ref 0 in
  try
  begin
  	while true do
      let n = input_byte f_in
      and n_2 = input_byte f_in
      and n_3 = input_byte f_in
      and i = ref 7
      and test = ref 0
      and bit = ref 0 in
      while (!i >= 0) do
      bit := !bit lor (compare_bit n n_2 n_3 !i);
      if !bit <> 0 then
      cmpt := !cmpt + 1;
      if (!i <> 0) then
      bit := !bit lsl 1;
      i := !i - 1;
  done;
  output_byte f_out (!cmpt);
	done;
	end
	with
	| End_of_file -> close_in f_in; close_out f_out; Printf.printf "%d\n" !cmpt;;

(*let usage () = 
  Printf.printf "Usage : %s <entree> <sortie>\n" Sys.argv.(0) ;
  Printf.printf "\t<entree> = nom du fichier a l'entree du canal\n" ;
  Printf.printf "\t<sortie> = nom du fichier a la sortie du canal\n" ;
  exit 1

let principal () = 
  if Array.length Sys.argv <> 3 then 
    usage ()
  else 
    let entree = Sys.argv.(1)
    and sortie = Sys.argv.(2) in
      decoder_fichier entree sortie ;
      exit 0

let _ = principal () *)