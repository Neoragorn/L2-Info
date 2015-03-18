(**
   Décodage d'un fichier codé à l'aide d'un codage binaire préfixe.

   Nécessite le module Arbre_codage.
   
   @author FIL - IEEA - Univ. Lille1
*)

(** Exception déclenchée par [decoder] en cas de fichier mal codé *)
exception Decodage_impossible


(**
   [enfiler_huit_bits entree file] enfile les huit bits 
   du prochain octet lu depuis [entree] dans la [file].

   {b CU :} le canal [entree] doit être ouvert, et un octet
   doit pouvoir être lu.
*)
let enfiler_huit_bits entree file =
  let n = input_byte entree in
  for k = 7 downto 0 do
    Queue.add ((n lsr k) land 1) file
  done 

(**
   [supprimer_bourrage file_bits] = chaîne binaire contenant les bits
   de [file_bits] sauf le bourrage.

   {b CU :} [file_bits] doit contenir au moins un bit à 1.
*)
let supprimer_bourrage file_bits =
  let n = Queue.length file_bits in
  let s = String.make n '0' in
  for i = 0 to n - 1 do
    let bit = Queue.take file_bits in
    s.[i] <- if bit = 0 then '0' else '1'
  done ;
  let k = ref (n - 1) in
  while s.[!k] = '0' do
    decr k
  done ;
  String.sub s 0 !k
 
(**
   [decoder_fichier source arbre cible] 
   décode le fichier [source] avec l'[arbre] du codage 
   dans le fichier [cible].

   {b CU :} le fichier [source] doit avoir été codé 
   avec un codage binaire préfixe décrit par [arbre].
   En particulier ce fichier ne peut pas être vide.
*)
let decoder_fichier source arbre cible =
  let entree = open_in source
  and sortie = open_out cible 
  and file_bits = Queue.create () in
  let rec decoder_bits a file_bits =
  if Queue.length file_bits = 8 then (* un octet a été entièrement décodé *)
    try
      enfiler_huit_bits entree file_bits ;
      decoder_bits a file_bits
    with
    | End_of_file -> 
      (* arrivé au bout du fichier source *)
      close_in entree ;
      terminer a (supprimer_bourrage file_bits) 
  else 
    if Arbre_codage.est_vide a then begin (* Situation anormale *)
      close_in entree ;
      close_out sortie ;
      raise Decodage_impossible
    end else if Arbre_codage.racine_codante a then begin
      (* La racine de a code un symbole. 
	 Il faut l'écrire dans le fichier sortie *)
      output_byte sortie (Arbre_codage.racine_symbole a) ;
      (* et poursuivre le décodage avec l'arbre entier *)
      decoder_bits arbre file_bits
    end else 
	let bit = Queue.take file_bits  in
	if bit = 0 then
	  decoder_bits (Arbre_codage.gauche a) file_bits
	else 
	  decoder_bits (Arbre_codage.droit a) file_bits
  and terminer a derniers_bits = 
    if Arbre_codage.est_vide a then begin
      close_out sortie ;
      raise Decodage_impossible
    end else 
      let n = String.length derniers_bits in
      if n = 0 && Arbre_codage.racine_codante a then begin
	output_byte sortie (Arbre_codage.racine_symbole a) ;
	close_out sortie
      end else if n = 0 then begin
	close_out sortie ;
	raise Decodage_impossible
      end else if Arbre_codage.racine_codante a then begin
	output_byte sortie (Arbre_codage.racine_symbole a) ;
	terminer arbre derniers_bits
      end else 
	  terminer 
	    (if derniers_bits.[0] = '0' then
		Arbre_codage.gauche a
	     else
		Arbre_codage.droit a)
	  (String.sub derniers_bits 1 (n - 1)) in
  (try
     enfiler_huit_bits entree file_bits
  with
  | End_of_file -> 
    close_in entree ;
    close_out sortie ;
    raise Decodage_impossible) ;
  (try
     enfiler_huit_bits entree file_bits ;
     decoder_bits arbre file_bits
   with
   | End_of_file -> 
     close_in entree ;
     terminer arbre (supprimer_bourrage file_bits)
  )



  	    

