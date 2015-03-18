(*
TP7 Codage
Casier Sofian
Loick Mollet

Question 2)


*)

let codage_binaire_1 = [|"1";"01";"001";"0001"|];;
let codage_binaire_2 = [|"00";"01";"110";"001"|];;
let alphabet = [|0;1;2;3|];;  

let a1 = Arbre_codage.creer alphabet codage_binaire_1;;
let a2 = Arbre_codage.creer alphabet codage_binaire_2;;  

(*# a1;;
- : int Arbre_codage.t = <abstr>
# a2;;
- : int Arbre_codage.t = <abstr>

Le type des arbres est un "int arbre_codage.t" et sont abtraits.

Q3)

Arbre_codage.est_vide a1;;                      
- : bool = false
Arbre_codage.est_vide (Arbre_codage.droit a1);;
- : bool = false
Arbre_codage.est_vide (Arbre_codage.gauche (Arbre_codage.droit a1));;
- : bool = true

# Arbre_codage.gauche a1;;                                             
- : int Arbre_codage.t = <abstr>
# Arbre_codage.gauche (Arbre_codage.droit a1);;                        
- : int Arbre_codage.t = <abstr>
# Arbre_codage.gauche (Arbre_codage.gauche (Arbre_codage.droit a1));;   
Exception: Arbre_codage.Arbre_vide.

Arbre_codage.droit a1;;                                              
- : int Arbre_codage.t = <abstr>
# Arbre_codage.droit (Arbre_codage.droit a1);;                         
- : int Arbre_codage.t = <abstr>
# Arbre_codage.droit (Arbre_codage.gauche (Arbre_codage.droit a1));; 
Exception: Arbre_codage.Arbre_vide.

Arbre_codage.racine_symbole a1;;                                   
Exception: Arbre_codage.Position_non_codante.
# Arbre_codage.racine_symbole (Arbre_codage.droit a1);;              
- : int = 0
# Arbre_codage.racine_symbole (Arbre_codage.gauche (Arbre_codage.droit a1));;
Exception: Arbre_codage.Arbre_vide.

*)

let sortie = open_out "essai1.dot" in Arbre_codage.dessiner a1 sortie; close_out sortie;;
let sortie = open_out "essai2.dot" in Arbre_codage.dessiner a2 sortie; close_out sortie;;

(*Q6*)

let alph_codage =
	let alph_tab = Array.make 256 0
	and i = ref 0 in
		while !i <> 256 do
			alph_tab.(!i) <- !i;
			i := !i + 1;
		done;
alph_tab;;

let un_code =
	let i = ref 0
	and f_out = open_out "test_un_codage"
    and test = (ref "")
    and code_array = Array.make 256 "" in
    	while (!i <> 256) do
    		test := (Codage.code !i Un_codage.un_codage);
    		code_array.(!i) <- !test;
			output_string f_out code_array.(!i);
    		i := !i + 1;                                            
	    done;                                                           
close_out f_out;
code_array;;

let a3 = Arbre_codage.creer alph_codage un_code;;

let sortie = open_out "essai3.dot" in Arbre_codage.dessiner a3 sortie; close_out sortie;;

(*
----------------
Quelques remarques sommaires relatives aux propriétés aérodynamiques de l'addition.
Dans toutes les tentatives faites jusqu'à nos jours pour démontrer que 2+2 = 4, il n'a jamais étét tenu compte de la vitesse du vent.
L'addition des nombres entiers n'est en effet possible que par un temps assez calme pour que, une fois posé le premier 2, il reste en place jusqu'à ce que l'on puisse poser ensuite la petite croix, puis le second\
 2, puis le petit mur sur lequel on s'assoit pour réfléchir et enfin le résultat. Le vent peut ensuite souffler, deux et deux ont fait quatre.
Que le vent commence à s'élever, et voilà le premier nombre par terre. Que l'on s'obstine, il en advient de même alors du second. Quelle est alors la valeur de 2+2 ? Les mathématiques actuelles ne sont pas en mes\
ure de nous répondre.
Que le vent fasse rage, alors le premier chiffre s'envole, puis la petite croix, et ainsi de suite. Mais supposons qu'il tombe après la disparition de la petite croix, alors on pourrait être amené à écrire l'absu\
rdité 2 = 4.
Le vent n'emporte pas seulement, il apporte aussi. L'unité, nombre particulièrement léger et qu'une brise suffit à déplacer peut ainsi retomber dans une addition où il n'a que faire, à l'insu même du calculateur.\
 C'est ce dont avait eu l'intuition le mathématicien russe Dostoïewsky lorsqu'il a osé déclarer qu'il avait un faible pour 2+2 = 5.
Les règles de la numération décimale prouvent également que les Hindous ont dû probablement se formuler plus ou moins inconsciemment notre axiome. Le zéro roule avec facilité, il est sensible au moindre souffle. \
Aussi n'en tient-on pas compte lorsqu'il est placé à gauche d'un nombre : 02 = 2, car le zérofout toujours le camp avant la fin de l'opération. Il ne devient significatif qu'à droite, car alors les chiffres précé\
dents peuvent le retenir et l'empêcher de s'envoler. Aussi a-t-on 20 <> 2, tant que le vent ne dépasse pas quelques mètres à la seconde.
Nous tirerons maintenant quelques conséquences pratiques de ces considérations ; dès que l'on craint les perturbations atmosphériques, il est bon de donner à son addition une forme aérodynamique. Il est conseillé\
 également de l'écrire de droite à gauche et de commencer le plus près possible du bord de la feuille de papier. Si le vent fait glisser l'opération en cours on peut, presque toujours, la rattrapper avant qu'elle\
 n'atteigne la marge. On obtiendra ainsi, même avec une tempête d'équinoxe, des résultats comme celui-ci : 2+2 = 5.
-----------------
 Le texte est de Raymond Queneau du livre "Contes et Propos";*)
