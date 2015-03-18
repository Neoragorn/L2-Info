(**
   Calcul de l'entropie d'un fichier considÃ©rÃ© comme source d'octets.

   Compilation :
   [ocamlc -o entropie entropie.ml]

   @author FIL - IEEA - Univ. Lille 1 (oct 2010)
*)

(**
   [entropie fichier] renvoie un couple (n,e) de type (int * float) :
   - n est le nombre d'octets du fichier
   - e est l'entropie du fichier
*)
let entropie2 fichier = 
  let compteurs = Array.make_matrix 256 256 0 (* 256 compteurs pour chacun des octets *)
  and somme = ref 0. (* pour le calcul de l'entropie *) in
  (* Parcours du fichier pour compter les diffÃ©rents octets qu'il contient *)
  let  entree = open_in_bin fichier
  and result = ref (0, 0.0) in (* canal ouvert en lecture *)
  begin
    try
          while true do
            let  n = input_byte entree and
            m = input_byte entree in
            compteurs.(n).(m) <- compteurs.(n).(m) + 1;
            somme := !somme +. 1.
            done;  
      with        
        End_of_file ->
            close_in entree;
  end ;
  let occurence = ref (0.) and
            tmp = ref (0.) in
            for i = 0 to 255 do
              for j = 0 to 255 do
                occurence := float_of_int(compteurs.(i).(j));
                if (compteurs.(i).(j) <> 0) then
                  tmp := !tmp +. !occurence *. log(!occurence);
               done;
            done;
            result := (int_of_float(!somme),((1.)/.log(2.))*.(log(!somme)-.(!tmp/.(!somme))));
!result;;

let theo_bruit taille entro =
    let res = 100. *. (1. -. (entro /. (log(256.)/.log(2.)))) in
  Printf.printf "Un codage optimal des octets reduirait la taille de ce fichier de %f pourcents\n" res;;

let usage () = 
  Printf.printf "Usage : %s <fichier>\n" Sys.argv.(0) ;
  Printf.printf "\t <fichier> = nom du fichier dont on veut l'entropie.\n";
 exit 1
;;

(**
   ProcÃ©dure principale.
*)
let principal () =
  if Array.length Sys.argv <> 2 then
    usage () 
  else
    let nb,ent = entropie2 Sys.argv.(1) 
    in 
      Printf.printf "%d octets lu(s).\n" nb ;
      Printf.printf "Entropie = %f bits par octet.\n" ent;
      theo_bruit nb ent
;;
	

let _ = principal ()
;;