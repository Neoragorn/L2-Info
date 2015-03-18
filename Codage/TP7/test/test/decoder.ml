open Decodage_prefixe

let arg_1 =  Sys.argv.(1)
let arg_2 = Sys.argv.(2)
;;

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
	and f_out = open_out "un_code_tab"
    and test = (ref "")
    and code_array = Array.make 256 "" in
    	while (!i <> 256) do
    		test := (Codage.code !i Un_codage.un_codage);
    		code_array.(!i) <- !test;
			output_string f_out code_array.(!i);
    		i := !i + 1;                                            
	    done;                                                           
close_out f_out;
code_array
;;

let a3 = Arbre_codage.creer alph_codage un_code
;;

decoder_fichier arg_1 a3 arg_2
;;