(* TP codage 9
Casier Sofian
Mollet Loick *)

(*Question 2)

La texte de la Cigale contient presque l'ensemle de l'aphabet latin
ainsi que des symboles supplémentaires tels des espaces, des apostrophes,
des ponctuations.

Question 5)

1) 468 lettres

2) 4.094017094

3) 239.5 octets

4) 292.5 octets

5) 468 octets

6) 4,0618956713

Question 6)

Question 7)

Le texte codé fait 514 bits.

Un Astrologue un jour se laissa choir
Au fond dun puits. On lui dit Pauvre bête
Tandis qu a peine à tes pieds tu peux voir
Penses-tu lire au-dessus de ta tête

*)

open Codage_huffman

let recur = [|46;3;13;13;61;10;3;7;38;5;0;30;12;31;25;14;5;24;32;39;40;12;0;0;1;4|];;

let create_alph_huff recur =
	let alpha = (Array.make 26 (' ', 0))
	and carac = ref ' '
	and i = ref 65 in
	for j = 0 to 25 do
			carac := char_of_int(!i);
			alpha.(j) <- (!carac, recur.(j));
			i := !i + 1;
	done;
alpha;;

let alph = create_alph_huff recur;;

let code_h = Codage_huffman.codage_huffman alph;;

let codage_huff =
	let s = ref " " 
	and carac = ref 65 in
	for i = 0 to 25 do
	s := Codage.code (char_of_int !carac) code_h;
	Printf.printf "%c : %s\n" (char_of_int !carac) !s;
	carac := !carac + 1;
done;;

(*
A : 010
B : 0000110
C : 01101
D : 01100
E : 110
F : 00000
G : 00001111
H : 011110
I : 1011
J : 000010
K : 0000111001
L : 1000
M : 00011
N : 1001
O : 0011
P : 01110
Q : 0111111
R : 0010
S : 1010
T : 1110
U : 1111
V : 00010
W : 00001110001
X : 00001110000
Y : 000011101
Z : 0111110

Question 6)

Question 15)

Les fichiers crées ont pour nom le fichier d'origine auquel on a ajouté le suffixe ".huf".
Si l'on compare leur taille, nous avons :
-639 octets pour le texte cigale.txt contre 377 octets pour sa version compressée
-23261 octets pour le texte francais.bis contre 12368 octets pour sa version compressée

Nous sommes en général entre 45 et 55% de taux de compression.

Question 16)

Question 18)
En compressant un fichier qui a été déjà été compressé, on remarque une baisse du poids du fichier,
passant de 377 octets à 345, ce qui est bien moindre que lors de la première compression.
Quant aux codages, ils sont tous d'une longueur bien plus longue que lors du premier codage.

Question 20)

>diff cigale.txt cigale_decompress
Aucun résultat, les fichiers sont donc identiques.
*)

