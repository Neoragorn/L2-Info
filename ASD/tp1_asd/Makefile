all: test_tp1

experience.cmi: experience.mli
	ocamlc -c experience.mli
experience.cmo: experience.cmi experience.ml
	ocamlc -c experience.ml
tris.cmi : tris.mli
	ocamlc -c tris.mli
tris.cmo : tris.cmi tris.ml
	ocamlc -c tris.ml
test_tp1 : test_tp1.ml tris.cmo experience.cmo
	ocamlc -o test_tp1 tris.cmo experience.cmo test_tp1.ml

graphiques : 
	gnuplot test_tp1.gp

clean:
	rm *.cmi *.cmo test_tp1 *~
