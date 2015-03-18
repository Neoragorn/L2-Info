(**
   Programme de simulation d'une donne au poker

   Programme destine a etre compile. Commande de compilation :
   [ocamlc -o jeu carte.cmo main.cmo combinaison.cmo jeu.ml]

   @author FIL - IEEA - Univ. Lille 1
*)

(** {2 Fonction de classement des joueurs} *)

(**
   [evalue_distribution d] calcule les combinaisons de chacun des joueurs.
*)
let evalue_distribution d = 
  let n = Array.length d 
  and f i = (i, Combinaison.evalue d.(i)) in
    Array.init n f


(** {2 Une procédure pour indiquer l'usage du programme} *)

let usage () =
  Printf.printf "Usage : %s n\n" Sys.argv.(0) ;
  Printf.printf "\tn = nbre de joueurs (1 < n < 6)\n" ;
  exit 1 

(** {2 La procédure principale} *)

(**
    L'instruction [principal ()] est chargee 
    - de verifier le nombre de parametres
    - de simuler une donne de n mains
    - et d'indiquer le joueur gagnant
*)
let principal () =
  if Array.length Sys.argv <> 2 then
    usage ()
  else 
    let nbre_joueurs = 
      try
	int_of_string Sys.argv.(1)
      with
	  Failure _ -> usage () in
      if (nbre_joueurs < 2) || (nbre_joueurs > 5) then
	usage ()
      else 
	let distribution = Main.distribue nbre_joueurs in 
	let evaluation = evalue_distribution distribution in
	  for i = 0 to nbre_joueurs - 1 do
	    Printf.printf "Joueur %d : " (i + 1) ;
	    Main.imprimer distribution.(i) ;
	    Printf.printf " : " ;
	    Combinaison.imprimer (snd evaluation.(i)) ;
	    Printf.printf "\n"
	  done ;
	  let cmp (_,comb1) (_,comb2) = Combinaison.compare comb1 comb2 in
	    Array.sort cmp evaluation ;
	    let premier = ref evaluation.(nbre_joueurs - 1)
	    and second = ref evaluation.(nbre_joueurs - 2) 
	    and i = ref (nbre_joueurs - 2) in
	    let compare = ref (cmp !premier !second) in
	      if  !compare <> 0 then
		Printf.printf "Vainqueur : joueur %d\n" (fst !premier + 1)
	      else begin
		Printf.printf "Ex aequo : joueurs %d" (fst !premier + 1) ;
		while (!i > 0) && (!compare = 0) do
		  premier := !second;
		  i := !i - 1 ;
		  second := evaluation.(!i) ;
		  Printf.printf " %d" (fst !premier + 1) ;
		done ;
		Printf.printf " %d\n" (fst !second + 1)
	      end ;
	      exit 0

let _ = principal ()

