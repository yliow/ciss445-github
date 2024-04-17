(*
    https://v2.ocaml.org/releases/4.04/htmlman/libref/Big_int.html
*)

#load "nums.cma" ;;
let s = Big_int.big_int_of_int 2;;
let t = Big_int.big_int_of_int 1000;;
let u = Big_int.big_int_of_string "123123123123123123123123123";;
Printf.printf "s     = %s\n" (Big_int.string_of_big_int s);;
Printf.printf "t     = %s\n" (Big_int.string_of_big_int t);;
Printf.printf "u     = %s\n" (Big_int.string_of_big_int u);;
Printf.printf "s + t = %s\n" (Big_int.string_of_big_int (Big_int.add_big_int s t));;
Printf.printf "s - t = %s\n" (Big_int.string_of_big_int (Big_int.sub_big_int s t));;
Printf.printf "s * t = %s\n" (Big_int.string_of_big_int (Big_int.mult_big_int s t));;
Printf.printf "s / t = %s\n" (Big_int.string_of_big_int (Big_int.div_big_int s t));;
Printf.printf "s %% t = %s\n" (Big_int.string_of_big_int (Big_int.mod_big_int s t));;
Printf.printf "s ** t = %s\n" (Big_int.string_of_big_int (Big_int.power_big_int_positive_big_int s t));;
Printf.printf "s == t = %b\n" (Big_int.eq_big_int s t);;
Printf.printf "s < t = %b\n" (Big_int.lt_big_int s t);;
Printf.printf "s <= t = %b\n" (Big_int.le_big_int s t);;
Printf.printf "s > t = %b\n" (Big_int.gt_big_int s t);;
Printf.printf "s >= t = %b\n" (Big_int.ge_big_int s t);;
