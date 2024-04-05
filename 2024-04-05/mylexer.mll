{
}

let numeric = ['0' - '9']
let letter = ['a' - 'z' 'A' - 'Z']
rule mylexer = parse
| "+" {Plus_tok}
| "-" {Minus_tok}
| "*" {Mult_tok}
| "/" {Div_tok}
| "(" {Lparen_tok}
| ")" {Rparen_tok}
| letter (letter | numeric | "_")* as id {Id_tok id}
| [' ' '\t' '\n'] {mylexer lexbuf}
| eof {EOL}
