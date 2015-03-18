type operateur = Add | Sub | Mul | Div | Mod

type lexeme = Par_ouvrante | Par_fermante | Int of int | Op of operateur


exception Caractere_non_autorise

let char_en_op c = 
  match c with
    | '+' -> Add
    | '-' -> Sub 
    | '*' -> Mul
    | '/' -> Div
    | '%' -> Mod
    | _ -> raise Caractere_non_autorise

let rec liste_lexemes expr = 
  let n = String.length expr in
    if n = 0 then
      []
    else 
      match expr.[0] with
	| ' ' ->  liste_lexemes (String.sub expr 1 (n - 1))
	| '(' -> Par_ouvrante :: (liste_lexemes (String.sub expr 1 (n - 1)))
	| ')' -> Par_fermante :: (liste_lexemes (String.sub expr 1 (n - 1)))
	| '0' | '1' | '2' | '3' | '4' 
	| '5' | '6' | '7' | '8' | '9' -> 
	    let i = ref 1 in
	      while (!i < n) && ('0' <= expr.[!i]) && (expr.[!i] <= '9') do
		i := !i + 1
	      done ;
	      let nombre = int_of_string (String.sub expr 0 !i)
	      and reste = liste_lexemes (String.sub expr !i (n - !i)) in
		(Int nombre)::reste
	| _ -> 
	    (Op (char_en_op expr.[0]))::(liste_lexemes (String.sub expr 1 (n - 1)))


let lexemes expr = 
  Array.of_list (liste_lexemes expr)
