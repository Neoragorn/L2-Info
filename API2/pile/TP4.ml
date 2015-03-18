
open Lexemes;;

let calcul operateur pile =
	let operateur1 = Stack.pop pile  
	and operateur2 = Stack.pop pile in
		match operateur with
			|Add -> operateur2 + operateur1 ;
			|Sub -> operateur2 - operateur1 ;
			|Mul -> operateur2 * operateur1 ;
			|Div -> operateur2 / operateur1 ;
			|Mod -> operateur2 mod operateur1 ;; 
let evalue s =
	let p = ref 0
	and pile = Stack.create()
	and t = lexemes s
	and operateur = ref false in
		for  i = 0 to (Array.length t - 1) do
			try 
				match t.(i) with
				|Int nb -> Stack.push nb pile;
				|Op nb -> p:= calcul nb pile; Stack.push !p pile; operateur:= true;
				|_ -> raise Caractere_non_autorise
			with
				|Stack.Empty -> failwith"Mauvaise expression"
		done;
	if Stack.length pile <> 1 
		then
			failwith"Mauvaise expression"
		else 	
			if not(!operateur) 
				then	
					Stack.pop pile
				else 
					!p;;



let evalue_bavard s =
	let p = ref 0
	and pile = Stack.create()
	and t = lexemes s
	and operateur = ref false in
		for  i = 0 to (Array.length t - 1) do
			begin
			try 
				match t.(i) with
				|Int nb -> Stack.push nb pile;
				|Op nb -> p:= calcul nb pile; Stack.push !p pile; operateur:= true;
				|_ -> raise Caractere_non_autorise
			with
				|Stack.Empty -> failwith"Mauvaise expression"
			end;
			imprimer_pile pile
		done;
	if Stack.length pile <> 1 
		then
			failwith"Mauvaise expression"
		else 	
			if not(!operateur) 
				then	
					Stack.pop pile
				else 
					!p;;

