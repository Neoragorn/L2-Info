type marqueur = string

(**
   [indices_melanges n] : retourne un tableau des entiers de 0 à n-1 melanges
*)
let indices_melanges n =
  let f i = i
  in
  let t = Array.init n f
  in
  for i = 0 to n-1 do 
    let j = (Random.int n)
    in
    let aux = t.(i) 
    in
    t.(i) <- t.(j);
    t.(j) <- aux
  done;
  t

let f i j =
  let s = String.make i ' '
  in
  let x = ref j
  in
  for k = 0 to i-1 do
    s.[k] <- char_of_int (!x mod 26 + 65);
    x := !x / 26
  done;
  s ^ (string_of_int !x)

let g t i =
    t.(i)

let gg t ind i =
  t.(ind.(i)) 

let marqueurs p =
  if p <= 0 then
    failwith "le nombre de marqueurs doit être positif";

  let i = ref 0
  and x = ref p
  and y = ref 1
  in
  while !x > 1 do    
    x := !x / 26;
    i := !i + 1;
  done;

  for j = 0 to !i do
    y := !y * 26;
  done;

  let t = Array.init !y (f !i)
  in
  let r = Array.init p (g t)
  and i = indices_melanges p
  in
  let rr = Array.init p (gg r i)  
  in
  rr



let h m ind i =
  m.(ind.(i))

let experience n m =
  let p = Array.length m
  in

  if n > p then
    failwith "le nombre de marqueurs positifs doit être inférieur au nombre de marqueurs disponibles";

  let i = indices_melanges p
  in
  Array.init n (h m i);
;;
    

marqueurs 51;;
  
experience 16 (marqueurs 1000);;

let cmp m1 m2 =
  String.compare m1 m2

let _ =
  Random.self_init ()
