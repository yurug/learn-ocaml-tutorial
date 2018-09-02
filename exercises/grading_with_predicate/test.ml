open Test_lib
open Report

let sample_unit () = ()

let p x = if x >= 0 && x < 10 then true else false

(* This test does not check that the function generates integers
   randomly but checks that they are in the right range. *)
let exercise_1 =
  grade_function_1_against_solution
    [%ty: unit -> int] "rand_int"
    ~gen:10
    ~test:(test_eq_ok (fun x _ -> p x))
    []

let p_list l =
  (* Check all elements of the input list are in the right range*)
  let t = List.fold_left (fun a x -> a && p x) true l in
  if t then
    (* Check that there is at least two different elements *)
    let l = List.sort_uniq (Pervasives.compare) l in
    if List.length l > 1 then true else false
  else false

let exercise_2 =
  grade_function_1_against_solution
    [%ty: int -> int list] "rand_list"
    ~gen:0
    ~test:(test_eq_ok (fun x _ -> p_list x))
    [10 ; 20]

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_1 ; exercise_1bis ; exercise_2]
