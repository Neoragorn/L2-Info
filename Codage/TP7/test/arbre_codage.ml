(**
   Module permettant de construire et dessiner un arbre de codage binaire.

   @author FIL - IEEA - Univ. Lille1 (oct 2010)
*)

type 'a symbole = Aucun | Symb of 'a
and  'a t = Vide | Noeud of 'a symbole * 'a t * 'a t

exception Arbre_vide
exception Position_non_codante
exception Codage_incorrect of string 

let racine_codante a = 
  match a with
    | Vide -> raise Arbre_vide
    | Noeud (Aucun,_,_) -> false
    | _ -> true

let racine_symbole a =
  match a with
    | Vide -> raise Arbre_vide
    | Noeud (Symb s,_,_) -> s
    | _ -> raise Position_non_codante

let gauche a =
  match a with
    | Vide -> raise Arbre_vide
    | Noeud (_,g,_) -> g

let droit a =
  match a with
    | Vide -> raise Arbre_vide
    | Noeud (_,_,d) -> d
  
let est_vide a =
  a = Vide

(**
   [separe l] renvoie un tripler ls,l0,l1 dans lequel
   - ls est la liste des symboles associés au mot vide dans l
   - l0 est la liste des couples (s,u) pour tous les (s,0u) dans l
   - l1 est la liste des couples (s,u) pour tous les (s,1u) dans l
*)
let rec separe l = 
  match l with
    | [] -> [],[],[]
    | (s,m)::l ->
	let ls,l0,l1 = separe l in
	  if m = "" then
	    (s::ls),l0,l1
	  else match m.[0] with
	    | '0' -> ls,((s,(String.sub m 1 ((String.length m) - 1)))::l0),l1
	    | '1' -> ls,l0,((s,(String.sub m 1 ((String.length m) - 1)))::l1)
	    | _ -> raise (Codage_incorrect "non binaire") 


let creer alphabet code =
  let rec creer_aux l =
    match l with
      | [] -> Vide
      | _ -> 
	  let ls,l0,l1 = separe l in
	  let sag = creer_aux l0
	  and sad = creer_aux l1
	  and symb =
	    match ls with
	      | [] -> Aucun
	      | s::_ -> Symb s in
	    Noeud (symb,sag,sad)
  in
    creer_aux (List.combine (Array.to_list alphabet) (Array.to_list code))


      
let dessiner arbre canal =
  let rec dessiner_noeuds a label =
    if est_vide a then begin
      let noeud = "noeud"^label in
	Printf.fprintf canal "%s[shape=none, label=\"\", fillcolor=\"#FFFF00\"];\n" noeud ;
	noeud
    end else begin
      let noeud = "noeud"^label in
	if racine_codante a then
	  Printf.fprintf canal "%s[label=\"%d\", shape=hexagon, fillcolor=\"#FF6666\"];\n" noeud (racine_symbole a)
	else
	  Printf.fprintf canal "%s;\n" noeud ;
	let noeud_g = dessiner_noeuds (gauche a) (label^"0") 
	and noeud_d = dessiner_noeuds (droit a) (label^"1") in
	  Printf.fprintf canal "\"%s\" -> \"%s\";\n" noeud noeud_g ;
	  Printf.fprintf canal "\"%s\" -> \"%s\";\n" noeud noeud_d ;
	  noeud
    end in
  Printf.fprintf canal "digraph G{\n" ;
  Printf.fprintf canal "bgcolor=\"#FFFF00\";\n" ;
  Printf.fprintf canal "node [label=\"\", shape=circle, style=filled, fillcolor=\"#AAAAFF\"];\n" ;
  ignore (dessiner_noeuds arbre "") ;
  Printf.fprintf canal "}\n"
