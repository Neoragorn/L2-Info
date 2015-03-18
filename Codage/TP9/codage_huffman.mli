(**
   Module pour le calcul d'un codage optimal d'une source d'information.

   @author FIL - IEEA - Univ. Lille 1 (nov 2010) 
*)



(**
   [codage_huffman [|(x1,n1); (x2,n2); ...; (xm,nm)|]] = codage binaire de Huffman des symboles [x1, x2, ..., xm] d'effectifs [n1, n2, ..., nm].

   {b CU :} [n1, n2, ...,nm] > 0.
*)
val codage_huffman : ('a * int) array -> 'a Codage.codage
