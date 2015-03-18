(**
   Module d'analyse lexicale pour les expressions arithmétiques sur les entiers.

   @author FIL - IEEA - Univ. Lille1 (oct 2010)
*)


(** {2 Le type [lexeme]}*)

type operateur = Add | Sub | Mul | Div | Mod

(**
   Une expression arithmetique est constituee d'entiers et d'operateurs et de parentheses ouvrantes et fermantes.
   Un lexeme est un entier ou un operateur ou une parenthese ouvrante ou une parenthese fermante.
*)
type lexeme = Par_ouvrante | Par_fermante | Int of int | Op of operateur

(**
   Exception declenchee par la fonction [lexemes] si une chaine contient des caracteres non autorises.
*)
exception Caractere_non_autorise


(** {2 L'analyseur lexical} *)

(**
   [lexemes s] renvoie un tableau de lexemes dans l'ordre dans lequel ils apparaissent dans la chaine [s].

   {b CU :} [s] ne peut contenir que les caracteres espace ([' ']), chiffres (['0'] ...['9']) et operateurs (['+'], ['-'], ['*'], ['/'], ['%']). Déclenche l'exception [Caractere_non_autorise] sinon.
*)
val lexemes : string -> lexeme array
