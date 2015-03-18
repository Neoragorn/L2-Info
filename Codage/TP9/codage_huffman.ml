type 'a symbole = Aucun | Symb of 'a
and  'a etiquette = {symbole : 'a symbole; poids : int}
and  'a arbre = Vide | Noeud of 'a etiquette * 'a arbre * 'a arbre
  
let cree_arbre e g d = 
  Noeud (e,g,d)

let poids a =
  match a with
    | Noeud ({poids=p},_,_) -> p
    | _ -> failwith "poids : arbre vide"

let rec insere a f = 
  match f with
    | a'::f' ->
	if poids a <= poids a' then
	  a::f
	else 
	  a'::(insere a f')
    | _ -> [a]

let cree_foret table = 
  let n = Array.length table in
  let rec aux i foret =
    if i = n then
      foret
    else 
      let symb,freq = table.(i) in
      let e = {symbole = Symb symb; poids = freq} in
	aux (i + 1) (insere (cree_arbre e Vide Vide)foret) in
    aux 0 []

let rec cree_arbre_huffman foret =
  match foret with
    | a1::a2::f ->
	let e = {symbole = Aucun; poids = (poids a1) + (poids a2)} in
	let a = cree_arbre e a1 a2 in  
	  cree_arbre_huffman (insere a f)
    | [a] -> a
    | _ -> failwith "cree_arbre_huffman : foret vide"

let f s l =
  List.map (function (x,m) -> (x,s^m)) l 
    
let arbre_en_codage arbre = 
  let rec aux a = 
    match a with
      | Noeud ({symbole=Aucun},g,d) ->
	  let c1 = aux g
	  and c2 = aux d in
	    (f "0" c1) @ (f "1" c2)
      | Noeud ({symbole = Symb s},_,_) -> [(s,"")]
      | Vide -> failwith "arbre_codage : arbre vide"  in
  let l_alph,l_code = List.split (aux arbre) in
  let alphabet = Array.of_list l_alph
  and code = Array.of_list l_code in
    Codage.creer alphabet code 


let codage_huffman table = 
  let foret = cree_foret table in
  let arbre = cree_arbre_huffman foret in
    arbre_en_codage arbre
