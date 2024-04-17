type token =
  | Id_tok of (string)
  | Lparen_tok
  | Rparen_tok
  | Mult_tok
  | Div_tok
  | Plus_tok
  | Minus_tok
  | EOL

open Parsing;;
let _ = parse_error;;
# 1 "myparser.mly"
 open Expr
# 16 "myparser.ml"
let yytransl_const = [|
  258 (* Lparen_tok *);
  259 (* Rparen_tok *);
  260 (* Mult_tok *);
  261 (* Div_tok *);
  262 (* Plus_tok *);
  263 (* Minus_tok *);
  264 (* EOL *);
    0|]

let yytransl_block = [|
  257 (* Id_tok *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\003\000\003\000\003\000\004\000\
\004\000\000\000"

let yylen = "\002\000\
\002\000\001\000\003\000\003\000\001\000\003\000\003\000\001\000\
\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\008\000\000\000\010\000\000\000\000\000\000\000\
\000\000\001\000\000\000\000\000\000\000\000\000\009\000\003\000\
\004\000\006\000\007\000"

let yydgoto = "\002\000\
\005\000\006\000\007\000\008\000"

let yysindex = "\016\000\
\001\255\000\000\000\000\001\255\000\000\010\255\004\255\008\255\
\016\255\000\000\001\255\001\255\001\255\001\255\000\000\000\000\
\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\006\255\254\254\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\252\255\002\000\000\000"

let yytablesize = 19
let yytable = "\009\000\
\005\000\003\000\004\000\005\000\005\000\005\000\016\000\017\000\
\002\000\011\000\012\000\013\000\014\000\002\000\018\000\019\000\
\001\000\010\000\015\000"

let yycheck = "\004\000\
\003\001\001\001\002\001\006\001\007\001\008\001\011\000\012\000\
\003\001\006\001\007\001\004\001\005\001\008\001\013\000\014\000\
\001\000\008\001\003\001"

let yynames_const = "\
  Lparen_tok\000\
  Rparen_tok\000\
  Mult_tok\000\
  Div_tok\000\
  Plus_tok\000\
  Minus_tok\000\
  EOL\000\
  "

let yynames_block = "\
  Id_tok\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 12 "myparser.mly"
                             ( _1 )
# 92 "myparser.ml"
               : expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'term) in
    Obj.repr(
# 14 "myparser.mly"
                             ( _1 )
# 99 "myparser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'term) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 15 "myparser.mly"
                             ( Plus(_1, _3)  )
# 107 "myparser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'term) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 16 "myparser.mly"
                             ( Minus(_1, _3) )
# 115 "myparser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'factor) in
    Obj.repr(
# 18 "myparser.mly"
                             ( _1 )
# 122 "myparser.ml"
               : 'term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'factor) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'term) in
    Obj.repr(
# 19 "myparser.mly"
                             ( Mult(_1, _3) )
# 130 "myparser.ml"
               : 'term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'factor) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'term) in
    Obj.repr(
# 20 "myparser.mly"
                             ( Div(_1, _3)  )
# 138 "myparser.ml"
               : 'term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 22 "myparser.mly"
                             ( Id _1 )
# 145 "myparser.ml"
               : 'factor))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 23 "myparser.mly"
                             ( _2 )
# 152 "myparser.ml"
               : 'factor))
(* Entry myparser *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let myparser (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : expr)
