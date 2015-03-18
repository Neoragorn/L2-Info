let entree = open_in source
and sortie = open_out cible in
try
while true do
let n = ref (input_byte entree) in
if !n < 160 then
output_byte sortie !n
else
begin 
let ni = !n lsr(6)
and nx = ((!n lsr(6)) lsl(6)) in
Printf.printf "ni %d and nx : %d\n" ni nx;
let first_octet = ni + (ni lsl(6))
and second_octet = (!n - nx) lor 128 in
Printf.printf "first %d and second : %d\n" first_octet second_octet;
output_byte sortie first_octet;
output_byte sortie second_octet
end
done;
with
End_of_file ->
close_in entree ;
close_out sortie ;;

let convertir_utf entree sortie =
let inf = open_in entree
and outf = open_out sortie in
try
while true do
let n = ref (input_byte inf) in
if !n < 160 then
output_byte outf !n
else
begin
let nx = (!n lsr 6) lsl 6
and n = ref (input_byte inf) in
let ni = !n - 128 in
output_byte outf (ni + nx)
end
done;
with
End_of_file ->
close_in inf;
close_out outf;;