%{ open Expr
%}
%token <string> Id_tok
%token Lparen_tok Rparen_tok
%token Mult_tok Div_tok
%token Plus_tok Minus_tok
%token EOL
%start myparser
%type <expr> myparser
%%
myparser:
| expr EOL                   { $1 }
expr:                        
  term                       { $1 }
| term Plus_tok expr         { Plus($1, $3)  }
| term Minus_tok expr        { Minus($1, $3) }
term:
  factor                     { $1 }
| factor Mult_tok term       { Mult($1, $3) }
| factor Div_tok term        { Div($1, $3)  }
factor:
  Id_tok                     { Id $1 }
| Lparen_tok expr Rparen_tok { $2 }
