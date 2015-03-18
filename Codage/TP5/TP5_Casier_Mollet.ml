(*
TP5 codage
Casier Sofian
Molet Loick

Question 2)

Codage.code 'a' codage;;          
- : string = "010"
Codage.code 'b' codage;;
- : string = "100"
# Codage.code 'c' codage;;
- : string = "110"

Question 3)

Codage.decode "110" codage;;
- : char = 'c'
# Codage.decode "100" codage;;
- : char = 'b'
# Codage.decode "010" codage;;
- : char = 'a'

Question 4)

Codage.code 'B' codage;;
Exception: Codage.Symbole_non_codable.

Question 5)

Codage.decode "111" codage;;
Exception: Codage.Mot_non_decodable.

Question 6)

let codage1 = Codage.creer alphabet_source code1;;
val codage1 : char Codage.codage = <abstr>
# let codage2 = Codage.creer alphabet_source code2;;
val codage2 : char Codage.codage = <abstr>
# let codage3 = Codage.creer alphabet_source code3;;
val codage3 : char Codage.codage = <abstr>

Question 7)

Codage.code 'B' codage1;;
- : string = "00001"
# Codage.code 'B' codage2;;
- : string = "-.../"
# Codage.code 'B' codage3;;
- : string = "0010011"

Question 8-9)

*)

open Codage

let alphabet_source =
  [| 'A'; 'B'; 'C'; 'D'; 'E'; 'F'; 'G'; 'H'; 'I'; 'J'; 'K'; 'L'; 'M'; 'N';
     'O'; 'P'; 'Q'; 'R'; 'S'; 'T'; 'U'; 'V'; 'W'; 'X'; 'Y'; 'Z'; ' ' |];;

let code1 =
  [| "00000"; "00001"; "00010"; "00011"; "00100"; "00101"; "00110"; "00111";
     "01000"; "01001"; "01010"; "01011"; "01100"; "01101"; "01110"; "01111";
     "10000"; "10001"; "10010"; "10011"; "10100"; "10101"; "10110"; "10111";
     "11000"; "11001"; "11111" |]

let code2 =
  [| ".-/"; "-.../"; "-.-./"; "-../"; "./"; "..-./"; "--./"; "..../"; "../";
     ".---/"; "-.-/"; ".-../"; "--/"; "-./"; "---/"; ".--./"; "--.-/"; ".-./";
     ".../"; "-/"; "..-/"; "...-/"; ".--/"; "-..-/"; "-.--/"; "--../"; "---./"|]

let code3 =
  [| "1010"; "0010011"; "01001"; "01110"; "110"; "0111100"; "0111110";
     "0010010"; "1000"; "011111110"; "011111111001"; "0001"; "00101";
     "1001"; "0000"; "01000"; "0111101"; "0101"; "1011"; "0110"; "0011";
     "001000"; "011111111000"; "01111110"; "0111111111"; "01111111101";
     "111" |];;

let code_mot s char_codage = 
let n = (String.length s) in
let final_s = ref ("")
and i = ref 0 in
while !i < n do
final_s :=  (!final_s)^(Codage.code (s.[!i]) char_codage);
i := !i + 1;
done;
!final_s;;

(*
Question 10)

(String.length s * 5) pour le codage 1

Question 11)
*)

let decode_mot_longueur_fixe s char_codage = 
let n = ref (String.length s)
and sub_s = ref ""
and indice_mot = ref 0
and carac = ref ' '
and s_final = ref ("") in
if ((!n mod 5) = 0)then 
begin
while !(indice_mot) <> (!n) do 
sub_s := (String.sub s (!indice_mot) 5);
carac := (Codage.decode (!sub_s) char_codage);
s_final := !(s_final)^(Char.escaped(!carac));
indice_mot := !indice_mot + 5;
done;
!s_final
end
else
failwith "decode_mot_longueur_fixe : mot non decodable";;

(*
Question 12)

 decode_mot_longueur_fixe "000100111000011000000011000100" codage1;;
- : string = "CODAGE"


Question 13)

