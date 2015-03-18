(*
TP4 API2
Casier Sofian
Mollet Loick
Question 1)

*)

let p = Stack.create () in
  Stack.push 1 p;
  Stack.push 7 p;
  Stack.push 5 p;
  Printf.printf "%d\n" (Stack.pop p);
  Printf.printf "%d\n" (Stack.pop p);
  Printf.printf "%d\n" (Stack.pop p);
  Stack.is_empty p;;

let p = Stack.create () in
  Stack.push 1 p;
  Stack.push 7 p;
  Stack.push 5 p;
while not (Stack.is_empty p) do
Printf.printf "%d\n" (Stack.pop p);
done;;

let mystere p =
let s = ref 0 in
while not (Stack.is_empty p) do
s := !s + (Stack.pop p);
done;
Stack.push !s p;;

(*
Question 2)

*)

let imprimer_pile pile =
let copie = Stack.copy pile in
Printf.printf"|";
while not (Stack.is_empty copie) do
Printf.printf " %d " (Stack.pop copie)
done;
Printf.printf"|\n";;

(*
let imprimer_pile p =
let copy = p in
while not (Stack.is_empty p) do
Printf.printf "%d\n" (Stack.pop copy);
done;;
*)

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

(* question 7

evalue "2 3 + 4 *";;
- : int = 20
# evalue "2 3 / 4 * 4 5 6 * / - 5 2 - -";;
- : int = -3

*)

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
imprimer_pile pile;
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