let rec main parser lexer lexbuf = 
  try
    let _ = Printf.printf ">>> %!" in
    let result = parser lexer lexbuf in
    let _ = Printf.printf "result: %d\n%!" result in
    main parser lexer lexbuf
  with
    Mylexer.Eof -> print_string "bye\n"

let _ =
  let _ = Printf.printf "calculator 0.1\nctrl-d to end\n%!" in
  main Myparser.myparser Mylexer.mylexer (Lexing.from_channel stdin)
