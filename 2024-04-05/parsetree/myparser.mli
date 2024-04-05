type token =
  | Id_tok of (string)
  | Lparen_tok
  | Rparen_tok
  | Mult_tok
  | Div_tok
  | Plus_tok
  | Minus_tok
  | EOL

val myparser :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> expr
