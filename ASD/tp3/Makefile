all: testtpiterateurs

listeit.cmi : listeit.mli
	ocamlc -c listeit.mli
listeit.cmo : listeit.ml listeit.cmi
	ocamlc -c listeit.ml
testtpiterateurs: testtpiterateurs.ml listeit.cmo
	ocamlc -o testtpiterateurs listeit.cmo testtpiterateurs.ml
clean:
	rm *.cmi *.cmo testtpiterateurs
