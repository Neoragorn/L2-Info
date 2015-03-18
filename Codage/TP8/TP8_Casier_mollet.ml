(* TP8 Codage
Casier Sofian
Mollet Loick *)

let create_alph =
	let alpha = (Array.make 255 ' ')
	and carac = ref ' '
	and i = ref 0 in
		while !i <> 255 do
			carac := char_of_int(!i);
			alpha.(!i) <- !carac;
			i := !i + 1;
	done;
alpha;;

(*
Question 1)

La valeur maximale de l'entropie correspond à log2 m, m étant le nombre de symbole du fichier
seulement si la répartition de ces symboles dans le fichier est uniforme

Question 2)


*)

let calcul_entro source =
	let result = ref 0.
	and n = (Array.length source) in
		for i = 0 to n do
			result := !result +. 1. *. (log10(1.)/.log10(2.));
		done;
	result := (log10(float_of_int(n))/.log10(2.)) -. !result;
!result;;

let calc = log10(255.)/.log10(2.);;

(*Etant donné que l'on retrouve le même résultat avec la formule donnée
et log2 m, cela signifie que la formule marche car la source utilisée
a une répartition uniforme. (La source vient de la fonction "create_alph"
juste au dessus) 


Question 4)

 ./entropie entropie-squelette.ml
1384 octets lu(s).
Entropie = 4.753692 bits par octet.

./entropie cigale
624 octets lu(s).
Entropie = 4.507422 bits par octet.

 ./entropie sonnet 
625 octets lu(s).
Entropie = 4.396014 bits par octet.

./entropie entropie.ml
1785 octets lu(s).
Entropie = 4.520398 bits par octet.

./entropie codage.bmp 
378054 octets lu(s).
Entropie = 4.447328 bits par octet

./entropie entropie.ml.zip 
922 octets lu(s).
Entropie = 7.629854 bits par octet.

./entropie morse.mp3 
71470 octets lu(s).
Entropie = 7.956906 bits par octet


Question 6)

./entropie2 entropie-squelette.ml
692 octets lu(s).
Entropie = 7.351918 bits par octet.

./entropie2 cigale
312 octets lu(s).
Entropie = 6.917471 bits par octet

./entropie2 sonnet
312 octets lu(s).
Entropie = 6.863091 bits par octet.

./entropie2 entropie.ml
887 octets lu(s).
Entropie = 7.205381 bits par octet.

./entropie2 codage.bmp 
189027 octets lu(s).
Entropie = 6.728875 bits par octet.

./entropie2 morse.mp3 
35735 octets lu(s).
Entropie = 14.394797 bits par octet.

On peut facilement remarquer que comparativement au calcul d'entropie octet par octet,
l'entropie sera bien plus grande en prenant des couples d'octets.
Cela se remarque particulièrement avec les fichiers plus lourds
comme le morse.mp3 où l'entropie a presque doublée.

Question 8)
En codant un fichier avec un codage optimal, sa taille initiale sera réduite telle que :
longueur moyenne - (entropie / log2(taille de la source)).

./entropie entropie.ml
2029 octets lu(s).
Entropie = 4.557256 bits par octet.
Un codage optimal des octets reduirait la taille de ce fichier de 43.034297 pourcents

./entropie sonnet 
625 octets lu(s).
Entropie = 4.396014 bits par octet.
Un codage optimal des octets reduirait la taille de ce fichier de 45.049824 pourcents

./entropie morse.mp3 
71470 octets lu(s).
Entropie = 7.956906 bits par octet.
Un codage optimal des octets reduirait la taille de ce fichier de 0.538673 pourcents

624 octets lu(s).
Entropie = 4.507422 bits par octet.
Un codage optimal des octets reduirait la taille de ce fichier de 43.657228 pourcents

./entropie codage.bmp 
378054 octets lu(s).
Entropie = 4.447328 bits par octet.
Un codage optimal des octets reduirait la taille de ce fichier de 44.408397 pourcents

On remarque que selon les fichiers, le gains peut être très différent. De simples textes présentent
des gains entre 40% et 50%. D'autres sont au contraire peu élevés, comme le fichier mp3, qui est en
soi un format de compression et aura donc une taille différente d'un simple texte.

-------------------
Tests pour les couples d'octets : 

./entropie2 cigale 
312 octets lu(s).
Entropie = 6.917471 bits par octet.
Un codage optimal des octets reduirait la taille de ce fichier de 13.531619 pourcents

./entropie2 sonnet
312 octets lu(s).
Entropie = 6.863091 bits par octet.
Un codage optimal des octets reduirait la taille de ce fichier de 14.211360 pourcents

./entropie2 codage.bmp 
189027 octets lu(s).
Entropie = 6.728875 bits par octet.
Un codage optimal des octets reduirait la taille de ce fichier de 15.889062 pourcents

./entropie2 entropie.ml
1014 octets lu(s).
Entropie = 7.317721 bits par octet.
Un codage optimal des octets reduirait la taille de ce fichier de 8.528485 pourcents

En couple d'octets, le gain par un codage optimal est bien moindre en règle générale
qu'octet par octet
*)




















