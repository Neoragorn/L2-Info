(**
   Implémentation du module Canal_binaire

   @author FIL - IEEA - Univ. Lille 1 (nov 2010)
*)

exception Pas_une_proba of float

exception Pas_un_octet of int

let bit_alea p = 
  if Random.float 1. < p then
    1
  else 
    0

let cbssm p n = 
  if (p < 0.) || (p > 1.) then
    raise (Pas_une_proba p)
  else if (n < 0) || (n > 255) then
    raise (Pas_un_octet n) 
  else 
    let res = ref 0 in
      for i = 0 to 7 do
	res := (!res lsl 1) lor (bit_alea p)
      done ;
      n lxor !res 
      

let _ = Random.self_init ()

