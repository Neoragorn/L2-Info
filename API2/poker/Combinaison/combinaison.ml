(* module combinaison *)

type combinaison = Quinte_flush | Carre | Full | Couleur | Suite | Brelan | Double_Paire | Paire | No_luck

let imprimer c =
match c with
|Quinte_flush -> Printf.printf "Quinte Flush"
|Carre -> Printf.printf "Carre"
|Full -> Printf.printf "Full"
|Couleur -> Printf.printf "Couleur"
|Suite -> Printf.printf "Suite"
|Brelan -> Printf.printf "Brelan"
|Double_Paire -> Printf.printf "Double Paire"
|Paire -> Printf.printf "Paire"
|No_luck -> Printf.printf "No luck Pal!"

let rec tri = function
   | [] -> []
| x :: l -> insert x (tri l)
and insert elem = function
  | [] -> [elem]
| x :: l -> if elem < x then
elem :: x :: l
else x :: insert elem l;;

let evalue main =
let new_main = tri main.;;

(* On va comparer chaque combinaison avec la main tab_carte, depuis la plus haute combinaison jusqu'à la plus basse. 
Une fonction est faite pour checker la combinaison, et si c'est la bonne ,on renvoie true à la fonction evalue.

Cela revient à :

let evalue tab_cartes =
if check_quinte = true
!Quinte_flush
else if check_carre = true
!Carre
else if check_Full = true
!Full
else if check_Couleur = true
!Couleur
else if Suite = true
!Suite
.
.
.
else
!No_luck 

*)
