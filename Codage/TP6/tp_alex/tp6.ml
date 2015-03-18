(*BOULAY Alexandre
HERIPRET Estelle
Groupe 4
TP6

Q1:
ocamlc -c codage.mli
ocamlc -c codage.ml
ocamlc -c un_codage.mli
ocamlc -c un_codage.ml
ocaml codage.cmo un_codage.cmo

open Codage;;
open Un_codage;;

Q2: *)
code 1 un_codage;;
(*- : string = "01000011011010010101" *)
code (int_of_char('e')) un_codage;;
(*- : string = "101" *)

(*Q3: *)
let aide0 x =
code x un_codage 

let un_code =
Array.init 256 aide0 
(*Q4*)

let codemini tab =
  let minicode = ref(String.length(tab.(0))) in
  for i=1 to (Array.length(tab) -1) do
  if String.length(tab.(i)) < (!minicode) then 
  minicode := String.length(tab.(i));
  done;
  !minicode ;;
  
(* val codemini : string array -> int = <fun> *)
codemini un_code ;;
(* - : int = 3 *)

  
  let codemaxi tab =
  let maxicode = ref(String.length(tab.(0))) in
  for i=1 to (Array.length(tab) -1) do
  if String.length(tab.(i)) > (!maxicode) then 
  maxicode := String.length(tab.(i));
  done;
  !maxicode ;;
  
(* val codemaxi : string array -> int = <fun>*)
codemaxi un_code ;;
(* -: int = 21 *)

(*Q5:*)
let indice_minicode tab =
 let minicode = ref((String.length(tab.(0))),0) in
  for i=1 to (Array.length(tab) -1) do
  if String.length(tab.(i)) < fst(!minicode) then 
  minicode := (String.length(tab.(i)),i);
  done;
  snd(!minicode) ;;
(* val indice_minicode : string array -> int = <fun> *)
indice_minicode un_code ;;
(*- : int = 32*)
  
  let indice_maxicode tab =
 let maxicode = ref((String.length(tab.(0))),0) in
  for i=1 to (Array.length(tab) -1) do
  if String.length(tab.(i)) > fst(!maxicode) then 
  maxicode := (String.length(tab.(i)),i);
  done;
  snd(!maxicode) ;;
(*val indice_maxicode : string array -> int = <fun>*)
indice_maxicode un_code ;;
(*- : int = 28*)

  
let trier_code tab =
  let tab0 = Array.copy(tab)
  and tab1= Array.make(Array.length(tab)) ""
in
for i = 255 downto 0 do
  tab1.(i)<- tab0.(indice_maxicode tab0);
  tab0.(indice_maxicode tab0) <- "";
done;
tab1 ;;
(*val trier_code : string array -> string array = <fun>*)
trier_code un_code ;;
(*- : string array = ... *)

let compare_code str1 str2 =
let str0= (String.sub str2 0 (String.length(str1))) 
and comp= ref(false) in
if str0=str1 then 
comp:= true ;
!comp;;
(*val compare_code : string -> string -> bool = <fun>*)
compare_code "101" "10101" ;;
(*- : bool = true*)
compare_code "101" "011010101" ;;
(*- : bool = false *)


let est_ce_prefixe tab =
let tab0 = Array.copy (trier_code tab )
and comp=ref true in
for i=0 to (Array.length(tab)-1) do
for j=(i+1) to (Array.length(tab)-1)do
if compare_code tab0.(i) tab0.(j) = true then 
comp:= false ;
done;
done;
!comp;;

(*val est_ce_prefixe : string array -> bool = <fun>*)
est_ce_prefixe un_code ;;
(*- : bool = true *)

(*Q6*)
let aide_complete n= 
let a = ref("1") in
for i=6 downto (n mod 8) do
a:= !a^"0";
done;
!a;;
(*val aide_complete : int -> string = <fun> *)
aide_complete 0 ;;
(*- : string = "10000000"*)

let complete str =
str^(aide_complete(String.length(str)));;
(* val complete : string -> string = <fun> *)
complete "10" ;;
(*- : string = "10100000"*)

(*Q7*)
let aide_transfo str =
int_of_string("0b"^str);;
(* val aide_transfo : string -> int = <fun> *)
aide_transfo "101010" ;;
(* - : int = 42 *)


let coder_fichier source codebin cible = 
let entree = open_in source 
and sortie = open_out cible
and temp =ref "" in
	try 
		while true do 
			let n = input_byte entree in
			temp:= !temp^(code n codebin);
			while String.length(!temp)/8 > 0 do 
				output_byte sortie (aide_transfo(String.sub !temp 0 8));
				temp:=String.sub !temp 8 (String.length(!temp)-8);
			done;
	done;
	output_byte sortie (int_of_string(complete(!temp)));
with 
	End_of_file -> 
		close_in entree ; 
		close_out sortie;;

(* val coder_fichier : string -> int Codage.codage -> string -> unit = <fun> *)

(*Q8:*)

coder_fichier "cigale.txt" un_codage "test.txt" ;;
(* - : unit = ()
nous trouvons les textes identiques a cigale.code à un byte près
du au fait que j'avais créé le fichier en .txt *)

(*Q9 :
cigale.txt fait 629 bytes et test.txt fait 427 le un_codage est donc
plus optimisé pour se texte*)
coder_fichier "lol.txt" un_codage "lol.code" ;;
(*- : unit = ()
le fichier lol.txt fait 111 bytes alors que le lol.code 67 *)






