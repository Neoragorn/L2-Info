(**
   Programme de dÃ©compression de fichiers par codage de Huffman.

   NÃ©cessite les modules [Codage] et [Arbre_codage].
   Compilation
   - [ocamlc -o decompresse codage.cmo arbre_codage.cmo decompresse.ml]
   @author FIL - IEEA - Univ. Lille 1 (derniÃ¨re modif nov 2013)
*)

(**
   [lire_codage f] lit un codage pour certains octets dans le fichier [f]. Le couple de tableaux renvoyÃ© est constituÃ© d'un tableau des octets dÃ©finis dans le codage, et d'un tableau des mots associÃ©s. 
*)
let lire_codage f =
  let entree = open_in f 
  and mots = Array.make 256 "" 
  and n = ref 0 in
    begin
      try
	while true do
	  let ligne = input_line entree in 
	  let i,mot = Scanf.sscanf ligne "%d %s" (fun i s -> (i,s)) in
	    mots.(i) <- mot ;
	    n := !n + 1
	done 
      with
	| End_of_file -> close_in entree
    end ;
    let alphabet = Array.make (!n) 0 
    and code = Array.make (!n) "" 
    and j = ref 0 in
      for i = 0 to 255 do
	if mots.(i) <> "" then begin
	  alphabet.(!j) <- i ;
	  code.(!j) <- mots.(i) ;
	  j := !j + 1
	end
      done ;  
      alphabet,code
    


let usage () =
  Printf.printf "Usage : %s <fichier a decompresser> <fichier code> <fichier decompresse>\n" Sys.argv.(0) ;
  exit 1

let principal () =
  if Array.length Sys.argv <> 4 then
    usage () 
  else 
    let fichier_compresse = Sys.argv.(1) 
    and fichier_code = Sys.argv.(2) 
    and fichier_decompresse = Sys.argv.(3) in
    let alphabet,code = lire_codage fichier_code in
    let arbre = Arbre_codage.creer alphabet code in
      Decodage_prefixe.decoder_fichier fichier_compresse arbre fichier_decompresse ;
      exit 0 

let _ = 
  if not (!Sys.interactive) then principal ()