decode_mot_longueur_fixe "011111000101110001010010010010100100010010100100011111100101000001010010011111110100001011111110001010100010001000100100111110101100100111110111110001011100001110100010001001111111000110010011111101010111010010111110010101110101000100001011010110010010010" codage1;;
- : string = "PROFESSEUR FAUT IL CUIRE LE PRODUIT DE VOS FOUILLES"

Question 14)
*)

let decode_mot_virgule s char_codage separateur = 
  let n = ref (String.length s)
  and sub_s = ref (String.sub s 0 ((String.index_from s 0 '/') + 1))
  and indice_mot = ref 0
  and carac = ref ' '
  and next_sep = ref ((String.index_from s 0 '/') + 1)
  and s_final = ref ("") in
  while (!indice_mot) < (!n) do
    carac := (Codage.decode (!sub_s) char_codage);
    s_final := !(s_final)^(Char.escaped(!carac));
    indice_mot := !(next_sep);
if (!indice_mot < (!n - 1))
then
begin
    next_sep := (String.index_from s (!indice_mot) '/');
    sub_s := (String.sub s (!indice_mot) (!n - !indice_mot))
end
else
indice_mot := !indice_mot + 1;
done;
!s_final;;


let copy_string s debut fin =
let copy = String.create (fin - debut)
and x_debut = ref debut
and i = ref 0 in
while (!x_debut <> fin) do
copy.[!i] <- s.[!x_debut];
x_debut := !x_debut + 1;
i := !i + 1;
done;
copy;;

let check_code_morse s =
let n = ref (String.length s)
and i = ref 0
and etat = ref (true) in
while !i <> !n do
if (s.[!i] <> '.') && (s.[!i] <> '/') && (s.[!i] <> '-') then
etat := false;
i := !i + 1;
done;
!etat;;

let decode_mot_virgule s char_codage separateur =
let n = ref (String.length s)
and sub_s = ref ""
and carac = ref ' '
and indice_mot = ref 0
and next_sep = ref 0
and s_final = ref ("") in
while (!indice_mot) < (!n) do
if (!n = 0) then
failwith "decode_mot_virgule : mot non decodable";
if (check_code_morse s = false) then
failwith "decode_mot_virgule : mot non decodable";
next_sep := String.index_from s !indice_mot separateur;
sub_s := copy_string s !indice_mot (!next_sep + 1);
carac := (Codage.decode (!sub_s) char_codage);
s_final := !(s_final)^(Char.escaped(!carac));
indice_mot := (!next_sep + 1);
if (!indice_mot < !n) then
next_sep := (String.index_from s (!indice_mot) separateur);
done;
!s_final;;

(*
Question 16) 

decode_mot_virgule ".--./---/..-/.-./---./.-../.-/---./..-./.-./.-/-./-.-././---./-../---././-./---./-.../.-/.../---./-.././.../---./-./---/..-/../.-../.-.././.../---././-./-.-./---/.-././" codage2 '/';;
- : string = "POUR LA FRANCE D EN BAS DES NOUILLES ENCORE"

Question 18)
---------------------------------
Question non-reussie

let decode_lettre_prefixe v codage =
  let n = String.length v
  and i = ref 0
  and prefixe = ref '\000'
  and trouve = ref false in
    while (!i <= n) && not (!trouve) do
      try
        prefixe := decode (String.sub v 0 !i) codage ;
        trouve := true
      with
        | Mot_non_decodable -> i := !i + 1
    done ;
    if !i <= n then
      (!prefixe,!i)
    else
      failwith "decode_lettre_prefixe : mot non decodable";;

let decode_mot_prefixe s char_codage =
let i = ref 0
and n = ref (String.length s)
and sub_s = ref ""
and s_final = ""
and etat = ref faux
and (indice_1, indice_2) = (' ',0) in
while etat = true do
while !i < !n do
let (indice_1, indice_2) = (decode_lettre_prefixe s char_codage) in
s_final := !(s_final)^(Char.escaped (indice_1));
i := !i + indice_2;
done;
done;

sub_s := copy_string s !i (!indice_2 + 1);
Printf.printf "sub is %s\n" !sub_s;
------------------------------------------
*)