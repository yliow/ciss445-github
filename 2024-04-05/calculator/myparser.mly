%{
    (* myparser.mly *)
%}
%token <int> INT
%token PLUS MINUS MULT DIV
%token LPAREN RPAREN
%token EOL
%left PLUS MINUS        /* lowest precedence */
%left MULT DIV          /* medium precedence */
%nonassoc UMINUS        /* highest precedence */
%start myparser         /* the entry point */
%type <int> myparser
%%
myparser:
    expr EOL                { Printf.printf "EOL\n"; $1 }
;
expr:
    INT                     { Printf.printf "INT %d\n" $1; $1 }
  | LPAREN expr RPAREN      { Printf.printf "LPAREN %d RPAREN\n" $2;
                              $2 }
  | expr PLUS expr          { $1 + $3 }
  | expr MINUS expr         { $1 - $3 }
  | expr MULT expr          { $1 * $3 }
  | expr DIV expr           { $1 / $3 }
  | MINUS expr %prec UMINUS { - $2 }
;
