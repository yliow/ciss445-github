{
  open Myparser        (* token type: see myparser.mli *)
  exception Eof
}
rule mylexer = parse
    [' ' '\t']      { mylexer lexbuf }     (* skip blanks *)
  | ['\n']          { EOL }
  | ['0'-'9']+ as s { INT(int_of_string s) }
  | '+'             { PLUS }
  | '-'             { MINUS }
  | '*'             { MULT }
  | '/'             { DIV }
  | '('             { LPAREN }
  | ')'             { RPAREN }
  | eof             { raise Eof }
{
}
