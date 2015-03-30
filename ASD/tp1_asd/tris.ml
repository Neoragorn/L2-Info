(*let trier t cmp = 
  let inserer t i = 
    let k = ref i 
    and aux = t.(i) in
    while (!k >= 1) && (cmp aux t.(!k - 1)) < 0 do 
      t.(!k) <- t.(!k - 1) ; k := !k - 1
    done ; 
    t.(!k) <- aux 
  and t' = Array.copy t 
  and n = Array.length t in
  for i = 1 to n - 1 do 
    inserer t' i
  done ; 
  t' 
*)

let trier t cmp = 
  let rec rechercher_position_rec t gauche droite elt =
    if gauche >= droite - 1 then begin
      if (cmp elt t.(gauche)) < 0 then
	gauche
      else begin
	if (cmp elt t.(droite)) < 0 then
	  droite
	else
	  droite + 1
      end
    end else
      let m = (gauche + droite) / 2
      in
      if (cmp elt t.(m)) < 0 then
	rechercher_position_rec t gauche m elt
      else
	rechercher_position_rec t m droite elt
  in       
  let inserer_dichotomique t i = 
    let pos = rechercher_position_rec t 0 (i-1) t.(i)
    and aux = t.(i) 
    in
    (* décalage des valeurs *)
    for k = (i-1) downto pos do
      t.(k+1) <- t.(k);
    done;
    (* placement de la nouvelle valeur *)
    t.(pos) <- aux
  in
  let t' = Array.copy t 
  and n = Array.length t in
  for i = 1 to n - 1 do 
    inserer_dichotomique t' i
  done; 
  t' 

