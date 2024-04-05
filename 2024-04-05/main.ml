#use "expr.ml";;
#use "myparser.ml";;
#use "mylexer.ml";;
open Expr;;

let test s =
  let lexbuf = Lexing.from_string(s^"\n") in
  myparser mylexer lexbuf;;

test "a + b";;
(* - : expr = Plus(Id "a",Id "b")*)
