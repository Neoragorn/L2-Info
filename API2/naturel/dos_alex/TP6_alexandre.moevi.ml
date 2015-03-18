(*
  Auteur : MOEVI Alexandre
  Date   : 8 novembre 2013
  Objet  : TP n°6 - Les grands entiers
*)

open Big_int ;;

let question1_1 = string_of_big_int(power_int_positive_int 2 1024) ;;

let question1_2 = string_of_big_int(mult_big_int (power_int_positive_int 2 1024) (power_int_positive_int 2 1024)) ;;

let rec fact n =
	if eq_big_int (big_int_of_int n) (zero_big_int) then 
		unit_big_int
	else
		mult_big_int (big_int_of_int n) (fact(n-1)) ;;



	


