all: testtp4

bloomfilter.cmi : bloomfilter.mli
	ocamlc -c bloomfilter.mli
bloomfilter.cmo : bloomfilter.ml bloomfilter.cmi
	ocamlc -c bloomfilter.ml
testtp4: testtp4.ml bloomfilter.cmo
	ocamlc -o testtp4 bloomfilter.cmo testtp4.ml
