open Bloomfilter

let nb_hash_functions = 8

let random_tab = Array.make (128 * nb_hash_functions) 0

let init_random_tab () =
  Random.self_init ();
  for i = 0 to 127 do
    for j = 0 to nb_hash_functions - 1 do
      random_tab.(j*128+i) <- (Random.int 32000)
    done;
  done

  let code_of_string str n =
  let somme = ref 0 in
  for i = 0 to (String.length str - 1) do
  somme := !somme + (random_tab.(n*128 + int_of_char(str.[i])));
  done;
  !somme
  
let random_word () =
  let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
  and length = 4 + Random.int (4)
  in
  let str = String.create length
  in
  for i = 0 to length - 1 do
    str.[i] <- letters.[(Random.int 51)]
  done;
  str

let check_word tab u =
  let n = Array.length tab
  and check = ref false in
  for i = 0 to n - 1 do
  let c = (tab.(i) = u) in
(*  Printf.printf "word => %s alea_word => %s\n" tab.(i) u;
  Printf.printf "compare => %b\n" n; *)
    if (c == true) then
    check := true; 
  done;
!check

let _ = 
  init_random_tab ();
  let tab_word = Array.make (int_of_float(2.**10.)) "" in
  for i = 0 to 1023 do
    let word = random_word() in
    tab_word.(i) <- word;
  done;
  for n = 1 to 8 do
    for t = 10 to 20 do
      let cpt_test = ref 0 and cpt_faux_p = ref 0 and bf = new_bloomfilter t code_of_string n in
        for i = 0 to 1023 do
        add bf tab_word.(i);
        done;
      for k = 1 to (1 lsl 14) do
        let u = random_word() in
        if ((check_word tab_word u) == false) then
          begin
            cpt_test := !cpt_test + 1;
            if (contains bf u) then
            cpt_faux_p := !cpt_faux_p + 1;
          end
      done;
      Printf.printf "%d %d %d %5d %6f\n" t n !cpt_test !cpt_faux_p ((float_of_int (!cpt_faux_p))/.(float_of_int (!cpt_test)));
  done;
  Printf.printf "\n\n";
  done

 (* let bf = new_bloomfilter 2 code_of_string 8
  and s = random_word ()
  in
  add bf "timoleon";
  Printf.printf "timoleon est present : %b\n" (contains bf "timoleon");
  Printf.printf "%s est present : %b\n" s (contains bf s) *)