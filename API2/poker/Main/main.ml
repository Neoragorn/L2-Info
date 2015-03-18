type main = Carte.carte array

let cree (c1, c2, c3, c4, c5) =
  let main = [|c1 ; c2; c3; c4; c5|] in
    Array.sort Carte.compare_cartes main ;
    main

let carte m i = 
  if (i < 1) || (i > 5) then
    failwith "Main.carte : indice incorrect"
  else 
    m.(i - 1)

let main_alea () =
  let jeu = Carte.battre_paquet () in
    cree (jeu.(0), jeu.(1), jeu.(2), jeu.(3), jeu.(4))

let imprimer m = 
  print_string "[" ;
  for i = 0 to 3 do
    Carte.imprimer_carte m.(i);
    print_string ", "
  done ;
  Carte.imprimer_carte m.(4);
  print_string "]"
  

let distribue n = 
  if (n < 2) || (n > 5) then
    failwith "Main.distribue : nombre joueurs incorrect"
  else 
    let paquet = Carte.battre_paquet () in
    let distribution = Array.make n (main_alea ()) in
      for i = 0 to n - 1 do
	distribution.(i) <- cree (paquet.(5*i), 
				  paquet.(5*i + 1),
				  paquet.(5*i + 2),
				  paquet.(5*i + 3),
				  paquet.(5*i + 4)) 
      done ;
      distribution
	
