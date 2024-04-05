main: mylexer.mll myparser.mly main.ml 
	ocamllex mylexer.mll       # generates mylexer.ml
	ocamlyacc myparser.mly     # generates myparser.ml and myparser.mli
	ocamlc -c myparser.mli
	ocamlc -c mylexer.ml
	ocamlc -c myparser.ml
	ocamlc -c main.ml
	ocamlc -o main mylexer.cmo myparser.cmo main.cmo
r:
	./main
c:
	rm -f *.mli *.cmo *.mli *.cmi mylexer.ml myparser.ml main
