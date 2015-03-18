(**
   Programme de simulation d'une transmission d'information via un canal bruitÃ©.
   
   

   Programme destinÃ© Ã  Ãªtre compilÃ© :
   - [ocamlc -o transmission_bruitee canal_binaire.cmo transmission_bruitee.ml]

   @author FIL - IEEA - Univ. Lille 1 (dÃ©c. 2010)
*)


(**
   [transmettre p entree sortie] = recopie le fichier [entree] dans le fichier [sortie] en changeant les bits successifs avec une probabilitÃ© [p].
*)

open Canal_binaire

let transmettre p entree sortie =
  let f_in = open_in entree
  and f_out = open_out sortie in
  try
  begin
    while true do
    let n = input_byte f_in in
    let oct = cbssm p n in
    output_byte f_out oct;
    done;
  end
with
| End_of_file -> close_in f_in; close_out f_out;;

  ((* A COMPLETER *))

(**
   [usage ()] indique l'usage normal du programme.
*)

let usage () = 
  Printf.printf "Usage : %s <p> <entree> <sortie>\n" Sys.argv.(0) ;
  Printf.printf "\t<p> = proba d'erreur sur 1 bit\n" ;
  Printf.printf "\t<entree> = nom du fichier a l'entree du canal\n" ;
  Printf.printf "\t<sortie> = nom du fichier a la sortie du canal\n" ;
  exit 1


let principal () = 
  if Array.length Sys.argv <> 4 then 
    usage ()
  else 
    let p = float_of_string Sys.argv.(1)
    and entree = Sys.argv.(2)
    and sortie = Sys.argv.(3) in
      transmettre p entree sortie ;
      exit 0

let _ = principal ()