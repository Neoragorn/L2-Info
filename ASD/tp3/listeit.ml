exception ListeVide
exception IterateurEnDebut
exception IterateurEnFin
exception IterateurIndefini

type 'a liste = {
  mutable tete     : 'a liste_interne;
  mutable queue    : 'a liste_interne;
  }
and 'a liste_interne = 
  | Vide 
  | Cons of 'a cellule 
and 'a cellule = {
  valeur : 'a;
  mutable suivant   : 'a liste_interne;
  mutable precedent : 'a liste_interne }
and 'a iterateur = {
  mutable p         : 'a liste_interne;
  mutable defini : bool;
  liste : 'a liste;
  }

let liste_vide () = 
  { tete = Vide; queue = Vide ;}

let la_cellule l =
  match l with
    | Vide -> raise ListeVide
    | Cons a -> a

let ajouter_en_tete l v =
  let nouvelle_tete = { valeur = v ; suivant = l.tete ; precedent = Vide }
  in
  match l.tete with
    | Vide -> 
      l.tete <- Cons nouvelle_tete;
      l.queue <- l.tete
    | Cons ancienne_tete ->
      l.tete <- Cons nouvelle_tete;
      ancienne_tete.precedent <- l.tete

let ajouter_en_queue l v =
  let new_q = { valeur = v ; suivant = Vide ; precedent = l.queue }
  in
  match l.queue with
    | Vide -> 
      l.queue <- Cons new_q;
      l.tete <- l.queue
    | Cons ancienne_queue ->
      l.queue <- Cons new_q;
      ancienne_queue.suivant <- l.queue
    
let imprimer_sans_iterateur l imp =
  let rec imprimer_interne li =
    match li with
      | Vide -> 
	Printf.printf "\n"
      | Cons c -> 
	imp c.valeur;
	imprimer_interne c.suivant
  in
  imprimer_interne l.tete

let imprimer_sans_iterateur_envers l imp =
  let rec imprimer_interne li =
    match li with
      | Vide -> 
	Printf.printf "\n"
      | Cons c -> 
	imp c.valeur;
	imprimer_interne c.precedent
  in
  imprimer_interne l.queue

let iterateur_en_debut l =
  {p = l.tete; defini = true; liste = l}

let iterateur_en_fin l =
  {p = l.queue; defini = true; liste = l}

let est_en_fin it =
  ((la_cellule it.p).suivant = Vide)

let est_en_debut it =
  ((la_cellule it.p).precedent = Vide)

let avancer it =
  if (it.p == Vide) then
  raise IterateurIndefini
else
  it.p <- (la_cellule it.p).suivant

let reculer it =
  if (est_en_debut it) then
  raise IterateurEnDebut
else
  (it.p <- (la_cellule it.p).precedent)

let valeur it =
  if it.p = Vide then
  raise IterateurIndefini
  else
  ((la_cellule it.p).valeur)

let inserer_avant it e =
  let l = Cons { valeur = e; suivant = it.p; precedent = Vide} in
  if (est_en_debut it) then
    (la_cellule it.p).precedent <- l
  else
  (la_cellule l).precedent <- (la_cellule it.p).precedent;
  (la_cellule (la_cellule it.p).precedent).suivant <- l;
  (la_cellule it.p).precedent <- l

let inserer_apres it e =
  let l = Cons { valeur = e; suivant = Vide; precedent = it.p} in
  if (est_en_fin it) then
    (la_cellule it.p).suivant <- l
  else
  (la_cellule l).suivant <- (la_cellule it.p).suivant;
  (la_cellule (la_cellule it.p).suivant).precedent <- l;
  (la_cellule it.p).suivant <- l

let access_iterateur it =
  let courant = try la_cellule it.p with ListeVide -> raise IterateurIndefini in
  if ((courant.precedent = Vide && compare it.liste.tete it.p <> 0)
      || (courant.suivant = Vide && compare it.liste.queue it.p <> 0))
  then raise IterateurIndefini;
  courant

let supprimer it =
  let courant = access_iterateur it in
  if courant.precedent = Vide then
    it.liste.tete <- courant.suivant
  else
    (la_cellule courant.precedent).suivant <- courant.suivant;
  if courant.suivant = Vide then
    it.liste.queue <- courant.precedent
  else
    (la_cellule courant.suivant).precedent <- courant.precedent;
  it.p <- courant.suivant;
  courant.precedent <- Vide;
  courant.suivant <- Vide