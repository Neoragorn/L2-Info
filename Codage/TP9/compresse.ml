(**
   Programme de compression de fichiers par codage de Huffman.

   NÃ©cessite les modules [Codage] et [Codage_huffman].
   Compilation
   - [ocamlc -o compresse codage.cmo codage_huffman.cmo  compresse.ml]

   Casier Sofian
   Mollet Loick
   25 novembre 2014
*)

let compte f = 
  let entree = open_in f 
  and compteurs = Array.make 256 0 
  and n = ref 0 in
    begin
      try
	while true do
  let  p = input_byte entree in
  compteurs.(p) <- compteurs.(p) + 1;
  if compteurs.(p) = 1 then
    n := !n + 1;
	done;
      with
	| End_of_file ->
	  close_in entree
    end ;
    let freq = Array.make (!n) (0,0)
    and j = ref 0 in
    for i = 0 to 255 do
    if (compteurs.(i) <> 0) then
    begin
    freq.(!j) <- (i, compteurs.(i));
    j := !j + 1
    end
  done;
  freq;;

(**
   [complete s] = chaÃ®ne [s] complÃ©tÃ©e avec une chaÃ®ne de la forme "10...0", 
   le nombre de 0  de sorte que la longueur de [s^"10...0"] soit Ã©gale Ã  
   8.

   {b CU :} 0 < 8-|[s]| <= 8
*)

let complete s =
  let n = String.length s in
  let long_completion = if n = 0 then 8 else 8 - n in
  let completion = String.make long_completion '0' in
  completion.[0] <- '1' ;
  s^completion



(**
   [chaine_en_octet s] = octet reprÃ©sentÃ© par la chaÃ®ne [s].

   {b CU :} [s] ne doit contenir que les caractÃ¨res {t 0} ou {t 1} et Ãªtre de longueur 8.
*)

let chaine_en_octet s =
  try
    let res = ref 0 in
    for i = 0 to 7 do
      match s.[i] with
      | '0' -> res := !res*2
      | '1' -> res := !res*2 + 1
      | _   -> failwith "chaine_en_octet : caractere non autorise"
    done ;
    !res
  with
  | Invalid_argument _ -> failwith "chaine_en_octet : longueur insuffisante"


(**
   [coder_fichier source codage cible] code le fichier [source] 
   avec le codage binaire [codage] dans le fichier [cible].
*)

let coder_fichier source codage cible = 
  let entree = open_in source
  and sortie = open_out cible 
  and a_ecrire = ref "" in
    try
      while true do
	let lu = input_byte entree in
	a_ecrire := !a_ecrire ^ (Codage.code lu codage) ;
	while String.length !a_ecrire >= 8 do
	  output_byte sortie (chaine_en_octet (String.sub !a_ecrire 0 8)) ;
	  a_ecrire := String.sub !a_ecrire 8 (String.length !a_ecrire - 8)
	done 
      done 
    with
    | Failure "" -> 
      close_in entree ;
      close_out sortie ;
      failwith "Codage non binaire" 
    | End_of_file ->
      close_in entree ;
      output_byte sortie (chaine_en_octet (complete !a_ecrire)) ;
      close_out sortie
	


(* Je ne voyais pas comment accéder au élément du codage d'Huffman avec le
paramètre c. J'ai donc du y ajouter le parametre table contenant le résultat
de la fonction compte pour y arriver *)

let sauver_codage c f table =
  let sortie = open_out f
  and n = Array.length table
  and i = ref 0 in
  while !i <> n do
  let d = fst table.(!i) in
  let d_2 = Codage.code d c in
  let s = (string_of_int d)^" "^d_2^"\n" in
  output_string sortie s;
  i := !i + 1;
  done;
    close_out sortie;;

let usage () =
  Printf.printf "Usage : %s <fichier a compresser>\n" Sys.argv.(0) ;
  exit 1

let principal () =
  if Array.length Sys.argv <> 2 then
    usage () 
  else 
    let fichier = Sys.argv.(1) in
    let table = compte fichier in
    let codage_huffman = Codage_huffman.codage_huffman table  in
    coder_fichier fichier codage_huffman (fichier^".huf") ;
    sauver_codage codage_huffman (fichier^".code") table;
    exit 0 

let _ = 
  if not (!Sys.interactive) then principal ()